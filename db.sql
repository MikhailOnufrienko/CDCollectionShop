-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: cdcollectionshop
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_userbase`
--

DROP TABLE IF EXISTS `account_userbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_userbase` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_1` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `town_city` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_userbase`
--

LOCK TABLES `account_userbase` WRITE;
/*!40000 ALTER TABLE `account_userbase` DISABLE KEYS */;
INSERT INTO `account_userbase` VALUES (1,'pbkdf2_sha256$390000$fc1t7mV6QpK95PvfgUWlpv$qiHt5ycqBpE+VOIFsk3fmX4cYJNB/L5a+B6iprl3gbQ=','2022-10-05 09:38:23.908096',1,'ghastfloripa@gmail.com','Mikhail','Михаил','Создатель.','RU','+79044209968','403071','Volgograd','Volgograd','Volgograd',0,1,'2022-10-05 08:03:28.440361','2022-10-05 14:03:31.303911'),(2,'pbkdf2_sha256$390000$dP8N4CmIZkflFbF5e0PRGQ$ChjjNkXKfNxVCteLRCE8xej/O6TDfKDnIAR+X7tgT4o=',NULL,0,'user1@localhost','user1','','','','','','','','',0,0,'2022-10-05 09:35:58.313926','2022-10-05 09:35:58.313926'),(3,'pbkdf2_sha256$390000$FuXDuo0hlq6wRb8H4L5lYL$WWlvQAl6hz1Q8vyzeW1lVR7IfXSpazt7sqQ/RYPo//M=',NULL,0,'ghast2@localhost','ghast2','','','','','','','','',0,0,'2022-10-05 14:05:36.365760','2022-10-05 14:05:36.365760'),(4,'pbkdf2_sha256$390000$jNdEAX8ZOFJC2IsLtesfxP$rkLfcaWAtLGtuk4FoTjl16su0cv5yIlDQdYFoaG9zag=','2022-10-05 14:08:53.507719',1,'ghast13@yandex.ru','Michael','','','','','','','','',1,1,'2022-10-05 14:08:25.368954','2022-10-05 14:08:25.368954');
/*!40000 ALTER TABLE `account_userbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_userbase_groups`
--

DROP TABLE IF EXISTS `account_userbase_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_userbase_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userbase_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_userbase_groups_userbase_id_group_id_4ff6da31_uniq` (`userbase_id`,`group_id`),
  KEY `account_userbase_groups_group_id_4a519db2_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_userbase_gro_userbase_id_75c97f70_fk_account_u` FOREIGN KEY (`userbase_id`) REFERENCES `account_userbase` (`id`),
  CONSTRAINT `account_userbase_groups_group_id_4a519db2_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_userbase_groups`
--

LOCK TABLES `account_userbase_groups` WRITE;
/*!40000 ALTER TABLE `account_userbase_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_userbase_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_userbase_user_permissions`
--

DROP TABLE IF EXISTS `account_userbase_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_userbase_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userbase_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_userbase_user_pe_userbase_id_permission_i_17b558c2_uniq` (`userbase_id`,`permission_id`),
  KEY `account_userbase_use_permission_id_b5924313_fk_auth_perm` (`permission_id`),
  CONSTRAINT `account_userbase_use_permission_id_b5924313_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `account_userbase_use_userbase_id_0f22cb9e_fk_account_u` FOREIGN KEY (`userbase_id`) REFERENCES `account_userbase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_userbase_user_permissions`
--

