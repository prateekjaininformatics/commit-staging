-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: craft
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (3,1,1,'icon_temp_01.png','image',68,68,3756,NULL,'2018-11-16 06:32:50','2018-11-16 06:32:50','2018-11-16 19:51:02','a108ba45-d80c-4c37-b9f5-1205456bbd48'),(5,1,1,'404.png','image',1156,602,135846,NULL,'2018-11-16 19:07:11','2018-11-16 19:51:01','2018-11-16 19:51:01','bfa9b164-2021-4131-a6c4-d89ed7e1bf52'),(6,1,1,'confindence.svg','image',38,38,411,NULL,'2018-11-16 19:07:22','2018-11-16 19:51:02','2018-11-16 19:51:02','0f2d7f3e-8a4a-4ff9-94d7-9ee8090084fd'),(7,1,1,'hiring.svg','image',163,145,4131,NULL,'2018-11-16 19:07:08','2018-11-16 19:51:02','2018-11-16 19:51:02','a5619254-383d-45ff-ace2-eb22e832d545'),(8,1,1,'apple-touch-icon.png','image',180,180,5098,NULL,'2018-11-16 19:07:13','2018-11-16 19:51:02','2018-11-16 19:51:02','de36ce33-31ff-4984-84c2-5a1773aef83e'),(9,1,1,'google.png','image',30,30,624,NULL,'2018-11-16 19:07:29','2018-11-16 19:51:02','2018-11-16 19:51:02','3441f775-0664-4545-85e4-a567c30b8660'),(10,1,1,'forward-chevron.svg','image',9,19,651,NULL,'2018-11-16 19:07:23','2018-11-16 19:51:02','2018-11-16 19:51:02','e2a0de14-d735-4155-a6d3-177c2eca8676'),(11,1,1,'fb.svg','image',30,30,421,NULL,'2018-11-16 19:07:12','2018-11-16 19:51:02','2018-11-16 19:51:02','3d368f27-cc17-4c71-b969-12f528b9d0d6'),(12,1,1,'fb.png','image',30,30,324,NULL,'2018-11-16 19:07:16','2018-11-16 19:51:02','2018-11-16 19:51:02','8f0b233b-f306-4230-a701-5eefb85c824d'),(13,1,1,'facebook-icon.svg','image',38,38,807,NULL,'2018-11-16 19:07:17','2018-11-16 19:51:02','2018-11-16 19:51:02','fd43725d-c787-4285-9286-72b956a0179c'),(14,1,1,'edu.svg','image',161,145,2765,NULL,'2018-11-16 19:07:18','2018-11-16 19:51:03','2018-11-16 19:51:03','3d3b9387-13d2-4566-a2bc-46b7b6c88dcb'),(15,1,1,'contact-arrow.svg','image',13,8,190,NULL,'2018-11-16 19:07:23','2018-11-16 19:51:03','2018-11-16 19:51:03','b0155dfd-8a90-482b-b5a7-fa7c1847eb41'),(16,1,1,'commit-logo.svg','image',142,49,7178,NULL,'2018-11-16 19:07:32','2018-11-16 19:51:03','2018-11-16 19:51:03','e764cde1-e61f-4f56-8951-8d612ff6a016'),(17,1,1,'information.svg','image',32,32,317,NULL,'2018-11-16 19:07:09','2018-11-16 19:51:03','2018-11-16 19:51:03','6b904d9a-a7b5-4691-b9b0-86733f440f75'),(18,1,1,'commit-logo-2.svg','image',83,18,2201,NULL,'2018-11-16 19:30:42','2018-11-16 19:51:03','2018-11-16 19:51:03','1956ae6d-6082-49dc-a67e-5fde6d3c3f1e'),(19,1,1,'commit-foundation_transition-mentoring-workshops_trajectory.jpg','image',500,550,24295,NULL,'2018-11-16 19:07:17','2018-11-16 19:51:03','2018-11-16 19:51:03','d0c7a75c-5917-4592-b7f9-29b68dc76477'),(20,1,1,'commit-foundation_transition-mentoring-workshops_pursuit.jpg','image',1708,900,228520,NULL,'2018-11-16 19:07:15','2018-11-16 19:51:03','2018-11-16 19:51:03','159e3782-162d-4dcc-a68e-b695b9cf3a48'),(21,1,1,'commit-foundation_transition-mentoring-workshops_mentorship.jpg','image',2000,1333,204313,NULL,'2018-11-16 19:07:27','2018-11-16 19:51:03','2018-11-16 19:51:03','8ffc6b44-ce47-4745-9120-6202639cb7e3'),(22,1,1,'commit-foundation_transition-mentoring-workshops_map.png','image',2000,878,132943,NULL,'2018-11-16 19:07:30','2018-11-16 19:51:03','2018-11-16 19:51:03','18733241-7b84-4aba-a819-fe1521f553cb'),(23,1,1,'commit-foundation_transition-mentoring-workshops_map.jpg','image',2000,1101,177292,NULL,'2018-11-16 19:07:31','2018-11-16 19:51:03','2018-11-16 19:51:03','e9bc5745-67dc-45f3-8b70-a2259aabf66d'),(24,1,1,'commit-foundation_transition-mentoring-workshops_changin-perception.jpg','image',500,550,24048,NULL,'2018-11-16 19:07:28','2018-11-16 19:51:04','2018-11-16 19:51:04','02dec281-5107-4382-baf3-df24155aa573'),(25,1,1,'commit-foundation_transition-mentoring-workshops_banner.jpg','image',2000,1577,220114,NULL,'2018-11-16 19:07:33','2018-11-16 19:51:04','2018-11-16 19:51:04','df88db0c-5995-483d-901d-cd3f59826576'),(26,1,1,'commit-foundation_transition-mentoring-workshops_attend.jpg','image',2000,1494,163161,NULL,'2018-11-16 19:07:19','2018-11-16 19:51:04','2018-11-16 19:51:04','232fdb27-20df-4375-bc56-2174978822f2'),(27,1,1,'commit-foundation_team_banner.jpg','image',2000,1334,91006,NULL,'2018-11-16 19:07:09','2018-11-16 19:51:04','2018-11-16 19:51:04','39b490eb-dc22-4cf6-80a7-89dcfbea73ff'),(28,1,1,'imagination.svg','image',32,32,755,NULL,'2018-11-16 19:07:18','2018-11-16 19:51:04','2018-11-16 19:51:04','e342872f-2847-4eed-a9df-90f042a586cc'),(29,1,1,'left-arrow-red.svg','image',10,14,187,NULL,'2018-11-16 19:07:25','2018-11-16 19:51:04','2018-11-16 19:51:04','30ad97b3-4831-45f6-8cd0-c0368919c539'),(30,1,1,'commit-foundation_partners_banner.jpg','image',2000,1494,250646,NULL,'2018-11-16 19:07:28','2018-11-16 19:51:04','2018-11-16 19:51:04','e587bfeb-dee8-466a-9f1f-0186414253ae'),(31,1,1,'quotation-white.svg','image',37,27,746,NULL,'2018-11-16 19:07:19','2018-11-16 19:51:04','2018-11-16 19:51:04','d7140bab-194d-4d15-b347-3952ad5d726e'),(32,1,1,'vertical-rule.svg','image',3,46,157,NULL,'2018-11-16 19:07:23','2018-11-16 19:51:04','2018-11-16 19:51:04','2c194136-612e-46c5-a28f-56b14ce45058'),(33,1,1,'vertical-rule-blue.svg','image',3,46,157,NULL,'2018-11-16 19:07:09','2018-11-16 19:51:05','2018-11-16 19:51:05','db60e529-bec4-48bf-a0b8-7605ea5cd77c'),(34,1,1,'twitter.svg','image',30,30,795,NULL,'2018-11-16 19:07:28','2018-11-16 19:51:05','2018-11-16 19:51:05','7581444a-014f-4268-bebe-8afb08ada3b8'),(35,1,1,'twitter.png','image',30,30,520,NULL,'2018-11-16 19:07:21','2018-11-16 19:51:05','2018-11-16 19:51:05','4c2c3527-185c-4eef-a48a-cc5846631676'),(36,1,1,'twitter-icon.svg','image',38,38,995,NULL,'2018-11-16 19:07:08','2018-11-16 19:51:05','2018-11-16 19:51:05','41d87963-92ed-4b49-9dd8-f122ea6a01af'),(37,1,1,'slider-controls.svg','image',48,158,799,NULL,'2018-11-16 19:07:26','2018-11-16 19:51:05','2018-11-16 19:51:05','b86d79a6-223a-452a-8225-a0d3ce6d1315'),(38,1,1,'right-arrow.svg','image',18,25,410,NULL,'2018-11-16 19:07:09','2018-11-16 19:51:05','2018-11-16 19:51:05','017859c9-b999-42e2-9242-68cba75e4e68'),(39,1,1,'right-arrow-blue.svg','image',18,25,413,NULL,'2018-11-16 19:07:20','2018-11-16 19:51:05','2018-11-16 19:51:05','b7f1d84d-943b-438c-a3b4-200ea3f11c95'),(40,1,1,'retain.svg','image',494,460,17900,NULL,'2018-11-16 19:07:14','2018-11-16 19:51:05','2018-11-16 19:51:05','6b221035-b372-4649-850e-e5b9da57fa7a'),(41,1,1,'quote-slider-controls.svg','image',48,158,784,NULL,'2018-11-16 19:07:31','2018-11-16 19:51:05','2018-11-16 19:51:05','3fd0c3b1-e326-42e3-9147-6fb959a7ab91'),(42,1,1,'quotation-red.svg','image',37,27,750,NULL,'2018-11-16 19:07:10','2018-11-16 19:51:05','2018-11-16 19:51:05','4563204b-af29-4ad1-bbcc-1ea1110121d1'),(43,1,1,'lib.svg','image',147,145,3719,NULL,'2018-11-16 19:07:29','2018-11-16 19:51:05','2018-11-16 19:51:05','57f5c872-4f9e-4c7b-8abf-337212cb14c2'),(44,1,1,'mobile-slider-controls.svg','image',55,10,398,NULL,'2018-11-16 19:07:15','2018-11-16 19:51:06','2018-11-16 19:51:06','b61d7c8a-8dbe-4011-b743-4adbb1259899'),(45,1,1,'mobile-quote-slider-controls.svg','image',55,10,398,NULL,'2018-11-16 19:07:11','2018-11-16 19:51:06','2018-11-16 19:51:06','8a8cb131-0875-4cb6-b33b-2baa033429eb'),(46,1,1,'mobile-commit-circle.svg','image',569,562,8290,NULL,'2018-11-16 19:07:20','2018-11-16 19:51:06','2018-11-16 19:51:06','bb14dd20-ad0a-4dbd-a583-51cd3f0a7dcd'),(47,1,1,'mission-icon.svg','image',80,80,1647,NULL,'2018-11-16 19:07:08','2018-11-16 19:51:06','2018-11-16 19:51:06','05dcb0fc-3f08-4da7-aad0-aa377160f050'),(48,1,1,'MA_Square.png','image',172,172,5202,NULL,'2018-11-16 19:45:19','2018-11-16 19:51:06','2018-11-16 19:51:06','7373a12c-403c-4f15-bdc8-4ec3fdc55f1e'),(49,1,1,'login-icon.svg','image',19,22,578,NULL,'2018-11-16 19:07:15','2018-11-16 19:51:06','2018-11-16 19:51:06','c59ca4f7-7694-4b77-b292-c985358921cb'),(50,1,1,'linkedin-icon.svg','image',38,38,680,NULL,'2018-11-16 19:07:19','2018-11-16 19:51:06','2018-11-16 19:51:06','98b04227-ed6e-496a-bcce-64d9438f04b0'),(51,1,1,'linked-in.svg','image',30,30,283435,NULL,'2018-11-16 19:07:14','2018-11-16 19:51:06','2018-11-16 19:51:06','8994d436-afd1-4ac0-8ff5-5c29feae45e6'),(52,1,1,'linked-in.png','image',30,30,511,NULL,'2018-11-16 19:07:16','2018-11-16 19:51:06','2018-11-16 19:51:06','4a00282e-e2dd-441a-8c41-d58adb64e560'),(53,1,1,'commit-foundation_partners_footer.jpg','image',2000,1333,107589,NULL,'2018-11-16 19:07:16','2018-11-16 19:51:06','2018-11-16 19:51:06','fd4ca559-64a1-4891-bcf6-8f40ec27bfbf'),(54,1,1,'google.svg','image',30,30,640,NULL,'2018-11-16 19:07:20','2018-11-16 19:51:06','2018-11-16 19:51:06','669d7ecf-79b1-4eb8-a02e-3417ecf4980e'),(55,1,1,'commit-foundation_partners_article1.jpg','image',400,350,7918,NULL,'2018-11-16 19:07:20','2018-11-16 19:51:07','2018-11-16 19:51:07','fb77a668-4e30-4479-858f-d0ad040517b9'),(56,1,1,'commit-foundation_digital-library_dl-2.jpg','image',350,250,21094,NULL,'2018-11-16 19:07:32','2018-11-16 19:51:07','2018-11-16 19:51:07','c1cb3c6b-e069-42da-86a7-ad3f33ff414d'),(57,1,1,'commit-foundation_digital-library_study.jpg','image',1347,900,101448,NULL,'2018-11-16 19:07:18','2018-11-16 19:51:07','2018-11-16 19:51:07','de379728-1ec2-4bfe-bc9f-9935edb2e177'),(58,1,1,'commit-foundation_digital-library_footer.jpg','image',2000,1333,240646,NULL,'2018-11-16 19:07:19','2018-11-16 19:51:07','2018-11-16 19:51:07','d21fc4c9-9f3c-4f6e-a6e8-ed21e4d33963'),(59,1,1,'commit-foundation_digital-library_dl-9.jpg','image',350,250,17807,NULL,'2018-11-16 19:07:13','2018-11-16 19:51:07','2018-11-16 19:51:07','35b000d1-cd0b-443b-b013-e13f78564c04'),(60,1,1,'commit-foundation_digital-library_dl-8.jpg','image',350,250,20699,NULL,'2018-11-16 19:07:14','2018-11-16 19:51:07','2018-11-16 19:51:07','1c25ceef-8070-4c51-8a6c-5b168604fa22'),(61,1,1,'commit-foundation_digital-library_dl-7.jpg','image',350,250,15915,NULL,'2018-11-16 19:07:29','2018-11-16 19:51:07','2018-11-16 19:51:07','31f0c641-04d5-4c64-b2dc-12bebdb899b4'),(62,1,1,'commit-foundation_one-to-transition_assistance.jpg','image',2000,1333,219587,NULL,'2018-11-16 19:07:23','2018-11-16 19:51:07','2018-11-16 19:51:07','49d70d43-667a-4489-8187-186a8f2a652f'),(63,1,1,'commit-foundation_digital-library_dl-6.jpg','image',350,250,22018,NULL,'2018-11-16 19:07:28','2018-11-16 19:51:07','2018-11-16 19:51:07','9c09433d-6288-46bb-ad92-bc8b2b569b90'),(64,1,1,'commit-foundation_digital-library_dl-5.jpg','image',350,250,13458,NULL,'2018-11-16 19:07:24','2018-11-16 19:51:07','2018-11-16 19:51:07','966c5223-86ee-4f0e-ab07-21ab0f51bff9'),(65,1,1,'commit-foundation_digital-library_dl-4.jpg','image',350,250,17575,NULL,'2018-11-16 19:07:26','2018-11-16 19:51:08','2018-11-16 19:51:08','4390fe21-37c8-4339-8711-f8c752e3bd0c'),(66,1,1,'commit-foundation_digital-library_dl-3.jpg','image',350,250,12933,NULL,'2018-11-16 19:07:29','2018-11-16 19:51:08','2018-11-16 19:51:08','7a192b50-8a06-4dce-88a3-7950dbff74c5'),(67,1,1,'commit-foundation_digital-library_dl-1.jpg','image',350,250,15728,NULL,'2018-11-16 19:07:32','2018-11-16 19:51:08','2018-11-16 19:51:08','386c71cd-a03a-407f-99c0-f5bfc8402d2d'),(68,1,1,'commit-foundation_donate_2500.jpg','image',400,250,13066,NULL,'2018-11-16 19:07:22','2018-11-16 19:51:08','2018-11-16 19:51:08','df384ad1-6a42-42f3-b862-e97915cd9ef4'),(69,1,1,'commit-foundation_digital-library_banner.jpg','image',2000,1333,118470,NULL,'2018-11-16 19:07:10','2018-11-16 19:51:08','2018-11-16 19:51:08','b26488d0-1e72-4f37-8bb1-5948647c5d4e'),(70,1,1,'commit-foundation_corporate-education_miconceptions.jpg','image',1350,900,71189,NULL,'2018-11-16 19:07:17','2018-11-16 19:51:08','2018-11-16 19:51:08','3e3e482d-8663-4664-b261-bbf1e3786e2b'),(71,1,1,'commit-foundation_corporate-education_footer.jpg','image',2000,1334,112770,NULL,'2018-11-16 19:07:16','2018-11-16 19:51:08','2018-11-16 19:51:08','45a08fdf-9ded-447f-847c-bbaf7a616776'),(72,1,1,'commit-foundation_corporate-education_banner.jpg','image',2000,1494,155377,NULL,'2018-11-16 19:07:25','2018-11-16 19:51:08','2018-11-16 19:51:08','1b2205fc-fd9c-4793-9740-15a37d4969a1'),(73,1,1,'commit-foundation_contact_shake.jpg','image',1518,900,72030,NULL,'2018-11-16 19:07:17','2018-11-16 19:51:08','2018-11-16 19:51:08','c9b16872-6e90-4379-9984-afd3f562126e'),(74,1,1,'commit-foundation_contact_banner.png','image',2000,1333,1962126,NULL,'2018-11-16 19:07:14','2018-11-16 19:51:09','2018-11-16 19:51:09','b5768597-657c-4ebc-b957-8c7e1e5aa433'),(75,1,1,'commit-foundation_contact_banner.jpg','image',2000,1333,68040,NULL,'2018-11-16 19:07:13','2018-11-16 19:51:09','2018-11-16 19:51:09','e14b166d-df62-41e0-9bd5-4f0555c6d387'),(76,1,1,'commit-circle.svg','image',569,562,8623,NULL,'2018-11-16 19:07:21','2018-11-16 19:51:09','2018-11-16 19:51:09','3197d119-71f8-4742-9788-65bcaf142a7d'),(77,1,1,'calendar-icon.svg','image',34,34,1100,NULL,'2018-11-16 19:07:16','2018-11-16 19:51:09','2018-11-16 19:51:09','82442c29-4222-4a0b-823b-d286feed6026'),(78,1,1,'back-chevron.svg','image',9,19,170,NULL,'2018-11-16 19:07:21','2018-11-16 19:51:09','2018-11-16 19:51:09','c58f489c-17a9-49d0-8a98-17b47d8041cc'),(79,1,1,'apply-icon.svg','image',25,32,1419,NULL,'2018-11-16 19:07:24','2018-11-16 19:51:09','2018-11-16 19:51:09','34b54eed-da64-4fc4-92a0-920df00ca56a'),(80,1,1,'commit-foundation_donate_100.jpg','image',400,250,11476,NULL,'2018-11-16 19:07:17','2018-11-16 19:51:09','2018-11-16 19:51:09','c5079207-49a2-48b9-a7cf-a678e206f634'),(81,1,1,'vimeo-icon.svg','image',38,38,952,NULL,'2018-11-16 19:07:25','2018-11-16 19:51:09','2018-11-16 19:51:09','ef0fab90-e8cc-49fb-8108-53b2c60ddb56'),(82,1,1,'commit-foundation_donate_500.jpg','image',400,250,10637,NULL,'2018-11-16 19:07:17','2018-11-16 19:51:10','2018-11-16 19:51:10','17f8c8ff-5885-4661-95dd-b7bfa642243c'),(83,1,1,'commit-foundation_news-big.jpg','image',960,640,426039,NULL,'2018-11-16 19:07:11','2018-11-16 19:51:10','2018-11-16 19:51:10','ec6ec579-518e-41a7-9529-90cf2c9ad42d'),(84,1,1,'commit-foundation_donate_banner.jpg','image',2000,1125,145784,NULL,'2018-11-16 19:07:12','2018-11-16 19:51:10','2018-11-16 19:51:10','0df0e585-187a-44e1-8b52-c2b0cd5ee6c2'),(85,1,1,'commit-foundation_mentor_banner.jpg','image',2000,1333,416295,NULL,'2018-11-16 19:07:18','2018-11-16 19:51:10','2018-11-16 19:51:10','e05b3d25-7f6c-4513-bbbf-a5a6929634b8'),(86,1,1,'commit-foundation_mentor_encouraging.jpg','image',500,550,27683,NULL,'2018-11-16 19:07:11','2018-11-16 19:51:10','2018-11-16 19:51:10','c4b09744-0222-4205-87b9-fc40a56193f8'),(87,1,1,'commit-foundation_mentor_honest.jpg','image',500,550,37500,NULL,'2018-11-16 19:07:21','2018-11-16 19:51:10','2018-11-16 19:51:10','291bf64d-70ac-4586-a70a-ad9568638c0d'),(88,1,1,'commit-foundation_home_news.jpg','image',800,640,43548,NULL,'2018-11-16 19:07:15','2018-11-16 19:51:10','2018-11-16 19:51:10','dffca78d-4191-4d0c-9d6e-21906c4fe034'),(89,1,1,'commit-foundation_mission_banner.jpg','image',2000,1115,54175,NULL,'2018-11-16 19:07:27','2018-11-16 19:51:10','2018-11-16 19:51:10','168e75a6-f77f-4385-a3bd-82331c72f491'),(90,1,1,'commit-foundation_mission_flag.jpg','image',1112,900,36897,NULL,'2018-11-16 19:07:32','2018-11-16 19:51:10','2018-11-16 19:51:10','941646d7-a9c4-45f3-b63f-5b0eccde226b'),(91,1,1,'commit-foundation_mission_objective.jpg','image',500,550,32029,NULL,'2018-11-16 19:07:23','2018-11-16 19:51:11','2018-11-16 19:51:11','36318655-e4eb-410f-8d48-1f497d973525'),(92,1,1,'commit-foundation_mission_support.jpg','image',2000,1333,197872,NULL,'2018-11-16 19:07:30','2018-11-16 19:51:11','2018-11-16 19:51:11','48bf9e4e-feab-4f09-a331-12982b8c3079'),(93,1,1,'commit-foundation_news-article3.jpg','image',400,350,24379,NULL,'2018-11-16 19:07:22','2018-11-16 19:51:11','2018-11-16 19:51:11','533c61bc-f781-40d2-80d4-200bf25b1dd1'),(94,1,1,'commit-foundation_mission_big.jpg','image',2000,1333,93487,NULL,'2018-11-16 19:07:28','2018-11-16 19:51:11','2018-11-16 19:51:11','2e1f34dc-8ad2-4a2f-bf49-afe15c0952f1'),(95,1,1,'commit-foundation_news_article2.jpg','image',400,350,15063,NULL,'2018-11-16 19:07:18','2018-11-16 19:51:11','2018-11-16 19:51:11','78e048b3-411a-4664-8873-d72e31f05bb9'),(96,1,1,'commit-foundation_home_corporate_education.jpg','image',2000,1336,82732,NULL,'2018-11-16 19:07:16','2018-11-16 19:51:11','2018-11-16 19:51:11','fbf8ef41-4ab7-4f87-a746-c0d07b1908f3'),(97,1,1,'commit-foundation_events_banner.jpg','image',2000,1494,235445,NULL,'2018-11-16 19:07:31','2018-11-16 19:51:11','2018-11-16 19:51:11','f4117909-9a9c-4c45-917b-f09ae1ecf05a'),(98,1,1,'commit-foundation_news_banner.jpg','image',2000,1494,168789,NULL,'2018-11-16 19:07:22','2018-11-16 19:51:11','2018-11-16 19:51:11','97d2c4b8-6346-4771-a397-dc95be4c87a9'),(99,1,1,'commit-foundation_home_aims.jpg','image',2000,1333,142479,NULL,'2018-11-16 19:07:33','2018-11-16 19:51:11','2018-11-16 19:51:11','3c944929-d546-4630-a685-49ba04bc9ac2'),(100,1,1,'commit-foundation_home_banner.jpg','image',2000,1333,141538,NULL,'2018-11-16 19:07:12','2018-11-16 19:51:12','2018-11-16 19:51:12','e9d78a3c-fa33-47ee-91a6-01ee6b39383a'),(101,1,1,'commit-foundation_home_event-example.jpg','image',400,250,20165,NULL,'2018-11-16 19:07:14','2018-11-16 19:51:12','2018-11-16 19:51:12','3b54a8cc-2ea7-47ff-98ba-5a4efcee5304'),(102,1,1,'commit-foundation_one-to-one_skills.jpg','image',500,550,20086,NULL,'2018-11-16 19:07:19','2018-11-16 19:51:12','2018-11-16 19:51:12','c6c5bce0-c573-4539-bf10-0121def0986a'),(103,1,1,'commit-foundation_one-to-one_engaged.jpg','image',1350,900,70333,NULL,'2018-11-16 19:07:22','2018-11-16 19:51:12','2018-11-16 19:51:12','c57ccdec-f1e5-421b-b9d4-1ea4ff57b78d'),(104,1,1,'commit-foundation_one-to-one_career-choices.jpg','image',500,550,19114,NULL,'2018-11-16 19:07:15','2018-11-16 19:51:12','2018-11-16 19:51:12','e71055e6-f36c-4c2a-b010-eb004b2899b2'),(105,1,1,'commit-foundation_one-to-mentors.jpg','image',2000,1333,167575,NULL,'2018-11-16 19:07:31','2018-11-16 19:51:12','2018-11-16 19:51:12','5399010b-dfa7-468d-8497-ced10456df8d'),(106,1,1,'commit-foundation_one-to-banner.jpg','image',2000,1333,241966,NULL,'2018-11-16 19:07:28','2018-11-16 19:51:12','2018-11-16 19:51:12','88065965-fdbc-4bd3-b1c5-705a583266cf'),(107,1,4,'tripletree.png','image',250,150,1687,NULL,'2018-11-16 19:08:11','2018-11-16 19:51:12','2018-11-16 19:51:12','1e589ba8-9175-4a61-a0fa-b85d54f61955'),(108,1,4,'sixthwing.png','image',250,150,9551,NULL,'2018-11-16 19:08:08','2018-11-16 19:51:12','2018-11-16 19:51:12','e172c767-eff7-4059-ac19-bf4a5533d6ae'),(109,1,4,'standford.png','image',250,150,16031,NULL,'2018-11-16 19:08:12','2018-11-16 19:51:12','2018-11-16 19:51:12','efb788f7-0a53-4814-858e-45a90ef26c8b'),(110,1,4,'suntrust.png','image',250,150,13724,NULL,'2018-11-16 19:08:11','2018-11-16 19:51:13','2018-11-16 19:51:13','a6ef85d7-8a85-4845-82c0-8af859d5cc57'),(111,1,4,'thestation.png','image',250,150,11663,NULL,'2018-11-16 19:08:12','2018-11-16 19:51:13','2018-11-16 19:51:13','3d37fff4-fb8d-4634-a531-ee2db897f9f6'),(112,1,4,'zachjohaneson.png','image',250,150,4063,NULL,'2018-11-16 19:08:13','2018-11-16 19:51:13','2018-11-16 19:51:13','a963e5cc-70ff-4fca-a6d7-2557268079e0'),(113,1,4,'tuckschool.png','image',250,150,10446,NULL,'2018-11-16 19:08:10','2018-11-16 19:51:13','2018-11-16 19:51:13','5c0f5046-9f0c-434d-993d-27164c04d023'),(114,1,4,'weinbergfoundation.png','image',250,150,5466,NULL,'2018-11-16 19:08:09','2018-11-16 19:51:13','2018-11-16 19:51:13','db8d1571-6cdb-4de4-a33b-8526865db500'),(115,1,4,'whitefishveterans.png','image',250,150,12466,NULL,'2018-11-16 19:08:09','2018-11-16 19:51:13','2018-11-16 19:51:13','cb9cac4a-41df-44ec-bb6b-c818680ba61e'),(116,1,4,'whiteford.png','image',250,150,8126,NULL,'2018-11-16 19:08:08','2018-11-16 19:51:13','2018-11-16 19:51:13','ca5e34d1-4c39-4b40-8d7f-861390a9dd26'),(117,1,4,'wt.png','image',250,150,8285,NULL,'2018-11-16 19:08:12','2018-11-16 19:51:13','2018-11-16 19:51:13','5af0bc41-8815-4115-aa1f-d4e4e75308f9'),(118,1,4,'signsofgreat.png','image',250,150,4441,NULL,'2018-11-16 19:08:10','2018-11-16 19:51:13','2018-11-16 19:51:13','daddde94-b574-42ad-a84d-c691d65e9863'),(119,1,4,'sinclair.png','image',250,150,9438,NULL,'2018-11-16 19:08:10','2018-11-16 19:51:13','2018-11-16 19:51:13','b9564401-9bbc-4fe7-8f64-93fe36e98993'),(120,1,4,'riverside.png','image',250,150,4120,NULL,'2018-11-16 19:08:08','2018-11-16 19:51:14','2018-11-16 19:51:14','ff24c605-9412-444b-81e7-53dc20e74088'),(121,1,4,'salmonfoundation.png','image',250,150,4676,NULL,'2018-11-16 19:08:10','2018-11-16 19:51:14','2018-11-16 19:51:14','cb658f01-4f17-485a-88f8-f48a2b33fb8e'),(122,1,4,'greenspring.png','image',250,150,20018,NULL,'2018-11-16 19:08:08','2018-11-16 19:51:14','2018-11-16 19:51:14','795ca5b2-bdb6-4cdb-864c-5c1ac7e7c616'),(123,1,4,'aerotek.png','image',250,150,10110,NULL,'2018-11-16 19:08:09','2018-11-16 19:51:14','2018-11-16 19:51:14','e8d546e2-909b-47ed-8fd7-5add2ed37d39'),(124,1,4,'alisoncarroll.png','image',250,150,9178,NULL,'2018-11-16 19:08:13','2018-11-16 19:51:14','2018-11-16 19:51:14','37825243-b440-4a93-9a8b-e4d4f7516089'),(125,1,4,'andreessen.png','image',250,150,8561,NULL,'2018-11-16 19:08:14','2018-11-16 19:51:14','2018-11-16 19:51:14','34008f3a-986c-4be1-86c9-06bee2b0fbb3'),(126,1,4,'bcg.png','image',250,150,9400,NULL,'2018-11-16 19:08:09','2018-11-16 19:51:14','2018-11-16 19:51:14','2dea9d67-9347-427f-b225-820b9160dc5c'),(127,1,4,'bobwood.png','image',250,150,10073,NULL,'2018-11-16 19:08:11','2018-11-16 19:51:14','2018-11-16 19:51:14','766de268-671e-4304-a882-307441cf0262'),(128,1,4,'brownadvisory.png','image',250,150,10403,NULL,'2018-11-16 19:08:11','2018-11-16 19:51:14','2018-11-16 19:51:14','f50a61f6-19c4-452a-8536-a8006b842d13'),(129,1,4,'clarkfoundation.png','image',250,150,9735,NULL,'2018-11-16 19:08:11','2018-11-16 19:51:14','2018-11-16 19:51:14','038b74aa-e326-4038-9f84-010d77c123d3'),(130,1,4,'clearing.png','image',250,150,7252,NULL,'2018-11-16 19:08:13','2018-11-16 19:51:15','2018-11-16 19:51:15','6e217b01-b8a8-4692-ad2a-c4474b4976d8'),(131,1,4,'cowen.png','image',250,150,12611,NULL,'2018-11-16 19:08:09','2018-11-16 19:51:15','2018-11-16 19:51:15','94ad9937-9279-4a2b-afc2-b5a5716fc47a'),(132,1,4,'generaldynamics.png','image',250,150,7744,NULL,'2018-11-16 19:08:13','2018-11-16 19:51:15','2018-11-16 19:51:15','465e2f32-c1bc-478c-b97e-bbccf60c3d09'),(133,1,4,'gianforte.png','image',250,150,10494,NULL,'2018-11-16 19:08:08','2018-11-16 19:51:15','2018-11-16 19:51:15','ff482bf1-1ca4-4d5a-bf62-89730c194ef8'),(134,1,4,'goldmansachs.png','image',250,150,5348,NULL,'2018-11-16 19:08:10','2018-11-16 19:51:15','2018-11-16 19:51:15','758d9212-d82d-49ce-8b36-fbdbc8956157'),(135,1,4,'gotyoursix.png','image',250,150,8144,NULL,'2018-11-16 19:08:12','2018-11-16 19:51:15','2018-11-16 19:51:15','bbd969e7-b040-43d7-83a8-0a7447a3e127'),(136,1,4,'howestreet.png','image',250,150,6729,NULL,'2018-11-16 19:08:14','2018-11-16 19:51:15','2018-11-16 19:51:15','2b3a5c45-56ab-47c0-a4f9-66aad03631a9'),(137,1,4,'rosenberg.png','image',250,150,15829,NULL,'2018-11-16 19:08:12','2018-11-16 19:51:15','2018-11-16 19:51:15','584ea0b5-847e-4661-9568-016a08f808da'),(138,1,4,'johnnymac.png','image',250,150,18157,NULL,'2018-11-16 19:08:13','2018-11-16 19:51:15','2018-11-16 19:51:15','e2c50aeb-c04e-49d4-aca0-87a10865cb25'),(139,1,4,'marcandlara.png','image',250,150,5941,NULL,'2018-11-16 19:08:09','2018-11-16 19:51:15','2018-11-16 19:51:15','404f5b8d-f6bc-4881-b3b5-c7b6288bbb9e'),(140,1,4,'missionbbq.png','image',250,150,11236,NULL,'2018-11-16 19:08:08','2018-11-16 19:51:15','2018-11-16 19:51:15','2a38a3cd-ac0e-4989-ad38-3b0da9e662d5'),(141,1,4,'mtbank.png','image',250,150,12649,NULL,'2018-11-16 19:08:13','2018-11-16 19:51:16','2018-11-16 19:51:16','37cf87d8-f753-41b1-99c6-f7f88bf8187e'),(142,1,4,'navyseal.png','image',250,150,15466,NULL,'2018-11-16 19:08:08','2018-11-16 19:51:16','2018-11-16 19:51:16','d03d28f3-cdf7-4776-b4e5-c02afc5319dd'),(143,1,4,'nexgen.png','image',250,150,7907,NULL,'2018-11-16 19:08:14','2018-11-16 19:51:16','2018-11-16 19:51:16','c4c5c77d-1a3f-4ea3-bbc8-96902e799812'),(144,1,4,'oxpoint.png','image',250,150,4604,NULL,'2018-11-16 19:08:11','2018-11-16 19:51:16','2018-11-16 19:51:16','26b8747f-bfcf-4d74-9f9e-954e79fcc924'),(145,1,4,'palantir.png','image',250,150,7991,NULL,'2018-11-16 19:08:10','2018-11-16 19:51:16','2018-11-16 19:51:16','f32674fa-ed72-4677-a04b-e425e8d7019e'),(146,1,4,'penny.png','image',250,150,4524,NULL,'2018-11-16 19:08:12','2018-11-16 19:51:16','2018-11-16 19:51:16','76fbb29a-3dfd-41a6-b146-d729a710f58f'),(147,1,4,'plank.png','image',250,150,6707,NULL,'2018-11-16 19:08:13','2018-11-16 19:51:16','2018-11-16 19:51:16','e0f8994c-a5b2-4abd-8af3-bfc5822a8d79'),(148,1,4,'preventadvisors.png','image',250,150,5268,NULL,'2018-11-16 19:08:10','2018-11-16 19:51:16','2018-11-16 19:51:16','a61a0499-a9ed-4079-a6f9-d8b8e05bbce0'),(149,1,4,'pwc.png','image',250,150,4919,NULL,'2018-11-16 19:08:11','2018-11-16 19:51:16','2018-11-16 19:51:16','a12ece74-ba4c-411f-be92-51dcd946bf82'),(150,1,4,'roberthalf.png','image',250,150,6361,NULL,'2018-11-16 19:08:09','2018-11-16 19:51:16','2018-11-16 19:51:16','92784ea4-4d03-443e-b1ef-090cae67088f'),(151,1,4,'guggenheim.png','image',250,150,4498,NULL,'2018-11-16 19:08:12','2018-11-16 19:51:16','2018-11-16 19:51:16','8cf4408c-ed12-487e-b88c-a7146f495ce6'),(154,4,7,'Commit-501c3-Letter.pdf','pdf',NULL,NULL,338810,NULL,'2018-11-20 01:30:09','2018-11-20 01:30:09','2018-11-20 01:30:09','8dcb1648-f7ea-4a18-ae61-62f454c438fd'),(165,5,8,'46521519_10205415347698375_2277906965667512320_n.jpg','image',960,640,47360,NULL,'2018-11-26 21:49:33','2018-11-26 21:49:33','2018-11-26 21:49:33','9f1e4c8b-9db5-4a0b-8981-14a58b21c5ee');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `categorygroups_handle_unq_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_homepageBannerMessage` text,
  `field_homepageBannerBody` text,
  `field_homepageHeader1` text,
  `field_homepageVideo` int(10) DEFAULT NULL,
  `field_homepageHeader2` text,
  `field_informationTile` text,
  `field_confidenceTile` text,
  `field_imaginationTile` text,
  `field_homepageHeader3` text,
  `field_homepageHeader3Body` text,
  `field_oneToOneTransitionAssistanceTile` text,
  `field_transitionMentoringWorkshops` text,
  `field_theDigitalLibraryTile` text,
  `field_homepageHeader4` text,
  `field_corporateEducationTile` text,
  `field_eventName` text,
  `field_startDate` datetime DEFAULT NULL,
  `field_endDate` datetime DEFAULT NULL,
  `field_eventShortDescription` text,
  `field_transitionAssistanceBannerMessage` text,
  `field_transitionAssistanceBannerBody` text,
  `field_transitionAssistanceHeader1` text,
  `field_transitionAssistanceHeader2` text,
  `field_transitionAssistanceHeader2Body` text,
  `field_transitionAssistanceVideo` int(10) DEFAULT NULL,
  `field_transitionAssistanceHeader3` text,
  `field_transitionAssistanceHeader3Body` text,
  `field_transitionAssistanceHeader4` text,
  `field_transitionAssistanceHeader4Body` text,
  `field_industryConnectionsTile` text,
  `field_transitionMentoringBannerMessage` text,
  `field_transitionMentoringBannerBody` text,
  `field_transitionMentoringHeader1` text,
  `field_transitionMentoringHeader2` text,
  `field_transitionMentoringHeader2Body` text,
  `field_transitionMentoringVideoId` int(10) DEFAULT NULL,
  `field_transitionMentoringHeader3` text,
  `field_transitionMentoringHeader3Body` text,
  `field_transitionMentoringHeader4` text,
  `field_transitionMentoringHeader4Body` text,
  `field_worldClassMentorshipTile` text,
  `field_upcomingWorkshopsBody` text,
  `field_digitalLibrariesBannerMessage` text,
  `field_digitalLibrariesBannerBody` text,
  `field_digitalLibrariesHeader1` text,
  `field_digitalLibrariesHeader2` text,
  `field_digitalLibrariesHeader2Body` text,
  `field_digitalLibrariesHeader2Video` int(10) DEFAULT NULL,
  `field_digitalLibrariesHeader3` text,
  `field_digitalLibrariesHeader3Body` text,
  `field_digitalLibrariesHeader3Video` int(10) DEFAULT NULL,
  `field_corporateEducationBannerMessage` text,
  `field_corporateEducationBannerBody` text,
  `field_corporateEducationHeader1` text,
  `field_corporateEducationHeader2` text,
  `field_corporateEducationHeader2Body` text,
  `field_corporateEducationHeader3` text,
  `field_corporateEducationHeader3Body` text,
  `field_corporateEducationHeader4` text,
  `field_corporateEducationSubHeader4` text,
  `field_corporateEducationHeader5` text,
  `field_corporateEducationHeader5Body` text,
  `field_missionBannerMessage` text,
  `field_missionBannerBody` text,
  `field_missionHeader1` text,
  `field_missionHeader2` text,
  `field_missionHeader2Body` text,
  `field_missionHeader3` text,
  `field_missionHeader3Body` text,
  `field_missionCallToAction` text,
  `field_missionHeader4` text,
  `field_header4Body` text,
  `field_missionHeader5` text,
  `field_missionHeader5Body` text,
  `field_missionHeader6` text,
  `field_missionHeader6Body` text,
  `field_mentorsBannerMessage` text,
  `field_mentorsBannerBody` text,
  `field_mentorsHeader1` text,
  `field_mentorsHeader1Body` text,
  `field_mentorsHeader2` text,
  `field_mentorsHeader2Body` text,
  `field_mentorsHeader3` text,
  `field_mentorsHeader3Body` text,
  `field_teamBannerMessage` text,
  `field_teamBannerBody` text,
  `field_partnersBannerMessage` text,
  `field_partnersBannerBody` text,
  `field_supportersBody` text,
  `field_partneringServiceProvidersBody` text,
  `field_donateBannerMessage` text,
  `field_donateBannerBody` text,
  `field_donateHeader1` text,
  `field_donateCallToAction` text,
  `field_donate250Description` text,
  `field_donate600Description` text,
  `field_donate25000Description` text,
  `field_donateContactUsDescription` text,
  `field_eventOverview` text,
  `field_articleTitle` text,
  `field_article` text,
  `field_homepageTestimonialQuote` text,
  `field_homepageTestimonialAuthor` text,
  `field_transitionAssistanceTestimonialQuote` text,
  `field_transitionAssistanceTestimonialAuthor` text,
  `field_transitionMentoringTestimonial1Quote` text,
  `field_transitionMentoringTestimonial1Author` text,
  `field_transitionMentorshipTestimonial2Quote` text,
  `field_transitionMentoringTestimonial2Author` text,
  `field_corporateEducationTestimonial1Quote` text,
  `field_corporateEducationTestimonial1Author` text,
  `field_corporateEducationTestimonial2Quote` text,
  `field_corporateEducationTestimonial2Author` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2018-11-08 19:59:30','2018-11-08 19:59:30','f3f2d824-c2c2-4742-b075-75d7d27d124a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,1,'Icon Temp 01','2018-11-16 06:32:50','2018-11-16 19:51:02','8c164bb3-c272-4e5c-a7c7-945329993974',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,5,1,'404','2018-11-16 19:51:01','2018-11-16 19:51:01','72344c85-f438-4087-bb6d-87855e4d72ae',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,6,1,'Confindence','2018-11-16 19:51:02','2018-11-16 19:51:02','a330c95f-faea-4672-8fc4-6319e3ea76c7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,7,1,'Hiring','2018-11-16 19:51:02','2018-11-16 19:51:02','185e7a5d-8423-4a0e-8f30-4b555acf58b2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,8,1,'Apple Touch Icon','2018-11-16 19:51:02','2018-11-16 19:51:02','71a27460-35bd-41f7-aefe-88fe40f16a90',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,9,1,'Google','2018-11-16 19:51:02','2018-11-16 19:51:02','efe76760-8409-4edc-b4a5-6b2b39524549',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,10,1,'Forward Chevron','2018-11-16 19:51:02','2018-11-16 19:51:02','6d597020-3997-40b1-a937-49e9f1aa9afe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,11,1,'Fb','2018-11-16 19:51:02','2018-11-16 19:51:02','3298de7e-c288-4b85-8c98-9b0ab9660d01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,12,1,'Fb','2018-11-16 19:51:02','2018-11-16 19:51:02','6819d980-973f-45e1-8a62-dd5cccfad0d2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,13,1,'Facebook Icon','2018-11-16 19:51:02','2018-11-16 19:51:02','8b98cab7-3870-427c-93b8-c8ce77cd9426',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,14,1,'Edu','2018-11-16 19:51:03','2018-11-16 19:51:03','20069081-9b8c-4f00-8c4b-085ebedceb71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,15,1,'Contact Arrow','2018-11-16 19:51:03','2018-11-16 19:51:03','f1364203-6610-4ae0-bcef-62ed262dd662',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,16,1,'Commit Logo','2018-11-16 19:51:03','2018-11-16 19:51:03','11462c2e-906d-4ff3-9dd3-3aaac8eb90a0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,17,1,'Information','2018-11-16 19:51:03','2018-11-16 19:51:03','4d76526e-90bf-4108-a748-edfdf120f0b7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,18,1,'Commit Logo 2','2018-11-16 19:51:03','2018-11-16 19:51:03','38bd2e84-93ae-4d7e-b467-c81a2c35b7d5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,19,1,'Commit Foundation Transition Mentoring Workshops Trajectory','2018-11-16 19:51:03','2018-11-16 19:51:03','3faaf7ad-4b94-4a0a-af16-637eb988d38a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,20,1,'Commit Foundation Transition Mentoring Workshops Pursuit','2018-11-16 19:51:03','2018-11-16 19:51:03','2153fe56-a96f-4e47-b21a-5f1db809c10e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,21,1,'Commit Foundation Transition Mentoring Workshops Mentorship','2018-11-16 19:51:03','2018-11-16 19:51:03','b33d9e31-fb2e-4a3a-bd96-ca5358faa0ef',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,22,1,'Commit Foundation Transition Mentoring Workshops Map','2018-11-16 19:51:03','2018-11-16 19:51:03','d64de65a-19c5-49d7-9309-cac90fa8460d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,23,1,'Commit Foundation Transition Mentoring Workshops Map','2018-11-16 19:51:03','2018-11-16 19:51:03','3d3182e5-5486-4594-a1fc-85aa630509a3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,24,1,'Commit Foundation Transition Mentoring Workshops Changin Perception','2018-11-16 19:51:04','2018-11-16 19:51:04','ed73b9ec-44e9-4510-8ad5-d5271181016a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,25,1,'Commit Foundation Transition Mentoring Workshops Banner','2018-11-16 19:51:04','2018-11-16 19:51:04','18b29272-7041-4a50-8e70-e2b645a1c87a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,26,1,'Commit Foundation Transition Mentoring Workshops Attend','2018-11-16 19:51:04','2018-11-16 19:51:04','8994f6bc-9923-448f-b4be-7dd8b5bc7f74',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,27,1,'Commit Foundation Team Banner','2018-11-16 19:51:04','2018-11-16 19:51:04','4d57924c-0217-4069-979e-c6bb35757fbd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,28,1,'Imagination','2018-11-16 19:51:04','2018-11-16 19:51:04','fa3e2b4b-bf43-48c1-a61b-6418c6b61134',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,29,1,'Left Arrow Red','2018-11-16 19:51:04','2018-11-16 19:51:04','e19a2c8e-0a49-4644-bf46-e41634b69b88',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,30,1,'Commit Foundation Partners Banner','2018-11-16 19:51:04','2018-11-16 19:51:04','5ed08b68-a7cd-4544-a883-42555ec745f9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,31,1,'Quotation White','2018-11-16 19:51:04','2018-11-16 19:51:04','186b0159-e144-401f-a539-aff5bc76b0f8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,32,1,'Vertical Rule','2018-11-16 19:51:04','2018-11-16 19:51:04','36c53245-14f0-49d2-8dbd-c884892aa50a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,33,1,'Vertical Rule Blue','2018-11-16 19:51:05','2018-11-16 19:51:05','ddfad707-721b-4aee-8ece-80318025847a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,34,1,'Twitter','2018-11-16 19:51:05','2018-11-16 19:51:05','b5b09d20-1477-4685-82e1-c1ce68738388',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,35,1,'Twitter','2018-11-16 19:51:05','2018-11-16 19:51:05','f4b01ba3-d051-4071-8751-43dcb4fe3858',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,36,1,'Twitter Icon','2018-11-16 19:51:05','2018-11-16 19:51:05','62ab9497-8e8e-4c53-af93-855585a700f5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,37,1,'Slider Controls','2018-11-16 19:51:05','2018-11-16 19:51:05','462518d8-9811-4c34-b8cc-b6118ac64dae',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,38,1,'Right Arrow','2018-11-16 19:51:05','2018-11-16 19:51:05','c2a24234-c8ca-4492-8e3c-3c6e8a9bb30c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,39,1,'Right Arrow Blue','2018-11-16 19:51:05','2018-11-16 19:51:05','a08cb44f-399e-4996-ba65-b62741f0aa68',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,40,1,'Retain','2018-11-16 19:51:05','2018-11-16 19:51:05','4ee169e7-656b-495f-baf2-2d9854adba18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,41,1,'Quote Slider Controls','2018-11-16 19:51:05','2018-11-16 19:51:05','789d7b6c-4ad0-4376-aff9-004e94db4d7f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,42,1,'Quotation Red','2018-11-16 19:51:05','2018-11-16 19:51:05','dc510067-1405-4bd3-b860-753fd01421d6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,43,1,'Lib','2018-11-16 19:51:05','2018-11-16 19:51:05','011c1472-cbdb-4f99-baa8-1a3106b00f5a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,44,1,'Mobile Slider Controls','2018-11-16 19:51:06','2018-11-16 19:51:06','047af811-d83f-49d9-bd9c-a684e3c8d50e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,45,1,'Mobile Quote Slider Controls','2018-11-16 19:51:06','2018-11-16 19:51:06','a91c02e1-4892-4d18-a339-5cf3c65e2b8e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,46,1,'Mobile Commit Circle','2018-11-16 19:51:06','2018-11-16 19:51:06','4aef440b-4cf6-483e-8159-d62aa2565587',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,47,1,'Mission Icon','2018-11-16 19:51:06','2018-11-16 19:51:06','5d0eabdc-8e1e-416b-ae33-1c0d2de87f36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,48,1,'Ma Square','2018-11-16 19:51:06','2018-11-16 19:51:06','8b2eaf47-6e3a-43ca-a2ce-39ecf24b938d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,49,1,'Login Icon','2018-11-16 19:51:06','2018-11-16 19:51:06','3c95a78a-61d0-449e-810d-3a7b49b29a38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,50,1,'Linkedin Icon','2018-11-16 19:51:06','2018-11-16 19:51:06','a892a6b0-0469-4a0b-b6af-4feaba7fc98a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,51,1,'Linked In','2018-11-16 19:51:06','2018-11-16 19:51:06','232d6127-1d9d-4502-9ef7-c43529f12843',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,52,1,'Linked In','2018-11-16 19:51:06','2018-11-16 19:51:06','48c8d174-c693-46c5-b1ae-0da3547f83e4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,53,1,'Commit Foundation Partners Footer','2018-11-16 19:51:06','2018-11-16 19:51:06','99ead799-cfaa-4481-be61-bb2312dd688d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,54,1,'Google','2018-11-16 19:51:06','2018-11-16 19:51:06','641ffb6d-234a-4d9c-ab9b-f663beef7a7f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,55,1,'Commit Foundation Partners Article1','2018-11-16 19:51:07','2018-11-16 19:51:07','0869f734-1caf-43bd-8d6d-c954562eba46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,56,1,'Commit Foundation Digital Library Dl 2','2018-11-16 19:51:07','2018-11-16 19:51:07','a7d64ba6-cba6-4dec-9e5a-aec9c7a0c4c6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,57,1,'Commit Foundation Digital Library Study','2018-11-16 19:51:07','2018-11-16 19:51:07','852a09bf-a44c-49e8-9c7a-6f442b532c26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,58,1,'Commit Foundation Digital Library Footer','2018-11-16 19:51:07','2018-11-16 19:51:07','fd662b47-7d7e-4dea-9868-e5d9511644b7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,59,1,'Commit Foundation Digital Library Dl 9','2018-11-16 19:51:07','2018-11-16 19:51:07','86ac8f64-791d-464c-9552-fd2b073d76fd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,60,1,'Commit Foundation Digital Library Dl 8','2018-11-16 19:51:07','2018-11-16 19:51:07','3a9e85fb-2f54-4a59-9ac0-4d853c43a9b2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,61,1,'Commit Foundation Digital Library Dl 7','2018-11-16 19:51:07','2018-11-16 19:51:07','be222018-9704-4c24-830d-a90636743a59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,62,1,'Commit Foundation One To Transition Assistance','2018-11-16 19:51:07','2018-11-16 19:51:07','043ecb37-50e9-4f05-a9d6-82219c1280a8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,63,1,'Commit Foundation Digital Library Dl 6','2018-11-16 19:51:07','2018-11-16 19:51:07','ea125afe-4759-410f-a795-a856f164d599',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,64,1,'Commit Foundation Digital Library Dl 5','2018-11-16 19:51:07','2018-11-16 19:51:07','1ac2c35b-39ea-4d53-b608-f7d6dba61877',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,65,1,'Commit Foundation Digital Library Dl 4','2018-11-16 19:51:08','2018-11-16 19:51:08','7d0a6a43-367a-4e29-8096-757db3f9291c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,66,1,'Commit Foundation Digital Library Dl 3','2018-11-16 19:51:08','2018-11-16 19:51:08','b6750dd5-5be7-4a71-9abc-1458a25301f5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,67,1,'Commit Foundation Digital Library Dl 1','2018-11-16 19:51:08','2018-11-16 19:51:08','b1c41888-cdb3-492d-b8fd-de47fcd04e8e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,68,1,'Commit Foundation Donate 2500','2018-11-16 19:51:08','2018-11-16 19:51:08','900ecd34-ec75-4f9f-a2b6-489a8d8fe84a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,69,1,'Commit Foundation Digital Library Banner','2018-11-16 19:51:08','2018-11-16 19:51:08','aa29bedc-d9ec-4ecd-9d18-1e69408ccd55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,70,1,'Commit Foundation Corporate Education Miconceptions','2018-11-16 19:51:08','2018-11-16 19:51:08','985d961a-d595-4872-94c7-982238c6be14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,71,1,'Commit Foundation Corporate Education Footer','2018-11-16 19:51:08','2018-11-16 19:51:08','57f9db45-49c3-4c6b-910b-8e6e7481dcaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,72,1,'Commit Foundation Corporate Education Banner','2018-11-16 19:51:08','2018-11-16 19:51:08','09deeb9d-e5f8-4cee-9e8b-867be40592da',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,73,1,'Commit Foundation Contact Shake','2018-11-16 19:51:08','2018-11-16 19:51:08','0a97c3ca-a80b-4faf-9720-57661d2ce3dc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,74,1,'Commit Foundation Contact Banner','2018-11-16 19:51:09','2018-11-16 19:51:09','b78982c8-9c8f-4a40-b5c9-9ef021231f75',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,75,1,'Commit Foundation Contact Banner','2018-11-16 19:51:09','2018-11-16 19:51:09','2d34a265-f67f-465a-9e72-1d7f07f86c26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,76,1,'Commit Circle','2018-11-16 19:51:09','2018-11-16 19:51:09','53956572-aed0-4851-9369-2a47ecde5e57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,77,1,'Calendar Icon','2018-11-16 19:51:09','2018-11-16 19:51:09','33294ba3-866a-4ef9-8ee1-5ae63c5fd385',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,78,1,'Back Chevron','2018-11-16 19:51:09','2018-11-16 19:51:09','f0e8739b-f559-4b33-9c42-e6c7de576f42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,79,1,'Apply Icon','2018-11-16 19:51:09','2018-11-16 19:51:09','93c4a5fa-9ade-42e6-abe2-664566d47120',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,80,1,'Commit Foundation Donate 100','2018-11-16 19:51:09','2018-11-16 19:51:09','9cc753a3-95a2-4519-8967-5c10e6fac0d4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,81,1,'Vimeo Icon','2018-11-16 19:51:09','2018-11-16 19:51:09','21073ebc-0ab2-4cb4-a961-61ba0b38b009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,82,1,'Commit Foundation Donate 500','2018-11-16 19:51:10','2018-11-16 19:51:10','d773d4cf-7d3b-4835-a8b6-c5cee50b899e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,83,1,'Commit Foundation News Big','2018-11-16 19:51:10','2018-11-16 19:51:10','23d31bba-fd22-4af9-882b-5472c5a92f25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,84,1,'Commit Foundation Donate Banner','2018-11-16 19:51:10','2018-11-16 19:51:10','1ce05e70-6b78-468c-9c92-a4509fedf3fb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,85,1,'Commit Foundation Mentor Banner','2018-11-16 19:51:10','2018-11-16 19:51:10','bbac56f3-9d7a-4cb3-a4b9-4e9c56189d6d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,86,1,'Commit Foundation Mentor Encouraging','2018-11-16 19:51:10','2018-11-16 19:51:10','a7cbcc4a-39e6-4d6d-a2d9-af20b050913b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,87,1,'Commit Foundation Mentor Honest','2018-11-16 19:51:10','2018-11-16 19:51:10','d7fa3938-59de-482c-97ca-69c8c008303a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,88,1,'Commit Foundation Home News','2018-11-16 19:51:10','2018-11-16 19:51:10','b8a246df-ce58-4b3d-b9c8-c540830cd02d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,89,1,'Commit Foundation Mission Banner','2018-11-16 19:51:10','2018-11-16 19:51:10','51eca08e-633d-4d55-a53e-36fe453250d8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,90,1,'Commit Foundation Mission Flag','2018-11-16 19:51:10','2018-11-16 19:51:10','4babb4a7-9a40-499c-82bb-5c9a54492e1c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,91,1,'Commit Foundation Mission Objective','2018-11-16 19:51:11','2018-11-16 19:51:11','c89ed9e7-a811-4fc2-b1f8-565278853593',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,92,1,'Commit Foundation Mission Support','2018-11-16 19:51:11','2018-11-16 19:51:11','a26de843-ab1f-49bf-ad1c-f0bbe8fe2a09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,93,1,'Commit Foundation News Article3','2018-11-16 19:51:11','2018-11-16 19:51:11','3078656f-455c-4db3-b86b-41fa61e332fd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,94,1,'Commit Foundation Mission Big','2018-11-16 19:51:11','2018-11-16 19:51:11','e8620476-100a-4574-9364-3e7595d2d60b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,95,1,'Commit Foundation News Article2','2018-11-16 19:51:11','2018-11-16 19:51:11','5591fe82-6218-4f6d-a558-3765ed79179b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,96,1,'Commit Foundation Home Corporate Education','2018-11-16 19:51:11','2018-11-16 19:51:11','f5d3e66f-f1f8-4a3a-9fa0-7f50dc37f757',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,97,1,'Commit Foundation Events Banner','2018-11-16 19:51:11','2018-11-16 19:51:11','b724f14d-96e7-43aa-afa2-3f7347a01edf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,98,1,'Commit Foundation News Banner','2018-11-16 19:51:11','2018-11-16 19:51:11','19b93296-98da-4dee-98ff-fc5fb02730fc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,99,1,'Commit Foundation Home Aims','2018-11-16 19:51:11','2018-11-16 19:51:11','de265c98-bcb9-46e9-91e4-6d4329c447bd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,100,1,'Commit Foundation Home Banner','2018-11-16 19:51:12','2018-11-16 19:51:12','f55cdc45-60f9-4903-9441-2af49c9769b2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,101,1,'Commit Foundation Home Event Example','2018-11-16 19:51:12','2018-11-16 19:51:12','30706d69-d6ab-430b-ac52-f343d914c098',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,102,1,'Commit Foundation One To One Skills','2018-11-16 19:51:12','2018-11-16 19:51:12','602c8c10-b26c-471a-9cb6-dc5109d493b1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,103,1,'Commit Foundation One To One Engaged','2018-11-16 19:51:12','2018-11-16 19:51:12','1d609f23-367a-466a-8e21-24c90b1e9e3c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,104,1,'Commit Foundation One To One Career Choices','2018-11-16 19:51:12','2018-11-16 19:51:12','1ca98af7-6bc3-4029-9bac-3c86372fc11f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(105,105,1,'Commit Foundation One To Mentors','2018-11-16 19:51:12','2018-11-16 19:51:12','5b323347-b154-401b-9eed-cfa8f88e9698',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(106,106,1,'Commit Foundation One To Banner','2018-11-16 19:51:12','2018-11-16 19:51:12','dace5d0e-9243-4c08-b85d-c92c7c965615',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(107,107,1,'Tripletree','2018-11-16 19:51:12','2018-11-16 19:51:12','70bddd79-7e1a-4531-9349-7824e90ffab7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,108,1,'Sixthwing','2018-11-16 19:51:12','2018-11-16 19:51:12','c29b9504-124d-490b-96ef-2b2cdc051133',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,109,1,'Standford','2018-11-16 19:51:12','2018-11-16 19:51:12','45513cef-fa8d-4d5d-bcc5-1d8a25a0d37a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(110,110,1,'Suntrust','2018-11-16 19:51:13','2018-11-16 19:51:13','05b85f58-38b5-4da4-8010-9fc2a0e543c0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(111,111,1,'Thestation','2018-11-16 19:51:13','2018-11-16 19:51:13','5f7f44c9-2ed2-43cf-9655-50581697f462',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,112,1,'Zachjohaneson','2018-11-16 19:51:13','2018-11-16 19:51:13','187c3308-17db-4844-a896-abf01c53e1e0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,113,1,'Tuckschool','2018-11-16 19:51:13','2018-11-16 19:51:13','490f61d5-5899-4351-afdf-05c1a93a0d46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,114,1,'Weinbergfoundation','2018-11-16 19:51:13','2018-11-16 19:51:13','cf93f541-a40a-47ce-97cd-97ae9b4d48aa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(115,115,1,'Whitefishveterans','2018-11-16 19:51:13','2018-11-16 19:51:13','d79c8550-e647-42b2-a6d7-a65cf9b70767',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(116,116,1,'Whiteford','2018-11-16 19:51:13','2018-11-16 19:51:13','02064502-9439-4f8c-8692-8237e05c539b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(117,117,1,'Wt','2018-11-16 19:51:13','2018-11-16 19:51:13','1d11f161-16cc-4c73-953b-91d42b95a00e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,118,1,'Signsofgreat','2018-11-16 19:51:13','2018-11-16 19:51:13','5bce3af9-488a-4e2c-b8b3-ab8cc9101a9d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(119,119,1,'Sinclair','2018-11-16 19:51:13','2018-11-16 19:51:13','edf07d41-0595-485b-9446-89a113f79fa6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,120,1,'Riverside','2018-11-16 19:51:14','2018-11-16 19:51:14','ca6cae41-6f6e-44b8-82aa-65ed6eab1b8c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,121,1,'Salmonfoundation','2018-11-16 19:51:14','2018-11-16 19:51:14','d0adda62-7ffc-4694-847a-5e723634aabd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,122,1,'Greenspring','2018-11-16 19:51:14','2018-11-16 19:51:14','a2556d78-c25f-4b45-a6ec-5327811e997f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,123,1,'Aerotek','2018-11-16 19:51:14','2018-11-16 19:51:14','4d25052e-32ce-4302-a49b-d28b216fe491',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,124,1,'Alisoncarroll','2018-11-16 19:51:14','2018-11-16 19:51:14','393abc9c-d31a-4fa9-8f74-a59107c15a79',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,125,1,'Andreessen','2018-11-16 19:51:14','2018-11-16 19:51:14','acd29d80-e50e-49e8-87dc-77320058aed8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(126,126,1,'Bcg','2018-11-16 19:51:14','2018-11-16 19:51:14','15066b2c-27b1-4540-b414-e6b341bab983',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(127,127,1,'Bobwood','2018-11-16 19:51:14','2018-11-16 19:51:14','55124ab4-cdc5-4f0b-b24e-01dcc4a87534',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(128,128,1,'Brownadvisory','2018-11-16 19:51:14','2018-11-16 19:51:14','72a23785-fad5-4ec3-bafc-af37d9023134',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(129,129,1,'Clarkfoundation','2018-11-16 19:51:14','2018-11-16 19:51:14','21c054cd-fef8-4773-bb0f-4281016b7488',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(130,130,1,'Clearing','2018-11-16 19:51:15','2018-11-16 19:51:15','dc16043d-3e84-44f3-b82e-f49bef30d15f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,131,1,'Cowen','2018-11-16 19:51:15','2018-11-16 19:51:15','73baa26e-b484-4bae-b5b3-b7af97215513',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,132,1,'Generaldynamics','2018-11-16 19:51:15','2018-11-16 19:51:15','803f2674-49b9-41bf-b671-4ef86494ce34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,133,1,'Gianforte','2018-11-16 19:51:15','2018-11-16 19:51:15','b23ec212-16ef-4964-b4da-9e4c26e3d3cc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,134,1,'Goldmansachs','2018-11-16 19:51:15','2018-11-16 19:51:15','622ba5d6-8a54-4aa4-bc88-ff03eab12eab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,135,1,'Gotyoursix','2018-11-16 19:51:15','2018-11-16 19:51:15','c5cf5280-a7ce-4005-9ea2-2c93ced1fd2d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,136,1,'Howestreet','2018-11-16 19:51:15','2018-11-16 19:51:15','9f4d8366-e67d-4360-a232-f91362a77453',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,137,1,'Rosenberg','2018-11-16 19:51:15','2018-11-16 19:51:15','3200211f-4575-4db5-8a99-9254df08aa1a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,138,1,'Johnnymac','2018-11-16 19:51:15','2018-11-16 19:51:15','e98b8ef4-af50-4980-ac5a-d4f623dd01be',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(139,139,1,'Marcandlara','2018-11-16 19:51:15','2018-11-16 19:51:15','a447107e-fe30-4b1a-b3ae-565227d94104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,140,1,'Missionbbq','2018-11-16 19:51:15','2018-11-16 19:51:15','fdbb04d2-2f7a-486d-b35b-d5f58b0ee5f7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(141,141,1,'Mtbank','2018-11-16 19:51:16','2018-11-16 19:51:16','bf1db28c-d277-433c-b106-0bad1f02aded',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(142,142,1,'Navyseal','2018-11-16 19:51:16','2018-11-16 19:51:16','8264da6d-5633-42f7-a3b9-bdbdf7a15307',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(143,143,1,'Nexgen','2018-11-16 19:51:16','2018-11-16 19:51:16','cc1cb49a-eb94-4ee6-bdff-9b9eba346284',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(144,144,1,'Oxpoint','2018-11-16 19:51:16','2018-11-16 19:51:16','2e999f58-de6a-42d0-b9c7-4ec61b399ad2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(145,145,1,'Palantir','2018-11-16 19:51:16','2018-11-16 19:51:16','4a335d7c-a905-438a-9ece-f0e4f3aede5f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(146,146,1,'Penny','2018-11-16 19:51:16','2018-11-16 19:51:16','e2a4e81a-7233-486a-b5bc-7446ba3589a4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(147,147,1,'Plank','2018-11-16 19:51:16','2018-11-16 19:51:16','5c072ea6-309a-4da2-9ad5-fcc51539a067',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(148,148,1,'Preventadvisors','2018-11-16 19:51:16','2018-11-16 19:51:16','1315528b-f188-4f1e-b11d-eee493d5c21f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(149,149,1,'Pwc','2018-11-16 19:51:16','2018-11-16 19:51:16','e4736a82-64d4-4b99-8088-a9ea0696860e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(150,150,1,'Roberthalf','2018-11-16 19:51:16','2018-11-16 19:51:16','e612a2b3-4cd0-4d71-9dad-63cc4cd4ca3c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(151,151,1,'Guggenheim','2018-11-16 19:51:16','2018-11-16 19:51:16','d94d41eb-3dd4-4b95-9e58-8512414aa757',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(154,154,1,'Commit 501C3 Letter','2018-11-20 01:30:09','2018-11-20 01:30:09','076a954f-21b3-4360-84e1-61c5778c6a79',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(156,156,1,'Homepage','2018-11-24 23:00:32','2018-11-26 23:51:10','29ce9361-1702-4799-8700-dbd56ecc2fb8','High Touch, High Impact','Helping America\'s top tier servicemembers and veterans find personal and professional purpose after military service.','The COMMIT Foundation is fundamentally changing the way servicemembers and veterans approach their transition from the military',NULL,'Misconceptions, skill translation gaps, and culture gaps may hinder many servicemembers and veterans from earning the right job and companies from hiring the right veteran','COMMIT helps servicemembers and veterans understand and articulate the value of their knowledge, skills, and abilities. We help them understand how to transfer that value to a meaningful civilian career.','COMMIT helps servicemembers and veterans maintain their individual confidence throughout the transition process. We provide the information and resources servicemembers and veterans need to self-identify and understand their unique and personal value.','COMMIT enables servicemembers and veterans’ ability to rethink and redefine what is possible. We encourage servicemembers and veterans to set high goals and then help to ensure they achieve them.','COMMIT aims to create serendipity for men and women transitioning from the military and entering Corporate America','We provide tailored solutions to meet the personal needs of every individual we serve.','A highly individualized approach with experienced executive coaches using proven techniques to identify and resolve specific needs of transitioning servicemembers and veterans.','Focus on goal-setting, life’s decision points, and powerful lessons that reinforce values, family, and the passionate pursuit of a meaningful career.','Study key insights and best practices from highly successful COMMIT alumni and leaders in Corporate America.','True to our name, we are committed to making significant, long-term impact in changing the way Corporate America thinks about hiring and retaining veteran talent','We teach our partners how to effectively identify, hire, and retain veteran talent in order to improve business outcomes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Commit is a deeply sophisticated and nuanced provider of veteran transition services. Their integrity and investment in veterans\' journeys is a best in class benchmark to which all VSOs should strive.','Christian Andrew Moree',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(157,157,1,'1:1 Transition Assistance','2018-11-24 23:46:00','2018-11-26 23:52:02','264ec760-bb9a-44aa-8ed3-e1645cac736c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'One-on-One Transition Assistance','COMMIT meets you right where you are in transition. Let us help you build a plan that is tailored to your individual needs and timeline.','A highly individualized approach with an experienced executive coach using proven techniques to engage, identify, and resolve specific needs of a transitioning veteran','Specifically Designed and Highly Tailored Programs','Servicemembers and veterans who participate in One-on-One Transition Assistance receive highly individualized services before, during, and beyond their transition. Our unique blend of proprietary techniques and certified professional tools have been developed by COMMIT over years of operation.',NULL,'Focused Career Choices','COMMIT focuses on quality over quantity through high touch, high impact support. After identifying your values and strengths, COMMIT helps you find career opportunities at the convergence of passion, expertise, and geography.','Strengths and Skills','Support includes strengths assessment, values identification, resume assistance, executive coaching, mentorship, and scholarship assistance. COMMIT’s approach is built on individual needs, including both hard and soft skill personal development.','COMMIT leverages a vast network of successful alumni and leaders in Corporate America to help support, inform, and guide servicemembers and veterans as they transition into the industries they are passionate about.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'This was a unique opportunity that has significantly raised my confidence that when it\'s time to transition, I will have great options. The staff and mentors were very knowledgeable and passionate about helping us prepare. I am thankful for COMMIT.','William Waynick II',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,158,1,'Transition Mentoring Workshops','2018-11-25 00:00:49','2018-11-27 00:05:10','8c463b0f-2f09-497c-9a94-53c9f2264e82',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Transition Mentoring Workshops','Harnessing the power of our networks and relationships, COMMIT facilitates synergy between top tier servicemembers and veterans and seasoned professionals from the private sector.','Focus on values, key decision points, and powerful lessons that reinforce the importance of family and pursuing your passion when designing the life you want to live following your time in uniform','COMMIT believes 30 minutes of quality dialogue can forever change the trajectory of an individual','Workshops are specifically designed to provide servicemembers and veterans direct access to thoughtfully selected professionals and foster intimate environments where quality dialogue will occur.',NULL,'Changing Perception','Led by professional executive coaches, servicemembers and veterans work through a series of modules focused on values, strengths, culture, and opportunities to change perspectives and improve trajectories.','Preparing Trajectory','Reinforcing integrity, family, and the passionate pursuit of a meaningful career, servicemembers and veterans hear from and personally engage with successfully transitioned servicemembers and veterans and leaders from Corporate America. Servicemembers and veterans and mentors have private, meaningful conversations in environments where they flourish.','We take a hard look at the industries, interests, and skills of workshop participants in order to align world class mentors from specific industries, backgrounds, and locations to provide game changing value.','COMMIT facilitates workshops nationwide, allowing us to handpick perfect locations suited towards intimate working environments. No matter where your location, servicemembers and veterans from across the country are sponsored to attend COMMIT workshops in cities best suited for their success.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'The COMMIT workshop I attended went above and beyond what I thought it could provide. Every topic covered relevant information that helped me see the transition process in a new light. Overall one of the best takeaways was the importance of translating learned skills in the military into relevant skills in the civilian sector, as well as how critical some of them are.','Brian M Bradley','It\'s impossible to overstate how important COMMIT and the workshops are to a successful transition from military service. The discussions were at the right level, targeting individuals who want to continue performing at a high level post-transition. In addition to refining important skills like networking, the workshop provided opportunities to have candid discussions with long-time industry professionals about important topics like corporate culture and career planning. An exceptional event and highly recommended!','Andrew Ries',NULL,NULL,NULL,NULL),(159,159,1,'Mission','2018-11-25 18:49:17','2018-11-25 18:51:11','5e37b07c-7809-4839-aad2-e17f1c299919',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,160,1,'Corporate Education','2018-11-25 18:51:25','2018-11-27 00:25:32','591f4aad-1af5-4f81-b912-9874125fa941',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,161,1,'Digital Library','2018-11-25 18:53:03','2018-11-27 00:16:44','ff1993d7-bd4f-442d-b2a3-cebdcc10fb98',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'The Digital Library','The Digital Library provides a growing collection of videos on specific subjects transitioning servicemembers and veterans and Corporate America find most critical or challenging to overcome.','Study key insights and best practices from highly successful COMMIT alumni and leaders in Corporate America.','The Digital Library','COMMIT leverages a vast network of experienced professionals from Corporate America to provide key insights on transferable skills, interviewing, networking, mentorship, leadership, and much more.',NULL,'Insights and Industry Interviews','While working to identify an industry to begin your new career, COMMIT’s interviews with leaders from Corporate America provide immediate insight into necessary skills, expectations in the work environment, and key tips for professional success.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,162,1,'Mentors','2018-11-25 19:13:39','2018-11-25 19:14:01','8f9d40a8-5386-446d-a543-3e9d7eddc258',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,163,1,'Team','2018-11-25 19:17:20','2018-11-25 19:20:03','c809fad6-c6a6-4b61-b332-319407f7cc14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,164,1,'Partners','2018-11-25 19:24:21','2018-11-25 19:24:40','d87072a2-6ca4-463f-a475-dfa000c05744',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(165,165,1,'46521519 10205415347698375 2277906965667512320 N','2018-11-26 21:49:33','2018-11-26 21:49:33','0a061742-a555-4e8b-911a-2c4137bf71fa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(166,166,1,NULL,'2018-11-26 22:49:42','2018-11-26 23:11:13','176e7a11-4e77-4bc9-b945-8036ce26a6cd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(167,167,1,'Donate','2018-11-26 23:17:14','2018-11-26 23:18:05','c41d4ca2-4dc8-4d21-b44e-4da85945b6b8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
INSERT INTO `elementindexsettings` VALUES (1,'craft\\elements\\Entry','{\"sourceOrder\":[[\"key\",\"*\"],[\"heading\",\"Events & News\"],[\"key\",\"section:3\"],[\"key\",\"section:12\"],[\"heading\",\"Pages\"],[\"key\",\"single:2\"],[\"key\",\"single:4\"],[\"key\",\"single:5\"],[\"key\",\"single:8\"],[\"key\",\"single:7\"],[\"key\",\"single:6\"],[\"key\",\"single:10\"],[\"key\",\"single:9\"],[\"key\",\"single:11\"],[\"key\",\"single:13\"]],\"sources\":{\"single:4\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"link\"}},\"single:5\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"link\"}},\"*\":{\"tableAttributes\":{\"1\":\"section\",\"2\":\"postDate\",\"3\":\"expiryDate\",\"4\":\"link\"}},\"section:3\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"link\"}}}}','2018-11-26 23:18:42','2018-11-26 23:18:42','26332980-f887-4d76-b531-db07f2d7aa23');
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,'craft\\elements\\User',1,0,'2018-11-08 19:59:30','2018-11-08 19:59:30','a60bbb46-e0e4-4373-9ddd-821940cafff4'),(3,1,'craft\\elements\\Asset',1,0,'2018-11-16 06:32:50','2018-11-16 19:51:02','092e5de8-c835-4257-808d-59e6b7a37ff1'),(5,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:01','2018-11-16 19:51:01','358a7d43-dede-46b8-8b26-1fa882b8464f'),(6,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:02','2018-11-16 19:51:02','31f2b416-17d6-40ca-8cb5-35eece366152'),(7,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:02','2018-11-16 19:51:02','9fe7fa49-5596-478c-aa1b-6497710fa2af'),(8,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:02','2018-11-16 19:51:02','e52959f4-1bd0-48b2-a68e-8acce61ff6c2'),(9,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:02','2018-11-16 19:51:02','743ac119-b7d6-4b29-9a1b-1cf3c681d1e0'),(10,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:02','2018-11-16 19:51:02','f1f2d76b-6eee-4cb4-af43-781134c31109'),(11,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:02','2018-11-16 19:51:02','2fb57f49-cde3-4882-a4f9-4a32ac5a5eb6'),(12,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:02','2018-11-16 19:51:02','91642214-ea4e-46cd-9192-dc80cee496e4'),(13,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:02','2018-11-16 19:51:02','13dc4335-4a0c-44c3-b720-b0efe708ac13'),(14,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:03','2018-11-16 19:51:03','d302b288-5e10-46e5-9430-293e8550faf8'),(15,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:03','2018-11-16 19:51:03','8fed61ce-ff8a-4f0e-8b52-981da6f0e893'),(16,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:03','2018-11-16 19:51:03','25d7ed22-45d8-4346-aedd-6622b8387179'),(17,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:03','2018-11-16 19:51:03','da72a349-0e5e-43c2-a5be-fc62f2416fbf'),(18,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:03','2018-11-16 19:51:03','5bc70a1f-4d1f-460b-85f5-a0adb559df79'),(19,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:03','2018-11-16 19:51:03','f596570c-39bc-4f1b-a724-f8d5ad4b2dea'),(20,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:03','2018-11-16 19:51:03','4faf24f3-2c92-4e7d-864c-eef7a9bb4f1b'),(21,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:03','2018-11-16 19:51:03','2201822f-81ff-4fa2-b652-d5b78be23a7f'),(22,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:03','2018-11-16 19:51:03','0e01d7f5-7315-4eda-b5fb-57329ebff4da'),(23,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:03','2018-11-16 19:51:03','616ed237-8659-43d7-a166-9bdab95cf363'),(24,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:04','2018-11-16 19:51:04','abfbb27a-092e-4f60-afa7-cdb2376ed289'),(25,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:04','2018-11-16 19:51:04','40644e35-4c9b-4b96-9246-d0237e02878e'),(26,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:04','2018-11-16 19:51:04','03db4f5b-860b-4ef1-a33c-c02a2b8cf7b0'),(27,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:04','2018-11-16 19:51:04','7c17289a-9341-433b-9cd1-b3bfccaea987'),(28,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:04','2018-11-16 19:51:04','47d88901-08d3-4e0b-85cd-3427df8c4052'),(29,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:04','2018-11-16 19:51:04','0c2767d1-e806-478c-bcc9-7fe619867f27'),(30,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:04','2018-11-16 19:51:04','559306fc-3ace-4432-bd31-da91c7febd3a'),(31,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:04','2018-11-16 19:51:04','9ba17dc3-b474-4f68-8126-d3aa5ba92bb9'),(32,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:04','2018-11-16 19:51:04','4d2e195f-2fe9-458c-b846-3095544bdd8f'),(33,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','3b20a190-6e7a-4791-af6f-62f5cbc3370f'),(34,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','3b8d8d10-7341-47cb-9fd7-26d452a1f3a0'),(35,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','301732ed-5317-468f-ba6c-a2e7875ca14d'),(36,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','0edaf6c3-2c4e-4e12-9fa9-13816f95d70d'),(37,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','10d8d034-3166-4151-a773-6663af341232'),(38,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','a1dfd479-0700-4cc2-90a6-dc3dbed23f8b'),(39,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','1f7c2320-ae22-457c-a62c-6790a6f598d2'),(40,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','cf289c63-8832-48cc-b1af-520e627c7675'),(41,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','740086a2-beda-4f17-839b-82032bbe36cc'),(42,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','8cb984c0-70a9-4465-a2ac-4f44d835048e'),(43,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:05','2018-11-16 19:51:05','0365addd-1b92-42ae-bd62-285c951ba0e7'),(44,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','08e4fa48-a360-402d-a61b-7b87f5c9bcbe'),(45,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','86f14fea-d55e-4c37-a025-982b93b3ef95'),(46,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','13ec300f-37b1-4795-9e77-e1a998cde3a9'),(47,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','c4b7ddb4-3160-4b35-91c7-a552a4fea71f'),(48,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','b4da0f86-03f9-4c59-92f4-9aa27c292075'),(49,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','30b111f7-dc56-4938-87f9-d2333c62ff9e'),(50,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','83db713a-dee1-4a81-a90b-a119f5c1f6b3'),(51,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','70004fc0-e2cf-400d-a2d3-6b8dd37efb62'),(52,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','5231730b-0272-40be-a4af-f488fc2bdb0b'),(53,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','0a004cc2-2d63-4349-9811-f702e74ba772'),(54,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:06','2018-11-16 19:51:06','255fbc3b-e17b-4b89-a6b4-dfcd4c90e0c4'),(55,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:07','2018-11-16 19:51:07','246a7294-d6b7-4210-9c66-f1e20cbad99f'),(56,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:07','2018-11-16 19:51:07','6c93313b-a37a-4763-831f-46dd32cfcfd3'),(57,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:07','2018-11-16 19:51:07','33261705-8ac8-4da1-abba-305c8a6db906'),(58,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:07','2018-11-16 19:51:07','66ee0c3b-e749-43af-a24b-dbd0a2be2140'),(59,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:07','2018-11-16 19:51:07','407a1297-771a-4afd-b8fc-95fba47ed73d'),(60,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:07','2018-11-16 19:51:07','e9effac7-f3bb-4386-8b7f-0bbc685ec155'),(61,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:07','2018-11-16 19:51:07','baf2b100-3dab-411e-85cc-253aa09d7417'),(62,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:07','2018-11-16 19:51:07','402a51ef-dfab-48e7-8a1b-f3936d5519a1'),(63,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:07','2018-11-16 19:51:07','b4f15746-43b7-4d98-badc-0ea42b4e203a'),(64,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:07','2018-11-16 19:51:07','43d7e48e-1e2d-4ee4-abca-b36b7aa3ab02'),(65,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:08','2018-11-16 19:51:08','5b64f4b4-9a3c-4f5a-9bd9-0ae77129afe6'),(66,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:08','2018-11-16 19:51:08','00432e9e-e5be-49cb-ac09-0127a0a49b1e'),(67,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:08','2018-11-16 19:51:08','8835ca8a-5993-4fd7-a460-7693d2a1e1b0'),(68,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:08','2018-11-16 19:51:08','454e3a63-b3e9-4608-9ae2-9f9cd641edb8'),(69,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:08','2018-11-16 19:51:08','28c20256-b3bd-4959-a838-50078c493843'),(70,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:08','2018-11-16 19:51:08','f6f00cf0-79b4-4eaf-a1e6-261bb2dba3bf'),(71,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:08','2018-11-16 19:51:08','f13911f8-5820-488b-bb83-d0e8325d5fa0'),(72,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:08','2018-11-16 19:51:08','979bb312-5cce-4047-aa0f-e70cbcc54cad'),(73,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:08','2018-11-16 19:51:08','ac61485a-0eb2-4213-b706-5a8bd303f39b'),(74,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:09','2018-11-16 19:51:09','de91ffb7-a42d-495e-a6d4-84bb0b4f00c7'),(75,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:09','2018-11-16 19:51:09','9a743ca7-0b3a-41db-87e6-c65717b43c86'),(76,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:09','2018-11-16 19:51:09','2b23cd6e-c616-4766-934f-e8c697b29017'),(77,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:09','2018-11-16 19:51:09','681029e8-5d90-4cbf-a9c4-835c245718da'),(78,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:09','2018-11-16 19:51:09','45124980-d4a0-4bcf-afba-95090adcc0b2'),(79,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:09','2018-11-16 19:51:09','5dfa0b60-5feb-40af-a85a-863cf75d30b7'),(80,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:09','2018-11-16 19:51:09','c70aa25a-c7b5-40bf-8407-c64afa66edd8'),(81,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:09','2018-11-16 19:51:09','865ab7a4-af43-4611-a4d8-1a5db03a25e6'),(82,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:10','2018-11-16 19:51:10','a73da6af-e2ea-4fb7-aa94-b4cedccef71c'),(83,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:10','2018-11-16 19:51:10','e7f61268-6e1e-4b48-a2c3-df3aac069a63'),(84,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:10','2018-11-16 19:51:10','98700386-3747-411a-9b5b-d91288ebf699'),(85,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:10','2018-11-16 19:51:10','9c0f170f-99ef-4fe1-92ba-b835c52e5cd7'),(86,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:10','2018-11-16 19:51:10','47321927-c014-42b1-8c81-becb84dac545'),(87,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:10','2018-11-16 19:51:10','ad9c6437-7211-4fbe-9894-12cfd289387d'),(88,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:10','2018-11-16 19:51:10','1322c78b-36e3-4c1c-a855-e26fbb9538c5'),(89,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:10','2018-11-16 19:51:10','e05029ea-3bfc-4827-bb50-a5739b9c0178'),(90,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:10','2018-11-16 19:51:10','382f9195-b248-451c-b103-4489c071f1d4'),(91,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:11','2018-11-16 19:51:11','879a8f28-7bad-4891-bbdd-25a137ac9a84'),(92,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:11','2018-11-16 19:51:11','6cdef40e-5191-4ff6-996d-d4225c3f153b'),(93,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:11','2018-11-16 19:51:11','fbc5b8b4-4eeb-4e35-9534-d3b3d63ad547'),(94,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:11','2018-11-16 19:51:11','af5a03e3-67d0-4757-b3f1-f7302404e0c6'),(95,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:11','2018-11-16 19:51:11','ccbf132e-8398-417b-aa94-d0ebf9886e9a'),(96,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:11','2018-11-16 19:51:11','935ce895-bd42-4d89-a096-bd5815220720'),(97,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:11','2018-11-16 19:51:11','4f523c73-6800-4d2d-ad56-acddf6d69959'),(98,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:11','2018-11-16 19:51:11','a0bab5e8-f434-46ee-b88f-aeaf9099ad24'),(99,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:11','2018-11-16 19:51:11','9ce44589-ea49-4e89-ac8e-d7245a5a2b08'),(100,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:12','2018-11-16 19:51:12','8a20e5f3-10ef-4adc-9ae3-ec9bb2af8cf4'),(101,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:12','2018-11-16 19:51:12','6fbe341c-db78-4d6a-b05e-c45d38857350'),(102,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:12','2018-11-16 19:51:12','08232ee6-83b7-400e-bd98-4c6d4a0b425a'),(103,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:12','2018-11-16 19:51:12','391983b7-272b-408b-b63f-0589bde21691'),(104,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:12','2018-11-16 19:51:12','ce5cc672-0d4e-451e-8419-77958110f2b2'),(105,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:12','2018-11-16 19:51:12','aa65a930-31c0-43ed-9dc7-79f5e519dcc3'),(106,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:12','2018-11-16 19:51:12','2bd339ab-41eb-46a9-9f92-f184d97f6983'),(107,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:12','2018-11-16 19:51:12','d0323603-848d-4fd2-a6c1-c50428322ef5'),(108,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:12','2018-11-16 19:51:12','c8123203-13c0-4f40-a73c-7dc80be08eda'),(109,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:12','2018-11-16 19:51:12','71152e3c-a16d-4f60-ada6-9f2ade9b949f'),(110,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:13','2018-11-16 19:51:13','176a59c5-74d4-4525-85c7-4d850f5006c1'),(111,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:13','2018-11-16 19:51:13','9583888c-93ba-4738-8d9c-a81938f5511e'),(112,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:13','2018-11-16 19:51:13','810dfec0-92e4-4873-8ca1-c669204efc23'),(113,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:13','2018-11-16 19:51:13','5b6360a9-7fb3-4699-b4f6-826216c5665c'),(114,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:13','2018-11-16 19:51:13','c33ab3f5-4e6c-41da-be27-f98897a76d73'),(115,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:13','2018-11-16 19:51:13','495eeabc-d772-4ec2-905b-523485b865da'),(116,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:13','2018-11-16 19:51:13','7d9e8ede-9ac2-4fca-af31-c4f1c518730b'),(117,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:13','2018-11-16 19:51:13','6085952d-5cac-445a-a4de-dc36d22a244e'),(118,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:13','2018-11-16 19:51:13','01f8e9a0-30cc-4751-94f0-6f02e7406166'),(119,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:13','2018-11-16 19:51:13','ab396669-37b0-4344-be25-6715608a6a69'),(120,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:14','2018-11-16 19:51:14','b3e54640-f6f5-4393-99bc-29182c17f8a1'),(121,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:14','2018-11-16 19:51:14','68199a3c-c0f0-4314-b2d0-c29f88960722'),(122,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:14','2018-11-16 19:51:14','c3855e19-d9c2-47e2-ae9f-e3d8aaef782d'),(123,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:14','2018-11-16 19:51:14','5fe611fc-829e-422c-ae53-8a70d27bc3f2'),(124,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:14','2018-11-16 19:51:14','f6fae014-78b1-411a-a962-087a9c5e6f92'),(125,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:14','2018-11-16 19:51:14','8ccf99c9-9428-4a01-badb-8f2604ee034c'),(126,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:14','2018-11-16 19:51:14','3fa08216-afa4-4e7b-8e29-725f75ea5ed5'),(127,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:14','2018-11-16 19:51:14','dbb09220-8f5b-476e-a72c-d553290576bc'),(128,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:14','2018-11-16 19:51:14','e9d4f8f4-c0b3-4aec-b1ed-dc5dc5cdf223'),(129,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:14','2018-11-16 19:51:14','3fac69a4-2d9f-4973-9c06-078b6fd4a74e'),(130,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','7f48b009-afda-46cf-8ced-79d7f0e33687'),(131,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','ad0b1e57-77e3-4019-be54-ff89bc42c8d9'),(132,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','59575a38-8a91-4419-8bef-ad3343f159a6'),(133,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','f15e382d-9239-4acf-b59e-b1e5ef7fb289'),(134,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','5f175011-a65d-4916-9b4e-27a2772a99a8'),(135,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','d8b5595b-81a9-4b0e-a11d-ee468c9a9c67'),(136,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','16978095-c25d-4a99-ba8a-abd09f99ca66'),(137,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','6c1a4774-ac5b-43e3-a58f-378bfcf095ff'),(138,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','31ea2c9e-4f00-4332-91b1-967cde6e501c'),(139,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','238b6da3-f531-4f9a-8704-f6257ab649fb'),(140,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:15','2018-11-16 19:51:15','9cfdab15-3f1d-4a75-9cd2-6395e0a740db'),(141,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','11399b97-ddab-4566-9a6f-30482aace890'),(142,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','b7c5d434-1763-4e06-94be-300ad775bfa2'),(143,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','3750945a-c8b4-46a5-8c3b-bc7b760ab6fa'),(144,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','c179ab08-4620-49b1-97cf-07eb7648bb2c'),(145,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','c6c990dd-c8dc-4f88-a892-09d7dcd70253'),(146,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','0e4c49ae-ddfc-41f9-b8c0-bb3f80f061a0'),(147,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','2c3bf0f2-0e52-4e2a-b794-5176e6449b4b'),(148,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','53f1fd9f-880d-450f-be0f-2112f549d6e7'),(149,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','996544f6-5d7f-4dba-8599-8402a3316ddf'),(150,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','2551851f-6d13-4808-a4d1-d76275857123'),(151,1,'craft\\elements\\Asset',1,0,'2018-11-16 19:51:16','2018-11-16 19:51:16','28d6a552-2681-4b52-9e75-aa0fb1842e16'),(154,5,'craft\\elements\\Asset',1,0,'2018-11-20 01:30:09','2018-11-20 01:30:09','3c0a8e21-7fb2-45d0-a3ff-5563a7207c4c'),(156,6,'craft\\elements\\Entry',1,0,'2018-11-24 23:00:32','2018-11-26 23:51:10','6fcfa7b5-c14c-4518-8056-d83a762cb0d5'),(157,11,'craft\\elements\\Entry',1,0,'2018-11-24 23:46:00','2018-11-26 23:52:02','88b91d0b-6789-45b1-8e26-b3532cdebe24'),(158,12,'craft\\elements\\Entry',1,0,'2018-11-25 00:00:49','2018-11-27 00:05:10','f94b72cd-ae25-4b53-9061-e3f9d96607d4'),(159,17,'craft\\elements\\Entry',1,0,'2018-11-25 18:49:17','2018-11-25 18:51:11','27763c73-9b49-4db3-9b24-3ce47e2f82ab'),(160,18,'craft\\elements\\Entry',1,0,'2018-11-25 18:51:25','2018-11-27 00:25:31','9f6488f3-0361-4ab6-8965-2dc4b808a0da'),(161,19,'craft\\elements\\Entry',1,0,'2018-11-25 18:53:03','2018-11-27 00:16:44','36077666-f2ed-4472-87fd-4727c6aceb76'),(162,20,'craft\\elements\\Entry',1,0,'2018-11-25 19:13:39','2018-11-25 19:14:01','ae5c3901-fcd7-494d-9471-e40d06e3abb3'),(163,22,'craft\\elements\\Entry',1,0,'2018-11-25 19:17:20','2018-11-25 19:20:03','d077f811-f164-4ffb-95ef-0dfb919bafbf'),(164,25,'craft\\elements\\Entry',1,0,'2018-11-25 19:24:21','2018-11-25 19:24:40','92ae19d3-bd1b-468c-b1a8-7d71250a5dc7'),(165,28,'craft\\elements\\Asset',1,0,'2018-11-26 21:49:33','2018-11-26 21:49:33','0d0e4779-13f2-48d3-be9a-8bd5a41f9bde'),(166,30,'craft\\elements\\GlobalSet',1,0,'2018-11-26 22:49:42','2018-11-26 23:11:13','2531f3b4-27de-47b3-9ede-a0ad78f44c42'),(167,36,'craft\\elements\\Entry',1,0,'2018-11-26 23:17:14','2018-11-26 23:18:05','e96b9ee0-f683-495d-a36f-00f91bda845e'),(168,7,'craft\\elements\\MatrixBlock',1,0,'2018-11-26 23:35:05','2018-11-26 23:51:10','773e16b0-50b4-4ca0-bb23-2f4c1463307f'),(169,7,'craft\\elements\\MatrixBlock',1,0,'2018-11-26 23:35:05','2018-11-26 23:51:10','d01717f2-98ea-4072-95de-3f5f248852cf'),(170,7,'craft\\elements\\MatrixBlock',1,0,'2018-11-26 23:35:05','2018-11-26 23:51:10','182f5666-53ea-4c74-abb1-08718780a82b');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2018-11-08 19:59:30','2018-11-08 19:59:30','54e8e72f-ae87-46cc-b940-534bf7243365'),(3,3,1,NULL,NULL,1,'2018-11-16 06:32:50','2018-11-16 19:51:02','d88896bf-8011-4797-b8bc-44071ea5b539'),(5,5,1,NULL,NULL,1,'2018-11-16 19:51:01','2018-11-16 19:51:01','f1e3444a-85e5-400b-b0f5-e678799369d2'),(6,6,1,NULL,NULL,1,'2018-11-16 19:51:02','2018-11-16 19:51:02','72f1de94-b874-404b-9c78-8b8a0733337c'),(7,7,1,NULL,NULL,1,'2018-11-16 19:51:02','2018-11-16 19:51:02','59e23f8d-5411-4644-aa92-ec33ea12bcd1'),(8,8,1,NULL,NULL,1,'2018-11-16 19:51:02','2018-11-16 19:51:02','3df0a385-05fe-49d3-be02-03204cdab8c2'),(9,9,1,NULL,NULL,1,'2018-11-16 19:51:02','2018-11-16 19:51:02','c7be112e-faae-46f5-91dd-c14e95970cfa'),(10,10,1,NULL,NULL,1,'2018-11-16 19:51:02','2018-11-16 19:51:02','e3fa64c0-d17b-4b56-923f-f7e55b2439d8'),(11,11,1,NULL,NULL,1,'2018-11-16 19:51:02','2018-11-16 19:51:02','90464ff8-9c08-482b-803b-55eb4be70af8'),(12,12,1,NULL,NULL,1,'2018-11-16 19:51:02','2018-11-16 19:51:02','4221f46d-3e12-4fd9-8c56-3baadafb7947'),(13,13,1,NULL,NULL,1,'2018-11-16 19:51:02','2018-11-16 19:51:02','cc29e042-7d6d-42c6-b3b9-8afbd78d06c3'),(14,14,1,NULL,NULL,1,'2018-11-16 19:51:03','2018-11-16 19:51:03','95756b2f-2183-4a50-bcdf-af889269face'),(15,15,1,NULL,NULL,1,'2018-11-16 19:51:03','2018-11-16 19:51:03','b29021c7-5a4d-4abb-aa6d-8f512f0e0c2f'),(16,16,1,NULL,NULL,1,'2018-11-16 19:51:03','2018-11-16 19:51:03','af6c1b3c-b0f7-4d8a-9ece-9c018e4f87fc'),(17,17,1,NULL,NULL,1,'2018-11-16 19:51:03','2018-11-16 19:51:03','845266f3-1dca-4363-ae88-d9dc85951499'),(18,18,1,NULL,NULL,1,'2018-11-16 19:51:03','2018-11-16 19:51:03','ea7675f2-07bf-4cae-853d-8aa678a669e9'),(19,19,1,NULL,NULL,1,'2018-11-16 19:51:03','2018-11-16 19:51:03','00cc64a5-3254-4dde-ab2c-1e0bacc8ce97'),(20,20,1,NULL,NULL,1,'2018-11-16 19:51:03','2018-11-16 19:51:03','2f36f038-47b1-4079-9d95-efe973031309'),(21,21,1,NULL,NULL,1,'2018-11-16 19:51:03','2018-11-16 19:51:03','542d6a15-bb24-43c3-b35b-4626d5d63391'),(22,22,1,NULL,NULL,1,'2018-11-16 19:51:03','2018-11-16 19:51:03','163077d9-584a-43a0-a694-877fbd7de783'),(23,23,1,NULL,NULL,1,'2018-11-16 19:51:03','2018-11-16 19:51:03','165540e6-48b5-4819-81b4-460fbe5f8a95'),(24,24,1,NULL,NULL,1,'2018-11-16 19:51:04','2018-11-16 19:51:04','019e212b-8550-49a2-a4f3-9ef02efd40b0'),(25,25,1,NULL,NULL,1,'2018-11-16 19:51:04','2018-11-16 19:51:04','1d54bc77-eeba-4fd1-9576-7a2b99a8e249'),(26,26,1,NULL,NULL,1,'2018-11-16 19:51:04','2018-11-16 19:51:04','03c0fdc9-2d08-4065-a8ca-6706ef63187f'),(27,27,1,NULL,NULL,1,'2018-11-16 19:51:04','2018-11-16 19:51:04','8af4d28f-35e3-43cb-ad72-b3227398e5e5'),(28,28,1,NULL,NULL,1,'2018-11-16 19:51:04','2018-11-16 19:51:04','babbcf5d-0db3-47fd-a7a1-2fcf5ca9f97a'),(29,29,1,NULL,NULL,1,'2018-11-16 19:51:04','2018-11-16 19:51:04','7de36c09-b07b-4a8e-8648-132d62e3e18e'),(30,30,1,NULL,NULL,1,'2018-11-16 19:51:04','2018-11-16 19:51:04','85eac4f6-b489-4642-9e1f-f2f9c5778e4a'),(31,31,1,NULL,NULL,1,'2018-11-16 19:51:04','2018-11-16 19:51:04','fca45309-532b-4d8a-b8f3-e40e1118e3af'),(32,32,1,NULL,NULL,1,'2018-11-16 19:51:04','2018-11-16 19:51:04','d5c38207-a035-4155-b01d-b2f56243bd9e'),(33,33,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','f8ba78ce-e768-422b-a2b2-65ec90e48a10'),(34,34,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','d4d67903-3d94-4465-808b-2d6dcbe5405b'),(35,35,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','bde860fd-1823-43f4-b9f3-f59f0e88d0a0'),(36,36,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','8f599ccc-0045-4873-96c4-1a20e09572fb'),(37,37,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','c6b12db5-3fa7-4c2f-a7ff-433eaff22adf'),(38,38,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','ccb48d42-a52a-47d2-a807-5e4cfc7415dc'),(39,39,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','8bb7b155-f271-4030-b633-08e071f1e9ed'),(40,40,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','f0c0da83-f335-41e3-9c83-2a7a033a1c82'),(41,41,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','8b1d1786-7cfb-42f0-b76f-381588c80c93'),(42,42,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','50433e2d-7f46-4006-be4c-8a44e3d086b9'),(43,43,1,NULL,NULL,1,'2018-11-16 19:51:05','2018-11-16 19:51:05','be7dc251-ac4c-4a83-9535-1c2a743430b7'),(44,44,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','6141226f-b75a-4741-adba-0cba03169f07'),(45,45,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','e6b07658-1153-4081-970e-789e9ba7ad9d'),(46,46,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','8342d8ee-3ae7-4ce1-a39b-7741539466b2'),(47,47,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','ad589aec-7b16-45bd-a142-d823ee17f146'),(48,48,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','160e9f87-ed91-4288-adf3-67c9c721741d'),(49,49,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','ec161401-37b4-4b2e-9907-ae752aa2e73b'),(50,50,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','4a1732dc-0531-480d-a746-691897ad5028'),(51,51,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','cf48a4f6-af71-4547-8aa9-a72d7d7cb241'),(52,52,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','983548d8-3fc4-4615-8330-6c603ef3ce9d'),(53,53,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','1789c4bb-7865-4d0b-871b-47f558efdfa7'),(54,54,1,NULL,NULL,1,'2018-11-16 19:51:06','2018-11-16 19:51:06','3eb2f053-2a20-4e4b-bae5-4eaba8bc4b86'),(55,55,1,NULL,NULL,1,'2018-11-16 19:51:07','2018-11-16 19:51:07','0b0f3efc-2728-40c2-b33a-35e57667442b'),(56,56,1,NULL,NULL,1,'2018-11-16 19:51:07','2018-11-16 19:51:07','c0b01ab5-7c2a-4389-bafa-4b0356d7430e'),(57,57,1,NULL,NULL,1,'2018-11-16 19:51:07','2018-11-16 19:51:07','9a5f9cf8-db06-4069-aa92-8980e7dd70f9'),(58,58,1,NULL,NULL,1,'2018-11-16 19:51:07','2018-11-16 19:51:07','0ce640f0-bcef-4113-b984-8be9692efce6'),(59,59,1,NULL,NULL,1,'2018-11-16 19:51:07','2018-11-16 19:51:07','37f9dac3-fb5c-4e84-9668-60640e9e4ab4'),(60,60,1,NULL,NULL,1,'2018-11-16 19:51:07','2018-11-16 19:51:07','6ee9e5bc-487f-407f-8703-7b1d31740b97'),(61,61,1,NULL,NULL,1,'2018-11-16 19:51:07','2018-11-16 19:51:07','b0fd6669-9d3b-43d7-9010-306428162a8d'),(62,62,1,NULL,NULL,1,'2018-11-16 19:51:07','2018-11-16 19:51:07','e848c32c-7e87-4f91-9057-20a887a34a70'),(63,63,1,NULL,NULL,1,'2018-11-16 19:51:07','2018-11-16 19:51:07','93f34232-f62e-4a0f-b516-1b8d32853fb7'),(64,64,1,NULL,NULL,1,'2018-11-16 19:51:07','2018-11-16 19:51:07','24c74da9-3f55-496c-ba8e-7998bc508a6a'),(65,65,1,NULL,NULL,1,'2018-11-16 19:51:08','2018-11-16 19:51:08','6cab34f1-9855-4a34-b047-e5878646f7f3'),(66,66,1,NULL,NULL,1,'2018-11-16 19:51:08','2018-11-16 19:51:08','b1c1bfff-f99d-4fc6-9902-7acd5a50c832'),(67,67,1,NULL,NULL,1,'2018-11-16 19:51:08','2018-11-16 19:51:08','f391e776-ce94-410e-9fcd-b5efd5019b96'),(68,68,1,NULL,NULL,1,'2018-11-16 19:51:08','2018-11-16 19:51:08','c371e103-9f2f-4b28-92f3-9ce8e8636d51'),(69,69,1,NULL,NULL,1,'2018-11-16 19:51:08','2018-11-16 19:51:08','7a903ae8-6263-4bd0-b1f1-21dedc298288'),(70,70,1,NULL,NULL,1,'2018-11-16 19:51:08','2018-11-16 19:51:08','6a2e359d-5639-49c1-9991-fc4f14c2a3c2'),(71,71,1,NULL,NULL,1,'2018-11-16 19:51:08','2018-11-16 19:51:08','137d44db-d719-42ed-a908-7a28233a5995'),(72,72,1,NULL,NULL,1,'2018-11-16 19:51:08','2018-11-16 19:51:08','95747397-6771-4a05-abc4-12ee13f06ddd'),(73,73,1,NULL,NULL,1,'2018-11-16 19:51:08','2018-11-16 19:51:08','647712aa-5031-4370-9ac5-f921fcf3eaef'),(74,74,1,NULL,NULL,1,'2018-11-16 19:51:09','2018-11-16 19:51:09','9c8547df-f5fc-471b-b43b-a1ec6d46f63f'),(75,75,1,NULL,NULL,1,'2018-11-16 19:51:09','2018-11-16 19:51:09','766ec192-f931-4f29-aef1-ce489f5a8c26'),(76,76,1,NULL,NULL,1,'2018-11-16 19:51:09','2018-11-16 19:51:09','d41f5513-c71d-43d2-994f-a2a6f16b3f94'),(77,77,1,NULL,NULL,1,'2018-11-16 19:51:09','2018-11-16 19:51:09','affd9c24-6d1f-461b-8a46-1ee2affbfe85'),(78,78,1,NULL,NULL,1,'2018-11-16 19:51:09','2018-11-16 19:51:09','0060f40d-c5eb-47fd-9d33-86c69fa52395'),(79,79,1,NULL,NULL,1,'2018-11-16 19:51:09','2018-11-16 19:51:09','91c33fa6-6139-4390-b20f-a43f92009c28'),(80,80,1,NULL,NULL,1,'2018-11-16 19:51:09','2018-11-16 19:51:09','48c49a70-f9d2-4e22-adc6-5ea57319b021'),(81,81,1,NULL,NULL,1,'2018-11-16 19:51:09','2018-11-16 19:51:09','50fd8a5d-5dc1-4cae-9cd7-49a19869c67f'),(82,82,1,NULL,NULL,1,'2018-11-16 19:51:10','2018-11-16 19:51:10','40bb67e1-45fd-4a8d-a9e2-ae3e2b7663a9'),(83,83,1,NULL,NULL,1,'2018-11-16 19:51:10','2018-11-16 19:51:10','073d145e-68f6-4352-beaf-9fd716e4ceac'),(84,84,1,NULL,NULL,1,'2018-11-16 19:51:10','2018-11-16 19:51:10','0a7153ed-fa12-462f-830e-24bcfe620331'),(85,85,1,NULL,NULL,1,'2018-11-16 19:51:10','2018-11-16 19:51:10','53c3889f-b10f-476c-8c98-7961eafddb67'),(86,86,1,NULL,NULL,1,'2018-11-16 19:51:10','2018-11-16 19:51:10','2d423254-65f0-44a5-8903-6f3908629626'),(87,87,1,NULL,NULL,1,'2018-11-16 19:51:10','2018-11-16 19:51:10','8d0b3170-e1a5-4cea-835c-0bc55909b954'),(88,88,1,NULL,NULL,1,'2018-11-16 19:51:10','2018-11-16 19:51:10','860eb4da-cf8c-4da0-be4d-97c9ed9dfeee'),(89,89,1,NULL,NULL,1,'2018-11-16 19:51:10','2018-11-16 19:51:10','63c50b0d-316e-4c29-8bde-c90355b1acab'),(90,90,1,NULL,NULL,1,'2018-11-16 19:51:10','2018-11-16 19:51:10','7f15674e-887b-408b-86e1-a96ae23ae4c4'),(91,91,1,NULL,NULL,1,'2018-11-16 19:51:11','2018-11-16 19:51:11','18573b30-c0c7-44b2-bfc5-e67fca22c27d'),(92,92,1,NULL,NULL,1,'2018-11-16 19:51:11','2018-11-16 19:51:11','d87e7a46-2c31-4b1b-990e-1eed8ae38699'),(93,93,1,NULL,NULL,1,'2018-11-16 19:51:11','2018-11-16 19:51:11','8db965b9-1278-4ef5-9cbf-b83bce0cc161'),(94,94,1,NULL,NULL,1,'2018-11-16 19:51:11','2018-11-16 19:51:11','8e7a7458-e8f6-4485-b65b-ee7cc15a3e42'),(95,95,1,NULL,NULL,1,'2018-11-16 19:51:11','2018-11-16 19:51:11','c90b44dd-28be-4308-9cd3-f0e8fdf68341'),(96,96,1,NULL,NULL,1,'2018-11-16 19:51:11','2018-11-16 19:51:11','7372ecf2-3e4b-4abb-ba8c-274a53dd24c0'),(97,97,1,NULL,NULL,1,'2018-11-16 19:51:11','2018-11-16 19:51:11','f3186dad-d7de-41d6-a3cc-58dac88c9c44'),(98,98,1,NULL,NULL,1,'2018-11-16 19:51:11','2018-11-16 19:51:11','1231f3c3-e95e-49b3-b1fb-4a8e0d5e07c9'),(99,99,1,NULL,NULL,1,'2018-11-16 19:51:11','2018-11-16 19:51:11','072eecea-c5c1-425b-a790-c4f4acff6cd1'),(100,100,1,NULL,NULL,1,'2018-11-16 19:51:12','2018-11-16 19:51:12','f97d4a83-4c3b-4035-8b5d-5277589716a4'),(101,101,1,NULL,NULL,1,'2018-11-16 19:51:12','2018-11-16 19:51:12','d44b8ceb-7b0f-45a1-bf63-4a2f1d26460d'),(102,102,1,NULL,NULL,1,'2018-11-16 19:51:12','2018-11-16 19:51:12','eb811f53-eba9-4831-b9fb-09521a271269'),(103,103,1,NULL,NULL,1,'2018-11-16 19:51:12','2018-11-16 19:51:12','498aadb5-9c3e-451e-965f-c47284dd3a65'),(104,104,1,NULL,NULL,1,'2018-11-16 19:51:12','2018-11-16 19:51:12','6878d036-f321-4fcf-8a9e-0fa75d901a38'),(105,105,1,NULL,NULL,1,'2018-11-16 19:51:12','2018-11-16 19:51:12','e23d7b66-e710-44ce-91e9-438d808f0637'),(106,106,1,NULL,NULL,1,'2018-11-16 19:51:12','2018-11-16 19:51:12','3aea427c-9148-4180-9b78-1d6fbf803218'),(107,107,1,NULL,NULL,1,'2018-11-16 19:51:12','2018-11-16 19:51:12','1052b505-91dd-4ca3-9078-5810bff98095'),(108,108,1,NULL,NULL,1,'2018-11-16 19:51:12','2018-11-16 19:51:12','6ddb6bd1-8938-4cd5-a6bf-ca10c5c7a8aa'),(109,109,1,NULL,NULL,1,'2018-11-16 19:51:12','2018-11-16 19:51:12','c3c3a584-1c20-4a8a-9795-c3e646c323d3'),(110,110,1,NULL,NULL,1,'2018-11-16 19:51:13','2018-11-16 19:51:13','54fd2701-82de-4a89-b8c3-0658ada9cec0'),(111,111,1,NULL,NULL,1,'2018-11-16 19:51:13','2018-11-16 19:51:13','e2f2f744-fd80-4cd7-86d7-1d88cae565ab'),(112,112,1,NULL,NULL,1,'2018-11-16 19:51:13','2018-11-16 19:51:13','145bc74d-583e-4e9b-a1da-d1df1d47caa4'),(113,113,1,NULL,NULL,1,'2018-11-16 19:51:13','2018-11-16 19:51:13','07c5e6a3-3f1f-46ae-baea-e334e9f4124f'),(114,114,1,NULL,NULL,1,'2018-11-16 19:51:13','2018-11-16 19:51:13','248672e9-5dba-4a9f-b177-52895dbe2049'),(115,115,1,NULL,NULL,1,'2018-11-16 19:51:13','2018-11-16 19:51:13','82b46179-aa7c-452a-a945-887b1f6b183f'),(116,116,1,NULL,NULL,1,'2018-11-16 19:51:13','2018-11-16 19:51:13','1e4c1d5a-1d01-4b58-af81-6e149560d3c7'),(117,117,1,NULL,NULL,1,'2018-11-16 19:51:13','2018-11-16 19:51:13','bba61412-869f-489a-8727-d94a78de5dda'),(118,118,1,NULL,NULL,1,'2018-11-16 19:51:13','2018-11-16 19:51:13','9ec46343-bcba-447b-af1f-54800cfc4c03'),(119,119,1,NULL,NULL,1,'2018-11-16 19:51:13','2018-11-16 19:51:13','bfdf609a-ee4b-4f64-8959-c334a27f9a83'),(120,120,1,NULL,NULL,1,'2018-11-16 19:51:14','2018-11-16 19:51:14','016c4ff6-2154-4b32-be98-e5f7d58e549c'),(121,121,1,NULL,NULL,1,'2018-11-16 19:51:14','2018-11-16 19:51:14','182d86d1-075a-4fd8-aadd-95ef0fea7005'),(122,122,1,NULL,NULL,1,'2018-11-16 19:51:14','2018-11-16 19:51:14','bd63677d-89e1-4451-ab4b-0cfdf13c1f8c'),(123,123,1,NULL,NULL,1,'2018-11-16 19:51:14','2018-11-16 19:51:14','ea340916-0ee6-40bd-b471-b452c6c1b5e7'),(124,124,1,NULL,NULL,1,'2018-11-16 19:51:14','2018-11-16 19:51:14','4c97b579-5349-4d5d-8810-94b0abc4ce4e'),(125,125,1,NULL,NULL,1,'2018-11-16 19:51:14','2018-11-16 19:51:14','e2c73cbd-b896-41c1-ae23-3e0e4ba15fae'),(126,126,1,NULL,NULL,1,'2018-11-16 19:51:14','2018-11-16 19:51:14','45e13a40-f9cc-4a16-a4a9-2158fa6bfede'),(127,127,1,NULL,NULL,1,'2018-11-16 19:51:14','2018-11-16 19:51:14','1e2f0c7a-def4-4581-b532-0c56d9e41ecf'),(128,128,1,NULL,NULL,1,'2018-11-16 19:51:14','2018-11-16 19:51:14','e4c8b1ae-e5e1-4d5c-a22f-a2f037f2746c'),(129,129,1,NULL,NULL,1,'2018-11-16 19:51:14','2018-11-16 19:51:14','08c56af3-8e3a-4a8c-8f2d-e09b3dd7727c'),(130,130,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','8ccef37e-2296-4941-b246-13b8d49ec23b'),(131,131,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','8b368e41-4660-4ccf-93d1-aab0c28a39fe'),(132,132,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','eadcd57d-ae30-44de-b6fb-9430ab13a2e7'),(133,133,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','0ecad5da-f526-4341-bed3-67d2031bcdbe'),(134,134,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','da108b18-3328-4141-a5b2-58a665a51d82'),(135,135,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','59e6107e-d284-4a15-978c-9ae8dcc7916a'),(136,136,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','8235227b-ee85-485a-a5a9-a2dee69fa625'),(137,137,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','59ddb9ed-0cff-4502-adab-862393ac2b6a'),(138,138,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','389630a8-5152-4bc1-8098-24ea2cc7552e'),(139,139,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','3b8724ec-721b-4dcd-a9a6-c4c314f881a1'),(140,140,1,NULL,NULL,1,'2018-11-16 19:51:15','2018-11-16 19:51:15','2bffc297-2b18-457a-b833-9c9beb44e9cd'),(141,141,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','2fb00c95-5f08-4563-bba4-41e21c5729c8'),(142,142,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','47f9a3cf-decc-48e2-93ab-153c6f329403'),(143,143,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','ae73f21a-c090-41a5-8283-98c82df65782'),(144,144,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','2b1d90c1-4e01-4cdf-b2f9-d66e5e3d5ad8'),(145,145,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','c62625c6-53a6-43b2-a11b-79dbc6bc447d'),(146,146,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','2fd6f252-8b63-4c48-bebc-d4ce2c678834'),(147,147,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','58926f74-32b5-477c-b33f-900f8283fcf6'),(148,148,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','360af981-d1f7-40c5-b6ca-a74bf76c5714'),(149,149,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','782c2463-c0ce-4629-9305-5b7082b55ff1'),(150,150,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','da5f9089-7c3e-4a97-b663-afc31ee8eadd'),(151,151,1,NULL,NULL,1,'2018-11-16 19:51:16','2018-11-16 19:51:16','7c85166e-5c71-4eed-aee1-e101a6652303'),(154,154,1,NULL,NULL,1,'2018-11-20 01:30:09','2018-11-20 01:30:09','7dea6d0c-387b-4b15-a379-85f6769df567'),(156,156,1,'homepage','homepage',1,'2018-11-24 23:00:32','2018-11-26 23:51:10','48323ac2-c35e-46a4-86d5-ffd1ec5c4e6e'),(157,157,1,'11-transition-assistance','transition-assistance',1,'2018-11-24 23:46:00','2018-11-26 23:52:02','82204269-962d-4a2d-a12a-3d94bc57ae3a'),(158,158,1,'transition-mentoring-workshops','transition-mentoring-workshops',1,'2018-11-25 00:00:49','2018-11-27 00:05:10','cb949c07-91b1-4dc8-8377-7c2d254a4fc6'),(159,159,1,'mission','mission',1,'2018-11-25 18:49:17','2018-11-25 18:51:11','56da97b5-91f8-41ac-bb34-f39c45fae863'),(160,160,1,'corporate-education','corporate-education',1,'2018-11-25 18:51:25','2018-11-27 00:25:32','1545e582-b4a1-46df-b380-b397adb4e1eb'),(161,161,1,'digital-library','digital-library',1,'2018-11-25 18:53:03','2018-11-27 00:16:44','80142fbd-c98b-4ca0-8915-c9dad086c227'),(162,162,1,'mentors','mentors',1,'2018-11-25 19:13:39','2018-11-25 19:14:01','587c5c72-709f-4282-9103-2f9a0dca5972'),(163,163,1,'team','team',1,'2018-11-25 19:17:20','2018-11-25 19:20:03','a87ac1ae-7737-4132-b844-65b9fc09a9da'),(164,164,1,'partners','partners',1,'2018-11-25 19:24:21','2018-11-25 19:24:40','dcbc8de0-3ac0-4608-a4d8-fca5b2c8f4ad'),(165,165,1,NULL,NULL,1,'2018-11-26 21:49:33','2018-11-26 21:49:33','0c205453-650c-44d9-a430-e36fd44ff121'),(166,166,1,NULL,NULL,1,'2018-11-26 22:49:42','2018-11-26 23:11:13','af1b6104-4b8d-4535-bd21-a75fb5ac2811'),(167,167,1,'donate','donate',1,'2018-11-26 23:17:14','2018-11-26 23:18:05','fbf0f66f-c757-493e-8bc7-348c93d9086e'),(168,168,1,NULL,NULL,1,'2018-11-26 23:35:05','2018-11-26 23:51:10','c61920c9-2999-44d9-ba09-c825e11053e5'),(169,169,1,NULL,NULL,1,'2018-11-26 23:35:05','2018-11-26 23:51:10','94a7680b-7538-4229-bd73-43426a6aecff'),(170,170,1,NULL,NULL,1,'2018-11-26 23:35:05','2018-11-26 23:51:10','52d25a55-1d32-4c8b-96c1-7fe950a4cf25');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (156,2,2,NULL,'2018-11-24 23:00:00',NULL,'2018-11-24 23:00:32','2018-11-26 23:51:10','93e4723a-93d1-41b2-9b7d-8b97f81814c8'),(157,4,4,NULL,'2018-11-24 23:46:00',NULL,'2018-11-24 23:46:00','2018-11-26 23:52:02','d8c6e247-8331-4e33-b6fc-f10a78114112'),(158,5,5,NULL,'2018-11-25 00:00:00',NULL,'2018-11-25 00:00:49','2018-11-27 00:05:10','8b3b6ff3-724e-4125-a935-e5c5d8a8367d'),(159,6,6,NULL,'2018-11-25 18:49:00',NULL,'2018-11-25 18:49:17','2018-11-25 18:51:11','2e86cdd9-cd64-4f53-9310-a4b7945784a1'),(160,7,7,NULL,'2018-11-25 18:51:00',NULL,'2018-11-25 18:51:25','2018-11-27 00:25:32','df4f7efe-7fe7-4c4f-9a17-c6152c122e81'),(161,8,8,NULL,'2018-11-25 18:53:00',NULL,'2018-11-25 18:53:03','2018-11-27 00:16:44','946ecd7b-6e46-4048-8d18-305a6dbd156b'),(162,9,9,NULL,'2018-11-25 19:13:00',NULL,'2018-11-25 19:13:39','2018-11-25 19:14:01','d54f71cb-a02d-4912-94b2-5643acf7c771'),(163,10,10,NULL,'2018-11-25 19:17:00',NULL,'2018-11-25 19:17:20','2018-11-25 19:20:03','0b41b9ae-3ddb-4b3d-9781-a2f515e4e138'),(164,11,11,NULL,'2018-11-25 19:24:00',NULL,'2018-11-25 19:24:21','2018-11-25 19:24:40','93dd7426-1c30-4b04-8c44-e51a6c610565'),(167,13,13,NULL,'2018-11-26 23:17:00',NULL,'2018-11-26 23:17:14','2018-11-26 23:18:05','3aef5fed-50c9-4c87-a72f-41c73432ebfe');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrydrafts`
--

DROP TABLE IF EXISTS `entrydrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrydrafts_sectionId_idx` (`sectionId`),
  KEY `entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `entrydrafts_siteId_idx` (`siteId`),
  KEY `entrydrafts_creatorId_idx` (`creatorId`),
  CONSTRAINT `entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrydrafts`
--

LOCK TABLES `entrydrafts` WRITE;
/*!40000 ALTER TABLE `entrydrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrydrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (2,2,6,'Homepage','homepage',0,NULL,'{section.name|raw}',1,'2018-11-24 23:00:32','2018-11-26 23:36:36','e17108c6-dda4-48b3-b212-b4249a4609eb'),(3,3,9,'Upcoming Events','upcomingEvents',1,'Title',NULL,1,'2018-11-24 23:18:14','2018-11-26 23:13:14','826a72c3-63ea-4545-838c-0d83c862b56c'),(4,4,11,'1:1 Transition Assistance','transitionAssistance',0,NULL,'{section.name|raw}',1,'2018-11-24 23:46:00','2018-11-26 23:50:12','14dbdc3b-5265-479f-ad9f-3e46745c1ac2'),(5,5,12,'Transition Mentoring Workshops','transitionMentoringWorkshops',0,NULL,'{section.name|raw}',1,'2018-11-25 00:00:49','2018-11-27 00:04:40','b7395a13-49b1-4ce7-8072-0a86b79f3130'),(6,6,17,'Mission','mission',0,NULL,'{section.name|raw}',1,'2018-11-25 18:49:17','2018-11-25 18:51:10','d0331007-f19f-4455-bacf-181b847cc111'),(7,7,18,'Corporate Education','corporateEducation',0,NULL,'{section.name|raw}',1,'2018-11-25 18:51:25','2018-11-27 00:25:31','f04e0bbd-4883-453f-83ba-87a00e137f98'),(8,8,19,'Digital Library','digitalLibrary',0,NULL,'{section.name|raw}',1,'2018-11-25 18:53:03','2018-11-27 00:15:14','0e3d5445-024d-4240-b0eb-8d187d158d16'),(9,9,20,'Mentors','mentors',0,NULL,'{section.name|raw}',1,'2018-11-25 19:13:39','2018-11-25 19:14:00','11959169-50f7-41ee-8182-7ccdf20dcebf'),(10,10,22,'Team','team',0,NULL,'{section.name|raw}',1,'2018-11-25 19:17:20','2018-11-25 19:20:02','48de2704-30c3-4348-9723-3199707df1f6'),(11,11,25,'Partners','partners',0,NULL,'{section.name|raw}',1,'2018-11-25 19:24:21','2018-11-25 19:24:39','b8760b67-3805-4628-844e-39210834e95d'),(12,12,35,'News','news',1,'Title',NULL,1,'2018-11-26 23:14:47','2018-11-26 23:16:40','32c71268-d508-44c8-a517-5d6a36779e92'),(13,13,36,'Donate','donate',0,NULL,'{section.name|raw}',1,'2018-11-26 23:17:14','2018-11-26 23:18:04','29e59b33-f493-4492-ab92-4d2e9b13698b');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entryversions`
--

DROP TABLE IF EXISTS `entryversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entryversions_sectionId_idx` (`sectionId`),
  KEY `entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `entryversions_siteId_idx` (`siteId`),
  KEY `entryversions_creatorId_idx` (`creatorId`),
  CONSTRAINT `entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entryversions`
--

LOCK TABLES `entryversions` WRITE;
/*!40000 ALTER TABLE `entryversions` DISABLE KEYS */;
INSERT INTO `entryversions` VALUES (3,156,2,1,1,1,'Revision from Nov 26, 2018, 3:23:08 PM','{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1543100400,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"9\":[]}}','2018-11-26 23:28:37','2018-11-26 23:28:37','486050bc-e046-43e6-9ab4-23565bb9b81c'),(4,156,2,1,1,2,'','{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1543100400,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"Helping America\'s top tier servicemembers and veterans find personal and professional purpose after military service.\",\"1\":\"High Touch, High Impact\",\"7\":\"COMMIT helps servicemembers and veterans maintain their individual confidence throughout the transition process. We provide the information and resources servicemembers and veterans need to self-identify and understand their unique and personal value.\",\"3\":\"The COMMIT Foundation is fundamentally changing the way servicemembers and veterans approach their transition from the military\",\"5\":\"Misconceptions, skill translation gaps, and culture gaps may hinder many servicemembers and veterans from earning the right job and companies from hiring the right veteran\",\"12\":\"COMMIT aims to create serendipity for men and women transitioning from the military and entering Corporate America\",\"13\":\"We provide tailored solutions to meet the personal needs of every individual we serve.\",\"8\":\"COMMIT enables servicemembers and veterans’ ability to rethink and redefine what is possible. We encourage servicemembers and veterans to set high goals and then help to ensure they achieve them.\",\"6\":\"COMMIT helps servicemembers and veterans understand and articulate the value of their knowledge, skills, and abilities. We help them understand how to transfer that value to a meaningful civilian career.\",\"9\":{\"168\":{\"type\":\"testimonial\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"testimonialQuote\":\"In less than 48 hours, COMMIT truly set the foundation for my military transition to civilian life. COMMIT professionals provided unique tools, information and contacts to execute my final military operation! I am thankful for this organization and recommend it to America\'s best.\",\"testimonialAuthor\":\"Thomas Paul Vogel\"}},\"169\":{\"type\":\"testimonial\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"testimonialQuote\":\"The anxiety I was feeling about my civilian career transition has been replaced with excitement and enthusiasm thanks to COMMIT and its mentors. I can\'t wait to see where my journey after the military takes me.\",\"testimonialAuthor\":\"Dana De Coster\"}},\"170\":{\"type\":\"testimonial\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"testimonialQuote\":\"COMMIT connected me with a diverse group of veterans and mentors, who showed me new ways to develop and leverage my network while opening my eyes to opportunities I had never considered.\",\"testimonialAuthor\":\"George D Hasseltine\"}}}}}','2018-11-26 23:35:05','2018-11-26 23:35:05','6ac3425c-5049-4ed2-bff0-4a559afd739c'),(5,156,2,1,1,3,'','{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1543100400,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"Helping America\'s top tier servicemembers and veterans find personal and professional purpose after military service.\",\"1\":\"High Touch, High Impact\",\"7\":\"COMMIT helps servicemembers and veterans maintain their individual confidence throughout the transition process. We provide the information and resources servicemembers and veterans need to self-identify and understand their unique and personal value.\",\"18\":\"We teach our partners how to effectively identify, hire, and retain veteran talent in order to improve business outcomes.\",\"3\":\"The COMMIT Foundation is fundamentally changing the way servicemembers and veterans approach their transition from the military\",\"5\":\"Misconceptions, skill translation gaps, and culture gaps may hinder many servicemembers and veterans from earning the right job and companies from hiring the right veteran\",\"12\":\"COMMIT aims to create serendipity for men and women transitioning from the military and entering Corporate America\",\"13\":\"We provide tailored solutions to meet the personal needs of every individual we serve.\",\"17\":\"True to our name, we are committed to making significant, long-term impact in changing the way Corporate America thinks about hiring and retaining veteran talent\",\"8\":\"COMMIT enables servicemembers and veterans’ ability to rethink and redefine what is possible. We encourage servicemembers and veterans to set high goals and then help to ensure they achieve them.\",\"6\":\"COMMIT helps servicemembers and veterans understand and articulate the value of their knowledge, skills, and abilities. We help them understand how to transfer that value to a meaningful civilian career.\",\"14\":\"A highly individualized approach with experienced executive coaches using proven techniques to identify and resolve specific needs of transitioning servicemembers and veterans.\",\"168\":\"William Waynick II\",\"167\":\"This was a unique opportunity that has significantly raised my confidence that when it\'s time to transition, I will have great options. The staff and mentors were very knowledgeable and passionate about helping us prepare. I am thankful for COMMIT.\",\"9\":{\"168\":{\"type\":\"testimonial\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"testimonialQuote\":\"In less than 48 hours, COMMIT truly set the foundation for my military transition to civilian life. COMMIT professionals provided unique tools, information and contacts to execute my final military operation! I am thankful for this organization and recommend it to America\'s best.\",\"testimonialAuthor\":\"Thomas Paul Vogel\"}},\"169\":{\"type\":\"testimonial\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"testimonialQuote\":\"The anxiety I was feeling about my civilian career transition has been replaced with excitement and enthusiasm thanks to COMMIT and its mentors. I can\'t wait to see where my journey after the military takes me.\",\"testimonialAuthor\":\"Dana De Coster\"}},\"170\":{\"type\":\"testimonial\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"testimonialQuote\":\"COMMIT connected me with a diverse group of veterans and mentors, who showed me new ways to develop and leverage my network while opening my eyes to opportunities I had never considered.\",\"testimonialAuthor\":\"George D Hasseltine\"}}},\"16\":\"Study key insights and best practices from highly successful COMMIT alumni and leaders in Corporate America.\",\"15\":\"Focus on goal-setting, life’s decision points, and powerful lessons that reinforce values, family, and the passionate pursuit of a meaningful career.\"}}','2018-11-26 23:36:16','2018-11-26 23:36:16','b58151fa-d7b8-4fa2-97ce-e7035e03d246'),(6,157,4,1,1,1,'Revision from Nov 26, 2018, 3:47:38 PM','{\"typeId\":\"4\",\"authorId\":null,\"title\":\"1:1 Transition Assistance\",\"slug\":\"11-transition-assistance\",\"postDate\":1543103160,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":[]}','2018-11-26 23:49:56','2018-11-26 23:49:56','e3ce10c2-a3b3-4f5f-94de-2790b09a3e7a'),(7,157,4,1,1,2,'','{\"typeId\":\"4\",\"authorId\":null,\"title\":\"1:1 Transition Assistance\",\"slug\":\"11-transition-assistance\",\"postDate\":1543103160,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"29\":\"COMMIT meets you right where you are in transition. Let us help you build a plan that is tailored to your individual needs and timeline.\",\"28\":\"One-on-One Transition Assistance\",\"30\":\"A highly individualized approach with an experienced executive coach using proven techniques to engage, identify, and resolve specific needs of a transitioning veteran\",\"32\":\"Specifically Designed and Highly Tailored Programs\",\"33\":\"Servicemembers and veterans who participate in One-on-One Transition Assistance receive highly individualized services before, during, and beyond their transition. Our unique blend of proprietary techniques and certified professional tools have been developed by COMMIT over years of operation.\"}}','2018-11-26 23:49:56','2018-11-26 23:49:56','276643c4-9f46-4497-a7ca-5578b1ff9aeb'),(8,157,4,1,1,3,'','{\"typeId\":\"4\",\"authorId\":null,\"title\":\"1:1 Transition Assistance\",\"slug\":\"11-transition-assistance\",\"postDate\":1543103160,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"29\":\"COMMIT meets you right where you are in transition. Let us help you build a plan that is tailored to your individual needs and timeline.\",\"28\":\"One-on-One Transition Assistance\",\"30\":\"A highly individualized approach with an experienced executive coach using proven techniques to engage, identify, and resolve specific needs of a transitioning veteran\",\"32\":\"Specifically Designed and Highly Tailored Programs\",\"33\":\"Servicemembers and veterans who participate in One-on-One Transition Assistance receive highly individualized services before, during, and beyond their transition. Our unique blend of proprietary techniques and certified professional tools have been developed by COMMIT over years of operation.\",\"170\":\"William Waynick II\",\"169\":\"This was a unique opportunity that has significantly raised my confidence that when it\'s time to transition, I will have great options. The staff and mentors were very knowledgeable and passionate about helping us prepare. I am thankful for COMMIT.\"}}','2018-11-26 23:50:48','2018-11-26 23:50:48','cc547942-483e-41a3-8376-bcc4e8dd5173'),(9,156,2,1,1,4,'','{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1543100400,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"Helping America\'s top tier servicemembers and veterans find personal and professional purpose after military service.\",\"1\":\"High Touch, High Impact\",\"7\":\"COMMIT helps servicemembers and veterans maintain their individual confidence throughout the transition process. We provide the information and resources servicemembers and veterans need to self-identify and understand their unique and personal value.\",\"18\":\"We teach our partners how to effectively identify, hire, and retain veteran talent in order to improve business outcomes.\",\"3\":\"The COMMIT Foundation is fundamentally changing the way servicemembers and veterans approach their transition from the military\",\"5\":\"Misconceptions, skill translation gaps, and culture gaps may hinder many servicemembers and veterans from earning the right job and companies from hiring the right veteran\",\"12\":\"COMMIT aims to create serendipity for men and women transitioning from the military and entering Corporate America\",\"13\":\"We provide tailored solutions to meet the personal needs of every individual we serve.\",\"17\":\"True to our name, we are committed to making significant, long-term impact in changing the way Corporate America thinks about hiring and retaining veteran talent\",\"8\":\"COMMIT enables servicemembers and veterans’ ability to rethink and redefine what is possible. We encourage servicemembers and veterans to set high goals and then help to ensure they achieve them.\",\"6\":\"COMMIT helps servicemembers and veterans understand and articulate the value of their knowledge, skills, and abilities. We help them understand how to transfer that value to a meaningful civilian career.\",\"14\":\"A highly individualized approach with experienced executive coaches using proven techniques to identify and resolve specific needs of transitioning servicemembers and veterans.\",\"168\":\"Christian Andrew Moree\",\"167\":\"Commit is a deeply sophisticated and nuanced provider of veteran transition services. Their integrity and investment in veterans\' journeys is a best in class benchmark to which all VSOs should strive.\",\"9\":{\"168\":{\"type\":\"testimonial\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"testimonialQuote\":\"In less than 48 hours, COMMIT truly set the foundation for my military transition to civilian life. COMMIT professionals provided unique tools, information and contacts to execute my final military operation! I am thankful for this organization and recommend it to America\'s best.\",\"testimonialAuthor\":\"Thomas Paul Vogel\"}},\"169\":{\"type\":\"testimonial\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"testimonialQuote\":\"The anxiety I was feeling about my civilian career transition has been replaced with excitement and enthusiasm thanks to COMMIT and its mentors. I can\'t wait to see where my journey after the military takes me.\",\"testimonialAuthor\":\"Dana De Coster\"}},\"170\":{\"type\":\"testimonial\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"testimonialQuote\":\"COMMIT connected me with a diverse group of veterans and mentors, who showed me new ways to develop and leverage my network while opening my eyes to opportunities I had never considered.\",\"testimonialAuthor\":\"George D Hasseltine\"}}},\"16\":\"Study key insights and best practices from highly successful COMMIT alumni and leaders in Corporate America.\",\"15\":\"Focus on goal-setting, life’s decision points, and powerful lessons that reinforce values, family, and the passionate pursuit of a meaningful career.\"}}','2018-11-26 23:51:10','2018-11-26 23:51:10','528fa640-e1f7-4adc-a4ad-f88bdcfe4348'),(10,157,4,1,1,4,'','{\"typeId\":\"4\",\"authorId\":null,\"title\":\"1:1 Transition Assistance\",\"slug\":\"11-transition-assistance\",\"postDate\":1543103160,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"29\":\"COMMIT meets you right where you are in transition. Let us help you build a plan that is tailored to your individual needs and timeline.\",\"28\":\"One-on-One Transition Assistance\",\"30\":\"A highly individualized approach with an experienced executive coach using proven techniques to engage, identify, and resolve specific needs of a transitioning veteran\",\"32\":\"Specifically Designed and Highly Tailored Programs\",\"33\":\"Servicemembers and veterans who participate in One-on-One Transition Assistance receive highly individualized services before, during, and beyond their transition. Our unique blend of proprietary techniques and certified professional tools have been developed by COMMIT over years of operation.\",\"38\":\"Focused Career Choices\",\"39\":\"COMMIT focuses on quality over quantity through high touch, high impact support. After identifying your values and strengths, COMMIT helps you find career opportunities at the convergence of passion, expertise, and geography.\",\"40\":\"Strengths and Skills\",\"41\":\"Support includes strengths assessment, values identification, resume assistance, executive coaching, mentorship, and scholarship assistance. COMMIT’s approach is built on individual needs, including both hard and soft skill personal development.\",\"42\":\"COMMIT leverages a vast network of successful alumni and leaders in Corporate America to help support, inform, and guide servicemembers and veterans as they transition into the industries they are passionate about.\",\"170\":\"William Waynick II\",\"169\":\"This was a unique opportunity that has significantly raised my confidence that when it\'s time to transition, I will have great options. The staff and mentors were very knowledgeable and passionate about helping us prepare. I am thankful for COMMIT.\"}}','2018-11-26 23:52:02','2018-11-26 23:52:02','7025e5b7-cd50-4ac1-bc23-6effcc0d43e8'),(11,158,5,1,1,1,'Revision from Nov 26, 2018, 3:59:30 PM','{\"typeId\":\"5\",\"authorId\":null,\"title\":\"Transition Mentoring Workshops\",\"slug\":\"transition-mentoring-workshops\",\"postDate\":1543104000,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":[]}','2018-11-27 00:01:53','2018-11-27 00:01:53','03f3ba25-c18a-45b6-a963-5726e4bfe4d0'),(12,158,5,1,1,2,'','{\"typeId\":\"5\",\"authorId\":null,\"title\":\"Transition Mentoring Workshops\",\"slug\":\"transition-mentoring-workshops\",\"postDate\":1543104000,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"44\":\"Harnessing the power of our networks and relationships, COMMIT facilitates synergy between top tier servicemembers and veterans and seasoned professionals from the private sector.\",\"43\":\"Transition Mentoring Workshops\",\"45\":\"Focus on values, key decision points, and powerful lessons that reinforce the importance of family and pursuing your passion when designing the life you want to live following your time in uniform\",\"46\":\"COMMIT believes 30 minutes of quality dialogue can forever change the trajectory of an individual\",\"47\":\"Workshops are specifically designed to provide servicemembers and veterans direct access to thoughtfully selected professionals and foster intimate environments where quality dialogue will occur.\",\"52\":\"Changing Perception\",\"53\":\"Led by professional executive coaches, servicemembers and veterans work through a series of modules focused on values, strengths, culture, and opportunities to change perspectives and improve trajectories.\",\"54\":\"Preparing Trajectory\",\"55\":\"Reinforcing integrity, family, and the passionate pursuit of a meaningful career, servicemembers and veterans hear from and personally engage with successfully transitioned servicemembers and veterans and leaders from Corporate America. Servicemembers and veterans and mentors have private, meaningful conversations in environments where they flourish.\",\"172\":\"Brian M Bradley\",\"171\":\"The COMMIT workshop I attended went above and beyond what I thought it could provide. Every topic covered relevant information that helped me see the transition process in a new light. Overall one of the best takeaways was the importance of translating learned skills in the military into relevant skills in the civilian sector, as well as how critical some of them are.\",\"57\":\"COMMIT facilitates workshops nationwide, allowing us to handpick perfect locations suited towards intimate working environments. No matter where your location, servicemembers and veterans from across the country are sponsored to attend COMMIT workshops in cities best suited for their success.\",\"56\":\"We take a hard look at the industries, interests, and skills of workshop participants in order to align world class mentors from specific industries, backgrounds, and locations to provide game changing value.\"}}','2018-11-27 00:01:53','2018-11-27 00:01:53','a3fd2d9b-febd-4a79-bc45-c79dbbd64972'),(13,158,5,1,1,3,'','{\"typeId\":\"5\",\"authorId\":null,\"title\":\"Transition Mentoring Workshops\",\"slug\":\"transition-mentoring-workshops\",\"postDate\":1543104000,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"44\":\"Harnessing the power of our networks and relationships, COMMIT facilitates synergy between top tier servicemembers and veterans and seasoned professionals from the private sector.\",\"43\":\"Transition Mentoring Workshops\",\"45\":\"Focus on values, key decision points, and powerful lessons that reinforce the importance of family and pursuing your passion when designing the life you want to live following your time in uniform\",\"46\":\"COMMIT believes 30 minutes of quality dialogue can forever change the trajectory of an individual\",\"47\":\"Workshops are specifically designed to provide servicemembers and veterans direct access to thoughtfully selected professionals and foster intimate environments where quality dialogue will occur.\",\"52\":\"Changing Perception\",\"53\":\"Led by professional executive coaches, servicemembers and veterans work through a series of modules focused on values, strengths, culture, and opportunities to change perspectives and improve trajectories.\",\"54\":\"Preparing Trajectory\",\"55\":\"Reinforcing integrity, family, and the passionate pursuit of a meaningful career, servicemembers and veterans hear from and personally engage with successfully transitioned servicemembers and veterans and leaders from Corporate America. Servicemembers and veterans and mentors have private, meaningful conversations in environments where they flourish.\",\"172\":\"Brian M Bradley\",\"171\":\"The COMMIT workshop I attended went above and beyond what I thought it could provide. Every topic covered relevant information that helped me see the transition process in a new light. Overall one of the best takeaways was the importance of translating learned skills in the military into relevant skills in the civilian sector, as well as how critical some of them are.\",\"174\":\"Andrew Ries\",\"173\":\"It\'s impossible to overstate how important COMMIT and the workshops are to a successful transition from military service. The discussions were at the right level, targeting individuals who want to continue performing at a high level post-transition. In addition to refining important skills like networking, the workshop provided opportunities to have candid discussions with long-time industry professionals about important topics like corporate culture and career planning. An exceptional event and highly recommended!\",\"57\":\"COMMIT facilitates workshops nationwide, allowing us to handpick perfect locations suited towards intimate working environments. No matter where your location, servicemembers and veterans from across the country are sponsored to attend COMMIT workshops in cities best suited for their success.\",\"56\":\"We take a hard look at the industries, interests, and skills of workshop participants in order to align world class mentors from specific industries, backgrounds, and locations to provide game changing value.\"}}','2018-11-27 00:05:10','2018-11-27 00:05:10','2e08416c-2126-4bb0-b4c1-c3af4e2884a8'),(14,161,8,1,1,1,'Revision from Nov 26, 2018, 4:15:15 PM','{\"typeId\":\"8\",\"authorId\":null,\"title\":\"Digital Library\",\"slug\":\"digital-library\",\"postDate\":1543171980,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":[]}','2018-11-27 00:16:44','2018-11-27 00:16:44','d15a421b-6db6-4cf0-8211-510b5cd6b509'),(15,161,8,1,1,2,'','{\"typeId\":\"8\",\"authorId\":null,\"title\":\"Digital Library\",\"slug\":\"digital-library\",\"postDate\":1543171980,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"59\":\"The Digital Library provides a growing collection of videos on specific subjects transitioning servicemembers and veterans and Corporate America find most critical or challenging to overcome.\",\"58\":\"The Digital Library\",\"60\":\"Study key insights and best practices from highly successful COMMIT alumni and leaders in Corporate America.\",\"62\":\"The Digital Library\",\"63\":\"COMMIT leverages a vast network of experienced professionals from Corporate America to provide key insights on transferable skills, interviewing, networking, mentorship, leadership, and much more.\",\"65\":\"Insights and Industry Interviews\",\"66\":\"While working to identify an industry to begin your new career, COMMIT’s interviews with leaders from Corporate America provide immediate insight into necessary skills, expectations in the work environment, and key tips for professional success.\"}}','2018-11-27 00:16:44','2018-11-27 00:16:44','3c665ef1-25f3-4e37-9432-36e2e72e65f8');
/*!40000 ALTER TABLE `entryversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (2,'Homepage','2018-11-24 23:06:31','2018-11-24 23:06:31','cbcf899a-d463-4ccd-bc49-7a3fce7543c8'),(4,'Upcoming Events','2018-11-24 23:17:19','2018-11-24 23:19:07','c82857e5-7eb3-4798-a072-d55d3ccbbaf9'),(5,'1:1 Transition Assistance','2018-11-24 23:37:24','2018-11-24 23:37:24','7ce45a08-d8aa-414e-8b46-2b7c64725fd2'),(6,'Transition Mentoring Workshops','2018-11-25 00:01:30','2018-11-26 23:55:38','b87c8e84-708c-43ef-959d-44bf90dcb7b6'),(7,'Digital Library','2018-11-25 17:16:35','2018-11-25 17:16:35','877d1e55-724f-4e5c-93b1-75515d29e3f9'),(8,'Corporate Education','2018-11-25 17:25:25','2018-11-25 17:25:25','01d798a4-4891-4b2b-8c7a-406be1916969'),(9,'Mission','2018-11-25 18:29:10','2018-11-25 18:29:10','5d45dcf9-800e-4068-8156-01bec3c97c73'),(10,'Mentors','2018-11-25 19:09:52','2018-11-25 19:09:52','85e1096e-b786-4738-8778-a2b191fe250b'),(11,'Team','2018-11-25 19:14:11','2018-11-25 19:14:11','0ced3a80-92fd-49a9-b2c2-6a1398f9598c'),(12,'Partners','2018-11-25 19:20:19','2018-11-25 19:20:19','c55d652b-bd2a-46c1-8f4a-9e01b7d88f88'),(13,'Donate','2018-11-25 19:20:49','2018-11-25 19:20:49','b48f2f5c-2b99-4ad1-bef5-9d8e6d87e33a'),(14,'News','2018-11-26 23:15:11','2018-11-26 23:15:11','20e5c9f3-4302-4d23-9f16-4c8ec07738e6');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (54,17,13,92,0,1,'2018-11-25 18:51:10','2018-11-25 18:51:10','5306e51e-b67c-4654-bdb3-79af7c91e49b'),(55,17,13,91,0,2,'2018-11-25 18:51:10','2018-11-25 18:51:10','8c2c96d4-2734-4494-a516-31760cb3702e'),(56,17,13,93,0,3,'2018-11-25 18:51:10','2018-11-25 18:51:10','c64cdad6-9ec9-4c55-a3f1-c3f3c237e3d6'),(57,17,13,98,0,4,'2018-11-25 18:51:10','2018-11-25 18:51:10','c0e3c80f-5860-49b1-9335-5cd27b7c90be'),(58,17,13,94,0,5,'2018-11-25 18:51:10','2018-11-25 18:51:10','2ab07209-7d67-46e6-9cb2-af9087fcf0ee'),(59,17,13,95,0,6,'2018-11-25 18:51:10','2018-11-25 18:51:10','5ad86b25-9583-46e7-9447-3f75c63c6a47'),(60,17,13,96,0,7,'2018-11-25 18:51:10','2018-11-25 18:51:10','5ce40c7b-32e9-459c-aaa6-0f45ab168c60'),(61,17,13,97,0,8,'2018-11-25 18:51:10','2018-11-25 18:51:10','fe4a3036-cfe4-4ae0-999f-35c23ca33c97'),(62,17,13,99,0,9,'2018-11-25 18:51:10','2018-11-25 18:51:10','a2db1f48-5b8a-42bf-8949-a512b29653b2'),(63,17,13,100,0,10,'2018-11-25 18:51:10','2018-11-25 18:51:10','5014881e-98cf-4c4e-bd50-d22bcc234303'),(64,17,13,101,0,11,'2018-11-25 18:51:10','2018-11-25 18:51:10','e6f841e4-7fbd-4342-b999-8b7a8690160b'),(65,17,13,102,0,12,'2018-11-25 18:51:10','2018-11-25 18:51:10','0008eb95-4fc5-40e9-b473-10f1d4a45b71'),(66,17,13,103,0,13,'2018-11-25 18:51:10','2018-11-25 18:51:10','080f9bb7-bb66-4d13-9736-57c4674472fa'),(67,17,13,104,0,14,'2018-11-25 18:51:10','2018-11-25 18:51:10','f113b701-ebc1-4d31-bd2e-a8c23927ee2c'),(68,17,13,105,0,15,'2018-11-25 18:51:10','2018-11-25 18:51:10','513ffcd3-5142-42d3-aaf5-4479c2f7c78a'),(69,17,13,106,0,16,'2018-11-25 18:51:10','2018-11-25 18:51:10','66c9cc60-6012-48bc-996a-5101d01cb5d4'),(70,17,13,107,0,17,'2018-11-25 18:51:10','2018-11-25 18:51:10','ec1be0c6-e2c8-4c47-bedc-36f90426c246'),(71,17,13,108,0,18,'2018-11-25 18:51:10','2018-11-25 18:51:10','f5067812-4ec6-4b99-9ac5-b01ac5d27fe4'),(112,20,17,110,0,1,'2018-11-25 19:14:00','2018-11-25 19:14:00','876c834c-dcf8-4ade-be82-c5ab7c4e15d3'),(113,20,17,109,0,2,'2018-11-25 19:14:00','2018-11-25 19:14:00','41585c88-c297-4087-9a7a-bedada236d52'),(114,20,17,111,0,3,'2018-11-25 19:14:00','2018-11-25 19:14:00','ecc61688-4f1c-4702-9abc-a4c6f7565ef5'),(115,20,17,112,0,4,'2018-11-25 19:14:00','2018-11-25 19:14:00','f0fbf1c2-875d-4089-8728-de04e50bdef9'),(116,20,17,113,0,5,'2018-11-25 19:14:00','2018-11-25 19:14:00','0e909f58-d713-49bf-ae30-a37e1d7c453a'),(117,20,17,114,0,6,'2018-11-25 19:14:00','2018-11-25 19:14:00','7088bccf-ba53-4703-b4ac-5f4a08b75c78'),(118,20,17,116,0,7,'2018-11-25 19:14:00','2018-11-25 19:14:00','b34d972f-794d-4112-97df-ba4bb792b80c'),(119,20,17,115,0,8,'2018-11-25 19:14:00','2018-11-25 19:14:00','16eea278-ff6a-472c-affa-5004099ad092'),(120,20,17,117,0,9,'2018-11-25 19:14:00','2018-11-25 19:14:00','118ad435-1fcd-403b-9034-020f1037c5fc'),(121,20,17,118,0,10,'2018-11-25 19:14:00','2018-11-25 19:14:00','387d7c65-39be-44b4-bcd2-af892dfb911a'),(123,21,19,122,1,1,'2018-11-25 19:17:02','2018-11-25 19:17:02','72f532f6-a140-4192-a263-1aa2897e175a'),(124,21,19,123,1,2,'2018-11-25 19:17:02','2018-11-25 19:17:02','905d5d60-5a41-4db1-ab9e-99216d047429'),(125,21,19,124,1,3,'2018-11-25 19:17:02','2018-11-25 19:17:02','ef276d46-f805-422c-ba74-a9a1de7c142e'),(129,23,21,126,1,1,'2018-11-25 19:18:48','2018-11-25 19:18:48','fa85354a-e380-4845-b184-89c1d58d5c80'),(130,23,21,127,1,2,'2018-11-25 19:18:48','2018-11-25 19:18:48','496f6362-3f0c-4afe-aaf6-135f5265fcd2'),(131,23,21,128,0,3,'2018-11-25 19:18:48','2018-11-25 19:18:48','81474d17-ca60-4330-b29a-58266d41fe84'),(132,24,22,130,1,1,'2018-11-25 19:19:38','2018-11-25 19:19:38','2b1abf3e-0aa2-4f71-9a8d-1c411827ff13'),(133,24,22,131,1,2,'2018-11-25 19:19:38','2018-11-25 19:19:38','f5aa484e-5f2c-4f51-b14b-d18bd24c7787'),(134,24,22,132,0,3,'2018-11-25 19:19:38','2018-11-25 19:19:38','c402328d-2536-4dd3-b47e-d1b33d7ad808'),(135,22,23,120,0,1,'2018-11-25 19:20:02','2018-11-25 19:20:02','7b7b573a-1c32-4061-b05d-84d783a7602f'),(136,22,23,119,0,2,'2018-11-25 19:20:02','2018-11-25 19:20:02','ee9e14fb-aa8b-485e-b76f-240c552e5ca6'),(137,22,23,121,0,3,'2018-11-25 19:20:02','2018-11-25 19:20:02','8bf7b4a2-a94a-4e07-9714-ab6c9f7709cc'),(138,22,23,125,0,4,'2018-11-25 19:20:02','2018-11-25 19:20:02','61bc720f-770c-4991-9b73-76f102276c33'),(139,22,23,129,0,5,'2018-11-25 19:20:02','2018-11-25 19:20:02','17de5ba9-a924-412b-8159-164425f6bb8d'),(140,25,24,134,0,1,'2018-11-25 19:24:39','2018-11-25 19:24:39','0dd430dc-2fae-4f79-a7ed-ab9ad88f5d0d'),(141,25,24,133,0,2,'2018-11-25 19:24:39','2018-11-25 19:24:39','c6b1a6ef-00f5-4984-a59d-500412737695'),(142,25,24,135,0,3,'2018-11-25 19:24:39','2018-11-25 19:24:39','f8f64bd7-5c7c-4fc1-8175-3526be692aeb'),(143,25,24,136,0,4,'2018-11-25 19:24:39','2018-11-25 19:24:39','aefe892a-7f4a-4973-99a3-9ee9ecffab8a'),(144,26,25,140,0,1,'2018-11-25 19:28:56','2018-11-25 19:28:56','cefce1e3-f87d-486c-ba63-6f3e79078317'),(145,26,25,141,0,2,'2018-11-25 19:28:56','2018-11-25 19:28:56','ed1fd0f1-0cbe-4494-a682-bdcd517923af'),(146,27,26,144,0,1,'2018-11-25 19:30:23','2018-11-25 19:30:23','4e580a20-2e33-4ce6-98b0-15bc76368be7'),(185,29,30,153,1,1,'2018-11-26 22:37:12','2018-11-26 22:37:12','a789298b-c2d1-4235-9b00-1c2ec1e1ab39'),(186,29,30,154,1,2,'2018-11-26 22:37:12','2018-11-26 22:37:12','851bf6ed-b719-4725-bc5a-f8374c9713b7'),(206,32,38,160,1,1,'2018-11-26 23:08:12','2018-11-26 23:08:12','47fb3f8e-d3b4-47d8-afb1-9c347d22d617'),(207,32,38,161,0,2,'2018-11-26 23:08:12','2018-11-26 23:08:12','4e62848e-b5f6-4ae7-96d3-31f4dd365201'),(208,32,38,162,0,3,'2018-11-26 23:08:12','2018-11-26 23:08:12','788462e0-986c-4d1d-98fe-9c2864c89553'),(209,31,39,156,1,1,'2018-11-26 23:08:29','2018-11-26 23:08:29','678203a2-d306-452a-84ee-d8b97916ddf2'),(210,31,39,157,0,2,'2018-11-26 23:08:29','2018-11-26 23:08:29','e2329884-0a23-41b0-9598-ff1ec22b0d82'),(211,31,39,158,0,3,'2018-11-26 23:08:29','2018-11-26 23:08:29','12e27d3b-6549-448e-a492-ead894a5b9ed'),(212,30,40,155,0,1,'2018-11-26 23:11:13','2018-11-26 23:11:13','44213042-ebae-4c5b-b0c2-8c48c2bde911'),(213,30,41,159,0,1,'2018-11-26 23:11:13','2018-11-26 23:11:13','398a3c11-45b6-4332-bdb5-581fd27dd5a3'),(214,9,42,23,0,1,'2018-11-26 23:13:14','2018-11-26 23:13:14','c5512645-bf7a-48f7-9133-c6d9973daa3c'),(215,9,42,24,0,2,'2018-11-26 23:13:14','2018-11-26 23:13:14','40e67a22-985c-4a29-b7cd-fdc124cf16ec'),(216,9,42,25,0,3,'2018-11-26 23:13:14','2018-11-26 23:13:14','268d59b4-9176-40db-88f2-9c6fe9c44a6e'),(217,9,42,27,0,4,'2018-11-26 23:13:14','2018-11-26 23:13:14','ad2b9ff8-a8fc-4ce3-9998-79381d5b2a8d'),(218,9,42,26,0,5,'2018-11-26 23:13:14','2018-11-26 23:13:14','7502796e-18e0-4bc9-848c-9ca1a454749a'),(219,9,42,163,0,6,'2018-11-26 23:13:14','2018-11-26 23:13:14','33dd82ee-3ea0-4213-9e36-ccc6552fe737'),(220,35,43,164,0,1,'2018-11-26 23:16:40','2018-11-26 23:16:40','002519bd-e639-4ea0-a531-9b5973f8fd48'),(221,35,43,166,0,2,'2018-11-26 23:16:40','2018-11-26 23:16:40','c31a7608-a351-447c-91f8-c6df6f9127e5'),(222,35,43,165,0,3,'2018-11-26 23:16:40','2018-11-26 23:16:40','441eb189-0292-42aa-9d1f-b659bc9a32ff'),(223,36,44,137,0,1,'2018-11-26 23:18:04','2018-11-26 23:18:04','1b4aba6e-c17b-410f-a0a2-0f13dd333bf1'),(224,36,44,138,0,2,'2018-11-26 23:18:04','2018-11-26 23:18:04','4b5b9a26-3e62-43af-83cf-f7680816ea44'),(225,36,44,139,0,3,'2018-11-26 23:18:04','2018-11-26 23:18:04','94385d4f-fc39-43ca-9218-a9ff543eaa04'),(226,36,44,142,0,4,'2018-11-26 23:18:04','2018-11-26 23:18:04','7818d995-d6d7-4210-930e-e41d23c6b76b'),(227,36,44,143,0,5,'2018-11-26 23:18:04','2018-11-26 23:18:04','d827bb06-f9e8-4679-8260-5e6ed46e80a7'),(228,36,44,145,0,6,'2018-11-26 23:18:04','2018-11-26 23:18:04','a0d49f19-4769-4e31-8739-9bc9ea5a9a08'),(229,36,44,146,0,7,'2018-11-26 23:18:04','2018-11-26 23:18:04','99e0ed54-f0d0-4030-a870-9cce29c9feb7'),(230,36,44,148,0,8,'2018-11-26 23:18:04','2018-11-26 23:18:04','26d985a9-3c61-4a71-acfb-d0dbe729b122'),(231,36,44,150,0,9,'2018-11-26 23:18:04','2018-11-26 23:18:04','99721bdf-823a-44e4-a325-4a18140c5ce0'),(232,36,44,149,0,10,'2018-11-26 23:18:04','2018-11-26 23:18:04','d3a929c1-f6d1-4402-8b6d-3974b8fbd8b3'),(233,36,44,151,0,11,'2018-11-26 23:18:04','2018-11-26 23:18:04','9c86d9e2-86cd-4213-9517-e447351f816a'),(234,36,44,152,0,12,'2018-11-26 23:18:04','2018-11-26 23:18:04','90b7c7aa-990f-42ce-a1d2-813ad0914cbc'),(235,7,45,10,1,1,'2018-11-26 23:20:04','2018-11-26 23:20:04','e62f1307-a82c-46eb-b5ec-a869beaa59f4'),(236,7,45,11,1,2,'2018-11-26 23:20:04','2018-11-26 23:20:04','69c54e41-eef1-4dea-9bb9-69e8a73fd5c5'),(255,6,47,1,0,1,'2018-11-26 23:36:36','2018-11-26 23:36:36','3c2ea014-260d-4c91-9d43-b6a6f63ebacf'),(256,6,47,2,0,2,'2018-11-26 23:36:36','2018-11-26 23:36:36','06b86c02-97f0-4c37-8720-ef7acccc0966'),(257,6,47,3,0,3,'2018-11-26 23:36:36','2018-11-26 23:36:36','7074179c-74a5-4391-9691-2f6aaf7df6ba'),(258,6,47,4,0,4,'2018-11-26 23:36:36','2018-11-26 23:36:36','d857aa40-0cd5-4103-95c7-c07f6d9cc8d4'),(259,6,47,5,0,5,'2018-11-26 23:36:36','2018-11-26 23:36:36','904afab9-9ebe-4897-97f4-ce3e84232498'),(260,6,47,6,0,6,'2018-11-26 23:36:36','2018-11-26 23:36:36','d6b2e775-e060-4a71-9fcb-db9baad21a6f'),(261,6,47,7,0,7,'2018-11-26 23:36:36','2018-11-26 23:36:36','8a95c489-5764-42a9-9ec7-e769d605c1c4'),(262,6,47,8,0,8,'2018-11-26 23:36:36','2018-11-26 23:36:36','096cbc13-960f-47fb-aa2e-5dca726b24f9'),(263,6,47,9,0,9,'2018-11-26 23:36:36','2018-11-26 23:36:36','7516b2f7-760e-4b41-a0be-ac3dc3bf9817'),(264,6,47,12,0,10,'2018-11-26 23:36:36','2018-11-26 23:36:36','ea3fed1b-4727-4828-974e-d7f89012e2e2'),(265,6,47,13,0,11,'2018-11-26 23:36:36','2018-11-26 23:36:36','f433b83b-ac09-4cb6-850d-0231aea14edd'),(266,6,47,14,0,12,'2018-11-26 23:36:36','2018-11-26 23:36:36','e46a37a0-e880-4ab8-be11-76f2c78f5216'),(267,6,47,15,0,13,'2018-11-26 23:36:36','2018-11-26 23:36:36','61081e5c-68b2-43aa-a685-155238a951aa'),(268,6,47,16,0,14,'2018-11-26 23:36:36','2018-11-26 23:36:36','d9c56be3-c873-4cc4-8975-002528e26ed4'),(269,6,47,17,0,15,'2018-11-26 23:36:36','2018-11-26 23:36:36','e42d8c95-4228-4008-925d-d3dec8302e7f'),(270,6,47,18,0,16,'2018-11-26 23:36:36','2018-11-26 23:36:36','829c5222-be86-4d65-8103-9225b8af0ee7'),(271,6,47,167,0,17,'2018-11-26 23:36:36','2018-11-26 23:36:36','28f25739-8cce-4e3e-92ad-e3e52bfcb2a7'),(272,6,47,168,0,18,'2018-11-26 23:36:36','2018-11-26 23:36:36','c000ccc1-2ffe-40fe-b3fb-ed255cf1c004'),(284,11,49,28,0,1,'2018-11-26 23:50:12','2018-11-26 23:50:12','8ee6d206-68f8-4ebb-9622-11b9d3e8a0cf'),(285,11,49,29,0,2,'2018-11-26 23:50:12','2018-11-26 23:50:12','c32c0b90-c405-4962-92d4-22b364fca130'),(286,11,49,30,0,3,'2018-11-26 23:50:12','2018-11-26 23:50:12','43dceee9-8d18-4a45-9194-bb0c8769f9bc'),(287,11,49,32,0,4,'2018-11-26 23:50:12','2018-11-26 23:50:12','e53b5cda-3b90-496d-937b-3e8c42a93ed3'),(288,11,49,33,0,5,'2018-11-26 23:50:12','2018-11-26 23:50:12','4f294db4-ccce-45b3-99bf-61abc3352a11'),(289,11,49,34,0,6,'2018-11-26 23:50:12','2018-11-26 23:50:12','85091e10-5c48-4ca7-8bd5-e6f91cc241fb'),(290,11,49,169,0,7,'2018-11-26 23:50:12','2018-11-26 23:50:12','116f4f74-cdf7-4a82-9f20-918a7719103d'),(291,11,49,170,0,8,'2018-11-26 23:50:12','2018-11-26 23:50:12','7b7366f0-a0ae-4a3b-8b4c-059070f12f83'),(292,11,49,38,0,9,'2018-11-26 23:50:12','2018-11-26 23:50:12','548939f4-2972-4d30-9607-d6e272173248'),(293,11,49,39,0,10,'2018-11-26 23:50:12','2018-11-26 23:50:12','22de657f-c92c-432c-980a-7201f61e2bac'),(294,11,49,40,0,11,'2018-11-26 23:50:12','2018-11-26 23:50:12','41b5d1c4-8095-441a-9d3b-df0a21298bf4'),(295,11,49,41,0,12,'2018-11-26 23:50:12','2018-11-26 23:50:12','049b90eb-4014-49e6-863d-0d84a0b55258'),(296,11,49,42,0,13,'2018-11-26 23:50:12','2018-11-26 23:50:12','828d5eea-1ed1-4532-b060-e17e05fdfb9e'),(339,12,53,43,0,1,'2018-11-27 00:04:40','2018-11-27 00:04:40','905468a8-04a0-4667-a605-33eee561221a'),(340,12,53,44,0,2,'2018-11-27 00:04:40','2018-11-27 00:04:40','1981ea47-9daa-4077-9521-9916bdf9ee06'),(341,12,53,45,0,3,'2018-11-27 00:04:40','2018-11-27 00:04:40','d79ab7f9-0616-40e7-838c-f57c5726793c'),(342,12,53,46,0,4,'2018-11-27 00:04:40','2018-11-27 00:04:40','511dac51-6989-4173-a27f-53d37175dbb9'),(343,12,53,47,0,5,'2018-11-27 00:04:40','2018-11-27 00:04:40','49397cb9-9dd2-4287-838f-0d9958f6b77c'),(344,12,53,48,0,6,'2018-11-27 00:04:40','2018-11-27 00:04:40','0fce3450-e919-49b0-9ca2-aec8107cbe05'),(345,12,53,171,0,7,'2018-11-27 00:04:40','2018-11-27 00:04:40','f961b959-f90c-46ee-b887-d5385f45e02a'),(346,12,53,172,0,8,'2018-11-27 00:04:40','2018-11-27 00:04:40','15220432-9653-4c77-98f5-0fccafd3ea66'),(347,12,53,52,0,9,'2018-11-27 00:04:40','2018-11-27 00:04:40','b1bb51a1-f724-45b5-8b3a-e21bb6fb04fe'),(348,12,53,53,0,10,'2018-11-27 00:04:40','2018-11-27 00:04:40','21138f49-e45d-40d2-8ec2-cea9cffb996f'),(349,12,53,54,0,11,'2018-11-27 00:04:40','2018-11-27 00:04:40','18b1f3a9-c11f-451f-a5d2-267da8240402'),(350,12,53,55,0,12,'2018-11-27 00:04:40','2018-11-27 00:04:40','04d2f11e-76f7-421b-9c25-8a2bac84dc03'),(351,12,53,56,0,13,'2018-11-27 00:04:40','2018-11-27 00:04:40','1f52f196-125e-46a8-a43b-62dd6c651a66'),(352,12,53,57,0,14,'2018-11-27 00:04:40','2018-11-27 00:04:40','843c7f34-ed76-40de-83d2-a3512f1a0d3c'),(353,12,53,173,0,15,'2018-11-27 00:04:40','2018-11-27 00:04:40','8cba278f-d614-4e73-b202-8e082581331f'),(354,12,53,174,0,16,'2018-11-27 00:04:40','2018-11-27 00:04:40','ccf59e9f-5225-4c32-a537-4abcbb5153a1'),(355,19,54,58,0,1,'2018-11-27 00:15:14','2018-11-27 00:15:14','22d2cde9-18e0-4a9e-a73b-049266a04f13'),(356,19,54,59,0,2,'2018-11-27 00:15:14','2018-11-27 00:15:14','fef781d5-5eda-4aa0-a03a-93bdfe2e2413'),(357,19,54,60,0,3,'2018-11-27 00:15:14','2018-11-27 00:15:14','6b307516-6e17-46cd-807e-7a7f70526397'),(358,19,54,62,0,4,'2018-11-27 00:15:14','2018-11-27 00:15:14','a3382f7d-d5ad-4770-b584-9277638921a2'),(359,19,54,63,0,5,'2018-11-27 00:15:14','2018-11-27 00:15:14','a988f03b-2d26-4cb0-a19e-ee2c6d649379'),(360,19,54,64,0,6,'2018-11-27 00:15:14','2018-11-27 00:15:14','0f958809-0abd-4ab3-ac28-41e87cdcea96'),(361,19,54,65,0,7,'2018-11-27 00:15:14','2018-11-27 00:15:14','5c5aa752-eb7b-4104-b07b-7cefe4cf99b1'),(362,19,54,66,0,8,'2018-11-27 00:15:14','2018-11-27 00:15:14','30790d25-82d7-4d79-a482-250f6accd5f5'),(363,19,54,67,0,9,'2018-11-27 00:15:14','2018-11-27 00:15:14','4c2de9e2-b206-4d8d-9827-c103b0dd490e'),(364,14,55,76,1,1,'2018-11-27 00:20:30','2018-11-27 00:20:30','229f6b05-9d06-4cd4-badb-7f4809b62b71'),(368,16,57,86,0,1,'2018-11-27 00:24:20','2018-11-27 00:24:20','469c32de-8f6d-4e96-82a0-6ee386187ae5'),(369,16,57,87,0,2,'2018-11-27 00:24:20','2018-11-27 00:24:20','c8ff2f46-dd4b-470d-b2fe-64e8de32ddd4'),(370,16,57,88,0,3,'2018-11-27 00:24:20','2018-11-27 00:24:20','7a062457-ac8d-453e-8c39-a9eca5896aac'),(371,18,58,69,0,1,'2018-11-27 00:25:31','2018-11-27 00:25:31','ed5d93bd-f37e-4eb2-85f4-9f3ff9978b4b'),(372,18,58,68,0,2,'2018-11-27 00:25:31','2018-11-27 00:25:31','16a30fa1-7a14-4897-bf64-156372ee58d1'),(373,18,58,70,0,3,'2018-11-27 00:25:31','2018-11-27 00:25:31','8855cc51-c859-4e2b-9312-c562a5f6cff9'),(374,18,58,72,0,4,'2018-11-27 00:25:31','2018-11-27 00:25:31','ffc4056b-3974-4527-a0d4-22ed2af158c7'),(375,18,58,73,0,5,'2018-11-27 00:25:31','2018-11-27 00:25:31','9a3e5d9c-842b-4a88-993f-4bebb1be499b'),(376,18,58,80,0,6,'2018-11-27 00:25:31','2018-11-27 00:25:31','75a63023-8f20-4ed1-93b0-850500cc74ca'),(377,18,58,81,0,7,'2018-11-27 00:25:31','2018-11-27 00:25:31','ab13b2a3-d0fe-4bab-89a1-b2cbb7c4fa9d'),(378,18,58,75,0,8,'2018-11-27 00:25:31','2018-11-27 00:25:31','8df37408-e186-4dd1-974d-477fe84118d0'),(379,18,58,175,0,9,'2018-11-27 00:25:31','2018-11-27 00:25:31','c4e75bd6-6043-470f-9beb-ee55d8274b6e'),(380,18,58,176,0,10,'2018-11-27 00:25:31','2018-11-27 00:25:31','bc57b91e-b3d4-4c3c-9d92-ecc76e1e1d57'),(381,18,58,83,0,11,'2018-11-27 00:25:31','2018-11-27 00:25:31','3df09f0c-a0f9-4725-adba-8c67f99f6811'),(382,18,58,84,0,12,'2018-11-27 00:25:31','2018-11-27 00:25:31','42aed1e9-2f75-4b02-ac94-9118e88df7e9'),(383,18,58,85,0,13,'2018-11-27 00:25:31','2018-11-27 00:25:31','2777948d-8ba5-4728-b03e-28942827f40b'),(384,18,58,177,0,14,'2018-11-27 00:25:31','2018-11-27 00:25:31','8b861283-00f9-4b4c-975f-719d601a1ae9'),(385,18,58,178,0,15,'2018-11-27 00:25:31','2018-11-27 00:25:31','2bfecf22-a5bf-4d69-9a55-d4893ee292bf'),(386,18,58,89,0,16,'2018-11-27 00:25:31','2018-11-27 00:25:31','76dd6cff-6d81-4954-8d19-f689456c703e'),(387,18,58,90,0,17,'2018-11-27 00:25:31','2018-11-27 00:25:31','e7e3ae88-9578-4495-ba4a-0e32d3a98117');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Asset','2018-11-16 06:30:41','2018-11-26 22:55:40','2b8268bb-8969-42d1-9dc6-ff4f79416ee6'),(5,'craft\\elements\\Asset','2018-11-20 01:29:34','2018-11-26 22:55:24','3bb9532d-b0a7-43ec-9915-56c1440ffdcc'),(6,'craft\\elements\\Entry','2018-11-24 23:00:32','2018-11-26 23:36:36','b19ef871-8fe6-44b2-9483-8b45300061ea'),(7,'craft\\elements\\MatrixBlock','2018-11-24 23:04:38','2018-11-26 23:20:04','2905605e-2056-49c2-8aa6-b81e0a2d90e4'),(9,'craft\\elements\\Entry','2018-11-24 23:18:14','2018-11-26 23:13:14','241de88a-c08f-4414-aade-952efc20af25'),(11,'craft\\elements\\Entry','2018-11-24 23:46:00','2018-11-26 23:50:12','dcc2516f-300d-4257-a536-7b0591ae90d5'),(12,'craft\\elements\\Entry','2018-11-25 00:00:49','2018-11-27 00:04:40','aedce96f-2b7e-411c-af7d-bb8df645c9c0'),(14,'craft\\elements\\MatrixBlock','2018-11-25 17:34:33','2018-11-27 00:20:30','dc98a8b0-cd68-485d-a9e6-761ea323c014'),(16,'craft\\elements\\MatrixBlock','2018-11-25 17:44:11','2018-11-27 00:24:20','d5c209b6-4021-45e2-a7a7-eb9c26f085de'),(17,'craft\\elements\\Entry','2018-11-25 18:49:17','2018-11-25 18:51:10','b667a7ac-be6d-4717-8abc-38a06b201b2f'),(18,'craft\\elements\\Entry','2018-11-25 18:51:25','2018-11-27 00:25:31','e610b824-23dd-4819-a7fe-d076075c2727'),(19,'craft\\elements\\Entry','2018-11-25 18:53:03','2018-11-27 00:15:14','0176cb85-1617-4103-b2fe-9cef9986a5c4'),(20,'craft\\elements\\Entry','2018-11-25 19:13:39','2018-11-25 19:14:00','4be4f091-9579-4492-8987-3a8195eb8049'),(21,'craft\\elements\\MatrixBlock','2018-11-25 19:16:20','2018-11-25 19:17:02','7e96d638-570e-4950-a3d0-5e094c5469b5'),(22,'craft\\elements\\Entry','2018-11-25 19:17:20','2018-11-25 19:20:02','16101ff0-51b5-468f-a654-36f5ebbcefdc'),(23,'craft\\elements\\MatrixBlock','2018-11-25 19:18:48','2018-11-25 19:18:48','b6038067-a928-486f-a8af-c87536ca9d00'),(24,'craft\\elements\\MatrixBlock','2018-11-25 19:19:38','2018-11-25 19:19:38','8a7b38ad-2e5c-4031-9ffd-190f58b52266'),(25,'craft\\elements\\Entry','2018-11-25 19:24:21','2018-11-25 19:24:39','84161136-6164-4fd7-8844-ffff081fadca'),(26,'craft\\elements\\MatrixBlock','2018-11-25 19:28:56','2018-11-25 19:28:56','f0748af1-278b-4570-abf5-5e7ed42284bb'),(27,'craft\\elements\\MatrixBlock','2018-11-25 19:30:23','2018-11-25 19:30:23','624b3958-3cd6-4d71-9cc1-3a15c5107085'),(28,'craft\\elements\\Asset','2018-11-26 21:47:51','2018-11-26 21:47:51','c459de7b-5bb7-4068-a680-ad334a01b6cb'),(29,'craft\\elements\\MatrixBlock','2018-11-26 22:37:12','2018-11-26 22:37:12','2742ed78-3a9b-42ad-b52c-c1260a87f2fe'),(30,'craft\\elements\\GlobalSet','2018-11-26 22:49:42','2018-11-26 23:11:13','9d8a1cee-c7dc-40a8-a426-673055eb1822'),(31,'craft\\elements\\MatrixBlock','2018-11-26 22:51:55','2018-11-26 23:08:29','b6b5645a-9adc-400d-972f-a1122a73381f'),(32,'craft\\elements\\MatrixBlock','2018-11-26 22:54:22','2018-11-26 23:08:12','88d5c7ab-de6c-461c-ac27-6de6a2ab31ec'),(33,'craft\\elements\\Asset','2018-11-26 22:55:00','2018-11-26 22:55:00','423165f7-f4b8-48f2-8578-068e48372d12'),(34,'craft\\elements\\Asset','2018-11-26 23:05:17','2018-11-26 23:05:17','c1f5a928-433a-4b04-903b-adaf9cd57148'),(35,'craft\\elements\\Entry','2018-11-26 23:14:47','2018-11-26 23:16:40','7f11a79b-e51c-4b07-b158-58e489ab7ecd'),(36,'craft\\elements\\Entry','2018-11-26 23:17:14','2018-11-26 23:18:04','31ecc869-da97-4ecf-a446-79fef1f448ae'),(37,'craft\\elements\\Asset','2018-11-27 00:18:29','2018-11-27 00:18:29','f71fe8d9-6d0a-4b90-9254-9f070ad0e2fa');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (13,17,'Mission',1,'2018-11-25 18:51:10','2018-11-25 18:51:10','21607172-5964-429e-8487-eb3e48ce5c5c'),(17,20,'Mentors',1,'2018-11-25 19:14:00','2018-11-25 19:14:00','4429ca74-2bb9-4781-a5b7-a6ec92b19640'),(19,21,'Content',1,'2018-11-25 19:17:02','2018-11-25 19:17:02','7c122619-25e2-4ea0-a3e3-b67636a3dc5d'),(21,23,'Content',1,'2018-11-25 19:18:48','2018-11-25 19:18:48','6b390f7f-c40d-4a95-b4ae-eb58b8871d8b'),(22,24,'Content',1,'2018-11-25 19:19:38','2018-11-25 19:19:38','3242ad3b-8fa3-4db8-a693-2cdc182c634d'),(23,22,'Team',1,'2018-11-25 19:20:02','2018-11-25 19:20:02','8a7e091d-f28a-4785-8d61-eed41609070f'),(24,25,'Partners',1,'2018-11-25 19:24:39','2018-11-25 19:24:39','1067bce8-1af0-4939-aff1-95234b8db54a'),(25,26,'Content',1,'2018-11-25 19:28:56','2018-11-25 19:28:56','79454561-ca62-4ac6-a20a-970e7f3f1bc5'),(26,27,'Content',1,'2018-11-25 19:30:23','2018-11-25 19:30:23','4b9189a7-f70c-4906-9646-919aa5b74b0c'),(30,29,'Content',1,'2018-11-26 22:37:12','2018-11-26 22:37:12','139e8b36-6657-4e6a-a8fc-8f86e2c4b60b'),(38,32,'Content',1,'2018-11-26 23:08:12','2018-11-26 23:08:12','f8b24339-4f02-4745-b0e3-3e7ad28be389'),(39,31,'Content',1,'2018-11-26 23:08:29','2018-11-26 23:08:29','638ec491-f563-42e1-8d1e-c3b4c3df9e4e'),(40,30,'Supporters',1,'2018-11-26 23:11:13','2018-11-26 23:11:13','c69a9f6e-e1d0-48dc-959d-0ad397a1563a'),(41,30,'Partnering Service Providers',2,'2018-11-26 23:11:13','2018-11-26 23:11:13','a2b10e82-1b90-4336-9718-8b8558dd4e80'),(42,9,'Upcoming Events',1,'2018-11-26 23:13:14','2018-11-26 23:13:14','45d144e6-67db-422e-bc37-8e8605c638dc'),(43,35,'News',1,'2018-11-26 23:16:40','2018-11-26 23:16:40','4088b517-46e8-416f-9590-c15e22ef0e4b'),(44,36,'Donate',1,'2018-11-26 23:18:04','2018-11-26 23:18:04','43b7639d-1056-4e4b-8742-b310d1c8d77e'),(45,7,'Content',1,'2018-11-26 23:20:04','2018-11-26 23:20:04','4f3e622f-50f1-4b0a-98d6-3f8fd62ffc1c'),(47,6,'Homepage',1,'2018-11-26 23:36:36','2018-11-26 23:36:36','90af404c-cfd2-4f24-bf55-adcbb82833ec'),(49,11,'1:1 Transition Assistance',1,'2018-11-26 23:50:12','2018-11-26 23:50:12','3529f7ff-e68c-48e8-b91c-ad02d5563b7c'),(53,12,'Transition Mentoring Workshops',1,'2018-11-27 00:04:40','2018-11-27 00:04:40','686120c1-71d9-4c3e-a507-dcecb189bfa8'),(54,19,'Digital Library',1,'2018-11-27 00:15:14','2018-11-27 00:15:14','ee949e1f-950b-4727-a991-ef3e1f223c27'),(55,14,'Content',1,'2018-11-27 00:20:30','2018-11-27 00:20:30','2537cfb5-46b5-435d-9501-9328f305a04b'),(57,16,'Content',1,'2018-11-27 00:24:20','2018-11-27 00:24:20','10fe55af-3408-463a-9a46-191a29194532'),(58,18,'Corporate Education',1,'2018-11-27 00:25:31','2018-11-27 00:25:31','7240a3c4-476b-48d0-9bdb-d4149371e6c1');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,2,'Banner Message','homepageBannerMessage','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"High Touch, High Impact\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"40\",\"columnType\":\"text\"}','2018-11-24 22:56:14','2018-11-26 23:24:16','b3d243e5-da88-4dba-99a9-822fe05050c7'),(2,2,'Banner Body','homepageBannerBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Helping America\'s top tier servicemembers and veterans find personal and professional purpose after military service.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"420\",\"columnType\":\"text\"}','2018-11-24 22:57:19','2018-11-26 23:28:12','4a032a26-8c53-4711-9ed0-adef56e42cbd'),(3,2,'Header 1','homepageHeader1','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The COMMIT Foundation is fundamentally changing the way servicemembers and veterans approach their transition from the military\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-24 22:58:54','2018-11-26 23:28:34','0f617788-c258-4d68-94a7-3480fdebf53c'),(4,2,'Video','homepageVideo','global','Please enter a Vimeo video ID here to embed the video player in the page.','none',NULL,'craft\\fields\\Number','{\"defaultValue\":null,\"min\":null,\"max\":null,\"decimals\":0,\"size\":null}','2018-11-24 22:59:40','2018-11-26 23:55:28','aef280b5-b6a6-4170-8905-9bf848bade29'),(5,2,'Header 2','homepageHeader2','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Misconceptions, skill translation gaps, and culture gaps may hinder many servicemembers and veterans from earning the right job and companies from hiring the right veteran\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-24 23:00:07','2018-11-26 23:32:11','09cb4d72-2d84-42b7-87b7-a917d61303da'),(6,2,'Information Tile','informationTile','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT helps servicemembers and veterans understand and articulate the value of their knowledge, skills, and abilities. We help them understand how to transfer that value to a meaningful civilian career.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"300\",\"columnType\":\"text\"}','2018-11-24 23:02:01','2018-11-26 23:32:57','c5708da3-111e-45f4-ba11-462519354628'),(7,2,'Confidence Tile','confidenceTile','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT helps servicemembers and veterans maintain their individual confidence throughout the transition process. We provide the information and resources servicemembers and veterans need to self-identify and understand their unique and personal value.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"300\",\"columnType\":\"text\"}','2018-11-24 23:02:21','2018-11-26 23:29:44','ce0fe14e-7489-4617-bb13-402e97ad8240'),(8,2,'Imagination Tile','imaginationTile','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT enables veterans to adjust their aperture to rethink and redefine what is possible. We encourage veterans to set their goals high, rather than aiming only for what they know or what seems familiar.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"300\",\"columnType\":\"text\"}','2018-11-24 23:02:39','2018-11-26 23:27:46','12fb67d0-7f12-4cb8-9460-e10f0a566b69'),(9,2,'Testimonials Carousel','testimonialsCarousel','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"3\",\"maxBlocks\":\"3\",\"contentTable\":\"{{%matrixcontent_testimonialscarousel}}\",\"localizeBlocks\":false}','2018-11-24 23:04:37','2018-11-26 23:20:04','3240bed7-189a-4253-ac82-d682482c068d'),(10,NULL,'Testimonial Quote','testimonialQuote','matrixBlockType:1','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-24 23:04:38','2018-11-26 23:20:04','551a98dd-adb6-475b-8b57-51b0c75bc2dc'),(11,NULL,'Testimonial Author','testimonialAuthor','matrixBlockType:1','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-24 23:04:38','2018-11-26 23:20:04','fa0985de-f891-4e76-8a46-c8cdeec36666'),(12,2,'Header 3','homepageHeader3','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT aims to create serendipity for men and women transitioning from the military and entering Corporate America\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-24 23:05:19','2018-11-26 23:34:55','5d425b6d-b630-4ad7-aa24-709707575081'),(13,2,'Header 3 Body','homepageHeader3Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"We provide tailored solutions to meet the personal needs of every individual we serve. \",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-24 23:06:06','2018-11-26 23:30:14','684fc4af-1295-4e09-97e6-48d1d80dfd16'),(14,2,'One-To-One Transition Assistance Tile','oneToOneTransitionAssistanceTile','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"A highly individualized approach with experienced executive coaches using proven techniques to identify and resolve specific needs of transitioning servicemembers and veterans.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"200\",\"columnType\":\"text\"}','2018-11-24 23:08:29','2018-11-26 23:30:22','76f0e067-d238-4e34-9176-38c0c9928abf'),(15,2,'Transition Mentoring Workshops','transitionMentoringWorkshops','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Focus on goal-setting, life’s decision points, and powerful lessons that reinforce values, family, and the passionate pursuit of a meaningful career. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"200\",\"columnType\":\"text\"}','2018-11-24 23:08:48','2018-11-26 23:30:31','d1301c9a-720c-42e7-b29b-2e64f9fba0bf'),(16,2,'The Digital Library Tile','theDigitalLibraryTile','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Study key insights and best practices from highly successful COMMIT alumni and leaders in Corporate America.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"200\",\"columnType\":\"text\"}','2018-11-24 23:09:14','2018-11-26 23:30:40','53443e5f-b9ea-4f2d-955f-ae4898201323'),(17,2,'Header 4','homepageHeader4','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"True to our name, we are committed to making significant, long-term impact in changing the way Corporate America thinks about hiring and retaining veteran talent\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-24 23:09:54','2018-11-26 23:30:48','cc2df4b2-295d-4a71-b184-71251fc4733c'),(18,2,'Corporate Education Tile','corporateEducationTile','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"We teach our partners how to effectively identify, hire, and retain veteran talent in order to improve business outcomes.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-24 23:11:07','2018-11-26 23:31:35','38c79101-5d62-482c-90d7-8fdf11b6bb3b'),(23,4,'Name','eventName','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-24 23:19:59','2018-11-24 23:19:59','841990fe-bfba-4912-86f7-cd915a709080'),(24,4,'Start Date','startDate','global','','none',NULL,'craft\\fields\\Date','{\"showDate\":true,\"showTime\":false,\"minuteIncrement\":\"30\"}','2018-11-24 23:21:23','2018-11-24 23:21:23','8be80dff-7d48-406e-a159-7fb90eabfff6'),(25,4,'End Date','endDate','global','','none',NULL,'craft\\fields\\Date','{\"showDate\":true,\"showTime\":false,\"minuteIncrement\":\"30\"}','2018-11-24 23:21:31','2018-11-24 23:21:31','c80df815-cf21-4474-9e89-b465c97ed963'),(26,4,'Event Short Description','eventShortDescription','global','This is what is displayed on an event page just under the date. A truncated version is also displayed on event tiles.','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-24 23:33:47','2018-11-24 23:33:47','5385e1d7-62b3-496d-8d0a-e9560a264e26'),(27,4,'Event Image','eventImage','global','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"Select an image for this event.\",\"localizeRelations\":false}','2018-11-24 23:34:39','2018-11-24 23:34:39','79a5599e-56ba-4cbd-aa9a-43a5f086630c'),(28,5,'Banner Message','transitionAssistanceBannerMessage','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"One-on-One Transition Assistance\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"40\",\"columnType\":\"text\"}','2018-11-24 23:37:53','2018-11-26 23:44:22','135dbbe3-0a10-4341-8a5b-ba81317d81bf'),(29,5,'Banner Body','transitionAssistanceBannerBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT meets you right where you are in transition. Let us help you build a plan that is tailored to your individual needs and timeline.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"420\",\"columnType\":\"text\"}','2018-11-24 23:38:25','2018-11-26 23:48:41','b84db022-2f9b-485d-93e3-336993ec2ccd'),(30,5,'Header 1','transitionAssistanceHeader1','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"A highly individualized approach with an experienced executive coach using proven techniques to engage, identify, and resolve specific needs of a transitioning veteran\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-24 23:38:48','2018-11-26 23:48:50','91413524-0b7b-4438-84d9-21ff5d261bbe'),(32,5,'Header 2','transitionAssistanceHeader2','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Specifically Designed and Highly Tailored Programs \",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-24 23:40:20','2018-11-26 23:45:50','333ff813-bcb0-403a-967f-6750a9d8e1b2'),(33,5,'Header 2 Body','transitionAssistanceHeader2Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Servicemembers and veterans who participate in One-on-One Transition Assistance receive highly individualized services before, during, and beyond their transition. Our unique blend of proprietary techniques and certified professional tools have been developed by COMMIT over years of operation. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-24 23:40:43','2018-11-26 23:46:08','8fd65074-c861-43ea-893d-6f5cb8e7a1a0'),(34,5,'Video','transitionAssistanceVideo','global','Enter a Vimeo Video ID to embed video here.','none',NULL,'craft\\fields\\Number','{\"defaultValue\":null,\"min\":null,\"max\":null,\"decimals\":0,\"size\":null}','2018-11-24 23:41:17','2018-11-26 23:55:11','59097d85-8efd-4dd9-8d0d-a9e9bacf3fca'),(38,5,'Header 3','transitionAssistanceHeader3','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Focused Career Choices\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-24 23:43:15','2018-11-26 23:46:21','eebba5b5-5791-400b-ad30-ccfcdbf220e4'),(39,5,'Header 3 Body','transitionAssistanceHeader3Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT focuses on quality over quantity through high touch, high impact support. After identifying your values and strengths, COMMIT helps you find career opportunities at the convergence of passion, expertise, and geography. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-24 23:43:37','2018-11-26 23:46:33','cedb6f4b-8764-45d9-ac74-f5108ed11857'),(40,5,'Header 4','transitionAssistanceHeader4','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Strengths and Skills\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-24 23:43:54','2018-11-26 23:46:42','3c1a7813-8bee-4dbd-ae5c-2cf5c595d8d7'),(41,5,'Header 4 Body','transitionAssistanceHeader4Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Support includes strengths assessment, values identification, resume assistance, executive coaching, mentorship, and scholarship assistance. COMMIT’s approach is built on individual needs, including both hard and soft skill personal development.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-24 23:44:15','2018-11-26 23:46:50','0c6f3f26-6617-4d55-a8ca-1ddddbbcef5d'),(42,5,'Industry Connections Tile','industryConnectionsTile','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT leverages a vast network of successful alumni and leaders in Corporate America to help support, inform, and guide servicemembers and veterans as they transition into the industries they are passionate about.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-24 23:44:45','2018-11-26 23:47:23','94380297-5fe1-4c27-9e96-35c907dc9d35'),(43,6,'Banner Message','transitionMentoringBannerMessage','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Transition Mentoring Workshops\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"40\",\"columnType\":\"text\"}','2018-11-25 00:02:02','2018-11-26 23:52:44','7e0a5834-a07f-46aa-afec-7b17ff7f83d3'),(44,6,'Banner Body','transitionMentoringBannerBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Harnessing the power of our networks and relationships, COMMIT facilitates synergy between top tier servicemembers and veterans and seasoned professionals from the private sector.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"420\",\"columnType\":\"text\"}','2018-11-25 00:02:24','2018-11-26 23:52:34','015c944a-f8d2-4e51-ba5a-f1e9d4e366f1'),(45,6,'Header 1','transitionMentoringHeader1','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Focus on values, key decision points, and powerful lessons that reinforce the importance of family and pursuing your passion when designing the life you want to live following your time in uniform\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 00:02:56','2018-11-27 00:00:26','164c226d-33e6-4ec6-9406-6564dfa6966f'),(46,6,'Header 2','transitionMentoringHeader2','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT believes 30 minutes of quality dialogue can forever change the trajectory of an individual\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 00:04:00','2018-11-27 00:00:02','55f7a1cc-0d79-47c4-9cc9-ad556f2a4300'),(47,6,'Header 2 Body','transitionMentoringHeader2Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Workshops are specifically designed to provide servicemembers and veterans direct access to thoughtfully selected professionals and foster intimate environments where quality dialogue will occur. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 00:04:28','2018-11-26 23:53:30','00d094e0-85ab-41de-ba49-a5854038b540'),(48,6,'Video','transitionMentoringVideoId','global','Enter a Vimeo Video ID here to embed the video on the page.','none',NULL,'craft\\fields\\Number','{\"defaultValue\":null,\"min\":\"0\",\"max\":null,\"decimals\":0,\"size\":null}','2018-11-25 00:05:47','2018-11-26 23:59:11','8f434433-349b-4d56-8fff-a6f0ae03f4fd'),(52,6,'Header 3','transitionMentoringHeader3','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Changing Perception\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 00:07:16','2018-11-26 23:57:10','3cbf32b8-5079-45af-91f4-705fbf274fde'),(53,6,'Header 3 Body','transitionMentoringHeader3Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Led by professional executive coaches, servicemembers and veterans work through a series of modules focused on values, strengths, culture, and opportunities to change perspectives and improve trajectories. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 00:07:36','2018-11-26 23:56:50','21b8b43d-632d-4997-b014-5728f750a45f'),(54,6,'Header 4','transitionMentoringHeader4','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Preparing Trajectory\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 00:08:18','2018-11-26 23:57:00','caffe315-7ad9-4d0b-b4fd-07038ee12d55'),(55,6,'Header 4 Body','transitionMentoringHeader4Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Reinforcing integrity, family, and the passionate pursuit of a meaningful career, servicemembers and veterans hear from and personally engage with successfully transitioned servicemembers and veterans and leaders from Corporate America. Servicemembers and veterans and mentors have private, meaningful conversations in environments where they flourish.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 00:09:11','2018-11-26 23:57:38','05a77163-3424-46bd-8b3e-01cb875d79d9'),(56,6,'World Class Mentorship Tile','worldClassMentorshipTile','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"We take a hard look at the industries, interests, and skills of workshop participants in order to align world class mentors from specific industries, backgrounds, and locations to provide game changing value.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 00:10:19','2018-11-26 23:57:56','43291dfa-6d1c-4358-afcc-23f3382f7546'),(57,6,'Upcoming Workshops Body','upcomingWorkshopsBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT facilitates workshops nationwide, allowing us to handpick perfect locations suited towards intimate working environments. No matter where your location, servicemembers and veterans from across the country are sponsored to attend COMMIT workshops in cities best suited for their success.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 00:10:45','2018-11-27 00:01:51','7b1069f2-caa5-4f8c-86b0-246281d78c8c'),(58,7,'Banner Message','digitalLibrariesBannerMessage','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The Digital Library \",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"40\",\"columnType\":\"text\"}','2018-11-25 17:17:25','2018-11-27 00:06:32','1e95b055-a24b-42df-8bb7-5c8f2ec14124'),(59,7,'Banner Body','digitalLibrariesBannerBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The Digital Library provides a growing collection of videos on specific subjects transitioning servicemembers and veterans and Corporate America find most critical and challenging to overcome. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"420\",\"columnType\":\"text\"}','2018-11-25 17:17:50','2018-11-27 00:06:25','20fbe78f-b0db-442d-854c-94fc90e71522'),(60,7,'Header 1','digitalLibrariesHeader1','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Study key insights and best practices from highly successful COMMIT alumni and leaders in Corporate America.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 17:19:38','2018-11-27 00:18:53','33fe3809-2f3d-4279-8214-a2301aabb84d'),(62,7,'Header 2','digitalLibrariesHeader2','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The Digital Library\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 17:21:09','2018-11-27 00:16:26','4ea61c76-d36e-4d20-b0c5-b15c5ce81cf0'),(63,7,'Header 2 Body','digitalLibrariesHeader2Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT leverages a vast network of experienced professionals from Corporate America to provide key insights on transferable skills, interviewing, networking, mentorship, leadership, and much more.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 17:21:35','2018-11-27 00:08:49','24e5ff2d-d35f-4291-8b92-c40dbeb9bf40'),(64,7,'Header 2 Video','digitalLibrariesHeader2Video','global','Enter a Vimeo Video ID here to embed the video on this page.','none',NULL,'craft\\fields\\Number','{\"defaultValue\":null,\"min\":\"0\",\"max\":null,\"decimals\":0,\"size\":null}','2018-11-25 17:22:09','2018-11-27 00:07:12','f29e0665-4728-460c-87b5-7eba85a367fd'),(65,7,'Header 3','digitalLibrariesHeader3','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Insights and Industry Interviews\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 17:22:54','2018-11-27 00:16:18','1ca56152-10de-44b0-b0df-be817110ce32'),(66,7,'Header 3 Body','digitalLibrariesHeader3Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"While working to identify an industry to begin your new career, COMMIT’s interviews with leaders from Corporate America provide immediate insight into necessary skills, expectations in the work environment, and key tips for professional success.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 17:23:22','2018-11-27 00:09:15','f7c49d52-7423-462c-8bf0-aa29a564491b'),(67,7,'Header 3 Video','digitalLibrariesHeader3Video','global','Enter a Vimeo Video ID here to embed video on this page.','none',NULL,'craft\\fields\\Number','{\"defaultValue\":null,\"min\":\"0\",\"max\":null,\"decimals\":0,\"size\":null}','2018-11-25 17:23:51','2018-11-27 00:07:33','f4b1d150-d0e9-4a8f-802e-a17304e2a15b'),(68,8,'Banner Message','corporateEducationBannerMessage','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Corporate Education Programming \",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"40\",\"columnType\":\"text\"}','2018-11-25 17:25:56','2018-11-27 00:17:45','436ef692-90fa-4a89-81a1-f18b86941968'),(69,8,'Banner Body','corporateEducationBannerBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Hiring the right veteran for the right job is hard. COMMIT provides the training and education to create corporate culture necessary for successful hiring of top tier servicemembers and veterans.  \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"420\",\"columnType\":\"text\"}','2018-11-25 17:26:17','2018-11-27 00:17:40','8b5a1b78-0cd6-4388-803e-d8c39b898dce'),(70,8,'Header 1','corporateEducationHeader1','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Misconceptions, skill translation gaps, and culture gaps may hinder many servicemembers and veterans from earning the right job and companies from hiring the right veteran\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 17:26:46','2018-11-27 00:17:58','03895a50-26f3-44be-b05b-6ac6ee72ae73'),(72,8,'Header 2','corporateEducationHeader2','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Veteran-Friendly to Veteran-Ready\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 17:27:34','2018-11-27 00:19:31','031a14cf-34ef-42c8-b38e-5eb761a671fc'),(73,8,'Header 2 Body','corporateEducationHeader2Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Mobilizing well-intentioned veteran support into deliberate and intentional veteran hiring is beneficial to a corporation’s bottom line and an opportunity to reinvest in high performing servicemembers. It is at the core of how COMMIT enables corporate partners to reframe and reinvent their veteran initiative programs. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 17:28:12','2018-11-27 00:19:39','f35da747-41cb-4b5c-85a5-2a6aa91f4f2a'),(75,8,'Program Objectives','corporateEducationProgramObjectives','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_corporateeducationprogramobjectives}}\",\"localizeBlocks\":false}','2018-11-25 17:34:33','2018-11-27 00:20:30','43df1eb9-1ff6-4eba-a87e-a5d81ec8a24d'),(76,NULL,'Bullet','bulletText','matrixBlockType:5','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"1\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 17:34:33','2018-11-27 00:20:30','6482acca-a790-4bb0-a6fb-b099ae7c8d54'),(80,8,'Header 3','corporateEducationHeader3','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The Corporate Hiring Process\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 17:36:45','2018-11-27 00:22:33','a47c773f-b63e-49ca-a598-cdaf2a9a303a'),(81,8,'Header 3 Body','corporateEducationHeader3Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Forged over the past decade through working with hundreds of high value servicemembers and veterans, COMMIT uses a five step process that speaks to the needs of organizations; a process that attracts, hires, and ultimately retains the best veteran talent for our partner’s organization.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 17:39:47','2018-11-27 00:23:01','b9b286d5-406a-48b1-9bc0-1cbb75debe1d'),(83,8,'Header 4','corporateEducationHeader4','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT works with corporate leadership and hiring professionals to conduct an intense deep-dive into the corporations and companies with whom we partner\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 17:41:58','2018-11-27 00:23:28','f70a9e9a-87c1-4285-a0d1-1b50ca2f1345'),(84,8,'Sub Header 4','corporateEducationSubHeader4','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Core components of COMMIT’s Corporate Education Program:\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 17:42:40','2018-11-27 00:23:39','4ad6aea4-fc94-4f9f-90bd-a9ebb4fbdccd'),(85,8,'Core Components','corporateEducationCoreComponents','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"3\",\"maxBlocks\":\"3\",\"contentTable\":\"{{%matrixcontent_corporateeducationcorecomponents}}\",\"localizeBlocks\":false}','2018-11-25 17:44:11','2018-11-27 00:24:20','ed9937e0-5d2f-468b-a816-c6b158f0eafe'),(86,NULL,'Icon','icon','matrixBlockType:7','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:11\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 17:44:11','2018-11-27 00:24:20','de34855d-264a-41f9-9816-00e580b258ae'),(87,NULL,'Heading','heading','matrixBlockType:7','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 17:44:11','2018-11-27 00:24:20','677b9bf3-50b3-4a13-9408-55ad571257c4'),(88,NULL,'Body','body','matrixBlockType:7','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 17:44:11','2018-11-27 00:24:20','4523de37-d3fd-4d48-8403-aacc198a89e5'),(89,8,'Header 5','corporateEducationHeader5','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"True to our name, we are committed to making long-term, significant impact in changing the way corporate America thinks about hiring and retaining veteran talent\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"250\",\"columnType\":\"text\"}','2018-11-25 17:45:07','2018-11-27 00:25:00','f7bf4722-db85-43d6-9c82-1c9eec536252'),(90,8,'Header 5 Body','corporateEducationHeader5Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT has a proven track record of impacting corporate veteran education programs, creating strategic initiatives to improve veteran talent pipelines, programming, and resources.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 17:45:37','2018-11-27 00:24:49','d825dece-8ac1-4cab-b953-e11a3aa272ea'),(91,9,'Banner Message','missionBannerMessage','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The COMMIT Foundation\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:29:37','2018-11-25 18:29:37','efca6e0d-4b43-4e39-812c-0dbc3cef89e7'),(92,9,'Banner Body','missionBannerBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT has proven its ability to build powerful tools, pipelines, and cultures that empower our Nation’s finest in their transition out of uniform.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:29:57','2018-11-25 18:29:57','7ace6a5c-500b-4768-b037-c8228fffd4de'),(93,9,'Header 1','missionHeader1','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The COMMIT Foundation is a 501c3 non-profit organization, fundamentally changing the way servicemembers and veterans approach their transition from the military to the civilian sector \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:30:24','2018-11-25 18:30:24','c627a5b9-bbc5-4a7f-8f9e-6a9227bc5fc6'),(94,9,'Header 2','missionHeader2','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Mission\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:30:45','2018-11-25 18:30:45','635dc597-7a97-45d2-8ec2-df51aa8b4561'),(95,9,'Header 2 Body','missionHeader2Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The COMMIT Foundation aims to create serendipity for exceptional American servicemembers and servicemembers and veterans separating from the uniformed services and entering successful roles and careers in the professional civilian world.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:31:08','2018-11-25 18:31:08','f1f0e76c-fcf4-494a-a87f-3b3d0e5045ba'),(96,9,'Header 3','missionHeader3','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Objective\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:31:28','2018-11-25 18:31:28','b3fb7aaf-3ac2-4787-a29a-e14f2662ca44'),(97,9,'Header 3 Body','missionHeader3Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The objective of the COMMIT foundation is to connect servicemembers and veterans to a career and professional network encouraging them to expand their aperture and translate their cultivated professional skills to a meaningful career in the civilian sector. Our programs uniquely expose servicemembers and veterans to opportunities they may never seek out due to a lack of information or confidence; or, a network which they never would have been able to obtain on their own. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:33:02','2018-11-25 18:33:02','9c84c553-fdcc-456b-b793-e89b4e04db68'),(98,9,'Header 1 Image','header1Image','global','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 18:34:05','2018-11-25 18:34:05','a5b28c28-61c6-4a8f-97ae-703611ddffd8'),(99,9,'Header 3 Image','missionHeader3Image','global','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 18:37:55','2018-11-25 18:37:55','7a56eef0-0ec8-4c94-be00-8ac75943f9a1'),(100,9,'Call to Action','missionCallToAction','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Download our 2016 Report\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:38:28','2018-11-25 18:45:38','2353556f-7b6e-4c14-8b8c-cd6c01a5be7e'),(101,9,'CTA File','missionCtaFile','global','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"pdf\",\"word\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 18:43:27','2018-11-25 18:45:52','fef704a8-54d8-46e7-9750-a71cd5e3c706'),(102,9,'Header 4','missionHeader4','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Quality over quantity through high touch, high impact methods\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:46:13','2018-11-25 18:46:13','90686181-f31d-4eb4-9d3f-c7ebe6fa8d65'),(103,9,'Header 4 Body','header4Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Our high touch, high impact approach has proven valuable over the past decade, with servicemembers and veterans placed across the spectrum of industries and top tier graduate schools; from AirBnB to Andreessen-Horowitz, from Silverlake Partners to Facebook and Google. Harvard Business School has graduated many COMMIT Foundation servicemembers and veterans, while some have chosen to engage their entrepreneurial spirit. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:46:32','2018-11-25 18:46:32','3506479f-aa40-433b-a8f2-84adc6fcb5ea'),(104,9,'Header 4 Image','missionHeader4Image','global','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 18:47:09','2018-11-25 18:47:09','0252e2e3-ffb6-4a4d-b2a3-dfd9545795ea'),(105,9,'Header 5','missionHeader5','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The Post 9-11 Veteran\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:47:37','2018-11-25 18:47:37','1271b6c3-70f6-4321-a23e-9951080e1510'),(106,9,'Header 5 Body','missionHeader5Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Different from servicemembers and veterans of past conflicts, many Post 9-11 servicemembers and veterans willingly joined the the military to serve. During the first decade of the Global War on Terror, the US deployed 2,333,972 military personnel to conflict zones around the globe—the bulk of service deploying to Iraq and Afghanistan. Of that total, 57% were deployed more than once during that first decade and an equal percentage have separated from the military. The protracted state of conflict, numerous deployments, and high expectations put on this group has forged a unique minority that thrives in civilian organizations.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:48:15','2018-11-25 18:48:15','a3f7c5f3-787e-449a-be1c-a5b6ed673be3'),(107,9,'Header 6','missionHeader6','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Why do we know this?\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:48:44','2018-11-25 18:48:44','2ce93679-710f-4ba5-bbfd-327ccd8b6ee4'),(108,9,'Header 6 Body','missionHeader6Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Because the COMMIT staff and Board of Directors are made up of a network of high value servicemembers and veterans and their families. We know this group, because we are this group.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 18:49:00','2018-11-25 18:49:00','7c9b4816-6fed-4844-a9bd-61bf5b4875f1'),(109,10,'Banner Message','mentorsBannerMessage','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"World Class Mentorship\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:10:15','2018-11-25 19:10:15','e0ebfe45-eac2-4d53-bc7f-a7636882c62c'),(110,10,'Banner Body','mentorsBannerBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"We take a hard look at the industries, interests, and skills of our servicemembers and veterans in order to align world class mentors from specific industries, backgrounds, and locations to provide game changing value. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:10:36','2018-11-25 19:10:36','d37d813d-0895-4558-b8b5-3ad29b64a7cf'),(111,10,'Header 1','mentorsHeader1','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Mentors come from all industries and areas of expertise demonstrating humility, perseverance, understanding, and intelligence\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:10:58','2018-11-25 19:10:58','6b410262-4c06-4f51-845c-4c2d5a7c08e1'),(112,10,'Header 1 Body','mentorsHeader1Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Mentors are fully engaged before, during and beyond veteran transitions. Some servicemembers and veterans and mentors remain connected professionally for many years after their initial connection through COMMIT.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:11:13','2018-11-25 19:11:13','3a0e4fbf-a8f3-42f4-bb73-65100c0a17d6'),(113,10,'Header 2','mentorsHeader2','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Encouraging. Knowledgeable. Exceptional.\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:11:32','2018-11-25 19:11:32','d7ac3bcb-6930-462f-891b-c913b0121a62'),(114,10,'Header 2 Body','mentorsHeader2Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Leveraging our trusted network of successful professionals, staff and Board of Directors, past mentors, donors, and veteran alumni, It\'s COMMITs ability to create serendipity that creates an invaluable network that would otherwise not likely be available to servicemembers and veterans.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:11:49','2018-11-25 19:11:49','25f654a6-8e48-4c35-bd0e-8c8574b1ac2a'),(115,10,'Header 3','mentorsHeader3','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Honest. Authentic.\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:12:20','2018-11-25 19:12:20','305e0c57-d3cf-4740-8f13-7c192a29bee9'),(116,10,'Header 2 Image','mentorsHeader2Image','global','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 19:12:39','2018-11-25 19:12:39','3450162a-d3cb-4df1-a928-df3400bb7b61'),(117,10,'Header 3 Body','mentorsHeader3Body','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"COMMIT mentors go above and beyond to listen and challenge servicemembers and veterans with thoughtful, meaningful questions, and perspectives. Servicemembers and veterans can expect mentors to be candid in sharing their experiences, while encouraging servicemembers and veterans to be honest and vulnerable with themselves. \",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:13:01','2018-11-25 19:13:01','6acb3880-85d9-4664-9cd0-2d7bc86bb395'),(118,10,'Header 3 Image','mentorsHeader3Image','global','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 19:13:25','2018-11-25 19:13:25','0c0c6bc2-ea84-4dd7-85aa-5f57143e351c'),(119,11,'Banner Message','teamBannerMessage','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Our Team\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:14:35','2018-11-25 19:14:35','7e3d5b73-c56a-4c9b-98bc-9f1ffec2e607'),(120,11,'Banner Body','teamBannerBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"We are veterans. We are military spouses. We are business professionals. We are on your team through your transition and beyond. The team is growing in response to the demand for expansion of COMMIT’s services, impact, and outreach. In addition to COMMIT’s full-time staff, a tremendous network of servicemembers and veterans and patriots volunteer to serve as advisors and mentors when called upon for program support.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:15:04','2018-11-25 19:15:04','1d619be3-a5b9-4aa1-8d22-0144c011a645'),(121,11,'Team Members','teamMembers','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_teammembers}}\",\"localizeBlocks\":false}','2018-11-25 19:16:20','2018-11-25 19:17:02','4b44a822-9f46-4901-987f-e0e9c705f1aa'),(122,NULL,'Image','image','matrixBlockType:8','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 19:16:20','2018-11-25 19:17:02','4a2e3b8a-8f4e-473c-8751-0b2bb5d71d96'),(123,NULL,'Name','teamName','matrixBlockType:8','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:17:02','2018-11-25 19:17:02','7e3b3ad1-df2d-4c8a-a956-68b72954f89e'),(124,NULL,'Title','teamTitle','matrixBlockType:8','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:17:02','2018-11-25 19:17:02','d6b0bf8c-6529-47af-8f88-c9f0df6eebeb'),(125,11,'Board Members','boardMembers','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_boardmembers}}\",\"localizeBlocks\":false}','2018-11-25 19:18:48','2018-11-25 19:18:48','d2c6a74e-dbd4-4d14-9b37-0334460784ec'),(126,NULL,'Image','image','matrixBlockType:9','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 19:18:48','2018-11-25 19:18:48','0c1a6d27-091a-4054-8155-b0b503ed1bb8'),(127,NULL,'Name','boardName','matrixBlockType:9','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:18:48','2018-11-25 19:18:48','4c338568-583d-4e12-aade-3202fffac32d'),(128,NULL,'Title','boardTitle','matrixBlockType:9','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:18:48','2018-11-25 19:18:48','1bcb85b9-d8d9-43a3-b9a3-2817f5af03dc'),(129,11,'Senior Advisors','seniorAdvisors','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_senioradvisors}}\",\"localizeBlocks\":false}','2018-11-25 19:19:38','2018-11-25 19:19:38','68ce92c6-145a-45bc-95dd-437013cf116b'),(130,NULL,'Image','image','matrixBlockType:10','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 19:19:38','2018-11-25 19:19:38','011996d3-fddb-4894-b2eb-2f835aac2aff'),(131,NULL,'Name','advisorName','matrixBlockType:10','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:19:38','2018-11-25 19:19:38','dbfdbc7b-1cf2-4dce-8734-9364be3a798e'),(132,NULL,'Title','advisorTitle','matrixBlockType:10','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:19:38','2018-11-25 19:19:38','9a0a070e-2cb7-4bfa-8ee7-cbd2455ed3aa'),(133,12,'Banner Message','partnersBannerMessage','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Our partners make it possible to achieve our mission\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:22:48','2018-11-25 19:22:48','8566d805-b068-49a6-aedd-9192f3cdea54'),(134,12,'Banner Body','partnersBannerBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"If you’re interested in supporting The COMMIT Foundation, please get in touch.\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:23:04','2018-11-25 19:23:04','e1f07944-14c8-4cc0-be33-67de9d11e4d6'),(135,12,'Supporters Body','supportersBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The COMMIT Foundation is grateful for the following organizations, who provide funding support to make our effective programs possible.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:23:31','2018-11-25 19:23:31','bbb80aee-ace2-44e0-b737-72b4ac0a65bc'),(136,12,'Partnering Service Providers Body','partneringServiceProvidersBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"The COMMIT Foundation is dedicated to working with the highest quality organizations serving our veteran community.\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:24:02','2018-11-25 19:24:02','8f0a7130-2843-4760-b802-dfac6d26cb99'),(137,13,'Banner Message','donateBannerMessage','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Support Our Post 9-11 Servicemembers & Veterans\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:25:10','2018-11-25 19:25:10','1194973c-6c3f-4da3-8f6b-a2bffb1350de'),(138,13,'Banner Body','donateBannerBody','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Our servicemembers and veterans are fueled by invaluable support from friends, passionate citizens, and advocates of military veterans and their families.\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:25:28','2018-11-25 19:25:28','64a2549b-5728-457c-a6ab-c5a8b396f56a'),(139,13,'Testimonials','donateTestimonials','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_donatetestimonials}}\",\"localizeBlocks\":false}','2018-11-25 19:28:56','2018-11-25 19:28:56','17b93fca-7064-485d-b31e-91568b1f31fa'),(140,NULL,'Quote','quote','matrixBlockType:11','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"1\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:28:56','2018-11-25 19:28:56','108fc399-3dc8-4e8e-a8da-d4382ae01a66'),(141,NULL,'Author','author','matrixBlockType:11','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:28:56','2018-11-25 19:28:56','7547ae55-29c8-44b9-9d86-df5751e24fcb'),(142,13,'Header 1','donateHeader1','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"No Veteran ever pays for COMMIT services.\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:29:45','2018-11-25 19:29:45','76c794db-e09a-4206-b8c1-7d695baef43e'),(143,13,'Header 1 Bullets','donateHeader1Bullets','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_donateheader1bullets}}\",\"localizeBlocks\":false}','2018-11-25 19:30:23','2018-11-25 19:30:23','22f787fa-bf7e-49d0-a403-ccd949bc20dd'),(144,NULL,'Bullet Body','bulletBody','matrixBlockType:12','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"1\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:30:23','2018-11-25 19:30:23','ede34856-5bf6-4c40-b89a-c544e290d9ed'),(145,13,'Call to Action','donateCallToAction','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Download 501 (c) (3) Designation Letter\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-25 19:30:54','2018-11-25 19:30:54','a859d4c4-7d04-461f-b3a5-98b4fcb4a8aa'),(146,13,'CTA File','donateCtaFile','global','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"pdf\",\"word\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-25 19:31:24','2018-11-25 19:31:24','927886ff-6efe-4b20-bcc9-2fa7bd2310ff'),(148,13,'$250 Description','donate250Description','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"New programming, powerful tools, pipelines, and cultures help us reach servicemembers and veterans across the nation\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 22:34:04','2018-11-26 22:34:04','65b295df-20dc-4923-9d66-ac1cd16dc281'),(149,13,'$600 Description','donate600Description','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Cover the expenses of providing 4 executive career coaching sessions for a veteran\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 22:34:33','2018-11-26 22:34:33','fd19e40d-876f-4fe7-aecd-fe1feb39633e'),(150,13,'$2500 Description','donate25000Description','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Cover the expenses of sending a veteran to a premier Transition Mentoring Workshop\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 22:35:06','2018-11-26 22:35:06','f9f58675-cc93-40cf-8db9-9d924b961c51'),(151,13,'Contact Us Description','donateContactUsDescription','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Continue to pay it forward for those that protect our freedom. Thank you for being part of this effort.\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 22:35:44','2018-11-26 22:35:44','dba33706-bdea-4be2-a019-e142cebad986'),(152,13,'Participant Survey Results','participantSurveyResults','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_participantsurveyresults}}\",\"localizeBlocks\":false}','2018-11-26 22:37:12','2018-11-26 22:37:12','7a220f75-fe08-40f5-a3ec-cba2917beaed'),(153,NULL,'Percent','percent','matrixBlockType:13','','none',NULL,'craft\\fields\\Number','{\"defaultValue\":null,\"min\":\"0\",\"max\":\"100\",\"decimals\":0,\"size\":null}','2018-11-26 22:37:12','2018-11-26 22:37:12','e7a4edea-9e0d-45d8-9aa1-7727e314f391'),(154,NULL,'Result','result','matrixBlockType:13','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Can imagine what they want to do when they leave the military\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 22:37:12','2018-11-26 22:37:12','c57e50ce-d3b7-48ef-b836-2473bedee2dd'),(155,12,'Supporters','supporters','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_supporters}}\",\"localizeBlocks\":false}','2018-11-26 22:51:55','2018-11-26 23:08:29','8f574714-9848-4316-9bb1-8c4bdd947b6b'),(156,NULL,'Name','supporterName','matrixBlockType:14','Enter the name of the supporter.','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 22:51:55','2018-11-26 23:08:29','f3caf2b3-09d1-4204-9f6c-f023c623bd70'),(157,NULL,'Logo','logo','matrixBlockType:14','Upload their logo','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:9\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-26 22:51:55','2018-11-26 23:08:29','656eb777-dc60-46de-9aba-3932693c3c27'),(158,NULL,'URL to Website','supporterUrl','matrixBlockType:14','Add a URL to the supporter\'s website.','none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\"}','2018-11-26 22:51:55','2018-11-26 23:08:29','cc81de72-c5da-4408-bd76-1077642e24cc'),(159,12,'Partnering Service Providers','partneringServiceProviders','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_partneringserviceproviders}}\",\"localizeBlocks\":false}','2018-11-26 22:54:22','2018-11-26 23:08:12','9d2b7e2a-5576-4cb6-96e9-442b18482045'),(160,NULL,'Name','partnerName','matrixBlockType:15','Enter the name of the partner','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 22:54:22','2018-11-26 23:08:12','52801ab2-4919-4724-9731-1976b3ffa246'),(161,NULL,'Logo','logo','matrixBlockType:15','Upload the partner\'s logo','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:9\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-26 22:54:22','2018-11-26 23:08:12','c711605f-a7f0-437a-981a-8f09ccf678b9'),(162,NULL,'URL to Website','partnerUrl','matrixBlockType:15','Enter the URL to the partner\'s homepage.','none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\"}','2018-11-26 22:54:22','2018-11-26 23:08:12','00eb2da4-45cc-4ba6-a21d-ed5d3ae4e9c8'),(163,4,'Event Overview','eventOverview','global','','none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2018-11-26 23:12:45','2018-11-26 23:12:45','c5a0c605-b8ba-49e4-8340-0d166bcd62c3'),(164,14,'Article Title','articleTitle','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 23:15:30','2018-11-26 23:15:30','83e02102-4c1d-4aaa-9809-4152577c97e7'),(165,14,'Article','article','global','','none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2018-11-26 23:15:45','2018-11-26 23:15:45','84f970a8-95df-4f76-89f8-aa46f879a9d0'),(166,14,'Image','image','global','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"1\",\"defaultUploadLocationSource\":\"folder:1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"folder:8\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-11-26 23:16:13','2018-11-26 23:16:13','a29b767e-e736-45b4-8509-042687906213'),(167,2,'Testimonial Quote','homepageTestimonialQuote','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 23:22:08','2018-11-26 23:36:23','9780217c-84e1-4ec0-89a8-a20484d6cfc9'),(168,2,'Testimonial Author','homepageTestimonialAuthor','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 23:22:27','2018-11-26 23:22:27','55e4ef4e-a067-493a-8ec2-5ca81135491c'),(169,5,'Testimonial Quote','transitionAssistanceTestimonialQuote','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 23:37:52','2018-11-26 23:38:24','ea11624d-3265-4c8b-9b76-e877e1896c1d'),(170,5,'Testimonial Author','transitionAssistanceTestimonialAuthor','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 23:38:17','2018-11-26 23:38:17','3daa6a14-a100-465e-921c-0fa5f8335460'),(171,6,'Testimonial 1 Quote','transitionMentoringTestimonial1Quote','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 23:56:13','2018-11-27 00:03:14','70e138d9-06db-49e2-9af1-5817b5f7cb68'),(172,6,'Testimonial 1 Author','transitionMentoringTestimonial1Author','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-26 23:56:27','2018-11-27 00:03:24','efc8cfb4-48fa-45a2-8efb-9eaaf92de374'),(173,6,'Testimonial 2 Quote','transitionMentorshipTestimonial2Quote','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"3\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-27 00:03:44','2018-11-27 00:03:44','b5e0924d-2bd2-43a3-90c2-7565436c2049'),(174,6,'Testimonial 2 Author','transitionMentoringTestimonial2Author','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-27 00:04:13','2018-11-27 00:04:13','f3eea012-faac-490b-a613-58e8a1fdc0ff'),(175,8,'Testimonial 1 Quote','corporateEducationTestimonial1Quote','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-27 00:21:23','2018-11-27 00:21:23','f6f12807-8c5e-48b5-85ce-1d06a5cbbbec'),(176,8,'Testimonial 1 Author','corporateEducationTestimonial1Author','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-27 00:21:36','2018-11-27 00:21:36','a1238210-bd4d-4583-9afe-5017aeb8de2a'),(177,8,'Testimonial 2 Quote','corporateEducationTestimonial2Quote','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-27 00:21:57','2018-11-27 00:21:57','13b4c377-5d01-488c-92af-a13b88d341b3'),(178,8,'Testimonial 2 Author','corporateEducationTestimonial2Author','global','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-11-27 00:22:20','2018-11-27 00:22:20','e3316072-4de5-40b1-8fcc-36dc6951a2dc');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `globalsets_handle_unq_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES (166,'Partners','partners',30,'2018-11-26 22:49:42','2018-11-26 23:11:13','8493cf4d-a06c-4e41-b76b-f10f281f27be');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `edition` tinyint(3) unsigned NOT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `on` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.0.32','3.0.94',0,'America/Los_Angeles','The COMMIT Foundation',1,0,'JopGkIIypYim','2018-11-08 19:59:30','2018-11-27 00:25:00','bf59058b-4d3d-45fe-a957-d6c4dac0add4');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `matrixblocks_ownerSiteId_idx` (`ownerSiteId`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
INSERT INTO `matrixblocks` VALUES (168,156,NULL,9,1,1,'2018-11-26 23:35:05','2018-11-26 23:51:10','393b40b0-253e-4983-a9d4-fc9349dbda26'),(169,156,NULL,9,1,2,'2018-11-26 23:35:05','2018-11-26 23:51:10','b0bfa299-cd47-43ae-9f1d-728a47ba02d3'),(170,156,NULL,9,1,3,'2018-11-26 23:35:05','2018-11-26 23:51:10','09ed3e46-5beb-42a9-9e4e-f2df8358a45e');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (1,9,7,'Testimonial','testimonial',1,'2018-11-24 23:04:37','2018-11-26 23:20:04','32b3a44c-4b71-4bfd-8452-21638a1639f5'),(5,75,14,'Bullets','bullets',1,'2018-11-25 17:34:33','2018-11-27 00:20:30','083d6fae-57fd-4538-97f1-07044992642d'),(7,85,16,'Core Components','coreComponents',1,'2018-11-25 17:44:11','2018-11-27 00:24:20','26bac0b4-96bb-46b4-a83e-80ca6da1f3c1'),(8,121,21,'Team Member','teamMember',1,'2018-11-25 19:16:20','2018-11-25 19:17:02','74e8b2c1-689a-4273-abf9-d7a2578fdc88'),(9,125,23,'Board Member','boardMember',1,'2018-11-25 19:18:48','2018-11-25 19:18:48','c5aa2283-f42d-48df-94ff-a96b467dfdc1'),(10,129,24,'Senior Advisors','seniorAdvisors',1,'2018-11-25 19:19:38','2018-11-25 19:19:38','cd3f7d3c-df04-4e9f-b743-dee86f8f944b'),(11,139,26,'Testimonial','testimonial',1,'2018-11-25 19:28:56','2018-11-25 19:28:56','9c7c776d-9435-41eb-9cca-c50d11baa3c9'),(12,143,27,'Bullets','bullets',1,'2018-11-25 19:30:23','2018-11-25 19:30:23','f4d81fe4-87ba-43c8-8010-02d9ff68dabd'),(13,152,29,'Result','result',1,'2018-11-26 22:37:12','2018-11-26 22:37:12','c4281980-189a-495d-8d0e-b8c0ca14b9e3'),(14,155,31,'Supporter','supporter',1,'2018-11-26 22:51:55','2018-11-26 23:08:29','20e17bc9-5099-4aed-b49d-9816216a0aa4'),(15,159,32,'Partner','partner',1,'2018-11-26 22:54:22','2018-11-26 23:08:12','1f0b199b-08a4-49d3-a8b7-fc1e803df65a');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_boardmembers`
--

DROP TABLE IF EXISTS `matrixcontent_boardmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_boardmembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_boardMember_boardName` text,
  `field_boardMember_boardTitle` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_boardmembers_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_boardmembers_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_boardmembers_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_boardmembers_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_boardmembers`
--

LOCK TABLES `matrixcontent_boardmembers` WRITE;
/*!40000 ALTER TABLE `matrixcontent_boardmembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_boardmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_corporateeducationcorecomponents`
--

DROP TABLE IF EXISTS `matrixcontent_corporateeducationcorecomponents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_corporateeducationcorecomponents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_coreComponents_heading` text,
  `field_coreComponents_body` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixconten_corporateeducationcorecompone_elementI_siteI_unq_id` (`elementId`,`siteId`),
  KEY `matrixcontent_corporateeducationcorecomponents_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_corporateeducationcorecomponents_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_corporateeducationcorecomponents_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_corporateeducationcorecomponents`
--

LOCK TABLES `matrixcontent_corporateeducationcorecomponents` WRITE;
/*!40000 ALTER TABLE `matrixcontent_corporateeducationcorecomponents` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_corporateeducationcorecomponents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_corporateeducationprogramobjectives`
--

DROP TABLE IF EXISTS `matrixcontent_corporateeducationprogramobjectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_corporateeducationprogramobjectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_bullets_bulletText` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixconte_corporateeducationprogramobjec_elementI_siteI_unq_id` (`elementId`,`siteId`),
  KEY `matrixcontent_corporateeducationprogramobjectives_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_corporateeducationprogramobjectives_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_corporateeducationprogramobjectives_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_corporateeducationprogramobjectives`
--

LOCK TABLES `matrixcontent_corporateeducationprogramobjectives` WRITE;
/*!40000 ALTER TABLE `matrixcontent_corporateeducationprogramobjectives` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_corporateeducationprogramobjectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_donateheader1bullets`
--

DROP TABLE IF EXISTS `matrixcontent_donateheader1bullets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_donateheader1bullets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_bullets_bulletBody` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_donateheader1bullets_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_donateheader1bullets_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_donateheader1bullets_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_donateheader1bullets_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_donateheader1bullets`
--

LOCK TABLES `matrixcontent_donateheader1bullets` WRITE;
/*!40000 ALTER TABLE `matrixcontent_donateheader1bullets` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_donateheader1bullets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_donatetestimonials`
--

DROP TABLE IF EXISTS `matrixcontent_donatetestimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_donatetestimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_testimonial_quote` text,
  `field_testimonial_author` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_donatetestimonials_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_donatetestimonials_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_donatetestimonials_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_donatetestimonials_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_donatetestimonials`
--

LOCK TABLES `matrixcontent_donatetestimonials` WRITE;
/*!40000 ALTER TABLE `matrixcontent_donatetestimonials` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_donatetestimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_participantsurveyresults`
--

DROP TABLE IF EXISTS `matrixcontent_participantsurveyresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_participantsurveyresults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_result_percent` smallint(3) DEFAULT NULL,
  `field_result_result` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_participantsurveyresults_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_participantsurveyresults_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_participantsurveyresults_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_participantsurveyresults_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_participantsurveyresults`
--

LOCK TABLES `matrixcontent_participantsurveyresults` WRITE;
/*!40000 ALTER TABLE `matrixcontent_participantsurveyresults` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_participantsurveyresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_partneringserviceproviders`
--

DROP TABLE IF EXISTS `matrixcontent_partneringserviceproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_partneringserviceproviders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_partner_partnerName` text,
  `field_partner_partnerUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_partneringserviceproviders_elementId_siteId_unq_id` (`elementId`,`siteId`),
  KEY `matrixcontent_partneringserviceproviders_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_partneringserviceproviders_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_partneringserviceproviders_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_partneringserviceproviders`
--

LOCK TABLES `matrixcontent_partneringserviceproviders` WRITE;
/*!40000 ALTER TABLE `matrixcontent_partneringserviceproviders` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_partneringserviceproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_senioradvisors`
--

DROP TABLE IF EXISTS `matrixcontent_senioradvisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_senioradvisors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_seniorAdvisors_advisorName` text,
  `field_seniorAdvisors_advisorTitle` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_senioradvisors_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_senioradvisors_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_senioradvisors_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_senioradvisors_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_senioradvisors`
--

LOCK TABLES `matrixcontent_senioradvisors` WRITE;
/*!40000 ALTER TABLE `matrixcontent_senioradvisors` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_senioradvisors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_supporters`
--

DROP TABLE IF EXISTS `matrixcontent_supporters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_supporters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_supporter_supporterName` text,
  `field_supporter_supporterUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_supporters_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_supporters_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_supporters_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_supporters_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_supporters`
--

LOCK TABLES `matrixcontent_supporters` WRITE;
/*!40000 ALTER TABLE `matrixcontent_supporters` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_supporters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_teammembers`
--

DROP TABLE IF EXISTS `matrixcontent_teammembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_teammembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_teamMember_teamName` text,
  `field_teamMember_teamTitle` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_teammembers_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_teammembers_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_teammembers_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_teammembers_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_teammembers`
--

LOCK TABLES `matrixcontent_teammembers` WRITE;
/*!40000 ALTER TABLE `matrixcontent_teammembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_teammembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_testimonialscarousel`
--

DROP TABLE IF EXISTS `matrixcontent_testimonialscarousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_testimonialscarousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_testimonial_testimonialQuote` text,
  `field_testimonial_testimonialAuthor` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_testimonialscarousel_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_testimonialscarousel_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_testimonialscarousel_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_testimonialscarousel_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_testimonialscarousel`
--

LOCK TABLES `matrixcontent_testimonialscarousel` WRITE;
/*!40000 ALTER TABLE `matrixcontent_testimonialscarousel` DISABLE KEYS */;
INSERT INTO `matrixcontent_testimonialscarousel` VALUES (1,168,1,'2018-11-26 23:35:05','2018-11-26 23:51:10','623b44d9-d1df-45c5-8283-d24a87bfb135','In less than 48 hours, COMMIT truly set the foundation for my military transition to civilian life. COMMIT professionals provided unique tools, information and contacts to execute my final military operation! I am thankful for this organization and recommend it to America\'s best.','Thomas Paul Vogel'),(2,169,1,'2018-11-26 23:35:05','2018-11-26 23:51:10','7ba7f576-3feb-49cf-9b94-5e50f222aa16','The anxiety I was feeling about my civilian career transition has been replaced with excitement and enthusiasm thanks to COMMIT and its mentors. I can\'t wait to see where my journey after the military takes me.','Dana De Coster'),(3,170,1,'2018-11-26 23:35:05','2018-11-26 23:51:10','3742b808-0382-4c2e-aa6f-ba85ea0bb485','COMMIT connected me with a diverse group of veterans and mentors, who showed me new ways to develop and leverage my network while opening my eyes to opportunities I had never considered.','George D Hasseltine');
/*!40000 ALTER TABLE `matrixcontent_testimonialscarousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `migrations_pluginId_idx` (`pluginId`),
  KEY `migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,NULL,'app','Install','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','8868e9d0-8135-450d-b452-c8c8d17253b7'),(2,NULL,'app','m150403_183908_migrations_table_changes','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','8906bf3a-e78a-49ab-9b01-57426da8c1aa'),(3,NULL,'app','m150403_184247_plugins_table_changes','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','c453a81e-88b6-4bb7-a24d-020f3be5dcea'),(4,NULL,'app','m150403_184533_field_version','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','f9482774-2447-4025-acf9-cf6255e3d452'),(5,NULL,'app','m150403_184729_type_columns','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','5d7f05c3-5790-44ed-b917-f90aebec9a6b'),(6,NULL,'app','m150403_185142_volumes','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','1e46c16e-a2ca-45ea-be9c-c86cf65911b6'),(7,NULL,'app','m150428_231346_userpreferences','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','558916ea-cbe9-42d8-90c9-59f171e34812'),(8,NULL,'app','m150519_150900_fieldversion_conversion','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','cfc723f4-1db7-4750-be4a-66934d3e55ef'),(9,NULL,'app','m150617_213829_update_email_settings','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','e30e0aad-e5df-4507-bee7-752871e28dde'),(10,NULL,'app','m150721_124739_templatecachequeries','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','63902c80-e93d-4296-9b75-664f49209ed5'),(11,NULL,'app','m150724_140822_adjust_quality_settings','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','70dcdb05-f361-422b-9a8c-498087b18542'),(12,NULL,'app','m150815_133521_last_login_attempt_ip','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','505a34ab-36db-44d6-ab8c-67ec0d1ab09a'),(13,NULL,'app','m151002_095935_volume_cache_settings','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','6137bb08-df6b-49d9-bad7-3cfa8fa47126'),(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','ad7e75a2-cce0-49ee-90fb-427a120e4ad3'),(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','5c7de35f-109d-452b-97cc-4a3a45e1b452'),(16,NULL,'app','m151209_000000_move_logo','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','357f560c-cc00-4a02-8b10-6958f772b5a0'),(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','8d871c1a-4ba5-4082-a5e7-eb93203ed3c0'),(18,NULL,'app','m151215_000000_rename_asset_permissions','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','30d81355-d030-4621-9cdb-183df59fb8b9'),(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','18f15bf2-d615-4b08-baaa-3bfc3c0c2907'),(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','e7bc998e-41f2-49bd-b77e-2ec29fda8eb9'),(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','67bc2c9e-11c7-4fbe-bb56-77815f74c237'),(22,NULL,'app','m160727_194637_column_cleanup','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','391b32b6-d746-4c4a-b418-7f652f31748c'),(23,NULL,'app','m160804_110002_userphotos_to_assets','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','367e0555-4b3b-4022-9e4f-413dea528572'),(24,NULL,'app','m160807_144858_sites','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','f2892245-25ec-4b89-b50a-ac2ebe00ea5d'),(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','076a99d8-3b9d-41b8-bec8-197387f338a8'),(26,NULL,'app','m160830_000000_asset_index_uri_increase','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','096c56fb-fb73-4fe8-8684-075c1d8dbe37'),(27,NULL,'app','m160912_230520_require_entry_type_id','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','9bbdfd29-b758-4fe9-86f9-7acd2ae509bd'),(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','2114ffc8-2c3b-4e45-a2f8-7639bc8e43bf'),(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','a4ac835b-0dce-408b-90b1-4ab7b5297d24'),(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','fbb0bbd8-0e97-454b-bfc8-331303858514'),(31,NULL,'app','m160925_113941_route_uri_parts','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','fa974d32-8f56-40a6-b0bd-2dcb62f83f73'),(32,NULL,'app','m161006_205918_schemaVersion_not_null','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','a6ed7a40-1be3-4770-b5c8-c0409a7dd928'),(33,NULL,'app','m161007_130653_update_email_settings','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','638bc139-b12b-4389-9cf9-ab185b4f208d'),(34,NULL,'app','m161013_175052_newParentId','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','3a268af0-ef68-4b04-8055-47eeddc3b2a6'),(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','fac45684-5c73-43c3-863d-1e96a07c5819'),(36,NULL,'app','m161021_182140_rename_get_help_widget','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','376a0fc4-f5a3-44af-9534-67b948094d4f'),(37,NULL,'app','m161025_000000_fix_char_columns','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','d4c658df-397d-45c0-90cd-90a019673f25'),(38,NULL,'app','m161029_124145_email_message_languages','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','6faf3b59-96c8-46d2-b26a-c57e4cf59b0e'),(39,NULL,'app','m161108_000000_new_version_format','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','200a272b-b1b9-46ef-9270-45695c43646c'),(40,NULL,'app','m161109_000000_index_shuffle','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','9e188c6e-8443-4131-8740-4391a1fe4879'),(41,NULL,'app','m161122_185500_no_craft_app','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','688f90b5-98bc-43bf-a503-0f58a14578c7'),(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','78d57211-2cb3-4561-89e2-be5b53d435f7'),(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','e04db3b9-d532-4ed4-90f2-0e2a9372d5fa'),(44,NULL,'app','m170114_161144_udates_permission','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','23505834-3cf7-4ad1-b1cf-75f49cba4efb'),(45,NULL,'app','m170120_000000_schema_cleanup','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','3ed4e312-ec5d-48b4-913e-3b6067fc44b4'),(46,NULL,'app','m170126_000000_assets_focal_point','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','3b46a90e-d181-460c-a450-5355e1a5949d'),(47,NULL,'app','m170206_142126_system_name','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','37867f71-b419-4ab0-b92c-92dc4fbf11e1'),(48,NULL,'app','m170217_044740_category_branch_limits','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','78753c00-92af-4b60-b405-9f876b7abb70'),(49,NULL,'app','m170217_120224_asset_indexing_columns','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','f3ac33b0-8e9e-45af-ac27-cd29ea00b712'),(50,NULL,'app','m170223_224012_plain_text_settings','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','0a8dbc43-1db4-4956-af0b-20dae1e0dbdf'),(51,NULL,'app','m170227_120814_focal_point_percentage','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','f29e6e44-338e-4c3c-8b62-23bc44641acf'),(52,NULL,'app','m170228_171113_system_messages','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','5b41d97f-f7a4-4376-a2ae-8a9cb1c5f95b'),(53,NULL,'app','m170303_140500_asset_field_source_settings','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','e7074449-899a-49ea-acfb-30ee0f379778'),(54,NULL,'app','m170306_150500_asset_temporary_uploads','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','979b2239-f9bf-49ce-bccd-a11f32c60b39'),(55,NULL,'app','m170414_162429_rich_text_config_setting','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','4804c888-75cb-4544-ac1f-1cdffca45ea9'),(56,NULL,'app','m170523_190652_element_field_layout_ids','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','f056ec86-ca6c-4354-a08f-c74ac863fdef'),(57,NULL,'app','m170612_000000_route_index_shuffle','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','ecb9fe90-4825-4fa8-8946-f08f66effc53'),(58,NULL,'app','m170621_195237_format_plugin_handles','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','a37241b6-7c77-4359-b15d-f4e130718bf3'),(59,NULL,'app','m170630_161028_deprecation_changes','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','2f0fff46-46f7-4c4c-a55e-a279398c1f22'),(60,NULL,'app','m170703_181539_plugins_table_tweaks','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','0e9821fc-2808-4e29-b497-5aeb76a26f68'),(61,NULL,'app','m170704_134916_sites_tables','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','ec0c08c1-f93f-450d-89d6-7e0ad4221f9f'),(62,NULL,'app','m170706_183216_rename_sequences','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','644b1294-8e81-4aa2-84a4-37befaee91a7'),(63,NULL,'app','m170707_094758_delete_compiled_traits','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','9959b062-97fe-477c-a0fe-cc77c0c50e3a'),(64,NULL,'app','m170731_190138_drop_asset_packagist','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','bd374ee3-ccb6-42c0-87b1-1edef81a5af7'),(65,NULL,'app','m170810_201318_create_queue_table','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','5ed53545-77d7-47db-84d9-36de7e19b63e'),(66,NULL,'app','m170816_133741_delete_compiled_behaviors','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','bfde970c-5f01-4483-ac01-2596cc157072'),(67,NULL,'app','m170821_180624_deprecation_line_nullable','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','06140746-6185-46e3-afdc-636ae32187a4'),(68,NULL,'app','m170903_192801_longblob_for_queue_jobs','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','f5972846-e485-432d-9b0f-dece34565bb0'),(69,NULL,'app','m170914_204621_asset_cache_shuffle','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','609f2028-db76-44dd-861e-5cbba3e7592a'),(70,NULL,'app','m171011_214115_site_groups','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','2620b4e3-bbdd-462b-9753-3efcd5a64ba2'),(71,NULL,'app','m171012_151440_primary_site','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','eb9b407c-3f7b-429f-9c3a-5d0e8ec9cd7a'),(72,NULL,'app','m171013_142500_transform_interlace','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','8bb16acd-c77a-4e8b-a21d-4f5fa1f9c8be'),(73,NULL,'app','m171016_092553_drop_position_select','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','e11d42e3-eafe-4534-b2af-6fa8819e642a'),(74,NULL,'app','m171016_221244_less_strict_translation_method','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','d274f217-03c3-4884-9088-f40bf800ec45'),(75,NULL,'app','m171107_000000_assign_group_permissions','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','ef64b62d-3136-41ad-ab18-97f657afe2fb'),(76,NULL,'app','m171117_000001_templatecache_index_tune','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','75c88677-1904-48ad-8941-bf48cc072af9'),(77,NULL,'app','m171126_105927_disabled_plugins','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','1a3f1afe-1832-4e3a-b4f2-503bd1412992'),(78,NULL,'app','m171130_214407_craftidtokens_table','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','9f963075-aafa-4586-9464-6250fa2f38d8'),(79,NULL,'app','m171202_004225_update_email_settings','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','98bc61d2-c539-4391-b6e7-41385304cf63'),(80,NULL,'app','m171204_000001_templatecache_index_tune_deux','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','909a65af-4573-4056-bd86-83627bfa80b3'),(81,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','b8d36eff-9aac-45cf-b136-e46c6d9865bc'),(82,NULL,'app','m171218_143135_longtext_query_column','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','0828c172-82e9-46b6-b58e-5adf256897c5'),(83,NULL,'app','m171231_055546_environment_variables_to_aliases','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','7cce3f0d-ce96-41b8-ae76-43ffa7380dcd'),(84,NULL,'app','m180113_153740_drop_users_archived_column','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','7b9e925d-7483-4752-9c7b-b270025e7f06'),(85,NULL,'app','m180122_213433_propagate_entries_setting','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','9eab18e1-5896-49da-b27c-6ffbab71f8ba'),(86,NULL,'app','m180124_230459_fix_propagate_entries_values','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','8b286c64-303d-4bac-989f-808db80aed14'),(87,NULL,'app','m180128_235202_set_tag_slugs','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','f3b39d02-df78-4a81-9496-44570b2ee36e'),(88,NULL,'app','m180202_185551_fix_focal_points','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','4b06545f-a191-41c0-91d4-faf8389f5ea6'),(89,NULL,'app','m180217_172123_tiny_ints','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','78341c60-8097-4b42-8ea6-8c7c9d59b143'),(90,NULL,'app','m180321_233505_small_ints','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','8029b65b-0313-4522-b8b1-b57420a80a31'),(91,NULL,'app','m180328_115523_new_license_key_statuses','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','6b0e73ee-9cc0-4a15-b3c6-9ae154dcd697'),(92,NULL,'app','m180404_182320_edition_changes','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','ac7fadd1-d8bc-48d3-8ac9-078ff6f522cd'),(93,NULL,'app','m180411_102218_fix_db_routes','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','c29aa983-0083-45d6-b69c-5896835237e7'),(94,NULL,'app','m180416_205628_resourcepaths_table','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','377dee13-53df-4b45-b103-830cf2a7c5bc'),(95,NULL,'app','m180418_205713_widget_cleanup','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','bb3def9d-e74d-4057-8460-486a8bd03c82'),(96,NULL,'app','m180824_193422_case_sensitivity_fixes','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','2c9f57c9-f58e-4127-a1e0-fb080b8b6060'),(97,NULL,'app','m180901_151639_fix_matrixcontent_tables','2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-08 19:59:30','ef4b93cf-a8ad-4f80-a6e0-f56d81fbedb2'),(98,NULL,'app','m181112_203955_sequences_table','2018-11-20 22:35:25','2018-11-20 22:35:25','2018-11-20 22:35:25','e9c47569-7d6b-439c-b9ee-ce866a844064'),(99,2,'plugin','m180430_204710_remove_old_plugins','2018-11-26 21:29:22','2018-11-26 21:29:22','2018-11-26 21:29:22','c50a364b-0ed5-4317-9419-86ffc9cbe1ca'),(100,2,'plugin','Install','2018-11-26 21:29:22','2018-11-26 21:29:22','2018-11-26 21:29:22','04400b63-8288-4c65-9bdd-080607a2f98d');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKey` char(24) DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`),
  KEY `plugins_enabled_idx` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'expanded-singles','1.0.5','1.0.0',NULL,'unknown',1,'{\"expandSingles\":\"1\",\"redirectToEntry\":\"1\"}','2018-11-21 00:09:57','2018-11-21 00:09:57','2018-11-26 22:32:51','1e8d7f03-e8b9-4624-bdbd-cf143e10f623'),(2,'redactor','2.1.6','2.0.0',NULL,'unknown',1,NULL,'2018-11-26 21:29:22','2018-11-26 21:29:22','2018-11-26 22:32:51','07b8dce3-ca24-4943-9e77-6e0d9f4ec8b1');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('104e4ffd','@lib/fileupload'),('12bc6dad','@craft/web/assets/routes/dist'),('136e90f','@craft/web/assets/dashboard/dist'),('203d6407','@craft/web/assets/fields/dist'),('20f8adea','@lib/fabric'),('21902b0f','@craft/web/assets/editentry/dist'),('238af62f','@app/web/assets/dashboard/dist'),('2449e952','@bower/jquery/dist'),('24edd861','@app/web/assets/fields/dist'),('29e1b1c7','@lib/jquery.payment'),('2e20b196','@vendor/craftcms/redactor/lib/redactor'),('32c342f','@app/web/assets/editentry/dist'),('35be79d4','@lib/garnishjs'),('35c61e2f','@lib/velocity'),('38e7b659','@craft/web/assets/updates/dist'),('40899f5f','@craft/web/assets/updateswidget/dist'),('4760f280','@craft/web/assets/craftsupport/dist'),('4f66454d','@craft/web/assets/login/dist'),('537a2c16','@craft/redactor/assets/field/dist'),('538c76b3','@craft/web/assets/pluginstore/dist'),('56b4270d','@lib/xregexp'),('57e04','@craft/web/assets/utilities/dist'),('5af746ce','@craft/web/assets/cp/dist'),('5cd86387','@lib/selectize'),('6036e52','@lib/d3'),('6141bb3c','@app/web/assets/plugins/dist'),('694b7f78','@lib/timepicker'),('77f09b6e','@craft/web/assets/updater/dist'),('786c0fbc','@craft/web/assets/clearcaches/dist'),('7875cfc4','@craft/web/assets/feed/dist'),('78d3453a','@craft/web/assets/assetindexes/dist'),('7b6f858a','@lib/jquery-ui'),('7e33dd31','@craft/web/assets/recententries/dist'),('8078ffd1','@craft/web/assets/fields/dist'),('80bd363c','@lib/fabric'),('81d5b0d9','@craft/web/assets/editentry/dist'),('82fcfaf2','@app/web/assets/utilities/dist'),('82fd672','@craft/web/assets/tablesettings/dist'),('840c7284','@bower/jquery/dist'),('89a42a11','@lib/jquery.payment'),('8a64e03','@lib/picturefill'),('8bd694ad','@app/web/assets/tablesettings/dist'),('8deaa7d','@craft/web/assets/matrix/dist'),('93f00ce6','@vendor/craftcms/redactor/lib/redactor-plugins/fullscreen'),('958385f9','@lib/velocity'),('95fbe202','@lib/garnishjs'),('98a22d8f','@craft/web/assets/updates/dist'),('999cf3dd','@app/web/assets/feed/dist'),('a040e5d2','@craft/web/assets/utilities/dist'),('a17372d9','@craft/web/assets/dashboard/dist'),('a242a137','@craft/web/assets/installer/dist'),('a4a5f600','@vendor/craftcms/redactor/lib/redactor-plugins/video'),('a646f584','@lib/d3'),('a856a7b2','@app/web/assets/matrixsettings/dist'),('a8e3d5d5','@lib/picturefill'),('ab9cd971','@lib/element-resize-detector'),('adc1e39e','@lib/prismjs'),('af47e917','@lib/jquery-touch-events'),('b00bd42b','@lib/fileupload'),('bc26b37c','@lib'),('bd942a7','@lib/element-resize-detector'),('beb991b5','@craft/web/assets/matrixsettings/dist'),('c0e161b','@app/web/assets/matrix/dist'),('c370dd80','@app/web/assets/updateswidget/dist'),('c594afed','@craft/web/assets/plugins/dist'),('c90ee4ae','@lib/timepicker'),('cde27141','@app/web/assets/craftsupport/dist'),('d3258fbf','@app/web/assets/updater/dist'),('d334b9cf','@craft/web/assets/findreplace/dist'),('d7b500b8','@craft/web/assets/updater/dist'),('d8305412','@craft/web/assets/feed/dist'),('d83fb7a9','@craft/web/assets/edittransform/dist'),('d847848','@lib/prismjs'),('db2a1e5c','@lib/jquery-ui'),('de7646e7','@craft/web/assets/recententries/dist'),('e087b863','@app/web/assets/cp/dist'),('e0cc0489','@craft/web/assets/updateswidget/dist'),('e4b9ad1d','@app/web/assets/login/dist'),('e7256956','@craft/web/assets/craftsupport/dist'),('e9e350d2','@craft/web/assets/generalsettings/dist'),('edb24e5a','@craft/web/assets/dbbackup/dist'),('ef23de9b','@craft/web/assets/login/dist'),('f0272c1','@lib/jquery-touch-events'),('f6f1bcdb','@lib/xregexp'),('f7ce86ce','@craft/web/assets/installer/dist'),('fab2dd18','@craft/web/assets/cp/dist'),('fbbff548','@app/web/assets/pluginstore/dist'),('fc9df851','@lib/selectize'),('fdca9fee','@app/web/assets/recententries/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) DEFAULT NULL,
  `uriParts` varchar(255) NOT NULL,
  `uriPattern` varchar(255) NOT NULL,
  `template` varchar(500) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `routes_uriPattern_idx` (`uriPattern`),
  KEY `routes_siteId_idx` (`siteId`),
  CONSTRAINT `routes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' paul tripletreellc com '),(1,'slug',0,1,''),(3,'filename',0,1,' icon_temp_01 png '),(3,'extension',0,1,' png '),(3,'kind',0,1,' image '),(3,'slug',0,1,''),(3,'title',0,1,' icon temp 01 '),(156,'title',0,1,' homepage '),(5,'filename',0,1,' 404 png '),(5,'extension',0,1,' png '),(5,'kind',0,1,' image '),(5,'slug',0,1,''),(5,'title',0,1,' 404 '),(6,'filename',0,1,' confindence svg '),(6,'extension',0,1,' svg '),(6,'kind',0,1,' image '),(6,'slug',0,1,''),(6,'title',0,1,' confindence '),(7,'filename',0,1,' hiring svg '),(7,'extension',0,1,' svg '),(7,'kind',0,1,' image '),(7,'slug',0,1,''),(7,'title',0,1,' hiring '),(8,'filename',0,1,' apple touch icon png '),(8,'extension',0,1,' png '),(8,'kind',0,1,' image '),(8,'slug',0,1,''),(8,'title',0,1,' apple touch icon '),(9,'filename',0,1,' google png '),(9,'extension',0,1,' png '),(9,'kind',0,1,' image '),(9,'slug',0,1,''),(9,'title',0,1,' google '),(10,'filename',0,1,' forward chevron svg '),(10,'extension',0,1,' svg '),(10,'kind',0,1,' image '),(10,'slug',0,1,''),(10,'title',0,1,' forward chevron '),(11,'filename',0,1,' fb svg '),(11,'extension',0,1,' svg '),(11,'kind',0,1,' image '),(11,'slug',0,1,''),(11,'title',0,1,' fb '),(12,'filename',0,1,' fb png '),(12,'extension',0,1,' png '),(12,'kind',0,1,' image '),(12,'slug',0,1,''),(12,'title',0,1,' fb '),(13,'filename',0,1,' facebook icon svg '),(13,'extension',0,1,' svg '),(13,'kind',0,1,' image '),(13,'slug',0,1,''),(13,'title',0,1,' facebook icon '),(14,'filename',0,1,' edu svg '),(14,'extension',0,1,' svg '),(14,'kind',0,1,' image '),(14,'slug',0,1,''),(14,'title',0,1,' edu '),(15,'filename',0,1,' contact arrow svg '),(15,'extension',0,1,' svg '),(15,'kind',0,1,' image '),(15,'slug',0,1,''),(15,'title',0,1,' contact arrow '),(16,'filename',0,1,' commit logo svg '),(16,'extension',0,1,' svg '),(16,'kind',0,1,' image '),(16,'slug',0,1,''),(16,'title',0,1,' commit logo '),(17,'filename',0,1,' information svg '),(17,'extension',0,1,' svg '),(17,'kind',0,1,' image '),(17,'slug',0,1,''),(17,'title',0,1,' information '),(18,'filename',0,1,' commit logo 2 svg '),(18,'extension',0,1,' svg '),(18,'kind',0,1,' image '),(18,'slug',0,1,''),(18,'title',0,1,' commit logo 2 '),(19,'filename',0,1,' commit foundation_transition mentoring workshops_trajectory jpg '),(19,'extension',0,1,' jpg '),(19,'kind',0,1,' image '),(19,'slug',0,1,''),(19,'title',0,1,' commit foundation transition mentoring workshops trajectory '),(20,'filename',0,1,' commit foundation_transition mentoring workshops_pursuit jpg '),(20,'extension',0,1,' jpg '),(20,'kind',0,1,' image '),(20,'slug',0,1,''),(20,'title',0,1,' commit foundation transition mentoring workshops pursuit '),(21,'filename',0,1,' commit foundation_transition mentoring workshops_mentorship jpg '),(21,'extension',0,1,' jpg '),(21,'kind',0,1,' image '),(21,'slug',0,1,''),(21,'title',0,1,' commit foundation transition mentoring workshops mentorship '),(22,'filename',0,1,' commit foundation_transition mentoring workshops_map png '),(22,'extension',0,1,' png '),(22,'kind',0,1,' image '),(22,'slug',0,1,''),(22,'title',0,1,' commit foundation transition mentoring workshops map '),(23,'filename',0,1,' commit foundation_transition mentoring workshops_map jpg '),(23,'extension',0,1,' jpg '),(23,'kind',0,1,' image '),(23,'slug',0,1,''),(23,'title',0,1,' commit foundation transition mentoring workshops map '),(24,'filename',0,1,' commit foundation_transition mentoring workshops_changin perception jpg '),(24,'extension',0,1,' jpg '),(24,'kind',0,1,' image '),(24,'slug',0,1,''),(24,'title',0,1,' commit foundation transition mentoring workshops changin perception '),(25,'filename',0,1,' commit foundation_transition mentoring workshops_banner jpg '),(25,'extension',0,1,' jpg '),(25,'kind',0,1,' image '),(25,'slug',0,1,''),(25,'title',0,1,' commit foundation transition mentoring workshops banner '),(26,'filename',0,1,' commit foundation_transition mentoring workshops_attend jpg '),(26,'extension',0,1,' jpg '),(26,'kind',0,1,' image '),(26,'slug',0,1,''),(26,'title',0,1,' commit foundation transition mentoring workshops attend '),(27,'filename',0,1,' commit foundation_team_banner jpg '),(27,'extension',0,1,' jpg '),(27,'kind',0,1,' image '),(27,'slug',0,1,''),(27,'title',0,1,' commit foundation team banner '),(28,'filename',0,1,' imagination svg '),(28,'extension',0,1,' svg '),(28,'kind',0,1,' image '),(28,'slug',0,1,''),(28,'title',0,1,' imagination '),(29,'filename',0,1,' left arrow red svg '),(29,'extension',0,1,' svg '),(29,'kind',0,1,' image '),(29,'slug',0,1,''),(29,'title',0,1,' left arrow red '),(30,'filename',0,1,' commit foundation_partners_banner jpg '),(30,'extension',0,1,' jpg '),(30,'kind',0,1,' image '),(30,'slug',0,1,''),(30,'title',0,1,' commit foundation partners banner '),(31,'filename',0,1,' quotation white svg '),(31,'extension',0,1,' svg '),(31,'kind',0,1,' image '),(31,'slug',0,1,''),(31,'title',0,1,' quotation white '),(32,'filename',0,1,' vertical rule svg '),(32,'extension',0,1,' svg '),(32,'kind',0,1,' image '),(32,'slug',0,1,''),(32,'title',0,1,' vertical rule '),(33,'filename',0,1,' vertical rule blue svg '),(33,'extension',0,1,' svg '),(33,'kind',0,1,' image '),(33,'slug',0,1,''),(33,'title',0,1,' vertical rule blue '),(34,'filename',0,1,' twitter svg '),(34,'extension',0,1,' svg '),(34,'kind',0,1,' image '),(34,'slug',0,1,''),(34,'title',0,1,' twitter '),(35,'filename',0,1,' twitter png '),(35,'extension',0,1,' png '),(35,'kind',0,1,' image '),(35,'slug',0,1,''),(35,'title',0,1,' twitter '),(36,'filename',0,1,' twitter icon svg '),(36,'extension',0,1,' svg '),(36,'kind',0,1,' image '),(36,'slug',0,1,''),(36,'title',0,1,' twitter icon '),(37,'filename',0,1,' slider controls svg '),(37,'extension',0,1,' svg '),(37,'kind',0,1,' image '),(37,'slug',0,1,''),(37,'title',0,1,' slider controls '),(38,'filename',0,1,' right arrow svg '),(38,'extension',0,1,' svg '),(38,'kind',0,1,' image '),(38,'slug',0,1,''),(38,'title',0,1,' right arrow '),(39,'filename',0,1,' right arrow blue svg '),(39,'extension',0,1,' svg '),(39,'kind',0,1,' image '),(39,'slug',0,1,''),(39,'title',0,1,' right arrow blue '),(40,'filename',0,1,' retain svg '),(40,'extension',0,1,' svg '),(40,'kind',0,1,' image '),(40,'slug',0,1,''),(40,'title',0,1,' retain '),(41,'filename',0,1,' quote slider controls svg '),(41,'extension',0,1,' svg '),(41,'kind',0,1,' image '),(41,'slug',0,1,''),(41,'title',0,1,' quote slider controls '),(42,'filename',0,1,' quotation red svg '),(42,'extension',0,1,' svg '),(42,'kind',0,1,' image '),(42,'slug',0,1,''),(42,'title',0,1,' quotation red '),(43,'filename',0,1,' lib svg '),(43,'extension',0,1,' svg '),(43,'kind',0,1,' image '),(43,'slug',0,1,''),(43,'title',0,1,' lib '),(44,'filename',0,1,' mobile slider controls svg '),(44,'extension',0,1,' svg '),(44,'kind',0,1,' image '),(44,'slug',0,1,''),(44,'title',0,1,' mobile slider controls '),(45,'filename',0,1,' mobile quote slider controls svg '),(45,'extension',0,1,' svg '),(45,'kind',0,1,' image '),(45,'slug',0,1,''),(45,'title',0,1,' mobile quote slider controls '),(46,'filename',0,1,' mobile commit circle svg '),(46,'extension',0,1,' svg '),(46,'kind',0,1,' image '),(46,'slug',0,1,''),(46,'title',0,1,' mobile commit circle '),(47,'filename',0,1,' mission icon svg '),(47,'extension',0,1,' svg '),(47,'kind',0,1,' image '),(47,'slug',0,1,''),(47,'title',0,1,' mission icon '),(48,'filename',0,1,' ma_square png '),(48,'extension',0,1,' png '),(48,'kind',0,1,' image '),(48,'slug',0,1,''),(48,'title',0,1,' ma square '),(49,'filename',0,1,' login icon svg '),(49,'extension',0,1,' svg '),(49,'kind',0,1,' image '),(49,'slug',0,1,''),(49,'title',0,1,' login icon '),(50,'filename',0,1,' linkedin icon svg '),(50,'extension',0,1,' svg '),(50,'kind',0,1,' image '),(50,'slug',0,1,''),(50,'title',0,1,' linkedin icon '),(51,'filename',0,1,' linked in svg '),(51,'extension',0,1,' svg '),(51,'kind',0,1,' image '),(51,'slug',0,1,''),(51,'title',0,1,' linked in '),(52,'filename',0,1,' linked in png '),(52,'extension',0,1,' png '),(52,'kind',0,1,' image '),(52,'slug',0,1,''),(52,'title',0,1,' linked in '),(53,'filename',0,1,' commit foundation_partners_footer jpg '),(53,'extension',0,1,' jpg '),(53,'kind',0,1,' image '),(53,'slug',0,1,''),(53,'title',0,1,' commit foundation partners footer '),(54,'filename',0,1,' google svg '),(54,'extension',0,1,' svg '),(54,'kind',0,1,' image '),(54,'slug',0,1,''),(54,'title',0,1,' google '),(55,'filename',0,1,' commit foundation_partners_article1 jpg '),(55,'extension',0,1,' jpg '),(55,'kind',0,1,' image '),(55,'slug',0,1,''),(55,'title',0,1,' commit foundation partners article1 '),(56,'filename',0,1,' commit foundation_digital library_dl 2 jpg '),(56,'extension',0,1,' jpg '),(56,'kind',0,1,' image '),(56,'slug',0,1,''),(56,'title',0,1,' commit foundation digital library dl 2 '),(57,'filename',0,1,' commit foundation_digital library_study jpg '),(57,'extension',0,1,' jpg '),(57,'kind',0,1,' image '),(57,'slug',0,1,''),(57,'title',0,1,' commit foundation digital library study '),(58,'filename',0,1,' commit foundation_digital library_footer jpg '),(58,'extension',0,1,' jpg '),(58,'kind',0,1,' image '),(58,'slug',0,1,''),(58,'title',0,1,' commit foundation digital library footer '),(59,'filename',0,1,' commit foundation_digital library_dl 9 jpg '),(59,'extension',0,1,' jpg '),(59,'kind',0,1,' image '),(59,'slug',0,1,''),(59,'title',0,1,' commit foundation digital library dl 9 '),(60,'filename',0,1,' commit foundation_digital library_dl 8 jpg '),(60,'extension',0,1,' jpg '),(60,'kind',0,1,' image '),(60,'slug',0,1,''),(60,'title',0,1,' commit foundation digital library dl 8 '),(61,'filename',0,1,' commit foundation_digital library_dl 7 jpg '),(61,'extension',0,1,' jpg '),(61,'kind',0,1,' image '),(61,'slug',0,1,''),(61,'title',0,1,' commit foundation digital library dl 7 '),(62,'filename',0,1,' commit foundation_one to transition_assistance jpg '),(62,'extension',0,1,' jpg '),(62,'kind',0,1,' image '),(62,'slug',0,1,''),(62,'title',0,1,' commit foundation one to transition assistance '),(63,'filename',0,1,' commit foundation_digital library_dl 6 jpg '),(63,'extension',0,1,' jpg '),(63,'kind',0,1,' image '),(63,'slug',0,1,''),(63,'title',0,1,' commit foundation digital library dl 6 '),(64,'filename',0,1,' commit foundation_digital library_dl 5 jpg '),(64,'extension',0,1,' jpg '),(64,'kind',0,1,' image '),(64,'slug',0,1,''),(64,'title',0,1,' commit foundation digital library dl 5 '),(65,'filename',0,1,' commit foundation_digital library_dl 4 jpg '),(65,'extension',0,1,' jpg '),(65,'kind',0,1,' image '),(65,'slug',0,1,''),(65,'title',0,1,' commit foundation digital library dl 4 '),(66,'filename',0,1,' commit foundation_digital library_dl 3 jpg '),(66,'extension',0,1,' jpg '),(66,'kind',0,1,' image '),(66,'slug',0,1,''),(66,'title',0,1,' commit foundation digital library dl 3 '),(67,'filename',0,1,' commit foundation_digital library_dl 1 jpg '),(67,'extension',0,1,' jpg '),(67,'kind',0,1,' image '),(67,'slug',0,1,''),(67,'title',0,1,' commit foundation digital library dl 1 '),(68,'filename',0,1,' commit foundation_donate_2500 jpg '),(68,'extension',0,1,' jpg '),(68,'kind',0,1,' image '),(68,'slug',0,1,''),(68,'title',0,1,' commit foundation donate 2500 '),(69,'filename',0,1,' commit foundation_digital library_banner jpg '),(69,'extension',0,1,' jpg '),(69,'kind',0,1,' image '),(69,'slug',0,1,''),(69,'title',0,1,' commit foundation digital library banner '),(70,'filename',0,1,' commit foundation_corporate education_miconceptions jpg '),(70,'extension',0,1,' jpg '),(70,'kind',0,1,' image '),(70,'slug',0,1,''),(70,'title',0,1,' commit foundation corporate education miconceptions '),(71,'filename',0,1,' commit foundation_corporate education_footer jpg '),(71,'extension',0,1,' jpg '),(71,'kind',0,1,' image '),(71,'slug',0,1,''),(71,'title',0,1,' commit foundation corporate education footer '),(72,'filename',0,1,' commit foundation_corporate education_banner jpg '),(72,'extension',0,1,' jpg '),(72,'kind',0,1,' image '),(72,'slug',0,1,''),(72,'title',0,1,' commit foundation corporate education banner '),(73,'filename',0,1,' commit foundation_contact_shake jpg '),(73,'extension',0,1,' jpg '),(73,'kind',0,1,' image '),(73,'slug',0,1,''),(73,'title',0,1,' commit foundation contact shake '),(74,'filename',0,1,' commit foundation_contact_banner png '),(74,'extension',0,1,' png '),(74,'kind',0,1,' image '),(74,'slug',0,1,''),(74,'title',0,1,' commit foundation contact banner '),(75,'filename',0,1,' commit foundation_contact_banner jpg '),(75,'extension',0,1,' jpg '),(75,'kind',0,1,' image '),(75,'slug',0,1,''),(75,'title',0,1,' commit foundation contact banner '),(76,'filename',0,1,' commit circle svg '),(76,'extension',0,1,' svg '),(76,'kind',0,1,' image '),(76,'slug',0,1,''),(76,'title',0,1,' commit circle '),(77,'filename',0,1,' calendar icon svg '),(77,'extension',0,1,' svg '),(77,'kind',0,1,' image '),(77,'slug',0,1,''),(77,'title',0,1,' calendar icon '),(78,'filename',0,1,' back chevron svg '),(78,'extension',0,1,' svg '),(78,'kind',0,1,' image '),(78,'slug',0,1,''),(78,'title',0,1,' back chevron '),(79,'filename',0,1,' apply icon svg '),(79,'extension',0,1,' svg '),(79,'kind',0,1,' image '),(79,'slug',0,1,''),(79,'title',0,1,' apply icon '),(80,'filename',0,1,' commit foundation_donate_100 jpg '),(80,'extension',0,1,' jpg '),(80,'kind',0,1,' image '),(80,'slug',0,1,''),(80,'title',0,1,' commit foundation donate 100 '),(81,'filename',0,1,' vimeo icon svg '),(81,'extension',0,1,' svg '),(81,'kind',0,1,' image '),(81,'slug',0,1,''),(81,'title',0,1,' vimeo icon '),(82,'filename',0,1,' commit foundation_donate_500 jpg '),(82,'extension',0,1,' jpg '),(82,'kind',0,1,' image '),(82,'slug',0,1,''),(82,'title',0,1,' commit foundation donate 500 '),(83,'filename',0,1,' commit foundation_news big jpg '),(83,'extension',0,1,' jpg '),(83,'kind',0,1,' image '),(83,'slug',0,1,''),(83,'title',0,1,' commit foundation news big '),(84,'filename',0,1,' commit foundation_donate_banner jpg '),(84,'extension',0,1,' jpg '),(84,'kind',0,1,' image '),(84,'slug',0,1,''),(84,'title',0,1,' commit foundation donate banner '),(85,'filename',0,1,' commit foundation_mentor_banner jpg '),(85,'extension',0,1,' jpg '),(85,'kind',0,1,' image '),(85,'slug',0,1,''),(85,'title',0,1,' commit foundation mentor banner '),(86,'filename',0,1,' commit foundation_mentor_encouraging jpg '),(86,'extension',0,1,' jpg '),(86,'kind',0,1,' image '),(86,'slug',0,1,''),(86,'title',0,1,' commit foundation mentor encouraging '),(87,'filename',0,1,' commit foundation_mentor_honest jpg '),(87,'extension',0,1,' jpg '),(87,'kind',0,1,' image '),(87,'slug',0,1,''),(87,'title',0,1,' commit foundation mentor honest '),(88,'filename',0,1,' commit foundation_home_news jpg '),(88,'extension',0,1,' jpg '),(88,'kind',0,1,' image '),(88,'slug',0,1,''),(88,'title',0,1,' commit foundation home news '),(89,'filename',0,1,' commit foundation_mission_banner jpg '),(89,'extension',0,1,' jpg '),(89,'kind',0,1,' image '),(89,'slug',0,1,''),(89,'title',0,1,' commit foundation mission banner '),(90,'filename',0,1,' commit foundation_mission_flag jpg '),(90,'extension',0,1,' jpg '),(90,'kind',0,1,' image '),(90,'slug',0,1,''),(90,'title',0,1,' commit foundation mission flag '),(91,'filename',0,1,' commit foundation_mission_objective jpg '),(91,'extension',0,1,' jpg '),(91,'kind',0,1,' image '),(91,'slug',0,1,''),(91,'title',0,1,' commit foundation mission objective '),(92,'filename',0,1,' commit foundation_mission_support jpg '),(92,'extension',0,1,' jpg '),(92,'kind',0,1,' image '),(92,'slug',0,1,''),(92,'title',0,1,' commit foundation mission support '),(93,'filename',0,1,' commit foundation_news article3 jpg '),(93,'extension',0,1,' jpg '),(93,'kind',0,1,' image '),(93,'slug',0,1,''),(93,'title',0,1,' commit foundation news article3 '),(94,'filename',0,1,' commit foundation_mission_big jpg '),(94,'extension',0,1,' jpg '),(94,'kind',0,1,' image '),(94,'slug',0,1,''),(94,'title',0,1,' commit foundation mission big '),(95,'filename',0,1,' commit foundation_news_article2 jpg '),(95,'extension',0,1,' jpg '),(95,'kind',0,1,' image '),(95,'slug',0,1,''),(95,'title',0,1,' commit foundation news article2 '),(96,'filename',0,1,' commit foundation_home_corporate_education jpg '),(96,'extension',0,1,' jpg '),(96,'kind',0,1,' image '),(96,'slug',0,1,''),(96,'title',0,1,' commit foundation home corporate education '),(97,'filename',0,1,' commit foundation_events_banner jpg '),(97,'extension',0,1,' jpg '),(97,'kind',0,1,' image '),(97,'slug',0,1,''),(97,'title',0,1,' commit foundation events banner '),(98,'filename',0,1,' commit foundation_news_banner jpg '),(98,'extension',0,1,' jpg '),(98,'kind',0,1,' image '),(98,'slug',0,1,''),(98,'title',0,1,' commit foundation news banner '),(99,'filename',0,1,' commit foundation_home_aims jpg '),(99,'extension',0,1,' jpg '),(99,'kind',0,1,' image '),(99,'slug',0,1,''),(99,'title',0,1,' commit foundation home aims '),(100,'filename',0,1,' commit foundation_home_banner jpg '),(100,'extension',0,1,' jpg '),(100,'kind',0,1,' image '),(100,'slug',0,1,''),(100,'title',0,1,' commit foundation home banner '),(101,'filename',0,1,' commit foundation_home_event example jpg '),(101,'extension',0,1,' jpg '),(101,'kind',0,1,' image '),(101,'slug',0,1,''),(101,'title',0,1,' commit foundation home event example '),(102,'filename',0,1,' commit foundation_one to one_skills jpg '),(102,'extension',0,1,' jpg '),(102,'kind',0,1,' image '),(102,'slug',0,1,''),(102,'title',0,1,' commit foundation one to one skills '),(103,'filename',0,1,' commit foundation_one to one_engaged jpg '),(103,'extension',0,1,' jpg '),(103,'kind',0,1,' image '),(103,'slug',0,1,''),(103,'title',0,1,' commit foundation one to one engaged '),(104,'filename',0,1,' commit foundation_one to one_career choices jpg '),(104,'extension',0,1,' jpg '),(104,'kind',0,1,' image '),(104,'slug',0,1,''),(104,'title',0,1,' commit foundation one to one career choices '),(105,'filename',0,1,' commit foundation_one to mentors jpg '),(105,'extension',0,1,' jpg '),(105,'kind',0,1,' image '),(105,'slug',0,1,''),(105,'title',0,1,' commit foundation one to mentors '),(106,'filename',0,1,' commit foundation_one to banner jpg '),(106,'extension',0,1,' jpg '),(106,'kind',0,1,' image '),(106,'slug',0,1,''),(106,'title',0,1,' commit foundation one to banner '),(107,'filename',0,1,' tripletree png '),(107,'extension',0,1,' png '),(107,'kind',0,1,' image '),(107,'slug',0,1,''),(107,'title',0,1,' tripletree '),(108,'filename',0,1,' sixthwing png '),(108,'extension',0,1,' png '),(108,'kind',0,1,' image '),(108,'slug',0,1,''),(108,'title',0,1,' sixthwing '),(109,'filename',0,1,' standford png '),(109,'extension',0,1,' png '),(109,'kind',0,1,' image '),(109,'slug',0,1,''),(109,'title',0,1,' standford '),(110,'filename',0,1,' suntrust png '),(110,'extension',0,1,' png '),(110,'kind',0,1,' image '),(110,'slug',0,1,''),(110,'title',0,1,' suntrust '),(111,'filename',0,1,' thestation png '),(111,'extension',0,1,' png '),(111,'kind',0,1,' image '),(111,'slug',0,1,''),(111,'title',0,1,' thestation '),(112,'filename',0,1,' zachjohaneson png '),(112,'extension',0,1,' png '),(112,'kind',0,1,' image '),(112,'slug',0,1,''),(112,'title',0,1,' zachjohaneson '),(113,'filename',0,1,' tuckschool png '),(113,'extension',0,1,' png '),(113,'kind',0,1,' image '),(113,'slug',0,1,''),(113,'title',0,1,' tuckschool '),(114,'filename',0,1,' weinbergfoundation png '),(114,'extension',0,1,' png '),(114,'kind',0,1,' image '),(114,'slug',0,1,''),(114,'title',0,1,' weinbergfoundation '),(115,'filename',0,1,' whitefishveterans png '),(115,'extension',0,1,' png '),(115,'kind',0,1,' image '),(115,'slug',0,1,''),(115,'title',0,1,' whitefishveterans '),(116,'filename',0,1,' whiteford png '),(116,'extension',0,1,' png '),(116,'kind',0,1,' image '),(116,'slug',0,1,''),(116,'title',0,1,' whiteford '),(117,'filename',0,1,' wt png '),(117,'extension',0,1,' png '),(117,'kind',0,1,' image '),(117,'slug',0,1,''),(117,'title',0,1,' wt '),(118,'filename',0,1,' signsofgreat png '),(118,'extension',0,1,' png '),(118,'kind',0,1,' image '),(118,'slug',0,1,''),(118,'title',0,1,' signsofgreat '),(119,'filename',0,1,' sinclair png '),(119,'extension',0,1,' png '),(119,'kind',0,1,' image '),(119,'slug',0,1,''),(119,'title',0,1,' sinclair '),(120,'filename',0,1,' riverside png '),(120,'extension',0,1,' png '),(120,'kind',0,1,' image '),(120,'slug',0,1,''),(120,'title',0,1,' riverside '),(121,'filename',0,1,' salmonfoundation png '),(121,'extension',0,1,' png '),(121,'kind',0,1,' image '),(121,'slug',0,1,''),(121,'title',0,1,' salmonfoundation '),(122,'filename',0,1,' greenspring png '),(122,'extension',0,1,' png '),(122,'kind',0,1,' image '),(122,'slug',0,1,''),(122,'title',0,1,' greenspring '),(123,'filename',0,1,' aerotek png '),(123,'extension',0,1,' png '),(123,'kind',0,1,' image '),(123,'slug',0,1,''),(123,'title',0,1,' aerotek '),(124,'filename',0,1,' alisoncarroll png '),(124,'extension',0,1,' png '),(124,'kind',0,1,' image '),(124,'slug',0,1,''),(124,'title',0,1,' alisoncarroll '),(125,'filename',0,1,' andreessen png '),(125,'extension',0,1,' png '),(125,'kind',0,1,' image '),(125,'slug',0,1,''),(125,'title',0,1,' andreessen '),(126,'filename',0,1,' bcg png '),(126,'extension',0,1,' png '),(126,'kind',0,1,' image '),(126,'slug',0,1,''),(126,'title',0,1,' bcg '),(127,'filename',0,1,' bobwood png '),(127,'extension',0,1,' png '),(127,'kind',0,1,' image '),(127,'slug',0,1,''),(127,'title',0,1,' bobwood '),(128,'filename',0,1,' brownadvisory png '),(128,'extension',0,1,' png '),(128,'kind',0,1,' image '),(128,'slug',0,1,''),(128,'title',0,1,' brownadvisory '),(129,'filename',0,1,' clarkfoundation png '),(129,'extension',0,1,' png '),(129,'kind',0,1,' image '),(129,'slug',0,1,''),(129,'title',0,1,' clarkfoundation '),(130,'filename',0,1,' clearing png '),(130,'extension',0,1,' png '),(130,'kind',0,1,' image '),(130,'slug',0,1,''),(130,'title',0,1,' clearing '),(131,'filename',0,1,' cowen png '),(131,'extension',0,1,' png '),(131,'kind',0,1,' image '),(131,'slug',0,1,''),(131,'title',0,1,' cowen '),(132,'filename',0,1,' generaldynamics png '),(132,'extension',0,1,' png '),(132,'kind',0,1,' image '),(132,'slug',0,1,''),(132,'title',0,1,' generaldynamics '),(133,'filename',0,1,' gianforte png '),(133,'extension',0,1,' png '),(133,'kind',0,1,' image '),(133,'slug',0,1,''),(133,'title',0,1,' gianforte '),(134,'filename',0,1,' goldmansachs png '),(134,'extension',0,1,' png '),(134,'kind',0,1,' image '),(134,'slug',0,1,''),(134,'title',0,1,' goldmansachs '),(135,'filename',0,1,' gotyoursix png '),(135,'extension',0,1,' png '),(135,'kind',0,1,' image '),(135,'slug',0,1,''),(135,'title',0,1,' gotyoursix '),(136,'filename',0,1,' howestreet png '),(136,'extension',0,1,' png '),(136,'kind',0,1,' image '),(136,'slug',0,1,''),(136,'title',0,1,' howestreet '),(137,'filename',0,1,' rosenberg png '),(137,'extension',0,1,' png '),(137,'kind',0,1,' image '),(137,'slug',0,1,''),(137,'title',0,1,' rosenberg '),(138,'filename',0,1,' johnnymac png '),(138,'extension',0,1,' png '),(138,'kind',0,1,' image '),(138,'slug',0,1,''),(138,'title',0,1,' johnnymac '),(139,'filename',0,1,' marcandlara png '),(139,'extension',0,1,' png '),(139,'kind',0,1,' image '),(139,'slug',0,1,''),(139,'title',0,1,' marcandlara '),(140,'filename',0,1,' missionbbq png '),(140,'extension',0,1,' png '),(140,'kind',0,1,' image '),(140,'slug',0,1,''),(140,'title',0,1,' missionbbq '),(141,'filename',0,1,' mtbank png '),(141,'extension',0,1,' png '),(141,'kind',0,1,' image '),(141,'slug',0,1,''),(141,'title',0,1,' mtbank '),(142,'filename',0,1,' navyseal png '),(142,'extension',0,1,' png '),(142,'kind',0,1,' image '),(142,'slug',0,1,''),(142,'title',0,1,' navyseal '),(143,'filename',0,1,' nexgen png '),(143,'extension',0,1,' png '),(143,'kind',0,1,' image '),(143,'slug',0,1,''),(143,'title',0,1,' nexgen '),(144,'filename',0,1,' oxpoint png '),(144,'extension',0,1,' png '),(144,'kind',0,1,' image '),(144,'slug',0,1,''),(144,'title',0,1,' oxpoint '),(145,'filename',0,1,' palantir png '),(145,'extension',0,1,' png '),(145,'kind',0,1,' image '),(145,'slug',0,1,''),(145,'title',0,1,' palantir '),(146,'filename',0,1,' penny png '),(146,'extension',0,1,' png '),(146,'kind',0,1,' image '),(146,'slug',0,1,''),(146,'title',0,1,' penny '),(147,'filename',0,1,' plank png '),(147,'extension',0,1,' png '),(147,'kind',0,1,' image '),(147,'slug',0,1,''),(147,'title',0,1,' plank '),(148,'filename',0,1,' preventadvisors png '),(148,'extension',0,1,' png '),(148,'kind',0,1,' image '),(148,'slug',0,1,''),(148,'title',0,1,' preventadvisors '),(149,'filename',0,1,' pwc png '),(149,'extension',0,1,' png '),(149,'kind',0,1,' image '),(149,'slug',0,1,''),(149,'title',0,1,' pwc '),(150,'filename',0,1,' roberthalf png '),(150,'extension',0,1,' png '),(150,'kind',0,1,' image '),(150,'slug',0,1,''),(150,'title',0,1,' roberthalf '),(151,'filename',0,1,' guggenheim png '),(151,'extension',0,1,' png '),(151,'kind',0,1,' image '),(151,'slug',0,1,''),(151,'title',0,1,' guggenheim '),(154,'slug',0,1,''),(154,'extension',0,1,' pdf '),(154,'kind',0,1,' pdf '),(154,'filename',0,1,' commit 501c3 letter pdf '),(154,'title',0,1,' commit 501c3 letter '),(156,'slug',0,1,' homepage '),(156,'field',2,1,' helping america s top tier servicemembers and veterans find personal and professional purpose after military service '),(156,'field',1,1,' high touch high impact '),(156,'field',3,1,' the commit foundation is fundamentally changing the way servicemembers and veterans approach their transition from the military '),(156,'field',4,1,''),(156,'field',5,1,' misconceptions skill translation gaps and culture gaps may hinder many servicemembers and veterans from earning the right job and companies from hiring the right veteran '),(157,'slug',0,1,' 11 transition assistance '),(157,'title',0,1,' 1 1 transition assistance '),(157,'field',29,1,' commit meets you right where you are in transition let us help you build a plan that is tailored to your individual needs and timeline '),(157,'field',28,1,' one on one transition assistance '),(157,'field',30,1,' a highly individualized approach with an experienced executive coach using proven techniques to engage identify and resolve specific needs of a transitioning veteran '),(157,'field',31,1,''),(157,'field',32,1,' specifically designed and highly tailored programs '),(157,'field',33,1,' servicemembers and veterans who participate in one on one transition assistance receive highly individualized services before during and beyond their transition our unique blend of proprietary techniques and certified professional tools have been developed by commit over years of operation '),(157,'field',34,1,''),(157,'field',35,1,''),(157,'field',38,1,' focused career choices '),(157,'field',39,1,' commit focuses on quality over quantity through high touch high impact support after identifying your values and strengths commit helps you find career opportunities at the convergence of passion expertise and geography '),(157,'field',40,1,' strengths and skills '),(157,'field',41,1,' support includes strengths assessment values identification resume assistance executive coaching mentorship and scholarship assistance commit s approach is built on individual needs including both hard and soft skill personal development '),(157,'field',42,1,' commit leverages a vast network of successful alumni and leaders in corporate america to help support inform and guide servicemembers and veterans as they transition into the industries they are passionate about '),(156,'field',6,1,' commit helps servicemembers and veterans understand and articulate the value of their knowledge skills and abilities we help them understand how to transfer that value to a meaningful civilian career '),(156,'field',7,1,' commit helps servicemembers and veterans maintain their individual confidence throughout the transition process we provide the information and resources servicemembers and veterans need to self identify and understand their unique and personal value '),(156,'field',8,1,' commit enables servicemembers and veterans ability to rethink and redefine what is possible we encourage servicemembers and veterans to set high goals and then help to ensure they achieve them '),(156,'field',9,1,' thomas paul vogel in less than 48 hours commit truly set the foundation for my military transition to civilian life commit professionals provided unique tools information and contacts to execute my final military operation i am thankful for this organization and recommend it to america s best dana de coster the anxiety i was feeling about my civilian career transition has been replaced with excitement and enthusiasm thanks to commit and its mentors i can t wait to see where my journey after the military takes me george d hasseltine commit connected me with a diverse group of veterans and mentors who showed me new ways to develop and leverage my network while opening my eyes to opportunities i had never considered '),(156,'field',12,1,' commit aims to create serendipity for men and women transitioning from the military and entering corporate america '),(156,'field',13,1,' we provide tailored solutions to meet the personal needs of every individual we serve '),(156,'field',14,1,' a highly individualized approach with experienced executive coaches using proven techniques to identify and resolve specific needs of transitioning servicemembers and veterans '),(156,'field',15,1,' focus on goal setting life s decision points and powerful lessons that reinforce values family and the passionate pursuit of a meaningful career '),(156,'field',16,1,' study key insights and best practices from highly successful commit alumni and leaders in corporate america '),(156,'field',17,1,' true to our name we are committed to making significant long term impact in changing the way corporate america thinks about hiring and retaining veteran talent '),(156,'field',18,1,' we teach our partners how to effectively identify hire and retain veteran talent in order to improve business outcomes '),(158,'slug',0,1,' transition mentoring workshops '),(158,'title',0,1,' transition mentoring workshops '),(159,'slug',0,1,' mission '),(159,'title',0,1,' mission '),(159,'field',92,1,''),(159,'field',91,1,''),(159,'field',93,1,''),(159,'field',98,1,''),(159,'field',94,1,''),(159,'field',95,1,''),(159,'field',96,1,''),(159,'field',97,1,''),(159,'field',99,1,''),(159,'field',100,1,''),(159,'field',101,1,''),(159,'field',102,1,''),(159,'field',103,1,''),(159,'field',104,1,''),(159,'field',105,1,''),(159,'field',106,1,''),(159,'field',107,1,''),(159,'field',108,1,''),(160,'slug',0,1,' corporate education '),(160,'title',0,1,' corporate education '),(160,'field',69,1,''),(160,'field',68,1,''),(160,'field',70,1,''),(160,'field',71,1,''),(160,'field',72,1,''),(160,'field',73,1,''),(160,'field',74,1,''),(160,'field',80,1,''),(160,'field',81,1,''),(160,'field',82,1,''),(160,'field',75,1,''),(160,'field',77,1,''),(160,'field',83,1,''),(160,'field',84,1,''),(160,'field',85,1,''),(160,'field',89,1,''),(160,'field',90,1,''),(161,'slug',0,1,' digital library '),(161,'title',0,1,' digital library '),(161,'field',59,1,' the digital library provides a growing collection of videos on specific subjects transitioning servicemembers and veterans and corporate america find most critical or challenging to overcome '),(161,'field',58,1,' the digital library '),(161,'field',60,1,' study key insights and best practices from highly successful commit alumni and leaders in corporate america '),(161,'field',61,1,''),(161,'field',62,1,' the digital library '),(161,'field',63,1,' commit leverages a vast network of experienced professionals from corporate america to provide key insights on transferable skills interviewing networking mentorship leadership and much more '),(161,'field',64,1,''),(161,'field',65,1,' insights and industry interviews '),(161,'field',66,1,' while working to identify an industry to begin your new career commit s interviews with leaders from corporate america provide immediate insight into necessary skills expectations in the work environment and key tips for professional success '),(161,'field',67,1,''),(158,'field',44,1,' harnessing the power of our networks and relationships commit facilitates synergy between top tier servicemembers and veterans and seasoned professionals from the private sector '),(158,'field',43,1,' transition mentoring workshops '),(158,'field',45,1,' focus on values key decision points and powerful lessons that reinforce the importance of family and pursuing your passion when designing the life you want to live following your time in uniform '),(158,'field',46,1,' commit believes 30 minutes of quality dialogue can forever change the trajectory of an individual '),(158,'field',47,1,' workshops are specifically designed to provide servicemembers and veterans direct access to thoughtfully selected professionals and foster intimate environments where quality dialogue will occur '),(158,'field',48,1,''),(158,'field',49,1,''),(158,'field',52,1,' changing perception '),(158,'field',53,1,' led by professional executive coaches servicemembers and veterans work through a series of modules focused on values strengths culture and opportunities to change perspectives and improve trajectories '),(158,'field',54,1,' preparing trajectory '),(158,'field',55,1,' reinforcing integrity family and the passionate pursuit of a meaningful career servicemembers and veterans hear from and personally engage with successfully transitioned servicemembers and veterans and leaders from corporate america servicemembers and veterans and mentors have private meaningful conversations in environments where they flourish '),(158,'field',56,1,' we take a hard look at the industries interests and skills of workshop participants in order to align world class mentors from specific industries backgrounds and locations to provide game changing value '),(158,'field',57,1,' commit facilitates workshops nationwide allowing us to handpick perfect locations suited towards intimate working environments no matter where your location servicemembers and veterans from across the country are sponsored to attend commit workshops in cities best suited for their success '),(162,'slug',0,1,' mentors '),(162,'title',0,1,' mentors '),(162,'field',110,1,''),(162,'field',109,1,''),(162,'field',111,1,''),(162,'field',112,1,''),(162,'field',113,1,''),(162,'field',114,1,''),(162,'field',116,1,''),(162,'field',115,1,''),(162,'field',117,1,''),(162,'field',118,1,''),(163,'slug',0,1,' team '),(163,'title',0,1,' team '),(163,'field',120,1,''),(163,'field',119,1,''),(163,'field',121,1,''),(163,'field',125,1,''),(163,'field',129,1,''),(164,'slug',0,1,' partners '),(164,'title',0,1,' partners '),(164,'field',134,1,''),(164,'field',133,1,''),(164,'field',135,1,''),(164,'field',136,1,''),(156,'field',147,1,''),(165,'filename',0,1,' 46521519_10205415347698375_2277906965667512320_n jpg '),(165,'extension',0,1,' jpg '),(165,'kind',0,1,' image '),(165,'slug',0,1,''),(165,'title',0,1,' 46521519 10205415347698375 2277906965667512320 n '),(166,'slug',0,1,''),(166,'field',155,1,''),(166,'field',159,1,''),(167,'slug',0,1,' donate '),(167,'title',0,1,' donate '),(167,'field',137,1,''),(167,'field',138,1,''),(167,'field',139,1,''),(167,'field',142,1,''),(167,'field',143,1,''),(167,'field',145,1,''),(167,'field',146,1,''),(167,'field',148,1,''),(167,'field',150,1,''),(167,'field',149,1,''),(167,'field',151,1,''),(167,'field',152,1,''),(156,'field',168,1,' christian andrew moree '),(156,'field',167,1,' commit is a deeply sophisticated and nuanced provider of veteran transition services their integrity and investment in veterans journeys is a best in class benchmark to which all vsos should strive '),(168,'field',10,1,' in less than 48 hours commit truly set the foundation for my military transition to civilian life commit professionals provided unique tools information and contacts to execute my final military operation i am thankful for this organization and recommend it to america s best '),(168,'field',11,1,' thomas paul vogel '),(168,'slug',0,1,''),(169,'field',10,1,' the anxiety i was feeling about my civilian career transition has been replaced with excitement and enthusiasm thanks to commit and its mentors i can t wait to see where my journey after the military takes me '),(169,'field',11,1,' dana de coster '),(169,'slug',0,1,''),(170,'field',10,1,' commit connected me with a diverse group of veterans and mentors who showed me new ways to develop and leverage my network while opening my eyes to opportunities i had never considered '),(170,'field',11,1,' george d hasseltine '),(170,'slug',0,1,''),(157,'field',169,1,' this was a unique opportunity that has significantly raised my confidence that when it s time to transition i will have great options the staff and mentors were very knowledgeable and passionate about helping us prepare i am thankful for commit '),(157,'field',170,1,' william waynick ii '),(158,'field',171,1,' the commit workshop i attended went above and beyond what i thought it could provide every topic covered relevant information that helped me see the transition process in a new light overall one of the best takeaways was the importance of translating learned skills in the military into relevant skills in the civilian sector as well as how critical some of them are '),(158,'field',172,1,' brian m bradley '),(158,'field',173,1,' it s impossible to overstate how important commit and the workshops are to a successful transition from military service the discussions were at the right level targeting individuals who want to continue performing at a high level post transition in addition to refining important skills like networking the workshop provided opportunities to have candid discussions with long time industry professionals about important topics like corporate culture and career planning an exceptional event and highly recommended '),(158,'field',174,1,' andrew ries '),(160,'field',175,1,''),(160,'field',176,1,''),(160,'field',177,1,''),(160,'field',178,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_handle_unq_idx` (`handle`),
  UNIQUE KEY `sections_name_unq_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (2,NULL,'Homepage','homepage','single',1,1,'2018-11-24 23:00:32','2018-11-24 23:00:32','08d72396-7555-4ef4-bc92-a4fc7ac597ce'),(3,NULL,'Events','events','channel',1,1,'2018-11-24 23:18:14','2018-11-26 23:14:31','bf7b46bb-918f-4a22-82fe-8cc20d84905c'),(4,NULL,'1:1 Transition Assistance','transitionAssistance','single',1,1,'2018-11-24 23:46:00','2018-11-24 23:46:00','875052f4-e189-488c-aaee-b74fd5bf7fce'),(5,NULL,'Transition Mentoring Workshops','transitionMentoringWorkshops','single',1,1,'2018-11-25 00:00:49','2018-11-25 18:53:44','99a4ba13-6619-45e9-a924-98d4e62b4a7f'),(6,NULL,'Mission','mission','single',1,1,'2018-11-25 18:49:17','2018-11-25 18:49:17','2fba4990-4cf5-4750-bbfd-043362b9e1d1'),(7,NULL,'Corporate Education','corporateEducation','single',1,1,'2018-11-25 18:51:25','2018-11-25 18:51:25','d99c4184-ab82-4554-bdf9-fd3b954136b4'),(8,NULL,'Digital Library','digitalLibrary','single',1,1,'2018-11-25 18:53:03','2018-11-25 18:53:03','03214785-f2fb-44fe-bc2a-6ce82023003a'),(9,NULL,'Mentors','mentors','single',1,1,'2018-11-25 19:13:39','2018-11-25 19:13:39','5c441adb-b8f7-4667-9bed-4e75baa22565'),(10,NULL,'Team','team','single',1,1,'2018-11-25 19:17:20','2018-11-25 19:17:20','c36fd8fc-a115-41d9-8a3a-08d9f8af3ce9'),(11,NULL,'Partners','partners','single',1,1,'2018-11-25 19:24:21','2018-11-25 19:24:21','1976eb7a-b798-43eb-9058-30c7a1eeef90'),(12,NULL,'News','news','channel',1,1,'2018-11-26 23:14:47','2018-11-26 23:14:47','5b5ef12e-b136-4aa2-9a1a-e0aabf1afb77'),(13,NULL,'Donate','donate','single',1,1,'2018-11-26 23:17:14','2018-11-26 23:17:14','2585cc21-f14c-4000-a056-5a1c2a83bb4a');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (2,2,1,1,'homepage','homepage/_entry',1,'2018-11-24 23:00:32','2018-11-24 23:00:32','7327bbf7-2e5e-451d-9a58-ca8f096e451a'),(3,3,1,1,'upcoming-events/{slug}','upcoming-events/_entry',1,'2018-11-24 23:18:14','2018-11-26 23:14:31','3be37102-3182-476f-935e-ce32a9ed3fa8'),(4,4,1,1,'transition-assistance','transition-assistance/_entry',1,'2018-11-24 23:46:00','2018-11-24 23:46:00','ef1577d3-ead6-4698-8b7b-e7c4753127c9'),(5,5,1,1,'transition-mentoring-workshops','transition-mentoring-workshops/_entry',1,'2018-11-25 00:00:49','2018-11-25 18:53:44','6da29d72-d142-4d9f-bede-85867d7b02fa'),(6,6,1,1,'mission','mission/_entry',1,'2018-11-25 18:49:17','2018-11-25 18:49:17','c4666668-6a92-410c-8461-dd48bd0b7f46'),(7,7,1,1,'corporate-education','corporate-education/_entry',1,'2018-11-25 18:51:25','2018-11-25 18:51:25','d2a5830b-1f6f-42dc-80a0-c1f609f3ca3e'),(8,8,1,1,'digital-library','digital-library/_entry',1,'2018-11-25 18:53:03','2018-11-25 18:53:03','e4c4f2ab-663f-4d33-92e0-3b19697207bd'),(9,9,1,1,'mentors','mentors/_entry',1,'2018-11-25 19:13:39','2018-11-25 19:13:39','ba185737-e912-412d-bcde-5d7c52822a7d'),(10,10,1,1,'team','team/_entry',1,'2018-11-25 19:17:20','2018-11-25 19:17:20','63ebab3e-9b5e-49cf-b077-ee56b4d763e2'),(11,11,1,1,'partners','partners/_entry',1,'2018-11-25 19:24:21','2018-11-25 19:24:21','f139b8f6-6ca3-47d7-8833-dffcd6d15153'),(12,12,1,1,'news/{slug}','news/_entry',1,'2018-11-26 23:14:47','2018-11-26 23:14:47','408d914c-335b-4f2a-a95c-590cff9390ca'),(13,13,1,1,'donate','donate/_entry',1,'2018-11-26 23:17:14','2018-11-26 23:17:14','94cc88c0-1ce3-47a3-ac66-cc399101b901');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (2,1,'JFlhyS_98ZzHNeZH8cRI9ZiUThpKgZXCbT_s0olZhcAmgLXQwClfyrtTbFsSCfpN7b5k_k3kTw5HB1ovNEEIw8-VOsQBI_zHRlUy','2018-11-08 20:25:36','2018-11-08 23:47:50','de450aa1-a422-484d-b3df-cad87ed41566'),(3,1,'yCzLnzkECWfMhxgkCoiC8l04kcAiBZsWOap5-oqa-e8yF7xY_gtgxwxmjeW_eXZknwZu8lx0A9oZTiS74URnix6YpHINp2qJDkpd','2018-11-16 06:22:46','2018-11-16 06:54:17','fcaf2417-d6ab-4810-85e6-52283039e9a8'),(4,1,'KHxp7mIAy3fhHc2WeLO5z7BeS0EtjaRJgRI0gpObmPtX3O2cyJv9AMSryECVGBz9zkWn1wbrRAIK5zsYxd72f4jQy0GzG9krcBN6','2018-11-16 19:20:52','2018-11-16 20:16:22','08f9e7e3-f59a-4a27-8b8a-4659fbf54666'),(6,1,'xpK1CtfCbTQfJSVUAEfTENEaQsW06MeCDaAVIb1KiEctVIWxSWGEAdmaTPiLCkew0jqGin9sKRzf1f_BXdKw5katofwp_32ybuAk','2018-11-20 02:59:41','2018-11-20 03:32:15','9dd5699a-229f-4844-94e2-0426f29e5a68'),(9,1,'-fMB-P5RoJGcynxH1y_aWmXf2NradjnaaNq4x-NMNIhFYW5Fo5yjw-kQujKD0OzkMq8-pWuhlOJXwkBHuvrucXWvWHOFq9-6FwCR','2018-11-20 19:03:36','2018-11-20 19:28:29','b860b220-db28-4ab1-bf84-65899f976c88'),(10,1,'Dx-ByfGu3h526XzYdqK4URRHAxFiNJ2PwZuV7IauMt3dLboXRBpWd32f3gbplLaPr2f5IOLiqChG7RBM7RmuyObOq3UjRjXvR0qp','2018-11-20 22:17:59','2018-11-20 23:05:11','75b45612-ed9c-4650-81d7-396c46e52b1c'),(19,1,'zyBn55LfgItSsXySPKW-8KLiX4YLyaiZjtqSf6MytPWxpBNiPvMCWlc2tT4IqsAuOw-hsSiTQOU0_Wbj-w-XLy3Zj6Zv3A3UPPZt','2018-11-26 03:46:29','2018-11-26 03:57:15','947476a9-b645-4ea8-bcb1-d062879df8a3'),(25,1,'z2OQGu4tBoRHvhkQaSZs6QgAHjOqbTANBB_892W7Vc0U3yT-3fj9ctHHTBg5WjuGi7MgQRmxTkP9xkeGpqHVDllQe4_Nfqju-BqN','2018-11-27 06:49:24','2018-11-27 06:53:02','9c44f3ce-a885-4eca-92da-cd5633083446');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sitegroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'The COMMIT Foundation','2018-11-08 19:59:30','2018-11-08 19:59:30','750de3f4-db3f-4957-8009-13fd9c817183');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sites_handle_unq_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'The COMMIT Foundation','default','en-US',1,'@web/',1,'2018-11-08 19:59:30','2018-11-08 19:59:30','ffd1d8e5-e318-4f16-84d9-ddb9e4361308');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemsettings`
--

DROP TABLE IF EXISTS `systemsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemsettings`
--

LOCK TABLES `systemsettings` WRITE;
/*!40000 ALTER TABLE `systemsettings` DISABLE KEYS */;
INSERT INTO `systemsettings` VALUES (1,'email','{\"fromEmail\":\"paul@tripletreellc.com\",\"fromName\":\"The COMMIT Foundation\",\"transportType\":\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"}','2018-11-08 19:59:30','2018-11-08 19:59:30','4f03eae4-5714-46db-a863-861bf3104fbd');
/*!40000 ALTER TABLE `systemsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `taggroups_handle_unq_idx` (`handle`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,NULL,NULL,'paul@tripletreellc.com','$2y$13$IsFzoRlq0aaUK7.dzJoGdexOOuR2KQwFAZk4Dh3AJjZkeMo.9iu6O',1,0,0,0,'2018-11-27 06:49:24','216.166.171.67',NULL,NULL,'2018-11-20 19:01:01',NULL,1,NULL,NULL,NULL,0,'2018-11-08 19:59:30','2018-11-08 19:59:30','2018-11-27 06:49:24','1c065f23-1726-44e3-bdf6-d7926944c3cb');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2018-11-16 06:30:41','2018-11-26 22:55:13','696ca141-7aa4-4eca-ad68-6585c9b92295'),(2,NULL,NULL,'Temporary source',NULL,'2018-11-16 06:31:07','2018-11-16 06:31:07','e42f6fca-8fd1-49fa-b7ea-f9f59e9b48ff'),(3,2,NULL,'user_1','user_1/','2018-11-16 06:31:07','2018-11-16 06:31:07','566da075-9e7f-4974-8f28-a38259cfbbb6'),(4,1,1,'logos','logos/','2018-11-16 19:51:01','2018-11-16 19:51:01','d137b390-81ae-44d9-958d-fca74e1bc2f8'),(7,NULL,4,'Documents','','2018-11-20 01:29:34','2018-11-26 22:55:24','2db9d66b-46f7-47a5-b614-e5b8eb2943f3'),(8,NULL,5,'News Images','','2018-11-26 21:47:51','2018-11-26 21:47:51','94a9ed32-4a16-4081-919b-3daff94587bb'),(9,NULL,6,'Logos','','2018-11-26 22:55:00','2018-11-26 22:55:00','c4f0cf0b-9ef4-45c2-a15f-acb19c04c506'),(10,NULL,7,'Events Images','','2018-11-26 23:05:17','2018-11-26 23:05:17','4e60f489-a15d-4e8d-bf41-b8de973f93fa'),(11,NULL,8,'Icons','','2018-11-27 00:18:29','2018-11-27 00:18:29','fdee6f76-aa0b-4ff2-b03b-64a95674b956');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumes_name_unq_idx` (`name`),
  UNIQUE KEY `volumes_handle_unq_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,1,'Images','images','craft\\volumes\\Local',0,NULL,'{\"path\":\"/var/www/html/img/\"}',1,'2018-11-16 06:30:41','2018-11-26 22:55:40','5894875b-5343-48fb-afdc-928c9646456c'),(4,5,'Documents','documents','craft\\volumes\\Local',0,NULL,'{\"path\":\"/var/www/html/craft/web/pdf\"}',2,'2018-11-20 01:29:34','2018-11-26 22:55:24','3aefeb7c-3eff-4740-bfb4-b570a666cba7'),(5,28,'News Images','newsImages','craft\\volumes\\Local',0,NULL,'{\"path\":\"/var/www/html/img/news\"}',3,'2018-11-26 21:47:51','2018-11-26 21:47:51','eadc3a08-6372-4cb5-a5e0-b7fe1f0c5d62'),(6,33,'Logos','logos','craft\\volumes\\Local',0,NULL,'{\"path\":\"/var/www/html/img/logos\"}',4,'2018-11-26 22:55:00','2018-11-26 22:55:00','dbd18e11-fb8a-455b-ac63-af434224b2d9'),(7,34,'Events Images','eventsImages','craft\\volumes\\Local',0,NULL,'{\"path\":\"/var/www/html/img/events\"}',5,'2018-11-26 23:05:17','2018-11-26 23:05:17','ce2443f1-3e3a-4152-8af7-7821d238cace'),(8,37,'Icons','icons','craft\\volumes\\Local',0,NULL,'{\"path\":\"/var/www/html/img/icons\"}',6,'2018-11-27 00:18:29','2018-11-27 00:18:29','195bf362-5d0c-4c01-a435-3299af11e2f8');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,0,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2018-11-08 20:19:58','2018-11-08 20:19:58','bac4bdd5-9b65-402e-a3af-bbce52c30c52'),(2,1,'craft\\widgets\\CraftSupport',2,0,'[]',1,'2018-11-08 20:19:58','2018-11-08 20:19:58','9eb5cd0a-1b1a-4556-8ddf-0380c2dbccaf'),(3,1,'craft\\widgets\\Updates',3,0,'[]',1,'2018-11-08 20:19:58','2018-11-08 20:19:58','50b7f424-fe6e-4c35-9cea-c4898990da64'),(4,1,'craft\\widgets\\Feed',4,0,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2018-11-08 20:19:58','2018-11-08 20:19:58','278e1c13-e1eb-4e37-aa2d-1a03afec7dfe');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-24 23:05:31
