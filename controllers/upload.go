package controllers

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"path"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/dbase"
	"github.com/liumingmin/decoratecloud/models"
)

func RegisterUploadRouter(router *gin.Engine) {
	router.POST("/uploadImages", UploadImages)
	router.POST("/listDocs", ListDocs)
}

func UploadImages(c *gin.Context) {
	var countStr = c.DefaultPostForm("Count", "")
	var projectId = c.DefaultPostForm("ProjectId", "")
	if countStr == "" {
		h := gin.H{}
		c.JSON(http.StatusOK, h)
		return
	}

	if projectId == "" {
		projectId = "globe"
	}

	var count, err = strconv.Atoi(countStr)
	if err != nil {
		return
	}

	attchments := make([]*models.Attachment, 0)

	var i int
	for i = 0; i < count; i++ {
		var n = strconv.Itoa(i)

		var itemId = c.DefaultPostForm("ItemId"+n, "")
		var ownerId = c.DefaultPostForm("OwnerId"+n, "")
		var fileName = c.DefaultPostForm("FileName"+n, "")

		var srvDir = path.Join(common.GetImagesPathConf(), projectId, ownerId) //common.GetCurrPath() + common.KSrvImagesDir+ "/" +projectId+"/"+ ownerId + "/"

		var err = os.MkdirAll(srvDir, os.FileMode(0755))

		if err == nil {
			var srvFile = srvDir + "/" + itemId + ".jpg" //+ "/" + fileName
			file, err := c.FormFile("File" + n)

			if err != nil {
				fmt.Println(err.Error())
			}

			c.SaveUploadedFile(file, srvFile)
		} else {
			h := gin.H{
				common.RespCode: -1,
				common.RespMsg:  err.Error(),
			}
			c.JSON(http.StatusOK, h)
			return
		}

		attchment := &models.Attachment{}
		attchment.Id = common.NewGuid()
		attchment.OwnerId = ownerId
		attchment.FileId = itemId
		attchment.FileName = fileName
		attchment.ProjectId = projectId

		attchments = append(attchments, attchment)
	}

	var ormer = dbase.NewOrm()
	ormer.InsertMulti(common.KBatchPostCount, &attchments)

	h := gin.H{
		common.RespCode: 0,
		common.RespMsg:  "操作成功",
	}
	c.JSON(http.StatusOK, h)
}

type DocFileInfo struct {
	Kind         int //1目录 2文件
	RelativePath string
	Name         string
	Size         float64
}

func ListDocs(c *gin.Context) {
	var projectId = c.DefaultPostForm("ProjectId", "")
	var relativePath = c.DefaultPostForm("RelativePath", "")

	//var srvDocDir = common.GetCurrPath() + common.KSrvDocsDir  + "/" +projectId
	var srvDocDir = path.Join(common.GetDocsPathConf(), projectId)

	var parentRelativePath string = ""
	if relativePath != "" {
		srvDocDir = srvDocDir + relativePath
		parentRelativePath = common.GetParentDirectory(relativePath)
	}

	folders := make([]*DocFileInfo, 0, 10)
	docs := make([]*DocFileInfo, 0, 10)

	fileInfos, err := ioutil.ReadDir(srvDocDir)
	if err != nil {
		return
	}

	for _, fi := range fileInfos {
		var kind int = 0

		var fileRelativePath string = relativePath
		if fileRelativePath == "" {
			fileRelativePath = "/"
		}

		if fi.IsDir() {
			kind = 1
			fileRelativePath += fi.Name() + "/"
		} else {
			kind = 2
		}

		docinfo := &DocFileInfo{kind, fileRelativePath, fi.Name(), float64(fi.Size())}

		if fi.IsDir() {
			folders = append(folders, docinfo)
		} else {
			docs = append(docs, docinfo)
		}
	}

	folders = append(folders, docs...)

	result := make(map[string]interface{})
	result["list"] = folders
	result["ppath"] = parentRelativePath
	result["path"] = relativePath

	var content = ""
	if ret, err := json.Marshal(result); err == nil {
		content = string(ret)
	}

	fmt.Println(content)

	c.JSON(http.StatusOK, gin.H{
		common.RespCode:    0,
		common.RespMsg:     "",
		common.RespContent: content,
	})
}
