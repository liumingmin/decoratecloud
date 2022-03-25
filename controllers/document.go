package controllers

import (
	"io/ioutil"
	"net/http"
	"os"
	"path"
	"path/filepath"
	"strings"

	"github.com/astaxie/beego/orm"
	"github.com/gin-gonic/contrib/sessions"
	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
)

func RegisterDocumentRouter(router *gin.Engine) {

	router.GET("/oa/document/list", documentList)
	router.GET("/oa/document/listDrawing", drawingList)

	router.GET("/oa/document/tree", documentTree)
	router.GET("/oa/document/view", documentView)

	router.POST("/oa/document/uploadZip", documentUploadZip)
	router.POST("/oa/document/upload", documentUpload)
	router.POST("/oa/document/add", documentAdd)
	router.POST("/oa/document/update", documentUpdate)
	router.POST("/oa/document/delete", documentDelete)
}

func documentList(c *gin.Context) {
	h := gin.H{}

	session := sessions.Default(c)
	selectedProjectId := session.Get(common.ProjectId)
	if selectedProjectId != nil {
		h["SelectedProjectId"] = selectedProjectId
		h["docModule"] = "fileDoc"
	}
	c.HTML(http.StatusOK, "oa/documentlist", h)
}

func drawingList(c *gin.Context) {
	h := gin.H{}

	session := sessions.Default(c)
	selectedProjectId := session.Get(common.ProjectId)
	if selectedProjectId != nil {
		h["SelectedProjectId"] = selectedProjectId
		h["docModule"] = "drawingDoc"
	}
	c.HTML(http.StatusOK, "oa/documentlist", h)
}

func getSrvDocFsDir(c *gin.Context) string {
	projectId := GetSessionProjectId(c)

	docModule1 := c.DefaultQuery("docModule", "")
	docModule := c.DefaultPostForm("docModule", docModule1)

	if docModule == "" {
		docModule = "fileDoc"
	}

	if projectId == "" {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: -1,
			common.RespMsg:  "no projectId",
		})
		return ""
	}

	srvDocDir := common.ToFsPath(path.Join(common.GetDocsPathConf(), projectId, docModule))

	if !common.FileExist(srvDocDir) {
		os.MkdirAll(srvDocDir, 0755)
	}
	//fmt.Println(srvDocDir)
	return srvDocDir
}

func documentTree(c *gin.Context) {
	var srvDocDir = getSrvDocFsDir(c)
	if srvDocDir == "" {
		return
	}

	srvDocUrl := common.ToUrlPath(srvDocDir)

	var query = c.DefaultQuery("query", "")

	folders := make([]orm.Params, 0, 10)
	docs := make([]orm.Params, 0, 10)

	filepath.Walk(srvDocDir, func(filename string, fi os.FileInfo, err error) error { //遍历目录
		var kind int = 0
		if fi.IsDir() { // 忽略目录
			kind = 1
		} else {
			kind = 2
		}

		fileUrl := common.ToUrlPath(filename)

		var id string = ""
		var pid string = ""
		var name string = ""
		if fileUrl == srvDocUrl {
			id = common.TreeRootId
			name = "根目录"
		} else {
			id = strings.TrimPrefix(fileUrl, srvDocUrl)

			dirPath := filepath.Dir(filename)
			pid = strings.TrimPrefix(common.ToUrlPath(dirPath), srvDocUrl)
			name = fi.Name()

			if pid == "" {
				pid = common.TreeRootId
			}

		}

		docinfo := orm.Params{}
		docinfo["id"] = id
		docinfo["pid"] = pid
		docinfo["name"] = name
		docinfo["Kind"] = kind

		if fi.IsDir() {
			docinfo["Size"] = ""
		} else {
			docinfo["Size"] = common.ConvertFileSize(fi.Size())

			if query != "" {
				if !strings.Contains(name, query) {
					return nil
				}
			}
		}

		if fi.IsDir() {
			folders = append(folders, docinfo)
		} else {
			docs = append(docs, docinfo)
		}

		return nil
	})

	folders = append(folders, docs...)

	treeRoots := common.ConvertToTree(&folders)
	//fmt.Println(folders)
	c.JSON(http.StatusOK, treeRoots)
	return
}

func documentView(c *gin.Context) {

}

func documentAdd(c *gin.Context) {
	var srvDocDir = getSrvDocFsDir(c)
	if srvDocDir == "" {
		return
	}

	var pid = c.DefaultPostForm("Pid", "")
	var name = c.DefaultPostForm("Name", "")

	realFileDir := common.ToFsPath(filepath.Join(srvDocDir, pid, name))
	err := os.Mkdir(realFileDir, os.FileMode(0755))

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
	return
}

func documentUpdate(c *gin.Context) {
	var srvDocDir = getSrvDocFsDir(c)
	if srvDocDir == "" {
		return
	}

	var id = c.DefaultPostForm("Id", "")
	var oldName = c.DefaultPostForm("OldName", "")
	var name = c.DefaultPostForm("Name", "")

	pDir := strings.TrimSuffix(id, oldName)
	pFileDir := common.ToFsPath(pDir)
	realPFileDir := common.ToFsPath(filepath.Join(srvDocDir, pFileDir))

	oldFilePath := common.ToFsPath(filepath.Join(realPFileDir, oldName))
	filePath := common.ToFsPath(filepath.Join(realPFileDir, name))
	err := os.Rename(oldFilePath, filePath)

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
	return
}

func documentDelete(c *gin.Context) {
	var srvDocDir = getSrvDocFsDir(c)
	if srvDocDir == "" {
		return
	}

	var id = c.DefaultPostForm("Id", "")

	fileDir := common.ToFsPath(id)
	realFilePath := common.ToFsPath(filepath.Join(srvDocDir, fileDir))

	fi, _ := os.Stat(realFilePath)
	if fi.IsDir() {
		fileInfos, err := ioutil.ReadDir(realFilePath)
		if len(fileInfos) == 0 && err == nil {
			err := os.Remove(realFilePath)
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
		} else {
			c.JSON(http.StatusOK, gin.H{
				common.RespCode: -1,
				common.RespMsg:  "文件夹不为空",
			})
		}
	} else {
		err := os.Remove(realFilePath)
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

	return
}

func documentUpload(c *gin.Context) {
	var srvDocDir = getSrvDocFsDir(c)
	if srvDocDir == "" {
		return
	}

	var fileId = c.DefaultPostForm("FileId", "")
	file, _ := c.FormFile("FileUrl")

	fileDir := common.ToFsPath(fileId)
	realFilePath := common.ToFsPath(filepath.Join(srvDocDir, fileDir, file.Filename))

	//fmt.Println(fileId)
	c.SaveUploadedFile(file, realFilePath)

	c.String(http.StatusOK, "")
	return
}

func documentUploadZip(c *gin.Context) {
	var srvDocDir = getSrvDocFsDir(c)
	if srvDocDir == "" {
		return
	}

	file, _ := c.FormFile("FileZipUrl")
	realFilePath := common.ToFsPath(filepath.Join(srvDocDir, file.Filename))

	c.SaveUploadedFile(file, realFilePath)

	common.DeCompressZip(realFilePath, srvDocDir)

	os.Remove(realFilePath)

	c.String(http.StatusOK, "")
	return
}
