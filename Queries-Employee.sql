/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.1.44-community : Database - employee
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`employee` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `employee`;

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `mobile_number` varchar(17) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`id`,`first_name`,`last_name`,`age`,`mobile_number`,`address`) values (1,'Bhautik','Padmani',22,'7359333658','Rajkot, Gujrat.'),(2,'Vivek','Padmani',24,'9924235609','surat, Gujrat.'),(3,'Mohit','Padmani',21,'7046943074','ahmedabad, Gujrat.');

/*Table structure for table `employee_hobby` */

DROP TABLE IF EXISTS `employee_hobby`;

CREATE TABLE `employee_hobby` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_$employee_id` int(11) DEFAULT NULL,
  `fk_$employee_hobby_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_$employee_id` (`fk_$employee_id`),
  KEY `fk_$employee_hobby_id` (`fk_$employee_hobby_id`),
  CONSTRAINT `employee_hobby_ibfk_1` FOREIGN KEY (`fk_$employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `employee_hobby_ibfk_2` FOREIGN KEY (`fk_$employee_hobby_id`) REFERENCES `hobby` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `employee_hobby` */

insert  into `employee_hobby`(`id`,`fk_$employee_id`,`fk_$employee_hobby_id`) values (1,1,1),(2,2,2),(3,3,3);

/*Table structure for table `employee_salary` */

DROP TABLE IF EXISTS `employee_salary`;

CREATE TABLE `employee_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salary` double NOT NULL,
  `date` date NOT NULL,
  `fk_$employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_$employee_id` (`fk_$employee_id`),
  CONSTRAINT `employee_salary_ibfk_1` FOREIGN KEY (`fk_$employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `employee_salary` */

insert  into `employee_salary`(`id`,`salary`,`date`,`fk_$employee_id`) values (1,1000,'2015-06-24',1),(2,2000,'2022-06-24',2),(3,30000,'2022-06-01',3);

/*Table structure for table `hobby` */

DROP TABLE IF EXISTS `hobby`;

CREATE TABLE `hobby` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `hobby` */

insert  into `hobby`(`id`,`name`) values (1,'Crecket'),(2,'Music'),(3,'Chess');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
