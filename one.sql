-- MySQL dump 10.13  Distrib 5.5.11, for Win64 (x86)
--
-- Host: localhost    Database: one
-- ------------------------------------------------------
-- Server version	5.5.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES UTF8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `authority_name` varchar(20) DEFAULT NULL COMMENT '权限名',
  `authority_url` varchar(200) DEFAULT '#' COMMENT '权限跳转地址',
  `parent` int(20) DEFAULT '0' COMMENT '记住上级的主键，0为一级节点',
  `flag` varchar(2) DEFAULT '0' COMMENT '1超级权限，0普通权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1,'入住管理','#',0,'0'),(2,'订单管理','#',0,'0'),(3,'会员管理','#',0,'0'),(4,'客房管理','#',0,'0'),(5,'系统用户管理','#',0,'0'),(6,'数据统计','#',0,'0'),(11,'入住信息管理','model/toShowInRoomInfo',1,'0'),(12,'入住信息添加','model/toAddInRoomInfo',1,'0'),(13,'消费记录','model/toShowRoomSale',1,'0'),(21,'订单查询','model/toShowOrders',2,'0'),(31,'会员信息管理','model/toShowVip',3,'0'),(32,'添加会员','model/toAddVip',3,'0'),(41,'客房信息管理','model/toShowRooms',4,'0'),(51,'角色信息管理','model/toShowRoles',5,'0'),(52,'用户信息管理','model/toShowUser',5,'0'),(53,'添加用户','model/toAddUser',5,'0'),(61,'数据分析','model/toShowIdd',6,'0');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_room_info`
--

DROP TABLE IF EXISTS `in_room_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `in_room_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_name` varchar(40) DEFAULT NULL COMMENT '客人姓名',
  `gender` varchar(2) DEFAULT '1' COMMENT '性别(1男 0女)',
  `is_vip` varchar(2) DEFAULT '0' COMMENT '0普通，1vip',
  `idcard` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `money` float(10,2) DEFAULT NULL COMMENT '押金',
  `create_date` datetime DEFAULT NULL COMMENT '入住时间',
  `room_id` int(20) DEFAULT NULL COMMENT '房间表主键',
  `status` varchar(2) DEFAULT '1' COMMENT '显示状态：1显示，0隐藏',
  `out_room_status` varchar(2) DEFAULT '0' COMMENT '退房状态：0未退房 1已经退房',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_room_info`
--

