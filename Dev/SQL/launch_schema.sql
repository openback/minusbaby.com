-- MySQL dump 10.13  Distrib 5.5.28, for Linux (x86_64)
--
-- Host: localhost    Database: crashfaster
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `type` enum('Compilation','Appears on','EP','LP') DEFAULT NULL,
  `label` varchar(140) DEFAULT NULL,
  `label_url` text,
  `catalog_number` varchar(140) DEFAULT NULL,
  `title` varchar(140) NOT NULL DEFAULT '',
  `release_date` date DEFAULT NULL,
  `formats` varchar(140) DEFAULT NULL,
  `country` varchar(2) DEFAULT 'US',
  `url` text,
  `purchase_url` text,
  `license` varchar(140) DEFAULT NULL,
  `cover_file_path` text,
  `cover_file_name` varchar(140) DEFAULT NULL,
  `cover_file_size` int(32) DEFAULT NULL,
  `cover_content_type` varchar(140) DEFAULT NULL,
  `thumbnail_file_path` text,
  `thumbnail_file_name` varchar(140) DEFAULT NULL,
  `thumbnail_file_size` int(32) DEFAULT NULL,
  `thumbnail_content_type` varchar(140) DEFAULT NULL,
  `comments` text,
  `downloads` int(32) DEFAULT '0',
  `slug` varchar(140) DEFAULT 'album',
  `artist` varchar(140) DEFAULT 'minusbaby',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sort_order` int(32) NOT NULL,
  `name` varchar(1024) NOT NULL DEFAULT '',
  `tag` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL,
  `bio` text,
  `show_in_contact` tinyint(1) DEFAULT '0',
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(140) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `description` text,
  `venue_id` int(32) NOT NULL DEFAULT '0',
  `external_url` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `event_file_path` text,
  `event_file_name` varchar(140) DEFAULT NULL,
  `event_file_size` int(32) DEFAULT NULL,
  `event_content_type` varchar(140) DEFAULT NULL,
  `slug` varchar(140) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'<p style=\"color: inherit;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nulla dui, volutpat ut temcdpor eu, gravida eget tortor. Nam et arcu libero, quis gravida leo. Nunc ante velit, scelerisque vitae auctor et, iaculis non diam. <a href=\"#\">Donec porta eleifend ornare</a>. Lorem ipsum dolor sit amcfcet, consectetur adipiscing elit. Morbi cursus suscipit orci, auctor rhoncus nibh malesuada a. Maecenas euismod sollicitudin tortor vitae viverra. In hac habitasse platea dictumst. In hac habitasse platea dictumst. Mauris eu semper odio. Proin quis felis ultricies quam blandit semper ut ut dolor. Duis et dui sem, ac sodales lectus. Maecenas bibendum nunc pellentesque ligula suscipit nec vestibulum erat porta.</p>\r\n\r\n<p>Suspendisse tempor consequat elit et ultrices. Duis ut mi nec purus viverra bibendum sit amet quis sapien. Suspendisse at enim vitae risus vehicula condimentum. Sed non mi ut tellus mattis rutrum et vel eros. Quisque vehicula convallis massa, auctor vulputate turpis ultricies vel. Donec ultrices mi et enim fringilla ut placerat leo pretium. Maecenas porttitor iaculis eleifend. Aliquam sit amet ultrices erat. <a href=\"#\">Donec ut euismod ipsum</a>. Quisque quis erat mauris. Sed laoreet, mauris vitae interdum elementum, ante dolor consequat metus, non tincidunt massa sem non sem. Suspendisse ut odio nisi, sed porta erat. Nam auctor pulvinar lectus, id blandit nisi semper vitae.</p>\r\n');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(140) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text,
  `embed` text,
  `post_file_path` text,
  `post_file_name` varchar(140) DEFAULT NULL,
  `post_file_size` int(32) DEFAULT NULL,
  `post_content_type` varchar(140) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `slug` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `key` text,
  `value` text,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'news_page_count','5','Number of news posts to show per page'),(3,'maintenance_mode','0','Only allow the webmaster to log in. Use this for making code changes to the site.');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sort_order` int(32) NOT NULL,
  `name` varchar(1024) NOT NULL DEFAULT '',
  `url` varchar(1024) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,'Last.fm','http://last.fm/artist/crashfaster',0),(2,2,'Facebook','https://facebook.com/crashfaster',0);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `album_id` int(32) NOT NULL DEFAULT '0',
  `artist` varchar(140) NOT NULL DEFAULT '',
  `title` varchar(140) NOT NULL DEFAULT '',
  `url` text,
  `number` int(2) NOT NULL DEFAULT '0',
  `length` varchar(5) DEFAULT NULL,
  `downloads` int(32) DEFAULT '0',
  `file_size` int(32) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=404 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venues`
--

DROP TABLE IF EXISTS `venues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venues` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(140) NOT NULL DEFAULT '',
  `address1` varchar(140) NOT NULL DEFAULT '',
  `address2` varchar(140) DEFAULT NULL,
  `city` varchar(140) NOT NULL DEFAULT '',
  `state` varchar(140) DEFAULT NULL,
  `zip` varchar(140) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `url` text,
  `map` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venues`
