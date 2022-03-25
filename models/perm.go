package models

import (
	"time"
)

type SysUser struct {
	Id            string    `orm:"size(32);pk;"`
	OrderNo       int       `orm:"null;default(0);"`
	UserName      string    `orm:"null;size(64);"`
	RealName      string    `orm:"null;size(64);"`
	Password      string    `orm:"null;size(255);"`
	IsEnable      int       `orm:"null;default(1);"`
	CurrProjectId string    `orm:"null;size(32);"`
	Email         string    `orm:"null;size(255);"`
	Phone         string    `orm:"null;size(64);"`
	Company       string    `orm:"null;size(255);"`
	Position      string    `orm:"null;size(255);"`
	QQ            string    `orm:"null;size(50);"`
	WeiXin        string    `orm:"null;size(50);"`
	Priority      int       `orm:"null;default(0);"`
	RegIp         string    `orm:"null;size(50);"`
	LastLoginIp   string    `orm:"null;size(50);"`
	CreateDate    time.Time `orm:"null;type(date);auto_now_add;"`
	UpdateDate    time.Time `orm:"null;type(date);auto_now;"`
	PictureId     string    `orm:"null;size(32);"`
	Remark        string    `orm:"null;size(255);"`
	Ver           int       `orm:"null;default(1);"`
}

//type SysContact struct {
//    Id  string  `orm:"size(32);pk;"`
//    UserId  string  `orm:"null;size(32);"`
//    UserName  string  `orm:"null;size(64);"`
//    OwnerId  string `orm:"null;size(32);"`
//    OrigKind int `orm:"null;default(0);"` //0手机通信录 1系统
//    OrigId  int `orm:"null;default(0);"`
//    FullName  string  `orm:"null;size(64);"`
//    Phones  string  `orm:"null;size(255);"`//[{'工作': '10086'}]
//    Email  string  `orm:"null;size(255);"`
//    Company  string  `orm:"null;size(255);"`
//    Position  string  `orm:"null;size(255);"`
//    Address  string  `orm:"null;size(255);"`
//    GroupId int `orm:"null;default(0);"`
//    GroupName string  `orm:"null;size(64);"`
//    Remark  string  `orm:"null;size(255);"`
//    CreateDate  time.Time  `orm:"null;type(date);auto_now_add;"`
//    UpdateDate  time.Time  `orm:"null;type(date);auto_now;"`
//    Ver  int  `orm:"null;default(1);"`
//}

type SysRole struct {
	Id         string    `orm:"size(32);pk;"`
	OrderNo    int       `orm:"null;default(0);"`
	Name       string    `orm:"null;size(64);"`
	PermKind   int       `orm:"null;default(0);"` //0模块 1数据
	ClientKind int       `orm:"null;default(0);"` // 0 后台  1前端
	CreateDate time.Time `orm:"null;type(date);auto_now_add;"`
	UpdateDate time.Time `orm:"null;type(date);auto_now;"`
	Remark     string    `orm:"null;size(255);"`
	Ver        int       `orm:"null;default(1);"`
}

type SysUserRoleLink struct {
	Id     string `orm:"size(32);pk;"`
	UserId string `orm:"size(32);index;"`
	RoleId string `orm:"size(32);index;"`
	Ver    int    `orm:"null;default(1);"`
}

type SysModule struct {
	Id         string `orm:"size(32);pk;"`
	Pid        string `orm:"size(32);index;"`
	OrderNo    int    `orm:"null;default(0);"`
	ClientKind int    `orm:"null;default(0);"` // 0 系统管理员后台  1用户后台 2 app前台
	Name       string `orm:"null;size(64);"`
	Url        string `orm:"null;size(255);"` //url
	Ver        int    `orm:"null;default(1);"`
}

type SysRoleModule struct {
	Id       string `orm:"size(32);pk;"`
	RoleId   string `orm:"size(32);index;"`
	ModuleId string `orm:"null;size(64);"`
	Ver      int    `orm:"null;default(1);"`
}

//type SysRolePermission struct {
//    Id  string  `orm:"size(32);pk;"`
//    RoleId  string  `orm:"size(32);index;"`
//    PermId  string  `orm:"null;size(64);"`
//    Ver  int  `orm:"null;default(1);"`
//}

//type SysPermission struct {
//	Id         string `orm:"size(32);pk;"`
//	ModuleId   string `orm:"size(32);index;"`
//	PermKind   int    `orm:"null;default(0);"` //0模块 1数据
//	ClientKind int    `orm:"null;default(0);"` // 0 后台  1前端
//	Name       string `orm:"null;size(64);"`
//	Url        string `orm:"null;size(255);"` //url
//	Ver        int    `orm:"null;default(1);"`
//}
