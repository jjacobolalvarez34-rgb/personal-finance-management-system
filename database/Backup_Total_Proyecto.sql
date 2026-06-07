-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: mysql-12d91c58-neutronwar34-47fc.a.aivencloud.com    Database: LP_PROYECTO
-- ------------------------------------------------------
-- Server version	8.4.8

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'c3a3d53e-5392-11f1-bb79-a2059e752e15:1-53';

--
-- Table structure for table `lp_auditoria`
--

DROP TABLE IF EXISTS `lp_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lp_auditoria` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(30) NOT NULL,
  `operacion` varchar(10) NOT NULL,
  `usuario_db` varchar(50) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `dato_anterior` longtext,
  `dato_nuevo` longtext,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lp_auditoria`
--

LOCK TABLES `lp_auditoria` WRITE;
/*!40000 ALTER TABLE `lp_auditoria` DISABLE KEYS */;
INSERT INTO `lp_auditoria` VALUES (1,'lp_transaccion','UPDATE','avnadmin@181.69.177.230','2026-05-19 15:03:39','Ant: 85000.00','Nuevo: 85000.00'),(2,'lp_transaccion','INSERT','avnadmin@181.69.177.230','2026-05-19 16:22:54',NULL,'Monto: 3500.00'),(3,'lp_transaccion','INSERT','avnadmin@181.69.177.230','2026-05-19 16:35:08',NULL,'Monto: 1000.00'),(4,'lp_transaccion','INSERT','avnadmin@181.69.177.230','2026-05-19 16:37:57',NULL,'Monto: 5500.00'),(5,'lp_transaccion','DELETE','avnadmin@181.69.177.230','2026-05-19 16:38:03','ID: 2 | Monto: 10500.50 | Desc: Compra Inicial de Prueba | Tipo: GASTO',NULL);
/*!40000 ALTER TABLE `lp_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lp_categoria`
--

DROP TABLE IF EXISTS `lp_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lp_categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `icono` varchar(50) DEFAULT NULL,
  `tipo` enum('INGRESO','GASTO') NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `fk_lp_cat_usuario` (`id_usuario`),
  CONSTRAINT `fk_lp_cat_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `lp_usuario` (`id_usuario`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lp_categoria`
--

LOCK TABLES `lp_categoria` WRITE;
/*!40000 ALTER TABLE `lp_categoria` DISABLE KEYS */;
INSERT INTO `lp_categoria` VALUES (1,NULL,'Alimentación',NULL,'GASTO'),(2,NULL,'Salario',NULL,'INGRESO'),(3,NULL,'Transporte',NULL,'GASTO');
/*!40000 ALTER TABLE `lp_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lp_cuenta`
--

DROP TABLE IF EXISTS `lp_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lp_cuenta` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nombre_cuenta` varchar(50) NOT NULL,
  `tipo_cuenta` varchar(20) NOT NULL,
  `moneda` varchar(5) NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `fk_lp_cta_usuario` (`id_usuario`),
  CONSTRAINT `fk_lp_cta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `lp_usuario` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lp_cuenta`
--

LOCK TABLES `lp_cuenta` WRITE;
/*!40000 ALTER TABLE `lp_cuenta` DISABLE KEYS */;
INSERT INTO `lp_cuenta` VALUES (1,1,'Billetera Efectivo','Efectivo','COP'),(2,1,'Cuenta Ahorros','Debito','COP');
/*!40000 ALTER TABLE `lp_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lp_presupuesto`
--

DROP TABLE IF EXISTS `lp_presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lp_presupuesto` (
  `id_presupuesto` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_categoria` int NOT NULL,
  `monto_limite` decimal(15,2) NOT NULL,
  `mes` int NOT NULL,
  `anio` int NOT NULL,
  PRIMARY KEY (`id_presupuesto`),
  KEY `fk_lp_pre_categoria` (`id_categoria`),
  KEY `fk_lp_pre_usuario` (`id_usuario`),
  CONSTRAINT `fk_lp_pre_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `lp_categoria` (`id_categoria`) ON DELETE CASCADE,
  CONSTRAINT `fk_lp_pre_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `lp_usuario` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lp_presupuesto`
--

LOCK TABLES `lp_presupuesto` WRITE;
/*!40000 ALTER TABLE `lp_presupuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `lp_presupuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lp_transaccion`
--

DROP TABLE IF EXISTS `lp_transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lp_transaccion` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `id_categoria` int NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `descripcion` varchar(200) DEFAULT NULL,
  `tipo` enum('INGRESO','GASTO') NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `fk_lp_tra_categoria` (`id_categoria`),
  KEY `fk_lp_tra_cuenta` (`id_cuenta`),
  CONSTRAINT `fk_lp_tra_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `lp_categoria` (`id_categoria`),
  CONSTRAINT `fk_lp_tra_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `lp_cuenta` (`id_cuenta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lp_transaccion`
--

LOCK TABLES `lp_transaccion` WRITE;
/*!40000 ALTER TABLE `lp_transaccion` DISABLE KEYS */;
INSERT INTO `lp_transaccion` VALUES (5,1,2,3500.00,'2026-05-19 16:22:54','Prueba en Vivo Python','INGRESO'),(6,2,1,1000.00,'2026-05-19 16:35:08','prueba eliminacion','GASTO'),(7,2,1,5500.00,'2026-05-19 16:37:57','Gasto de prueba','GASTO');
/*!40000 ALTER TABLE `lp_transaccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `TRG_AUDIT_INSERT_TRANSACCION` AFTER INSERT ON `lp_transaccion` FOR EACH ROW INSERT INTO lp_auditoria (tabla_afectada, operacion, usuario_db, fecha, dato_nuevo)

VALUES ('lp_transaccion', 'INSERT', USER(), NOW(), CONCAT('Monto: ', NEW.monto)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `TRG_AUDIT_UPDATE_TRANSACCION` AFTER UPDATE ON `lp_transaccion` FOR EACH ROW INSERT INTO lp_auditoria (tabla_afectada, operacion, usuario_db, fecha, dato_anterior, dato_nuevo)

VALUES ('lp_transaccion', 'UPDATE', USER(), NOW(), CONCAT('Ant: ', OLD.monto), CONCAT('Nuevo: ', NEW.monto)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ONLY_FULL_GROUP_BY,ANSI,STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`avnadmin`@`%`*/ /*!50003 TRIGGER `tr_auditoria_delete_transaccion` BEFORE DELETE ON `lp_transaccion` FOR EACH ROW INSERT INTO lp_auditoria (tabla_afectada, operacion, usuario_db, dato_anterior, dato_nuevo)

VALUES (

    'lp_transaccion',

    'DELETE',

    USER(),

    CONCAT('ID: ', OLD.id_transaccion, ' | Monto: ', OLD.monto, ' | Desc: ', OLD.descripcion, ' | Tipo: ', OLD.tipo),

    NULL

) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lp_usuario`
--

DROP TABLE IF EXISTS `lp_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lp_usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lp_usuario`
--

LOCK TABLES `lp_usuario` WRITE;
/*!40000 ALTER TABLE `lp_usuario` DISABLE KEYS */;
INSERT INTO `lp_usuario` VALUES (1,'Usuario Prueba','prueba@correo.com','hash_password_123','2026-05-09 08:52:08');
/*!40000 ALTER TABLE `lp_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'LP_PROYECTO'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-19 11:39:53
