/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 10.1.21-MariaDB : Database - savease
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`savease` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `savease`;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `role_Name` varchar(20) NOT NULL,
  `RoleDescription` text,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `role` */

/*Table structure for table `savease_web_menu` */

DROP TABLE IF EXISTS `savease_web_menu`;

CREATE TABLE `savease_web_menu` (
  `ID` int(11) DEFAULT NULL,
  `MENUID` int(11) NOT NULL,
  `LINK` varchar(50) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `PARENTID` int(11) DEFAULT NULL,
  `INSTALLED` char(1) DEFAULT NULL,
  `ENABLED` char(1) DEFAULT NULL,
  PRIMARY KEY (`MENUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `savease_web_menu` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role_group_id` int(11) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role_group_id`,`createdDate`,`createdBy`) values (1,'admin','D033E22AE348AEB5660FC2140AEC35',1,'2018-04-10 13:30:53',NULL);

/* Procedure structure for procedure `existuser` */

/*!50003 DROP PROCEDURE IF EXISTS  `existuser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `existuser`(IN in_uname varchar(11))
BEGIN
   SELECT COUNT(*) AS counts FROM users where  username= in_uname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `existuserpwd` */

/*!50003 DROP PROCEDURE IF EXISTS  `existuserpwd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `existuserpwd`(IN in_uname varchar(11),IN in_pwd VARCHAR(30))
BEGIN
   SELECT COUNT(*) AS counts FROM users where  username= in_uname and password=in_pwd;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
