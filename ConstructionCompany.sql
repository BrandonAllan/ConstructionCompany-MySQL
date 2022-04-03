CREATE DATABASE  IF NOT EXISTS `ConstructionCompany` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ConstructionCompany`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ConstructionCompany
-- ------------------------------------------------------
-- Server version	8.0.28

-- Brandon Trujillo 
-- Construction Company Database
-- Date 2022-03-23

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
-- Table structure for table `capital`
--

DROP TABLE IF EXISTS `capital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capital` (
  `code_Capital` int NOT NULL,
  `dni_owner` int DEFAULT NULL,
  `code_work` int DEFAULT NULL,
  `code_Material` int DEFAULT NULL,
  `code_Partners` int DEFAULT NULL,
  `code_Employees` int DEFAULT NULL,
  `Date_Payment` datetime DEFAULT CURRENT_TIMESTAMP,
  `code_Supplier` int DEFAULT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_Capital`),
  KEY `dni_owner` (`dni_owner`),
  KEY `code_work` (`code_work`),
  KEY `code_Material` (`code_Material`),
  KEY `code_Partners` (`code_Partners`),
  KEY `code_Employees` (`code_Employees`),
  KEY `code_Supplier` (`code_Supplier`),
  CONSTRAINT `capital_ibfk_1` FOREIGN KEY (`dni_owner`) REFERENCES `owner` (`dni_owner`),
  CONSTRAINT `capital_ibfk_2` FOREIGN KEY (`code_work`) REFERENCES `works` (`code_Work`),
  CONSTRAINT `capital_ibfk_3` FOREIGN KEY (`code_Material`) REFERENCES `materials` (`code_material`),
  CONSTRAINT `capital_ibfk_4` FOREIGN KEY (`code_Partners`) REFERENCES `partner` (`code_partner`),
  CONSTRAINT `capital_ibfk_5` FOREIGN KEY (`code_Employees`) REFERENCES `employees` (`code_Employee`),
  CONSTRAINT `capital_ibfk_6` FOREIGN KEY (`code_Supplier`) REFERENCES `supplier` (`code_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capital`
--

LOCK TABLES `capital` WRITE;
/*!40000 ALTER TABLE `capital` DISABLE KEYS */;
INSERT INTO `capital` VALUES (101,938205580,NULL,NULL,201,301,'2022-03-10 00:00:00',NULL,'2022-03-22 17:19:47',NULL),(102,NULL,602,1002,NULL,NULL,'2022-03-10 00:00:00',2002,'2022-03-22 17:19:47',NULL),(103,938202768,NULL,NULL,203,303,'2022-03-10 00:00:00',NULL,'2022-03-22 17:19:47',NULL),(104,NULL,604,1004,NULL,NULL,'2022-03-10 00:00:00',2004,'2022-03-22 17:19:47',NULL),(105,907652781,605,1005,205,305,'2022-03-10 00:00:00',2005,'2022-03-22 17:19:47',NULL);
/*!40000 ALTER TABLE `capital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `code_client` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `paternal_surname` varchar(20) NOT NULL,
  `maternal_surname` varchar(20) NOT NULL,
  `avenuestreet_address_partner` varchar(40) NOT NULL,
  `housenumber_address_partner` varchar(40) NOT NULL,
  `zone_address_partner` varchar(40) NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (401,'Abel','Fuentes','Jimenez','Saavedra','4536','Miraflores','2022-03-22 11:29:47',NULL),(402,'Miguel','Cueva','Villanueva','Ballivian','3421','Calacoto','2022-03-22 11:29:47',NULL),(403,'Eduardo','Paredes','Perez','14 de Septiembre','234','Obrajes','2022-03-22 11:29:47',NULL),(404,'Jesus','Gonzales','Salazar','Busch','3452','Miraflores','2022-03-22 11:29:47',NULL),(405,'Brayan','Meneses','Flores','Saavedra','2246','Miraflores','2022-03-22 11:29:47',NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `code_contract` int NOT NULL,
  `code_partners` int DEFAULT NULL,
  `code_Employees` int DEFAULT NULL,
  `code_Work` int DEFAULT NULL,
  `permanent` varchar(2) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_contract`),
  KEY `code_partners` (`code_partners`),
  KEY `code_Employees` (`code_Employees`),
  KEY `code_Work` (`code_Work`),
  CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`code_partners`) REFERENCES `partner` (`code_partner`),
  CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`code_Employees`) REFERENCES `employees` (`code_Employee`),
  CONSTRAINT `contracts_ibfk_3` FOREIGN KEY (`code_Work`) REFERENCES `works` (`code_Work`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (3001,201,NULL,NULL,'No','2022-01-01','2022-12-31','2022-03-22 17:10:57',NULL),(3002,NULL,302,NULL,'No','2022-01-01','2022-12-31','2022-03-22 17:10:57',NULL),(3003,NULL,NULL,603,'Si','2022-03-08',NULL,'2022-03-22 17:10:57',NULL),(3004,NULL,301,NULL,'No','2022-01-01','2022-12-31','2022-03-22 17:10:57',NULL),(3005,NULL,303,NULL,'No','2022-01-01','2022-12-31','2022-03-22 17:10:57',NULL),(3006,202,NULL,NULL,'No','2022-01-01','2022-12-31','2022-03-22 17:10:57',NULL),(3007,203,NULL,NULL,'No','2022-01-01','2022-12-31','2022-03-22 17:10:57',NULL),(3008,NULL,NULL,601,'Si','2022-02-22',NULL,'2022-03-22 17:10:57',NULL),(3009,NULL,NULL,602,'Si','2022-01-10',NULL,'2022-03-22 17:10:57',NULL);
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `dni_owner` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `paternal_surname` varchar(20) NOT NULL,
  `maternal_surname` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `phone_number` int NOT NULL,
  `salary_owner` int NOT NULL,
  `contribution_owner` int NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`dni_owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (832785512,'Stephan','Zapata','Farfan',30,72635499,10000,25000,'2022-03-22 11:46:01',NULL),(907652781,'Samuel','Valverde','Martinez',38,69817466,10000,25000,'2022-03-22 11:46:01',NULL),(936545115,'Jose','Carbajal','Gonzales',33,62521545,10000,25000,'2022-03-22 11:46:01',NULL),(938202768,'Manuel','Aguilar','Ruiz',35,64921212,10000,25000,'2022-03-22 11:46:01',NULL),(938205580,'Victor','Campos','Rojas',33,64621212,10000,25000,'2022-03-22 00:00:00',NULL);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `code_Employee` int NOT NULL,
  `dni_Employee` int NOT NULL,
  `name_Employee` varchar(20) NOT NULL,
  `paternal_surname` varchar(20) NOT NULL,
  `maternal_surname` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `phone_number` int NOT NULL,
  `code_type_employee` int NOT NULL,
  `salary_Employee` int NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  `Code_Workinghours` int NOT NULL,
  PRIMARY KEY (`code_Employee`),
  KEY `code_type_employee` (`code_type_employee`),
  KEY `Code_Workinghours` (`Code_Workinghours`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`code_type_employee`) REFERENCES `type_employee` (`code_type_employee`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`Code_Workinghours`) REFERENCES `workinghours` (`Code_Workinghours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (301,938725845,'Marco','Caballero','Buleje',28,62541132,701,4000,'2022-03-22 16:20:40',NULL,1),(302,938205730,'Roberto','Cabrera','Criollo',32,69052220,702,8000,'2022-03-22 16:20:40',NULL,2),(303,936828258,'Jose','Calderon','Gonza',35,64782111,704,3500,'2022-03-22 16:20:40',NULL,1),(304,907652678,'Brian','Alvarado','Choque',29,67856344,703,8000,'2022-03-22 16:20:40',NULL,3),(305,903647821,'Nestor','Ramirez','Sanchez',30,67846355,705,6500,'2022-03-22 16:20:40',NULL,4);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workinghours`
--

DROP TABLE IF EXISTS `workinghours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workinghours` (
  `code_workinghours` int NOT NULL,
  `workinghours` varchar(35) NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_workinghours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workinghours`
--

LOCK TABLES `workinghours` WRITE;
/*!40000 ALTER TABLE `workinghours` DISABLE KEYS */;
INSERT INTO `workinghours` VALUES (1,'09:00-17:00','2022-03-22 15:49:42',NULL),(2,'08:00-16:00','2022-03-22 15:49:42',NULL),(3,'08:00-12:00','2022-03-22 15:49:42',NULL),(4,'14:00-18:00','2022-03-22 15:49:42',NULL),(5,'07:00-19:00','2022-03-22 15:49:42',NULL);
/*!40000 ALTER TABLE `workinghours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials` (
  `code_material` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `quantity` int NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (1001,'Ceramicos',1000,'2022-03-22 16:27:31',NULL),(1002,'Aglomerantes',1000,'2022-03-22 16:27:31',NULL),(1003,'Madera',1000,'2022-03-22 16:27:31',NULL),(1004,'Cemento',1000,'2022-03-22 16:27:31',NULL),(1005,'Fierro',500,'2022-03-22 16:27:31',NULL);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials_supplier`
--

DROP TABLE IF EXISTS `materials_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials_supplier` (
  `code_material` int NOT NULL,
  `code_supplier` int NOT NULL,
  `date_purchase` date DEFAULT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`code_material`,`code_supplier`),
  KEY `code_supplier` (`code_supplier`),
  CONSTRAINT `materials_supplier_ibfk_1` FOREIGN KEY (`code_supplier`) REFERENCES `supplier` (`code_supplier`),
  CONSTRAINT `materials_supplier_ibfk_2` FOREIGN KEY (`code_material`) REFERENCES `materials` (`code_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials_supplier`
--

LOCK TABLES `materials_supplier` WRITE;
/*!40000 ALTER TABLE `materials_supplier` DISABLE KEYS */;
INSERT INTO `materials_supplier` VALUES (1001,2001,'2021-09-17','2022-03-22 16:34:58',NULL,100),(1002,2002,'2021-10-10','2022-03-22 16:34:58',NULL,200),(1003,2003,'2021-05-29','2022-03-22 16:34:58',NULL,150),(1004,2004,'2022-03-11','2022-03-22 16:34:58',NULL,500),(1005,2005,'2022-03-10','2022-03-22 16:34:58',NULL,300);
/*!40000 ALTER TABLE `materials_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `code_supplier` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (2001,'Briction','2022-03-22 16:29:56',NULL),(2002,'Tcoex','2022-03-22 16:29:56',NULL),(2003,'Teczone','2022-03-22 16:29:56',NULL),(2004,'Campo Brick','2022-03-22 16:29:56',NULL),(2005,'ZTE Bricks','2022-03-22 16:29:56',NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner` (
  `code_partner` int NOT NULL,
  `dni_partner` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `paternal_surname` varchar(20) NOT NULL,
  `maternal_surname` varchar(20) NOT NULL,
  `avenuestreet_address_partner` varchar(40) NOT NULL,
  `housenumber_address_partner` varchar(40) NOT NULL,
  `zone_address_partner` varchar(40) NOT NULL,
  `contribution_partner` int NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_partner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
INSERT INTO `partner` VALUES (201,936520741,'Edgar','Vargas','Lozano','Calle 10','551','Calacoto',30000,'2022-03-22 12:02:35',NULL),(202,938202456,'Jeison','Rojas','Garcia','Calle 53','1060','Cota Cota',50000,'2022-03-22 12:02:35',NULL),(203,938754554,'Roly','Soto','Hinojosa','Calle 19','8040','Achumani',70000,'2022-03-22 12:02:35',NULL),(204,938754123,'Kevin','Pomier','Salas','20 de Octubre','2345','Sopocachi',100000,'2022-03-22 12:02:35',NULL),(205,938759876,'Fabian','Monroy','Salmon','Costanera','3491','Obrajes',30000,'2022-03-22 12:02:35',NULL);
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_employee`
--

DROP TABLE IF EXISTS `type_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_employee` (
  `code_type_employee` int NOT NULL,
  `description` varchar(30) NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_type_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_employee`
--

LOCK TABLES `type_employee` WRITE;
/*!40000 ALTER TABLE `type_employee` DISABLE KEYS */;
INSERT INTO `type_employee` VALUES (701,'Administrador','2022-03-22 12:06:53',NULL),(702,'Arquitecto','2022-03-22 12:06:53',NULL),(703,'Ingenierio Civil','2022-03-22 12:06:53',NULL),(704,'Obrero','2022-03-22 12:06:53',NULL),(705,'Ingeniero Ambiental','2022-03-22 12:06:53',NULL);
/*!40000 ALTER TABLE `type_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_material`
--

DROP TABLE IF EXISTS `type_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_material` (
  `code_material` int NOT NULL,
  `price_unit` int NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_material`),
  CONSTRAINT `type_material_ibfk_1` FOREIGN KEY (`code_material`) REFERENCES `materials` (`code_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_material`
--

LOCK TABLES `type_material` WRITE;
/*!40000 ALTER TABLE `type_material` DISABLE KEYS */;
INSERT INTO `type_material` VALUES (1001,80,'2022-03-22 00:00:00',NULL),(1002,65,'2022-03-22 16:32:02',NULL),(1003,78,'2022-03-22 16:32:02',NULL),(1004,64,'2022-03-22 16:32:02',NULL),(1005,90,'2022-03-22 16:32:02',NULL);
/*!40000 ALTER TABLE `type_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_work`
--

DROP TABLE IF EXISTS `type_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_work` (
  `code_type_work` int NOT NULL,
  `description` varchar(30) NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_type_work`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_work`
--

LOCK TABLES `type_work` WRITE;
/*!40000 ALTER TABLE `type_work` DISABLE KEYS */;
INSERT INTO `type_work` VALUES (801,'Ampliacion y Remodelacion','2022-03-22 16:25:39',NULL),(802,'Diseño de interiores','2022-03-22 16:25:39',NULL),(803,'Diseño de planos','2022-03-22 16:25:39',NULL),(804,'Ejecucion de obras','2022-03-22 16:25:39',NULL),(805,'Servicios Inmobiliarios','2022-03-22 16:25:39',NULL),(806,'Supervision de Obras','2022-03-22 16:25:39',NULL);
/*!40000 ALTER TABLE `type_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_client`
--

DROP TABLE IF EXISTS `work_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_client` (
  `code_work_client` int NOT NULL,
  `code_work` int NOT NULL,
  `code_client` int NOT NULL,
  `request_date` date DEFAULT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_work_client`),
  KEY `code_work` (`code_work`),
  KEY `code_client` (`code_client`),
  CONSTRAINT `work_client_ibfk_1` FOREIGN KEY (`code_work`) REFERENCES `works` (`code_work`),
  CONSTRAINT `work_client_ibfk_2` FOREIGN KEY (`code_client`) REFERENCES `client` (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_client`
--

LOCK TABLES `work_client` WRITE;
/*!40000 ALTER TABLE `work_client` DISABLE KEYS */;
INSERT INTO `work_client` VALUES (901,601,401,'2021-07-23','2022-03-22 16:44:10',NULL),(902,602,402,'2021-10-16','2022-03-22 16:44:10',NULL),(903,603,403,'2021-11-16','2022-03-22 16:44:10',NULL),(904,604,404,'2022-01-08','2022-03-22 16:44:10',NULL),(905,605,405,'2022-02-14','2022-03-22 16:44:10',NULL);
/*!40000 ALTER TABLE `work_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_material`
--

DROP TABLE IF EXISTS `work_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_material` (
  `code_material` int NOT NULL,
  `code_work` int NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_material`,`code_work`),
  KEY `code_work` (`code_work`),
  CONSTRAINT `work_material_ibfk_1` FOREIGN KEY (`code_work`) REFERENCES `works` (`code_work`),
  CONSTRAINT `work_material_ibfk_2` FOREIGN KEY (`code_material`) REFERENCES `materials` (`code_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_material`
--

LOCK TABLES `work_material` WRITE;
/*!40000 ALTER TABLE `work_material` DISABLE KEYS */;
INSERT INTO `work_material` VALUES (1001,601,'2022-03-22 16:50:17',NULL),(1002,602,'2022-03-22 16:50:17',NULL),(1003,603,'2022-03-22 16:50:17',NULL),(1004,602,'2022-03-22 16:50:17',NULL),(1005,603,'2022-03-22 16:50:17',NULL);
/*!40000 ALTER TABLE `work_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `code_Work` int NOT NULL,
  `Name_work` varchar(20) NOT NULL,
  `scope` varchar(20) DEFAULT NULL,
  `price` int NOT NULL,
  `code_type_work` int NOT NULL,
  `Date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `Date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`code_Work`),
  KEY `code_type_work` (`code_type_work`),
  CONSTRAINT `works_ibfk_1` FOREIGN KEY (`code_type_work`) REFERENCES `type_work` (`code_type_work`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES (601,'Plano-Alto Obrajes','Primer Piso',3500,803,'2022-03-22 16:41:35',NULL),(602,'Elevacion Muros','Manzano',15000,804,'2022-03-22 16:41:35',NULL),(603,'Casa Irpavi',NULL,4000,805,'2022-03-22 16:41:35',NULL),(604,'Elevacion Muros','Manzano',15000,804,'2022-03-22 16:43:17',NULL),(605,'Casa Cota Cota',NULL,4000,805,'2022-03-22 16:43:17',NULL);
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-23 16:07:06
