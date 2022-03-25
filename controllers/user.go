package controllers

import (
	"errors"
	"net/http"
	"strings"

	"github.com/gin-gonic/contrib/sessions"
	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/dbase"
	"github.com/liumingmin/decoratecloud/models"
)

func RegisterUserRouter(router *gin.Engine) {

	router.GET("/admin/user/list", userList)
	router.GET("/admin/user/create", userCreate)
	router.GET("/admin/user/edit", userEdit)
	router.GET("/admin/user/view", userView)

	router.POST("/admin/user/add", userAdd)
	router.POST("/admin/user/update", userUpdate)
	router.POST("/admin/user/delete", userDelete)

	router.GET("/admin/user/selfedit", userSelfEdit)
	router.POST("/admin/user/selfupdate", userSelfUpdate)

	router.GET("/admin/user/editpwd", userEditPwd)
	router.POST("/admin/user/modifypwd", userModifyPwd)

	router.GET("/admin/user/simpleinfo", userSimpleInfo)
}

var userQueryId string = "query_0002"

func userList(c *gin.Context) {
	h := gin.H{}

	h["queryId"] = userQueryId
	c.HTML(http.StatusOK, "admin/userlist", h)
}

func userCreate(c *gin.Context) {
	h := gin.H{}

	h[common.PageRespCreate] = true
	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "admin/usercrud", h)
}

func userAdd(c *gin.Context) {
	var user models.SysUser

	var err error

	if err = c.ShouldBind(&user); err == nil {
		user.Id = common.NewGuid()

		ormer := dbase.NewOrm()
		_, err = ormer.Insert(&user)
	}

	dbase.MemCacheDeleteMulti2("SysUser")

	h := gin.H{}
	h[common.PageRespCreate] = true
	common.SetPageToken(c, h)
	common.SetCRUDStruct(h, err, "注册", user, false)

	c.HTML(http.StatusOK, "admin/usercrud", h)
}

func userEdit(c *gin.Context) {
	h := gin.H{}
	var user = models.SysUser{}

	user.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	ormer.Read(&user)

	h[common.PageRespEdit] = true
	h[common.PageRespContent] = user
	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "admin/usercrud", h)
}

func userSelfEdit(c *gin.Context) {
	h := gin.H{}
	var user = models.SysUser{}

	session := sessions.Default(c)
	userId := session.Get(common.UserId)

	if userId != nil {
		user.Id = userId.(string)

		ormer := dbase.NewOrm()
		ormer.Read(&user)
		//h[common.PageRespEdit] = true
	} else {
		c.Redirect(302, "/login")
		return
	}

	var clientType = c.DefaultQuery(common.ClientType, "")
	if clientType == common.ClientTypeMobile {
		session.Set(common.ClientType, common.ClientTypeMobile)
		session.Save()
		h[common.ClientTypeMobile] = true
	} else {
		clientTypeObj := session.Get(common.ClientType)
		if clientTypeObj != nil && clientTypeObj.(string) == common.ClientTypeMobile {
			h[common.ClientTypeMobile] = true
		}
	}

	paramMap := make(map[string]string)
	paramMap["UserId"] = userId.(string)
	err, entities := QueryLayuiCustom("query_0004", paramMap)
	if err == nil {
		h["userTags"] = entities
	}

	h["serverHost"] = c.Request.Host
	h[common.PageRespContent] = user
	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "admin/userinfo", h)
}

func userUpdate(c *gin.Context) {
	var user models.SysUser

	var err error

	if err = c.ShouldBind(&user); err == nil {
		ormer := dbase.NewOrm()
		_, err = ormer.Update(&user)
	}

	dbase.MemCacheDeleteMulti2("SysUser")

	h := gin.H{}
	h[common.PageRespEdit] = true
	common.SetPageToken(c, h)
	common.SetCRUDStruct(h, err, "修改", user, true)

	c.HTML(http.StatusOK, "admin/usercrud", h)
}

