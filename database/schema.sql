-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: tutz_db
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add medical record',7,'add_medicalrecord'),(26,'Can change medical record',7,'change_medicalrecord'),(27,'Can delete medical record',7,'delete_medicalrecord'),(28,'Can view medical record',7,'view_medicalrecord'),(29,'Can add pet',8,'add_pet'),(30,'Can change pet',8,'change_pet'),(31,'Can delete pet',8,'delete_pet'),(32,'Can view pet',8,'view_pet'),(33,'Can add appointment',9,'add_appointment'),(34,'Can change appointment',9,'change_appointment'),(35,'Can delete appointment',9,'delete_appointment'),(36,'Can view appointment',9,'view_appointment'),(37,'Can add pet owner',10,'add_petowner'),(38,'Can change pet owner',10,'change_petowner'),(39,'Can delete pet owner',10,'delete_petowner'),(40,'Can view pet owner',10,'view_petowner'),(41,'Can add billing transaction',11,'add_billingtransaction'),(42,'Can change billing transaction',11,'change_billingtransaction'),(43,'Can delete billing transaction',11,'delete_billingtransaction'),(44,'Can view billing transaction',11,'view_billingtransaction'),(45,'Can add transaction receipt',12,'add_transactionreceipt'),(46,'Can change transaction receipt',12,'change_transactionreceipt'),(47,'Can delete transaction receipt',12,'delete_transactionreceipt'),(48,'Can view transaction receipt',12,'view_transactionreceipt'),(49,'Can add notification',13,'add_notification'),(50,'Can change notification',13,'change_notification'),(51,'Can delete notification',13,'delete_notification'),(52,'Can view notification',13,'view_notification');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$tnaiWCpZqRRImJHewxlPPb$39TvwEH4U3/E00Wig/dpFLejr5WQZOejoSmi96UwN3g=','2025-04-10 08:55:39.197810',1,'vetAdmin','','','vetAdmin@gmail.com',1,1,'2025-04-06 10:14:50.396745'),(2,'pbkdf2_sha256$1000000$DkdRh4m5vxfID2ulSBAdAz$QFsjH8QlhLUZQyOqkxpde84YM86IFdchkO3JuW9VmZk=','2025-04-06 16:27:34.770834',0,'person1','','','person1@gmail.com',0,1,'2025-04-06 16:27:21.892824'),(3,'pbkdf2_sha256$1000000$usYtXubbjkPyYB771gWtQh$i4dOpmHtvna/bdrj9DK8JsDPGGJmV6el+JYqBPN5prg=','2025-04-10 08:56:09.788107',0,'person2','','','person2@gmail.com',0,1,'2025-04-09 06:12:35.007602');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_appointment`
--

DROP TABLE IF EXISTS `clinic_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_appointment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appointment_date` datetime(6) NOT NULL,
  `reason` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `pet_name_id` bigint NOT NULL,
  `time` time(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_appointment_pet_name_id_c44587e8_fk_clinic_pet_id` (`pet_name_id`),
  KEY `clinic_appointment_user_id_8bec0ee0_fk_auth_user_id` (`user_id`),
  CONSTRAINT `clinic_appointment_pet_name_id_c44587e8_fk_clinic_pet_id` FOREIGN KEY (`pet_name_id`) REFERENCES `clinic_pet` (`id`),
  CONSTRAINT `clinic_appointment_user_id_8bec0ee0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_appointment`
--

