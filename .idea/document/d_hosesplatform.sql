/*
Navicat MySQL Data Transfer

Source Server         : sdasdasd
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : d_houseplatform

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-03-27 15:53:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `id` varchar(36) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '活动标题',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `address` varchar(100) DEFAULT NULL COMMENT '活动地址',
  `content` text COMMENT '活动内容',
  `logo` varchar(255) DEFAULT NULL,
  `buildings_id` varchar(36) DEFAULT NULL COMMENT '楼盘编号',
  `agency_id` varchar(36) DEFAULT NULL COMMENT '经销商编号',
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activity_buildings_id` (`buildings_id`),
  KEY `fk_activity_agency_id` (`agency_id`),
  CONSTRAINT `fk_activity_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `t_agency` (`id`),
  CONSTRAINT `fk_activity_buildings_id` FOREIGN KEY (`buildings_id`) REFERENCES `t_buildings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES ('4028ab1061cf96820161cf9dad540002', '11111', '2018-02-26 00:00:00', '2018-02-27 00:00:00', '史诗', '', 'uploads/goods_apply_process_gateway.png', '402880355e7519ca015e751ee39f0001', '402880355e59ac4d015e59ac51560000', '1');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `pwd` varchar(50) NOT NULL COMMENT '密码(md5)',
  `email` varchar(50) DEFAULT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_admin_roleid` (`role_id`),
  CONSTRAINT `FK_admin_roleid` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('7850cc60886411e7a5142c56dc7febbc', '售楼网管理员', '0797-888888', '4QrcOUm6Wau+VuBX8g+IPg==', 'shoulouwang@qq.com', null);

-- ----------------------------
-- Table structure for t_ads
-- ----------------------------
DROP TABLE IF EXISTS `t_ads`;
CREATE TABLE `t_ads` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `title` varchar(50) NOT NULL COMMENT '广告标题',
  `content` varchar(50) NOT NULL COMMENT '广告描述',
  `logo` varchar(500) DEFAULT NULL COMMENT '广告图片路径',
  `ad_url` varchar(500) DEFAULT NULL COMMENT '广告URl路径',
  `show_status` tinyint(4) DEFAULT '0' COMMENT '是否显示',
  `show_order` int(11) DEFAULT NULL COMMENT '显示顺序',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ads
-- ----------------------------

-- ----------------------------
-- Table structure for t_agency
-- ----------------------------
DROP TABLE IF EXISTS `t_agency`;
CREATE TABLE `t_agency` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '经销商名称',
  `email` varchar(50) NOT NULL COMMENT '邮箱，作为登录帐号',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人姓名',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `tel` varchar(15) DEFAULT NULL COMMENT '固定电话',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `logo` varchar(500) DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL COMMENT '简介',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `checked_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `role_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_agency_roleid` (`role_id`),
  CONSTRAINT `FK_agency_roleid` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_agency
-- ----------------------------
INSERT INTO `t_agency` VALUES ('402880355e59ac4d015e59ac51560000', '你爸', '20000@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '老王', '13802266401', '07558147730', '江西啊啊啊啊啊啊啊啊啊', 'uploads/5D (5).png', '', '2017-09-07 08:10:19', '1', '1', 'd715a8c987f411e7a5142c56dc7febbc');
INSERT INTO `t_agency` VALUES ('402880355e59ac4d015e59ac51ca0001', '经销商1', '20001@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '老王', '1380226641', '07558147731', '北京', null, null, '2017-09-07 08:10:19', '0', '1', 'd715a8c987f411e7a5142c56dc7febbc');
INSERT INTO `t_agency` VALUES ('402880355e59ac4d015e59ac51cf0002', '经销商2', '20002@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '老王', '1380226642', '07558147732', '北京', null, null, '2017-09-07 08:10:19', '0', '1', 'd715a8c987f411e7a5142c56dc7febbc');
INSERT INTO `t_agency` VALUES ('402880355e70b5b4015e70b77c7c0000', null, '20006@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', null, '13802266407', null, null, null, null, '2017-09-11 19:33:47', '0', '1', 'd715a8c987f411e7a5142c56dc7febbc');
INSERT INTO `t_agency` VALUES ('40289fc15e6990d7015e699d7f930018', null, '30005@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', null, '13802266402', null, null, null, null, '2017-09-10 10:28:03', '0', '1', 'd715a8c987f411e7a5142c56dc7febbc');

-- ----------------------------
-- Table structure for t_appointment
-- ----------------------------
DROP TABLE IF EXISTS `t_appointment`;
CREATE TABLE `t_appointment` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `app_arrive_time` datetime DEFAULT NULL COMMENT '预约看房时间',
  `arrive_time` datetime DEFAULT NULL COMMENT '真实看房时间',
  `app_status` varchar(20) DEFAULT NULL COMMENT '预约状态',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，激活或冻结',
  `emp_id` varchar(36) DEFAULT NULL COMMENT '员工编号',
  `user_id` varchar(36) DEFAULT NULL COMMENT '员工编号',
  `agency_id` varchar(36) DEFAULT NULL,
  `house_id` varchar(36) DEFAULT NULL COMMENT '户型编号',
  PRIMARY KEY (`id`),
  KEY `fk_app_emp_id` (`emp_id`),
  KEY `fk_app_user_id` (`user_id`),
  KEY `fk_app_agency_id` (`agency_id`),
  KEY `fk_app_house_id` (`house_id`),
  CONSTRAINT `fk_app_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `t_agency` (`id`),
  CONSTRAINT `fk_app_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`),
  CONSTRAINT `fk_app_house_id` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`id`),
  CONSTRAINT `fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_appointment
-- ----------------------------
INSERT INTO `t_appointment` VALUES ('402880355e740d13015e740d18720000', '2017-09-12 11:06:09', '2017-09-24 00:52:49', '1', '2017-09-12 11:06:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e64ac65015e64ad09550000', '402880355e59ac4d015e59ac51560000', '402880355e59ae46015e59ae4b110000');

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `abstracts` varchar(100) NOT NULL COMMENT '文章摘要',
  `content` text NOT NULL COMMENT '文章内容',
  `logo` varchar(500) DEFAULT NULL COMMENT '文章图片路径',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `admin_id` varchar(36) DEFAULT NULL COMMENT '管理员id',
  `type_id` varchar(36) DEFAULT NULL COMMENT '类型id',
  PRIMARY KEY (`id`),
  KEY `fk_article_type_id` (`type_id`),
  CONSTRAINT `fk_article_type_id` FOREIGN KEY (`type_id`) REFERENCES `t_article_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------

-- ----------------------------
-- Table structure for t_article_type
-- ----------------------------
DROP TABLE IF EXISTS `t_article_type`;
CREATE TABLE `t_article_type` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '类别名称',
  `des` varchar(500) DEFAULT NULL COMMENT '类别描述',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article_type
-- ----------------------------

-- ----------------------------
-- Table structure for t_building
-- ----------------------------
DROP TABLE IF EXISTS `t_building`;
CREATE TABLE `t_building` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '楼栋名称',
  `total_floor` int(11) NOT NULL COMMENT '总层数',
  `total_lift` int(11) NOT NULL COMMENT '电梯数',
  `floor_rooms` int(11) NOT NULL COMMENT '每层多少户',
  `total_room` int(11) NOT NULL COMMENT '总户数',
  `created_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `buildings_id` varchar(36) DEFAULT NULL COMMENT '楼盘编号',
  PRIMARY KEY (`id`),
  KEY `fk_building` (`buildings_id`),
  CONSTRAINT `fk_building` FOREIGN KEY (`buildings_id`) REFERENCES `t_buildings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_building
-- ----------------------------
INSERT INTO `t_building` VALUES ('402880355e59aebc015e59aec0fd0000', 'A栋', '10', '2', '4', '200', null, '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_building` VALUES ('402880355e59af74015e59af78280000', 'A栋', '10', '2', '4', '200', null, '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_building` VALUES ('402880355e59b1a4015e59b1a8e40000', 'A栋', '10', '2', '4', '200', null, '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_building` VALUES ('4028ab1061c6b76f0161c6bb42040000', 'AAA3', '10', '1', '3', '30', '2018-02-24 15:33:36', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_building` VALUES ('4028ab1061c6b76f0161c6bbdffc0020', '微微', '10', '1', '1', '10', '2018-02-24 15:34:17', '1', '402880355e75169d015e75175d650000');

-- ----------------------------
-- Table structure for t_buildings
-- ----------------------------
DROP TABLE IF EXISTS `t_buildings`;
CREATE TABLE `t_buildings` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '楼盘名称',
  `area` varchar(50) DEFAULT NULL COMMENT '所属区域',
  `address` varchar(100) DEFAULT NULL,
  `floor_area` double DEFAULT NULL COMMENT '占地面积',
  `building_area` double DEFAULT NULL COMMENT '建筑面积',
  `house_type` varchar(20) DEFAULT NULL COMMENT '房源类型',
  `building_type` varchar(20) DEFAULT NULL COMMENT '建筑类型',
  `latitude` double NOT NULL COMMENT '纬度',
  `longitude` double NOT NULL COMMENT '纬度',
  `avg_price` double NOT NULL COMMENT '楼盘均价',
  `company` varchar(255) DEFAULT NULL COMMENT '开发公司',
  `open_date` date DEFAULT NULL COMMENT '开盘时间',
  `total_rooms` int(11) DEFAULT NULL COMMENT '总套数',
  `reception_address` varchar(100) NOT NULL COMMENT '接待地址',
  `tel` varchar(15) NOT NULL COMMENT '楼盘售楼电话',
  `green_ratio` double DEFAULT NULL COMMENT '绿化率',
  `plot_ratio` double DEFAULT NULL COMMENT '容积率',
  `property_company` varchar(100) DEFAULT NULL COMMENT '物业公司',
  `property_fee` double DEFAULT NULL COMMENT '物业费',
  `car_station` int(11) DEFAULT NULL COMMENT '车位数',
  `traffic` text COMMENT '交通状况',
  `equipments` text COMMENT '周边配套',
  `logo` varchar(500) DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL COMMENT '简介',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `agency_id` varchar(36) DEFAULT NULL COMMENT '经销商id',
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agency_id` (`agency_id`),
  CONSTRAINT `fk_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `t_agency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buildings
-- ----------------------------
INSERT INTO `t_buildings` VALUES ('402880355e59ad56015e59ad5a820000', '地下城', '地下省', '四川', '1000000', '100000000', '地下楼', '高层', '2000.5', '100.5', '13000.5', '蓝翔建筑公司', '2017-09-07', '1005', '赣州章贡区58号大道', '07978843741', '50.5', '30.5', '暂不公开', '0', '1000', '流畅', '无', null, '黑色天堂', '2017-09-07 08:11:27', '0', '402880355e59ac4d015e59ac51560000', null, null);
INSERT INTO `t_buildings` VALUES ('402880355e75169d015e75175d650000', '天上人间', '章贡区', '江西省赣州市', null, '26665.68', '普通住宅', '板楼', '39.912721', '120.5', '12111.5', '江西装修集团', '2021-01-19', '1200', '章贡区58号路', '075581477315', '30.58', '35.58', '暂无', '1000.5', '3000', '流畅', '', 'uploads/5D (22).jpg', '', '2012-09-13 00:00:00', '0', '402880355e59ac4d015e59ac51560000', '', '');
INSERT INTO `t_buildings` VALUES ('402880355e7519ca015e751a1e830000', '花园宝宝', '章贡区', '江西省赣州市', '13335.8', '26665.68', '普通住宅', '板楼', '138.6', '120.5', '12111.5', '江西装修集团', '2021-01-19', '1200', '章贡区58号路', '075581477315', '30.58', '35.58', '暂无', '1000.5', '3000', '流畅', '', 'uploads/5D (22).jpg', '', '2012-09-13 00:00:00', '0', '402880355e59ac4d015e59ac51560000', null, null);
INSERT INTO `t_buildings` VALUES ('402880355e7519ca015e751ee39f0001', '绝望之城', '南康区', '江西赣州市南康', '123456', '123456.5', '商品房', '板楼', '31.2', '552.5', '11112.56', '娃哈哈', '2019-09-17', '1200', '章贡区23路', '07978842135', '50', '20', '无', '123.5', '1235', '流畅', '', 'uploads/5D (7).png', '', '2015-09-23 00:00:00', '0', '402880355e59ac4d015e59ac51560000', null, null);
INSERT INTO `t_buildings` VALUES ('4028ab1061cf96820161cfa515a50003', '娃哈哈', '章贡区', '', null, '11', '普通住宅', '板楼', '11', '11', '111', '', '2018-02-26', '0', '11', '', null, null, '', '0', '0', '', '', 'uploads/leave_process.png', '', null, '0', '402880355e59ac4d015e59ac51560000', '江西省', '赣州市');
INSERT INTO `t_buildings` VALUES ('4028ab1061d507bf0161d50ce0a10000', '爱爱爱', '章贡区', '史诗', null, '1111', '普通住宅', '板楼', '39.952114', '116.414617', '333', '', '2018-02-27', '0', '4566', '', null, null, '', '0', '0', '', '', 'uploads/__drawn_by_ichi_rin__31b72fcd8089cea0fdb552a1eba40e6f.jpg', '', null, '0', '402880355e59ac4d015e59ac51560000', '江西省', '赣州市');

-- ----------------------------
-- Table structure for t_buildings_avgprice
-- ----------------------------
DROP TABLE IF EXISTS `t_buildings_avgprice`;
CREATE TABLE `t_buildings_avgprice` (
  `id` varchar(36) NOT NULL,
  `avg_price` double NOT NULL COMMENT '楼盘均价',
  `recording_time` datetime NOT NULL COMMENT '修改均价的时间',
  `buildings_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_avg_buildings_id` (`buildings_id`),
  CONSTRAINT `fk_avg_buildings_id` FOREIGN KEY (`buildings_id`) REFERENCES `t_buildings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buildings_avgprice
-- ----------------------------
INSERT INTO `t_buildings_avgprice` VALUES ('4028ab1061cf96820161cfa94fe00004', '12111.5', '2018-02-26 09:10:35', '402880355e75169d015e75175d650000');
INSERT INTO `t_buildings_avgprice` VALUES ('4028ab1061cf96820161cfaa65c80005', '12111.5', '2018-02-26 09:11:46', '402880355e75169d015e75175d650000');

-- ----------------------------
-- Table structure for t_buildings_img
-- ----------------------------
DROP TABLE IF EXISTS `t_buildings_img`;
CREATE TABLE `t_buildings_img` (
  `id` varchar(36) NOT NULL,
  `img_path` varchar(500) NOT NULL COMMENT '图片路径',
  `img_des` varchar(50) DEFAULT NULL COMMENT '图片描述',
  `created_time` datetime DEFAULT NULL,
  `buildings_id` varchar(36) DEFAULT NULL COMMENT '楼盘编号',
  PRIMARY KEY (`id`),
  KEY `fk_buildings_id` (`buildings_id`),
  CONSTRAINT `fk_buildings_id` FOREIGN KEY (`buildings_id`) REFERENCES `t_buildings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buildings_img
-- ----------------------------
INSERT INTO `t_buildings_img` VALUES ('4028ab1061cf96820161cfab9da00006', 'uploads/__drawn_by_bison_cangshu__367d5a85041e7ae58f9b9df393be182c.jpg', null, '2018-02-26 09:13:06', '402880355e75169d015e75175d650000');
INSERT INTO `t_buildings_img` VALUES ('4028ab1061cf96820161cfab9dae0007', 'uploads/__drawn_by_happoubi_jin__4b38793c379bec9e98c3eb73930801ee.jpg', null, '2018-02-26 09:13:06', '402880355e75169d015e75175d650000');
INSERT INTO `t_buildings_img` VALUES ('4028ab1061cf96820161cfab9dfc0008', 'uploads/__drawn_by_ichi_rin__31b72fcd8089cea0fdb552a1eba40e6f.jpg', null, '2018-02-26 09:13:06', '402880355e75169d015e75175d650000');
INSERT INTO `t_buildings_img` VALUES ('4028ab1061cf96820161cfab9e2d0009', 'uploads/__drawn_by_mitsuki__8fdb7d742e70dbb0d26135fecb16a090.jpg', null, '2018-02-26 09:13:06', '402880355e75169d015e75175d650000');
INSERT INTO `t_buildings_img` VALUES ('4028ab1061cf96820161cfab9e56000a', 'uploads/__drawn_by_nekonabe_ao__02b55854e34affdcb6578ebfb50452db.jpg', null, '2018-02-26 09:13:06', '402880355e75169d015e75175d650000');
INSERT INTO `t_buildings_img` VALUES ('4028ab1061cf96820161cfab9ea3000b', 'uploads/__drawn_by_uuhui__bbd803818d9ebc8787af79ff1009246b.jpg', null, '2018-02-26 09:13:06', '402880355e75169d015e75175d650000');
INSERT INTO `t_buildings_img` VALUES ('4028ab1061cf96820161cfab9ec4000c', 'uploads/__elphelt_valentine_and_ramlethal_valentine_guilty_gear_and_guilty_gear_xrd_drawn_by_skelefuku__bddd98dde5adb386c79b7b01cb7c6752.png', null, '2018-02-26 09:13:06', '402880355e75169d015e75175d650000');
INSERT INTO `t_buildings_img` VALUES ('4028ab1061cf96820161cfab9ef1000d', 'uploads/__emilia_re_zero_kara_hajimeru_isekai_seikatsu_drawn_by_pakupaku_choppu__f8e5eaa0b10c1c01690cbc8692a16a3c.jpg', null, '2018-02-26 09:13:07', '402880355e75169d015e75175d650000');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `content` text COMMENT '评价内容',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，激活或冻结',
  `buildings_id` varchar(36) DEFAULT NULL COMMENT '楼盘编号',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`),
  KEY `fk_com_buildings_id` (`buildings_id`),
  KEY `fk_com_user_id` (`user_id`),
  CONSTRAINT `fk_com_buildings_id` FOREIGN KEY (`buildings_id`) REFERENCES `t_buildings` (`id`),
  CONSTRAINT `fk_com_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `name` text COMMENT '姓名',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `identity_id` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `customer_type` varchar(20) DEFAULT NULL COMMENT '客户类型',
  `together` varchar(100) DEFAULT NULL,
  `contract` varchar(500) DEFAULT NULL COMMENT '电子版购房合同路径',
  `archives` varchar(500) DEFAULT NULL COMMENT 'zip版电子档案路径',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，激活或冻结',
  `emp_id` varchar(36) DEFAULT NULL COMMENT '员工编号',
  `agency_id` varchar(36) DEFAULT NULL COMMENT '经销商编号',
  PRIMARY KEY (`id`),
  KEY `fk_cus_emp_id` (`emp_id`),
  KEY `fk_cus_agency_id` (`agency_id`),
  CONSTRAINT `fk_cus_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `t_agency` (`id`),
  CONSTRAINT `fk_cus_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('402880355e59b379015e59b37dfc0000', '老王', '男', '2017-09-07', '36072219961027000', '1234560@qq.com', '1380226640', '北海道', '预约客户', '老王，老李', null, 'goods_apply_process.zip', '2017-09-07 08:18:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('402880355e59b379015e59b37e670001', '老王', '男', '2017-09-07', '36072219961027001', '1234561@qq.com', '1380226641', '北海道', '预约客户', '老王，老李', null, null, '2017-09-07 08:18:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('402880355e59b379015e59b37e6b0002', '老王', '男', '2017-09-07', '36072219961027002', '1234562@qq.com', '1380226642', '北海道', '预约客户', '老王，老李', null, null, '2017-09-07 08:18:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('402880355e59b379015e59b37e6f0003', '老王', '男', '2017-09-07', '36072219961027003', '1234563@qq.com', '1380226643', '北海道', '预约客户', '老王，老李', null, null, '2017-09-07 08:18:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('402880355e59b379015e59b37e740004', '老王', '男', '2017-09-07', '36072219961027004', '1234564@qq.com', '1380226644', '北海道', '预约客户', '老王，老李', null, null, '2017-09-07 08:18:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('402880355e59b379015e59b37e790005', '老王', '男', '2017-09-07', '36072219961027005', '1234565@qq.com', '1380226645', '北海道', '预约客户', '老王，老李', null, null, '2017-09-07 08:18:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('402880355e59b379015e59b37e7b0006', '老王', '男', '2017-09-07', '36072219961027006', '1234566@qq.com', '1380226646', '北海道', '预约客户', '老王，老李', null, null, '2017-09-07 08:18:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('402880355e59b379015e59b37e7e0007', '老王', '男', '2017-09-07', '36072219961027007', '1234567@qq.com', '1380226647', '北海道', '预约客户', '老王，老李', null, null, '2017-09-07 08:18:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('402880355e59b379015e59b37e810008', '老王', '男', '2017-09-07', '36072219961027008', '1234568@qq.com', '1380226648', '北海道', '预约客户', '老王，老李', null, null, '2017-09-07 08:18:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('402880355e59b379015e59b37e840009', '老王', '男', '2017-09-07', '36072219961027009', '1234569@qq.com', '1380226649', '北海道', '预约客户', '老王，老李', null, null, '2017-09-07 08:18:09', '1', '402880355e59b2b0015e59b2b4e00000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('402880355e59bd15015e59bd19f50000', '老王', '男', '2017-09-07', '36072219961027000', '1234560@qq.com', '1380226640', '北海道', '预约客户', '老王，老李', null, null, '2017-09-07 08:28:39', '0', '402880355e59bca2015e59bca6a10000', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_customer` VALUES ('4028ab1061c6b76f0161c6c279050033', '213', '男', '2018-02-05', '360733198510110056', '5666@qq.com', '18338022407', '', '预约客户', '', null, null, '2018-02-24 15:41:29', '0', null, '402880355e59ac4d015e59ac51560000');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pwd` varchar(255) NOT NULL DEFAULT '4QrcOUm6Wau+VuBX8g+IPg==' COMMENT '员工初始化默认密码',
  `phone` varchar(11) NOT NULL COMMENT '手机号登录',
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `exp` varchar(50) DEFAULT NULL COMMENT '工作经验',
  `des` varchar(100) DEFAULT NULL COMMENT '个人说明',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `basic_salary` double NOT NULL COMMENT '基本工资',
  `headicon` varchar(500) DEFAULT NULL COMMENT '设置一个默认头像',
  `intro` varchar(500) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `agency_id` varchar(36) DEFAULT NULL COMMENT '员工所属经销商',
  `buildings_id` varchar(36) DEFAULT NULL COMMENT '负责楼盘',
  `role_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_employee_agency_id` (`agency_id`),
  KEY `fk_employee_buildings_id` (`buildings_id`),
  KEY `FK_emp_roleid` (`role_id`),
  CONSTRAINT `FK_emp_roleid` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `fk_employee_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `t_agency` (`id`),
  CONSTRAINT `fk_employee_buildings_id` FOREIGN KEY (`buildings_id`) REFERENCES `t_buildings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('402880355e59b2b0015e59b2b4e00000', '老黄', '120086@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '13664077258', null, null, null, null, null, null, '1200', null, null, null, '1', '402880355e59ac4d015e59ac51560000', '402880355e59ad56015e59ad5a820000', 'd7227c6487f411e7a5142c56dc7febbc');
INSERT INTO `t_employee` VALUES ('402880355e59bca2015e59bca6a10000', '老李', '110086@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '13664077259', null, null, null, null, null, null, '1200', null, null, null, '1', '402880355e59ac4d015e59ac51560000', '402880355e59ad56015e59ad5a820000', 'd7227c6487f411e7a5142c56dc7febbc');
INSERT INTO `t_employee` VALUES ('4028ab1061c6b76f0161c6c049b10032', '233', '987654@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '13552211233', '', '', '男', '', '', '', '2214', 'uploads/emp_trade_process.png', '', '2018-02-27 00:00:00', '1', '402880355e59ac4d015e59ac51560000', '402880355e7519ca015e751ee39f0001', 'd7227c6487f411e7a5142c56dc7febbc');

-- ----------------------------
-- Table structure for t_history
-- ----------------------------
DROP TABLE IF EXISTS `t_history`;
CREATE TABLE `t_history` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户编号',
  `buildings_id` varchar(36) DEFAULT NULL COMMENT '楼盘编号',
  PRIMARY KEY (`id`),
  KEY `fk_his_user_id` (`user_id`),
  KEY `fk_his_buildings_id` (`buildings_id`),
  CONSTRAINT `fk_his_buildings_id` FOREIGN KEY (`buildings_id`) REFERENCES `t_buildings` (`id`),
  CONSTRAINT `fk_his_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_history
-- ----------------------------

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '户型名称',
  `logo` varchar(500) DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL COMMENT '简介',
  `area` double NOT NULL COMMENT '面积',
  `unit_price` double NOT NULL COMMENT '参考单价',
  `created_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `buildings_id` varchar(36) DEFAULT NULL COMMENT '楼盘编号',
  PRIMARY KEY (`id`),
  KEY `fk_buildings_house` (`buildings_id`),
  CONSTRAINT `fk_buildings_house` FOREIGN KEY (`buildings_id`) REFERENCES `t_buildings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4b110000', 'A0', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4b800001', 'A1', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4b840002', 'A2', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4b880003', 'A3', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4b8c0004', 'A4', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4b920005', 'A5', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4b950006', 'A6', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4b980007', 'A7', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4b9c0008', 'A8', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4ba00009', 'A9', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4ba2000a', 'A10', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4ba6000b', 'A11', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4ba8000c', 'A12', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4baa000d', 'A13', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4bad000e', 'A14', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4baf000f', 'A15', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4bb30010', 'A16', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4bb60011', 'A17', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4bb80012', 'A18', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e59ae46015e59ae4bba0013', 'A19', 'uploads/5D (1).png', '三室两厅', '100.5', '10000', '2017-09-07 08:12:28', '1', '402880355e59ad56015e59ad5a820000');
INSERT INTO `t_house` VALUES ('402880355e75515b015e75535c520000', 'RPK110', 'uploads/5D (1).png', '没有简介', '580', '11000', '2017-09-12 17:02:31', '1', '402880355e7519ca015e751a1e830000');
INSERT INTO `t_house` VALUES ('4028ab1061c6b76f0161c6bbc2ec001f', '123QQ', 'uploads/leave_process.png', '', '111', '11111', '2018-02-24 15:34:09', '1', '402880355e75169d015e75175d650000');

-- ----------------------------
-- Table structure for t_like
-- ----------------------------
DROP TABLE IF EXISTS `t_like`;
CREATE TABLE `t_like` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `created_time` datetime DEFAULT NULL COMMENT '点赞创建时间',
  `user_id` varchar(36) DEFAULT NULL COMMENT '客户编号',
  `buildings_id` varchar(36) DEFAULT NULL COMMENT '楼盘编号',
  PRIMARY KEY (`id`),
  KEY `fk_like_user_id` (`user_id`),
  KEY `fk_like_buildings_id` (`buildings_id`),
  CONSTRAINT `fk_like_buildings_id` FOREIGN KEY (`buildings_id`) REFERENCES `t_buildings` (`id`),
  CONSTRAINT `fk_like_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_like
-- ----------------------------

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `content` text COMMENT '留言内容',
  `reply` text COMMENT '回复内容',
  `leave_time` datetime DEFAULT NULL COMMENT '留言时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，激活或冻结',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户编号',
  `buildings_id` varchar(36) DEFAULT NULL COMMENT '楼盘编号',
  PRIMARY KEY (`id`),
  KEY `fk_msg_user_id` (`user_id`),
  KEY `fk_msg_buildings_id` (`buildings_id`),
  CONSTRAINT `fk_msg_buildings_id` FOREIGN KEY (`buildings_id`) REFERENCES `t_buildings` (`id`),
  CONSTRAINT `fk_msg_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('4028809c5ec0ad2e015ec0d3978a0000', '1231', '111111111111', '2017-09-27 08:54:06', '2017-09-27 09:05:10', '1', '402880355e64ac65015e64ad09550000', '402880355e75169d015e75175d650000');
INSERT INTO `t_message` VALUES ('4028809c5ec0ad2e015ec0d3b7ab0001', '死死死死死死死死死死', '超出超出', '2017-09-27 08:54:14', '2017-09-27 09:04:55', '1', '402880355e64ac65015e64ad09550000', '402880355e75169d015e75175d650000');

-- ----------------------------
-- Table structure for t_mission
-- ----------------------------
DROP TABLE IF EXISTS `t_mission`;
CREATE TABLE `t_mission` (
  `id` varchar(36) NOT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '员工任务量',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `bonus_percent` double DEFAULT NULL COMMENT '百分比提成',
  `status` tinyint(4) DEFAULT '1',
  `emp_id` varchar(36) DEFAULT NULL COMMENT '员工编号',
  PRIMARY KEY (`id`),
  KEY `fk_mission_emp_id` (`emp_id`),
  CONSTRAINT `fk_mission_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mission
-- ----------------------------
INSERT INTO `t_mission` VALUES ('402880355e59b4d4015e59b4d9260000', '65', '2015-02-07 08:19:38', '2015-11-17 07:12:58', '10', '1', '402880355e59b2b0015e59b2b4e00000');
INSERT INTO `t_mission` VALUES ('402880355e59d407015e59d40b710000', '65', '2017-03-07 08:53:42', '2017-09-17 07:47:02', '10', '1', '402880355e59bca2015e59bca6a10000');
INSERT INTO `t_mission` VALUES ('4028ab1061c6b76f0161c6bd758c0030', '20', '2018-02-24 15:35:54', '2018-02-25 15:35:54', '5', '1', '402880355e59b2b0015e59b2b4e00000');
INSERT INTO `t_mission` VALUES ('4028ab1061c6b76f0161c6bf69030031', '10', '2018-02-24 00:00:00', '2018-03-07 00:00:00', '10', '1', '402880355e59bca2015e59bca6a10000');
INSERT INTO `t_mission` VALUES ('73fe1045-9378-11e7-9986-80fa5b2e8425', '65', '2017-03-07 08:53:42', '2017-09-17 07:47:02', '10', '1', '402880355e59b2b0015e59b2b4e00000');
INSERT INTO `t_mission` VALUES ('9e31b54a-936d-11e7-9986-80fa5b2e8425', '1', '2016-03-07 08:53:42', '2016-09-17 07:47:02', '10', '1', '402880355e59bca2015e59bca6a10000');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `name` varchar(500) NOT NULL COMMENT '权限名称',
  `des` varchar(50) NOT NULL COMMENT '权限描述',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '角色名词',
  `des` varchar(50) NOT NULL COMMENT '角色描述',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('d702b59b87f411e7a5142c56dc7febbc', '平台管理员', '平台管理员', '2017-09-07 08:10:09', '1');
INSERT INTO `t_role` VALUES ('d715a8c987f411e7a5142c56dc7febbc', '房产经销商管理员', '房产经销商管理员', '2017-09-07 08:10:09', '1');
INSERT INTO `t_role` VALUES ('d7227c6487f411e7a5142c56dc7febbc', '房产经销商销售员工', '房产经销商销售员工', '2017-09-07 08:10:09', '1');
INSERT INTO `t_role` VALUES ('d737ab4487f411e7a5142c56dc7febbc', '购房用户', '购房用户', '2017-09-07 08:10:09', '1');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `role_id` varchar(50) DEFAULT NULL COMMENT '角色编号',
  `permission_id` varchar(50) DEFAULT NULL COMMENT '权限编号',
  PRIMARY KEY (`id`),
  KEY `fk_role_id` (`role_id`),
  KEY `fk_per_id` (`permission_id`),
  CONSTRAINT `fk_per_id` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`),
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '房号名称',
  `sale_status` varchar(20) NOT NULL DEFAULT 'saleing' COMMENT '销售状态',
  `house_id` varchar(36) DEFAULT NULL COMMENT '户型编号',
  `building_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_room_house_id` (`house_id`),
  KEY `fk_room_building_id` (`building_id`),
  CONSTRAINT `fk_room_building_id` FOREIGN KEY (`building_id`) REFERENCES `t_building` (`id`),
  CONSTRAINT `fk_room_house_id` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9540001', '101', '0', '402880355e59ae46015e59ae4b110000', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9590002', '102', '3', '402880355e59ae46015e59ae4b800001', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a95b0003', '103', '3', '402880355e59ae46015e59ae4b840002', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9600004', '104', '0', '402880355e59ae46015e59ae4b880003', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9660005', '201', '0', '402880355e59ae46015e59ae4b110000', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9690006', '202', '0', '402880355e59ae46015e59ae4b800001', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a96c0007', '203', '0', '402880355e59ae46015e59ae4b840002', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a96f0008', '204', '0', '402880355e59ae46015e59ae4b880003', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9710009', '301', '0', '402880355e59ae46015e59ae4b110000', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a974000a', '302', '0', '402880355e59ae46015e59ae4b800001', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a976000b', '303', '0', '402880355e59ae46015e59ae4b840002', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a978000c', '304', '0', '402880355e59ae46015e59ae4b880003', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a97a000d', '401', '0', '402880355e59ae46015e59ae4b110000', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a97c000e', '402', '0', '402880355e59ae46015e59ae4b800001', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a97f000f', '403', '0', '402880355e59ae46015e59ae4b840002', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9830010', '404', '0', '402880355e59ae46015e59ae4b880003', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9850011', '501', '0', '402880355e59ae46015e59ae4b110000', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9880012', '502', '0', '402880355e59ae46015e59ae4b800001', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a98b0013', '503', '0', '402880355e59ae46015e59ae4b840002', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a98d0014', '504', '0', '402880355e59ae46015e59ae4b880003', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9900015', '601', '0', '402880355e59ae46015e59ae4b110000', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9920016', '602', '0', '402880355e59ae46015e59ae4b800001', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9940017', '603', '0', '402880355e59ae46015e59ae4b840002', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9960018', '604', '0', '402880355e59ae46015e59ae4b880003', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9990019', '701', '0', '402880355e59ae46015e59ae4b110000', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a99b001a', '702', '0', '402880355e59ae46015e59ae4b800001', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a99e001b', '703', '0', '402880355e59ae46015e59ae4b840002', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9a0001c', '704', '0', '402880355e59ae46015e59ae4b880003', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9a3001d', '801', '0', '402880355e59ae46015e59ae4b110000', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9a5001e', '802', '0', '402880355e59ae46015e59ae4b800001', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9a7001f', '803', '0', '402880355e59ae46015e59ae4b840002', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9a90020', '804', '0', '402880355e59ae46015e59ae4b880003', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9ab0021', '901', '0', '402880355e59ae46015e59ae4b110000', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9ad0022', '902', '0', '402880355e59ae46015e59ae4b800001', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9af0023', '903', '0', '402880355e59ae46015e59ae4b840002', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9b00024', '904', '0', '402880355e59ae46015e59ae4b880003', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9b20025', '1001', '0', '402880355e59ae46015e59ae4b110000', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9b40026', '1002', '0', '402880355e59ae46015e59ae4b800001', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9b70027', '1003', '0', '402880355e59ae46015e59ae4b840002', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('402880355e59b1a4015e59b1a9b90028', '1004', '0', '402880355e59ae46015e59ae4b880003', '402880355e59b1a4015e59b1a8e40000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42340001', '101', '0', '402880355e59ae46015e59ae4b110000', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb423a0002', '102', '0', '402880355e59ae46015e59ae4b800001', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb423d0003', '103', '0', '402880355e59ae46015e59ae4b840002', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42400004', '201', '0', '402880355e59ae46015e59ae4b110000', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42440005', '202', '0', '402880355e59ae46015e59ae4b800001', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42470006', '203', '0', '402880355e59ae46015e59ae4b840002', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42490007', '301', '0', '402880355e59ae46015e59ae4b110000', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb424b0008', '302', '0', '402880355e59ae46015e59ae4b800001', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb424d0009', '303', '0', '402880355e59ae46015e59ae4b840002', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb424f000a', '401', '0', '402880355e59ae46015e59ae4b110000', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb4251000b', '402', '0', '402880355e59ae46015e59ae4b800001', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb4254000c', '403', '0', '402880355e59ae46015e59ae4b840002', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb4256000d', '501', '0', '402880355e59ae46015e59ae4b110000', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb4258000e', '502', '0', '402880355e59ae46015e59ae4b800001', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb425b000f', '503', '0', '402880355e59ae46015e59ae4b840002', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb425e0010', '601', '0', '402880355e59ae46015e59ae4b110000', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42600011', '602', '0', '402880355e59ae46015e59ae4b800001', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42640012', '603', '0', '402880355e59ae46015e59ae4b840002', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42660013', '701', '0', '402880355e59ae46015e59ae4b110000', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42690014', '702', '0', '402880355e59ae46015e59ae4b800001', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb426b0015', '703', '0', '402880355e59ae46015e59ae4b840002', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb426e0016', '801', '0', '402880355e59ae46015e59ae4b110000', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42700017', '802', '0', '402880355e59ae46015e59ae4b800001', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42730018', '803', '0', '402880355e59ae46015e59ae4b840002', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb42760019', '901', '0', '402880355e59ae46015e59ae4b110000', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb4278001a', '902', '0', '402880355e59ae46015e59ae4b800001', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb427b001b', '903', '0', '402880355e59ae46015e59ae4b840002', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb427d001c', '1001', '0', '402880355e59ae46015e59ae4b110000', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb427f001d', '1002', '0', '402880355e59ae46015e59ae4b800001', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bb4281001e', '1003', '0', '402880355e59ae46015e59ae4b840002', '4028ab1061c6b76f0161c6bb42040000');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bbe0070021', '101', '0', '4028ab1061c6b76f0161c6bbc2ec001f', '4028ab1061c6b76f0161c6bbdffc0020');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bbe00a0022', '201', '0', '4028ab1061c6b76f0161c6bbc2ec001f', '4028ab1061c6b76f0161c6bbdffc0020');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bbe00c0023', '301', '0', '4028ab1061c6b76f0161c6bbc2ec001f', '4028ab1061c6b76f0161c6bbdffc0020');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bbe00f0024', '401', '0', '4028ab1061c6b76f0161c6bbc2ec001f', '4028ab1061c6b76f0161c6bbdffc0020');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bbe0120025', '501', '0', '4028ab1061c6b76f0161c6bbc2ec001f', '4028ab1061c6b76f0161c6bbdffc0020');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bbe0140026', '601', '0', '4028ab1061c6b76f0161c6bbc2ec001f', '4028ab1061c6b76f0161c6bbdffc0020');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bbe0160027', '701', '0', '4028ab1061c6b76f0161c6bbc2ec001f', '4028ab1061c6b76f0161c6bbdffc0020');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bbe0180028', '801', '0', '4028ab1061c6b76f0161c6bbc2ec001f', '4028ab1061c6b76f0161c6bbdffc0020');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bbe01a0029', '901', '0', '4028ab1061c6b76f0161c6bbc2ec001f', '4028ab1061c6b76f0161c6bbdffc0020');
INSERT INTO `t_room` VALUES ('4028ab1061c6b76f0161c6bbe01c002a', '1001', '0', '4028ab1061c6b76f0161c6bbc2ec001f', '4028ab1061c6b76f0161c6bbdffc0020');

-- ----------------------------
-- Table structure for t_sale
-- ----------------------------
DROP TABLE IF EXISTS `t_sale`;
CREATE TABLE `t_sale` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `sale_time` datetime DEFAULT NULL COMMENT '销售时间',
  `unit_price` double DEFAULT NULL COMMENT '销售单价',
  `discount` double DEFAULT NULL COMMENT '销售折扣',
  `total_cost` double DEFAULT NULL COMMENT '销售总价',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(2) DEFAULT 'Y' COMMENT '状态',
  `customer_id` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `emp_id` varchar(36) DEFAULT NULL COMMENT '员工编号',
  `room_id` varchar(36) DEFAULT NULL COMMENT '房屋编号',
  `agency_id` varchar(36) DEFAULT NULL COMMENT '经销商编号',
  PRIMARY KEY (`id`),
  KEY `fk_sale_cus_id` (`customer_id`),
  KEY `fk_sale_emp_id` (`emp_id`),
  KEY `fk_sale_room_id` (`room_id`),
  KEY `fk_sale_agency_id` (`agency_id`),
  CONSTRAINT `fk_sale_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `t_agency` (`id`),
  CONSTRAINT `fk_sale_cus_id` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`),
  CONSTRAINT `fk_sale_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`),
  CONSTRAINT `fk_sale_room_id` FOREIGN KEY (`room_id`) REFERENCES `t_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sale
-- ----------------------------
INSERT INTO `t_sale` VALUES ('402880355e59b624015e59b628f90000', '2015-09-07 08:21:04', '500', '5', '2000000', '2014-09-07 08:21:04', '1', '402880355e59b379015e59b37dfc0000', '402880355e59b2b0015e59b2b4e00000', '402880355e59b1a4015e59b1a95b0003', '402880355e59ac4d015e59ac51560000');
INSERT INTO `t_sale` VALUES ('402880355e59be92015e59be96780000', '2016-09-07 08:30:16', '5000', '5', '2000000', '2015-02-07 08:30:16', '1', '402880355e59bd15015e59bd19f50000', '402880355e59bca2015e59bca6a10000', '402880355e59b1a4015e59b1a9590002', '402880355e59ac4d015e59ac51560000');

-- ----------------------------
-- Table structure for t_tobebuiltsite
-- ----------------------------
DROP TABLE IF EXISTS `t_tobebuiltsite`;
CREATE TABLE `t_tobebuiltsite` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `stationName` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tobebuiltsite
-- ----------------------------

-- ----------------------------
-- Table structure for t_tourist
-- ----------------------------
DROP TABLE IF EXISTS `t_tourist`;
CREATE TABLE `t_tourist` (
  `id` varchar(36) NOT NULL,
  `phone` varchar(11) NOT NULL COMMENT '游客的手机号',
  `buildings_id` varchar(36) DEFAULT NULL,
  `emp_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tourist_building_id` (`buildings_id`),
  KEY `fk_tourist_emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tourist
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(36) NOT NULL,
  `email` varchar(50) NOT NULL COMMENT '用户邮箱',
  `phone` varchar(11) NOT NULL,
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `headicon` varchar(500) DEFAULT NULL COMMENT '用户头像',
  `role_id` varchar(36) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `FK_user_roleid` (`role_id`),
  CONSTRAINT `FK_user_roleid` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('402880355e64ac65015e64ad09550000', '3001@qq.com', '13802266100', '4QrcOUm6Wau+VuBX8g+IPg==', '', '', '男', null, '', '史诗', 'public/img/a1.jpg', 'd737ab4487f411e7a5142c56dc7febbc', '1');
INSERT INTO `t_user` VALUES ('402880355e64b2a0015e64b3de570002', '3002@qq.com', '18302266407', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, '老李', null, 'public/img/a1.jpg', 'd737ab4487f411e7a5142c56dc7febbc', '1');
INSERT INTO `t_user` VALUES ('402880355e700421015e7004b2180000', '10002@qq.com', '13802266404', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, '老王', null, 'public/img/a1.jpg', 'd737ab4487f411e7a5142c56dc7febbc', '1');
INSERT INTO `t_user` VALUES ('402880355e700658015e7006f8b70000', '10001@qq.com', '13802266403', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, null, null, null, 'd737ab4487f411e7a5142c56dc7febbc', '1');
INSERT INTO `t_user` VALUES ('40289fc15e6990d7015e69995f0a0009', '20003@qq.com', '13802266421', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, null, null, 'public/img/a1.jpg', 'd737ab4487f411e7a5142c56dc7febbc', '1');
INSERT INTO `t_user` VALUES ('40289fc15e6990d7015e699aa7e0000a', '20004@qq.com', '13702266401', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, null, null, 'public/img/a1.jpg', 'd737ab4487f411e7a5142c56dc7febbc', '1');
INSERT INTO `t_user` VALUES ('40289fc15e6990d7015e699ecede0019', '20005@qq.com', '13702266402', '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, null, null, null, 'public/img/a1.jpg', 'd737ab4487f411e7a5142c56dc7febbc', '1');
