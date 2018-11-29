/*
 Navicat Premium Data Transfer


 Source Schema         : redsoft

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 28/11/2018 23:34:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 客户主体
-- ----------------------------
DROP TABLE IF EXISTS `客户主体`;
CREATE TABLE `客户主体`  (
  `客户ID` char(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `姓名` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `电话` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `公司名称` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `公司地址` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `邮箱` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `服务器系统` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CPU` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `内存` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `数据库` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `内网IP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `用户名` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `用户密码` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `注册方式` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `软件版本` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SN号` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DCKEY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `云之家账号` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `云之家密码` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`客户ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 工单处理
-- ----------------------------
DROP TABLE IF EXISTS `工单处理`;
CREATE TABLE `工单处理`  (
  `工单编码` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `QQ群` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QQ备注` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `问题标题` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `问题描述` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QQ号码` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `QQ昵称` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `创建人` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `创建时间` datetime(0) NOT NULL,
  `图片` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `备注` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `状态` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `进度` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `处理人` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `开始处理时间` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `完工人` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `结束处理时间` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `结果满意程度` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`工单编码`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 工单处理
-- ----------------------------
INSERT INTO `工单处理` VALUES ('10001', '金瑞得软件一号群', '安平驾校', '看一下我这边的服务器的备份程序是否运行，昨天的没有备份了', '', '547114504', '心···微笑', '李工', '2018-11-21 09:18:26', NULL, NULL, '有效', '结束', NULL, '2018-11-21 09:32:24', NULL, '2018-11-21 09:32:24', NULL);
INSERT INTO `工单处理` VALUES ('10002', '金瑞得软件一号群', '祁门润良李会计', '金蝶KIS凭证模板使用', '需要再录入凭证的时候直接从模板录入，软件KIS专业版', '1278209124', '兰色紫晶', '李工', '2018-11-19 03:14:45', NULL, NULL, '有效', '结束', NULL, '2018-11-20 11:00:43', NULL, '2018-11-20 11:00:43', NULL);
INSERT INTO `工单处理` VALUES ('10003', '金瑞得软件二号群', '秀江旅游章', '修改凭证套打模板', '需要用A4横向单页打印一个凭证', '65105150', '我是射手座', '李工', '2018-11-19 03:17:22', NULL, NULL, '有效', '结束', NULL, '2018-11-19 15:58:06', NULL, '2018-11-19 15:58:06', NULL);
INSERT INTO `工单处理` VALUES ('10004', '金瑞得软件一号群', '徽三农产品加工-吴会计', '远程通软件打印机连接不上', '用远程连接屯溪服务器，但是打印机连接不上了', '723105467', '薇薇', '李工', '2018-11-19 03:19:33', NULL, NULL, '有效', '结束', NULL, '2018-11-20 11:02:51', NULL, '2018-11-20 11:02:51', NULL);
INSERT INTO `工单处理` VALUES ('10005', '金瑞得软件一号群', '智成化工-张', '会计分录序时簿不显示', '看一下凭证管理，查9月之前会计分录序时簿不显示', '286322703', '智成实业章斌', '李工', '2018-11-19 03:21:07', NULL, NULL, '有效', '结束', NULL, '2018-11-19 17:10:37', NULL, '2018-11-19 17:10:37', NULL);
INSERT INTO `工单处理` VALUES ('10006', '金瑞得软件一号群', '征收管理局-陈', '批量审核凭证', '如何批量审核凭证', '2869359675', '絮飞花落', '李工', '2018-11-19 03:27:51', NULL, NULL, '有效', '结束', NULL, '2018-11-19 15:28:17', NULL, '2018-11-19 15:28:17', NULL);
INSERT INTO `工单处理` VALUES ('10007', '金瑞得软件一号群', '', '安装软件', '系统重装了，需要安装软件', '271578634', '迷迷糊糊也是一种享受', '李工', '2018-11-19 03:59:44', NULL, NULL, '有效', '结束', NULL, '2018-11-20 15:10:16', NULL, '2018-11-20 15:10:16', NULL);
INSERT INTO `工单处理` VALUES ('10008', '金瑞得软件一号群', '大峰房产.陈', '税务局采集财务数据', '用税务局提供的软件采集客户的帐套数据', '348791907', '易水寒', '李工', '2018-11-19 04:17:56', NULL, NULL, '有效', '结束', NULL, '2018-11-19 16:18:11', NULL, '2018-11-19 16:18:11', NULL);
INSERT INTO `工单处理` VALUES ('10009', '金瑞得软件一号群', '', '不按批次核算出库成本', '', '1579909248', '美丽人生', '李工', '2018-11-19 05:09:10', NULL, NULL, '有效', '结束', NULL, '2018-11-20 11:03:19', NULL, '2018-11-20 11:03:19', NULL);
INSERT INTO `工单处理` VALUES ('10010', '金瑞得软件一号群', '徽珍食品.杨', '新建帐套', '找徐工帮忙新建帐套', '945166850', '明月', '李工', '2018-11-19 05:12:06', NULL, NULL, '有效', '结束', NULL, '2018-11-20 15:12:28', NULL, '2018-11-20 15:12:28', NULL);
INSERT INTO `工单处理` VALUES ('10011', '黟县有农金蝶交流群', '总助李燕萍', '生产任务单调整后不能入库', '原来的生产任务单已经结案，但是生产及开票人员发现原料未加工完，而且开票下单时数量也不对，所以我就进行了反结案，然后用管理员身份进行了投料、领料等变更，但是现在多余的产品不能再做入库。下推生成产品入库提示无', '284682816', '梦想不远', '李工', '2018-11-19 05:15:01', NULL, NULL, '有效', '结束', NULL, '2018-11-20 10:31:39', NULL, '2018-11-20 10:31:39', NULL);
INSERT INTO `工单处理` VALUES ('10012', '金瑞得软件一号群', '徽润商贸.章', '发票冲预付款', '有一笔款以前的会计在付款单据里面做的，但单据类型选的是预付款，现在发票到了，这个版本没有发票管理模块，我该如何下这个公司的账，事实上付给钱，发票来是；平的，要重新做个录入凭证吧，这与你以前说的，直接录入单据，默认发票到，有冲突吗', '1921038193', '徽润XS2', '李工', '2018-11-19 05:17:15', NULL, NULL, '有效', '结束', NULL, '2018-11-21 09:16:56', NULL, '2018-11-21 09:16:56', NULL);
INSERT INTO `工单处理` VALUES ('10013', '金瑞得软件二号群', '黄山顶旺', '查询表单规格不显示了', '', '1300174391', '蓝色的梦', '李工', '2018-11-19 05:20:33', '/tupian/gongdantupian/74R{P_RPL@GL@T468@_PM.png', NULL, '有效', '结束', NULL, '2018-11-20 15:12:14', NULL, '2018-11-20 15:12:14', NULL);
INSERT INTO `工单处理` VALUES ('10014', '金瑞得软件一号群', '', '无法登录', '', '1579909248', '美丽人生', '', '2018-11-20 02:15:05', NULL, NULL, '有效', '结束', NULL, '2018-11-20 14:20:21', NULL, '2018-11-20 14:20:21', NULL);
INSERT INTO `工单处理` VALUES ('10015', '金瑞得软件一号群', '旺荣汽车电子', '客户端无法登录', '应该是服务器的网络换了', '1045933783', '蔠，就行彡', '李工', '2018-11-20 03:04:46', NULL, NULL, '有效', '结束', NULL, '2018-11-20 15:04:49', NULL, '2018-11-20 15:04:49', NULL);
INSERT INTO `工单处理` VALUES ('10016', '金瑞得软件一号群', '祁门红茶发展有限公司黄山销售分公司', '金蝶登上了，但是很慢，东西打不开，不知道怎么回事', '', '736856370', '夜空', '李工', '2018-11-21 09:19:21', NULL, NULL, '有效', '结束', NULL, '2018-11-21 09:33:24', NULL, '2018-11-21 09:33:24', NULL);
INSERT INTO `工单处理` VALUES ('10017', '金瑞得软件一号群', '江艺源（昱祥）', '商贸版销售单不能选择结算账户', '', '1010796495', '黑土', '李工', '2018-11-21 09:40:41', NULL, NULL, '有效', '结束', NULL, '2018-11-21 09:41:12', NULL, '2018-11-21 09:41:12', NULL);
INSERT INTO `工单处理` VALUES ('10018', '金瑞得软件二号群', '黄山龙裔.范', '录入凭证时候提示 “请输入计量单位！”', '魏工说有可能是数据库问题，因为这个价是T3升级过来的', '605383707', '范某某、', '李工', '2018-11-21 11:25:59', NULL, NULL, '有效', '结束', NULL, '2018-11-22 08:55:29', NULL, '2018-11-22 08:55:29', NULL);
INSERT INTO `工单处理` VALUES ('10019', '金瑞得软件一号群', '征收管理局-陈', '凭证再设置一下，A4正好打印两张凭证', '', '2869359675', '絮飞花落', '李工', '2018-11-21 01:31:18', NULL, NULL, '有效', '结束', NULL, '2018-11-21 14:37:21', NULL, '2018-11-21 14:37:21', NULL);
INSERT INTO `工单处理` VALUES ('10020', '金瑞得软件二号群', '金联置业.张', '回到家以后登录不了金蝶软件', '不再同一个网络，肯定登录不了了', '467248042', '紫云', '李工', '2018-11-21 02:36:11', NULL, NULL, '有效', '结束', NULL, '2018-11-21 14:36:14', NULL, '2018-11-21 14:36:14', NULL);
INSERT INTO `工单处理` VALUES ('10021', '金瑞得软件一号群', '征收管理局-陈', '月度结转凭证明细问题', '', '2869359675', '絮飞花落', '李工', '2018-11-21 02:38:28', NULL, NULL, '有效', '结束', NULL, '2018-11-22 08:55:26', NULL, '2018-11-22 08:55:26', NULL);
INSERT INTO `工单处理` VALUES ('10022', '联网记账群', '璜尖小学陈蔚', '安装金蝶K3行政事业版', '应该是服务器问题，VPN链接不到服务器', '258774743', 'ωò習貫の', '李工', '2018-11-21 03:47:41', NULL, NULL, '有效', '结束', NULL, '2018-11-22 08:55:22', NULL, '2018-11-22 08:55:22', NULL);
INSERT INTO `工单处理` VALUES ('10023', '金瑞得软件一号群', '三尖露茶业-江知音', '查看员工工资', '', '455214117', '猪才怪', '李工', '2018-11-21 04:15:28', NULL, NULL, '有效', '结束', NULL, '2018-11-22 08:55:19', NULL, '2018-11-22 08:55:19', NULL);
INSERT INTO `工单处理` VALUES ('10024', '金瑞得软件一号群', '美嘉豪酒店', '提示当前账期不能生成凭证', '', '676433414', '暖暖', '李工', '2018-11-21 04:43:12', NULL, NULL, '有效', '结束', NULL, '2018-11-22 08:55:16', NULL, '2018-11-22 08:55:16', NULL);
INSERT INTO `工单处理` VALUES ('10025', '联网记账群', '岭南小学程爱强', '学校安装金蝶K3', '金蝶服务器IP：192.168.100.210\r\nVPN服务器:60.172.69.188\r\n账号密码：\r\nclient1 \r\nclient1123\r\n', '676258476', '岭南小学程爱强', '李工', '2018-11-22 08:52:47', NULL, NULL, '有效', '结束', NULL, '2018-11-22 08:53:03', NULL, '2018-11-22 08:53:03', NULL);
INSERT INTO `工单处理` VALUES ('10026', '金瑞得软件一号群', '金联置业.张', '服务器数据库启动不起来', '等徐工或者魏工回来解决', '467248042', '紫云', '李工', '2018-11-22 11:00:54', NULL, NULL, '有效', '结束', NULL, '2018-11-23 16:58:12', NULL, '2018-11-23 16:58:12', NULL);
INSERT INTO `工单处理` VALUES ('10027', '金瑞得软件二号群', '征收管理局-陈', '反结账问题', '已经安装插件反结账了', '2869359675', '絮飞花落', '李工', '2018-11-22 11:02:33', NULL, NULL, '有效', '结束', NULL, '2018-11-24 08:52:31', NULL, '2018-11-24 08:52:31', NULL);
INSERT INTO `工单处理` VALUES ('10028', '金瑞得软件一号群', '', '5月份凭证汇总不显示', '初步看了下，找不出原因，其他期间可以显示，5月份不行', '895091356', '绿野仙踪', '李工', '2018-11-22 11:18:16', NULL, NULL, '有效', '结束', NULL, '2018-11-22 16:39:39', NULL, '2018-11-22 16:39:39', NULL);
INSERT INTO `工单处理` VALUES ('10029', '金瑞得软件一号群', '合肥超港', '用友T3提示帐套超过3期了', '', '350003867', '雷雨', '李工', '2018-11-22 11:23:42', NULL, NULL, '有效', '结束', NULL, '2018-11-23 08:13:06', NULL, '2018-11-23 08:13:06', NULL);
INSERT INTO `工单处理` VALUES ('10030', '金瑞得软件一号群', '', '客户需要新建帐套', '', '68172817', '石头', '李工', '2018-11-22 11:28:34', NULL, NULL, '有效', '结束', NULL, '2018-11-23 17:06:27', NULL, '2018-11-23 17:06:27', NULL);
INSERT INTO `工单处理` VALUES ('10031', '', '六股尖', '需要帮忙设置套打，', '直接打电话过来，加的好友。稍后与他联系，说人在外面不方便远程。我让他回到电脑旁边时候再远程。没有回应', '441612099', '随@心#梦%', '李工', '2018-11-22 02:00:14', NULL, NULL, '有效', '结束', NULL, '2018-11-23 16:56:41', NULL, '2018-11-23 16:56:41', NULL);
INSERT INTO `工单处理` VALUES ('10032', '金瑞得软件一号群', '', '销售毛利利润汇总表不显示销售金额', '看了下没弄明白，有可能是权限问题，明天让徐工或者魏工看下', '3486126927', '万邦电子 徐', '李工', '2018-11-22 04:29:28', NULL, NULL, '有效', '结束', NULL, '2018-11-23 16:59:39', NULL, '2018-11-23 16:59:39', NULL);
INSERT INTO `工单处理` VALUES ('10033', '', '信访局', '宣誓帐套已经过期了', '加密狗没有检测到，刷新一下加密服务器就好了', '1375878446', '木呆子', '李工', '2018-11-22 04:31:35', NULL, NULL, '有效', '结束', NULL, '2018-11-22 16:32:17', NULL, '2018-11-22 16:32:17', NULL);
INSERT INTO `工单处理` VALUES ('10034', '', '华夏商贸.周', '安装金蝶迷你版9.0', '卸载了，从新安装了一下', '994657139', '榕树下', '李工', '2018-11-22 04:33:13', NULL, NULL, '有效', '结束', NULL, '2018-11-22 17:02:01', NULL, '2018-11-22 17:02:01', NULL);
INSERT INTO `工单处理` VALUES ('10035', '', '', '科目无法删除', '用主账号登陆进去也无法删除，科目2001.01.查询了，这个科目下面没有凭证', '727532447', '雾', '李工', '2018-11-22 04:34:53', NULL, NULL, '有效', '结束', NULL, '2018-11-24 08:52:28', NULL, '2018-11-24 08:52:28', NULL);
INSERT INTO `工单处理` VALUES ('10036', '金瑞得软件一号群', '徽三说阳湖一店', '远程通，打印机无法连接打印', '最后导出到EXCEL，然后到处到本机', '385366160', '宁静致远', '李工', '2018-11-22 04:42:46', NULL, NULL, '有效', '结束', NULL, '2018-11-22 16:43:15', NULL, '2018-11-22 16:43:15', NULL);
INSERT INTO `工单处理` VALUES ('10037', '', '徽珍食品.杨', '需要修改帐套名称', '', '945166850', '明月', '李工', '2018-11-22 04:54:30', NULL, NULL, '有效', '结束', NULL, '2018-11-24 08:52:17', NULL, '2018-11-24 08:52:17', NULL);
INSERT INTO `工单处理` VALUES ('10038', '金瑞得软件一号群', '信访局', '11年帐套不能查看', '', '1375878446', '木呆子', '李工', '2018-11-23 05:00:42', NULL, NULL, '有效', '结束', NULL, '2018-11-23 17:01:26', NULL, '2018-11-23 17:01:26', NULL);
INSERT INTO `工单处理` VALUES ('10039', '', '街口叶', '安装K3行政事业版软件', '', '834133240', '叶子', '李工', '2018-11-23 05:02:35', NULL, NULL, '有效', '结束', NULL, '2018-11-23 17:02:52', NULL, '2018-11-23 17:02:52', NULL);
INSERT INTO `工单处理` VALUES ('10040', '', '美佳新材料.周', '群里找魏工', '我接进来，没回我', '499915461', '吉光凤羽', '李工', '2018-11-23 05:05:59', NULL, NULL, '有效', '结束', NULL, '2018-11-23 17:06:02', NULL, '2018-11-23 17:06:02', NULL);
INSERT INTO `工单处理` VALUES ('10041', '', '', '不知道账号密码，登陆不了帐套', '', '1442216476', 'Love☆小毅', '李工', '2018-11-24 08:53:27', NULL, NULL, '有效', '结束', NULL, '2018-11-24 08:53:56', NULL, '2018-11-24 08:53:56', NULL);
INSERT INTO `工单处理` VALUES ('10042', '', '秀阳小学许莉', '休宁学校安装金蝶K3软件', '', '524734095', '夏天', '李工', '2018-11-28 09:26:10', NULL, NULL, '有效', '结束', NULL, '2018-11-28 09:26:19', NULL, '2018-11-28 09:26:19', NULL);
INSERT INTO `工单处理` VALUES ('10043', '', '景颐养生-程', '科目余额表不对，提示科目错误', '', '1005832965', 'cheng程', '李工', '2018-11-26 08:29:39', NULL, NULL, '有效', '结束', NULL, '2018-11-26 14:22:35', NULL, '2018-11-26 14:22:35', NULL);
INSERT INTO `工单处理` VALUES ('10044', '金瑞得软件二号群', '征收管理局-陈', '结转损益的时候，需要分类结转', '', '2869359675', '絮飞花落', '李工', '2018-11-26 08:36:00', NULL, NULL, '有效', '结束', NULL, '2018-11-28 09:42:41', NULL, '2018-11-28 09:42:41', NULL);
INSERT INTO `工单处理` VALUES ('10045', '金瑞得软件一号群', '徽三说阳湖一店', '除了MFC打印机其他都删除', '出现乱码', '385366160', '宁静致远', '李工', '2018-11-26 09:45:47', NULL, NULL, '有效', '结束', NULL, '2018-11-28 15:33:38', NULL, '2018-11-28 15:33:38', NULL);
INSERT INTO `工单处理` VALUES ('10046', '', '阳光实业-许会计', '应收账款某一条记录，显示错位了', '应该是起初录入错误了', '773801217', '悠然', '李工', '2018-11-26 11:24:02', NULL, NULL, '有效', '结束', NULL, '2018-11-26 11:34:26', NULL, '2018-11-26 11:34:26', NULL);
INSERT INTO `工单处理` VALUES ('10047', '', '美佳新材料.周', '12月没有本年累计数，报表与明细对不起来', '', '499915461', '吉光凤羽', '李工', '2018-11-26 11:32:06', NULL, NULL, '有效', '结束', NULL, '2018-11-26 11:32:35', NULL, '2018-11-26 11:32:35', NULL);
INSERT INTO `工单处理` VALUES ('10048', '', '', '没有说明具体问题', '', '514482857', '幽兰', '李工', '2018-11-26 11:35:42', NULL, NULL, '有效', '结束', NULL, '2018-11-28 15:33:32', NULL, '2018-11-28 15:33:32', NULL);
INSERT INTO `工单处理` VALUES ('10049', '', '大峰房产.陈', '报表不平', '', '348791907', '易水寒', '李工', '2018-11-26 01:40:08', NULL, NULL, '有效', '结束', NULL, '2018-11-28 10:19:22', NULL, '2018-11-28 10:19:22', NULL);
INSERT INTO `工单处理` VALUES ('10050', '联网记账群', '', 'VPN无法登陆', '', '2367438337', '随缘', '李工', '2018-11-26 01:41:27', NULL, NULL, '有效', '结束', NULL, '2018-11-26 13:41:43', NULL, '2018-11-26 13:41:43', NULL);
INSERT INTO `工单处理` VALUES ('10051', '', '向荣新材料', '提示：当前数据不存在', '徐老师说，室数据库问题，需要修改数据库', '864834925', '冬冬', '李工', '2018-11-26 01:43:01', NULL, NULL, '有效', '结束', NULL, '2018-11-26 13:43:17', NULL, '2018-11-26 13:43:17', NULL);
INSERT INTO `工单处理` VALUES ('10052', '', '安平驾校', '服务器数据库无法启动', '', '547114504', '心···微笑', '李工', '2018-11-26 01:44:31', NULL, NULL, '有效', '结束', NULL, '2018-11-26 13:44:55', NULL, '2018-11-26 13:44:55', NULL);
INSERT INTO `工单处理` VALUES ('10053', '', '景颐养生-程', '科目余额表不平，报表显示错误', '', '1005832965', 'cheng程', '李工', '2018-11-26 01:45:33', NULL, NULL, '有效', '结束', NULL, '2018-11-26 13:45:43', NULL, '2018-11-26 13:45:43', NULL);
INSERT INTO `工单处理` VALUES ('10054', '', '', '过滤不能查看选定日期', '客户选定了本期，只要把本期改成本年，或者自定义就好了', '1045933783', '蔠，就行彡', '李工', '2018-11-26 03:01:08', NULL, NULL, '有效', '结束', NULL, '2018-11-26 15:01:27', NULL, '2018-11-26 15:01:27', NULL);
INSERT INTO `工单处理` VALUES ('10055', '', '', '输入数据的时候，突然卡住了', '远程接通以后，没有问题了，与客户约好，下次出现问题的时候再联系我', '1424762469', '众力财务', '李工', '2018-11-26 03:08:10', NULL, NULL, '有效', '结束', NULL, '2018-11-28 10:19:25', NULL, '2018-11-28 10:19:25', NULL);
INSERT INTO `工单处理` VALUES ('10056', '', '', '系统登录问题', '问题还没处理，顾客需要下班了，明天再联系处理', '190637717', 'drizzly', '李工', '2018-11-26 05:43:38', NULL, NULL, '有效', '结束', NULL, '2018-11-28 11:11:51', NULL, '2018-11-28 11:11:51', NULL);
INSERT INTO `工单处理` VALUES ('10057', '', '', '打印调试问题', '已经解决了', '37010353', '明月清风', '李工', '2018-11-26 05:44:25', NULL, NULL, '有效', '结束', NULL, '2018-11-26 17:44:27', NULL, '2018-11-26 17:44:27', NULL);
INSERT INTO `工单处理` VALUES ('10058', '', '星火国旅-胡宝翠', '所有客户端都不能登录了', '应该是服务器IP问题，服务器远程不过去，也没有显示器，明天再解决了', '1402580481', '鱼的记忆没有水', '李工', '2018-11-26 05:46:13', NULL, NULL, '有效', '结束', NULL, '2018-11-28 10:20:21', NULL, '2018-11-28 10:20:21', NULL);
INSERT INTO `工单处理` VALUES ('10059', '', '祁门润良李会计', '启用帐套问题', '应该不难，只是下班时间道理，客户下班了，没时间处理了', '1278209124', '兰色紫晶', '李工', '2018-11-26 05:47:01', NULL, NULL, '有效', '结束', NULL, '2018-11-28 10:06:36', NULL, '2018-11-28 10:06:36', NULL);
INSERT INTO `工单处理` VALUES ('10060', '', '', '客户需要新建帐套', '提到要收费的时候，就没有要新建帐套的意思了，报价580', '605983714', '点点纯尘', '李工', '2018-11-26 05:47:46', NULL, NULL, '有效', '结束', NULL, '2018-11-28 11:08:58', NULL, '2018-11-28 11:08:58', NULL);
INSERT INTO `工单处理` VALUES ('10061', '', '美佳新材料.周', '利润表余额不对', '应该是某些凭证借贷弄反了，没查出来', '499915461', '吉光凤羽', '李工', '2018-11-26 05:48:44', NULL, NULL, '有效', '结束', NULL, '2018-11-28 15:33:25', NULL, '2018-11-28 15:33:25', NULL);
INSERT INTO `工单处理` VALUES ('10062', '金瑞得软件一号群', '合肥超港', '远程通无法登录服务器T3软件', '', '350003867', '雷雨', '李工', '2018-11-28 09:27:57', NULL, NULL, '有效', '结束', NULL, '2018-11-28 09:28:26', NULL, '2018-11-28 09:28:26', NULL);
INSERT INTO `工单处理` VALUES ('10063', '', '秀阳小学许莉', '软件安装好以后，不能输入汉字', '', '524734095', '夏天', '李工', '2018-11-28 10:23:22', NULL, NULL, '有效', '结束', NULL, '2018-11-28 11:08:11', NULL, '2018-11-28 11:08:11', NULL);
INSERT INTO `工单处理` VALUES ('10064', '联网记账群', '岭南小学程爱强', '不能输入汉字', '', '676258476', '岭南小学程爱强', '李工', '2018-11-28 10:55:40', NULL, NULL, '有效', '结束', NULL, '2018-11-28 11:12:04', NULL, '2018-11-28 11:12:04', NULL);
INSERT INTO `工单处理` VALUES ('10065', '', '万汇包装', '商贸版其他出库单打印设置问题', '不能使用EXCEL打印和设置，套打设置模版默认没有', '382844665', '紫云英', '李工', '2018-11-28 03:26:13', NULL, NULL, '有效', '结束', NULL, '2018-11-28 15:32:52', NULL, '2018-11-28 15:32:52', NULL);
INSERT INTO `工单处理` VALUES ('10066', '', '小雅', '安装KIS商贸专业版6.1', '电脑重装系统，从新安装', '461859834', '小雅', '李工', '2018-11-28 03:30:23', NULL, NULL, '有效', '结束', NULL, '2018-11-28 15:30:49', NULL, '2018-11-28 15:30:49', NULL);

-- ----------------------------
-- Table structure for 工单处理明细
-- ----------------------------
DROP TABLE IF EXISTS `工单处理明细`;
CREATE TABLE `工单处理明细`  (
  `工单编码` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `工单明细编码` char(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `处理人` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `处理内容` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `处理时间` datetime(0) NOT NULL,
  `图片` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `备注` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`工单明细编码`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 工单处理明细
-- ----------------------------
INSERT INTO `工单处理明细` VALUES ('10001', '10001101', '李工', '服务器看了下，没什么问题，只是有些奇怪，为什么最近每天都同一时间备份两次。让客户今天晚上看下，如果再不自动备份再解决', '2018-11-21 09:32:04', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10001', '10001102', '李工', '在远程的时候，魏工接待过去了', '2018-11-21 09:33:08', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10002', '10002101', '李工', '我也不知道', '2018-11-19 09:19:30', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10002', '10002102', '李工', '新建凭证以后，把这个凭证保存为模版，以后就可以调用这个模版了', '2018-11-20 11:00:39', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10004', '10004101', '李工', '魏工在解决了', '2018-11-20 11:02:49', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10007', '10007101', '李工', '魏工帮忙安装了', '2018-11-20 03:10:15', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10009', '10009101', '李工', '魏工解决了', '2018-11-20 11:03:15', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10010', '10010101', '李工', '主动联系，没有回复，默认解决了', '2018-11-20 03:12:21', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10011', '10011101', '李工', '需要徐工明天来对接', '2018-11-19 09:27:02', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10014', '10014101', '李工', '服务器安装文件夹下面一般都留有注册信息，包括登录密码', '2018-11-20 02:20:19', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10016', '10016101', '李工', '再远程的时候，魏工接待过去了', '2018-11-21 09:33:22', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10017', '10017101', '李工', '销售单上面直接收款的  就是  收现金的，不需要录结算账户', '2018-11-21 09:41:01', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10017', '10017102', '李工', '客户自行解决了', '2018-11-21 09:41:10', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10019', '10019101', '李工', '打开凭证，”页面“里面设置上边距，具体多少数值需要打印出来微调', '2018-11-21 01:39:09', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10021', '10021101', '李工', '打电话过来，没有搞明白意思', '2018-11-21 02:39:05', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10024', '10024101', '李工', '等待后再联系，没回应\r\n', '2018-11-21 04:43:32', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10025', '10025101', '李工', '已经安装好了', '2018-11-22 08:53:01', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10026', '10026101', '李工', '代理记账的，已经不在公司了，需要和QQ1320218743。联系', '2018-11-22 05:01:09', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10026', '10026102', '李工', '徐工解决了', '2018-11-23 04:57:42', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10027', '10027101', '李工', '需要结转损益，损益分类归总', '2018-11-22 01:58:22', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10028', '10028101', '李工', '权限问题，反结账，然后反过账，问题解决了', '2018-11-22 04:39:36', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10029', '10029101', '李工', '需要徐工或者魏工帮忙解决下', '2018-11-22 11:24:43', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10029', '10029102', '李工', '下午比较急，我打电话咨询徐工了，说是让工厂那边把服务器重启下', '2018-11-22 01:55:37', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10030', '10030101', '李工', '王总联系 ，下午补交600服务费以后，可以帮忙新建帐套', '2018-11-22 01:57:15', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10030', '10030102', '李工', '转账还没到，明天再帮他处理', '2018-11-22 04:30:15', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10031', '10031101', '李工', '已经设置好了', '2018-11-23 04:56:40', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10032', '10032101', '李工', '徐工解决了', '2018-11-23 04:59:38', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10034', '10034101', '李工', '明天让魏工看下', '2018-11-22 04:36:11', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10034', '10034102', '李工', '已经安装好了\r\n', '2018-11-22 05:01:59', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10036', '10036101', '李工', '基本解决，客户不是很满意，但是也能接受', '2018-11-22 04:43:13', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10037', '10037101', '李工', '需要服务器权限，没有服务器权限', '2018-11-22 04:54:48', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10037', '10037102', '李工', '客户不知道服务器权限，回头再改', '2018-11-22 04:55:06', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10038', '10038101', '李工', '魏工解决了，具体过程没看懂，后续研究下', '2018-11-23 05:01:24', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10039', '10039101', '李工', '徐工说，服务器都还没安装，所以不用安装', '2018-11-23 05:02:49', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10041', '10041101', '李工', '用manager账号进去，新建账号密码就解决了', '2018-11-24 08:53:54', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10042', '10042101', '李工', '已经安装好了', '2018-11-28 09:26:17', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10043', '10043101', '李工', '需要魏工来处理', '2018-11-26 08:29:54', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10044', '10044101', '李工', '上周的问题，一直没有解决', '2018-11-26 08:37:30', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10044', '10044102', '李工', '徐工帮忙解决了，文件里面有个汇总打印，可以把打印明细汇总统计打印', '2018-11-28 09:42:39', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10045', '10045101', '李工', '增加 备份帐套问题', '2018-11-26 05:44:45', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10045', '10045102', '李工', '增加对账问题', '2018-11-26 05:44:58', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10045', '10045103', '李工', '跟进后无回复，关闭工单', '2018-11-28 03:33:36', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10046', '10046101', '李工', '转交给徐老师解决了', '2018-11-26 11:24:11', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10047', '10047101', '李工', '一次性显示小于12个月就可以显示完整了', '2018-11-26 11:32:31', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10047', '10047102', '李工', '余额自己看错了，已经可以对上了', '2018-11-26 11:34:18', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10048', '10048101', '李工', '跟进后无回复，关闭工单', '2018-11-28 03:33:30', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10049', '10049101', '李工', '魏工解决了', '2018-11-28 10:19:20', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10050', '10050101', '李工', '服务器问题，已经解决了', '2018-11-26 01:41:38', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10052', '10052101', '李工', '已经转给徐老师解决了', '2018-11-26 01:44:42', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10052', '10052102', '李工', '重装数据库', '2018-11-26 01:44:53', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10053', '10053101', '李工', '已经找魏工解决了', '2018-11-26 01:45:41', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10055', '10055101', '李工', '询问是否解决了', '2018-11-28 10:19:04', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10056', '10056101', '李工', '群备注昵称：屯溪城投.蔡，魏工已经解决了', '2018-11-28 11:11:49', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10058', '10058101', '李工', '魏工已经解决了', '2018-11-28 10:20:19', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10059', '10059101', '李工', '魏工已经解决了', '2018-11-28 10:06:34', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10060', '10060101', '李工', '再次询问，不需要了', '2018-11-28 11:08:56', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10061', '10061101', '李工', '跟进问题是否解决', '2018-11-28 09:53:40', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10061', '10061102', '李工', '跟进后无回复，关闭工单', '2018-11-28 03:33:20', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10062', '10062101', '李工', '徐老师帮忙解决的，关掉软件等待1分钟以后再登录就好了', '2018-11-28 09:28:23', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10063', '10063101', '李工', '徐工解决了', '2018-11-28 10:55:50', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10064', '10064101', '李工', '徐工已经解决了', '2018-11-28 11:12:02', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10065', '10065101', '李工', '徐工指导：用销售订单的套打文件修改为其他出库单的套打模版，最后解决了', '2018-11-28 03:28:19', NULL, NULL);
INSERT INTO `工单处理明细` VALUES ('10066', '10066101', '李工', '已经安装好了', '2018-11-28 03:30:45', NULL, NULL);

-- ----------------------------
-- Table structure for 知识库
-- ----------------------------
DROP TABLE IF EXISTS `知识库`;
CREATE TABLE `知识库`  (
  `知识ID` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `标题` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `内容` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `关键字` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `图片` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `创建人` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `创建时间` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `软件` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `状态` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `备注` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`知识ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 知识库
-- ----------------------------
INSERT INTO `知识库` VALUES ('100001', '反过账', '&lt;p&gt;稍后整理&lt;/p&gt;', NULL, NULL, '李工', '2018-11-21 03:02:59', '', '有效', NULL);
INSERT INTO `知识库` VALUES ('100002', 'K3不能输入中文，中文输入乱码', '&lt;p&gt;稍后整理&lt;/p&gt;', NULL, NULL, '李工', '2018-11-28 10:34:06', '', '有效', NULL);
INSERT INTO `知识库` VALUES ('100003', '套打设置技巧', '&lt;p&gt;稍后整理&lt;/p&gt;', NULL, NULL, '李工', '2018-11-28 03:27:33', '', '有效', NULL);

-- ----------------------------
-- Table structure for 知识库明细
-- ----------------------------
DROP TABLE IF EXISTS `知识库明细`;
CREATE TABLE `知识库明细`  (
  `知识库ID` int(11) NOT NULL,
  `明细ID` int(11) NOT NULL AUTO_INCREMENT,
  `创建人` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `创建时间` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `明细内容` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `图片1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `图片2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `图片3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `图片4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `图片5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `备注` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `加分数` int(11) DEFAULT NULL,
  `减分数` int(11) DEFAULT NULL,
  PRIMARY KEY (`明细ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 职员信息
-- ----------------------------
DROP TABLE IF EXISTS `职员信息`;
CREATE TABLE `职员信息`  (
  `工号` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `姓名` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `昵称` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `登录密码` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `备注` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 职员信息
-- ----------------------------
INSERT INTO `职员信息` VALUES ('1', '徐国斌', '徐老师', '123', NULL);
INSERT INTO `职员信息` VALUES ('2', '王路红', '王总', '123', NULL);
INSERT INTO `职员信息` VALUES ('3', '徐攀飞', '徐经理', '123', NULL);
INSERT INTO `职员信息` VALUES ('4', '魏元琦', '魏工', '123', NULL);
INSERT INTO `职员信息` VALUES ('5', '程爱琳', '程经理', '123', NULL);
INSERT INTO `职员信息` VALUES ('6', '李伟峰', '李工', '123', NULL);

-- ----------------------------
-- Table structure for 联系人
-- ----------------------------
DROP TABLE IF EXISTS `联系人`;
CREATE TABLE `联系人`  (
  `联系人ID` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `主体ID` char(9) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `姓名` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `电话` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QQ号码` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `QQ昵称` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QQ备注` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QQ群` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `计算机名` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `计算机IP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TV_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `备注` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`QQ号码`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 联系人
-- ----------------------------
INSERT INTO `联系人` VALUES ('20181110018', NULL, NULL, NULL, '1005832965', 'cheng程', '景颐养生-程', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110025', NULL, NULL, NULL, '1045933783', '蔠，就行彡', '', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110017', NULL, NULL, NULL, '112333', '32233232', '233232', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110030', NULL, NULL, NULL, '1278209124', '兰色紫晶', '祁门润良李会计', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110009', NULL, NULL, NULL, '1375878446', '木呆子', '信访局', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110029', NULL, NULL, NULL, '1402580481', '鱼的记忆没有水', '星火国旅-胡宝翠', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110026', NULL, NULL, NULL, '1424762469', '众力财务', '', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110016', NULL, NULL, NULL, '1442216476', 'Love☆小毅', '', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110027', NULL, NULL, NULL, '190637717', 'drizzly', '', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110022', NULL, NULL, NULL, '2367438337', '随缘', '', '联网记账群', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110003', NULL, NULL, NULL, '2869359675', '絮飞花落', '征收管理局-陈', '金瑞得软件二号群', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110008', NULL, NULL, NULL, '3486126927', '万邦电子 徐', '', '金瑞得软件一号群', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110021', NULL, NULL, NULL, '348791907', '易水寒', '大峰房产.陈', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110005', NULL, NULL, NULL, '350003867', '雷雨', '合肥超港', '金瑞得软件一号群', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110028', NULL, NULL, NULL, '37010353', '明月清风', '', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110033', NULL, NULL, NULL, '382844665', '紫云英', '万汇包装', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110012', NULL, NULL, NULL, '385366160', '宁静致远', '徽三说阳湖一店', '金瑞得软件一号群', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110007', NULL, NULL, NULL, '441612099', '随@心#梦%', '六股尖', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110034', NULL, NULL, NULL, '461859834', '小雅', '小雅', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110002', NULL, NULL, NULL, '467248042', '紫云', '金联置业.张', '金瑞得软件一号群', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110015', NULL, NULL, NULL, '499915461', '吉光凤羽', '美佳新材料.周', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110020', NULL, NULL, NULL, '514482857', '幽兰', '', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110032', NULL, NULL, NULL, '524734095', '夏天', '秀阳小学许莉', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110024', NULL, NULL, NULL, '547114504', '心···微笑', '安平驾校', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110031', NULL, NULL, NULL, '605983714', '点点纯尘', '', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110001', NULL, NULL, NULL, '676258476', '岭南小学程爱强', '岭南小学程爱强', '联网记账群', NULL, NULL, '1121585719', NULL);
INSERT INTO `联系人` VALUES ('20181110006', NULL, NULL, NULL, '68172817', '石头', '', '金瑞得软件一号群', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110011', NULL, NULL, NULL, '727532447', '雾', '', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110019', NULL, NULL, NULL, '773801217', '悠然', '阳光实业-许会计', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110014', NULL, NULL, NULL, '834133240', '叶子', '街口叶', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110023', NULL, NULL, NULL, '864834925', '冬冬', '向荣新材料', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110004', NULL, NULL, NULL, '895091356', '绿野仙踪', '', '金瑞得软件一号群', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110013', NULL, NULL, NULL, '945166850', '明月', '徽珍食品.杨', '', NULL, NULL, '', NULL);
INSERT INTO `联系人` VALUES ('20181110010', NULL, NULL, NULL, '994657139', '榕树下', '华夏商贸.周', '', NULL, NULL, '', NULL);

-- ----------------------------
-- Table structure for 软件信息
-- ----------------------------
DROP TABLE IF EXISTS `软件信息`;
CREATE TABLE `软件信息`  (
  `软件类型` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `软件名称` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `软件版本` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `下载地址` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `链接` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `备注` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`软件名称`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