LOCK TABLES `clinic_appointment` WRITE;
/*!40000 ALTER TABLE `clinic_appointment` DISABLE KEYS */;
INSERT INTO `clinic_appointment` VALUES (1,'2025-04-10 00:00:00.000000','diabetes','cancelled',2,'14:00:02.000000',3),(2,'2025-04-11 00:00:00.000000','Check up','completed',3,'13:00:00.000000',3);
/*!40000 ALTER TABLE `clinic_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_billingtransaction`
--

DROP TABLE IF EXISTS `clinic_billingtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_billingtransaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_amount` decimal(10,2) NOT NULL,
  `proof_of_payment` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `verified_at` datetime(6) DEFAULT NULL,
  `appointment_id` bigint NOT NULL,
  `pet_owner_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_billingtransa_appointment_id_73da94e4_fk_clinic_ap` (`appointment_id`),
  KEY `clinic_billingtransa_pet_owner_id_f9ab9d1c_fk_clinic_pe` (`pet_owner_id`),
  CONSTRAINT `clinic_billingtransa_appointment_id_73da94e4_fk_clinic_ap` FOREIGN KEY (`appointment_id`) REFERENCES `clinic_appointment` (`id`),
  CONSTRAINT `clinic_billingtransa_pet_owner_id_f9ab9d1c_fk_clinic_pe` FOREIGN KEY (`pet_owner_id`) REFERENCES `clinic_petowner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_billingtransaction`
--

LOCK TABLES `clinic_billingtransaction` WRITE;
/*!40000 ALTER TABLE `clinic_billingtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_billingtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_medicalrecord`
--

DROP TABLE IF EXISTS `clinic_medicalrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_medicalrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `notes` longtext NOT NULL,
  `treatment` longtext NOT NULL,
  `pet_name_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_medicalrecord_pet_name_id_15c35be3_fk_clinic_pet_id` (`pet_name_id`),
  CONSTRAINT `clinic_medicalrecord_pet_name_id_15c35be3_fk_clinic_pet_id` FOREIGN KEY (`pet_name_id`) REFERENCES `clinic_pet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_medicalrecord`
--

LOCK TABLES `clinic_medicalrecord` WRITE;
/*!40000 ALTER TABLE `clinic_medicalrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_medicalrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_notification`
--

DROP TABLE IF EXISTS `clinic_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `appointment_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_notification_appointment_id_b2a4548b_fk_clinic_ap` (`appointment_id`),
  KEY `clinic_notification_user_id_1ce0cc72_fk_auth_user_id` (`user_id`),
  CONSTRAINT `clinic_notification_appointment_id_b2a4548b_fk_clinic_ap` FOREIGN KEY (`appointment_id`) REFERENCES `clinic_appointment` (`id`),
  CONSTRAINT `clinic_notification_user_id_1ce0cc72_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_notification`
--

LOCK TABLES `clinic_notification` WRITE;
/*!40000 ALTER TABLE `clinic_notification` DISABLE KEYS */;
INSERT INTO `clinic_notification` VALUES (1,'Your appointment for Mocha has been updated to Confirmed.',0,'2025-04-09 14:50:06.328919',1,3),(2,'Your appointment for Mocha has been updated to Cancelled.',0,'2025-04-09 14:53:45.503356',1,3),(3,'Your appointment for Piza has been updated to Completed.',0,'2025-04-10 08:57:53.584345',2,3);
/*!40000 ALTER TABLE `clinic_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_pet`
--

DROP TABLE IF EXISTS `clinic_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_pet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pet_name` varchar(100) NOT NULL,
  `species` varchar(100) NOT NULL,
  `breed` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `medical_notes` longtext NOT NULL,
  `owner_id` int NOT NULL,
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_pet_owner_id_4c25c944_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `clinic_pet_owner_id_4c25c944_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_pet`
--

LOCK TABLES `clinic_pet` WRITE;
/*!40000 ALTER TABLE `clinic_pet` DISABLE KEYS */;
INSERT INTO `clinic_pet` VALUES (2,'Mocha','Dog','Aspin',10,'diabetes',3,'2025-04-09'),(3,'Piza','Cat','Ragdoll',5,'cataracts',3,'2025-04-09'),(4,'Siopao','Cat','Puspin',2,'Steamed',3,'2025-04-09');
/*!40000 ALTER TABLE `clinic_pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_petowner`
--

DROP TABLE IF EXISTS `clinic_petowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_petowner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `address` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `clinic_petowner_user_id_f9348297_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_petowner`
--

LOCK TABLES `clinic_petowner` WRITE;
/*!40000 ALTER TABLE `clinic_petowner` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_petowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_transactionreceipt`
--

DROP TABLE IF EXISTS `clinic_transactionreceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_transactionreceipt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receipt_file` varchar(100) NOT NULL,
  `issued_at` datetime(6) NOT NULL,
  `notes` longtext NOT NULL,
  `issued_by_id` int DEFAULT NULL,
  `transaction_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `clinic_transactionreceipt_issued_by_id_b7c2e928_fk_auth_user_id` (`issued_by_id`),
  CONSTRAINT `clinic_transactionre_transaction_id_b7919207_fk_clinic_bi` FOREIGN KEY (`transaction_id`) REFERENCES `clinic_billingtransaction` (`id`),
  CONSTRAINT `clinic_transactionreceipt_issued_by_id_b7c2e928_fk_auth_user_id` FOREIGN KEY (`issued_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_transactionreceipt`
--

LOCK TABLES `clinic_transactionreceipt` WRITE;
/*!40000 ALTER TABLE `clinic_transactionreceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_transactionreceipt` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-09 13:35:46.796153','2','Piza - 2025-04-11',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(2,'2025-04-09 14:00:09.024101','1','Mocha - 2025-04-10',2,'[{\"changed\": {\"fields\": [\"Time\", \"Status\"]}}]',9,1),(3,'2025-04-09 14:50:06.328919','1','Mocha - 2025-04-10',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(4,'2025-04-09 14:53:45.506991','1','Mocha - 2025-04-10',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(5,'2025-04-10 08:57:53.610479','2','Piza - 2025-04-11',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'clinic','appointment'),(11,'clinic','billingtransaction'),(7,'clinic','medicalrecord'),(13,'clinic','notification'),(8,'clinic','pet'),(10,'clinic','petowner'),(12,'clinic','transactionreceipt'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-06 06:12:45.412593'),(2,'auth','0001_initial','2025-04-06 06:12:46.073991'),(3,'admin','0001_initial','2025-04-06 06:12:46.259166'),(4,'admin','0002_logentry_remove_auto_add','2025-04-06 06:12:46.278074'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-06 06:12:46.290149'),(6,'contenttypes','0002_remove_content_type_name','2025-04-06 06:12:46.435225'),(7,'auth','0002_alter_permission_name_max_length','2025-04-06 06:12:46.513512'),(8,'auth','0003_alter_user_email_max_length','2025-04-06 06:12:46.547012'),(9,'auth','0004_alter_user_username_opts','2025-04-06 06:12:46.556005'),(10,'auth','0005_alter_user_last_login_null','2025-04-06 06:12:46.632018'),(11,'auth','0006_require_contenttypes_0002','2025-04-06 06:12:46.634978'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-06 06:12:46.645356'),(13,'auth','0008_alter_user_username_max_length','2025-04-06 06:12:46.718678'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-06 06:12:46.804184'),(15,'auth','0010_alter_group_name_max_length','2025-04-06 06:12:46.830863'),(16,'auth','0011_update_proxy_permissions','2025-04-06 06:12:46.841876'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-06 06:12:46.940511'),(18,'sessions','0001_initial','2025-04-06 06:12:46.975392'),(19,'clinic','0001_initial','2025-04-06 09:48:53.078155'),(20,'clinic','0002_billingtransaction','2025-04-06 10:25:34.801156'),(21,'clinic','0003_transactionreceipt','2025-04-06 10:29:52.787161'),(22,'clinic','0004_appointment_time','2025-04-06 11:08:59.942325'),(23,'clinic','0005_rename_date_appointment_appointment_date_and_more','2025-04-09 06:27:41.383663'),(24,'clinic','0006_rename_name_pet_pet_name_pet_date_of_birth','2025-04-09 09:15:05.655777'),(25,'clinic','0007_alter_pet_owner','2025-04-09 10:47:04.533397'),(26,'clinic','0008_notification','2025-04-09 14:49:11.838774');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6ge3tghbmpyrc8cxlm9jc6ed43z8uwq2','.eJxVjMEOwiAQRP-FsyEsFVg8evcbyMJSqRpISnsy_rtt0oMeZ96beYtA61LC2vMcJhYXMYjTbxcpPXPdAT-o3ptMrS7zFOWuyIN2eWucX9fD_Tso1Mu2VmDckCB7hcgGo2drNWs1Inskb-2ZIqBGnZPbAnoYHIzMaJijSSA-X74-NzQ:1u2nhh:wbomYpDx3feWaIMgst96Ny6mCRZzLGaFl-ZrEdYzErw','2025-04-24 08:56:09.797345'),('qe31hfaflxjbb4l1zyxplkxmicbupfgw','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWnsdHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4EzszyU6_W8L8KG0HdMd26zz3ti5z4rvCDzr4tVN5Xg7376DiqN86KyRrJQV0AJMyklwAr6TXwpDSwUCBqZB2OhmPIljKYD14bwVppZG9P8NDNsQ:1u2VaE:zkRh6L_qc-mGhKjoJdY88Unf1YlI77IBb6XoFNh1ROE','2025-04-23 13:35:14.014173'),('ys88pv29nr14ewarsypwlwi8bonhaov9','.eJxVjMEOwiAQRP-FsyEsFVg8evcbyMJSqRpISnsy_rtt0oMeZ96beYtA61LC2vMcJhYXMYjTbxcpPXPdAT-o3ptMrS7zFOWuyIN2eWucX9fD_Tso1Mu2VmDckCB7hcgGo2drNWs1Inskb-2ZIqBGnZPbAnoYHIzMaJijSSA-X74-NzQ:1u2Xdy:cO2i94WL9yoPWiH834WbQkLzkqxro0MMsZX9TsumRTI','2025-04-23 15:47:14.080374');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-10 21:45:10
