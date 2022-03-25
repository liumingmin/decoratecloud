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


-- 导出 ebc_debug 的数据库结构
CREATE DATABASE IF NOT EXISTS `ebc_debug` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `ebc_debug`;

-- 导出  表 ebc_debug.appnotify 结构
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

-- 正在导出表  ebc_debug.appnotify 的数据：~45 rows (大约)
/*!40000 ALTER TABLE `appnotify` DISABLE KEYS */;
REPLACE INTO `appnotify` (`Id`, `ProjectId`, `UserId`, `Module`, `SnapContent`, `UpdateTime`, `LastSendTime`) VALUES
	('01c543c4-7908-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppOut', '外出审批:ss2d', '2018-06-29 16:53:33', '2018-06-19 14:13:07'),
	('11fc8a46-7529-11e8-bb97-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppLeave', '请假审批:ss2d', '2018-06-29 15:38:51', '2018-06-14 15:59:22'),
	('176b25e5-7a0a-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppPurchase', '采购审批:ss2d', '2018-06-30 14:29:11', '2018-06-20 21:00:26'),
	('269b7c7c-601b-11e8-a8d9-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', 'admin0000', 'OaNotice', '公告:好的', '2018-06-25 20:09:49', '2018-05-27 14:37:40'),
	('2ab79daf-63df-11e8-a8d9-80fa5b4601fd', '0000', NULL, 'OaAppLeave', '请假审批:ss2d', '2018-05-30 15:57:27', '2018-05-23 15:57:27'),
	('3bff5efe-8718-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'SiteWorkLog', '施工日志:给我婆婆XP', '2018-07-14 11:46:29', '2018-07-07 11:43:46'),
	('3bffa33e-8718-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'SiteWorkLog', '施工日志:给我婆婆XP', '2018-07-14 11:46:29', '2018-07-07 11:43:46'),
	('3e723b56-7c3b-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaWorkReport', '工作汇报:测试下', '2018-07-07 10:59:55', '2018-06-23 15:57:11'),
	('4cf3d57f-5e89-11e8-a8d9-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaNotice', '公告:测试', '2018-06-30 14:27:35', '2018-06-04 20:52:20'),
	('4cfbf950-5e89-11e8-a8d9-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaNotice', '公告:好的', '2018-06-25 20:09:49', '2018-05-27 19:47:00'),
	('4f9d87e3-833f-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'SiteTellTech', '施工交底:测试', '2018-07-09 14:13:45', '2018-07-02 14:13:45'),
	('4f9dc4cd-833f-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', 'admin0000', 'SiteTellTech', '施工交底:测试', '2018-07-09 14:13:45', '2018-07-02 14:13:45'),
	('4f9e0b8e-833f-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'SiteTellTech', '施工交底:测试', '2018-07-09 14:13:45', '2018-07-02 14:13:45'),
	('55625deb-7a0a-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaAppPurchase', '采购审批:ss2d', '2018-06-27 21:02:10', '2018-06-20 21:02:10'),
	('59681236-7934-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaAppOut', '外出审批:ss2d', '2018-06-26 19:30:29', '2018-06-19 19:30:29'),
	('66e7c9dd-63df-11e8-a8d9-80fa5b4601fd', '0000', 'admin0000', 'OaAppLeave', '请假审批:ss2d', '2018-05-30 16:09:39', '2018-05-23 15:59:08'),
	('6c3ae0da-5dc2-11e8-a8d9-80fa5b4601fd', '__globe__', '5acb66f7c01c812d50000001', 'Request', '基金申请加入测试5', '2018-06-26 19:35:39', '2018-05-27 19:44:10'),
	('7112e146-5dc2-11e8-a8d9-80fa5b4601fd', '__globe__', '5accb0c7c01c811d6c000007', 'Request', 'ss2d邀请你加入qqqq', '2018-06-26 21:54:40', '2018-05-27 14:37:40'),
	('78e6a103-7a0e-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppApproves', '通用审批:ss2d', '2018-06-30 14:30:19', '2018-06-20 21:31:47'),
	('7d436046-79e8-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppExpense', '报销审批:ss2d', '2018-06-29 17:22:16', '2018-06-20 16:59:56'),
	('7f7fad8d-6191-11e8-a8d9-80fa5b4601fd', '__globe__', 'admin0000', 'ProjectUser', '已加入基金项目', '2018-06-26 19:36:26', '2018-05-27 19:44:20'),
	('82c9d06e-6020-11e8-a8d9-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', 'admin0000', 'OaTask', '任务:测试', '2018-06-25 21:26:00', '2018-05-27 14:37:40'),
	('8445e2b6-5dc2-11e8-a8d9-80fa5b4601fd', '__globe__', '5accb0c7c01c811d6c000007', 'ProjectUser', '已加入测试项目', '2018-05-22 21:17:39', '2018-05-27 14:37:40'),
	('8d25d506-63e8-11e8-a8d9-80fa5b4601fd', '0000', 'admin0000', 'OaAppTravel', '出差审批:ss2d', '2018-05-30 17:04:37', '2018-05-23 17:04:37'),
	('91423349-5dc2-11e8-a8d9-80fa5b4601fd', '__globe__', '5acb66f7c01c812d50000001', 'ProjectUser', '已加入基金项目', '2018-06-26 19:38:49', '2018-05-27 14:37:40'),
	('9a9182f5-6414-11e8-a8d9-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaWorkReport', '工作汇报:测试下', '2018-06-30 15:59:11', '2018-06-04 20:52:20'),
	('9a9bad38-6414-11e8-a8d9-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaWorkReport', '工作汇报:测试下', '2018-07-07 11:06:04', '2018-05-30 22:29:30'),
	('a5066ca2-6188-11e8-a8d9-80fa5b4601fd', 'f2789be9499b4d06881721e1377bb7a7', 'admin0000', 'OaTask', '任务:测试缓存', '2018-05-27 17:31:05', '2018-05-20 16:33:17'),
	('a622c060-79e8-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaAppExpense', '报销审批:ss2d', '2018-06-27 17:01:05', '2018-06-20 17:01:05'),
	('a79dac2f-8718-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'SiteWorkLog', '施工日志:李敏镐', '2018-07-14 12:32:30', '2018-07-07 11:46:47'),
	('a91dd2fc-7905-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppTravel', '出差审批:ss2d', '2018-07-09 16:38:49', '2018-06-19 13:56:19'),
	('aaa8af16-7871-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaTask', '任务反馈 进度:测试反馈2', '2018-06-30 15:33:54', '2018-06-18 20:16:58'),
	('aaf2df46-7870-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaNotice', '公告:测试', '2018-06-30 14:27:35', '2018-06-18 20:09:49'),
	('b1e822e1-6173-11e8-a8d9-80fa5b4601fd', '__globe__', 'admin0000', 'Request', '基金邀请你加入基金项目', '2018-06-26 19:34:13', '2018-05-27 14:37:40'),
	('bfd0994e-63e8-11e8-a8d9-80fa5b4601fd', '0000', '5acb66f7c01c812d50000001', 'OaAppTravel', '出差审批:ss2d', '2018-05-30 17:06:03', '2018-05-23 17:06:03'),
	('c37d1830-5dc2-11e8-a8d9-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaTask', '任务:测试', '2018-06-30 14:44:02', '2018-06-04 20:52:20'),
	('c38198fe-5dc2-11e8-a8d9-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaTask', '任务反馈 进度:测试反馈2', '2018-06-30 15:33:54', '2018-05-30 22:31:50'),
	('c71d1e55-7905-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaAppTravel', '出差审批:ss2d', '2018-06-26 19:30:44', '2018-06-19 13:57:09'),
	('d16fcabe-6198-11e8-a8d9-80fa5b4601fd', 'f2789be9499b4d06881721e1377bb7a7', 'admin0000', 'OaNotice', '公告:你摸', '2018-05-27 18:30:36', '2018-05-20 18:29:04'),
	('d5e46c83-69f5-11e8-a8d9-80fa5b4601fd', '__globe__', '5b189019c01c812974000004', 'ProjectUser', '已加入测试5', '2018-06-26 19:38:59', '2018-05-31 09:54:18'),
	('d75a543d-832a-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'SiteDynamic', '施工动态:测试', '2018-07-09 14:17:15', '2018-07-02 11:47:13'),
	('d75a9974-832a-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', 'admin0000', 'SiteDynamic', '施工动态:测试', '2018-07-09 14:17:15', '2018-07-02 11:47:13'),
	('d75ad918-832a-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'SiteDynamic', '施工动态:测试', '2018-07-09 14:17:15', '2018-07-02 11:47:13'),
	('db001503-63e8-11e8-a8d9-80fa5b4601fd', '0000', '5accb0c7c01c811d6c000007', 'OaAppTravel', '出差审批:ss2d', '2018-05-30 17:06:48', '2018-05-23 17:06:48'),
	('e8eb4d4c-67f5-11e8-a8d9-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaAppLeave', '请假审批:ss2d', '2018-06-08 19:32:50', '2018-06-06 11:57:20'),
	('e912d480-7934-11e8-ab45-80fa5b4601fd', '__globe__', '5b189019c01c812974000004', 'Request', '基金邀请你加入基金项目', '2018-06-26 19:34:30', '2018-06-19 19:34:30'),
	('f96e2a1f-63de-11e8-a8d9-80fa5b4601fd', '0000', NULL, 'OaAppLeave', '请假审批:ss2d', '2018-05-30 15:56:04', '2018-05-23 15:56:04'),
	('ff3572e6-693d-11e8-a8d9-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaAppLeave', '请假审批:ss2d', '2018-06-08 19:33:47', '2018-06-06 12:07:10');
/*!40000 ALTER TABLE `appnotify` ENABLE KEYS */;

-- 导出  表 ebc_debug.appredpoint 结构
CREATE TABLE IF NOT EXISTS `appredpoint` (
  `Id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ModuleGroup` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `Key` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SnapContent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `ModuleKey` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AppRedPoint_ProjectId` (`ProjectId`),
  KEY `AppRedPoint_UserId` (`UserId`),
  KEY `AppRedPoint_Key` (`Key`),
  KEY `AppRedPoint_ModuleKey` (`ModuleKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.appredpoint 的数据：~57 rows (大约)
/*!40000 ALTER TABLE `appredpoint` DISABLE KEYS */;
REPLACE INTO `appredpoint` (`Id`, `ProjectId`, `UserId`, `ModuleGroup`, `Module`, `Kind`, `Key`, `SnapContent`, `UpdateTime`, `ModuleKey`) VALUES
	('03600176-7c32-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaTask', 3, NULL, '任务:测试2', '2018-06-30 14:51:07', '815926ffb72e4791831c796fb35ee3b0'),
	('064ff645-7c31-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaTask', 3, NULL, '任务:测试', '2018-06-30 14:44:02', '901cccd64cca4c40aed5fd78487068b1'),
	('0650b720-7c31-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaTask', 4, NULL, '任务:测试', '2018-06-30 14:44:02', '901cccd64cca4c40aed5fd78487068b1'),
	('0ac06a4f-871f-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'SiteWorkLog', 0, NULL, '施工日志:李敏镐', '2018-07-14 12:32:30', 'ed8f8561408c4462b0f767e6005c211f'),
	('0d5dcc16-7c2f-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppApproves', 1, NULL, '通用审批:ss2d', '2018-06-30 14:29:55', '370dee3cbc64470c8ee0a09b3e6e67e4'),
	('15da38a4-7a0f-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppApproves', 1, NULL, '通用审批:ss2d', '2018-06-27 21:36:11', 'bdd53d45053043f78a384fa760346cfb'),
	('189b4e10-7c2f-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppApproves', 1, NULL, '通用审批:ss2d', '2018-06-30 14:30:14', '370dee3cbc64470c8ee0a09b3e6e67e4'),
	('18d705d3-7934-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppOut', 1, NULL, '外出:ss2d', '2018-06-26 19:28:41', '9ead3b8aaf374cdf891213f70b663b79'),
	('1bec91cb-7c2f-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppApproves', 2, NULL, '通用审批:ss2d', '2018-06-30 14:30:19', '370dee3cbc64470c8ee0a09b3e6e67e4'),
	('1ce8cab2-7b6e-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppLeave', 1, NULL, '请假:ss2d', '2018-06-29 15:28:51', '159d73afe7c546748af0d63adf625630'),
	('33ec4cda-79e8-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppExpense', 1, NULL, '报销:ss2d', '2018-06-27 16:57:53', '8ce63693efaf4b558b23b919b7ed5379'),
	('3e7142ec-7c3b-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaWorkReport', 1, NULL, '工作汇报:测试', '2018-06-30 15:57:11', 'c09c421909784f5e95fdaae246cc1a68'),
	('4698a21c-7b6b-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppLeave', 1, NULL, '请假:ss2d', '2018-06-29 15:08:32', '995f65afcb8940478132772ccd061934'),
	('4f9cfcc5-833f-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'SiteTellTech', 0, NULL, '施工交底:测试', '2018-07-09 14:13:45', '80090887a1b449b5aaf33b04995a381d'),
	('51549253-7b6d-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppLeave', 1, NULL, '请假:ss2d', '2018-06-29 15:23:09', 'ee90bda6cf53491d85200f2e8352b7cc'),
	('5d65887d-7b6f-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppLeave', 1, NULL, '请假:ss2d', '2018-06-29 15:37:48', '159d73afe7c546748af0d63adf625630'),
	('62525776-7934-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'App', 'OaAppTravel', 2, NULL, '出差审批:ss2d', '2018-06-26 19:30:44', 'ebec3a5825434a8d9ec3d9dfa4d407be'),
	('6bb59eb2-7932-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaNotice', 1, NULL, '公告:哈哈', '2018-06-26 19:16:41', 'fa266d0e4a4c41b790ad308085729fc5'),
	('6e5fd20e-7a0e-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppApproves', 1, NULL, '通用审批:ss2d', '2018-06-27 21:31:30', '1dea99cf850244b7bf3525372ec8df63'),
	('7cc201fd-7b79-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppTravel', 1, NULL, '', '2018-06-29 16:50:16', ''),
	('7cf3470f-8353-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppTravel', 1, NULL, '出差:ss2d', '2018-07-09 16:38:11', 'b41f2d364b5b40f18ffdf7ad7f2ae146'),
	('7e1a3414-7948-11e8-ab45-80fa5b4601fd', '__globe__', '5accb0c7c01c811d6c000007', 'Project', 'Request', 1, NULL, 'ss2d邀请你加入qqqq', '2018-06-26 21:54:40', '019bf9b82ae24cfc815bad7a1b281df5'),
	('82b1849f-7b6f-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppLeave', 2, NULL, '请假审批:ss2d', '2018-06-29 15:38:51', '159d73afe7c546748af0d63adf625630'),
	('8512360d-7a09-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppPurchase', 1, NULL, '采购:ss2d', '2018-06-27 20:56:20', '5cdc5f3a9e18477a842ac517bd2e8225'),
	('85b5be57-7c3b-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaWorkReport', 1, NULL, '工作汇报:测试下', '2018-06-30 15:59:11', '25c0285ca4044f0b931e3e57f725b9b7'),
	('872d7e10-7b79-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppTravel', 1, NULL, '', '2018-06-29 16:50:33', ''),
	('8fbba678-8353-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'App', 'OaAppTravel', 1, NULL, '出差:ss2d', '2018-07-09 16:38:42', 'b41f2d364b5b40f18ffdf7ad7f2ae146'),
	('98657d9a-7c32-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaTask', 3, NULL, '任务:测试3', '2018-06-30 14:55:17', '5a357d03a888414b89cc1aa0e4786533'),
	('9bf08e2e-7932-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppLeave', 1, NULL, '请假:高脚帽', '2018-06-26 19:18:02', 'da6c23713c004421ac96cf73f67a3c12'),
	('9ce66c12-8718-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'SiteWorkLog', 0, NULL, '施工日志:给我婆婆XP', '2018-07-14 11:46:29', '4696bd42c1244daf8c659806aaa24cbe'),
	('a79d7d60-8718-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'SiteWorkLog', 0, NULL, '施工日志:给我婆婆XP', '2018-07-14 11:46:47', '4696bd42c1244daf8c659806aaa24cbe'),
	('ba23640f-7c2e-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaNotice', 1, NULL, '公告:测试', '2018-06-30 14:27:35', '24c32e3ceefd4c1eb4f174cde6278944'),
	('ba3a261f-7c37-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaTask', 3, NULL, '任务反馈 进度:测试反馈', '2018-06-30 15:32:01', '5a357d03a888414b89cc1aa0e4786533'),
	('c239c165-7b79-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppTravel', 1, NULL, '出差:ss2d', '2018-06-29 16:52:12', '2237f235ea5c46a68278a4de7f264f41'),
	('ccbd0e90-833f-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'SiteDynamic', 0, NULL, '施工动态:测试', '2018-07-09 14:17:15', '2159d11956774d7c8837f44c411d6758'),
	('ccc27b16-833f-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'SiteDynamic', 1, NULL, '施工动态:测试', '2018-07-09 14:17:15', '2159d11956774d7c8837f44c411d6758'),
	('ce8a2a5c-7a9c-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppExpense', 1, NULL, '报销:ss2d', '2018-06-28 14:30:37', '30f199aed2aa47d4bb8dca420055fea7'),
	('ce8a4a48-7a9c-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppExpense', 1, NULL, '报销:ss2d', '2018-06-28 14:30:37', '30f199aed2aa47d4bb8dca420055fea7'),
	('d2903759-7933-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppTravel', 1, NULL, '出差:ss2d', '2018-06-26 19:26:43', 'ebec3a5825434a8d9ec3d9dfa4d407be'),
	('d295ecf7-7a9c-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppExpense', 2, NULL, '报销审批:ss2d', '2018-06-28 14:30:44', '30f199aed2aa47d4bb8dca420055fea7'),
	('d759d334-832a-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'SiteDynamic', 0, NULL, '施工动态:测试动态', '2018-07-09 11:47:13', '7c7f3f0c19064ab780a4cb360159627c'),
	('d75aa728-832a-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'SiteDynamic', 0, NULL, '施工动态:测试动态', '2018-07-09 11:47:13', '7c7f3f0c19064ab780a4cb360159627c'),
	('d75ae4b2-832a-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'SiteDynamic', 1, NULL, '施工动态:测试动态', '2018-07-09 11:47:13', '7c7f3f0c19064ab780a4cb360159627c'),
	('d766b1f5-832a-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'SiteDynamic', 1, NULL, '施工动态:测试动态', '2018-07-09 11:47:13', '7c7f3f0c19064ab780a4cb360159627c'),
	('d835aaa2-7a86-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaWorkReport', 1, NULL, '工作汇报:111', '2018-06-28 11:53:25', '31071c4b3c174138866f124610dc1fa7'),
	('ddf84004-7b79-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppOut', 1, NULL, '外出:ss2d', '2018-06-29 16:52:59', 'a2d0567e0b144f5c9645cb96e08a2d1a'),
	('e26c3d38-7b7d-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppExpense', 1, NULL, '报销:ss2d', '2018-06-29 17:21:44', '633e2444323d43dd9f6936778b6dcabc'),
	('e26c683f-7b7d-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppExpense', 1, NULL, '报销:ss2d', '2018-06-29 17:21:44', '633e2444323d43dd9f6936778b6dcabc'),
	('e462a041-7934-11e8-ab45-80fa5b4601fd', '__globe__', '5accb0c7c01c811d6c000007', 'Project', 'Request', 1, NULL, '基金邀请你加入基金项目', '2018-06-26 19:34:22', 'c1fa551f533946d292392f5224117a36'),
	('e4f274c5-7c2e-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppPurchase', 1, NULL, '采购:ss2d', '2018-06-30 14:28:47', 'edd753feea5e49f09a8bec68db95f2d7'),
	('ec6b20fd-7b79-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppOut', 1, NULL, '外出:ss2d', '2018-06-29 16:53:23', 'a2d0567e0b144f5c9645cb96e08a2d1a'),
	('f052cfc4-7c2e-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppPurchase', 1, NULL, '采购:ss2d', '2018-06-30 14:29:06', 'edd753feea5e49f09a8bec68db95f2d7'),
	('f27ab4a3-7b79-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppOut', 2, NULL, '外出审批:ss2d', '2018-06-29 16:53:33', 'a2d0567e0b144f5c9645cb96e08a2d1a'),
	('f3627da2-7c2e-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppPurchase', 2, NULL, '采购审批:ss2d', '2018-06-30 14:29:11', 'edd753feea5e49f09a8bec68db95f2d7'),
	('f4fece8e-7b7d-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaAppExpense', 2, NULL, '报销审批:ss2d', '2018-06-29 17:22:16', '633e2444323d43dd9f6936778b6dcabc'),
	('f5d46f17-7b72-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'App', 'OaAppLeave', 1, NULL, '请假:ss2d', '2018-06-29 16:03:32', '5122d7c284004cf18c8327c9664838c7'),
	('fdc994ed-7c37-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'App', 'OaTask', 3, NULL, '任务反馈 进度:测试反馈2', '2018-06-30 15:33:54', '5a357d03a888414b89cc1aa0e4786533');
/*!40000 ALTER TABLE `appredpoint` ENABLE KEYS */;

-- 导出  表 ebc_debug.atesttable 结构
CREATE TABLE IF NOT EXISTS `atesttable` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1062 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.atesttable 的数据：~1,023 rows (大约)
/*!40000 ALTER TABLE `atesttable` DISABLE KEYS */;
REPLACE INTO `atesttable` (`Id`, `Name`, `CreatedBy`, `Remark`) VALUES
	(1, '0ssssss', 'mme', 'remark'),
	(2, '0ssssss', 'mme', 'remark'),
	(3, '1ssssss', 'mme', 'remark'),
	(4, '2ssssss', 'mme', 'remark'),
	(5, '3ssssss', 'mme', 'remark'),
	(6, '4ssssss', 'mme', 'remark'),
	(7, '5ssssss', 'mme', 'remark'),
	(8, '6ssssss', 'mme', 'remark'),
	(9, '7ssssss', 'mme', 'remark'),
	(10, '8ssssss', 'mme', 'remark'),
	(11, '9ssssss', 'mme', 'remark'),
	(12, '10ssssss', 'mme', 'remark'),
	(13, '11ssssss', 'mme', 'remark'),
	(14, '12ssssss', 'mme', 'remark'),
	(15, '13ssssss', 'mme', 'remark'),
	(16, '14ssssss', 'mme', 'remark'),
	(17, '15ssssss', 'mme', 'remark'),
	(18, '16ssssss', 'mme', 'remark'),
	(19, '17ssssss', 'mme', 'remark'),
	(20, '18ssssss', 'mme', 'remark'),
	(21, '19ssssss', 'mme', 'remark'),
	(22, '20ssssss', 'mme', 'remark'),
	(23, '21ssssss', 'mme', 'remark'),
	(24, '22ssssss', 'mme', 'remark'),
	(25, '23ssssss', 'mme', 'remark'),
	(26, '24ssssss', 'mme', 'remark'),
	(27, '25ssssss', 'mme', 'remark'),
	(28, '26ssssss', 'mme', 'remark'),
	(29, '27ssssss', 'mme', 'remark'),
	(30, '28ssssss', 'mme', 'remark'),
	(31, '29ssssss', 'mme', 'remark'),
	(32, '30ssssss', 'mme', 'remark'),
	(33, '31ssssss', 'mme', 'remark'),
	(34, '32ssssss', 'mme', 'remark'),
	(35, '33ssssss', 'mme', 'remark'),
	(36, '34ssssss', 'mme', 'remark'),
	(37, '35ssssss', 'mme', 'remark'),
	(38, '36ssssss', 'mme', 'remark'),
	(39, '37ssssss', 'mme', 'remark'),
	(40, '38ssssss', 'mme', 'remark'),
	(41, '39ssssss', 'mme', 'remark'),
	(42, '40ssssss', 'mme', 'remark'),
	(43, '41ssssss', 'mme', 'remark'),
	(44, '42ssssss', 'mme', 'remark'),
	(45, '43ssssss', 'mme', 'remark'),
	(46, '44ssssss', 'mme', 'remark'),
	(47, '45ssssss', 'mme', 'remark'),
	(48, '46ssssss', 'mme', 'remark'),
	(49, '47ssssss', 'mme', 'remark'),
	(50, '48ssssss', 'mme', 'remark'),
	(51, '49ssssss', 'mme', 'remark'),
	(52, '50ssssss', 'mme', 'remark'),
	(53, '51ssssss', 'mme', 'remark'),
	(54, '52ssssss', 'mme', 'remark'),
	(55, '53ssssss', 'mme', 'remark'),
	(56, '54ssssss', 'mme', 'remark'),
	(57, '55ssssss', 'mme', 'remark'),
	(58, '56ssssss', 'mme', 'remark'),
	(59, '57ssssss', 'mme', 'remark'),
	(60, '58ssssss', 'mme', 'remark'),
	(61, '59ssssss', 'mme', 'remark'),
	(62, '60ssssss', 'mme', 'remark'),
	(63, '61ssssss', 'mme', 'remark'),
	(64, '62ssssss', 'mme', 'remark'),
	(65, '63ssssss', 'mme', 'remark'),
	(66, '64ssssss', 'mme', 'remark'),
	(67, '65ssssss', 'mme', 'remark'),
	(68, '66ssssss', 'mme', 'remark'),
	(69, '67ssssss', 'mme', 'remark'),
	(70, '68ssssss', 'mme', 'remark'),
	(71, '69ssssss', 'mme', 'remark'),
	(72, '70ssssss', 'mme', 'remark'),
	(73, '71ssssss', 'mme', 'remark'),
	(74, '72ssssss', 'mme', 'remark'),
	(75, '73ssssss', 'mme', 'remark'),
	(76, '74ssssss', 'mme', 'remark'),
	(77, '75ssssss', 'mme', 'remark'),
	(78, '76ssssss', 'mme', 'remark'),
	(79, '77ssssss', 'mme', 'remark'),
	(80, '78ssssss', 'mme', 'remark'),
	(81, '79ssssss', 'mme', 'remark'),
	(82, '80ssssss', 'mme', 'remark'),
	(83, '81ssssss', 'mme', 'remark'),
	(84, '82ssssss', 'mme', 'remark'),
	(85, '83ssssss', 'mme', 'remark'),
	(86, '84ssssss', 'mme', 'remark'),
	(87, '85ssssss', 'mme', 'remark'),
	(88, '86ssssss', 'mme', 'remark'),
	(89, '87ssssss', 'mme', 'remark'),
	(90, '88ssssss', 'mme', 'remark'),
	(91, '89ssssss', 'mme', 'remark'),
	(92, '90ssssss', 'mme', 'remark'),
	(93, '91ssssss', 'mme', 'remark'),
	(94, '92ssssss', 'mme', 'remark'),
	(95, '93ssssss', 'mme', 'remark'),
	(96, '94ssssss', 'mme', 'remark'),
	(97, '95ssssss', 'mme', 'remark'),
	(98, '96ssssss', 'mme', 'remark'),
	(99, '97ssssss', 'mme', 'remark'),
	(100, '98ssssss', 'mme', 'remark'),
	(101, '99ssssss', 'mme', 'remark'),
	(102, '100ssssss', 'mme', 'remark'),
	(103, '101ssssss', 'mme', 'remark'),
	(104, '102ssssss', 'mme', 'remark'),
	(105, '103ssssss', 'mme', 'remark'),
	(106, '104ssssss', 'mme', 'remark'),
	(107, '105ssssss', 'mme', 'remark'),
	(108, '106ssssss', 'mme', 'remark'),
	(109, '107ssssss', 'mme', 'remark'),
	(110, '108ssssss', 'mme', 'remark'),
	(111, '109ssssss', 'mme', 'remark'),
	(112, '110ssssss', 'mme', 'remark'),
	(113, '111ssssss', 'mme', 'remark'),
	(114, '112ssssss', 'mme', 'remark'),
	(115, '113ssssss', 'mme', 'remark'),
	(116, '114ssssss', 'mme', 'remark'),
	(117, '115ssssss', 'mme', 'remark'),
	(118, '116ssssss', 'mme', 'remark'),
	(119, '117ssssss', 'mme', 'remark'),
	(120, '118ssssss', 'mme', 'remark'),
	(121, '119ssssss', 'mme', 'remark'),
	(122, '120ssssss', 'mme', 'remark'),
	(123, '121ssssss', 'mme', 'remark'),
	(124, '122ssssss', 'mme', 'remark'),
	(125, '123ssssss', 'mme', 'remark'),
	(126, '124ssssss', 'mme', 'remark'),
	(127, '125ssssss', 'mme', 'remark'),
	(128, '126ssssss', 'mme', 'remark'),
	(129, '127ssssss', 'mme', 'remark'),
	(130, '128ssssss', 'mme', 'remark'),
	(131, '129ssssss', 'mme', 'remark'),
	(132, '130ssssss', 'mme', 'remark'),
	(133, '131ssssss', 'mme', 'remark'),
	(134, '132ssssss', 'mme', 'remark'),
	(135, '133ssssss', 'mme', 'remark'),
	(136, '134ssssss', 'mme', 'remark'),
	(137, '135ssssss', 'mme', 'remark'),
	(138, '136ssssss', 'mme', 'remark'),
	(139, '137ssssss', 'mme', 'remark'),
	(140, '138ssssss', 'mme', 'remark'),
	(141, '139ssssss', 'mme', 'remark'),
	(142, '140ssssss', 'mme', 'remark'),
	(143, '141ssssss', 'mme', 'remark'),
	(144, '142ssssss', 'mme', 'remark'),
	(145, '143ssssss', 'mme', 'remark'),
	(146, '144ssssss', 'mme', 'remark'),
	(147, '145ssssss', 'mme', 'remark'),
	(148, '146ssssss', 'mme', 'remark'),
	(149, '147ssssss', 'mme', 'remark'),
	(150, '148ssssss', 'mme', 'remark'),
	(151, '149ssssss', 'mme', 'remark'),
	(152, '150ssssss', 'mme', 'remark'),
	(153, '151ssssss', 'mme', 'remark'),
	(154, '152ssssss', 'mme', 'remark'),
	(155, '153ssssss', 'mme', 'remark'),
	(156, '154ssssss', 'mme', 'remark'),
	(157, '155ssssss', 'mme', 'remark'),
	(158, '156ssssss', 'mme', 'remark'),
	(159, '157ssssss', 'mme', 'remark'),
	(160, '158ssssss', 'mme', 'remark'),
	(161, '159ssssss', 'mme', 'remark'),
	(162, '160ssssss', 'mme', 'remark'),
	(163, '161ssssss', 'mme', 'remark'),
	(164, '162ssssss', 'mme', 'remark'),
	(165, '163ssssss', 'mme', 'remark'),
	(166, '164ssssss', 'mme', 'remark'),
	(167, '165ssssss', 'mme', 'remark'),
	(168, '166ssssss', 'mme', 'remark'),
	(169, '167ssssss', 'mme', 'remark'),
	(170, '168ssssss', 'mme', 'remark'),
	(171, '169ssssss', 'mme', 'remark'),
	(172, '170ssssss', 'mme', 'remark'),
	(173, '171ssssss', 'mme', 'remark'),
	(174, '172ssssss', 'mme', 'remark'),
	(175, '173ssssss', 'mme', 'remark'),
	(176, '174ssssss', 'mme', 'remark'),
	(177, '175ssssss', 'mme', 'remark'),
	(178, '176ssssss', 'mme', 'remark'),
	(179, '177ssssss', 'mme', 'remark'),
	(180, '178ssssss', 'mme', 'remark'),
	(181, '179ssssss', 'mme', 'remark'),
	(182, '180ssssss', 'mme', 'remark'),
	(183, '181ssssss', 'mme', 'remark'),
	(184, '182ssssss', 'mme', 'remark'),
	(185, '183ssssss', 'mme', 'remark'),
	(186, '184ssssss', 'mme', 'remark'),
	(187, '185ssssss', 'mme', 'remark'),
	(188, '186ssssss', 'mme', 'remark'),
	(189, '187ssssss', 'mme', 'remark'),
	(190, '188ssssss', 'mme', 'remark'),
	(191, '189ssssss', 'mme', 'remark'),
	(192, '190ssssss', 'mme', 'remark'),
	(193, '191ssssss', 'mme', 'remark'),
	(194, '192ssssss', 'mme', 'remark'),
	(195, '193ssssss', 'mme', 'remark'),
	(196, '194ssssss', 'mme', 'remark'),
	(197, '195ssssss', 'mme', 'remark'),
	(198, '196ssssss', 'mme', 'remark'),
	(199, '197ssssss', 'mme', 'remark'),
	(200, '198ssssss', 'mme', 'remark'),
	(201, '199ssssss', 'mme', 'remark'),
	(202, '200ssssss', 'mme', 'remark'),
	(203, '201ssssss', 'mme', 'remark'),
	(204, '202ssssss', 'mme', 'remark'),
	(205, '203ssssss', 'mme', 'remark'),
	(206, '204ssssss', 'mme', 'remark'),
	(207, '205ssssss', 'mme', 'remark'),
	(208, '206ssssss', 'mme', 'remark'),
	(209, '207ssssss', 'mme', 'remark'),
	(210, '208ssssss', 'mme', 'remark'),
	(211, '209ssssss', 'mme', 'remark'),
	(212, '210ssssss', 'mme', 'remark'),
	(213, '211ssssss', 'mme', 'remark'),
	(214, '212ssssss', 'mme', 'remark'),
	(215, '213ssssss', 'mme', 'remark'),
	(216, '214ssssss', 'mme', 'remark'),
	(217, '215ssssss', 'mme', 'remark'),
	(218, '216ssssss', 'mme', 'remark'),
	(219, '217ssssss', 'mme', 'remark'),
	(220, '218ssssss', 'mme', 'remark'),
	(221, '219ssssss', 'mme', 'remark'),
	(222, '220ssssss', 'mme', 'remark'),
	(223, '221ssssss', 'mme', 'remark'),
	(224, '222ssssss', 'mme', 'remark'),
	(225, '223ssssss', 'mme', 'remark'),
	(226, '224ssssss', 'mme', 'remark'),
	(227, '225ssssss', 'mme', 'remark'),
	(228, '226ssssss', 'mme', 'remark'),
	(229, '227ssssss', 'mme', 'remark'),
	(230, '228ssssss', 'mme', 'remark'),
	(231, '229ssssss', 'mme', 'remark'),
	(232, '230ssssss', 'mme', 'remark'),
	(233, '231ssssss', 'mme', 'remark'),
	(234, '232ssssss', 'mme', 'remark'),
	(235, '233ssssss', 'mme', 'remark'),
	(236, '234ssssss', 'mme', 'remark'),
	(237, '235ssssss', 'mme', 'remark'),
	(238, '236ssssss', 'mme', 'remark'),
	(239, '237ssssss', 'mme', 'remark'),
	(240, '238ssssss', 'mme', 'remark'),
	(241, '239ssssss', 'mme', 'remark'),
	(242, '240ssssss', 'mme', 'remark'),
	(243, '241ssssss', 'mme', 'remark'),
	(244, '242ssssss', 'mme', 'remark'),
	(245, '243ssssss', 'mme', 'remark'),
	(246, '244ssssss', 'mme', 'remark'),
	(247, '245ssssss', 'mme', 'remark'),
	(248, '246ssssss', 'mme', 'remark'),
	(249, '247ssssss', 'mme', 'remark'),
	(250, '248ssssss', 'mme', 'remark'),
	(251, '249ssssss', 'mme', 'remark'),
	(252, '250ssssss', 'mme', 'remark'),
	(253, '251ssssss', 'mme', 'remark'),
	(254, '252ssssss', 'mme', 'remark'),
	(255, '253ssssss', 'mme', 'remark'),
	(256, '254ssssss', 'mme', 'remark'),
	(257, '255ssssss', 'mme', 'remark'),
	(258, '256ssssss', 'mme', 'remark'),
	(259, '257ssssss', 'mme', 'remark'),
	(260, '258ssssss', 'mme', 'remark'),
	(261, '259ssssss', 'mme', 'remark'),
	(262, '260ssssss', 'mme', 'remark'),
	(263, '261ssssss', 'mme', 'remark'),
	(264, '262ssssss', 'mme', 'remark'),
	(265, '263ssssss', 'mme', 'remark'),
	(266, '264ssssss', 'mme', 'remark'),
	(267, '265ssssss', 'mme', 'remark'),
	(268, '266ssssss', 'mme', 'remark'),
	(269, '267ssssss', 'mme', 'remark'),
	(270, '268ssssss', 'mme', 'remark'),
	(271, '269ssssss', 'mme', 'remark'),
	(272, '270ssssss', 'mme', 'remark'),
	(273, '271ssssss', 'mme', 'remark'),
	(274, '272ssssss', 'mme', 'remark'),
	(275, '273ssssss', 'mme', 'remark'),
	(276, '274ssssss', 'mme', 'remark'),
	(277, '275ssssss', 'mme', 'remark'),
	(278, '276ssssss', 'mme', 'remark'),
	(279, '277ssssss', 'mme', 'remark'),
	(280, '278ssssss', 'mme', 'remark'),
	(281, '279ssssss', 'mme', 'remark'),
	(282, '280ssssss', 'mme', 'remark'),
	(283, '281ssssss', 'mme', 'remark'),
	(284, '282ssssss', 'mme', 'remark'),
	(285, '283ssssss', 'mme', 'remark'),
	(286, '284ssssss', 'mme', 'remark'),
	(287, '285ssssss', 'mme', 'remark'),
	(288, '286ssssss', 'mme', 'remark'),
	(289, '287ssssss', 'mme', 'remark'),
	(290, '288ssssss', 'mme', 'remark'),
	(291, '289ssssss', 'mme', 'remark'),
	(292, '290ssssss', 'mme', 'remark'),
	(293, '291ssssss', 'mme', 'remark'),
	(294, '292ssssss', 'mme', 'remark'),
	(295, '293ssssss', 'mme', 'remark'),
	(296, '294ssssss', 'mme', 'remark'),
	(297, '295ssssss', 'mme', 'remark'),
	(298, '296ssssss', 'mme', 'remark'),
	(299, '297ssssss', 'mme', 'remark'),
	(300, '298ssssss', 'mme', 'remark'),
	(301, '299ssssss', 'mme', 'remark'),
	(302, '300ssssss', 'mme', 'remark'),
	(303, '301ssssss', 'mme', 'remark'),
	(304, '302ssssss', 'mme', 'remark'),
	(305, '303ssssss', 'mme', 'remark'),
	(306, '304ssssss', 'mme', 'remark'),
	(307, '305ssssss', 'mme', 'remark'),
	(308, '306ssssss', 'mme', 'remark'),
	(309, '307ssssss', 'mme', 'remark'),
	(310, '308ssssss', 'mme', 'remark'),
	(311, '309ssssss', 'mme', 'remark'),
	(312, '310ssssss', 'mme', 'remark'),
	(313, '311ssssss', 'mme', 'remark'),
	(314, '312ssssss', 'mme', 'remark'),
	(315, '313ssssss', 'mme', 'remark'),
	(316, '314ssssss', 'mme', 'remark'),
	(317, '315ssssss', 'mme', 'remark'),
	(318, '316ssssss', 'mme', 'remark'),
	(319, '317ssssss', 'mme', 'remark'),
	(320, '318ssssss', 'mme', 'remark'),
	(321, '319ssssss', 'mme', 'remark'),
	(322, '320ssssss', 'mme', 'remark'),
	(323, '321ssssss', 'mme', 'remark'),
	(324, '322ssssss', 'mme', 'remark'),
	(325, '323ssssss', 'mme', 'remark'),
	(326, '324ssssss', 'mme', 'remark'),
	(327, '325ssssss', 'mme', 'remark'),
	(328, '326ssssss', 'mme', 'remark'),
	(329, '327ssssss', 'mme', 'remark'),
	(330, '328ssssss', 'mme', 'remark'),
	(331, '329ssssss', 'mme', 'remark'),
	(332, '330ssssss', 'mme', 'remark'),
	(333, '331ssssss', 'mme', 'remark'),
	(334, '332ssssss', 'mme', 'remark'),
	(335, '333ssssss', 'mme', 'remark'),
	(336, '334ssssss', 'mme', 'remark'),
	(337, '335ssssss', 'mme', 'remark'),
	(338, '336ssssss', 'mme', 'remark'),
	(339, '337ssssss', 'mme', 'remark'),
	(340, '338ssssss', 'mme', 'remark'),
	(341, '339ssssss', 'mme', 'remark'),
	(342, '340ssssss', 'mme', 'remark'),
	(343, '341ssssss', 'mme', 'remark'),
	(344, '342ssssss', 'mme', 'remark'),
	(345, '343ssssss', 'mme', 'remark'),
	(346, '344ssssss', 'mme', 'remark'),
	(347, '345ssssss', 'mme', 'remark'),
	(348, '346ssssss', 'mme', 'remark'),
	(349, '347ssssss', 'mme', 'remark'),
	(350, '348ssssss', 'mme', 'remark'),
	(351, '349ssssss', 'mme', 'remark'),
	(352, '350ssssss', 'mme', 'remark'),
	(353, '351ssssss', 'mme', 'remark'),
	(354, '352ssssss', 'mme', 'remark'),
	(355, '353ssssss', 'mme', 'remark'),
	(356, '354ssssss', 'mme', 'remark'),
	(357, '355ssssss', 'mme', 'remark'),
	(358, '356ssssss', 'mme', 'remark'),
	(359, '357ssssss', 'mme', 'remark'),
	(360, '358ssssss', 'mme', 'remark'),
	(361, '359ssssss', 'mme', 'remark'),
	(362, '360ssssss', 'mme', 'remark'),
	(363, '361ssssss', 'mme', 'remark'),
	(364, '362ssssss', 'mme', 'remark'),
	(365, '363ssssss', 'mme', 'remark'),
	(366, '364ssssss', 'mme', 'remark'),
	(367, '365ssssss', 'mme', 'remark'),
	(368, '366ssssss', 'mme', 'remark'),
	(369, '367ssssss', 'mme', 'remark'),
	(370, '368ssssss', 'mme', 'remark'),
	(371, '369ssssss', 'mme', 'remark'),
	(372, '370ssssss', 'mme', 'remark'),
	(373, '371ssssss', 'mme', 'remark'),
	(374, '372ssssss', 'mme', 'remark'),
	(375, '373ssssss', 'mme', 'remark'),
	(376, '374ssssss', 'mme', 'remark'),
	(377, '375ssssss', 'mme', 'remark'),
	(378, '376ssssss', 'mme', 'remark'),
	(379, '377ssssss', 'mme', 'remark'),
	(380, '378ssssss', 'mme', 'remark'),
	(381, '379ssssss', 'mme', 'remark'),
	(382, '380ssssss', 'mme', 'remark'),
	(383, '381ssssss', 'mme', 'remark'),
	(384, '382ssssss', 'mme', 'remark'),
	(385, '383ssssss', 'mme', 'remark'),
	(386, '384ssssss', 'mme', 'remark'),
	(387, '385ssssss', 'mme', 'remark'),
	(388, '386ssssss', 'mme', 'remark'),
	(389, '387ssssss', 'mme', 'remark'),
	(390, '388ssssss', 'mme', 'remark'),
	(391, '389ssssss', 'mme', 'remark'),
	(392, '390ssssss', 'mme', 'remark'),
	(393, '391ssssss', 'mme', 'remark'),
	(394, '392ssssss', 'mme', 'remark'),
	(395, '393ssssss', 'mme', 'remark'),
	(396, '394ssssss', 'mme', 'remark'),
	(397, '395ssssss', 'mme', 'remark'),
	(398, '396ssssss', 'mme', 'remark'),
	(399, '397ssssss', 'mme', 'remark'),
	(400, '398ssssss', 'mme', 'remark'),
	(401, '399ssssss', 'mme', 'remark'),
	(402, '400ssssss', 'mme', 'remark'),
	(403, '401ssssss', 'mme', 'remark'),
	(404, '402ssssss', 'mme', 'remark'),
	(405, '403ssssss', 'mme', 'remark'),
	(406, '404ssssss', 'mme', 'remark'),
	(407, '405ssssss', 'mme', 'remark'),
	(408, '406ssssss', 'mme', 'remark'),
	(409, '407ssssss', 'mme', 'remark'),
	(410, '408ssssss', 'mme', 'remark'),
	(411, '409ssssss', 'mme', 'remark'),
	(412, '410ssssss', 'mme', 'remark'),
	(413, '411ssssss', 'mme', 'remark'),
	(414, '412ssssss', 'mme', 'remark'),
	(415, '413ssssss', 'mme', 'remark'),
	(416, '414ssssss', 'mme', 'remark'),
	(417, '415ssssss', 'mme', 'remark'),
	(418, '416ssssss', 'mme', 'remark'),
	(419, '417ssssss', 'mme', 'remark'),
	(420, '418ssssss', 'mme', 'remark'),
	(421, '419ssssss', 'mme', 'remark'),
	(422, '420ssssss', 'mme', 'remark'),
	(423, '421ssssss', 'mme', 'remark'),
	(424, '422ssssss', 'mme', 'remark'),
	(425, '423ssssss', 'mme', 'remark'),
	(426, '424ssssss', 'mme', 'remark'),
	(427, '425ssssss', 'mme', 'remark'),
	(428, '426ssssss', 'mme', 'remark'),
	(429, '427ssssss', 'mme', 'remark'),
	(430, '428ssssss', 'mme', 'remark'),
	(431, '429ssssss', 'mme', 'remark'),
	(432, '430ssssss', 'mme', 'remark'),
	(433, '431ssssss', 'mme', 'remark'),
	(434, '432ssssss', 'mme', 'remark'),
	(435, '433ssssss', 'mme', 'remark'),
	(436, '434ssssss', 'mme', 'remark'),
	(437, '435ssssss', 'mme', 'remark'),
	(438, '436ssssss', 'mme', 'remark'),
	(439, '437ssssss', 'mme', 'remark'),
	(440, '438ssssss', 'mme', 'remark'),
	(441, '439ssssss', 'mme', 'remark'),
	(442, '440ssssss', 'mme', 'remark'),
	(443, '441ssssss', 'mme', 'remark'),
	(444, '442ssssss', 'mme', 'remark'),
	(445, '443ssssss', 'mme', 'remark'),
	(446, '444ssssss', 'mme', 'remark'),
	(447, '445ssssss', 'mme', 'remark'),
	(448, '446ssssss', 'mme', 'remark'),
	(449, '447ssssss', 'mme', 'remark'),
	(450, '448ssssss', 'mme', 'remark'),
	(451, '449ssssss', 'mme', 'remark'),
	(452, '450ssssss', 'mme', 'remark'),
	(453, '451ssssss', 'mme', 'remark'),
	(454, '452ssssss', 'mme', 'remark'),
	(455, '453ssssss', 'mme', 'remark'),
	(456, '454ssssss', 'mme', 'remark'),
	(457, '455ssssss', 'mme', 'remark'),
	(458, '456ssssss', 'mme', 'remark'),
	(459, '457ssssss', 'mme', 'remark'),
	(460, '458ssssss', 'mme', 'remark'),
	(461, '459ssssss', 'mme', 'remark'),
	(462, '460ssssss', 'mme', 'remark'),
	(463, '461ssssss', 'mme', 'remark'),
	(464, '462ssssss', 'mme', 'remark'),
	(465, '463ssssss', 'mme', 'remark'),
	(466, '464ssssss', 'mme', 'remark'),
	(467, '465ssssss', 'mme', 'remark'),
	(468, '466ssssss', 'mme', 'remark'),
	(469, '467ssssss', 'mme', 'remark'),
	(470, '468ssssss', 'mme', 'remark'),
	(471, '469ssssss', 'mme', 'remark'),
	(472, '470ssssss', 'mme', 'remark'),
	(473, '471ssssss', 'mme', 'remark'),
	(474, '472ssssss', 'mme', 'remark'),
	(475, '473ssssss', 'mme', 'remark'),
	(476, '474ssssss', 'mme', 'remark'),
	(477, '475ssssss', 'mme', 'remark'),
	(478, '476ssssss', 'mme', 'remark'),
	(479, '477ssssss', 'mme', 'remark'),
	(480, '478ssssss', 'mme', 'remark'),
	(481, '479ssssss', 'mme', 'remark'),
	(482, '480ssssss', 'mme', 'remark'),
	(483, '481ssssss', 'mme', 'remark'),
	(484, '482ssssss', 'mme', 'remark'),
	(485, '483ssssss', 'mme', 'remark'),
	(486, '484ssssss', 'mme', 'remark'),
	(487, '485ssssss', 'mme', 'remark'),
	(488, '486ssssss', 'mme', 'remark'),
	(489, '487ssssss', 'mme', 'remark'),
	(490, '488ssssss', 'mme', 'remark'),
	(491, '489ssssss', 'mme', 'remark'),
	(492, '490ssssss', 'mme', 'remark'),
	(493, '491ssssss', 'mme', 'remark'),
	(494, '492ssssss', 'mme', 'remark'),
	(495, '493ssssss', 'mme', 'remark'),
	(496, '494ssssss', 'mme', 'remark'),
	(497, '495ssssss', 'mme', 'remark'),
	(498, '496ssssss', 'mme', 'remark'),
	(499, '497ssssss', 'mme', 'remark'),
	(500, '498ssssss', 'mme', 'remark'),
	(501, '499ssssss', 'mme', 'remark'),
	(502, '500ssssss', 'mme', 'remark'),
	(503, '501ssssss', 'mme', 'remark'),
	(504, '502ssssss', 'mme', 'remark'),
	(505, '503ssssss', 'mme', 'remark'),
	(506, '504ssssss', 'mme', 'remark'),
	(507, '505ssssss', 'mme', 'remark'),
	(508, '506ssssss', 'mme', 'remark'),
	(509, '507ssssss', 'mme', 'remark'),
	(510, '508ssssss', 'mme', 'remark'),
	(511, '509ssssss', 'mme', 'remark'),
	(512, '510ssssss', 'mme', 'remark'),
	(513, '511ssssss', 'mme', 'remark'),
	(514, '512ssssss', 'mme', 'remark'),
	(515, '513ssssss', 'mme', 'remark'),
	(516, '514ssssss', 'mme', 'remark'),
	(517, '515ssssss', 'mme', 'remark'),
	(518, '516ssssss', 'mme', 'remark'),
	(519, '517ssssss', 'mme', 'remark'),
	(520, '518ssssss', 'mme', 'remark'),
	(521, '519ssssss', 'mme', 'remark'),
	(522, '520ssssss', 'mme', 'remark'),
	(523, '521ssssss', 'mme', 'remark'),
	(524, '522ssssss', 'mme', 'remark'),
	(525, '523ssssss', 'mme', 'remark'),
	(526, '524ssssss', 'mme', 'remark'),
	(527, '525ssssss', 'mme', 'remark'),
	(528, '526ssssss', 'mme', 'remark'),
	(529, '527ssssss', 'mme', 'remark'),
	(530, '528ssssss', 'mme', 'remark'),
	(531, '529ssssss', 'mme', 'remark'),
	(532, '530ssssss', 'mme', 'remark'),
	(533, '531ssssss', 'mme', 'remark'),
	(534, '532ssssss', 'mme', 'remark'),
	(535, '533ssssss', 'mme', 'remark'),
	(536, '534ssssss', 'mme', 'remark'),
	(537, '535ssssss', 'mme', 'remark'),
	(538, '536ssssss', 'mme', 'remark'),
	(539, '537ssssss', 'mme', 'remark'),
	(540, '538ssssss', 'mme', 'remark'),
	(541, '539ssssss', 'mme', 'remark'),
	(542, '540ssssss', 'mme', 'remark'),
	(543, '541ssssss', 'mme', 'remark'),
	(544, '542ssssss', 'mme', 'remark'),
	(545, '543ssssss', 'mme', 'remark'),
	(546, '544ssssss', 'mme', 'remark'),
	(547, '545ssssss', 'mme', 'remark'),
	(548, '546ssssss', 'mme', 'remark'),
	(549, '547ssssss', 'mme', 'remark'),
	(550, '548ssssss', 'mme', 'remark'),
	(551, '549ssssss', 'mme', 'remark'),
	(552, '550ssssss', 'mme', 'remark'),
	(553, '551ssssss', 'mme', 'remark'),
	(554, '552ssssss', 'mme', 'remark'),
	(555, '553ssssss', 'mme', 'remark'),
	(556, '554ssssss', 'mme', 'remark'),
	(557, '555ssssss', 'mme', 'remark'),
	(558, '556ssssss', 'mme', 'remark'),
	(559, '557ssssss', 'mme', 'remark'),
	(560, '558ssssss', 'mme', 'remark'),
	(561, '559ssssss', 'mme', 'remark'),
	(562, '560ssssss', 'mme', 'remark'),
	(563, '561ssssss', 'mme', 'remark'),
	(564, '562ssssss', 'mme', 'remark'),
	(565, '563ssssss', 'mme', 'remark'),
	(566, '564ssssss', 'mme', 'remark'),
	(567, '565ssssss', 'mme', 'remark'),
	(568, '566ssssss', 'mme', 'remark'),
	(569, '567ssssss', 'mme', 'remark'),
	(570, '568ssssss', 'mme', 'remark'),
	(571, '569ssssss', 'mme', 'remark'),
	(572, '570ssssss', 'mme', 'remark'),
	(573, '571ssssss', 'mme', 'remark'),
	(574, '572ssssss', 'mme', 'remark'),
	(575, '573ssssss', 'mme', 'remark'),
	(576, '574ssssss', 'mme', 'remark'),
	(577, '575ssssss', 'mme', 'remark'),
	(578, '576ssssss', 'mme', 'remark'),
	(579, '577ssssss', 'mme', 'remark'),
	(580, '578ssssss', 'mme', 'remark'),
	(581, '579ssssss', 'mme', 'remark'),
	(582, '580ssssss', 'mme', 'remark'),
	(583, '581ssssss', 'mme', 'remark'),
	(584, '582ssssss', 'mme', 'remark'),
	(585, '583ssssss', 'mme', 'remark'),
	(586, '584ssssss', 'mme', 'remark'),
	(587, '585ssssss', 'mme', 'remark'),
	(588, '586ssssss', 'mme', 'remark'),
	(589, '587ssssss', 'mme', 'remark'),
	(590, '588ssssss', 'mme', 'remark'),
	(591, '589ssssss', 'mme', 'remark'),
	(592, '590ssssss', 'mme', 'remark'),
	(593, '591ssssss', 'mme', 'remark'),
	(594, '592ssssss', 'mme', 'remark'),
	(595, '593ssssss', 'mme', 'remark'),
	(596, '594ssssss', 'mme', 'remark'),
	(597, '595ssssss', 'mme', 'remark'),
	(598, '596ssssss', 'mme', 'remark'),
	(599, '597ssssss', 'mme', 'remark'),
	(600, '598ssssss', 'mme', 'remark'),
	(601, '599ssssss', 'mme', 'remark'),
	(602, '600ssssss', 'mme', 'remark'),
	(603, '601ssssss', 'mme', 'remark'),
	(604, '602ssssss', 'mme', 'remark'),
	(605, '603ssssss', 'mme', 'remark'),
	(606, '604ssssss', 'mme', 'remark'),
	(607, '605ssssss', 'mme', 'remark'),
	(608, '606ssssss', 'mme', 'remark'),
	(609, '607ssssss', 'mme', 'remark'),
	(610, '608ssssss', 'mme', 'remark'),
	(611, '609ssssss', 'mme', 'remark'),
	(612, '610ssssss', 'mme', 'remark'),
	(613, '611ssssss', 'mme', 'remark'),
	(614, '612ssssss', 'mme', 'remark'),
	(615, '613ssssss', 'mme', 'remark'),
	(616, '614ssssss', 'mme', 'remark'),
	(617, '615ssssss', 'mme', 'remark'),
	(618, '616ssssss', 'mme', 'remark'),
	(619, '617ssssss', 'mme', 'remark'),
	(620, '618ssssss', 'mme', 'remark'),
	(621, '619ssssss', 'mme', 'remark'),
	(622, '620ssssss', 'mme', 'remark'),
	(623, '621ssssss', 'mme', 'remark'),
	(624, '622ssssss', 'mme', 'remark'),
	(625, '623ssssss', 'mme', 'remark'),
	(626, '624ssssss', 'mme', 'remark'),
	(627, '625ssssss', 'mme', 'remark'),
	(628, '626ssssss', 'mme', 'remark'),
	(629, '627ssssss', 'mme', 'remark'),
	(630, '628ssssss', 'mme', 'remark'),
	(631, '629ssssss', 'mme', 'remark'),
	(632, '630ssssss', 'mme', 'remark'),
	(633, '631ssssss', 'mme', 'remark'),
	(634, '632ssssss', 'mme', 'remark'),
	(635, '633ssssss', 'mme', 'remark'),
	(636, '634ssssss', 'mme', 'remark'),
	(637, '635ssssss', 'mme', 'remark'),
	(638, '636ssssss', 'mme', 'remark'),
	(639, '637ssssss', 'mme', 'remark'),
	(640, '638ssssss', 'mme', 'remark'),
	(641, '639ssssss', 'mme', 'remark'),
	(642, '640ssssss', 'mme', 'remark'),
	(643, '641ssssss', 'mme', 'remark'),
	(644, '642ssssss', 'mme', 'remark'),
	(645, '643ssssss', 'mme', 'remark'),
	(646, '644ssssss', 'mme', 'remark'),
	(647, '645ssssss', 'mme', 'remark'),
	(648, '646ssssss', 'mme', 'remark'),
	(649, '647ssssss', 'mme', 'remark'),
	(650, '648ssssss', 'mme', 'remark'),
	(651, '649ssssss', 'mme', 'remark'),
	(652, '650ssssss', 'mme', 'remark'),
	(653, '651ssssss', 'mme', 'remark'),
	(654, '652ssssss', 'mme', 'remark'),
	(655, '653ssssss', 'mme', 'remark'),
	(656, '654ssssss', 'mme', 'remark'),
	(657, '655ssssss', 'mme', 'remark'),
	(658, '656ssssss', 'mme', 'remark'),
	(659, '657ssssss', 'mme', 'remark'),
	(660, '658ssssss', 'mme', 'remark'),
	(661, '659ssssss', 'mme', 'remark'),
	(662, '660ssssss', 'mme', 'remark'),
	(663, '661ssssss', 'mme', 'remark'),
	(664, '662ssssss', 'mme', 'remark'),
	(665, '663ssssss', 'mme', 'remark'),
	(666, '664ssssss', 'mme', 'remark'),
	(667, '665ssssss', 'mme', 'remark'),
	(668, '666ssssss', 'mme', 'remark'),
	(669, '667ssssss', 'mme', 'remark'),
	(670, '668ssssss', 'mme', 'remark'),
	(671, '669ssssss', 'mme', 'remark'),
	(672, '670ssssss', 'mme', 'remark'),
	(673, '671ssssss', 'mme', 'remark'),
	(674, '672ssssss', 'mme', 'remark'),
	(675, '673ssssss', 'mme', 'remark'),
	(676, '674ssssss', 'mme', 'remark'),
	(677, '675ssssss', 'mme', 'remark'),
	(678, '676ssssss', 'mme', 'remark'),
	(679, '677ssssss', 'mme', 'remark'),
	(680, '678ssssss', 'mme', 'remark'),
	(681, '679ssssss', 'mme', 'remark'),
	(682, '680ssssss', 'mme', 'remark'),
	(683, '681ssssss', 'mme', 'remark'),
	(684, '682ssssss', 'mme', 'remark'),
	(685, '683ssssss', 'mme', 'remark'),
	(686, '684ssssss', 'mme', 'remark'),
	(687, '685ssssss', 'mme', 'remark'),
	(688, '686ssssss', 'mme', 'remark'),
	(689, '687ssssss', 'mme', 'remark'),
	(690, '688ssssss', 'mme', 'remark'),
	(691, '689ssssss', 'mme', 'remark'),
	(692, '690ssssss', 'mme', 'remark'),
	(693, '691ssssss', 'mme', 'remark'),
	(694, '692ssssss', 'mme', 'remark'),
	(695, '693ssssss', 'mme', 'remark'),
	(696, '694ssssss', 'mme', 'remark'),
	(697, '695ssssss', 'mme', 'remark'),
	(698, '696ssssss', 'mme', 'remark'),
	(699, '697ssssss', 'mme', 'remark'),
	(700, '698ssssss', 'mme', 'remark'),
	(701, '699ssssss', 'mme', 'remark'),
	(702, '700ssssss', 'mme', 'remark'),
	(703, '701ssssss', 'mme', 'remark'),
	(704, '702ssssss', 'mme', 'remark'),
	(705, '703ssssss', 'mme', 'remark'),
	(706, '704ssssss', 'mme', 'remark'),
	(707, '705ssssss', 'mme', 'remark'),
	(708, '706ssssss', 'mme', 'remark'),
	(709, '707ssssss', 'mme', 'remark'),
	(710, '708ssssss', 'mme', 'remark'),
	(711, '709ssssss', 'mme', 'remark'),
	(712, '710ssssss', 'mme', 'remark'),
	(713, '711ssssss', 'mme', 'remark'),
	(714, '712ssssss', 'mme', 'remark'),
	(715, '713ssssss', 'mme', 'remark'),
	(716, '714ssssss', 'mme', 'remark'),
	(717, '715ssssss', 'mme', 'remark'),
	(718, '716ssssss', 'mme', 'remark'),
	(719, '717ssssss', 'mme', 'remark'),
	(720, '718ssssss', 'mme', 'remark'),
	(721, '719ssssss', 'mme', 'remark'),
	(722, '720ssssss', 'mme', 'remark'),
	(723, '721ssssss', 'mme', 'remark'),
	(724, '722ssssss', 'mme', 'remark'),
	(725, '723ssssss', 'mme', 'remark'),
	(726, '724ssssss', 'mme', 'remark'),
	(727, '725ssssss', 'mme', 'remark'),
	(728, '726ssssss', 'mme', 'remark'),
	(729, '727ssssss', 'mme', 'remark'),
	(730, '728ssssss', 'mme', 'remark'),
	(731, '729ssssss', 'mme', 'remark'),
	(732, '730ssssss', 'mme', 'remark'),
	(733, '731ssssss', 'mme', 'remark'),
	(734, '732ssssss', 'mme', 'remark'),
	(735, '733ssssss', 'mme', 'remark'),
	(736, '734ssssss', 'mme', 'remark'),
	(737, '735ssssss', 'mme', 'remark'),
	(738, '736ssssss', 'mme', 'remark'),
	(739, '737ssssss', 'mme', 'remark'),
	(740, '738ssssss', 'mme', 'remark'),
	(741, '739ssssss', 'mme', 'remark'),
	(742, '740ssssss', 'mme', 'remark'),
	(743, '741ssssss', 'mme', 'remark'),
	(744, '742ssssss', 'mme', 'remark'),
	(745, '743ssssss', 'mme', 'remark'),
	(746, '744ssssss', 'mme', 'remark'),
	(747, '745ssssss', 'mme', 'remark'),
	(748, '746ssssss', 'mme', 'remark'),
	(749, '747ssssss', 'mme', 'remark'),
	(750, '748ssssss', 'mme', 'remark'),
	(751, '749ssssss', 'mme', 'remark'),
	(752, '750ssssss', 'mme', 'remark'),
	(753, '751ssssss', 'mme', 'remark'),
	(754, '752ssssss', 'mme', 'remark'),
	(755, '753ssssss', 'mme', 'remark'),
	(756, '754ssssss', 'mme', 'remark'),
	(757, '755ssssss', 'mme', 'remark'),
	(758, '756ssssss', 'mme', 'remark'),
	(759, '757ssssss', 'mme', 'remark'),
	(760, '758ssssss', 'mme', 'remark'),
	(761, '759ssssss', 'mme', 'remark'),
	(762, '760ssssss', 'mme', 'remark'),
	(763, '761ssssss', 'mme', 'remark'),
	(764, '762ssssss', 'mme', 'remark'),
	(765, '763ssssss', 'mme', 'remark'),
	(766, '764ssssss', 'mme', 'remark'),
	(767, '765ssssss', 'mme', 'remark'),
	(768, '766ssssss', 'mme', 'remark'),
	(769, '767ssssss', 'mme', 'remark'),
	(770, '768ssssss', 'mme', 'remark'),
	(771, '769ssssss', 'mme', 'remark'),
	(772, '770ssssss', 'mme', 'remark'),
	(773, '771ssssss', 'mme', 'remark'),
	(774, '772ssssss', 'mme', 'remark'),
	(775, '773ssssss', 'mme', 'remark'),
	(776, '774ssssss', 'mme', 'remark'),
	(777, '775ssssss', 'mme', 'remark'),
	(778, '776ssssss', 'mme', 'remark'),
	(779, '777ssssss', 'mme', 'remark'),
	(780, '778ssssss', 'mme', 'remark'),
	(781, '779ssssss', 'mme', 'remark'),
	(782, '780ssssss', 'mme', 'remark'),
	(783, '781ssssss', 'mme', 'remark'),
	(784, '782ssssss', 'mme', 'remark'),
	(785, '783ssssss', 'mme', 'remark'),
	(786, '784ssssss', 'mme', 'remark'),
	(787, '785ssssss', 'mme', 'remark'),
	(788, '786ssssss', 'mme', 'remark'),
	(789, '787ssssss', 'mme', 'remark'),
	(790, '788ssssss', 'mme', 'remark'),
	(791, '789ssssss', 'mme', 'remark'),
	(792, '790ssssss', 'mme', 'remark'),
	(793, '791ssssss', 'mme', 'remark'),
	(794, '792ssssss', 'mme', 'remark'),
	(795, '793ssssss', 'mme', 'remark'),
	(796, '794ssssss', 'mme', 'remark'),
	(797, '795ssssss', 'mme', 'remark'),
	(798, '796ssssss', 'mme', 'remark'),
	(799, '797ssssss', 'mme', 'remark'),
	(800, '798ssssss', 'mme', 'remark'),
	(801, '799ssssss', 'mme', 'remark'),
	(802, '800ssssss', 'mme', 'remark'),
	(803, '801ssssss', 'mme', 'remark'),
	(804, '802ssssss', 'mme', 'remark'),
	(805, '803ssssss', 'mme', 'remark'),
	(806, '804ssssss', 'mme', 'remark'),
	(807, '805ssssss', 'mme', 'remark'),
	(808, '806ssssss', 'mme', 'remark'),
	(809, '807ssssss', 'mme', 'remark'),
	(810, '808ssssss', 'mme', 'remark'),
	(811, '809ssssss', 'mme', 'remark'),
	(812, '810ssssss', 'mme', 'remark'),
	(813, '811ssssss', 'mme', 'remark'),
	(814, '812ssssss', 'mme', 'remark'),
	(815, '813ssssss', 'mme', 'remark'),
	(816, '814ssssss', 'mme', 'remark'),
	(817, '815ssssss', 'mme', 'remark'),
	(818, '816ssssss', 'mme', 'remark'),
	(819, '817ssssss', 'mme', 'remark'),
	(820, '818ssssss', 'mme', 'remark'),
	(821, '819ssssss', 'mme', 'remark'),
	(822, '820ssssss', 'mme', 'remark'),
	(823, '821ssssss', 'mme', 'remark'),
	(824, '822ssssss', 'mme', 'remark'),
	(825, '823ssssss', 'mme', 'remark'),
	(826, '824ssssss', 'mme', 'remark'),
	(827, '825ssssss', 'mme', 'remark'),
	(828, '826ssssss', 'mme', 'remark'),
	(829, '827ssssss', 'mme', 'remark'),
	(830, '828ssssss', 'mme', 'remark'),
	(831, '829ssssss', 'mme', 'remark'),
	(832, '830ssssss', 'mme', 'remark'),
	(833, '831ssssss', 'mme', 'remark'),
	(834, '832ssssss', 'mme', 'remark'),
	(835, '833ssssss', 'mme', 'remark'),
	(836, '834ssssss', 'mme', 'remark'),
	(837, '835ssssss', 'mme', 'remark'),
	(838, '836ssssss', 'mme', 'remark'),
	(839, '837ssssss', 'mme', 'remark'),
	(840, '838ssssss', 'mme', 'remark'),
	(841, '839ssssss', 'mme', 'remark'),
	(842, '840ssssss', 'mme', 'remark'),
	(843, '841ssssss', 'mme', 'remark'),
	(844, '842ssssss', 'mme', 'remark'),
	(845, '843ssssss', 'mme', 'remark'),
	(846, '844ssssss', 'mme', 'remark'),
	(847, '845ssssss', 'mme', 'remark'),
	(848, '846ssssss', 'mme', 'remark'),
	(849, '847ssssss', 'mme', 'remark'),
	(850, '848ssssss', 'mme', 'remark'),
	(851, '849ssssss', 'mme', 'remark'),
	(852, '850ssssss', 'mme', 'remark'),
	(853, '851ssssss', 'mme', 'remark'),
	(854, '852ssssss', 'mme', 'remark'),
	(855, '853ssssss', 'mme', 'remark'),
	(856, '854ssssss', 'mme', 'remark'),
	(857, '855ssssss', 'mme', 'remark'),
	(858, '856ssssss', 'mme', 'remark'),
	(859, '857ssssss', 'mme', 'remark'),
	(860, '858ssssss', 'mme', 'remark'),
	(861, '859ssssss', 'mme', 'remark'),
	(862, '860ssssss', 'mme', 'remark'),
	(863, '861ssssss', 'mme', 'remark'),
	(864, '862ssssss', 'mme', 'remark'),
	(865, '863ssssss', 'mme', 'remark'),
	(866, '864ssssss', 'mme', 'remark'),
	(867, '865ssssss', 'mme', 'remark'),
	(868, '866ssssss', 'mme', 'remark'),
	(869, '867ssssss', 'mme', 'remark'),
	(870, '868ssssss', 'mme', 'remark'),
	(871, '869ssssss', 'mme', 'remark'),
	(872, '870ssssss', 'mme', 'remark'),
	(873, '871ssssss', 'mme', 'remark'),
	(874, '872ssssss', 'mme', 'remark'),
	(875, '873ssssss', 'mme', 'remark'),
	(876, '874ssssss', 'mme', 'remark'),
	(877, '875ssssss', 'mme', 'remark'),
	(878, '876ssssss', 'mme', 'remark'),
	(879, '877ssssss', 'mme', 'remark'),
	(880, '878ssssss', 'mme', 'remark'),
	(881, '879ssssss', 'mme', 'remark'),
	(882, '880ssssss', 'mme', 'remark'),
	(883, '881ssssss', 'mme', 'remark'),
	(884, '882ssssss', 'mme', 'remark'),
	(885, '883ssssss', 'mme', 'remark'),
	(886, '884ssssss', 'mme', 'remark'),
	(887, '885ssssss', 'mme', 'remark'),
	(888, '886ssssss', 'mme', 'remark'),
	(889, '887ssssss', 'mme', 'remark'),
	(890, '888ssssss', 'mme', 'remark'),
	(891, '889ssssss', 'mme', 'remark'),
	(892, '890ssssss', 'mme', 'remark'),
	(893, '891ssssss', 'mme', 'remark'),
	(894, '892ssssss', 'mme', 'remark'),
	(895, '893ssssss', 'mme', 'remark'),
	(896, '894ssssss', 'mme', 'remark'),
	(897, '895ssssss', 'mme', 'remark'),
	(898, '896ssssss', 'mme', 'remark'),
	(899, '897ssssss', 'mme', 'remark'),
	(900, '898ssssss', 'mme', 'remark'),
	(901, '899ssssss', 'mme', 'remark'),
	(902, '900ssssss', 'mme', 'remark'),
	(903, '901ssssss', 'mme', 'remark'),
	(904, '902ssssss', 'mme', 'remark'),
	(905, '903ssssss', 'mme', 'remark'),
	(906, '904ssssss', 'mme', 'remark'),
	(907, '905ssssss', 'mme', 'remark'),
	(908, '906ssssss', 'mme', 'remark'),
	(909, '907ssssss', 'mme', 'remark'),
	(910, '908ssssss', 'mme', 'remark'),
	(911, '909ssssss', 'mme', 'remark'),
	(912, '910ssssss', 'mme', 'remark'),
	(913, '911ssssss', 'mme', 'remark'),
	(914, '912ssssss', 'mme', 'remark'),
	(915, '913ssssss', 'mme', 'remark'),
	(916, '914ssssss', 'mme', 'remark'),
	(917, '915ssssss', 'mme', 'remark'),
	(918, '916ssssss', 'mme', 'remark'),
	(919, '917ssssss', 'mme', 'remark'),
	(920, '918ssssss', 'mme', 'remark'),
	(921, '919ssssss', 'mme', 'remark'),
	(922, '920ssssss', 'mme', 'remark'),
	(923, '921ssssss', 'mme', 'remark'),
	(924, '922ssssss', 'mme', 'remark'),
	(925, '923ssssss', 'mme', 'remark'),
	(926, '924ssssss', 'mme', 'remark'),
	(927, '925ssssss', 'mme', 'remark'),
	(928, '926ssssss', 'mme', 'remark'),
	(929, '927ssssss', 'mme', 'remark'),
	(930, '928ssssss', 'mme', 'remark'),
	(931, '929ssssss', 'mme', 'remark'),
	(932, '930ssssss', 'mme', 'remark'),
	(933, '931ssssss', 'mme', 'remark'),
	(934, '932ssssss', 'mme', 'remark'),
	(935, '933ssssss', 'mme', 'remark'),
	(936, '934ssssss', 'mme', 'remark'),
	(937, '935ssssss', 'mme', 'remark'),
	(938, '936ssssss', 'mme', 'remark'),
	(939, '937ssssss', 'mme', 'remark'),
	(940, '938ssssss', 'mme', 'remark'),
	(941, '939ssssss', 'mme', 'remark'),
	(942, '940ssssss', 'mme', 'remark'),
	(943, '941ssssss', 'mme', 'remark'),
	(944, '942ssssss', 'mme', 'remark'),
	(945, '943ssssss', 'mme', 'remark'),
	(946, '944ssssss', 'mme', 'remark'),
	(947, '945ssssss', 'mme', 'remark'),
	(948, '946ssssss', 'mme', 'remark'),
	(949, '947ssssss', 'mme', 'remark'),
	(950, '948ssssss', 'mme', 'remark'),
	(951, '949ssssss', 'mme', 'remark'),
	(952, '950ssssss', 'mme', 'remark'),
	(953, '951ssssss', 'mme', 'remark'),
	(954, '952ssssss', 'mme', 'remark'),
	(955, '953ssssss', 'mme', 'remark'),
	(956, '954ssssss', 'mme', 'remark'),
	(957, '955ssssss', 'mme', 'remark'),
	(958, '956ssssss', 'mme', 'remark'),
	(959, '957ssssss', 'mme', 'remark'),
	(960, '958ssssss', 'mme', 'remark'),
	(961, '959ssssss', 'mme', 'remark'),
	(962, '960ssssss', 'mme', 'remark'),
	(963, '961ssssss', 'mme', 'remark'),
	(964, '962ssssss', 'mme', 'remark'),
	(965, '963ssssss', 'mme', 'remark'),
	(966, '964ssssss', 'mme', 'remark'),
	(967, '965ssssss', 'mme', 'remark'),
	(968, '966ssssss', 'mme', 'remark'),
	(969, '967ssssss', 'mme', 'remark'),
	(970, '968ssssss', 'mme', 'remark'),
	(971, '969ssssss', 'mme', 'remark'),
	(972, '970ssssss', 'mme', 'remark'),
	(973, '971ssssss', 'mme', 'remark'),
	(974, '972ssssss', 'mme', 'remark'),
	(975, '973ssssss', 'mme', 'remark'),
	(976, '974ssssss', 'mme', 'remark'),
	(977, '975ssssss', 'mme', 'remark'),
	(978, '976ssssss', 'mme', 'remark'),
	(979, '977ssssss', 'mme', 'remark'),
	(980, '978ssssss', 'mme', 'remark'),
	(981, '979ssssss', 'mme', 'remark'),
	(982, '980ssssss', 'mme', 'remark'),
	(983, '981ssssss', 'mme', 'remark'),
	(984, '982ssssss', 'mme', 'remark'),
	(985, '983ssssss', 'mme', 'remark'),
	(986, '984ssssss', 'mme', 'remark'),
	(987, '985ssssss', 'mme', 'remark'),
	(988, '986ssssss', 'mme', 'remark'),
	(989, '987ssssss', 'mme', 'remark'),
	(990, '988ssssss', 'mme', 'remark'),
	(991, '989ssssss', 'mme', 'remark'),
	(992, '990ssssss', 'mme', 'remark'),
	(993, '991ssssss', 'mme', 'remark'),
	(994, '992ssssss', 'mme', 'remark'),
	(995, '993ssssss', 'mme', 'remark'),
	(996, '994ssssss', 'mme', 'remark'),
	(997, '995ssssss', 'mme', 'remark'),
	(998, '996ssssss', 'mme', 'remark'),
	(999, '997ssssss', 'mme', 'remark'),
	(1000, '998ssssss', 'mme', 'remark'),
	(1001, '999ssssss', 'mme', 'remark'),
	(1002, '1000ssssss', 'mme', 'remark'),
	(1003, '1001ssssss', 'mme', 'remark'),
	(1004, '1002ssssss', 'mme', 'remark'),
	(1005, '1003ssssss', 'mme', 'remark'),
	(1006, '1004ssssss', 'mme', 'remark'),
	(1007, '1005ssssss', 'mme', 'remark'),
	(1008, '1006ssssss', 'mme', 'remark'),
	(1009, '1007ssssss', 'mme', 'remark'),
	(1010, '1008ssssss', 'mme', 'remark'),
	(1011, '1009ssssss', 'mme', 'remark'),
	(1012, '1010ssssss', 'mme', 'remark'),
	(1013, '1011ssssss', 'mme', 'remark'),
	(1014, '1012ssssss', 'mme', 'remark'),
	(1015, '1013ssssss', 'mme', 'remark'),
	(1016, '1014ssssss', 'mme', 'remark'),
	(1017, '1015ssssss', 'mme', 'remark'),
	(1018, '1016ssssss', 'mme', 'remark'),
	(1019, '1017ssssss', 'mme', 'remark'),
	(1020, '1018ssssss', 'mme', 'remark'),
	(1021, '1019ssssss', 'mme', 'remark'),
	(1022, '1020ssssss', 'mme', 'remark'),
	(1023, '1021ssssss', 'mme', 'remark'),
	(1024, '1022ssssss', 'mme', 'remark'),
	(1025, '1023ssssss', 'mme', 'remark'),
	(1026, '1024ssssss', 'mme', 'remark'),
	(1027, '1025ssssss', 'mme', 'remark'),
	(1028, '1026ssssss', 'mme', 'remark'),
	(1029, '1027ssssss', 'mme', 'remark'),
	(1030, '1028ssssss', 'mme', 'remark'),
	(1031, '1029ssssss', 'mme', 'remark'),
	(1032, '1030ssssss', 'mme', 'remark'),
	(1033, '1031ssssss', 'mme', 'remark'),
	(1034, '1032ssssss', 'mme', 'remark'),
	(1035, '1033ssssss', 'mme', 'remark'),
	(1036, '1034ssssss', 'mme', 'remark'),
	(1037, '1035ssssss', 'mme', 'remark'),
	(1038, '1036ssssss', 'mme', 'remark'),
	(1039, '1037ssssss', 'mme', 'remark'),
	(1040, '1038ssssss', 'mme', 'remark'),
	(1041, '1039ssssss', 'mme', 'remark'),
	(1042, '1040ssssss', 'mme', 'remark'),
	(1043, '1041ssssss', 'mme', 'remark'),
	(1044, '1042ssssss', 'mme', 'remark'),
	(1045, '1043ssssss', 'mme', 'remark'),
	(1046, '1044ssssss', 'mme', 'remark'),
	(1047, '1045ssssss', 'mme', 'remark'),
	(1048, '1046ssssss', 'mme', 'remark'),
	(1049, '1047ssssss', 'mme', 'remark'),
	(1050, '1048ssssss', 'mme', 'remark'),
	(1051, '1049ssssss', 'mme', 'remark'),
	(1052, '1050ssssss', 'mme', 'remark'),
	(1053, '1051ssssss', 'mme', 'remark'),
	(1054, '1052ssssss', 'mme', 'remark'),
	(1055, '1053ssssss', 'mme', 'remark'),
	(1056, '1054ssssss', 'mme', 'remark'),
	(1057, '1055ssssss', 'mme', 'remark'),
	(1058, '1056ssssss', 'mme', 'remark'),
	(1059, '1057ssssss', 'mme', 'remark'),
	(1060, '1058ssssss', 'mme', 'remark'),
	(1061, '1059ssssss', 'mme', 'remark');
/*!40000 ALTER TABLE `atesttable` ENABLE KEYS */;

-- 导出  表 ebc_debug.attachment 结构
CREATE TABLE IF NOT EXISTS `attachment` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Module` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Key` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileName` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `OwnerId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Attachment_FileId` (`FileId`),
  KEY `Attachment_ProjectId` (`ProjectId`),
  KEY `Attachment_OwnerId` (`OwnerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.attachment 的数据：~149 rows (大约)
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
REPLACE INTO `attachment` (`Id`, `OrderNo`, `ProjectId`, `Module`, `Key`, `FileName`, `FileId`, `Remark`, `Ver`, `OwnerId`, `CreateDate`) VALUES
	('0400dc1801014765a0faf4dd011978b2', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, 'd7007d00725741049ff5a419d877bf78.jpg', '4a082810ffee44eb9d6c58c6081b48ed', '', 0, '869ae2d523a04e75810d62bba7963ad9', NULL),
	('09aa0c04c070436b87db3ec62a21d43c', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'a59c64215fb94be98ac69f2371005183.jpg', 'b7471a0ab4394bf495b2001b86d246c1', '', 0, '61bf74edff424dd0bba8e3d0cefd3d49', '2018-05-22 22:10:47'),
	('0b015ce1585046a782170dbfacfb23af', 0, '', '', NULL, 'd10c148b3f1a400282685e9cd2df5fd3.jpg', '984e7c638514443d845a3589ea438411', '', 0, '58c41295325f451a956a627aded7691e', NULL),
	('0f675f62c6da48e19b30802d07d2750e', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '4e301e922d81411c84095dc52d36d7cc.jpg', '97e0d8f5a3e447bba0d263eca44aa934', '', 0, '066fbee06f754aee81b4fde105463845', '2018-05-27 16:33:17'),
	('1d86f388097146c58792f0a76dab560a', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, '76042ffe3cf24a518c1c03c67b2865dc.jpg', '551ae516e5ad48149be0c27b71148d29', '', 0, '869ae2d523a04e75810d62bba7963ad9', '2018-04-23 13:08:48'),
	('1fc57de11fbc49a58023631ff6f8895b', 0, '5aca1dfbc01c812254220001', '', NULL, '1a20a37fe5da4c42b8eb248b0eaa2d70.jpg', '5e9a15fb74564212a4e16a6625327c3e', '', 0, '6f3929b29c6b4f629b2f1950a6963843', NULL),
	('208a56833f7245e48ba4938700bb39f7', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, '93d1ce994eb74189846d1d664cce18b6.jpg', '8513372427f3487ba5832237955ac899', '', 0, 'ae05f09b724248a681d2dbe91469df21', '2018-04-23 14:09:52'),
	('2dc708d600de4e1da7dbbec2c809a0b8', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '297767fe7a19435389e29c0721643be6.jpg', '43c751d15ede472d9cb986e503bbdd5e', '', 0, 'a840c404df7346508b10d3e3d1e1388e', '2018-05-23 21:00:31'),
	('318264aa9e364c5d95eeaf1d5bda1034', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '229a8b02a3084a6bad055aaf651b38ed.jpg', '02e88672df2144548a16f848b639bbd7', '', 0, '1efe6a86426243ec860079bc9bf1f20e', '2018-05-23 22:36:57'),
	('32417852f00a42618b05e48eadea8760', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, 'd2cd027fe9be4bbe865dc7c08495b0fe.jpg', '55c7372f94be40758bbbc1abd5c4136b', '', 0, '869ae2d523a04e75810d62bba7963ad9', '2018-04-23 13:35:03'),
	('3a71cc5c8c0d461683fae78d199253bb', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, 'b6a7a26d0a104ac49becce3d8fff738a.jpg', 'd025be64ea4e48758453486645afb2ab', '', 0, '513a38eb0ae1487b8ec425ac73a7f7b8', '2018-04-23 14:00:04'),
	('3aa0531a0402457eaeb882e2a52e43ad', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '4c67efba87b6497d80aa6af22704bc36.jpg', '2abf4faa331a4e5e8c181f33e4a2312a', '', 0, '066fbee06f754aee81b4fde105463845', '2018-05-27 16:33:17'),
	('42b6a92b73cd47cc8a37b5d7d09bc906', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '2b928ee2e6c64e4487a5cb6788c5ee62.png', '827a50104251488bae665a99729056a3', '', 0, '8bb40e9b36874de18f802e4e5d9d6a60', '2018-05-23 22:02:50'),
	('45708e37327047d480fc4f8fb9f515ca', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, '20c7539812274aa8958098152e02f0d4.jpg', 'cd033d6337b8447d862b8eec4f825a41', '', 0, '7a8df40ebb344db5aa5f8e029c4cdac8', '2018-04-23 13:11:22'),
	('55a0941e4f23433192eca6c5a7d13c9f', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, '9c8ab49016424ea58d1089cd9ec0e18c.jpg', '70a4581db0164d938273e5d5c63ef2e3', '', 0, '8b315655f5964b31aac98d2bc5d2f358', '2018-04-23 14:01:25'),
	('55b07eb6668641a38e12568cb3f1eda9', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, '1aa4ca348b6f43cea590cab6eefc421c.jpg', 'e86a23d6401e495288021e2e4c915b78', '', 0, '82241642b3ea44f78d78c2af773e84e8', NULL),
	('5b0a6d4dc01c812c98000001', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, 'a0f9fcff27d0441a8a79adf13dfc6a9e.jpg', '7a384cf2a908410b8b1bffa92e1d19bc', '', 0, '066fbee06f754aee81b4fde105463845', '2018-05-27 16:33:17'),
	('5b0a6d4dc01c812c98000002', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '4c67efba87b6497d80aa6af22704bc36.jpg', '2abf4faa331a4e5e8c181f33e4a2312a', '', 0, '066fbee06f754aee81b4fde105463845', '2018-05-27 16:33:17'),
	('5b0a6d4dc01c812c98000003', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, 'd5cc687a0d664e4fa5240b5e667ed3b2.jpg', '59a690eec0b241028fe19ebb13c75667', '', 0, '066fbee06f754aee81b4fde105463845', '2018-05-27 16:33:17'),
	('5b0a6d4dc01c812c98000004', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '4e301e922d81411c84095dc52d36d7cc.jpg', '97e0d8f5a3e447bba0d263eca44aa934', '', 0, '066fbee06f754aee81b4fde105463845', '2018-05-27 16:33:17'),
	('5b0a6d4dc01c812c98000005', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '6792503b50084ca28902623b8f71c27f.jpg', '6243f9213a894cfeb285d717ec366f83', '', 0, '066fbee06f754aee81b4fde105463845', '2018-05-27 16:33:17'),
	('5b0a6e03c01c812c98000006', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, 'ea8aedeeb6af4c308b70043a91a919ab.jpg', 'a092b52a6b494a64b0934148cc996aa1', '', 0, '7db788572cec4a4181c131e614204abb', '2018-05-27 16:36:19'),
	('5b0a6e03c01c812c98000007', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '81a8ce83aed543868b8dc07810d2e306.jpg', '07315102fdb24f3d8a2b9c7235e90f08', '', 0, '7db788572cec4a4181c131e614204abb', '2018-05-27 16:36:19'),
	('5b0a7ad9c01c8132f8000004', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '8ec739e3b8fb48d5a3160b12ede1113e.jpg', 'e41226588cd3408d8451f9603dc6af3d', '', 0, 'aa376940b64a4c95892c5f2889881782', '2018-05-27 17:31:05'),
	('5b0a7ad9c01c8132f8000005', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '4d27ad859487413381fd271d0567917c.jpg', 'c6b499e0a7f54ffe80debc574f72b7d0', '', 0, 'aa376940b64a4c95892c5f2889881782', '2018-05-27 17:31:05'),
	('5b0a8883c01c8132f8000006', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, 'd4561da76e9948df8a3e141b6dadebe7.jpg', '68dac33a9a3a4eac8f3f654421023459', '', 0, '9807d8c4cdd7423084bba673bde18e7c', '2018-05-27 18:29:23'),
	('5b0a8883c01c8132f8000007', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '1acd386c90274e03823a3fe4c5d110a0.jpg', 'd516352a99b84f2182f937565b25e2fd', '', 0, '9807d8c4cdd7423084bba673bde18e7c', '2018-05-27 18:29:23'),
	('5b0a8883c01c8132f8000008', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '86a9a8c8c90b474b8810ed9ffb80df4e.jpg', '85f0fad7986149a996ad567ec17605cf', '', 0, '9807d8c4cdd7423084bba673bde18e7c', '2018-05-27 18:29:23'),
	('5b0a88ccc01c8132f8000009', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '488e82fe6a48410d98c7ba855d248877.jpg', 'af684de38c28405f9af2f2a2be588fca', '', 0, 'e7186e1ed6a04c8db9462a588f9d6126', '2018-05-27 18:30:36'),
	('5b0a88ccc01c8132f800000a', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '80a75552af8444e69709f3344de45b3c.jpg', '55baa7fb0fd843f485aca1c9bbe1fa40', '', 0, 'e7186e1ed6a04c8db9462a588f9d6126', '2018-05-27 18:30:36'),
	('5b0a88ccc01c8132f800000b', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '0f88335ce28943ab8193294ae3f1793e.jpg', 'f30f61726a4949118d5fe17f39473fa2', '', 0, 'e7186e1ed6a04c8db9462a588f9d6126', '2018-05-27 18:30:36'),
	('5b0a8932c01c8132f800000c', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '38dff879d74541d683abe55fa7bc3b3b.jpg', '7f9a6cd3e40c4edb8c8ec0a42c58006e', '', 0, '7314e1dff882453a8df75e560de3d4d7', '2018-05-27 18:32:18'),
	('5b0a8932c01c8132f800000d', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'b9fdfd5b20664bb480799fd2fd05db81.jpg', 'a129a67253b74a378839d9202dc7c94e', '', 0, '7314e1dff882453a8df75e560de3d4d7', '2018-05-27 18:32:18'),
	('5b0eb30bc01c8105dc000003', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'c8572fe10f0a4672aa9eeba41a1bbf73.jpg', '4c6aa531bf3c452d9b22ca96bbfb2f57', '', 0, 'b6ff588ce66c41009ae02fe15867a93a', '2018-05-30 22:19:55'),
	('5b0eb30bc01c8105dc000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '7868d6ecfc4f479a9c0a19899d04ceea.jpg', '47881b48bffe470e9ec181e39da8be1f', '', 0, 'b6ff588ce66c41009ae02fe15867a93a', '2018-05-30 22:19:55'),
	('5b0eb51ac01c8121e8000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'ebb1509fe00d4829b75e62236390a141.jpg', '6493e16f19c24803888815291737c1f9', '', 0, 'c55a6f3d8c194c3a9f44a049ef28787e', '2018-05-30 22:28:42'),
	('5b0eb51ac01c8121e8000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'fcabb64cf3314c8b8d4763dd317bed28.jpg', 'fb52c2e91b24476586f55348cfce1a80', '', 0, 'c55a6f3d8c194c3a9f44a049ef28787e', '2018-05-30 22:28:42'),
	('5b0eb546c01c8121e8000003', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'a83b435a205749ff8fd91f33935e89c5.jpg', '80e555107eb94beb9e60407a3a7dec8e', '', 0, '1cfaaf0e715d4d728022dfb780104c07', '2018-05-30 22:29:26'),
	('5b1533f8c01c8133f0000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'b58492974f424f6a8b3ffbf9ca30c20b.jpg', '9b926ddba4b94f07b92965402c7be874', '', 0, '83ee67759f514a358a95549b5411a135', '2018-06-04 20:43:36'),
	('5b1782e4c01c811790000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '797f8db913ea483aa27fcf32b954254e.jpg', '2f4e72db62df4a988cd363dd29c8762b', '', 0, 'aa619c7521e144bd898e658dfa64f341', '2018-06-06 14:44:52'),
	('5b1782e4c01c811790000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'cfe8a7399c1445f6a88ebdd601be8daf.jpg', '5a133340e4c34b3fb02acb97e8880dcd', '', 0, 'aa619c7521e144bd898e658dfa64f341', '2018-06-06 14:44:52'),
	('5b178669c01c811790000003', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '69f27439894741898d75ac6363aec904.jpg', 'e6319c1b27ad4d11b7da9d8d5af4e5bd', '', 0, 'aa619c7521e144bd898e658dfa64f341', '2018-06-06 14:59:53'),
	('5b17d5e9c01c812778000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'a4e16d7dac724375b0a4cdb3c03d2ef3.jpg', '3c1b72a6044e47558c4cf17fea1f90c2', '', 0, 'aa619c7521e144bd898e658dfa64f341', '2018-06-06 20:39:05'),
	('5b18ac83c01c812c68000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '3edbc15c39f84c1c8b44210609b7c12c.jpg', '528958a8db374cbb830a27dd186931e3', '', 0, '9ecb922702374fd1a51aa468f72ac766', '2018-06-07 11:54:43'),
	('5b18ac83c01c812c68000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'a634451ed2714f6b92f773f8bf106f9d.jpg', '343b4e696c8d40688d88a21368c4e485', '', 0, '9ecb922702374fd1a51aa468f72ac766', '2018-06-07 11:54:43'),
	('5b18ae39c01c812c68000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '7836c9836b494cd2b11b749ceec1c09f.jpg', '3c16594bab794c0983581609f942f35c', '', 0, '145b8d11911a420e9dd6b0b80bc1287d', '2018-06-07 12:02:01'),
	('5b18ae77c01c812c68000005', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'd47553cb1b774a7cb539a0670b3fa47a.jpg', 'fdafe8be39a445fa8ff40eb98437470c', '', 0, '145b8d11911a420e9dd6b0b80bc1287d', '2018-06-07 12:03:03'),
	('5b191d8cc01c8123bc000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '482091bf4f204a3a8f07887d513660db.jpg', '6d10e65284004c5c8b6a69eec79fb314', '', 0, '4470fe63bb294165b754c84b307beab0', '2018-06-07 19:57:00'),
	('5b1a695bc01c8109f0000008', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'c56e9e3e67114f968c7c634ad2ce118a.jpg', 'd3700182f33146c288fd8a0e96efdd95', '', 0, 'cdfee7b2bd7c4c058cf6705cbce94414', '2018-06-08 19:32:43'),
	('5b1a695bc01c8109f0000009', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'aeb3daf5e22548868cd8add6f1e1eb95.jpg', '06e03bc597cf4e1d8011b6b06c45b973', '', 0, 'cdfee7b2bd7c4c058cf6705cbce94414', '2018-06-08 19:32:43'),
	('5b2610d8c01c812eec000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '249d660403da4fd483a2aba38e998856.jpg', '3ab4191c1c36400184166c69a60063f3', '', 0, 'bf9ea80383924c08ab0277d2f522e689', '2018-06-17 15:42:16'),
	('5b2610d8c01c812eec000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'a5e4efe818ad4b449842bc1425eb6a19.jpg', '4515acb39ae14c0488c851070d5e30f2', '', 0, 'bf9ea80383924c08ab0277d2f522e689', '2018-06-17 15:42:16'),
	('5b2611fbc01c8122a4000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '4fbbccde3922427c8ec17f4eeedea392.jpg', 'c005c1fa7938442eb9175b6eabfa6105', '', 0, '46c2d278b5b54d9099df0126f7c6124f', '2018-06-17 15:47:07'),
	('5b2611fbc01c8122a4000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '54c7219e16e64b54881abe8e023094cb.jpg', '9c62615eb81a44c5a297205e8434b14c', '', 0, '46c2d278b5b54d9099df0126f7c6124f', '2018-06-17 15:47:07'),
	('5b261842c01c810ee0000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'e66d83600fc94db79a623e56eb46fd48.jpg', '2b9c1d47728f4bd289a55e466bf524a3', '', 0, 'b5254b4e698d46cfa91c606f7b2d74f9', '2018-06-17 16:13:54'),
	('5b261842c01c810ee0000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '5bb7c9c7dc494fda96d2287ca2eb7041.jpg', 'b68fa0782c14408a8b3ecd804d22c5b4', '', 0, 'b5254b4e698d46cfa91c606f7b2d74f9', '2018-06-17 16:13:54'),
	('5b261854c01c810ee0000003', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '75caf61bd3ac4c7e83824560dc706f96.jpg', 'bb34821e99df48e3864eea1af5a82a58', '', 0, '15b526c3da844aa69ff54419877bb725', '2018-06-17 16:14:12'),
	('5b27469fc01c810dc0000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '9b76e17c9b32468c877e7d209bcdf7fa.jpg', '274c1f8afb404c1995c592d5e33c29b2', '', 0, 'ff2d6096357843138713d47038c93501', '2018-06-18 13:43:59'),
	('5b2b9794c01c812604000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '6abc4fcdd395411faa141dc477e32151.jpg', 'cb2673a769984d1b829be2583d78154d', '', 0, '1ea53bee275f4fd78f842c405fb4c5aa', '2018-06-21 20:18:28'),
	('5b321b72c01c812ad8000001', 0, 'globe', '', NULL, '325a98cdfd63465d8ba8724b9b441512.jpg', 'f0421804af5043c785afbbf7d625bcdc', '', 0, '39e0710a065d4249965513772c254fde', '2018-06-26 18:54:42'),
	('5b322021c01c8126cc000001', 0, 'globe', '', NULL, '004ee606da134e668150f9288330b49e.jpg', 'f0f08ff94e2042ed8b91c6805404a7db', '', 0, 'dd1973067c3244e78d105c30cffb0117', '2018-06-26 19:14:41'),
	('5b322099c01c8126cc000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '0125b9426c154044870277dd75f840ad.jpg', 'b58a43fa90594e028b33098f377fda17', '', 0, 'fa266d0e4a4c41b790ad308085729fc5', '2018-06-26 19:16:41'),
	('5b322099c01c8126cc000003', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '2f518b55f1ec4d7daf25498a450b4dbe.jpg', 'e01b196dc081477394522d89f22a57b3', '', 0, 'fa266d0e4a4c41b790ad308085729fc5', '2018-06-26 19:16:41'),
	('5b322099c01c8126cc000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'e22c705ffe1a488b93d209ab952334b1.jpg', '4f36af87a36041d48507a9149cc3b528', '', 0, 'fa266d0e4a4c41b790ad308085729fc5', '2018-06-26 19:16:41'),
	('5b3220e9c01c8126cc000006', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'd1cc0bddb5e44fc79229459891aad2b2.jpg', '8e43b9a5a6ed462c8685c4832ab05111', '', 0, 'da6c23713c004421ac96cf73f67a3c12', '2018-06-26 19:18:01'),
	('5b3220fdc01c8126cc000007', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '58e17bfa68624504af7342879e772db4.jpg', 'f68c41d1672048708a04d1b97535128d', '', 0, 'da6c23713c004421ac96cf73f67a3c12', '2018-06-26 19:18:21'),
	('5b32215fc01c8126cc000009', 0, 'globe', '', NULL, '27f9c19a77264f0e9963faaed7fa5f7f.jpg', '2017837992cc4d159a5533db7ffe85dc', '', 0, '5acb66f7c01c812d50000001', '2018-06-26 19:19:59'),
	('5b32221dc01c8126cc00000b', 0, 'globe', '', NULL, '25651e844989499aa4bb33e9964b0c0c.jpg', 'ab7b381d7ea54809b1e7d8cd7a139fa0', '', 0, '5acb66f7c01c812d50000001', '2018-06-26 19:23:09'),
	('5b3222c2c01c8126cc000013', 0, 'globe', '', NULL, '541831856cdf4be197fda43c5f850cec.jpg', '1a8d3693a56f454e9f03f6646b879091', '', 0, 'af2b451b538648958fbbb051448640c3', '2018-06-26 19:25:54'),
	('5b3222f3c01c8126cc000015', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'e1b394f6ae1541f0863e7a5baf5c8e60.jpg', 'a1e65852d87345468ecaa1193ea37b09', '', 0, 'ebec3a5825434a8d9ec3d9dfa4d407be', '2018-06-26 19:26:43'),
	('5b322304c01c8126cc000016', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '8c02990a9ea14feb883816810aa18762.jpg', '786c49c0309a4c369ee8e7e63709b977', '', 0, 'ebec3a5825434a8d9ec3d9dfa4d407be', '2018-06-26 19:27:00'),
	('5b322369c01c8126cc000017', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '70a64e38541c47da919eb3526e06e7d3.jpg', '5cfe4ee118804419978f72588b620d91', '', 0, '9ead3b8aaf374cdf891213f70b663b79', '2018-06-26 19:28:41'),
	('5b322369c01c8126cc000018', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '3d7d5da2294742ec96cf60acf835a3ed.jpg', '0206611226c94e808cb13476d23b6ca8', '', 0, '9ead3b8aaf374cdf891213f70b663b79', '2018-06-26 19:28:41'),
	('5b3224acc01c8126cc00001d', 0, 'globe', '', NULL, '0eca2237d1274a3ea401db3172f36b77.jpg', 'e0ad7f6fbf2f4f5f8ac89d1cfe82438c', '', 0, '3ac5c76728524a94b178fd75e723e3b7', '2018-06-26 19:34:04'),
	('5b335191c01c810f40000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'e006a262e829430781c48c50b01b0886.jpg', '6aa3ba0c0c6743289dfbfed17a28e36a', '', 0, '8ce63693efaf4b558b23b919b7ed5379', '2018-06-27 16:57:53'),
	('5b338974c01c810a2c000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '83d204a5fa3e4a9a8ea69656cd9ca87e.jpg', '3b9293ae83fa4ceb9a7f7d35b60108f6', '', 0, '5cdc5f3a9e18477a842ac517bd2e8225', '2018-06-27 20:56:20'),
	('5b3391b2c01c811e44000009', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'b177c7f4862b43929d10b399b27f972b.jpg', '4fbc0edd161a467499da4bed3ee3dd85', '', 0, '1dea99cf850244b7bf3525372ec8df63', '2018-06-27 21:31:30'),
	('5b3391b2c01c811e4400000a', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'a6b8296d3a40457b947b3aea9854b591.jpg', 'ece5c2f305094c129eeed50157e06dfb', '', 0, '1dea99cf850244b7bf3525372ec8df63', '2018-06-27 21:31:30'),
	('5b35daf0c01c811048000003', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '1cd2300a34bc43f3bcaa11e8e8d40a72.jpg', '67147a6ed81643a1af7814dbdbf6686d', '', 0, '995f65afcb8940478132772ccd061934', '2018-06-29 15:08:32'),
	('5b35daf0c01c811048000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'd1a1a157dd1f4a508c93681681d30881.jpg', 'c3a0b08929bf42328e8957616042f3b7', '', 0, '995f65afcb8940478132772ccd061934', '2018-06-29 15:08:32'),
	('5b35e1cdc01c810b6c000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '9a6c4637b88d4186b976a7bbb4bfb501.jpg', '5449528752dc4d588a18facabc0b68c2', '', 0, '159d73afe7c546748af0d63adf625630', '2018-06-29 15:37:49'),
	('5b35e1f3c01c810b6c000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'ae8db2d79a0946428ad35282f72fa597.jpg', '94a57d7e7a1e485fa10fbfe047b919a1', '', 0, '159d73afe7c546748af0d63adf625630', '2018-06-29 15:38:27'),
	('5b35f2c8c01c811f68000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '989ad63897ad47559bb6cae6bfe69e95.jpg', 'd8a62206f534406d8f0957e43d5dee8d', '', 0, '2237f235ea5c46a68278a4de7f264f41', '2018-06-29 16:50:16'),
	('5b35f2c8c01c811f68000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '58339cf26ef54c7f8e6fc1a8d76cc40d.jpg', '5153654aed81487c8fee771090d654c4', '', 0, '2237f235ea5c46a68278a4de7f264f41', '2018-06-29 16:50:16'),
	('5b35f36bc01c811f68000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '9ebc3021466f4c618266dc79b9b1a825.jpg', 'd75d1a8d40574172bb427d121dc930eb', '', 0, 'a2d0567e0b144f5c9645cb96e08a2d1a', '2018-06-29 16:52:59'),
	('5b35f383c01c811f68000005', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '9aa5815c6f01447a834bc14d927d5ec0.jpg', '664adaf16ad04f8792d04cafd701b1f7', '', 0, 'a2d0567e0b144f5c9645cb96e08a2d1a', '2018-06-29 16:53:23'),
	('5b35fa29c01c811f68000006', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'cafece78e02444a68492f7ac590406a5.jpg', '5c60247fd75c43259133a7dc6dc7bcc4', '', 0, '633e2444323d43dd9f6936778b6dcabc', '2018-06-29 17:21:45'),
	('5b35fa3cc01c811f68000008', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '278377dfa4b34d0e842c51bf92136d00.jpg', '450f8bffd063422d97a8a98cc4f2e9d7', '', 0, '633e2444323d43dd9f6936778b6dcabc', '2018-06-29 17:22:04'),
	('5b3722d8c01c811e30000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '887b61f337b9426d817b6d339e1b385b.jpg', 'a24348c779b5487d89f83c73a0e5dac2', '', 0, '24c32e3ceefd4c1eb4f174cde6278944', '2018-06-30 14:27:36'),
	('5b3722d8c01c811e30000003', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '741e558eb42c443c83f092f2d32719b4.jpg', '4a4db4584fcd4ac68d4085501b967e6d', '', 0, '24c32e3ceefd4c1eb4f174cde6278944', '2018-06-30 14:27:36'),
	('5b37231fc01c811e30000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '3c6f1da340784e8b8f9bcd4ba74412ec.jpg', '5289b150c4c34995afd8545311f34a10', '', 0, 'edd753feea5e49f09a8bec68db95f2d7', '2018-06-30 14:28:47'),
	('5b372332c01c811e30000006', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '11dd280a10634022aaec9e3038afb578.jpg', '461ba531fa3c47cc8ec05d4bf11eb964', '', 0, 'edd753feea5e49f09a8bec68db95f2d7', '2018-06-30 14:29:06'),
	('5b372363c01c811e30000007', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '158bcc9d121a43998113814d019bffdb.jpg', '38cb728f30e34cdf927ca34f9a739736', '', 0, '370dee3cbc64470c8ee0a09b3e6e67e4', '2018-06-30 14:29:55'),
	('5b372376c01c811e30000009', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'cd960a90ef0748db818bd11ff7fc8fce.jpg', '8fecfba434014db680f0e5eaa25c6b08', '', 0, '370dee3cbc64470c8ee0a09b3e6e67e4', '2018-06-30 14:30:14'),
	('5b3726b2c01c811e3000000a', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '08d108c3c96941569f5746dbce477f20.jpg', '61db668ea21b4e039647de335186e253', '', 0, '901cccd64cca4c40aed5fd78487068b1', '2018-06-30 14:44:02'),
	('5b3726b2c01c811e3000000b', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '6896c16002604336b30f4a9a0ff584f0.jpg', '9a80f31d52534cfea54d10bc7cf500e2', '', 0, '901cccd64cca4c40aed5fd78487068b1', '2018-06-30 14:44:02'),
	('5b37285bc01c811e3000000c', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '473e4688b32d49d1b02fdef5cc04a1b3.jpg', '7f2be0a15eaa46ecb9a5c3a8d2c29d1e', '', 0, '815926ffb72e4791831c796fb35ee3b0', '2018-06-30 14:51:07'),
	('5b3731f1c01c811e3000000d', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '6feebde28c0246d2bebd2993c52a5dff.jpg', '41935438818147e9a9cc081107ddfdf9', '', 0, '548258a86eb348f6891f376239e370cf', '2018-06-30 15:32:01'),
	('5b3731f1c01c811e3000000e', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '4a847e0edfea45239879a1e5d264ab24.jpg', '10a2f6a61ad2422081101120d36fed25', '', 0, '548258a86eb348f6891f376239e370cf', '2018-06-30 15:32:01'),
	('5b373262c01c811e3000000f', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '6997ff4f3e9b403ca9e41c25b4e3c59f.jpg', '229c6be39d2f419c8f857f979210abe9', '', 0, 'cccf1a77313245ef89d4d257bf7f9dec', '2018-06-30 15:33:54'),
	('5b373262c01c811e30000010', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'a61e3239e5344324814135f809374322.jpg', 'e29775a8dd424463877038601511d357', '', 0, 'cccf1a77313245ef89d4d257bf7f9dec', '2018-06-30 15:33:54'),
	('5b3737d7c01c811e30000011', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'fccf67e22f1347899287e27e667f07b8.jpg', '3b11493d5ce1493a8f80d611fa144641', '', 0, 'c09c421909784f5e95fdaae246cc1a68', '2018-06-30 15:57:11'),
	('5b3737d7c01c811e30000012', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '1e31a7a22c694101810a34e59acf281a.jpg', '6491b578f622439880908b6fe917e01b', '', 0, 'c09c421909784f5e95fdaae246cc1a68', '2018-06-30 15:57:11'),
	('5b37384fc01c811e30000013', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '9b325782cca848058cab59bde1174c11.jpg', 'be055356dba14fd88c2e368f517a149c', '', 0, '25c0285ca4044f0b931e3e57f725b9b7', '2018-06-30 15:59:11'),
	('5b37384fc01c811e30000014', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'b798d202a3a84fd2b1e164743e68f1bd.jpg', '47187ed6574444e982b4c61e7d465c6a', '', 0, '25c0285ca4044f0b931e3e57f725b9b7', '2018-06-30 15:59:11'),
	('5b3a1319c01c811cf4000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '5030cf6a0cc7431399a2c592ce0c3bb2.jpg', 'a53bf3f4ec084aa697d76e03a6e6e2e3', '', 0, 'f2ada534b65f4a3d843be9266f87784e', '2018-07-02 19:57:13'),
	('5b3a1319c01c811cf4000003', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'a06cc5ba3ce842b48793e2723aea049d.jpg', 'cc4974abf158470fae4138974ceafcb7', '', 0, 'f2ada534b65f4a3d843be9266f87784e', '2018-07-02 19:57:13'),
	('5b3a1328c01c811cf4000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'b18fcc03965449c3810b30055ccabbb0.jpg', 'c2be735be4534f80bf5772c41fdb4279', '', 0, 'da435b00b65b4435ab77b2cd824e0325', '2018-07-02 19:57:28'),
	('5b3a133ac01c811cf4000005', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'ec7367db403c42df8aa8c6c548542bff.jpg', '5e048044d8984742bf1df2670ae256db', '', 0, 'e00f107d4aa445528c0c2510403ca6c7', '2018-07-02 19:57:46'),
	('5b3a1419c01c811cf4000006', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '2a96f45a9ec5472bb14c1a3f839ac53a.jpg', 'c57d0d86b6734e048b61e84385518c00', '', 0, '85a5fe48d64846e986a6ddcf92717e83', '2018-07-02 20:01:29'),
	('5b3a1441c01c811cf4000007', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '096d71fcec1147e989af8f4add4b7747.jpg', '818a9de82e0b4407814b7251fa495ba5', '', 0, '13eaade4fc2e44688ee787332da930a8', '2018-07-02 20:02:09'),
	('5b3a145bc01c811cf4000008', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'eebcd255d85d4d4985105e66c66bc288.jpg', '343f1dfb8c6d4e728e3f19f145c0072c', '', 0, '13eaade4fc2e44688ee787332da930a8', '2018-07-02 20:02:35'),
	('5b3a1738c01c811cf4000009', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'b1b1649534d34f82ab15a0aaa1ca420f.jpg', '7ef43a15ca074563835c9d3944be66a9', '', 0, '13eaade4fc2e44688ee787332da930a8', '2018-07-02 20:14:48'),
	('5b3a1766c01c811cf400000a', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '1c5873a128be493580d05c39450159d0.jpg', '9a28575537834c2785cdc5ce157d48e2', '', 0, '13eaade4fc2e44688ee787332da930a8', '2018-07-02 20:15:34'),
	('5b3a18b9c01c811cf400000b', 0, 'globe', '', NULL, '2c5e3eadebf94333a7679b4b7b7f9e23.jpg', '356ff92b0c35441a9abec71fbd46d0af', '', 0, '48f9ab803cfa4d27ae62a45b3e166343', '2018-07-02 20:21:13'),
	('5b3a18ccc01c811cf400000c', 0, 'globe', '', NULL, 'b607ee598aab44e4a7393789122bd347.jpg', '2036620623ff48db99d859fb2a71dba3', '', 0, '13eaade4fc2e44688ee787332da930a8', '2018-07-02 20:21:32'),
	('5b3a18e3c01c811cf400000d', 0, 'globe', '', NULL, '42b0d9cef12e4d159ecbe2ffe24139ea.jpg', '6f67aad059c448a78fdea87fcac796c1', '', 0, '2a068f5492f745819a787c65fbbf16c7', '2018-07-02 20:21:55'),
	('5b3a1903c01c811cf400000e', 0, 'globe', '', NULL, '5f1e965e711e4121b5e9966fe08ff6c3.jpg', 'e7f1c000034b4b9b8e83ba34534ec57d', '', 0, 'f2789be9499b4d06881721e1377bb7a7', '2018-07-02 20:22:27'),
	('5b3a1951c01c811cf400000f', 0, 'globe', '', NULL, '8f7a57e194764eb38c665e8c7d6d1f45.jpg', '6cce3dd50b11451280ea11be2558cde6', '', 0, '85a5fe48d64846e986a6ddcf92717e83', '2018-07-02 20:23:45'),
	('5b3a196ac01c811cf4000010', 0, 'globe', '', NULL, 'b35fac8a1db04da48d13b5b9070311c9.jpg', 'c5f9e9cf536d4eb38bf7ebc2c8adbb37', '', 0, '615e5bb1ead144958002d91a3d9ee77f', '2018-07-02 20:24:10'),
	('5b42cfcfc01c812074000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '5cf608317c0c450b8ea71e53f8feea4e.jpg', '4596684fea0b44c5be95bc1b90caac5f', '', 0, '5a3853d468d84c7f8169620abcb3b441', '2018-07-09 11:00:31'),
	('5b42dac1c01c81368c000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '8cb83baf5cbc4048882dd68ebc16d0bd.jpg', 'ff2cc13fa0994fc18c572b89f46e463d', '', 0, '7c7f3f0c19064ab780a4cb360159627c', '2018-07-09 11:47:13'),
	('5b42dac1c01c81368c000002', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'ba2cdc848a6840cbb42d82d957a3c2fd.jpg', 'a84c860d93dd490b87be5b8841423356', '', 0, '7c7f3f0c19064ab780a4cb360159627c', '2018-07-09 11:47:13'),
	('5b42fd19c01c81368c000003', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '4787422877bb43e0aff4f5ab7037fa0b.jpg', '432f702d66a64245a36cd1305f4f33ee', '', 0, '80090887a1b449b5aaf33b04995a381d', '2018-07-09 14:13:45'),
	('5b42fd19c01c81368c000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '6f659293c5814812b4017140918b216c.jpg', '53fc6361042c4de08705898f98f56ac5', '', 0, '80090887a1b449b5aaf33b04995a381d', '2018-07-09 14:13:45'),
	('5b42fdebc01c81368c000005', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '5d7a9887678c4cb8b9eb1c0857b751d3.jpg', '5288437abacb4e099bccca1bc2935926', '', 0, '2159d11956774d7c8837f44c411d6758', '2018-07-09 14:17:15'),
	('5b431ef3c01c8111f0000004', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'dc4d8bde14044a5e81725fe919bf389e.jpg', '5e429dbeec184c9485f22d1566bfac00', '', 0, 'b41f2d364b5b40f18ffdf7ad7f2ae146', '2018-07-09 16:38:11'),
	('5b431f12c01c8111f0000005', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'e195689c407c4ce88b2b5a04913b5d37.png', 'dc1a076d8a5c44c58fe6467e1067ba48', '', 0, 'b41f2d364b5b40f18ffdf7ad7f2ae146', '2018-07-09 16:38:42'),
	('5b44ac2cc01c8135a0000004', 0, 'globe', '', NULL, 'cdcafa4547f547548a3b7c9b25ea5a15.jpg', '3eb2c81119574947ac4f664b05545b05', '', 0, '5b189019c01c812974000004', '2018-07-10 20:53:00'),
	('5b44b0bbc01c8135a0000008', 0, 'globe', '', NULL, '9552c095c11b4cc8b89666b1d7a2584f.jpg', '0a2a6197a1d0437b89d727f8c670b30f', '', 0, 'admin0000', '2018-07-10 21:12:27'),
	('5b497173c01c8119d0000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '039cd9de4ac946bb8f3d975b96ac14df.jpg', 'd89038cf79344ff2a2a5421cca44668d', '', 0, '4696bd42c1244daf8c659806aaa24cbe', '2018-07-14 11:43:47'),
	('5b497227c01c8109f4000001', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'c0b66f844dd84cb38fbe64b8982ee3c4.jpg', 'bc544e9622d842c08124a9ee60fc9267', '', 0, '4696bd42c1244daf8c659806aaa24cbe', '2018-07-14 11:46:47'),
	('5b4b36b6c01c8127c4000001', 0, 'globe', '', NULL, 'd55d956c9722451583cb084c35b0683f.jpg', '2778f47a3f504333a354ede1885907f1', '', 0, '52e99f4c139943b2968f17c83b2f92e0', '2018-07-15 19:57:42'),
	('5b4b370dc01c8127c4000002', 0, 'globe', '', NULL, '03d5becaa93c4e7284fbcd344a2bc24b.jpg', '7d7d538633174cb68a2e51d4906af46c', '', 0, '49d9cec6d11d4f338b585a85525b3892', '2018-07-15 19:59:09'),
	('5b4b37b2c01c8127c4000003', 0, 'globe', '', NULL, '7842b8be6ad64a6782551406ffed6787.jpg', '3db0dcd037b14fed8fdd21f7e9459431', '', 0, '801746fbdf774c45a8e552af45adbc56', '2018-07-15 20:01:54'),
	('5b4b397ec01c8127c4000004', 0, 'globe', '', NULL, 'e4773f96591a4187bf775f5f69e0cbb5.jpg', '51c36ed06f234dac8925aa6ef3421b68', '', 0, '6b56748300024fb88b699e44a25bcd03', '2018-07-15 20:09:34'),
	('5b4b3a02c01c8127c4000005', 0, 'globe', '', NULL, '43d677c0124f4f61860f2675f27e4624.jpg', '9b7165a9d51a425c82ab11013a64c579', '', 0, '6b56748300024fb88b699e44a25bcd03', '2018-07-15 20:11:46'),
	('5ec3cf7874ca40808091e40e069415c5', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'fed213df06ef4289ac4e582040fe426d.jpg', '3cc3183d704e49c787a2098d33e78541', '', 0, '1c9fb876e2b7414a980f4d5b5c025471', '2018-05-25 20:02:17'),
	('626714791b1d4c1d852dc82017370283', 0, '', '', NULL, 'f278b56bbe864eea872bfe47ebd1a2b4.jpg', '0b0f1d0ccd1b4daa8ae38fb8a6682810', '', 0, 'ccd8c0774aec42e5803f442380ea77f5', '2018-04-23 13:52:07'),
	('70ec9bde55b34bb68783b1e06da236ba', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, '6792503b50084ca28902623b8f71c27f.jpg', '6243f9213a894cfeb285d717ec366f83', '', 0, '066fbee06f754aee81b4fde105463845', '2018-05-27 16:33:17'),
	('719190dea9b84e9d8f6fb7b439f4273a', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'e45808d221e04161a887a2249f4cb431.jpg', 'cca6514ebec749d09f0a18155df93ba1', '', 0, '8bb40e9b36874de18f802e4e5d9d6a60', '2018-05-23 22:02:50'),
	('7a554f0838b2417f8a395abfa0596dee', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'c1a249ac8f1142ce8d67bf61f7d3efe4.jpg', 'b5e2c481863d453181ed9cb45e4332e2', '', 0, '5b60faf462a849209cb88230b12aa770', '2018-05-22 21:19:25'),
	('7c122f863d944f8bb6b79a74d9de90ec', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, '9b3e4a269c0043c383b90b2b669967d0.jpg', '8f938c7f22004f2d8211c22eeee3bbf7', '', 0, '869ae2d523a04e75810d62bba7963ad9', '2018-04-23 13:43:58'),
	('7c64a7fae0c34102aa33ace31ad18e95', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'aa43fb9b89194a9b82e8b1e2d243f760.jpg', '15fe1a5e31224fc3a7f6845a275ff54a', '', 0, '3624e6fe48094fe58c29ba7f85361b3f', '2018-05-25 21:35:23'),
	('89df1c7986a248c28e0c6a99a8fe5efe', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '154deba0e84a4c7d905b180cc57d70f9.jpg', 'ccf37dbf1cf94c1b85cae13727c4fe7c', '', 0, '5b60faf462a849209cb88230b12aa770', '2018-05-22 21:19:25'),
	('91ca93b21e4b478e8ddd78a6d055afc9', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, 'd07915ea60464eacac65aa7b09f71828.jpg', 'a38a775fe4c244fc804f391f89e0039e', '', 0, 'fee966cfaf9f4a7ca29db969114c2c34', '2018-04-23 13:06:29'),
	('a48e2d6fe46943dcb9176803216e74ef', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '42512e12066f4bf5b2272d4d03fc1f2a.jpg', '802ca38494464b2b8f794c8eeb7ebf11', '', 0, '1efe6a86426243ec860079bc9bf1f20e', '2018-05-23 22:36:57'),
	('a807271c1dde46e490559dbf4d4cc487', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, 'a0f9fcff27d0441a8a79adf13dfc6a9e.jpg', '7a384cf2a908410b8b1bffa92e1d19bc', '', 0, '066fbee06f754aee81b4fde105463845', '2018-05-27 16:33:17'),
	('a8eeb8270021476c8c4a746fd6888800', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, '9d8445e07a17451995305bba80c2308f.jpg', '26f8bfed3afd47c0bcc349375fa1baa6', '', 0, 'f14baf285d6c4f81bcba71ee00125994', '2018-04-23 11:32:03'),
	('ad0657b575c2428bbc96f78092650321', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '82c34ab788fd42b88d1da9a808466019.jpg', 'ca3f441208454020b0b91ab4e772046c', '', 0, '8bb40e9b36874de18f802e4e5d9d6a60', '2018-05-23 22:02:50'),
	('af2557cc96a84ec9ade7e10b642864cf', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, '9e056cac40ec4c52ba76ecf4d899e10d.jpg', 'deb3046135274cdc8977e01f8a99fda7', '', 0, '6fc03b4654a04988a22419a0407bc575', '2018-04-23 13:58:45'),
	('b1383da8313c49bf8f976d4e4c2d16b7', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, '0bc03777701541ae8f157ffda1615c4a.jpg', 'f49ab540b3694381934ddbb4f095bc4b', '', 0, '84209763790945abbf665841a96f9e4c', '2018-04-23 14:02:02'),
	('b39b81a0709c44cb8d604b242ed7d7b6', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, '8b5b9368348b4a8d87728c48e1400e6d.jpg', 'a2d200b6c40d45c78c0160462610692c', '', 0, '82241642b3ea44f78d78c2af773e84e8', NULL),
	('b8a1d5cd59ab4b27b66b4b70349187d1', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, 'e33fbf11445b44568cb5d085664267e2.jpg', '706040b11c7548d59ba297de97d517e9', '', 0, 'fa7a1d1095ac492486d59cc73312dbf2', '2018-04-23 14:07:08'),
	('b9b92ce157f4417485a2cc4452718ec4', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '0731504ecdc94b919ddcd2542c171aab.jpg', '20adb941de294b018f137882fe208ed6', '', 0, '655fec6706034cdb803d06368b470068', '2018-05-22 22:13:53'),
	('bf30941f0e7744afaed18dd93be91bec', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, 'b02a39a0909c4bd2a220105aad9ef167.jpg', 'a34bc9043c11498eaba7a776c74f69c2', '', 0, '0ee187f48ac74b25872aafc65721954b', NULL),
	('c52173b01c914b669c8b3a1080275253', 0, '5aca1dfbc01c812254220001', '', NULL, '8aa3012528494a3580eda3d4d845e22c.jpg', '46a598221bea43fe899116707c7e53c2', '', 0, '6f3929b29c6b4f629b2f1950a6963843', NULL),
	('e3378ad401a74cb193f9cb33f072131b', 0, 'f2789be9499b4d06881721e1377bb7a7', '', NULL, 'd5cc687a0d664e4fa5240b5e667ed3b2.jpg', '59a690eec0b241028fe19ebb13c75667', '', 0, '066fbee06f754aee81b4fde105463845', '2018-05-27 16:33:17'),
	('e3f649c4ef154c7aaaa02be84afe272b', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '4bb4b5c4a39b4379b7e0b448e3b07e6b.jpg', 'edfafcc92ff744068bc9b3d5986c73c1', '', 0, '61bf74edff424dd0bba8e3d0cefd3d49', '2018-05-22 22:10:47'),
	('f38388a2ca2541a4b0565d4f457e9675', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, 'c35b198389a24fc48d4580ed95df9e70.jpg', '3d03475f9e9e49188198e7bc9df7ffba', '', 0, '33fe7b5680a64d1e94dad9b19c788e85', '2018-04-23 14:12:00'),
	('f65eade8cd08499f8e5535245def0e37', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, 'f8eda42c3b8c4deb835cd03f928d8739.jpg', 'f864c56b12994442846ca4a5c123bad2', '', 0, '40dd9bc854c34fee8ff3c791a5570a0d', '2018-04-23 11:37:56'),
	('faa4e4561e664f6d801feee0d51965dc', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, 'b6701cd3f76c4ca1885843ddcc6de088.jpg', 'c58b2bb7690146a4b15f5cb3677a8202', '', 0, '869ae2d523a04e75810d62bba7963ad9', '2018-04-23 13:58:23'),
	('fabd6a418b9d460dab1d8baec008b555', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, '53f85e84ce9949ac89e61139e35d312b.jpg', '658bbb7f850440e7850d59c67843b56d', '', 0, '4c7ac9f5962c49d586fed60a35877f47', '2018-05-25 21:45:47'),
	('fbee10e1b47d48b18ab26c40bdad55e4', 0, 'af2b451b538648958fbbb051448640c3', '', NULL, 'ab35201b5ae74f788ccf7fbf7736a319.jpg', 'e6df7ca5fed24ba3a37bc7cd187b2362', '', 0, '1efe6a86426243ec860079bc9bf1f20e', '2018-05-23 22:36:57'),
	('fef3eb15ab634013882f33a6cddd3b21', 0, 'f1f8b968780d4202889bd64c4777cf3b', '', NULL, 'c2a6ea9ebb3d4ceb9023a4870683dc34.jpg', '4a428b162b70428194cc8ea65738c8b3', '', 0, 'ccd8c0774aec42e5803f442380ea77f5', '2018-04-23 13:58:03');
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;

-- 导出  表 ebc_debug.bpmnode 结构
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

-- 正在导出表  ebc_debug.bpmnode 的数据：~25 rows (大约)
/*!40000 ALTER TABLE `bpmnode` DISABLE KEYS */;
REPLACE INTO `bpmnode` (`Id`, `ProjectId`, `OrderNo`, `ProcessId`, `UserId`, `Kind`, `Remark`) VALUES
	('01c82541cc904e1eb8cf2784686df8a8', 'af2b451b538648958fbbb051448640c3', 1, '2b36a25887f341ebb696f18c2ee5ee13', '5b189019c01c812974000004', 0, ''),
	('1001', '0000', 1, '1', 'admin0000', 0, NULL),
	('1002', '0000', 2, '1', '5acb66f7c01c812d50000001', 0, NULL),
	('1003', '0000', 3, '1', '5accb0c7c01c811d6c000007', 0, NULL),
	('145053bf9dd044408a66ba473360c4a5', 'af2b451b538648958fbbb051448640c3', 2, 'd3eb82d90b1b4aafade536fbb18f7aa0', '5acb66f7c01c812d50000001', 1, ''),
	('1570bd365e4e4ab38a828e6b96648cb9', 'af2b451b538648958fbbb051448640c3', 1, '5c2cf53d430d49ea8169674fe85c0906', '5b189019c01c812974000004', 0, ''),
	('17ba08e73ae5476ba3331981e552d73a', 'af2b451b538648958fbbb051448640c3', 1, 'a5eb4e11fe0947808b4ceabcaf4e06d6', '5b189019c01c812974000004', 0, ''),
	('1dfc92e03ed343ad87bda5474cb14976', 'f2789be9499b4d06881721e1377bb7a7', 2, 'travel', '5acb66f7c01c812d50000001', 1, ''),
	('37d16658c12c4ce89e6891a5bea20b65', 'f2789be9499b4d06881721e1377bb7a7', 1, 'leave', '5acb66f7c01c812d50000001', 0, ''),
	('398e3035e94140a5801c81fad8ac6cd3', 'f2789be9499b4d06881721e1377bb7a7', 1, 'travel', '5accb0c7c01c811d6c000007', 0, ''),
	('45ebfc685fcc49068e406ce3c8fbce7b', 'af2b451b538648958fbbb051448640c3', 1, 'leave', '5accb0c7c01c811d6c000007', 0, ''),
	('45f4ce5543b843e18b9ae0ec6fbcf1c6', 'f2789be9499b4d06881721e1377bb7a7', 3, 'leave', 'admin0000', 0, ''),
	('46b3fee15bd34482a1ffae66f7cb3fde', 'f2789be9499b4d06881721e1377bb7a7', 1, '58f8e21f5be147349e2de9c06e447c92', 'admin0000', 1, ''),
	('5e066dc964854c7cbe200a4a91f8798f', 'f2789be9499b4d06881721e1377bb7a7', 4, 'leave', '5b189019c01c812974000004', 1, ''),
	('88b5c73432044934992e2a1ec8880b14', 'af2b451b538648958fbbb051448640c3', 2, '91dee7dfe72241a6a0bb277cd08c5812', '5accb0c7c01c811d6c000007', 1, ''),
	('925519949a1043dd8800a12b9dd507f1', 'af2b451b538648958fbbb051448640c3', 1, 'd3eb82d90b1b4aafade536fbb18f7aa0', 'admin0000', 0, ''),
	('9ff0cb7b3d2b42f38a62e2d1aa6fc2f2', 'af2b451b538648958fbbb051448640c3', 2, '5c2cf53d430d49ea8169674fe85c0906', '5acb66f7c01c812d50000001', 1, ''),
	('b85021a3c847458582230a0dfb1589bf', 'af2b451b538648958fbbb051448640c3', 1, '4be9165e038441de838d53c5528b8990', '5b189019c01c812974000004', 0, ''),
	('bca4dbc058d2450b85ed57f197486873', 'f2789be9499b4d06881721e1377bb7a7', 2, 'leave', '5accb0c7c01c811d6c000007', 0, ''),
	('bf0befd347d94b3a8a912cf31086b2d3', 'af2b451b538648958fbbb051448640c3', 2, 'leave', '5acb66f7c01c812d50000001', 1, ''),
	('c22b588fcc0049b582b3c42b379bfbe0', 'af2b451b538648958fbbb051448640c3', 2, '4be9165e038441de838d53c5528b8990', '5acb66f7c01c812d50000001', 1, ''),
	('dca1dbfd70f748228a7e0a0560f8e09e', 'af2b451b538648958fbbb051448640c3', 2, 'a5eb4e11fe0947808b4ceabcaf4e06d6', '5acb66f7c01c812d50000001', 1, ''),
	('f002f91e949c4c1a8a5067c3dbc3c4ca', 'af2b451b538648958fbbb051448640c3', 2, '2b36a25887f341ebb696f18c2ee5ee13', '5acb66f7c01c812d50000001', 1, ''),
	('f51b8d95c9584cf5ab239c80e5d391ca', 'af2b451b538648958fbbb051448640c3', 1, '91dee7dfe72241a6a0bb277cd08c5812', '5b189019c01c812974000004', 0, '');
/*!40000 ALTER TABLE `bpmnode` ENABLE KEYS */;

-- 导出  表 ebc_debug.bpmprocess 结构
CREATE TABLE IF NOT EXISTS `bpmprocess` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `CreateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `BpmProcess_Code` (`Code`),
  KEY `BpmProcess_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.bpmprocess 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `bpmprocess` DISABLE KEYS */;
REPLACE INTO `bpmprocess` (`Id`, `Name`, `Code`, `Remark`, `ProjectId`, `OrderNo`, `CreateDate`) VALUES
	('2b36a25887f341ebb696f18c2ee5ee13', '外出', 'out', '', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-26 14:12:31'),
	('4be9165e038441de838d53c5528b8990', '通用', 'approves', '', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-27 21:30:48'),
	('58f8e21f5be147349e2de9c06e447c92', '报销', 'expense', '', 'f2789be9499b4d06881721e1377bb7a7', 0, '2018-06-27 21:45:53'),
	('5c2cf53d430d49ea8169674fe85c0906', '采购', 'purchase', '', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-27 20:55:06'),
	('66e95e5641664f3483818a3f7fd4017e', '请假', 'leave', '', 'f2789be9499b4d06881721e1377bb7a7', 0, '2018-06-20 22:04:30'),
	('91dee7dfe72241a6a0bb277cd08c5812', '出差', 'travel', '', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-26 11:46:12'),
	('a5eb4e11fe0947808b4ceabcaf4e06d6', '报销', 'expense', '', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-27 16:53:40'),
	('d3eb82d90b1b4aafade536fbb18f7aa0', '请假测试', 'leave', '', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-20 22:15:24');
/*!40000 ALTER TABLE `bpmprocess` ENABLE KEYS */;

-- 导出  表 ebc_debug.bpmprocesslink 结构
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

-- 正在导出表  ebc_debug.bpmprocesslink 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `bpmprocesslink` DISABLE KEYS */;
REPLACE INTO `bpmprocesslink` (`Id`, `ProjectId`, `ProcessId`, `UserId`) VALUES
	('15f41b2798d64adab08e5b4e37302ce6', 'af2b451b538648958fbbb051448640c3', '4be9165e038441de838d53c5528b8990', 'admin0000'),
	('221b9cd21ba64ca9b60b1581bc31a38d', 'af2b451b538648958fbbb051448640c3', '5c2cf53d430d49ea8169674fe85c0906', 'admin0000'),
	('29eb623eb05744f990f377cce8e6338c', 'af2b451b538648958fbbb051448640c3', 'd3eb82d90b1b4aafade536fbb18f7aa0', 'admin0000'),
	('82645bc1a97d4e709c5c0dde3b190684', 'f2789be9499b4d06881721e1377bb7a7', '58f8e21f5be147349e2de9c06e447c92', 'admin0000'),
	('8d93e58d90694bfa83af819bcff114cd', 'af2b451b538648958fbbb051448640c3', 'd3eb82d90b1b4aafade536fbb18f7aa0', '5b189019c01c812974000004'),
	('91fbd7f0f6d14603844c8d15a74d8a4c', 'af2b451b538648958fbbb051448640c3', 'a5eb4e11fe0947808b4ceabcaf4e06d6', 'admin0000'),
	('96b4935642a84dd989c9a16cdc80bfa4', 'af2b451b538648958fbbb051448640c3', '91dee7dfe72241a6a0bb277cd08c5812', 'admin0000'),
	('b184ebefd1524d2cbca113e566e3c9d4', 'af2b451b538648958fbbb051448640c3', '2b36a25887f341ebb696f18c2ee5ee13', 'admin0000'),
	('bbed26b2dccb4024970a9f9dca4356b3', 'af2b451b538648958fbbb051448640c3', 'd3eb82d90b1b4aafade536fbb18f7aa0', '5acb66f7c01c812d50000001');
/*!40000 ALTER TABLE `bpmprocesslink` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappapproves 结构
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

-- 正在导出表  ebc_debug.oaappapproves 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oaappapproves` DISABLE KEYS */;
REPLACE INTO `oaappapproves` (`Id`, `ProjectId`, `ProcessId`, `Status`, `OrderNo`, `Kind`, `Content`, `Reseaon`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`) VALUES
	('1dea99cf850244b7bf3525372ec8df63', 'af2b451b538648958fbbb051448640c3', '4be9165e038441de838d53c5528b8990', 1, 0, 0, '', '', '2018-06-27 21:31:29', '2018-06-27 21:31:47', 'admin0000', '', '', 0),
	('370dee3cbc64470c8ee0a09b3e6e67e4', 'af2b451b538648958fbbb051448640c3', '4be9165e038441de838d53c5528b8990', 1, 0, 0, '测试', '', '2018-06-30 14:29:55', '2018-06-30 14:30:19', 'admin0000', '', '', 0),
	('bdd53d45053043f78a384fa760346cfb', 'af2b451b538648958fbbb051448640c3', '4be9165e038441de838d53c5528b8990', 1, 0, 0, '通用申请', '', '2018-06-27 21:36:10', '2018-06-27 21:36:19', 'admin0000', '', '', 0);
/*!40000 ALTER TABLE `oaappapproves` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappapproveslink 结构
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

-- 正在导出表  ebc_debug.oaappapproveslink 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `oaappapproveslink` DISABLE KEYS */;
REPLACE INTO `oaappapproveslink` (`Id`, `ApprovesId`, `UserId`, `ProjectId`) VALUES
	('12d61de643fc4e4c9b2faa369505d327', 'bdd53d45053043f78a384fa760346cfb', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3'),
	('c36cf8f683384e4b9961b991a85388fa', '1dea99cf850244b7bf3525372ec8df63', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3'),
	('dde19c3f65b54355898b90aa1d689546', '370dee3cbc64470c8ee0a09b3e6e67e4', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3'),
	('f5e3c06176fb48079927eeff699fc653', '370dee3cbc64470c8ee0a09b3e6e67e4', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3');
/*!40000 ALTER TABLE `oaappapproveslink` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappapprovesnode 结构
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

-- 正在导出表  ebc_debug.oaappapprovesnode 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `oaappapprovesnode` DISABLE KEYS */;
REPLACE INTO `oaappapprovesnode` (`Id`, `ApprovesId`, `ProjectId`, `OrderNo`, `UserId`, `Kind`, `Token`, `Done`, `Msg`, `Remark`) VALUES
	('0d5d7b35-7c2f-11e8-ab45-80fa5b4601fd', '370dee3cbc64470c8ee0a09b3e6e67e4', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('0d5d8886-7c2f-11e8-ab45-80fa5b4601fd', '370dee3cbc64470c8ee0a09b3e6e67e4', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('158ceb82-7a0f-11e8-ab45-80fa5b4601fd', 'bdd53d45053043f78a384fa760346cfb', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('158cef56-7a0f-11e8-ab45-80fa5b4601fd', 'bdd53d45053043f78a384fa760346cfb', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('6de3094a-7a0e-11e8-ab45-80fa5b4601fd', '1dea99cf850244b7bf3525372ec8df63', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('6de30e04-7a0e-11e8-ab45-80fa5b4601fd', '1dea99cf850244b7bf3525372ec8df63', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `oaappapprovesnode` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappexpense 结构
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

-- 正在导出表  ebc_debug.oaappexpense 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oaappexpense` DISABLE KEYS */;
REPLACE INTO `oaappexpense` (`Id`, `ProjectId`, `ProcessId`, `Status`, `OrderNo`, `Kind`, `CategoryId`, `Amount`, `Reseaon`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`) VALUES
	('30f199aed2aa47d4bb8dca420055fea7', 'af2b451b538648958fbbb051448640c3', 'a5eb4e11fe0947808b4ceabcaf4e06d6', 1, 0, 0, '3d4ecf4278264c7186224d03e10c07c2', 100, '', '2018-06-28 14:30:37', '2018-06-28 14:30:44', 'admin0000', '', '', 0),
	('633e2444323d43dd9f6936778b6dcabc', 'af2b451b538648958fbbb051448640c3', 'a5eb4e11fe0947808b4ceabcaf4e06d6', 1, 0, 0, '3d4ecf4278264c7186224d03e10c07c2', 100, '', '2018-06-29 17:21:44', '2018-06-29 17:22:16', 'admin0000', '', '', 0),
	('8ce63693efaf4b558b23b919b7ed5379', 'af2b451b538648958fbbb051448640c3', 'a5eb4e11fe0947808b4ceabcaf4e06d6', 1, 0, 0, 'ID', 100, '哈哈哈还', '2018-06-27 16:57:53', '2018-06-27 16:59:56', 'admin0000', '', '', 0);
/*!40000 ALTER TABLE `oaappexpense` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappexpenselink 结构
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

-- 正在导出表  ebc_debug.oaappexpenselink 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `oaappexpenselink` DISABLE KEYS */;
REPLACE INTO `oaappexpenselink` (`Id`, `ExpenseId`, `UserId`, `ProjectId`) VALUES
	('911809e3d61f403c88ea74d89285bf52', '633e2444323d43dd9f6936778b6dcabc', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3');
/*!40000 ALTER TABLE `oaappexpenselink` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappexpensenode 结构
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

-- 正在导出表  ebc_debug.oaappexpensenode 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `oaappexpensenode` DISABLE KEYS */;
REPLACE INTO `oaappexpensenode` (`Id`, `ExpenseId`, `ProjectId`, `OrderNo`, `UserId`, `Kind`, `Token`, `Done`, `Msg`, `Remark`) VALUES
	('3393bcc2-79e8-11e8-ab45-80fa5b4601fd', '8ce63693efaf4b558b23b919b7ed5379', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 1, '好', NULL),
	('3393c142-79e8-11e8-ab45-80fa5b4601fd', '8ce63693efaf4b558b23b919b7ed5379', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 1, '', NULL),
	('ce6c9937-7a9c-11e8-ab45-80fa5b4601fd', '30f199aed2aa47d4bb8dca420055fea7', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('ce6c9e1e-7a9c-11e8-ab45-80fa5b4601fd', '30f199aed2aa47d4bb8dca420055fea7', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('e26be6b2-7b7d-11e8-ab45-80fa5b4601fd', '633e2444323d43dd9f6936778b6dcabc', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('e26bef66-7b7d-11e8-ab45-80fa5b4601fd', '633e2444323d43dd9f6936778b6dcabc', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `oaappexpensenode` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappleave 结构
CREATE TABLE IF NOT EXISTS `oaappleave` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `ProcessId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `OaAppLeave_ProjectId` (`ProjectId`),
  KEY `OaAppLeave_CreateUserId` (`CreateUserId`),
  KEY `OaAppLeave_ProcessId` (`ProcessId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.oaappleave 的数据：~24 rows (大约)
/*!40000 ALTER TABLE `oaappleave` DISABLE KEYS */;
REPLACE INTO `oaappleave` (`Id`, `ProjectId`, `OrderNo`, `Kind`, `StartTime`, `EndTime`, `Reseaon`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`, `ProcessId`, `Status`) VALUES
	('00001', '1111', 0, 0, NULL, NULL, NULL, NULL, NULL, 'admin0000', NULL, NULL, 1, '1', 0),
	('00002', '0000', 0, 0, NULL, NULL, NULL, NULL, NULL, 'admin0000', NULL, NULL, 1, '1', 0),
	('00003', '0000', 0, 0, NULL, NULL, NULL, NULL, NULL, 'admin0000', NULL, NULL, 1, '1', 0),
	('00004', '0000', 0, 0, NULL, NULL, NULL, NULL, NULL, 'admin0000', NULL, NULL, 1, '1', 0),
	('145b8d11911a420e9dd6b0b80bc1287d', 'af2b451b538648958fbbb051448640c3', 0, 1, '2018-06-06 08:00:00', '2018-06-08 08:00:00', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2018-06-07 12:02:01', '2018-06-08 19:29:12', '5b189019c01c812974000004', '', '', 0, 'leave', 3),
	('159d73afe7c546748af0d63adf625630', 'af2b451b538648958fbbb051448640c3', 0, 1, '2018-06-29 15:37:00', '2018-06-29 15:37:00', '144 ', '2018-06-29 15:28:51', '2018-06-29 15:38:51', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 1),
	('31890366288948e79e523f4d96a60307', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-22 00:00:00', '2018-06-22 16:00:00', '', '2018-06-21 16:01:17', '2018-06-21 16:01:17', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 0),
	('5122d7c284004cf18c8327c9664838c7', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-29 16:03:00', '2018-06-30 16:03:00', '', '2018-06-29 16:03:32', '2018-06-29 16:15:51', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 0),
	('5b10a321c00444bab4939871888c5d27', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-25 21:17:00', '2018-06-26 21:17:00', '', '2018-06-25 21:17:59', '2018-06-25 21:17:59', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 1),
	('60d095d632aa4d7d8cd21ccee15caa63', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-25 19:14:00', '2018-06-25 19:15:00', '', '2018-06-25 19:15:12', '2018-06-25 19:15:12', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 1),
	('6e8ba300ae67447a866c7eadf0ff0b88', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-25 21:09:00', '2018-06-26 21:09:00', '', '2018-06-25 21:09:34', '2018-06-25 21:09:34', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 1),
	('757a9343c3e548ac858b55c75b00d9a4', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-20 08:00:00', '2018-06-21 08:00:00', '', '2018-06-20 22:16:14', '2018-06-21 15:59:22', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 1),
	('995f65afcb8940478132772ccd061934', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-29 15:08:00', '2018-06-29 15:08:00', 'f', '2018-06-29 15:08:32', '2018-06-29 15:08:32', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 0),
	('9ecb922702374fd1a51aa468f72ac766', 'af2b451b538648958fbbb051448640c3', 0, 1, '2018-06-05 08:00:00', '2018-06-08 08:00:00', '哦了', '2018-06-07 11:54:43', '2018-06-07 11:54:43', '5b189019c01c812974000004', '', '', 0, 'leave', 0),
	('aa619c7521e144bd898e658dfa64f341', 'af2b451b538648958fbbb051448640c3', 0, 2, '2018-06-04 08:00:00', '2018-06-09 08:00:00', '你一伊利', '2018-06-04 20:50:06', '2018-06-06 20:51:22', 'admin0000', '', '', 0, 'leave', 1),
	('bdbdc7c60970467abcb58443561c4e60', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-21 16:17:00', '2018-06-22 16:17:00', '', '2018-06-21 16:18:02', '2018-06-21 16:18:02', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 0),
	('c2fedb41c8994107bd15f2f4dd8d15a5', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-25 17:10:00', '2018-06-26 17:10:00', '', '2018-06-25 17:11:03', '2018-06-25 17:11:03', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 1),
	('c8b85bf4bca64398aea485a2ea29241c', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-22 00:09:00', '2018-06-23 00:09:00', '', '2018-06-21 16:09:23', '2018-06-21 16:09:23', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 0),
	('cdfee7b2bd7c4c058cf6705cbce94414', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-06 08:00:00', '2018-06-08 08:00:00', '好的', '2018-06-08 19:32:42', '2018-06-08 19:32:50', 'admin0000', '', '', 0, 'leave', 1),
	('cf1525e017004ba886a9eb149eccefed', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-06 08:00:00', '2018-06-10 08:00:00', 'sjsnbsz\nsss\n\ndsd', '2018-06-07 19:36:04', '2018-06-08 19:26:43', 'admin0000', '', '', 0, 'leave', 1),
	('d710dc28fc1d4c399100a1a0aa592a6b', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-25 19:55:00', '2018-06-26 19:55:00', '', '2018-06-25 19:55:29', '2018-06-25 19:55:29', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 1),
	('da6c23713c004421ac96cf73f67a3c12', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-26 19:17:00', '2018-06-27 19:17:00', '', '2018-06-26 19:18:01', '2018-06-26 19:19:13', '5acb66f7c01c812d50000001', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 0),
	('ee90bda6cf53491d85200f2e8352b7cc', 'af2b451b538648958fbbb051448640c3', 0, 0, NULL, NULL, '', '2018-06-29 15:23:09', '2018-06-29 15:23:09', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 0),
	('f6ba9f6b3a304495b51bab19d2e230cc', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-26 16:18:00', '2018-06-27 16:18:00', '', '2018-06-21 16:18:27', '2018-06-21 16:26:53', 'admin0000', '', '', 0, 'd3eb82d90b1b4aafade536fbb18f7aa0', 1);
/*!40000 ALTER TABLE `oaappleave` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappleavelink 结构
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

-- 正在导出表  ebc_debug.oaappleavelink 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `oaappleavelink` DISABLE KEYS */;
REPLACE INTO `oaappleavelink` (`Id`, `LeaveId`, `UserId`, `ProjectId`) VALUES
	('3d149f9034494fc28f6a11abd36cbb3c', '159d73afe7c546748af0d63adf625630', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3'),
	('4388d4f5e14c461bbfcd80d9d953aa0c', '5122d7c284004cf18c8327c9664838c7', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3'),
	('5bca3d46a646444db485a8cacb451364', '145b8d11911a420e9dd6b0b80bc1287d', 'admin0000', 'af2b451b538648958fbbb051448640c3'),
	('8a97f3610f6a4078b7a19cd61309a770', 'aa619c7521e144bd898e658dfa64f341', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3'),
	('b2f40b352efc44859b0cf5ad99e74a59', '83ee67759f514a358a95549b5411a135', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3'),
	('c0e98a793bac480ba3694bb77cef13f2', 'e4a175120a924069bcb232197264af59', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3'),
	('c30f6468934940d59251665110c862f0', '145b8d11911a420e9dd6b0b80bc1287d', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3'),
	('c50d94d88a6a4b39873a35b43676b80a', '9ecb922702374fd1a51aa468f72ac766', 'admin0000', 'af2b451b538648958fbbb051448640c3'),
	('dbda20fc90c0475186e08914d6e4541a', 'cdfee7b2bd7c4c058cf6705cbce94414', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3');
/*!40000 ALTER TABLE `oaappleavelink` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappleavenode 结构
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

-- 正在导出表  ebc_debug.oaappleavenode 的数据：~47 rows (大约)
/*!40000 ALTER TABLE `oaappleavenode` DISABLE KEYS */;
REPLACE INTO `oaappleavenode` (`Id`, `LeaveId`, `ProjectId`, `OrderNo`, `UserId`, `Kind`, `Token`, `Done`, `Msg`, `Remark`) VALUES
	('03c1a63c-7879-11e8-ab45-80fa5b4601fd', '6e8ba300ae67447a866c7eadf0ff0b88', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('03c1ac4f-7879-11e8-ab45-80fa5b4601fd', '6e8ba300ae67447a866c7eadf0ff0b88', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('0986314c-7869-11e8-ab45-80fa5b4601fd', '60d095d632aa4d7d8cd21ccee15caa63', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('0986338b-7869-11e8-ab45-80fa5b4601fd', '60d095d632aa4d7d8cd21ccee15caa63', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('1ce8887e-7b6e-11e8-ab45-80fa5b4601fd', '159d73afe7c546748af0d63adf625630', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('1ce88ddd-7b6e-11e8-ab45-80fa5b4601fd', '159d73afe7c546748af0d63adf625630', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('1e71cad8-6a47-11e8-a8d9-80fa5b4601fd', 'cf1525e017004ba886a9eb149eccefed', 'af2b451b538648958fbbb051448640c3', 1, '5accb0c7c01c811d6c000007', 0, 0, 1, '同样', NULL),
	('1e71dc75-6a47-11e8-a8d9-80fa5b4601fd', 'cf1525e017004ba886a9eb149eccefed', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 1, '退回', NULL),
	('30c01480-787a-11e8-ab45-80fa5b4601fd', '5b10a321c00444bab4939871888c5d27', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('30c01a76-787a-11e8-ab45-80fa5b4601fd', '5b10a321c00444bab4939871888c5d27', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('469827da-7b6b-11e8-ab45-80fa5b4601fd', '995f65afcb8940478132772ccd061934', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('46983ef6-7b6b-11e8-ab45-80fa5b4601fd', '995f65afcb8940478132772ccd061934', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 0, NULL, NULL),
	('51545109-7b6d-11e8-ab45-80fa5b4601fd', 'ee90bda6cf53491d85200f2e8352b7cc', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('5154564f-7b6d-11e8-ab45-80fa5b4601fd', 'ee90bda6cf53491d85200f2e8352b7cc', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 0, NULL, NULL),
	('564f0d99-7529-11e8-bb97-80fa5b4601fd', '31890366288948e79e523f4d96a60307', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('564f136f-7529-11e8-bb97-80fa5b4601fd', '31890366288948e79e523f4d96a60307', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 0, NULL, NULL),
	('66cdbeda-63df-11e8-a8d9-80fa5b4601fd', '00003', '0000', 1, 'admin0000', 0, 0, 0, NULL, NULL),
	('66cdbfd4-63df-11e8-a8d9-80fa5b4601fd', '00003', '0000', 2, 'admin0000', 0, 1, 0, NULL, NULL),
	('66cdc108-63df-11e8-a8d9-80fa5b4601fd', '00003', '0000', 3, 'admin0000', 0, 0, 0, NULL, NULL),
	('766574ec-63e0-11e8-a8d9-80fa5b4601fd', '00004', '0000', 1, 'admin0000', 0, 0, 0, NULL, NULL),
	('76657613-63e0-11e8-a8d9-80fa5b4601fd', '00004', '0000', 2, 'admin0000', 0, 0, 0, NULL, NULL),
	('766576b3-63e0-11e8-a8d9-80fa5b4601fd', '00004', '0000', 3, 'admin0000', 0, 1, 0, NULL, NULL),
	('780aa557-752a-11e8-bb97-80fa5b4601fd', 'c8b85bf4bca64398aea485a2ea29241c', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('780aa800-752a-11e8-bb97-80fa5b4601fd', 'c8b85bf4bca64398aea485a2ea29241c', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 0, NULL, NULL),
	('8b3c973d-7494-11e8-bb97-80fa5b4601fd', '757a9343c3e548ac858b55c75b00d9a4', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('8b3cfa3b-7494-11e8-bb97-80fa5b4601fd', '757a9343c3e548ac858b55c75b00d9a4', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('9bbde449-7932-11e8-ab45-80fa5b4601fd', 'da6c23713c004421ac96cf73f67a3c12', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('9bbdedca-7932-11e8-ab45-80fa5b4601fd', 'da6c23713c004421ac96cf73f67a3c12', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 0, NULL, NULL),
	('a84e0fef-6a06-11e8-a8d9-80fa5b4601fd', '9ecb922702374fd1a51aa468f72ac766', 'af2b451b538648958fbbb051448640c3', 1, '5accb0c7c01c811d6c000007', 0, 0, 0, NULL, NULL),
	('a84e161f-6a06-11e8-a8d9-80fa5b4601fd', '9ecb922702374fd1a51aa468f72ac766', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('a9f47ddd-786e-11e8-ab45-80fa5b4601fd', 'd710dc28fc1d4c399100a1a0aa592a6b', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('a9f48490-786e-11e8-ab45-80fa5b4601fd', 'd710dc28fc1d4c399100a1a0aa592a6b', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('ad23054e-6a07-11e8-a8d9-80fa5b4601fd', '145b8d11911a420e9dd6b0b80bc1287d', 'af2b451b538648958fbbb051448640c3', 1, '5accb0c7c01c811d6c000007', 0, 0, 0, NULL, NULL),
	('ad2721a9-6a07-11e8-a8d9-80fa5b4601fd', '145b8d11911a420e9dd6b0b80bc1287d', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('ad8df2e5-752b-11e8-bb97-80fa5b4601fd', 'bdbdc7c60970467abcb58443561c4e60', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('ad8df93d-752b-11e8-bb97-80fa5b4601fd', 'bdbdc7c60970467abcb58443561c4e60', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 0, NULL, NULL),
	('b05ee73e-7857-11e8-ab45-80fa5b4601fd', 'c2fedb41c8994107bd15f2f4dd8d15a5', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('b061a24c-7857-11e8-ab45-80fa5b4601fd', 'c2fedb41c8994107bd15f2f4dd8d15a5', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('bc394e2f-752b-11e8-bb97-80fa5b4601fd', 'f6ba9f6b3a304495b51bab19d2e230cc', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('bc395178-752b-11e8-bb97-80fa5b4601fd', 'f6ba9f6b3a304495b51bab19d2e230cc', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('d34ac38f-6b0f-11e8-a8d9-80fa5b4601fd', 'cdfee7b2bd7c4c058cf6705cbce94414', 'af2b451b538648958fbbb051448640c3', 1, '5accb0c7c01c811d6c000007', 0, 0, 1, '统一', NULL),
	('d34aca1d-6b0f-11e8-a8d9-80fa5b4601fd', 'cdfee7b2bd7c4c058cf6705cbce94414', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 1, '同意', NULL),
	('e8d2ea2e-67f5-11e8-a8d9-80fa5b4601fd', 'aa619c7521e144bd898e658dfa64f341', 'af2b451b538648958fbbb051448640c3', 1, '5accb0c7c01c811d6c000007', 0, 0, 0, '同意', NULL),
	('e8d2f12f-67f5-11e8-a8d9-80fa5b4601fd', 'aa619c7521e144bd898e658dfa64f341', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, '', NULL),
	('f5d429d8-7b72-11e8-ab45-80fa5b4601fd', '5122d7c284004cf18c8327c9664838c7', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('f5d43045-7b72-11e8-ab45-80fa5b4601fd', '5122d7c284004cf18c8327c9664838c7', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 0, NULL, NULL),
	('f96e097a-63de-11e8-a8d9-80fa5b4601fd', '00002', '0000', 1, NULL, 0, 0, 0, NULL, NULL),
	('f96e0cbf-63de-11e8-a8d9-80fa5b4601fd', '00002', '0000', 2, NULL, 0, 1, 0, NULL, NULL),
	('f96e0d84-63de-11e8-a8d9-80fa5b4601fd', '00002', '0000', 3, NULL, 0, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `oaappleavenode` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappout 结构
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

-- 正在导出表  ebc_debug.oaappout 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oaappout` DISABLE KEYS */;
REPLACE INTO `oaappout` (`Id`, `ProjectId`, `ProcessId`, `Status`, `OrderNo`, `Kind`, `StartTime`, `EndTime`, `Address`, `Reseaon`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`) VALUES
	('684c7288a40740039d4ee1f7b08f6734', 'af2b451b538648958fbbb051448640c3', '2b36a25887f341ebb696f18c2ee5ee13', 1, 0, 0, '2018-06-26 14:12:00', '2018-06-26 14:13:00', '上海', '', '2018-06-26 14:13:07', '2018-06-26 14:13:07', 'admin0000', '', '', 0),
	('9ead3b8aaf374cdf891213f70b663b79', 'af2b451b538648958fbbb051448640c3', '2b36a25887f341ebb696f18c2ee5ee13', 1, 0, 0, '2018-06-26 19:28:00', '2018-06-26 19:28:00', '北京', '北京', '2018-06-26 19:28:40', '2018-06-26 19:28:47', 'admin0000', '', '', 0),
	('a2d0567e0b144f5c9645cb96e08a2d1a', 'af2b451b538648958fbbb051448640c3', '2b36a25887f341ebb696f18c2ee5ee13', 1, 0, 0, '2018-06-29 16:52:00', '2018-06-29 16:52:00', '北京', '啊啊啊', '2018-06-29 16:52:59', '2018-06-29 16:53:33', 'admin0000', '', '', 0);
/*!40000 ALTER TABLE `oaappout` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappoutlink 结构
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

-- 正在导出表  ebc_debug.oaappoutlink 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oaappoutlink` DISABLE KEYS */;
REPLACE INTO `oaappoutlink` (`Id`, `OutId`, `UserId`, `ProjectId`) VALUES
	('4e5886ae731f42259a8d9125402150af', 'a2d0567e0b144f5c9645cb96e08a2d1a', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3'),
	('a902513d8e1a4626a4b415363b7088d4', 'a2d0567e0b144f5c9645cb96e08a2d1a', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3');
/*!40000 ALTER TABLE `oaappoutlink` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaappoutnode 结构
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

-- 正在导出表  ebc_debug.oaappoutnode 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `oaappoutnode` DISABLE KEYS */;
REPLACE INTO `oaappoutnode` (`Id`, `OutId`, `ProjectId`, `OrderNo`, `UserId`, `Kind`, `Token`, `Done`, `Msg`, `Remark`) VALUES
	('01c4e66f-7908-11e8-ab45-80fa5b4601fd', '684c7288a40740039d4ee1f7b08f6734', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 1, '', NULL),
	('01c4f88f-7908-11e8-ab45-80fa5b4601fd', '684c7288a40740039d4ee1f7b08f6734', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 1, 0, NULL, NULL),
	('1892a4c3-7934-11e8-ab45-80fa5b4601fd', '9ead3b8aaf374cdf891213f70b663b79', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('1892b038-7934-11e8-ab45-80fa5b4601fd', '9ead3b8aaf374cdf891213f70b663b79', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('ddf7cdbc-7b79-11e8-ab45-80fa5b4601fd', 'a2d0567e0b144f5c9645cb96e08a2d1a', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('ddf7d93e-7b79-11e8-ab45-80fa5b4601fd', 'a2d0567e0b144f5c9645cb96e08a2d1a', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `oaappoutnode` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaapppurchase 结构
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

-- 正在导出表  ebc_debug.oaapppurchase 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaapppurchase` DISABLE KEYS */;
REPLACE INTO `oaapppurchase` (`Id`, `ProjectId`, `ProcessId`, `Status`, `OrderNo`, `Kind`, `Name`, `Norm`, `Qty`, `HandTime`, `Reseaon`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`) VALUES
	('5cdc5f3a9e18477a842ac517bd2e8225', 'af2b451b538648958fbbb051448640c3', '5c2cf53d430d49ea8169674fe85c0906', 1, 0, 0, '灯泡', '100w', 10, '2018-06-28 20:56:00', '', '2018-06-27 20:56:20', '2018-06-27 21:00:26', 'admin0000', '', '', 0),
	('edd753feea5e49f09a8bec68db95f2d7', 'af2b451b538648958fbbb051448640c3', '5c2cf53d430d49ea8169674fe85c0906', 1, 0, 0, '测试', '型号', 72, '2018-06-30 14:28:00', '', '2018-06-30 14:28:47', '2018-06-30 14:29:11', 'admin0000', '', '', 0);
/*!40000 ALTER TABLE `oaapppurchase` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaapppurchaselink 结构
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

-- 正在导出表  ebc_debug.oaapppurchaselink 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oaapppurchaselink` DISABLE KEYS */;
REPLACE INTO `oaapppurchaselink` (`Id`, `PurchaseId`, `UserId`, `ProjectId`) VALUES
	('84cf7e6d20b34eea8d6a41e2ad1258a8', 'edd753feea5e49f09a8bec68db95f2d7', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3'),
	('a8f503d589f34305a49b21372fb0bbfe', 'edd753feea5e49f09a8bec68db95f2d7', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3');
/*!40000 ALTER TABLE `oaapppurchaselink` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaapppurchasenode 结构
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

-- 正在导出表  ebc_debug.oaapppurchasenode 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `oaapppurchasenode` DISABLE KEYS */;
REPLACE INTO `oaapppurchasenode` (`Id`, `PurchaseId`, `ProjectId`, `OrderNo`, `UserId`, `Kind`, `Token`, `Done`, `Msg`, `Remark`) VALUES
	('84b40cb4-7a09-11e8-ab45-80fa5b4601fd', '5cdc5f3a9e18477a842ac517bd2e8225', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 1, '', NULL),
	('84b410c6-7a09-11e8-ab45-80fa5b4601fd', '5cdc5f3a9e18477a842ac517bd2e8225', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 1, 0, NULL, NULL),
	('e4f23264-7c2e-11e8-ab45-80fa5b4601fd', 'edd753feea5e49f09a8bec68db95f2d7', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('e4f236ed-7c2e-11e8-ab45-80fa5b4601fd', 'edd753feea5e49f09a8bec68db95f2d7', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `oaapppurchasenode` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaapptravel 结构
CREATE TABLE IF NOT EXISTS `oaapptravel` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `ProcessId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `OaAppTravel_ProjectId` (`ProjectId`),
  KEY `OaAppTravel_CreateUserId` (`CreateUserId`),
  KEY `OaAppTravel_ProcessId` (`ProcessId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.oaapptravel 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oaapptravel` DISABLE KEYS */;
REPLACE INTO `oaapptravel` (`Id`, `ProjectId`, `OrderNo`, `Kind`, `StartTime`, `EndTime`, `Address`, `Reseaon`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`, `ProcessId`, `Status`) VALUES
	('1473bc9beda04337870c7f703856a2b5', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-26 11:46:00', '2018-06-27 11:46:00', '上海', '哈', '2018-06-26 11:46:47', '2018-06-26 13:56:19', 'admin0000', '', '', 0, '91dee7dfe72241a6a0bb277cd08c5812', 1),
	('2237f235ea5c46a68278a4de7f264f41', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-29 16:49:00', '2018-06-29 16:49:00', '上海', '好好', '2018-06-29 16:50:16', '2018-06-29 16:52:19', 'admin0000', '', '', 0, '91dee7dfe72241a6a0bb277cd08c5812', 1),
	('b41f2d364b5b40f18ffdf7ad7f2ae146', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-07-10 16:37:00', '2018-07-11 16:37:00', '测试', '客户', '2018-07-09 16:38:11', '2018-07-09 16:38:49', 'admin0000', '', '', 0, '91dee7dfe72241a6a0bb277cd08c5812', 1),
	('ebec3a5825434a8d9ec3d9dfa4d407be', 'af2b451b538648958fbbb051448640c3', 0, 0, '2018-06-26 19:26:00', '2018-06-26 19:26:00', '北京', '出差', '2018-06-26 19:26:42', '2018-06-26 19:27:10', 'admin0000', '', '', 0, '91dee7dfe72241a6a0bb277cd08c5812', 1);
/*!40000 ALTER TABLE `oaapptravel` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaapptravellink 结构
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

-- 正在导出表  ebc_debug.oaapptravellink 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `oaapptravellink` DISABLE KEYS */;
REPLACE INTO `oaapptravellink` (`Id`, `TravelId`, `UserId`, `ProjectId`) VALUES
	('d72b78d1c7454937be6aed8bce8eaf84', 'b41f2d364b5b40f18ffdf7ad7f2ae146', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3');
/*!40000 ALTER TABLE `oaapptravellink` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaapptravelnode 结构
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

-- 正在导出表  ebc_debug.oaapptravelnode 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `oaapptravelnode` DISABLE KEYS */;
REPLACE INTO `oaapptravelnode` (`Id`, `TravelId`, `ProjectId`, `OrderNo`, `UserId`, `Kind`, `Token`, `Done`, `Msg`, `Remark`) VALUES
	('7cc1e551-7b79-11e8-ab45-80fa5b4601fd', '2237f235ea5c46a68278a4de7f264f41', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 0, NULL, NULL),
	('7cc1e73e-7b79-11e8-ab45-80fa5b4601fd', '2237f235ea5c46a68278a4de7f264f41', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('7cf2e415-8353-11e8-bc04-80fa5b4601fd', 'b41f2d364b5b40f18ffdf7ad7f2ae146', 'af2b451b538648958fbbb051448640c3', 2, '5accb0c7c01c811d6c000007', 1, 0, 0, NULL, NULL),
	('7cf2eede-8353-11e8-bc04-80fa5b4601fd', 'b41f2d364b5b40f18ffdf7ad7f2ae146', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 1, 0, NULL, NULL),
	('8cdd9e82-63e8-11e8-a8d9-80fa5b4601fd', '00001', '0000', 1, 'admin0000', 0, 0, 0, NULL, NULL),
	('8cddabf8-63e8-11e8-a8d9-80fa5b4601fd', '00001', '0000', 2, '5acb66f7c01c812d50000001', 0, 0, 0, NULL, NULL),
	('8cddade5-63e8-11e8-a8d9-80fa5b4601fd', '00001', '0000', 3, '5accb0c7c01c811d6c000007', 0, 1, 0, NULL, NULL),
	('90c81b28-78f3-11e8-ab45-80fa5b4601fd', '1473bc9beda04337870c7f703856a2b5', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 0, 1, '', NULL),
	('90c8225a-78f3-11e8-ab45-80fa5b4601fd', '1473bc9beda04337870c7f703856a2b5', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 1, '好的', NULL),
	('d25267ad-7933-11e8-ab45-80fa5b4601fd', 'ebec3a5825434a8d9ec3d9dfa4d407be', 'af2b451b538648958fbbb051448640c3', 2, '5acb66f7c01c812d50000001', 1, 1, 0, NULL, NULL),
	('d252728a-7933-11e8-ab45-80fa5b4601fd', 'ebec3a5825434a8d9ec3d9dfa4d407be', 'af2b451b538648958fbbb051448640c3', 1, '5b189019c01c812974000004', 0, 0, 1, '', NULL);
/*!40000 ALTER TABLE `oaapptravelnode` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaattendance 结构
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

-- 正在导出表  ebc_debug.oaattendance 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oaattendance` DISABLE KEYS */;
REPLACE INTO `oaattendance` (`Id`, `UserId`, `ProjectId`, `StartTime`, `StartLon`, `StartLat`, `StartPhoto`, `StartAddress`, `Kind`, `EndTime`, `EndLon`, `EndLat`, `EndPhoto`, `EndAddress`) VALUES
	('ee569711d940410c8c7d2adc59d3c01e', 'admin0000', 'af2b451b538648958fbbb051448640c3', '2018-05-25 20:01:40', 113.610833, 22.368593, '', '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', 0, '2018-05-25 20:01:43', 0, 0, '', '');
/*!40000 ALTER TABLE `oaattendance` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaexpensecategory 结构
CREATE TABLE IF NOT EXISTS `oaexpensecategory` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `Name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OaExpenseCategory_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.oaexpensecategory 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `oaexpensecategory` DISABLE KEYS */;
REPLACE INTO `oaexpensecategory` (`Id`, `ProjectId`, `OrderNo`, `Name`) VALUES
	('13dba2d5f255425da78144cc3bcfbc9d', 'af2b451b538648958fbbb051448640c3', 1, '机票'),
	('60dff14991244689897295ab5f405e0d', '3ac5c76728524a94b178fd75e723e3b7', 1, '话费'),
	('6702a84de85d46d989402ea292eff63c', 'af2b451b538648958fbbb051448640c3', 2, '汽车票'),
	('b8fa6c8f5bb04e3b8ed79ee86c21b838', '3ac5c76728524a94b178fd75e723e3b7', 2, '住宿');
/*!40000 ALTER TABLE `oaexpensecategory` ENABLE KEYS */;

-- 导出  表 ebc_debug.oanotice 结构
CREATE TABLE IF NOT EXISTS `oanotice` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUser` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HadView` int(11) DEFAULT 0,
  `NeedView` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `OaNotice_ProjectId` (`ProjectId`),
  KEY `OaNotice_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.oanotice 的数据：~50 rows (大约)
/*!40000 ALTER TABLE `oanotice` DISABLE KEYS */;
REPLACE INTO `oanotice` (`Id`, `ProjectId`, `OrderNo`, `Title`, `Content`, `CreateDate`, `UpdateDate`, `CreateUser`, `UpdateUser`, `Remark`, `Ver`, `CreateUserId`, `UpdateUserId`, `HadView`, `NeedView`) VALUES
	('09097d1aa67941fab147633f5062b6b4', '', 0, '33', '33', '2018-04-16 00:00:00', '2018-04-16 00:00:00', '', '', '', 0, NULL, NULL, 3, 10),
	('0b9bf5dd6ad548888e518253e456c473', '5aca1dfbc01c812254220001', 0, '凡达丰富', 'f广东省噶', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('0ee187f48ac74b25872aafc65721954b', 'f1f8b968780d4202889bd64c4777cf3b', 0, '333', 'e呃呃呃', '2018-04-16 00:00:00', '2018-04-16 00:00:00', '', '', '', 0, NULL, NULL, 3, 8),
	('11111111111', '22222222222', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '333333333333333', NULL, 0, 0),
	('122322212', 'fdkslafjdksl', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'fdsafads', NULL, 0, 0),
	('1c9fb876e2b7414a980f4d5b5c025471', 'af2b451b538648958fbbb051448640c3', 0, 'jsne', 'dbd', '2018-05-25 20:02:17', '2018-05-25 20:02:17', NULL, NULL, '', 0, 'admin0000', '', 0, 0),
	('2222222222222', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, 0),
	('24c32e3ceefd4c1eb4f174cde6278944', 'af2b451b538648958fbbb051448640c3', 0, '测试', '测试', '2018-06-30 14:27:35', '2018-06-30 14:27:35', NULL, NULL, '', 0, 'admin0000', '', 1, 2),
	('2fa735ec2bb241a88ba6697a0890016b', '', 0, '33', '33', '2018-04-16 00:00:00', '2018-04-16 00:00:00', '', '', '', 0, NULL, NULL, 4, 24),
	('32345a53d2314a478390f6d862a53c41', '5aca1dfbc01c812254220001', 0, 'ceshishuju', 'd的测试数据', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('3333333333', '33333333', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '3333333', NULL, 0, 0),
	('33fe7b5680a64d1e94dad9b19c788e85', 'f1f8b968780d4202889bd64c4777cf3b', 0, 'fefef', 'fefefe', '2018-04-23 14:12:00', '2018-04-23 14:12:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('366aee4514a74c5a8cd13dbc17d5fd46', '', 0, '111', '222', '2018-04-16 00:00:00', '2018-04-16 00:00:00', '', '', '', 0, NULL, NULL, 4, 8),
	('40dd9bc854c34fee8ff3c791a5570a0d', 'f1f8b968780d4202889bd64c4777cf3b', 0, '6666', '666666', '2018-04-23 00:00:00', '2018-04-23 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('44444444444444', '4444444444444444', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '444444444444', NULL, 0, 0),
	('45f6fa9b70014c3581cdb85424d7a204', '5aca1dfbc01c812254220001', 0, 'ddd', 'ssfdasfsd', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 7, 10),
	('513a38eb0ae1487b8ec425ac73a7f7b8', 'f1f8b968780d4202889bd64c4777cf3b', 0, '33', 'dddd', '2018-04-23 14:00:04', '2018-04-23 14:00:04', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('58c41295325f451a956a627aded7691e', '', 0, '333', '2222', '2018-04-16 00:00:00', '2018-04-16 00:00:00', '', '', '', 0, NULL, NULL, 0, 0),
	('65b29d312edf4d8d903f68d3a96210e2', '5aca1dfbc01c812254220001', 0, '测试达', '达', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('6c542288dc0f45019cdad56026b03093', '5aca1dfbc01c812254220001', 0, 'fdsafsd', 'gdafdsafds', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 3, 10),
	('6e9d1a1120a240ecbff70a922dd4b7b1', '5aca1dfbc01c812254220001', 0, '反对反对撒', '第三方撒', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('6f3929b29c6b4f629b2f1950a6963843', '5aca1dfbc01c812254220001', 0, 'cdfafd', 'vdagfd', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 3, 44),
	('6fc03b4654a04988a22419a0407bc575', 'f1f8b968780d4202889bd64c4777cf3b', 0, 'ddd', 'ddd', '2018-04-23 13:58:45', '2018-04-23 13:58:45', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('7314e1dff882453a8df75e560de3d4d7', 'af2b451b538648958fbbb051448640c3', 0, '测试', '测下', '2018-05-27 18:32:17', '2018-05-27 18:32:17', NULL, NULL, '', 0, 'admin0000', '', 1, 2),
	('7a8df40ebb344db5aa5f8e029c4cdac8', 'f1f8b968780d4202889bd64c4777cf3b', 0, '7777', '77777', '2018-04-23 00:00:00', '2018-04-23 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 3),
	('80ac3af6fdde46d886ff957a64ccdfaa', 'af2b451b538648958fbbb051448640c3', 0, '好的', '命里', '2018-06-25 20:09:49', '2018-06-25 20:09:49', NULL, NULL, '', 0, '5accb0c7c01c811d6c000007', '', 3, 3),
	('82241642b3ea44f78d78c2af773e84e8', 'f1f8b968780d4202889bd64c4777cf3b', 0, '555', '55', '2018-04-16 00:00:00', '2018-04-16 00:00:00', '', '', '', 0, NULL, NULL, 0, 0),
	('85a3e8b0b46f44038ababffed3aaf56b', '', 0, '444', '332', '2018-04-16 00:00:00', '2018-04-16 00:00:00', '', '', '', 0, NULL, NULL, 0, 0),
	('8706e461c9b445068853eaf6b622ab59', 'af2b451b538648958fbbb051448640c3', 0, '', '', '2018-05-25 20:01:56', '2018-05-25 20:01:56', NULL, NULL, '', 0, 'admin0000', '', 0, 0),
	('8b315655f5964b31aac98d2bc5d2f358', 'f1f8b968780d4202889bd64c4777cf3b', 0, 'wewew', 'wewew', '2018-04-23 14:01:25', '2018-04-23 14:01:25', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('8bb40e9b36874de18f802e4e5d9d6a60', 'af2b451b538648958fbbb051448640c3', 0, '你丑', 'soil额MP5拉泼顶级哦搜嘎叫他搜', '2018-05-23 22:02:49', '2018-05-23 22:02:49', NULL, NULL, '', 0, 'admin0000', '', 1, 2),
	('8d3c3a578d064be6b07f70118a1d327b', 'f2789be9499b4d06881721e1377bb7a7', 0, '合并', '秘籍', '2018-05-27 18:29:04', '2018-05-27 18:29:04', NULL, NULL, '', 0, '5acb66f7c01c812d50000001', '', 0, 1),
	('90b4e0986bd240eb8d8ff8bd093ab11c', '5aca1dfbc01c812254220001', 0, 'eee', 'eee', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('9807d8c4cdd7423084bba673bde18e7c', 'f2789be9499b4d06881721e1377bb7a7', 0, '德芙', '明年', '2018-05-27 18:29:23', '2018-05-27 18:29:23', NULL, NULL, '', 0, '5acb66f7c01c812d50000001', '', 0, 1),
	('98ec26d794584e2199231f6f8a8bb70c', 'af2b451b538648958fbbb051448640c3', 0, '公寓', '红牛绝配', '2018-05-25 20:57:01', '2018-05-25 20:57:01', NULL, NULL, '', 0, '5acb66f7c01c812d50000001', '', 1, 2),
	('99eef1961c2f4cb88464e1fc2dcda7cb', '', 0, '33', '33', '2018-04-16 00:00:00', '2018-04-16 00:00:00', '', '', '', 0, NULL, NULL, 0, 0),
	('a7c4367bf0094320a9585b05c2d80dfd', '5aca1dfbc01c812254220001', 0, 'fdgfd', 'fdsgfgf', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 3, 5),
	('a840c404df7346508b10d3e3d1e1388e', 'af2b451b538648958fbbb051448640c3', 0, 'sdcff', 'cfdvv', '2018-05-23 21:00:30', '2018-05-23 21:00:30', NULL, NULL, '', 0, 'admin0000', '', 1, 2),
	('ae05f09b724248a681d2dbe91469df21', 'f1f8b968780d4202889bd64c4777cf3b', 0, 'refds', 'fdsfdsfds', '2018-04-23 14:09:52', '2018-04-23 14:09:52', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('bf3ccf2f17b04c47890bdd6452012440', '', 0, '111', '222', '2018-04-16 00:00:00', '2018-04-16 00:00:00', '', '', '', 0, NULL, NULL, 0, 0),
	('c8f2715f78854adb8ae803aba1b00261', '', 0, '444', '4444', '2018-04-16 00:00:00', '2018-04-16 00:00:00', '', '', '', 0, NULL, NULL, 0, 0),
	('cd274465acf84a908ae8359ea8303a03', '5aca1dfbc01c812254220001', 0, '测试一对', 'fdafdsfasfdsa', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('e09ebdf380c9404c863b6b5baef9200b', '5aca1dfbc01c812254220001', 0, 'bbb', 'ccc', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('e507c40293334ef38da4aa070726b3cd', '5aca1dfbc01c812254220001', 0, '服务发放第三', 'e哇发放', '2018-04-21 00:00:00', '2018-04-21 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('e7186e1ed6a04c8db9462a588f9d6126', 'f2789be9499b4d06881721e1377bb7a7', 0, '你摸', '哦你在', '2018-05-27 18:30:35', '2018-05-27 18:30:35', NULL, NULL, '', 0, '5acb66f7c01c812d50000001', '', 0, 1),
	('eb79a770f7674b418f05d8663a908d53', 'af2b451b538648958fbbb051448640c3', 0, '邪乎', 'osmium', '2018-05-25 21:05:02', '2018-05-25 21:05:02', NULL, NULL, '', 0, '5acb66f7c01c812d50000001', '', 1, 2),
	('eeeeeeeeee', 'fdkslafjdksl', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'fdsafads', NULL, 0, 0),
	('f14baf285d6c4f81bcba71ee00125994', 'f1f8b968780d4202889bd64c4777cf3b', 0, '111', '2222', '2018-04-23 00:00:00', '2018-04-23 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('fa266d0e4a4c41b790ad308085729fc5', 'af2b451b538648958fbbb051448640c3', 0, '哈哈', '趋势', '2018-06-26 19:16:40', '2018-06-26 19:16:40', NULL, NULL, '', 0, '5acb66f7c01c812d50000001', '', 0, 1),
	('fa7a1d1095ac492486d59cc73312dbf2', 'f1f8b968780d4202889bd64c4777cf3b', 0, '4444', '33333', '2018-04-23 14:07:07', '2018-04-23 14:07:07', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0),
	('fee966cfaf9f4a7ca29db969114c2c34', 'f1f8b968780d4202889bd64c4777cf3b', 0, 'sssd', 'fdsfd', '2018-04-23 00:00:00', '2018-04-23 00:00:00', NULL, NULL, '', 0, '5acb0ee5c01c813700000001', '', 0, 0);
/*!40000 ALTER TABLE `oanotice` ENABLE KEYS */;

-- 导出  表 ebc_debug.oanoticecomment 结构
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

-- 正在导出表  ebc_debug.oanoticecomment 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `oanoticecomment` DISABLE KEYS */;
REPLACE INTO `oanoticecomment` (`Id`, `NoticeId`, `UserId`, `ProjectId`, `Content`, `CreateDate`, `Ver`) VALUES
	('01b513120d74412e9c1c683bb5a6b2c0', 'a840c404df7346508b10d3e3d1e1388e', 'admin0000', 'af2b451b538648958fbbb051448640c3', '捏腿哦了', '2018-05-23 21:08:16', 0),
	('0a408033da6342f584b25622c8bce197', '80ac3af6fdde46d886ff957a64ccdfaa', 'admin0000', 'af2b451b538648958fbbb051448640c3', '卡', '2018-06-26 21:50:04', 0),
	('16d78a6fd27f4a6089a4cdb8d4682f41', '7314e1dff882453a8df75e560de3d4d7', 'admin0000', 'af2b451b538648958fbbb051448640c3', '测试', '2018-05-27 19:16:35', 0),
	('32b78cfe44d04acf91138fe635da4fcf', '1c9fb876e2b7414a980f4d5b5c025471', 'admin0000', 'af2b451b538648958fbbb051448640c3', 'jsbsbd', '2018-05-25 20:02:51', 0),
	('4799f0907d854ae7a3e01149271d40f3', 'a840c404df7346508b10d3e3d1e1388e', 'admin0000', 'af2b451b538648958fbbb051448640c3', '和他', '2018-05-23 22:01:14', 0),
	('61ebb600da6f4fc887aaee0412466a17', 'a840c404df7346508b10d3e3d1e1388e', 'admin0000', 'af2b451b538648958fbbb051448640c3', '好好了', '2018-05-23 21:17:11', 0),
	('8c5f22fb68224cfdaa508c9c23394d2b', '8bb40e9b36874de18f802e4e5d9d6a60', 'admin0000', 'af2b451b538648958fbbb051448640c3', '你就', '2018-05-23 22:03:18', 0),
	('957898ead9084322903486cff03b3170', '7314e1dff882453a8df75e560de3d4d7', 'admin0000', 'af2b451b538648958fbbb051448640c3', '啊啊啊', '2018-05-27 19:16:46', 0),
	('95d34f2313ee441398c366c0c2b22410', '1c9fb876e2b7414a980f4d5b5c025471', 'admin0000', 'af2b451b538648958fbbb051448640c3', 'aaaa', '2018-05-25 20:02:33', 0),
	('a2c654a55c344fe78a557765b90275cc', 'a840c404df7346508b10d3e3d1e1388e', 'admin0000', 'af2b451b538648958fbbb051448640c3', 'jsbh4640哈哈哈', '2018-05-23 21:05:51', 0),
	('b24b974f342e4cab8053f4749df254ca', '1c9fb876e2b7414a980f4d5b5c025471', 'admin0000', 'af2b451b538648958fbbb051448640c3', 'sbsbhjsnvshshsnnsnsns', '2018-05-25 20:02:40', 0),
	('b7c80b8d199c4611821ac354f2560653', '1c9fb876e2b7414a980f4d5b5c025471', 'admin0000', 'af2b451b538648958fbbb051448640c3', 'bshsvjdv', '2018-05-25 20:02:49', 0),
	('de9d48f342c94fb48e00c2d21fc27502', '8bb40e9b36874de18f802e4e5d9d6a60', 'admin0000', 'af2b451b538648958fbbb051448640c3', '哈哈哈', '2018-05-23 22:03:23', 0),
	('df4afcc364c549e3b435bf63569c133e', '80ac3af6fdde46d886ff957a64ccdfaa', 'admin0000', 'af2b451b538648958fbbb051448640c3', '啦啦啦啦', '2018-06-26 21:50:09', 0),
	('f364c2e4ef794bcea0daf0f8fa6941e9', 'a840c404df7346508b10d3e3d1e1388e', 'admin0000', 'af2b451b538648958fbbb051448640c3', '给你介绍', '2018-05-23 21:10:31', 0);
/*!40000 ALTER TABLE `oanoticecomment` ENABLE KEYS */;

-- 导出  表 ebc_debug.oanoticelink 结构
CREATE TABLE IF NOT EXISTS `oanoticelink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NoticeId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `IsView` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `OaNoticeLink_NoticeId` (`NoticeId`),
  KEY `OaNoticeLink_UserId` (`UserId`),
  KEY `OaNoticeLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.oanoticelink 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `oanoticelink` DISABLE KEYS */;
REPLACE INTO `oanoticelink` (`Id`, `NoticeId`, `UserId`, `ProjectId`, `Ver`, `IsView`) VALUES
	('02d5bc7e8fe747f08f0c62f24ee36e50', '24c32e3ceefd4c1eb4f174cde6278944', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 1),
	('036e142ea13c425590d722a86d77c9dc', '40dd9bc854c34fee8ff3c791a5570a0d', '5acb7914c01c811a30000020', 'f1f8b968780d4202889bd64c4777cf3b', 0, 0),
	('03f5aa983bfd45808e33441fbdc71516', 'a840c404df7346508b10d3e3d1e1388e', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, 1),
	('08de8591bbb94c67b99b482b58bdee14', '8bb40e9b36874de18f802e4e5d9d6a60', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('11111', '0ee187f48ac74b25872aafc65721954b', NULL, NULL, 1, 0),
	('23c6b70d51e84f5080fd0021f94b6df0', '7314e1dff882453a8df75e560de3d4d7', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('357e04a69155437482237f66461e9073', '24c32e3ceefd4c1eb4f174cde6278944', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('3e6ab6994b5040e6b2304cc38608dfd2', 'fa266d0e4a4c41b790ad308085729fc5', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('407b5d0c184e46878e5b3f1efa813d2e', '80ac3af6fdde46d886ff957a64ccdfaa', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, 1),
	('442a36f781d84a55b6a1fc869341e082', '8bb40e9b36874de18f802e4e5d9d6a60', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, 1),
	('44e269f77b0c45c49240cfd5f8f46f71', '7a8df40ebb344db5aa5f8e029c4cdac8', '5acb7914c01c811a30000020', 'f1f8b968780d4202889bd64c4777cf3b', 0, 0),
	('5119f2a4a4c64c238af377982db82d98', '80ac3af6fdde46d886ff957a64ccdfaa', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 1),
	('57dc9eb8bdb14a6d8f6a458957106496', '80ac3af6fdde46d886ff957a64ccdfaa', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, 1),
	('5e4b26ac11f34255a8887449399a7169', '40dd9bc854c34fee8ff3c791a5570a0d', '5acb66f7c01c812d50000001', 'f1f8b968780d4202889bd64c4777cf3b', 0, 0),
	('6052531580344248a87200f71e872682', '7314e1dff882453a8df75e560de3d4d7', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, 1),
	('61fb96e1b0644f3abe9fcc638632e248', '40dd9bc854c34fee8ff3c791a5570a0d', '5accb0c7c01c811d6c000007', 'f1f8b968780d4202889bd64c4777cf3b', 0, 1),
	('682b020b972742c38dff845443060f72', 'a840c404df7346508b10d3e3d1e1388e', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('6acd9f8d36e9442688cecddf45a6c730', 'eb79a770f7674b418f05d8663a908d53', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, 1),
	('7ce870108c674dccb9c5888ce31728b0', '98ec26d794584e2199231f6f8a8bb70c', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, 1),
	('828f6aa8c8344ff98ee20493ee4b9c0f', '8d3c3a578d064be6b07f70118a1d327b', 'admin0000', 'f2789be9499b4d06881721e1377bb7a7', 0, 0),
	('87fd54cd81324c4ca3ade0f1a4caaf6e', 'fee966cfaf9f4a7ca29db969114c2c34', '5acb7914c01c811a30000020', 'f1f8b968780d4202889bd64c4777cf3b', 0, 0),
	('934e9f75a0164b40810a449390e7317c', 'eb79a770f7674b418f05d8663a908d53', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('9aaf2e8cd82f4e0c86f8eefbf47ed555', '9807d8c4cdd7423084bba673bde18e7c', 'admin0000', 'f2789be9499b4d06881721e1377bb7a7', 0, 0),
	('b178febde99b4d7e8c1439f7750a6c7a', '7a8df40ebb344db5aa5f8e029c4cdac8', '5accb0c7c01c811d6c000007', 'f1f8b968780d4202889bd64c4777cf3b', 0, 0),
	('b534698dedd74153bd76e561d9800e45', '98ec26d794584e2199231f6f8a8bb70c', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('b762d8c42f9f4e3080310b9de289d770', 'e7186e1ed6a04c8db9462a588f9d6126', 'admin0000', 'f2789be9499b4d06881721e1377bb7a7', 0, 0),
	('cae65f2765824936929366f634490790', '7a8df40ebb344db5aa5f8e029c4cdac8', '5acb66f7c01c812d50000001', 'f1f8b968780d4202889bd64c4777cf3b', 0, 0),
	('e2159c3c8d9341928087e5e38762b9e7', 'fee966cfaf9f4a7ca29db969114c2c34', '5accb0c7c01c811d6c000007', 'f1f8b968780d4202889bd64c4777cf3b', 0, 0);
/*!40000 ALTER TABLE `oanoticelink` ENABLE KEYS */;

-- 导出  表 ebc_debug.oasigninpath 结构
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

-- 正在导出表  ebc_debug.oasigninpath 的数据：~20 rows (大约)
/*!40000 ALTER TABLE `oasigninpath` DISABLE KEYS */;
REPLACE INTO `oasigninpath` (`Id`, `UserId`, `ProjectId`, `SignInLocationId`, `Kind`, `SignTime`, `Lon`, `Lat`, `Offset`, `Address`, `Remark`) VALUES
	('070544e23a3b483d8b406153ce54138d', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 2, '2018-07-10 20:49:09', 113.610886, 22.368505, 72.78157516651876, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', ''),
	('15b526c3da844aa69ff54419877bb725', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-17 16:14:12', 113.61082, 22.368402, 71.16874492015029, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '。‘’工 '),
	('46c2d278b5b54d9099df0126f7c6124f', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-17 15:47:06', 113.611004, 22.368415, 87.64158104739704, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '好的吧'),
	('528f38d54c194d908842f12715e40c38', 'admin0000', 'af2b451b538648958fbbb051448640c3', '', 0, '2018-06-21 20:20:57', 113.610868, 22.368393, 0, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '堵车'),
	('5a77b10927654ed693e1b87d304c55bd', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-17 16:05:07', 113.610958, 22.368399, 84.00143184652222, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '覅'),
	('5f4d2dc769e24f42897a2cee15f1a943', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 1, '2018-06-30 16:54:48', 113.610875, 22.368418, 75.37611566043026, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', ''),
	('61f49633277441cb8e0ed008e115ae82', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-17 15:59:23', 113.610847, 22.368424, 72.49551761468022, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '好'),
	('62d3ea04a5f44f3abbe72b35a5a334ee', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-17 16:06:52', 113.610859, 22.368399, 74.85646739663895, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '覅'),
	('80607b4c38e14e398ab9a260cbec2e1d', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 1, '2018-07-10 20:49:04', 113.610886, 22.368505, 72.78157516651876, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', ''),
	('8c2f453a3812433798e32495e4cfd93e', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 1, '2018-06-21 20:20:46', 113.610796, 22.368504, 64.11001126378528, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', ''),
	('946dd67bad634be08140eeaf8fce5b04', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 2, '2018-06-30 16:54:48', 113.610875, 22.368418, 75.37611566043026, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', ''),
	('b4d1080cd48041df9d4e5acdc4037166', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-18 13:45:08', 113.610939, 22.368508, 77.87246848140155, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '黄一琳名字我ing破功关心跟你你异性going佛佛红米ing姓名哦'),
	('b5254b4e698d46cfa91c606f7b2d74f9', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-17 16:13:54', 113.610897, 22.36852, 73.35230950327104, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '的'),
	('bf9ea80383924c08ab0277d2f522e689', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-17 15:42:15', 113.610958, 22.368399, 84.00143184652222, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '好'),
	('c706f9df0f17432aad7ec3ca24ca9441', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-17 16:04:20', 113.61087, 22.368399, 75.8595407451496, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '工'),
	('ca20ebba21d84cb5b3618dea80a854e6', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-17 16:06:05', 113.610859, 22.368399, 74.85646739663895, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '工'),
	('da435b00b65b4435ab77b2cd824e0325', 'admin0000', 'af2b451b538648958fbbb051448640c3', '', 0, '2018-07-02 19:57:28', 0, 0, 0, '', '测试下'),
	('e00f107d4aa445528c0c2510403ca6c7', 'admin0000', 'af2b451b538648958fbbb051448640c3', '', 0, '2018-07-02 19:57:46', 0, 0, 0, '', '再测'),
	('f2ada534b65f4a3d843be9266f87784e', 'admin0000', 'af2b451b538648958fbbb051448640c3', '', 0, '2018-07-02 19:57:12', 113.610899, 22.368373, 0, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '测试下'),
	('f8e56817898449c2aa1ac4d84334f17c', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-17 22:52:10', 113.610983, 22.368426, 85.1809837628272, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '好的'),
	('f8f25c5b04324b14b8334e20b0b0605e', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 2, '2018-06-21 20:21:07', 113.610868, 22.368393, 75.98620300365351, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', ''),
	('ff2d6096357843138713d47038c93501', 'admin0000', 'af2b451b538648958fbbb051448640c3', '556d7f742b174c9187dc686dea3b5570', 0, '2018-06-18 13:43:58', 113.610939, 22.368508, 77.87246848140155, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', '你丢');
/*!40000 ALTER TABLE `oasigninpath` ENABLE KEYS */;

-- 导出  表 ebc_debug.oatask 结构
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

-- 正在导出表  ebc_debug.oatask 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `oatask` DISABLE KEYS */;
REPLACE INTO `oatask` (`Id`, `ProjectId`, `OrderNo`, `Priority`, `Status`, `Title`, `Content`, `ExpireDate`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`) VALUES
	('066fbee06f754aee81b4fde105463845', 'f2789be9499b4d06881721e1377bb7a7', 0, 1, 0, '测试', '测试图片功能', '2018-05-31 08:00:00', '2018-05-27 16:33:17', '2018-05-27 16:33:17', '5acb66f7c01c812d50000001', '', '', 0),
	('10774463624e44dc8edb8079355f3ecd', 'af2b451b538648958fbbb051448640c3', 0, 1, 0, '测试', '理论求', '2018-06-26 08:00:00', '2018-06-25 20:16:58', '2018-06-25 20:16:58', 'admin0000', '', '', 0),
	('3624e6fe48094fe58c29ba7f85361b3f', 'af2b451b538648958fbbb051448640c3', 0, 1, 0, '测试', '敏力', '2018-05-28 08:00:00', '2018-05-25 21:35:23', '2018-05-25 21:35:23', '5acb66f7c01c812d50000001', '', '', 0),
	('5a357d03a888414b89cc1aa0e4786533', 'af2b451b538648958fbbb051448640c3', 0, 1, 0, '测试3', '测试3', '2018-07-02 00:00:00', '2018-06-30 14:55:17', '2018-06-30 14:55:17', 'admin0000', '', '', 0),
	('5b60faf462a849209cb88230b12aa770', 'af2b451b538648958fbbb051448640c3', 0, 2, 0, 'fdsfds', 'fdsf', '2018-05-24 08:00:00', '2018-05-22 21:19:24', '2018-05-22 21:19:24', 'admin0000', '', '', 0),
	('7db788572cec4a4181c131e614204abb', 'f2789be9499b4d06881721e1377bb7a7', 0, 1, 0, '两张图片', '两张图片', '2018-05-30 08:00:00', '2018-05-27 16:36:19', '2018-05-27 16:36:19', '5acb66f7c01c812d50000001', '', '', 0),
	('815926ffb72e4791831c796fb35ee3b0', 'af2b451b538648958fbbb051448640c3', 0, 1, 0, '测试2', '测试2', NULL, '2018-06-30 14:51:07', '2018-06-30 14:51:07', 'admin0000', '', '', 0),
	('901cccd64cca4c40aed5fd78487068b1', 'af2b451b538648958fbbb051448640c3', 0, 1, 0, '测试', '测试', NULL, '2018-06-30 14:44:02', '2018-06-30 14:44:02', 'admin0000', '', '', 0),
	('98956e8928f04857b1c6d54d723680a8', 'af2b451b538648958fbbb051448640c3', 0, 0, 0, '尼尔', '海绵', '2018-05-27 08:00:00', '2018-05-25 21:41:25', '2018-05-25 21:41:25', '5acb66f7c01c812d50000001', '', '', 0),
	('a907751fd5a04daa815941d238d4f405', 'af2b451b538648958fbbb051448640c3', 0, 0, 0, '测试', '适配器', '2018-05-31 08:00:00', '2018-05-30 22:31:43', '2018-05-30 22:31:43', 'admin0000', '', '', 0),
	('aa376940b64a4c95892c5f2889881782', 'f2789be9499b4d06881721e1377bb7a7', 0, 1, 0, '测试缓存', '测试缓存', '2018-05-30 08:00:00', '2018-05-27 17:31:04', '2018-05-27 17:31:04', '5acb66f7c01c812d50000001', '', '', 0),
	('e0dff209a739458f9aaf165b88fc54f9', 'af2b451b538648958fbbb051448640c3', 0, 0, 0, '额我去', '迷信', '2018-05-27 08:00:00', '2018-05-25 21:41:47', '2018-05-25 21:41:47', '5acb66f7c01c812d50000001', '', '', 0),
	('eadb3657886b43eab1d0694a0b552858', 'af2b451b538648958fbbb051448640c3', 0, 1, 0, '给你看', '牛mix', '2018-05-27 08:00:00', '2018-05-25 21:37:20', '2018-05-25 21:37:20', '5acb66f7c01c812d50000001', '', '', 0),
	('fc0d55c84bb54c8b8d54652db341363e', 'af2b451b538648958fbbb051448640c3', 0, 1, 0, '测试', '测试', '2018-06-29 08:00:00', '2018-06-25 21:26:00', '2018-06-25 21:26:00', '5accb0c7c01c811d6c000007', '', '', 0);
/*!40000 ALTER TABLE `oatask` ENABLE KEYS */;

-- 导出  表 ebc_debug.oataskfeedback 结构
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

-- 正在导出表  ebc_debug.oataskfeedback 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `oataskfeedback` DISABLE KEYS */;
REPLACE INTO `oataskfeedback` (`Id`, `TaskId`, `UserId`, `ProjectId`, `Kind`, `CreateDate`, `Progress`, `Content`, `Ver`) VALUES
	('0d25fc8d0801461386f3e689432ebd9e', 'e0dff209a739458f9aaf165b88fc54f9', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, '2018-06-07 20:05:00', '40', 's', 0),
	('17273673bf2541b48bfa2d630662d18c', '10774463624e44dc8edb8079355f3ecd', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-25 20:30:18', '70', '反馈', 0),
	('1b3220337b344e5991159aba38158db0', 'fc0d55c84bb54c8b8d54652db341363e', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-25 21:32:49', '50', '厕所', 0),
	('1ce5ffdff6734324a68e68b2a45c51ea', '10774463624e44dc8edb8079355f3ecd', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-25 20:25:58', '反馈2', '反馈2', 0),
	('1efe6a86426243ec860079bc9bf1f20e', '5b60faf462a849209cb88230b12aa770', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, '2018-05-23 22:36:56', '执行', '英牛why敏力基金红米', 0),
	('37c0251874c74f4d9f276d755e1c94e8', '10774463624e44dc8edb8079355f3ecd', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-25 20:39:58', '90', '测试', 0),
	('4470fe63bb294165b754c84b307beab0', 'e0dff209a739458f9aaf165b88fc54f9', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, '2018-06-07 19:57:00', '30%', 'sss ', 0),
	('4c7ac9f5962c49d586fed60a35877f47', 'e0dff209a739458f9aaf165b88fc54f9', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, '2018-05-25 21:45:47', '90%', '好了', 0),
	('548258a86eb348f6891f376239e370cf', '5a357d03a888414b89cc1aa0e4786533', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-30 15:32:01', '测试反馈', '测试反馈', 0),
	('61bf74edff424dd0bba8e3d0cefd3d49', '5b60faf462a849209cb88230b12aa770', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, '2018-05-22 22:10:46', '60%', 'scdsfadszvdsvd', 0),
	('655fec6706034cdb803d06368b470068', '5b60faf462a849209cb88230b12aa770', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, '2018-05-22 22:13:53', '70%', 'fdafgdsabvdavdc', 0),
	('660046fe073141228191ec9485c9cfd3', 'e0dff209a739458f9aaf165b88fc54f9', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, '2018-06-07 20:14:52', 'yu', 'hh', 0),
	('7b22898cec194d8981d937c833da8b17', 'e0dff209a739458f9aaf165b88fc54f9', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, '2018-06-07 20:11:06', 'ddd', 'ddd', 0),
	('92fbf69c4bb6483cbd648274af4fb4c6', 'e0dff209a739458f9aaf165b88fc54f9', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, '2018-06-07 20:06:22', 'ejdj', 'jd', 0),
	('cccf1a77313245ef89d4d257bf7f9dec', '5a357d03a888414b89cc1aa0e4786533', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-30 15:33:54', '测试反馈2', '2', 0),
	('e756353ad2d847feabd632c52c254b0d', '10774463624e44dc8edb8079355f3ecd', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-25 20:38:22', '80', '测试', 0),
	('fe06ed05614a4841a2635628ecd5016f', '10774463624e44dc8edb8079355f3ecd', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, '2018-06-25 20:23:06', '反馈下', '反馈', 0);
/*!40000 ALTER TABLE `oataskfeedback` ENABLE KEYS */;

-- 导出  表 ebc_debug.oatasklink 结构
CREATE TABLE IF NOT EXISTS `oatasklink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TaskId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `Ver` int(11) DEFAULT 1,
  `IsView` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `OaTaskLink_TaskId` (`TaskId`),
  KEY `OaTaskLink_UserId` (`UserId`),
  KEY `OaTaskLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.oatasklink 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `oatasklink` DISABLE KEYS */;
REPLACE INTO `oatasklink` (`Id`, `TaskId`, `UserId`, `ProjectId`, `Kind`, `Ver`, `IsView`) VALUES
	('011fb85d462c4eaebf3f277d2b3278ab', '815926ffb72e4791831c796fb35ee3b0', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('0f4ed56da1f94f3686e2300e7ce66ee4', '98956e8928f04857b1c6d54d723680a8', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0, 0),
	('1231a0c1048e4c839f6a7b1737753e00', '7db788572cec4a4181c131e614204abb', 'admin0000', 'f2789be9499b4d06881721e1377bb7a7', 0, 0, 0),
	('1d57871bf8a3445e821a4fc47e73a0b9', 'aa376940b64a4c95892c5f2889881782', 'admin0000', 'f2789be9499b4d06881721e1377bb7a7', 1, 0, 0),
	('1e15fb03806b4cae8af8f14aa0eaa192', '066fbee06f754aee81b4fde105463845', 'admin0000', 'f2789be9499b4d06881721e1377bb7a7', 1, 0, 0),
	('203119044ca84abf877169cb3066c671', '066fbee06f754aee81b4fde105463845', 'admin0000', 'f2789be9499b4d06881721e1377bb7a7', 0, 0, 0),
	('287855e962e7480283d2ee9a8769c56f', 'fc0d55c84bb54c8b8d54652db341363e', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, 0, 0),
	('30fd42b899dd4b0bb6bb5cfc8820dfff', '5a357d03a888414b89cc1aa0e4786533', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('43a2895df93c47ada4d34e4a8d1678d2', '5b60faf462a849209cb88230b12aa770', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('454c8e8a8aec4295ab4db0b297e46b57', '10774463624e44dc8edb8079355f3ecd', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0, 0),
	('48ebc1c27f614c85a8848c79b2b4c0d0', '3624e6fe48094fe58c29ba7f85361b3f', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0, 0),
	('505340baaa6b40d1833d7668c8b398af', '7db788572cec4a4181c131e614204abb', 'admin0000', 'f2789be9499b4d06881721e1377bb7a7', 1, 0, 0),
	('59e9acdfa3bd4ddb911fc63904aba111', 'fc0d55c84bb54c8b8d54652db341363e', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('5bb36eaed6884f1e86c0eaf824277c0e', '815926ffb72e4791831c796fb35ee3b0', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 0, 0),
	('5bd2b51a21004591ab287388ee1c55a2', 'e0dff209a739458f9aaf165b88fc54f9', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0, 0),
	('64b6c9c949b54df28725c3b329504b3b', '901cccd64cca4c40aed5fd78487068b1', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0, 0),
	('9ae7de3b7cb4459a8efbd25f6a20bfcc', '901cccd64cca4c40aed5fd78487068b1', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('a0edd9381d0545fc848eecb368ffd056', '98956e8928f04857b1c6d54d723680a8', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('a1e2c04597044624a0dfd3a23ca05e96', 'eadb3657886b43eab1d0694a0b552858', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0, 0),
	('ace845ae024e4fc48bdba0296faff75e', 'aa376940b64a4c95892c5f2889881782', 'admin0000', 'f2789be9499b4d06881721e1377bb7a7', 0, 0, 0),
	('b4c0e824bc5d4331b36403f6dcb25045', 'a907751fd5a04daa815941d238d4f405', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('b77ac8c7ab8a4f57892611c9ca1004e6', '10774463624e44dc8edb8079355f3ecd', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('b97e4af5bcb34f0f85db90e5f6e57595', '5a357d03a888414b89cc1aa0e4786533', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 0, 0),
	('bb8eea8320f0472c806e20eff772922d', '3624e6fe48094fe58c29ba7f85361b3f', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('c1afddd7183744f98b95f2f5376d331d', 'e0dff209a739458f9aaf165b88fc54f9', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('c79cecff6cf84b3bb2d386fc2cffa7d1', '5b60faf462a849209cb88230b12aa770', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0, 0),
	('f2a27253dd6f4421a6b1dee1c826a713', 'eadb3657886b43eab1d0694a0b552858', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, 0, 0),
	('fcafda606d3d47d587cd643402c934e3', 'a907751fd5a04daa815941d238d4f405', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0, 0);
/*!40000 ALTER TABLE `oatasklink` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaworkreport 结构
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

-- 正在导出表  ebc_debug.oaworkreport 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `oaworkreport` DISABLE KEYS */;
REPLACE INTO `oaworkreport` (`Id`, `ProjectId`, `OrderNo`, `Status`, `Title`, `Content`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`) VALUES
	('1cfaaf0e715d4d728022dfb780104c07', 'af2b451b538648958fbbb051448640c3', 0, 0, '测试3', '测试3', '2018-05-30 22:29:26', '2018-05-30 22:29:26', 'admin0000', '', '', 0),
	('25c0285ca4044f0b931e3e57f725b9b7', 'af2b451b538648958fbbb051448640c3', 0, 0, '测试下', '测试1', '2018-06-30 15:59:11', '2018-06-30 15:59:11', 'admin0000', '', '', 0),
	('31071c4b3c174138866f124610dc1fa7', 'af2b451b538648958fbbb051448640c3', 0, 0, '111', '啊啊啊', '2018-06-28 11:53:25', '2018-06-28 11:53:25', '5b189019c01c812974000004', '', '', 0),
	('b6ff588ce66c41009ae02fe15867a93a', 'af2b451b538648958fbbb051448640c3', 0, 0, '测试', '测试内容', '2018-05-30 22:19:55', '2018-05-30 22:19:55', 'admin0000', '', '', 0),
	('c09c421909784f5e95fdaae246cc1a68', 'af2b451b538648958fbbb051448640c3', 0, 0, '测试', '测试', '2018-06-30 15:57:11', '2018-06-30 15:57:11', 'admin0000', '', '', 0),
	('c55a6f3d8c194c3a9f44a049ef28787e', 'af2b451b538648958fbbb051448640c3', 0, 0, '测试2', '测试2', '2018-05-30 22:28:42', '2018-05-30 22:28:42', 'admin0000', '', '', 0);
/*!40000 ALTER TABLE `oaworkreport` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaworkreportcomment 结构
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

-- 正在导出表  ebc_debug.oaworkreportcomment 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `oaworkreportcomment` DISABLE KEYS */;
REPLACE INTO `oaworkreportcomment` (`Id`, `WorkReportId`, `UserId`, `ProjectId`, `Content`, `CreateDate`, `Ver`) VALUES
	('16a3db7d1d784a50a4f14802c1c7a3d0', '25c0285ca4044f0b931e3e57f725b9b7', 'admin0000', 'af2b451b538648958fbbb051448640c3', '评论', '2018-07-07 10:28:57', 0),
	('2400d994f20643f5998d3123592e5cb4', '25c0285ca4044f0b931e3e57f725b9b7', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', '覅', '2018-07-07 11:04:21', 0),
	('41c55a97bd31489c96a0d89703ad670c', '25c0285ca4044f0b931e3e57f725b9b7', 'admin0000', 'af2b451b538648958fbbb051448640c3', '评论', '2018-07-07 10:28:53', 0),
	('4e711c0cf1db40658280caa2dfe52cae', '25c0285ca4044f0b931e3e57f725b9b7', 'admin0000', 'af2b451b538648958fbbb051448640c3', '评论2', '2018-07-07 10:28:36', 0),
	('4f3e8be153f14ed88a8dcbe2b6d20574', '25c0285ca4044f0b931e3e57f725b9b7', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', '', '2018-07-07 11:02:16', 0),
	('9af69bbe810e409fb91146700ee98b83', '25c0285ca4044f0b931e3e57f725b9b7', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', '', '2018-07-07 11:02:39', 0),
	('b35e8ed49f7f473ca4160064a67c3cc9', '25c0285ca4044f0b931e3e57f725b9b7', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', '破好困', '2018-07-07 11:02:14', 0),
	('c0d993bab3574d6f8743dc67a2491bba', '25c0285ca4044f0b931e3e57f725b9b7', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', '', '2018-07-07 11:02:15', 0),
	('c4b499a8a4854afa8a958e832aee00ad', '25c0285ca4044f0b931e3e57f725b9b7', 'admin0000', 'af2b451b538648958fbbb051448640c3', '评论下', '2018-07-07 10:27:49', 0);
/*!40000 ALTER TABLE `oaworkreportcomment` ENABLE KEYS */;

-- 导出  表 ebc_debug.oaworkreportlink 结构
CREATE TABLE IF NOT EXISTS `oaworkreportlink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `WorkReportId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `Kind` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `OaWorkReportLink_WorkReportId` (`WorkReportId`),
  KEY `OaWorkReportLink_UserId` (`UserId`),
  KEY `OaWorkReportLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.oaworkreportlink 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `oaworkreportlink` DISABLE KEYS */;
REPLACE INTO `oaworkreportlink` (`Id`, `WorkReportId`, `UserId`, `ProjectId`, `Ver`, `Kind`) VALUES
	('079acc09c69843fa8a646f5331dbf099', '25c0285ca4044f0b931e3e57f725b9b7', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('1d4f373169b34ffe8d149e7f4e70460e', 'c09c421909784f5e95fdaae246cc1a68', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('21dee4c6db384c018d179560382ec87d', 'c55a6f3d8c194c3a9f44a049ef28787e', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('2e6b3873b05d4d79857db2e5c9dc32e8', '25c0285ca4044f0b931e3e57f725b9b7', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('2fbc821dfcd74a7789bec2ee9f56dfd2', '1cfaaf0e715d4d728022dfb780104c07', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('4f0e96ac2912424c80023bf90905021d', 'c55a6f3d8c194c3a9f44a049ef28787e', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('56db3b449f1b46248d60f0b252d080f3', '25c0285ca4044f0b931e3e57f725b9b7', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('6d3bbee0cdb147a198a0aaed16934578', '31071c4b3c174138866f124610dc1fa7', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('6db5dcbe33a5488fbaeecffc39a7db3d', 'b6ff588ce66c41009ae02fe15867a93a', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('82b2fa42a37a4c9d86022811f8e7892b', 'b6ff588ce66c41009ae02fe15867a93a', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('a3e9cbce780942a0a48b80ed0262bd11', '1cfaaf0e715d4d728022dfb780104c07', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('d8a164f7964e4e5db62055c71dd33cc7', '25c0285ca4044f0b931e3e57f725b9b7', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 1),
	('f2068dc2f58b429eb2c62e4a17a5fa8d', 'c09c421909784f5e95fdaae246cc1a68', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('f8837892a65a422f828e4fab9ecba769', '25c0285ca4044f0b931e3e57f725b9b7', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, 1);
/*!40000 ALTER TABLE `oaworkreportlink` ENABLE KEYS */;

-- 导出  表 ebc_debug.project 结构
CREATE TABLE IF NOT EXISTS `project` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `PictureName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PictureId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjVer` int(11) DEFAULT 1,
  `Ver` int(11) DEFAULT 1,
  `CreateUserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lon` double DEFAULT 0,
  `Lat` double DEFAULT 0,
  `SignInStartTime` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SignInEndTime` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SignInDays` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1,2,3,4,5',
  `FullName` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DuratioinDays` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `Project_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.project 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
REPLACE INTO `project` (`Id`, `Name`, `Owner`, `Designer`, `Constructor`, `Supervisor`, `Date1`, `Date2`, `Fundsrc`, `Kind`, `Structure`, `Address`, `Area`, `Cost`, `Descp`, `PictureName`, `PictureId`, `Remark`, `ProjVer`, `Ver`, `CreateUserId`, `Lon`, `Lat`, `SignInStartTime`, `SignInEndTime`, `SignInDays`, `FullName`, `DuratioinDays`) VALUES
	('13eaade4fc2e44688ee787332da930a8', '测试新新', '', '', '', '', NULL, NULL, 0, 0, 0, '[项目位置]', 0, 0, '', NULL, '2036620623ff48db99d859fb2a71dba3', '', 1, 0, 'admin0000', 0, 0, '', '', '', NULL, 0),
	('2a068f5492f745819a787c65fbbf16c7', '终极测试', '', '', '', '', NULL, NULL, 0, 0, 0, '[项目位置]', 0, 0, '', NULL, '6f67aad059c448a78fdea87fcac796c1', '', 1, 0, 'admin0000', 0, 0, '', '', '', NULL, 0),
	('39e0710a065d4249965513772c254fde', '测试5', '', '', '', '', NULL, NULL, 0, 0, 0, '若不设置位置则无法使用考勤', 0, 0, '', NULL, 'f0421804af5043c785afbbf7d625bcdc', '', 1, 0, '5acb66f7c01c812d50000001', 0, 0, '', '', '', NULL, 0),
	('3ac5c76728524a94b178fd75e723e3b7', '基金项目', '', '', '', '', NULL, NULL, 0, 0, 0, '[项目位置]', 0, 0, '', NULL, 'e0ad7f6fbf2f4f5f8ac89d1cfe82438c', '', 1, 0, '5b189019c01c812974000004', 0, 0, '08:00', '18:00', '1,2,3,4,5', NULL, 0),
	('48f9ab803cfa4d27ae62a45b3e166343', '测试新', '', '', '', '', NULL, NULL, 0, 0, 0, '[项目位置]', 0, 0, '', NULL, '356ff92b0c35441a9abec71fbd46d0af', '', 1, 0, 'admin0000', 0, 0, '', '', '', NULL, 0),
	('49d9cec6d11d4f338b585a85525b3892', '测下', '', '', '', '', '2018-07-14', NULL, 0, 0, 0, '若不设置位置则无法使用考勤', 0, 0, '', NULL, '7d7d538633174cb68a2e51d4906af46c', '', 1, 0, '5acb66f7c01c812d50000001', 0, 0, '', '', '', '测下呃呃呃', 10),
	('52e99f4c139943b2968f17c83b2f92e0', '测试', '', '', '', '', '2018-07-15', NULL, 0, 0, 0, '[项目位置]', 0, 0, '', NULL, '2778f47a3f504333a354ede1885907f1', '', 1, 0, '5acb66f7c01c812d50000001', 0, 0, '', '', '', '测试下', 20),
	('615e5bb1ead144958002d91a3d9ee77f', '测试个', '', '', '', '', NULL, NULL, 0, 0, 0, '[项目位置]', 0, 0, '', NULL, 'c5f9e9cf536d4eb38bf7ebc2c8adbb37', '', 1, 0, 'admin0000', 0, 0, '', '', '', NULL, 0),
	('68ed5696c8e247de873617bdf9e17574', '测试6', '', '', '', '', NULL, NULL, 0, 0, 0, '若不设置位置则无法使用考勤', 0, 0, '', NULL, '', '', 1, 0, '5acb66f7c01c812d50000001', 0, 0, NULL, NULL, NULL, NULL, 0),
	('6b56748300024fb88b699e44a25bcd03', '101', '', '', '', '', '2018-07-15', NULL, 0, 0, 0, '[项目位置]', 0, 0, '', NULL, '9b7165a9d51a425c82ab11013a64c579', '', 1, 0, '5acb66f7c01c812d50000001', 0, 0, '', '', '', '测试101', 10),
	('801746fbdf774c45a8e552af45adbc56', '测试100', '', '', '', '', '2018-07-15', NULL, 0, 0, 0, '[项目位置]', 0, 0, '', NULL, '3db0dcd037b14fed8fdd21f7e9459431', '', 1, 0, '5acb66f7c01c812d50000001', 0, 0, '', '', '', '测试100', 10),
	('85a5fe48d64846e986a6ddcf92717e83', '测试，', '', '', '', '', NULL, NULL, 0, 0, 0, '[项目位置]', 0, 0, '', NULL, '6cce3dd50b11451280ea11be2558cde6', '', 1, 0, 'admin0000', 0, 0, '', '', '', NULL, 0),
	('af2b451b538648958fbbb051448640c3', '测试项目', '', '', '', '', NULL, NULL, 0, 0, 0, '广东省珠海市香洲区金月路399号靠近华发蔚蓝堡S3', 0, 0, '111', NULL, '1a8d3693a56f454e9f03f6646b879091', '', 1, 0, 'admin0000', 113.610833, 22.368593, '17:00', '18:00', '2,3,4,5,1', NULL, 0),
	('d694485d84614c7f9327dca37f08837a', '测试7', '', '', '', '', NULL, NULL, 0, 0, 0, '若不设置位置则无法使用考勤', 0, 0, '', NULL, '', '', 1, 0, '5acb66f7c01c812d50000001', 0, 0, NULL, NULL, NULL, NULL, 0),
	('d8de47d0f14b44ae8e36a4de76aa57d5', '测试缓存', '', '', '', '', NULL, NULL, 0, 0, 0, '若不设置位置则无法使用考勤', 0, 0, '', NULL, '', '', 1, 0, '5acb66f7c01c812d50000001', 0, 0, NULL, NULL, NULL, NULL, 0),
	('dd1973067c3244e78d105c30cffb0117', '测试10', '', '', '', '', '2018-07-14', NULL, 0, 0, 0, '若不设置位置则无法使用考勤', 0, 0, '', NULL, 'f0f08ff94e2042ed8b91c6805404a7db', '', 1, 0, '5acb66f7c01c812d50000001', 0, 0, '', '', '', NULL, 0),
	('f2789be9499b4d06881721e1377bb7a7', 'qqqq', '', '', '', '', NULL, NULL, 0, 0, 0, '若不设置位置则无法使用考勤', 0, 0, 'qq', NULL, 'e7f1c000034b4b9b8e83ba34534ec57d', '', 1, 0, 'admin0000', 0, 0, '08:00', '18:00', '1,2,3,4,5,6', NULL, 0);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- 导出  表 ebc_debug.projectjoinrequest 结构
CREATE TABLE IF NOT EXISTS `projectjoinrequest` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectUserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JoinUserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReqKind` int(11) DEFAULT 0,
  `Result` int(11) DEFAULT 0,
  `Msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `RequestTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ProjectJoinRequest_ProjectId` (`ProjectId`),
  KEY `ProjectJoinRequest_ProjectUserId` (`ProjectUserId`),
  KEY `ProjectJoinRequest_JoinUserId` (`JoinUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.projectjoinrequest 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `projectjoinrequest` DISABLE KEYS */;
REPLACE INTO `projectjoinrequest` (`Id`, `ProjectId`, `ProjectUserId`, `JoinUserId`, `ReqKind`, `Result`, `Msg`, `Ver`, `RequestTime`) VALUES
	('019bf9b82ae24cfc815bad7a1b281df5', 'f2789be9499b4d06881721e1377bb7a7', 'admin0000', '5accb0c7c01c811d6c000007', 1, 0, '', 0, '2018-06-26 21:54:40'),
	('1447591e558146f3be3baf54ca83e130', 'dd1973067c3244e78d105c30cffb0117', '5acb66f7c01c812d50000001', 'admin0000', 0, 1, '', 0, '2018-05-27 19:14:19'),
	('35eb2982492c49ae8a56572be46a9885', 'af2b451b538648958fbbb051448640c3', 'admin0000', '5accb0c7c01c811d6c000007', 1, 1, '', 0, '2018-05-22 21:17:07'),
	('36b3f98ffdd443b5b354f9403251732d', '3ac5c76728524a94b178fd75e723e3b7', '5b189019c01c812974000004', 'admin0000', 1, 1, '', 0, '2018-06-26 19:34:13'),
	('43b9d3fa6c2e4a87a3fb7d69dcdb16d3', 'af2b451b538648958fbbb051448640c3', 'admin0000', '5acb66f7c01c812d50000001', 1, 1, '', 0, '2018-05-22 21:16:58'),
	('4a6095c1837a40f1b5a4416255b12413', '3ac5c76728524a94b178fd75e723e3b7', '5b189019c01c812974000004', '5acb66f7c01c812d50000001', 1, 1, '', 0, '2018-06-26 19:35:03'),
	('4ccd792af47345dca6ff4c45dd216e7e', 'd8de47d0f14b44ae8e36a4de76aa57d5', '5acb66f7c01c812d50000001', 'admin0000', 0, 1, '我是', 0, '2018-05-27 17:36:06'),
	('6ca31fb4df724f13a8a6ba1c631666c9', 'f2789be9499b4d06881721e1377bb7a7', 'admin0000', '5acb66f7c01c812d50000001', 0, 1, '我是', 0, '2018-05-27 14:03:19'),
	('99958855eb2643028cb8a0c41f56cfef', '49d9cec6d11d4f338b585a85525b3892', '5acb66f7c01c812d50000001', 'admin0000', 0, 1, '', 0, '2018-05-27 18:33:38'),
	('9e7479fad7e94dd88d1240eb8a27b237', '39e0710a065d4249965513772c254fde', '5acb66f7c01c812d50000001', '5b189019c01c812974000004', 0, 1, '', 0, '2018-06-26 19:35:39'),
	('c1273c9e391649cfaddacbed4f151d90', 'af2b451b538648958fbbb051448640c3', 'admin0000', '5b189019c01c812974000004', 0, 1, '', 0, '2018-06-07 09:53:59'),
	('c1fa551f533946d292392f5224117a36', '3ac5c76728524a94b178fd75e723e3b7', '5b189019c01c812974000004', '5accb0c7c01c811d6c000007', 1, 0, '', 0, '2018-06-26 19:34:22'),
	('d5e4b699860346958deb12d6d10a2500', 'dd1973067c3244e78d105c30cffb0117', '5acb66f7c01c812d50000001', 'admin0000', 0, 1, '', 0, '2018-05-27 19:43:33'),
	('f1b9c2b7dee748a48af3e719393a1f9a', '3ac5c76728524a94b178fd75e723e3b7', '5b189019c01c812974000004', '5b189019c01c812974000004', 1, 1, '', 0, '2018-06-26 19:34:30');
/*!40000 ALTER TABLE `projectjoinrequest` ENABLE KEYS */;

-- 导出  表 ebc_debug.projectsigninlocation 结构
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

-- 正在导出表  ebc_debug.projectsigninlocation 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `projectsigninlocation` DISABLE KEYS */;
REPLACE INTO `projectsigninlocation` (`Id`, `ProjectId`, `Kind`, `OrderNo`, `Lon`, `Lat`, `Range`, `Address`, `CreateUserId`) VALUES
	('0d7bd4917b8748c8a7b0a3366541f8a7', 'f2789be9499b4d06881721e1377bb7a7', 0, 3, 113.54565516114235, 22.272170762668026, 500, '广东省珠海市香洲区梅华街道珠海市文园中学(第二校区)', ''),
	('0eccdcde79564439aea28bb478feef15', 'f2789be9499b4d06881721e1377bb7a7', 0, 4, 113.48084092140199, 22.260828347451177, 500, '广东省中山市坦洲镇南坦路238号之1中澳·郦湖居', ''),
	('556d7f742b174c9187dc686dea3b5570', 'af2b451b538648958fbbb051448640c3', 0, 1, 113.61021459102629, 22.368712174119953, 500, '广东省珠海市香洲区唐家湾镇金月路华发·蔚蓝堡', ''),
	('b0dff59639dd437d93cf9770771aae72', 'f2789be9499b4d06881721e1377bb7a7', 0, 2, 113.57005119323732, 22.24850566251148, 500, '广东省珠海市香洲区吉大街道白莲路123号吉莲新村', ''),
	('c6e5cd32f0734eb6884db33fddffeb84', 'f2789be9499b4d06881721e1377bb7a7', 0, 1, 113.54433417320253, 22.27692390322693, 500, '广东省珠海市香洲区梅华街道彩虹路梅华城市花园', '');
/*!40000 ALTER TABLE `projectsigninlocation` ENABLE KEYS */;

-- 导出  表 ebc_debug.projectuserlink 结构
CREATE TABLE IF NOT EXISTS `projectuserlink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `IsOwner` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `ProjectUserLink_ProjectId` (`ProjectId`),
  KEY `ProjectUserLink_UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.projectuserlink 的数据：~22 rows (大约)
/*!40000 ALTER TABLE `projectuserlink` DISABLE KEYS */;
REPLACE INTO `projectuserlink` (`Id`, `ProjectId`, `UserId`, `Ver`, `IsOwner`) VALUES
	('035a9f82619511e8a8d980fa5b4601fd', '39e0710a065d4249965513772c254fde', '5acb66f7c01c812d50000001', 1, 1),
	('1a5da871619511e8a8d980fa5b4601fd', '68ed5696c8e247de873617bdf9e17574', '5acb66f7c01c812d50000001', 1, 1),
	('1d35b435882711e8bc0480fa5b4601fd', '6b56748300024fb88b699e44a25bcd03', '5acb66f7c01c812d50000001', 1, 1),
	('24e4588e619511e8a8d980fa5b4601fd', 'd694485d84614c7f9327dca37f08837a', '5acb66f7c01c812d50000001', 1, 1),
	('2c467de21605404c84bdb411c0701def', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 0, 0),
	('2dfa651e793511e8ab4580fa5b4601fd', '3ac5c76728524a94b178fd75e723e3b7', 'admin0000', 1, 0),
	('390bb4ef5dc211e8a8d980fa5b4601fd', 'af2b451b538648958fbbb051448640c3', 'admin0000', 1, 1),
	('443f9ddb952a4335843aa4f8c0d64f9b', 'dd1973067c3244e78d105c30cffb0117', 'admin0000', 0, 0),
	('4bc59988601311e8a8d980fa5b4601fd', 'f2789be9499b4d06881721e1377bb7a7', 'admin0000', 1, 1),
	('536a1473619511e8a8d980fa5b4601fd', 'dd1973067c3244e78d105c30cffb0117', '5acb66f7c01c812d50000001', 1, 1),
	('629a1d32619111e8a8d980fa5b4601fd', 'd8de47d0f14b44ae8e36a4de76aa57d5', '5acb66f7c01c812d50000001', 1, 1),
	('65ed9aa9619911e8a8d980fa5b4601fd', '49d9cec6d11d4f338b585a85525b3892', '5acb66f7c01c812d50000001', 1, 1),
	('6e88126540f6436bb8b813fbe070d787', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 0, 0),
	('739a3658882511e8bc0480fa5b4601fd', '52e99f4c139943b2968f17c83b2f92e0', '5acb66f7c01c812d50000001', 1, 1),
	('8342f3647df211e8bc0480fa5b4601fd', '2a068f5492f745819a787c65fbbf16c7', 'admin0000', 1, 1),
	('8343cfe4793511e8ab4580fa5b4601fd', '3ac5c76728524a94b178fd75e723e3b7', '5acb66f7c01c812d50000001', 1, 0),
	('8959af03793511e8ab4580fa5b4601fd', '39e0710a065d4249965513772c254fde', '5b189019c01c812974000004', 1, 0),
	('9416a3fc541c4eaa871e79720e5894a4', '49d9cec6d11d4f338b585a85525b3892', 'admin0000', 0, 0),
	('95501ded7def11e8bc0480fa5b4601fd', '48f9ab803cfa4d27ae62a45b3e166343', 'admin0000', 1, 1),
	('a21e18e6793411e8ab4580fa5b4601fd', '3ac5c76728524a94b178fd75e723e3b7', '5b189019c01c812974000004', 1, 1),
	('a8827d7d7def11e8bc0480fa5b4601fd', '85a5fe48d64846e986a6ddcf92717e83', 'admin0000', 1, 1),
	('c03c09387def11e8bc0480fa5b4601fd', '13eaade4fc2e44688ee787332da930a8', 'admin0000', 1, 1),
	('d4017e727df211e8bc0480fa5b4601fd', '615e5bb1ead144958002d91a3d9ee77f', 'admin0000', 1, 1),
	('d5e2158269f511e8a8d980fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 1, 0),
	('e295fce21373407d884ef8e0c1a28086', 'd8de47d0f14b44ae8e36a4de76aa57d5', 'admin0000', 0, 0),
	('feb0dec0882611e8bc0480fa5b4601fd', '801746fbdf774c45a8e552af45adbc56', '5acb66f7c01c812d50000001', 1, 1);
/*!40000 ALTER TABLE `projectuserlink` ENABLE KEYS */;

-- 导出  表 ebc_debug.projectusertag 结构
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

-- 正在导出表  ebc_debug.projectusertag 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `projectusertag` DISABLE KEYS */;
REPLACE INTO `projectusertag` (`Id`, `ProjectId`, `UserId`, `Tag`, `Ver`) VALUES
	('0db9eec26d6e4ae588112e8ebb651f61', 'f2789be9499b4d06881721e1377bb7a7', 'admin0000', '好的', 0),
	('22222', '2222', '5acb0ee5c01c813700000001', '管理员', 1),
	('2826d5c8d1384761adddebaaed9a23a5', 'f2789be9499b4d06881721e1377bb7a7', 'admin0000', '测试', 0),
	('33333', '33333', '5acb0ee5c01c813700000001', '安全元', 1),
	('5b5d626abf6b482b83be9d8fecfcee4b', 'f2789be9499b4d06881721e1377bb7a7', '5acb66f7c01c812d50000001', '好的', 0),
	('71d20c67c1174ccf9d95f40425dd1043', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', '44', 0),
	('91ca6df825d941a782f97cd86b339c36', 'f2789be9499b4d06881721e1377bb7a7', '5acb66f7c01c812d50000001', '测试', 0),
	('9808c107ffe948898fadd0efab5415ae', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', '222', 0),
	('affe7f1378da4159b6e52961dc54a537', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', '111', 0),
	('c2017cc44e3d44c2a5dac0d065aef4b9', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', '222', 0);
/*!40000 ALTER TABLE `projectusertag` ENABLE KEYS */;

-- 导出  表 ebc_debug.sitedynamic 结构
CREATE TABLE IF NOT EXISTS `sitedynamic` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Biz` int(11) DEFAULT 0,
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

-- 正在导出表  ebc_debug.sitedynamic 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sitedynamic` DISABLE KEYS */;
REPLACE INTO `sitedynamic` (`Id`, `ProjectId`, `Biz`, `Title`, `Content`, `Lon`, `Lat`, `Address`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`) VALUES
	('2159d11956774d7c8837f44c411d6758', 'af2b451b538648958fbbb051448640c3', 0, '测试', '软件', 0, 0, '情侣也饿', '2018-07-09 14:17:15', '2018-07-09 14:17:15', '5acb66f7c01c812d50000001', '', '', 0),
	('7c7f3f0c19064ab780a4cb360159627c', 'af2b451b538648958fbbb051448640c3', 0, '测试动态', '测试动态', 0, 0, '', '2018-07-09 11:47:13', '2018-07-09 11:47:13', '5acb66f7c01c812d50000001', '', '', 0);
/*!40000 ALTER TABLE `sitedynamic` ENABLE KEYS */;

-- 导出  表 ebc_debug.sitedynamiclink 结构
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

-- 正在导出表  ebc_debug.sitedynamiclink 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `sitedynamiclink` DISABLE KEYS */;
REPLACE INTO `sitedynamiclink` (`Id`, `DynamicId`, `UserId`, `ProjectId`, `Kind`, `IsView`) VALUES
	('01a7340f742a434590d47e943045da1e', '7c7f3f0c19064ab780a4cb360159627c', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 1, 0),
	('2e2b90778fc443698b78e0a435d387ae', '7c7f3f0c19064ab780a4cb360159627c', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('69d37e00806c446f833b1ba9b6636015', '2159d11956774d7c8837f44c411d6758', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('7e3eca20566a4ca2800618405baab7e1', '2159d11956774d7c8837f44c411d6758', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, 0),
	('8d194322fd8b4bf99027c707403fa415', '7c7f3f0c19064ab780a4cb360159627c', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 1, 0),
	('af29575144c944e5bf1e24d745bc3be8', '7c7f3f0c19064ab780a4cb360159627c', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('b7465104f921428286fb6ad7a652b7b0', '2159d11956774d7c8837f44c411d6758', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 1, 0),
	('c7fadfabd3a447638fb1e2591bf32e87', '2159d11956774d7c8837f44c411d6758', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('e665ddda4daa46c38dfe7a5a050a2cfe', '7c7f3f0c19064ab780a4cb360159627c', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0);
/*!40000 ALTER TABLE `sitedynamiclink` ENABLE KEYS */;

-- 导出  表 ebc_debug.sitelog 结构
CREATE TABLE IF NOT EXISTS `sitelog` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Weather` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Days` int(11) DEFAULT 0,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SiteLog_ProjectId` (`ProjectId`),
  KEY `SiteLog_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.sitelog 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sitelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitelog` ENABLE KEYS */;

-- 导出  表 ebc_debug.sitetelltech 结构
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

-- 正在导出表  ebc_debug.sitetelltech 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sitetelltech` DISABLE KEYS */;
REPLACE INTO `sitetelltech` (`Id`, `ProjectId`, `Title`, `Content`, `Lon`, `Lat`, `Address`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`) VALUES
	('5a3853d468d84c7f8169620abcb3b441', 'af2b451b538648958fbbb051448640c3', '啊啊啊', '公积金', 0, 0, '', '2018-07-09 11:00:30', '2018-07-09 11:00:30', '5acb66f7c01c812d50000001', '', '', 0),
	('80090887a1b449b5aaf33b04995a381d', 'af2b451b538648958fbbb051448640c3', '测试', '起来了', 0, 0, '劈腿胡', '2018-07-09 14:13:45', '2018-07-09 14:13:45', '5acb66f7c01c812d50000001', '', '', 0);
/*!40000 ALTER TABLE `sitetelltech` ENABLE KEYS */;

-- 导出  表 ebc_debug.sitetelltechlink 结构
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

-- 正在导出表  ebc_debug.sitetelltechlink 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `sitetelltechlink` DISABLE KEYS */;
REPLACE INTO `sitetelltechlink` (`Id`, `TellTechId`, `UserId`, `ProjectId`, `Kind`, `IsView`) VALUES
	('1adabd62baf7401daff91517beea6361', '80090887a1b449b5aaf33b04995a381d', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 1, 0),
	('2fc87c96a29242f3b9f49e2530d6d282', '80090887a1b449b5aaf33b04995a381d', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('3f0f16b998bf4218a2c1445cd7073337', '5a3853d468d84c7f8169620abcb3b441', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, 0),
	('6e1be24262d543a4b0279679dbb06acf', '80090887a1b449b5aaf33b04995a381d', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('8a17cfa0e9704938948aad4f4401c597', '5a3853d468d84c7f8169620abcb3b441', 'admin0000', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('9444aacdfaa549c89e0c0a949ba503f8', '80090887a1b449b5aaf33b04995a381d', 'admin0000', 'af2b451b538648958fbbb051448640c3', 1, 0),
	('e5bd4190e025427799304b38985a8d80', '5a3853d468d84c7f8169620abcb3b441', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 1, 0),
	('f2df39564f6c4456891437cd61d26922', '5a3853d468d84c7f8169620abcb3b441', '5b189019c01c812974000004', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('f62355f801a94e4c8b4ea8fa557e9469', '80090887a1b449b5aaf33b04995a381d', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0);
/*!40000 ALTER TABLE `sitetelltechlink` ENABLE KEYS */;

-- 导出  表 ebc_debug.siteworkerbonus 结构
CREATE TABLE IF NOT EXISTS `siteworkerbonus` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `WorkerId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `WorkDay` double DEFAULT 0,
  `WPDate` datetime DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SiteWorkerBonus_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.siteworkerbonus 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `siteworkerbonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `siteworkerbonus` ENABLE KEYS */;

-- 导出  表 ebc_debug.siteworkerinfo 结构
CREATE TABLE IF NOT EXISTS `siteworkerinfo` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IDCard` int(11) DEFAULT 0,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PhoneNo` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmerPhone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `DailyWages` double DEFAULT 0,
  `IDPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SiteWorkerInfo_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.siteworkerinfo 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `siteworkerinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `siteworkerinfo` ENABLE KEYS */;

-- 导出  表 ebc_debug.siteworkerkind 结构
CREATE TABLE IF NOT EXISTS `siteworkerkind` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SubCategory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SiteWorkerKind_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.siteworkerkind 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `siteworkerkind` DISABLE KEYS */;
/*!40000 ALTER TABLE `siteworkerkind` ENABLE KEYS */;

-- 导出  表 ebc_debug.siteworkerpay 结构
CREATE TABLE IF NOT EXISTS `siteworkerpay` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `WorkerId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Cost` double DEFAULT 0,
  `SettledDate` datetime DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IDPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.siteworkerpay 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `siteworkerpay` DISABLE KEYS */;
/*!40000 ALTER TABLE `siteworkerpay` ENABLE KEYS */;

-- 导出  表 ebc_debug.siteworklog 结构
CREATE TABLE IF NOT EXISTS `siteworklog` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Weather` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Days` int(11) DEFAULT 0,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdateUserId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `Wind` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LogDate` datetime DEFAULT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `SiteWorkLog_ProjectId` (`ProjectId`),
  KEY `SiteWorkLog_CreateUserId` (`CreateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.siteworklog 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `siteworklog` DISABLE KEYS */;
REPLACE INTO `siteworklog` (`Id`, `ProjectId`, `Content`, `Weather`, `Days`, `CreateDate`, `UpdateDate`, `CreateUserId`, `UpdateUserId`, `Remark`, `Ver`, `Wind`, `LogDate`, `Title`) VALUES
	('4696bd42c1244daf8c659806aaa24cbe', 'af2b451b538648958fbbb051448640c3', '哦破上YY是我是我是', '多云', 10, '2018-07-14 11:43:46', '2018-07-14 11:46:47', 'admin0000', '', '', 0, '', '2018-07-14 00:00:00', '给我婆婆XP'),
	('569376166899499f8645f68382aa85c4', 'af2b451b538648958fbbb051448640c3', 'goggle', '测试', 1, '2018-07-14 11:14:17', '2018-07-14 11:14:17', 'admin0000', '', '', 0, '', '2018-07-14 00:00:00', NULL),
	('ed8f8561408c4462b0f767e6005c211f', 'af2b451b538648958fbbb051448640c3', '林红', '多做', 10, '2018-07-14 12:32:30', '2018-07-14 12:32:30', '5acb66f7c01c812d50000001', '', '', 0, '', '2018-07-14 00:00:00', '李敏镐');
/*!40000 ALTER TABLE `siteworklog` ENABLE KEYS */;

-- 导出  表 ebc_debug.siteworkloglink 结构
CREATE TABLE IF NOT EXISTS `siteworkloglink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `WorkLogId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Kind` int(11) DEFAULT 0,
  `IsView` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `SiteWorkLogLink_WorkLogId` (`WorkLogId`),
  KEY `SiteWorkLogLink_UserId` (`UserId`),
  KEY `SiteWorkLogLink_ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.siteworkloglink 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `siteworkloglink` DISABLE KEYS */;
REPLACE INTO `siteworkloglink` (`Id`, `WorkLogId`, `UserId`, `ProjectId`, `Kind`, `IsView`) VALUES
	('0e4cfe062d2341d9b9232d7ca7cd2796', '4696bd42c1244daf8c659806aaa24cbe', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('8c7a2169dea7402c8bb8618055af03d5', '4696bd42c1244daf8c659806aaa24cbe', '5acb66f7c01c812d50000001', 'af2b451b538648958fbbb051448640c3', 0, 0),
	('95791cb93db441a89a0c2c4eecef0df6', 'ed8f8561408c4462b0f767e6005c211f', '5accb0c7c01c811d6c000007', 'af2b451b538648958fbbb051448640c3', 0, 0);
/*!40000 ALTER TABLE `siteworkloglink` ENABLE KEYS */;

-- 导出  表 ebc_debug.sysmodule 结构
CREATE TABLE IF NOT EXISTS `sysmodule` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `OrderNo` int(11) DEFAULT 0,
  `ClientKind` int(11) DEFAULT 0,
  `Name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `Url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `SysModule_Pid` (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.sysmodule 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `sysmodule` DISABLE KEYS */;
REPLACE INTO `sysmodule` (`Id`, `Pid`, `OrderNo`, `ClientKind`, `Name`, `Ver`, `Url`) VALUES
	('00001', '__root__', 0, 0, '模块管理', 1, ' '),
	('00002', '00001', 0, 0, '模块管理', 1, '/admin/module/list'),
	('5b4c0ec1c01c8126a8000004', '__root__', 0, 0, '用户管理', 0, ''),
	('5b4c0ed5c01c8126a8000007', '5b4c0ec1c01c8126a8000004', 0, 0, '用户列表', 0, '/admin/user/list'),
	('5b4c39fcc01c8111f8000008', '__root__', 0, 0, '权限管理', 0, '权限管理'),
	('5b4c3a0cc01c8111f800000b', '5b4c39fcc01c8111f8000008', 0, 0, '角色管理', 0, '/admin/role/list'),
	('5b4c3a1ac01c8111f800000d', '5b4c39fcc01c8111f8000008', 0, 0, '资源管理', 0, '/admin/role/list'),
	('5b4c3a3ac01c8111f8000010', '__root__', 0, 0, '项目管理', 0, ''),
	('5b4c3a49c01c8111f8000013', '5b4c3a3ac01c8111f8000010', 0, 0, '项目列表', 0, '/admin/project/list'),
	('5b4c3a96c01c8111f8000019', '__root__', 0, 1, 'OA办公', 0, ''),
	('5b4c3aa6c01c8111f800001c', '5b4c3a96c01c8111f8000019', 0, 1, '文档管理', 0, '/oa/document/list');
/*!40000 ALTER TABLE `sysmodule` ENABLE KEYS */;

-- 导出  表 ebc_debug.sysoplog 结构
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

-- 正在导出表  ebc_debug.sysoplog 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysoplog` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysoplog` ENABLE KEYS */;

-- 导出  表 ebc_debug.sysorg 结构
CREATE TABLE IF NOT EXISTS `sysorg` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `OrderNo` int(11) DEFAULT 0,
  `Name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `UpdateDate` date DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SysOrg_Pid` (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.sysorg 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysorg` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysorg` ENABLE KEYS */;

-- 导出  表 ebc_debug.syspermission 结构
CREATE TABLE IF NOT EXISTS `syspermission` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PermKind` int(11) DEFAULT 0,
  `ClientKind` int(11) DEFAULT 0,
  `Name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PermKey` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `Pid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ModuleId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `SysPermission_Pid` (`Pid`),
  KEY `SysPermission_ModuleId` (`ModuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.syspermission 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `syspermission` DISABLE KEYS */;
REPLACE INTO `syspermission` (`Id`, `PermKind`, `ClientKind`, `Name`, `PermKey`, `Ver`, `Pid`, `ModuleId`, `Url`) VALUES
	('1111', 0, 0, NULL, '/admin/project/list', 1, '', '', NULL);
/*!40000 ALTER TABLE `syspermission` ENABLE KEYS */;

-- 导出  表 ebc_debug.sysrole 结构
CREATE TABLE IF NOT EXISTS `sysrole` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `Name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `UpdateDate` date DEFAULT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `PermKind` int(11) DEFAULT 0,
  `ClientKind` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.sysrole 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `sysrole` DISABLE KEYS */;
REPLACE INTO `sysrole` (`Id`, `OrderNo`, `Name`, `CreateDate`, `UpdateDate`, `Remark`, `Ver`, `PermKind`, `ClientKind`) VALUES
	('2222', 0, 'test大幅度达到', NULL, '2018-04-10', '', 0, 0, 0);
/*!40000 ALTER TABLE `sysrole` ENABLE KEYS */;

-- 导出  表 ebc_debug.sysrolemodule 结构
CREATE TABLE IF NOT EXISTS `sysrolemodule` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ModuleId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SysRoleModule_RoleId` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.sysrolemodule 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysrolemodule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysrolemodule` ENABLE KEYS */;

-- 导出  表 ebc_debug.sysrolepermission 结构
CREATE TABLE IF NOT EXISTS `sysrolepermission` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `PermKey` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `PermId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `SysRolePermission_RoleId` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.sysrolepermission 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysrolepermission` DISABLE KEYS */;
REPLACE INTO `sysrolepermission` (`Id`, `RoleId`, `PermKey`, `Ver`, `PermId`) VALUES
	('3333', '2222', '', 1, '1111');
/*!40000 ALTER TABLE `sysrolepermission` ENABLE KEYS */;

-- 导出  表 ebc_debug.sysuser 结构
CREATE TABLE IF NOT EXISTS `sysuser` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` int(11) DEFAULT 0,
  `OrgId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `UserName` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RealName` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` int(11) DEFAULT 1,
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
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ver` int(11) DEFAULT 1,
  `IsEnable` int(11) DEFAULT 1,
  `PictureId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `SysUser_OrgId` (`OrgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.sysuser 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `sysuser` DISABLE KEYS */;
REPLACE INTO `sysuser` (`Id`, `OrderNo`, `OrgId`, `UserName`, `RealName`, `Password`, `Status`, `Email`, `Phone`, `Company`, `Position`, `QQ`, `WeiXin`, `Priority`, `RegIp`, `LastLoginIp`, `CreateDate`, `UpdateDate`, `Remark`, `Ver`, `IsEnable`, `PictureId`, `CurrProjectId`) VALUES
	('5acb66f7c01c812d50000001', 0, '', '13333333777', '高脚帽', 'SlGPH1cbtPJYomMG7LU8b8GuPEssac65+bX23vPD75g=', 1, 'q@163.com', '13333333333', '', '', '', '', 0, '', '192.168.1.108', '2018-04-09', '2018-06-30', '', 0, 1, 'ab7b381d7ea54809b1e7d8cd7a139fa0', 'af2b451b538648958fbbb051448640c3'),
	('5acb7914c01c811a30000020', 0, '', 'zzzz', 'zzz', 'ss', 1, 'zz', 'zz', '', '', '', '', 0, '', '192.168.1.106', '2018-04-09', '2018-04-09', '', 0, 1, NULL, NULL),
	('5accb0c7c01c811d6c000007', 0, '', '13455555555', '111', 'ss', 1, 'd@w.cn', '13333333333', '', '', '', '', 0, '', '127.0.0.1', '2018-04-10', '2018-07-17', '', 0, 1, '5b4dd5c5c01c811d94000004', 'af2b451b538648958fbbb051448640c3'),
	('5b189019c01c812974000004', 0, '', '14444444444', '基金', 'TS6ASBQ/ECfjr9ZhKX+90e2d82GM/T7gs7+NC3uUYZw=', 1, '42@163.com', '13333333333', '', '', '', '', 0, '', '127.0.0.1', '2018-06-07', '2018-07-16', '', 0, 1, '3eb2c81119574947ac4f664b05545b05', 'af2b451b538648958fbbb051448640c3'),
	('admin0000', 0, '', 'sss', 'ss2d', 'k9GNP1OfaBGo6QlE0CMcEAXVYPX0TniV7Ph64akwGhE=', 1, 'dfssd@333.com', '13455543432', '', '', '', '', 0, '', '127.0.0.1', '2018-04-09', '2018-07-10', 'eee', 0, 1, '0a2a6197a1d0437b89d727f8c670b30f', 'af2b451b538648958fbbb051448640c3');
/*!40000 ALTER TABLE `sysuser` ENABLE KEYS */;

-- 导出  表 ebc_debug.sysuserrolelink 结构
CREATE TABLE IF NOT EXISTS `sysuserrolelink` (
  `Id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `RoleId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Ver` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`),
  KEY `SysUserRoleLink_UserId` (`UserId`),
  KEY `SysUserRoleLink_RoleId` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.sysuserrolelink 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sysuserrolelink` DISABLE KEYS */;
REPLACE INTO `sysuserrolelink` (`Id`, `UserId`, `RoleId`, `Ver`) VALUES
	('2222', '5acb0ee5c01c813700000001', '2222', 1);
/*!40000 ALTER TABLE `sysuserrolelink` ENABLE KEYS */;

-- 导出  表 ebc_debug.tablever 结构
CREATE TABLE IF NOT EXISTS `tablever` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProjectId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  ebc_debug.tablever 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tablever` DISABLE KEYS */;
REPLACE INTO `tablever` (`Id`, `Name`, `ProjectId`, `Value`) VALUES
	(1, '2', NULL, 0);
/*!40000 ALTER TABLE `tablever` ENABLE KEYS */;

-- 导出  表 ebc_debug.workbenchitem 结构
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

-- 正在导出表  ebc_debug.workbenchitem 的数据：~36 rows (大约)
/*!40000 ALTER TABLE `workbenchitem` DISABLE KEYS */;
REPLACE INTO `workbenchitem` (`Id`, `ProjectId`, `UserId`, `Module`, `SnapContent`, `UpdateTime`) VALUES
	('01c532ab-7908-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppOut', '外出审批:ss2d', '2018-06-29 16:53:33'),
	('0224227e-7908-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaAppOut', '外出:ss2d', '2018-06-29 16:52:59'),
	('03b14f57-7c32-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaTask', '任务反馈 进度:测试反馈2', '2018-06-30 15:33:54'),
	('0986af90-7869-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppLeave', '请假审批:ss2d', '2018-06-29 15:38:51'),
	('0a49eb07-7869-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaAppLeave', '请假:ss2d', '2018-06-29 16:03:32'),
	('176b12ae-7a0a-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppPurchase', '采购审批:ss2d', '2018-06-30 14:29:11'),
	('33ec6522-79e8-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaAppExpense', '报销:ss2d', '2018-06-29 17:21:44'),
	('3bfebff4-8718-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'SiteWorkLog', '施工日志:给我婆婆XP', '2018-07-14 11:46:29'),
	('3bff8cc7-8718-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'SiteWorkLog', '施工日志:给我婆婆XP', '2018-07-14 11:46:29'),
	('3e7228c3-7c3b-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaWorkReport', '工作汇报:测试下', '2018-07-07 10:59:55'),
	('4f9d3be5-833f-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'SiteTellTech', '施工交底:测试', '2018-07-09 14:13:45'),
	('4f9dadef-833f-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', 'admin0000', 'SiteTellTech', '施工交底:测试', '2018-07-09 14:13:45'),
	('4f9ded02-833f-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'SiteTellTech', '施工交底:测试', '2018-07-09 14:13:45'),
	('55624ab0-7a0a-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaAppPurchase', '采购:ss2d', '2018-06-30 14:29:06'),
	('5967f70c-7934-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaAppOut', '外出:ss2d', '2018-06-29 16:53:23'),
	('6bb5c3e8-7932-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaNotice', '公告:测试', '2018-06-30 14:27:35'),
	('6e5fe7c5-7a0e-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaAppApproves', '通用审批:ss2d', '2018-06-30 14:29:55'),
	('78e6868d-7a0e-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppApproves', '通用审批:ss2d', '2018-06-30 14:30:19'),
	('7d4341e4-79e8-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppExpense', '报销审批:ss2d', '2018-06-29 17:22:16'),
	('85124ad2-7a09-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaAppPurchase', '采购:ss2d', '2018-06-30 14:28:47'),
	('858b75e6-7872-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', 'admin0000', 'OaTask', '任务:测试', '2018-06-25 21:26:00'),
	('85fc6d12-7c3b-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaWorkReport', '工作汇报:测试下', '2018-07-07 11:06:04'),
	('90def5dc-78f3-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaAppTravel', '出差:ss2d', '2018-07-09 16:38:11'),
	('a622ad7b-79e8-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaAppExpense', '报销:ss2d', '2018-06-29 17:22:04'),
	('a79d9419-8718-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'SiteWorkLog', '施工日志:李敏镐', '2018-07-14 12:32:30'),
	('a91da5b2-7905-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaAppTravel', '出差审批:ss2d', '2018-07-09 16:38:49'),
	('aaa1b0fe-7871-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaTask', '任务:测试', '2018-06-30 14:44:02'),
	('aaa8a001-7871-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaTask', '任务反馈 进度:测试反馈2', '2018-06-30 15:33:54'),
	('aaebe6a0-7870-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', 'admin0000', 'OaNotice', '公告:好的', '2018-06-25 20:09:49'),
	('aaf2696b-7870-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'OaNotice', '公告:测试', '2018-06-30 14:27:35'),
	('aaf2fcb2-7870-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaNotice', '公告:好的', '2018-06-25 20:09:49'),
	('c71d0c20-7905-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5acb66f7c01c812d50000001', 'OaAppTravel', '出差:ss2d', '2018-07-09 16:38:42'),
	('d75a1eb3-832a-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'SiteDynamic', '施工动态:测试', '2018-07-09 14:17:15'),
	('d75a80a6-832a-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', 'admin0000', 'SiteDynamic', '施工动态:测试', '2018-07-09 14:17:15'),
	('d75ac313-832a-11e8-bc04-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5b189019c01c812974000004', 'SiteDynamic', '施工动态:测试', '2018-07-09 14:17:15'),
	('d835c395-7a86-11e8-ab45-80fa5b4601fd', 'af2b451b538648958fbbb051448640c3', '5accb0c7c01c811d6c000007', 'OaWorkReport', '工作汇报:测试下', '2018-06-30 15:59:11');
/*!40000 ALTER TABLE `workbenchitem` ENABLE KEYS */;

-- 导出  触发器 ebc_debug.tri_appredpoint 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_appredpoint after insert
on appredpoint for each row
begin

if New.ModuleGroup = "App" then

set @workitemcnt =(select count(*)   from workbenchitem  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=New.Module);
if @workitemcnt=0 then 
insert into workbenchitem(id,ProjectId,UserId,Module,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,New.Module,New.SnapContent,now());
else
update workbenchitem t set t.SnapContent=New.SnapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=New.Module;
end if;

end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaappapproves 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaappapproves after insert
on oaappapproves for each row
begin

set @minOrderNo = 1;

insert into oaappapprovesnode(Id,approvesId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaappapprovesnode n where n.approvesId=New.Id;
update oaappapprovesnode t set t.Token=1 where t.approvesId=New.Id and t.OrderNo =@minOrderNo;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaappapproveslink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaappapproveslink after insert
on oaappapproveslink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppApproves' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('通用审批:',u.RealName) into @snapContent from OaAppapproves t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.approvesId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.approvesId,@snapContent,now());


end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaappexpense 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaappexpense after insert
on oaappexpense for each row
begin

set @minOrderNo = 1;

insert into oaappexpensenode(Id,ExpenseId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaappexpensenode n where n.expenseId=New.Id;
update oaappexpensenode t set t.Token=1 where t.expenseId=New.Id and t.OrderNo =@minOrderNo;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaappexpenselink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaappexpenselink after insert
on oaappexpenselink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppExpense' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('报销:',u.RealName) into @snapContent from OaAppExpense t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.expenseId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.expenseId,@snapContent,now());


end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaappleave 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaappleave after insert
on oaappleave for each row
begin
set @minOrderNo = 1;

insert into oaappleavenode(Id,LeaveId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaappleavenode n where n.LeaveId=New.Id;
update oaappleavenode t set t.Token=1 where t.LeaveId=New.Id and t.OrderNo =@minOrderNo;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaappleavelink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaappleavelink after insert
on oaappleavelink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppLeave' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('请假:',u.RealName) into @snapContent from OaAppLeave t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.LeaveId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.LeaveId,@snapContent,now());

/*
set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;*/

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaappout 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaappout after insert
on oaappout for each row
begin

set @minOrderNo = 1;

insert into oaappoutnode(Id,outId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaappoutnode n where n.outId=New.Id;
update oaappoutnode t set t.Token=1 where t.outId=New.Id and t.OrderNo =@minOrderNo;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaappoutlink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaappoutlink after insert
on oaappoutlink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppOut' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('外出:',u.RealName) into @snapContent from OaAppout t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.outId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.outId,@snapContent,now());


end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaapppurchase 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaapppurchase after insert
on oaapppurchase for each row
begin

set @minOrderNo = 1;

insert into oaapppurchasenode(Id,purchaseId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaapppurchasenode n where n.purchaseId=New.Id;
update oaapppurchasenode t set t.Token=1 where t.purchaseId=New.Id and t.OrderNo =@minOrderNo;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaapppurchaselink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaapppurchaselink after insert
on oaapppurchaselink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppPurchase' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('采购:',u.RealName) into @snapContent from OaApppurchase t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.purchaseId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.purchaseId,@snapContent,now());


end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaapptravel 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaapptravel after insert
on oaapptravel for each row
begin

set @minOrderNo = 1;

insert into oaapptravelnode(Id,TravelId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaapptravelnode n where n.TravelId=New.Id;
update oaapptravelnode t set t.Token=1 where t.TravelId=New.Id and t.OrderNo =@minOrderNo;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaapptravellink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaapptravellink after insert
on oaapptravellink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppTravel' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('出差:',u.RealName) into @snapContent from OaAppTravel t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.TravelId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.TravelId,@snapContent,now());


end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oanoticelink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oanoticelink after insert
on oanoticelink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaNotice' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('公告:',Title) into @snapContent from oanotice where Id=New.NoticeId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.NoticeId,@snapContent,now());


set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oataskfeedback 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oataskfeedback after insert
on oataskfeedback for each row
begin
declare tmp_uid varchar(64);
declare tmp_kind int; 
DECLARE done INT DEFAULT FALSE;
declare cur_feedback CURSOR FOR select distinct t.UserId,t.kind from (SELECT  UserId,(case  Kind when  0 then 3  when  1 then 4 end) kind from oatasklink where UserId <> New.UserId and TaskId=New.TaskId 
																		union all select CreateUserId,0 from oatask where  CreateUserId <> New.UserId and Id=New.TaskId) t;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaTask' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';
 

select concat('任务反馈 进度:',Progress)  into @snapContent from oataskfeedback where Id=New.Id;

  
OPEN cur_feedback;
REPEAT  
        FETCH cur_feedback INTO tmp_uid,tmp_kind;
    
    	
    	if NOT done then 
        insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,tmp_uid,@moduleGroup,@moduleName,tmp_kind,New.TaskId,@snapContent,now());
			
			
			set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=tmp_uid  and Module=@moduleName);
			if @cnt=0 then 
			insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,tmp_uid,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
			else
			update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= tmp_uid and Module=@moduleName;
			end if;
        
      end if;
UNTIL done END REPEAT;  
CLOSE cur_feedback;


end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oatasklink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oatasklink after insert
on oatasklink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaTask' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('任务:',Title) into @snapContent from oatask where Id=New.TaskId;
 

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,(case when New.Kind = 0 then 3  when New.Kind = 1 then 4 end),New.TaskId,@snapContent,now());

set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_oaworkreportlink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_oaworkreportlink after insert
on oaworkreportlink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaWorkReport' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('工作汇报:',Title) into @snapContent from OaWorkReport where Id=New.WorkReportId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,New.Kind,New.WorkReportId,@snapContent,now());

set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_project 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_project after insert
on project for each row
begin

set @LinkId = REPLACE(uuid(),'-',''); 

insert into projectuserlink(Id,ProjectId,UserId,IsOwner) values(@LinkId,NEW.Id,New.CreateUserId,1);

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_projectjoinrequest 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_projectjoinrequest after insert
on projectjoinrequest for each row
begin
set @moduleGroup=CONVERT('Project' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('Request' USING utf8) COLLATE utf8_unicode_ci;
set @globeProject = CONVERT('__globe__' USING utf8) COLLATE utf8_unicode_ci;

set @projectName = '';
select Name into @projectName from project where Id=New.ProjectId;

set @snapContent = '';
set @userId ='';

if New.ReqKind = 0 then

set @userId = New.ProjectUserId;

set @userName = '';
select RealName into @userName from sysuser where Id=New.JoinUserId;
set @snapContent = concat(@userName , (CONVERT('申请加入' USING utf8) COLLATE utf8_unicode_ci) , @projectName);

elseif New.ReqKind = 1 then

set @userId = New.JoinUserId;

set @userName = '';
select RealName into @userName from sysuser where Id=New.ProjectUserId;
set @snapContent = concat(@userName , (CONVERT('邀请你加入' USING utf8) COLLATE utf8_unicode_ci) , @projectName);

end if;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),@globeProject,@userId,@moduleGroup,@moduleName,1,New.Id,@snapContent,now());

set @cnt =(select count(*)   from appnotify  where ProjectId=@globeProject and UserId=@userId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),@globeProject,@userId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=@globeProject and UserId= @userId and Module=@moduleName;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_projectuserlink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_projectuserlink after insert
on projectuserlink for each row
begin
set @moduleGroup=CONVERT('Project' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('ProjectUser' USING utf8) COLLATE utf8_unicode_ci;
set @globeProject = CONVERT('__globe__' USING utf8) COLLATE utf8_unicode_ci;

set @projectName = '';

select Name into @projectName from project where Id=New.ProjectId;

set @snapContent = concat( (CONVERT('已加入' USING utf8) COLLATE utf8_unicode_ci) , @projectName);

if New.IsOwner = 0 then

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),@globeProject,New.UserId,@moduleGroup,@moduleName,1,New.ProjectId,@snapContent,now());


set @cnt =(select count(*)   from appnotify  where ProjectId=@globeProject and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),@globeProject,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=@globeProject and UserId= New.UserId and Module=@moduleName;
end if;

end if;


end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_sitedynamiclink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_sitedynamiclink after insert
on sitedynamiclink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('SiteDynamic' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('施工动态:',Title) into @snapContent from SiteDynamic where Id=New.DynamicId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,New.Kind,New.DynamicId,@snapContent,now());

set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_sitetelltechlink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_sitetelltechlink after insert
on sitetelltechlink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('SiteTellTech' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('施工交底:',Title) into @snapContent from SiteTellTech where Id=New.TellTechId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,New.Kind,New.TellTechId,@snapContent,now());

set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_siteworkloglink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_siteworkloglink after insert
on siteworkloglink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('SiteWorkLog' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('施工日志:',Title) into @snapContent from SiteWorkLog where Id=New.WorkLogId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,New.Kind,New.WorkLogId,@snapContent,now());

set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaappapproves 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaappapproves after update
on oaappapproves for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaappapprovesnode n where n.approvesId=New.Id;
update oaappapprovesnode t set t.Token=1 where t.approvesId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaappapprovesnode t set t.Token=0,t.Done=0 where t.approvesId=New.Id;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaappapprovesnode 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaappapprovesnode after update
on oaappapprovesnode for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppApproves' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';


if old.Token = 0 and new.Token=1 then

select concat('通用审批:',u.RealName) into @snapContent from OaAppapproves t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.approvesId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,2,New.approvesId,@snapContent,now());


set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaappexpense 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaappexpense after update
on oaappexpense for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaappexpensenode n where n.expenseId=New.Id;
update oaappexpensenode t set t.Token=1 where t.expenseId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaappexpensenode t set t.Token=0,t.Done=0 where t.expenseId=New.Id;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaappexpensenode 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaappexpensenode after update
on oaappexpensenode for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppExpense' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';


if old.Token = 0 and new.Token=1 then

select concat('报销审批:',u.RealName) into @snapContent from OaAppexpense t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.expenseId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,2,New.expenseId,@snapContent,now());


set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaappleave 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaappleave after update
on oaappleave for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaappleavenode n where n.LeaveId=New.Id;
update oaappleavenode t set t.Token=1 where t.LeaveId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaappleavenode t set t.Token=0,t.Done=0 where t.LeaveId=New.Id;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaappleavenode 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaappleavenode after update
on oaappleavenode for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppLeave' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';


if old.Token = 0 and new.Token=1 then

select concat('请假审批:',u.RealName) into @snapContent from OaAppLeave t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.LeaveId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,2,New.LeaveId,@snapContent,now());


set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaappout 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaappout after update
on oaappout for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaappoutnode n where n.outId=New.Id;
update oaappoutnode t set t.Token=1 where t.outId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaappoutnode t set t.Token=0,t.Done=0 where t.outId=New.Id;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaappoutnode 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaappoutnode after update
on oaappoutnode for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppOut' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';


if old.Token = 0 and new.Token=1 then

select concat('外出审批:',u.RealName) into @snapContent from OaAppout t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.outId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,2,New.outId,@snapContent,now());


set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaapppurchase 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaapppurchase after update
on oaapppurchase for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaapppurchasenode n where n.purchaseId=New.Id;
update oaapppurchasenode t set t.Token=1 where t.purchaseId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaapppurchasenode t set t.Token=0,t.Done=0 where t.purchaseId=New.Id;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaapppurchasenode 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaapppurchasenode after update
on oaapppurchasenode for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppPurchase' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';


if old.Token = 0 and new.Token=1 then

select concat('采购审批:',u.RealName) into @snapContent from OaApppurchase t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.purchaseId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,2,New.purchaseId,@snapContent,now());


set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaapptravel 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaapptravel after update
on oaapptravel for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaapptravelnode n where n.TravelId=New.Id;
update oaapptravelnode t set t.Token=1 where t.TravelId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaapptravelnode t set t.Token=0,t.Done=0 where t.TravelId=New.Id;
end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oaapptravelnode 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oaapptravelnode after update
on oaapptravelnode for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppTravel' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';


if old.Token = 0 and new.Token=1 then

select concat('出差审批:',u.RealName) into @snapContent from OaAppTravel t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.TravelId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,2,New.TravelId,@snapContent,now());


set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_oanoticelink 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_oanoticelink after update
on oanoticelink for each row
begin
set @hadView = 0;

select count(*) into @hadView from oanoticelink where isView=1 and noticeId=New.NoticeId;

update oanotice t set t.HadView=@hadView where Id=New.NoticeId;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 导出  触发器 ebc_debug.tri_update_projectjoinrequest 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger tri_update_projectjoinrequest after update
on projectjoinrequest for each row
begin

if old.Result=0 and new.Result=1 then

set @LinkId = REPLACE(uuid(),'-',''); 

set @cnt =(select count(*)   from projectuserlink  where ProjectId=New.ProjectId and UserId=New.JoinUserId);
if @cnt=0 then 
insert into projectuserlink(Id,ProjectId,UserId) values(@LinkId,New.ProjectId,New.JoinUserId);
end if;

end if;
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
