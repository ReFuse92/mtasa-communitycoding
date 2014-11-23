/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : testing

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2014-11-22 22:03:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fahrzeuge`
-- ----------------------------
DROP TABLE IF EXISTS `fahrzeuge`;
CREATE TABLE `fahrzeuge` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `Besitzer` text NOT NULL,
  `Schluessel` text NOT NULL,
  `Spawn` text NOT NULL,
  `Schaden` int(4) DEFAULT NULL,
  `Farbe` text NOT NULL,
  `Tunings` text NOT NULL,
  `Spezial` text NOT NULL,
  `Tank` int(3) DEFAULT NULL,
  `Kennzeichen` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fahrzeuge
-- ----------------------------
INSERT INTO `fahrzeuge` VALUES ('6', 'Infernus', 'MasterM', '[ [ ] ]', '[ [ 2.0224609375, 6.7041015625, 2.8395566940307617, 359.93408203125, 359.879150390625, 238.0352783203125 ] ]', '1000', '[ [ 255, 255, 255, 0, 0, 0, 255, 255, 255, 0 ] ]', '[ [ ] ]', '[ [ ] ]', '1000', 'MasterM');
