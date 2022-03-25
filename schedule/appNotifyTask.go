package schedule

import (
	"fmt"
	"strings"

	"github.com/astaxie/beego/orm"
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/controllers"
	"github.com/ylywyn/jpush-api-go-client"
)

var gJpushPlatform jpushclient.Platform
var gAppNotifyTaskRuning bool = false

func InitPushInfo() {
	gJpushPlatform.Add(jpushclient.ANDROID)
}

func RunAppNotifyTask() {
	if !gAppNotifyTaskRuning {
		defer func() { gAppNotifyTaskRuning = false }()
		gAppNotifyTaskRuning = true
		sendAppNotify()
	}
}

func sendAppNotify() {
	params := make(map[string]string)
	err, datalist := controllers.QueryLayuiCustom("query_0006", params)

	if err == nil {
		ids := make([]string, 0)
		paramList := datalist.([]orm.Params)
		for _, ent := range paramList {
			userId := ent["UserId"].(string)
			msgContent := ent["SnapContent"].(string)
			module := ent["Module"].(string)
			id := ent["id"].(string)

			ids = append(ids, id)

			if len(userId) == 0 {
				continue
			}

			var ad jpushclient.Audience
			ad.SetAlias([]string{userId})

			extras := make(map[string]interface{})
			extras["Module"] = module

			var notice jpushclient.Notice
			notice.SetAlert(msgContent)
			notice.SetAndroidNotice(&jpushclient.AndroidNotice{Alert: msgContent, Extras: extras})

			//var msg jpushclient.Message
			//msg.Title = "Hello"
			//msg.Content = "你是ylywn"

			payload := jpushclient.NewPushPayLoad()
			payload.SetPlatform(&gJpushPlatform)
			payload.SetAudience(&ad)
			//payload.SetMessage(&msg)
			payload.SetNotice(&notice)
			payload.Options.ApnsProduction = true

			bytes, _ := payload.ToBytes()

			c := jpushclient.NewPushClient(common.JPushSecret, common.JPushAppKey)
			_, err := c.Send(bytes)
			if err != nil {
				fmt.Printf("err:%s", err.Error())
			} else {
				//fmt.Printf("ok:%s", str)
			}
		}

		if len(ids) > 0 {
			execparams := make(map[string]string)
			execparams["Ids"] = "'" + strings.Join(ids, "','") + "'"
			controllers.ExecContentByQueryId("query_9005", execparams, "")
		}

	}
}
