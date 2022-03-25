package dbase

import (
	"github.com/liumingmin/decoratecloud/common"
	"github.com/liumingmin/decoratecloud/models"
)

func regmodels() {
	common.RegisterModels(
		new(models.Project),
		new(models.ProjectSignInLocation),
		new(models.ProjectJoinRequest),
		new(models.ProjectUserLink),
		new(models.ProjectUserTag),
		new(models.WorkbenchItem),
		new(models.AppRedPoint),
		new(models.AppNotify),
		new(models.Attachment),
		new(models.BpmProcess),
		new(models.BpmProcessLink),
		new(models.BpmNode),
		new(models.SysOpLog),

		new(models.SysUser),
		new(models.SysModule),
		new(models.SysRole),
		new(models.SysUserRoleLink),
		new(models.SysRoleModule),
		//new(models.SysRolePermission),
		//new(models.SysPermission),

		new(models.OaNotice),
		new(models.OaNoticeLink),
		new(models.OaNoticeComment),
		new(models.OaTask),
		new(models.OaTaskLink),
		new(models.OaTaskFeedback),
		new(models.OaWorkReport),
		new(models.OaWorkReportLink),
		new(models.OaWorkReportComment),
		new(models.OaAppLeave),
		new(models.OaAppLeaveNode),
		new(models.OaAppLeaveLink),
		new(models.OaAppTravel),
		new(models.OaAppTravelNode),
		new(models.OaAppTravelLink),
		new(models.OaAppOut),
		new(models.OaAppOutNode),
		new(models.OaAppOutLink),

		new(models.OaExpenseCategory),
		new(models.OaAppExpense),
		new(models.OaAppExpenseNode),
		new(models.OaAppExpenseLink),
		new(models.OaAppPurchase),
		new(models.OaAppPurchaseNode),
		new(models.OaAppPurchaseLink),
		new(models.OaAppApproves),
		new(models.OaAppApprovesNode),
		new(models.OaAppApprovesLink),

		new(models.OaAttendance),
		new(models.OaSignInPath),

		new(models.SiteWorkLog),
		new(models.SiteWorkLogLink),
		new(models.SiteDynamic),
		new(models.SiteDynamicLink),
		new(models.SiteTellTech),
		new(models.SiteTellTechLink),
		new(models.SiteQtySafe),
		new(models.SiteQtySafeLink),

		new(models.SiteWorkerKind),
		new(models.SiteWorkerInfo),
		new(models.SiteWorkerBonus),
		new(models.SiteWorkerPay),
	)
}
