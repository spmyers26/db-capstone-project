-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: little_lemon_db
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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `bookingID` int NOT NULL AUTO_INCREMENT,
  `bookingDate` date NOT NULL,
  `tableNumber` int NOT NULL,
  `customerID` int DEFAULT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `fk_customerID` (`customerID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer_details` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2022-10-10',5,1),(2,'2022-11-12',3,3),(3,'2022-10-11',2,2),(4,'2022-10-13',2,1),(5,'2022-10-10',5,NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_details` (
  `customerID` int NOT NULL,
  `customerFullName` varchar(255) NOT NULL,
  `phone` int NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` VALUES (1,'John Doe',1234567890,'john.doe@example.com'),(2,'Jane Smith',1876543210,'jane.smith@example.com'),(3,'Mike Johnson',1567890123,'mike.johnson@example.com'),(4,'Emily Brown',1890123456,'emily.brown@example.com'),(5,'David Wilson',1345678901,'david.wilson@example.com');
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuID` int NOT NULL,
  `cuisine` varchar(255) NOT NULL,
  `menuName` varchar(45) NOT NULL,
  `menuItemsID` int NOT NULL,
  PRIMARY KEY (`menuID`),
  KEY `menuItemsID_idx` (`menuItemsID`),
  CONSTRAINT `menuItemsID` FOREIGN KEY (`menuItemsID`) REFERENCES `menu_items` (`menuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Italian','Italian Menu',1),(2,'Mexican','Mexican Menu',2),(3,'Chinese','Chinese Menu',3),(4,'Indian','Indian Menu',4),(5,'American','American Menu',5);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `menuItemsID` int NOT NULL,
  `starters` varchar(45) NOT NULL,
  `courses` varchar(45) NOT NULL,
  `drinks` varchar(45) NOT NULL,
  `desserts` varchar(45) NOT NULL,
  PRIMARY KEY (`menuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,'Bruschetta','Pasta','Wine','Tiramisu'),(2,'Guacamole','Tacos','Margarita','Churros'),(3,'Spring Rolls','Fried Rice','Green Tea','Fortune Cookie'),(4,'Samosa','Biryani','Lassi','Gulab Jamun'),(5,'Buffalo Wings','Burger','Soda','Brownie Sundae');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery_status`
--

DROP TABLE IF EXISTS `order_delivery_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery_status` (
  `deliveryID` int NOT NULL,
  `deliveryDate` date NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`deliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery_status`
--

LOCK TABLES `order_delivery_status` WRITE;
/*!40000 ALTER TABLE `order_delivery_status` DISABLE KEYS */;
INSERT INTO `order_delivery_status` VALUES (1,'2023-06-13','Delivered'),(2,'2023-06-14','In Transit'),(3,'2023-06-15','Pending'),(4,'2023-06-16','Delivered'),(5,'2023-06-17','In Transit');
/*!40000 ALTER TABLE `order_delivery_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int NOT NULL,
  `orderDate` date NOT NULL,
  `quantity` int NOT NULL,
  `totalCost` decimal(6,2) NOT NULL,
  `customerID` int NOT NULL,
  `deliveryID` int NOT NULL,
  `bookingID` int NOT NULL,
  `menuID` int NOT NULL,
  `staffID` int DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `deliveryID_idx` (`deliveryID`),
  KEY `customerID_idx` (`customerID`),
  KEY `menuID_idx` (`menuID`),
  KEY `staffID` (`staffID`),
  KEY `bookingID_idx` (`bookingID`),
  CONSTRAINT `bookingID` FOREIGN KEY (`bookingID`) REFERENCES `bookings` (`bookingID`),
  CONSTRAINT `customerID` FOREIGN KEY (`customerID`) REFERENCES `customer_details` (`customerID`),
  CONSTRAINT `deliveryID` FOREIGN KEY (`deliveryID`) REFERENCES `order_delivery_status` (`deliveryID`),
  CONSTRAINT `menuID` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`),
  CONSTRAINT `staffID` FOREIGN KEY (`staffID`) REFERENCES `staff_information` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-06-13',2,130.00,1,1,1,1,NULL),(2,'2023-06-14',1,105.00,2,2,2,2,NULL),(3,'2023-06-15',4,180.00,3,3,3,3,NULL),(4,'2023-06-16',2,130.00,4,4,4,4,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orders_view`
--

DROP TABLE IF EXISTS `orders_view`;
/*!50001 DROP VIEW IF EXISTS `orders_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orders_view` AS SELECT 
 1 AS `OrderID`,
 1 AS `quantity`,
 1 AS `totalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff_information`
--

DROP TABLE IF EXISTS `staff_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_information` (
  `staffID` int NOT NULL,
  `staffFullName` varchar(255) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_information`
--

LOCK TABLES `staff_information` WRITE;
/*!40000 ALTER TABLE `staff_information` DISABLE KEYS */;
INSERT INTO `staff_information` VALUES (1,'Michael Johnson','Manager'),(2,'Emily Davis','Chef'),(3,'Robert Smith','Waiter'),(4,'Sophia Wilson','Bartender'),(5,'Daniel Brown','Hostess');
/*!40000 ALTER TABLE `staff_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `orders_view`
--

/*!50001 DROP VIEW IF EXISTS `orders_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ll_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_view` AS select `orders`.`orderID` AS `OrderID`,`orders`.`quantity` AS `quantity`,`orders`.`totalCost` AS `totalCost` from `orders` where (`orders`.`quantity` > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-16 11:39:22
