﻿# Host: localhost  (Version: 5.5.53)
# Date: 2019-01-04 22:27:46
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "t_area"
#

DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `Id` varchar(255) NOT NULL DEFAULT '',
  `area_code` varchar(255) DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `area_level` varchar(255) DEFAULT NULL,
  `parent_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "t_area"
#

/*!40000 ALTER TABLE `t_area` DISABLE KEYS */;
INSERT INTO `t_area` VALUES ('2c96763e66c3ea6e0166c3ea844f0000','130100','A','市','1'),('2c96763e66c3ea6e0166c3ea84860001','101','B','区','100'),('2c96763e66c3ea6e0166c3ea84870002','102','C','区','100'),('2c96763e66c3ea6e0166c3ea84890003','103','D','区','100'),('2c96763e66c3ea6e0166c3ea848c0004','104','E','区','100'),('2c96763e66c3ea6e0166c3ea848e0005','105','F','区','100'),('2c96763e66c3ea6e0166c3ea848f0006','106','G','区','100'),('2c96763e66c3ea6e0166c3ea84910007','107','H','区','100'),('2c96763e66c3ea6e0166c3ea84920008','108','I','区','100'),('2c96763e66c3ea6e0166c3ea84940009','109','J','区','100'),('2c96763e66c3ea6e0166c3ea8496000a','110','K','区','100'),('2c96763e66c3ea6e0166c3ea8497000b','111','L','区','100'),('2c96763e66c3ea6e0166c3ea8499000c','112','M','区','100'),('2c96763e66c3ea6e0166c3ea849b000d','113','N','区','100'),('2c96763e66c3ea6e0166c3ea849e000e','114','O','区','100'),('2c96763e66c3ea6e0166c3ea84a1000f','115','P','区','100'),('2c96763e66c3ea6e0166c3ea84a40010','116','Q','区','100'),('2c96763e66c3ea6e0166c3ea84a50011','117','R','区','100'),('2c96763e66c3ea6e0166c3ea84a70012','118','S','区','100'),('2c96763e66c3ea6e0166c3ea84a90013','119','T','区','100');
/*!40000 ALTER TABLE `t_area` ENABLE KEYS */;

#
# Structure for table "t_report"
#

DROP TABLE IF EXISTS `t_report`;
CREATE TABLE `t_report` (
  `id` varchar(55) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `html_path` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `report_name` varchar(255) DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `report_state` int(11) DEFAULT NULL,
  `report_tag` int(11) DEFAULT NULL,
  `report_type` int(11) DEFAULT NULL,
  `report_level` varchar(255) DEFAULT NULL,
  `area_id` varchar(255) DEFAULT NULL,
  `orderby_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "t_report"
#

