/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.187_root
Source Server Version : 50151
Source Host           : 192.168.1.187:3306
Source Database       : m2salesforce

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2015-03-11 17:59:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `acl_account_customer`
-- ----------------------------
DROP TABLE IF EXISTS `acl_account_customer`;
CREATE TABLE `acl_account_customer` (
  `customer_account_id` varchar(36) NOT NULL,
  `pid` varchar(15) NOT NULL DEFAULT '',
  `msisdn` varchar(15) NOT NULL,
  `first_name_en` varchar(100) DEFAULT NULL,
  `last_name_en` varchar(200) DEFAULT NULL,
  `first_name_th` varchar(100) NOT NULL,
  `last_name_th` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_kyc_identity` enum('n','y') NOT NULL DEFAULT 'n',
  `is_kyc_drive_license` enum('n','y') NOT NULL DEFAULT 'n',
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

-- ----------------------------
-- Records of acl_account_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_account_member`
-- ----------------------------
DROP TABLE IF EXISTS `acl_account_member`;
CREATE TABLE `acl_account_member` (
  `member_account_id` varchar(36) NOT NULL,
  `pid` varchar(15) NOT NULL DEFAULT '',
  `msisdn` varchar(15) NOT NULL,
  `first_name_en` varchar(100) DEFAULT NULL,
  `last_name_en` varchar(200) DEFAULT NULL,
  `first_name_th` varchar(100) NOT NULL,
  `last_name_th` varchar(200) NOT NULL,
  `bank_code` varchar(10) DEFAULT NULL,
  `bank_name` varchar(100) NOT NULL,
  `bank_acct_no` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `loginid` varchar(100) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `login_failed_count` int(4) NOT NULL DEFAULT '0',
  `mobile_key` varchar(50) DEFAULT NULL,
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

-- ----------------------------
-- Records of acl_account_member
-- ----------------------------
INSERT INTO acl_account_member VALUES ('2cf2d6ca-5207-49e9-91ec-94b82a705122', '9999999999999', '9999999999', null, null, 'firstname', 'lastname', null, '', '', 'lalit@mobizign.com', 'username', 'mewPassword', '0', '', 'n', 'n', '1', '2015-02-23 22:25:10', 'username', '2015-02-23 22:37:50', 'username', '');

-- ----------------------------
-- Table structure for `acl_dealer`
-- ----------------------------
DROP TABLE IF EXISTS `acl_dealer`;
CREATE TABLE `acl_dealer` (
  `dealer_id` int(11) NOT NULL AUTO_INCREMENT,
  `dealer_company_id` varchar(13) NOT NULL,
  `dealer_name_th` varchar(100) NOT NULL,
  `dealer_name_en` varchar(100) DEFAULT NULL,
  `bank_code` varchar(10) DEFAULT NULL,
  `bank_name` varchar(100) NOT NULL,
  `bank_acct_no` varchar(10) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dealer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_dealer
-- ----------------------------
INSERT INTO acl_dealer VALUES ('1', '', 'มาสด้า ชลบุรี', 'mazda chonburi', null, '', '', '2015-03-09 16:56:13');
INSERT INTO acl_dealer VALUES ('2', '0105553038781', 'บริษัท โมบิซายน์ จำกัด ', 'mobizign company limited', null, '', '', '2015-03-09 16:59:40');

-- ----------------------------
-- Table structure for `cnf_config_data`
-- ----------------------------
DROP TABLE IF EXISTS `cnf_config_data`;
CREATE TABLE `cnf_config_data` (
  `cnf_id` int(11) NOT NULL AUTO_INCREMENT,
  `cnf_name` varchar(50) NOT NULL,
  `cnf_data` text NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cnf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnf_config_data
-- ----------------------------
INSERT INTO cnf_config_data VALUES ('1', 'cnf_r1_message', 'เงื่อนไขการขึ้นทะเบียน \r\n1.ลขที่บัตรประจำตัวประชาชน ที่มีชื่อ-นามสกุลเป็นปัจจุบัน \r\n2.บัญชีธนาคาร ที่มีชื่อ-นามสกุล ตรงกับบัตรประชาชนตามเลขที่แจ้งในข้อ1\r\n3.ข้อมูลหมายเลขโทรศัพท์ และ Email เพื่อใช้ในการสื่อสารและแจ้งข้อมูลระหว่างกันในกรณีลืมรหัสผ่านเป็นต้น', '2015-03-11 12:46:55');
INSERT INTO cnf_config_data VALUES ('2', 'cnf_r5_message', 'ท่านสามารถเข้าสู่ระบบได้แล้ว\r\nแต่การขึ้นทะเบียนของท่านยังไม่สมบูรณ์\r\nกรุณาเตรียมเอกสารดังนี้\r\n1.บัตรประชาชนของท่าน ไฟล์ภาพบัตรประชาชน\r\n2.สมุดบัญชีธนาคารหน้าแรกของท่าน ไฟล์ภาพสมุดบัญชีธนาคารหน้าแรก', '2015-03-11 14:16:22');

-- ----------------------------
-- Table structure for `inf_brand`
-- ----------------------------
DROP TABLE IF EXISTS `inf_brand`;
CREATE TABLE `inf_brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name_en` varchar(100) NOT NULL,
  `brand_name_th` varchar(100) NOT NULL,
  `is_active` enum('n','y') DEFAULT 'y',
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_brand
-- ----------------------------
INSERT INTO inf_brand VALUES ('1', 'mazda', 'มาสด้า', 'y', '2015-02-24 13:41:06', 'system', '2015-02-24 13:41:10', '');

-- ----------------------------
-- Table structure for `inf_category`
-- ----------------------------
DROP TABLE IF EXISTS `inf_category`;
CREATE TABLE `inf_category` (
  `category_id` int(11) NOT NULL,
  `category_name_th` varchar(100) NOT NULL,
  `category_name_en` varchar(100) DEFAULT NULL,
  `category_detail` varchar(255) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_category
-- ----------------------------
INSERT INTO inf_category VALUES ('1', 'ยานยนต์', 'Motor', null, '2015-03-06 16:56:39');
INSERT INTO inf_category VALUES ('99', 'อื่นๆ', 'Other', null, '2015-03-06 16:56:56');

-- ----------------------------
-- Table structure for `inf_color`
-- ----------------------------
DROP TABLE IF EXISTS `inf_color`;
CREATE TABLE `inf_color` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `series_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_color
-- ----------------------------
INSERT INTO inf_color VALUES ('1', '1', '41V', 'Soul Red M', 'สีแดง โซล เรด', 'y', '2015-01-30 15:57:49', 'system', '2015-02-24 14:11:46', 'system');
INSERT INTO inf_color VALUES ('2', '1', '38P', 'Aluminum Metalic', 'สีเงิน อลูมินัม', 'y', '2015-01-30 15:50:53', 'system', '2015-02-24 14:11:47', 'system');
INSERT INTO inf_color VALUES ('3', '1', '25D', 'Snowflake White Pearl', 'สีขาวมุก สโนว์เฟลก', 'y', '2015-01-30 15:58:54', 'system', '2015-02-24 14:11:48', 'system');
INSERT INTO inf_color VALUES ('4', '1', '36C', 'Metropolitan Gray MC', 'สีเทาเมโทรโปลิตัน เกรย์', 'y', '2015-01-30 15:52:11', 'system', '2015-02-24 14:11:49', 'system');
INSERT INTO inf_color VALUES ('5', '1', '42S', 'Titanium Flash MC', 'สีน้ำตาล ไททาเนียม แฟลช', 'y', '2015-01-30 15:53:27', 'system', '2015-02-24 14:11:50', 'system');
INSERT INTO inf_color VALUES ('6', '1', '16W', 'BlackMC', 'สีดำ แบล็ก', 'y', '2015-01-30 15:54:22', 'system', '2015-02-24 14:11:51', 'system');
INSERT INTO inf_color VALUES ('7', '1', '44J', 'Dynamic Bluc MC', 'สีน้ำเงิน ไดนามิค บลู', 'y', '2015-01-30 15:55:06', 'system', '2015-02-24 14:11:52', 'system');
INSERT INTO inf_color VALUES ('8', '1', 'A4D', 'Arctic White', 'สีขาว อาร์กติก ไวท์', 'y', '2015-01-30 15:50:01', 'system', '2015-02-24 14:11:53', 'system');

-- ----------------------------
-- Table structure for `inf_customer_image`
-- ----------------------------
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

-- ----------------------------
-- Records of inf_customer_image
-- ----------------------------

-- ----------------------------
-- Table structure for `inf_member_image`
-- ----------------------------
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

-- ----------------------------
-- Records of inf_member_image
-- ----------------------------

-- ----------------------------
-- Table structure for `inf_series`
-- ----------------------------
DROP TABLE IF EXISTS `inf_series`;
CREATE TABLE `inf_series` (
  `series_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
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
  CONSTRAINT `InfSeriesBrandId_refto_InfBrand` FOREIGN KEY (`brand_id`) REFERENCES `inf_brand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_series
-- ----------------------------
INSERT INTO inf_series VALUES ('1', '1', 'mazda2', 'Mazda2', 'มาสด้า2', 'y', '2015-01-30 15:40:12', 'system', '2015-02-24 14:05:01', 'system');

-- ----------------------------
-- Table structure for `inf_sub_series`
-- ----------------------------
DROP TABLE IF EXISTS `inf_sub_series`;
CREATE TABLE `inf_sub_series` (
  `sub_series_id` int(11) NOT NULL AUTO_INCREMENT,
  `series_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_sub_series
-- ----------------------------
INSERT INTO inf_sub_series VALUES ('1', '1', 'SEDAN_XD_H', 'SEDAN XD HIGH', 'ซีดาน เอ๊กซ์ดี ไฮท์', 'y', '2015-01-30 15:43:47', 'system', '2015-02-24 14:12:27', 'system');
INSERT INTO inf_sub_series VALUES ('2', '1', 'SEDAN_XD_HP', 'SEDAN XD HIGH PLUS', 'ซีดาน เอ๊กซ์ดี ไฮท์ พลัส', 'y', '2015-01-30 15:44:39', 'system', '2015-02-24 14:12:27', 'system');
INSERT INTO inf_sub_series VALUES ('3', '1', 'HATCHBACK_XD_S', 'HATCHBACK XD SPORT', 'แฮทช์แบ็ค เอ๊กซ์ดี สปอร์ต', 'y', '2015-01-30 15:46:13', 'system', '2015-02-24 14:12:28', 'system');
INSERT INTO inf_sub_series VALUES ('4', '1', 'HATCHBACK_XD_SH', 'HATCHBACK XD SPORT HIGH', 'แฮทช์แบ็ค เอ๊กซ์ดี สปอร์ต ไฮท์', 'y', '2015-01-30 15:47:09', 'system', '2015-02-24 14:12:29', 'system');
INSERT INTO inf_sub_series VALUES ('5', '1', 'HATCHBACK_XD_SHP', 'HATCHBACK XD SPORT HIGH PLUS', 'แฮทช์แบ็ค เอ๊กซ์ดี สปอร์ต ไฮท์ พลัส', 'y', '2015-01-30 15:47:59', 'system', '2015-02-24 14:12:29', 'system');
INSERT INTO inf_sub_series VALUES ('6', '1', 'SEDAN_XD', 'SEDAN XD', 'ซีดาน เอ๊กซ์ดี', 'y', '2015-01-30 15:42:31', 'system', '2015-02-24 14:12:31', 'system');

-- ----------------------------
-- Table structure for `trx_customer_pool`
-- ----------------------------
DROP TABLE IF EXISTS `trx_customer_pool`;
CREATE TABLE `trx_customer_pool` (
  `member_account_id` varchar(36) NOT NULL,
  `customer_account_id` varchar(36) NOT NULL,
  `customer_pid` varchar(15) NOT NULL,
  `category_id` int(11) NOT NULL,
  `latest_trx_id` varchar(36) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_account_id`,`customer_account_id`,`category_id`),
  KEY `CustPool_CateId_refto_InfCateId` (`category_id`),
  KEY `CustPool_CustAcctId_refto_AcctCust_AcctId` (`customer_account_id`),
  CONSTRAINT `CustPool_CustAcctId_refto_AcctCust_AcctId` FOREIGN KEY (`customer_account_id`) REFERENCES `acl_account_customer` (`customer_account_id`),
  CONSTRAINT `CustPool_CateId_refto_InfCateId` FOREIGN KEY (`category_id`) REFERENCES `inf_category` (`category_id`),
  CONSTRAINT `CustPool_MemAcctId_refto_AcctMember_AcctId` FOREIGN KEY (`member_account_id`) REFERENCES `acl_account_member` (`member_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_customer_pool
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_sell_master`
-- ----------------------------
DROP TABLE IF EXISTS `trx_sell_master`;
CREATE TABLE `trx_sell_master` (
  `trx_id` varchar(36) NOT NULL,
  `member_account_id` varchar(36) NOT NULL,
  `customer_account_id` varchar(36) NOT NULL,
  `order_number` varchar(15) NOT NULL COMMENT 'Generate Unique Order Number Code',
  `brand_id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `sub_series_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `amount` int(4) NOT NULL DEFAULT '1',
  `status_id` int(4) NOT NULL DEFAULT '1',
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  `notice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trx_id`),
  UNIQUE KEY `IDX_order_number` (`order_number`) USING BTREE,
  KEY `TRXSellMstr_MbAcctId_refto_MembAcctId` (`member_account_id`),
  KEY `TRXSellMstr_CustAcctId_refto_CustAcctId` (`customer_account_id`),
  KEY `TRXSellMstr_BrandId_refto_BrandId` (`brand_id`),
  KEY `TRXSellMstr_SeriesId_refto_SeriesId` (`series_id`),
  KEY `TRXSellMstr_SubSerId_refto_SubSerId` (`sub_series_id`),
  KEY `TRXSellMstr_ColorId_refto_ColorId` (`color_id`),
  KEY `TRXSellMstr_StatusId_refto_TypeStatusId` (`status_id`),
  CONSTRAINT `TRXSellMstr_SubSerId_refto_SubSerId` FOREIGN KEY (`sub_series_id`) REFERENCES `inf_sub_series` (`sub_series_id`),
  CONSTRAINT `TRXSellMstr_BrandId_refto_BrandId` FOREIGN KEY (`brand_id`) REFERENCES `inf_brand` (`brand_id`),
  CONSTRAINT `TRXSellMstr_ColorId_refto_ColorId` FOREIGN KEY (`color_id`) REFERENCES `inf_color` (`color_id`),
  CONSTRAINT `TRXSellMstr_CustAcctId_refto_CustAcctId` FOREIGN KEY (`customer_account_id`) REFERENCES `acl_account_customer` (`customer_account_id`),
  CONSTRAINT `TRXSellMstr_MbAcctId_refto_MembAcctId` FOREIGN KEY (`member_account_id`) REFERENCES `acl_account_member` (`member_account_id`),
  CONSTRAINT `TRXSellMstr_SeriesId_refto_SeriesId` FOREIGN KEY (`series_id`) REFERENCES `inf_series` (`series_id`),
  CONSTRAINT `TRXSellMstr_StatusId_refto_TypeStatusId` FOREIGN KEY (`status_id`) REFERENCES `type_trx_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trx_sell_master
-- ----------------------------

-- ----------------------------
-- Table structure for `trx_sms`
-- ----------------------------
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

-- ----------------------------
-- Records of trx_sms
-- ----------------------------

-- ----------------------------
-- Table structure for `type_language`
-- ----------------------------
DROP TABLE IF EXISTS `type_language`;
CREATE TABLE `type_language` (
  `lang_id` int(4) NOT NULL AUTO_INCREMENT,
  `lang_name_en` varchar(100) NOT NULL,
  `lang_name_th` varchar(100) NOT NULL,
  `lang_name_own` varchar(100) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_language
-- ----------------------------
INSERT INTO type_language VALUES ('1', 'Thai', 'ไทย', 'ไทย', '2015-01-07 17:38:43');
INSERT INTO type_language VALUES ('2', 'English', 'อังกฤษ', 'English', '2015-01-07 16:35:48');

-- ----------------------------
-- Table structure for `type_trx_status`
-- ----------------------------
DROP TABLE IF EXISTS `type_trx_status`;
CREATE TABLE `type_trx_status` (
  `status_id` int(4) NOT NULL AUTO_INCREMENT,
  `status_name_en` varchar(100) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_trx_status
-- ----------------------------
INSERT INTO type_trx_status VALUES ('1', 'unverified', '2015-01-30 17:28:30');
INSERT INTO type_trx_status VALUES ('2', 'verified', '2015-02-04 16:09:36');
INSERT INTO type_trx_status VALUES ('3', 'process', '2015-02-04 16:09:38');
INSERT INTO type_trx_status VALUES ('4', 'done', '2015-02-04 16:09:40');
INSERT INTO type_trx_status VALUES ('9', 'void', '2015-02-04 17:14:45');
