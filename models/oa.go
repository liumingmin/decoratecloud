package models

import (
	"time"
)

type OaNotice struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	OrderNo      int       `orm:"null;default(0);"`
	Title        string    `orm:"null;size(255);"`
	Content      string    `orm:"null;type(text);"`
	HadView      int       `orm:"null;default(0);"`
	NeedView     int       `orm:"null;default(0);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type OaNoticeLink struct {
	Id        string `orm:"size(32);pk;"`
	NoticeId  string `orm:"null;size(32);index;"`
	UserId    string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
	IsView    int    `orm:"null;default(0);"`
	Ver       int    `orm:"null;default(1);"`
}

type OaNoticeComment struct {
	Id         string    `orm:"size(32);pk;"`
	NoticeId   string    `orm:"null;size(32);index;"`
	UserId     string    `orm:"null;size(32);index;"`
	ProjectId  string    `orm:"null;size(32);index;"`
	Content    string    `orm:"null;type(text);"`
	CreateDate time.Time `orm:"null;type(datetime);auto_now_add;"`
	Ver        int       `orm:"null;default(1);"`
}

type OaTask struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	OrderNo      int       `orm:"null;default(0);"`
	Priority     int       `orm:"null;default(0);"`
	Status       int       `orm:"null;default(0);"`
	Title        string    `orm:"null;size(255);"`
	Content      string    `orm:"null;type(text);"`
	ExpireDate   time.Time `orm:"null;type(datetime);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type OaTaskLink struct {
	Id        string `orm:"size(32);pk;"`
	TaskId    string `orm:"null;size(32);index;"`
	UserId    string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
	Kind      int    `orm:"null;default(0);"` //执行 督办
	IsView    int    `orm:"null;default(0);"`
	Ver       int    `orm:"null;default(1);"`
}

type OaTaskFeedback struct {
	Id         string    `orm:"size(32);pk;"`
	TaskId     string    `orm:"null;size(32);index;"`
	UserId     string    `orm:"null;size(32);index;"`
	ProjectId  string    `orm:"null;size(32);index;"`
	Kind       int       `orm:"null;default(0);"` //执行 督办
	CreateDate time.Time `orm:"null;type(datetime);auto_now_add;"`
	Progress   string    `orm:"null;size(32);index;"`
	Content    string    `orm:"null;type(text);"`
	Ver        int       `orm:"null;default(1);"`
}

type OaWorkReport struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	OrderNo      int       `orm:"null;default(0);"`
	Status       int       `orm:"null;default(0);"`
	Title        string    `orm:"null;size(255);"`
	Content      string    `orm:"null;type(text);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type OaWorkReportLink struct {
	Id           string `orm:"size(32);pk;"`
	WorkReportId string `orm:"null;size(32);index;"`
	Kind         int    `orm:"null;default(0);"` //0汇报对象 1抄送
	UserId       string `orm:"null;size(32);index;"`
	ProjectId    string `orm:"null;size(32);index;"`
	Ver          int    `orm:"null;default(1);"`
}

type OaWorkReportComment struct {
	Id           string    `orm:"size(32);pk;"`
	WorkReportId string    `orm:"null;size(32);index;"`
	UserId       string    `orm:"null;size(32);index;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	Content      string    `orm:"null;type(text);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	Ver          int       `orm:"null;default(1);"`
}

