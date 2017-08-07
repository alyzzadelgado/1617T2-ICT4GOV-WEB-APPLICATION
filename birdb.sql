-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: birdb
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `app_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` int(11) NOT NULL,
  `user_set` int(11) NOT NULL,
  `transaction_no` int(11) NOT NULL,
  `app_date` date NOT NULL,
  `app_time` time NOT NULL,
  `app_status` varchar(45) NOT NULL,
  `reason` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`app_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (2,2,8,1,'2017-04-05','15:00:00','pending',NULL),(4,5,7,1,'2017-04-12','10:00:00','pending',NULL),(6,2,1,2,'2017-04-09','14:00:00','set','Questionable items in shares of stock'),(8,1,2,2,'2017-04-10','15:00:00','cancelled',NULL),(9,1,2,1,'2017-04-05','15:00:00','pending','Finalization of Property Sale'),(10,2,8,1,'2017-04-05','16:00:00','pending',NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirements` (
  `req_no` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_no` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`req_no`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES (8,1,'Notarized Deed of Sale'),(9,1,'Tax Declaration of Land'),(10,1,'Tax declaration of improvement if needed or Certificate of No Improvement if none'),(11,1,'Title | photocopy and original copy are needed'),(12,1,'Proof of payment'),(13,1,'TIN of seller and buyer'),(14,1,'Zone evaluation of property'),(15,1,'Capital Gains Tax return (after payment of taxes) photocopy only'),(16,1,'Documentary Stamp Tax return (after payment of taxes) photocopy only'),(17,2,'Notarized Deed of Sale'),(18,2,'Stocks Certificate (Original and Photocopy)'),(19,2,'Proof of Payment of Selling Price'),(20,2,'Audited Financial Statement of issuing corporation'),(21,2,'Articles of Incorporation and by-laws of issuing corporation from security and exchange commission (SEC)'),(22,2,'Proof of Cost (Can be original sale or subsequent sale)'),(23,2,'Proof of Acquisition of shares of stock (only needed in Subsequent sale) (Can be an OR or CAR certificate authorizing registration)'),(24,3,'One original copy and one photocopy of the Notarized Deed of Sale/ Exchange of shares of stock'),(25,3,'Photocopy of the Deed of Acquisition or proof of cost/ fair market value of the stocks at the time of acquisition'),(26,3,'Photocopy of certificate of shares of stock'),(27,3,'Photocopy of evidences of expenses related to sale'),(28,3,'Photocopy of Audited Financial Statements duly certified by an independent certified public accountant with computation of fair market value per share at the time of sale'),(29,6,'BIR Form No. 1701 Annual Income Tax Return'),(30,7,'BIR Form No. 1704 Improperly Accumulated Earning Tax Return'),(31,3,'Duly approved Tax Debit Memo, if applicable');
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `transaction_no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`transaction_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'Sale of Real Property'),(2,'Sale of Unlisted Shares of Stock'),(3,'Final Capital Gains Tax for Onerous Transfer of Real Property Classified as Capital Assets'),(6,'Annual Income Tax Return for Self-Employed Individuals, Estates and Trusts'),(7,'Improperly Accumulated Earnings Tax Return');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_no` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `officer_no` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_initial` varchar(45) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `tin_no` varchar(45) NOT NULL,
  `phone_no` varchar(45) NOT NULL,
  `avail_days` varchar(200) NOT NULL,
  `avail_time` varchar(200) NOT NULL,
  PRIMARY KEY (`user_no`,`username`,`password`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jdelacruz','dlsu1234',2,'Juan','D.','Dela Cruz','123-456-789-000','09123456789','Tuesday Wednesday ','11:00 12:00 13:00 14:00 15:00 16:00 '),(2,'rickgrimes','admin',0,'Rick','T.','Grimes','000-000-000-000','09111111111','Monday Wednesday Friday ','13:00 14:00 15:00 16:00 '),(4,'grhee','glenn7',0,'Glenn','S.','Rhee','777-777-777-777','09234518593','Monday Tuesday Thursday','9:00 10:00 11:00 12:00 13:00 14:00'),(5,'magrhee','maggie',0,'Maggie','G.','Greene','987-654-321-000','09876983324','Wednesday Thursday Friday','9:00 10:00 11:00 15:00 16:00'),(7,'juanadcruz','sample',5,'Juana','A.','Dela Cruz','111-111-111-111','09112233445','Monday Thursday Friday ','11:00 12:00 13:00 14:00 '),(8,'spo1cardo','FPJAP',2,'Ricardo','F.','Dalisay','123-123-123-123','09222222222','Monday Tuesday Friday ','14:00 15:00 16:00 ');
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

-- Dump completed on 2017-03-27 10:16:59