--

LOCK TABLES `venues` WRITE;
/*!40000 ALTER TABLE `venues` DISABLE KEYS */;
INSERT INTO `venues` VALUES (1,'Studio 34','4522 Baltimore Avenue','','Philadelphia','Pennsylvania','19143','US','http://studio34yoga.com/','http://goo.gl/s1ShO'),(2,'The Tank','354 West 45th Street','','New York','New York','10036','US','http://thetanknyc.org/','http://goo.gl/F8TQU'),(3,'Fat Buddha','212 Avenue A','','New York','New York','10009','US','http://www.google.com/maps/place?cid=8884496948534234422&q=fat+buddha+nyc&fb=1&gl=us&hq=fat+buddha&hnear=New+York,+NY','http://goo.gl/BSXDd'),(5,'Plano B','Rua Francisco Muratori, 2A','','Lapa','Rio de Janeiro','20230','BR','http://planob.net','http://goo.gl/UOBjd'),(6,'Oi Futuro','Rua Visconde de PirajÃ¡, 54','','Ipanema','Rio de Janeiro','22410-000','BR','http://www.oifuturo.org.br/cultura/oi-futuro-ipanema','http://goo.gl/qZQHT'),(7,'The Times Center','242 West 41st Street','','New York','New York','10018','US','http://thetimescenter.com','http://goo.gl/d8UKF'),(11,'Babycastles @ Showpaper','217 E 42nd Street','','New York','New York','10017','US','http://www.babycastles.com','http://goo.gl/wsTUo'),(12,'Showcase Live at Patriot Place','23 Patriot Place','','Foxborough','Massachusetts','02035','US','http://www.showcaselive.com','http://goo.gl/qWedU'),(13,'Kokoro Studio','682 Geary Street','','San Francisco','California','94102','US','http://kokorostudio.us','http://goo.gl/0mK36'),(14,'Washington State Convention Center','800 Convention Place','','Seattle','Washington','98101','US','http://www.wsctc.com','http://goo.gl/cUtmH'),(15,'DNA Lounge','375 Eleventh Street','','San Francisco','California','94103','US','http://www.dnalounge.com','http://goo.gl/Niokj'),(16,'Livraria da Esquina','Rua do Bosque, 1254','','Barra Funda','SÃ£o Paulo','','BR','http://www.livrariadaesquina.com.br','http://goo.gl/eJI2I'),(17,'Sesi-SP','Avenida Paulista, 1313','','Bela Vista','SÃ£o Paulo','01311','BR','http://www.sesisp.org.br','http://goo.gl/w0jTl'),(18,'Hotel Pennsylvania','401 7th Avenue','','New York','New York','10001','US','http://www.hotelpenn.com/','http://goo.gl/razW9'),(19,'LoFi Loft','1410 Rue Wolfe','','MontrÃ©al','QuÃ©bec','H1W1R7','CA','','http://goo.gl/yEuR0'),(20,'The High Line','Washington St & Gansevoort St','','New York','New York','10014','US','http://www.thehighline.org/','http://goo.gl/9vTQR'),(21,'La Kueva','39-31 Queens Boulevard','','Queens','New York','11104','US','http://www.lakueva.com','http://goo.gl/Mf6sm'),(23,'Bar Passeport','2037 Rue Saint-Denis','','MontrÃ©al','QuÃ©bec','H2X 3K8','CA','http://www.barpasseport.com','http://goo.gl/h9U4S'),(24,'Niagara Bar','112 Avenue A','','New York','New York','10009','US','http://www.niagarabar.com','http://goo.gl/MbMvf'),(25,'The Middle East Â· Upstairs','480 Massachusetts Avenue','','Cambridge','Massachusetts','02139','US','http://www.mideastclub.com','http://goo.gl/Djub6'),(26,'The Bell House','149 7th Street','','Brooklyn','New York','11215','US','http://www.thebellhouseny.com','http://goo.gl/nTKG8'),(27,'Grey Gallery & Lounge','1122 E Pike Street','Box 1495','Seattle','Washington','98122','US','http://www.greygalleryandlounge.com','http://goo.gl/BZFVF'),(28,'Ground Kontrol','511 NW Couch Street','','Portland','Oregon','97209','US','http://www.groundkontrol.com','http://goo.gl/wnjNe'),(29,'Chop Suey Cafe & Lounge','347 East 1st Street','','Los Angeles','California','90012','US','http://www.chopsueycafeandlounge.com','http://goo.gl/j5BP5'),(30,'The Studio at Webster Hall','125 E 11th Street','','New York','New York','10003','US','http://www.websterhall.com/thestudio','http://goo.gl/Ytg4S'),(31,'Pilam','3914 Spruce Street','','Philadelphia','Pennsylvania','19104','US','http://www.myspace.com/thepilam','http://goo.gl/YZm3y'),(32,'No Malice Palace','197 E. 3rd Street','','New York','New York','10009','US','http://www.nomalice.com','http://goo.gl/G5Xya'),(33,'Otto\'s Shrunken Head','538 E. 14th Street','','New York','New York','10009','US','http://www.ottosshrunkenhead.com','http://goo.gl/6TEKp'),(34,'Sonotheque','1444 West Chicago Avenue','','Chicago','Illinois','60612','US','http://www.sonotheque.net','http://goo.gl/foMlX'),(35,'The Annex','','','New York','New York','','US','',NULL),(36,'TÅ±zraktÃ©r','Budapest VI. ker. HegedÅ± u. 3.','','Budapest','','','HU','http://tuzrakter.hu','http://goo.gl/VRtCv'),(37,'Teatr Polski','',NULL,'Wroc&#0322;aw','',NULL,'PL','http://www.teatrpolski.wroc.pl',NULL),(38,'Arsenal','',NULL,'Wroc&#0322;aw','',NULL,'PL','http://www.muzeum.miejskie.wroclaw.pl',NULL),(39,'Platform4','',NULL,'Aalborg','',NULL,'DK','http://platform4.dk',NULL),(40,'Korova','',NULL,'Liverpool','England',NULL,'GB','http://www.korova-liverpool.com',NULL),(41,'The Courtyard Theatre','',NULL,'London','England',NULL,'GB','http://www.thecourtyard.org.uk',NULL),(42,'Santos Party House','96 Lafayette Street','','New York','New York','10013','US','http://www.santospartyhouse.com','http://goo.gl/obaVL'),(43,'Don Pedro','','','New York','New York','','US','http://www.myspace.com/donpedrobar',NULL),(44,'Wicked Willy\'s','149 Bleecker Street','','New York','New York','10012','US','http://3.ly/kec','http://goo.gl/jxzIq'),(45,'Liberty Lands Park','913-961 N 3rd Street','','Philadelphia','Pennsylvania','19176','US','','http://goo.gl/Pv9om'),(46,'Public Assembly','70 North 6th Street','','Brooklyn','NY','11211','US','http://www.publicassemblynyc.com/','http://goo.gl/xiSMv'),(47,'Some Warehouse','',NULL,'St. Louis','MO',NULL,'US','',NULL),(48,'Eyebeam','540 W. 21st Street','','New York','NY','10011','US','http://eyebeam.org','http://goo.gl/0By6z'),(49,'Union Pool','484 Union Avenue','','Brooklyn','New York','11211','US','http://unionpool.blogspot.com/','http://goo.gl/wkiWp'),(50,'The Foundry','84-86 Great Eastern Street','','London','England','EC2','GB','http://www.foundry.tv','http://goo.gl/Iv9e7'),(51,'Vertexlist','138 Bayard Street','','Brooklyn','New York','11222','US','http://www.vertexlist.net','http://goo.gl/jFeLf'),(52,'OpenAir','','','New York','New York','','US','',NULL),(53,'Limehouse Town Hall','646 Commercial Road','','London','England','E14 7HA','GB','http://twenteenthcentury.com/lth','http://goo.gl/GnmE6'),(54,'Remote Lounge','327 Bowery','','New York','New York','10003','US','','http://goo.gl/fuiP4'),(55,'Warsaw','261 Driggs Avenue','','Brooklyn','New York','11222','US','http://www.polishnationalhome.com/warsaw.html','http://goo.gl/yAUfT'),(56,'FUN','130 Madison Street','','New York','New York','10002','US','','http://goo.gl/Bhhvl'),(57,'The Lookout','3600 16th Street','','San Francisco','California','94114','US','http://lookoutsf.com','http://goo.gl/jzr0o'),(58,'Plano B','Rua CÃ¢ndido dos Reis nÂº 30','','Porto','','4050','PT','http://www.planobporto.com','http://goo.gl/Hbvp3'),(59,'DogCaffÃ¨','Rua Texas, 605','','Brooklin','SÃ£o Paulo','04557-000','BR','http://dog.tv.br/dogcaffe','http://goo.gl/ypuSZ');
/*!40000 ALTER TABLE `venues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sort_order` int(32) NOT NULL,
  `title` varchar(140) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `thumbnail_url` varchar(140) NOT NULL,
  `embed` text NOT NULL,
  `description` text,
  `slug` varchar(140) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `performers`
--

DROP TABLE IF EXISTS `performers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performers` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `event_id` int(32) NOT NULL DEFAULT '0',
  `name` varchar(140) NOT NULL DEFAULT '',
  `url` text,
  `role` enum('artist','visualist') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-09 20:40:33
