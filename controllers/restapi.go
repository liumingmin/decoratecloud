package controllers

import (
	"encoding/json"
	"fmt"
	"net/http"
	"reflect"
	"sort"
	"strings"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/gin-gonic/gin"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/dbase"
)

func RegisterRestApiRouter(router *gin.Engine) {

	router.POST("/restapi/deleteEntities/:modelName", DeleteEntities)
	router.POST("/restapi/createEntities/:modelName", CreateEntities)
	router.POST("/restapi/saveEntities/:modelName", SaveEntities)

	router.POST("/restapi/createEntity/:modelName", CreateEntity)
	router.POST("/restapi/retrievEntity/:modelName", RetrievEntity)
	router.POST("/restapi/updateEntity/:modelName", UpdateEntity)
	router.POST("/restapi/getEntities/:modelName", GetEntities)

	router.POST("/restapi/deleteEntity/:modelName", DeleteEntity)
	router.POST("/restapi/queryEntities/:modelName", QueryEntities)
	router.POST("/restapi/deleteByCond/:modelName", DeleteByCond)

	router.POST("/restapi/batchSaveEntities", BatchSaveEntities)

}

func findProjectIdByFrom(c *gin.Context) string {
	return c.DefaultPostForm(common.ReqProjectId, "")
}

func deleteModelCache(modelName string, c *gin.Context) {
	projectId := findProjectIdByFrom(c)
	dbase.MemCacheDeleteMulti(modelName, projectId)

	if gin.IsDebugging() {
		fmt.Printf("delete projectId:%v cache  model:%v\n", projectId, modelName)
	}
}

func deleteRelateModelCache(c *gin.Context) {
	relateModels := c.DefaultPostForm(common.ReqRelateModels, "")
	if relateModels == "" {
		return
	}

	projectId := findProjectIdByFrom(c)
	relateModelsArray := strings.Split(relateModels, ",")

	if len(relateModelsArray) == 0 {
		return
	}

	for _, relateModel := range relateModelsArray {
		dbase.MemCacheDeleteMulti(relateModel, projectId)
	}

	if gin.IsDebugging() {
		fmt.Printf("delete projectId:%v cache relate models:%v\n", projectId, relateModels)
	}
}

func DeleteEntities(c *gin.Context) {
	var modelName = c.Param("modelName")

	var deleteIds = make([]string, 0, 100)

	var data = c.PostForm(common.ReqData)

	if err := json.Unmarshal([]byte(data), &deleteIds); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "json数组解析出错",
		})
		return
	}

	var ormer = dbase.NewOrm()
	//var entity = common.CreateModel(modelName)

	if len(deleteIds) > 0 {
		_, err := dbase.DeleteMulti(ormer, modelName, "id", deleteIds)
		if err != nil {
			c.JSON(http.StatusOK, gin.H{
				common.RespCode: 2,
				common.RespMsg:  "批量删除出错:" + err.Error(),
			})
			return
		}
	}

	//dbase.IncTableVer(ormer, modelName)

	deleteModelCache(modelName, c)
	deleteRelateModelCache(c)

	c.JSON(http.StatusOK, gin.H{
		common.RespCode: 0,
		common.RespMsg:  "操作成功",
	})
	return
}

func SaveEntities(c *gin.Context) {
	var modelName = c.Param("modelName")

	var data = c.PostForm(common.ReqData)
	//beego.BeeLogger.Error("log------------------------=%v", data)

	var entities = common.CreateModels(modelName)
	var insertEntities = common.CreateModels(modelName)

	if err := json.Unmarshal([]byte(data), entities); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "json数组解析出错",
		})
		return
	}

	var ormer = dbase.NewOrm()
	var dbEntityIds = make([]string, 0, 100)
	var idParams []orm.ParamsList
	_, err := ormer.Raw("select id  from " + modelName).ValuesList(&idParams)
	for _, idParam := range idParams {
		if len(idParam) > 0 {
			dbEntityIds = append(dbEntityIds, idParam[0].(string))
		}
	}

	sind := reflect.Indirect(reflect.ValueOf(entities))
	insertsind := reflect.Indirect(reflect.ValueOf(insertEntities))

	err = ormer.Begin()
	if err != nil {
		beego.BeeLogger.Error("restapi.SaveEntities@ormer.Begin(), err=%v", err)
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 2,
			common.RespMsg:  "事务初始化失败",
		})

		return //====>>>>
	}

	defer func() {
		if e := recover(); e != nil {
			fmt.Println(e)
			ormer.Rollback()

			c.JSON(http.StatusOK, gin.H{
				common.RespCode: 2,
				common.RespMsg:  fmt.Sprintf("%v", e),
			})
		} else {
			ormer.Commit()

			c.JSON(http.StatusOK, gin.H{
				common.RespCode: 0,
				common.RespMsg:  "操作成功",
			})
		}
	}()

	for i := 0; i < sind.Len(); i++ {
		ind := sind.Index(i)
		fieldId := reflect.Indirect(ind).FieldByName("Id")
		id := fieldId.String()

		if isok, _ := common.StrArrayContains(dbEntityIds, id); isok {
			ormer.Update(reflect.Indirect(ind).Addr().Interface())
		} else {
			insertsind = reflect.Append(insertsind, ind)
		}
	}

	if insertsind.Len() > 0 {
		_, err = ormer.InsertMulti(common.KBatchPostCount, insertsind.Interface())
	}

	if err != nil {
		//c.JSON(http.StatusOK, gin.H{
		//	common.RespCode:2,
		//	common.RespMsg: err.Error(),
		//})
		panic(err)
	}

	//dbase.IncTableVer(ormer, modelName)

	deleteModelCache(modelName, c)
	deleteRelateModelCache(c)

	return
}

