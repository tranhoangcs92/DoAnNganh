-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bidding_8112022
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('Male','Female','LGBT') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Male',
  `birthday` timestamp NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_type` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,NULL,'Trần','Hoàng',NULL,'admin@gmail.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Male',NULL,NULL,NULL,0,NULL,NULL),(2,NULL,NULL,NULL,'Thế giới di động','thegioididong@gmail.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Male',NULL,NULL,NULL,1,NULL,NULL),(3,NULL,NULL,NULL,'Nguyễn Kim','nguyenkim@gmail.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Male',NULL,NULL,NULL,1,NULL,NULL),(4,NULL,NULL,NULL,'Adidas','adidas@gmail.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Male',NULL,NULL,NULL,1,NULL,NULL),(5,NULL,NULL,NULL,'Nike','nike@gmail.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Male',NULL,NULL,NULL,1,NULL,NULL),(6,NULL,NULL,NULL,'Gucci','gucci@gmail.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Male',NULL,NULL,NULL,1,NULL,NULL),(7,NULL,NULL,NULL,'Apple Store','apple@gmail.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Male',NULL,NULL,NULL,1,NULL,NULL),(8,NULL,NULL,NULL,'Samsung Store','samsung@gmail.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Male',NULL,NULL,NULL,1,NULL,NULL),(9,NULL,NULL,NULL,'Cellphones','cellphones','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Male',NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions`
--

DROP TABLE IF EXISTS `auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `time_start` timestamp NOT NULL,
  `time_end` timestamp NOT NULL,
  `price_start` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_admin` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auctions_id_admin_foreign` (`id_admin`),
  CONSTRAINT `auctions_id_admin_foreign` FOREIGN KEY (`id_admin`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions`
--

