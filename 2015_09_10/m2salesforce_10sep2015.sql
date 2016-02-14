/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.187_root
Source Server Version : 50151
Source Host           : 192.168.1.187:3306
Source Database       : m2salesforce

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2015-09-10 14:47:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `acl_account_admin`
-- ----------------------------
DROP TABLE IF EXISTS `acl_account_admin`;
CREATE TABLE `acl_account_admin` (
  `admin_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `admin_login` varchar(18) NOT NULL,
  `admin_passwd` varchar(32) NOT NULL,
  `admin_msisdn` varchar(15) NOT NULL,
  `admin_first_name` varchar(50) NOT NULL,
  `admin_last_name` varchar(100) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_account_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_account_customer`
-- ----------------------------
DROP TABLE IF EXISTS `acl_account_customer`;
CREATE TABLE `acl_account_customer` (
  `customer_account_id` varchar(36) NOT NULL,
  `pid` varchar(15) NOT NULL DEFAULT '',
  `msisdn` varchar(15) NOT NULL,
  `first_name_th` varchar(100) NOT NULL,
  `last_name_en` varchar(200) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `last_name_th` varchar(200) NOT NULL,
  `first_name_en` varchar(100) DEFAULT NULL,
  `is_kyc_identity_verify` enum('n','y') NOT NULL DEFAULT 'n',
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
  `token` varchar(255) DEFAULT NULL,
  `pid` varchar(15) NOT NULL DEFAULT '',
  `msisdn` varchar(15) NOT NULL,
  `first_name_en` varchar(100) DEFAULT NULL,
  `last_name_en` varchar(200) DEFAULT NULL,
  `first_name_th` varchar(100) NOT NULL,
  `last_name_th` varchar(200) NOT NULL,
  `bank_code` varchar(10) NOT NULL,
  `bank_acct_no` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `email_is_verified` enum('n','y') NOT NULL DEFAULT 'n',
  `pin` varchar(32) NOT NULL,
  `pin_failed_count` int(4) NOT NULL DEFAULT '0',
  `is_account_active_flag` enum('n','w','y') NOT NULL DEFAULT 'n' COMMENT 'activate_status',
  `is_account_hold_flag` enum('n','y') NOT NULL DEFAULT 'n' COMMENT 'อายัด , ระงับ',
  `prefer_lang_id` int(4) NOT NULL DEFAULT '1',
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  `notice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`member_account_id`),
  UNIQUE KEY `member_token_Unique_IDX` (`token`),
  KEY `ActMembLang_refto_CfgLangId` (`prefer_lang_id`),
  KEY `AcctMemberBankCode_refto_TypeBank` (`bank_code`),
  CONSTRAINT `AcctMemberBankCode_refto_TypeBank` FOREIGN KEY (`bank_code`) REFERENCES `type_bank` (`bank_code`),
  CONSTRAINT `acl_account_member_ibfk_1` FOREIGN KEY (`prefer_lang_id`) REFERENCES `type_language` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_account_member
-- ----------------------------
INSERT INTO acl_account_member VALUES ('2cf2d6ca-5207-49e9-91ec-94b82a705122', '', '9999999999999', '9999999999', null, null, 'firstname', 'lastname', 'SCB', '1234566423', 'lalit@mobizign.com', 'n', 'pinencode', '0', 'n', 'n', '1', '2015-02-23 22:25:10', 'username', '2015-07-07 14:17:03', 'username', '');

-- ----------------------------
-- Table structure for `acl_account_merchant`
-- ----------------------------
DROP TABLE IF EXISTS `acl_account_merchant`;
CREATE TABLE `acl_account_merchant` (
  `merchant_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_company_id` varchar(13) NOT NULL,
  `merchant_name_th` varchar(100) NOT NULL,
  `merchant_name_en` varchar(100) DEFAULT NULL,
  `bank_code` varchar(10) DEFAULT NULL,
  `bank_name` varchar(100) NOT NULL,
  `bank_acct_no` varchar(10) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`merchant_id`),
  KEY `BankCode_refto_TypBank` (`bank_code`),
  CONSTRAINT `BankCode_refto_TypBank` FOREIGN KEY (`bank_code`) REFERENCES `type_bank` (`bank_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_account_merchant
-- ----------------------------
INSERT INTO acl_account_merchant VALUES ('1', '9999999999999', 'มาสด้า ชลบุรี', 'mazda chonburi', null, '', '', '2015-06-04 19:01:36');
INSERT INTO acl_account_merchant VALUES ('2', '0105553038781', 'บริษัท โมบิซายน์ จำกัด ', 'mobizign company limited', null, '', '', '2015-03-09 16:59:40');

-- ----------------------------
-- Table structure for `acl_account_merchant_admin`
-- ----------------------------
DROP TABLE IF EXISTS `acl_account_merchant_admin`;
CREATE TABLE `acl_account_merchant_admin` (
  `admin_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `admin_login` varchar(18) NOT NULL,
  `admin_passwd` varchar(32) NOT NULL,
  `admin_msisdn` varchar(15) NOT NULL,
  `admin_first_name` varchar(50) NOT NULL,
  `admin_last_name` varchar(100) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_account_id`),
  UNIQUE KEY `merch_admin_token_Unique_IDX` (`token`),
  KEY `AdminMerchId_refto_AcctMerchId` (`merchant_id`),
  CONSTRAINT `AdminMerchId_refto_AcctMerchId` FOREIGN KEY (`merchant_id`) REFERENCES `acl_account_merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_account_merchant_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_merchant_config`
-- ----------------------------
DROP TABLE IF EXISTS `acl_merchant_config`;
CREATE TABLE `acl_merchant_config` (
  `merchant_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL,
  `register_notify_channel` enum('BOTH','EMAIL','SMS') NOT NULL DEFAULT 'EMAIL',
  `forgot_pin_notify_channel` enum('BOTH','EMAIL','SMS') NOT NULL DEFAULT 'EMAIL',
  `order_notify_channel` enum('BOTH','EMAIL','SMS') NOT NULL DEFAULT 'BOTH',
  `base_revenue_percent` int(11) NOT NULL DEFAULT '0',
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`merchant_config_id`),
  KEY `McConf_refto_McId` (`merchant_id`),
  CONSTRAINT `McConf_refto_McId` FOREIGN KEY (`merchant_id`) REFERENCES `acl_account_merchant` (`merchant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_merchant_config
-- ----------------------------
INSERT INTO acl_merchant_config VALUES ('1', '1', 'SMS', 'EMAIL', 'BOTH', '5', '2015-08-03 20:12:56');

-- ----------------------------
-- Table structure for `acl_merchant_location`
-- ----------------------------
DROP TABLE IF EXISTS `acl_merchant_location`;
CREATE TABLE `acl_merchant_location` (
  `store_location_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `store_location_type` enum('BRANCH','HQ') NOT NULL,
  `store_location_code` varchar(50) DEFAULT NULL,
  `store_location_name_th` varchar(100) NOT NULL,
  `store_location_name_en` varchar(100) DEFAULT NULL,
  `location_lat` varchar(100) NOT NULL,
  `location_long` varchar(100) NOT NULL,
  `location_address` varchar(255) DEFAULT NULL,
  `location_province` varchar(100) DEFAULT NULL,
  `additional_ship_cost` int(5) NOT NULL DEFAULT '0',
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_location_id`),
  KEY `MerchLocatMerchId_refto_MerchId` (`merchant_id`),
  CONSTRAINT `MerchLocatMerchId_refto_MerchId` FOREIGN KEY (`merchant_id`) REFERENCES `acl_account_merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_merchant_location
-- ----------------------------

-- ----------------------------
-- Table structure for `cnf_message_data`
-- ----------------------------
DROP TABLE IF EXISTS `cnf_message_data`;
CREATE TABLE `cnf_message_data` (
  `cnf_id` int(11) NOT NULL AUTO_INCREMENT,
  `cnf_name` varchar(50) NOT NULL,
  `cnf_data` text NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cnf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnf_message_data
-- ----------------------------
INSERT INTO cnf_message_data VALUES ('1', 'cnf_reg_start_message', 'เงื่อนไขการขึ้นทะเบียน \r\n1.ลขที่บัตรประจำตัวประชาชน ที่มีชื่อ-นามสกุลเป็นปัจจุบัน \r\n2.บัญชีธนาคาร ที่มีชื่อ-นามสกุล ตรงกับบัตรประชาชนตามเลขที่แจ้งในข้อ1\r\n3.ข้อมูลหมายเลขโทรศัพท์ และ Email เพื่อใช้ในการสื่อสารและแจ้งข้อมูลระหว่างกันในกรณีลืมรหัสผ่านเป็นต้น', '2015-07-08 19:13:41');
INSERT INTO cnf_message_data VALUES ('2', 'cnf_reg_finish_message', 'ท่านสามารถเข้าสู่ระบบได้แล้ว\r\nแต่การขึ้นทะเบียนของท่านยังไม่สมบูรณ์\r\nกรุณาเตรียมเอกสารดังนี้\r\n1.บัตรประชาชนของท่าน ไฟล์ภาพบัตรประชาชน\r\n2.สมุดบัญชีธนาคารหน้าแรกของท่าน ไฟล์ภาพสมุดบัญชีธนาคารหน้าแรก', '2015-07-08 19:14:02');
INSERT INTO cnf_message_data VALUES ('3', 'cnf_reg_waitact_message', 'ระบบได้รับเอกสารของท่านครบถ้วนแล้ว หลังจากที่เจ้าหน้าที่ตรวจสอบเอกสารเรียบร้อยแล้ว ท่านจะได้รับ SMS แจ้ง', '2015-07-08 19:14:06');
INSERT INTO cnf_message_data VALUES ('4', 'cnf_newcust_message', 'ระบบได้รับเอกสารของลูกค้าเรียบร้อยแล้ว รอการตรวจสอบ และรอรับ Email/SMS แจ้งผล', '2015-07-08 19:14:15');

-- ----------------------------
-- Table structure for `cnf_special_merchant_revenue`
-- ----------------------------
DROP TABLE IF EXISTS `cnf_special_merchant_revenue`;
CREATE TABLE `cnf_special_merchant_revenue` (
  `cnf_special_revenue_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `effective_start` datetime DEFAULT NULL,
  `effective_end` datetime NOT NULL,
  `revenue_percent` int(11) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cnf_special_revenue_id`),
  KEY `CnfSpecRevnMerchId_refto_AclAcctMerchId` (`merchant_id`),
  CONSTRAINT `CnfSpecRevnMerchId_refto_AclAcctMerchId` FOREIGN KEY (`merchant_id`) REFERENCES `acl_account_merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnf_special_merchant_revenue
-- ----------------------------

-- ----------------------------
-- Table structure for `cnf_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `cnf_system_config`;
CREATE TABLE `cnf_system_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(100) NOT NULL,
  `config_value` varchar(50) NOT NULL,
  `config_type` enum('center','backoffice','other','mobile') NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cnf_system_config
-- ----------------------------
INSERT INTO cnf_system_config VALUES ('1', 'default_system_lang_id', '1', 'mobile', '2015-07-08 14:04:40');
INSERT INTO cnf_system_config VALUES ('2', 'register_notify_channel', 'both', 'center', '2015-07-07 18:00:31');
INSERT INTO cnf_system_config VALUES ('3', 'forgot_pin_notify_channel', 'email', 'center', '2015-07-07 18:36:25');
INSERT INTO cnf_system_config VALUES ('4', 'max_pin_failed', '3', 'center', '2015-07-09 17:41:40');

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
-- Table structure for `inf_item`
-- ----------------------------
DROP TABLE IF EXISTS `inf_item`;
CREATE TABLE `inf_item` (
  `item_id` varchar(36) NOT NULL,
  `category_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `item_code` varchar(100) DEFAULT NULL,
  `item_brand` varchar(100) DEFAULT NULL,
  `item_series` varchar(100) DEFAULT NULL,
  `item_sub_series` varchar(100) DEFAULT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_desc` varchar(255) DEFAULT NULL,
  `is_active` enum('n','y') NOT NULL DEFAULT 'y',
  `checklist_group_id` int(11) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `ItemCateId_refto_CateId` (`category_id`),
  KEY `ItemMerchId_refto_MerchId` (`merchant_id`),
  KEY `ItmChkLstGrpId_refto_ChkLstGrp` (`checklist_group_id`),
  CONSTRAINT `ItemCateId_refto_CateId` FOREIGN KEY (`category_id`) REFERENCES `inf_item_category` (`category_id`),
  CONSTRAINT `ItemMerchId_refto_MerchId` FOREIGN KEY (`merchant_id`) REFERENCES `acl_account_merchant` (`merchant_id`),
  CONSTRAINT `ItmChkLstGrpId_refto_ChkLstGrp` FOREIGN KEY (`checklist_group_id`) REFERENCES `inf_item_checklist_group` (`checklist_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_item
-- ----------------------------

-- ----------------------------
-- Table structure for `inf_item_category`
-- ----------------------------
DROP TABLE IF EXISTS `inf_item_category`;
CREATE TABLE `inf_item_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name_th` varchar(100) NOT NULL,
  `category_name_en` varchar(100) DEFAULT NULL,
  `category_detail` varchar(255) DEFAULT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_item_category
-- ----------------------------
INSERT INTO inf_item_category VALUES ('1', 'ยานยนต์', 'Motor', null, '2015-03-06 16:56:39');
INSERT INTO inf_item_category VALUES ('2', 'ประกันภัย', 'Insurance', null, '2015-08-04 14:55:01');
INSERT INTO inf_item_category VALUES ('3', 'อสังหาริมทรัพย์', 'Real Estate', null, '2015-08-04 14:56:15');
INSERT INTO inf_item_category VALUES ('99', 'อื่นๆ', 'Other', null, '2015-03-06 16:56:56');

-- ----------------------------
-- Table structure for `inf_item_checklist_group`
-- ----------------------------
DROP TABLE IF EXISTS `inf_item_checklist_group`;
CREATE TABLE `inf_item_checklist_group` (
  `checklist_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `checklist_group_name` varchar(100) NOT NULL,
  `checklist_group_desc` varchar(255) DEFAULT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`checklist_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_item_checklist_group
-- ----------------------------
INSERT INTO inf_item_checklist_group VALUES ('1', 'Motor-Mazda2-Checklist', 'รายการสิ่งที่ต้องการในการซื้อรถ mazda2', '2015-08-11 19:21:49');

-- ----------------------------
-- Table structure for `inf_item_checklist_master`
-- ----------------------------
DROP TABLE IF EXISTS `inf_item_checklist_master`;
CREATE TABLE `inf_item_checklist_master` (
  `checklist_master_id` varchar(36) NOT NULL,
  `checklist_group_id` int(11) NOT NULL,
  `checklist_name` varchar(50) NOT NULL,
  `checklist_type` enum('text','file','multi_choice','single_choice') NOT NULL,
  `is_require` enum('n','y') NOT NULL,
  `checklist_message` varchar(255) DEFAULT NULL,
  `checklist_text_lenght` int(11) DEFAULT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`checklist_master_id`),
  KEY `ChkLstGrpId_refto_ChkLstGrp` (`checklist_group_id`),
  CONSTRAINT `ChkLstGrpId_refto_ChkLstGrp` FOREIGN KEY (`checklist_group_id`) REFERENCES `inf_item_checklist_group` (`checklist_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_item_checklist_master
-- ----------------------------
INSERT INTO inf_item_checklist_master VALUES ('04f21d32-4024-11e5-a3df-90e6ba0e50c6', '1', 'Notice', 'text', 'n', 'รายละเอียดอื่นๆถ้ามี', '100', '2015-08-11 19:25:55');
INSERT INTO inf_item_checklist_master VALUES ('3ad226c8-4023-11e5-a3df-90e6ba0e50c6', '1', 'Color', 'single_choice', 'y', 'เลือกสีรถ', null, '2015-08-11 19:21:01');
INSERT INTO inf_item_checklist_master VALUES ('9873bb66-4023-11e5-a3df-90e6ba0e50c6', '1', 'DriveLicense', 'file', 'y', 'ไฟล์รูปใบขับขี่', null, '2015-08-11 19:22:54');

-- ----------------------------
-- Table structure for `inf_item_checklist_value`
-- ----------------------------
DROP TABLE IF EXISTS `inf_item_checklist_value`;
CREATE TABLE `inf_item_checklist_value` (
  `checklist_value_id` varchar(36) NOT NULL,
  `checklist_master_id` varchar(36) NOT NULL,
  `checklist_value_th` varchar(100) NOT NULL,
  `checklist_value_en` varchar(100) DEFAULT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`checklist_value_id`),
  KEY `ItmChklstValMstrId_refto_ItmChkLstMstr` (`checklist_master_id`),
  CONSTRAINT `ItmChklstValMstrId_refto_ItmChkLstMstr` FOREIGN KEY (`checklist_master_id`) REFERENCES `inf_item_checklist_master` (`checklist_master_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inf_item_checklist_value
-- ----------------------------
INSERT INTO inf_item_checklist_value VALUES ('d33031da-4023-11e5-a3df-90e6ba0e50c6', '3ad226c8-4023-11e5-a3df-90e6ba0e50c6', 'สีแดงสด', 'SoulRed', '2015-08-11 19:24:45');
INSERT INTO inf_item_checklist_value VALUES ('dc186218-4023-11e5-a3df-90e6ba0e50c6', '3ad226c8-4023-11e5-a3df-90e6ba0e50c6', 'สีขาวมุก', 'WhitePerl', '2015-08-11 19:24:42');

-- ----------------------------
-- Table structure for `inf_member_image`
-- ----------------------------
DROP TABLE IF EXISTS `inf_member_image`;
CREATE TABLE `inf_member_image` (
  `image_id` varchar(36) NOT NULL,
  `member_account_id` varchar(36) NOT NULL,
  `image_type` enum('id_card','drive_card','book_bank') NOT NULL,
  `image_file_name` varchar(100) NOT NULL,
  `image_specific_path` varchar(100) DEFAULT NULL,
  `is_latest_active` enum('n','y') NOT NULL DEFAULT 'y',
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
  CONSTRAINT `CustPool_CateId_refto_InfCateId` FOREIGN KEY (`category_id`) REFERENCES `inf_item_category` (`category_id`),
  CONSTRAINT `CustPool_CustAcctId_refto_AcctCust_AcctId` FOREIGN KEY (`customer_account_id`) REFERENCES `acl_account_customer` (`customer_account_id`),
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
  `amount` int(4) NOT NULL DEFAULT '1',
  `status_id` int(4) NOT NULL DEFAULT '1',
  `payment_term` enum('loan','cash') NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) NOT NULL,
  `notice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trx_id`),
  UNIQUE KEY `IDX_order_number` (`order_number`) USING BTREE,
  KEY `TRXSellMstr_MbAcctId_refto_MembAcctId` (`member_account_id`),
  KEY `TRXSellMstr_CustAcctId_refto_CustAcctId` (`customer_account_id`),
  KEY `TRXSellMstr_StatusId_refto_TypeStatusId` (`status_id`),
  CONSTRAINT `TRXSellMstr_CustAcctId_refto_CustAcctId` FOREIGN KEY (`customer_account_id`) REFERENCES `acl_account_customer` (`customer_account_id`),
  CONSTRAINT `TRXSellMstr_MbAcctId_refto_MembAcctId` FOREIGN KEY (`member_account_id`) REFERENCES `acl_account_member` (`member_account_id`),
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
-- Table structure for `type_bank`
-- ----------------------------
DROP TABLE IF EXISTS `type_bank`;
CREATE TABLE `type_bank` (
  `bank_code` varchar(10) NOT NULL,
  `bank_name_en` varchar(100) NOT NULL,
  `bank_name_th` varchar(100) NOT NULL,
  `bank_swift_code` varchar(10) NOT NULL,
  `is_active` enum('n','y') DEFAULT 'y',
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bank_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_bank
-- ----------------------------
INSERT INTO type_bank VALUES ('BAAC', 'ธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร', 'ธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร', 'BAAC', 'n', '2015-07-07 14:14:34');
INSERT INTO type_bank VALUES ('BAY', 'Bank of Ayudhya Public Company Limited', 'ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)', 'AYUD', 'y', '2015-08-05 12:15:58');
INSERT INTO type_bank VALUES ('BBL', 'Bangkok Bank Public Company Limited', 'ธนาคารกรุงเทพ จำกัด (มหาชน)', 'BKKB', 'y', '2015-08-05 12:14:59');
INSERT INTO type_bank VALUES ('CIMBT', 'CIMB Thai Bank', 'ธนาคารซีไอเอ็มบีไทย', 'UBOB', 'y', '2015-07-07 14:09:45');
INSERT INTO type_bank VALUES ('GSB', 'Government Saving Bank', 'ธนาคารออมสิน', 'GSB', 'n', '2015-07-07 14:14:41');
INSERT INTO type_bank VALUES ('KBANK', 'Kasikorn Bank Public Company Limited', 'ธนาคารกสิกรไทย จำกัด (มหาชน)', 'KASI', 'y', '2015-08-05 12:14:37');
INSERT INTO type_bank VALUES ('KTB', 'Krung Thai Bank Public Company Limited', 'ธนาคารกรุงไทย จำกัด (มหาชน)', 'KRTH', 'y', '2015-08-05 12:14:22');
INSERT INTO type_bank VALUES ('SCB', 'Siam Commercial Bank Public Company Limited', 'ธนาคารไทยพาณิชย์ จำกัด (มหาชน)', 'SICO', 'y', '2015-08-05 12:14:16');
INSERT INTO type_bank VALUES ('TCAP', 'Thanachart Bank Public Company Limited', 'ธนาคารธนชาต จำกัด (มหาชน)', 'THBK', 'y', '2015-08-05 12:14:03');
INSERT INTO type_bank VALUES ('TMB', 'TMB Bank Public Company Limited', 'ธนาคารทหารไทย จำกัด (มหาชน)', 'TMBK', 'y', '2015-08-05 12:13:50');

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
-- Table structure for `type_locale_province`
-- ----------------------------
DROP TABLE IF EXISTS `type_locale_province`;
CREATE TABLE `type_locale_province` (
  `province_id` int(5) NOT NULL AUTO_INCREMENT,
  `province_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `province_name_th` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `province_name_en` varchar(255) NOT NULL,
  `modified_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_locale_province
-- ----------------------------
INSERT INTO type_locale_province VALUES ('1', '10', 'กรุงเทพมหานคร   ', 'Bangkok', '2015-08-05 12:17:49');
INSERT INTO type_locale_province VALUES ('2', '11', 'สมุทรปราการ   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('3', '12', 'นนทบุรี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('4', '13', 'ปทุมธานี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('5', '14', 'พระนครศรีอยุธยา   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('6', '15', 'อ่างทอง   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('7', '16', 'ลพบุรี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('8', '17', 'สิงห์บุรี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('9', '18', 'ชัยนาท   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('10', '19', 'สระบุรี', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('11', '20', 'ชลบุรี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('12', '21', 'ระยอง   ', 'Rayong', '2015-08-05 12:18:03');
INSERT INTO type_locale_province VALUES ('13', '22', 'จันทบุรี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('14', '23', 'ตราด   ', 'Trat', '2015-08-05 12:18:06');
INSERT INTO type_locale_province VALUES ('15', '24', 'ฉะเชิงเทรา   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('16', '25', 'ปราจีนบุรี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('17', '26', 'นครนายก   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('18', '27', 'สระแก้ว   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('19', '30', 'นครราชสีมา   ', 'Nakhon Ratchasima', '2015-08-05 12:21:26');
INSERT INTO type_locale_province VALUES ('20', '31', 'บุรีรัมย์   ', 'Buri Ram', '2015-08-05 12:21:53');
INSERT INTO type_locale_province VALUES ('21', '32', 'สุรินทร์   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('22', '33', 'ศรีสะเกษ   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('23', '34', 'อุบลราชธานี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('24', '35', 'ยโสธร   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('25', '36', 'ชัยภูมิ   ', 'Chaiyaphum', '2015-08-05 12:21:17');
INSERT INTO type_locale_province VALUES ('26', '37', 'อำนาจเจริญ   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('27', '39', 'หนองบัวลำภู   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('28', '40', 'ขอนแก่น   ', 'Khon Kaen', '2015-08-05 12:21:04');
INSERT INTO type_locale_province VALUES ('29', '41', 'อุดรธานี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('30', '42', 'เลย   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('31', '43', 'หนองคาย   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('32', '44', 'มหาสารคาม   ', 'Maha Sarakham', '2015-08-05 12:22:02');
INSERT INTO type_locale_province VALUES ('33', '45', 'ร้อยเอ็ด   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('34', '46', 'กาฬสินธุ์   ', 'Kalasin', '2015-08-05 12:21:03');
INSERT INTO type_locale_province VALUES ('35', '47', 'สกลนคร   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('36', '48', 'นครพนม   ', 'Nakhon Phanom', '2015-08-05 12:21:18');
INSERT INTO type_locale_province VALUES ('37', '49', 'มุกดาหาร   ', 'Mukdahan', '2015-08-05 12:22:12');
INSERT INTO type_locale_province VALUES ('38', '50', 'เชียงใหม่   ', 'Chiang Mai', '2015-08-05 12:19:35');
INSERT INTO type_locale_province VALUES ('39', '51', 'ลำพูน   ', 'Lamphun', '2015-08-05 12:20:29');
INSERT INTO type_locale_province VALUES ('40', '52', 'ลำปาง   ', 'Lampang', '2015-08-05 12:20:36');
INSERT INTO type_locale_province VALUES ('41', '53', 'อุตรดิตถ์   ', 'Uttaradit', '2015-08-05 12:20:42');
INSERT INTO type_locale_province VALUES ('42', '54', 'แพร่   ', 'Phrae', '2015-08-05 12:19:58');
INSERT INTO type_locale_province VALUES ('43', '55', 'น่าน   ', 'Nan', '2015-08-05 12:19:46');
INSERT INTO type_locale_province VALUES ('44', '56', 'พะเยา   ', 'Phayao', '2015-08-05 12:19:51');
INSERT INTO type_locale_province VALUES ('45', '57', 'เชียงราย   ', 'Chiang Rai', '2015-08-05 12:19:34');
INSERT INTO type_locale_province VALUES ('46', '58', 'แม่ฮ่องสอน   ', 'Mae Hong Son', '2015-08-05 12:20:20');
INSERT INTO type_locale_province VALUES ('47', '60', 'นครสวรรค์   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('48', '61', 'อุทัยธานี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('49', '62', 'กำแพงเพชร   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('50', '63', 'ตาก   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('51', '64', 'สุโขทัย   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('52', '65', 'พิษณุโลก   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('53', '66', 'พิจิตร   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('54', '67', 'เพชรบูรณ์   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('55', '70', 'ราชบุรี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('56', '71', 'กาญจนบุรี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('57', '72', 'สุพรรณบุรี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('58', '73', 'นครปฐม   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('59', '74', 'สมุทรสาคร   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('60', '75', 'สมุทรสงคราม   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('61', '76', 'เพชรบุรี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('62', '77', 'ประจวบคีรีขันธ์   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('63', '80', 'นครศรีธรรมราช   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('64', '81', 'กระบี่   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('65', '82', 'พังงา   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('66', '83', 'ภูเก็ต   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('67', '84', 'สุราษฎร์ธานี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('68', '85', 'ระนอง   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('69', '86', 'ชุมพร   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('70', '90', 'สงขลา   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('71', '91', 'สตูล   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('72', '92', 'ตรัง   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('73', '93', 'พัทลุง   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('74', '94', 'ปัตตานี   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('75', '95', 'ยะลา   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('76', '96', 'นราธิวาส   ', '', '0000-00-00 00:00:00');
INSERT INTO type_locale_province VALUES ('77', '97', 'บึงกาฬ', 'Bueng Kan', '2015-08-05 12:21:38');

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
