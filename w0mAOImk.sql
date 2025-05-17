/*
 --------------------------------------------------
 Target Server Type    : MySQL;
 Target Server Version : 8.0.12;
 
 Target Server Date : 2024-12-23 16:18:53;
 
 --------------------------------------------------
*/
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;



DROP TABLE IF EXISTS `aboutus`;
CREATE TABLE `aboutus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '副标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `picture1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片1',
  `picture2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片2',
  `picture3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1729408177362624514 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='关于我们';
INSERT INTO `aboutus`(id, addtime, title, subtitle, content, picture1, picture2, picture3) VALUES ('1', '2024-12-23 13:07:20.0', '关于我们', 'ABOUT US', '%3Cp%3E%E4%B8%8D%E7%AE%A1%E4%BD%A0%E6%83%B3%E8%A6%81%E6%80%8E%E6%A0%B7%E7%9A%84%E7%94%9F%E6%B4%BB%EF%BC%8C%E4%BD%A0%E9%83%BD%E8%A6%81%E5%8E%BB%E5%8A%AA%E5%8A%9B%E4%BA%89%E5%8F%96%EF%BC%8C%E4%B8%8D%E5%A4%9A%E5%B0%9D%E8%AF%95%E4%B8%80%E4%BA%9B%E4%BA%8B%E6%83%85%E6%80%8E%E4%B9%88%E7%9F%A5%E9%81%93%E8%87%AA%E5%B7%B1%E9%80%82%E5%90%88%E4%BB%80%E4%B9%88%E3%80%81%E4%B8%8D%E9%80%82%E5%90%88%E4%BB%80%E4%B9%88%E5%91%A2%3F%3C%2Fp%3E%3Cp%3E%E4%BD%A0%E8%AF%B4%E4%BD%A0%E5%96%9C%E6%AC%A2%E8%AF%BB%E4%B9%A6%EF%BC%8C%E8%AE%A9%E6%88%91%E7%BB%99%E4%BD%A0%E5%88%97%E4%B9%A6%E5%8D%95%EF%BC%8C%E4%BD%A0%E8%BF%98%E9%97%AE%E6%88%91%E5%93%AA%E9%87%8C%E6%9C%89%E9%82%A3%E4%B9%88%E5%A4%9A%E6%97%B6%E9%97%B4%E7%9C%8B%E4%B9%A6%3B%E4%BD%A0%E8%AF%B4%E8%87%AA%E5%B7%B1%E6%A2%A6%E6%83%B3%E7%9A%84%E8%81%8C%E4%B8%9A%E6%98%AF%E5%B9%BF%E5%91%8A%E6%96%87%E6%A1%88%EF%BC%8C%E9%97%AE%E6%88%91%E5%A6%82%E4%BD%95%E6%88%90%E4%B8%BA%E4%B8%80%E4%B8%AA%E6%96%87%E6%A1%88%EF%BC%8C%E5%BA%94%E8%AF%A5%E5%85%B7%E5%A4%87%E5%93%AA%E4%BA%9B%E7%B4%A0%E8%B4%A8%3B%E4%BD%A0%E8%AF%B4%E4%BD%A0%E8%AE%A1%E5%88%92%E6%99%A8%E8%B7%91%EF%BC%8C%E4%BD%86%E6%80%BB%E6%98%AF%E5%9B%A0%E4%B8%BA%E5%AD%A6%E4%B9%A0%E3%80%81%E5%B7%A5%E4%BD%9C%E8%BE%9B%E8%8B%A6%E6%88%96%E8%80%85%E8%BA%AB%E4%BD%93%E4%B8%8D%E8%88%92%E6%9C%8D%E7%AC%AC%E4%BA%8C%E5%A4%A9%E8%B5%B7%E4%B8%8D%E4%BA%86%E5%BA%8A%3B%E4%BD%A0%E8%AF%B4%E4%BD%A0%E4%B8%80%E7%9B%B4%E6%A2%A6%E6%83%B3%E4%B8%80%E4%B8%AA%E4%BA%BA%E5%8E%BB%E9%95%BF%E9%80%94%E6%97%85%E8%A1%8C%EF%BC%8C%E4%BD%86%E6%98%AF%E6%B2%A1%E9%92%B1%EF%BC%8C%E7%88%B6%E6%AF%8D%E8%A7%89%E5%BE%97%E5%8D%B1%E9%99%A9%E3%80%82%E5%85%B6%E5%AE%9E%EF%BC%8C%E6%88%91%E5%B7%B2%E7%BB%8F%E5%8E%8C%E5%80%A6%E4%BA%86%E4%BD%A0%E8%BF%99%E6%A0%B7%E8%AF%B4%E8%AF%B4%E8%80%8C%E5%B7%B2%E7%9A%84%E6%8A%8A%E6%88%8F%EF%BC%8C%E6%88%91%E8%A7%89%E5%BE%97%E5%B0%B1%E7%AE%97%E6%88%91%E5%91%8A%E8%AF%89%E4%BD%A0%E5%A6%82%E4%BD%95%E5%8E%BB%E5%81%9A%EF%BC%8C%E4%BD%A0%E4%B9%9F%E4%B8%8D%E4%BC%9A%E7%85%A7%E5%81%9A%EF%BC%8C%E5%9B%A0%E4%B8%BA%E4%BD%A0%E6%A0%B9%E6%9C%AC%E4%BB%80%E4%B9%88%E9%83%BD%E4%B8%8D%E5%81%9A%E3%80%821111%3C%2Fp%3E', 'upload/aboutus_picture1.jpg', 'upload/aboutus_picture2.jpg', 'upload/aboutus_picture3.jpg');



DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `gender` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系方式',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `yonghuzhanghao` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理用户表';
INSERT INTO `admin`(id, username, password, name, gender, phone, avatarurl, email, role, addtime) VALUES ('1', 'admin', 'b3b72761d8db8c78dd195bcd433f29b97d80c7ecf81dfd54819542bdc706740e', '管理员', '男', '13823888881', 'https://s11.ax1x.com/2024/01/03/pivi45q.png', '132@qq.com', '0', '2024-12-23 13:07:20.0');



DROP TABLE IF EXISTS `claims`;
CREATE TABLE `claims` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adduserid` bigint(20) DEFAULT NULL COMMENT '报销人id',
  `addusername` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报销人',
  `billpicture` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '票据图片',
  `shenhe` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核',
  `shenhehuifu` longtext COLLATE utf8mb4_general_ci COMMENT '审核回复',
  `remark` longtext COLLATE utf8mb4_general_ci COMMENT '报销备注',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871107388048285699 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='报销申请';
INSERT INTO `claims`(id, adduserid, addusername, billpicture, shenhe, shenhehuifu, remark, addtime) VALUES ('1871100690592047106', '1871085253821120513', NULL, 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_56940.jpg', '待审核', NULL, '<p>发沙发沙发沙发</p>', '2024-12-23 15:49:03.0');
INSERT INTO `claims`(id, adduserid, addusername, billpicture, shenhe, shenhehuifu, remark, addtime) VALUES ('1871101035120566273', '1871085253821120513', 'user001', 'api/upload/010571200093b0e2k0C83_R_1600_10000_57021.jpg', '待审核', NULL, '<p>撒发生发生发顺丰</p>', '2024-12-23 15:50:25.0');
INSERT INTO `claims`(id, adduserid, addusername, billpicture, shenhe, shenhehuifu, remark, addtime) VALUES ('1871107388048285698', '1871106715407753217', 'user002', 'api/upload/100m0c00000061oe1E63F_C_1600_1200_58536.jpg', '待审核', NULL, '<p>发撒发生法术法</p>', '2024-12-23 16:15:39.0');



DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配置参数值',
  `addtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871106634478657539 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';
INSERT INTO `config`(id, name, value, addtime) VALUES ('1871106601528205314', '1lo6b12000bf645668B87_R_1600_10000.jpg', 'api/upload/1lo6b12000bf645668B87_R_1600_10000_58351.jpg', '2024-12-23 16:12:32.0');
INSERT INTO `config`(id, name, value, addtime) VALUES ('1871106616954855426', '1lo0312000bf644srF569_R_1600_10000.jpg', 'api/upload/1lo0312000bf644srF569_R_1600_10000_58355.jpg', '2024-12-23 16:12:36.0');
INSERT INTO `config`(id, name, value, addtime) VALUES ('1871106634478657538', '0102c1200093ln916B003_R_1600_10000.jpg', 'api/upload/0102c1200093ln916B003_R_1600_10000_58359.jpg', '2024-12-23 16:12:40.0');



DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss` (
  `id` bigint(20) NOT NULL,
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '头像',
  `nickname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '用户名',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '评论内容',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父id',
  `likes_count` int(11) DEFAULT NULL COMMENT '点赞数量',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='评论表';
INSERT INTO `discuss`(id, refid, userid, avatarurl, nickname, content, parent_id, likes_count, create_time) VALUES ('1871107577534357506', '1871107232527687682', '1871106715407753217', NULL, 'cus', '1111', NULL, '0', '2024-12-23 16:16:25.0');
INSERT INTO `discuss`(id, refid, userid, avatarurl, nickname, content, parent_id, likes_count, create_time) VALUES ('1871107623646535682', '1871073414048481298', '1871106715407753217', NULL, 'cus', '123', NULL, '0', '2024-12-23 16:16:36.0');



