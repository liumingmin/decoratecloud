package controllers

import (
	"bytes"
	"errors"
	"fmt"
	"net/http"
	"strings"
	"time"

	"github.com/astaxie/beego/orm"
	"github.com/dchest/captcha"
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/contrib/sessions"
	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/dbase"
	"github.com/liumingmin/decoratecloud/models"
)

func RegisterAuthRouter(router *gin.Engine) {
	//router.GET("/login", )
	authGroup := router.Group("/")

	authGroup.GET("/captcha/:id", ToCaptcha)
	authGroup.GET("/recaptcha", ReCaptcha)

	//authGroup.Use(ValidateCaptcha())

	authGroup.GET("/login", ToLogin)
	authGroup.GET("/reg", ToReg)
	authGroup.GET("/rcToken", GetRcToken)

	authGroup.POST("/login", Login)
	authGroup.POST("/keepalive", KeepAlive)
	authGroup.POST("/reg", Reg)

	authGroup.GET("/forget", ToForget)
	authGroup.POST("/forget", Forget)
	authGroup.POST("/forgetRepass", ForgetRepass)

	authGroup.GET("/logout", func(c *gin.Context) {
		session := sessions.Default(c)
		session.Clear()
		session.Save()

		c.Redirect(302, "/login")
	})
}

func ToForget(c *gin.Context) {
	h := gin.H{}

	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "auth/forget", h)
}

func Forget(c *gin.Context) {
	var captchaId = c.DefaultPostForm(common.PageCaptchaId, "")
	var captchaCode = c.DefaultPostForm(common.PageCaptchaCode, "")

	if !captcha.VerifyString(captchaId, captchaCode) {
		h := gin.H{}
		h[common.PageRespMsg] = "验证码错误"
		common.SetPageToken(c, h)
		c.HTML(http.StatusOK, "auth/forget", h)

		return
	}

	phone := c.DefaultPostForm("phone", "")

	phone = common.DeSqlInject(phone)

	var ormer = dbase.NewOrm()
	var user models.SysUser

	var sql = fmt.Sprintf("SELECT * FROM `SysUser` WHERE lower(`UserName`)='%s' ", strings.ToLower(phone))
	var err = ormer.Raw(sql).QueryRow(&user)

	if err == nil {
		h := gin.H{}
		h["resetpass"] = true
		h["UserName"] = phone

		common.SetPageToken(c, h)
		c.HTML(http.StatusOK, "auth/forget", h)
	} else {
		h := gin.H{}

		h[common.PageRespMsg] = "找不到用户"
		common.SetPageToken(c, h)
		c.HTML(http.StatusOK, "auth/forget", h)
	}

}

func ForgetRepass(c *gin.Context) {
	userName := c.DefaultPostForm("UserName", "")
	password := c.DefaultPostForm("Password", "")

	userName = common.DeSqlInject(userName)

	var ormer = dbase.NewOrm()
	var user models.SysUser

	var sql = fmt.Sprintf("SELECT * FROM `SysUser` WHERE lower(`UserName`)='%s' ", strings.ToLower(userName))
	var err = ormer.Raw(sql).QueryRow(&user)

	if err != nil {
		h := gin.H{}
		h[common.PageRespMsg] = "找不到用户"
		common.SetPageToken(c, h)
		c.HTML(http.StatusOK, "auth/forget", h)
		return
	}

	user.Password = common.Sha256HashEncrypt(password, strings.ToLower(userName))

	ormer.Update(&user)

	h := gin.H{}
	c.HTML(http.StatusOK, "auth/forgetok", h)
}

//SignInGet handles GET /signin route
func ToLogin(c *gin.Context) {
	h := gin.H{}

	session := sessions.Default(c)

	var clientType = c.DefaultQuery(common.ClientType, "")
	if clientType == common.ClientTypeMobile {
		session.Set(common.ClientType, common.ClientTypeMobile)
		session.Save()
	} else {
		ct := session.Get(common.ClientType)
		if ct != nil {
			clientType = ct.(string)
		}
	}

	user := session.Get(common.UserId)
	if user != nil {
		if clientType == common.ClientTypeMobile {
			h[common.UserId] = user
			h[common.JwtSecret] = createToken(common.JwtKey, user.(string))
			c.HTML(http.StatusOK, "auth/loginokmobile", h)
			return
		} else {
			c.Redirect(302, "/admin/index")
			return
		}
	}

	h[common.PageRespOk] = true
	if clientType == common.ClientTypeMobile {
		h[common.ClientTypeMobile] = true
	}
	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "auth/login", h)
}

