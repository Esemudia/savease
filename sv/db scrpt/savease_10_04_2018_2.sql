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

/*Table structure for table `seaudittrail` */

DROP TABLE IF EXISTS `seaudittrail`;

CREATE TABLE `seaudittrail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskName` varchar(30) NOT NULL COMMENT 'The Application Task of Function Carried out',
  `computerName` varchar(30) NOT NULL,
  `ipaddress` varchar(11) DEFAULT NULL,
  `AUDITDATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIONPERFORMED` varchar(1) DEFAULT NULL COMMENT 'C-Create, U-Update, D-Delete',
  `taskid` int(11) DEFAULT NULL COMMENT 'ID Corresponding to the Table ID on which action is performed',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `seroleassignment` */

DROP TABLE IF EXISTS `seroleassignment`;

CREATE TABLE `seroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuid` int(11) NOT NULL,
  `roleid` int(11) DEFAULT NULL,
  `read` varchar(20) DEFAULT NULL,
  `write` varchar(20) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role_group_id` int(11) DEFAULT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(11) DEFAULT NULL,
  `userlevel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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

/* Procedure structure for procedure `insertUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser`(
IN in_username varchar(11),
IN in_password varchar(30),
IN in_rolegroup int,
in in_createdBy varchar(11),
in in_userlvl int
)
BEGIN
    insert into users(username,PASSWORD,role_group,createdBy,userlevel) 
    values (in_username ,in_password,in_rolegroup,in_createdBy,in_userlvl);
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