DROP TABLE IF EXISTS `image_content`;
CREATE TABLE `image_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片消息ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片存储路径',
  `file_id` bigint(20) unsigned DEFAULT NULL COMMENT '文件ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_image_content_file_id` (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS `informationss`;
CREATE TABLE `informationss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资料名称',
  `photo` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资料图片',
  `files` longtext COLLATE utf8mb4_general_ci COMMENT '资料文件',
  `shenhe` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核',
  `detail` longtext COLLATE utf8mb4_general_ci COMMENT '资料简介',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `addusername` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `adduserid` bigint(20) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871107232527687683 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='资料';
INSERT INTO `informationss`(id, name, photo, files, shenhe, detail, addtime, addusername, adduserid) VALUES ('1871100025882943489', '分类1', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_56776.jpg', '{"id":"1871100014394744833","name":"Excel证书模版下载.xlsx","url":"api/upload/Excel证书模版下载_56781.xlsx","size":"9660","platform":"LOCAL"}', '同意', '阿是发生发顺丰', '2024-12-23 15:46:24.0', NULL, '1871085253821120513');
INSERT INTO `informationss`(id, name, photo, files, shenhe, detail, addtime, addusername, adduserid) VALUES ('1871106805182636034', 'guanliyuan', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_58394.jpg', '{"id":"1871106799188975618","name":"Excel证书模版下载.xlsx","url":"api/upload/Excel证书模版下载_58399.xlsx","size":"9660","platform":"LOCAL"}', '通过', 'fasfasf', '2024-12-23 16:13:21.0', '管理员', '1');
INSERT INTO `informationss`(id, name, photo, files, shenhe, detail, addtime, addusername, adduserid) VALUES ('1871107232527687682', 'yonghu1', 'api/upload/1mc6812000aqoxf1u1773_W_1080_808_R5_D_58493.jpg', '{"id":"1871107223031783425","name":"简历.docx","url":"api/upload/简历_58500.docx","size":"10225","platform":"LOCAL"}', '同意', '发生发顺丰', '2024-12-23 16:15:02.0', 'user002', '1871106715407753217');



DROP TABLE IF EXISTS `itemapplication`;
CREATE TABLE `itemapplication` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用品名称',
  `adduserid` bigint(20) DEFAULT NULL COMMENT '申领人id',
  `addusername` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申领人',
  `photo` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用品封面',
  `shenhe` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核',
  `instructionsforuse` longtext COLLATE utf8mb4_general_ci COMMENT '使用说明',
  `returntime` timestamp NULL DEFAULT NULL COMMENT '归还时间',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shenheid` bigint(20) DEFAULT NULL COMMENT '用品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871107609000026115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='物品申领';
INSERT INTO `itemapplication`(id, name, adduserid, addusername, photo, shenhe, instructionsforuse, returntime, addtime, shenheid) VALUES ('1871101166821711874', '名称5', '1871085253821120513', 'user001', 'https://img1.baidu.com/it/u=2118051393,2778967919&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', NULL, NULL, NULL, '2024-12-23 15:50:56.0', '1871073414048481298');
INSERT INTO `itemapplication`(id, name, adduserid, addusername, photo, shenhe, instructionsforuse, returntime, addtime, shenheid) VALUES ('1871107609000026114', '名称5', '1871106715407753217', 'user002', 'https://img1.baidu.com/it/u=2118051393,2778967919&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '待审核', NULL, NULL, '2024-12-23 16:16:32.0', '1871073414048481298');



DROP TABLE IF EXISTS `leavess`;
CREATE TABLE `leavess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shenhe` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核',
  `reasonforleave` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请假理由',
  `photo` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '封面',
  `leavetime` timestamp NULL DEFAULT NULL COMMENT '请假时间',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `addusername` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请假人',
  `adduserid` bigint(20) DEFAULT NULL COMMENT '请假人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871107440196067331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='请假';
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444878831948', '审核1', '请假理由1', 'https://img0.baidu.com/it/u=2270376806,4081867958&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444878831981', '审核9', '请假理由9', 'https://img2.baidu.com/it/u=1284324432,4185670359&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=800', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444878832484', '审核10', '请假理由10', 'https://img0.baidu.com/it/u=2853202857,2212891142&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444878834248', '审核6', '请假理由6', 'https://img1.baidu.com/it/u=91650533,1426798376&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444878835413', '审核3', '请假理由3', 'https://img1.baidu.com/it/u=2178644570,1665326013&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444878838183', '审核4', '请假理由4', 'https://img1.baidu.com/it/u=3698092765,403769329&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444878840028', '审核2', '请假理由2', 'https://img0.baidu.com/it/u=68881004,1956002262&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444878840102', '审核7', '请假理由7', 'https://img0.baidu.com/it/u=1026026620,1467286302&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444878840315', '审核8', '请假理由8', 'https://img2.baidu.com/it/u=2332729894,3542943281&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=800', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444878840691', '审核5', '请假理由5', 'https://img0.baidu.com/it/u=2424567408,950570388&fm=253&fmt=auto&app=120&f=JPEG?w=504&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444883029993', '审核12', '请假理由12', 'https://img0.baidu.com/it/u=1690076377,4003691410&fm=253&fmt=auto&app=120&f=JPEG?w=507&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444883030001', '审核13', '请假理由13', 'https://img0.baidu.com/it/u=477832104,1920960473&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444883030539', '审核11', '请假理由11', 'https://img1.baidu.com/it/u=16610762,29876562&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444883030930', '审核18', '请假理由18', 'https://img1.baidu.com/it/u=2264207564,2939741236&fm=253&fmt=auto&app=120&f=JPEG?w=506&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444883032921', '审核19', '请假理由19', 'https://img2.baidu.com/it/u=3430573398,3778447547&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444883033052', '审核17', '请假理由17', 'https://img2.baidu.com/it/u=2657995002,1757016524&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=505', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444883034059', '审核20', '请假理由20', 'https://img2.baidu.com/it/u=3671824559,14797900&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444883034516', '审核14', '请假理由14', 'https://img1.baidu.com/it/u=2733974927,306366138&fm=253&fmt=auto&app=120&f=JPEG?w=510&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444883034750', '审核15', '请假理由15', 'https://img2.baidu.com/it/u=2874337484,3995335822&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871060444883034824', '审核16', '请假理由16', 'https://img2.baidu.com/it/u=3343447968,2427214618&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '2024-12-23 13:09:07.0', '2024-12-23 13:09:07.0', NULL, NULL);
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871101129832144898', '待审核', '<p>发沙发沙发沙发</p>', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_57043.jpg', '2024-12-31 00:00:00.0', '2024-12-23 15:50:47.0', 'user001', '1871085253821120513');
INSERT INTO `leavess`(id, shenhe, reasonforleave, photo, leavetime, addtime, addusername, adduserid) VALUES ('1871107440196067330', '待审核', '<p>发撒发生法术法</p>', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_58547.jpg', '2024-12-23 00:00:00.0', '2024-12-23 16:15:52.0', 'user002', '1871106715407753217');



DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `from_id` bigint(20) unsigned NOT NULL COMMENT '发送方用户ID',
  `to_id` bigint(20) unsigned NOT NULL COMMENT '接收方用户ID',
  `type` tinyint(3) unsigned NOT NULL COMMENT '消息类型(0 ~ 255)，私聊(0)/群聊(1)消息',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT '消息内容类型，文本(0)/图片(1)/文件(2)',
  `content_id` bigint(20) unsigned NOT NULL COMMENT '消息内容ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息发送时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `avatarurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_message_from_id` (`from_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871107744236969986 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
INSERT INTO `message`(id, from_id, to_id, type, content_type, content_id, create_time, update_time, username, avatarurl) VALUES ('1871107699609575425', '1', '1871106715407753217', '0', '0', '1871107699282419713', '2024-12-23 16:16:53.0', '2024-12-23 16:16:53.0', '管理员', 'https://s11.ax1x.com/2024/01/03/pivi45q.png');
INSERT INTO `message`(id, from_id, to_id, type, content_type, content_id, create_time, update_time, username, avatarurl) VALUES ('1871107728537690114', '1871106715407753217', '1', '0', '0', '1871107728407666690', '2024-12-23 16:17:00.0', '2024-12-23 16:17:00.0', 'cus', '');
INSERT INTO `message`(id, from_id, to_id, type, content_type, content_id, create_time, update_time, username, avatarurl) VALUES ('1871107744236969985', '1', '1871106715407753217', '0', '0', '1871107744169861121', '2024-12-23 16:17:04.0', '2024-12-23 16:17:04.0', '管理员', 'https://s11.ax1x.com/2024/01/03/pivi45q.png');



DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1729061975584571394 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告信息';
INSERT INTO `news`(id, addtime, title, introduction, picture, content) VALUES ('93', '2024-12-23 13:07:21.0', '人生，没有永远的伤痛', '人生，没有永远的伤痛，再深的痛，在切之时，伤口总会痊愈。人生，没有过不去的坎，你不可以坐在坎边等它消失，你只能想办法穿过它。人生，没有永远的爱情，没有结局的感情，总要结束；不能拥有的人，总会忘记', 'https://s11.ax1x.com/2024/01/03/pivifVs.png', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');
INSERT INTO `news`(id, addtime, title, introduction, picture, content) VALUES ('94', '2024-12-23 13:07:21.0', '所有的努力都不会完全白费', '21.所有的努力都不会完全白费，你付出多少时间和精力，都是在对未来的积累。世界上什么都不公平，唯独时间最公平，你是懒惰还是努力，时间都会给出结果。', 'https://s11.ax1x.com/2024/01/03/pivi45q.png', '<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>	“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p>凡事皆以平常心来看待，对于生命顺逆不要太执著。能够“破我执”是很高层的人生境界。</p><p>人事的艰难就是一种考验。就像—支剑要有磨刀来磨，剑才会利:一块璞玉要有粗石来磨，才会发出耀眼的光芒。我们能够做到的，只是如何减少、避免那些由于自身的原因所造成的挫折，而在遇到痛苦和挫折之后，则力求化解痛苦，争取幸福。我们要知道，痛苦和挫折是双重性的，它既是我们人生中难以完全避免的，也是我们在争取成功时，不可缺少的一种动力。因为我认为，推动我们奋斗的力量，不仅仅是对成功的渴望，还有为摆脱痛苦和挫折而进行的奋斗。</p>');
INSERT INTO `news`(id, addtime, title, introduction, picture, content) VALUES ('95', '2024-12-23 13:07:21.0', '人生，没有过不去的坎', '19.人生，没有过不去的坎，你不可以坐在坎边等它消失，你只能想办法穿过它；人生，没有永远的伤痛，再深的痛，伤口总会痊愈；人生，没有永远的爱情，没有结局的感情，总要结束；不能拥有的人，总会忘记。慢慢地，你不会再流泪；慢慢地，一切都过去了，适当的放弃，是人生优雅的转身。', 'https://s11.ax1x.com/2024/01/03/piviIP0.png', '<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>	不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>	有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p><p>不过又能怎么样呢，未来始终是自己的，梦想始终是自己的，没有人会来帮你实现它。</p><p>也许很多时候我们只是需要朋友的一句鼓励，一句安慰，却也得不到。但是相信我，世界上还有很多人，只是想要和你说说话。</p><p>因为我们都一样。一样的被人说成固执，一样的在追逐他们眼里根本不在意的东西。</p><p>所以，又有什么关系呢，别人始终不是你、不能懂你的心情，你又何必多去解释呢。这个世界会来阻止你，困难也会接踵而至，其实真正关键的只有自己，有没有那个倔强。</p><p>这个世界上没有不带伤的人，真正能治愈自己的，只有自己。</p>');



DROP TABLE IF EXISTS `officesupplies`;
CREATE TABLE `officesupplies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `clicknum` int(11) DEFAULT NULL COMMENT '点击量',
  `name` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `brand` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '品牌',
  `size` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '尺寸',
  `material` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '材质',
  `functionaldescription` longtext COLLATE utf8mb4_general_ci COMMENT '功能描述',
  `usagescenarios` longtext COLLATE utf8mb4_general_ci COMMENT '使用场景',
  `photo` longtext COLLATE utf8mb4_general_ci COMMENT '封面',
  `photos` longtext COLLATE utf8mb4_general_ci COMMENT '详情图',
  `details` longtext COLLATE utf8mb4_general_ci COMMENT '详情信息',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871073414048491126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='办公用品';
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048481298', '743', '名称5', '品牌5', '尺寸5', '材质5', '功能描述5', '使用场景5', 'https://img1.baidu.com/it/u=2118051393,2778967919&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', NULL, '详情信息5', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048481610', '414', '名称1', '品牌1', '尺寸1', '材质1', '功能描述1', '使用场景1', 'https://img2.baidu.com/it/u=2785664487,1566562382&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1578', NULL, '详情信息1', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048481873', '305', '名称19', '品牌19', '尺寸19', '材质19', '功能描述19', '使用场景19', 'https://img1.baidu.com/it/u=3063422636,2241666409&fm=253&fmt=auto&app=138&f=JPEG?w=363&h=309', NULL, '详情信息19', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048484123', '681', '名称3', '品牌3', '尺寸3', '材质3', '功能描述3', '使用场景3', 'https://img2.baidu.com/it/u=984392024,2172939882&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', NULL, '详情信息3', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048484687', '366', '名称7', '品牌7', '尺寸7', '材质7', '功能描述7', '使用场景7', 'https://img2.baidu.com/it/u=3684023234,2498032201&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=375', NULL, '详情信息7', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048485246', '795', '名称16', '品牌16', '尺寸16', '材质16', '功能描述16', '使用场景16', 'https://img0.baidu.com/it/u=1288165205,3153130912&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=800', NULL, '详情信息16', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048485626', '49', '名称11', '品牌11', '尺寸11', '材质11', '功能描述11', '使用场景11', 'https://img2.baidu.com/it/u=1487489421,3110796988&fm=253&fmt=auto&app=138&f=JPEG?w=599&h=500', NULL, '详情信息11', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048485823', '67', '名称20', '品牌20', '尺寸20', '材质20', '功能描述20', '使用场景20', 'https://img2.baidu.com/it/u=1657924191,1098300250&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', NULL, '详情信息20', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048486795', '638', '名称18', '品牌18', '尺寸18', '材质18', '功能描述18', '使用场景18', 'https://img1.baidu.com/it/u=1844039013,2117981417&fm=253&fmt=auto&app=138&f=PNG?w=766&h=408', NULL, '详情信息18', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048486958', '16', '名称17', '品牌17', '尺寸17', '材质17', '功能描述17', '使用场景17', 'https://img2.baidu.com/it/u=495295989,884633519&fm=253&fmt=auto&app=138&f=JPG?w=501&h=500', NULL, '详情信息17', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048487754', '266', '名称14', '品牌14', '尺寸14', '材质14', '功能描述14', '使用场景14', 'https://img1.baidu.com/it/u=1837183785,2569714091&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=600', NULL, '详情信息14', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048487764', '338', '名称4', '品牌4', '尺寸4', '材质4', '功能描述4', '使用场景4', 'https://img1.baidu.com/it/u=513986627,2677290662&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', NULL, '详情信息4', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048488630', '857', '名称15', '品牌15', '尺寸15', '材质15', '功能描述15', '使用场景15', 'https://img2.baidu.com/it/u=250480451,3909587236&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', NULL, '详情信息15', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048489225', '425', '名称13', '品牌13', '尺寸13', '材质13', '功能描述13', '使用场景13', 'https://img0.baidu.com/it/u=4211091941,1004631242&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', '["api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_58414.jpg","api/upload/01046120004gesr5x9B21_R_1600_10000_58418.jpg"]', '<p>详情信息13</p>', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048489326', '684', '名称12', '品牌12', '尺寸12', '材质12', '功能描述12', '使用场景12', 'https://img1.baidu.com/it/u=3478911619,3239418448&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', NULL, '详情信息12', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048489605', '231', '名称8', '品牌8', '尺寸8', '材质8', '功能描述8', '使用场景8', 'https://img1.baidu.com/it/u=2173611054,3022263903&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', NULL, '详情信息8', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048489997', '403', '名称2', '品牌2', '尺寸2', '材质2', '功能描述2', '使用场景2', 'https://img1.baidu.com/it/u=3731439004,1406311695&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=863', NULL, '详情信息2', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048490177', '913', '名称6', '品牌6', '尺寸6', '材质6', '功能描述6', '使用场景6', 'https://img0.baidu.com/it/u=2548376249,647782404&fm=253&fmt=auto&app=138&f=JPEG?w=441&h=392', NULL, '详情信息6', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048490450', '657', '名称9', '品牌9', '尺寸9', '材质9', '功能描述9', '使用场景9', 'https://img0.baidu.com/it/u=1436569856,519729859&fm=253&fmt=auto&app=138&f=JPEG?w=824&h=800', NULL, '详情信息9', '2024-12-23 14:00:39.0');
INSERT INTO `officesupplies`(id, clicknum, name, brand, size, material, functionaldescription, usagescenarios, photo, photos, details, addtime) VALUES ('1871073414048491125', '111', '名称10', '品牌10', '尺寸10', '材质10', '功能描述10', '使用场景10', 'http://t13.baidu.com/it/u=3697388996,3814641646&fm=224&app=112&f=JPEG?w=500&h=500', NULL, '详情信息10', '2024-12-23 14:00:39.0');



DROP TABLE IF EXISTS `postcategories`;
CREATE TABLE `postcategories` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `addtime` datetime DEFAULT NULL COMMENT '创建时间',
  `userid` bigint(20) DEFAULT NULL COMMENT '创建人',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名字',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='帖子话题分类';
INSERT INTO `postcategories`(id, addtime, userid, username, category_name) VALUES ('1727991403442307074', '2024-12-23 13:07:21.0', '2', 'admin1', '啦啦啦la');
INSERT INTO `postcategories`(id, addtime, userid, username, category_name) VALUES ('1727992664430444546', '2024-12-23 13:07:21.0', '2', 'admin1', 'qqqqll');
INSERT INTO `postcategories`(id, addtime, userid, username, category_name) VALUES ('1727993431035969538', '2024-12-23 13:07:21.0', '2', 'admin1', 'hhhh');



DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `category_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '话题分类',
  `posting_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发帖地址',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '封面',
  `post_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '帖子标题',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `is_published` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否发布(Y/N)',
  `is_approved` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否审核通过(Y/N)',
  `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发帖人',
  `addtime` datetime DEFAULT NULL COMMENT '创建时间',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发帖人名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='帖子详情';
INSERT INTO `posts`(id, category_id, posting_address, picture, post_title, post_content, is_published, is_approved, userid, addtime, username) VALUES ('1729390431694393345', 'qqqqll', '["上海","徐汇区","湖南路街道"]', 'https://s11.ax1x.com/2024/01/03/piviIP0.png', 'qq', '%3Cp%3Eaaa%3C%2Fp%3E', 'N', NULL, '1', '2024-12-23 13:07:21.0', 'admin');



DROP TABLE IF EXISTS `qiandaoqiantui`;
CREATE TABLE `qiandaoqiantui` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) DEFAULT NULL COMMENT '员工id',
  `username` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '员工姓名',
  `status` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '签到/签退',
  `qiandaotime` timestamp NULL DEFAULT NULL COMMENT '签到时间',
  `qiantuitime` timestamp NULL DEFAULT NULL COMMENT '签退时间',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871107118195154946 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='签到签退';
INSERT INTO `qiandaoqiantui`(id, userid, username, status, qiandaotime, qiantuitime, addtime) VALUES ('1871103349050974209', '1871085253821120513', 'kai1', '签到', '2024-12-23 15:59:35.0', NULL, '2024-12-23 15:59:37.0');
INSERT INTO `qiandaoqiantui`(id, userid, username, status, qiandaotime, qiantuitime, addtime) VALUES ('1871103388326436865', '1871085253821120513', 'kai1', '签到', '2024-12-23 15:59:44.0', NULL, '2024-12-23 15:59:46.0');
INSERT INTO `qiandaoqiantui`(id, userid, username, status, qiandaotime, qiantuitime, addtime) VALUES ('1871107118195154945', '1871106715407753217', 'cus', '签到', '2024-12-23 16:14:34.0', NULL, '2024-12-23 16:14:35.0');



DROP TABLE IF EXISTS `salariess`;
CREATE TABLE `salariess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `employeeid` bigint(20) DEFAULT NULL COMMENT '员工id',
  `employeename` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '员工名称',
  `monthes` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '月份',
  `salary` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '薪资',
  `remarks` longtext COLLATE utf8mb4_general_ci COMMENT '备注',
  `fiveinsurances` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '五险',
  `onegold` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '一金',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871106961630175234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='薪资';
INSERT INTO `salariess`(id, employeeid, employeename, monthes, salary, remarks, fiveinsurances, onegold, addtime) VALUES ('1871098265906847746', '1871085253821120513', 'kai1', '5月', '2000', '发生发顺丰', '500', '200', '2024-12-23 15:39:25.0');
INSERT INTO `salariess`(id, employeeid, employeename, monthes, salary, remarks, fiveinsurances, onegold, addtime) VALUES ('1871106961630175233', '1871106715407753217', 'cus', '5月', '5000', 'fsafasf', '500', '200', '2024-12-23 16:13:58.0');



DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) NOT NULL COMMENT '关联id',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片',
  `type` int(200) NOT NULL DEFAULT '1' COMMENT '类型(-1:踩,1:浏览,2:关注,3:收藏,4:点赞,5:喜欢)',
  `inteltype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1730069355965353987 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏表';



DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '附件名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '附件地址',
  `size` bigint(20) DEFAULT NULL COMMENT '附件大小',
  `platform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '存储平台',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='附件管理';
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871099306513670145', '1lo6b12000bf645668B87_R_1600_10000.jpg', 'api/upload/1lo6b12000bf645668B87_R_1600_10000_56612.jpg', '159516', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871099613461225473', '100m0c00000061oe1E63F_C_1600_1200.jpg', 'api/upload/100m0c00000061oe1E63F_C_1600_1200_56685.jpg', '78923', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871099993519693826', '0101o1200093lnr10DA18_R_1600_10000.jpg', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_56776.jpg', '247269', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871100014394744833', 'Excel证书模版下载.xlsx', 'api/upload/Excel证书模版下载_56781.xlsx', '9660', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871100679842045954', '1mc4x12000ceugxl13772_W_1080_808_R5_D.jpg', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_56940.jpg', '144533', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871101021321306114', '010571200093b0e2k0C83_R_1600_10000.jpg', 'api/upload/010571200093b0e2k0C83_R_1600_10000_57021.jpg', '340614', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871101113210118146', '0101o1200093lnr10DA18_R_1600_10000.jpg', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_57043.jpg', '247269', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871106601259769858', '1lo6b12000bf645668B87_R_1600_10000.jpg', 'api/upload/1lo6b12000bf645668B87_R_1600_10000_58351.jpg', '159516', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871106616829026305', '1lo0312000bf644srF569_R_1600_10000.jpg', 'api/upload/1lo0312000bf644srF569_R_1600_10000_58355.jpg', '377673', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871106634344439810', '0102c1200093ln916B003_R_1600_10000.jpg', 'api/upload/0102c1200093ln916B003_R_1600_10000_58359.jpg', '214149', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871106778653663234', '0101o1200093lnr10DA18_R_1600_10000.jpg', 'api/upload/0101o1200093lnr10DA18_R_1600_10000_58394.jpg', '247269', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871106799188975618', 'Excel证书模版下载.xlsx', 'api/upload/Excel证书模版下载_58399.xlsx', '9660', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871106865232486402', '1mc4x12000ceugxl13772_W_1080_808_R5_D.jpg', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_58414.jpg', '144533', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871106882496241666', '01046120004gesr5x9B21_R_1600_10000.jpg', 'api/upload/01046120004gesr5x9B21_R_1600_10000_58418.jpg', '259808', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871107193520660481', '1mc6812000aqoxf1u1773_W_1080_808_R5_D.jpg', 'api/upload/1mc6812000aqoxf1u1773_W_1080_808_R5_D_58493.jpg', '106671', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871107223031783425', '简历.docx', 'api/upload/简历_58500.docx', '10225', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871107346017165314', '350l190000017cba4A783_C_1600_1200.jpg', 'api/upload/350l190000017cba4A783_C_1600_1200_58529.jpg', '163632', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871107376870465538', '100m0c00000061oe1E63F_C_1600_1200.jpg', 'api/upload/100m0c00000061oe1E63F_C_1600_1200_58536.jpg', '78923', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871107423439822850', '1mc4x12000ceugxl13772_W_1080_808_R5_D.jpg', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_58547.jpg', '144533', 'LOCAL', NULL, NULL);
INSERT INTO `sys_attachment`(id, name, url, size, platform, creator, create_time) VALUES ('1871107802781065217', '1mc4x12000ceugxl13772_W_1080_808_R5_D.jpg', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_58638.jpg', '144533', 'LOCAL', NULL, NULL);



DROP TABLE IF EXISTS `systemintro`;
CREATE TABLE `systemintro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '副标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `picture1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片1',
  `picture2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片2',
  `picture3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='关于我们';
INSERT INTO `systemintro`(id, addtime, title, subtitle, content, picture1, picture2, picture3) VALUES ('1', '2024-12-23 13:07:22.0', '系统简介', 'SYSTEM INTRODUCTION', '当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。', 'upload/systemintro_picture1.jpg', 'https://s11.ax1x.com/2024/01/03/pivi45q.png', 'https://s11.ax1x.com/2024/01/03/piviIP0.png');



DROP TABLE IF EXISTS `text_content`;
CREATE TABLE `text_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '文本消息ID',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文本消息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871107744169861122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
INSERT INTO `text_content`(id, content, create_time, update_time) VALUES ('1871107699282419713', '1111', '2024-12-23 16:16:53.0', '2024-12-23 16:16:53.0');
INSERT INTO `text_content`(id, content, create_time, update_time) VALUES ('1871107728407666690', '32323', '2024-12-23 16:17:00.0', '2024-12-23 16:17:00.0');
INSERT INTO `text_content`(id, content, create_time, update_time) VALUES ('1871107744169861121', '3233', '2024-12-23 16:17:04.0', '2024-12-23 16:17:04.0');



DROP TABLE IF EXISTS `tousufankui`;
CREATE TABLE `tousufankui` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '投诉原因',
  `photo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '投诉照片',
  `detail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '投诉简介',
  `details` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '投诉详情',
  `userid` bigint(20) DEFAULT NULL COMMENT '投诉人id',
  `username` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '投诉人名字',
  `status` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '投诉状态',
  `fankuijieguo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '反馈结果',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1743547502863691779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='投诉反馈';



DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '3' COMMENT '角色',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `avatarurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871106715407753218 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';
INSERT INTO `user`(id, username, password, role, name, avatarurl, phone, email, addtime, money) VALUES ('1871085253821120513', 'user001', 'b3b72761d8db8c78dd195bcd433f29b97d80c7ecf81dfd54819542bdc706740e', '10', 'kai1', NULL, '13444444444', '1432442018@qq.com', '2024-12-23 14:47:42.0', '0');
INSERT INTO `user`(id, username, password, role, name, avatarurl, phone, email, addtime, money) VALUES ('1871106715407753217', 'user002', 'b3b72761d8db8c78dd195bcd433f29b97d80c7ecf81dfd54819542bdc706740e', '10', 'cus', 'api/upload/1mc4x12000ceugxl13772_W_1080_808_R5_D_58638.jpg', '13444444444', '1432442018@qq.com', '2024-12-23 16:12:59.0', '0.0');



DROP TABLE IF EXISTS `workplan`;
CREATE TABLE `workplan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作标题',
  `workcontent` longtext COLLATE utf8mb4_general_ci COMMENT '工作内容',
  `tasktype` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务类型',
  `nameofpersonincharge` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人名称',
  `priority` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '优先级',
  `starttime` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `planningduration` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '计划时长',
  `completionprogress` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '完成进度',
  `jobcover` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作封面',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `addusername` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `adduserid` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `shenhe` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1871107349250973699 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='工作计划';
INSERT INTO `workplan`(id, name, workcontent, tasktype, nameofpersonincharge, priority, starttime, planningduration, completionprogress, jobcover, addtime, addusername, adduserid, shenhe) VALUES ('1871099310959632385', '每日计划', '<p>萨法师范那萨弗拉斯你疯啦赛诺菲来拿算法逻辑那算啦放哪瑟拉娜发啦收纳发啦蓝色法兰式家乐福那孙丽娜·1辽宁快乐发十年老粉那山卡拉放哪离开你舒服了那是否</p>', 'f', 'sffasf', '高', '2024-12-23 00:00:00.0', '120', '53', 'api/upload/1lo6b12000bf645668B87_R_1600_10000_56612.jpg', '2024-12-23 15:43:34.0', NULL, NULL, '待审核');
INSERT INTO `workplan`(id, name, workcontent, tasktype, nameofpersonincharge, priority, starttime, planningduration, completionprogress, jobcover, addtime, addusername, adduserid, shenhe) VALUES ('1871099632633389058', '每日计划', '<p>safasfasf</p>', 'f', 'sffasf', '低', '2024-12-24 00:00:00.0', '120', '53', 'api/upload/100m0c00000061oe1E63F_C_1600_1200_56685.jpg', '2024-12-23 15:44:50.0', NULL, NULL, '待审核');
INSERT INTO `workplan`(id, name, workcontent, tasktype, nameofpersonincharge, priority, starttime, planningduration, completionprogress, jobcover, addtime, addusername, adduserid, shenhe) VALUES ('1871099949072654337', '每日计划', '<p>fasfasfasfasfasfasfasfszfsfa谁法师法师</p>', 'f', 'sffasf', '中', '2024-12-25 00:00:00.0', '120', '53', NULL, '2024-12-23 15:46:06.0', NULL, '1871085253821120513', '待审核');
INSERT INTO `workplan`(id, name, workcontent, tasktype, nameofpersonincharge, priority, starttime, planningduration, completionprogress, jobcover, addtime, addusername, adduserid, shenhe) VALUES ('1871107349250973698', '每日计划一', '<p>市司法局搬弄是非久啊是吧飞机吧生发剂把沙发久啊是吧飞机啊是吧飞机萨凡纳设计放哪</p>', 'f', 'sffasf', '高', '2024-12-23 00:00:00.0', '120', '53', 'api/upload/350l190000017cba4A783_C_1600_1200_58529.jpg', '2024-12-23 16:15:30.0', 'user002', '1871106715407753217', '待审核');



SET FOREIGN_KEY_CHECKS = 1;
