package controllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/dbase"
	"github.com/liumingmin/decoratecloud/models"
)

func RegisterProjectRouter(router *gin.Engine) {

	router.GET("/admin/project/list", projectList)
	router.GET("/admin/project/create", projectCreate)
	router.GET("/admin/project/edit", projectEdit)
	router.GET("/admin/project/view", projectView)

	router.POST("/admin/project/add", projectAdd)
	router.POST("/admin/project/update", projectUpdate)
	router.POST("/admin/project/delete", projectDelete)
}

var projQueryId string = "query_0001"

func projectList(c *gin.Context) {
	h := gin.H{}

	h["queryId"] = projQueryId
	c.HTML(http.StatusOK, "admin/projectlist", h)
}

func projectCreate(c *gin.Context) {
	h := gin.H{}

	h[common.PageRespCreate] = true

	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "admin/projectcrud", h)
}

func projectAdd(c *gin.Context) {
	var project models.Project

	var err error

	if err = c.ShouldBind(&project); err == nil {
		project.Id = common.NewGuid()

		ormer := dbase.NewOrm()
		_, err = ormer.Insert(&project)
	}

	dbase.MemCacheDeleteMulti2("Project")

	h := gin.H{}
	h[common.PageRespCreate] = true
	common.SetCRUDStruct(h, err, "创建", project, false)

	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "admin/projectcrud", h)
}

func projectEdit(c *gin.Context) {
	h := gin.H{}
	var project = models.Project{}

	project.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	ormer.Read(&project)

	h[common.PageRespEdit] = true
	common.SetPageToken(c, h)
	h["data"] = project
	c.HTML(http.StatusOK, "admin/projectcrud", h)
}

func projectUpdate(c *gin.Context) {
	var project models.Project

	var err error

	if err = c.ShouldBind(&project); err == nil {
		ormer := dbase.NewOrm()
		_, err = ormer.Update(&project)
	}

	dbase.MemCacheDeleteMulti2("Project")

	h := gin.H{}
	h[common.PageRespEdit] = true
	common.SetPageToken(c, h)
	common.SetCRUDStruct(h, err, "修改", project, true)

	c.HTML(http.StatusOK, "admin/projectcrud", h)
}

func projectView(c *gin.Context) {
	h := gin.H{}
	var project = models.Project{}

	project.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	ormer.Read(&project)

	h[common.PageRespInputTag] = "readonly"
	h[common.PageRespContent] = project
	c.HTML(http.StatusOK, "admin/projectcrud", h)
}

func projectDelete(c *gin.Context) {
	var project = models.Project{}

	project.Id = c.DefaultQuery("Id", "")

	ormer := dbase.NewOrm()
	_, err := ormer.Delete(&project)

	dbase.MemCacheDeleteMulti2("Project")

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