func userSelfUpdate(c *gin.Context) {
	var err error

	ormer := dbase.NewOrm()

	var user = models.SysUser{}
	user.Id = c.DefaultPostForm("Id", "")
	ormer.Read(&user)

	pictureId := c.DefaultPostForm("PictureId", "")
	if pictureId != "" {
		user.PictureId = pictureId
	} else {
		file, err := c.FormFile("FileUrl")
		if err == nil {
			fileId := common.SaveImage(c, file, user.Id)
			user.PictureId = fileId
		}
	}

	user.RealName = c.DefaultPostForm("RealName", "")
	user.Phone = c.DefaultPostForm("Phone", "")
	user.Email = c.DefaultPostForm("Email", "")

	_, err = ormer.Update(&user)

	avatarurl := common.GetUserImgUrl(user.Id, user.PictureId)
	if result, tokenError := gRongcloud.User.Refresh(user.Id, user.RealName, avatarurl); tokenError != nil || result == nil {

	} else {

	}

	dbase.MemCacheDeleteMulti2("SysUser")

	h := gin.H{}
	//h[common.PageRespEdit] = true
	common.SetPageToken(c, h)
	common.SetCRUDStruct(h, err, "修改", user, true)

	c.HTML(http.StatusOK, "admin/userinfo", h)
}

func userEditPwd(c *gin.Context) {
	h := gin.H{}

	session := sessions.Default(c)
	userId := session.Get(common.UserId)

	if userId == nil {
		//h["isok"] = false
		//h["msg"] = "用户未登录!"

		c.Redirect(302, "/login")
		return
	}

	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "admin/modifypwd", h)
}

func userModifyPwd(c *gin.Context) {
	h := gin.H{}
	var err error

	session := sessions.Default(c)
	userId := session.Get(common.UserId)

	if userId == nil {
		//h["isok"] = false
		//h["msg"] = "用户未登录!"
		c.Redirect(302, "/login")
		return
	}

	ormer := dbase.NewOrm()

	var user = models.SysUser{}
	user.Id = userId.(string)
	ormer.Read(&user)

	oldPass := c.DefaultPostForm("oldPassword", "")
	newPass := c.DefaultPostForm("password", "")

	if user.Password == common.Sha256HashEncrypt(oldPass, strings.ToLower(user.UserName)) || user.Password == oldPass {
		user.Password = common.Sha256HashEncrypt(newPass, strings.ToLower(user.UserName))

		ormer.Update(&user)
	} else {
		err = errors.New("原密码错误")
	}

	//h[common.PageRespEdit] = true
	common.SetPageToken(c, h)
	common.SetCRUDStruct(h, err, "修改", models.SysUser{}, true)

	c.HTML(http.StatusOK, "admin/modifypwd", h)
}

func userView(c *gin.Context) {
	h := gin.H{}
	var user = models.SysUser{}

	user.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	ormer.Read(&user)

	h[common.PageRespInputTag] = "readonly"
	h[common.PageRespContent] = user
	c.HTML(http.StatusOK, "admin/usercrud", h)
}

func userDelete(c *gin.Context) {
	var user = models.SysUser{}

	user.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	_, err := ormer.Delete(&user)

	dbase.MemCacheDeleteMulti2("SysUser")

	if err == nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 0,
			common.RespMsg:  "操作成功",
		})
	} else {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 2,
			common.RespMsg:  err.Error(),
		})
	}
}

func userSimpleInfo(c *gin.Context) {
	session := sessions.Default(c)
	userId := session.Get(common.UserId)

	if userId != nil {
		ormer := dbase.NewOrm()

		var user = models.SysUser{}
		user.Id = userId.(string)
		ormer.Read(&user)

		user.Password = ""

		c.JSON(http.StatusOK, gin.H{
			common.RespCode:    0,
			common.RespMsg:     "操作成功",
			common.RespContent: user,
		})
	} else {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 2,
			common.RespMsg:  "",
		})
	}

}