func CreateEntities(c *gin.Context) {
	var modelName = c.Param("modelName")

	var data = c.PostForm(common.ReqData)

	var entities = common.CreateModels(modelName)

	if err := json.Unmarshal([]byte(data), entities); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "json数组解析出错",
		})
		return
	}

	var ormer = dbase.NewOrm()
	_, err := ormer.InsertMulti(common.KBatchPostCount, entities)

	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 2,
			common.RespMsg:  err.Error(),
		})
		return
	}

	//dbase.IncTableVer(ormer, modelName)

	deleteModelCache(modelName, c)
	deleteRelateModelCache(c)

	c.JSON(http.StatusOK, gin.H{
		common.RespCode: 0,
		common.RespMsg:  "操作成功",
	})
	return
}

func CreateEntity(c *gin.Context) {
	var modelName = c.Param("modelName")

	var data = c.PostForm(common.ReqData)

	var entity = common.CreateModel(modelName)

	if err := json.Unmarshal([]byte(data), entity); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "json数组解析出错",
		})
		return
	}

	var ormer = dbase.NewOrm()
	_, err := ormer.Insert(entity)

	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 2,
			common.RespMsg:  err.Error(),
		})
		return
	}

	//dbase.IncTableVer(ormer, modelName)

	deleteModelCache(modelName, c)
	deleteRelateModelCache(c)

	c.JSON(http.StatusOK, gin.H{
		common.RespCode: 0,
		common.RespMsg:  "操作成功",
	})
	return
}

func RetrievEntity(c *gin.Context) {
	var modelName = c.Param("modelName")

	var data = c.PostForm(common.ReqData)
	var entityId = data

	var entity interface{} = nil
	if dbase.MemCacheIsExist(modelName, entityId) {
		entity = dbase.MemCacheGet(modelName, entityId)
	}

	if entity == nil {
		entity = common.CreateModel(modelName)

		entv := reflect.ValueOf(entity).Elem()
		entv.FieldByName("Id").SetString(entityId)

		var ormer = dbase.NewOrm()

		err := ormer.Read(entity)

		if err != nil {
			c.JSON(http.StatusOK, gin.H{
				common.RespCode: 2,
				common.RespMsg:  err.Error(),
			})
			return
		}

		dbase.MemCachePut(modelName, findProjectIdByFrom(c), entityId, entity)
	}

	var content = ""
	if ret, err := json.Marshal(entity); err == nil {
		content = string(ret)
	}

	c.JSON(http.StatusOK, gin.H{
		common.RespCode:    0,
		common.RespMsg:     "操作成功",
		common.RespContent: content,
	})
}

func UpdateEntity(c *gin.Context) {
	var modelName = c.Param("modelName")

	var data = c.PostForm(common.ReqData)
	var reqUpdateCol = c.PostForm(common.ReqUpdateCol)

	var dataMap = make(map[string]interface{})

	if err := json.Unmarshal([]byte(data), &dataMap); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "json数组解析出错",
		})
		return
	}

	var dbentity = common.CreateModel(modelName)

	var entityId string = ""
	if idv, isok := dataMap["Id"]; isok {
		entityId = idv.(string)
	}

	var ormer = dbase.NewOrm()

	dbentv := reflect.ValueOf(dbentity).Elem()
	dbentv.FieldByName("Id").SetString(entityId)

	ormer.Read(dbentity)

	//if entv.FieldByName("Ver").Int() < dbentv.FieldByName("Ver").Int(){
	//	c.JSON(http.StatusOK, gin.H{
	//		common.RespCode:1,
	//		common.RespMsg: "提交数据版本已过期，请重新提交",
	//	})
	//	return
	//}

	rvalue := reflect.ValueOf(dbentity)
	entObj := reflect.Indirect(rvalue)
	entType := reflect.TypeOf(dbentity)

	reqUpdateCols := strings.Split(reqUpdateCol, ",")
	for _, filedName := range reqUpdateCols {
		filedValue := dataMap[filedName]
		common.ReflectSetValue(entType, entObj, filedName, filedValue)
	}

	//entVer := entv.FieldByName("Ver").Int()
	//entv.FieldByName("Ver").SetInt(entVer+1)

	_, err := ormer.Update(dbentity)

	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 2,
			common.RespMsg:  err.Error(),
		})
		return
	}

	//dbase.IncTableVer(ormer, modelName)

	deleteModelCache(modelName, c)
	deleteRelateModelCache(c)

	c.JSON(http.StatusOK, gin.H{
		common.RespCode: 0,
		common.RespMsg:  "操作成功",
	})
	return
}

