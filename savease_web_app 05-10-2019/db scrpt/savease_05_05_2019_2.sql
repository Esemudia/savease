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

/*Table structure for table `contents` */

DROP TABLE IF EXISTS `contents`;

CREATE TABLE `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header` varchar(30) DEFAULT NULL,
  `contents` text NOT NULL,
  `section` char(3) NOT NULL,
  `page` varchar(30) NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contents` */

/*Table structure for table `district` */

DROP TABLE IF EXISTS `district`;

CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `districtName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `district` */

/*Table structure for table `individuals` */

DROP TABLE IF EXISTS `individuals`;

CREATE TABLE `individuals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nsssID` varchar(20) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `mid_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `DOB` date NOT NULL,
  `gender` varchar(13) NOT NULL,
  `photoFront` blob,
  `photoFrontPath` varchar(50) DEFAULT NULL,
  `photoLeft` blob,
  `photoLeftPath` varchar(50) DEFAULT NULL,
  `photoRight` blob,
  `photoRightPath` varchar(50) DEFAULT NULL,
  `street_address` varchar(105) NOT NULL,
  `lga_of_residence` varchar(100) NOT NULL,
  `town_city` varchar(100) NOT NULL,
  `state_of_residence` varchar(50) NOT NULL,
  `state_of_origin` varchar(20) NOT NULL,
  `lga_of_origin` varchar(20) NOT NULL,
  `city_of_birth` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL COMMENT 'City of Residence',
  `phone` varchar(20) NOT NULL,
  `emailID` varchar(100) DEFAULT NULL,
  `employment_status` varchar(20) NOT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  `employer_id` varchar(13) DEFAULT NULL,
  `highest_qualification` varchar(50) DEFAULT NULL,
  `marital_status` varchar(20) NOT NULL,
  `disabilities` varchar(10) DEFAULT NULL,
  `orphan` varchar(10) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '0=not active;1=active;2=death;',
  `dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(20) DEFAULT NULL,
  `taxTypeId` int(20) DEFAULT NULL,
  `yearlyIncome` double DEFAULT NULL,
  `tin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nsss_number` (`nsssID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

/*Data for the table `individuals` */

insert  into `individuals`(`id`,`nsssID`,`first_name`,`mid_name`,`last_name`,`DOB`,`gender`,`photoFront`,`photoFrontPath`,`photoLeft`,`photoLeftPath`,`photoRight`,`photoRightPath`,`street_address`,`lga_of_residence`,`town_city`,`state_of_residence`,`state_of_origin`,`lga_of_origin`,`city_of_birth`,`City`,`phone`,`emailID`,`employment_status`,`occupation`,`employer_id`,`highest_qualification`,`marital_status`,`disabilities`,`orphan`,`status`,`dateCreated`,`createdby`,`taxTypeId`,`yearlyIncome`,`tin`) values (1,'2312443','Bola',NULL,'Ajibade','1977-01-29','Female',NULL,NULL,NULL,NULL,NULL,NULL,'4 King Perekule Street','','ABAJI','ABUJA','JIGAWA','AUYO',NULL,NULL,'123456780',NULL,'Employed',NULL,NULL,'Masters Degree','Married',NULL,'No',0,'2017-08-18 16:04:07','admin',NULL,NULL,NULL),(2,'43216743','Piriye',NULL,'Bob-Manuel','1968-08-17','Male',NULL,NULL,NULL,NULL,NULL,NULL,'plot 40, Odili Road','','ABOH MBAISE','IMO','IMO','',NULL,NULL,'08035529854',NULL,'Employed','Press Man',NULL,'BSc. Mass Communication','Single','No','No',0,'2017-08-17 16:54:19','admin',NULL,NULL,NULL),(3,'24929','Dafiri',NULL,'Irimagha','1977-10-29','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Port Harcourt','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(5,'24939','Angela',NULL,'Irimagha','1980-02-17','Female',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','ANINRI','ENUGU','ENUGU','',NULL,NULL,'08035529854',NULL,'',NULL,NULL,'University Degree','Single','No','No',0,'2017-08-17 16:56:42','admin',NULL,NULL,NULL),(6,'24940','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Port Harcourt','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(7,'24941','Dafiri',NULL,'Irimagha','1977-10-29','Female',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Port Harcourt','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(8,'24942','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Port Harcourt','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(9,'24943','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Port Harcourt','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(10,'24944','Dafiri',NULL,'Irimagha','1977-10-29','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Port Harcourt','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(11,'24945','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Port Harcourt','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(12,'24946','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(14,'24947','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(16,'24948','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(17,'24949','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'421232','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(18,'24950','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'Self','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(19,'24951','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'3421234','University Degree','Married','No','No',1,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(20,'24952','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'3421234','University Degree','Married','No','No',1,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(21,'24953','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'3421234','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(22,'24954','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'3421234','University Degree','Married','No','No',1,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(23,'24955','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'3421234','University Degree','Married','No','No',1,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(25,'24956','Dafiri',NULL,'Irimagha','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'10 Tombia Street','','Bonny','Rivers State','Rivers State','',NULL,NULL,'',NULL,'Self-employed',NULL,'3421234','University Degree','Married','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(30,'240989234823','Monsuru',NULL,'Kayode','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'1 Gowon Way, Apapa','','Lagos','Lagos State','Lagos State','',NULL,NULL,'',NULL,'Employed',NULL,'19894232','University Degree','Single','No','No',0,'2017-07-15 02:44:54',NULL,NULL,NULL,NULL),(52,'NGN/ABI/ABA/483467','dcvdvv','fvfv','fvfvfv','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'fvfvf','','ABA NORTH','ABIA','ABIA','ABA NORTH',NULL,NULL,'vffvvf','fvfvfvv','1',NULL,NULL,NULL,'S',NULL,NULL,0,'2017-10-09 06:58:36','',NULL,NULL,NULL),(53,'56rets','Jonathan','E','Ataisi','2009-01-08','male',NULL,NULL,NULL,NULL,NULL,NULL,'addres 1','','Abua','rivers','Rivers','Andoni',NULL,'portharcourt','08035529398','jonathan@yahoo.com','Employed',NULL,NULL,NULL,'M',NULL,NULL,1,'2017-11-21 04:58:02',NULL,NULL,500000,'12345'),(55,'NGN/ABI/ABA/986610','jonathan2','','ataisi','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'1 stanley wogu','','ABA NORTH','ABIA','ABIA','ABA NORTH',NULL,'portharcour','8035529398','jonathan.ataisi@gmail.com','1',NULL,NULL,NULL,'S',NULL,NULL,1,'2017-11-21 05:36:05','',NULL,452145,''),(57,'NGN/ABI/ABA/311046','jonathan2','','ataisi','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'1 stanley wogu','','ABA NORTH','ABIA','ABIA','ABA NORTH',NULL,'portharcour','8035529398','jonathan.ataisi@gmail.com','1',NULL,NULL,NULL,'S',NULL,NULL,1,'2017-11-21 05:38:05','',NULL,452145,''),(58,'NGN/ABI/ABA/476528','jonathan2','','ataisi','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'1 stanley wogu','','ABA NORTH','ABIA','ABIA','ABA NORTH',NULL,'portharcour','8035529398','jonathan.ataisi@gmail.com','1',NULL,NULL,NULL,'S',NULL,NULL,1,'2017-11-21 05:41:17','',NULL,452145,''),(59,'NGN/ABI/ABA/181717','jonathan2','','ataisi','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'1 stanley wogu','','ABA NORTH','ABIA','ABIA','ABA NORTH',NULL,'portharcour','8035529398','jonathan.ataisi@gmail.com','1',NULL,NULL,NULL,'S',NULL,NULL,1,'2017-11-21 05:42:03','',NULL,452145,''),(60,'NGN/RIV/OBI/795404','Emmanuel','','Onwuchekwa','0000-00-00','Male',NULL,NULL,NULL,NULL,NULL,NULL,'elelenwo','','OBIO AKPOR','RIVERS','RIVERS','OBIO AKPOR',NULL,'Portharcourt','12345678901','emma@gmail.com','1',NULL,NULL,NULL,'S',NULL,NULL,1,'2017-12-03 00:12:30','',NULL,123456785,'11111');

/*Table structure for table `leftnavigation` */

DROP TABLE IF EXISTS `leftnavigation`;

CREATE TABLE `leftnavigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(20) DEFAULT NULL,
  `link` varchar(30) DEFAULT NULL,
  `accessControl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `leftnavigation` */

insert  into `leftnavigation`(`id`,`text`,`link`,`accessControl`) values (1,'Buy Savease PIN','buypin',1),(2,'Register Bank','bankNew',1),(3,'Self Deposit','selfDeposit',1),(4,'Transactions','transactions',1),(5,'Manage Vendors','manageVendor',0),(6,'Sell To Vendor','sell2vendor',0),(7,'Buy Savease PIN','vbuypin',2),(8,'Register Bank','vbanknew',2),(9,'Self Deposit','vselfdeposit',2),(10,'Transactions','vtransactions',2),(11,'Manage Users','adm_create_user',0);

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
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MENUID` int(11) NOT NULL,
  `LINK` varchar(50) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `PARENTID` int(11) DEFAULT NULL,
  `INSTALLED` char(1) DEFAULT NULL,
  `ENABLED` char(1) DEFAULT NULL,
  `GROUPLVL` char(1) DEFAULT '0' COMMENT '0=ALL;1=ADMIN;2=VENDOR;3=CUSTOMER;4=GUEST;',
  PRIMARY KEY (`MENUID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `savease_web_menu` */

insert  into `savease_web_menu`(`ID`,`MENUID`,`LINK`,`TITLE`,`PARENTID`,`INSTALLED`,`ENABLED`,`GROUPLVL`) values (1,1,'defaul.aspx','Home',-1,'1','1','4'),(2,5,'about.aspx','About Us',-1,'1','1','0'),(3,10,'services.aspx','Services',-1,'1','1','0'),(4,15,'customer.aspx','Customer',-1,'1','1',NULL),(5,20,'vendor.aspx','Vendor',-1,'1','1',NULL),(6,25,'admin.aspx','Administration',-1,'1','1',NULL),(7,101,'rechargeCard.aspx','PIN Savings',10,'1','1','0');

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

/*Data for the table `seaudittrail` */

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

/*Data for the table `seroleassignment` */

/*Table structure for table `state_lga` */

DROP TABLE IF EXISTS `state_lga`;

CREATE TABLE `state_lga` (
  `LGA` varchar(50) NOT NULL,
  `STATE` varchar(25) NOT NULL,
  PRIMARY KEY (`LGA`,`STATE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `state_lga` */

insert  into `state_lga`(`LGA`,`STATE`) values ('ABA NORTH','ABIA'),('ABA SOUTH','ABIA'),('ABADAH','BORNO'),('ABAJI','ABUJA'),('ABAK','AKWA IBOM'),('ABAKILIKI','EBONYI'),('ABEOKUTA NORTH','OGUN'),('ABEOKUTA SOUTH','OGUN'),('ABI','CROSS RIVER'),('ABOH MBAISE','IMO'),('ABONEMA','RIVERS'),('ABUA/ODIAL','RIVERS'),('ABUJA MUNICIPAL','ABUJA'),('ADAVI','KOGI'),('ADO','EKITI'),('ADO-ODO/OTTA','OGUN'),('ADOR','BENUE'),('AFIKPO NORTH','EBONYI'),('AFIKPO SOUTH','EBONYI'),('AFUO','OYO'),('AGAIE','NIGER'),('AGATU','BENUE'),('AGEGE','LAGOS'),('AGUATA','ANAMBRA'),('AGWARA','NIGER'),('AHAODA','RIVERS'),('AHAODA WEST','RIVERS'),('AHIAZU MBAISE','IMO'),('AIYERIRE','EKITI'),('AJAOKUTA','KOGI'),('AJEROMI/IFELODUN','LAGOS'),('AJINGI','KANO'),('AKAMKPA','CROSS RIVER'),('AKDO-KOLO','TARABA'),('AKINYELE','OYO'),('AKKO','GOMBE'),('AKOKO EDO','EDO'),('AKOKO NORTH-EAST','ONDO'),('AKOKO NORTH-WEST','ONDO'),('AKOKO SOUTH','ONDO'),('AKOKO SOUTH-EAST','ONDO'),('AKPABUYO','CROSS RIVER'),('AKUKU TORU','RIVERS'),('AKURE','ONDO'),('AKURE NORTH','ONDO'),('AKWANGA','NASARAWA'),('ALBASU','KANO'),('ALIERO','KEBBI'),('ALIMOSHO','LAGOS'),('ALKALERI','BAUCHI'),('AMUVO-ODOFIN','LAGOS'),('ANAMBRA','ANAMBRA'),('ANAMBRA WEST','ANAMBRA'),('ANAOCHA NORTH','DELTA'),('ANAOCHA SOUTH','DELTA'),('ANDONI','RIVERS'),('ANINRI','ENUGU'),('ANIOCHA','ANAMBRA'),('ANKA','ZAMFARA'),('ANKPA','KOGI'),('APA','BENUE'),('APAPA','LAGOS'),('AREWA DANDI','KEBBI'),('ARGUNGU','KEBBI'),('AROCHUKWU','ABIA'),('ASA','KWARA'),('ASARI/TORU','RIVERS'),('ASKIRA/UBA','BORNO'),('ATAKU MOSA EAST','OSUN'),('ATAKU MOSA WEST','OSUN'),('ATIBA','OYO'),('ATIGBO','OYO'),('AUGIE','KEBBI'),('AUYO','JIGAWA'),('AWE','NASARAWA'),('AWGU','ENUGU'),('AWKA NORTH','ANAMBRA'),('AWKA SOUTH','ANAMBRA'),('AYAMELUM','ANAMBRA'),('AYEDA ADE','OSUN'),('AYEDIRE','OSUN'),('BABURA','JIGAWA'),('BADAGARY','LAGOS'),('BAGUDO','KEBBI'),('BAGWAI','KANO'),('BAKASSI','CROSS RIVER'),('BAKORI','KATSINA'),('BAKURA','ZAMFARA'),('BALANGA','GOMBE'),('BALI','TARABA'),('BAMA','BORNO'),('BARIKIN LADI','PLATEAU'),('BARUTEN','KWARA'),('BASSA','KOGI'),('BASSA.','PLATEAU'),('BATAGRAWA','KATSINA'),('BATSARI','KATSINA'),('BAUCHI','BAUCHI'),('BAURE','KATSINA'),('BAYO','BORNO'),('BEBEJI','KANO'),('BEKWARA','CROSS RIVER'),('BENDE','ABIA'),('BIASE','CROSS RIVER'),('BICHI','KANO'),('BIDA','NIGER'),('BILLIRI','GOMBE'),('BINDAWA','KATSINA'),('BINJI','SOKOTO'),('BIRININ GWARI','KADUNA'),('BIRNIN KEBBI','KEBBI'),('BIRNIN-KUDU','JIGAWA'),('BIRNIN-MAGAJI','JIGAWA'),('BIRNIWA','JIGAWA'),('BIU','BORNO'),('BODINGA','SOKOTO'),('BOGORO','BAUCHI'),('BOKI','CROSS RIVER'),('BOKKOS','PLATEAU'),('BOLUWADURO','OSUN'),('BOMADI','DELTA'),('BONNY','RIVERS'),('BORGU','NIGER'),('BORIPE','OSUN'),('BORSARI','YOBE'),('BOSSO','NIGER'),('BRASS','BAYELSA'),('BUJI','JIGAWA'),('BUKKUYUM','ZAMFARA'),('BUNGUDU','ZAMFARA'),('BUNKURE','KANO'),('BUNZA','KEBBI'),('BURUKU','BENUE'),('BURUTU','DELTA'),('BWARI','ABUJA'),('CALABAR','CROSS RIVER'),('CALABAR SOUTH','CROSS RIVER'),('CHAFE','ZAMFARA'),('CHANCHANGA','NIGER'),('CHARANCHI','KATSINA'),('CHIBOK','BORNO'),('CHUKUN','KADUNA'),('DALA','KANO'),('DAMATURU','YOBE'),('DAMBAM','BAUCHI'),('DAMBATA','KANO'),('DAMBOA','BORNO'),('DAN MUSA','KATSINA'),('DANDI','KEBBI'),('DANDUME','KATSINA'),('DANGE/SHUNT','SOKOTO'),('DANJA','KATSINA'),('DANKO','KEBBI'),('DARAZO','BAUCHI'),('DASS','BAUCHI'),('DAURA','KATSINA'),('DAWAKIN TOFA','KANO'),('DAWAKIN-KUDU','KANO'),('DEGEMA','RIVERS'),('DEKINA','KOGI'),('DEMBAN','BAUCHI'),('DEMSA','ADAMAWA'),('DIKWA','BORNO'),('DOGUWA','KANO'),('DOMA','NASARAWA'),('DONGA','TARABA'),('DUKKU','GOMBE'),('DUNUKOFIA','ANAMBRA'),('DUTSE','JIGAWA'),('DUTSI','KATSINA'),('DUTSIN-MA','KATSINA'),('EAST YAGBA','KOGI'),('EASTERN OBOLO','AKWA IBOM'),('EBONYI','EBONYI'),('EDATI','NIGER'),('EDE','OSUN'),('EDE NORTH','OSUN'),('EDU','KWARA'),('EFFON-ALAIYE','EKITI'),('EGBADO NORTH','OGUN'),('EGBADO SOUTH','OGUN'),('EGBEDA','OYO'),('EGBEDORE','OSUN'),('EGOR','EDO'),('EHIME MBAISE','IMO'),('EJIGBO','OSUN'),('EKEREMOR','BAYELSA'),('EKET','AKWA IBOM'),('EKITI','KWARA'),('EKITI EAST','EKITI'),('EKITI SOUTH-WEST','EKITI'),('EKITI WEST','EKITI'),('EKWUSIGO','ANAMBRA'),('ELEME','RIVERS'),('EMOHUA','RIVERS'),('EMURE/ISE/ORUN','EKITI'),('ENUGU EAST','ENUGU'),('ENUGU NORTH','ENUGU'),('ENUGU SOUTH','ENUGU'),('EPE','LAGOS'),('EPE-ATAI','AKWA IBOM'),('ESAN CENTRAL','EDO'),('ESAN NORTH-EAST','EDO'),('ESAN SOUTH-EAST','EDO'),('ESAN WEST','EDO'),('ESE-ODO','ONDO'),('ESSIEN-UDIM','AKWA IBOM'),('ETCHE','RIVERS'),('ETHIOPE EAST','DELTA'),('ETHIOPE WEST','DELTA'),('ETI-OSA','LAGOS'),('ETIM-EKPO','AKWA IBOM'),('ETINAM','AKWA IBOM'),('ETSAKO CENTRAL','EDO'),('ETSAKO EAST','EDO'),('ETSAKO WEST','EDO'),('ETUNG','CROSS RIVER'),('EWEKORO','OGUN'),('EZEAGU','ENUGU'),('EZINIHITE','IMO'),('EZZA NORTH','EBONYI'),('EZZA SOUTH','EBONYI'),('FAGGE','KANO'),('FAKAI','KEBBI'),('FASKARI','KATSINA'),('FIKA','YOBE'),('FUFORE','ADAMAWA'),('FUFU','KWARA'),('FUNAKAYE','GOMBE'),('FUNE','YOBE'),('FUNTUA','KATSINA'),('GABASAWA','KANO'),('GADA','SOKOTO'),('GAGARAWA','JIGAWA'),('GAMAWA','BAUCHI'),('GANJUWA','BAUCHI'),('GANYE','ADAMAWA'),('GARKI','JIGAWA'),('GARKO','KANO'),('GARUN MALLAM','KANO'),('GASHAKA','TARABA'),('GASSOL','TARABA'),('GAYA','KANO'),('GBAKO','NIGER'),('GBOKO','BENUE'),('GEIDAM','YOBE'),('GEZAWA','KANO'),('GIADE','BAUCHI'),('GIREI','ADAMAWA'),('GIWA','KADUNA'),('GOGARAM','YOBE'),('GOKANA','RIVERS'),('GOMBE','GOMBE'),('GOMBI','ADAMAWA'),('GORONYO','SOKOTO'),('GUBIO','BORNO'),('GUDU','SOKOTO'),('GUJBA','YOBE'),('GULANI','YOBE'),('GUMA','BENUE'),('GUMEL','JIGAWA'),('GUMMI','ZAMFARA'),('GURARA','NIGER'),('GURI','JIGAWA'),('GUSAU','ZAMFARA'),('GUYUK','ADAMAWA'),('GUZAMALO','BORNO'),('GWADA-BAWA','SOKOTO'),('GWAGWALADA','ABUJA'),('GWALE','KANO'),('GWANDU','KEBBI'),('GWARAM','JIGAWA'),('GWARZO','KANO'),('GWER EAST','BENUE'),('GWIWA','JIGAWA'),('GWOZA','BORNO'),('HADEJIA','JIGAWA'),('HAWUL','BORNO'),('HONG','ADAMAWA'),('I/OLORUNSONGO','OYO'),('IBADAN CENTRAL','OYO'),('IBADAN NORTH-EAST','OYO'),('IBADAN NORTH-WEST','OYO'),('IBADAN SOUTH-EAST','OYO'),('IBADAN SOUTH-WEST','OYO'),('IBAJI','KOGI'),('IBARAPA','OYO'),('IBARAPA NORTH','OYO'),('IBEJU LEKKI','LAGOS'),('IBENO','AKWA IBOM'),('IBESIKPO-ASUAN','AKWA IBOM'),('IBI','TARABA'),('IBIONO-IBOM','AKWA IBOM'),('IDAH','KOGI'),('IDANRE','ONDO'),('IDARAPO','OGUN'),('IDEATO NORTH','IMO'),('IDEATO SOUTH','IMO'),('IDEMILI','ANAMBRA'),('IDEMILI SOUTH','ANAMBRA'),('IDO','OYO'),('IDO/OSI','EKITI'),('IFAKO/IJAYE','LAGOS'),('IFE CENTRAL','OSUN'),('IFE EAST','OSUN'),('IFE NORTH','OSUN'),('IFE SOUTH','OSUN'),('IFEDAPO','OYO'),('IFEDAYO','OSUN'),('IFEDORE','ONDO'),('IFELODUN','KWARA'),('IFELODUN (OSUN)','OSUN'),('IFELOJU','OYO'),('IFO','OGUN'),('IGABI','KADUNA'),('IGALAMELA','KOGI'),('IGBEBEN','EDO'),('IGBO-ETITI','ENUGU'),('IGBO-EZE NORTH','ENUGU'),('IGBO-EZE SOUTH','ENUGU'),('IHIALA','ANAMBRA'),('IHITTE UBOMA','IMO'),('IJEBU EAST','OGUN'),('IJEBU NORTH','OGUN'),('IJEBU-ODE','OGUN'),('IJERO','EKITI'),('IJUMU','KOGI'),('IKA','AKWA IBOM'),('IKA NORTH-EAST','DELTA'),('IKA SOUTH','DELTA'),('IKARA','KADUNA'),('IKEDURU','IMO'),('IKEJA','LAGOS'),('IKENNE','OGUN'),('IKERE','EKITI'),('IKOLE','EKITI'),('IKOM','CROSS RIVER'),('IKONO','AKWA IBOM'),('IKORODU','LAGOS'),('IKOT-ABASI','AKWA IBOM'),('IKOT-EKPENE','AKWA IBOM'),('IKPOBA CENTRAL','EDO'),('IKPOBA OKHA','EDO'),('IKWERE','RIVERS'),('IKWO','EBONYI'),('IKWUANO','ABIA'),('ILA-ORANGUN','OSUN'),('ILAJE','ONDO'),('ILE OLUJI/OKE-IGBO','ONDO'),('ILEJEMEJE','EKITI'),('ILESHA EAST','OSUN'),('ILESHA WEST','OSUN'),('ILIELA','SOKOTO'),('ILORIN EAST','KWARA'),('ILORIN SOUTH','KWARA'),('ILORIN WEST','KWARA'),('ILUGUNALARO','OGUN'),('IMEKO- AFON','OGUN'),('INGAWA','KATSINA'),('INI','AKWA IBOM'),('IPOKIA','OGUN'),('IRELE','ONDO'),('IREPO','OYO'),('IREPODUN','KWARA'),('IREPODUN (EKITI)','EKITI'),('IREPODUN (OSUN)','OSUN'),('IREWOLE','OSUN'),('ISA','SOKOTO'),('ISE/ORUN','EKITI'),('ISEYIN','OYO'),('ISHIELU','EBONYI'),('ISI-UZO','ENUGU'),('ISIALA','IMO'),('ISIALA-NGWA NORTH','ABIA'),('ISIALA-NGWA SOUTH','ABIA'),('ISIUKWUTO','ABIA'),('ISOKAN','OSUN'),('ISOKO NORTH','DELTA'),('ISOKO SOUTH','DELTA'),('ISU','IMO'),('ITAS-GADAU','BAUCHI'),('ITESIWAJU','OYO'),('ITU','AKWA IBOM'),('IVO','EBONYI'),('IWAJOWA','OYO'),('IWO','OSUN'),('IZZI','EBONYI'),('JABA','KADUNA'),('JADA','ADAMAWA'),('JAHUN','JIGAWA'),('JAKUSKO','YOBE'),('JALINGO','TARABA'),('JAMA\'ARE','BAUCHI'),('JEGA','KEBBI'),('JEMA\'A','KADUNA'),('JERE','BORNO'),('JIBYA','KATSINA'),('JIMETA','ADAMAWA'),('JOS EAST','PLATEAU'),('JOS NORTH','PLATEAU'),('JOS SOUTH','PLATEAU'),('K/LAMIDO','TARABA'),('KABBA/BUNU','KOGI'),('KABO','KANO'),('KACHIA','KADUNA'),('KADUNA NORTH','KADUNA'),('KADUNA SOUTH','KADUNA'),('KAFIN-HAUSA','JIGAWA'),('KAFUR','KATSINA'),('KAGA','BORNO'),('KAGARKO','KADUNA'),('KAIAMA','KWARA'),('KAITA','KATSINA'),('KAJOLA','OYO'),('KAJURU','KADUNA'),('KALA/BALGE','BORNO'),('KALGO','KEBBI'),('KALTUNGO','GOMBE'),('KAMBA','KEBBI'),('KANAM','PLATEAU'),('KANKARA','KATSINA'),('KANKE','PLATEAU'),('KANKIYA','KATSINA'),('KANO','KANO'),('KARASUWA','YOBE'),('KARAYE','KANO'),('KARU','NASARAWA'),('KATAGUM','BAUCHI'),('KATCHIA','NIGER'),('KATSINA','KATSINA'),('KATSINA-ALA','BENUE'),('KAUGAMA','JIGAWA'),('KAURA','KADUNA'),('KAURA NAMODA','ZAMFARA'),('KAURU','KADUNA'),('KAZAURE','JIGAWA'),('KEANA','NASARAWA'),('KEBBE','SOKOTO'),('KEFFI','NASARAWA'),('KHANA','RIVERS'),('KIBIYA','KANO'),('KIRFI','BAUCHI'),('KIRIKISAMA','JIGAWA'),('KIRU','KANO'),('KIYAWA','JIGAWA'),('KIYAWA (ZAMFARA)','ZAMFARA'),('KOGI','KOGI'),('KOKO-BESSE','KEBBI'),('KOKONA','NASARAWA'),('KOLOKUMA/OPOKUN','BAYELSA'),('KONDUGA','BORNO'),('KONSHISHA-TSE','BENUE'),('KOSOFE','LAGOS'),('KOTANGORA','NIGER'),('KOTON-KARFE','KOGI'),('KUBA','KADUNA'),('KUDAN','KADUNA'),('KUJE','ABUJA'),('KUKAWA','BORNO'),('KUMBOTSO','KANO'),('KUNCHI','KANO'),('KURA','KANO'),('KURFI','KATSINA'),('KURMI','TARABA'),('KUSADA','KATSINA'),('KWALI','ABUJA'),('KWAMI','GOMBE'),('KWANDE','BENUE'),('KWARE','SOKOTO'),('KWAYA-KUSAR','BORNO'),('LAFIA','NASARAWA'),('LAGELU','OYO'),('LAGOS ISLAND','LAGOS'),('LAMURIDE','ADAMAWA'),('LANTANG NORTH','PLATEAU'),('LANTANG SOUTH','PLATEAU'),('LAPAI','NIGER'),('LAU','TARABA'),('LAVUN','NIGER'),('LERE','KADUNA'),('LESSEL','BENUE'),('LISSAM','TARABA'),('LOGO','BENUE'),('LOKOJA','KOGI'),('MACHINA','YOBE'),('MADAGA','ADAMAWA'),('MAFA','BORNO'),('MAGAMA','NIGER'),('MAGUMERI','BORNO'),('MAI ADUWA','KATSINA'),('MAIDOBI','KANO'),('MAIDUGURI','BORNO'),('MAIGATARI','JIGAWA'),('MAIHA','ADAMAWA'),('MAIN LAND','LAGOS'),('MAIYAMA','KEBBI'),('MAKARFI','KADUNA'),('MAKODA','KANO'),('MAKURDI','BENUE'),('MALAMA DURI','JIGAWA'),('MALUMFASHI','KATSINA'),('MANGERE','YOBE'),('MANGU','PLATEAU'),('MANI','KATSINA'),('MARADUN','ZAMFARA'),('MARIGA','NIGER'),('MARTE','BORNO'),('MARU','ZAMFARA'),('MASHI','KATSINA'),('MATAZU','KATSINA'),('MAYO-BALE','ADAMAWA'),('MBAITOLU','IMO'),('MBO','AKWA IBOM'),('MGBBAR','BORNO'),('MICHIKA','ADAMAWA'),('MIGA','JIGAWA'),('MIKANG','PLATEAU'),('MINJIBIR','KANO'),('MISAU','BAUCHI'),('MKPAT-ENIN','AKWA IBOM'),('MOBA','EKITI'),('MOKWA','NIGER'),('MONGUNO','BORNO'),('MOPA-MURO','KOGI'),('MORO','KWARA'),('MOSHEGU','NIGER'),('MUBI','ADAMAWA'),('MUBI SOUTH','ADAMAWA'),('MUSAWA','KATSINA'),('MUSHIN','LAGOS'),('MUYA','NIGER'),('NAFADA','GOMBE'),('NARAWA','KANO'),('NASARAWA','NASARAWA'),('NASS/EGGON','NASARAWA'),('NASSARAWA','KANO'),('NDOKWA EAST','DELTA'),('NDOKWA WEST','DELTA'),('NEMBE','BAYELSA'),('NGALA','BORNO'),('NGANZAI','BORNO'),('NGASKI','KEBBI'),('NGOR OKPALA','IMO'),('NGURU','YOBE'),('NINGI','BAUCHI'),('NJABA','IMO'),('NJIKOKA','ANAMBRA'),('NKANU EAST','ENUGU'),('NKANU WEST','ENUGU'),('NKWERE','IMO'),('NNEWI NORTH','ANAMBRA'),('NNEWI SOUTH','ANAMBRA'),('NOMBA','BORNO'),('NORTHERN IJAW','BAYELSA'),('NSIT-IBOM','AKWA IBOM'),('NSIT-UBUM','AKWA IBOM'),('NSUKKA','ENUGU'),('NUMAN','ADAMAWA'),('NWANGELE','IMO'),('OBAFEMI OWODE','OGUN'),('OBANUKU','CROSS RIVER'),('OBEDA','OGUN'),('OBI','BENUE'),('OBI.','NASARAWA'),('OBIO AKPOR','RIVERS'),('OBIOMA-NGWA','ABIA'),('OBOKUN','OSUN'),('OBOT AKARA','AKWA IBOM'),('OBOWO','IMO'),('OBUBRA','CROSS RIVER'),('OBUDU','CROSS RIVER'),('ODIGBO','ONDO'),('ODO-OTIN','OSUN'),('ODOGBOLU','OGUN'),('ODUKPANI','CROSS RIVER'),('OFFA','KWARA'),('OFU','KOGI'),('OGBA/NDONI/EGBEMA','RIVERS'),('OGBADIBO','BENUE'),('OGBARU','ANAMBRA'),('OGBIA','BAYELSA'),('OGBOMOSHO NORTH','OYO'),('OGBOMOSHO SOUTH','OYO'),('OGO-OLUWA','OYO'),('OGOJA','CROSS RIVER'),('OGORI-MAGONGO','KOGI'),('OGU/BOLO','RIVERS'),('OGUN WATER SIDE','OGUN'),('OGUTA','IMO'),('OHAFIA','ABIA'),('OHAJI EGBEMA','IMO'),('OHAOZARA','EBONYI'),('OHAUKWU','EBONYI'),('OHIMINI','BENUE'),('OJI RIVER','ENUGU'),('OJO','LAGOS'),('OJU','BENUE'),('OKE-ERO','KWARA'),('OKEHI','KOGI'),('OKENE','KOGI'),('OKIGWE','IMO'),('OKIRIKA','RIVERS'),('OKITIPUPA','ONDO'),('OKOBO','AKWA IBOM'),('OKPE','DELTA'),('OKPOKWU','BENUE'),('OLA OLUWA','OSUN'),('OLAMABORO','KOGI'),('OLARUNDA','OSUN'),('OLGA','RIVERS'),('OLUYOLE','OYO'),('OMALA','KOGI'),('OMUMA','RIVERS'),('ONA-ARA','OYO'),('ONDO','ONDO'),('ONDO EAST','ONDO'),('ONELGA','RIVERS'),('ONICHA','EBONYI'),('ONITSHA NORTH','ANAMBRA'),('ONITSHA SOUTH','ANAMBRA'),('ONNA','AKWA IBOM'),('ONUIMO','IMO'),('OPOBO/NKORO','RIVERS'),('ORE-LOPE','OYO'),('OREDO','EDO'),('ORHONMWON','EDO'),('ORIADE','OSUN'),('ORIKANAM','AKWA IBOM'),('ORIRE','OYO'),('ORLU','IMO'),('OROLU','OSUN'),('ORON','AKWA IBOM'),('ORS/OSU','IMO'),('ORU','IMO'),('ORU WEST','IMO'),('ORUMBA NORTH','ANAMBRA'),('ORUMBA SOUTH','ANAMBRA'),('OSHIMILI','DELTA'),('OSHIMILI NORTH','DELTA'),('OSHODI-ISOLO','LAGOS'),('OSHOGBO','OSUN'),('OSIN','KWARA'),('OSISIOMA','ABIA'),('OTURKPO','BENUE'),('OVIA NORTH-EAST','EDO'),('OVIA SOUTH-WEST','EDO'),('OWAN EAST','EDO'),('OWAN WEST','EDO'),('OWERRI','IMO'),('OWERRI EAST','IMO'),('OWERRI NORTH','IMO'),('OWO','ONDO'),('OYE (EKITI)','EKITI'),('OYE (ONDO)','ONDO'),('OYI (ANAMBRA)','ANAMBRA'),('OYI (KOGI)','KOGI'),('OYIGBO','RIVERS'),('OYO','OYO'),('OYO WEST','OYO'),('OYUN','KWARA'),('PAIKORO','NIGER'),('PANKSHIN','PLATEAU'),('PATANI','DELTA'),('PATIGI','KWARA'),('PORT HARCOURT','RIVERS'),('POTISKUM','YOBE'),('QUANPANG','PLATEAU'),('RABAH','SOKOTO'),('RAFI','NIGER'),('RANO','KANO'),('RIJAU','NIGER'),('RIMI','KATSINA'),('RIMIN GADO','KANO'),('RINGIM','JIGAWA'),('RIYOM','PLATEAU'),('ROGO','KANO'),('RONI','JIGAWA'),('SABON GARI','KADUNA'),('SABON-BIRNI','SOKOTO'),('SABUWA','KATSINA'),('SAFANA','KATSINA'),('SAGAMU','OGUN'),('SAGBAMA','BAYELSA'),('SAKABA','KEBBI'),('SAKI EAST','OYO'),('SANDAMU','KATSINA'),('SANGA','KADUNA'),('SAPELE','DELTA'),('SARDAUNA','TARABA'),('SHAGARI','SOKOTO'),('SHANGA','KEBBI'),('SHANI','BORNO'),('SHANONO','KANO'),('SHELLENG','ADAMAWA'),('SHENDOM','PLATEAU'),('SHINKAFI','ZAMFARA'),('SHIRA','BAUCHI'),('SHIRORO','NIGER'),('SHOMGOM','GOMBE'),('SHOMOLU','LAGOS'),('SILAME','SOKOTO'),('SOBA','KADUNA'),('SOKOTO','SOKOTO'),('SOKOTO SOUTH','SOKOTO'),('SONG','ADAMAWA'),('SOUTHERN IJAW','BAYELSA'),('SULE TANKARKAR','JIGAWA'),('SULEJA','NIGER'),('SUMAILA','KANO'),('SURU','KEBBI'),('SURULERE','LAGOS'),('SURULERE (OYO)','OYO'),('TAFAWA BALEWA','BAUCHI'),('TAI/ELEME','RIVERS'),('TAKAI','KANO'),('TAKUM','TARABA'),('TALATAMAFARA','ZAMFARA'),('TAMBUWAL','SOKOTO'),('TANGAZA','SOKOTO'),('TARAUNI','KANO'),('TARKA','BENUE'),('TAURA','JIGAWA'),('TAWA','NIGER'),('TOFA','KANO'),('TORO','BAUCHI'),('TOTO','NASARAWA'),('TOUNGO','ADAMAWA'),('TSANYAWA','KANO'),('TUDUN WADA','KANO'),('TURETA','SOKOTO'),('UDENU','ENUGU'),('UDI','ENUGU'),('UDU','DELTA'),('UDUNGU UKO','AKWA IBOM'),('UGEP NORTH','CROSS RIVER'),('UGHELLI NORTH','DELTA'),('UGHELLI SOUTH','DELTA'),('UGUO IBENG','AKWA IBOM'),('UGWUNAGBO','ABIA'),('UHUNWONDE','EDO'),('UKANAFUN','AKWA IBOM'),('UKUM','BENUE'),('UKWA EAST','ABIA'),('UKWA WEST','ABIA'),('UKWUANI','DELTA'),('UMUAHIA NORTH','ABIA'),('UMUAHIA SOUTH','ABIA'),('UMUNEOCHI','ABIA'),('UNGOGO','KANO'),('URUAN','AKWA IBOM'),('URUE Q/ORUKO','AKWA IBOM'),('USHONGO','BENUE'),('USSA','TARABA'),('UVIWE','DELTA'),('UYO','AKWA IBOM'),('UZO UWANI','ENUGU'),('VANDEIKYA','BENUE'),('WAKIRIKE','RIVERS'),('WAMAKKO','SOKOTO'),('WAMBA','NASARAWA'),('WARJI','BAUCHI'),('WARRI CENTRAL','DELTA'),('WARRI NORTH','DELTA'),('WARRI SOUTH','DELTA'),('WASE','PLATEAU'),('WASUGU','KEBBI'),('WEST YAGBA','KOGI'),('WUDIL','KANO'),('WUKARI','TARABA'),('WURNO','SOKOTO'),('WUSHISHI','NIGER'),('YABO','SOKOTO'),('YALA','CROSS RIVER'),('YAMAL TUDEBA','GOMBE'),('YANKWASI','JIGAWA'),('YARKURR','CROSS RIVER'),('YARRO','TARABA'),('YAURI','KEBBI'),('YENOGOA','BAYELSA'),('YOLA','ADAMAWA'),('YUNUSARI','YOBE'),('YUSUFARI','YOBE'),('ZAKI','BAUCHI'),('ZANGO','KATSINA'),('ZANGON KATAF','KADUNA'),('ZARIA','KADUNA'),('ZING','TARABA'),('ZURMI','ZAMFARA'),('ZURU','KEBBI');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salutation` varchar(20) DEFAULT NULL,
  `fName` varchar(30) DEFAULT NULL,
  `mName` varchar(30) DEFAULT NULL,
  `lName` varchar(30) DEFAULT NULL,
  `dName` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role_group_id` int(11) DEFAULT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(11) DEFAULT NULL,
  `userlevel` int(11) NOT NULL COMMENT '0=admin;1=customer;2=vendor;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`salutation`,`fName`,`mName`,`lName`,`dName`,`email`,`username`,`password`,`role_group_id`,`createdDate`,`createdBy`,`userlevel`) values (1,'Mr','Jonathan','E','ATAISI','Jonathan Ataisi',NULL,'admin','208512264222772174181102151942',1,'2018-04-29 01:33:04',NULL,0),(2,'Mr','Delight',NULL,'Aron',NULL,NULL,'customer','208512264222772174181102151942',1,'2018-04-29 12:02:48',NULL,1),(3,NULL,NULL,NULL,NULL,NULL,NULL,'vendor','208512264222772174181102151942',NULL,'2018-04-25 13:15:04',NULL,2),(4,NULL,NULL,NULL,NULL,NULL,'admin2@ty.com','jonathan','admin3',NULL,'2018-05-01 17:00:01','admin',1),(5,NULL,NULL,NULL,NULL,NULL,'','','',NULL,'2018-05-01 22:55:25','admin',0),(6,NULL,NULL,NULL,NULL,NULL,'admin@savease.ng','jon','682481201752296225210218310311',NULL,'2018-05-02 00:28:05','admin',0);

/*Table structure for table `vendor` */

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `vendor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `registration_number` varchar(10) DEFAULT NULL,
  `vendors_name` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `contact_email` varchar(50) DEFAULT NULL,
  `location` varchar(70) DEFAULT NULL,
  `tin` varchar(30) DEFAULT NULL,
  `districtID` int(11) DEFAULT NULL,
  `website` varchar(105) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '0=uploaded, 1=just inputed, 2=approved,3=rejected,4=deleted',
  `state` varchar(50) DEFAULT NULL,
  `lga` varchar(50) DEFAULT NULL,
  `address` text,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`vendor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=latin1;

/*Data for the table `vendor` */

insert  into `vendor`(`vendor_ID`,`registration_number`,`vendors_name`,`contact_phone`,`contact_email`,`location`,`tin`,`districtID`,`website`,`status`,`state`,`lga`,`address`,`createdDate`,`createdby`) values (288,'tes145','Construction Kaiser','84236161','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','OBIAKPO ','52, Emekuku Street, D Line, Port Harcourt','2017-10-01 08:53:40',NULL),(289,'tes146','SAIPEM CONTRACTING/DRILLING','84234786','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','OBIAKPO ','Rumuolumeni- PMB 6145- PH','2017-10-01 08:53:40',NULL),(290,'tes147','Lubrik Construction Company Limited','8036777777','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','OBIAKPO ',' Plot 75B, Ordinance Road, Trans-Amadi Ind. Layout PH','2017-10-01 08:53:40',NULL),(291,'tes148','Andremovich Logistics','8037825582','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','OBIAKPO ','25, Chinda Street Off Stadium Road, G.R.A Extension 4 PH','2017-10-01 08:53:41',NULL),(292,'tes149','Daiik Engineering Limited','8034933088','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','PORT HARCOURT','Km 14, Phc-Aba Expressway, Rumoukwurusi PH','2017-10-01 08:53:41',NULL),(293,'tes150','ALCON NIG.LTD.','8033403556','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','PORT HARCOURT','17 Trans-Amadi Ind. Layout PH','2017-10-01 08:53:41',NULL),(294,'tes151','Petro Base Group','84797749','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','PORT HARCOURT','Km 17, PH/Aba Expressway, Port Harcourt','2017-10-01 08:53:41',NULL),(295,'tes152','Arrow Construction Company Limited ','8037111737','arrow@arrow.com',NULL,'',NULL,'',2,'ABIA','ABA NORTH','25A, Trans Amadi Road, Port Harcourt,','2017-10-01 08:53:41',NULL),(296,'tes153','Direction J.P Nigeria Limited ','8182449043','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','PORT HARCOURT','51, Elele Awoda Road, Port Harcourt,','2017-10-01 08:53:41',NULL),(297,'tes154','DEUTAG DRILLING NIG. LTD.','84237117','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','PORT HARCOURT','KM 16 PH Expressway.','2017-10-01 08:53:41',NULL),(298,'tes155','Bery Link Integrated Services Limited','7034111903','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','PORT HARCOURT','Plot 270, Trans Amadi, Port Harcourt, Rivers','2017-10-01 08:53:41',NULL),(299,'tes156','GLOBAL OFFSHORE DRILLING NIG. LTD','84231356','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','ELEME','KM 14 PH/Aba expressway, Eleme Junction','2017-10-01 08:53:41',NULL),(301,'tes158','NEST OIL LTD','84896777','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','ELEME','11 Onne Road, GRA 2','2017-10-01 08:53:41',NULL),(302,'tes159','NOBLE DRILLING NIG. LTD','84612378','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','ELEME','KM 14 PH/Aba expressway, PMB 5218 River State','2017-10-01 08:53:41',NULL),(303,'tes160','RIQUEST OIL AND GAS','8033032963','NIL',NULL,'54254',NULL,'',2,'ABIA','ABA NORTH','110 Estate Road Woji, PH','2017-10-01 08:53:41',NULL),(304,'tes161','ALTRANS NIG.LTD','1333267','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','AHODA','Plot 474 Transamadi Ind. Layout PH','2017-10-01 08:53:42',NULL),(305,'tes162','BELL OIL AND GAS','84462873','NIL',NULL,NULL,NULL,NULL,1,'RIVERS','AHODA','Plot 96, Rumuogba behind Shell Recruitment Center PH','2017-10-01 08:53:42',NULL),(306,'tes163','OILTECH ENGR SERVICES LIMITED','8033102780','jonathan.ataisi@gmail.com',NULL,'012545',NULL,'riwama.com',0,'ABIA','ABA NORTH','Plot 155, Trans-Amadi Industrial Layout PH.','2017-10-01 08:53:42',NULL),(309,'tes166','ROMOKO OIL AND GAS LTD','7065313226','NIL',NULL,NULL,NULL,NULL,0,'RIVERS','ETCHE','56/58 Cement Street, off Govt Road, PH','2017-10-01 08:53:42',NULL),(310,'tes167','ETERNA OIL AND GAS PLC','8028573832','NIL',NULL,NULL,NULL,NULL,0,'RIVERS','ETCHE','Plot 184A, Trans-Amadi industrial Layout, PH','2017-10-01 08:53:42',NULL),(311,'tes168','BENJONAH INTERNATIONAL NIGERIA','8060748889','NIL',NULL,NULL,NULL,NULL,0,'RIVERS','ETCHE','57, Emekuku Strt, D Line, PH','2017-10-01 08:53:42',NULL),(312,'tes169','HARCOTEX ENTERPRISES','8033129003','NIL',NULL,NULL,NULL,NULL,0,'RIVERS','ETCHE','6, Chukwudike Street, Rumigbo PH','2017-10-01 08:53:42',NULL),(314,'tes171','Bay Wood Continental Limited','84785612','NIL',NULL,NULL,NULL,NULL,0,'RIVERS','ETCHE',' Km 5, East-West Road, Port Harcourt','2017-10-01 08:53:42',NULL),(316,'rc123','RIWAMA','001246233','riwama@riwama.com',NULL,'5542',NULL,'riwama.com',1,'RIVERS','PORT HARCOURT','ikwere toad','2017-10-10 05:07:18',NULL),(317,NULL,'Bestman',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-10-22 09:26:01',NULL),(318,'','Amaka and  sons','08035529398','amaka@yahoo.com',NULL,'',NULL,'',2,'RIVERS','IKWERE','11A stadium road ','2017-10-30 16:51:19',NULL),(319,'1245623','Chrisgeo Electricals','08035529398','chrisgeoelectricals@yahoo.com',NULL,'5463',NULL,'',2,'ABIA','ABA NORTH','53b Okija market D-Line','2017-11-14 05:08:23',NULL);

/*Table structure for table `vendorops` */

DROP TABLE IF EXISTS `vendorops`;

CREATE TABLE `vendorops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(50) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `contact_email` varchar(50) DEFAULT NULL,
  `location` varchar(70) DEFAULT NULL,
  `registration_number` varchar(10) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '0=uploaded, 1=just inputed, 2=approved,3=rejected,4=deleted',
  `state` varchar(50) DEFAULT NULL,
  `lga` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` text,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=latin1;

/*Data for the table `vendorops` */

insert  into `vendorops`(`id`,`contact_name`,`contact_phone`,`contact_email`,`location`,`registration_number`,`status`,`state`,`lga`,`city`,`address`,`createdDate`,`createdby`) values (288,NULL,'84236161','NIL',NULL,'tes145',1,'RIVERS','OBIAKPO ',NULL,'52, Emekuku Street, D Line, Port Harcourt','2017-10-01 08:53:40',NULL),(289,NULL,'84234786','NIL',NULL,'tes146',1,'RIVERS','OBIAKPO ',NULL,'Rumuolumeni- PMB 6145- PH','2017-10-01 08:53:40',NULL),(290,NULL,'8036777777','NIL',NULL,'tes147',1,'RIVERS','OBIAKPO ',NULL,' Plot 75B, Ordinance Road, Trans-Amadi Ind. Layout PH','2017-10-01 08:53:40',NULL),(291,NULL,'8037825582','NIL',NULL,'tes148',1,'RIVERS','OBIAKPO ',NULL,'25, Chinda Street Off Stadium Road, G.R.A Extension 4 PH','2017-10-01 08:53:41',NULL),(292,NULL,'8034933088','NIL',NULL,'tes149',1,'RIVERS','PORT HARCOURT',NULL,'Km 14, Phc-Aba Expressway, Rumoukwurusi PH','2017-10-01 08:53:41',NULL),(293,NULL,'8033403556','NIL',NULL,'tes150',1,'RIVERS','PORT HARCOURT',NULL,'17 Trans-Amadi Ind. Layout PH','2017-10-01 08:53:41',NULL),(294,NULL,'84797749','NIL',NULL,'tes151',1,'RIVERS','PORT HARCOURT',NULL,'Km 17, PH/Aba Expressway, Port Harcourt','2017-10-01 08:53:41',NULL),(295,'','8037111737','arrow@arrow.com',NULL,'tes152',2,'ABIA','ABA NORTH',NULL,'25A, Trans Amadi Road, Port Harcourt,','2017-10-01 08:53:41',NULL),(296,NULL,'8182449043','NIL',NULL,'tes153',1,'RIVERS','PORT HARCOURT',NULL,'51, Elele Awoda Road, Port Harcourt,','2017-10-01 08:53:41',NULL),(297,NULL,'84237117','NIL',NULL,'tes154',1,'RIVERS','PORT HARCOURT',NULL,'KM 16 PH Expressway.','2017-10-01 08:53:41',NULL),(298,NULL,'7034111903','NIL',NULL,'tes155',1,'RIVERS','PORT HARCOURT',NULL,'Plot 270, Trans Amadi, Port Harcourt, Rivers','2017-10-01 08:53:41',NULL),(299,NULL,'84231356','NIL',NULL,'tes156',1,'RIVERS','ELEME',NULL,'KM 14 PH/Aba expressway, Eleme Junction','2017-10-01 08:53:41',NULL),(301,NULL,'84896777','NIL',NULL,'tes158',1,'RIVERS','ELEME',NULL,'11 Onne Road, GRA 2','2017-10-01 08:53:41',NULL),(302,NULL,'84612378','NIL',NULL,'tes159',1,'RIVERS','ELEME',NULL,'KM 14 PH/Aba expressway, PMB 5218 River State','2017-10-01 08:53:41',NULL),(303,'jason','8033032963','NIL',NULL,'tes160',2,'ABIA','ABA NORTH',NULL,'110 Estate Road Woji, PH','2017-10-01 08:53:41',NULL),(304,NULL,'1333267','NIL',NULL,'tes161',1,'RIVERS','AHODA',NULL,'Plot 474 Transamadi Ind. Layout PH','2017-10-01 08:53:42',NULL),(305,NULL,'84462873','NIL',NULL,'tes162',1,'RIVERS','AHODA',NULL,'Plot 96, Rumuogba behind Shell Recruitment Center PH','2017-10-01 08:53:42',NULL),(306,'Chidi amaka','8033102780','jonathan.ataisi@gmail.com',NULL,'tes163',0,'ABIA','ABA NORTH',NULL,'Plot 155, Trans-Amadi Industrial Layout PH.','2017-10-01 08:53:42',NULL),(309,NULL,'7065313226','NIL',NULL,'tes166',0,'RIVERS','ETCHE',NULL,'56/58 Cement Street, off Govt Road, PH','2017-10-01 08:53:42',NULL),(310,NULL,'8028573832','NIL',NULL,'tes167',0,'RIVERS','ETCHE',NULL,'Plot 184A, Trans-Amadi industrial Layout, PH','2017-10-01 08:53:42',NULL),(311,NULL,'8060748889','NIL',NULL,'tes168',0,'RIVERS','ETCHE',NULL,'57, Emekuku Strt, D Line, PH','2017-10-01 08:53:42',NULL),(312,NULL,'8033129003','NIL',NULL,'tes169',0,'RIVERS','ETCHE',NULL,'6, Chukwudike Street, Rumigbo PH','2017-10-01 08:53:42',NULL),(314,NULL,'84785612','NIL',NULL,'tes171',0,'RIVERS','ETCHE',NULL,' Km 5, East-West Road, Port Harcourt','2017-10-01 08:53:42',NULL),(316,'Daniel','001246233','riwama@riwama.com',NULL,'rc123',1,'RIVERS','PORT HARCOURT',NULL,'ikwere toad','2017-10-10 05:07:18',NULL),(317,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-10-22 09:26:01',NULL),(318,'Ama','08035529398','amaka@yahoo.com',NULL,'',2,'RIVERS','IKWERE','PortHarcout','11A stadium road ','2017-10-30 16:51:19',NULL),(319,'','08035529398','chrisgeoelectricals@yahoo.com',NULL,'1245623',2,'ABIA','ABA NORTH','phc','53b Okija market D-Line','2017-11-14 05:08:23',NULL);

/* Trigger structure for table `vendorops` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `corporate_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `corporate_insert` BEFORE INSERT ON `vendorops` FOR EACH ROW   INSERT INTO nsss (nsssID, OWNER)
  VALUES (NEW.nsssID, NEW.organisation_name) */$$


DELIMITER ;

/* Procedure structure for procedure `accessControl` */

/*!50003 DROP PROCEDURE IF EXISTS  `accessControl` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `accessControl`(IN in_uname varchar(11))
BEGIN
   SELECT userlevel AS accessControl, fName,lName FROM users where  username= in_uname;
END */$$
DELIMITER ;

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

/* Procedure structure for procedure `getAllUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `getAllUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUser`()
BEGIN
   SELECT * FROM users;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getLeftNavigation` */

/*!50003 DROP PROCEDURE IF EXISTS  `getLeftNavigation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getLeftNavigation`(IN in_accessControl INT (11))
BEGIN
 SELECT *  FROM leftNavigation WHERE accessControl=in_accessControl;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getMenuDetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `getMenuDetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getMenuDetails`(IN in_parentid VARCHAR(11))
BEGIN
   SELECT *  FROM savease_web_menu WHERE parentid=in_parentid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getMenuGroup` */

/*!50003 DROP PROCEDURE IF EXISTS  `getMenuGroup` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getMenuGroup`()
BEGIN
   SELECT *  FROM savease_web_menu WHERE parentid='-1'  order by MENUID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `gettuser` */

/*!50003 DROP PROCEDURE IF EXISTS  `gettuser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `gettuser`(IN in_uname varchar(11))
BEGIN
   SELECT * FROM users where  username= in_uname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertDistrict` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertDistrict` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDistrict`(
IN in_location INT(11),
IN in_DistrictName varchar(50)
)
BEGIN
    insert into District(location,DistrictName) 
    values (in_location ,in_DistrictName);
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser`(
IN in_username varchar(11),
IN in_password varchar(30),
IN in_email varchar(50),
in in_createdBy varchar(11),
in in_userlvl int
)
BEGIN
    insert into users(username,PASSWORD,email,CreatedBy,userlevel) 
    values (in_username ,in_password,in_email,in_createdBy,in_userlvl);
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
