/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : w0maoimk

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 19/05/2025 10:05:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aboutus
-- ----------------------------
DROP TABLE IF EXISTS `aboutus`;
CREATE TABLE `aboutus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `picture1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片1',
  `picture2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片2',
  `picture3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1729408177362624514 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关于我们' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aboutus
-- ----------------------------
INSERT INTO `aboutus` VALUES (1, '2024-12-23 13:07:20', '关于我们', 'ABOUT US', '%3Cp%3E%E5%8E%BB%E5%8A%AA%E5%8A%9B%E4%BA%89%E5%8F%96%3C%2Fp%3E', 'upload/aboutus_picture1.jpg', 'upload/aboutus_picture2.jpg', 'upload/aboutus_picture3.jpg');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `gender` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yonghuzhanghao`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台管理用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'b3b72761d8db8c78dd195bcd433f29b97d80c7ecf81dfd54819542bdc706740e', '管理员', '男', '13823888881', 'api/upload/OIP-C_68491.jpg', '132@qq.com', '0', '2024-12-23 13:07:20');

-- ----------------------------
-- Table structure for claims
-- ----------------------------
DROP TABLE IF EXISTS `claims`;
CREATE TABLE `claims`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adduserid` bigint(20) NULL DEFAULT NULL COMMENT '报销人id',
  `addusername` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报销人',
  `billpicture` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '票据图片',
  `shenhe` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核',
  `shenhehuifu` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核回复',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '报销备注',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1871107388048285699 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报销申请' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of claims
