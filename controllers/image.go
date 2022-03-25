package controllers

import (
	"fmt"
	"net/http"
	"os"
	"path"
	"strconv"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/nfnt/resize"
)

type ServeFileSystem interface {
	http.FileSystem
	Exists(prefix string, path string) (bool, string)
}

type localFileSystem struct {
	http.FileSystem
	root    string
	indexes bool
}

func LocalFile(root string, indexes bool) *localFileSystem {
	return &localFileSystem{
		FileSystem: gin.Dir(root, indexes),
		root:       root,
		indexes:    indexes,
	}
}

func (l *localFileSystem) Exists(prefix string, filepath string) (bool, string) {
	if p := strings.TrimPrefix(filepath, prefix); len(p) < len(filepath) {
		name := path.Join(l.root, p)
		stats, err := os.Stat(name)
		if err != nil {
			return false, name
		}
		if !l.indexes && stats.IsDir() {
			return false, name
		}
		return true, name
	}
	return false, ""
}

func ImageServeRoot(urlPrefix, root string) gin.HandlerFunc {
	return ImageServe(urlPrefix, LocalFile(root, false))
}

// Static returns a middleware handler that serves static files in the given directory.
func ImageServe(urlPrefix string, fs ServeFileSystem) gin.HandlerFunc {
	fileserver := http.FileServer(fs)
	if urlPrefix != "" {
		fileserver = http.StripPrefix(urlPrefix, fileserver)
	}
	return func(c *gin.Context) {

		if isok, realpath := fs.Exists(urlPrefix, c.Request.URL.Path); isok {
			wstr := c.DefaultQuery("w", "")
			hstr := c.DefaultQuery("h", "")

			if wstr != "" && hstr != "" {
				w, _ := strconv.Atoi(wstr)
				h, _ := strconv.Atoi(hstr)

				thumbnailPath := realpath
				thumbnailUrl := c.Request.URL.Path
				idx := strings.LastIndex(realpath, ".")
				if idx >= 0 {
					thumbnailPath = fmt.Sprintf("%s-%sx%s.jpg", realpath[0:idx], wstr, hstr)
				}

				origPath := c.Request.URL.Path
				origIdx := strings.LastIndex(origPath, ".")
				if origIdx >= 0 {
					thumbnailUrl = fmt.Sprintf("%s-%sx%s.jpg", origPath[0:origIdx], wstr, hstr)
				}

				if !common.FileExist(thumbnailPath) {
					img, err2 := common.ReadImage(realpath)
					if err2 == nil {
						img2 := resize.Thumbnail(uint(w), uint(h), img, resize.NearestNeighbor)
						common.WriteImage(img2, thumbnailPath)
					}
				}

				if common.FileExist(thumbnailPath) {
					c.Request.URL.Path = thumbnailUrl
				}
			}
			//fmt.Println(c.Request.URL.Path)
			fileserver.ServeHTTP(c.Writer, c.Request)
			c.Abort()
		}
	}
}
