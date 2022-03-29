-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: db_kritek_test
-- ------------------------------------------------------
-- Server version       8.0.28
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!50503 SET NAMES utf8mb4 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;
--
-- Table structure for table `customer`
--
DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `customer` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `customer`
--
LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */
;
INSERT INTO `customer`
VALUES (
        1,
        'Makenzie Shanahan III',
        'mann.travis@yahoo.com'
    ),
    (2, 'Kiel Kuvalis', 'ledner.amina@jast.com'),
    (
        3,
        'Catharine Bernier',
        'smith.adeline@hotmail.com'
    ),
    (4, 'Desiree Sipes', 'donnie77@hotmail.com'),
    (5, 'Berniece Kub', 'carol.grant@gmail.com'),
    (
        6,
        'Vallie Wyman III',
        'crooks.bridie@hotmail.com'
    ),
    (7, 'Dorris Ziemann', 'gdickens@effertz.com'),
    (
        8,
        'Prof. Angel Hegmann DVM',
        'vdenesik@yahoo.com'
    ),
    (
        9,
        'Dr. Cristopher Schmitt Jr.',
        'americo.tillman@daugherty.org'
    ),
    (10, 'Dayana Keeling', 'johns.mayra@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `doctrine_migration_versions`
--
DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `doctrine_migration_versions` (
    `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
    `executed_at` datetime DEFAULT NULL,
    `execution_time` int DEFAULT NULL,
    PRIMARY KEY (`version`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `doctrine_migration_versions`
--
LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */
;
INSERT INTO `doctrine_migration_versions`
VALUES (
        'DoctrineMigrations\\Version20220328141608',
        '2022-03-28 14:16:31',
        410
    ),
    (
        'DoctrineMigrations\\Version20220329134355',
        '2022-03-29 13:44:11',
        142
    );
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `invoice`
--
DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `invoice` (
    `id` int NOT NULL AUTO_INCREMENT,
    `customer_id` int NOT NULL,
    `invoice_date` date NOT NULL,
    `invoice_number` int NOT NULL,
    PRIMARY KEY (`id`),
    KEY `IDX_906517449395C3F3` (`customer_id`),
    CONSTRAINT `FK_906517449395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `invoice`
--
LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */
;
INSERT INTO `invoice`
VALUES (6, 1, '2017-01-01', 1),
    (7, 1, '2022-02-28', 2),
    (8, 1, '2022-03-01', 5),
    (9, 1, '2022-03-09', 4),
    (10, 1, '2022-02-28', 3),
    (11, 2, '2022-02-04', 6),
    (12, 2, '2022-03-03', 13),
    (15, 5, '2022-07-06', 193),
    (17, 7, '2022-03-11', 111),
    (18, 7, '2022-03-05', 1111);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `invoice_line`
--
DROP TABLE IF EXISTS `invoice_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `invoice_line` (
    `id` int NOT NULL AUTO_INCREMENT,
    `invoice_id` int NOT NULL,
    `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `quantity` int NOT NULL,
    `amount` decimal(3, 1) NOT NULL,
    `vat_amount` decimal(3, 1) NOT NULL,
    `total_with_vat` decimal(3, 1) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `IDX_D3D1D6932989F1FD` (`invoice_id`),
    CONSTRAINT `FK_D3D1D6932989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `invoice_line`
--
LOCK TABLES `invoice_line` WRITE;
/*!40000 ALTER TABLE `invoice_line` DISABLE KEYS */
;
INSERT INTO `invoice_line`
VALUES (1, 6, 'line 1', 10, 12.2, 10.3, 10.3),
    (2, 7, 'line 3', 10, 10.4, 10.3, 10.4),
    (3, 7, 'line 3', 20, 10.6, 10.6, 10.6),
    (4, 8, 'line', 12, 12.0, 12.0, 12.0),
    (5, 9, 'line5', 20, 10.2, 10.2, 10.2),
    (6, 10, 'line', 23, 10.0, 10.0, 10.0),
    (7, 11, 'line', 20, 20.0, 20.0, 20.0),
    (8, 12, 'line', 12, 23.3, 20.3, 20.3),
    (9, 15, 'line', 10, 1.2, 12.3, 12.2),
    (10, 17, 'line', 10, 1.2, 12.0, 11.0),
    (11, 18, 'line 1', 10, 1.1, 11.0, 10.0),
    (12, 18, 'line 2', 10, 1.2, 12.0, 11.0);
/*!40000 ALTER TABLE `invoice_line` ENABLE KEYS */
;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;
-- Dump completed on 2022-03-29 18:01:31