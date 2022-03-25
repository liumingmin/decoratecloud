package controllers

import (
	"fmt"
	"net/http"
	"strings"
	"time"

	"github.com/Sirupsen/logrus"
	"github.com/astaxie/beego/orm"
	"github.com/gin-gonic/contrib/gzip"
	"github.com/gin-gonic/contrib/sessions"
	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/dbase"
	"github.com/rongcloud/server-sdk-go/RCServerSDK"
)

var gRongcloud *rcserversdk.RongCloud

func RegisterRouter(router *gin.Engine) {
	router.Use(gin.Recovery())
	router.Use(gzip.Gzip(gzip.DefaultCompression))

	router.LoadHTMLGlob("views/**/*.html")
	//router.LoadHTMLGlob("views/*.html")

	setSessions(router)

	router.Static("/static", "./static")

	router.Use(ImageServe("/images", LocalFile(common.GetImagesPathConf(), false)))
	router.Use(ImageServe("/docs", LocalFile(common.GetDocsPathConf(), false)))

	router.GET("/error", ToError)
	router.GET("/repost", ToRepost)
	router.GET("/noperm", ToNoperm)
	router.GET("/date", GetDate)
	router.NoRoute(To404)

	router.Use(ValidateToken())

	RegisterAuthRouter(router)

	router.Use(AuthRequired())

	RegisterQueryApiRouter(router)
	RegisterRestApiRouter(router)

	RegisterUploadRouter(router)

	router.GET("/admin/index", AdminIndex)
	router.POST("/admin/selectproject", SelectProject)

	RegisterProjectRouter(router)
	RegisterUserRouter(router)
	RegisterRoleRouter(router)
	RegisterModuleRouter(router)
	RegisterDocumentRouter(router)

	dbase.InitRabc()

	initRongCloud()
}

func initRongCloud() {
	gRongcloud = rcserversdk.CreateRongCloud("bmdehs6pbr79s", "jeGQxGIAQK")
}

func getL2PModuleId(lvl1Module interface{}) string {

	dataparams := lvl1Module.([]orm.Params)

	if len(dataparams) > 0 {
		return dataparams[0]["Id"].(string)
	}

	return ""
}

func GetDate(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		common.RespCode:    0,
		common.RespMsg:     "",
		common.RespContent: time.Now().Format("2006-01-02"),
	})
}

func AdminIndex(c *gin.Context) {
	//c.Redirect(302,"/admin/project/list")
	h := gin.H{}

	moduleId := c.DefaultQuery("pModuleId", "")

	session := sessions.Default(c)

	userId := session.Get(common.UserId)
	params := make(map[string]string)

	userParams := make(map[string]string)
	userParams["UserId"] = userId.(string)
	_, userProjects := QueryLayuiCustom("query_0011", userParams)
	h["Projects"] = userProjects

	selectedProjectId := session.Get(common.ProjectId)

	if selectedProjectId != nil {
		selectedStr := selectedProjectId.(string)
		datalist, _ := userProjects.([]orm.Params)
		for _, v := range datalist {
			if v["Id"] == selectedStr {
				h["SelectedProject"] = v
				break
			}
		}
	}

	if userId == common.SuperAdminId {
		_, lvl1Module := QueryLayuiCustom("query_0009", params)

		h["L1Module"] = lvl1Module

		if moduleId == "" {
			moduleId = getL2PModuleId(lvl1Module)
		}

		if moduleId != "" {
			params["Pid"] = moduleId
			_, lvl2Module := QueryLayuiCustom("query_0010", params)
			h["L2Module"] = lvl2Module
		}
	} else {
		//var roleIdStr string =""
		//roleId := session.Get(common.RoleIdStr)
		//if roleId!= nil{
		//	roleIdStr = roleId.(string)
		//}
		//
		//roleIds := strings.Split(roleIdStr,",")
		//roleIdClause := "'"+strings.Join(roleIds,"','")+"'"
		//
		//
		//params["RoleIds"]= roleIdClause
		_, lvl1Module := QueryLayuiCustom("query_0007", params)

		h["L1Module"] = lvl1Module

		if moduleId == "" {
			moduleId = getL2PModuleId(lvl1Module)
		}

		if moduleId != "" {
			params["Pid"] = moduleId
			_, lvl2Module := QueryLayuiCustom("query_0008", params)
			h["L2Module"] = lvl2Module
		}
	}

	c.HTML(http.StatusOK, "admin/index", h)
}

