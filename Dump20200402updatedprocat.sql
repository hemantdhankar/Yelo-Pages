-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: yelopages
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
  `addressType` varchar(50) DEFAULT 'HOME',
  PRIMARY KEY (`uid`,`apartment`),
  KEY `lid` (`lid`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`lid`) REFERENCES `location` (`lid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `aadharNumber` int(11) NOT NULL,
  PRIMARY KEY (`aadharNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaints` (
  `cid` int(11) NOT NULL,
  `uidSS` int(11) DEFAULT NULL,
  `uidSP` int(11) DEFAULT NULL,
  `complaint` varchar(200) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `uidSS` (`uidSS`),
  KEY `uidSP` (`uidSP`),
  KEY `eid` (`eid`),
  CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`uidSS`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`uidSP`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `complaints_ibfk_3` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
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
  `name` varchar(32) DEFAULT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `availability` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
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
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
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
  `phoneNumber` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`phoneNumber`),
  CONSTRAINT `phonenumber_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumber`
--

LOCK TABLES `phonenumber` WRITE;
/*!40000 ALTER TABLE `phonenumber` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `rating` int(11) DEFAULT NULL,
  `review` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`uidSS`,`uidSP`),
  KEY `uidSP` (`uidSP`),
  CONSTRAINT `ratingsandreviews_ibfk_1` FOREIGN KEY (`uidSS`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `ratingsandreviews_ibfk_2` FOREIGN KEY (`uidSP`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratingsandreviews`
--

LOCK TABLES `ratingsandreviews` WRITE;
/*!40000 ALTER TABLE `ratingsandreviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratingsandreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sosnumber`
--

DROP TABLE IF EXISTS `sosnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sosnumber` (
  `uid` int(11) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`phoneNumber`),
  CONSTRAINT `sosnumber_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sosnumber`
--

LOCK TABLES `sosnumber` WRITE;
/*!40000 ALTER TABLE `sosnumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `sosnumber` ENABLE KEYS */;
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
  `serviceProvider` varchar(5) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `aadharNumber` (`aadharNumber`),
  KEY `pid` (`pid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `professioncategory` (`pid`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Abbezolt','fBjAn','Sushant Kata',18,785139063821,'Yes',1),(2,'Abouter','zeRtJ','Charlie Meka',20,887336894998,'Yes',1),(3,'Acessoli','GJiyE','Jack Oza',27,294562894873,'Yes',1),(4,'Angelia','vcPHS','Amolika Parikh',17,792979343907,'Yes',1),(5,'Anhartma','GEOrr','Himesh Bhattacharyya',23,568845219880,'Yes',1),(6,'AnhartRock','uxxPi','Veena Ram',43,603316114476,'Yes',1),(7,'Announcenri','siIhV','Nagma Ghosh',53,732657211953,'Yes',1),(8,'Apagoodbo','njQWd','Ragini Kulkarni',34,961483952702,'Yes',1),(9,'Apenguinnont','bFjem','Uday Sundaram',34,670795627071,'Yes',1),(10,'Argumbb','mhuoR','Biren Mandal',54,832558000200,'Yes',1),(11,'Avidityga','vXahp','Nazir Walla',65,413530650199,'Yes',1),(12,'Babstag','gGhdT','Hema Barman',34,708733544027,'Yes',2),(13,'Bentl','WOEPF','Navami Khatri',22,126551508061,'Yes',2),(14,'Bleerise','WsGVY','Maya Subramaniam',23,713799234141,'Yes',2),(15,'Buller','FHwnm','Jyoti Mahajan',24,781083212407,'Yes',2),(16,'Champen','prQrP','Jaswant Persad',22,682460482167,'Yes',2),(17,'ChellDeluxe','TNjYy','Wafa Radhakrishnan',26,122350680704,'Yes',2),(18,'ChellNearly','RKawF','Runjhun Goyal',27,303979246212,'Yes',2),(19,'Chicket','DhxUQ','Pinky Tella',32,341811459717,'Yes',2),(20,'Copersh','NGOoc','Bharat Sarraf',21,869916280455,'Yes',3),(21,'Crawlecite','lFINj','Bharat Merchant',33,184048498331,'Yes',3),(22,'Darker','jDqJU','Mini Sangha',35,166568638626,'Yes',3),(23,'Deandsto','GheLo','Pamela Pai',37,299388307627,'Yes',3),(24,'DeckWeird','GPJKv','Kamlesh Tandon',17,628711608500,'Yes',3),(25,'Digingla','sfpzE','Suraj Ramson',23,865073990326,'Yes',4),(26,'Dinteau','NtqFM','Yamini Biswas',43,659147402422,'Yes',4),(27,'Dirtype','cziVN','Aruna Mahal',53,666471986359,'Yes',4),(28,'Doodlect','ZKiSd','Himanshu Goswami',34,247087543484,'Yes',4),(29,'Eventsar','qrIDZ','Komal Dey',34,877748048064,'Yes',4),(30,'Execab','wGvJj','Sunita Bir',54,246800894659,'Yes',4),(31,'Fatech','MmLtc','Mukul Kuruvilla',65,655231498442,'Yes',4),(32,'FinestBrainy','jwEum','Poonam Bhatti',34,628787058385,'Yes',4),(33,'FlashTiger','qqYJa','Teena Narain',22,303904722130,'Yes',5),(34,'Foreverbord','RsWZb','Trishana Krish',23,145994291926,'Yes',5),(35,'Fuzzyme','qhUHI','Jawahar Ganesh',24,547926823132,'Yes',5),(36,'Genesire','UpaUs','Nidhi Natarajan',22,883574622429,'Yes',5),(37,'Getri','OSyFD','Hetan Suri',26,429768648942,'Yes',5),(38,'Gorgeouserry','RsngS','Wafa Srinivasan',27,922198548208,'Yes',6),(39,'Gosively','uPxvy','Prasoon Tiwari',32,542350274805,'Yes',6),(40,'Greific','ccJub','Leela Sant',21,217572705528,'Yes',6),(41,'GuruShopping','beBgv','Yamini Rout',33,884339789571,'Yes',7),(42,'Handwatte','aeqtf','Gayatri Balakrishnan',35,642035807500,'Yes',7),(43,'Hanoy','MNpqf','Atul Sankaran',37,339662096141,'Yes',7),(44,'Heidgear','kxrhA','Rajesh Comar',87,426895206670,'Yes',8),(45,'Idisland','lKTDw','Kamini Bera',67,728014085903,'Yes',8),(46,'Ifallfron','csVwL','Ishat Anthony',56,740957303573,'Yes',8),(47,'Inclute','IfWzq','Tabeed Seshadri',28,386264289053,'Yes',9),(48,'Iriders','Giwrm','Feroz Bassi',28,527180112683,'Yes',9),(49,'Javana','eiwjA','Sharad Kapadia',29,343779389741,'Yes',9),(50,'Jewelwork','BMtOG','Arjun Mahabir',38,163838871342,'Yes',9),(51,'KavenBlacken','QWWUn','Anil Savant',32,585435584818,'Yes',9),(52,'Kavenes','hMstt','Umesh Nair',22,815542116658,'Yes',10),(53,'Keeperla','JPsHS','Usha Natt',26,697616215858,'Yes',10),(54,'Keesscoo','vwnxI','Faraz Oak',27,490563185461,'Yes',11),(55,'Kinovers','SJUNb','Ekbal Sabharwal',32,211982397241,'Yes',11),(56,'Lechlig','NHckb','Deep Puri',21,370853209422,'Yes',11),(57,'Limeth','VUXJq','Kajal Kannan',33,429109465426,'Yes',12),(58,'Loupe','DYwyz','Nawab, Bhandari',35,440987025235,'Yes',12),(59,'Luviewer','DRCxM','Trishana Krishnan',37,128572531029,'Yes',13),(60,'Magnerzet','AWxcX','Sheetal Sing',87,993542363479,'Yes',13),(61,'Majeresush','umwFI','Yadu Kant',67,373127352666,'Yes',14),(62,'Maniakktik','Sebxy','Aastha Sarma',56,162743580000,'Yes',14),(63,'Medicis','QASlk','Heena Sankar',28,569036010338,'Yes',15),(64,'Megsty','Ywghv','Kunti Suri',28,755090692970,'Yes',15),(65,'Mosseric','rfcij','Radha Thakur',29,990862393198,'Yes',16),(66,'Narmally','sbBhI','Urvashi Chowdhury',38,510101624689,'Yes',17),(67,'Natiresl','euPsV','Bharat Sekhon',32,328888188785,'Yes',18),(68,'Nephewed','pghnm','Siddharth Gole',22,324361051509,'Yes',19),(69,'Ningeror','BjYDR','Raj Dutta',26,891883748214,'Yes',20),(70,'NotesPrime','WJTIu','Nishita Parsa',27,531871402871,'Yes',20),(71,'Noteste','YexFi','Anil Pant',32,202757443960,'Yes',20),(72,'NoteVash','jmBbl','Wafiq Vora',21,881475672971,'No',10),(73,'NsmileBug','ZpFQP','Srinivasan Modi',33,990482933132,'No',10),(74,'PatMan','Drspf','Bhaagyasree Mangal',35,721437982100,'No',10),(75,'Pinchicom','nPGkS','Leela Shan',37,478291961239,'No',10),(76,'PinkFinal','nRZgM','Chameli Sood',87,441179569564,'No',11),(77,'Prodightly','ONoEy','Obaid Sarma',67,821035449255,'No',11),(78,'QueyYour','cjQoy','Kalyan Sha',56,434578504619,'No',11),(79,'RatFree','dTbmb','Hina Pradhan',28,839188367276,'No',11),(80,'ReporterSra','KOexi','Raj Lala',28,401220402098,'No',11),(81,'Rhypsist','sNfWR','Pranab Parikh',29,194496589235,'No',11),(82,'RonzBlue','KyyID','Sirish Mangal',38,797899024319,'No',12),(83,'Santekst','IXTak','Akhila George',32,702889098177,'No',12),(84,'Selkimo','XlJBS','Vijay Hayre',23,184345791427,'No',12),(85,'Sexyntry','zdowl','Aarushi Sharma',24,144527895493,'No',13),(86,'SmugSweetie','inYcw','Sunita Sachar',22,251164142023,'No',13),(87,'Sportwahl','DOyhg','Ghalib Bhattacharyya',26,131339203527,'No',13),(88,'Standst','uliql','Jagruti Yohannan',27,913709920208,'No',13),(89,'Subherrok','wWdcP','Yasmin Bali',32,357470356954,'No',14),(90,'Sumono','yOgls','Ramesh Patla',21,458192389595,'No',14),(91,'Sumotion','JKNZu','Hanuman Borra',33,931291942882,'No',14),(92,'Swinkwe','CYWXX','Arpit Shanker',35,400912017890,'No',15),(93,'Synordia','hEvgP','Ram Gopal Varma',37,524658510821,'No',15),(94,'TeenzChee','OMDuZ','Radhika Aurora',17,462448750058,'No',15),(95,'Thintery','eqpUS','Pranab Agarwal',23,157738599917,'No',16),(96,'Thorsafe','yQACw','Aruna Das',43,701469143022,'No',16),(97,'Timmeta','gfpUB','Aditya Johal',53,314481283568,'No',16),(98,'TwitterWillows','wzrAJ','Mukti Balay',34,786613430260,'No',17),(99,'UrGino','dGbPC','Jiya Sarin',34,168126290421,'No',17),(100,'Viuseldg','ODeAb','Nalini Kapur',54,463799757817,'No',17),(101,'Demouser','demo','Demo User',21,123456789123,'No',19),(102,'hery624','12345','henry',19,384929482029,'yes',7),(103,'myjhonson','lol123','jhonson',22,489293018492,'No',1);
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

-- Dump completed on 2020-04-02 16:13:02
