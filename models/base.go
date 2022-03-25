package models

import (
	"time"
)

type Project struct {
    Id  string  `orm:"size(32);pk;"`
    Name  string  `orm:"null;size(160);"`
    FullName string `orm:"null;size(160);"`
    CreateUserId  string  `orm:"null;size(32);index;"`
    Lon  float64  `orm:"null;default(0);"`
    Lat float64  `orm:"null;default(0);"`
    Owner  string  `orm:"null;size(160);"`
    Designer  string  `orm:"null;size(160);"`
    Constructor  string  `orm:"null;size(160);"`
    Supervisor  string  `orm:"null;size(160);"`
    Date1  time.Time  `orm:"null;type(date);"`
    Date2  time.Time  `orm:"null;type(date);"`
    DuratioinDays  int `orm:"null;default(0);"`
    Fundsrc  int  `orm:"null;default(0);"`
    Kind  int  `orm:"null;default(0);"`
    Structure  int  `orm:"null;default(0);"`
    Address  string  `orm:"null;size(255);"`
    Area  float64  `orm:"null;default(0);"`
    Cost  float64  `orm:"null;default(0);"`
    Descp  string  `orm:"null;size(255);"`
    PictureId  string  `orm:"null;size(32);"`
    Remark  string  `orm:"null;size(255);"`
    SignInStartTime string  `orm:"null;size(32);"`
    SignInEndTime string  `orm:"null;size(32);"`
    SignInDays string  `orm:"null;size(255);default(1,2,3,4,5);"`
    Ver  int  `orm:"null;default(1);"`
}

type ProjectSignInLocation struct {
    Id  string  `orm:"size(32);pk;"`
    ProjectId  string  `orm:"null;size(32);index;"`
    Kind  int  `orm:"null;default(0);"`//
    OrderNo  int  `orm:"null;default(0);"`
    Lon  float64  `orm:"null;default(0);"`
    Lat float64  `orm:"null;default(0);"`
    Range float64  `orm:"null;default(200);"`
    Address  string  `orm:"null;size(255);"`
    CreateUserId  string  `orm:"null;size(32);index;"`
}

type ProjectJoinRequest struct {
    Id  string  `orm:"size(32);pk;"`
    ProjectId  string  `orm:"null;size(32);index;"`
    ProjectUserId  string  `orm:"null;size(32);index;"`
    JoinUserId  string  `orm:"null;size(32);index;"`
    ReqKind  int  `orm:"null;default(0);"` //0申请  1邀请
    Result  int  `orm:"null;default(0);"` //0待处理 -1拒绝 1通过
    Msg  string  `orm:"null;size(255);"`//消息
    RequestTime time.Time  `orm:"null;type(datetime);auto_now_add;"`
    Ver  int  `orm:"null;default(1);"`
}

type ProjectUserLink struct {
    Id  string  `orm:"size(32);pk;"`
    ProjectId  string  `orm:"null;size(32);index;"`
    UserId  string  `orm:"null;size(32);index;"`
    IsOwner int  `orm:"null;default(0);"`
    Ver  int  `orm:"null;default(1);"`
}

type ProjectUserTag struct {
    Id  string  `orm:"size(32);pk;"`
    ProjectId  string  `orm:"null;size(32);index;"`
    UserId  string  `orm:"null;size(32);index;"`
    Tag string  `orm:"null;size(64);index;"`//项目  用户 标签
    Ver  int  `orm:"null;default(1);"`
}

type WorkbenchItem struct {
    Id  string  `orm:"size(64);pk;"`
    ProjectId  string  `orm:"null;size(32);index;"`
    UserId  string  `orm:"null;size(32);index;"`
    Module string  `orm:"null;size(32);"`
    SnapContent string `orm:"null;size(255);"`
    UpdateTime time.Time  `orm:"null;type(datetime);"`
}

