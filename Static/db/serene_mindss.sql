-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 07, 2025 at 08:42 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `serene_mindss`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add logdata', 7, 'add_logdata'),
(26, 'Can change logdata', 7, 'change_logdata'),
(27, 'Can delete logdata', 7, 'delete_logdata'),
(28, 'Can view logdata', 7, 'view_logdata'),
(29, 'Can add user details', 8, 'add_userdetails'),
(30, 'Can change user details', 8, 'change_userdetails'),
(31, 'Can delete user details', 8, 'delete_userdetails'),
(32, 'Can view user details', 8, 'view_userdetails'),
(33, 'Can add medicine', 9, 'add_medicine'),
(34, 'Can change medicine', 9, 'change_medicine'),
(35, 'Can delete medicine', 9, 'delete_medicine'),
(36, 'Can view medicine', 9, 'view_medicine'),
(37, 'Can add reminder', 10, 'add_reminder'),
(38, 'Can change reminder', 10, 'change_reminder'),
(39, 'Can delete reminder', 10, 'delete_reminder'),
(40, 'Can view reminder', 10, 'view_reminder'),
(41, 'Can add kin', 11, 'add_kin'),
(42, 'Can change kin', 11, 'change_kin'),
(43, 'Can delete kin', 11, 'delete_kin'),
(44, 'Can view kin', 11, 'view_kin'),
(45, 'Can add unknown faces', 12, 'add_unknownfaces'),
(46, 'Can change unknown faces', 12, 'change_unknownfaces'),
(47, 'Can delete unknown faces', 12, 'delete_unknownfaces'),
(48, 'Can view unknown faces', 12, 'view_unknownfaces');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'SereneMindApp', 'kin'),
(7, 'SereneMindApp', 'logdata'),
(9, 'SereneMindApp', 'medicine'),
(10, 'SereneMindApp', 'reminder'),
(12, 'SereneMindApp', 'unknownfaces'),
(8, 'SereneMindApp', 'userdetails'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'SereneMindApp', '0001_initial', '2024-12-06 07:29:39.494750'),
(2, 'contenttypes', '0001_initial', '2024-12-06 07:29:39.602649'),
(3, 'auth', '0001_initial', '2024-12-06 07:29:41.523563'),
(4, 'admin', '0001_initial', '2024-12-06 07:29:42.103366'),
(5, 'admin', '0002_logentry_remove_auto_add', '2024-12-06 07:29:42.134615'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-06 07:29:42.206359'),
(7, 'contenttypes', '0002_remove_content_type_name', '2024-12-06 07:29:42.464380'),
(8, 'auth', '0002_alter_permission_name_max_length', '2024-12-06 07:29:42.634048'),
(9, 'auth', '0003_alter_user_email_max_length', '2024-12-06 07:29:42.676939'),
(10, 'auth', '0004_alter_user_username_opts', '2024-12-06 07:29:42.702150'),
(11, 'auth', '0005_alter_user_last_login_null', '2024-12-06 07:29:42.835073'),
(12, 'auth', '0006_require_contenttypes_0002', '2024-12-06 07:29:42.850696'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-12-06 07:29:42.873436'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-12-06 07:29:42.929917'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-12-06 07:29:42.982117'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-12-06 07:29:43.042562'),
(17, 'auth', '0011_update_proxy_permissions', '2024-12-06 07:29:43.064012'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-12-06 07:29:43.102065'),
(19, 'sessions', '0001_initial', '2024-12-06 07:29:43.218466'),
(20, 'SereneMindApp', '0002_remove_userdetails_address', '2024-12-06 09:58:29.748830'),
(21, 'SereneMindApp', '0003_medicine_reminder', '2024-12-06 11:01:07.731975'),
(22, 'SereneMindApp', '0004_alter_medicine_unique_together', '2024-12-12 05:57:38.795641'),
(23, 'SereneMindApp', '0005_alter_medicine_medicine', '2024-12-12 05:58:52.303371'),
(24, 'SereneMindApp', '0006_alter_medicine_medicine', '2024-12-12 06:00:33.922310'),
(25, 'SereneMindApp', '0007_alter_medicine_status_alter_reminder_status', '2024-12-12 07:42:29.378942'),
(26, 'SereneMindApp', '0008_remove_reminder_date', '2024-12-27 05:08:12.696116'),
(27, 'SereneMindApp', '0009_reminder_date', '2024-12-27 05:47:48.940802'),
(28, 'SereneMindApp', '0010_remove_reminder_date', '2024-12-27 05:51:46.404728'),
(29, 'SereneMindApp', '0011_kin_unknown_faces', '2025-04-07 10:55:42.564278'),
(30, 'SereneMindApp', '0012_auto_20250407_1625', '2025-04-07 10:55:42.595864');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1mm3tv03k0h27qkmagcmiktqt6ga8kef', 'eyJ1c2VybmFtZSI6ImphbmVAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIn0:1tR54w:W8KA_tY7iPGgWDynHfj4TCIKKfNQqLgV2Adn5N9oVSw', '2025-01-10 07:48:14.626749'),
('nhy1yl7e7xoyyq54dv4p3h83uigchst0', 'eyJ1c2VybmFtZSI6ImphbmVAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIn0:1u1k3t:bEkISd8chKD1PdjK_HF19PZsK_rcsZ_sxbSYoO9p-oA', '2025-04-21 10:50:41.739213'),
('u3jp3me6amcv0ugzobosc93iehqc1twj', 'eyJ1c2VybmFtZSI6ImphbmVAZ21haWwuY29tIiwidXR5cGUiOiJ1c2VyIn0:1tLez8:GeBx4hPyDV4R6nSGRrfMkSDIsxKWkGfGoY-JOcwrQMQ', '2024-12-26 08:55:50.172942');

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_kin`
--

DROP TABLE IF EXISTS `serenemindapp_kin`;
CREATE TABLE IF NOT EXISTS `serenemindapp_kin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_logdata`
--

DROP TABLE IF EXISTS `serenemindapp_logdata`;
CREATE TABLE IF NOT EXISTS `serenemindapp_logdata` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `utype` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_logdata`
--

INSERT INTO `serenemindapp_logdata` (`id`, `username`, `password`, `utype`) VALUES
(1, 'admin@gmail.com', 'admin', 'admin'),
(2, 'jane@gmail.com', 'jane', 'user'),
(3, 'brad@gmail.com', 'brad', 'user'),
(4, 'cate@gmail.com', 'cate', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_medicine`
--

DROP TABLE IF EXISTS `serenemindapp_medicine`;
CREATE TABLE IF NOT EXISTS `serenemindapp_medicine` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `medicine` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `time` time(6) NOT NULL,
  `dose` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `status` smallint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SereneMindApp_medicine_medicine_time_dose_user_id_72c9e2c6_uniq` (`medicine`,`time`,`dose`,`user_id`),
  KEY `SereneMindApp_medici_user_id_6f094e4b_fk_SereneMin` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_medicine`
--

INSERT INTO `serenemindapp_medicine` (`id`, `medicine`, `time`, `dose`, `status`, `user_id`) VALUES
(3, 'Ibuprufen', '11:55:00.000000', '40mg', 1, 1),
(8, 'Aspirin', '10:35:00.000000', '50mg', 0, 1),
(9, 'Aspirin', '11:35:00.000000', '10mg', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_reminder`
--

DROP TABLE IF EXISTS `serenemindapp_reminder`;
CREATE TABLE IF NOT EXISTS `serenemindapp_reminder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `topic` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `reminder` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `time` time(6) NOT NULL,
  `status` smallint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SereneMindApp_remind_user_id_6b7ce931_fk_SereneMin` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_reminder`
--

INSERT INTO `serenemindapp_reminder` (`id`, `topic`, `reminder`, `time`, `status`, `user_id`) VALUES
(1, 'Excercise', 'Mid day excercise for half an hour.', '13:49:00.000000', 1, 1),
(2, 'Test Reminder', 'Lorem Ipsum Dolor sit amet', '11:38:00.000000', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_unknownfaces`
--

DROP TABLE IF EXISTS `serenemindapp_unknownfaces`;
CREATE TABLE IF NOT EXISTS `serenemindapp_unknownfaces` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `serenemindapp_unknownfaces`
--

INSERT INTO `serenemindapp_unknownfaces` (`id`, `username`, `timestamp`, `image`) VALUES
(1, 'jane@gmail.com', '2025-04-07 20:07:57.803021', 'unknown_faces/unknown_20250408_013757.jpg'),
(2, 'jane@gmail.com', '2025-04-07 20:08:16.013465', 'unknown_faces/unknown_20250408_013815.jpg'),
(3, 'jane@gmail.com', '2025-04-07 20:08:19.002147', 'unknown_faces/unknown_20250408_013818.jpg'),
(4, 'jane@gmail.com', '2025-04-07 20:08:22.911711', 'unknown_faces/unknown_20250408_013822.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_userdetails`
--

DROP TABLE IF EXISTS `serenemindapp_userdetails`;
CREATE TABLE IF NOT EXISTS `serenemindapp_userdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `dob` date NOT NULL,
  `kin` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `relation` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_userdetails`
--

INSERT INTO `serenemindapp_userdetails` (`id`, `name`, `photo`, `dob`, `kin`, `relation`, `phone`, `username`) VALUES
(1, 'Jane Doe', 'Users/client1.jpg', '2002-12-06', 'John Smith', 'Son', '8552689743', 'jane@gmail.com'),
(2, 'Brad Miller', 'Users/client2.jpg', '2007-12-06', 'Kevin Miller', 'Brother', '8974829812', 'brad@gmail.com'),
(3, 'Cate', 'Users/author.jpg', '1995-04-27', 'Kevin Miller', 'Brother', '8974829812', 'cate@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `serenemindapp_medicine`
--
ALTER TABLE `serenemindapp_medicine`
  ADD CONSTRAINT `SereneMindApp_medici_user_id_6f094e4b_fk_SereneMin` FOREIGN KEY (`user_id`) REFERENCES `serenemindapp_userdetails` (`id`);

--
-- Constraints for table `serenemindapp_reminder`
--
ALTER TABLE `serenemindapp_reminder`
  ADD CONSTRAINT `SereneMindApp_remind_user_id_6b7ce931_fk_SereneMin` FOREIGN KEY (`user_id`) REFERENCES `serenemindapp_userdetails` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