type OaAppLeave struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	ProcessId    string    `orm:"null;size(32);index;"`
	Status       int       `orm:"null;default(0);"` // 0 草稿 1审批中 2审批通过 3退回 4作废
	OrderNo      int       `orm:"null;default(0);"`
	Kind         int       `orm:"null;default(0);"`
	StartTime    time.Time `orm:"null;type(datetime);"`
	EndTime      time.Time `orm:"null;type(datetime);"`
	Reseaon      string    `orm:"null;size(255);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
	//流程实例ID
}

//实例？

//流程节点
type OaAppLeaveNode struct {
	//流程实例ID
	Id        string `orm:"size(64);pk;"`
	LeaveId   string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
	OrderNo   int    `orm:"null;default(0);"`
	UserId    string `orm:"null;size(32);index;"`
	Kind      int    `orm:"null;default(0);"` //0 node 1 end
	Token     int    `orm:"null;default(0);"` //0 no 1 get
	Done      int    `orm:"null;default(0);"` //0 no 1 done
	Msg       string `orm:"null;size(255);"`
	Remark    string `orm:"null;size(255);"`
}

type OaAppLeaveLink struct {
	Id        string `orm:"size(32);pk;"`
	LeaveId   string `orm:"null;size(32);index;"`
	UserId    string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
}

type OaAppTravel struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	ProcessId    string    `orm:"null;size(32);index;"`
	Status       int       `orm:"null;default(0);"` // 0 草稿 1审批中 2审批通过 3退回 4作废
	OrderNo      int       `orm:"null;default(0);"`
	Kind         int       `orm:"null;default(0);"`
	StartTime    time.Time `orm:"null;type(datetime);"`
	EndTime      time.Time `orm:"null;type(datetime);"`
	Address      string    `orm:"null;size(255);"`
	Reseaon      string    `orm:"null;size(255);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type OaAppTravelNode struct {
	Id        string `orm:"size(64);pk;"`
	TravelId  string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
	OrderNo   int    `orm:"null;default(0);"`
	UserId    string `orm:"null;size(32);index;"`
	Kind      int    `orm:"null;default(0);"` //0 node 1 end
	Token     int    `orm:"null;default(0);"` //0 no 1 get
	Done      int    `orm:"null;default(0);"` //0 no 1 done
	Msg       string `orm:"null;size(255);"`
	Remark    string `orm:"null;size(255);"`
}

type OaAppTravelLink struct {
	Id        string `orm:"size(32);pk;"`
	TravelId  string `orm:"null;size(32);index;"`
	UserId    string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
}

type OaAppOut struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	ProcessId    string    `orm:"null;size(32);index;"`
	Status       int       `orm:"null;default(0);"` // 0 草稿 1审批中 2审批通过 3退回 4作废
	OrderNo      int       `orm:"null;default(0);"`
	Kind         int       `orm:"null;default(0);"`
	StartTime    time.Time `orm:"null;type(datetime);"`
	EndTime      time.Time `orm:"null;type(datetime);"`
	Address      string    `orm:"null;size(255);"`
	Reseaon      string    `orm:"null;size(255);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type OaAppOutNode struct {
	Id        string `orm:"size(64);pk;"`
	OutId     string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
	OrderNo   int    `orm:"null;default(0);"`
	UserId    string `orm:"null;size(32);index;"`
	Kind      int    `orm:"null;default(0);"` //0 node 1 end
	Token     int    `orm:"null;default(0);"` //0 no 1 get
	Done      int    `orm:"null;default(0);"` //0 no 1 done
	Msg       string `orm:"null;size(255);"`
	Remark    string `orm:"null;size(255);"`
}

type OaAppOutLink struct {
	Id        string `orm:"size(32);pk;"`
	OutId     string `orm:"null;size(32);index;"`
	UserId    string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
}

type OaExpenseCategory struct {
	Id        string `orm:"size(32);pk;"`
	ProjectId string `orm:"null;size(32);index;"`
	OrderNo   int    `orm:"null;default(0);"`
	Name      string `orm:"null;size(32);"`
}

type OaAppExpense struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	ProcessId    string    `orm:"null;size(32);index;"`
	Status       int       `orm:"null;default(0);"` // 0 草稿 1审批中 2审批通过 3退回 4作废
	OrderNo      int       `orm:"null;default(0);"`
	Kind         int       `orm:"null;default(0);"`
	CategoryId   string    `orm:"null;size(32);index;"`
	Amount       float64   `orm:"null;default(0);"`
	Reseaon      string    `orm:"null;size(255);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type OaAppExpenseNode struct {
	Id        string `orm:"size(64);pk;"`
	ExpenseId string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
	OrderNo   int    `orm:"null;default(0);"`
	UserId    string `orm:"null;size(32);index;"`
	Kind      int    `orm:"null;default(0);"` //0 node 1 end
	Token     int    `orm:"null;default(0);"` //0 no 1 get
	Done      int    `orm:"null;default(0);"` //0 no 1 done
	Msg       string `orm:"null;size(255);"`
	Remark    string `orm:"null;size(255);"`
}

type OaAppExpenseLink struct {
	Id        string `orm:"size(32);pk;"`
	ExpenseId string `orm:"null;size(32);index;"`
	UserId    string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
}