type AppRedPoint struct {
    Id  string  `orm:"size(64);pk;"`
    ProjectId  string  `orm:"null;size(32);index;"`
    UserId  string  `orm:"null;size(32);index;"`
    ModuleGroup string  `orm:"null;size(32);"`
    Module string  `orm:"null;size(32);"`
    Kind int `orm:"null;default(0);"`//0我提交的 1 发给我的or抄送(link)  2 给我批的(node) ... 3我执行的 4我督办的(task)
    ModuleKey string  `orm:"null;size(32);index;"`//操作主体
    SnapContent string `orm:"null;size(255);"`
    UpdateTime time.Time  `orm:"null;type(datetime);"`
}

type AppNotify struct {
    Id  string  `orm:"size(64);pk;"`
    ProjectId  string  `orm:"null;size(32);index;"`
    UserId  string  `orm:"null;size(32);index;"`
    Module string  `orm:"null;size(32);"`//只到模块，因为到记录会导致通知太多
    SnapContent string `orm:"null;size(255);"`
    UpdateTime time.Time  `orm:"null;type(datetime);"`
    LastSendTime time.Time  `orm:"null;type(datetime);"`
}

type TableVer struct {
    Id  int64  `orm:"auto;pk;"`
    Name  string  `orm:"null;size(160);"`
    ProjectId  string  `orm:"null;size(32);"`
    Value  int  `orm:"null;default(0);"`
}

type Attachment struct {
    Id  string  `orm:"size(32);pk;"`
    OrderNo  int  `orm:"null;default(0);"`
    ProjectId  string  `orm:"null;size(32);index;"`
    Module  string  `orm:"null;size(60);"`
    OwnerId  string  `orm:"null;size(32);index;"`
    FileName  string  `orm:"null;size(160);"`
    FileId  string  `orm:"null;size(32);index;"`
    Remark  string  `orm:"null;size(255);"`
    CreateDate  time.Time  `orm:"null;type(datetime);auto_now_add;"`
    Ver  int  `orm:"null;default(1);"`
}

type BpmProcess struct {
    Id  string  `orm:"size(32);pk;"`
    ProjectId  string  `orm:"null;size(32);index;"`
    Code  string  `orm:"null;size(32);index;"` //leave travel ...
    Name  string  `orm:"null;size(160);"`
    Remark  string  `orm:"null;size(255);"`
    CreateDate  time.Time  `orm:"null;type(datetime);auto_now_add;"`
}

type BpmProcessLink struct {
    Id  string  `orm:"size(32);pk;"`
    ProjectId  string  `orm:"null;size(32);index;"`
    ProcessId string  `orm:"null;size(32);index;"`
    UserId  string  `orm:"null;size(32);index;"`
}

type BpmNode struct {
    Id  string  `orm:"size(32);pk;"`
    ProjectId  string  `orm:"null;size(32);index;"`
    OrderNo  int  `orm:"null;default(0);"`
    ProcessId string  `orm:"null;size(32);index;"`
    UserId  string  `orm:"null;size(32);index;"`
    Kind  int  `orm:"null;default(0);"`//0 node 1 end
    Remark  string  `orm:"null;size(255);"`
}

type SysOpLog struct {
    Id  string  `orm:"size(32);pk;"`
    Kind  int  `orm:"null;default(0);"`
    SendKind int  `orm:"null;default(0);"`
    ContentKind int  `orm:"null;default(0);"`
    ClientKind  int  `orm:"null;default(0);"`
    ToUsers  string  `orm:"null;type(text);"`
    ClientId  string  `orm:"null;size(32);"`
    UserName  string  `orm:"null;size(32);"`
    Ip  string  `orm:"null;size(32);"`
    Timestamp  int  `orm:"null;default(0);"`
    ProjectId  string  `orm:"null;size(32);"`
    Content  string  `orm:"null;type(text);"`
    CreateDate  time.Time  `orm:"null;type(date);auto_now_add;"`
    Ver  int  `orm:"null;default(1);"`
}

