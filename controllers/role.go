package controllers

import (
	"net/http"

	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/dbase"
	"github.com/liumingmin/decoratecloud/models"

	"github.com/gin-gonic/gin"
)

func RegisterRoleRouter(router *gin.Engine) {

	router.GET("/admin/role/list", roleList)
	router.GET("/admin/role/create", roleCreate)
	router.GET("/admin/role/edit", roleEdit)
	router.GET("/admin/role/view", roleView)

	router.POST("/admin/role/add", roleAdd)
	router.POST("/admin/role/update", roleUpdate)
	router.POST("/admin/role/delete", roleDelete)

	router.GET("/admin/role/togrant", roleToGrantModule)
}

var roleQueryId string = "query_0003"

func roleList(c *gin.Context) {
	h := gin.H{}

	h["queryId"] = roleQueryId
	c.HTML(http.StatusOK, "admin/rolelist", h)
}

func roleCreate(c *gin.Context) {
	h := gin.H{}

	h[common.PageRespCreate] = true

	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "admin/rolecrud", h)
}

func roleAdd(c *gin.Context) {
	var role models.SysRole

	var err error

	if err = c.ShouldBind(&role); err == nil {
		role.Id = common.NewGuid()

		dbase.CreateRole(&role)
	}

	dbase.MemCacheDeleteMulti2("SysRole")

	h := gin.H{}
	h[common.PageRespCreate] = true
	common.SetCRUDStruct(h, err, "创建", role, false)

	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "admin/rolecrud", h)
}

func roleEdit(c *gin.Context) {
	h := gin.H{}
	var role = models.SysRole{}

	role.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	ormer.Read(&role)

	h[common.PageRespEdit] = true
	common.SetPageToken(c, h)
	h["data"] = role
	c.HTML(http.StatusOK, "admin/rolecrud", h)
}

func roleUpdate(c *gin.Context) {
	var role models.SysRole

	var err error

	if err = c.ShouldBind(&role); err == nil {
		dbase.EditRole(&role)
	}

	dbase.MemCacheDeleteMulti2("SysRole")

	h := gin.H{}
	h[common.PageRespEdit] = true
	common.SetPageToken(c, h)
	common.SetCRUDStruct(h, err, "修改", role, true)

	c.HTML(http.StatusOK, "admin/rolecrud", h)
}

func roleView(c *gin.Context) {
	h := gin.H{}
	var role = models.SysRole{}

	role.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	ormer.Read(&role)

	h[common.PageRespInputTag] = "readonly"
	h[common.PageRespContent] = role
	c.HTML(http.StatusOK, "admin/rolecrud", h)
}

func roleDelete(c *gin.Context) {
	//var role = models.SysRole{}

	roleId := c.DefaultQuery("Id", "")

	err := dbase.DeleteRole(roleId)

	dbase.MemCacheDeleteMulti2("SysRole")

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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
func roleToGrantModule(c *gin.Context) {
	h := gin.H{}

	roleId := c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()

	var modules []*models.SysRoleModule
	ormer.QueryTable("SysRoleModule").Filter("RoleId", roleId).All(&modules)

	h[common.PageRespEdit] = true
	common.SetPageToken(c, h)
	h["data"] = modules
	c.HTML(http.StatusOK, "admin/rolemodulecurd", h)
}

func roleGrantModule(c *gin.Context) {

}