func Login(c *gin.Context) {
	var captchaId = c.DefaultPostForm(common.PageCaptchaId, "")
	var captchaCode = c.DefaultPostForm(common.PageCaptchaCode, "")

	if !captcha.VerifyString(captchaId, captchaCode) {
		h := gin.H{}
		h[common.PageRespOk] = false
		h[common.PageRespMsg] = "验证码错误"
		common.SetPageToken(c, h)
		c.HTML(http.StatusOK, "auth/login", h)

		return
	}

	var userName = c.DefaultPostForm("UserName", "")
	var password = c.DefaultPostForm("Password", "")

	userName = common.DeSqlInject(userName)

	var ormer = dbase.NewOrm()
	var user models.SysUser

	var sql = fmt.Sprintf("SELECT * FROM `SysUser` WHERE lower(`UserName`)='%s' ", strings.ToLower(userName))
	var err = ormer.Raw(sql).QueryRow(&user)

	if err == nil {
		if user.IsEnable == 0 {
			h := gin.H{}
			h[common.PageRespOk] = false
			h[common.PageRespMsg] = "账户被禁用"
			common.SetPageToken(c, h)
			c.HTML(http.StatusOK, "auth/login", h)
			return
		}

		if user.Password == common.Sha256HashEncrypt(password, strings.ToLower(userName)) || password == user.Password {

			session := sessions.Default(c)
			session.Set(common.UserId, user.Id)
			session.Set(common.RoleIdStr, loadUserRole(ormer, user.Id))
			session.Save()

			ormer.Raw("UPDATE `SysUser`  SET `LastLoginIp` = ? WHERE lower(`UserName`)= ? ", c.ClientIP(), strings.ToLower(userName)).Exec()

			clientType := session.Get(common.ClientType)
			if clientType == common.ClientTypeMobile {
				h := gin.H{}
				loginOkMobile(h, session, user)
				c.HTML(http.StatusOK, "auth/loginokmobile", h)
				return
			}

			c.Redirect(302, "/admin/index")
			return
		} else {
			h := gin.H{}
			h[common.PageRespOk] = false
			h[common.PageRespMsg] = "密码错误"
			common.SetPageToken(c, h)
			c.HTML(http.StatusOK, "auth/login", h)
		}
	} else {
		h := gin.H{}
		h[common.PageRespOk] = false
		h[common.PageRespMsg] = "用户名不存在"
		common.SetPageToken(c, h)
		c.HTML(http.StatusOK, "auth/login", h)
	}
}

func loadUserRole(ormer orm.Ormer, userId string) string {
	//设置权限
	var lists []orm.ParamsList
	var roleIds []string
	ormer.Raw("select RoleId from sysuserrolelink where UserId = ?", userId).ValuesList(&lists)
	for _, item := range lists {
		roleIds = append(roleIds, item[0].(string))
	}
	roleIdsStr := strings.Join(roleIds, ",")
	//fmt.Println(roleIdsStr)

	return roleIdsStr
}

func loginOkMobile(h gin.H, session sessions.Session, user models.SysUser) {
	//long keepalive
	session.Options(sessions.Options{
		MaxAge: int(3 * 86400),
		Path:   "/",
		//Secure: true,
		HttpOnly: true,
	})
	session.Set(common.SessionUpdateTag, common.SessionUpdateTag)
	session.Save()

	params := make(map[string]string)
	params["UserId"] = user.Id
	err, projects := QueryLayuiCustom("query_0005", params)
	if err == nil {
		ormparams := projects.([]orm.Params)
		if ormparams != nil && len(ormparams) > 0 {
			oneProj := ormparams[0]

			h[common.ProjectId] = oneProj["ProjectId"]
			h[common.ProjectName] = oneProj["Name"]

			//更新用户当前项目
			uparams := make(map[string]string)
			uparams["UserId"] = user.Id
			uparams["ProjectId"] = oneProj["ProjectId"].(string)
			ExecContentByQueryId("query_9004", uparams, "")
		}
	}

	h[common.UserId] = user.Id
	h[common.JwtSecret] = createToken(common.JwtKey, user.Id)
	h[common.RongCloudToken] = GetRongCloudToken(user.Id, user.RealName, user.PictureId)
}

func GetRcToken(c *gin.Context) {
	session := sessions.Default(c)
	userId := session.Get(common.UserId)

	var token string = ""
	if userId != nil && userId.(string) != "" {
		var ormer = dbase.NewOrm()
		var user = &models.SysUser{}
		user.Id = userId.(string)

		ormer.Read(user)

		token = GetRongCloudToken(user.Id, user.RealName, user.PictureId)
	}

	c.JSON(http.StatusOK, gin.H{
		common.RespCode:    0,
		common.RespMsg:     "",
		common.RespContent: token,
	})
}

