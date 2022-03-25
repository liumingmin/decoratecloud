package schedule

import (
	"github.com/robfig/cron"
	_ "github.com/astaxie/beego"
	//"github.com/astaxie/beego"
	"github.com/gin-gonic/gin"
	"github.com/micro/go-config"
	"github.com/micro/go-config/source/file"
)

func Run(){

	conf := config.NewConfig()
	conf.Load(file.NewSource(
		file.WithPath("conf/config.json"),
	))

	isAppNotifyTask:=conf.Get(gin.Mode(),"schedule","appNotifyTask","enable").Bool(false)

	c := cron.New()

	if isAppNotifyTask{
		spec:=conf.Get(gin.Mode(),"schedule","appNotifyTask","cron").String("0 0 0 0 * ?")

		InitPushInfo();

		c.AddFunc(spec, func() {
			RunAppNotifyTask()
		})
	}

	if isAppNotifyTask {
		c.Start()
	}
}