func SelectProject(c *gin.Context) {
	var projectId = c.DefaultPostForm("ProjectId", "")
	if gin.IsDebugging() {
		fmt.Println("--------------------------------" + projectId)
	}
	session := sessions.Default(c)
	session.Set(common.ProjectId, projectId)
	session.Save()

	c.String(http.StatusOK, "")
}

func ToError(c *gin.Context) {
	h := gin.H{}
	c.HTML(http.StatusOK, "error", h)
}

func To404(c *gin.Context) {
	h := gin.H{}
	c.HTML(http.StatusNotFound, "404", h)
}

func ToNoperm(c *gin.Context) {
	h := gin.H{}
	c.HTML(http.StatusOK, "noperm", h)
}

func ToRepost(c *gin.Context) {
	session := sessions.Default(c)

	h := gin.H{}

	clientType := session.Get(common.ClientType)
	if clientType == common.ClientTypeMobile {
		c.Redirect(302, "/login?"+common.ClientType+"="+common.ClientTypeMobile)
	} else {
		c.HTML(http.StatusOK, "repost", h)
	}
}

func setSessions(r *gin.Engine) {

	host, port, password, poolsize := common.GetRedisConf()

	store, err := sessions.NewRedisStore(poolsize, "tcp", host+":"+port, password, []byte("secret"))
	if err != nil {
		logrus.Error("session redis cannot connection！")
		return
	}

	//store := sessions.NewCookieStore([]byte("secret"))

	store.Options(sessions.Options{
		MaxAge: int(3 * 86400),
		Path:   "/",
		//Secure: true,
		HttpOnly: true,
	})

	r.Use(sessions.Sessions("websession", store))
}

func AuthRequired() gin.HandlerFunc {
	return func(c *gin.Context) {
		path := c.Request.URL.Path

		if strings.Contains(path, "favicon.ico") {
			c.Next()
			return
		}

		session := sessions.Default(c)
		user := session.Get(common.UserId)
		if !common.IsNil(user) {
			session.Set(common.SessionUpdateTag, common.SessionUpdateTag)
			session.Save()

			if user == common.SuperAdminId {
				c.Next()
				return
			}

			endchar := strings.Index(path, "?")
			if endchar < 0 {
				endchar = len(path)
			}

			var roleIdStr string = ""
			roleId := session.Get(common.RoleIdStr)
			if roleId != nil {
				roleIdStr = roleId.(string)
			}

			isGranted := dbase.RoleIsGranted(roleIdStr, path[0:endchar])

			if !isGranted {
				c.Redirect(302, "/noperm")
				return
			}

			c.Next()
			return
		}

		c.Abort()
		c.Redirect(302, "/login")

		//c.JSON(http.StatusUnauthorized, gin.H{
		//	"error": "user not login",
		//})
		//c.Abort()
		return
	}
}

func ValidateToken() gin.HandlerFunc {
	return func(c *gin.Context) {
		session := sessions.Default(c)
		method := c.Request.Method
		path := c.Request.URL.Path

		if strings.Contains(path, "delete") {
			c.Next()
			return
		}

		reqMobileSecret := c.DefaultPostForm(common.ReqMobileSecret, "")
		if reqMobileSecret != "" {
			c.Next()
			return
		}

		//token
		//if method == "GET" {
		//	token := common.NewGuid()
		//	session.Set("__token",token)
		//	session.Save()
		//}else
		if method == "POST" {
			formtoken := c.DefaultPostForm("__token", "")
			//token := session.Get("__token").(string)

			var tokensarray = make([]string, 0)

			var tokens = session.Get("__token")
			if tokens != nil {
				tokenstrs := tokens.(string)
				tokensarray = strings.Split(tokenstrs, ",")
			} else {
				c.Next()
				return
			}

			if isok, index := common.StrArrayContains(tokensarray, formtoken); isok {
				tokensarray = common.StrArrayDelete(tokensarray, index)
				session.Set("__token", strings.Join(tokensarray, ","))
				session.Save()

				c.Next()
				return
			} else {
				fmt.Println("repost form")

				c.Abort()

				c.Redirect(302, "/repost")
				return
			}
		}
	}

}
