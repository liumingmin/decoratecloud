package controllers

import (
	"encoding/json"
	"encoding/xml"
	"errors"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"sort"
	"strconv"
	"strings"

	"github.com/astaxie/beego/orm"
	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/dbase"
)

func RegisterQueryApiRouter(router *gin.Engine) {

	router.POST("/queryapi/queryByCond", QueryByCond)
	router.GET("/queryapi/queryLayuiByCond", QueryLayuiByCond)
	router.POST("/queryapi/execByCond", ExecByCond)
}

type QueryInfoConf struct {
	QueryInfos []QueryInfo `xml:"QueryInfo"`
}

type QueryInfo struct {
	Id            string       `xml:"Id"`
	RefModelNames string       `xml:"RefModelNames"`
	Cache         string       `xml:"Cache"`
	CacheBy       string       `xml:"CacheBy"`
	SQL           string       `xml:"SQL"`
	BindParams    []BindParams `xml:"BindParams"`
	Remark        string       `xml:"Remark"`
}

type BindParamGroup struct {
	BindParams []BindParam `xml:"BindParam"`
	ConnSymbol string      `xml:"ConnSymbol,attr"`
}

type BindParam struct {
	FieldExpress string `xml:"FieldExpress"`
	FormName     string `xml:"FormName"`
	ConnSymbol   string `xml:"ConnSymbol,attr"`
}

type BindParams struct {
	BindParamGroups []BindParamGroup `xml:"BindParamGroup"`
	RawSymbol       string           `xml:"RawSymbol,attr"`
	RawExpress      string           `xml:"RawExpress,attr"`
}

