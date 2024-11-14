-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.21.04.1

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
-- Table structure for table `AUTORE`
--

DROP TABLE IF EXISTS `AUTORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTORE` (
  `Cod_autore` varchar(10) NOT NULL,
  `Nome` varchar(10) NOT NULL,
  `Cognome` varchar(10) NOT NULL,
  `Luogo_nascita` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Cod_autore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTORE`
--

LOCK TABLES `AUTORE` WRITE;
/*!40000 ALTER TABLE `AUTORE` DISABLE KEYS */;
INSERT INTO `AUTORE` VALUES ('ALP','Giuliano','Simani','Ferrara'),('APM','Donatello','D\'Alberto','Modena'),('EZP','Vincenzo','Stingo','Palermo'),('GDP','Gabrielle','Esposito','Firenze'),('GVA','David','Knig','New York'),('JKL','Giacomo','Marro','Vicenza'),('KAL','Emiliano','Ottaviano','Vasto'),('LAF','Hill','McGraw','Ferrara'),('SGM','Isotta','Corazzi','Madrid'),('SHK','Alessandro','Colombo','Londra');
/*!40000 ALTER TABLE `AUTORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIPARTIMENTO`
--

DROP TABLE IF EXISTS `DIPARTIMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DIPARTIMENTO` (
  `Codice` varchar(10) NOT NULL,
  `Nome` varchar(65) NOT NULL,
  `Indirizzo` varchar(40) NOT NULL,
  `CAP` varchar(6) NOT NULL,
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIPARTIMENTO`
--

LOCK TABLES `DIPARTIMENTO` WRITE;
/*!40000 ALTER TABLE `DIPARTIMENTO` DISABLE KEYS */;
INSERT INTO `DIPARTIMENTO` VALUES ('B024','Dipartiemento di Lettere, arti e archeologia','Via Aldo Moro,73','10121'),('G045','Dipartiemento di Matematica','Via Giovecca,45','10147'),('M001','Dipartiemento di Biotecnologie','Via Roma,2','12126'),('M002','Dipartiemento di Ingegneria','Via Salagar,1','10121'),('Z034','Dipartiemento di Scienze biologiche','Via San Romano,3','10126');
/*!40000 ALTER TABLE `DIPARTIMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIBRO`
--

DROP TABLE IF EXISTS `LIBRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIBRO` (
  `Cod_libro` varchar(10) NOT NULL,
  `Titolo` varchar(45) NOT NULL,
  `Lingua` varchar(45) NOT NULL,
  `Edizione` int NOT NULL,
  `Data_prestito` date NOT NULL,
  `Data_restituzione` varchar(10) DEFAULT NULL,
  `Matricola_utente` int NOT NULL,
  `Cod_dip` varchar(10) NOT NULL,
  `Prezzo` decimal(4,2) NOT NULL,
  PRIMARY KEY (`Cod_libro`),
  KEY `Matricola_idx` (`Matricola_utente`),
  KEY `Cod_dip_idx` (`Cod_dip`),
  CONSTRAINT `Cod_dip` FOREIGN KEY (`Cod_dip`) REFERENCES `DIPARTIMENTO` (`Codice`) ON UPDATE CASCADE,
  CONSTRAINT `Matricola_utente` FOREIGN KEY (`Matricola_utente`) REFERENCES `UTENTE` (`Matricola`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIBRO`
--

LOCK TABLES `LIBRO` WRITE;
/*!40000 ALTER TABLE `LIBRO` DISABLE KEYS */;
INSERT INTO `LIBRO` VALUES ('A678','Appunti di Algebra Lineare','ITA',1,'2020-06-30','2020-07-04',1234,'M002',28.00),('A893','Architetture dei Calcolatori Elettronici','ING',2,'2020-07-29',NULL,1234,'M002',71.00),('B345','Anatomia comparata','FRA',3,'2019-02-01','2019-04-12',9012,'M001',53.10),('C347','Controlli automatici','ITA',3,'2020-05-23','2020-07-12',3455,'M002',41.00),('C935','Controlli automatici','ING',2,'2019-05-04','2021-07-01',1234,'M002',36.90),('F340','Fisica Volume I','ITA',3,'2020-06-30',NULL,6789,'G045',48.50),('G045','Analisi Matematica','ING',5,'2020-05-12','2020-09-06',3456,'G045',53.60),('H945','Fondamenti di fisica','FRA',7,'2019-03-04','2020-09-23',2345,'Z034',23.40),('K034','Biochimica degli alimenti','ITA',3,'2021-04-06','2021-07-12',4567,'Z034',32.90),('M934','Microelettronica','ITA',6,'2019-04-23','2021-01-23',1234,'M001',46.20),('R834','Circuiti elettrici','FRA',2,'2021-04-28',NULL,3455,'M001',32.90),('T782','Telecomunicazioni dei sistemi','SPA',1,'2020-08-05',NULL,1234,'G045',73.50),('X045','La scoperta dell\'umanita','ITA',2,'2021-07-02','2021-07-10',3456,'B024',19.80);
/*!40000 ALTER TABLE `LIBRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCRIVE`
--

DROP TABLE IF EXISTS `SCRIVE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCRIVE` (
  `Cod_lib` varchar(10) NOT NULL,
  `Cod_aut` varchar(10) NOT NULL,
  PRIMARY KEY (`Cod_lib`,`Cod_aut`),
  KEY `Cod_aut_idx` (`Cod_aut`),
  KEY `Cod_lib_idx` (`Cod_lib`),
  CONSTRAINT `Cod_aut` FOREIGN KEY (`Cod_aut`) REFERENCES `AUTORE` (`Cod_autore`) ON UPDATE CASCADE,
  CONSTRAINT `Cod_lib` FOREIGN KEY (`Cod_lib`) REFERENCES `LIBRO` (`Cod_libro`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCRIVE`
--

LOCK TABLES `SCRIVE` WRITE;
/*!40000 ALTER TABLE `SCRIVE` DISABLE KEYS */;
INSERT INTO `SCRIVE` VALUES ('A678','ALP'),('C935','ALP'),('G045','APM'),('M934','APM'),('T782','APM'),('C347','EZP'),('A893','GDP'),('F340','GVA'),('R834','JKL'),('H945','KAL'),('R834','KAL'),('K034','LAF'),('B345','SGM'),('X045','SHK');
/*!40000 ALTER TABLE `SCRIVE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UTENTE`
--

DROP TABLE IF EXISTS `UTENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UTENTE` (
  `Matricola` int NOT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Nome` varchar(15) NOT NULL,
  `Cognome` varchar(15) NOT NULL,
  `E-mail` varchar(40) NOT NULL,
  `Valutazione` int DEFAULT NULL,
  `Genere` varchar(10) DEFAULT NULL,
  `DataNascita` date DEFAULT NULL,
  PRIMARY KEY (`Matricola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UTENTE`
--

LOCK TABLES `UTENTE` WRITE;
/*!40000 ALTER TABLE `UTENTE` DISABLE KEYS */;
INSERT INTO `UTENTE` VALUES (1234,'3338443025','Francesco','Menna','francesco.menna@libero.it',4,'Uomo','1998-02-23'),(2345,'3271869222','Emanuele','Di Fonzo','emanuele.difonzo@gmail.com',5,'Uomo','1999-06-21'),(3455,'3389502385','Umberto','Menna','umberto.menna@libero.it',3,'Uomo','1998-02-23'),(3456,'3387609800','Ilaria','Santoro','ilaria.santoro@hotmail.com',3,'Donna','1998-07-28'),(4567,'3474512321','Ivan','Santoro','ivan.santoro@libero.it',2,'Uomo','1997-01-30'),(6756,'3387278048','Maura','Coriandolo','maura.cori@alice.it',0,'Donna','1999-04-29'),(6789,'3568987635','Alessia','Marocco','alessia.marocco@gmail.com',4,'Donna','1999-04-28'),(9012,'3278900002','Lara','Santoro','lara.santoro@gmail.com',5,'Donna','1997-03-21');
/*!40000 ALTER TABLE `UTENTE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-16 18:31:24