LOCK TABLES `auctions` WRITE;
/*!40000 ALTER TABLE `auctions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `id_user` bigint unsigned NOT NULL,
  `id_product_auction` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bids_id_user_foreign` (`id_user`),
  KEY `bids_id_product_auction_foreign` (`id_product_auction`),
  CONSTRAINT `bids_id_product_auction_foreign` FOREIGN KEY (`id_product_auction`) REFERENCES `product_auctions` (`id`),
  CONSTRAINT `bids_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Công nghệ','2022-12-01 19:04:22','2022-12-01 19:04:22'),(2,'Gia dụng','2022-12-01 19:04:30','2022-12-01 19:04:30'),(3,'Mỹ phẩm','2022-12-01 19:04:35','2022-12-01 19:04:35');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` bigint unsigned NOT NULL,
  `id_bid` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_id_user_foreign` (`id_user`),
  KEY `comments_id_bid_foreign` (`id_bid`),
  CONSTRAINT `comments_id_bid_foreign` FOREIGN KEY (`id_bid`) REFERENCES `bids` (`id`),
  CONSTRAINT `comments_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `histories`
--

DROP TABLE IF EXISTS `histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_win_bidding` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `histories_id_win_bidding_foreign` (`id_win_bidding`),
  CONSTRAINT `histories_id_win_bidding_foreign` FOREIGN KEY (`id_win_bidding`) REFERENCES `win_biddings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histories`
--

LOCK TABLES `histories` WRITE;
/*!40000 ALTER TABLE `histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (151,'2014_10_12_000000_create_users_table',1),(152,'2014_10_12_100000_create_password_resets_table',1),(153,'2019_08_19_000000_create_failed_jobs_table',1),(154,'2019_12_14_000001_create_personal_access_tokens_table',1),(155,'2022_10_23_140233_create_categories_table',1),(156,'2022_10_23_142034_create_admins_table',1),(157,'2022_10_23_142612_create_products_table',1),(158,'2022_10_23_143403_create_auctions_table',1),(159,'2022_10_23_143432_create_product_auctions_table',1),(160,'2022_10_23_143924_create_bids_table',1),(161,'2022_10_23_144348_create_transports_table',1),(162,'2022_10_23_144931_create_transport_shops_table',1),(163,'2022_10_23_145233_create_payments_table',1),(164,'2022_10_23_145409_create_win_biddings_table',1),(165,'2022_10_23_150120_create_histories_table',1),(166,'2022_11_03_105306_create_comments_table',1),(167,'2022_11_08_145735_add_created_by_to_users',1),(168,'2022_11_11_162652_add_price_to_products',1),(169,'2022_11_16_180158_add_time_to_product_auctions_table',1),(170,'2022_11_18_210518_add_status_to_product_auctions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'Tiền mặt',NULL,NULL),(2,'Thẻ ngân hàng',NULL,NULL),(3,'VISA',NULL,NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\admin',1,'authToken','232677ddfb0881ce61457b43b8262a580817b4ecc5a5015705fdd6dc9dc60637','[\"server:update\"]','2022-12-01 20:09:01',NULL,'2022-12-01 19:04:08','2022-12-01 20:09:01'),(2,'App\\Models\\User',11,'authToken','20111f5018c225862cf8dd35dcef0183c61a61ebbe6dd9478e589b4227cc4748','[\"server:update\"]','2022-12-01 20:10:17',NULL,'2022-12-01 19:13:50','2022-12-01 20:10:17'),(3,'App\\Models\\User',11,'authToken','a89f72ed9a8560da267df94c6ef11f255457a0440a3438564fc077c4502b4ff6','[\"server:update\"]','2022-12-01 20:03:05',NULL,'2022-12-01 19:29:24','2022-12-01 20:03:05'),(4,'App\\Models\\User',12,'authToken','e0101e23c2c04de05965ace3680270807497771938088207b966270add10488d','[\"server:update\"]','2022-12-02 01:39:33',NULL,'2022-12-01 19:45:08','2022-12-02 01:39:33'),(5,'App\\Models\\User',11,'authToken','4670014540e63e62a75c6168b779eb280a5286fb3a250efe40f4703ea0e0041b','[\"server:update\"]','2022-12-01 20:09:44',NULL,'2022-12-01 20:03:27','2022-12-01 20:09:44'),(6,'App\\Models\\admin',1,'authToken','1081fb7442b6bb13c96e5dc6ae17729a553a76616c08eb9ed5e37141005e82c9','[\"server:update\"]',NULL,NULL,'2022-12-02 01:12:25','2022-12-02 01:12:25'),(7,'App\\Models\\admin',1,'authToken','8163f95942bce652a002d44024d77973474d1a7e7a361852512a0b741a701be2','[\"server:update\"]',NULL,NULL,'2022-12-02 01:13:21','2022-12-02 01:13:21'),(8,'App\\Models\\User',11,'authToken','da38b3e46cd9c70d7f1dd29b1b4829b65badb2a4c8817ec301b12afd4eb999fd','[\"server:update\"]',NULL,NULL,'2022-12-02 01:15:13','2022-12-02 01:15:13'),(9,'App\\Models\\admin',1,'authToken','8590c7640b7f66e23373448d0b6d86a729528719034c0b61605123537fdcbbc5','[\"server:update\"]','2023-08-13 03:59:27',NULL,'2022-12-02 01:27:03','2023-08-13 03:59:27'),(10,'App\\Models\\User',11,'authToken','39dc9829c479fedc13eeed70f9bf5b70c11c0805ebeab8c58b81a27badbb5ea7','[\"server:update\"]','2022-12-02 01:28:29',NULL,'2022-12-02 01:28:15','2022-12-02 01:28:29'),(11,'App\\Models\\User',11,'authToken','9d854d647511879090ba05114bc04eb10f1cec5c6b82b8be4722ef2be7201030','[\"server:update\"]','2022-12-02 01:45:00',NULL,'2022-12-02 01:41:34','2022-12-02 01:45:00'),(12,'App\\Models\\User',12,'authToken','21ac65ef7299a3ffa2346d79bdddf02140d1a226d4f940f7d5c649bf95eacc78','[\"server:update\"]','2023-01-10 01:24:17',NULL,'2022-12-02 01:42:01','2023-01-10 01:24:17'),(13,'App\\Models\\User',11,'authToken','5c586d17e8ec5c79d33ec293b272fe0c467ff15ed726ed173d4258116a27aad5','[\"server:update\"]','2023-02-14 02:39:05',NULL,'2023-02-14 02:33:39','2023-02-14 02:39:05'),(14,'App\\Models\\User',11,'authToken','b533cc90270df1a7d3f458935df1abd32fa442aba3ac6e219808abcdc4c2c118','[\"server:update\"]','2023-06-08 06:07:25',NULL,'2023-02-14 02:39:24','2023-06-08 06:07:25'),(15,'App\\Models\\User',12,'authToken','838a95ad94055ac5e1e9456c2e856f13bee4e7af199a0ff6dafc1d406584fac4','[\"server:update\"]','2023-02-14 02:40:21',NULL,'2023-02-14 02:39:45','2023-02-14 02:40:21'),(16,'App\\Models\\User',13,'authToken','39c3558f96335a2e16a913952df73372e489ae6e2140bbe3cc38186fbcec7d08','[\"server:update\"]','2023-04-13 08:13:51',NULL,'2023-04-13 08:13:06','2023-04-13 08:13:51'),(17,'App\\Models\\User',14,'authToken','d44b566dc76ddbd7a21d7d8392512453be27ca690863f205239de54fec4ecee9','[\"server:update\"]','2023-06-08 09:17:37',NULL,'2023-06-08 06:08:36','2023-06-08 09:17:37'),(18,'App\\Models\\User',15,'authToken','ab2a34e378badd6c3c859d72fa4264dd6b59656d15aee416631bfb3bff06dc6f','[\"server:update\"]','2023-07-30 10:51:01',NULL,'2023-06-08 09:18:44','2023-07-30 10:51:01'),(19,'App\\Models\\User',12,'authToken','a0146ab6634f94346bc5b9e7bf0e7d53fad1e7e85dfe2d4c2137f96d5d933b58','[\"server:update\"]','2023-08-13 04:05:18',NULL,'2023-08-13 03:55:35','2023-08-13 04:05:18'),(20,'App\\Models\\User',11,'authToken','7b9bc8fe6888468b0e1dd90c20595871b8c4f634d076d63abfabb88b4ba0e85f','[\"server:update\"]','2023-08-13 04:05:18',NULL,'2023-08-13 04:02:40','2023-08-13 04:05:18'),(21,'App\\Models\\admin',1,'authToken','1082fb5d78fce67de6d58a57802abdb6b2ec462750ec4d0c30854ccaff049ffa','[\"server:update\"]','2023-08-25 22:14:28',NULL,'2023-08-25 22:05:56','2023-08-25 22:14:28'),(22,'App\\Models\\User',11,'authToken','bea4ab4ced3525af3c6364dae94278ce9f7c5da9dec03ae11856b200ac7e6803','[\"server:update\"]','2023-08-26 02:30:08',NULL,'2023-08-25 22:11:55','2023-08-26 02:30:08'),(23,'App\\Models\\admin',1,'authToken','8306d778e79f2d17a6dbdc094b22a5037dbbe8eb4d45485733984b4f4a5836f8','[\"server:update\"]','2023-08-26 02:30:08',NULL,'2023-08-25 22:17:01','2023-08-26 02:30:08');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_auctions`
--

DROP TABLE IF EXISTS `product_auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_auctions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_product` bigint unsigned NOT NULL,
  `id_auction` bigint unsigned NOT NULL,
  `time_start` timestamp NULL DEFAULT NULL,
  `time_end` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_auctions_id_product_foreign` (`id_product`),
  KEY `product_auctions_id_auction_foreign` (`id_auction`),
  CONSTRAINT `product_auctions_id_auction_foreign` FOREIGN KEY (`id_auction`) REFERENCES `auctions` (`id`),
  CONSTRAINT `product_auctions_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_auctions`
--

LOCK TABLES `product_auctions` WRITE;
/*!40000 ALTER TABLE `product_auctions` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_category` bigint unsigned NOT NULL,
  `id_admin` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id_category_foreign` (`id_category`),
  KEY `products_id_admin_foreign` (`id_admin`),
  CONSTRAINT `products_id_admin_foreign` FOREIGN KEY (`id_admin`) REFERENCES `admins` (`id`),
  CONSTRAINT `products_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Samsung Tab S8+','8_samsung-s8-bac.png',1,8,'2022-12-01 19:05:08','2022-12-01 19:05:08',1000),(2,'Iphone 14 pro max','7_2_t_m_12.png',1,7,'2022-12-02 01:27:32','2022-12-02 01:27:32',1000),(3,'Ipad pro 2023','3_images.jpeg',1,3,'2023-08-13 03:42:00','2023-08-13 03:42:00',1000);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_admins`
--

DROP TABLE IF EXISTS `transport_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport_admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_transport` bigint unsigned NOT NULL,
  `id_admin` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transport_admins_id_transport_foreign` (`id_transport`),
  KEY `transport_admins_id_admin_foreign` (`id_admin`),
  CONSTRAINT `transport_admins_id_admin_foreign` FOREIGN KEY (`id_admin`) REFERENCES `admins` (`id`),
  CONSTRAINT `transport_admins_id_transport_foreign` FOREIGN KEY (`id_transport`) REFERENCES `transports` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_admins`
--

LOCK TABLES `transport_admins` WRITE;
/*!40000 ALTER TABLE `transport_admins` DISABLE KEYS */;
INSERT INTO `transport_admins` VALUES (1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `transport_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport_type` enum('GHTK','GHN','Ninja','Express') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'GHN',
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transports`
--

LOCK TABLES `transports` WRITE;
/*!40000 ALTER TABLE `transports` DISABLE KEYS */;
INSERT INTO `transports` VALUES (1,'shopee','GHN',1,NULL,NULL),(2,'shopee','GHTK',1,NULL,NULL),(3,'shopee','Ninja',1,NULL,NULL);
/*!40000 ALTER TABLE `transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('Male','Female','LGBT') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Male',
  `birthday` timestamp NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Garth Grady','Reese Rowe','Male',NULL,NULL,NULL,'5783337','maurine.feil@example.com','2022-12-01 18:58:20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','8uiyxFZiZY','2022-12-01 18:58:20','2022-12-01 18:58:20',NULL),(2,'Brent Collier','Henry Fritsch','Male',NULL,NULL,NULL,'2464841','howard.schmeler@example.net','2022-12-01 18:58:20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','pgxsXcTYU3','2022-12-01 18:58:20','2022-12-01 18:58:20',NULL),(3,'Tabitha Brakus DVM','Mr. Felton Marquardt MD','Male',NULL,NULL,NULL,'8647207','jude.nienow@example.net','2022-12-01 18:58:20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bGnJEBOvJ6','2022-12-01 18:58:20','2022-12-01 18:58:20',NULL),(4,'Mrs. Karlee Beahan I','Marjory Grimes','Male',NULL,NULL,NULL,'5110801','frieda11@example.net','2022-12-01 18:58:20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6uieMv94kc','2022-12-01 18:58:20','2022-12-01 18:58:20',NULL),(5,'Emmie Batz IV','Jon Franecki','Male',NULL,NULL,NULL,'3255368','qdouglas@example.com','2022-12-01 18:58:20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BtZ6X3igcz','2022-12-01 18:58:20','2022-12-01 18:58:20',NULL),(6,'Efren Steuber','Albin Homenick','Male',NULL,NULL,NULL,'4841641','akeebler@example.com','2022-12-01 18:58:20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Bb6zihcLzu','2022-12-01 18:58:20','2022-12-01 18:58:20',NULL),(7,'Mario Herman','Emelia Reichert I','Male',NULL,NULL,NULL,'2186186','cbogan@example.com','2022-12-01 18:58:20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','oKISdX7LfS','2022-12-01 18:58:20','2022-12-01 18:58:20',NULL),(8,'Miss Claudia Bechtelar DDS','Kimberly Strosin','Male',NULL,NULL,NULL,'0187671','nikolaus.easton@example.net','2022-12-01 18:58:20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','MEF03H1dCH','2022-12-01 18:58:20','2022-12-01 18:58:20',NULL),(9,'Mrs. Herminia Dach I','Scot Harvey','Male',NULL,NULL,NULL,'7853130','dominic98@example.net','2022-12-01 18:58:20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','38rbL0Nul9','2022-12-01 18:58:20','2022-12-01 18:58:20',NULL),(10,'Ayla Kohler','Laney Stroman','Male',NULL,NULL,NULL,'3823417','laverna.grant@example.org','2022-12-01 18:58:20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','0Rf6erKSm9','2022-12-01 18:58:20','2022-12-01 18:58:20',NULL),(11,'Trần','Hoàng','Male',NULL,NULL,NULL,NULL,'user@gmail.com',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,NULL),(12,'Mỹ','Duyên','Male',NULL,NULL,NULL,NULL,'user01@gmail.com',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,NULL),(13,'Trần','Hoàng','Male','2023-04-09 10:00:00','192033393','','0812765357','user0001@gmail.com',NULL,'$2y$10$4QCja7BYszwmDLLXDeOzJuFVbdlvWkOpLyzYHsc8aglv/j9O460K6',NULL,'2023-04-13 08:12:56','2023-04-13 08:12:56',NULL),(14,'tran','hoang','Male','2000-01-11 10:00:00','192033393','','0817165357','customer01@gmail.com',NULL,'$2y$10$3sUuN6HTYBOujV69YLFWyeho1Bxvrbo1g1mqqZCw8oligP3eTExFu',NULL,'2023-06-08 06:08:21','2023-06-08 06:08:21',NULL),(15,'tran','hoang','Male','1986-04-06 10:00:00','192033393','','0817711357','customer02@gmail.com',NULL,'$2y$10$hfnXPDaLbDiXijOOvWi0V.lJfoLrWLpPVLZVBoVKqeUZm6hG/2kpW',NULL,'2023-06-08 09:18:35','2023-06-08 09:18:35',NULL),(22,'Trần','Hoàng','Male','2023-08-14 10:00:00','192033393','','0817765357','1951012033hoang@ou.edu.vn',NULL,'$2y$10$A/oqFk3RjGbBiligdUwdvuBAUDt5zI2P5x0ngL9v2BMFAaA3ISPZG',NULL,'2023-08-13 03:32:06','2023-08-13 03:32:06',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `win_biddings`
--

DROP TABLE IF EXISTS `win_biddings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `win_biddings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `delivery_status` enum('Dang Xu ly','Dang Giao Hang','Thanh Cong') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Dang Xu ly',
  `id_bid` bigint unsigned NOT NULL,
  `id_payment` bigint unsigned NOT NULL,
  `id_transport_admin` bigint unsigned NOT NULL,
  `id_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `win_biddings_id_bid_foreign` (`id_bid`),
  KEY `win_biddings_id_payment_foreign` (`id_payment`),
  KEY `win_biddings_id_transport_admin_foreign` (`id_transport_admin`),
  CONSTRAINT `win_biddings_id_bid_foreign` FOREIGN KEY (`id_bid`) REFERENCES `bids` (`id`),
  CONSTRAINT `win_biddings_id_payment_foreign` FOREIGN KEY (`id_payment`) REFERENCES `payments` (`id`),
  CONSTRAINT `win_biddings_id_transport_admin_foreign` FOREIGN KEY (`id_transport_admin`) REFERENCES `transport_admins` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `win_biddings`
--

LOCK TABLES `win_biddings` WRITE;
/*!40000 ALTER TABLE `win_biddings` DISABLE KEYS */;
/*!40000 ALTER TABLE `win_biddings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-23 23:17:28
