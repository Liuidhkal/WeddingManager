/*
 Navicat MySQL Data Transfer

 Source Server         : 本机MySQL
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 05/05/2023 10:23:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dress
-- ----------------------------
DROP TABLE IF EXISTS `dress`;
CREATE TABLE `dress`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_photo` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `d_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_money` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dress
-- ----------------------------
INSERT INTO `dress` VALUES (1, 'd3001', 'localhost:8080/MySQLConfig/d1.jpg', '中式礼服1', 3000);
INSERT INTO `dress` VALUES (2, 'd3002', 'localhost:8080/MySQLConfig/d2.jpg', '中式礼服2', 5000);
INSERT INTO `dress` VALUES (3, 'd3003', 'localhost:8080/MySQLConfig/d3.jpg', '婚纱1', 6000);
INSERT INTO `dress` VALUES (4, 'd3004', 'localhost:8080/MySQLConfig/d4.jpg', '婚纱2', 5600);
INSERT INTO `dress` VALUES (5, 'd3005', 'localhost:8080/MySQLConfig/d5.jpg', '婚纱3', 3800);
INSERT INTO `dress` VALUES (6, 'd3006', 'localhost:8080/MySQLConfig/d6.jpg', '婚纱4', 7000);
INSERT INTO `dress` VALUES (7, 'd3007', 'localhost:8080/MySQLConfig/x1.jpg', '西装1', 6000);
INSERT INTO `dress` VALUES (8, 'd3008', 'localhost:8080/MySQLConfig/x2.jpg', '西装2', 7000);
INSERT INTO `dress` VALUES (9, 'd3009', 'localhost:8080/MySQLConfig/x3.jpg', '李易峰同款', 12999);
INSERT INTO `dress` VALUES (10, 'd3010', 'localhost:8080/MySQLConfig/x4.jpg', '吴亦凡同款', 13999);
INSERT INTO `dress` VALUES (11, 'd3011', 'localhost:8080/MySQLConfig/x5.jpg', '坤坤同款', 8000);

-- ----------------------------
-- Table structure for shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_photo` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_money` double NULL DEFAULT NULL,
  `goods_number` int(11) NULL DEFAULT NULL,
  `goods_total` double NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------
INSERT INTO `shoppingcar` VALUES (27, 'c2002', 'localhost:8080/MySQLConfig/a4.jpg', '奥迪a4l', 2400, 2, 2400, 1);
INSERT INTO `shoppingcar` VALUES (28, 's1001', 'localhost:8080/MySQLConfig/zhongshi.jpg', '中式婚礼', 9999, 1, 9999, 1);
INSERT INTO `shoppingcar` VALUES (29, 'c2003', 'localhost:8080/MySQLConfig/benchi.jpg', '奔驰', 3000, 1, 3000, 1);
INSERT INTO `shoppingcar` VALUES (30, 'd3002', 'localhost:8080/MySQLConfig/d2.jpg', '中式礼服2', 5000, 1, 5000, 1);
INSERT INTO `shoppingcar` VALUES (31, 'd3003', 'localhost:8080/MySQLConfig/d3.jpg', '婚纱1', 6000, 1, 6000, 1);
INSERT INTO `shoppingcar` VALUES (39, 's1005', 'localhost:8080/MySQLConfig/tonghua.jpg', '梦幻童话婚礼', 13888, 1, 13888, 9);
INSERT INTO `shoppingcar` VALUES (40, 'c2001', 'localhost:8080/MySQLConfig/lao.jpg', '劳斯莱斯', 16000, 1, 16000, 9);
INSERT INTO `shoppingcar` VALUES (41, 'c2006', 'localhost:8080/MySQLConfig/wuling.jpg', '五菱宏光', 998, 1, 998, 9);
INSERT INTO `shoppingcar` VALUES (42, 'c2007', 'localhost:8080/MySQLConfig/zsfj.jpg', '豪华直升飞机', 99999, 1, 99999, 9);
INSERT INTO `shoppingcar` VALUES (43, 'd3004', 'localhost:8080/MySQLConfig/d4.jpg', '婚纱2', 5600, 1, 5600, 9);
INSERT INTO `shoppingcar` VALUES (77, 'c2001', 'localhost:8080/MySQLConfig/lao.jpg', '劳斯莱斯', 16000, 1, 16000, 4);
INSERT INTO `shoppingcar` VALUES (78, 'c2007', 'localhost:8080/MySQLConfig/wuling.jpg', '五菱宏光', 998, 5, 998, 4);
INSERT INTO `shoppingcar` VALUES (79, 'c2008', 'localhost:8080/MySQLConfig/zsfj.jpg', '豪华直升飞机', 99999, 1, 99999, 4);
INSERT INTO `shoppingcar` VALUES (80, 'd3001', 'localhost:8080/MySQLConfig/d1.jpg', '中式礼服1', 3000, 1, 3000, 4);
INSERT INTO `shoppingcar` VALUES (84, 's1004', 'localhost:8080/MySQLConfig/jianyue.jpg', '简约婚礼', 6666, 1, 6666, 12);
INSERT INTO `shoppingcar` VALUES (85, 'c2002', 'localhost:8080/MySQLConfig/a4.jpg', '奥迪a4l', 2400, 1, 2400, 12);
INSERT INTO `shoppingcar` VALUES (86, 'c2007', 'localhost:8080/MySQLConfig/wuling.jpg', '五菱宏光', 998, 10, 998, 12);
INSERT INTO `shoppingcar` VALUES (87, 'c2008', 'localhost:8080/MySQLConfig/zsfj.jpg', '豪华直升飞机', 99999, 1, 99999, 12);
INSERT INTO `shoppingcar` VALUES (91, 's1002', 'localhost:8080/MySQLConfig/xishi.jpg', '西式婚礼', 8888, 1, 8888, 12);
INSERT INTO `shoppingcar` VALUES (97, 'd3007', 'localhost:8080/MySQLConfig/x1.jpg', '西装1', 6000, 1, 6000, 14);
INSERT INTO `shoppingcar` VALUES (98, 'd3005', 'localhost:8080/MySQLConfig/d5.jpg', '婚纱3', 3800, 1, 3800, 14);
INSERT INTO `shoppingcar` VALUES (99, 'c2001', 'localhost:8080/MySQLConfig/lao.jpg', '劳斯莱斯', 16000, -11, 16000, 14);
INSERT INTO `shoppingcar` VALUES (100, 's1004', 'localhost:8080/MySQLConfig/jianyue.jpg', '简约婚礼', 6666, 1, 6666, 15);
INSERT INTO `shoppingcar` VALUES (101, 'c2004', 'localhost:8080/MySQLConfig/bwm5.jpg', '宝马5系', 2800, 1, 2800, 15);
INSERT INTO `shoppingcar` VALUES (103, 's1002', 'localhost:8080/MySQLConfig/xishi.jpg', '西式婚礼', 8888, 1, 8888, 15);
INSERT INTO `shoppingcar` VALUES (104, 'c2001', 'localhost:8080/MySQLConfig/lao.jpg', '劳斯莱斯', 16000, 1, 16000, 15);
INSERT INTO `shoppingcar` VALUES (105, 'd3001', 'localhost:8080/MySQLConfig/d1.jpg', '中式礼服1', 3000, 1, 3000, 15);

-- ----------------------------
-- Table structure for style
-- ----------------------------
DROP TABLE IF EXISTS `style`;
CREATE TABLE `style`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `s_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of style
-- ----------------------------
INSERT INTO `style` VALUES (1, 's1001', 'localhost:8080/MySQLConfig/zhongshi.jpg', '中式婚礼', 9999);
INSERT INTO `style` VALUES (2, 's1002', 'localhost:8080/MySQLConfig/xishi.jpg', '西式婚礼', 8888);
INSERT INTO `style` VALUES (3, 's1003', 'localhost:8080/MySQLConfig/shuishang.jpg', '水上主题婚礼', 12999);
INSERT INTO `style` VALUES (4, 's1004', 'localhost:8080/MySQLConfig/jianyue.jpg', '简约婚礼', 6666);
INSERT INTO `style` VALUES (5, 's1005', 'localhost:8080/MySQLConfig/tonghua.jpg', '梦幻童话婚礼', 13888);
INSERT INTO `style` VALUES (6, 's1006', 'localhost:8080/MySQLConfig/huwai.jpg', '户外婚礼', 10999);
INSERT INTO `style` VALUES (7, 's1007', 'localhost:8080/MySQLConfig/shengdan.jpg', '圣诞主题婚礼', 7888);
INSERT INTO `style` VALUES (8, 's1008', 'localhost:8080/MySQLConfig/lanse.jpg', '梦幻主题婚礼', 8666);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profile` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'jerry', '123', '192.168.43.8:8080/MySQLConfig/4fadd80a-02d8-4d19-aeaa-f4efdc4048b1jerry1.jpg');
INSERT INTO `user` VALUES (3, '杨学文', '123', '192.168.43.8:8080/MySQLConfig/0c03992e-8276-45f8-9a1b-bcd50cdfccbetom1.jpg');
INSERT INTO `user` VALUES (4, 'jack', '123', '10.10.2.49:8080/MySQLConfig/6c106cbb-79de-46d2-9036-a8661fc0d937tom2.jpg');
INSERT INTO `user` VALUES (5, 'abc', '123', '10.10.2.49:8080/MySQLConfig/7dcb7820-6fba-4017-b9f2-a1ceb881d4ed图片3.jpg');
INSERT INTO `user` VALUES (6, 'aaa', '123', '10.10.2.49:8080/MySQLConfig/40c7ba6b-41f8-4fcd-b529-59d79bd3bda9图片3.jpg');
INSERT INTO `user` VALUES (7, 'qqq', '123', '10.10.2.49:8080/MySQLConfig/a8868c03-2480-4437-a922-d8b1f45896bbtom2.jpg');
INSERT INTO `user` VALUES (9, 'admin', '123', '10.10.2.49:8080/MySQLConfig/0ef38ef8-1638-40be-a25a-2235cb241537jerry1.jpg');
INSERT INTO `user` VALUES (10, 'ccc', '123', '10.10.2.49:8080/MySQLConfig/fd1d8a56-3512-4460-822a-3249e72ce094ph3.jpg');
INSERT INTO `user` VALUES (11, 'zhangsan', '12345', '10.10.2.49:8080/MySQLConfig/f0bf3fdd-b73f-4d8d-aac1-44ca8d64717dph3.jpg');
INSERT INTO `user` VALUES (12, 'abcd', '1234', '192.168.43.8:8080/MySQLConfig/46b820ac-9a9b-4443-ad0b-261931982e74tom2.jpg');
INSERT INTO `user` VALUES (13, '张三', '123', '10.10.24.153:8080/MySQLConfig/c45572ae-b822-480e-ab47-4a30eb28ef32图片7.jpg');
INSERT INTO `user` VALUES (14, 'lisi', '123', '10.10.24.153:8080/MySQLConfig/7c5b67d2-21fe-4799-abff-7a2899cba51bjerry1.jpg');
INSERT INTO `user` VALUES (15, 'tom', '123', '192.168.56.1:8080/MySQLConfig/8518f7c4-0e23-4c87-a37c-d25126671847tom2.jpg');

-- ----------------------------
-- Table structure for weddingcar
-- ----------------------------
DROP TABLE IF EXISTS `weddingcar`;
CREATE TABLE `weddingcar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_photo` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `c_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_money` double NULL DEFAULT NULL,
  `c_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weddingcar
-- ----------------------------
INSERT INTO `weddingcar` VALUES (1, 'c2001', 'localhost:8080/MySQLConfig/lao.jpg', '劳斯莱斯', 16000, 12);
INSERT INTO `weddingcar` VALUES (2, 'c2002', 'localhost:8080/MySQLConfig/a4.jpg', '奥迪a4l', 2400, 10);
INSERT INTO `weddingcar` VALUES (3, 'c2003', 'localhost:8080/MySQLConfig/benchi.jpg', '奔驰', 3000, 6);
INSERT INTO `weddingcar` VALUES (4, 'c2004', 'localhost:8080/MySQLConfig/bwm5.jpg', '宝马5系', 2800, 13);
INSERT INTO `weddingcar` VALUES (5, 'c2005', 'localhost:8080/MySQLConfig/a8.jpg', '奥迪a8', 5000, 5);
INSERT INTO `weddingcar` VALUES (6, 'c2006', 'localhost:8080/MySQLConfig/lbjn.jpg', '兰博基尼', 12000, 3);
INSERT INTO `weddingcar` VALUES (7, 'c2007', 'localhost:8080/MySQLConfig/wuling.jpg', '五菱宏光', 998, 82);
INSERT INTO `weddingcar` VALUES (8, 'c2008', 'localhost:8080/MySQLConfig/zsfj.jpg', '豪华直升飞机', 99999, 3);

SET FOREIGN_KEY_CHECKS = 1;
