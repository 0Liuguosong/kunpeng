/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : data

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 24/03/2020 16:55:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for four4
-- ----------------------------
DROP TABLE IF EXISTS `four4`;
CREATE TABLE `four4`  (
  `day` date NOT NULL COMMENT '日期',
  `view` int(255) NULL DEFAULT NULL COMMENT '浏览次数',
  `cart` int(255) NULL DEFAULT NULL COMMENT '加入购物车次数',
  `removed_form_cart` int(255) NULL DEFAULT NULL COMMENT '用户将产品从购物车中移除的次数',
  `purchase` int(255) NULL DEFAULT NULL COMMENT '购买次数',
  PRIMARY KEY (`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of four4
-- ----------------------------
INSERT INTO `four4` VALUES ('2020-03-21', 100, 80, 46, 20);
INSERT INTO `four4` VALUES ('2020-03-22', 200, 150, 80, 10);

-- ----------------------------
-- Table structure for one1
-- ----------------------------
DROP TABLE IF EXISTS `one1`;
CREATE TABLE `one1`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `view` int(255) NULL DEFAULT NULL COMMENT '浏览次数',
  `cart` int(255) NULL DEFAULT NULL COMMENT '加入购物车次数',
  `purchase` int(255) NULL DEFAULT NULL COMMENT '购买次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of one1
-- ----------------------------
INSERT INTO `one1` VALUES ('1', 20, 15, 10);
INSERT INTO `one1` VALUES ('2', 30, 12, 10);
INSERT INTO `one1` VALUES ('我', 12, 5, 1);

-- ----------------------------
-- Table structure for three3
-- ----------------------------
DROP TABLE IF EXISTS `three3`;
CREATE TABLE `three3`  (
  `day` date NOT NULL COMMENT '日期',
  `uv` int(255) NULL DEFAULT NULL COMMENT '用户访问数量',
  `pv` int(255) NULL DEFAULT NULL COMMENT '事件数量',
  PRIMARY KEY (`day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of three3
-- ----------------------------
INSERT INTO `three3` VALUES ('2020-03-09', 456, 567);
INSERT INTO `three3` VALUES ('2020-03-10', 343, 543);
INSERT INTO `three3` VALUES ('2020-03-11', 233, 427);
INSERT INTO `three3` VALUES ('2020-03-12', 543, 863);
INSERT INTO `three3` VALUES ('2020-03-13', 234, 454);
INSERT INTO `three3` VALUES ('2020-03-21', 100, 200);
INSERT INTO `three3` VALUES ('2020-03-22', 200, 300);
INSERT INTO `three3` VALUES ('2020-03-23', 10000, 100000);

-- ----------------------------
-- Table structure for two2
-- ----------------------------
DROP TABLE IF EXISTS `two2`;
CREATE TABLE `two2`  (
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类别',
  `slaes_volume` int(255) NULL DEFAULT NULL COMMENT '商品类别销量',
  `totle_money` int(255) NULL DEFAULT NULL COMMENT '成交总额',
  PRIMARY KEY (`category`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of two2
-- ----------------------------
INSERT INTO `two2` VALUES ('1', 45, 90);
INSERT INTO `two2` VALUES ('2', 30, 120);

SET FOREIGN_KEY_CHECKS = 1;
