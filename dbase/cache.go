package dbase

import (
	"sync"

	"github.com/astaxie/beego/cache"
	"github.com/liumingmin/decoratecloud/common"
)

var gMemCacheMgr cache.Cache
var gModelNameCondCacheMap map[string](map[string]bool) = make(map[string](map[string]bool))
var gModelCondMapMutex = new(sync.Mutex)

func init() {
	gMemCacheMgr, _ = cache.NewCache("memory", `{"interval":60}`)
	//host,port,password,poolsize :=common.GetRedisConf()
	//var err error
	//connstr := fmt.Sprintf(`{"key":"datacache","conn":"%s:%s","dbNum":"%d","password":"%s"}`,host,port,poolsize,password)
	//gMemCacheMgr, err = cache.NewCache("redis", connstr)
	//
	//if err!= nil{
	//	fmt.Println(err.Error())
	//}
}

func MemCacheGet(tkey string, ckey string) interface{} {
	return gMemCacheMgr.Get(tkey + common.Md5Hash(ckey))
}

func MemCachePut(modelName string, projectId string, ckey string, val interface{}) error {
	md5ckey := common.Md5Hash(ckey)

	gModelCondMapMutex.Lock()
	defer gModelCondMapMutex.Unlock()

	conds, isok := gModelNameCondCacheMap[modelName+projectId]

	if !isok {
		conds = make(map[string]bool)
	}

	conds[modelName+md5ckey] = true
	gModelNameCondCacheMap[modelName+projectId] = conds

	//beego.BeeLogger.Error("putkey=%v", tkey+"-"+ckey)

	return gMemCacheMgr.Put(modelName+md5ckey, val, 60)
}

func MemCachePutQuery(modelNames []string, projectId string, qkey string, ckey string, val interface{}) error {
	md5ckey := common.Md5Hash(ckey)

	gModelCondMapMutex.Lock()
	defer gModelCondMapMutex.Unlock()

	for _, modelName := range modelNames {
		if modelName == "" {
			continue
		}

		conds, isok := gModelNameCondCacheMap[modelName+projectId]
		if !isok {
			conds = make(map[string]bool)
		}

		conds[qkey+md5ckey] = true
		gModelNameCondCacheMap[modelName+projectId] = conds
	}

	return gMemCacheMgr.Put(qkey+md5ckey, val, 60)
}

//func MemCacheDelete(tkey string, ckey string) error{
//	return gMemCacheMgr.Delete(tkey+common.Md5Hash(ckey))
//}

func MemCacheDeleteMulti(modelName string, projectId string) error {
	gModelCondMapMutex.Lock()
	defer gModelCondMapMutex.Unlock()

	if conds, isok := gModelNameCondCacheMap[modelName+projectId]; isok {
		for cond := range conds {
			gMemCacheMgr.Delete(cond)
		}

		delete(gModelNameCondCacheMap, modelName+projectId)
	}

	return nil
}

//goble
func MemCacheDeleteMulti2(modelName string) error {
	return MemCacheDeleteMulti(modelName, "")
}

func MemCacheIsExist(tkey string, ckey string) bool {
	return gMemCacheMgr.IsExist(tkey + common.Md5Hash(ckey))
}