func GetQueryConfFilePath(filename string) string {
	file, _ := exec.LookPath(os.Args[0])
	fdir := filepath.Dir(file)
	queryconfPath := filepath.Join(fdir, "conf", filename) //"query.conf"
	return queryconfPath
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var gQueryInfoConf QueryInfoConf
var gQueryInit bool = false

func initQueryConf() {
	queryConfFile := GetQueryConfFilePath("query.conf")

	if !gQueryInit {
		gQueryInit, gQueryInfoConf = getQueryInfoConfByFile(queryConfFile)
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var gQueryLayuiInfoConf QueryInfoConf
var gQueryLayuiInit bool = false

func initQueryLayuiConf() {
	queryConfFile := GetQueryConfFilePath("querylayui.conf")

	if !gQueryLayuiInit {
		gQueryLayuiInit, gQueryLayuiInfoConf = getQueryInfoConfByFile(queryConfFile)
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var gExecInfoConf QueryInfoConf
var gExecInit bool = false

func initExecConf() {
	queryConfFile := GetQueryConfFilePath("sqlexec.conf")

	if !gExecInit {
		gExecInit, gExecInfoConf = getQueryInfoConfByFile(queryConfFile)
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func getQueryInfoConfByFile(queryConfFile string) (bool, QueryInfoConf) {
	var queryInfoConf QueryInfoConf
	if !common.FileExist(queryConfFile) {
		fmt.Println("not exist")
		return false, queryInfoConf
	}

	content, err := ioutil.ReadFile(queryConfFile)
	if err != nil {
		fmt.Println(err)
		return false, queryInfoConf
	}

	//var queryConf QueryInfoConf
	err = xml.Unmarshal(content, &queryInfoConf)
	if err != nil {
		fmt.Println(err)
		return false, queryInfoConf
	}

	if len(queryInfoConf.QueryInfos) == 0 {
		fmt.Println("no query infos")
	}

	return true, queryInfoConf
}

func findProjectIdByMap(queryInfo QueryInfo, paramMap map[string]string) string {
	if gin.IsDebugging() {
		fmt.Println("map-------" + queryInfo.Id + ":" + queryInfo.CacheBy)
	}
	if projectId, isok := paramMap[queryInfo.CacheBy]; isok { //"ProjectId"
		if gin.IsDebugging() {
			fmt.Print(":" + projectId)
		}
		return projectId
	}

	return ""
}

func findProjectIdByCtxForm(queryInfo QueryInfo, c *gin.Context) string {
	projectId := c.DefaultPostForm(queryInfo.CacheBy, "") //"ProjectId"

	if gin.IsDebugging() {
		fmt.Println("ctxFrom-------" + queryInfo.Id + ":" + queryInfo.CacheBy + ":" + projectId)
	}

	return projectId
}

func findProjectIdByCtxQuery(queryInfo QueryInfo, c *gin.Context) string {
	projectId := c.DefaultQuery(queryInfo.CacheBy, "") //"ProjectId"

	if gin.IsDebugging() {
		fmt.Println("ctxQuery-------" + queryInfo.Id + ":" + queryInfo.CacheBy + ":" + projectId)
	}

	return projectId
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func QueryByCond(c *gin.Context) {

	initQueryConf()

	var data = c.PostForm(common.ReqData)

	var paramMap = make(map[string]string)

	if err := json.Unmarshal([]byte(data), &paramMap); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "json数组解析出错",
		})
		return
	}

	var queryId string = ""
	if v, ok := paramMap["queryId"]; ok {
		queryId = v
	}

	var queryInfo QueryInfo
	for _, v := range gQueryInfoConf.QueryInfos {
		if v.Id == queryId {
			queryInfo = v
			break
		}
	}

	if queryInfo.Id == "" {
		errorstr := fmt.Sprintf("cannot find query by Id: err=%s", queryId)
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  errorstr,
		})
		return
	}

	var entities interface{} = nil
	var err error = nil

	if queryInfo.Cache != "no" {

		sortstr := make([]string, 0)
		for condk, condv := range paramMap {
			sortstr = append(sortstr, condk)
			sortstr = append(sortstr, condv)
		}
		sort.Strings(sortstr)
		ckey := strings.Join(sortstr, "-")

		if dbase.MemCacheIsExist(queryInfo.Id, ckey) {
			entities = dbase.MemCacheGet(queryInfo.Id, ckey)
		}

		if entities == nil {
			entities, err = QueryContentByCond(queryInfo, paramMap)

			if err == nil {
				modelNames := strings.Split(queryInfo.RefModelNames, ",")
				dbase.MemCachePutQuery(modelNames, findProjectIdByCtxForm(queryInfo, c), queryInfo.Id, ckey, entities)
			}
		}
	} else {
		entities, err = QueryContentByCond(queryInfo, paramMap)
	}

	if err == nil {
		body, _ := json.Marshal(entities)

		c.JSON(http.StatusOK, gin.H{
			common.RespCode:    0,
			common.RespMsg:     "操作成功",
			common.RespContent: string(body),
		})
	} else {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 2,
			common.RespMsg:  err.Error(),
		})
	}

}

func QueryGenSql(queryInfo QueryInfo, paramMap map[string]string) (string, bool) {
	if len(queryInfo.BindParams) == 0 {
		return queryInfo.SQL, true
	}

	searchapis := make([]interface{}, 0, 1)
	for _, bds := range queryInfo.BindParams {
		var searchapi string = ""

		if bds.RawSymbol == "" {
			for _, group := range bds.BindParamGroups {

				var groupclause string = ""

				for _, v := range group.BindParams {
					var paramVal string = ""
					if v, ok := paramMap[v.FormName]; ok {
						paramVal = v
					}

					paramVal = common.DeSqlInject(paramVal)

					if paramVal != "" {
						if groupclause == "" {
							groupclause += " " + fmt.Sprintf(v.FieldExpress, paramVal)
						} else {
							groupclause += "  " + v.ConnSymbol + " " + fmt.Sprintf(v.FieldExpress, paramVal)
						}
					}
				}

				if groupclause != "" {
					searchapi += " " + group.ConnSymbol + " (" + groupclause + ")"
				}
			}
		} else {
			var paramVal string = ""
			if v, ok := paramMap[bds.RawSymbol]; ok {
				paramVal = v
			}

			paramVal = common.DeSqlInject2(paramVal)

			paramVal = fmt.Sprintf(bds.RawExpress, paramVal)

			searchapi = paramVal
		}

		searchapis = append(searchapis, searchapi)
	}

	sqlstr := fmt.Sprintf(queryInfo.SQL, searchapis...)

	return sqlstr, true
}

func QueryContentByCond(queryInfo QueryInfo, paramMap map[string]string) (interface{}, error) {

	sqlstr, _ := QueryGenSql(queryInfo, paramMap)

	ormer := dbase.NewOrm()

	var totalSize int = 0

	var pStartStr string = ""
	var pLimitStr string = ""
	if v, ok := paramMap["__start"]; ok {
		pStartStr = v
	}

	if v, ok := paramMap["__limit"]; ok {
		pLimitStr = v
	}

	pStart, _ := strconv.Atoi(pStartStr)
	pLimit, _ := strconv.Atoi(pLimitStr)

	if pLimit > 0 {
		if pStart == 0 {
			cntSql := " select count(*) from (" + sqlstr + ") t"
			ormer.Raw(cntSql).QueryRow(&totalSize)
		}
		sqlstr += fmt.Sprintf(" limit %d,%d ", pStart, pLimit)
	}

	if gin.IsDebugging() {
		fmt.Println(sqlstr)
	}

	var contentMap = make(map[string]interface{})
	contentMap["total"] = totalSize

	var lists []orm.ParamsList
	_, err := ormer.Raw(sqlstr).ValuesList(&lists)
	contentMap["list"] = lists

	return contentMap, err
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func QueryLayuiByCond(c *gin.Context) {
	initQueryLayuiConf()

	var queryId string = c.DefaultQuery("queryId", "")

	var queryInfo QueryInfo
	for _, v := range gQueryLayuiInfoConf.QueryInfos {
		if v.Id == queryId {
			queryInfo = v
			break
		}
	}

	if queryInfo.Id == "" {
		errorstr := fmt.Sprintf("cannot find query by Id: err=%s", queryId)
		c.JSON(http.StatusOK, gin.H{
			"code": 2,
			"msg":  errorstr,
		})
		return
	}

	var entities interface{} = nil
	var err error = nil

	if queryInfo.Cache != "no" {
		paramMap := c.Request.URL.Query()

		sortstr := make([]string, 0)
		for condk, condv := range paramMap {
			sortstr = append(sortstr, condk)

			if len(condv) > 0 {
				sortstr = append(sortstr, condv[0])
			}
		}
		sort.Strings(sortstr)
		ckey := strings.Join(sortstr, "-")

		if dbase.MemCacheIsExist(queryInfo.Id, ckey) {
			entities = dbase.MemCacheGet(queryInfo.Id, ckey)
		}

		if entities == nil {
			entities, err = QueryLayuiContentByCond(queryInfo, c)

			if err == nil {
				modelNames := strings.Split(queryInfo.RefModelNames, ",")
				dbase.MemCachePutQuery(modelNames, findProjectIdByCtxQuery(queryInfo, c), queryInfo.Id, ckey, entities)

			}
		}
	} else {
		entities, err = QueryLayuiContentByCond(queryInfo, c)
	}

	if err == nil {
		//body, _ := json.Marshal(entities)

		c.JSON(http.StatusOK, entities)
	} else {
		c.JSON(http.StatusOK, gin.H{
			"code": 2,
			"msg":  err.Error(),
		})
	}
}

func QueryLayuiCustom(queryId string, paramMap map[string]string) (error, interface{}) {
	initQueryLayuiConf()

	var queryInfo QueryInfo
	for _, v := range gQueryLayuiInfoConf.QueryInfos {
		if v.Id == queryId {
			queryInfo = v
			break
		}
	}

	if queryInfo.Id == "" {
		errorstr := fmt.Sprintf("cannot find query by Id: err=%s", queryId)
		return errors.New(errorstr), nil
	}

	var entities interface{} = nil
	var err error = nil

	if queryInfo.Cache != "no" {
		sortstr := make([]string, 0)
		for condk, condv := range paramMap {
			sortstr = append(sortstr, condk)
			sortstr = append(sortstr, condv)
		}
		sort.Strings(sortstr)
		ckey := strings.Join(sortstr, "-")

		if dbase.MemCacheIsExist(queryInfo.Id, ckey) {
			entities = dbase.MemCacheGet(queryInfo.Id, ckey)
		}

		if entities == nil {
			sqlstr, _ := QueryGenSql(queryInfo, paramMap)

			if gin.IsDebugging() {
				fmt.Println(sqlstr)
			}
			ormer := dbase.NewOrm()

			var maps []orm.Params
			_, err = ormer.Raw(sqlstr).Values(&maps)
			entities = maps

			if err == nil {
				modelNames := strings.Split(queryInfo.RefModelNames, ",")
				dbase.MemCachePutQuery(modelNames, findProjectIdByMap(queryInfo, paramMap), queryInfo.Id, ckey, entities)
			}
		}
	} else {
		sqlstr, _ := QueryGenSql(queryInfo, paramMap)

		if gin.IsDebugging() {
			fmt.Println(sqlstr)
		}

		ormer := dbase.NewOrm()

		var maps []orm.Params
		_, err = ormer.Raw(sqlstr).Values(&maps)
		entities = maps
	}

	return err, entities
}

func QueryLayuiGenSql(queryInfo QueryInfo, c *gin.Context) (string, bool) {
	if len(queryInfo.BindParams) == 0 {
		return queryInfo.SQL, true
	}

	searchapis := make([]interface{}, 0, 1)
	for _, bds := range queryInfo.BindParams {
		var searchapi string = ""

		if bds.RawSymbol == "" {
			for _, group := range bds.BindParamGroups {

				var groupclause string = ""

				for _, v := range group.BindParams {
					var paramVal string = c.DefaultQuery(v.FormName, "")

					paramVal = common.DeSqlInject(paramVal)

					if paramVal != "" {
						if groupclause == "" {
							groupclause += " " + fmt.Sprintf(v.FieldExpress, paramVal)
						} else {
							groupclause += "  " + v.ConnSymbol + " " + fmt.Sprintf(v.FieldExpress, paramVal)
						}
					}
				}

				if groupclause != "" {
					searchapi += " " + group.ConnSymbol + " (" + groupclause + ")"
				}
			}
		} else {
			var paramVal string = c.DefaultQuery(bds.RawSymbol, "")

			paramVal = common.DeSqlInject2(paramVal)

			paramVal = fmt.Sprintf(bds.RawExpress, paramVal)

			searchapi = paramVal
		}

		searchapis = append(searchapis, searchapi)
	}

	sqlstr := fmt.Sprintf(queryInfo.SQL, searchapis...)

	return sqlstr, true
}

func QueryLayuiContentByCond(queryInfo QueryInfo, c *gin.Context) (interface{}, error) {
	initQueryLayuiConf()

	sqlstr, _ := QueryLayuiGenSql(queryInfo, c)

	ormer := dbase.NewOrm()

	var totalSize int = 0

	var page string = c.DefaultQuery("page", "")
	var limit string = c.DefaultQuery("limit", "")

	pPage, _ := strconv.Atoi(page)
	pLimit, _ := strconv.Atoi(limit)

	pPage = pPage - 1
	if pPage < 0 {
		pPage = 0
	}

	cntSql := " select count(*) from (" + sqlstr + ") t"
	ormer.Raw(cntSql).QueryRow(&totalSize)

	sqlstr += fmt.Sprintf(" limit %d,%d ", pPage*pLimit, pLimit)

	if gin.IsDebugging() {
		fmt.Println(sqlstr)
	}
	var contentMap = make(map[string]interface{})
	contentMap["count"] = totalSize

	var maps []orm.Params
	_, err := ormer.Raw(sqlstr).Values(&maps)
	contentMap["data"] = maps

	contentMap["code"] = 0
	contentMap["msg"] = ""

	return contentMap, err
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func ExecByCond(c *gin.Context) {

	initExecConf()

	var data = c.PostForm(common.ReqData)

	var paramMap = make(map[string]string)

	if err := json.Unmarshal([]byte(data), &paramMap); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "json数组解析出错",
		})
		return
	}

	var queryId string = ""
	if v, ok := paramMap["queryId"]; ok {
		queryId = v
	}

	var num int64 = 0
	var err error = nil
	if queryId != "" {
		queryIds := strings.Split(queryId, ",")
		for _, queryIdItem := range queryIds {

			var queryInfo QueryInfo
			for _, v := range gExecInfoConf.QueryInfos {
				if v.Id == queryIdItem {
					queryInfo = v
					break
				}
			}

			if queryInfo.Id != "" {
				num, err = ExecContentByQueryCond(queryInfo, paramMap, findProjectIdByCtxForm(queryInfo, c))
			}
		}
	}

	//if queryInfo.Id == "" {
	//	errorstr := fmt.Sprintf("cannot find query by Id: err=%s",queryId)
	//	c.JSON(http.StatusOK, gin.H{
	//		common.RespCode:2,
	//		common.RespMsg: errorstr,
	//	})
	//	return
	//}

	if err == nil {

		c.JSON(http.StatusOK, gin.H{
			common.RespCode:    0,
			common.RespMsg:     "操作成功",
			common.RespContent: num,
		})
	} else {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: -1,
			common.RespMsg:  err.Error(),
		})
	}

}

