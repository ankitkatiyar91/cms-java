-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.20-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cms
CREATE DATABASE IF NOT EXISTS `cms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cms`;

-- Dumping structure for table cms.admin_message
DROP TABLE IF EXISTS `admin_message`;
CREATE TABLE IF NOT EXISTS `admin_message` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `messageType` varchar(255) NOT NULL,
  `_read` bit(1) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `FK_b1lrvwj5um6gnckmpywl43io3` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.admin_message: 0 rows
DELETE FROM `admin_message`;
/*!40000 ALTER TABLE `admin_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_message` ENABLE KEYS */;

-- Dumping structure for table cms.article
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `createdOn` datetime NOT NULL,
  `lastUpdated` datetime NOT NULL,
  `renderType` varchar(255) NOT NULL,
  `searchable` bit(1) NOT NULL,
  `status` varchar(255) NOT NULL,
  `title` longtext NOT NULL,
  `uuid_` varchar(255) NOT NULL,
  `version` double NOT NULL,
  `createdBy_user_id` bigint(20) DEFAULT NULL,
  `article_meta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `FK_i7mgcq02plw75g7ltcuo66a1n` (`createdBy_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cms.article: 1 rows
DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`article_id`, `content`, `createdOn`, `lastUpdated`, `renderType`, `searchable`, `status`, `title`, `uuid_`, `version`, `createdBy_user_id`, `article_meta`) VALUES
	(1, '<p>Welcome to the CMS home page!</p>\n\n<p>Yes Your installation is complete you can login to your admin panel and make changes to your content and enjoy.</p>\n\n<p>Go <a href="cpanel" target="_blank">Here</a></p>\n', '2018-02-03 23:24:41', '2018-02-03 23:26:15', 'NORMAL', b'1', 'PUBLISHED', 'Home', '47545763-9112-4998-a528-46f2c886db2c', 1, 1, NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

-- Dumping structure for table cms.article_external_references
DROP TABLE IF EXISTS `article_external_references`;
CREATE TABLE IF NOT EXISTS `article_external_references` (
  `article_article_id` bigint(20) NOT NULL,
  `externalReferences_reference_id` bigint(20) NOT NULL,
  PRIMARY KEY (`article_article_id`,`externalReferences_reference_id`),
  KEY `FK_j1neif7g5rjq3sjb0uum5f4rk` (`externalReferences_reference_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.article_external_references: 0 rows
DELETE FROM `article_external_references`;
/*!40000 ALTER TABLE `article_external_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_external_references` ENABLE KEYS */;

-- Dumping structure for table cms.article_referenced_article
DROP TABLE IF EXISTS `article_referenced_article`;
CREATE TABLE IF NOT EXISTS `article_referenced_article` (
  `article_article_id` bigint(20) NOT NULL,
  `references_article_id` bigint(20) NOT NULL,
  PRIMARY KEY (`article_article_id`,`references_article_id`),
  KEY `FK_it2nk4572ga71chr1vvsddff8` (`references_article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.article_referenced_article: 0 rows
DELETE FROM `article_referenced_article`;
/*!40000 ALTER TABLE `article_referenced_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_referenced_article` ENABLE KEYS */;

-- Dumping structure for table cms.article_roles
DROP TABLE IF EXISTS `article_roles`;
CREATE TABLE IF NOT EXISTS `article_roles` (
  `article_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`role_id`),
  KEY `FK_sckfoa66c7cpvmeqovielkh1m` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.article_roles: 0 rows
DELETE FROM `article_roles`;
/*!40000 ALTER TABLE `article_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_roles` ENABLE KEYS */;

-- Dumping structure for table cms.article_tags
DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE IF NOT EXISTS `article_tags` (
  `article_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `FK_8a307dpeku7biknifqwl73htk` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.article_tags: 0 rows
DELETE FROM `article_tags`;
/*!40000 ALTER TABLE `article_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_tags` ENABLE KEYS */;

-- Dumping structure for table cms.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `category_label` varchar(255) NOT NULL,
  `lastUpdated` datetime NOT NULL,
  `sequenceNo` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `FK_ku0b3idvxyus3geq75nq9mlt0` (`article_id`),
  KEY `FK_rmkhoik9l8fsbg1ocqycit3gd` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cms.category: 1 rows
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`, `created`, `category_label`, `lastUpdated`, `sequenceNo`, `status`, `article_id`, `menu_id`) VALUES
	(1, '2018-02-03 23:22:14', 'First Article', '2018-02-03 23:22:14', 1, 'PUBLISHED', NULL, 1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table cms.forum_answer
DROP TABLE IF EXISTS `forum_answer`;
CREATE TABLE IF NOT EXISTS `forum_answer` (
  `answer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `postedOn` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `FK_3s3ssq0y1bflayemvkvou8je1` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.forum_answer: 0 rows
DELETE FROM `forum_answer`;
/*!40000 ALTER TABLE `forum_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_answer` ENABLE KEYS */;

-- Dumping structure for table cms.forum_question
DROP TABLE IF EXISTS `forum_question`;
CREATE TABLE IF NOT EXISTS `forum_question` (
  `question_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `postedOn` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `FK_iy1gc4n0in0406p40etr3jipu` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.forum_question: 0 rows
DELETE FROM `forum_question`;
/*!40000 ALTER TABLE `forum_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_question` ENABLE KEYS */;

-- Dumping structure for table cms.forum_question_tag
DROP TABLE IF EXISTS `forum_question_tag`;
CREATE TABLE IF NOT EXISTS `forum_question_tag` (
  `question_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`question_id`,`tag_id`),
  KEY `FK_f4kpbneg1662pbfw68xpxirp4` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.forum_question_tag: 0 rows
DELETE FROM `forum_question_tag`;
/*!40000 ALTER TABLE `forum_question_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_question_tag` ENABLE KEYS */;

-- Dumping structure for table cms.imagefile
DROP TABLE IF EXISTS `imagefile`;
CREATE TABLE IF NOT EXISTS `imagefile` (
  `image_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longblob NOT NULL,
  `createdOn` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fileType` varchar(255) NOT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `thumb` longblob,
  `uuid_` varchar(255) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `createdBy_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FK_neyyi6che10euqujmxghsepuc` (`createdBy_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.imagefile: 0 rows
DELETE FROM `imagefile`;
/*!40000 ALTER TABLE `imagefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagefile` ENABLE KEYS */;

-- Dumping structure for table cms.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `label` varchar(255) NOT NULL,
  `lastUpdated` datetime NOT NULL,
  `sequenceNo` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `content_article_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `UK_2e3ppjy0en5ctaexw43u2fp4l` (`label`),
  KEY `FK_4kvwi83ft3cyfywwmj1cqjnsh` (`article_id`),
  KEY `FK_6lgwk1elnxe5csait1pj671h` (`content_article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cms.menu: 1 rows
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`menu_id`, `created`, `label`, `lastUpdated`, `sequenceNo`, `status`, `article_id`, `content_article_id`) VALUES
	(1, '2018-02-03 23:21:51', 'Home', '2018-02-03 23:21:51', 1, 'PUBLISHED', 1, NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table cms.menu_roles
DROP TABLE IF EXISTS `menu_roles`;
CREATE TABLE IF NOT EXISTS `menu_roles` (
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`,`role_id`),
  KEY `FK_c8rgc62enb5sispw8msepx3o7` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.menu_roles: 0 rows
DELETE FROM `menu_roles`;
/*!40000 ALTER TABLE `menu_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_roles` ENABLE KEYS */;

-- Dumping structure for table cms.permission
DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `UK_2ojme20jpga3r4r79tdso17gi` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table cms.permission: 11 rows
DELETE FROM `permission`;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`permission_id`, `name`) VALUES
	(1, 'cpanel:view'),
	(2, 'cpanel:view:roles'),
	(3, 'cpanel:list:roles'),
	(4, 'cpanel:user:add'),
	(5, 'cpanel:*'),
	(6, 'cpanel:user:list'),
	(7, 'cpanel:user:view'),
	(8, 'cpanel:user:status'),
	(9, 'cpanel:user:assignRole'),
	(10, 'cpanel:user:assignGroup'),
	(11, 'cpanel:user:*');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;

-- Dumping structure for table cms.reference
DROP TABLE IF EXISTS `reference`;
CREATE TABLE IF NOT EXISTS `reference` (
  `reference_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`reference_id`),
  UNIQUE KEY `UK_76j0hm7lmfq6ormn62bo99fh1` (`title`),
  UNIQUE KEY `UK_sgal6tu3aow1dbt8e245ej1u4` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.reference: 0 rows
DELETE FROM `reference`;
/*!40000 ALTER TABLE `reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference` ENABLE KEYS */;

-- Dumping structure for table cms.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `modifiable` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdBy_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`),
  KEY `FK_n6wfa353sekm5lqhno3t23jhu` (`createdBy_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cms.role: 1 rows
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`, `modifiable`, `name`, `createdBy_user_id`) VALUES
	(1, b'1', 'Users', 1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table cms.role_permissions
DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE IF NOT EXISTS `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FK_qfkbccnh2c5o4tc7akq5x11wv` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.role_permissions: 0 rows
DELETE FROM `role_permissions`;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;

-- Dumping structure for table cms.subcategory
DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `subcategory_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `subcategory_label` varchar(255) NOT NULL,
  `lastUpdated` datetime NOT NULL,
  `sequenceNo` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `FK_i4d32ix1cxuyb1avqgh3yycdg` (`article_id`),
  KEY `FK_dglte9qeu8l5fhggto4loyegg` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cms.subcategory: 1 rows
DELETE FROM `subcategory`;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` (`subcategory_id`, `created`, `subcategory_label`, `lastUpdated`, `sequenceNo`, `status`, `article_id`, `category_id`) VALUES
	(1, '2018-02-03 23:22:36', 'Article 2', '2018-02-03 23:22:36', 1, 'PUBLISHED', NULL, 1);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;

-- Dumping structure for table cms.tag
DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `UK_1wdpsed5kna2y38hnbgrnhi5b` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.tag: 0 rows
DELETE FROM `tag`;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- Dumping structure for table cms.usergroup
DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE IF NOT EXISTS `usergroup` (
  `group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comments` longtext,
  `name` varchar(255) NOT NULL,
  `createdBy_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `UK_5y5j21fk5xr30i9xybr7hkf1r` (`name`),
  KEY `FK_89ay9biqy40jip5uvfwjuvfq6` (`createdBy_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cms.usergroup: 1 rows
DELETE FROM `usergroup`;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` (`group_id`, `comments`, `name`, `createdBy_user_id`) VALUES
	(1, 'User who are just registered', 'Registered', 1);
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;

-- Dumping structure for table cms.usergroup_role
DROP TABLE IF EXISTS `usergroup_role`;
CREATE TABLE IF NOT EXISTS `usergroup_role` (
  `usergroup_group_id` bigint(20) NOT NULL,
  `roles_role_id` int(11) NOT NULL,
  PRIMARY KEY (`usergroup_group_id`,`roles_role_id`),
  KEY `FK_ewwn6fdcd5m634wckmi3l2sck` (`roles_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.usergroup_role: 1 rows
DELETE FROM `usergroup_role`;
/*!40000 ALTER TABLE `usergroup_role` DISABLE KEYS */;
INSERT INTO `usergroup_role` (`usergroup_group_id`, `roles_role_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `usergroup_role` ENABLE KEYS */;

-- Dumping structure for table cms.user_
DROP TABLE IF EXISTS `user_`;
CREATE TABLE IF NOT EXISTS `user_` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `admin` bit(1) NOT NULL,
  `agreedToTermsOfUse` bit(1) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `contactNo` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `emailAddressVerified` bit(1) NOT NULL,
  `facebookId` varchar(255) DEFAULT NULL,
  `failedLoginAttempts` int(11) DEFAULT NULL,
  `firstName` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `jobTitle` varchar(255) DEFAULT NULL,
  `lastFailedLoginDate` datetime DEFAULT NULL,
  `lastName` varchar(255) NOT NULL,
  `lastUpdated` datetime NOT NULL,
  `loginDate` datetime DEFAULT NULL,
  `loginIP` varchar(150) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `mobileNo` varchar(255) DEFAULT NULL,
  `password_` varchar(255) NOT NULL,
  `passwordEncrypted` bit(1) NOT NULL,
  `passwordModifiedDate` datetime DEFAULT NULL,
  `reminderQueryAnswer` varchar(255) DEFAULT NULL,
  `reminderQueryQuestion` varchar(255) DEFAULT NULL,
  `screenName` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_ha67cvlhy4nk1prswl5gj1y0y` (`email`),
  UNIQUE KEY `UK_q1sdxrqyk0i3sw35q3m92sx3m` (`email`),
  UNIQUE KEY `UK_t3h04ots9umgd527ler2vsnup` (`screenName`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table cms.user_: 1 rows
DELETE FROM `user_`;
/*!40000 ALTER TABLE `user_` DISABLE KEYS */;
INSERT INTO `user_` (`user_id`, `active`, `admin`, `agreedToTermsOfUse`, `city`, `contactNo`, `country`, `created`, `dob`, `email`, `emailAddressVerified`, `facebookId`, `failedLoginAttempts`, `firstName`, `gender`, `jobTitle`, `lastFailedLoginDate`, `lastName`, `lastUpdated`, `loginDate`, `loginIP`, `middleName`, `mobileNo`, `password_`, `passwordEncrypted`, `passwordModifiedDate`, `reminderQueryAnswer`, `reminderQueryQuestion`, `screenName`, `street`) VALUES
	(1, b'1', b'1', b'1', NULL, NULL, NULL, '2014-06-05 00:00:00', '2014-06-01', 'admin@cms.com', b'1', 'ankitkatiyar91', 0, 'Ankit', 'MALE', NULL, '2018-02-04 00:42:23', 'Katiyar', '2018-02-04 00:42:28', '2018-02-04 00:42:28', '0:0:0:0:0:0:0:1', NULL, NULL, 'admin', b'0', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `user_` ENABLE KEYS */;

-- Dumping structure for table cms.user_group
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE IF NOT EXISTS `user_group` (
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `FK_789v3ejjs9uj5vu1ufexj2tbv` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.user_group: 0 rows
DELETE FROM `user_group`;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;

-- Dumping structure for table cms.user_roles
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_5q4rc4fh1on6567qk69uesvyf` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table cms.user_roles: 0 rows
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
