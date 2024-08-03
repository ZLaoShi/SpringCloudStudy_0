/*
 Navicat Premium Data Transfer

 Source Server         : xue_xi
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : cloudstudy

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 03/08/2024 17:54:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for db_book
-- ----------------------------
DROP TABLE IF EXISTS `db_book`;
CREATE TABLE `db_book`  (
  `bid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_book
-- ----------------------------
INSERT INTO `db_book` VALUES (1, '深入理解java虚拟机', '了解Java的底层运作机制');
INSERT INTO `db_book` VALUES (2, 'java并发编程的艺术', '了解并发编程的高级玩法');
INSERT INTO `db_book` VALUES (3, '数据结构', '算法基础');
INSERT INTO `db_book` VALUES (4, '编译原理', '你就说劝不劝退');

-- ----------------------------
-- Table structure for db_borrow
-- ----------------------------
DROP TABLE IF EXISTS `db_borrow`;
CREATE TABLE `db_borrow`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `bid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_bid_uid`(`uid` ASC, `bid` ASC) USING BTREE,
  INDEX `f_bid`(`bid` ASC) USING BTREE,
  CONSTRAINT `f_bid` FOREIGN KEY (`bid`) REFERENCES `db_book` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `f_uid` FOREIGN KEY (`uid`) REFERENCES `db_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_borrow
-- ----------------------------
INSERT INTO `db_borrow` VALUES (1, 1, 1);
INSERT INTO `db_borrow` VALUES (3, 1, 3);

-- ----------------------------
-- Table structure for db_user
-- ----------------------------
DROP TABLE IF EXISTS `db_user`;
CREATE TABLE `db_user`  (
  `uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int NOT NULL,
  `sex` enum('男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_user
-- ----------------------------
INSERT INTO `db_user` VALUES (1, '小明', 18, '男');
INSERT INTO `db_user` VALUES (2, '小红', 19, '女');
INSERT INTO `db_user` VALUES (3, '小刚', 19, '男');

SET FOREIGN_KEY_CHECKS = 1;
