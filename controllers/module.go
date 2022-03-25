package controllers

import (
	"net/http"

	"github.com/astaxie/beego/orm"
	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/dbase"
	"github.com/liumingmin/decoratecloud/models"
)

func RegisterModuleRouter(router *gin.Engine) {

	router.GET("/admin/module/list", moduleList)
	router.GET("/admin/module/tree", moduleTree)
	router.GET("/admin/module/create", moduleCreate)
	router.GET("/admin/module/edit", moduleEdit)
	router.GET("/admin/module/view", moduleView)

	router.POST("/admin/module/add", moduleAdd)
	router.POST("/admin/module/update", moduleUpdate)
	router.POST("/admin/module/delete", moduleDelete)
}

var moduleQueryId string = "query_0060"

func moduleList(c *gin.Context) {
	h := gin.H{}

	c.HTML(http.StatusOK, "admin/modulelist", h)
}

func moduleTree(c *gin.Context) {
	paramMap := make(map[string]string)
	_, entites := QueryLayuiCustom(moduleQueryId, paramMap)

	params := entites.([]orm.Params)
	treeRoots := common.ConvertToTree(&params)
	c.JSON(http.StatusOK, treeRoots)
}

func moduleCreate(c *gin.Context) {
	h := gin.H{}

	pid := c.DefaultQuery("Pid", "")

	h2 := gin.H{}
	h2["Pid"] = pid

	if pid != "" && pid != common.TreeRootId {
		var module = models.SysModule{}
		module.Id = pid
		ormer := dbase.NewOrm()
		ormer.Read(&module)

		h2["PName"] = module.Name
	}

	h["data"] = h2

	h[common.PageRespCreate] = true

	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "admin/modulecrud", h)
}

func moduleAdd(c *gin.Context) {
	var module models.SysModule

	var err error

	if err = c.ShouldBind(&module); err == nil {
		module.Id = common.NewGuid()

		ormer := dbase.NewOrm()
		_, err = ormer.Insert(&module)
	}

	dbase.MemCacheDeleteMulti2("SysModule")

	h := gin.H{}

	h2 := gin.H{}
	h2["Pid"] = module.Pid
	if module.Pid != "" && module.Pid != common.TreeRootId {
		var module2 = models.SysModule{}
		module2.Id = module.Pid
		ormer := dbase.NewOrm()
		ormer.Read(&module2)

		h2["PName"] = module2.Name
	}

	h[common.PageRespCreate] = true
	common.SetCRUDStruct(h, err, "创建", module, false)

	h["data"] = h2

	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "admin/modulecrud", h)
}

func moduleEdit(c *gin.Context) {
	h := gin.H{}
	var module = models.SysModule{}

	module.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	ormer.Read(&module)

	h[common.PageRespEdit] = true
	common.SetPageToken(c, h)
	h["data"] = module
	c.HTML(http.StatusOK, "admin/modulecrud", h)
}

func moduleUpdate(c *gin.Context) {
	var module models.SysModule

	var err error

	if err = c.ShouldBind(&module); err == nil {
		ormer := dbase.NewOrm()
		_, err = ormer.Update(&module)
	}

	dbase.MemCacheDeleteMulti2("SysModule")

	h := gin.H{}
	h[common.PageRespEdit] = true
	common.SetPageToken(c, h)
	common.SetCRUDStruct(h, err, "修改", module, true)

	c.HTML(http.StatusOK, "admin/modulecrud", h)
}

func moduleView(c *gin.Context) {
	h := gin.H{}
	var module = models.SysModule{}

	module.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	ormer.Read(&module)

	h[common.PageRespInputTag] = "readonly"
	h[common.PageRespContent] = module
	c.HTML(http.StatusOK, "admin/modulecrud", h)
}

func moduleDelete(c *gin.Context) {
	var module = models.SysModule{}

	module.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	_, err := ormer.Delete(&module)

	dbase.MemCacheDeleteMulti2("SysModule")

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
