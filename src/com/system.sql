/*
Navicat MySQL Data Transfer



SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('21', '心理学', '催眠师手记II', '45');
INSERT INTO `book` VALUES ('20', '心理学', '催眠师手记I', '45');
INSERT INTO `book` VALUES ('17', '文学', '云边有个小卖部', '40');
INSERT INTO `book` VALUES ('18', '文学', '我们都一样，年轻又彷徨', '35');
INSERT INTO `book` VALUES ('19', '心理学', '天才在左，疯子在右', '60');
INSERT INTO `book` VALUES ('22', '文学', '一个人就一个人', '40');
INSERT INTO `book` VALUES ('23', '文学', '焦虑的人', '30');
INSERT INTO `book` VALUES ('24', '文学', '抵达之谜', '50');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('zhangsan', '123');
INSERT INTO `user` VALUES ('Jack', '147');
INSERT INTO `user` VALUES ('lisi', '456');