func ExecGenSql(queryInfo QueryInfo, paramMap map[string]string) (string, bool) {
	if len(queryInfo.BindParams) == 0 {
		return queryInfo.SQL, true
	}

	searchapis := make([]interface{}, 0, 1)
	for _, bds := range queryInfo.BindParams {
		var searchapi string = ""

		if bds.RawSymbol == "" {
			for _, group := range bds.BindParamGroups {

				var groupclause string = ""

				for _, v := range group.BindParams {
					var paramVal string = ""
					if v, ok := paramMap[v.FormName]; ok {
						paramVal = v
					} else {
						return "", false
					}

					paramVal = common.DeSqlInject(paramVal)

					if paramVal != "" {
						if groupclause == "" {
							groupclause += " " + fmt.Sprintf(v.FieldExpress, paramVal)
						} else {
							groupclause += "  " + v.ConnSymbol + " " + fmt.Sprintf(v.FieldExpress, paramVal)
						}
					}
				}

				if groupclause != "" {
					searchapi += " " + group.ConnSymbol + " (" + groupclause + ")"
				}
			}
		} else {
			var paramVal string = ""
			if v, ok := paramMap[bds.RawSymbol]; ok {
				paramVal = v
			} else {
				return "", false
			}

			paramVal = common.DeSqlInject2(paramVal)

			paramVal = fmt.Sprintf(bds.RawExpress, paramVal)

			searchapi = paramVal
		}

		searchapis = append(searchapis, searchapi)
	}

	sqlstr := fmt.Sprintf(queryInfo.SQL, searchapis...)

	return sqlstr, true
}

