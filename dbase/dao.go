package dbase

import (
	"database/sql"
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/models"
	"github.com/micro/go-config"
	"github.com/micro/go-config/source/file"
)

func NewOrm() orm.Ormer {
	var result = orm.NewOrm()
	result.Using(common.GDbName)
	return result
}

func InitDb() error {
	conf := config.NewConfig()
	conf.Load(file.NewSource(
		file.WithPath("conf/config.json"),
	))

	var err error = nil

	var connStr = mysqlConnStr(conf)

	orm.RegisterDriver("mysql", orm.DRMySQL)
	err = orm.RegisterDataBase(common.GDbName, "mysql", connStr)

	if err != nil {
		beego.BeeLogger.Error("ConnStr=%v, err=", connStr, err)
		return err
	} else {
		beego.BeeLogger.Info("ConnStr=%v", connStr)
	}

	orm.SetMaxIdleConns(common.GDbName, conf.Get(gin.Mode(), "mysql", "poolsize").Int(10))
	orm.SetMaxOpenConns(common.GDbName, conf.Get(gin.Mode(), "mysql", "poolsize").Int(10))
	//orm.DefaultTimeLoc = time.UTC

	syncdb := conf.Get(gin.Mode(), "mysql", "syncDb").Bool(false)
	if syncdb {
		err = orm.RunSyncdb(common.GDbName, false, true)
		if err != nil {
			beego.BeeLogger.Error("InitDb@orm.RunSyncdb: err=%v", err)
		}
	}

	return err
}

func InitDbTrigger() {
	var ormer = NewOrm()

	dbSqlfiles := getDbSqlConfFileDir()
	for _, dbSqlfile := range dbSqlfiles {
		content, err := ioutil.ReadFile(dbSqlfile)

		fmt.Println("read trgger conf:" + dbSqlfile)

		if err == nil {
			var err error
			var viewcontent = string(content)
			_, err = ormer.Raw(viewcontent).Exec()
			if err != nil {
				fmt.Println("initDbTrigger@Ormer.Exec(view): err=%v" + err.Error())
			}
		}
	}
}

func getDbSqlConfFileDir() []string {
	file, _ := exec.LookPath(os.Args[0])
	fdir := filepath.Dir(file)
	confdir := filepath.Join(fdir, "triger")

	files := make([]string, 0, 30)

	filepath.Walk(confdir, func(filename string, fi os.FileInfo, err error) error { //遍历目录
		if fi.IsDir() { // 忽略目录
			return nil
		}

		if strings.HasSuffix(strings.ToLower(fi.Name()), ".sql") {
			files = append(files, filename)
		}

		return nil
	})

	return files
}

func mysqlConnStr(conf config.Config) string {

	dbserver := conf.Get(gin.Mode(), "mysql", "host").String("localhost")
	dbport := conf.Get(gin.Mode(), "mysql", "port").String("3306")
	dbusername := conf.Get(gin.Mode(), "mysql", "user").String("root")
	dbpassowrd := conf.Get(gin.Mode(), "mysql", "password").String("")
	dbname := conf.Get(gin.Mode(), "mysql", "dbname").String("ebc") + "_" + gin.Mode()

	var dbparmas = "?charset=utf8&parseTime=true&loc=Asia%2FShanghai"

	return dbusername + ":" + dbpassowrd + "@tcp" + "(" + dbserver + ":" + dbport + ")" + "/" + dbname + dbparmas
}

//换成时间
func IncTableVer(ormer orm.Ormer, modelName string) {
	//var projId = ""
	//if common.IsModelHasField(modelName, "ProjectId") {
	//	projId = projectId
	//}

	var err error = nil
	var tableVer models.TableVer

	var sql = fmt.Sprintf("SELECT * FROM `TableVer` WHERE `Name`='%s' ", modelName)
	err = ormer.Raw(sql).QueryRow(&tableVer)

	if err == nil {
		tableVer.Value = tableVer.Value + 1
		ormer.Update(&tableVer)

	}
}

func DeleteMulti(o orm.Ormer, tableName, idName string, ids []string) (sql.Result, error) {
	return o.Raw(fmt.Sprintf("delete from %s where %s in (%s)", tableName, idName, "'"+strings.Join(ids, "','")+"'")).Exec()
}
