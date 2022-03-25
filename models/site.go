package models

import (
	"time"
)

type SiteWorkLog struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	LogDate      time.Time `orm:"null;type(datetime);"`
	Title        string    `orm:"null;size(255);"`
	Content      string    `orm:"null;type(text);"`
	Weather      string    `orm:"null;size(255);"`
	Wind         string    `orm:"null;size(255);"`
	Days         int       `orm:"null;default(0);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type SiteWorkLogLink struct {
	Id        string `orm:"size(32);pk;"`
	WorkLogId string `orm:"null;size(32);index;"`
	UserId    string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
	Kind      int    `orm:"null;default(0);"` //
	IsView    int    `orm:"null;default(0);"`
}

type SiteDynamic struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	Title        string    `orm:"null;size(255);"`
	Content      string    `orm:"null;type(text);"`
	Lon          float64   `orm:"null;default(0);"`
	Lat          float64   `orm:"null;default(0);"`
	Address      string    `orm:"null;size(255);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type SiteDynamicLink struct {
	Id        string `orm:"size(32);pk;"`
	DynamicId string `orm:"null;size(32);index;"`
	UserId    string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
	Kind      int    `orm:"null;default(0);"` //0 发布范围/交底对象  1关注人
	IsView    int    `orm:"null;default(0);"`
}

type SiteTellTech struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	Title        string    `orm:"null;size(255);"`
	Content      string    `orm:"null;type(text);"`
	Lon          float64   `orm:"null;default(0);"`
	Lat          float64   `orm:"null;default(0);"`
	Address      string    `orm:"null;size(255);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type SiteTellTechLink struct {
	Id         string `orm:"size(32);pk;"`
	TellTechId string `orm:"null;size(32);index;"`
	UserId     string `orm:"null;size(32);index;"`
	ProjectId  string `orm:"null;size(32);index;"`
	Kind       int    `orm:"null;default(0);"` //0 发布范围/交底对象  1关注人
	IsView     int    `orm:"null;default(0);"`
}

type SiteQtySafe struct {
	Id           string    `orm:"size(32);pk;"`
	ProjectId    string    `orm:"null;size(32);index;"`
	Module       int       `orm:"null;default(0);"` //0质量 1安全
	Title        string    `orm:"null;size(255);"`
	Content      string    `orm:"null;type(text);"`
	Lon          float64   `orm:"null;default(0);"`
	Lat          float64   `orm:"null;default(0);"`
	Address      string    `orm:"null;size(255);"`
	CreateDate   time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate   time.Time `orm:"null;type(datetime);auto_now;"`
	CreateUserId string    `orm:"null;size(36);index;"`
	UpdateUserId string    `orm:"null;size(36);"`
	Remark       string    `orm:"null;size(255);"`
	Ver          int       `orm:"null;default(1);"`
}

type SiteQtySafeLink struct {
	Id        string `orm:"size(32);pk;"`
	QtySafeId string `orm:"null;size(32);index;"`
	UserId    string `orm:"null;size(32);index;"`
	ProjectId string `orm:"null;size(32);index;"`
	Kind      int    `orm:"null;default(0);"` //0 发布范围/质安对象  1关注人
	IsView    int    `orm:"null;default(0);"`
	Module    int    `orm:"null;default(0);"` //0质量 1安全
}

type SiteWorkerKind struct {
	Id          string    `orm:"size(32);pk;"`
	Category    string    `orm:"null;size(255);"`
	SubCategory string    `orm:"null;size(255);"`
	ProjectId   string    `orm:"null;size(32);index;"`
	CreateDate  time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate  time.Time `orm:"null;type(datetime);auto_now;"`
	Ver         int       `orm:"null;default(1);"`
}

type SiteWorkerInfo struct {
	Id         string    `orm:"size(32);pk;"`
	OrderNo    int       `orm:"null;default(0);"`
	ProjectId  string    `orm:"null;size(32);index;"`
	Name       string    `orm:"null;size(255);"`
	IDCard     int       `orm:"null;default(0);"`
	Address    string    `orm:"null;size(255);"`
	PhoneNo    string    `orm:"null;size(11);"`
	EmerPhone  string    `orm:"null;size(11);"`
	Kind       string    `orm:"size(32);"`
	DailyWages float64   `orm:"null;default(0);"`
	IDPhoto    string    `orm:"null;size(255);"`
	CreateDate time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate time.Time `orm:"null;type(datetime);auto_now;"`
	Remark     string    `orm:"null;size(255);"`
	Ver        int       `orm:"null;default(1);"`
}

type SiteWorkerBonus struct {
	Id         string    `orm:"size(32);pk;"`
	OrderNo    int       `orm:"null;default(0);"`
	ProjectId  string    `orm:"null;size(32);index;"`
	UserId     string    `orm:"size(32);"`
	WorkerId   string    `orm:"size(32);"`
	WorkDay    float64   `orm:"null;default(0);"`
	WPDate     time.Time `orm:"null;type(datetime);auto_now_add;"`
	CreateDate time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate time.Time `orm:"null;type(datetime);auto_now;"`
	Ver        int       `orm:"null;default(1);"`
}

type SiteWorkerPay struct {
	Id          string    `orm:"size(32);pk;"`
	WorkerId    string    `orm:"size(32);"`
	UserId      string    `orm:"size(32);"`
	Cost        float64   `orm:"null;default(0);"`
	SettledDate time.Time `orm:"null;type(datetime);auto_now_add;"`
	CreateDate  time.Time `orm:"null;type(datetime);auto_now_add;"`
	UpdateDate  time.Time `orm:"null;type(datetime);auto_now;"`
	Remark      string    `orm:"null;size(255);"`
	IDPhoto     string    `orm:"null;size(255);"`
	Ver         int       `orm:"null;default(1);"`
}
