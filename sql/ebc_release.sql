-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.2.13-MariaDB-log - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 ebc_release 的数据库结构
CREATE DATABASE IF NOT EXISTS `ebc_release` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `ebc_release`;

-- 导出  表 ebc_release.appnotify 结构
CREATE TABLE IF NOT EXISTS `appnotify` (
  `Id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SnapContent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `LastSendTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AppNotify_ProjectId` (`ProjectId`),
  KEY `AppNotify_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.appnotify 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `appnotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `appnotify` ENABLE KEYS */;

-- 导出  表 ebc_release.appredpoint 结构
CREATE TABLE IF NOT EXISTS `appredpoint` (
  `Id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ModuleGroup` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `ModuleKey` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SnapContent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AppRedPoint_ProjectId` (`ProjectId`),
  KEY `AppRedPoint_UserId` (`UserId`),
  KEY `AppRedPoint_ModuleKey` (`ModuleKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.appredpoint 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `appredpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `appredpoint` ENABLE KEYS */;

-- 导出  表 ebc_release.attachment 结构
CREATE TABLE IF NOT EXISTS `attachment` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Module` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OwnerId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileName` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `Attachment_ProjectId` (`ProjectId`),
  KEY `Attachment_OwnerId` (`OwnerId`),
  KEY `Attachment_FileId` (`FileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.attachment 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;

-- 导出  表 ebc_release.bpmnode 结构
CREATE TABLE IF NOT EXISTS `bpmnode` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `ProcessId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `BpmNode_ProjectId` (`ProjectId`),
  KEY `BpmNode_ProcessId` (`ProcessId`),
  KEY `BpmNode_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.bpmnode 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `bpmnode` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpmnode` ENABLE KEYS */;

-- 导出  表 ebc_release.bpmprocess 结构
CREATE TABLE IF NOT EXISTS `bpmprocess` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `BpmProcess_ProjectId` (`ProjectId`),
  KEY `BpmProcess_Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.bpmprocess 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `bpmprocess` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpmprocess` ENABLE KEYS */;

-- 导出  表 ebc_release.bpmprocesslink 结构
CREATE TABLE IF NOT EXISTS `bpmprocesslink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `BpmProcessLink_ProjectId` (`ProjectId`),
  KEY `BpmProcessLink_ProcessId` (`ProcessId`),
  KEY `BpmProcessLink_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.bpmprocesslink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `bpmprocesslink` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpmprocesslink` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappapproves 结构
CREATE TABLE IF NOT EXISTS `oaappapproves` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT 0,
  `OrderNo` int(11) DEFAULT 0,
  `Kind` int(11) DEFAULT 0,
  `Content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reseaon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaAppApproves_ProjectId` (`ProjectId`),
  KEY `OaAppApproves_ProcessId` (`ProcessId`),
  KEY `OaAppApproves_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappapproves 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappapproves` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappapproves` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappapproveslink 结构
CREATE TABLE IF NOT EXISTS `oaappapproveslink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ApprovesId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppApprovesLink_ApprovesId` (`ApprovesId`),
  KEY `OaAppApprovesLink_UserId` (`UserId`),
  KEY `OaAppApprovesLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappapproveslink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappapproveslink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappapproveslink` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappapprovesnode 结构
CREATE TABLE IF NOT EXISTS `oaappapprovesnode` (
  `Id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ApprovesId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `Token` int(11) DEFAULT 0,
  `Done` int(11) DEFAULT 0,
  `Msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppApprovesNode_ApprovesId` (`ApprovesId`),
  KEY `OaAppApprovesNode_ProjectId` (`ProjectId`),
  KEY `OaAppApprovesNode_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappapprovesnode 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappapprovesnode` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappapprovesnode` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappexpense 结构
CREATE TABLE IF NOT EXISTS `oaappexpense` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT 0,
  `OrderNo` int(11) DEFAULT 0,
  `Kind` int(11) DEFAULT 0,
  `CategoryId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Amount` double DEFAULT 0,
  `Reseaon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaAppExpense_ProjectId` (`ProjectId`),
  KEY `OaAppExpense_ProcessId` (`ProcessId`),
  KEY `OaAppExpense_CategoryId` (`CategoryId`),
  KEY `OaAppExpense_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappexpense 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappexpense` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappexpense` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappexpenselink 结构
CREATE TABLE IF NOT EXISTS `oaappexpenselink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ExpenseId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppExpenseLink_ExpenseId` (`ExpenseId`),
  KEY `OaAppExpenseLink_UserId` (`UserId`),
  KEY `OaAppExpenseLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappexpenselink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappexpenselink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappexpenselink` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappexpensenode 结构
CREATE TABLE IF NOT EXISTS `oaappexpensenode` (
  `Id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ExpenseId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `Token` int(11) DEFAULT 0,
  `Done` int(11) DEFAULT 0,
  `Msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppExpenseNode_ExpenseId` (`ExpenseId`),
  KEY `OaAppExpenseNode_ProjectId` (`ProjectId`),
  KEY `OaAppExpenseNode_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappexpensenode 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappexpensenode` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappexpensenode` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappleave 结构
CREATE TABLE IF NOT EXISTS `oaappleave` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT 0,
  `OrderNo` int(11) DEFAULT 0,
  `Kind` int(11) DEFAULT 0,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Reseaon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaAppLeave_ProjectId` (`ProjectId`),
  KEY `OaAppLeave_ProcessId` (`ProcessId`),
  KEY `OaAppLeave_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappleave 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappleave` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappleave` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappleavelink 结构
CREATE TABLE IF NOT EXISTS `oaappleavelink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeaveId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppLeaveLink_LeaveId` (`LeaveId`),
  KEY `OaAppLeaveLink_UserId` (`UserId`),
  KEY `OaAppLeaveLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappleavelink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappleavelink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappleavelink` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappleavenode 结构
CREATE TABLE IF NOT EXISTS `oaappleavenode` (
  `Id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeaveId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `Token` int(11) DEFAULT 0,
  `Done` int(11) DEFAULT 0,
  `Msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppLeaveNode_LeaveId` (`LeaveId`),
  KEY `OaAppLeaveNode_ProjectId` (`ProjectId`),
  KEY `OaAppLeaveNode_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappleavenode 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappleavenode` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappleavenode` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappout 结构
CREATE TABLE IF NOT EXISTS `oaappout` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT 0,
  `OrderNo` int(11) DEFAULT 0,
  `Kind` int(11) DEFAULT 0,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reseaon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaAppOut_ProjectId` (`ProjectId`),
  KEY `OaAppOut_ProcessId` (`ProcessId`),
  KEY `OaAppOut_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappout 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappout` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappout` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappoutlink 结构
CREATE TABLE IF NOT EXISTS `oaappoutlink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OutId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppOutLink_OutId` (`OutId`),
  KEY `OaAppOutLink_UserId` (`UserId`),
  KEY `OaAppOutLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappoutlink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappoutlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappoutlink` ENABLE KEYS */;

-- 导出  表 ebc_release.oaappoutnode 结构
CREATE TABLE IF NOT EXISTS `oaappoutnode` (
  `Id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OutId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `Token` int(11) DEFAULT 0,
  `Done` int(11) DEFAULT 0,
  `Msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppOutNode_OutId` (`OutId`),
  KEY `OaAppOutNode_ProjectId` (`ProjectId`),
  KEY `OaAppOutNode_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaappoutnode 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaappoutnode` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaappoutnode` ENABLE KEYS */;

-- 导出  表 ebc_release.oaapppurchase 结构
CREATE TABLE IF NOT EXISTS `oaapppurchase` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT 0,
  `OrderNo` int(11) DEFAULT 0,
  `Kind` int(11) DEFAULT 0,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Norm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Qty` double DEFAULT 0,
  `HandTime` datetime DEFAULT NULL,
  `Reseaon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaAppPurchase_ProjectId` (`ProjectId`),
  KEY `OaAppPurchase_ProcessId` (`ProcessId`),
  KEY `OaAppPurchase_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaapppurchase 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaapppurchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaapppurchase` ENABLE KEYS */;

-- 导出  表 ebc_release.oaapppurchaselink 结构
CREATE TABLE IF NOT EXISTS `oaapppurchaselink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PurchaseId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppPurchaseLink_PurchaseId` (`PurchaseId`),
  KEY `OaAppPurchaseLink_UserId` (`UserId`),
  KEY `OaAppPurchaseLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaapppurchaselink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaapppurchaselink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaapppurchaselink` ENABLE KEYS */;

-- 导出  表 ebc_release.oaapppurchasenode 结构
CREATE TABLE IF NOT EXISTS `oaapppurchasenode` (
  `Id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PurchaseId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `Token` int(11) DEFAULT 0,
  `Done` int(11) DEFAULT 0,
  `Msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppPurchaseNode_PurchaseId` (`PurchaseId`),
  KEY `OaAppPurchaseNode_ProjectId` (`ProjectId`),
  KEY `OaAppPurchaseNode_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaapppurchasenode 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaapppurchasenode` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaapppurchasenode` ENABLE KEYS */;

-- 导出  表 ebc_release.oaapptravel 结构
CREATE TABLE IF NOT EXISTS `oaapptravel` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT 0,
  `OrderNo` int(11) DEFAULT 0,
  `Kind` int(11) DEFAULT 0,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reseaon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaAppTravel_ProjectId` (`ProjectId`),
  KEY `OaAppTravel_ProcessId` (`ProcessId`),
  KEY `OaAppTravel_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaapptravel 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaapptravel` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaapptravel` ENABLE KEYS */;

-- 导出  表 ebc_release.oaapptravellink 结构
CREATE TABLE IF NOT EXISTS `oaapptravellink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TravelId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppTravelLink_TravelId` (`TravelId`),
  KEY `OaAppTravelLink_UserId` (`UserId`),
  KEY `OaAppTravelLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaapptravellink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaapptravellink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaapptravellink` ENABLE KEYS */;

-- 导出  表 ebc_release.oaapptravelnode 结构
CREATE TABLE IF NOT EXISTS `oaapptravelnode` (
  `Id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TravelId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `Token` int(11) DEFAULT 0,
  `Done` int(11) DEFAULT 0,
  `Msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAppTravelNode_TravelId` (`TravelId`),
  KEY `OaAppTravelNode_ProjectId` (`ProjectId`),
  KEY `OaAppTravelNode_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaapptravelnode 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaapptravelnode` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaapptravelnode` ENABLE KEYS */;

-- 导出  表 ebc_release.oaattendance 结构
CREATE TABLE IF NOT EXISTS `oaattendance` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `StartLon` double DEFAULT 0,
  `StartLat` double DEFAULT 0,
  `StartPhoto` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StartAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `EndTime` datetime DEFAULT NULL,
  `EndLon` double DEFAULT 0,
  `EndLat` double DEFAULT 0,
  `EndPhoto` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EndAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaAttendance_UserId` (`UserId`),
  KEY `OaAttendance_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaattendance 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaattendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaattendance` ENABLE KEYS */;

-- 导出  表 ebc_release.oaexpensecategory 结构
CREATE TABLE IF NOT EXISTS `oaexpensecategory` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `Name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaExpenseCategory_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaexpensecategory 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaexpensecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaexpensecategory` ENABLE KEYS */;

-- 导出  表 ebc_release.oanotice 结构
CREATE TABLE IF NOT EXISTS `oanotice` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HadView` int(11) DEFAULT 0,
  `NeedView` int(11) DEFAULT 0,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaNotice_ProjectId` (`ProjectId`),
  KEY `OaNotice_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oanotice 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oanotice` DISABLE KEYS */;
/*!40000 ALTER TABLE `oanotice` ENABLE KEYS */;

-- 导出  表 ebc_release.oanoticecomment 结构
CREATE TABLE IF NOT EXISTS `oanoticecomment` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NoticeId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaNoticeComment_NoticeId` (`NoticeId`),
  KEY `OaNoticeComment_UserId` (`UserId`),
  KEY `OaNoticeComment_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oanoticecomment 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oanoticecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `oanoticecomment` ENABLE KEYS */;

-- 导出  表 ebc_release.oanoticelink 结构
CREATE TABLE IF NOT EXISTS `oanoticelink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NoticeId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsView` int(11) DEFAULT 0,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaNoticeLink_NoticeId` (`NoticeId`),
  KEY `OaNoticeLink_UserId` (`UserId`),
  KEY `OaNoticeLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oanoticelink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oanoticelink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oanoticelink` ENABLE KEYS */;

-- 导出  表 ebc_release.oasigninpath 结构
CREATE TABLE IF NOT EXISTS `oasigninpath` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SignInLocationId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `SignTime` datetime DEFAULT NULL,
  `Lon` double DEFAULT 0,
  `Lat` double DEFAULT 0,
  `Offset` double DEFAULT 0,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaSignInPath_UserId` (`UserId`),
  KEY `OaSignInPath_ProjectId` (`ProjectId`),
  KEY `OaSignInPath_SignInLocationId` (`SignInLocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oasigninpath 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oasigninpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `oasigninpath` ENABLE KEYS */;

-- 导出  表 ebc_release.oatask 结构
CREATE TABLE IF NOT EXISTS `oatask` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `Priority` int(11) DEFAULT 0,
  `Status` int(11) DEFAULT 0,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExpireDate` datetime DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaTask_ProjectId` (`ProjectId`),
  KEY `OaTask_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oatask 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oatask` DISABLE KEYS */;
/*!40000 ALTER TABLE `oatask` ENABLE KEYS */;

-- 导出  表 ebc_release.oataskfeedback 结构
CREATE TABLE IF NOT EXISTS `oataskfeedback` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TaskId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `CreateDate` datetime DEFAULT NULL,
  `Progress` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaTaskFeedback_TaskId` (`TaskId`),
  KEY `OaTaskFeedback_UserId` (`UserId`),
  KEY `OaTaskFeedback_ProjectId` (`ProjectId`),
  KEY `OaTaskFeedback_Progress` (`Progress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oataskfeedback 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oataskfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `oataskfeedback` ENABLE KEYS */;

-- 导出  表 ebc_release.oatasklink 结构
CREATE TABLE IF NOT EXISTS `oatasklink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TaskId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `IsView` int(11) DEFAULT 0,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaTaskLink_TaskId` (`TaskId`),
  KEY `OaTaskLink_UserId` (`UserId`),
  KEY `OaTaskLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oatasklink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oatasklink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oatasklink` ENABLE KEYS */;

-- 导出  表 ebc_release.oaworkreport 结构
CREATE TABLE IF NOT EXISTS `oaworkreport` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `Status` int(11) DEFAULT 0,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaWorkReport_ProjectId` (`ProjectId`),
  KEY `OaWorkReport_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaworkreport 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaworkreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaworkreport` ENABLE KEYS */;

-- 导出  表 ebc_release.oaworkreportcomment 结构
CREATE TABLE IF NOT EXISTS `oaworkreportcomment` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `WorkReportId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaWorkReportComment_WorkReportId` (`WorkReportId`),
  KEY `OaWorkReportComment_UserId` (`UserId`),
  KEY `OaWorkReportComment_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaworkreportcomment 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaworkreportcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaworkreportcomment` ENABLE KEYS */;

-- 导出  表 ebc_release.oaworkreportlink 结构
CREATE TABLE IF NOT EXISTS `oaworkreportlink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `WorkReportId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `OaWorkReportLink_WorkReportId` (`WorkReportId`),
  KEY `OaWorkReportLink_UserId` (`UserId`),
  KEY `OaWorkReportLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.oaworkreportlink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaworkreportlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oaworkreportlink` ENABLE KEYS */;

-- 导出  表 ebc_release.project 结构
CREATE TABLE IF NOT EXISTS `project` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateUserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lon` double DEFAULT 0,
  `Lat` double DEFAULT 0,
  `Owner` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Designer` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Constructor` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Supervisor` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Date1` date DEFAULT NULL,
  `Date2` date DEFAULT NULL,
  `Fundsrc` int(11) DEFAULT 0,
  `Kind` int(11) DEFAULT 0,
  `Structure` int(11) DEFAULT 0,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Area` double DEFAULT 0,
  `Cost` double DEFAULT 0,
  `Descp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PictureId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SignInStartTime` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SignInEndTime` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SignInDays` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1,2,3,4,5',
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `Project_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.project 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- 导出  表 ebc_release.projectjoinrequest 结构
CREATE TABLE IF NOT EXISTS `projectjoinrequest` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectUserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JoinUserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReqKind` int(11) DEFAULT 0,
  `Result` int(11) DEFAULT 0,
  `Msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RequestTime` datetime DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `ProjectJoinRequest_ProjectId` (`ProjectId`),
  KEY `ProjectJoinRequest_ProjectUserId` (`ProjectUserId`),
  KEY `ProjectJoinRequest_JoinUserId` (`JoinUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.projectjoinrequest 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `projectjoinrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectjoinrequest` ENABLE KEYS */;

-- 导出  表 ebc_release.projectsigninlocation 结构
CREATE TABLE IF NOT EXISTS `projectsigninlocation` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `OrderNo` int(11) DEFAULT 0,
  `Lon` double DEFAULT 0,
  `Lat` double DEFAULT 0,
  `Range` double DEFAULT 200,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateUserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ProjectSignInLocation_ProjectId` (`ProjectId`),
  KEY `ProjectSignInLocation_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.projectsigninlocation 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `projectsigninlocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectsigninlocation` ENABLE KEYS */;

-- 导出  表 ebc_release.projectuserlink 结构
CREATE TABLE IF NOT EXISTS `projectuserlink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsOwner` int(11) DEFAULT 0,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `ProjectUserLink_ProjectId` (`ProjectId`),
  KEY `ProjectUserLink_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.projectuserlink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `projectuserlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectuserlink` ENABLE KEYS */;

-- 导出  表 ebc_release.projectusertag 结构
CREATE TABLE IF NOT EXISTS `projectusertag` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tag` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `ProjectUserTag_ProjectId` (`ProjectId`),
  KEY `ProjectUserTag_UserId` (`UserId`),
  KEY `ProjectUserTag_Tag` (`Tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.projectusertag 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `projectusertag` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectusertag` ENABLE KEYS */;

-- 导出  表 ebc_release.sitedynamic 结构
CREATE TABLE IF NOT EXISTS `sitedynamic` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lon` double DEFAULT 0,
  `Lat` double DEFAULT 0,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SiteDynamic_ProjectId` (`ProjectId`),
  KEY `SiteDynamic_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sitedynamic 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sitedynamic` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitedynamic` ENABLE KEYS */;

-- 导出  表 ebc_release.sitedynamiclink 结构
CREATE TABLE IF NOT EXISTS `sitedynamiclink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DynamicId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `IsView` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `SiteDynamicLink_DynamicId` (`DynamicId`),
  KEY `SiteDynamicLink_UserId` (`UserId`),
  KEY `SiteDynamicLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sitedynamiclink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sitedynamiclink` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitedynamiclink` ENABLE KEYS */;

-- 导出  表 ebc_release.sitetelltech 结构
CREATE TABLE IF NOT EXISTS `sitetelltech` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lon` double DEFAULT 0,
  `Lat` double DEFAULT 0,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SiteTellTech_ProjectId` (`ProjectId`),
  KEY `SiteTellTech_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sitetelltech 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sitetelltech` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitetelltech` ENABLE KEYS */;

-- 导出  表 ebc_release.sitetelltechlink 结构
CREATE TABLE IF NOT EXISTS `sitetelltechlink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TellTechId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `IsView` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `SiteTellTechLink_TellTechId` (`TellTechId`),
  KEY `SiteTellTechLink_UserId` (`UserId`),
  KEY `SiteTellTechLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sitetelltechlink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sitetelltechlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitetelltechlink` ENABLE KEYS */;

-- 导出  表 ebc_release.siteworklog 结构
CREATE TABLE IF NOT EXISTS `siteworklog` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LogDate` datetime DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Weather` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Wind` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Days` int(11) DEFAULT 0,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SiteWorkLog_ProjectId` (`ProjectId`),
  KEY `SiteWorkLog_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.siteworklog 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `siteworklog` DISABLE KEYS */;
/*!40000 ALTER TABLE `siteworklog` ENABLE KEYS */;

-- 导出  表 ebc_release.sysmodule 结构
CREATE TABLE IF NOT EXISTS `sysmodule` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `OrderNo` int(11) DEFAULT 0,
  `ClientKind` int(11) DEFAULT 0,
  `Name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SysModule_Pid` (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sysmodule 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysmodule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmodule` ENABLE KEYS */;

-- 导出  表 ebc_release.sysoplog 结构
CREATE TABLE IF NOT EXISTS `sysoplog` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kind` int(11) DEFAULT 0,
  `SendKind` int(11) DEFAULT 0,
  `ContentKind` int(11) DEFAULT 0,
  `ClientKind` int(11) DEFAULT 0,
  `ToUsers` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClientId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserName` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Timestamp` int(11) DEFAULT 0,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sysoplog 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysoplog` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysoplog` ENABLE KEYS */;

-- 导出  表 ebc_release.syspermission 结构
CREATE TABLE IF NOT EXISTS `syspermission` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ModuleId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `PermKind` int(11) DEFAULT 0,
  `ClientKind` int(11) DEFAULT 0,
  `Name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SysPermission_ModuleId` (`ModuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.syspermission 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `syspermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `syspermission` ENABLE KEYS */;

-- 导出  表 ebc_release.sysrole 结构
CREATE TABLE IF NOT EXISTS `sysrole` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `Name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PermKind` int(11) DEFAULT 0,
  `ClientKind` int(11) DEFAULT 0,
  `CreateDate` date DEFAULT NULL,
  `UpdateDate` date DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sysrole 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysrole` ENABLE KEYS */;

-- 导出  表 ebc_release.sysrolemodule 结构
CREATE TABLE IF NOT EXISTS `sysrolemodule` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ModuleId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SysRoleModule_RoleId` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sysrolemodule 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysrolemodule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysrolemodule` ENABLE KEYS */;

-- 导出  表 ebc_release.sysrolepermission 结构
CREATE TABLE IF NOT EXISTS `sysrolepermission` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `PermId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SysRolePermission_RoleId` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sysrolepermission 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysrolepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysrolepermission` ENABLE KEYS */;

-- 导出  表 ebc_release.sysuser 结构
CREATE TABLE IF NOT EXISTS `sysuser` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `UserName` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RealName` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsEnable` int(11) DEFAULT 1,
  `CurrProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `QQ` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WeiXin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Priority` int(11) DEFAULT 0,
  `RegIp` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastLoginIp` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `UpdateDate` date DEFAULT NULL,
  `PictureId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sysuser 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysuser` ENABLE KEYS */;

-- 导出  表 ebc_release.sysuserrolelink 结构
CREATE TABLE IF NOT EXISTS `sysuserrolelink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `RoleId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SysUserRoleLink_UserId` (`UserId`),
  KEY `SysUserRoleLink_RoleId` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.sysuserrolelink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysuserrolelink` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysuserrolelink` ENABLE KEYS */;

-- 导出  表 ebc_release.workbenchitem 结构
CREATE TABLE IF NOT EXISTS `workbenchitem` (
  `Id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SnapContent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WorkbenchItem_ProjectId` (`ProjectId`),
  KEY `WorkbenchItem_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_release.workbenchitem 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `workbenchitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `workbenchitem` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