func GetEntities(c *gin.Context) {
	var modelName = c.Param("modelName")

	var entities interface{} = nil
	if dbase.MemCacheIsExist(modelName, "all") {
		entities = dbase.MemCacheGet(modelName, "all")
	}

	if entities == nil {
		entities = common.CreateModels(modelName)

		var ormer = dbase.NewOrm()
		var query = ormer.QueryTable(modelName)

		_, err := query.All(entities)

		if err != nil {
			c.JSON(http.StatusOK, gin.H{
				common.RespCode: 2,
				common.RespMsg:  err.Error(),
			})
			return
		}

		dbase.MemCachePut(modelName, findProjectIdByFrom(c), "all", entities)
	}

	var content = ""
	if ret, err := json.Marshal(entities); err == nil {
		content = string(ret)
	}

	c.JSON(http.StatusOK, gin.H{
		common.RespCode:    0,
		common.RespMsg:     "操作成功",
		common.RespContent: content,
	})
	return
}

func DeleteEntity(c *gin.Context) {
	var modelName = c.Param("modelName")

	var data = c.PostForm(common.ReqData)

	var entityId = data

	var ormer = dbase.NewOrm()

	var entity = common.CreateModel(modelName)

	entv := reflect.ValueOf(entity).Elem()
	entv.FieldByName("Id").SetString(entityId)

	if _, err := ormer.Delete(entity); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 2,
			common.RespMsg:  err.Error(),
		})
		return
	}

	//dbase.IncTableVer(ormer, modelName)

	deleteModelCache(modelName, c)
	deleteRelateModelCache(c)

	c.JSON(http.StatusOK, gin.H{
		common.RespCode: 0,
		common.RespMsg:  "操作成功",
	})
	return
}

type QueryCond struct {
	Key   string
	Value string
}

func QueryEntities(c *gin.Context) {
	var modelName = c.Param("modelName")

	var data = c.PostForm(common.ReqData)
	queryConds := make([]*QueryCond, 0)

	if err := json.Unmarshal([]byte(data), &queryConds); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "json数组解析出错",
		})
		return
	}

	sortstr := make([]string, 0)
	for _, cond := range queryConds {
		sortstr = append(sortstr, cond.Key)
		sortstr = append(sortstr, cond.Value)
	}
	sort.Strings(sortstr)
	ckey := strings.Join(sortstr, "-")

	var entities interface{} = nil

	if dbase.MemCacheIsExist(modelName, ckey) {
		entities = dbase.MemCacheGet(modelName, ckey)
	}

	if entities == nil {
		var ormer = dbase.NewOrm()
		var query = ormer.QueryTable(modelName)

		for _, cond := range queryConds {
			if strings.HasPrefix(cond.Value, "[") && strings.HasSuffix(cond.Value, "]") {
				condValues := make([]interface{}, 0)
				if err := json.Unmarshal([]byte(cond.Value), &condValues); err == nil {
					query = query.Filter(cond.Key+"__in", condValues...)
				} else {
					query = query.Filter(cond.Key, cond.Value)
				}
			} else {
				query = query.Filter(cond.Key, cond.Value)
			}
		}

		entities = common.CreateModels(modelName)

		_, err := query.All(entities)

		if err != nil {
			c.JSON(http.StatusOK, gin.H{
				common.RespCode: 2,
				common.RespMsg:  err.Error(),
			})
			return
		}

		dbase.MemCachePut(modelName, findProjectIdByFrom(c), ckey, entities)

	}

	var content = ""
	if ret, err := json.Marshal(entities); err == nil {
		content = string(ret)
	}

	c.JSON(http.StatusOK, gin.H{
		common.RespCode:    0,
		common.RespMsg:     "操作成功",
		common.RespContent: content,
	})
	return
}

