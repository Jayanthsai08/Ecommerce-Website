/*
SQLyog Community v13.1.2 (32 bit)
MySQL - 5.5.41 : Database - ecom
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecom` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ecom`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `EMAIL` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`EMAIL`,`PASSWORD`) values 
('Jay@gmail.com','Jay@123');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `PNAME` varchar(50) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `PPRICE` bigint(20) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `cart` */

insert  into `cart`(`PID`,`PNAME`,`CATEGORY`,`PPRICE`,`QUANTITY`) values 
(16,'Men\'s Flannel Shirt','Mens',3200,1),
(17,'Women\'s Satin Dress','Womens',5500,1),
(18,'Heeled Sandals','Shoes',2000,1),
(19,'Leather Belt','Accessories',1200,1);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `CNAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `PHNO` bigint(20) DEFAULT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  PRIMARY KEY (`CID`,`ADDRESS`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`CID`,`CNAME`,`EMAIL`,`PASSWORD`,`PHNO`,`ADDRESS`) values 
(1,'Jayanth','jayanth@gmail.com','Sai@123',9740383746,'bangalore'),
(2,'Priyansh','priysnah@gmail.com','Pri@123',9856298725,'bangalore'),
(3,'Omkar','omkar@gmail.com','Omkar@123',7856914587,'bangalore'),
(20,'speed','speed@gmail.com','sui@123',987452136,'ohio'),
(21,'ronaldo','ronaldo@gmail.com','Sewy@123',6547852556,'portugual'),
(22,'neymar','ney@gmail.com','ney@123',7679535345,'brazil'),
(23,'Virat','virat@gmail.com','Virat@18',9856327415,'Delhi');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `ORID` int(11) NOT NULL AUTO_INCREMENT,
  `CID` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `PNAME` varchar(100) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `PPRICE` bigint(20) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ORID`),
  KEY `orders_ibfk_2` (`CID`),
  KEY `orders_ibfk_1` (`PID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

insert  into `orders`(`ORID`,`CID`,`PID`,`PNAME`,`CATEGORY`,`PPRICE`,`QUANTITY`,`ADDRESS`) values 
(1,1,1,'Mens\'s Flannel Shirt','Men\'s',4500,5,'bangalore'),
(7,2,3,'running shoes','footwear',4000,4,'bangalore'),
(13,2,2,'canvas shoes','shoes',2000,2,'bangalore'),
(16,3,1,'mens jeans','mens',4000,4,'bangalore'),
(17,3,2,'womens jeans','womens',3000,2,'bangalore');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `IMG` varchar(50) DEFAULT NULL,
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `PNAME` varchar(50) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `PPRICE` bigint(20) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`IMG`,`PID`,`PNAME`,`CATEGORY`,`PPRICE`,`QUANTITY`) values 
('men1.jpeg',1,'Mens flannel shirt','Mens',4200,100),
('men2.jpeg',2,'Men\'s Hooded Shirt','Mens',3200,100),
('men3.jpeg',3,'Men\'s Jumper','Mens',2600,50),
('men4.jpeg',4,'Men\'s Cargo Trousers','Mens',2400,100),
('men5.jpeg',5,'Men\'s Ripped Jeans','Mens',2000,100),
('men6.jpeg',6,'Men\'s Blazer','Mens',4000,50),
('women1.jpeg',7,'Women\'s Satin Dress','womens',5500,100),
('women2.jpeg',8,'Women\'s Sun Dress','womens',1800,100),
('women3.jpeg',9,'Women\'s Knit Jumper\r\n\r\n','womens',1600,50),
('women4.jpeg',10,'Women\'s Leather Trousers','womens',2000,100),
('women5.jpeg',11,'Women\'s Jeans','womens',1800,100),
('women6.jpeg',12,'Women\'s Wrap Dress','womens',6000,50),
('shoes1.jpeg',13,'Running Shoes','shoes',2500,50),
('shoes1.jpeg',14,'White Sneakers','shoes',2200,50),
('shoes1.jpeg',15,'Chelsea Boots','shoes',3000,50),
('shoes1.jpeg',16,'Canvas Sneakers','shoes',2000,100),
('shoes1.jpeg',17,'Court Heels','shoes',2500,50),
('shoes1.jpeg',18,'Heeled Sandals','shoes',2000,50),
('acc1.jpeg',19,'Leather Belt','accessories',1200,50),
('acc2.jpeg',20,'Glasses','accessories',1000,50),
('acc3.jpeg',21,'Leather Wallet','accessories',800,50),
('acc4.jpeg',22,'Shoulder Bag','accessories',1400,50),
('acc5.jpeg',23,'Steel Finger Rings','accessories',600,50),
('acc6.jpeg',24,'Cuban Links Neck Chain','accessories',800,50);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
