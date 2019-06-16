/*
Navicat MySQL Data Transfer

Source Server         : warehouse
Source Server Version : 50528
Source Host           : 192.168.3.110:3306
Source Database       : warehouse

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-02-01 13:51:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for crkjlb
-- ----------------------------
DROP TABLE IF EXISTS `crkjlb`;
CREATE TABLE `crkjlb` (
  `crkid` varchar(32) NOT NULL,
  `sbid` varchar(32) DEFAULT NULL,
  `hjxxid` varchar(32) DEFAULT NULL,
  `zt` char(2) DEFAULT NULL,
  `lydw` varchar(50) DEFAULT NULL,
  `lx` varchar(2) DEFAULT NULL,
  `lysl` int(20) DEFAULT NULL,
  `czr` varchar(50) DEFAULT NULL,
  `czsj` date DEFAULT NULL,
  `isdel` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`crkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crkjlb
-- ----------------------------
INSERT INTO `crkjlb` VALUES ('009a4cf2322a4f9892b0758d11cbff75', 'sb0002', 'c6d5944c07ea44fe8b622db89f8c90d5', '1', '83c59fc0051d4e5381a2ceb43c2d96e0', '1', '7', 'admin', '2018-02-01', 'Y');
INSERT INTO `crkjlb` VALUES ('03165e2067954f0fb5d6b4fed3627899', 'sb0010', null, '2', '275eb08bbbaa44d489bd2298ff809326', '1', '14', 'admin', '2018-02-01', 'N');
INSERT INTO `crkjlb` VALUES ('04403eef585147fc93457e2e079e75a3', 'hc0004', null, '2', '83c59fc0051d4e5381a2ceb43c2d96e0', '2', '2', 'admin', '2018-02-01', 'N');
INSERT INTO `crkjlb` VALUES ('0be7edf23d274b79b1d0a9e7e28e4f0c', 'hc0001', '1d062855a79147a0aab3ce989b5586f6', '1', null, '1', '10', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('0df5d240dd384e5ebe26b64748eb638d', 'sb0007', '954f90047b374ee3b7fd494a9213334e', '3', '2', '1', '0', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('0f1c03ed65404973bbf077b5f8bb09bb', 'hc0004', 'acf01ff54ede4a349e3842bff3b783f1', '7', null, '1', '1', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('1fa892d89bc242809e20f815a61ec2f3', 'hc0001', '954f90047b374ee3b7fd494a9213334e', '7', null, '1', '1', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('27b9844ef92c401980e6a677d88c6d98', 'hc0002', 'a3f6df278db24d1ca760b6c1908ad9e5', '3', '2', '1', '1', 'admin', '2018-01-31', 'Y');
INSERT INTO `crkjlb` VALUES ('29ce8d66d1ca4554976104240a43a283', 'sb0010', 'd86b681a091e441bb2adea3222df80e4', '1', null, '1', '0', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('2d57c5094fec49479d6278b497fa27a7', 'sb0001', 'acf01ff54ede4a349e3842bff3b783f1', '7', null, '1', '1', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('2dcd17bf4bd8415fa1d5b4fca35fd411', 'hc0004', null, '2', '3cdf9ff16cf84d2c9fd11f7897259b41', '2', '6', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('365e4b693bbe45bd866327a7df2cc602', 'hc0004', '1d062855a79147a0aab3ce989b5586f6', '7', null, '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('4064187ccc9b48daaee7c41461da3a01', 'hc0004', null, '2', '2', '2', '0', 'admin', '2018-02-01', 'N');
INSERT INTO `crkjlb` VALUES ('4310d56267554315a86a3995504b6fb1', 'hc0004', '1d062855a79147a0aab3ce989b5586f6', '1', null, '1', '0', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('47816615f86f470fadcd724a5d191106', 'sb0009', '1d062855a79147a0aab3ce989b5586f6', '1', '83c59fc0051d4e5381a2ceb43c2d96e0', '1', '3', 'admin', '2018-02-01', 'N');
INSERT INTO `crkjlb` VALUES ('497a50fc81534b48978390adff95451d', 'sb0007', '954f90047b374ee3b7fd494a9213334e', '7', null, '1', '1', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('4b99795ee6d549fbabbaf6d11df4c6e5', 'sb0004', '1d062855a79147a0aab3ce989b5586f6', '3', '2', '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('4c7beeb963e24bdfba543dc6b417a4cd', 'sb0010', 'd86b681a091e441bb2adea3222df80e4', '1', null, '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('4fbf9c2657474ea6a7be98646e25c824', 'hc0006', '150d2b476d804e738a9eb27b63326299', '1', '2', '1', '0', 'admin', '2018-01-31', 'Y');
INSERT INTO `crkjlb` VALUES ('50022d86cf6f48ce8b428f5bb6beb312', 'hc0001', null, '2', '2', '2', '0', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('54707fd1462b482480b8b62acb7b5fc5', 'hc0001', null, '2', '2', '2', '2', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('55b8727e184a474499dce8121a8a4811', 'sb0001', '954f90047b374ee3b7fd494a9213334e', '1', null, '1', '0', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('6955d1afb4384a58a2cb83d7a99cd81a', 'sb0001', null, '2', '1', '1', '1', 'admin', '2018-01-31', 'Y');
INSERT INTO `crkjlb` VALUES ('6b3b25349c69494a8ac1f7d103a07c59', 'sb0001', null, '2', '2', '1', '2', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('6e9c91fb273b499b9aa4d2aac284cffe', 'sb0007', 'a3f6df278db24d1ca760b6c1908ad9e5', '1', null, '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('710dd21d58694b4fb87d3923e3622b48', 'hc0004', null, '2', '2', '2', '0', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('76c6295a8c1041a5928945b580531549', 'hc0001', 'c7a2fa023da04737b50cb92d482a3891', '7', null, '1', '2', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('80eb87db73744af7b43efe796b674a41', 'sb0010', 'd86b681a091e441bb2adea3222df80e4', '1', null, '1', '2', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('81141cc1cf554558b3ffedb0e4cd11da', 'sb0006', '954f90047b374ee3b7fd494a9213334e', '1', null, '1', '6', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('8485452465c14508b9c181a635b80f44', 'hc0006', '1d062855a79147a0aab3ce989b5586f6', '1', '83c59fc0051d4e5381a2ceb43c2d96e0', '1', '0', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('8784f731de6c47298b14cb048fb14194', 'sb0001', 'acf01ff54ede4a349e3842bff3b783f1', '1', null, '1', '2', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('8db56ef9e6214c258d6e441a46910a29', 'hc0001', null, '2', '2', '2', '10', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('8e4b7fd3851c488d849d23e4de06456f', 'sb0001', 'acf01ff54ede4a349e3842bff3b783f1', '3', '2', '1', '3', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('97cad2dd23df4ab78213b3bea387ffe5', 'sb0009', null, '2', '1', null, '60', 'admin', '2018-02-01', 'N');
INSERT INTO `crkjlb` VALUES ('9946df1a75224938beb9536e0f8c7abe', 'sb0006', 'e6679595995c41b9ad2a8b65e7853680', '1', null, '1', '100', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('9d9439c1c45f412ea84e5905b02e7221', 'hc0001', 'c6d5944c07ea44fe8b622db89f8c90d5', '1', null, '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('a255d5c4131546118b617e8b456a02a5', 'sb0001', '1d062855a79147a0aab3ce989b5586f6', '3', '1', '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('a804423b9d4d49bc91d6589c5d7e6adf', 'hc0008', 'e583225abe20441a94f34de5b03d477b', '1', null, '1', '10', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('b0f6f7536602496d99102f0e2424c4b3', 'sb0009', '1d062855a79147a0aab3ce989b5586f6', '1', '2', '1', '2', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('b4686bbf8e9b42f9b95755a404562ab5', 'sb0002', null, '2', '3cdf9ff16cf84d2c9fd11f7897259b41', null, '5', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('b7363bf25fea4312b82ae10c8c94ad27', 'sb0002', null, '2', '1', null, '2', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('b7f0fda2e28344c4987f447794ca2ffa', 'hc0004', '1d062855a79147a0aab3ce989b5586f6', '7', null, '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('c613b63df34341c889d509c4252375ef', 'sb0010', 'd86b681a091e441bb2adea3222df80e4', '1', null, '1', '0', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('c803eaec3cff48c896b05da0f5ff92a9', 'sb0006', 'c6d5944c07ea44fe8b622db89f8c90d5', '3', '3cdf9ff16cf84d2c9fd11f7897259b41', '1', '0', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('c884a19b7dc64173b0e155dd1fc2c1e2', 'sb0007', null, '2', '2', '1', '50', 'admin', '2018-02-01', 'N');
INSERT INTO `crkjlb` VALUES ('cdfdf83b04a1423ca010a2da893e13aa', 'hc0001', '150d2b476d804e738a9eb27b63326299', '7', null, '1', '5', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('cf4026477f994f748d9cbdb2f6a2d0bd', 'sb0002', 'a3f6df278db24d1ca760b6c1908ad9e5', '1', '2', '1', '2', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('d1d0886d2db14771aa46f31653dd2100', 'hc0006', '954f90047b374ee3b7fd494a9213334e', '1', '3cdf9ff16cf84d2c9fd11f7897259b41', '1', '2', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('d42c2079d57841f2b854f015979231e4', 'sb0001', '78e9149bdfa1442f9d5a2b65b0fd4ab3', '1', null, '1', '8', 'admin', '2018-02-01', 'N');
INSERT INTO `crkjlb` VALUES ('d70022a241c74e5b99fe181bc61dbc26', 'sb0002', 'acf01ff54ede4a349e3842bff3b783f1', '1', '2', '1', '23', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('d786605618434305980fa6449dcbb1c1', 'sb0006', '150d2b476d804e738a9eb27b63326299', '1', null, '1', '7', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('dae798109e8b49ae8870dce8fc19d1bc', 'hc0001', 'acf01ff54ede4a349e3842bff3b783f1', '7', null, '1', '3', 'admin', '2018-01-30', 'Y');
INSERT INTO `crkjlb` VALUES ('ea554620ff1a4130b2bd805dadd21d4e', 'sb0001', null, '2', '3cdf9ff16cf84d2c9fd11f7897259b41', '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('ec3cc2c15ff945d691591b5a3cc6565c', 'sb0010', '1d062855a79147a0aab3ce989b5586f6', '3', '2', '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('f05469ea1dea4431891ab5639b9637d9', 'hc0008', null, '2', '83c59fc0051d4e5381a2ceb43c2d96e0', '2', '100', 'admin', '2018-02-01', 'N');
INSERT INTO `crkjlb` VALUES ('f0fdf91eb8574c58ac55d32d7941e56c', 'sb0001', 'c7a2fa023da04737b50cb92d482a3891', '1', null, '1', '1', 'admin', '2018-01-30', 'N');
INSERT INTO `crkjlb` VALUES ('f4b7d75289a44a61949567085e0a0b51', 'sb0006', null, '2', '3cdf9ff16cf84d2c9fd11f7897259b41', '1', '0', 'admin', '2018-01-31', 'Y');
INSERT INTO `crkjlb` VALUES ('f5404c1ec65247d0bc805ebf5f8855bf', 'hc0004', '1d062855a79147a0aab3ce989b5586f6', '1', null, '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('f7bf3ecee1f640678c4c6d39efe0fa60', 'sb0001', 'e583225abe20441a94f34de5b03d477b', '7', null, '1', '1', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('f8b836d25e11456e917f3b29c33b2c16', 'sb0003', '1d062855a79147a0aab3ce989b5586f6', '3', '3cdf9ff16cf84d2c9fd11f7897259b41', '1', '0', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('fa2159462e1445748fef73bca9ec0253', 'hc0008', null, '2', '3cdf9ff16cf84d2c9fd11f7897259b41', '2', '12', 'admin', '2018-01-31', 'N');
INSERT INTO `crkjlb` VALUES ('fcba6a372adb44859a8a63d45d3bad67', 'hc0004', null, '2', '2', '2', '2', 'admin', '2018-02-01', 'N');
INSERT INTO `crkjlb` VALUES ('fec80b030ae8455cb3b1012e0b73a7e9', 'sb0004', 'd6646b7312734f96b98865186be5b8ec', '7', null, '1', '2', 'admin', '2018-01-31', 'N');

-- ----------------------------
-- Table structure for hjxxld
-- ----------------------------
DROP TABLE IF EXISTS `hjxxld`;
CREATE TABLE `hjxxld` (
  `hjxxid` varchar(32) NOT NULL,
  `ckmc` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `hjbm` varchar(100) DEFAULT NULL,
  `cjsj` date DEFAULT NULL,
  `isdel` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`hjxxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hjxxld
-- ----------------------------
INSERT INTO `hjxxld` VALUES ('1d062855a79147a0aab3ce989b5586f6', '090bf182e8894ce5825819c9fa2bb607', 'ABCD', 'b0b7c703280441afa9fc91f6310b2ea2', '2018-01-31', 'N');
INSERT INTO `hjxxld` VALUES ('74f712ba1848476e9618ff2705ffa299', 'D仓库', '2', '47f518fb4aa4433984158656979b33f2', '2018-02-01', 'N');
INSERT INTO `hjxxld` VALUES ('78e9149bdfa1442f9d5a2b65b0fd4ab3', '090bf182e8894ce5825819c9fa2bb607', '设备建材1架', 'd9113ff9d3574047ba1d1b019a9d06fa', '2018-02-01', 'Y');
INSERT INTO `hjxxld` VALUES ('a3f6df278db24d1ca760b6c1908ad9e5', 'd8d578f8b4af43d8b9b4fd71263ddec6', 'as', '06486e0d7f534023bae86af686b6b163', '2018-01-31', 'N');
INSERT INTO `hjxxld` VALUES ('c6d5944c07ea44fe8b622db89f8c90d5', '566dbabaf9924c8497ebe44c4dc105da', 'b', 'fed690e02ea049628ea32caa23dfa0b3', '2018-01-31', 'N');
INSERT INTO `hjxxld` VALUES ('d036f45b8003488e8bdd51f4b7fee84e', 'd8d578f8b4af43d8b9b4fd71263ddec6', '1', '7f3f72d3b7e7438bb2cc2f8a4b13501c', '2018-02-01', 'N');
INSERT INTO `hjxxld` VALUES ('d6646b7312734f96b98865186be5b8ec', '566dbabaf9924c8497ebe44c4dc105da', '2', '148c9ef39d38491da5f95af6cac685c5', '2018-01-31', 'N');
INSERT INTO `hjxxld` VALUES ('e583225abe20441a94f34de5b03d477b', '566dbabaf9924c8497ebe44c4dc105da', '办公用品001', '067d8af984af4124a81dfdc7f723e327', '2018-01-31', 'N');

-- ----------------------------
-- Table structure for sbb
-- ----------------------------
DROP TABLE IF EXISTS `sbb`;
CREATE TABLE `sbb` (
  `sbid` varchar(32) NOT NULL,
  `pm` varchar(50) DEFAULT NULL,
  `dhrq` date DEFAULT NULL,
  `yjfl` varchar(50) DEFAULT NULL,
  `ejfl` varchar(50) DEFAULT NULL,
  `sjfl` varchar(50) DEFAULT NULL,
  `sccs` varchar(100) DEFAULT NULL,
  `scrq` varchar(255) DEFAULT NULL,
  `yws` varchar(50) DEFAULT NULL,
  `yxq` date DEFAULT NULL,
  `wbdh` varchar(50) DEFAULT NULL,
  `zcxh` varchar(50) DEFAULT NULL,
  `zcgg` varchar(2000) DEFAULT NULL,
  `xxcs` varchar(100) DEFAULT NULL,
  `zcbm` varchar(32) DEFAULT NULL,
  `dqzt` char(2) DEFAULT NULL,
  `wply` char(2) DEFAULT NULL,
  `wplydw` varchar(200) DEFAULT NULL,
  `cjsh` date DEFAULT NULL,
  `lx` varchar(2) DEFAULT NULL,
  `hjid` varchar(32) DEFAULT NULL,
  `sl` int(20) DEFAULT NULL,
  `dw` varchar(10) DEFAULT NULL,
  `isdel` varchar(1) DEFAULT 'N',
  `isly` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sbb
-- ----------------------------
INSERT INTO `sbb` VALUES ('hc0001', 'a耗材', '2018-01-30', '307466e08775427db18cb6eb0ba26b0e', '804379ca11b24496961eaf2ddaf11dd7', '', '1', '2018-01-30 00:00:00', '1', '2018-01-30', '1', '1', '1', '1517303264569.png', '66c467dcedf94c259f398c777190e395', '1', '1', '1', null, '2', '1d062855a79147a0aab3ce989b5586f6', '8', null, 'N', null);
INSERT INTO `sbb` VALUES ('hc0002', 't设备', '2018-01-08', '8d3ef265385e4f41b476c81796c47b3f', '', '', '', '2018-01-01 00:00:00', '天津市道可道网络技术有限公司天津市道可道网络技术有限公司', '2018-01-30', '12345678901', '阿萨德', '说的', '1517305534728.exe', '56bf07c32dbf402d8221fc00e637a0a9', '3', '1', '1', null, '1', 'a3f6df278db24d1ca760b6c1908ad9e5', '-1', null, 'N', null);
INSERT INTO `sbb` VALUES ('hc0003', '让设备', '2018-01-01', '办公耗材', '线缆', '', '1', '2018-01-01 00:00:00', '1', '2018-01-01', '1', '1', '1', '', '3a24290c69144fed876244829bc0070c', null, '1', '11', null, '2', null, '0', null, 'N', null);
INSERT INTO `sbb` VALUES ('hc0004', 'a1耗材', '2018-01-30', '307466e08775427db18cb6eb0ba26b0e', '804379ca11b24496961eaf2ddaf11dd7', '', '华为', '2018-01-01 00:00:00', '科技公司', '2018-01-30', '28174522', 'SQ-1', '正常', '1517296437911.jpg', '2f725c968b31414f9bb1c2827425592d', '1', '1', '科技单位', null, '2', '1d062855a79147a0aab3ce989b5586f6', '101', null, 'N', null);
INSERT INTO `sbb` VALUES ('hc0005', '耗材001', '2018-02-01', '307466e08775427db18cb6eb0ba26b0e', '804379ca11b24496961eaf2ddaf11dd7', '', '生产厂商', '2018-01-30 00:00:00', '运维商', '2018-02-10', '022', '0001-1', '大', '1517297284242.jpg', '2bfdad3e988c462da74462f806241241', null, '1', '天津市检察院', null, '2', null, '0', null, 'Y', null);
INSERT INTO `sbb` VALUES ('hc0006', '耗材002', '2018-02-03', '办公耗材', '线缆', '', '', '2018-01-31 00:00:00', '', null, '富士达', '', '', '', '1d3b204592724f449447d4655d0b4372', '1', '2', '', null, '2', '1d062855a79147a0aab3ce989b5586f6', '0', null, 'Y', null);
INSERT INTO `sbb` VALUES ('hc0007', '', null, '', '', '', '', null, '', null, '', '', '', '', 'a0193d9e587f4de198a8303aeba19333', null, '', '', null, '', null, '0', null, 'Y', null);
INSERT INTO `sbb` VALUES ('hc0008', 'A4纸', '2018-01-31', '307466e08775427db18cb6eb0ba26b0e', '', '', '生产厂商', '2018-01-30 00:00:00', '运维商', '2018-02-10', '维保电话', '资产型号', '资产规格', '1517379711440.jpg', '4e8a3864133046298b66f2ec2189f3c4', '1', '1', '单位', null, '2', 'e583225abe20441a94f34de5b03d477b', '-102', null, 'N', null);
INSERT INTO `sbb` VALUES ('sb0001', 'a设备', '2018-01-30', '8d3ef265385e4f41b476c81796c47b3f', 'd5584dadb8bd4019822f7a4b73a9dbed', '40349b348a934dd5a198b57fb601da58', '1', '2018-01-30 00:00:00', '1', '2018-01-30', '1', '1', '1', '', '9f0ffb640e3a4cc18917adfbdf6a4e09', '1', '1', '1', null, '1', '78e9149bdfa1442f9d5a2b65b0fd4ab3', '8', null, 'N', 'Y');
INSERT INTO `sbb` VALUES ('sb0002', 'b资产', '2018-01-23', '8d3ef265385e4f41b476c81796c47b3f', 'd5584dadb8bd4019822f7a4b73a9dbed', '40349b348a934dd5a198b57fb601da58', '1', '2018-01-30 00:00:00', '1', '2018-01-30', '1', '1', '1', '', '49f3dcf8c8954d72b5f791bcbaa224d4', '', '2', '1', null, '1', '', '-2', null, 'N', null);
INSERT INTO `sbb` VALUES ('sb0003', 'c设备', '2018-01-23', '8d3ef265385e4f41b476c81796c47b3f', 'd5584dadb8bd4019822f7a4b73a9dbed', '40349b348a934dd5a198b57fb601da58', 'sa', '2018-01-09 00:00:00', 'asd', '2018-01-09', '12323', 'dsfd', 'dfdf', '', 'eed7de925a7645cea68bf1087a97a10b', '3', '1', '111', null, '1', '1d062855a79147a0aab3ce989b5586f6', '-1', null, 'N', null);
INSERT INTO `sbb` VALUES ('sb0004', 'd设备', '2018-01-30', '8d3ef265385e4f41b476c81796c47b3f', 'd5584dadb8bd4019822f7a4b73a9dbed', '40349b348a934dd5a198b57fb601da58', 'asd', '2018-01-08 00:00:00', 'asd', '2018-01-09', '21323', 'dfdfd', '343sfdf', '', 'f9477b703f774ff4809be2ca01f2c41e', '3', '1', 'sasdad', null, '1', '1d062855a79147a0aab3ce989b5586f6', '-1', null, 'N', null);
INSERT INTO `sbb` VALUES ('sb0005', 'y设备', '2018-01-23', '设备资产', '存储设备', '', '阿萨德', '2018-01-08 00:00:00', '3233', '2018-01-08', '2343', '2', '1', '', '0ed40fd78d0e453da47b98952b9142df', null, '1', '1', null, '1', null, '0', null, 'N', null);
INSERT INTO `sbb` VALUES ('sb0006', 'b1资产', '2018-01-30', '8d3ef265385e4f41b476c81796c47b3f', 'd5584dadb8bd4019822f7a4b73a9dbed', '', '华为', '2017-12-31 00:00:00', '123', '2018-01-18', '28174855', '123', '123', '1517296718071.pdf', 'db7c1811b6e74af09f502954274e2f8f', '3', '1', '123', null, '1', 'c6d5944c07ea44fe8b622db89f8c90d5', '13', null, 'N', null);
INSERT INTO `sbb` VALUES ('sb0007', 'c1设备', '2018-01-28', '8d3ef265385e4f41b476c81796c47b3f', 'd5584dadb8bd4019822f7a4b73a9dbed', '', '123', '2018-01-09 00:00:00', '123', '2018-01-10', '123', '123', '123', '1517296644907.jpg', '7b95d43155f6441dbbb5bb5b565ad2fc', '3', '1', '123', null, '1', 'acf01ff54ede4a349e3842bff3b783f1', '-50', null, 'N', null);
INSERT INTO `sbb` VALUES ('sb0008', '1111', null, '8d3ef265385e4f41b476c81796c47b3f', '', '', '', null, '', null, '', '', '', '', '60374525fc5042048f8cafd8ea3693dd', null, '', '', null, '1', null, '0', null, 'Y', null);
INSERT INTO `sbb` VALUES ('sb0009', 'a2设备(暂存)', '2018-01-31', '8d3ef265385e4f41b476c81796c47b3f', 'd5584dadb8bd4019822f7a4b73a9dbed', '40349b348a934dd5a198b57fb601da58', '华为', '2018-01-09 00:00:00', '123', '2018-01-24', '1231', '123', '345', '1517297311199.jpg', '457af0fceb0f45f0a2e0278b14fc53aa', '1', '2', '34', null, '1', '1d062855a79147a0aab3ce989b5586f6', '-65', null, 'N', null);
INSERT INTO `sbb` VALUES ('sb0010', '设备001', '2018-01-30', '8d3ef265385e4f41b476c81796c47b3f', '24c6651c86e8411d80f257d467876bf8', '', '厂商', '2018-02-02 00:00:00', '运维商', '2018-01-22', '电话', '', '', '', 'abe44c3ba02447b9bb7c3e1920868169', '1', '1', '', null, '1', 'd86b681a091e441bb2adea3222df80e4', '-12', null, 'N', 'Y');
INSERT INTO `sbb` VALUES ('sb0011', '', null, '8d3ef265385e4f41b476c81796c47b3f', 'd5584dadb8bd4019822f7a4b73a9dbed', '', '', null, '', null, '', '', '', '', '5e29aa6ffc594bfba83eb2ca1868339f', null, '', '', null, '1', null, '0', null, 'Y', null);
INSERT INTO `sbb` VALUES ('sb0012', '1', null, '8d3ef265385e4f41b476c81796c47b3f', 'd5584dadb8bd4019822f7a4b73a9dbed', '', '', null, '', null, '', '', '', '', '116bfd85999241c39d83637245e743ad', null, '', '', null, '1', null, '0', null, 'N', null);
INSERT INTO `sbb` VALUES ('sb0013', '1', null, '8d3ef265385e4f41b476c81796c47b3f', '24c6651c86e8411d80f257d467876bf8', '', '', null, '', null, '', '', '', '', '451c8812976c40108aa4dd497518d11e', null, '', '', null, '1', null, '0', null, 'N', null);
INSERT INTO `sbb` VALUES ('sb0014', '清华同方显示器', '2018-01-28', '8d3ef265385e4f41b476c81796c47b3f', '24c6651c86e8411d80f257d467876bf8', '', '生产厂商', '2018-01-17 00:00:00', '运维商', '2018-02-23', '0.0.0..0.', 'ZCXH', '中件', '1517464086718.gif', '2a5b9cec66324ab3b51fc4d1608d52a3', null, '2', '物品来源单位', null, '1', null, '0', null, 'N', null);

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `department_id` varchar(100) NOT NULL DEFAULT '',
  `department_code` varchar(100) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `department_order` int(10) DEFAULT NULL,
  `isdel` int(10) DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('1', 'dkd', '道可道', '0', '0', '0');
INSERT INTO `sys_department` VALUES ('2', 'lybm1', '领用部门1', '1', '0', '0');
INSERT INTO `sys_department` VALUES ('275eb08bbbaa44d489bd2298ff809326', 'java', 'java组', '1', '0', '1');
INSERT INTO `sys_department` VALUES ('3cdf9ff16cf84d2c9fd11f7897259b41', 'jsp', 'jsp', '2', '0', '0');
INSERT INTO `sys_department` VALUES ('7a264ee7178e4b6b915745cf355bd625', '111', '111', '0', '1', '0');
INSERT INTO `sys_department` VALUES ('83c59fc0051d4e5381a2ceb43c2d96e0', 'java1', 'java1', '1', '0', '275eb08bbbaa44d489bd2298ff809326');
INSERT INTO `sys_department` VALUES ('bca87936645a47228172c6398a45eb16', 'asd', 'asd', '2', '1', '0');
INSERT INTO `sys_department` VALUES ('c3eded3d42dc4583864d30d43d7426a1', '', '', '0', '1', '1');
INSERT INTO `sys_department` VALUES ('dee6eca2437040038a4ccee0be489b50', 'net', 'net组', '2', '1', '1');

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `dictionary_id` varchar(100) NOT NULL,
  `dictionary_code` varchar(100) DEFAULT NULL,
  `dictionary_name` varchar(100) DEFAULT NULL,
  `dictionary_order` int(10) DEFAULT NULL,
  `isdel` int(10) DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('a477a73ccabb491987ca039d512ac14d', 'sex', '性别', '0', '0', '0');
INSERT INTO `sys_dictionary` VALUES ('ad4b04fc2ce14a63af92b0b8825bb9e0', 'man', '男', '0', '0', 'a477a73ccabb491987ca039d512ac14d');
INSERT INTO `sys_dictionary` VALUES ('de21d743e0ea498f9c778b88c6319178', 'woman', '女', '0', '0', 'a477a73ccabb491987ca039d512ac14d');
INSERT INTO `sys_dictionary` VALUES ('f789ef945daf4aa790601eccd89330e0', 'jsp', 'jsp', '0', '0', '0');
INSERT INTO `sys_dictionary` VALUES ('9cfb092965054c3b9215f340807097f0', 'jsp', 'jsp', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('dfa7b609122e42329b9b94c57ec51d29', 'jsp', 'jsp', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('c843a91d60384a2cb7dba02d2d673a4b', 'jsp', 'jsp', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('65949cae05e0447e828f891a0b0d2e3c', 'jsp', 'jsp', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('b5853a6d36d748a89b07cabf5b94fe49', 'jsp', 'jsp', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('17a0e4e988ca4ae5bcbf815f66dab016', 'jsp', 'jsp', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('f131d6d49867465e9b8b522fb2c16ae5', 'jsp', 'jsp', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('f39708fbbd99481f986320bba399ace8', 'jsp', 'jsp', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('dd5b6ca3a41a4939b60fb1ada449a8d1', 'jsp', 'jsp', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('f5e759dce8c940c392c5895e6b8a2e14', 'jsp', 'jsp', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('be4ff10d947a474d8e4f04711b6b36e1', 'jsp1', 'jsp1', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('38be8dddf8074beba0a131356c555d78', 'jsp2', 'jsp2', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('ccd5231e724a4e7f8a7ea66890aa8dee', 'asd', 'asd', '0', '1', '0');
INSERT INTO `sys_dictionary` VALUES ('6bddfb46f33b4f57bc56b2475b9bf060', 'aaa1', 'aaa1', '0', '0', 'a477a73ccabb491987ca039d512ac14d');
INSERT INTO `sys_dictionary` VALUES ('781850e48cc24b2ea6e58c26bdedbfdf', 'jsp11', 'jsp11', '0', '0', '0');
INSERT INTO `sys_dictionary` VALUES ('a67768d4a9704af0b055e3f438441e66', 'jcss', '基础设施', '0', '0', '0');
INSERT INTO `sys_dictionary` VALUES ('8d3ef265385e4f41b476c81796c47b3f', 'sbzc', '设备资产', '0', '0', 'a67768d4a9704af0b055e3f438441e66');
INSERT INTO `sys_dictionary` VALUES ('307466e08775427db18cb6eb0ba26b0e', 'bghc', '办公耗材', '0', '0', 'a67768d4a9704af0b055e3f438441e66');
INSERT INTO `sys_dictionary` VALUES ('d5584dadb8bd4019822f7a4b73a9dbed', 'fwq', '服务器', '0', '0', '8d3ef265385e4f41b476c81796c47b3f');
INSERT INTO `sys_dictionary` VALUES ('24c6651c86e8411d80f257d467876bf8', 'ccsb', '存储设备', '0', '0', '8d3ef265385e4f41b476c81796c47b3f');
INSERT INTO `sys_dictionary` VALUES ('40349b348a934dd5a198b57fb601da58', 'xj', '小机', '0', '0', 'd5584dadb8bd4019822f7a4b73a9dbed');
INSERT INTO `sys_dictionary` VALUES ('804379ca11b24496961eaf2ddaf11dd7', 'xl', '线缆', '0', '0', '307466e08775427db18cb6eb0ba26b0e');
INSERT INTO `sys_dictionary` VALUES ('d4578b32b257409d93cc624869461761', 'ckmc', '仓库名称', '0', '0', '0');
INSERT INTO `sys_dictionary` VALUES ('090bf182e8894ce5825819c9fa2bb607', 'A', 'A仓库', '0', '0', 'd4578b32b257409d93cc624869461761');
INSERT INTO `sys_dictionary` VALUES ('566dbabaf9924c8497ebe44c4dc105da', 'B', 'B仓库', '0', '0', 'd4578b32b257409d93cc624869461761');
INSERT INTO `sys_dictionary` VALUES ('d3a128d6d8554b499c90cb5212ac878b', 'C', 'c仓库', '0', '0', 'd4578b32b257409d93cc624869461761');
INSERT INTO `sys_dictionary` VALUES ('d8d578f8b4af43d8b9b4fd71263ddec6', 'D', 'D仓库', '0', '0', 'd4578b32b257409d93cc624869461761');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `resource_id` varchar(100) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `resource_code` varchar(100) DEFAULT NULL,
  `resource_name` varchar(100) DEFAULT NULL,
  `seq` varchar(100) DEFAULT NULL,
  `resource_icon` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('00b1f587fd6b4401b03867f39bc0b13e', 'RESOURCE_TYPE_REQUEST', '/role', '81a297e36ebe4084835ddc0f12bcf1f7', 'ROLE_SYSTEM_SYS_ROLE_GRANT', '授权', '3', '', '');
INSERT INTO `sys_resource` VALUES ('020d9a8ba73245aa992f379a9f2a695c', 'RESOURCE_TYPE_MENU', '/resource/resource.do', 'ec2dca42bc124023acf3c3a4c0949224', 'ROLE_SYSTEM_SYS_AUTH', '权限管理', '4', 'icon-folder', '1');
INSERT INTO `sys_resource` VALUES ('1ad277002e1d4dceaa88d571d49b4866', 'RESOURCE_TYPE_MENU', '/outwarehouse/sblyquery.do', 'e6fec32001ec42c78a33ebee374ccbb9', 'ROLE_REPERTORY_SBLYGL', '设备领用管理', '4', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('2216b13dbf6842e1a189c4a9bb5c5eec', 'RESOURCE_TYPE_MENU', 'none', '0', 'ROLE_EWMGL', '二维码管理', '4', 'icon-company', null);
INSERT INTO `sys_resource` VALUES ('222df7e87c1c4d659c3f56450b007447', 'RESOURCE_TYPE_REQUEST', '/dictionary/dictionaryEdit.do', 'ba02f07648804df89497a92ae7b97d8b', 'ROLE_SYSTEM_SYS_DIC_ADD', '新建编辑字典', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('25bc5d8c6de24ad294f3143d28721eb4', 'RESOURCE_TYPE_MENU', '/storage/query.do', 'e6fec32001ec42c78a33ebee374ccbb9', 'ROLE_REPERTORY_STORAGE', '入库管理', '1', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('2a6c7cebe87444b7a91f079e1b583590', 'RESOURCE_TYPE_MENU', '/department/department.do', 'ec2dca42bc124023acf3c3a4c0949224', 'ROLE_SYSTEM_SYS_DEP', '部门管理', '3', 'icon-folder', '1');
INSERT INTO `sys_resource` VALUES ('337f346c021147429d87f8456d4e77cf', 'RESOURCE_TYPE_MENU', '/storage/zcbfquery.do', 'e6fec32001ec42c78a33ebee374ccbb9', 'ROLE_REPERTORY_ZCBFGL', '资产报废管理', '7', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('3901fb646d2d4745b7ff7c2c46461d51', 'RESOURCE_TYPE_MENU', '/hjxxld/query.do', '93ef6bca4a16430c854396f34b9d4f02', 'ROLE_SBGL_HJXX', '货架信息管理', '2', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('46907cea4c644e8abdf5fdea9f57ea75', 'RESOURCE_TYPE_REQUEST', '/role/roleEdit.do', '81a297e36ebe4084835ddc0f12bcf1f7', 'ROLE_SYSTEM_SYS_ROLE_ADD', '新建编辑角色', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('4a6ec55ebf3e43a7996256a2ecd70d7f', 'RESOURCE_TYPE_REQUEST', '/user/userEdit.do', 'b003a8c771f3424fb061580bcf19e64d', 'ROLE_SYSTEM_SYS_USER_ADD', '新建编辑用户', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('64db9be64add4a1fbd307a77decb0699', 'RESOURCE_TYPE_REQUEST', '/dictionary/selectDictionaryByParentId.do', 'ba02f07648804df89497a92ae7b97d8b', 'ROLE_SYSTEM_SYS_DIC_QUERY', '查询字典', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('6c3266b1388c4f57b18b55b87d5b0534', 'RESOURCE_TYPE_MENU', '/sbb/list.do', '93ef6bca4a16430c854396f34b9d4f02', 'ROLE_SBGL_SBXXGL', '设备信息管理', '1', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('793ad55719e24c368fb23cdad8b0e93b', 'RESOURCE_TYPE_MENU', '/ewm/hjewm.do', '2216b13dbf6842e1a189c4a9bb5c5eec', 'ROLE_EWMGL_HJEWM', '货架二维码', '3', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('7d7a6e54bf194a25adc14adefdd868f5', 'RESOURCE_TYPE_REQUEST', '/role/deleteRole.do', '81a297e36ebe4084835ddc0f12bcf1f7', 'ROLE_SYSTEM_SYS_ROLE_DELETE', '删除角色', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('81a297e36ebe4084835ddc0f12bcf1f7', 'RESOURCE_TYPE_MENU', '/role/query.do', 'ec2dca42bc124023acf3c3a4c0949224', 'ROLE_SYSTEM_SYS_ROLE', '角色管理', '2', 'icon-folder', '1');
INSERT INTO `sys_resource` VALUES ('85d9ebb7be22471da09974e7169de652', 'RESOURCE_TYPE_MENU', '/storage/sbghquery.do', 'e6fec32001ec42c78a33ebee374ccbb9', 'ROLE_REPERTORY_SBGHGL', '设备归还管理', '6', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('8b8a116889c642a3b6e9e118d9c71dbd', 'RESOURCE_TYPE_REQUEST', '/user/deleteUser.do', 'b003a8c771f3424fb061580bcf19e64d', 'ROLE_SYSTEM_SYS_USER_DELETE', '删除用户', '2', '', '1');
INSERT INTO `sys_resource` VALUES ('93ef6bca4a16430c854396f34b9d4f02', 'RESOURCE_TYPE_MENU', 'none', '0', 'ROLE_SBGL', '设备信息管理', '2', 'icon-company', null);
INSERT INTO `sys_resource` VALUES ('a4c3865786234b1b9b3e038faa7a45e2', 'RESOURCE_TYPE_REQUEST', '/dictionary/deleteDictionary.do', 'ba02f07648804df89497a92ae7b97d8b', 'ROLE_SYSTEM_SYS_DIC_DELETE', '删除字典', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('aaf4e3c39f6146f6aec24623a98dbbde', 'RESOURCE_TYPE_REQUEST', '/role/query.do', '81a297e36ebe4084835ddc0f12bcf1f7', 'ROLE_SYSTEM_SYS_ROLE_QUERY', '查询角色', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('b003a8c771f3424fb061580bcf19e64d', 'RESOURCE_TYPE_MENU', '/user/query.do', 'ec2dca42bc124023acf3c3a4c0949224', 'ROLE_SYSTEM_SYS_USER', '用户管理', '1', 'icon-folder', '1');
INSERT INTO `sys_resource` VALUES ('b8b247b6bbcf42f7b2fe838b099cc884', 'RESOURCE_TYPE_MENU', '/outwarehouse/hclyquery.do', 'e6fec32001ec42c78a33ebee374ccbb9', 'ROLE_REPERTORY_HCLYGL', '耗材领用管理', '3', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('b8ecc5d6fb214bf3aed0e0170591abe6', 'RESOURCE_TYPE_REQUEST', '/resource/selectResourceByParentId.do', '020d9a8ba73245aa992f379a9f2a695c', 'ROLE_SYSTEM_SYS_AUTH_QUERY', '查询权限', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('ba02f07648804df89497a92ae7b97d8b', 'RESOURCE_TYPE_MENU', '/dictionary/dictionary.do', 'ec2dca42bc124023acf3c3a4c0949224', 'ROLE_SYSTEM_SYS_DIC', '字典管理', '5', 'icon-folder', '1');
INSERT INTO `sys_resource` VALUES ('ba112e06ea5a47f5867a78dc410d5338', 'RESOURCE_TYPE_MENU', '/ewm/sbewm.do', '2216b13dbf6842e1a189c4a9bb5c5eec', 'ROLE_EWMGL_SBEWM', '设备二维码', '1', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('beff37d43169448fa0bf81a5e8f501e9', 'RESOURCE_TYPE_REQUEST', '/department/deleteDepartment.do', '2a6c7cebe87444b7a91f079e1b583590', 'ROLE_SYSTEM_SYS_DEP_DELETE', '删除部门', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('c91cb339921d49968a05632decb4747c', 'RESOURCE_TYPE_MENU', '/outwarehouse/zctcquery.do', 'e6fec32001ec42c78a33ebee374ccbb9', 'ROLE_REPERTORY_ZCTCGL', '资产调出管理', '5', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('cdd151a8a8604df88208bc25b46d30b3', 'RESOURCE_TYPE_REQUEST', '/department/selectDepartmentByParentId.do', '2a6c7cebe87444b7a91f079e1b583590', 'ROLE_SYSTEM_SYS_DEP_QUERY', '查询部门', '2', '', '1');
INSERT INTO `sys_resource` VALUES ('d5f6b80337904117a50e579484f14370', 'RESOURCE_TYPE_MENU', '/storage/zcdrquery.do', 'e6fec32001ec42c78a33ebee374ccbb9', 'ROLE_REPERTORY_ZCDRGL', '资产调入管理', '2', 'icon-folder', null);
INSERT INTO `sys_resource` VALUES ('e6fec32001ec42c78a33ebee374ccbb9', 'RESOURCE_TYPE_MENU', 'none', '0', 'ROLE_REPERTORY', '库存管理', '3', 'icon-company', null);
INSERT INTO `sys_resource` VALUES ('ec2dca42bc124023acf3c3a4c0949224', 'RESOURCE_TYPE_MENU', 'none', '0', 'ROLE_SYSTEM_SYS', '系统管理', '1', 'icon-company', '1');
INSERT INTO `sys_resource` VALUES ('ec508eb2e71c43918805dfc36235924e', 'RESOURCE_TYPE_REQUEST', '/department/departmentEdit.do', '2a6c7cebe87444b7a91f079e1b583590', 'ROLE_SYSTEM_SYS_DEP_ADD', '新建编辑部门', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('f8685ecde6f740af9ccddf12baacee0c', 'RESOURCE_TYPE_REQUEST', '/user/query.do', 'b003a8c771f3424fb061580bcf19e64d', 'ROLE_SYSTEM_SYS_USER_QUERY', '查询用户', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('f8a864741630491c9b10dd267a19872c', 'RESOURCE_TYPE_REQUEST', '/resource/resourceEdit.do', '020d9a8ba73245aa992f379a9f2a695c', 'ROLE_SYSTEM_SYS_AUTH_ADD', '新建编辑权限', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('f9dc65f3f8ff477bb8a1414eede40a28', 'RESOURCE_TYPE_REQUEST', '/resource/deleteResource.do', '020d9a8ba73245aa992f379a9f2a695c', 'ROLE_SYSTEM_SYS_AUTH_DELETE', '删除权限', '1', '', '1');
INSERT INTO `sys_resource` VALUES ('fac7561404f34028baf8808f8ce44c97', 'RESOURCE_TYPE_MENU', '/ewm/bmewm.do', '2216b13dbf6842e1a189c4a9bb5c5eec', 'ROLE_EWMGL_BMEWM', '部门二维码', '2', 'icon-folder', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `isdel` int(10) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `role_level` int(10) DEFAULT NULL,
  `role_seq` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '0', '1', '0', null, 'asd');
INSERT INTO `sys_role` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'jsp角色', '0', null, '0', null, '按时大大');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `role_id` varchar(100) DEFAULT NULL,
  `resource_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'ec2dca42bc124023acf3c3a4c0949224');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'b003a8c771f3424fb061580bcf19e64d');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '4a6ec55ebf3e43a7996256a2ecd70d7f');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'f8685ecde6f740af9ccddf12baacee0c');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '8b8a116889c642a3b6e9e118d9c71dbd');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '81a297e36ebe4084835ddc0f12bcf1f7');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '46907cea4c644e8abdf5fdea9f57ea75');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '7d7a6e54bf194a25adc14adefdd868f5');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '00b1f587fd6b4401b03867f39bc0b13e');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '2a6c7cebe87444b7a91f079e1b583590');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'beff37d43169448fa0bf81a5e8f501e9');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'ec508eb2e71c43918805dfc36235924e');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'cdd151a8a8604df88208bc25b46d30b3');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '020d9a8ba73245aa992f379a9f2a695c');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'b8ecc5d6fb214bf3aed0e0170591abe6');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'f8a864741630491c9b10dd267a19872c');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'f9dc65f3f8ff477bb8a1414eede40a28');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'ba02f07648804df89497a92ae7b97d8b');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '222df7e87c1c4d659c3f56450b007447');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'a4c3865786234b1b9b3e038faa7a45e2');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '93ef6bca4a16430c854396f34b9d4f02');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '6c3266b1388c4f57b18b55b87d5b0534');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '3901fb646d2d4745b7ff7c2c46461d51');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'e6fec32001ec42c78a33ebee374ccbb9');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '25bc5d8c6de24ad294f3143d28721eb4');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'b8b247b6bbcf42f7b2fe838b099cc884');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '1ad277002e1d4dceaa88d571d49b4866');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'c91cb339921d49968a05632decb4747c');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', 'd5f6b80337904117a50e579484f14370');
INSERT INTO `sys_role_resource` VALUES ('4d8cd3882d1444e9aaff80620b4e0fed', '85d9ebb7be22471da09974e7169de652');
INSERT INTO `sys_role_resource` VALUES ('1', 'ec2dca42bc124023acf3c3a4c0949224');
INSERT INTO `sys_role_resource` VALUES ('1', 'b003a8c771f3424fb061580bcf19e64d');
INSERT INTO `sys_role_resource` VALUES ('1', '4a6ec55ebf3e43a7996256a2ecd70d7f');
INSERT INTO `sys_role_resource` VALUES ('1', 'f8685ecde6f740af9ccddf12baacee0c');
INSERT INTO `sys_role_resource` VALUES ('1', '8b8a116889c642a3b6e9e118d9c71dbd');
INSERT INTO `sys_role_resource` VALUES ('1', '81a297e36ebe4084835ddc0f12bcf1f7');
INSERT INTO `sys_role_resource` VALUES ('1', '46907cea4c644e8abdf5fdea9f57ea75');
INSERT INTO `sys_role_resource` VALUES ('1', '7d7a6e54bf194a25adc14adefdd868f5');
INSERT INTO `sys_role_resource` VALUES ('1', 'aaf4e3c39f6146f6aec24623a98dbbde');
INSERT INTO `sys_role_resource` VALUES ('1', '00b1f587fd6b4401b03867f39bc0b13e');
INSERT INTO `sys_role_resource` VALUES ('1', '2a6c7cebe87444b7a91f079e1b583590');
INSERT INTO `sys_role_resource` VALUES ('1', 'beff37d43169448fa0bf81a5e8f501e9');
INSERT INTO `sys_role_resource` VALUES ('1', 'ec508eb2e71c43918805dfc36235924e');
INSERT INTO `sys_role_resource` VALUES ('1', 'cdd151a8a8604df88208bc25b46d30b3');
INSERT INTO `sys_role_resource` VALUES ('1', '020d9a8ba73245aa992f379a9f2a695c');
INSERT INTO `sys_role_resource` VALUES ('1', 'b8ecc5d6fb214bf3aed0e0170591abe6');
INSERT INTO `sys_role_resource` VALUES ('1', 'f8a864741630491c9b10dd267a19872c');
INSERT INTO `sys_role_resource` VALUES ('1', 'f9dc65f3f8ff477bb8a1414eede40a28');
INSERT INTO `sys_role_resource` VALUES ('1', 'ba02f07648804df89497a92ae7b97d8b');
INSERT INTO `sys_role_resource` VALUES ('1', '222df7e87c1c4d659c3f56450b007447');
INSERT INTO `sys_role_resource` VALUES ('1', '64db9be64add4a1fbd307a77decb0699');
INSERT INTO `sys_role_resource` VALUES ('1', 'a4c3865786234b1b9b3e038faa7a45e2');
INSERT INTO `sys_role_resource` VALUES ('1', '93ef6bca4a16430c854396f34b9d4f02');
INSERT INTO `sys_role_resource` VALUES ('1', '6c3266b1388c4f57b18b55b87d5b0534');
INSERT INTO `sys_role_resource` VALUES ('1', '3901fb646d2d4745b7ff7c2c46461d51');
INSERT INTO `sys_role_resource` VALUES ('1', 'e6fec32001ec42c78a33ebee374ccbb9');
INSERT INTO `sys_role_resource` VALUES ('1', '25bc5d8c6de24ad294f3143d28721eb4');
INSERT INTO `sys_role_resource` VALUES ('1', 'd5f6b80337904117a50e579484f14370');
INSERT INTO `sys_role_resource` VALUES ('1', 'b8b247b6bbcf42f7b2fe838b099cc884');
INSERT INTO `sys_role_resource` VALUES ('1', '1ad277002e1d4dceaa88d571d49b4866');
INSERT INTO `sys_role_resource` VALUES ('1', 'c91cb339921d49968a05632decb4747c');
INSERT INTO `sys_role_resource` VALUES ('1', '85d9ebb7be22471da09974e7169de652');
INSERT INTO `sys_role_resource` VALUES ('1', '337f346c021147429d87f8456d4e77cf');
INSERT INTO `sys_role_resource` VALUES ('1', '2216b13dbf6842e1a189c4a9bb5c5eec');
INSERT INTO `sys_role_resource` VALUES ('1', 'fac7561404f34028baf8808f8ce44c97');
INSERT INTO `sys_role_resource` VALUES ('1', '793ad55719e24c368fb23cdad8b0e93b');
INSERT INTO `sys_role_resource` VALUES ('1', 'ba112e06ea5a47f5867a78dc410d5338');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `isuse` int(10) DEFAULT NULL,
  `isdel` int(10) DEFAULT NULL,
  `department_id` varchar(100) DEFAULT NULL,
  `ukey` varchar(100) DEFAULT NULL,
  `userip` varchar(100) DEFAULT NULL,
  `ism` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'b59c67bf196a4758191e42f76670ceba', '1', '0', '1', '1', '', 'N', '1', '', '1111111', 'admin');
INSERT INTO `sys_user` VALUES ('d7232a0fad1d4feea73037a6d32db71c', 'jsp', 'b59c67bf196a4758191e42f76670ceba', '1', '0', '83c59fc0051d4e5381a2ceb43c2d96e0', null, null, 'N', '1', '2018-01-24', '123213123123', 'jsp');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(100) DEFAULT NULL,
  `role_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('d7232a0fad1d4feea73037a6d32db71c', '4d8cd3882d1444e9aaff80620b4e0fed');
INSERT INTO `sys_user_role` VALUES ('1', '1');
SET FOREIGN_KEY_CHECKS=1;