-- ----------------------------
INSERT INTO `claims` VALUES (1871101035120566273, 1871085253821120513, 'user001', 'api/upload/010571200093b0e2k0C83_R_1600_10000_57021.jpg', '驳回', NULL, '<p>撒发生发生发顺丰</p>', '2024-12-23 15:50:25');
INSERT INTO `claims` VALUES (1871107388048285698, 1871106715407753217, 'user002', 'api/upload/100m0c00000061oe1E63F_C_1600_1200_58536.jpg', '同意', NULL, '<p>发撒发生法术法</p>', '2024-12-23 16:15:39');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  `addtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1871106634478657539 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1871106601528205314, '1lo6b12000bf645668B87_R_1600_10000.jpg', 'api/upload/1lo6b12000bf645668B87_R_1600_10000_58351.jpg', '2024-12-23 16:12:32');
INSERT INTO `config` VALUES (1871106616954855426, '1lo0312000bf644srF569_R_1600_10000.jpg', 'api/upload/1lo0312000bf644srF569_R_1600_10000_58355.jpg', '2024-12-23 16:12:36');
INSERT INTO `config` VALUES (1871106634478657538, '0102c1200093ln916B003_R_1600_10000.jpg', 'api/upload/0102c1200093ln916B003_R_1600_10000_58359.jpg', '2024-12-23 16:12:40');

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss`  (
  `id` bigint(20) NOT NULL,
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '头像',
  `nickname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用户名',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评论内容',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父id',
  `likes_count` int(11) NULL DEFAULT NULL COMMENT '点赞数量',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discuss
-- ----------------------------

-- ----------------------------
-- Table structure for image_content
-- ----------------------------
DROP TABLE IF EXISTS `image_content`;
CREATE TABLE `image_content`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图片消息ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片存储路径',
  `file_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '文件ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_image_content_file_id`(`file_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of image_content
-- ----------------------------

-- ----------------------------
-- Table structure for informationss
-- ----------------------------
DROP TABLE IF EXISTS `informationss`;
CREATE TABLE `informationss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资料名称',
  `photo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资料图片',
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '资料文件',
  `shenhe` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核',
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '资料简介',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `addusername` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `adduserid` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1871107232527687683 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资料' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of informationss
-- ----------------------------
INSERT INTO `informationss` VALUES (1871100025882943489, '分类1', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_56776.jpg', '{\"id\":\"1871100014394744833\",\"name\":\"Excel证书模版下载.xlsx\",\"url\":\"api/upload/Excel证书模版下载_56781.xlsx\",\"size\":\"9660\",\"platform\":\"LOCAL\"}', '同意', '阿是发生发顺丰', '2024-12-23 15:46:24', NULL, 1871085253821120513);
INSERT INTO `informationss` VALUES (1871106805182636034, 'guanliyuan', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_58394.jpg', '{\"id\":\"1871106799188975618\",\"name\":\"Excel证书模版下载.xlsx\",\"url\":\"api/upload/Excel证书模版下载_58399.xlsx\",\"size\":\"9660\",\"platform\":\"LOCAL\"}', '通过', 'fasfasf', '2024-12-23 16:13:21', '管理员', 1);
INSERT INTO `informationss` VALUES (1871107232527687682, '简历', 'api/upload/1mc6812000aqoxf1u1773_W_1080_808_R5_D_58493.jpg', '{\"id\":\"1871107223031783425\",\"name\":\"简历.docx\",\"url\":\"api/upload/简历_58500.docx\",\"size\":\"10225\",\"platform\":\"LOCAL\"}', '通过', '简历', '2024-12-23 16:15:02', 'user002', 1);

-- ----------------------------
-- Table structure for itemapplication
-- ----------------------------
DROP TABLE IF EXISTS `itemapplication`;
CREATE TABLE `itemapplication`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用品名称',
  `adduserid` bigint(20) NULL DEFAULT NULL COMMENT '申领人id',
  `addusername` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申领人',
  `photo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用品封面',
  `shenhe` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核',
  `instructionsforuse` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '使用说明',
  `returntime` timestamp NULL DEFAULT NULL COMMENT '归还时间',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shenheid` bigint(20) NULL DEFAULT NULL COMMENT '用品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1871107609000026115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物品申领' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of itemapplication
-- ----------------------------
INSERT INTO `itemapplication` VALUES (1871101166821711874, '名称5', 1871085253821120513, 'user001', 'https://img1.baidu.com/it/u=2118051393,2778967919&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '拒绝', NULL, NULL, '2024-12-23 15:50:56', 1871073414048481298);
INSERT INTO `itemapplication` VALUES (1871107609000026114, '名称5', 1871106715407753217, 'user002', 'https://img1.baidu.com/it/u=2118051393,2778967919&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '同意', NULL, NULL, '2024-12-23 16:16:32', 1871073414048481298);

-- ----------------------------
-- Table structure for leavess
-- ----------------------------
DROP TABLE IF EXISTS `leavess`;
CREATE TABLE `leavess`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shenhe` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核',
  `reasonforleave` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请假理由',
  `photo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `leavetime` timestamp NULL DEFAULT NULL COMMENT '请假时间',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `addusername` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请假人',
  `adduserid` bigint(20) NULL DEFAULT NULL COMMENT '请假人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1871107440196067331 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '请假' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of leavess
-- ----------------------------
INSERT INTO `leavess` VALUES (1871101129832144898, '驳回', '<p>发沙发沙发沙发</p>', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_57043.jpg', '2024-12-31 00:00:00', '2024-12-23 15:50:47', 'user001', 1871085253821120513);
INSERT INTO `leavess` VALUES (1871107440196067330, '同意', '<p>发撒发生法术法</p>', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_58547.jpg', '2024-12-23 00:00:00', '2024-12-23 16:15:52', 'user002', 1871106715407753217);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `from_id` bigint(20) UNSIGNED NOT NULL COMMENT '发送方用户ID',
  `to_id` bigint(20) UNSIGNED NOT NULL COMMENT '接收方用户ID',
  `type` tinyint(3) UNSIGNED NOT NULL COMMENT '消息类型(0 ~ 255)，私聊(0)/群聊(1)消息',
  `content_type` tinyint(3) UNSIGNED NOT NULL COMMENT '消息内容类型，文本(0)/图片(1)/文件(2)',
  `content_id` bigint(20) UNSIGNED NOT NULL COMMENT '消息内容ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息发送时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `avatarurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_message_from_id`(`from_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1871107744236969986 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1871107699609575425, 1, 1871106715407753217, 0, 0, 1871107699282419713, '2024-12-23 16:16:53', '2024-12-23 16:16:53', '管理员', 'https://s11.ax1x.com/2024/01/03/pivi45q.png');
INSERT INTO `message` VALUES (1871107728537690114, 1871106715407753217, 1, 0, 0, 1871107728407666690, '2024-12-23 16:17:00', '2024-12-23 16:17:00', 'cus', '');
INSERT INTO `message` VALUES (1871107744236969985, 1, 1871106715407753217, 0, 0, 1871107744169861121, '2024-12-23 16:17:04', '2024-12-23 16:17:04', '管理员', 'https://s11.ax1x.com/2024/01/03/pivi45q.png');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1729061975584571394 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (93, '2024-12-23 13:07:21', '人生，永远的伤痛', '人生，没有永远的伤痛，再深的痛，在切之时，伤口总会痊愈。人生，没有过不去的坎，你不可以坐在坎边等它消失，你只能想办法穿过它。人生，没有永远的爱情，没有结局的感情，总要结束；不能拥有的人，总会忘记', 'https://s11.ax1x.com/2024/01/03/pivifVs.png', '%3Cp%3E%E5%9B%9E%E5%A4%B4%E7%9C%8B%E7%9C%8B%EF%BC%8C%E4%BD%A0%E4%BC%9A%E4%B8%8D%E4%BC%9A%E5%8F%91%E7%8E%B0%EF%BC%8C%E6%9B%BE%E7%BB%8F%E7%9A%84%E4%BD%A0%E5%9C%A8%E8%BF%99%E9%87%8C%E6%91%94%E5%80%92%E8%BF%87%3B%E5%9B%9E%E5%A4%B4%E7%9C%8B%E7%9C%8B%EF%BC%8C%E4%BD%A0%E6%98%AF%E5%90%A6%E5%8F%91%E7%8E%B0%EF%BC%8C%E4%B8%80%E6%AC%A1%E6%AC%A1%E5%9C%B0%E9%87%8D%E5%A4%8D%E7%9D%80%EF%BC%8C%E5%8D%B4%E4%BB%8E%E6%B2%A1%E7%88%AC%E8%B5%B7%E8%BF%87%E3%80%82%E8%80%8C%E5%A6%82%E4%BB%8A%EF%BC%8C%E8%AE%A9%E6%88%91%E4%BB%AC%E6%8A%8A%E8%A7%86%E7%BA%BF%E8%BD%AC%E5%90%91%E5%89%8D%E6%96%B9%EF%BC%8C%E9%82%A3%E4%B8%80%E9%81%93%E9%81%93%E9%87%91%E8%89%B2%E7%9A%84%E5%BC%A7%E7%BA%BF%EF%BC%8C%E6%98%AF%E6%B5%81%E6%98%9F%E9%A3%9E%E9%80%9D%E7%9A%84%E7%97%95%E8%BF%B9%EF%BC%8C%E6%88%96%E6%98%AF%E6%88%90%E5%8A%9F%E8%BF%90%E8%A1%8C%E7%9A%84%E8%BD%A8%E9%81%93%E3%80%82%E4%BB%8A%E5%A4%A9%E7%9A%84%E4%BD%A0%EF%BC%8C%E6%98%AF%E5%90%A6%E8%A6%81%E6%89%AC%E5%B8%86%E8%B5%B7%E8%88%AA%EF%BC%8C%E8%AE%A9%E5%B9%B8%E7%A6%8F%E6%9D%A5%E6%95%B2%E9%97%A8%3F%3C%2Fp%3E%3Cp%3E%E6%B8%85%E6%99%A8%E7%9A%84%E5%A4%AA%E9%98%B3%E6%92%92%E5%90%91%E5%A4%A7%E5%9C%B0%EF%BC%8C%E7%A5%9E%E5%A5%87%E7%9A%84%E5%AE%87%E5%AE%99%E8%B5%8B%E4%BA%88%E5%AE%83%E7%A5%9E%E5%A5%87%E7%9A%84%E8%89%B2%E5%BD%A9%EF%BC%8C%E5%A4%A7%E8%87%AA%E7%84%B6%E6%B2%90%E6%B5%B4%E7%9D%80%E6%98%A5%E5%85%89%EF%BC%8C%E4%B8%96%E7%95%8C%E5%9B%A0%E5%A4%AA%E9%98%B3%E7%9A%84%E7%85%A7%E5%B0%84%E8%80%8C%E7%B2%BE%E5%BD%A9%EF%BC%8C%E6%9E%97%E4%B8%AD%E7%99%BE%E9%B8%9F%E5%95%BE%E5%95%BE%EF%BC%8C%E6%B2%B3%E6%B0%B4%E8%BD%BB%E8%BD%BB%E6%B5%81%E6%B7%8C%EF%BC%8C%E6%B1%87%E6%88%90%E6%B8%85%E5%AE%81%E7%9A%84%E5%B1%B1%E9%97%B4%E5%B0%8F%E8%B0%83%E3%80%82%3C%2Fp%3E%3Cp%3E%E6%98%AF%E7%9A%84%EF%BC%8C%E9%9D%A2%E5%AF%B9%E9%81%93%E9%80%94%E4%B8%8A%E9%82%A3%E6%97%A0%E6%83%85%E7%9A%84%E5%98%B2%E8%AE%BD%EF%BC%8C%E9%9D%A2%E5%AF%B9%E6%AD%A5%E4%BC%90%E4%B8%AD%E9%82%A3%E9%87%8D%E5%A4%8D%E7%9A%84%E6%91%94%E8%B7%A4%EF%BC%8C%E9%9D%A2%E5%AF%B9%E6%BF%80%E6%B5%81%E4%B8%8E%E7%A1%AC%E7%9F%B3%E4%B9%8B%E9%97%B4%E7%8C%9B%E7%83%88%E7%9A%84%E7%A2%B0%E6%92%9E%EF%BC%8C%E6%88%91%E4%BB%AC%E5%BF%85%E9%A1%BB%E9%80%89%E6%8B%A9%E9%82%A3%E5%AF%8C%E4%BA%8E%E9%98%B4%E9%9B%A8%EF%BC%8C%E5%8D%B4%E6%9C%80%E7%BB%88%E8%A7%81%E5%88%B0%E5%BD%A9%E8%99%B9%E7%9A%84%E8%8D%86%E6%A3%98%E8%B7%AF%E3%80%82%E4%B9%9F%E8%AE%B8%EF%BC%8C%E7%BB%8F%E5%8E%86%E4%BA%86%E9%82%A3%E6%9A%B4%E9%A3%8E%E9%9B%A8%E7%9A%84%E6%B4%97%E7%A4%BC%EF%BC%8C%E6%88%91%E4%BB%AC%E4%BE%BF%E4%BC%9A%E5%8F%98%E5%BE%97%E8%87%AA%E4%BF%A1%EF%BC%8C%E5%B9%B8%E7%A6%8F%E4%B9%9F%E9%9A%8F%E4%B9%8B%E8%80%8C%E6%9D%A5%E3%80%82%3C%2Fp%3E');

-- ----------------------------
-- Table structure for officesupplies
-- ----------------------------
DROP TABLE IF EXISTS `officesupplies`;
CREATE TABLE `officesupplies`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `clicknum` int(11) NULL DEFAULT NULL COMMENT '点击量',
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `brand` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `size` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `material` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '材质',
  `functionaldescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '功能描述',
  `usagescenarios` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '使用场景',
  `photo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '封面',
  `photos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情图',
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情信息',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1871073414048491126 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '办公用品' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of officesupplies
-- ----------------------------
INSERT INTO `officesupplies` VALUES (1871073414048485626, 49, '毛巾', '毛巾', '毛巾', '毛巾', '毛巾', '毛巾', 'https://img2.baidu.com/it/u=1487489421,3110796988&fm=253&fmt=auto&app=138&f=JPEG?w=599&h=500', '[]', '<p>毛巾</p>', '2024-12-23 14:00:39');

-- ----------------------------
-- Table structure for postcategories
-- ----------------------------
DROP TABLE IF EXISTS `postcategories`;
CREATE TABLE `postcategories`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `addtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `userid` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名字',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子话题分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of postcategories
-- ----------------------------
INSERT INTO `postcategories` VALUES (1727991403442307074, '2024-12-23 13:07:21', 2, 'admin1', '啦啦啦la');
INSERT INTO `postcategories` VALUES (1727992664430444546, '2024-12-23 13:07:21', 2, 'admin1', 'qqqqll');
INSERT INTO `postcategories` VALUES (1727993431035969538, '2024-12-23 13:07:21', 2, 'admin1', 'hhhh');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `category_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '话题分类',
  `posting_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发帖地址',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `post_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `is_published` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否发布(Y/N)',
  `is_approved` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否审核通过(Y/N)',
  `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发帖人',
  `addtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发帖人名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子详情' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1729390431694393345, 'qqqqll', '[\"上海\",\"徐汇区\",\"湖南路街道\"]', 'https://s11.ax1x.com/2024/01/03/piviIP0.png', 'qq', '%3Cp%3Eaaa%3C%2Fp%3E', 'N', NULL, '1', '2024-12-23 13:07:21', 'admin');

-- ----------------------------
-- Table structure for qiandaoqiantui
-- ----------------------------
DROP TABLE IF EXISTS `qiandaoqiantui`;
CREATE TABLE `qiandaoqiantui`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NULL DEFAULT NULL COMMENT '员工id',
  `username` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `status` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '签到/签退',
  `qiandaotime` timestamp NULL DEFAULT NULL COMMENT '签到时间',
  `qiantuitime` timestamp NULL DEFAULT NULL COMMENT '签退时间',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1924136646786117655 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '签到签退' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qiandaoqiantui
-- ----------------------------
INSERT INTO `qiandaoqiantui` VALUES (1, 1871106715407753217, 'cus', '签到', '2025-05-18 21:41:01', NULL, '2025-05-18 21:41:02');
INSERT INTO `qiandaoqiantui` VALUES (2, 1871106715407753217, 'cus', '签退', '2025-05-18 21:41:03', NULL, '2025-05-18 21:41:03');
INSERT INTO `qiandaoqiantui` VALUES (3, 1871085253821120513, 'kai1', '签到', '2025-05-18 21:44:42', NULL, '2025-05-18 21:44:42');
INSERT INTO `qiandaoqiantui` VALUES (4, 1871085253821120513, 'kai1', '签退', '2025-05-18 21:44:43', NULL, '2025-05-18 21:44:43');
INSERT INTO `qiandaoqiantui` VALUES (5, 1924098967222579201, 'laxx', '签到', '2025-05-18 21:45:37', NULL, '2025-05-18 21:45:38');
INSERT INTO `qiandaoqiantui` VALUES (6, 1924098967222579201, 'laxx', '签退', '2025-05-18 21:45:39', NULL, '2025-05-18 21:45:39');
INSERT INTO `qiandaoqiantui` VALUES (7, 1871106715407753217, 'cus', '签到', '2025-04-01 08:30:00', NULL, '2025-04-01 08:30:01');
INSERT INTO `qiandaoqiantui` VALUES (8, 1871106715407753217, 'cus', '签退', '2025-04-01 17:30:00', NULL, '2025-04-01 17:30:01');
INSERT INTO `qiandaoqiantui` VALUES (9, 1871106715407753217, 'cus', '签到', '2025-04-02 08:35:00', NULL, '2025-04-02 08:35:01');
INSERT INTO `qiandaoqiantui` VALUES (10, 1871106715407753217, 'cus', '签退', '2025-04-02 17:25:00', NULL, '2025-04-02 17:25:01');
INSERT INTO `qiandaoqiantui` VALUES (11, 1871106715407753217, 'cus', '签到', '2025-04-03 08:40:00', NULL, '2025-04-03 08:40:01');
INSERT INTO `qiandaoqiantui` VALUES (12, 1871106715407753217, 'cus', '签退', '2025-04-03 17:40:00', NULL, '2025-04-03 17:40:01');
INSERT INTO `qiandaoqiantui` VALUES (13, 1871106715407753217, 'cus', '签到', '2025-04-04 08:32:00', NULL, '2025-04-04 08:32:01');
INSERT INTO `qiandaoqiantui` VALUES (14, 1871106715407753217, 'cus', '签退', '2025-04-04 17:32:00', NULL, '2025-04-04 17:32:01');
INSERT INTO `qiandaoqiantui` VALUES (15, 1871106715407753217, 'cus', '签到', '2025-04-07 08:38:00', NULL, '2025-04-07 08:38:01');
INSERT INTO `qiandaoqiantui` VALUES (16, 1871106715407753217, 'cus', '签退', '2025-04-07 17:38:00', NULL, '2025-04-07 17:38:01');
INSERT INTO `qiandaoqiantui` VALUES (17, 1871106715407753217, 'cus', '签到', '2025-04-08 08:28:00', NULL, '2025-04-08 08:28:01');
INSERT INTO `qiandaoqiantui` VALUES (18, 1871106715407753217, 'cus', '签退', '2025-04-08 17:28:00', NULL, '2025-04-08 17:28:01');
INSERT INTO `qiandaoqiantui` VALUES (19, 1871106715407753217, 'cus', '签到', '2025-04-09 08:31:00', NULL, '2025-04-09 08:31:01');
INSERT INTO `qiandaoqiantui` VALUES (20, 1871106715407753217, 'cus', '签退', '2025-04-09 17:31:00', NULL, '2025-04-09 17:31:01');
INSERT INTO `qiandaoqiantui` VALUES (21, 1871106715407753217, 'cus', '签到', '2025-04-10 08:36:00', NULL, '2025-04-10 08:36:01');
INSERT INTO `qiandaoqiantui` VALUES (22, 1871106715407753217, 'cus', '签退', '2025-04-10 17:36:00', NULL, '2025-04-10 17:36:01');
INSERT INTO `qiandaoqiantui` VALUES (23, 1871106715407753217, 'cus', '签到', '2025-04-11 08:33:00', NULL, '2025-04-11 08:33:01');
INSERT INTO `qiandaoqiantui` VALUES (24, 1871106715407753217, 'cus', '签退', '2025-04-11 17:33:00', NULL, '2025-04-11 17:33:01');
INSERT INTO `qiandaoqiantui` VALUES (25, 1871106715407753217, 'cus', '签到', '2025-04-14 08:39:00', NULL, '2025-04-14 08:39:01');
INSERT INTO `qiandaoqiantui` VALUES (26, 1871106715407753217, 'cus', '签退', '2025-04-14 17:39:00', NULL, '2025-04-14 17:39:01');
INSERT INTO `qiandaoqiantui` VALUES (27, 1871085253821120513, 'kai1', '签到', '2025-04-01 09:00:00', NULL, '2025-04-01 09:00:01');
INSERT INTO `qiandaoqiantui` VALUES (28, 1871085253821120513, 'kai1', '签退', '2025-04-01 18:00:00', NULL, '2025-04-01 18:00:01');
INSERT INTO `qiandaoqiantui` VALUES (29, 1871085253821120513, 'kai1', '签到', '2025-04-02 09:05:00', NULL, '2025-04-02 09:05:01');
INSERT INTO `qiandaoqiantui` VALUES (30, 1871085253821120513, 'kai1', '签退', '2025-04-02 17:55:00', NULL, '2025-04-02 17:55:01');
INSERT INTO `qiandaoqiantui` VALUES (31, 1871085253821120513, 'kai1', '签到', '2025-04-03 09:10:00', NULL, '2025-04-03 09:10:01');
INSERT INTO `qiandaoqiantui` VALUES (32, 1871085253821120513, 'kai1', '签退', '2025-04-03 18:10:00', NULL, '2025-04-03 18:10:01');
INSERT INTO `qiandaoqiantui` VALUES (33, 1871085253821120513, 'kai1', '签到', '2025-04-04 09:02:00', NULL, '2025-04-04 09:02:01');
INSERT INTO `qiandaoqiantui` VALUES (34, 1871085253821120513, 'kai1', '签退', '2025-04-04 18:02:00', NULL, '2025-04-04 18:02:01');
INSERT INTO `qiandaoqiantui` VALUES (35, 1871085253821120513, 'kai1', '签到', '2025-04-07 09:08:00', NULL, '2025-04-07 09:08:01');
INSERT INTO `qiandaoqiantui` VALUES (36, 1871085253821120513, 'kai1', '签退', '2025-04-07 18:08:00', NULL, '2025-04-07 18:08:01');
INSERT INTO `qiandaoqiantui` VALUES (37, 1871085253821120513, 'kai1', '签到', '2025-04-08 08:58:00', NULL, '2025-04-08 08:58:01');
INSERT INTO `qiandaoqiantui` VALUES (38, 1871085253821120513, 'kai1', '签退', '2025-04-08 17:58:00', NULL, '2025-04-08 17:58:01');
INSERT INTO `qiandaoqiantui` VALUES (39, 1871085253821120513, 'kai1', '签到', '2025-04-09 09:03:00', NULL, '2025-04-09 09:03:01');
INSERT INTO `qiandaoqiantui` VALUES (40, 1871085253821120513, 'kai1', '签退', '2025-04-09 18:03:00', NULL, '2025-04-09 18:03:01');
INSERT INTO `qiandaoqiantui` VALUES (41, 1871085253821120513, 'kai1', '签到', '2025-04-10 09:06:00', NULL, '2025-04-10 09:06:01');
INSERT INTO `qiandaoqiantui` VALUES (42, 1871085253821120513, 'kai1', '签退', '2025-04-10 18:06:00', NULL, '2025-04-10 18:06:01');
INSERT INTO `qiandaoqiantui` VALUES (43, 1871085253821120513, 'kai1', '签到', '2025-04-11 09:01:00', NULL, '2025-04-11 09:01:01');
INSERT INTO `qiandaoqiantui` VALUES (44, 1871085253821120513, 'kai1', '签退', '2025-04-11 18:01:00', NULL, '2025-04-11 18:01:01');
INSERT INTO `qiandaoqiantui` VALUES (45, 1871085253821120513, 'kai1', '签到', '2025-04-14 09:09:00', NULL, '2025-04-14 09:09:01');
INSERT INTO `qiandaoqiantui` VALUES (46, 1871085253821120513, 'kai1', '签退', '2025-04-14 18:09:00', NULL, '2025-04-14 18:09:01');
INSERT INTO `qiandaoqiantui` VALUES (47, 1924098967222579201, 'laxx', '签到', '2025-04-01 08:45:00', NULL, '2025-04-01 08:45:01');
INSERT INTO `qiandaoqiantui` VALUES (48, 1924098967222579201, 'laxx', '签退', '2025-04-01 17:45:00', NULL, '2025-04-01 17:45:01');
INSERT INTO `qiandaoqiantui` VALUES (49, 1924098967222579201, 'laxx', '签到', '2025-04-02 08:50:00', NULL, '2025-04-02 08:50:01');
INSERT INTO `qiandaoqiantui` VALUES (50, 1924098967222579201, 'laxx', '签退', '2025-04-02 17:40:00', NULL, '2025-04-02 17:40:01');
INSERT INTO `qiandaoqiantui` VALUES (51, 1924098967222579201, 'laxx', '签到', '2025-04-03 08:55:00', NULL, '2025-04-03 08:55:01');
INSERT INTO `qiandaoqiantui` VALUES (52, 1924098967222579201, 'laxx', '签退', '2025-04-03 17:55:00', NULL, '2025-04-03 17:55:01');
INSERT INTO `qiandaoqiantui` VALUES (53, 1924098967222579201, 'laxx', '签到', '2025-04-04 08:47:00', NULL, '2025-04-04 08:47:01');
INSERT INTO `qiandaoqiantui` VALUES (54, 1924098967222579201, 'laxx', '签退', '2025-04-04 17:47:00', NULL, '2025-04-04 17:47:01');
INSERT INTO `qiandaoqiantui` VALUES (55, 1924098967222579201, 'laxx', '签到', '2025-04-07 08:53:00', NULL, '2025-04-07 08:53:01');
INSERT INTO `qiandaoqiantui` VALUES (56, 1924098967222579201, 'laxx', '签退', '2025-04-07 17:53:00', NULL, '2025-04-07 17:53:01');
INSERT INTO `qiandaoqiantui` VALUES (57, 1924098967222579201, 'laxx', '签到', '2025-04-10 08:52:00', NULL, '2025-04-10 08:52:01');
INSERT INTO `qiandaoqiantui` VALUES (58, 1924098967222579201, 'laxx', '签退', '2025-04-10 17:52:00', NULL, '2025-04-10 17:52:01');
INSERT INTO `qiandaoqiantui` VALUES (59, 1924098967222579201, 'laxx', '签到', '2025-04-11 08:49:00', NULL, '2025-04-11 08:49:01');
INSERT INTO `qiandaoqiantui` VALUES (60, 1924098967222579201, 'laxx', '签退', '2025-04-11 17:49:00', NULL, '2025-04-11 17:49:01');
INSERT INTO `qiandaoqiantui` VALUES (61, 1924098967222579201, 'laxx', '签到', '2025-04-14 08:57:00', NULL, '2025-04-14 08:57:01');
INSERT INTO `qiandaoqiantui` VALUES (62, 1924098967222579201, 'laxx', '签退', '2025-04-14 17:57:00', NULL, '2025-04-14 17:57:01');
INSERT INTO `qiandaoqiantui` VALUES (63, 1871106715407753217, 'cus', '签到', '2025-05-19 00:09:59', NULL, '2025-05-19 00:10:00');
INSERT INTO `qiandaoqiantui` VALUES (64, 1871106715407753217, 'cus', '签退', '2025-05-19 00:10:01', NULL, '2025-05-19 00:10:01');
INSERT INTO `qiandaoqiantui` VALUES (65, 1924136535054053377, 'bysjde', '签到', '2025-05-19 00:14:58', NULL, '2025-05-19 00:14:59');
INSERT INTO `qiandaoqiantui` VALUES (66, 1924136535054053377, 'bysjde', '签退', '2025-05-19 00:14:59', NULL, '2025-05-19 00:15:00');
INSERT INTO `qiandaoqiantui` VALUES (67, 1924136535054053377, 'bysjde', '签到', '2025-05-19 00:14:58', NULL, '2025-05-19 00:14:59');
INSERT INTO `qiandaoqiantui` VALUES (68, 1924136535054053377, 'bysjde', '签退', '2025-05-19 00:14:59', NULL, '2025-05-19 00:25:00');
INSERT INTO `qiandaoqiantui` VALUES (69, 1924136535054053377, 'bysjde', '签到', '2025-05-19 01:00:00', NULL, '2025-05-19 00:55:00');
INSERT INTO `qiandaoqiantui` VALUES (70, 1924136535054053377, 'bysjde', '签退', '2025-05-19 01:30:00', NULL, '2025-05-19 10:15:00');
INSERT INTO `qiandaoqiantui` VALUES (71, 1924136535054053377, 'bysjde', '签到', '2025-05-19 08:00:00', NULL, '2025-05-19 08:15:00');
INSERT INTO `qiandaoqiantui` VALUES (72, 1924136535054053377, 'bysjde', '签退', '2025-05-19 17:00:00', NULL, '2025-05-19 06:15:00');
INSERT INTO `qiandaoqiantui` VALUES (73, 1924136535054053377, 'bysjde', '签到', '2025-05-20 09:00:00', NULL, '2025-05-19 10:15:00');
INSERT INTO `qiandaoqiantui` VALUES (74, 1924136535054053377, 'bysjde', '签退', '2025-05-20 18:00:00', NULL, '2025-05-19 11:15:00');

-- ----------------------------
-- Table structure for salariess
-- ----------------------------
DROP TABLE IF EXISTS `salariess`;
CREATE TABLE `salariess`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `employeeid` bigint(20) NULL DEFAULT NULL COMMENT '员工id',
  `employeename` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工名称',
  `monthes` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '月份',
  `salary` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '薪资',
  `remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `fiveinsurances` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '五险',
  `onegold` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一金',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1871106961630175234 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '薪资' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of salariess
-- ----------------------------
INSERT INTO `salariess` VALUES (1871098265906847746, 1871085253821120513, 'kai1', '5月', '2000', '发生发顺丰', '500', '200', '2024-12-23 15:39:25');
INSERT INTO `salariess` VALUES (1871106961630175233, 1871106715407753217, 'cus', '5月', '5000', 'fsafasf', '500', '200', '2024-12-23 16:13:58');

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) NOT NULL COMMENT '关联id',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `type` int(200) NOT NULL DEFAULT 1 COMMENT '类型(-1:踩,1:浏览,2:关注,3:收藏,4:点赞,5:喜欢)',
  `inteltype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1730069355965353987 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of storeup
-- ----------------------------

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '附件名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '附件地址',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '附件大小',
  `platform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储平台',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '附件管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------
INSERT INTO `sys_attachment` VALUES (1871099306513670145, '1lo6b12000bf645668B87_R_1600_10000.jpg', 'api/upload/1lo6b12000bf645668B87_R_1600_10000_56612.jpg', 159516, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871099613461225473, '100m0c00000061oe1E63F_C_1600_1200.jpg', 'api/upload/100m0c00000061oe1E63F_C_1600_1200_56685.jpg', 78923, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871099993519693826, '0101o1200093lnr10DA18_R_1600_10000.jpg', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_56776.jpg', 247269, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871100014394744833, 'Excel证书模版下载.xlsx', 'api/upload/Excel证书模版下载_56781.xlsx', 9660, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871100679842045954, '1mc4x12000ceugxl13772_W_1080_808_R5_D.jpg', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_56940.jpg', 144533, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871101021321306114, '010571200093b0e2k0C83_R_1600_10000.jpg', 'api/upload/010571200093b0e2k0C83_R_1600_10000_57021.jpg', 340614, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871101113210118146, '0101o1200093lnr10DA18_R_1600_10000.jpg', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_57043.jpg', 247269, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871106601259769858, '1lo6b12000bf645668B87_R_1600_10000.jpg', 'api/upload/1lo6b12000bf645668B87_R_1600_10000_58351.jpg', 159516, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871106616829026305, '1lo0312000bf644srF569_R_1600_10000.jpg', 'api/upload/1lo0312000bf644srF569_R_1600_10000_58355.jpg', 377673, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871106634344439810, '0102c1200093ln916B003_R_1600_10000.jpg', 'api/upload/0102c1200093ln916B003_R_1600_10000_58359.jpg', 214149, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871106778653663234, '0101o1200093lnr10DA18_R_1600_10000.jpg', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_58394.jpg', 247269, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871106799188975618, 'Excel证书模版下载.xlsx', 'api/upload/Excel证书模版下载_58399.xlsx', 9660, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871106865232486402, '1mc4x12000ceugxl13772_W_1080_808_R5_D.jpg', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_58414.jpg', 144533, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871106882496241666, '01046120004gesr5x9B21_R_1600_10000.jpg', 'api/upload/01046120004gesr5x9B21_R_1600_10000_58418.jpg', 259808, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871107193520660481, '1mc6812000aqoxf1u1773_W_1080_808_R5_D.jpg', 'api/upload/1mc6812000aqoxf1u1773_W_1080_808_R5_D_58493.jpg', 106671, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871107223031783425, '简历.docx', 'api/upload/简历_58500.docx', 10225, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871107346017165314, '350l190000017cba4A783_C_1600_1200.jpg', 'api/upload/350l190000017cba4A783_C_1600_1200_58529.jpg', 163632, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871107376870465538, '100m0c00000061oe1E63F_C_1600_1200.jpg', 'api/upload/100m0c00000061oe1E63F_C_1600_1200_58536.jpg', 78923, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871107423439822850, '1mc4x12000ceugxl13772_W_1080_808_R5_D.jpg', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_58547.jpg', 144533, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1871107802781065217, '1mc4x12000ceugxl13772_W_1080_808_R5_D.jpg', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_58638.jpg', 144533, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1924057758475186178, 'OIP-C.jpg', 'api/upload/OIP-C_68491.jpg', 8570, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1924065547889111041, 'OIP-C.jpg', 'api/upload/OIP-C_70348.jpg', 8570, 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment` VALUES (1924098420847374338, 'OIP-C.jpg', 'api/upload/OIP-C_78186.jpg', 8570, 'LOCAL', NULL, NULL);

-- ----------------------------
-- Table structure for systemintro
-- ----------------------------
DROP TABLE IF EXISTS `systemintro`;
CREATE TABLE `systemintro`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `picture1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片1',
  `picture2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片2',
  `picture3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关于我们' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of systemintro
-- ----------------------------
INSERT INTO `systemintro` VALUES (1, '2024-12-23 13:07:22', '系统简介', 'SYSTEM INTRODUCTION', '当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。', 'upload/systemintro_picture1.jpg', 'https://s11.ax1x.com/2024/01/03/pivi45q.png', 'https://s11.ax1x.com/2024/01/03/piviIP0.png');

-- ----------------------------
-- Table structure for text_content
-- ----------------------------
DROP TABLE IF EXISTS `text_content`;
CREATE TABLE `text_content`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文本消息ID',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文本消息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1871107744169861122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of text_content
-- ----------------------------
INSERT INTO `text_content` VALUES (1871107699282419713, '1111', '2024-12-23 16:16:53', '2024-12-23 16:16:53');
INSERT INTO `text_content` VALUES (1871107728407666690, '32323', '2024-12-23 16:17:00', '2024-12-23 16:17:00');
INSERT INTO `text_content` VALUES (1871107744169861121, '3233', '2024-12-23 16:17:04', '2024-12-23 16:17:04');

-- ----------------------------
-- Table structure for tousufankui
-- ----------------------------
DROP TABLE IF EXISTS `tousufankui`;
CREATE TABLE `tousufankui`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投诉原因',
  `photo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投诉照片',
  `detail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投诉简介',
  `details` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投诉详情',
  `userid` bigint(20) NULL DEFAULT NULL COMMENT '投诉人id',
  `username` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投诉人名字',
  `status` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投诉状态',
  `fankuijieguo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '反馈结果',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1743547502863691779 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '投诉反馈' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tousufankui
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '角色',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatarurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1924136535054053378 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1871085253821120513, 'user001', '322b8933cf6c060f9246825dbd68d10db9abb747c75e1f84b7a836ddd22bb2a9', '10', 'kai1', NULL, '13444444444', '1432442018@qq.com', '2024-12-23 14:47:42', '0.0');
INSERT INTO `user` VALUES (1871106715407753217, 'user002', '322b8933cf6c060f9246825dbd68d10db9abb747c75e1f84b7a836ddd22bb2a9', '10', 'cus', 'api/upload/OIP-C_70348.jpg', '13444444444', '1432442018@qq.com', '2024-12-23 16:12:59', '0.0');
INSERT INTO `user` VALUES (1924098967222579201, 'user003', '322b8933cf6c060f9246825dbd68d10db9abb747c75e1f84b7a836ddd22bb2a9', '10', 'laxx', NULL, '13333333333', 'Dsl132@qq.com', '2025-05-18 21:45:16', '0');
INSERT INTO `user` VALUES (1924136535054053377, 'user004', '322b8933cf6c060f9246825dbd68d10db9abb747c75e1f84b7a836ddd22bb2a9', '10', 'bysjde', NULL, '13333333333', 'Dsl132@qq.com', '2025-05-19 00:14:33', '0');

-- ----------------------------
-- Table structure for workplan
-- ----------------------------
DROP TABLE IF EXISTS `workplan`;
CREATE TABLE `workplan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作标题',
  `workcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '工作内容',
  `tasktype` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务类型',
  `nameofpersonincharge` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人名称',
  `priority` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优先级',
  `starttime` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `planningduration` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划时长',
  `completionprogress` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完成进度',
  `jobcover` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作封面',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `addusername` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `adduserid` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `shenhe` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1924078505251794947 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作计划' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of workplan
-- ----------------------------
INSERT INTO `workplan` VALUES (1871099310959632385, '每日计划', '<p>萨法师范那萨弗拉斯你疯啦赛诺菲来拿算法逻辑那算啦放哪瑟拉娜发啦收纳发啦蓝色法兰式家乐福那孙丽娜·1辽宁快乐发十年老粉那山卡拉放哪离开你舒服了那是否</p>', 'f', 'sffasf', '高', '2024-12-23 00:00:00', '120', '53', 'api/upload/1lo6b12000bf645668B87_R_1600_10000_56612.jpg', '2024-12-23 15:43:34', NULL, NULL, '待审核');
INSERT INTO `workplan` VALUES (1871099632633389058, '每日计划', '<p>safasfasf</p>', 'f', 'sffasf', '低', '2024-12-24 00:00:00', '120', '53', 'api/upload/100m0c00000061oe1E63F_C_1600_1200_56685.jpg', '2024-12-23 15:44:50', NULL, NULL, '待审核');
INSERT INTO `workplan` VALUES (1871099949072654337, '每日计划', '<p>fasfasfasfasfasfasfasfszfsfa谁法师法师</p>', 'f', 'sffasf', '中', '2024-12-25 00:00:00', '120', '53', NULL, '2024-12-23 15:46:06', NULL, 1871085253821120513, '待审核');
INSERT INTO `workplan` VALUES (1871107349250973698, '每日计划一', '<p>市司法局搬弄是非久啊是吧飞机吧生发剂把沙发久啊是吧飞机啊是吧飞机萨凡纳设计放哪</p>', 'f', 'sffasf', '高', '2024-12-23 00:00:00', '120', '53', 'api/upload/350l190000017cba4A783_C_1600_1200_58529.jpg', '2024-12-23 16:15:30', 'user002', 1871106715407753217, '待审核');
INSERT INTO `workplan` VALUES (1924078505251794946, NULL, '<p><br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-18 20:23:58', 'user002', 1871106715407753217, '待审核');

-- ----------------------------
-- Function structure for haversine_distance
-- ----------------------------
DROP FUNCTION IF EXISTS `haversine_distance`;
delimiter ;;
CREATE FUNCTION `haversine_distance`(lat1 DOUBLE, lon1 DOUBLE,
    lat2 DOUBLE, lon2 DOUBLE)
 RETURNS double
  DETERMINISTIC
BEGIN
    DECLARE R DOUBLE DEFAULT 6371; -- 地球半径，单位公里
    DECLARE dLat DOUBLE;
    DECLARE dLon DOUBLE;
    DECLARE a DOUBLE;
    DECLARE c DOUBLE;
    SET dLat = RADIANS(lat2 - lat1);
    SET dLon = RADIANS(lon2 - lon1);
    SET a = SIN(dLat / 2) * SIN(dLat / 2) + COS(RADIANS(lat1)) * COS(RADIANS(lat2)) * SIN(dLon / 2) * SIN(dLon / 2);
    SET c = 2 * ATAN2(SQRT(a), SQRT(1 - a));
    RETURN R * c;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
