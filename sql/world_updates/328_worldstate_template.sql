-- MySQL dump 10.13  Distrib 5.1.23-rc, for Win64 (unknown)
--
-- Host: localhost    Database: abd
-- ------------------------------------------------------
-- Server version	5.1.23-rc-community

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
-- Table structure for table `worldstate_template`
--

DROP TABLE IF EXISTS `worldstate_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `worldstate_template` (
  `mapid` int(30) unsigned NOT NULL,
  `zone_mask` int(30) NOT NULL,
  `faction_mask` int(30) NOT NULL,
  `field_number` int(30) unsigned NOT NULL,
  `initial_value` int(30) NOT NULL,
  `comment` varchar(200) NOT NULL,
  PRIMARY KEY (`field_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `worldstate_template`
--

LOCK TABLES `worldstate_template` WRITE;
/*!40000 ALTER TABLE `worldstate_template` DISABLE KEYS */;
INSERT INTO `worldstate_template` VALUES (530,3483,-1,2476,0,'WORLDSTATE_HELLFIRE_ALLIANCE_TOWERS_CONTROLLED'),(530,3483,-1,2478,0,'WORLDSTATE_HELLFIRE_HORDE_TOWERS_CONTROLLED'),(530,3483,-1,2490,1,'WORLDSTATE_HELLFIRE_TOWER_DISPLAY_ALLIANCE'),(530,3483,-1,2489,1,'WORLDSTATE_HELLFIRE_TOWER_DISPLAY_HORDE'),(530,3483,-1,2473,0,'WORLDSTATE_HELLFIRE_PVP_CAPTURE_BAR_DISPLAY'),(530,3483,-1,2474,0,'WORLDSTATE_HELLFIRE_PVP_CAPTURE_BAR_VALUE'),(530,3483,-1,2472,1,'WORLDSTATE_HELLFIRE_STADIUM_NEUTRAL'),(530,3483,-1,2471,0,'WORLDSTATE_HELLFIRE_STADIUM_ALLIANCE'),(530,3483,-1,2470,0,'WORLDSTATE_HELLFIRE_STADIUM_HORDE'),(530,3483,-1,2482,1,'WORLDSTATE_HELLFIRE_OVERLOOK_NEUTRAL'),(530,3483,-1,2480,0,'WORLDSTATE_HELLFIRE_OVERLOOK_ALLIANCE'),(530,3483,-1,2481,0,'WORLDSTATE_HELLFIRE_OVERLOOK_HORDE'),(530,3483,-1,2485,1,'WORLDSTATE_HELLFIRE_BROKENHILL_NEUTRAL'),(530,3483,-1,2483,0,'WORLDSTATE_HELLFIRE_BROKENHILL_ALLIANCE'),(530,3483,-1,2484,0,'WORLDSTATE_HELLFIRE_BROKENHILL_HORDE'),(530,3518,-1,2502,0,'WORLDSTATE_HALAA_GUARD_DISPLAY_ALLIANCE'),(530,3518,-1,2503,0,'WORLDSTATE_HALAA_GUARD_DISPLAY_HORDE'),(530,3518,-1,2491,0,'WORLDSTATE_HALAA_GUARDS_REMAINING'),(530,3518,-1,2493,0,'WORLDSTATE_HALAA_GUARDS_REMAINING_MAX');
/*!40000 ALTER TABLE `worldstate_template` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-05-16 12:03:45