LOCK TABLES `account_userbase_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_userbase_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_userbase_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Исполнитель',7,'add_artist'),(26,'Can change Исполнитель',7,'change_artist'),(27,'Can delete Исполнитель',7,'delete_artist'),(28,'Can view Исполнитель',7,'view_artist'),(29,'Can add Стиль',8,'add_itemstyle'),(30,'Can change Стиль',8,'change_itemstyle'),(31,'Can delete Стиль',8,'delete_itemstyle'),(32,'Can view Стиль',8,'view_itemstyle'),(33,'Can add Формат',9,'add_itemtype'),(34,'Can change Формат',9,'change_itemtype'),(35,'Can delete Формат',9,'delete_itemtype'),(36,'Can view Формат',9,'view_itemtype'),(37,'Can add Лейбл',10,'add_label'),(38,'Can change Лейбл',10,'change_label'),(39,'Can delete Лейбл',10,'delete_label'),(40,'Can view Лейбл',10,'view_label'),(41,'Can add Товар',11,'add_item'),(42,'Can change Товар',11,'change_item'),(43,'Can delete Товар',11,'delete_item'),(44,'Can view Товар',11,'view_item'),(45,'Can add Учётная запись',12,'add_userbase'),(46,'Can change Учётная запись',12,'change_userbase'),(47,'Can delete Учётная запись',12,'delete_userbase'),(48,'Can view Учётная запись',12,'view_userbase'),(49,'Can add order item',13,'add_orderitem'),(50,'Can change order item',13,'change_orderitem'),(51,'Can delete order item',13,'delete_orderitem'),(52,'Can view order item',13,'view_orderitem'),(53,'Can add order',14,'add_order'),(54,'Can change order',14,'change_order'),(55,'Can delete order',14,'delete_order'),(56,'Can view order',14,'view_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$FNi1FPM7QmokBfXsRpMF54$8DOYKbmzvRCA1WjDcfoFCGC/dHnPNGNx5CeWjg1QKws=','2022-10-04 09:47:36.034712',1,'ghast','','','ghast13@yandex.ru',1,1,'2022-10-04 09:47:05.780532');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-10-04 09:50:23.849646','1','CD',1,'[{\"added\": {}}]',9,1),(2,'2022-10-04 09:50:37.754635','1','Flying Colors',1,'[{\"added\": {}}]',7,1),(3,'2022-10-04 09:50:47.233866','1','rock',1,'[{\"added\": {}}]',8,1),(4,'2022-10-04 09:50:57.326426','1','Mascot',1,'[{\"added\": {}}]',10,1),(5,'2022-10-04 09:51:15.171059','1','Second Nature',1,'[{\"added\": {}}]',11,1),(6,'2022-10-04 14:23:33.437282','2','Jan Garbarek',1,'[{\"added\": {}}]',7,1),(7,'2022-10-04 14:23:45.351464','3','Keith Jarrett',1,'[{\"added\": {}}]',7,1),(8,'2022-10-04 14:23:57.187089','4','Palle Danielsson',1,'[{\"added\": {}}]',7,1),(9,'2022-10-04 14:24:06.492033','5','Jon Christensen',1,'[{\"added\": {}}]',7,1),(10,'2022-10-04 14:24:18.397619','2','jazz',1,'[{\"added\": {}}]',8,1),(11,'2022-10-04 14:24:25.339907','2','ECM',1,'[{\"added\": {}}]',10,1),(12,'2022-10-04 14:24:47.862553','2','Belonging',1,'[{\"added\": {}}]',11,1),(13,'2022-10-04 14:26:02.999426','6','Yuuko Shiokawa',1,'[{\"added\": {}}]',7,1),(14,'2022-10-04 14:26:22.307937','7','Andras Schiff',1,'[{\"added\": {}}]',7,1),(15,'2022-10-04 14:28:03.690714','3','classical',1,'[{\"added\": {}}]',8,1),(16,'2022-10-04 14:28:29.853661','3','Bach Busoni Beethoven',1,'[{\"added\": {}}]',11,1),(17,'2022-10-04 14:38:47.254687','8','Various Artists',1,'[{\"added\": {}}]',7,1),(18,'2022-10-04 14:39:05.101626','3','Irond',1,'[{\"added\": {}}]',10,1),(19,'2022-10-04 14:39:17.076809','4','A Guitar Supreme — Giant Steps In Fusion Guitar',1,'[{\"added\": {}}]',11,1),(20,'2022-10-04 14:40:18.640620','9','Sopor Aeternus & The Ensemble Of Shadows',1,'[{\"added\": {}}]',7,1),(21,'2022-10-04 14:40:46.848407','4','Apocalyptic Vision',1,'[{\"added\": {}}]',10,1),(22,'2022-10-04 14:40:59.993512','5','Death And Flamingos',1,'[{\"added\": {}}]',11,1),(23,'2022-10-04 14:41:28.812069','10','Roger Waters',1,'[{\"added\": {}}]',7,1),(24,'2022-10-04 14:42:12.424647','5','Jule Pond',1,'[{\"added\": {}}]',10,1),(25,'2022-10-04 14:42:28.191966','6','Is This The Life We Really Want?',1,'[{\"added\": {}}]',11,1),(26,'2022-10-04 14:43:09.995464','11','Daft Punk',1,'[{\"added\": {}}]',7,1),(27,'2022-10-04 14:43:19.413704','4','electronic',1,'[{\"added\": {}}]',8,1),(28,'2022-10-04 14:43:47.502396','6','Sony',1,'[{\"added\": {}}]',10,1),(29,'2022-10-04 14:43:59.904943','7','Random Access Memories',1,'[{\"added\": {}}]',11,1),(30,'2022-10-04 14:45:32.638775','12','Tiamat',1,'[{\"added\": {}}]',7,1),(31,'2022-10-04 14:45:40.305979','5','metal',1,'[{\"added\": {}}]',8,1),(32,'2022-10-04 14:45:52.651269','7','Nuclear Blast',1,'[{\"added\": {}}]',10,1),(33,'2022-10-04 14:46:13.001106','8','Amanethes',1,'[{\"added\": {}}]',11,1),(34,'2022-10-04 14:56:45.081871','13','Аквариум',1,'[{\"added\": {}}]',7,1),(35,'2022-10-04 14:57:22.353316','8','Б.Г.',1,'[{\"added\": {}}]',10,1),(36,'2022-10-04 14:57:41.495726','9','Кострома Mon Amour',1,'[{\"added\": {}}]',11,1),(37,'2022-10-04 14:58:21.199524','10','Лошадь Белая',1,'[{\"added\": {}}]',11,1),(38,'2022-10-04 14:58:49.723650','14','Blondie',1,'[{\"added\": {}}]',7,1),(39,'2022-10-04 14:59:23.714352','9','BMG',1,'[{\"added\": {}}]',10,1),(40,'2022-10-04 14:59:37.234064','11','Pollinator',1,'[{\"added\": {}}]',11,1),(41,'2022-10-04 15:00:13.835794','15','Линда',1,'[{\"added\": {}}]',7,1),(42,'2022-10-04 15:00:26.433494','6','pop',1,'[{\"added\": {}}]',8,1),(43,'2022-10-04 15:01:05.195013','10','Linda Music',1,'[{\"added\": {}}]',10,1),(44,'2022-10-04 15:01:25.946201','12','Life @',1,'[{\"added\": {}}]',11,1),(45,'2022-10-04 15:02:29.022243','16','Silje Nergaard',1,'[{\"added\": {}}]',7,1),(46,'2022-10-04 15:03:08.757065','11','Universal Music',1,'[{\"added\": {}}]',10,1),(47,'2022-10-04 15:03:22.750893','13','Darkness Out Of Blue',1,'[{\"added\": {}}]',11,1),(48,'2022-10-04 15:03:46.841500','2','2xCD',1,'[{\"added\": {}}]',9,1),(49,'2022-10-04 15:04:02.113470','17','Electric Light Orchestra',1,'[{\"added\": {}}]',7,1),(50,'2022-10-04 15:04:48.423928','14','Out Of The Blue',1,'[{\"added\": {}}]',11,1),(51,'2022-10-04 15:05:20.495868','18','Paul McCartney',1,'[{\"added\": {}}]',7,1),(52,'2022-10-04 15:06:02.042105','12','LTD',1,'[{\"added\": {}}]',10,1),(53,'2022-10-04 15:06:15.653052','15','Egypt Station',1,'[{\"added\": {}}]',11,1),(54,'2022-10-04 15:06:39.317990','3','CD Digipak',1,'[{\"added\": {}}]',9,1),(55,'2022-10-04 15:06:51.880973','19','Aerosmith',1,'[{\"added\": {}}]',7,1),(56,'2022-10-04 15:07:16.732971','13','Geffen',1,'[{\"added\": {}}]',10,1),(57,'2022-10-04 15:07:32.347192','16','Get A Grip',1,'[{\"added\": {}}]',11,1),(58,'2022-10-04 15:07:53.170407','4','2xCD Digipak',1,'[{\"added\": {}}]',9,1),(59,'2022-10-04 15:08:07.315404','20','Fleetwood Mac',1,'[{\"added\": {}}]',7,1),(60,'2022-10-04 15:08:50.660940','14','Warner',1,'[{\"added\": {}}]',10,1),(61,'2022-10-04 15:09:02.750274','17','Rumours',1,'[{\"added\": {}}]',11,1),(62,'2022-10-04 15:09:33.613122','21','Ustad Fateh Ali Khan',1,'[{\"added\": {}}]',7,1),(63,'2022-10-04 15:09:52.127076','7','folk/world/country',1,'[{\"added\": {}}]',8,1),(64,'2022-10-04 15:10:34.838723','18','Ragas And Sagas',1,'[{\"added\": {}}]',11,1),(65,'2022-10-04 15:11:41.122624','19','Zoom Zoom Zoom',1,'[{\"added\": {}}]',11,1),(66,'2022-10-04 15:12:22.137232','22','Ringo Starr',1,'[{\"added\": {}}]',7,1),(67,'2022-10-04 15:12:53.692653','15','Roccabella',1,'[{\"added\": {}}]',10,1),(68,'2022-10-04 15:13:07.743110','20','What\'s My Name',1,'[{\"added\": {}}]',11,1),(69,'2022-10-04 15:13:38.486802','23','Борис Гребенщиков',1,'[{\"added\": {}}]',7,1),(70,'2022-10-04 15:14:03.140053','21','Лилит',1,'[{\"added\": {}}]',11,1),(71,'2022-10-04 15:16:10.338426','16','Vagrant',1,'[{\"added\": {}}]',10,1),(72,'2022-10-04 15:16:42.928589','24','LP',1,'[{\"added\": {}}]',7,1),(73,'2022-10-04 15:16:47.365455','22','Lost On You',1,'[{\"added\": {}}]',11,1),(74,'2022-10-04 15:17:29.101630','25','Fred V',1,'[{\"added\": {}}]',7,1),(75,'2022-10-04 15:17:57.777331','26','Grafix',1,'[{\"added\": {}}]',7,1),(76,'2022-10-04 15:18:39.017198','17','Hospital',1,'[{\"added\": {}}]',10,1),(77,'2022-10-04 15:18:50.731055','23','Oxygen',1,'[{\"added\": {}}]',11,1),(78,'2022-10-04 15:19:34.755609','27','Coldplay',1,'[{\"added\": {}}]',7,1),(79,'2022-10-04 15:20:03.316510','18','Parlophone',1,'[{\"added\": {}}]',10,1),(80,'2022-10-04 15:20:17.453083','24','Parachutes',1,'[{\"added\": {}}]',11,1),(81,'2022-10-04 15:21:31.557037','25','X&Y',1,'[{\"added\": {}}]',11,1),(82,'2022-10-04 15:21:58.288506','28','Chitose Hajime',1,'[{\"added\": {}}]',7,1),(83,'2022-10-04 15:22:11.016479','19','Epic',1,'[{\"added\": {}}]',10,1),(84,'2022-10-04 15:22:56.919987','26','Kataritsugu Koto',1,'[{\"added\": {}}]',11,1),(85,'2022-10-04 15:23:56.641753','29','Karen Elson',1,'[{\"added\": {}}]',7,1),(86,'2022-10-04 15:24:29.638362','20','Karen Elson',1,'[{\"added\": {}}]',10,1),(87,'2022-10-04 15:24:40.334005','27','Radio Redhead, Vol.1',1,'[{\"added\": {}}]',11,1),(88,'2022-10-05 08:05:36.804122','1','Mikhail',2,'[{\"changed\": {\"fields\": [\"First name\", \"About\", \"Country\", \"Phone number\", \"Postcode\", \"Address line 1\", \"Address line 2\", \"Town city\"]}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (12,'account','userbase'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'main','artist'),(11,'main','item'),(8,'main','itemstyle'),(9,'main','itemtype'),(10,'main','label'),(14,'order','order'),(13,'order','orderitem'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-10-04 08:25:57.863996'),(2,'auth','0001_initial','2022-10-04 08:25:59.269308'),(3,'admin','0001_initial','2022-10-04 08:25:59.562896'),(4,'admin','0002_logentry_remove_auto_add','2022-10-04 08:25:59.581844'),(5,'admin','0003_logentry_add_action_flag_choices','2022-10-04 08:25:59.604785'),(6,'contenttypes','0002_remove_content_type_name','2022-10-04 08:25:59.857600'),(7,'auth','0002_alter_permission_name_max_length','2022-10-04 08:25:59.982051'),(8,'auth','0003_alter_user_email_max_length','2022-10-04 08:26:00.053857'),(9,'auth','0004_alter_user_username_opts','2022-10-04 08:26:00.067820'),(10,'auth','0005_alter_user_last_login_null','2022-10-04 08:26:00.162839'),(11,'auth','0006_require_contenttypes_0002','2022-10-04 08:26:00.168826'),(12,'auth','0007_alter_validators_add_error_messages','2022-10-04 08:26:00.183785'),(13,'auth','0008_alter_user_username_max_length','2022-10-04 08:26:00.307608'),(14,'auth','0009_alter_user_last_name_max_length','2022-10-04 08:26:00.420116'),(15,'auth','0010_alter_group_name_max_length','2022-10-04 08:26:00.455895'),(16,'auth','0011_update_proxy_permissions','2022-10-04 08:26:00.471851'),(17,'auth','0012_alter_user_first_name_max_length','2022-10-04 08:26:00.584914'),(18,'main','0001_initial','2022-10-04 08:26:01.534130'),(19,'sessions','0001_initial','2022-10-04 08:26:01.589981'),(21,'account','0001_initial','2022-10-05 08:00:03.691181'),(22,'order','0001_initial','2022-10-05 14:43:33.194744');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a9exdmhp79lyj6v40fgbvh701hbd1guf','eyJiYXNrZXQiOnt9fQ:1ogQFS:2OIEapWSMz1wQ3gn2OIoNw7yo0s_HtIVN60MnGXEq0M','2022-10-20 12:45:10.298060'),('rw5xgha3qhz3t3zs5wvnvzd10dowbyom','.eJxtj7uOwyAQRf-FOkJm_MCkTJ9vsAZmWLOOcGJwsYr874ujFLF2mynmnnul8xSJUwpzHCb-EeengHq_9yU4FmehTCVNJU7isWLMIRdEbdtJDLjmcVgTL0OgwjXi8LPoJo57QN8Yv2bp5piXYOWOyHea5HUmvl3e7GFgxDSWdk-MtfOokVpXo2awXjU9eXBas66UskZ74A48gicyhjsL5LBp-04pLKMW08T5ZaY_zaD6Y1YXMWgP-l37j_72C3-GYm8:1ogQ20:Vu_DUNTxX-AfYCBAB45SubAgPIN_P2i27qH0qAg17AY','2022-10-20 12:31:16.737366');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_artist`
--

