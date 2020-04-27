-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: yelopagesyat
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `uid` int(11) NOT NULL,
  `apartment` varchar(250) NOT NULL,
  `lid` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`,`apartment`),
  KEY `lid` (`lid`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`lid`) REFERENCES `location` (`lid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (38,'Creek county',1),(43,'Creek county',2),(94,'Place view',2),(57,'Place view',3),(74,'Creek county',3),(99,'Gokuldham society',3),(41,'Crossing republic',6),(93,'Gokuldham society',6),(40,'Gardens society',7),(47,'Court village',8),(82,'Square city',8),(54,'Park Society ',9),(23,'Gardens society',10),(59,'Gokuldham society',10),(58,'Creek county',11),(3,'Crossing republic',12),(9,'Gokuldham society',12),(30,'Lake view',13),(5,'Shanti Homes ',14),(76,'Gokuldham society',14),(86,'Place view',15),(42,'Creek county',16),(78,'Crossing republic',16),(16,'Ridge village',17),(88,'Creek county',17),(11,'Crossing republic',18),(51,'Lake view',18),(53,'Court village',18),(72,'Gokuldham society',18),(80,'Creek county',18),(84,'Court village',18),(100,'The hibiscus',18),(39,'Shanti Homes ',19),(33,'Crossing republic',20),(83,'Lake view',20),(46,'Gardens society',21),(24,'Crossing republic',23),(37,'Crossing republic',23),(63,'Lake view',23),(70,'Ridge village',23),(97,'Gokuldham society',23),(66,'Gokuldham society',24),(32,'Gokuldham society',25),(50,'Gokuldham society',25),(26,'Creek county',26),(98,'Creek county',27),(6,'Gokuldham society',28),(7,'Crossing republic',28),(67,'Lake view',28),(95,'Creek county',28),(101,'Creek county',28),(17,'Gokuldham society',29),(61,'Creek county',29),(79,'Court village',29),(77,'Lake view',30),(87,'Park Society ',30),(35,'Village Apartments',31),(90,'Gokuldham society',32),(14,'Shanti Homes ',33),(27,'Gokuldham society',33),(36,'Creek county',33),(73,'Crossing republic',33),(85,'Court village',33),(44,'Gokuldham society',34),(71,'Shanti Homes ',34),(19,'Court village',35),(20,'Park Society ',35),(28,'Lake view',35),(2,'Gokuldham society',36),(96,'Creek county',36),(81,'Gokuldham society',37),(62,'Gokuldham society',38),(55,'Creek county',39),(92,'Creek county',39),(1,'Creek county',40),(64,'Crossing republic',40),(25,'Court village',41),(56,'Lake view',41),(91,'Creek county',41),(65,'Creek county',42),(75,'Creek county',42),(13,'Creek county',43),(31,'Creek county',43),(60,'Place view',43),(21,'Creek county',44),(34,'Park Society ',44),(52,'Gardens society',44),(68,'Crossing republic',44),(18,'Lake view',46),(22,'Ridge village',46),(45,'Lake view',46),(15,'Creek county',47),(8,'Creek county',48),(10,'Lake view',48),(4,'Creek county',49),(12,'Park Society ',50),(29,'Creek county',50),(49,'Creek county',50),(69,'Creek county',50),(103,'c-53, premnagar',515);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `aadharNumber` bigint(20) NOT NULL,
  PRIMARY KEY (`aadharNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
INSERT INTO `blacklist` VALUES (172712000000),(258347000000),(266401000000),(347607000000),(392423000000),(549209000000),(590490000000),(609417000000),(610530000000),(622294000000),(646730000000),(693065000000),(735036000000),(867579000000),(918624000000),(946120000000),(946399000000),(961238000000),(967193000000),(970986000000);
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaints` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uidSS` int(11) DEFAULT NULL,
  `uidSP` int(11) DEFAULT NULL,
  `complaint` varchar(500) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `uidSS` (`uidSS`),
  KEY `uidSP` (`uidSP`),
  KEY `eid` (`eid`),
  CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`uidSS`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`uidSP`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `complaints_ibfk_3` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,74,1,'Stole my money',13),(2,88,2,'Came very late',14),(3,98,3,'Did not show up',15),(4,76,55,'Cant call the number',16),(5,84,5,'Stole my money',17),(6,62,21,'Harassed me',18),(7,77,7,'Did not come after calling',19),(8,99,8,'CHarged more than he said before ',20),(9,100,23,'Cant call the number',2),(10,63,53,'Stole my money',3),(11,65,32,'Harassed me',4),(12,88,21,'Did not come after calling',5),(13,89,1,'Charged more than he said before ',6),(14,90,32,'Abusive language',7);
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `eid` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `availability` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `idx_employee_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Patty Tate','Customer Care','Available'),(2,'Marcus Mclaughlin','Customer Care','Not Available'),(3,'Susie Bernard','Customer Care','Not Available'),(4,'Guadalupe Mckay','Customer Care','Not Available'),(5,'Debora Romero','Customer Care','Not Available'),(6,'Nelson Davenport','Customer Care','Not Available'),(7,'Lucio Wilcox','Customer Care','Not Available'),(8,'Stacey Barton','Customer Care','Available'),(9,'Elnora Reid','Customer Care','Available'),(10,'Cecilia Parrish','Customer Care','Available'),(11,'Rudy Gentry','Customer Care','Available'),(12,'Darrick Armstrong','Customer Care','Available'),(13,'Nick Dean','Customer Care','Not Available'),(14,'Steven Berg','Customer Care','Not Available'),(15,'Horace Klein','Customer Care','Not Available'),(16,'Ramon Fritz','Customer Care','Not Available'),(17,'Morris Logan','Customer Care','Not Available'),(18,'Katie Hunt','Customer Care','Not Available'),(19,'Denver Riddle','Customer Care','Not Available'),(20,'Diego Travis','Customer Care','Not Available'),(21,'Gilberto Livingston','Manager','Not Available'),(22,'Doyle Bauer','Manager','Not Available'),(23,'Quentin Chase','Manager','Not Available'),(24,'Mauro Herrera','Manager','Not Available'),(25,'Miguel Diaz','CEO','Not Available');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favourites` (
  `uidSS` int(11) NOT NULL,
  `uidSP` int(11) NOT NULL,
  PRIMARY KEY (`uidSS`,`uidSP`),
  KEY `uidSP` (`uidSP`),
  CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`uidSS`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`uidSP`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES (13,1),(30,1),(83,1),(87,1),(89,1),(73,2),(76,2),(85,2),(87,2),(97,2),(101,2),(13,3),(71,3),(100,3),(22,4),(30,4),(61,4),(77,4),(92,4),(101,4),(70,5),(103,5),(8,6),(83,6),(92,6),(74,7),(96,7),(63,8),(76,8),(85,8),(77,9),(86,9),(97,9),(91,10),(99,10),(30,11),(61,11),(99,11),(90,12),(9,13),(76,13),(99,13),(30,14),(75,14),(71,15),(90,15),(56,16),(77,16),(97,16),(75,17),(90,17),(47,18),(90,18),(96,18),(75,19),(83,19),(13,20),(68,20),(70,20),(99,20),(1,21),(45,21),(81,21),(89,22),(94,23),(101,23),(56,24),(86,24),(87,24),(77,25),(90,25),(81,26),(87,26),(74,28),(76,28),(86,28),(61,29),(83,29),(33,30),(71,30),(76,30),(80,30),(88,30),(91,30),(73,31),(78,31),(88,31),(87,32),(96,32),(81,33),(93,33),(88,34),(101,34),(13,35),(84,35),(86,35),(95,35),(75,36),(85,36),(22,37),(63,37),(33,38),(71,38),(86,38),(9,39),(33,39),(87,39),(71,40),(82,40),(47,41),(8,42),(1,43),(91,43),(93,43),(94,43),(89,44),(8,45),(22,45),(33,45),(81,45),(87,45),(89,45),(8,46),(83,46),(96,46),(98,46),(93,47),(88,48),(91,48),(1,49),(8,49),(83,49),(13,50),(80,50),(94,50),(75,51),(33,52),(73,52),(75,52),(79,52),(76,53),(22,54),(61,54),(89,54),(61,55),(84,55),(72,56),(77,56),(92,56),(101,56),(82,57),(100,57),(13,58),(97,58),(79,59),(88,59),(33,60),(72,60),(83,60),(74,61),(79,61),(99,61),(22,62),(89,62),(84,63),(95,63),(61,64),(33,65),(76,66),(22,67),(30,67),(74,67),(78,67),(84,67),(85,67),(97,67),(101,67),(75,68),(96,68),(30,69),(81,69),(86,69),(82,70),(90,70),(70,71),(82,71),(96,71);
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `lid` int(11) NOT NULL,
  `locality` varchar(250) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `idx_location_pin` (`pin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Anand Vihar',110092,'New Delhi'),(2,'Azad Nagar East Delhi',110051,'New Delhi'),(3,'Babarpur North East Delhi',110032,'New Delhi'),(4,'Badarpur Khadar',110090,'New Delhi'),(5,'Balbir Nagar',110032,'New Delhi'),(6,'Bhajan Pura',110053,'New Delhi'),(7,'Bhola Nath Nagar',110032,'New Delhi'),(8,'Brahampuri',110053,'New Delhi'),(9,'Chilla',110091,'New Delhi'),(10,'Dayalpur',110094,'New Delhi'),(11,'Dilshad Garden',110095,'New Delhi'),(12,'Distt Court KKD',110032,'New Delhi'),(13,'Gandhi Nagar Bazar',110031,'New Delhi'),(14,'Gandhi Nagar East Delhi',110031,'New Delhi'),(15,'Garhi Mandu',110053,'New Delhi'),(16,'Geeta Colony',110031,'New Delhi'),(17,'Ghazipur',110096,'New Delhi'),(18,'Gokal Puri',110094,'New Delhi'),(19,'Goverdhan Bihari Colony',110032,'New Delhi'),(20,'Govind Pura',110051,'New Delhi'),(21,'GTB Hospital',110095,'New Delhi'),(22,'Harsh Vihar',110093,'New Delhi'),(23,'Himmatpuri',110091,'New Delhi'),(24,'Housing Complex Loni Road',110093,'New Delhi'),(25,'IP Extension',110092,'New Delhi'),(26,'Jafrabad East Delhi',110053,'New Delhi'),(27,'Jagjit Nagar',110053,'New Delhi'),(28,'Jhilmil HO',110095,'New Delhi'),(29,'Jhilmil Tahirpur',110095,'New Delhi'),(30,'Johripur',110094,'New Delhi'),(31,'Kailash Nagar',110031,'New Delhi'),(32,'Kalyanpuri',110091,'New Delhi'),(33,'Kalyanvas',110091,'New Delhi'),(34,'Karawal Nagar',110090,'New Delhi'),(35,'Khajoori Khas',110090,'New Delhi'),(36,'Krishna Nagar HO',110051,'New Delhi'),(37,'Laxmi Nagar Extension',110092,'New Delhi'),(38,'Laxmi Nagar East Delhi',110092,'New Delhi'),(39,'Loni Road',110032,'New Delhi'),(40,'Man Sarovar Park',110032,'New Delhi'),(41,'Mandawali Fazalpur',110092,'New Delhi'),(42,'Mandoli Saboli',110093,'New Delhi'),(43,'Maujpur',110053,'New Delhi'),(44,'Mayur Vihar PhI',110091,'New Delhi'),(45,'Mayur Vihar PhIII',110096,'New Delhi'),(46,'Nand Nagri A',110093,'New Delhi'),(47,'Nand Nagri C',110093,'New Delhi'),(48,'New Seemapuri',110095,'New Delhi'),(49,'New Usmanpur',110053,'New Delhi'),(50,'Nirman Vihar',110092,'New Delhi'),(51,'Old Seemapuri',110095,'New Delhi'),(52,'Patparganj',110091,'New Delhi'),(53,'Raghubar Pura',110031,'New Delhi'),(54,'Rajgarh Colony',110031,'New Delhi'),(55,'Ram Nagar East Delhi',110051,'New Delhi'),(56,'Rohtash Nagar',110032,'New Delhi'),(57,'Sabhapur',110090,'New Delhi'),(58,'Seelampur',110053,'New Delhi'),(59,'Shahdara Mandi',110032,'New Delhi'),(60,'Shahdara',110032,'New Delhi'),(61,'Shaheed Bhagat Singh Colony',110090,'New Delhi'),(62,'Shakarpur',110092,'New Delhi'),(63,'Shastri Nagar East Delhi',110031,'New Delhi'),(64,'Shivaji Park East Delhi',110032,'New Delhi'),(65,'Shriram Colony Rajeev Nagar',110090,'New Delhi'),(66,'Sonia Vihar',110090,'New Delhi'),(67,'Sunder Nagari',110093,'New Delhi'),(68,'Surajmal Vihar',110092,'New Delhi'),(69,'Telewara',110032,'New Delhi'),(70,'Trilok Puri',110091,'New Delhi'),(71,'Vasundhra Enclave',110096,'New Delhi'),(72,'Vishwakarma Nagar',110095,'New Delhi'),(73,'Vishwas Nagar',110032,'New Delhi'),(74,'Vivek Vihar',110095,'New Delhi'),(75,'Yamuna Vihar',110053,'New Delhi'),(76,'Yozna Vihar',110092,'New Delhi'),(77,'Delhi GPO',110006,'New Delhi'),(78,'Adrash Nagar',110033,'New Delhi'),(79,'Alipur',110036,'New Delhi'),(80,'Anandvas Shakurpur',110034,'New Delhi'),(81,'Aruna Nagar',110054,'New Delhi'),(82,'Ashok Vihar HO',110052,'New Delhi'),(83,'Auchandi',110039,'New Delhi'),(84,'Avantika',110085,'New Delhi'),(85,'Badli North West Delhi',110042,'New Delhi'),(86,'Bakhtawar Pur',110036,'New Delhi'),(87,'Bakoli',110036,'New Delhi'),(88,'Bankner',110040,'New Delhi'),(89,'Baratooti',110006,'New Delhi'),(90,'Barwala',110039,'New Delhi'),(91,'Bawana',110039,'New Delhi'),(92,'Begumpur',110086,'New Delhi'),(93,'Bhalaswa',110033,'New Delhi'),(94,'Bhorgarh',110040,'New Delhi'),(95,'Budh Vihar',110086,'New Delhi'),(96,'Burari',110084,'New Delhi'),(97,'C4 Keshav Puram North West Delhi',110035,'New Delhi'),(98,'Chand Pur',110081,'New Delhi'),(99,'Chandni Chowk',110006,'New Delhi'),(100,'Chawri Bazar',110006,'New Delhi'),(101,'Civil Lines North Delhi',110054,'New Delhi'),(102,'Dareeba',110006,'New Delhi'),(103,'Delhi Engg College',110042,'New Delhi'),(104,'Delhi Sadar Bazar',110006,'New Delhi'),(105,'Delhi University',110007,'New Delhi'),(106,'District Courts North Delhi',110054,'New Delhi'),(107,'DrMukerjee Nagar',110009,'New Delhi'),(108,'G T B Nagar extension',110009,'New Delhi'),(109,'Ganeshpura',110035,'New Delhi'),(110,'Gheora',110081,'New Delhi'),(111,'Ghoga',110039,'New Delhi'),(112,'GTB Nagar',110009,'New Delhi'),(113,'Gujranwala Colony',110009,'New Delhi'),(114,'Gulabi Bagh',110007,'New Delhi'),(115,'H S School',110081,'New Delhi'),(116,'Haiderpur',110088,'New Delhi'),(117,'Hareveli',110039,'New Delhi'),(118,'Hiranki',110036,'New Delhi'),(119,'Holambi Kalan',110082,'New Delhi'),(120,'HSSangh',110009,'New Delhi'),(121,'INDERLOK',110035,'New Delhi'),(122,'Jagatpur',110084,'New Delhi'),(123,'Jahangir Puri A Block',110033,'New Delhi'),(124,'Jahangir Puri D Block',110033,'New Delhi'),(125,'Jahangir Puri H Block',110033,'New Delhi'),(126,'Jat Khore',110039,'New Delhi'),(127,'Jaunti',110081,'New Delhi'),(128,'Jawahar Nagar North Delhi',110007,'New Delhi'),(129,'Jharoda Majraa',110084,'New Delhi'),(130,'Kadipur',110036,'New Delhi'),(131,'Kamla Nagar North Delhi',110007,'New Delhi'),(132,'Kanjhawla',110081,'New Delhi'),(133,'Kanya Gurukul',110040,'New Delhi'),(134,'Karala',110081,'New Delhi'),(135,'Katewara',110039,'New Delhi'),(136,'Keshavpuram',110035,'New Delhi'),(137,'Khampur',110036,'New Delhi'),(138,'Khera Kalan',110082,'New Delhi'),(139,'Khera Khurd',110082,'New Delhi'),(140,'KIRARI SULEMAN NAGAR',110086,'New Delhi'),(141,'Lad Pur',110081,'New Delhi'),(142,'Lampur',110040,'New Delhi'),(143,'Majra Dabas',110081,'New Delhi'),(144,'Malka Ganj',110007,'New Delhi'),(145,'Mangolpuri A Block',110083,'New Delhi'),(146,'Mangolpuri I  Block',110083,'New Delhi'),(147,'Mangolpuri N Block',110083,'New Delhi'),(148,'Mangolpuri S Block',110083,'New Delhi'),(149,'Maurya Enclave',110034,'New Delhi'),(150,'Model Town II',110009,'New Delhi'),(151,'Model Town III',110009,'New Delhi'),(152,'Mubarak Pur Dabas',110081,'New Delhi'),(153,'Mukhmelpur',110036,'New Delhi'),(154,'Mukundpur Village',110042,'New Delhi'),(155,'Mungeshpur',110039,'New Delhi'),(156,'Nangal Poona',110036,'New Delhi'),(157,'Nangal Thakran',110039,'New Delhi'),(158,'Narela',110040,'New Delhi'),(159,'NARELA TOWN',110040,'New Delhi'),(160,'Nathupura Village',110084,'New Delhi'),(161,'Naya Bans',110082,'New Delhi'),(162,'NEW Nathupura',110084,'New Delhi'),(163,'Nimri',110052,'New Delhi'),(164,'Nirankari Colony',110009,'New Delhi'),(165,'Nizampur',110081,'New Delhi'),(166,'NSMandi',110033,'New Delhi'),(167,'Padam Nagar North Delhi',110007,'New Delhi'),(168,'Palla',110036,'New Delhi'),(169,'Patrachar Vidyalay',110054,'New Delhi'),(170,'Pehlad Pur',110042,'New Delhi'),(171,'Pooth Kalan',110086,'New Delhi'),(172,'Pooth Kalan Resettlement',110086,'New Delhi'),(173,'Pooth Khurd',110039,'New Delhi'),(174,'Power House',110035,'New Delhi'),(175,'Prashant Vihar',110085,'New Delhi'),(176,'Prem Nagar',110086,'New Delhi'),(177,'Punjab Khor',110081,'New Delhi'),(178,'Qutabagarh',110039,'New Delhi'),(179,'Rampura',110035,'New Delhi'),(180,'Rana Pratap Bagh',110007,'New Delhi'),(181,'Rani Bagh',110034,'New Delhi'),(182,'Rani Khera',110081,'New Delhi'),(183,'RCAO',110007,'New Delhi'),(184,'Rithala',110085,'New Delhi'),(185,'Rohini Courts',110085,'New Delhi'),(186,'Rohini sec11',110085,'New Delhi'),(187,'Rohini Sector 15 extension So',110089,'New Delhi'),(188,'Rohini Sector 15',110089,'New Delhi'),(189,'Rohini Sector 16',110085,'New Delhi'),(190,'ROHINI SECTOR 23',110099,'New Delhi'),(191,'Rohini Sector 5',110085,'New Delhi'),(192,'Rohini Sector7',110085,'New Delhi'),(193,'Roop Nagar',110007,'New Delhi'),(194,'Roshan Ara Road',110007,'New Delhi'),(195,'Samai Pur',110042,'New Delhi'),(196,'Sant Nagar',110084,'New Delhi'),(197,'Sarai Rohilla',110035,'New Delhi'),(198,'Saraswati Vihar',110034,'New Delhi'),(199,'Satyawati Nagar',110052,'New Delhi'),(200,'Shakti Nagar North Delhi',110007,'New Delhi'),(201,'Shakur Basti Depot',110056,'New Delhi'),(202,'Shakur Pur I  Block',110034,'New Delhi'),(203,'Shakurbasti Rs',110034,'New Delhi'),(204,'Shalamar',110088,'New Delhi'),(205,'Shalimar Bagh North West Delhi',110088,'New Delhi'),(206,'Shastri Nagar North West Delhi',110052,'New Delhi'),(207,'Singhu',110040,'New Delhi'),(208,'Siraspur',110042,'New Delhi'),(209,'Sri Nagar Colony',110034,'New Delhi'),(210,'Sultanpuri B Block',110086,'New Delhi'),(211,'Sultanpuri C Block',110086,'New Delhi'),(212,'Sultanpuri F Block',110086,'New Delhi'),(213,'Tikri Khurd',110040,'New Delhi'),(214,'Timarpur',110054,'New Delhi'),(215,'Wazir Pur III',110052,'New Delhi'),(216,'Wazirabad Village',110084,'New Delhi'),(217,'AGCR EXTENSION COUNTER',110002,'New Delhi'),(218,'AGCR',110002,'New Delhi'),(219,'Ajmeri Gate Extn',110002,'New Delhi'),(220,'AKMarket',110055,'New Delhi'),(221,'Anand Parbat Indl Area',110005,'New Delhi'),(222,'Anand Parbat',110005,'New Delhi'),(223,'Bank Street Central Delhi',110005,'New Delhi'),(224,'Baroda House',110001,'New Delhi'),(225,'Bengali Market',110001,'New Delhi'),(226,'Bhagat Singh Market',110001,'New Delhi'),(227,'CAT EXTENSION COUNTER',110001,'New Delhi'),(228,'Civic Centre',110002,'New Delhi'),(229,'Connaught Place',110001,'New Delhi'),(230,'Dada Ghosh Bhawan',110008,'New Delhi'),(231,'Darya Ganj',110002,'New Delhi'),(232,'Delhi High Court Extension Counter',110003,'New Delhi'),(233,'Delhi High Court',110003,'New Delhi'),(234,'Desh Bandhu Gupta Road',110005,'New Delhi'),(235,'Election Commission',110001,'New Delhi'),(236,'Gandhi Smarak Nidhi',110002,'New Delhi'),(237,'Guru Gobind Singh Marg',110005,'New Delhi'),(238,'Hauz Qazi',110006,'New Delhi'),(239,'IARI',110012,'New Delhi'),(240,'Inderpuri',110012,'New Delhi'),(241,'Indraprastha HO',110002,'New Delhi'),(242,'IPEstate',110002,'New Delhi'),(243,'Jama Masjid',110006,'New Delhi'),(244,'Janpath',110001,'New Delhi'),(245,'Karol Bagh',110005,'New Delhi'),(246,'Krishi Bhawan',110001,'New Delhi'),(247,'Lady Harding Medical College',110001,'New Delhi'),(248,'Master Prithvi Nath Marg',110005,'New Delhi'),(249,'Minto Road',110002,'New Delhi'),(250,'Multani Dhanda',110055,'New Delhi'),(251,'National Physical Laboratory',110012,'New Delhi'),(252,'NGT EXTENSION COUNTER',110001,'New Delhi'),(253,'Nirman Bhawan',110011,'New Delhi'),(254,'North Avenue',110001,'New Delhi'),(255,'Pahar Ganj',110055,'New Delhi'),(256,'Pandara Road',110003,'New Delhi'),(257,'Parliament House',110001,'New Delhi'),(258,'Patel Nagar East',110008,'New Delhi'),(259,'Patel Nagar Central Delhi',110008,'New Delhi'),(260,'Patel Nagar South',110008,'New Delhi'),(261,'Patel Nagar West',110008,'New Delhi'),(262,'Patiala House',110001,'New Delhi'),(263,'Pragati Maidan',110001,'New Delhi'),(264,'Rail Bhawan',110001,'New Delhi'),(265,'Rajender Nagar',110060,'New Delhi'),(266,'Rashtrapati Bhawan',110004,'New Delhi'),(267,'Rouse Avenue Extension Counter',110002,'New Delhi'),(268,'Sansad Marg HO',110001,'New Delhi'),(269,'Sansadiya Soudh',110001,'New Delhi'),(270,'Sat Nagar',110005,'New Delhi'),(271,'Secretariat North',110001,'New Delhi'),(272,'Shastri Bhawan',110001,'New Delhi'),(273,'South Avenue',110001,'New Delhi'),(274,'SRT NAGAR EXTENSION COUNTER',110055,'New Delhi'),(275,'Supreme Court',110001,'New Delhi'),(276,'Swami Ram Tirth Nagar',110055,'New Delhi'),(277,'Udyog Bhawan',110011,'New Delhi'),(278,'Union Public Service Commission',110069,'New Delhi'),(279,'New Delhi GPO',110001,'New Delhi'),(280,'RML EXTN COUNTER NDHO',110001,'New Delhi'),(281,'Abul Fazal EnclaveI',110025,'New Delhi'),(282,'Air Force Station Tugalkabad',110080,'New Delhi'),(283,'Alaknanda',110019,'New Delhi'),(284,'Ali',110076,'New Delhi'),(285,'Aliganj South Delhi',110003,'New Delhi'),(286,'Amar Colony',110024,'New Delhi'),(287,'Andrewsganj',110049,'New Delhi'),(288,'Badarpur South Delhi',110044,'New Delhi'),(289,'BSF Camp Tigri',110080,'New Delhi'),(290,'BTPS South Delhi',110044,'New Delhi'),(291,'C G O Complex',110003,'New Delhi'),(292,'C R R I South Delhi',110020,'New Delhi'),(293,'Chittranjan Park',110019,'New Delhi'),(294,'Dakshinpuri PhaseI',110062,'New Delhi'),(295,'Dakshinpuri PhaseII',110062,'New Delhi'),(296,'Dakshinpuri PhaseIII',110062,'New Delhi'),(297,'Dargah Sharif',110013,'New Delhi'),(298,'Defence Colony South Delhi',110024,'New Delhi'),(299,'Deoli',110080,'New Delhi'),(300,'Distt Court Complex Saket',110017,'New Delhi'),(301,'Dr Ambedkar Nagar South Delhi',110062,'New Delhi'),(302,'East Of Kailash PhaseI',110065,'New Delhi'),(303,'East Of Kailash',110065,'New Delhi'),(304,'F F C Okhla',110020,'New Delhi'),(305,'Gautam Nagar',110049,'New Delhi'),(306,'Golf Links',110003,'New Delhi'),(307,'Greater Kailash',110048,'New Delhi'),(308,'Gulmohar Park',110049,'New Delhi'),(309,'Hamdard Nagar',110062,'New Delhi'),(310,'Hari Nagar Ashram',110014,'New Delhi'),(311,'Hazrat Nizamuddin',110013,'New Delhi'),(312,'Jaitpur',110044,'New Delhi'),(313,'Jaitpur South Delhi',110044,'New Delhi'),(314,'Jamia Nagar',110025,'New Delhi'),(315,'Jeevan Nagar',110014,'New Delhi'),(316,'Jungpura',110014,'New Delhi'),(317,'Kailash Colony',110048,'New Delhi'),(318,'Kalkaji HO',110019,'New Delhi'),(319,'Kasturba Nagar South Delhi',110003,'New Delhi'),(320,'Khanpur South Delhi',110080,'New Delhi'),(321,'Krishna Market',110024,'New Delhi'),(322,'Lajpat Nagar South Delhi',110024,'New Delhi'),(323,'Lal Kuan',110044,'New Delhi'),(324,'Lodi Road HO',110003,'New Delhi'),(325,'Madanpur Khadar',110076,'New Delhi'),(326,'Malviya Nagar South Delhi',110017,'New Delhi'),(327,'Masjid Moth',110048,'New Delhi'),(328,'Meethapur',110044,'New Delhi'),(329,'MMTCSTC Colony',110017,'New Delhi'),(330,'Molarband',110044,'New Delhi'),(331,'Nehru Nagar South Delhi',110065,'New Delhi'),(332,'Nehru Place',110019,'New Delhi'),(333,'New Delhi South ExtII',110049,'New Delhi'),(334,'New Friends Colony',110025,'New Delhi'),(335,'Okhla Industrial Area Phasei',110020,'New Delhi'),(336,'Okhla Industrial Estate',110020,'New Delhi'),(337,'Panchsheel Enclave',110017,'New Delhi'),(338,'Pragati Vihar',110003,'New Delhi'),(339,'Pratap Market',110014,'New Delhi'),(340,'Pul Pahladpur',110044,'New Delhi'),(341,'Pushp Vihar',110017,'New Delhi'),(342,'Pushpa Bhawan',110062,'New Delhi'),(343,'Sadiq Nagar',110049,'New Delhi'),(344,'Safdarjung Air Port',110003,'New Delhi'),(345,'Sahpurjat',110049,'New Delhi'),(346,'Saket South Delhi',110017,'New Delhi'),(347,'Sangam Vihar',110080,'New Delhi'),(348,'Sant Nagar South Delhi',110065,'New Delhi'),(349,'Sarita Vihar',110076,'New Delhi'),(350,'Sarvodya Enclave',110017,'New Delhi'),(351,'South Malviya Nagar',110017,'New Delhi'),(352,'Sriniwaspuri',110065,'New Delhi'),(353,'Sukhdev Vihar',110025,'New Delhi'),(354,'Talimabad',110080,'New Delhi'),(355,'Tehkhand',110020,'New Delhi'),(356,'Tugalkabad Railway Colony',110044,'New Delhi'),(357,'Village Tugalkabad',110044,'New Delhi'),(358,'Zakir Nagar',110025,'New Delhi'),(359,'505 A B Workshop',110010,'New Delhi'),(360,'A F Palam',110010,'New Delhi'),(361,'A F Rajokari',110038,'New Delhi'),(362,'Anand Niketan',110021,'New Delhi'),(363,'Ansari Nagar',110029,'New Delhi'),(364,'Aps Colony',110010,'New Delhi'),(365,'Arjungarh',110047,'New Delhi'),(366,'Aya Nagar',110047,'New Delhi'),(367,'BHATI VILLAGE',110074,'New Delhi'),(368,'Bijwasan',110061,'New Delhi'),(369,'Chanakya Puri',110021,'New Delhi'),(370,'Chandanhoola',110074,'New Delhi'),(371,'Chattarpur',110074,'New Delhi'),(372,'COD South West Delhi',110010,'New Delhi'),(373,'CSKM School',110074,'New Delhi'),(374,'CVD',110010,'New Delhi'),(375,'Delhi Cantt',110010,'New Delhi'),(376,'Dera',110074,'New Delhi'),(377,'Dhaula Kuan',110010,'New Delhi'),(378,'Fatehpur Beri',110074,'New Delhi'),(379,'Gadaipur',110030,'New Delhi'),(380,'Ghitorni',110030,'New Delhi'),(381,'Green Park Market',110016,'New Delhi'),(382,'Gurgaon Road',110037,'New Delhi'),(383,'Hauz Khas Market',110016,'New Delhi'),(384,'Hauz Khas',110016,'New Delhi'),(385,'IGI Airport',110037,'New Delhi'),(386,'Ignou',110068,'New Delhi'),(387,'IT Hauz Khas',110016,'New Delhi'),(388,'Jaunapur',110047,'New Delhi'),(389,'JNU New Campus',110067,'New Delhi'),(390,'JNU',110067,'New Delhi'),(391,'Kapashera',110097,'New Delhi'),(392,'Kidwai Nagar East',110023,'New Delhi'),(393,'Kidwai Nagar West',110023,'New Delhi'),(394,'Kirby Place',110010,'New Delhi'),(395,'Lado Sarai',110030,'New Delhi'),(396,'Laxmi Bai Nagar',110023,'New Delhi'),(397,'Mahipalpur',110037,'New Delhi'),(398,'Maidan Garhi',110068,'New Delhi'),(399,'Malcha Marg',110021,'New Delhi'),(400,'Mandi',110047,'New Delhi'),(401,'Masood Pur',110070,'New Delhi'),(402,'Mehrauli',110030,'New Delhi'),(403,'Moti Bagh',110021,'New Delhi'),(404,'Munirka',110067,'New Delhi'),(405,'Nanak Pura',110021,'New Delhi'),(406,'Nangal Dewat',110037,'New Delhi'),(407,'Nauroji Nagar',110029,'New Delhi'),(408,'Netaji Nagar South West Delhi',110023,'New Delhi'),(409,'NIE Campus',110016,'New Delhi'),(410,'Palam Airport',110037,'New Delhi'),(411,'Paryavaran Complex',110030,'New Delhi'),(412,'Pinto Park',110010,'New Delhi'),(413,'R K Puram Main',110066,'New Delhi'),(414,'R K Puram Sect1',110022,'New Delhi'),(415,'R K Puram Sect12',110022,'New Delhi'),(416,'R K Puram Sect3',110022,'New Delhi'),(417,'R K Puram Sect4',110022,'New Delhi'),(418,'R K Puram Sect5',110022,'New Delhi'),(419,'R K Puram Sect7',110022,'New Delhi'),(420,'R K Puram Sect8',110022,'New Delhi'),(421,'R K Puram Sector  6 Postal SB',110022,'New Delhi'),(422,'R K Puram West',110066,'New Delhi'),(423,'R R Hospital',110010,'New Delhi'),(424,'Rajokari',110038,'New Delhi'),(425,'Safdarjung Enclave',110029,'New Delhi'),(426,'Sanjay Colony Bhati Mines',110074,'New Delhi'),(427,'Sarojini Nagar HO',110023,'New Delhi'),(428,'Satbari',110074,'New Delhi'),(429,'Shahbad Mohammadpur',110061,'New Delhi'),(430,'Signal Enclave',110010,'New Delhi'),(431,'South Delhi Campus',110021,'New Delhi'),(432,'Station Road South West Delhi',110010,'New Delhi'),(433,'Subroto Park',110010,'New Delhi'),(434,'Sultanpur',110030,'New Delhi'),(435,'T B Hospital',110030,'New Delhi'),(436,'Technology Bhawan',110016,'New Delhi'),(437,'Vasant Kunj PktA',110070,'New Delhi'),(438,'Vasant Kunj',110070,'New Delhi'),(439,'Vasant Vihar1',110057,'New Delhi'),(440,'Vasant Vihar2',110057,'New Delhi'),(441,'Amberhai',110075,'New Delhi'),(442,'Arjun Park',110043,'New Delhi'),(443,'Ashok Nagar (West Delhi)',110018,'New Delhi'),(444,'Ashoka Park Extn.',110026,'New Delhi'),(445,'Badusarai',110071,'New Delhi'),(446,'Bagdola',110077,'New Delhi'),(447,'Bakkarwala',110041,'New Delhi'),(448,'Baprola',110043,'New Delhi'),(449,'Barthal',110077,'New Delhi'),(450,'Chand Nagar',110018,'New Delhi'),(451,'Chaukhandi',110018,'New Delhi'),(452,'Chhawla',110071,'New Delhi'),(453,'CRPF Jharoda Kalan',110072,'New Delhi'),(454,'D. K. Mohan Garden',110059,'New Delhi'),(455,'D.E.S.U. Colony',110058,'New Delhi'),(456,'Dabri',110045,'New Delhi'),(457,'Daulatpur',110043,'New Delhi'),(458,'Dhansa',110073,'New Delhi'),(459,'Dhulsiras',110077,'New Delhi'),(460,'Dichaun Kalan',110043,'New Delhi'),(461,'Dindarpur',110043,'New Delhi'),(462,'District Court Complex Dwarka',110075,'New Delhi'),(463,'Durga Park',110043,'New Delhi'),(464,'Dwarka Sec 6',110075,'New Delhi'),(465,'ESI',110015,'New Delhi'),(466,'Fateh Nagar',110018,'New Delhi'),(467,'Galib Pur',110073,'New Delhi'),(468,'GGSIP University',110078,'New Delhi'),(469,'Ghuman Hera',110073,'New Delhi'),(470,'Gopal Nagar',110043,'New Delhi'),(471,'Hari Nagar BE Block',110064,'New Delhi'),(472,'Hari Nagar Dadb Block',110064,'New Delhi'),(473,'Hari Nagar (West Delhi)',110064,'New Delhi'),(474,'Hastal Village',110059,'New Delhi'),(475,'Hirankudna',110041,'New Delhi'),(476,'Indira Park',110045,'New Delhi'),(477,'Issapur',110073,'New Delhi'),(478,'Jafarpur',110073,'New Delhi'),(479,'Jail Road (West Delhi)',110058,'New Delhi'),(480,'Janakpuri A 3',110058,'New Delhi'),(481,'Janakpuri B 1',110058,'New Delhi'),(482,'Janakpuri C 4',110058,'New Delhi'),(483,'Janta Market',110027,'New Delhi'),(484,'Jawala Heri',110063,'New Delhi'),(485,'Jeevan Park',110059,'New Delhi'),(486,'Jharoda Kalan',110072,'New Delhi'),(487,'Jhatikara',110043,'New Delhi'),(488,'Jwala Puri',110087,'New Delhi'),(489,'K5 Extn. Mohan Garden',110059,'New Delhi'),(490,'Kair',110043,'New Delhi'),(491,'Kakrola',110078,'New Delhi'),(492,'Kangan Heri',110071,'New Delhi'),(493,'Karam Pura',110015,'New Delhi'),(494,'Khaira',110043,'New Delhi'),(495,'Khera Dabur',110073,'New Delhi'),(496,'Khyala Phase    I',110018,'New Delhi'),(497,'Khyala Phase   II',110018,'New Delhi'),(498,'Kunwar Singh Nagar',110041,'New Delhi'),(499,'L. M. Nagar Indl. Area',110015,'New Delhi'),(500,'M.B.S. Nagar',110018,'New Delhi'),(501,'Madipur Slum Quarter',110063,'New Delhi'),(502,'Madipur Village',110063,'New Delhi'),(503,'Mahabir Nagar',110018,'New Delhi'),(504,'Mahavir Enclave',110045,'New Delhi'),(505,'Malik Pur',110073,'New Delhi'),(506,'Mansarover Garden',110015,'New Delhi'),(507,'Matiala',110059,'New Delhi'),(508,'Maya Puri',110064,'New Delhi'),(509,'Mayapuri Shopping Centre',110064,'New Delhi'),(510,'Mitraon',110043,'New Delhi'),(511,'Moti Nagar',110015,'New Delhi'),(512,'Mundela Kalan',110073,'New Delhi'),(513,'Mundka',110041,'New Delhi'),(514,'N.S.I.T. Dwarka',110078,'New Delhi'),(515,'Najafgarh',110043,'New Delhi'),(516,'Nangal Raya',110046,'New Delhi'),(517,'Nangloi   II',110041,'New Delhi'),(518,'Nangloi   III',110041,'New Delhi'),(519,'Nangloi',110041,'New Delhi'),(520,'Naraina Industrial Estate H.O',110028,'New Delhi'),(521,'Naraina Village',110028,'New Delhi'),(522,'Nasirpur',110045,'New Delhi'),(523,'Neelwal',110041,'New Delhi'),(524,'Nilothi',110041,'New Delhi'),(525,'Palam Extn (Harijan Basti)',110077,'New Delhi'),(526,'Palam Village',110045,'New Delhi'),(527,'Pandwala Kalan',110043,'New Delhi'),(528,'Papravat',110043,'New Delhi'),(529,'Paschim Vihar B Block',110063,'New Delhi'),(530,'Paschim Vihar',110063,'New Delhi'),(531,'Peeragarhi',110087,'New Delhi'),(532,'Punjabi Bagh',110026,'New Delhi'),(533,'Punjabi Bagh Sec   III',110026,'New Delhi'),(534,'Quazipur',110073,'New Delhi'),(535,'Qutub Vihar',110071,'New Delhi'),(536,'Raj Nagar   II',110077,'New Delhi'),(537,'Rajouri Garden J 6',110027,'New Delhi'),(538,'Rajouri Market',110027,'New Delhi'),(539,'Ramesh Nagar H.O',110015,'New Delhi'),(540,'Ranhola',110041,'New Delhi'),(541,'Raota',110073,'New Delhi'),(542,'Rewla Khanpur',110043,'New Delhi'),(543,'Sagarpur',110046,'New Delhi'),(544,'Sanjay Enclave',110059,'New Delhi'),(545,'Shivaji Park (West Delhi)',110026,'New Delhi'),(546,'SHYAM VIHAR',110043,'New Delhi'),(547,'Subhash Nagar (West Delhi)',110027,'New Delhi'),(548,'Subhash Nagar West',110027,'New Delhi'),(549,'Sunder Vihar',110087,'New Delhi'),(550,'Surehra',110043,'New Delhi'),(551,'Tagore Garden',110027,'New Delhi'),(552,'Tikri Kalan',110041,'New Delhi'),(553,'Tilak Nagar East',110018,'New Delhi'),(554,'Tilak Nagar (West Delhi)',110018,'New Delhi'),(555,'Tilangpur Kotla',110043,'New Delhi'),(556,'Ujwa',110073,'New Delhi'),(557,'Uttam Nagar',110059,'New Delhi'),(558,'Vikas Puri',110018,'New Delhi'),(559,'Vishnu Garden',110018,'New Delhi'),(560,'Zakhira',110015,'New Delhi');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumber`
--

DROP TABLE IF EXISTS `phonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonenumber` (
  `uid` int(11) NOT NULL,
  `phoneNumber` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`,`phoneNumber`),
  CONSTRAINT `phonenumber_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumber`
--

LOCK TABLES `phonenumber` WRITE;
/*!40000 ALTER TABLE `phonenumber` DISABLE KEYS */;
INSERT INTO `phonenumber` VALUES (1,9509921350),(2,8422788930),(2,9645301661),(2,9755613051),(3,8324705868),(3,9944435185),(4,8859281221),(4,9656832090),(4,9834573752),(5,8763798000),(5,9374998300),(6,8094310296),(6,9009299553),(7,8966967798),(7,9178830750),(8,8555596971),(9,9174625281),(10,8951654231),(10,9473771787),(11,8302285299),(11,9786006843),(12,9516075292),(13,9172709013),(13,9715641443),(13,9800475505),(14,8848610689),(14,9335930375),(15,9310601362),(16,9800040998),(16,9990773875),(17,8416407506),(18,8642509812),(18,8782332776),(18,9056303789),(19,8037057321),(19,9790620552),(20,8001433407),(20,8185642391),(20,9223991960),(21,8278065877),(21,8536943898),(21,8755876054),(22,8156749761),(22,8681023402),(22,9971421713),(23,8765417552),(24,9272858488),(24,9297212922),(24,9511884735),(25,8585895333),(25,8692015794),(26,8063618872),(26,8456998562),(26,9316341627),(27,9721949998),(27,9963510042),(28,8327321493),(28,8519659435),(28,9139681680),(29,8480950728),(29,9682899036),(30,8144419669),(30,8222581118),(30,8842817042),(31,8651500335),(31,9297721666),(31,9576290497),(32,9468833190),(33,8430937057),(33,9019808203),(33,9331461117),(34,8528496813),(34,8989405277),(35,8900300045),(35,9874914918),(36,8315013024),(36,8583773222),(37,8808410933),(37,9584052732),(37,9918720078),(38,8638316669),(38,9189128191),(38,9915127043),(39,9881919556),(39,9959196122),(39,9968503787),(40,9407923537),(41,9793257091),(42,8788723081),(43,8058646769),(43,9407991479),(44,9671136210),(45,9108999366),(45,9997557547),(46,8153445968),(47,8375156257),(47,8387303347),(47,8792840704),(48,9047067447),(49,9767616693),(49,9946503111),(50,8035740357),(51,8759393260),(52,8671761945),(52,9588429387),(52,9892485610),(53,8889087470),(53,9231174822),(53,9611175083),(54,9223072132),(55,8468726135),(55,9066372121),(55,9618381693),(56,8284035079),(56,8860535333),(56,9836456308),(57,8561814472),(57,8923249178),(57,9165094806),(58,8533424978),(59,9175979759),(59,9726112293),(60,8449908887),(60,9605536873),(60,9932587279),(61,8557093641),(61,9418460402),(62,8450357989),(62,8545052734),(62,9351684140),(63,8842228191),(64,8323862036),(64,9100398895),(64,9962859695),(65,9126155632),(66,9416442848),(66,9792085129),(66,9945510025),(67,8646290528),(67,8888407984),(67,9205956335),(68,8028651863),(68,9636802829),(68,9709506343),(69,8659758049),(69,9700849826),(70,8694573085),(70,9277898453),(71,8253918135),(72,8015738645),(72,8526459318),(73,8619178252),(73,9746402209),(74,9443739084),(75,8012246525),(75,8948348177),(75,8965848545),(76,8110182458),(77,8305381312),(77,8979884690),(77,9746126636),(78,9284342382),(79,8210076895),(79,9186930367),(80,9176925142),(81,9107556317),(81,9256586778),(81,9963664380),(82,8944297932),(82,9538587438),(82,9905248094),(83,9594326543),(83,9983011094),(84,8993412469),(84,9893358749),(85,9429369034),(85,9764292316),(86,8763312981),(86,8992515360),(87,9999744901),(88,9603066388),(88,9709744958),(89,8166641788),(89,8487554791),(90,8245354316),(90,8789884447),(90,9428365770),(91,8082533316),(92,8259723019),(93,9476677382),(94,9325940578),(94,9919595959),(95,9559671982),(96,8376893223),(96,8664671087),(96,8748112481),(97,8413455524),(98,9045884961),(98,9808268191),(99,8040997710),(100,8016376670),(100,9272571629),(100,9899402670),(101,8811992299),(101,8899001122),(101,9823109213),(103,8372435734);
/*!40000 ALTER TABLE `phonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professioncategory`
--

DROP TABLE IF EXISTS `professioncategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professioncategory` (
  `pid` int(11) NOT NULL,
  `profession` varchar(32) DEFAULT 'NONE',
  `domain` varchar(32) DEFAULT 'NONE',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professioncategory`
--

LOCK TABLES `professioncategory` WRITE;
/*!40000 ALTER TABLE `professioncategory` DISABLE KEYS */;
INSERT INTO `professioncategory` VALUES (0,'None','None'),(1,'Cook','Domestic Help'),(2,'Plumber','Domestic Help'),(3,'Electrician','Domestic Help'),(4,'House Cleaner','Domestic Help'),(5,'Carpenter','Domestic Help'),(6,'Painter','Domestic Help'),(7,'Gardener','Domestic Help'),(8,'Driver','Domestic Help'),(9,'Pool Cleaner','Domestic Help'),(10,'Guard','Domestic Help'),(11,'Delivery person','Domestic Help'),(12,'Vegetable seller','Seller'),(13,'Baby Sitter','Care Takers'),(14,'Pet Keeper','Care Takers'),(15,'Party Decorator','Party Helper'),(16,'Tutor','Education'),(17,'Dentist','Doctor'),(18,'ENT','Doctor'),(19,'Washer','Laundary'),(20,'Dry cleaner','Laundary');
/*!40000 ALTER TABLE `professioncategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratingsandreviews`
--

DROP TABLE IF EXISTS `ratingsandreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratingsandreviews` (
  `uidSS` int(11) NOT NULL,
  `uidSP` int(11) NOT NULL,
  `rating` int(5) DEFAULT NULL,
  `review` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`uidSS`,`uidSP`),
  KEY `uidSP` (`uidSP`),
  CONSTRAINT `ratingsandreviews_ibfk_1` FOREIGN KEY (`uidSS`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `ratingsandreviews_ibfk_2` FOREIGN KEY (`uidSP`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratingsandreviews`
--

LOCK TABLES `ratingsandreviews` WRITE;
/*!40000 ALTER TABLE `ratingsandreviews` DISABLE KEYS */;
INSERT INTO `ratingsandreviews` VALUES (1,78,1,'Can\'t understand language'),(1,89,0,'Too expensive'),(2,9,0,'Comes very late'),(2,21,0,'Shabby'),(2,51,0,'Can\'t understand language'),(2,52,1,'Too expensive'),(3,11,2,'Shabby'),(4,11,0,'Can\'t understand language'),(4,14,0,'Comes very late'),(4,31,0,'disappointed! :('),(4,71,2,'Poor service'),(4,92,2,'Poor service'),(4,96,1,'Too expensive'),(4,100,1,'Shabby'),(4,101,3,'Excellent'),(6,1,0,'Comes very late'),(6,35,0,'disappointed! :('),(6,63,0,'Too expensive'),(6,70,0,'disappointed! :('),(6,96,0,'Can\'t understand language'),(6,99,0,'Poor service'),(7,22,0,'Too expensive'),(7,24,2,'Poor service'),(7,40,0,'Poor service'),(7,47,2,'Shabby'),(7,48,1,'Poor service'),(7,90,1,'Too expensive'),(7,100,2,'Poor service'),(8,27,2,'disappointed! :('),(8,64,1,'Too expensive'),(8,71,1,'Poor service'),(8,72,2,'disappointed! :('),(8,75,1,'Comes very late'),(8,87,2,'Poor service'),(8,95,2,'Comes very late'),(9,23,1,'Poor service'),(9,48,1,'Shabby'),(9,51,1,'Shabby'),(9,62,2,'Too expensive'),(9,75,1,'disappointed! :('),(9,77,2,'disappointed! :('),(10,4,4,'Well dressed'),(10,6,5,'Affordable'),(11,9,2,'Too expensive'),(11,24,0,'Poor service'),(11,45,0,'Can\'t understand language'),(11,55,0,'Shabby'),(11,87,2,'Poor service'),(11,88,2,'Can\'t understand language'),(11,94,2,'Can\'t understand language'),(11,99,0,'Comes very late'),(12,3,4,'Very Happy'),(12,5,5,'Well dressed'),(12,6,3,'Affordable'),(12,9,1,'Poor service'),(12,11,3,'Well dressed'),(12,22,2,'Can\'t understand language'),(12,25,1,'Poor service'),(12,56,2,'Poor service'),(12,61,0,'Too expensive'),(12,79,0,'disappointed! :('),(12,84,1,'Comes very late'),(12,85,1,'disappointed! :('),(13,8,3,'Excellent'),(14,7,2,'Poor service'),(14,19,0,'Can\'t understand language'),(14,30,2,'Shabby'),(14,35,0,'Poor service'),(14,67,2,'Poor service'),(14,68,1,'Too expensive'),(14,81,2,'Comes very late'),(14,83,0,'Comes very late'),(15,19,1,'Can\'t understand language'),(15,32,1,'disappointed! :('),(15,70,1,'Comes very late'),(16,9,2,'Shabby'),(16,20,0,'Too expensive'),(16,40,2,'Can\'t understand language'),(16,68,2,'Can\'t understand language'),(16,98,2,'Poor service'),(17,2,0,'Comes very late'),(17,7,0,'Poor service'),(17,21,1,'Can\'t understand language'),(17,50,1,'Too expensive'),(17,55,0,'disappointed! :('),(17,58,2,'Shabby'),(17,62,1,'disappointed! :('),(19,12,2,'Too expensive'),(19,18,1,'Can\'t understand language'),(19,51,2,'Too expensive'),(19,59,0,'Can\'t understand language'),(19,61,0,'Poor service'),(19,75,1,'Poor service'),(19,89,1,'Comes very late'),(20,11,1,'disappointed! :('),(20,15,0,'disappointed! :('),(20,19,0,'disappointed! :('),(20,36,0,'Can\'t understand language'),(20,43,2,'Comes very late'),(20,68,2,'Too expensive'),(20,82,0,'Shabby'),(20,85,0,'Can\'t understand language'),(20,96,0,'disappointed! :('),(21,1,3,'Well dressed'),(21,6,3,'Good Service'),(21,25,0,'disappointed! :('),(21,51,2,'Can\'t understand language'),(21,69,0,'disappointed! :('),(21,74,0,'Shabby'),(21,79,1,'Shabby'),(22,9,4,'Good Service'),(22,96,2,'Comes very late'),(23,4,3,'Affordable'),(23,10,5,'Well dressed'),(23,30,1,'Too expensive'),(23,32,0,'disappointed! :('),(23,94,0,'Can\'t understand language'),(24,3,0,'Too expensive'),(24,49,2,'disappointed! :('),(24,54,0,'Comes very late'),(24,62,1,'Poor service'),(25,10,4,'Very Happy'),(25,27,0,'Comes very late'),(25,68,2,'Poor service'),(26,4,2,'disappointed! :('),(26,6,2,'Can\'t understand language'),(26,8,1,'disappointed! :('),(26,25,1,'Can\'t understand language'),(26,39,2,'Too expensive'),(26,49,0,'Comes very late'),(26,68,1,'Too expensive'),(26,72,2,'Poor service'),(26,87,2,'disappointed! :('),(27,3,3,'Excellent'),(27,8,3,'On time!'),(27,9,5,'Good Service'),(27,11,4,'Good Service'),(27,34,0,'Comes very late'),(27,47,0,'Too expensive'),(27,49,2,'Can\'t understand language'),(27,51,2,'Can\'t understand language'),(28,9,1,'disappointed! :('),(28,13,1,'disappointed! :('),(28,19,0,'Shabby'),(28,39,0,'Can\'t understand language'),(28,56,2,'Shabby'),(28,66,0,'Shabby'),(28,89,0,'Too expensive'),(29,4,4,'Excellent'),(29,35,2,'Shabby'),(29,61,1,'Comes very late'),(29,66,2,'Can\'t understand language'),(29,70,0,'Can\'t understand language'),(29,79,1,'Poor service'),(29,81,0,'Can\'t understand language'),(30,5,0,'Poor service'),(30,37,2,'Poor service'),(30,40,2,'Can\'t understand language'),(30,66,1,'Too expensive'),(30,93,1,'disappointed! :('),(31,4,2,'Too expensive'),(31,5,4,'On time!'),(31,47,2,'Shabby'),(31,84,1,'Too expensive'),(32,10,4,'Well dressed'),(32,18,1,'Can\'t understand language'),(32,21,0,'Can\'t understand language'),(32,38,2,'Can\'t understand language'),(32,61,0,'Shabby'),(32,86,1,'Shabby'),(32,91,0,'Comes very late'),(33,2,4,'Good Service'),(33,8,1,'Shabby'),(33,11,5,'Good Service'),(33,36,0,'Shabby'),(33,39,2,'Too expensive'),(33,61,2,'Poor service'),(33,100,2,'Can\'t understand language'),(34,4,1,'Comes very late'),(34,28,2,'Poor service'),(34,38,2,'Too expensive'),(34,40,2,'Comes very late'),(34,56,1,'Shabby'),(34,73,2,'Can\'t understand language'),(34,95,2,'Comes very late'),(35,1,3,'Good Service'),(35,3,0,'Shabby'),(35,8,4,'On time!'),(35,9,1,'Comes very late'),(35,60,1,'Can\'t understand language'),(35,65,0,'Shabby'),(36,1,5,'Well dressed'),(37,4,5,'On time!'),(37,10,4,'Very Happy'),(37,23,2,'disappointed! :('),(37,97,0,'Poor service'),(38,10,4,'Very Happy'),(38,11,4,'Excellent'),(38,41,0,'Too expensive'),(38,64,1,'Shabby'),(38,70,0,'disappointed! :('),(38,80,0,'disappointed! :('),(39,5,4,'On time!'),(39,7,5,'Affordable'),(39,11,4,'On time!'),(39,16,0,'Comes very late'),(39,21,2,'Too expensive'),(39,50,1,'disappointed! :('),(39,90,0,'Shabby'),(40,4,2,'Too expensive'),(40,13,2,'Poor service'),(40,17,0,'Too expensive'),(40,21,2,'Poor service'),(40,30,2,'Too expensive'),(40,38,2,'Poor service'),(40,47,1,'Too expensive'),(40,70,2,'Too expensive'),(40,82,2,'Shabby'),(41,40,2,'disappointed! :('),(41,73,2,'Shabby'),(42,8,3,'Well dressed'),(42,11,4,'Very Happy'),(42,25,2,'Too expensive'),(42,60,2,'Comes very late'),(42,73,1,'Shabby'),(42,80,2,'disappointed! :('),(42,88,0,'Comes very late'),(43,4,2,'Can\'t understand language'),(43,9,4,'Good Service'),(43,25,2,'Can\'t understand language'),(44,2,5,'On time!'),(44,3,2,'Shabby'),(44,4,5,'Affordable'),(44,28,1,'Poor service'),(44,29,1,'disappointed! :('),(44,46,2,'Too expensive'),(44,60,2,'Comes very late'),(44,61,2,'Can\'t understand language'),(44,64,0,'Can\'t understand language'),(44,97,0,'Comes very late'),(46,1,0,'Too expensive'),(46,6,5,'Very Happy'),(46,11,0,'disappointed! :('),(46,64,1,'disappointed! :('),(47,8,1,'disappointed! :('),(47,11,1,'Poor service'),(47,16,0,'Poor service'),(47,41,1,'Can\'t understand language'),(47,61,0,'disappointed! :('),(47,63,2,'Poor service'),(47,68,2,'Comes very late'),(47,86,2,'Too expensive'),(47,94,2,'Can\'t understand language'),(48,12,2,'Poor service'),(48,21,0,'disappointed! :('),(48,39,2,'disappointed! :('),(48,49,1,'disappointed! :('),(48,58,2,'Too expensive'),(49,8,5,'Very Happy'),(49,36,2,'Comes very late'),(49,51,0,'Too expensive'),(51,23,0,'Shabby'),(51,25,2,'Comes very late'),(51,68,0,'Poor service'),(51,73,2,'disappointed! :('),(51,81,1,'Can\'t understand language'),(52,2,4,'Affordable'),(52,58,0,'Poor service'),(52,71,1,'Shabby'),(52,100,0,'Comes very late'),(53,8,0,'disappointed! :('),(53,10,2,'Comes very late'),(53,18,1,'Too expensive'),(53,34,1,'Too expensive'),(53,51,2,'Poor service'),(53,69,0,'Comes very late'),(53,90,1,'Shabby'),(54,3,3,'Good Service'),(54,5,4,'Affordable'),(54,10,3,'Very Happy'),(54,11,5,'Affordable'),(54,37,0,'Comes very late'),(54,38,1,'Shabby'),(54,47,2,'Comes very late'),(54,56,1,'disappointed! :('),(54,68,2,'Too expensive'),(54,75,2,'Too expensive'),(54,80,2,'Can\'t understand language'),(54,95,1,'disappointed! :('),(55,8,4,'On time!'),(56,6,2,'Poor service'),(56,12,0,'Too expensive'),(56,31,0,'disappointed! :('),(56,57,2,'Can\'t understand language'),(56,62,0,'disappointed! :('),(56,83,1,'Comes very late'),(56,95,0,'Poor service'),(57,44,2,'Too expensive'),(57,62,2,'disappointed! :('),(58,6,4,'On time!'),(59,8,0,'Poor service'),(59,15,0,'Can\'t understand language'),(59,34,2,'disappointed! :('),(59,39,1,'Poor service'),(60,6,2,'Comes very late'),(60,11,1,'Poor service'),(60,12,1,'Too expensive'),(60,77,2,'disappointed! :('),(61,8,5,'Excellent'),(61,29,2,'Shabby'),(61,37,1,'Too expensive'),(61,40,0,'Poor service'),(61,55,1,'Comes very late'),(61,88,0,'Comes very late'),(61,94,2,'Too expensive'),(61,101,0,'Shabby'),(62,44,2,'Shabby'),(62,69,2,'Too expensive'),(62,71,0,'Too expensive'),(63,46,0,'Shabby'),(63,91,0,'Shabby'),(64,3,4,'Affordable'),(64,5,4,'On time!'),(64,38,2,'Poor service'),(64,52,2,'Too expensive'),(64,72,0,'Poor service'),(64,96,2,'Comes very late'),(65,11,4,'Good Service'),(65,97,1,'Comes very late'),(66,16,0,'disappointed! :('),(66,32,1,'disappointed! :('),(66,65,2,'Can\'t understand language'),(66,99,1,'disappointed! :('),(67,2,1,'Comes very late'),(67,33,1,'Poor service'),(67,53,0,'Poor service'),(67,68,0,'Poor service'),(67,69,2,'Can\'t understand language'),(67,75,2,'Poor service'),(67,76,0,'disappointed! :('),(67,77,1,'disappointed! :('),(67,90,0,'Comes very late'),(68,11,1,'disappointed! :('),(68,62,2,'Shabby'),(68,81,2,'Can\'t understand language'),(68,101,4,'On time!'),(69,100,1,'Can\'t understand language'),(69,101,4,'On time!'),(70,43,2,'Shabby'),(70,76,2,'Too expensive'),(70,91,0,'disappointed! :('),(103,5,5,'He really cook delecious food man!');
/*!40000 ALTER TABLE `ratingsandreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sosemailid`
--

DROP TABLE IF EXISTS `sosemailid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sosemailid` (
  `uid` int(11) NOT NULL,
  `emailID` varchar(100) NOT NULL,
  PRIMARY KEY (`uid`,`emailID`),
  CONSTRAINT `sosemailid_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sosemailid`
--

LOCK TABLES `sosemailid` WRITE;
/*!40000 ALTER TABLE `sosemailid` DISABLE KEYS */;
INSERT INTO `sosemailid` VALUES (1,'sushant_sos@gmail.com'),(2,'charlie_sos@gmail.com'),(3,'jack_sos@gmail.com'),(4,'amolika_sos@gmail.com'),(5,'himesh_sos@gmail.com'),(6,'veena_sos@gmail.com'),(7,'nagma_sos@gmail.com'),(8,'ragini_sos@gmail.com'),(9,'uday_sos@gmail.com'),(10,'biren_sos@gmail.com'),(11,'nazir_sos@gmail.com'),(12,'hema_sos@gmail.com'),(13,'navami_sos@gmail.com'),(14,'maya_sos@gmail.com'),(15,'jyoti_sos@gmail.com'),(16,'jaswant_sos@gmail.com'),(17,'wafa_sos@gmail.com'),(18,'runjhun_sos@gmail.com'),(19,'pinky_sos@gmail.com'),(20,'bharat_sos@gmail.com'),(21,'bharat_sos@gmail.com'),(22,'mini_sos@gmail.com'),(23,'pamela_sos@gmail.com'),(24,'kamlesh_sos@gmail.com'),(25,'suraj_sos@gmail.com'),(26,'yamini_sos@gmail.com'),(27,'aruna_sos@gmail.com'),(28,'himanshu_sos@gmail.com'),(29,'komal_sos@gmail.com'),(30,'sunita_sos@gmail.com'),(31,'mukul_sos@gmail.com'),(32,'poonam_sos@gmail.com'),(33,'teena_sos@gmail.com'),(34,'trishana_sos@gmail.com'),(35,'jawahar_sos@gmail.com'),(36,'nidhi_sos@gmail.com'),(37,'hetan_sos@gmail.com'),(38,'wafa_sos@gmail.com'),(39,'prasoon_sos@gmail.com'),(40,'leela_sos@gmail.com'),(41,'yamini_sos@gmail.com'),(42,'gayatri_sos@gmail.com'),(43,'atul_sos@gmail.com'),(44,'rajesh_sos@gmail.com'),(45,'kamini_sos@gmail.com'),(46,'ishat_sos@gmail.com'),(47,'tabeed_sos@gmail.com'),(48,'feroz_sos@gmail.com'),(49,'sharad_sos@gmail.com'),(50,'arjun_sos@gmail.com'),(51,'anil_sos@gmail.com'),(52,'umesh_sos@gmail.com'),(53,'usha_sos@gmail.com'),(54,'faraz_sos@gmail.com'),(55,'ekbal_sos@gmail.com'),(56,'deep_sos@gmail.com'),(57,'kajal_sos@gmail.com'),(58,'nawab,_sos@gmail.com'),(59,'trishana_sos@gmail.com'),(60,'sheetal_sos@gmail.com'),(61,'yadu_sos@gmail.com'),(62,'aastha_sos@gmail.com'),(63,'heena_sos@gmail.com'),(64,'kunti_sos@gmail.com'),(65,'radha_sos@gmail.com'),(66,'urvashi_sos@gmail.com'),(67,'bharat_sos@gmail.com'),(68,'siddharth_sos@gmail.com'),(69,'raj_sos@gmail.com'),(70,'nishita_sos@gmail.com'),(71,'anil_sos@gmail.com'),(72,'wafiq_sos@gmail.com'),(73,'srinivasan_sos@gmail.com'),(74,'bhaagyasree_sos@gmail.com'),(75,'leela_sos@gmail.com'),(76,'chameli_sos@gmail.com'),(77,'obaid_sos@gmail.com'),(78,'kalyan_sos@gmail.com'),(79,'hina_sos@gmail.com'),(80,'raj_sos@gmail.com'),(81,'pranab_sos@gmail.com'),(82,'sirish_sos@gmail.com'),(83,'akhila_sos@gmail.com'),(84,'vijay_sos@gmail.com'),(85,'aarushi_sos@gmail.com'),(86,'sunita_sos@gmail.com'),(87,'ghalib_sos@gmail.com'),(88,'jagruti_sos@gmail.com'),(89,'yasmin_sos@gmail.com'),(90,'ramesh_sos@gmail.com'),(91,'hanuman_sos@gmail.com'),(92,'arpit_sos@gmail.com'),(93,'ram_sos@gmail.com'),(94,'radhika_sos@gmail.com'),(95,'pranab_sos@gmail.com'),(96,'aruna_sos@gmail.com'),(97,'aditya_sos@gmail.com'),(98,'mukti_sos@gmail.com'),(99,'jiya_sos@gmail.com'),(100,'nalini_sos@gmail.com'),(101,'demo_sos@gmail.com');
/*!40000 ALTER TABLE `sosemailid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `aadharNumber` bigint(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `serviceProvider` varchar(5) DEFAULT NULL,
  `completeProfile` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `aadharNumber` (`aadharNumber`),
  KEY `pid` (`pid`),
  KEY `idx_user_name` (`name`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professioncategory` (`pid`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Abbezolt','fBjAn','Sushant Kata',18,785139000000,1,'Yes',1),(2,'Abouter','zeRtJ','Charlie Meka',20,887337000000,1,'Yes',1),(3,'Acessoli','GJiyE','Jack Oza',27,294563000000,1,'Yes',1),(4,'Angelia','vcPHS','Amolika Parikh',17,792979000000,1,'Yes',1),(5,'Anhartma','GEOrr','Himesh Bhattacharyya',23,568845000000,1,'Yes',1),(6,'AnhartRock','uxxPi','Veena Ram',43,603316000000,1,'Yes',1),(7,'Announcenri','siIhV','Nagma Ghosh',53,732657000000,1,'Yes',1),(8,'Apagoodbo','njQWd','Ragini Kulkarni',34,961484000000,1,'Yes',1),(9,'Apenguinnont','bFjem','Uday Sundaram',34,670796000000,1,'Yes',1),(10,'Argumbb','mhuoR','Biren Mandal',54,832558000000,1,'Yes',1),(11,'Avidityga','vXahp','Nazir Walla',65,413531000000,1,'Yes',1),(12,'Babstag','gGhdT','Hema Barman',34,708734000000,2,'Yes',1),(13,'Bentl','WOEPF','Navami Khatri',22,126552000000,2,'Yes',1),(14,'Bleerise','WsGVY','Maya Subramaniam',23,713799000000,2,'Yes',1),(15,'Buller','FHwnm','Jyoti Mahajan',24,781083000000,2,'Yes',1),(16,'Champen','prQrP','Jaswant Persad',22,682460000000,2,'Yes',1),(17,'ChellDeluxe','TNjYy','Wafa Radhakrishnan',26,122351000000,2,'Yes',1),(18,'ChellNearly','RKawF','Runjhun Goyal',27,303979000000,2,'Yes',1),(19,'Chicket','DhxUQ','Pinky Tella',32,341811000000,2,'Yes',1),(20,'Copersh','NGOoc','Bharat Sarraf',21,869916000000,3,'Yes',1),(21,'Crawlecite','lFINj','Bharat Merchant',33,184048000000,3,'Yes',1),(22,'Darker','jDqJU','Mini Sangha',35,166569000000,3,'Yes',1),(23,'Deandsto','GheLo','Pamela Pai',37,299388000000,3,'Yes',1),(24,'DeckWeird','GPJKv','Kamlesh Tandon',17,628712000000,3,'Yes',1),(25,'Digingla','sfpzE','Suraj Ramson',23,865074000000,4,'Yes',1),(26,'Dinteau','NtqFM','Yamini Biswas',43,659147000000,4,'Yes',1),(27,'Dirtype','cziVN','Aruna Mahal',53,666472000000,4,'Yes',1),(28,'Doodlect','ZKiSd','Himanshu Goswami',34,247088000000,4,'Yes',1),(29,'Eventsar','qrIDZ','Komal Dey',34,877748000000,4,'Yes',1),(30,'Execab','wGvJj','Sunita Bir',54,246801000000,4,'Yes',1),(31,'Fatech','MmLtc','Mukul Kuruvilla',65,655231000000,4,'Yes',1),(32,'FinestBrainy','jwEum','Poonam Bhatti',34,628787000000,4,'Yes',1),(33,'FlashTiger','qqYJa','Teena Narain',22,303905000000,5,'Yes',1),(34,'Foreverbord','RsWZb','Trishana Krish',23,145994000000,5,'Yes',1),(35,'Fuzzyme','qhUHI','Jawahar Ganesh',24,547927000000,5,'Yes',1),(36,'Genesire','UpaUs','Nidhi Natarajan',22,883575000000,5,'Yes',1),(37,'Getri','OSyFD','Hetan Suri',26,429769000000,5,'Yes',1),(38,'Gorgeouserry','RsngS','Wafa Srinivasan',27,922199000000,6,'Yes',1),(39,'Gosively','uPxvy','Prasoon Tiwari',32,542350000000,6,'Yes',1),(40,'Greific','ccJub','Leela Sant',21,217573000000,6,'Yes',1),(41,'GuruShopping','beBgv','Yamini Rout',33,884340000000,7,'Yes',1),(42,'Handwatte','aeqtf','Gayatri Balakrishnan',35,642036000000,7,'Yes',1),(43,'Hanoy','MNpqf','Atul Sankaran',37,339662000000,7,'Yes',1),(44,'Heidgear','kxrhA','Rajesh Comar',87,426895000000,8,'Yes',1),(45,'Idisland','lKTDw','Kamini Bera',67,728014000000,8,'Yes',1),(46,'Ifallfron','csVwL','Ishat Anthony',56,740957000000,8,'Yes',1),(47,'Inclute','IfWzq','Tabeed Seshadri',28,386264000000,9,'Yes',1),(48,'Iriders','Giwrm','Feroz Bassi',28,527180000000,9,'Yes',1),(49,'Javana','eiwjA','Sharad Kapadia',29,343779000000,9,'Yes',1),(50,'Jewelwork','BMtOG','Arjun Mahabir',38,163839000000,9,'Yes',1),(51,'KavenBlacken','QWWUn','Anil Savant',32,585436000000,9,'Yes',1),(52,'Kavenes','hMstt','Umesh Nair',22,815542000000,10,'Yes',1),(53,'Keeperla','JPsHS','Usha Natt',26,697616000000,10,'Yes',1),(54,'Keesscoo','vwnxI','Faraz Oak',27,490563000000,11,'Yes',1),(55,'Kinovers','SJUNb','Ekbal Sabharwal',32,211982000000,11,'Yes',1),(56,'Lechlig','NHckb','Deep Puri',21,370853000000,11,'Yes',1),(57,'Limeth','VUXJq','Kajal Kannan',33,429109000000,12,'Yes',1),(58,'Loupe','DYwyz','Nawab, Bhandari',35,440987000000,12,'Yes',1),(59,'Luviewer','DRCxM','Trishana Krishnan',37,128573000000,13,'Yes',1),(60,'Magnerzet','AWxcX','Sheetal Sing',87,993542000000,13,'Yes',1),(61,'Majeresush','umwFI','Yadu Kant',67,373127000000,14,'Yes',1),(62,'Maniakktik','Sebxy','Aastha Sarma',56,162744000000,14,'Yes',1),(63,'Medicis','QASlk','Heena Sankar',28,569036000000,15,'Yes',1),(64,'Megsty','Ywghv','Kunti Suri',28,755091000000,15,'Yes',1),(65,'Mosseric','rfcij','Radha Thakur',29,990862000000,16,'Yes',1),(66,'Narmally','sbBhI','Urvashi Chowdhury',38,510102000000,17,'Yes',1),(67,'Natiresl','euPsV','Bharat Sekhon',32,328888000000,18,'Yes',1),(68,'Nephewed','pghnm','Siddharth Gole',22,324361000000,19,'Yes',1),(69,'Ningeror','BjYDR','Raj Dutta',26,891884000000,20,'Yes',1),(70,'NotesPrime','WJTIu','Nishita Parsa',27,531871000000,20,'Yes',1),(71,'Noteste','YexFi','Anil Pant',32,202757000000,20,'Yes',1),(72,'NoteVash','jmBbl','Wafiq Vora',21,881476000000,NULL,'No',1),(73,'NsmileBug','ZpFQP','Srinivasan Modi',33,990483000000,NULL,'No',1),(74,'PatMan','Drspf','Bhaagyasree Mangal',35,721438000000,NULL,'No',1),(75,'Pinchicom','nPGkS','Leela Shan',37,478292000000,NULL,'No',1),(76,'PinkFinal','nRZgM','Chameli Sood',87,441180000000,NULL,'No',1),(77,'Prodightly','ONoEy','Obaid Sarma',67,821035000000,NULL,'No',1),(78,'QueyYour','cjQoy','Kalyan Sha',56,434579000000,NULL,'No',1),(79,'RatFree','dTbmb','Hina Pradhan',28,839188000000,NULL,'No',1),(80,'ReporterSra','KOexi','Raj Lala',28,401220000000,NULL,'No',1),(81,'Rhypsist','sNfWR','Pranab Parikh',29,194497000000,NULL,'No',1),(82,'RonzBlue','KyyID','Sirish Mangal',38,797899000000,NULL,'No',1),(83,'Santekst','IXTak','Akhila George',32,702889000000,NULL,'No',1),(84,'Selkimo','XlJBS','Vijay Hayre',23,184346000000,NULL,'No',1),(85,'Sexyntry','zdowl','Aarushi Sharma',24,144528000000,NULL,'No',1),(86,'SmugSweetie','inYcw','Sunita Sachar',22,251164000000,NULL,'No',1),(87,'Sportwahl','DOyhg','Ghalib Bhattacharyya',26,131339000000,NULL,'No',1),(88,'Standst','uliql','Jagruti Yohannan',27,913710000000,NULL,'No',1),(89,'Subherrok','wWdcP','Yasmin Bali',32,357470000000,NULL,'No',1),(90,'Sumono','yOgls','Ramesh Patla',21,458192000000,NULL,'No',1),(91,'Sumotion','JKNZu','Hanuman Borra',33,931292000000,NULL,'No',1),(92,'Swinkwe','CYWXX','Arpit Shanker',35,400912000000,NULL,'No',1),(93,'Synordia','hEvgP','Ram Gopal Varma',37,524659000000,NULL,'No',1),(94,'TeenzChee','OMDuZ','Radhika Aurora',17,462449000000,NULL,'No',1),(95,'Thintery','eqpUS','Pranab Agarwal',23,157739000000,NULL,'No',1),(96,'Thorsafe','yQACw','Aruna Das',43,701469000000,NULL,'No',1),(97,'Timmeta','gfpUB','Aditya Johal',53,314481000000,NULL,'No',1),(98,'TwitterWillows','wzrAJ','Mukti Balay',34,786613000000,NULL,'No',1),(99,'UrGino','dGbPC','Jiya Sarin',34,168126000000,NULL,'No',1),(100,'Viuseldg','ODeAb','Nalini Kapur',54,463800000000,NULL,'No',1),(101,'Demouser','demo','Demo User',21,123457000000,NULL,'No',1),(103,'hem625','1234','Hemant Dhankar',20,878349234783,16,'yes',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-27 21:19:34