INSERT INTO `t_report` VALUES ('2c962a6066f762db0166f763aa130000','2018-11-09 15:33:15',NULL,'','2r4g4evka','jhjkhk',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c962a6066f762db0166f766daca0001','2018-11-09 15:36:44',NULL,'','wr0mzdj309','djksd',1,'1',0,1,NULL,NULL,NULL,NULL),('2c962a606809967e016809991b2c0000','2019-01-01 21:27:35',NULL,'','xlrwcv','aaaaa_A',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c962a606809967e0168099a38c20001','2019-01-01 21:28:48',NULL,'','4j08wd','aaaaa_A',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c962a6068099b8d0168099bd6550000','2019-01-01 21:30:34',NULL,'','tp5nkxnublv','aaaaa_A',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c962a6068179383016817971a120000','2019-01-04 14:40:05',NULL,'','ra71ypw','text',1,'1',0,1,NULL,NULL,NULL,NULL),('2c962a606817a117016817a35a360013','2019-01-04 14:53:27',NULL,'','d8wc8c','text_A',1,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b01fdf0166b02065300000','2018-10-26 19:26:45',NULL,'','cc1d8thtdi','请输入问卷标题',1,'1',3,1,NULL,'1',NULL,NULL),('2c96763e66b0461e0166b04812f00000','2018-10-26 20:10:05',NULL,'','c49u6n','请输入问卷标题',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b0461e0166b048141e0001','2018-10-26 20:10:05',NULL,'','ooti8xy','请输入问卷标题',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b8f4620166b8fed9550000','2018-10-28 12:46:41',NULL,'','qcto8lu7kly','ewr',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b9b9340166b9ba03070000','2018-10-28 16:11:07',NULL,'','3pncr8r0','sdsdf',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b9bbac0166b9bc077d0000','2018-10-28 16:13:19',NULL,'','3l5mwrymiv','fgf',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b9c4a70166b9c64eb50000','2018-10-28 16:24:33',NULL,'','5gye1u8m1c','bjbc',1,'1',1,1,3,'2',NULL,NULL),('2c96763e66be4b690166be5072390000','2018-10-29 13:33:55',NULL,'','5afs5353','是事实',1,'1',1,1,NULL,'3',NULL,NULL),('2c96763e66bf27ab0166bf3bfcfa0000','2018-10-29 17:51:11',NULL,'','uxntbuz','dfdgf',1,'1',2,1,NULL,NULL,NULL,NULL),('2c96763e66bfbb970166bfbca5690000','2018-10-29 20:11:43',NULL,'','cmfgpp','测试报告',1,'2',2,1,NULL,'1',NULL,6),('2c96763e66bfbb970166bfd2c7680001','2018-10-29 20:35:53',NULL,'','okcz96','ds',1,'2',2,1,NULL,NULL,NULL,NULL),('2c96763e66c5187d0166c51cc2740000','2018-10-30 21:14:48',NULL,'','y6tcyj5muq','test',1,'2',2,1,NULL,NULL,NULL,NULL),('2c96763e66c5187d0166c554789d0001','2018-10-30 22:15:39',NULL,'','1z60jfg2','会更好',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66ce7e9d0166ce8bfe820000','2018-11-01 17:12:53',NULL,'','rdgt19','测试',1,'1',3,1,NULL,NULL,NULL,NULL),('2c96763e66ce7e9d0166cea75a640001','2018-11-01 17:42:46',NULL,'','5378frpbo','fjghjk',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66cea86f0166ceab40500000','2018-11-01 17:47:01',NULL,'','figgr1i','dfgf',1,'1',0,1,NULL,NULL,NULL,NULL),('ff80808166d2b71b0166d2e670780000','2018-11-02 13:30:09',NULL,'','51fx7i5','t',1,'2',0,1,NULL,NULL,NULL,NULL),('ff80808166d2b71b0166d300f31e0001','2018-11-02 13:59:06',NULL,'','39uyht','aaaaa',1,'2',0,1,NULL,NULL,NULL,NULL),('ff80808166d2b71b0166d307731f0002','2018-11-02 14:06:12',NULL,'','178mbzi','ttt',NULL,'2',0,1,NULL,NULL,NULL,NULL),('ff80808166d2b71b0166d3362bee0003','2018-11-02 14:57:14',NULL,'','b6sz03','zzzz',NULL,'1',0,1,NULL,NULL,NULL,NULL),('ff80808166d2b71b0166d336f0f90004','2018-11-02 14:58:05',NULL,'','plo6s363p','zzz',NULL,'2',0,1,NULL,NULL,NULL,NULL),('ff80808166d2b71b0166d33834750005','2018-11-02 14:59:27',NULL,'','r4vrddwbk2','zzzzzz',NULL,'2',0,1,NULL,NULL,NULL,NULL),('ff8080816811fcb101681206cb0e0003','2019-01-03 12:44:21',NULL,'','i3xy7bggm','table',1,'1',0,1,NULL,NULL,NULL,NULL);

#
# Structure for table "t_user"
#

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(55) NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `login_name` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sha_password` varchar(255) DEFAULT NULL,
  `city1` varchar(255) DEFAULT NULL,
  `city1_id` varchar(255) DEFAULT NULL,
  `city2` varchar(255) DEFAULT NULL,
  `city2_id` varchar(255) DEFAULT NULL,
  `city3` varchar(255) DEFAULT NULL,
  `city3_id` varchar(255) DEFAULT NULL,
  `role_type` int(11) DEFAULT NULL,
  `xx_id` varchar(255) DEFAULT NULL,
  `xx_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES ('1',NULL,'report_admin','超级管理员','7c4a8d09ca3762af61e59520943dc26494f8941b',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),('2',NULL,'editor','编辑','63057fcb4533306749a859df34309572ea42b553',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),('3',NULL,'reviewer','审核员','63057fcb4533306749a859df34309572ea42b553',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);

#
# Structure for table "tracker"
#

DROP TABLE IF EXISTS `tracker`;
CREATE TABLE `tracker` (
  `id` varchar(55) NOT NULL,
  `data_id` varchar(255) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `optime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "tracker"
#

/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;