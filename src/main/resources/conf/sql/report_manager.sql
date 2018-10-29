# Host: localhost  (Version: 5.5.53)
# Date: 2018-10-29 14:38:40
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "t_report"
#

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
  `report_level` int(11) DEFAULT NULL,
  `area_id` varchar(255) DEFAULT NULL,
  `orderby_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "t_report"
#

INSERT INTO `t_report` VALUES ('2c96763e66b01fdf0166b02065300000','2018-10-26 19:26:45',NULL,'','cc1d8thtdi','请输入问卷标题',1,'1',1,1,NULL,NULL,NULL,NULL),('2c96763e66b0461e0166b04812f00000','2018-10-26 20:10:05',NULL,'','c49u6n','请输入问卷标题',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b0461e0166b048141e0001','2018-10-26 20:10:05',NULL,'','ooti8xy','请输入问卷标题',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b8f4620166b8fed9550000','2018-10-28 12:46:41',NULL,'','qcto8lu7kly','ewr',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b9b9340166b9ba03070000','2018-10-28 16:11:07',NULL,'','3pncr8r0','sdsdf',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b9bbac0166b9bc077d0000','2018-10-28 16:13:19',NULL,'','3l5mwrymiv','fgf',NULL,'1',0,1,NULL,NULL,NULL,NULL),('2c96763e66b9c4a70166b9c64eb50000','2018-10-28 16:24:33',NULL,'','5gye1u8m1c','bjbc',1,'1',1,1,NULL,NULL,NULL,NULL),('2c96763e66be4b690166be5072390000','2018-10-29 13:33:55',NULL,'','5afs5353','tgftg',1,'1',1,1,NULL,NULL,NULL,NULL);

#
# Structure for table "t_user"
#

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
  `role_type` varchar(255) DEFAULT NULL,
  `xx_id` varchar(255) DEFAULT NULL,
  `xx_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES ('1',NULL,'report_admin','超级管理员','7c4a8d09ca3762af61e59520943dc26494f8941b',NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL),('2',NULL,'editer','编辑','63057fcb4533306749a859df34309572ea42b553',NULL,NULL,NULL,NULL,NULL,NULL,'2',NULL,NULL),('3',NULL,'reviewer','审核员','63057fcb4533306749a859df34309572ea42b553',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL);