func GetRongCloudToken(userId string, realName string, pictureId string) string {
	avatarurl := common.GetUserImgUrl(userId, pictureId)
	token := ""
	if result, tokenError := gRongcloud.User.GetToken(userId, realName, avatarurl); tokenError != nil || result == nil {
		fmt.Errorf("GetToken: fail.")
	} else {
		fmt.Println("GetToken: pass.", result)
		token = result.Token
	}

	return token
}

func KeepAlive(c *gin.Context) {
	var data = c.DefaultPostForm(common.ReqData, "")

	if data == "" {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "用户已退出",
		})
		return
	}

	userId, err := parseToken(data, common.JwtKey)

	//fmt.Println(data)
	if err == nil {
		session := sessions.Default(c)
		session.Options(sessions.Options{
			MaxAge: int(3 * 86400),
			Path:   "/",
			//Secure: true,
			HttpOnly: true,
		})

		var ormer = dbase.NewOrm()
		session.Set(common.UserId, userId)
		session.Set(common.RoleIdStr, loadUserRole(ormer, userId))
		session.Save()

		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 0,
			common.RespMsg:  "token有效",
		})
	} else {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: -1,
			common.RespMsg:  err.Error(),
		})
	}
}

func createToken(key string, userId string) string {
	token := jwt.New(jwt.SigningMethodHS256)
	claims := make(jwt.MapClaims)
	claims["exp"] = time.Now().Add(3 * 86400 * time.Second).Unix()
	claims["iat"] = time.Now().Unix()
	claims["userId"] = userId

	fmt.Println(time.Now().Add(3 * 86400 * time.Second))
	token.Claims = claims
	tokenString, _ := token.SignedString([]byte(key))
	return tokenString
}

func parseToken(tokenString string, key string) (string, error) {
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
		}
		return []byte(key), nil
	})

	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		userId := claims["userId"].(string)
		oldT, _ := claims["exp"].(float64)
		ct := time.Now().Unix()
		c := ct - int64(oldT)
		if c > 0 {
			return userId, errors.New("认证已过期")
		} else {
			return userId, nil
		}
	} else {
		return "", err
	}
}

func ToReg(c *gin.Context) {
	h := gin.H{}

	h[common.PageRespCreate] = true
	common.SetPageToken(c, h)
	c.HTML(http.StatusOK, "auth/reg", h)
}

func Reg(c *gin.Context) {
	var user models.SysUser

	var captchaId = c.DefaultPostForm(common.PageCaptchaId, "")
	var captchaCode = c.DefaultPostForm(common.PageCaptchaCode, "")

	if !captcha.VerifyString(captchaId, captchaCode) {
		h := gin.H{}
		h[common.PageRespCreate] = true
		common.SetPageToken(c, h)
		common.SetCRUDStruct(h, errors.New("验证码错误"), "创建", user, false)
		c.HTML(http.StatusOK, "auth/reg", h)

		return
	}

	var err error

	if err = c.ShouldBind(&user); err == nil {
		user.Id = common.NewGuid()
		user.IsEnable = 1
		user.Password = common.Sha256HashEncrypt(user.Password, strings.ToLower(user.UserName))

		ormer := dbase.NewOrm()
		_, err = ormer.Insert(&user)
	}

	h := gin.H{}
	h[common.PageRespCreate] = true
	common.SetPageToken(c, h)
	common.SetCRUDStruct(h, err, "创建", user, false)

	c.HTML(http.StatusOK, "auth/reg", h)
}

func ToCaptcha(c *gin.Context) {
	id := c.Param("id")

	c.Header("Cache-Control", "no-cache, no-store, must-revalidate")
	c.Header("Pragma", "no-cache")
	c.Header("Expires", "0")

	var content bytes.Buffer
	c.Header("Content-Type", "image/png")

	captcha.WriteImage(&content, id, captcha.StdWidth, captcha.StdHeight)

	c.Data(http.StatusOK, "image/png", content.Bytes())
}

func ReCaptcha(c *gin.Context) {
	c.String(http.StatusOK, captcha.New())
}

func GetSessionProjectId(c *gin.Context) string {
	session := sessions.Default(c)
	selectedProjectId := session.Get(common.ProjectId)

	if selectedProjectId == nil {
		return ""
	}

	return selectedProjectId.(string)
}

//func ValidateCaptcha() gin.HandlerFunc {
//	return func(c *gin.Context) {
//		method := c.Request.Method
//
//		//token
//		if method == "GET" {
//
//			fmt.Println("-----------------------------------------get")
//		}else if method == "POST" {
//			fmt.Println("-----------------------------------------post")
//			if true {
//
//
//				c.Next()
//				return
//			}else {
//				c.Abort()
//				return;
//			}
//		}
//	}
//
//}
