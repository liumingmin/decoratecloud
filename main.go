package main

import (
	"os"
	"time"

	"github.com/Sirupsen/logrus"
	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/controllers"
	"github.com/liumingmin/decoratecloud/dbase"
	"github.com/liumingmin/decoratecloud/schedule"
)

func main() {
	if len(os.Args) < 2 {
		gin.SetMode(gin.DebugMode)
	} else {
		gin.SetMode(os.Args[1])
	}

	port := "8000"
	if len(os.Args) > 2 {
		port = os.Args[2]
	}

	setLogger()

	dbase.InitDb()
	//dbase.InitDbTrigger()
	time.Local, _ = time.LoadLocation("Asia/Shanghai")

	router := gin.New()

	if gin.IsDebugging() {
		router.Use(gin.Logger())
	}

	router.Use(gin.Recovery())

	controllers.RegisterRouter(router)

	schedule.Run()

	router.Run(":" + port)
}

func setLogger() {
	logrus.SetFormatter(&logrus.TextFormatter{})
	logrus.SetLevel(logrus.ErrorLevel)
	logrus.SetOutput(os.Stderr)
	if gin.Mode() == gin.DebugMode {
		logrus.SetLevel(logrus.InfoLevel)
		logrus.SetOutput(os.Stdout)
	}
}
