-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.51-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema m2salesforce
--

CREATE DATABASE IF NOT EXISTS m2salesforce;
USE m2salesforce;

--
-- Definition of table `acl_account_customer`
--

DROP TABLE IF EXISTS `acl_account_customer`;
CREATE TABLE `acl_account_customer` (
  `customer_account_id` varchar(36) NOT NULL,
  `pid` varchar(13) NOT NULL DEFAULT '',
  `msisdn` varchar(15) NOT NULL,
  `first_name_en` varchar(100) DEFAULT NULL,
  `last_name_en` varchar(200) DEFAULT NULL,
  `first_name_th` varchar(100) NOT NULL,
  `last_name_th` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_account_active_flag` enum('n','y') NOT NULL DEFAULT 'y',
  `is_account_hold_flag` enum('n','y') NOT NULL DEFAULT 'n',
  `prefer_lang_id` int(4) NOT NULL DEFAULT '1',
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  `notice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_account_id`),
  KEY `ActMembLang_refto_CfgLangId` (`prefer_lang_id`),
  CONSTRAINT `acl_account_customer_ibfk_1` FOREIGN KEY (`prefer_lang_id`) REFERENCES `type_language` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_account_customer`
--

/*!40000 ALTER TABLE `acl_account_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_account_customer` ENABLE KEYS */;


--
-- Definition of table `acl_account_member`
--

DROP TABLE IF EXISTS `acl_account_member`;
CREATE TABLE `acl_account_member` (
  `member_account_id` varchar(36) NOT NULL,
  `pid` varchar(15) NOT NULL DEFAULT '',
  `msisdn` varchar(15) NOT NULL,
  `first_name_en` varchar(100) DEFAULT NULL,
  `last_name_en` varchar(200) DEFAULT NULL,
  `first_name_th` varchar(100) NOT NULL,
  `last_name_th` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `loginid` varchar(100) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `login_failed_count` int(4) NOT NULL DEFAULT '0',
  `mobile_key` varchar(50) NOT NULL,
  `is_account_active_flag` enum('n','y') NOT NULL DEFAULT 'y',
  `is_account_hold_flag` enum('n','y') NOT NULL DEFAULT 'n',
  `prefer_lang_id` int(4) NOT NULL DEFAULT '1',
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  `notice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`member_account_id`),
  KEY `ActMembLang_refto_CfgLangId` (`prefer_lang_id`),
  CONSTRAINT `acl_account_member_ibfk_1` FOREIGN KEY (`prefer_lang_id`) REFERENCES `type_language` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_account_member`
--

/*!40000 ALTER TABLE `acl_account_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_account_member` ENABLE KEYS */;


--
-- Definition of table `inf_brand`
--

DROP TABLE IF EXISTS `inf_brand`;
CREATE TABLE `inf_brand` (
  `brand_id` varchar(36) NOT NULL DEFAULT 'UUID()',
  `brand_name_en` varchar(100) NOT NULL,
  `brand_name_th` varchar(100) NOT NULL,
  `is_active` enum('n','y') DEFAULT 'y',
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inf_brand`
--

/*!40000 ALTER TABLE `inf_brand` DISABLE KEYS */;
INSERT INTO `inf_brand` (`brand_id`,`brand_name_en`,`brand_name_th`,`is_active`,`created_dt`,`created_by`,`modified_dt`,`modified_by`) VALUES 
 ('536c6a70-a863-11e4-bfe1-90e6ba0e50c6','mazda','มาสด้า','y','2015-01-30 15:30:03','system','2015-01-30 16:35:38','system');
/*!40000 ALTER TABLE `inf_brand` ENABLE KEYS */;


--
-- Definition of table `inf_color`
--

DROP TABLE IF EXISTS `inf_color`;
CREATE TABLE `inf_color` (
  `color_id` varchar(36) NOT NULL,
  `series_id` varchar(36) NOT NULL,
  `color_code_name` varchar(50) DEFAULT NULL,
  `color_name_en` varchar(255) NOT NULL,
  `color_name_th` varchar(255) NOT NULL,
  `is_active` enum('n','y') DEFAULT 'y',
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  PRIMARY KEY (`color_id`),
  KEY `INFColorSeriesId_refto_INFSeriesId` (`series_id`),
  CONSTRAINT `INFColorSeriesId_refto_INFSeriesId` FOREIGN KEY (`series_id`) REFERENCES `inf_series` (`series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inf_color`
--

/*!40000 ALTER TABLE `inf_color` DISABLE KEYS */;
INSERT INTO `inf_color` (`color_id`,`series_id`,`color_code_name`,`color_name_en`,`color_name_th`,`is_active`,`created_dt`,`created_by`,`modified_dt`,`modified_by`) VALUES 
 ('0a98150c-a867-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','41V','Soul Red M','สีแดง โซล เรด','y','2015-01-30 15:57:49','system','2015-01-30 15:57:55','system'),
 ('13cc2fc4-a866-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','38P','Aluminum Metalic','สีเงิน อลูมินัม','y','2015-01-30 15:50:53','system','2015-01-30 15:50:56','system'),
 ('26117e9a-a867-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','25D','Snowflake White Pearl','สีขาวมุก สโนว์เฟลก','y','2015-01-30 15:58:54','system','2015-01-30 15:58:58','system'),
 ('334d52f6-a866-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','36C','Metropolitan Gray MC','สีเทาเมโทรโปลิตัน เกรย์','y','2015-01-30 15:52:11','system','2015-01-30 15:52:14','system'),
 ('5f46a6b4-a866-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','42S','Titanium Flash MC','สีน้ำตาล ไททาเนียม แฟลช','y','2015-01-30 15:53:27','system','2015-01-30 15:53:29','system'),
 ('906744ba-a866-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','16W','BlackMC','สีดำ แบล็ก','y','2015-01-30 15:54:22','system','2015-01-30 15:54:24','system'),
 ('abd722ba-a866-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','44J','Dynamic Bluc MC','สีน้ำเงิน ไดนามิค บลู','y','2015-01-30 15:55:06','system','2015-01-30 15:55:08','system'),
 ('d455fd02-a865-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','A4D','Arctic White','สีขาว อาร์กติก ไวท์','y','2015-01-30 15:50:01','system','2015-01-30 15:50:04','system');
/*!40000 ALTER TABLE `inf_color` ENABLE KEYS */;


--
-- Definition of table `inf_customer_image`
--

DROP TABLE IF EXISTS `inf_customer_image`;
CREATE TABLE `inf_customer_image` (
  `image_id` varchar(36) NOT NULL,
  `customer_account_id` varchar(36) NOT NULL,
  `image_type` enum('id_card','drive_card') NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_specific_path` varchar(100) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `CustImg_CustAcctId_refto_AcctCustId` (`customer_account_id`),
  CONSTRAINT `CustImg_CustAcctId_refto_AcctCustId` FOREIGN KEY (`customer_account_id`) REFERENCES `acl_account_customer` (`customer_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `inf_customer_image`
--

/*!40000 ALTER TABLE `inf_customer_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `inf_customer_image` ENABLE KEYS */;


--
-- Definition of table `inf_member_image`
--

DROP TABLE IF EXISTS `inf_member_image`;
CREATE TABLE `inf_member_image` (
  `image_id` varchar(36) NOT NULL,
  `member_account_id` varchar(36) NOT NULL,
  `image_type` enum('id_card','drive_card','book_bank') NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_specific_path` varchar(100) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `MbImg_MbAcctId_refto_AcctMembId` (`member_account_id`),
  CONSTRAINT `MbImg_MbAcctId_refto_AcctMembId` FOREIGN KEY (`member_account_id`) REFERENCES `acl_account_member` (`member_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `inf_member_image`
--

/*!40000 ALTER TABLE `inf_member_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `inf_member_image` ENABLE KEYS */;


--
-- Definition of table `inf_series`
--

DROP TABLE IF EXISTS `inf_series`;
CREATE TABLE `inf_series` (
  `series_id` varchar(36) NOT NULL,
  `brand_id` varchar(36) NOT NULL,
  `series_code_name` varchar(50) DEFAULT NULL,
  `series_name_en` varchar(100) NOT NULL,
  `series_name_th` varchar(100) NOT NULL,
  `is_active` enum('n','y') DEFAULT 'y',
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  PRIMARY KEY (`series_id`),
  KEY `INFSerieBrandId_refto_INFBrandId` (`brand_id`),
  CONSTRAINT `INFSerieBrandId_refto_INFBrandId` FOREIGN KEY (`brand_id`) REFERENCES `inf_brand` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inf_series`
--

/*!40000 ALTER TABLE `inf_series` DISABLE KEYS */;
INSERT INTO `inf_series` (`series_id`,`brand_id`,`series_code_name`,`series_name_en`,`series_name_th`,`is_active`,`created_dt`,`created_by`,`modified_dt`,`modified_by`) VALUES 
 ('7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','536c6a70-a863-11e4-bfe1-90e6ba0e50c6','mazda2','Mazda2','มาสด้า2','y','2015-01-30 15:40:12','system','2015-01-30 15:40:39','system');
/*!40000 ALTER TABLE `inf_series` ENABLE KEYS */;


--
-- Definition of table `inf_sub_series`
--

DROP TABLE IF EXISTS `inf_sub_series`;
CREATE TABLE `inf_sub_series` (
  `sub_series_id` varchar(36) NOT NULL,
  `series_id` varchar(36) NOT NULL,
  `sub_series_code_name` varchar(50) DEFAULT NULL,
  `sub_series_name_en` varchar(100) NOT NULL,
  `sub_series_name_th` varchar(100) NOT NULL,
  `is_active` enum('n','y') DEFAULT 'y',
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  PRIMARY KEY (`sub_series_id`),
  KEY `INFSubSerId_refto_INFSeriesID` (`series_id`),
  CONSTRAINT `INFSubSerId_refto_INFSeriesID` FOREIGN KEY (`series_id`) REFERENCES `inf_series` (`series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inf_sub_series`
--

/*!40000 ALTER TABLE `inf_sub_series` DISABLE KEYS */;
INSERT INTO `inf_sub_series` (`sub_series_id`,`series_id`,`sub_series_code_name`,`sub_series_name_en`,`sub_series_name_th`,`is_active`,`created_dt`,`created_by`,`modified_dt`,`modified_by`) VALUES 
 ('0b2b09f4-a865-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','SEDAN_XD_H','SEDAN XD HIGH','ซีดาน เอ๊กซ์ดี ไฮท์','y','2015-01-30 15:43:47','system','2015-01-30 15:43:49','system'),
 ('3231ccf4-a865-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','SEDAN_XD_HP','SEDAN XD HIGH PLUS','ซีดาน เอ๊กซ์ดี ไฮท์ พลัส','y','2015-01-30 15:44:39','system','2015-01-30 15:44:41','system'),
 ('7ddb1ee4-a865-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','HATCHBACK_XD_S','HATCHBACK XD SPORT','แฮทช์แบ็ค เอ๊กซ์ดี สปอร์ต','y','2015-01-30 15:46:13','system','2015-01-30 15:46:15','system'),
 ('8af07660-a865-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','HATCHBACK_XD_SH','HATCHBACK XD SPORT HIGH','แฮทช์แบ็ค เอ๊กซ์ดี สปอร์ต ไฮท์','y','2015-01-30 15:47:09','system','2015-01-30 15:47:11','system'),
 ('ab935efa-a865-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','HATCHBACK_XD_SHP','HATCHBACK XD SPORT HIGH PLUS','แฮทช์แบ็ค เอ๊กซ์ดี สปอร์ต ไฮท์ พลัส','y','2015-01-30 15:47:59','system','2015-01-30 16:52:40','system'),
 ('cd27082e-a864-11e4-bfe1-90e6ba0e50c6','7b85d7f2-a864-11e4-bfe1-90e6ba0e50c6','SEDAN_XD','SEDAN XD','ซีดาน เอ๊กซ์ดี','y','2015-01-30 15:42:31','system','2015-01-30 15:42:37','system');
/*!40000 ALTER TABLE `inf_sub_series` ENABLE KEYS */;


--
-- Definition of table `trx_sell_master`
--

DROP TABLE IF EXISTS `trx_sell_master`;
CREATE TABLE `trx_sell_master` (
  `trx_id` varchar(36) NOT NULL,
  `member_account_id` varchar(36) NOT NULL,
  `customer_account_id` varchar(36) NOT NULL,
  `order_number` varchar(15) NOT NULL COMMENT 'Generate Unique Order Number Code',
  `brand_id` varchar(36) NOT NULL,
  `series_id` varchar(36) NOT NULL,
  `sub_series_id` varchar(36) NOT NULL,
  `color_id` varchar(36) NOT NULL,
  `amount` int(4) NOT NULL DEFAULT '1',
  `status_id` int(4) NOT NULL DEFAULT '1',
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  `notice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trx_id`),
  KEY `TRXSellMstr_MbAcctId_refto_MembAcctId` (`member_account_id`),
  KEY `TRXSellMstr_CustAcctId_refto_CustAcctId` (`customer_account_id`),
  KEY `TRXSellMstr_BrandId_refto_BrandId` (`brand_id`),
  KEY `TRXSellMstr_SeriesId_refto_SeriesId` (`series_id`),
  KEY `TRXSellMstr_SubSerId_refto_SubSerId` (`sub_series_id`),
  KEY `TRXSellMstr_ColorId_refto_ColorId` (`color_id`),
  KEY `TRXSellMstr_StatusId_refto_TypeStatusId` (`status_id`),
  CONSTRAINT `TRXSellMstr_BrandId_refto_BrandId` FOREIGN KEY (`brand_id`) REFERENCES `inf_brand` (`brand_id`),
  CONSTRAINT `TRXSellMstr_ColorId_refto_ColorId` FOREIGN KEY (`color_id`) REFERENCES `inf_color` (`color_id`),
  CONSTRAINT `TRXSellMstr_CustAcctId_refto_CustAcctId` FOREIGN KEY (`customer_account_id`) REFERENCES `acl_account_customer` (`customer_account_id`),
  CONSTRAINT `TRXSellMstr_MbAcctId_refto_MembAcctId` FOREIGN KEY (`member_account_id`) REFERENCES `acl_account_member` (`member_account_id`),
  CONSTRAINT `TRXSellMstr_SeriesId_refto_SeriesId` FOREIGN KEY (`series_id`) REFERENCES `inf_series` (`series_id`),
  CONSTRAINT `TRXSellMstr_StatusId_refto_TypeStatusId` FOREIGN KEY (`status_id`) REFERENCES `type_trx_status` (`status_id`),
  CONSTRAINT `TRXSellMstr_SubSerId_refto_SubSerId` FOREIGN KEY (`sub_series_id`) REFERENCES `inf_sub_series` (`sub_series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trx_sell_master`
--

/*!40000 ALTER TABLE `trx_sell_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `trx_sell_master` ENABLE KEYS */;


--
-- Definition of table `trx_sms`
--

DROP TABLE IF EXISTS `trx_sms`;
CREATE TABLE `trx_sms` (
  `sms_task_id` varchar(36) NOT NULL,
  `trx_id` varchar(36) NOT NULL,
  `sms_msg` text NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `operator_smid` varchar(255) NOT NULL,
  `response_cd` varchar(255) DEFAULT NULL,
  `reason_cd` varchar(50) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  `notice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sms_task_id`),
  KEY `TrxSms_TrxId_refto_TrxSellMstr_TrxId` (`trx_id`),
  CONSTRAINT `TrxSms_TrxId_refto_TrxSellMstr_TrxId` FOREIGN KEY (`trx_id`) REFERENCES `trx_sell_master` (`trx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trx_sms`
--

/*!40000 ALTER TABLE `trx_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `trx_sms` ENABLE KEYS */;


--
-- Definition of table `type_language`
--

DROP TABLE IF EXISTS `type_language`;
CREATE TABLE `type_language` (
  `lang_id` int(4) NOT NULL AUTO_INCREMENT,
  `lang_name_en` varchar(100) NOT NULL,
  `lang_name_th` varchar(100) NOT NULL,
  `lang_name_own` varchar(100) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_language`
--

/*!40000 ALTER TABLE `type_language` DISABLE KEYS */;
INSERT INTO `type_language` (`lang_id`,`lang_name_en`,`lang_name_th`,`lang_name_own`,`created_dt`) VALUES 
 (1,'Thai','ไทย','ไทย','2015-01-07 17:38:43'),
 (2,'English','อังกฤษ','English','2015-01-07 16:35:48');
/*!40000 ALTER TABLE `type_language` ENABLE KEYS */;


--
-- Definition of table `type_trx_status`
--

DROP TABLE IF EXISTS `type_trx_status`;
CREATE TABLE `type_trx_status` (
  `status_id` int(4) NOT NULL AUTO_INCREMENT,
  `status_name_en` varchar(100) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_trx_status`
--

/*!40000 ALTER TABLE `type_trx_status` DISABLE KEYS */;
INSERT INTO `type_trx_status` (`status_id`,`status_name_en`,`created_dt`) VALUES 
 (1,'unverified','2015-01-30 17:28:30'),
 (2,'verified','2015-02-04 16:09:36'),
 (3,'process','2015-02-04 16:09:38'),
 (4,'done','2015-02-04 16:09:40'),
 (9,'void','2015-02-04 17:14:45');
/*!40000 ALTER TABLE `type_trx_status` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
