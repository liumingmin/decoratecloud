package dbase

import (
	"strings"

	"github.com/liumingmin/decoratecloud/models"
	"gopkg.in/mikespook/gorbac.v2"
)

type McPermission struct {
	gorbac.StdPermission
	SysPerm *models.SysModule
}

func NewMcPermission(sysPerm *models.SysModule) *McPermission {
	mcPerm := &McPermission{StdPermission: gorbac.StdPermission{sysPerm.Id}, SysPerm: sysPerm}

	return mcPerm
}

type McRole struct {
	gorbac.StdRole
	SysRole *models.SysRole
}

func NewMcRole(sysRole *models.SysRole) *McRole {
	stdRole := gorbac.NewStdRole(sysRole.Id)

	role := &McRole{StdRole: *stdRole, SysRole: sysRole}

	return role
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var gRbac = gorbac.New()
var gPermUrlMap = make(map[string]*McPermission)

func InitRabc() {
	ormer := NewOrm()

	var rolesMap = make(map[string]*McRole)
	var roles []*models.SysRole
	ormer.QueryTable("SysRole").All(&roles)

	for _, role := range roles {
		mcRole := NewMcRole(role)
		rolesMap[role.Id] = mcRole

		gRbac.Add(mcRole)
	}

	var permsMap = make(map[string]*McPermission)
	var perms []*models.SysModule
	ormer.QueryTable("SysModule").All(&perms)
	for _, perm := range perms {
		mcPerm := NewMcPermission(perm)
		permsMap[perm.Id] = mcPerm

		gPermUrlMap[perm.Url] = mcPerm
	}

	var rolePerms []*models.SysRoleModule
	ormer.QueryTable("SysRoleModule").All(&rolePerms)

	for _, rolePerm := range rolePerms {
		if perm, isok := permsMap[rolePerm.ModuleId]; isok {
			if role, isok := rolesMap[rolePerm.RoleId]; isok {
				//permobj := *perm
				role.Assign(perm)
			}
		}
	}
}

func CreateRole(role *models.SysRole) {
	ormer := NewOrm()

	_, err := ormer.Insert(role)
	if err == nil {
		mcRole := NewMcRole(role)
		gRbac.Add(mcRole)
	}
}

func EditRole(role *models.SysRole) {
	ormer := NewOrm()
	ormer.Update(role)
}

func DeleteRole(roleId string) error {
	ormer := NewOrm()
	role := &models.SysRole{Id: roleId}
	if _, err := ormer.Delete(role); err == nil {
		gRbac.Remove(roleId)
		return err
	}
	return nil
}

func GrantRoleModule(mcRole *McRole, perms *[]*models.SysModule) {
	for _, perm := range *perms {
		mcPerm := NewMcPermission(perm)
		mcRole.Assign(mcPerm)
	}
}

func RevokeRoleModule(mcRole *McRole, perms *[]*models.SysModule) {
	for _, perm := range *perms {
		mcPerm := NewMcPermission(perm)
		mcRole.Revoke(mcPerm)
	}
}

func RoleIsGranted(roleIdStr string, permurl string) bool {
	roleIds := strings.Split(roleIdStr, ",")
	if perm, isok := gPermUrlMap[permurl]; isok {
		return gorbac.AnyGranted(gRbac, roleIds, perm, nil)
	}

	return true
}
