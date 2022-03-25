package dbase

import (
	"time"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	"github.com/liumingmin/decoratecloud/common"
)

func init() {

	regmodels()

	var models = common.GetRegModels()
	orm.RegisterModelWithPrefix("", models...)
	orm.Debug = beego.AppConfig.DefaultBool("OrmDubug", false)
	orm.DefaultRowsLimit = -1
	orm.DefaultTimeLoc, _ = time.LoadLocation("Asia/Shanghai")
}