DROP TABLE IF EXISTS `main_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_artist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `country` varchar(32) DEFAULT NULL,
  `slug` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_artist_slug_46d9521c` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_artist`
--

LOCK TABLES `main_artist` WRITE;
/*!40000 ALTER TABLE `main_artist` DISABLE KEYS */;
INSERT INTO `main_artist` VALUES (1,'Flying Colors','USA','flying-colors'),(2,'Jan Garbarek','Norway','jan-garbarek'),(3,'Keith Jarrett','USA','keith-jarrett'),(4,'Palle Danielsson','Norway','palle-danielsson'),(5,'Jon Christensen','Norway','jon-christensen'),(6,'Yuuko Shiokawa','Japan','yuuko-shiokawa'),(7,'Andras Schiff','UK','andras-schiff'),(8,'Various Artists',NULL,'various-artists'),(9,'Sopor Aeternus & The Ensemble Of Shadows','Germany','sopor-aeternus-the-ensemble-of-shadows'),(10,'Roger Waters','UK','roger-waters'),(11,'Daft Punk','France','daft-punk'),(12,'Tiamat','Sweden','tiamat'),(13,'Аквариум','Russia','akvarium'),(14,'Blondie','USA','blondie'),(15,'Линда','Russia','linda'),(16,'Silje Nergaard','Norway','silje-nergaard'),(17,'Electric Light Orchestra','UK','electric-light-orchestra'),(18,'Paul McCartney','UK','paul-mccartney'),(19,'Aerosmith','USA','aerosmith'),(20,'Fleetwood Mac','UK','fleetwood-mac'),(21,'Ustad Fateh Ali Khan','Pakistan','ustad-fateh-ali-khan'),(22,'Ringo Starr','UK','ringo-starr'),(23,'Борис Гребенщиков','Russia','boris-grebenshikov'),(24,'LP','USA','lp'),(25,'Fred V','UK','fred-v'),(26,'Grafix','UK','grafix'),(27,'Coldplay','UK','coldplay'),(28,'Chitose Hajime','Japan','chitose-hajime'),(29,'Karen Elson','UK','karen-elson');
/*!40000 ALTER TABLE `main_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_item`
--

DROP TABLE IF EXISTS `main_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `album` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `year` varchar(4) NOT NULL,
  `license_year` varchar(4) DEFAULT NULL,
  `price` decimal(5,2) NOT NULL,
  `quantity` int NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `item_type_id` bigint NOT NULL,
  `label_id` bigint NOT NULL,
  `licensed_by_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_item_item_type_id_7d455b89_fk_main_itemtype_id` (`item_type_id`),
  KEY `main_item_label_id_009a310c_fk_main_label_id` (`label_id`),
  KEY `main_item_licensed_by_id_54399b60_fk_main_label_id` (`licensed_by_id`),
  KEY `main_item_slug_b03f0a59` (`slug`),
  CONSTRAINT `main_item_item_type_id_7d455b89_fk_main_itemtype_id` FOREIGN KEY (`item_type_id`) REFERENCES `main_itemtype` (`id`),
  CONSTRAINT `main_item_label_id_009a310c_fk_main_label_id` FOREIGN KEY (`label_id`) REFERENCES `main_label` (`id`),
  CONSTRAINT `main_item_licensed_by_id_54399b60_fk_main_label_id` FOREIGN KEY (`licensed_by_id`) REFERENCES `main_label` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_item`
--

LOCK TABLES `main_item` WRITE;
/*!40000 ALTER TABLE `main_item` DISABLE KEYS */;
INSERT INTO `main_item` VALUES (1,'Second Nature','second-nature','2014',NULL,190.90,5,1,1,1,NULL),(2,'Belonging','belonging','1974',NULL,150.90,5,1,1,2,NULL),(3,'Bach Busoni Beethoven','bach-busoni-beethoven','2017',NULL,155.90,5,1,1,2,NULL),(4,'A Guitar Supreme — Giant Steps In Fusion Guitar','a-guitar-supreme-giant-steps-in-fusion-guitar','2004','2004',90.90,5,1,1,1,3),(5,'Death And Flamingos','death-and-flamingos','2019',NULL,210.90,5,1,1,4,NULL),(6,'Is This The Life We Really Want?','is-this-the-life-we-really-want','2017',NULL,170.90,5,1,1,5,NULL),(7,'Random Access Memories','random-access-memories','2013',NULL,180.90,5,1,1,6,NULL),(8,'Amanethes','amanethes','2008','2008',120.90,5,1,1,7,3),(9,'Кострома Mon Amour','kostroma-mon-amour','1994',NULL,160.90,5,1,1,8,NULL),(10,'Лошадь Белая','loshad-belaya','2008',NULL,170.90,5,1,1,8,NULL),(11,'Pollinator','pollinator','2017',NULL,185.90,5,1,1,9,NULL),(12,'Life @','life','2015',NULL,160.90,5,1,1,10,NULL),(13,'Darkness Out Of Blue','darkness-out-of-blue','2007',NULL,210.90,5,1,1,11,NULL),(14,'Out Of The Blue','out-of-the-blue','1977',NULL,230.90,5,1,2,6,NULL),(15,'Egypt Station','egypt-station','2018',NULL,190.90,5,1,1,12,NULL),(16,'Get A Grip','get-a-grip','1993',NULL,230.90,5,1,3,13,NULL),(17,'Rumours','rumours','1977',NULL,240.90,5,1,4,14,NULL),(18,'Ragas And Sagas','ragas-and-sagas','1992',NULL,150.90,5,1,1,2,NULL),(19,'Zoom Zoom Zoom','zoom-zoom-zoom','2005',NULL,140.90,5,1,1,8,NULL),(20,'What\'s My Name','whats-my-name','2019',NULL,190.90,5,1,3,15,NULL),(21,'Лилит','lilit','1997',NULL,195.90,5,1,1,8,NULL),(22,'Lost On You','lost-on-you','2016',NULL,180.90,5,1,1,16,NULL),(23,'Oxygen','oxygen','2016',NULL,190.90,5,1,1,17,NULL),(24,'Parachutes','parachutes','2000',NULL,155.90,5,1,1,18,NULL),(25,'X&Y','xy','2005',NULL,165.90,5,1,1,18,NULL),(26,'Kataritsugu Koto','kataritsugu-koto','2012',NULL,210.90,5,1,1,6,NULL),(27,'Radio Redhead, Vol.1','radio-redhead-vol1','2020',NULL,200.90,5,1,1,20,NULL);
/*!40000 ALTER TABLE `main_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_item_artists`
--

DROP TABLE IF EXISTS `main_item_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_item_artists` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `artist_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_item_artists_item_id_artist_id_1c52a023_uniq` (`item_id`,`artist_id`),
  KEY `main_item_artists_artist_id_66ae0fe1_fk_main_artist_id` (`artist_id`),
  CONSTRAINT `main_item_artists_artist_id_66ae0fe1_fk_main_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `main_artist` (`id`),
  CONSTRAINT `main_item_artists_item_id_3db8819e_fk_main_item_id` FOREIGN KEY (`item_id`) REFERENCES `main_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_item_artists`
