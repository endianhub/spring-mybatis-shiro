-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.17 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 spring_shiro 的数据库结构
CREATE DATABASE IF NOT EXISTS `spring_shiro` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `spring_shiro`;


-- 导出  表 spring_shiro.organization 结构
CREATE TABLE IF NOT EXISTS `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '组织名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- 正在导出表  spring_shiro.organization 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` (`id`, `name`, `address`, `code`, `icon`, `pid`, `seq`, `create_time`) VALUES
	(1, '总经办', '王家桥', '01', 'fi-social-windows', NULL, 0, '2014-02-19 01:00:00'),
	(3, '技术部', '', '02', 'fi-social-github', NULL, 1, '2015-10-01 13:10:42'),
	(5, '产品部', '', '03', 'fi-social-apple', NULL, 2, '2015-12-06 12:15:30'),
	(6, '测试组', '', '04', 'fi-social-snapchat', 3, 0, '2015-12-06 13:12:18');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;


-- 导出  表 spring_shiro.resource 结构
CREATE TABLE IF NOT EXISTS `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '资源名称',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `open_mode` varchar(32) DEFAULT NULL COMMENT '打开方式 ajax,iframe',
  `description` varchar(255) DEFAULT NULL COMMENT '资源介绍',
  `icon` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `opened` tinyint(2) NOT NULL DEFAULT '1',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '资源类别',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COMMENT='资源';

-- 正在导出表  spring_shiro.resource 的数据：~30 rows (大约)
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` (`id`, `name`, `url`, `open_mode`, `description`, `icon`, `pid`, `seq`, `status`, `opened`, `resource_type`, `create_time`) VALUES
	(1, '权限管理', '', NULL, '系统管理', 'fi-folder', NULL, 0, 0, 1, 0, '2014-02-19 01:00:00'),
	(11, '资源管理', '/resource/manager', 'ajax', '资源管理', 'fi-database', 1, 1, 0, 1, 0, '2014-02-19 01:00:00'),
	(12, '角色管理', '/role/manager', 'ajax', '角色管理', 'fi-torso-business', 1, 2, 0, 1, 0, '2014-02-19 01:00:00'),
	(13, '用户管理', '/user/manager', 'ajax', '用户管理', 'fi-torsos-all', 1, 3, 0, 1, 0, '2014-02-19 01:00:00'),
	(14, '部门管理', '/organization/manager', 'ajax', '部门管理', 'fi-results-demographics', 1, 4, 0, 1, 0, '2014-02-19 01:00:00'),
	(111, '列表', '/resource/treeGrid', 'ajax', '资源列表', 'fi-list', 11, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(112, '添加', '/resource/add', 'ajax', '资源添加', 'fi-page-add', 11, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(113, '编辑', '/resource/edit', 'ajax', '资源编辑', 'fi-page-edit', 11, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(114, '删除', '/resource/delete', 'ajax', '资源删除', 'fi-page-delete', 11, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(121, '列表', '/role/dataGrid', 'ajax', '角色列表', 'fi-list', 12, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(122, '添加', '/role/add', 'ajax', '角色添加', 'fi-page-add', 12, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(123, '编辑', '/role/edit', 'ajax', '角色编辑', 'fi-page-edit', 12, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(124, '删除', '/role/delete', 'ajax', '角色删除', 'fi-page-delete', 12, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(125, '授权', '/role/grant', 'ajax', '角色授权', 'fi-check', 12, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(131, '列表', '/user/dataGrid', 'ajax', '用户列表', 'fi-list', 13, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(132, '添加', '/user/add', 'ajax', '用户添加', 'fi-page-add', 13, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(133, '编辑', '/user/edit', 'ajax', '用户编辑', 'fi-page-edit', 13, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(134, '删除', '/user/delete', 'ajax', '用户删除', 'fi-page-delete', 13, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(141, '列表', '/organization/treeGrid', 'ajax', '用户列表', 'fi-list', 14, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(142, '添加', '/organization/add', 'ajax', '部门添加', 'fi-page-add', 14, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(143, '编辑', '/organization/edit', 'ajax', '部门编辑', 'fi-page-edit', 14, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(144, '删除', '/organization/delete', 'ajax', '部门删除', 'fi-page-delete', 14, 0, 0, 1, 1, '2014-02-19 01:00:00'),
	(221, '日志监控', '', NULL, NULL, 'fi-folder', NULL, 2, 0, 1, 0, '2015-12-01 11:44:20'),
	(222, '视频教程', '', NULL, NULL, 'fi-folder', NULL, 1, 0, 1, 0, '2015-12-06 12:40:42'),
	(223, '官方网站', 'http://www.dreamlu.net/', 'iframe', NULL, 'fi-home', 222, 0, 0, 1, 0, '2015-12-06 12:42:42'),
	(224, 'jfinal视频', 'http://blog.dreamlu.net/blog/79', 'iframe', NULL, 'fi-video', 222, 1, 0, 1, 0, '2015-12-06 12:45:28'),
	(226, '修改密码', '/user/editPwdPage', 'ajax', NULL, 'fi-unlock', NULL, 3, 0, 1, 1, '2015-12-07 20:23:06'),
	(227, '登录日志', '/sysLog/manager', 'ajax', NULL, 'fi-info', 221, 0, 0, 1, 0, '2016-09-30 22:10:53'),
	(228, 'Druid监控', '/druid', 'iframe', NULL, 'fi-monitor', 221, 0, 0, 1, 0, '2016-09-30 22:12:50'),
	(229, '系统图标', '/icons.html', 'ajax', NULL, 'fi-photo', 221, 0, 0, 1, 0, '2016-12-24 15:53:47');
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;


-- 导出  表 spring_shiro.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色';

-- 正在导出表  spring_shiro.role 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `seq`, `description`, `status`) VALUES
	(1, 'admin', 0, '超级管理员', 0),
	(2, 'de', 0, '技术部经理', 0),
	(7, 'pm', 0, '产品部经理', 0),
	(8, 'test', 0, '测试账户', 0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- 导出  表 spring_shiro.role_resource 结构
CREATE TABLE IF NOT EXISTS `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `resource_id` bigint(19) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- 正在导出表  spring_shiro.role_resource 的数据：~81 rows (大约)
/*!40000 ALTER TABLE `role_resource` DISABLE KEYS */;
INSERT INTO `role_resource` (`id`, `role_id`, `resource_id`) VALUES
	(158, 3, 1),
	(159, 3, 11),
	(160, 3, 111),
	(161, 3, 112),
	(162, 3, 113),
	(163, 3, 114),
	(164, 3, 12),
	(165, 3, 121),
	(166, 3, 122),
	(167, 3, 123),
	(168, 3, 124),
	(169, 3, 125),
	(170, 3, 13),
	(171, 3, 131),
	(172, 3, 132),
	(173, 3, 133),
	(174, 3, 134),
	(175, 3, 14),
	(176, 3, 141),
	(177, 3, 142),
	(178, 3, 143),
	(179, 3, 144),
	(359, 7, 1),
	(360, 7, 14),
	(361, 7, 141),
	(362, 7, 142),
	(363, 7, 143),
	(364, 7, 222),
	(365, 7, 223),
	(366, 7, 224),
	(367, 7, 221),
	(368, 7, 226),
	(409, 1, 1),
	(410, 1, 11),
	(411, 1, 111),
	(412, 1, 112),
	(413, 1, 113),
	(414, 1, 114),
	(415, 1, 12),
	(416, 1, 121),
	(417, 1, 122),
	(418, 1, 123),
	(419, 1, 124),
	(420, 1, 125),
	(421, 1, 13),
	(422, 1, 131),
	(423, 1, 132),
	(424, 1, 133),
	(425, 1, 134),
	(426, 1, 14),
	(427, 1, 141),
	(428, 1, 142),
	(429, 1, 143),
	(430, 1, 144),
	(431, 1, 222),
	(432, 1, 223),
	(433, 1, 224),
	(434, 1, 221),
	(435, 1, 227),
	(436, 1, 228),
	(437, 2, 1),
	(438, 2, 13),
	(439, 2, 131),
	(440, 2, 132),
	(441, 2, 133),
	(442, 2, 222),
	(443, 2, 223),
	(444, 2, 224),
	(445, 2, 221),
	(446, 2, 227),
	(447, 2, 228),
	(479, 8, 1),
	(480, 8, 14),
	(481, 8, 141),
	(482, 8, 222),
	(483, 8, 223),
	(484, 8, 224),
	(485, 8, 221),
	(486, 8, 227),
	(487, 8, 228),
	(488, 8, 229);
/*!40000 ALTER TABLE `role_resource` ENABLE KEYS */;


-- 导出  表 spring_shiro.sys_log 结构
CREATE TABLE IF NOT EXISTS `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `opt_content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- 正在导出表  spring_shiro.sys_log 的数据：~29 rows (大约)
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` (`id`, `login_name`, `role_name`, `opt_content`, `client_ip`, `create_time`) VALUES
	(391, 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', NULL, '2017-02-05 09:10:47'),
	(392, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=13&_=1486257091714&', '127.0.0.1', '2017-02-05 09:11:43'),
	(393, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', NULL, '2017-02-05 09:15:34'),
	(394, 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', NULL, '2017-02-11 16:04:25'),
	(395, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', NULL, '2017-02-11 16:05:31'),
	(396, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=112&_=1486800289129&', '127.0.0.1', '2017-02-11 16:05:38'),
	(397, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1486800289131&', '127.0.0.1', '2017-02-11 16:06:09'),
	(398, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=1&_=1486800289133&', '127.0.0.1', '2017-02-11 16:06:52'),
	(399, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1486800289134&', '127.0.0.1', '2017-02-11 16:07:15'),
	(400, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=2&_=1486800289135&', '127.0.0.1', '2017-02-11 16:07:17'),
	(401, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=7&_=1486800289136&', '127.0.0.1', '2017-02-11 16:07:20'),
	(402, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=2&_=1486800289137&', '127.0.0.1', '2017-02-11 16:07:35'),
	(403, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', NULL, '2017-02-11 16:07:48'),
	(404, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', NULL, '2017-02-13 09:11:39'),
	(405, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:loginPost,[参数]:_csrf=5c52118d-21c5-43f5-aadf-c99625e468fc&username=admin&password=1234&captcha=pwdy&rememberMe=1&', '127.0.0.1', '2017-02-13 09:13:01'),
	(406, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:loginPost,[参数]:_csrf=5c52118d-21c5-43f5-aadf-c99625e468fc&username=admin&password=1234&captcha=pwdy&rememberMe=1&', '127.0.0.1', '2017-02-13 09:15:23'),
	(407, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:loginPost,[参数]:_csrf=5c52118d-21c5-43f5-aadf-c99625e468fc&username=admin&password=1234&captcha=a5a5&rememberMe=1&', '127.0.0.1', '2017-02-13 09:15:31'),
	(408, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:loginPost,[参数]:_csrf=5c52118d-21c5-43f5-aadf-c99625e468fc&username=admin&password=1234&captcha=qc9n&rememberMe=1&', '127.0.0.1', '2017-02-13 09:15:59'),
	(409, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', NULL, '2017-02-16 15:09:57'),
	(410, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', NULL, '2017-02-16 15:10:27'),
	(411, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=8&_=1487227698283&', '127.0.0.1', '2017-02-16 15:10:37'),
	(412, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=8&_=1487227698284&', '127.0.0.1', '2017-02-16 15:11:00'),
	(413, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=8&resourceIds=1,14,141,222,223,224,221,227,228,229&', '127.0.0.1', '2017-02-16 15:11:35'),
	(414, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=15&_=1487227698285&', '127.0.0.1', '2017-02-16 15:11:51'),
	(415, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', NULL, '2017-02-16 15:12:04'),
	(416, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', NULL, '2017-02-21 08:52:29'),
	(417, 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', NULL, '2017-02-21 09:04:56'),
	(418, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', NULL, '2017-02-21 09:13:20'),
	(419, 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', NULL, '2017-02-21 09:28:00');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;


-- 导出  表 spring_shiro.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(64) NOT NULL COMMENT '登陆名',
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户';

-- 正在导出表  spring_shiro.user 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `login_name`, `name`, `password`, `sex`, `age`, `phone`, `user_type`, `status`, `organization_id`, `create_time`) VALUES
	(1, 'admin', 'admin', '098f6bcd4621d373cade4e832627b4f6', 0, 25, '18707173376', 0, 0, 1, '2015-12-06 13:14:05'),
	(13, 'snoopy', 'snoopy', '098f6bcd4621d373cade4e832627b4f6', 0, 25, '18707173376', 1, 0, 3, '2015-10-01 13:12:07'),
	(14, 'dreamlu', 'dreamlu', '098f6bcd4621d373cade4e832627b4f6', 0, 25, '18707173376', 1, 0, 5, '2015-10-11 23:12:58'),
	(15, 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', 0, 25, '18707173376', 1, 0, 6, '2015-12-06 13:13:03');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 导出  表 spring_shiro.user_role 结构
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- 正在导出表  spring_shiro.user_role 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
	(53, 15, 8),
	(60, 1, 1),
	(61, 1, 2),
	(62, 1, 7),
	(63, 13, 2),
	(64, 14, 7),
	(65, 1, 8);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