func DeleteByCond(c *gin.Context) {
	var modelName = c.Param("modelName")
	var data = c.PostForm(common.ReqData)

	queryConds := make([]*QueryCond, 0)

	if err := json.Unmarshal([]byte(data), &queryConds); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "json数组解析出错",
		})
		return
	}

	if len(queryConds) == 0 {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "empty delete condition",
		})
		return
	}

	var ormer = dbase.NewOrm()
	var sql = "delete from " + modelName + " where 1=1 "

	for _, cond := range queryConds {
		condKey := cond.Key
		condVal := cond.Value

		condKey = strings.Replace(condKey, "'", "", -1)
		condKey = strings.Replace(condKey, "--", "", -1)

		condVal = strings.Replace(condVal, "'", "", -1)
		condVal = strings.Replace(condVal, "--", "", -1)

		sql += " and " + condKey + "='" + condVal + "' "
	}

	_, err := ormer.Raw(sql).Exec()

	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 2,
			common.RespMsg:  err.Error(),
		})
		return
	}

	deleteModelCache(modelName, c)
	deleteRelateModelCache(c)

	c.JSON(http.StatusOK, gin.H{
		common.RespCode: 0,
		common.RespMsg:  "操作成功",
	})
	return
}

type EntityBatchOp struct {
	ModelName        string
	CreateEntities   [](map[string]interface{})
	UpdateEntities   [](map[string]interface{})
	DataUpdateColumn string
	DataDeleteColumn string
	DeleteByIds      []string
	DeleteByFields   []string
}

func BatchSaveEntities(c *gin.Context) {
	var data = c.PostForm(common.ReqData)
	if gin.IsDebugging() {
		fmt.Println(data)
	}

	var entityOps = make([]EntityBatchOp, 0)

	//先转换成map
	if err := json.Unmarshal([]byte(data), &entityOps); err != nil {
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 1,
			common.RespMsg:  "json数组解析出错",
		})
		return
	}

	var ormer = dbase.NewOrm()

	//执行数据库操作
	err := ormer.Begin()
	if err != nil {
		beego.BeeLogger.Error("restapi.BatchSaveEntities@ormer.Begin(), err=%v", err)
		c.JSON(http.StatusOK, gin.H{
			common.RespCode: 2,
			common.RespMsg:  "事务初始化失败",
		})

		return //====>>>>
	}

	defer func() {
		if e := recover(); e != nil {
			fmt.Println(e)
			ormer.Rollback()

			c.JSON(http.StatusOK, gin.H{
				common.RespCode: 2,
				common.RespMsg:  fmt.Sprintf("%v", e),
			})
		} else {
			ormer.Commit()

			c.JSON(http.StatusOK, gin.H{
				common.RespCode: 0,
				common.RespMsg:  "操作成功",
			})
		}
	}()

	for _, entityOp := range entityOps {
		reqUpdateCols := strings.Split(entityOp.DataUpdateColumn, ",")
		//更新数据
		if len(entityOp.UpdateEntities) > 0 {
			var dbentity = common.CreateModel(entityOp.ModelName)
			for _, updateEntMap := range entityOp.UpdateEntities {
				rvalue := reflect.ValueOf(dbentity)
				dbentv := reflect.Indirect(rvalue)
				entType := reflect.TypeOf(dbentity)

				dbentv.FieldByName("Id").SetString(updateEntMap["Id"].(string))

				ormer.Read(dbentity)

				for _, filedName := range reqUpdateCols {
					filedValue := updateEntMap[filedName]
					common.ReflectSetValue(entType, dbentv, filedName, filedValue)
				}
				_, err = ormer.Update(dbentity)

				if err != nil {
					panic(err)
				}
			}
		}

		if len(entityOp.CreateEntities) > 0 {
			var addentities = common.CreateModels(entityOp.ModelName)
			var addentitiesVal = reflect.Indirect(reflect.ValueOf(addentities))
			for _, addEntMap := range entityOp.CreateEntities {
				addentity := common.CreateModel(entityOp.ModelName)
				rvalue := reflect.ValueOf(addentity)
				addentv := reflect.Indirect(rvalue)

				common.ReflectSetEntity(reflect.TypeOf(addentity), addentv, addEntMap, false)

				addentitiesVal = reflect.Append(addentitiesVal, addentv)
			}

			_, err = ormer.InsertMulti(common.KBatchPostCount, addentitiesVal.Interface())
			if err != nil {
				panic(err)
			}
		}

		if len(entityOp.DeleteByIds) > 0 {
			//var dbentity = common.CreateModel(entityOp.ModelName)
			_, err = dbase.DeleteMulti(ormer, entityOp.ModelName, "id", entityOp.DeleteByIds)
			if err != nil {
				panic(err)
			}
		}

		if len(entityOp.DeleteByFields) > 0 && entityOp.DataDeleteColumn != "" {
			_, err = ormer.QueryTable(entityOp.ModelName).Filter(entityOp.DataDeleteColumn+"__in", entityOp.DeleteByFields).Delete()
			if err != nil {
				panic(err)
			}
		}

		deleteModelCache(entityOp.ModelName, c)
	}

	deleteRelateModelCache(c)

	UploadImages(c)
}