--

LOCK TABLES `main_item_artists` WRITE;
/*!40000 ALTER TABLE `main_item_artists` DISABLE KEYS */;
INSERT INTO `main_item_artists` VALUES (1,1,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,3,6),(7,3,7),(8,4,8),(9,5,9),(10,6,10),(11,7,11),(12,8,12),(13,9,13),(14,10,13),(15,11,14),(16,12,15),(17,13,16),(18,14,17),(19,15,18),(20,16,19),(21,17,20),(22,18,2),(23,18,21),(24,19,13),(25,20,22),(26,21,23),(27,22,24),(28,23,25),(29,23,26),(30,24,27),(31,25,27),(32,26,28),(33,27,29);
/*!40000 ALTER TABLE `main_item_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_item_styles`
--

DROP TABLE IF EXISTS `main_item_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_item_styles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `itemstyle_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_item_styles_item_id_itemstyle_id_c67b14bf_uniq` (`item_id`,`itemstyle_id`),
  KEY `main_item_styles_itemstyle_id_2508d79b_fk_main_itemstyle_id` (`itemstyle_id`),
  CONSTRAINT `main_item_styles_item_id_43333ae1_fk_main_item_id` FOREIGN KEY (`item_id`) REFERENCES `main_item` (`id`),
  CONSTRAINT `main_item_styles_itemstyle_id_2508d79b_fk_main_itemstyle_id` FOREIGN KEY (`itemstyle_id`) REFERENCES `main_itemstyle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_item_styles`
--

LOCK TABLES `main_item_styles` WRITE;
/*!40000 ALTER TABLE `main_item_styles` DISABLE KEYS */;
INSERT INTO `main_item_styles` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,2),(5,5,1),(6,6,1),(7,7,4),(8,8,5),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,12,6),(14,13,2),(15,13,6),(16,14,1),(17,15,1),(18,16,1),(19,17,1),(20,18,2),(21,18,7),(22,19,1),(23,20,1),(24,21,1),(25,22,6),(26,23,4),(27,24,1),(28,25,1),(29,26,6),(30,26,7),(31,27,6);
/*!40000 ALTER TABLE `main_item_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_itemstyle`
--

DROP TABLE IF EXISTS `main_itemstyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_itemstyle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_itemstyle`
--

LOCK TABLES `main_itemstyle` WRITE;
/*!40000 ALTER TABLE `main_itemstyle` DISABLE KEYS */;
INSERT INTO `main_itemstyle` VALUES (1,'rock'),(2,'jazz'),(3,'classical'),(4,'electronic'),(5,'metal'),(6,'pop'),(7,'folk/world/country');
/*!40000 ALTER TABLE `main_itemstyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_itemtype`
--

DROP TABLE IF EXISTS `main_itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_itemtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `format` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_itemtype`
--

LOCK TABLES `main_itemtype` WRITE;
/*!40000 ALTER TABLE `main_itemtype` DISABLE KEYS */;
INSERT INTO `main_itemtype` VALUES (1,'CD'),(2,'2xCD'),(3,'CD Digipak'),(4,'2xCD Digipak');
/*!40000 ALTER TABLE `main_itemtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_label`
--

DROP TABLE IF EXISTS `main_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_label` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_label`
--

LOCK TABLES `main_label` WRITE;
/*!40000 ALTER TABLE `main_label` DISABLE KEYS */;
INSERT INTO `main_label` VALUES (1,'Mascot'),(2,'ECM'),(3,'Irond'),(4,'Apocalyptic Vision'),(5,'Jule Pond'),(6,'Sony'),(7,'Nuclear Blast'),(8,'Б.Г.'),(9,'BMG'),(10,'Linda Music'),(11,'Universal Music'),(12,'LTD'),(13,'Geffen'),(14,'Warner'),(15,'Roccabella'),(16,'Vagrant'),(17,'Hospital'),(18,'Parlophone'),(19,'Epic'),(20,'Karen Elson');
/*!40000 ALTER TABLE `main_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `address2` varchar(250) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `post_code` varchar(20) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `total_paid` decimal(5,2) NOT NULL,
  `order_key` varchar(200) NOT NULL,
  `billing_status` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_user_id_7cf9bc2b_fk_account_userbase_id` (`user_id`),
  CONSTRAINT `order_order_user_id_7cf9bc2b_fk_account_userbase_id` FOREIGN KEY (`user_id`) REFERENCES `account_userbase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (1,'name','add1','add2','','','','2022-10-05 15:19:11.177845','2022-10-05 15:19:11.177845',190.90,'pi_3LpZMrDa1vyXZ3J12GdpopAa_secret_tX3Xy8mrDiThwQdtuxA1WtMsV',0,4),(2,'name','add1','add2','','','','2022-10-05 15:22:07.435730','2022-10-05 15:22:07.435730',190.90,'pi_3LpZPtDa1vyXZ3J13aLGqHrV_secret_27Q0YI1w7iSrQ9zpeDClIwzv1',0,4),(3,'name','add1','add2','','','','2022-10-05 15:26:59.101524','2022-10-05 15:26:59.101524',190.90,'pi_3LpZU4Da1vyXZ3J13cwNXspQ_secret_hwH6HB2rrVgLzotOeAQMbvJlD',0,4),(4,'name','add1','add2','','','','2022-10-05 15:31:40.437626','2022-10-05 15:31:40.437626',190.90,'pi_3LpZZ9Da1vyXZ3J12jTj2JPj_secret_8oNUSlnznSubnbvFV4QTMVYmj',0,4),(5,'name','add1','add2','','','','2022-10-05 15:32:44.760061','2022-10-05 15:32:44.761057',190.90,'pi_3LpZaDDa1vyXZ3J13g0jjLck_secret_PJz4sF7UAW4XOPKyroIeNAZxj',0,4),(6,'name','add1','add2','','','','2022-10-05 15:44:05.063632','2022-10-05 15:44:05.063632',190.90,'pi_3LpZlCDa1vyXZ3J11l64mLtb_secret_YqgNBwedKCux7lRp7Vzgu5HhW',0,4),(7,'name','add1','add2','','','','2022-10-05 16:53:09.983906','2022-10-05 16:53:09.984904',190.90,'pi_3Lpaq1Da1vyXZ3J12KBDO2Sr_secret_rxOIQ4R6HTA9KNaeH3o946G9p',0,4),(8,'name','add1','add2','','','','2022-10-05 16:56:26.003172','2022-10-05 16:56:26.003172',190.90,'pi_3LpatDDa1vyXZ3J1134TxVM7_secret_UexeyKi2cvgcxs4R6rQQWxd7o',0,4),(9,'name','add1','add2','','','','2022-10-06 07:46:53.997483','2022-10-06 07:46:53.997483',190.90,'pi_3LpomYDa1vyXZ3J13s88J2qH_secret_JxkvaarGehhqnrkHMt6LYsfxn',0,4),(10,'name','add1','add2','','','','2022-10-06 07:52:55.340631','2022-10-06 07:52:55.340631',165.90,'pi_3LposjDa1vyXZ3J126daY23A_secret_lBACf7t9bTNBiSf52hKfKEHdK',0,4),(11,'name','add1','add2','','','','2022-10-06 09:14:46.277715','2022-10-06 09:14:46.277715',155.90,'pi_3Lpq9vDa1vyXZ3J120mB1ZcP_secret_DchwfpiHt4Tba9qIvhFG9kajK',0,4);
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderitem`
--

DROP TABLE IF EXISTS `order_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(5,2) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderitem_order_id_aba34f44_fk_order_order_id` (`order_id`),
  KEY `order_orderitem_product_id_c5c6b07a_fk_main_item_id` (`product_id`),
  CONSTRAINT `order_orderitem_order_id_aba34f44_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_orderitem_product_id_c5c6b07a_fk_main_item_id` FOREIGN KEY (`product_id`) REFERENCES `main_item` (`id`),
  CONSTRAINT `order_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderitem`
--

LOCK TABLES `order_orderitem` WRITE;
/*!40000 ALTER TABLE `order_orderitem` DISABLE KEYS */;
INSERT INTO `order_orderitem` VALUES (1,190.90,1,5,23),(2,190.90,1,6,23),(3,190.90,1,7,23),(4,190.90,1,8,23),(5,190.90,1,9,23),(6,165.90,1,10,25),(7,155.90,1,11,24);
/*!40000 ALTER TABLE `order_orderitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-08 13:15:36