func ExecContentByQueryId(queryId string, paramMap map[string]string, projectId string) (int64, error) {
	initExecConf()

	var queryInfo QueryInfo
	for _, v := range gExecInfoConf.QueryInfos {
		if v.Id == queryId {
			queryInfo = v
			break
		}
	}

	if queryInfo.Id == "" {
		errorstr := fmt.Sprintf("cannot find query by Id: err=%s", queryId)
		//logger.Error(errorstr)
		return 0, errors.New(errorstr)
	}

	return ExecContentByQueryCond(queryInfo, paramMap, projectId)
}

func ExecContentByQueryCond(queryInfo QueryInfo, paramMap map[string]string, projectId string) (int64, error) {
	sqlstr, isok := ExecGenSql(queryInfo, paramMap)

	if !isok {
		fmt.Println(sqlstr)
		return 0, errors.New("生成sql失败")
	}

	ormer := dbase.NewOrm()

	if gin.IsDebugging() {
		fmt.Println(sqlstr)
	}

	res, err := ormer.Raw(sqlstr).Exec()

	modelNames := strings.Split(queryInfo.RefModelNames, ",")
	for _, modelName := range modelNames {
		dbase.MemCacheDeleteMulti(modelName, projectId)
	}

	if err == nil {
		num, _ := res.RowsAffected()
		return num, err
	}

	return 0, err
}