type OaAppPurchase struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	ProcessId    string    `orm:"null;size(32);index;"`
	Status       int       `orm:"null;default(0);"` // 0 草稿 1审批中 2审批通过 3退回 4作废
	OrderNo      int       `orm:"null;default(0);"`
	Kind         int       `orm:"null;default(0);"`
	Name         string    `orm:"null;size(255);"`
	Norm         string    `orm:"null;size(255);"`
	Qty          float64   `orm:"null;default(0);"`
	HandTime     time.Time `orm:"null;type(datetime);"`
	Reseaon      string    `orm:"null;size(255);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type OaAppPurchaseNode struct {
	Id         string `orm:"size(64);pk;"`
	PurchaseId string `orm:"null;size(32);index;"`
	ProjectId  string `orm:"null;size(32);index;"`
	OrderNo    int    `orm:"null;default(0);"`
	UserId     string `orm:"null;size(32);index;"`
	Kind       int    `orm:"null;default(0);"` //0 node 1 end
	Token      int    `orm:"null;default(0);"` //0 no 1 get
	Done       int    `orm:"null;default(0);"` //0 no 1 done
	Msg        string `orm:"null;size(255);"`
	Remark     string `orm:"null;size(255);"`
}

type OaAppPurchaseLink struct {
	Id         string `orm:"size(32);pk;"`
	PurchaseId string `orm:"null;size(32);index;"`
	UserId     string `orm:"null;size(32);index;"`
	ProjectId  string `orm:"null;size(32);index;"`
}

type OaAppApproves struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	ProcessId    string    `orm:"null;size(32);index;"`
	Status       int       `orm:"null;default(0);"` // 0 草稿 1审批中 2审批通过 3退回 4作废
	OrderNo      int       `orm:"null;default(0);"`
	Kind         int       `orm:"null;default(0);"`
	Content      string    `orm:"null;size(255);"`
	Reseaon      string    `orm:"null;size(255);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type OaAppApprovesNode struct {
	Id         string `orm:"size(64);pk;"`
	ApprovesId string `orm:"null;size(32);index;"`
	ProjectId  string `orm:"null;size(32);index;"`
	OrderNo    int    `orm:"null;default(0);"`
	UserId     string `orm:"null;size(32);index;"`
	Kind       int    `orm:"null;default(0);"` //0 node 1 end
	Token      int    `orm:"null;default(0);"` //0 no 1 get
	Done       int    `orm:"null;default(0);"` //0 no 1 done
	Msg        string `orm:"null;size(255);"`
	Remark     string `orm:"null;size(255);"`
}

type OaAppApprovesLink struct {
	Id         string `orm:"size(32);pk;"`
	ApprovesId string `orm:"null;size(32);index;"`
	UserId     string `orm:"null;size(32);index;"`
	ProjectId  string `orm:"null;size(32);index;"`
}

type OaAttendance struct {
	Id           string    `orm:"size(32);pk;"`
	UserId       string    `orm:"null;size(32);index;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	StartTime    time.Time `orm:"null;type(datetime);auto_now_add;"`
	StartLon     float64   `orm:"null;default(0);"`
	StartLat     float64   `orm:"null;default(0);"`
	StartPhoto   string    `orm:"null;size(32);"`
	StartAddress string    `orm:"null;size(255);"`
	Kind         int       `orm:"null;default(0);"` //0还在上班 1已下班
	EndTime      time.Time `orm:"null;type(datetime);auto_now;"`
	EndLon       float64   `orm:"null;default(0);"`
	EndLat       float64   `orm:"null;default(0);"`
	EndPhoto     string    `orm:"null;size(32);"`
	EndAddress   string    `orm:"null;size(255);"`
}

type OaSignInPath struct {
	Id               string    `orm:"size(32);pk;"`
	UserId           string    `orm:"null;size(32);index;"`
	ProjectId        string    `orm:"null;size(32);index;"`
	SignInLocationId string    `orm:"null;size(32);index;"`
	Kind             int       `orm:"null;default(0);"` //0上报位置 1签到 2签退 3外勤
	SignTime         time.Time `orm:"null;type(datetime);auto_now_add;"`
	Lon              float64   `orm:"null;default(0);"`
	Lat              float64   `orm:"null;default(0);"`
	Offset           float64   `orm:"null;default(0);"`
	Address          string    `orm:"null;size(255);"`
	Remark           string    `orm:"null;size(255);"`
}