LOCK TABLES `in_room_info` WRITE;
/*!40000 ALTER TABLE `in_room_info` DISABLE KEYS */;
INSERT INTO `in_room_info` VALUES (17,'独角大仙','1','1','421234199909090099','13212321232',200.00,'2019-07-12 08:27:28',2,'1','0'),(18,'莫容龙城','1','1','421123198912120012','13212321232',800.00,'2019-07-06 08:27:52',8,'1','1'),(30,'貂蝉','0','1','421101016809098989','15699990008',900.00,'2019-07-19 15:06:42',3,'1','1'),(31,'貂蝉','0','1','421101016809098989','15699990008',800.00,'2019-07-19 15:07:39',4,'1','0'),(32,'玉帝','1','1','101101000001010001','13499998888',200.00,'2019-07-20 08:21:33',3,'1','1'),(33,'玉帝','1','1','101101000001010001','13499998888',500.00,'2019-07-20 08:23:31',7,'0','1'),(34,'貂蝉','0','1','421101016809098989','15699998899',600.00,'2019-11-13 08:40:52',6,'1','0'),(37,'莫容龙城','1','1','421123198912120012','13217788999',90.00,'2019-11-16 11:25:59',2,'1','0'),(38,'曹操','1','1','420101015809090808','13212321678',90.00,'2019-11-16 11:28:37',5,'1','1');
/*!40000 ALTER TABLE `in_room_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_num` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `order_money` double(10,2) DEFAULT NULL COMMENT '订单总价',
  `remark` varchar(100) DEFAULT NULL COMMENT '订单备注',
  `order_status` varchar(2) DEFAULT '0' COMMENT '0未结算，1已结算',
  `iri_id` int(20) DEFAULT NULL COMMENT '入住信息主键',
  `create_date` datetime DEFAULT NULL COMMENT '下单时间',
  `flag` varchar(2) DEFAULT '1' COMMENT '1显示，0隐藏',
  `order_other` varchar(100) DEFAULT NULL COMMENT '退房时的客人信息时间等等',
  `order_price` varchar(100) DEFAULT NULL COMMENT '退房时的各种金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (26,'20190714101518340139',342.00,'fff','0',17,'2019-07-14 10:15:18','1','8201,独角大仙,2019-07-12 08:27:28,2019-07-14 10:14:41,2','140,90,252.00'),(28,'20190714102326231267',3688.00,'kkk','0',18,'2019-07-14 10:23:26','1','8208,莫容龙城,2019-07-06 08:27:52,2019-07-14 10:23:19,8','500,88,3600.00'),(32,'20190719150739894799',216.00,'顾客更换过房间。。。','0',30,'2019-07-19 15:07:39','1','8203,貂蝉,2019-07-19 15:06:42,2019-07-19 15:07:39,1','140,90,126.00'),(33,'20190720082331720445',202.00,'顾客更换过房间。。。','0',32,'2019-07-20 08:23:31','1','8201,玉帝,2019-07-20 08:21:33,2019-07-20 08:23:31,1','140,90,112.00'),(34,'20190720083003165033',224.00,'顾客更换过房间。。。','0',33,'2019-07-20 08:30:03','1','8207,玉帝,2019-07-20 08:23:31,2019-07-20 08:30:03,1','180,80,144.00'),(35,'20190720084052052055',252.00,'顾客更换过房间。。。','0',31,'2019-07-20 08:40:52','0','8204,貂蝉,2019-07-19 15:07:39,2019-07-20 08:40:52,1','180,90,162.00'),(36,'20190730170009156145',2610.00,'你好。。','1',34,'2019-07-30 17:00:09','1','8206,貂蝉,2019-07-20 08:40:52,2019-07-30 17:00:00,10','280,90,2520.00'),(41,'20191116113734052489',342.00,'不错。。','1',38,'2019-11-16 11:37:34','1','8205,曹操,2019-11-16 11:28:37,2019-11-16 11:36:09,1','280,90,252');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_auth`
--

DROP TABLE IF EXISTS `role_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_auth` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(20) DEFAULT NULL COMMENT '角色id',
  `auth_id` int(20) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_auth`
--

LOCK TABLES `role_auth` WRITE;
/*!40000 ALTER TABLE `role_auth` DISABLE KEYS */;
INSERT INTO `role_auth` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,11),(8,1,12),(9,1,13),(10,1,21),(11,1,31),(12,1,32),(13,1,41),(15,1,51),(16,1,52),(17,1,53),(18,1,61),(19,2,1),(20,2,2),(21,2,3),(22,2,4),(24,2,11),(25,2,12),(26,2,13),(27,2,21),(28,2,31),(29,2,32),(30,2,41),(33,3,1),(34,3,2),(35,3,3),(36,3,4),(37,3,11),(38,3,12),(39,3,13),(40,3,21),(41,3,31),(42,3,32),(43,3,41);
/*!40000 ALTER TABLE `role_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(40) DEFAULT NULL COMMENT '角色名',
  `create_date` datetime DEFAULT NULL COMMENT '角色创建时间',
  `status` varchar(2) DEFAULT '0' COMMENT '角色禁用启用状态，1启用,0禁用',
  `flag` varchar(2) DEFAULT '0' COMMENT '1超級角色  0普通角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'超级管理员','2019-04-29 14:19:59','1','1'),(2,'主管','2019-05-05 15:04:35','1','1'),(3,'前台','2019-04-30 16:56:47','1','1');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_type` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `room_type_name` varchar(20) DEFAULT NULL COMMENT '房间类型名',
  `room_price` float(10,2) DEFAULT NULL COMMENT '房间的单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES (1,'单人间',180.00),(2,'双人间',180.00),(3,'豪华间',280.00),(5,'总统套房',500.00),(6,'钟点房',100.00),(7,'情侣套房',599.00),(8,'单人间带窗户',200.00),(9,'双人间(带窗户)',240.00),(12,'标准间',180.00),(13,'标准间12',122.00),(14,'棋牌室',210.00);
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `room_pic` varchar(255) DEFAULT NULL COMMENT '房屋封面图',
  `room_num` varchar(10) DEFAULT NULL COMMENT '房间编号',
  `room_status` varchar(2) DEFAULT '0' COMMENT '房间的状态(0空闲，1已入住，2打扫)',
  `room_type_id` int(20) DEFAULT NULL COMMENT '房间类型主键',
  `flag` int(4) DEFAULT NULL COMMENT '1表示显示0不显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (2,'http://q1ivuydqx.bkt.clouddn.com/4dd439bea9824a018c8851721a0d4ad1','8202','0',1,1),(3,'http://q1ivuydqx.bkt.clouddn.com/490b0ab29b3642afb0a5f9fb1405fbfc','8203','0',1,1),(4,'http://q1cydzrcd.bkt.clouddn.com/021a46c513ca4c588c263344faa01455','8204','1',2,1),(5,'http://q1ivuydqx.bkt.clouddn.com/a2234446511b4b70b425eb9df5272538','8205','0',3,1),(6,'http://q1ivuydqx.bkt.clouddn.com/f01e5c59549844c2809890e093ce3e58','8206','0',3,1),(7,'http://q1cydzrcd.bkt.clouddn.com/b62a7832f1714b59b602392f1a43c54c','8207','2',2,1),(8,'http://q1ivuydqx.bkt.clouddn.com/dd8caf4e467d4d80aa32d9013ea56000','8208','0',5,1),(9,'http://q1cydzrcd.bkt.clouddn.com/21bba6b8496f47ebadf1aa4e9948ea62','8209','0',3,1),(11,'http://q1ivuydqx.bkt.clouddn.com/10a23091a0d64bab84dc071b19ba422e','8211','0',1,1),(12,'http://q1cydzrcd.bkt.clouddn.com/9fefcbbfff9c45f88b9b487c31a7dd65','8212','1',3,1),(13,'http://q1cydzrcd.bkt.clouddn.com/c2f0815ce78645e5817c706b2cd1dd0e','8301','0',1,1),(14,'http://q1cydzrcd.bkt.clouddn.com/79a4c24e3d964ac4b470a1d7461b2a7f','8302','1',2,1),(16,'http://q1cydzrcd.bkt.clouddn.com/c563ffe0e5c644c784fef1eadf94f288','8304','0',3,1),(17,'http://q1cydzrcd.bkt.clouddn.com/0070bf6daff84d1397b6c52c1386bf5f','8305','1',3,1),(18,'http://q1cydzrcd.bkt.clouddn.com/87946c74a3d743169a715d07b43a79bf','8306','0',3,1),(19,'http://q1cydzrcd.bkt.clouddn.com/da1e78f878f44b8f83d384666a5a8512','8307','0',2,1),(21,'http://q1cydzrcd.bkt.clouddn.com/afe0ad3df5014625acb9ccac01713872','1111','0',2,1),(25,'http://q19du0avn.bkt.clouddn.com/bb8a314996cd41f0b6bae304cc2aa9d7','8788','0',5,1),(26,'http://q1ivuydqx.bkt.clouddn.com/169b2bce4a5f46c4871b800d03186dec','8333','0',1,1);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomsale`
--

DROP TABLE IF EXISTS `roomsale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomsale` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消费id',
  `room_num` varchar(100) DEFAULT NULL COMMENT '房间号',
  `customer_name` varchar(100) DEFAULT NULL COMMENT '客人姓名',
  `start_date` datetime DEFAULT NULL COMMENT '入住时间',
  `end_date` datetime DEFAULT NULL COMMENT '退房时间',
  `days` int(4) DEFAULT NULL COMMENT '天数',
  `room_price` double(22,0) DEFAULT NULL COMMENT '房屋单价',
  `rent_price` double(22,0) DEFAULT NULL COMMENT '住宿费',
  `other_price` double(22,0) DEFAULT NULL COMMENT '其它消费',
  `sale_price` double(22,0) DEFAULT NULL,
  `discount_price` double(22,0) DEFAULT NULL COMMENT '优惠金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomsale`
--

LOCK TABLES `roomsale` WRITE;
/*!40000 ALTER TABLE `roomsale` DISABLE KEYS */;
INSERT INTO `roomsale` VALUES (1003,'8204','莫容龙城','2019-07-03 08:33:58','2019-07-09 08:39:24',6,180,972,90,1062,0),(1004,'8208','莫容龙城','2019-07-06 08:27:52','2019-07-14 10:23:19',3,500,1200,88,1688,400),(1005,'8204','貂蝉','2019-07-19 15:07:39','2019-07-20 08:40:52',1,180,162,90,252,18),(1006,'8207','玉帝','2019-07-20 08:23:31','2019-07-20 08:30:03',1,180,144,80,224,36),(1008,'8203','貂蝉','2019-07-19 15:06:42','2019-07-19 15:07:39',1,140,126,90,216,14),(1009,'8205','曹操','2019-11-16 11:28:37','2019-11-16 11:36:09',1,280,252,90,342,28),(1010,'8206','貂蝉','2019-07-20 08:40:52','2019-07-30 17:00:00',10,280,2520,90,2610,280),(1011,'8201','玉帝','2019-07-20 08:21:33','2019-07-20 08:23:31',1,140,112,90,202,28),(1012,'8206','貂蝉','2019-07-20 08:40:52','2019-07-30 17:00:00',10,280,2520,90,2610,280),(1013,'8201','玉帝','2019-07-20 08:21:33','2019-07-20 08:23:31',1,140,112,90,202,28),(1014,'8201','你好','2021-03-12 00:00:28','2020-02-14 02:00:41',2,140,252,90,342,28),(1015,'8206','??','2022-04-20 00:00:52','2018-12-30 09:00:00',10,280,2520,90,2610,280);
/*!40000 ALTER TABLE `roomsale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(40) DEFAULT NULL COMMENT '账号',
  `pwd` varchar(40) DEFAULT NULL COMMENT '密码',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `use_status` varchar(2) DEFAULT '1' COMMENT '启用状态：1启用，0禁用',
  `is_admin` varchar(255) DEFAULT '0' COMMENT '1超级管理员，0普通管理员',
  `role_id` int(20) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','2018-09-20 14:20:19','1','0',1),(13,'lisi','e10adc3949ba59abbe56e057f20f883e','2019-04-29 14:45:50','1','1',2),(15,'zhangsan','e10adc3949ba59abbe56e057f20f883e','2019-05-05 16:01:31','1','1',3),(16,'zhaoliu','e10adc3949ba59abbe56e057f20f883e','2019-11-15 15:06:03','1','1',3),(20,'张三4','e10adc3949ba59abbe56e057f20f883e','2019-11-30 06:52:59','1','1',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip`
--

DROP TABLE IF EXISTS `vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vip_num` varchar(50) DEFAULT NULL COMMENT '会员卡编号',
  `customer_name` varchar(40) DEFAULT NULL COMMENT '会员姓名',
  `vip_rate` float(2,1) DEFAULT '0.9' COMMENT '1~9折',
  `idcard` varchar(20) DEFAULT NULL COMMENT '会员身份证',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `create_date` datetime DEFAULT NULL COMMENT '会员办理日期',
  `gender` varchar(2) DEFAULT '1' COMMENT '性别：1男 0女',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip`
--

LOCK TABLES `vip` WRITE;
/*!40000 ALTER TABLE `vip` DISABLE KEYS */;
INSERT INTO `vip` VALUES (1,'2019061010230302','莫容龙城',0.9,'421123198912120012','13217788999','2019-06-10 10:23:03','1'),(2,'2019061010244502','独角大仙',0.9,'421234199909090099','13212325645','2019-06-10 10:24:45','1'),(9,'2019071208290202','曹操',0.9,'420101015809090808','13212321678','2019-07-01 08:29:02','1'),(10,'2019071208295301','玉帝',0.8,'101101000001010001','13499997766','2019-07-09 08:29:53','1'),(11,'2019071208303802','貂蝉',0.9,'421101016809098989','15699998898','2019-07-10 08:30:38','0'),(12,'2019071208312301','吕布',0.8,'420101015909090888','15699997467','2019-07-12 08:31:23','1'),(16,'2019072015181102','李四',0.9,'420101015909090889','15655551246','2019-07-20 15:18:11','1'),(17,'2019072015271601','张三',0.8,'420101015909090884','13212377889','2019-07-20 15:27:16','0'),(18,'2019111917152102','小白',0.8,'421123198912120011','13212321232','2019-11-19 17:15:21','1');
/*!40000 ALTER TABLE `vip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-05  8:46:10
