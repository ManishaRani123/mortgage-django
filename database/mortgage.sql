-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2021 at 01:30 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mortgage`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_property`
--

CREATE TABLE `app_property` (
  `id` int(11) NOT NULL,
  `propertyName` varchar(200) NOT NULL,
  `propertyType` varchar(30) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `contactNo` varchar(25) NOT NULL,
  `streetAddress` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(150) NOT NULL,
  `price` int(11) NOT NULL,
  `priceOption` varchar(200) NOT NULL,
  `useOptions` varchar(40) NOT NULL,
  `additionalInfo` longtext,
  `landAreaApprox` int(11) NOT NULL,
  `floorAreaApprox` int(11) NOT NULL,
  `noOfBedrooms` int(11) NOT NULL,
  `noOfKitchen` int(11) NOT NULL,
  `noOfHall` int(11) NOT NULL,
  `noOfBathrooms` int(11) NOT NULL,
  `parking` int(11) NOT NULL,
  `amenities` longtext,
  `description` longtext,
  `addedOn` datetime(6) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `isFeatured` tinyint(1) NOT NULL,
  `propertyImage` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_property`
--

INSERT INTO `app_property` (`id`, `propertyName`, `propertyType`, `email`, `contactNo`, `streetAddress`, `city`, `state`, `price`, `priceOption`, `useOptions`, `additionalInfo`, `landAreaApprox`, `floorAreaApprox`, `noOfBedrooms`, `noOfKitchen`, `noOfHall`, `noOfBathrooms`, `parking`, `amenities`, `description`, `addedOn`, `isActive`, `isFeatured`, `propertyImage`, `slug`) VALUES
(1, 'Flat on Sale in NSW', 'Flat', 'itsmeasmitapandey@gmail.com', '56789', '12 Hallfinton', 'Fairfield', 'AU-NSW', 2190, 'Contract', 'Sell', 'aaaaaaaaaaaaaa', 330, 110, 6, 2, 2, 4, 1, 'aaaaaaaaaaaaa', 'FULLY FURNISHED APARTMENT WITH PARKING AVAILABLE IN ARTARMON\n\nThis tuscan style apartment is fully furnished, with off street parking and ideally positioned just a 30 second walk from Artarmon Train Station.\n\nSingles/Couples rate: $395/$450\n\nThe rental rate includes:\n? Unlimited WIFI\n? Electricity\n? Fully furnished house and equipped kitchen\n\nPlease get in touch to view!\n\nSorry, no pets allowed ?', '2021-09-10 03:20:24.869971', 1, 1, 'images/model-jumping-extended-2000.jpg', 'flat-on-sale-in-nsw-australia'),
(2, 'Office Space on Lease', 'OfficeSpace', 'anishpandey@gmail.com', '456789', 'Phulbari Ramhiti, Boudha', 'Kathmandu', 'AU-QLD', 12345, 'Fixed Term Contract', 'Lease', 'aaaaaaaaaaaaaaa', 550, 5, 5, 5, 5, 5, 5, '55555555555', 'FULLY FURNISHED APARTMENT WITH PARKING AVAILABLE IN ARTARMON\r\n\r\nThis tuscan style apartment is fully furnished, with off street parking and ideally positioned just a 30 second walk from Artarmon Train Station.\r\n\r\nSingles/Couples rate: $395/$450\r\n\r\nThe rental rate includes:\r\n? Unlimited WIFI\r\n? Electricity\r\n? Fully furnished house and equipped kitchen\r\n\r\nPlease get in touch to view!\r\n\r\nSorry, no pets allowed ?', '2021-09-10 03:34:23.826003', 1, 1, 'images/lacuna-venture-website-design.JPG', 'office-space-on-lease'),
(3, 'Fully furnished Flat for Business Purpose', 'OfficeSpace', 'itsmeasmitapandey@gmail.com', '4567890678', 'Phulbari Ramhiti, Boudha', 'Kathmandu', 'AU-TAS', 2190, 'Yearly Payment', 'Rent', '', 8000, 2000, 8, 2, 4, -25, 1, '', 'FULLY FURNISHED APARTMENT WITH PARKING AVAILABLE IN ARTARMON  This tuscan style apartment is fully furnished, with off street parking and ideally positioned just a 30 second walk from Artarmon Train Station.  Singles/Couples rate: $395/$450  The rental rate includes: ? Unlimited WIFI ? Electricity ? Fully furnished house and equipped kitchen  Please get in touch to view!  Sorry, no pets allowed ?', '2021-09-10 05:40:05.339740', 1, 1, 'images/Capture_6qxuVnl.JPG', 'fully-furnished-flat-for-business-purpose');

-- --------------------------------------------------------

--
-- Table structure for table `app_request`
--

CREATE TABLE `app_request` (
  `id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `contactNo` varchar(30) NOT NULL,
  `urgency` varchar(40) NOT NULL,
  `additionalInfo` longtext,
  `requestOn` datetime(6) NOT NULL,
  `seenStatus` tinyint(1) NOT NULL,
  `action_status` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_request`
--

INSERT INTO `app_request` (`id`, `full_name`, `age`, `email`, `contactNo`, `urgency`, `additionalInfo`, `requestOn`, `seenStatus`, `action_status`, `user_id`) VALUES
(1, 'Nishan Kumar Aryal', 30, 'aryalnishan@gmail.com', '9849845061', 'Urgent', '', '2021-09-12 14:55:29.269067', 1, 'Approved', 5),
(2, 'Nishan Kumar Aryal', 30, 'aryalnishan@gmail.com', '9849845061', 'Urgent', '', '2021-09-12 14:55:42.744081', 1, 'Approved', 3);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(25, 'Can add request bed', 7, 'add_requestbed'),
(26, 'Can change request bed', 7, 'change_requestbed'),
(27, 'Can delete request bed', 7, 'delete_requestbed'),
(28, 'Can view request bed', 7, 'view_requestbed'),
(29, 'Can add donate plasma', 8, 'add_donateplasma'),
(30, 'Can change donate plasma', 8, 'change_donateplasma'),
(31, 'Can delete donate plasma', 8, 'delete_donateplasma'),
(32, 'Can view donate plasma', 8, 'view_donateplasma'),
(33, 'Can add other request', 9, 'add_otherrequest'),
(34, 'Can change other request', 9, 'change_otherrequest'),
(35, 'Can delete other request', 9, 'delete_otherrequest'),
(36, 'Can view other request', 9, 'view_otherrequest'),
(37, 'Can add property', 10, 'add_property'),
(38, 'Can change property', 10, 'change_property'),
(39, 'Can delete property', 10, 'delete_property'),
(40, 'Can view property', 10, 'view_property'),
(41, 'Can add listing', 10, 'add_listing'),
(42, 'Can change listing', 10, 'change_listing'),
(43, 'Can delete listing', 10, 'delete_listing'),
(44, 'Can view listing', 10, 'view_listing'),
(45, 'Can add property', 11, 'add_property'),
(46, 'Can change property', 11, 'change_property'),
(47, 'Can delete property', 11, 'delete_property'),
(48, 'Can view property', 11, 'view_property'),
(49, 'Can add listings', 10, 'add_listings'),
(50, 'Can change listings', 10, 'change_listings'),
(51, 'Can delete listings', 10, 'delete_listings'),
(52, 'Can view listings', 10, 'view_listings'),
(53, 'Can add PayPal IPN', 12, 'add_paypalipn'),
(54, 'Can change PayPal IPN', 12, 'change_paypalipn'),
(55, 'Can delete PayPal IPN', 12, 'delete_paypalipn'),
(56, 'Can view PayPal IPN', 12, 'view_paypalipn'),
(57, 'Can add customers', 14, 'add_customers'),
(58, 'Can change customers', 14, 'change_customers'),
(59, 'Can delete customers', 14, 'delete_customers'),
(60, 'Can view customers', 14, 'view_customers'),
(61, 'Can add orders', 15, 'add_orders'),
(62, 'Can change orders', 15, 'change_orders'),
(63, 'Can delete orders', 15, 'delete_orders'),
(64, 'Can view orders', 15, 'view_orders'),
(65, 'Can add request', 13, 'add_request'),
(66, 'Can change request', 13, 'change_request'),
(67, 'Can delete request', 13, 'delete_request'),
(68, 'Can view request', 13, 'view_request');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$IyPBvAOjlJoH$zouSA3xJABb5J6/Sx9P+OwrXpivvodGJZdWFp9OKW44=', '2021-09-12 03:04:25.724837', 1, 'admin', '', '', 'itsmeasmitapandey@gmail.com', 1, 1, '2021-09-09 00:42:01.733011'),
(2, 'pbkdf2_sha256$150000$Gg0WRA3nvHiw$Y60oBxEfeESdnXYRTHxyel0lhl4AWHN90wLniwIvueM=', '2021-09-11 07:13:22.337826', 0, 'asmitapandey', '', '', 'itsmeasmitapandey@gmail.com', 0, 1, '2021-09-11 06:17:34.133674'),
(3, 'pbkdf2_sha256$150000$CWObER6qlEWk$vfyBhHqsoeWAEiBPnjX+EckJPDKISVyiCwaMfdmBb/Y=', NULL, 0, 'aryanamrit', 'Amrit', 'Aryal', 'rnamrit.kr@gmail.com', 0, 1, '2021-09-11 06:26:06.222456'),
(5, 'pbkdf2_sha256$150000$aYvFKeMHSfxy$bnprVzEGBjn2IDXYyqlR7LiZ3OZTaBMObInEhXT8+WA=', NULL, 0, 'aryalnishan', 'Nishan', 'Aryal', 'aryalnishan@outlook.com', 0, 1, '2021-09-11 06:58:46.781440');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `covid19_donateplasma`
--

CREATE TABLE `covid19_donateplasma` (
  `id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `contactNo` varchar(20) NOT NULL,
  `streetAddress` varchar(200) NOT NULL,
  `city` varchar(300) NOT NULL,
  `state` varchar(50) NOT NULL,
  `additionalInfo` longtext,
  `requestOn` datetime(6) NOT NULL,
  `seenStatus` tinyint(1) NOT NULL,
  `donor_option` varchar(100) NOT NULL,
  `action_status` varchar(200) NOT NULL,
  `email` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `covid19_otherrequest`
--

CREATE TABLE `covid19_otherrequest` (
  `id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `contactNo` varchar(30) NOT NULL,
  `streetAddress` varchar(200) NOT NULL,
  `city` varchar(300) NOT NULL,
  `state` varchar(50) NOT NULL,
  `requestType` varchar(100) NOT NULL,
  `additionalInfo` longtext,
  `requestOn` datetime(6) NOT NULL,
  `seenStatus` tinyint(1) NOT NULL,
  `action_status` varchar(200) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `urgency` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `covid19_requestbed`
--

CREATE TABLE `covid19_requestbed` (
  `id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `contactNo` varchar(25) NOT NULL,
  `streetAddress` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(150) NOT NULL,
  `bedsQty` int(11) NOT NULL,
  `urgency` varchar(40) NOT NULL,
  `additionalInfo` longtext,
  `o_name` varchar(200) DEFAULT NULL,
  `o_contactNo` varchar(30) DEFAULT NULL,
  `o_address` varchar(200) DEFAULT NULL,
  `o_relation` varchar(100) DEFAULT NULL,
  `requestOn` datetime(6) NOT NULL,
  `seenStatus` tinyint(1) NOT NULL,
  `bedType` varchar(30) NOT NULL,
  `action_status` varchar(200) NOT NULL,
  `email` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-09-09 02:30:56.493554', '1', 'Listing object (1)', 1, '[{\"added\": {}}]', 10, 1),
(2, '2021-09-09 02:31:19.314427', '1', 'Listing object (1)', 2, '[{\"changed\": {\"fields\": [\"priceOption\"]}}]', 10, 1),
(3, '2021-09-10 03:20:24.886970', '1', 'Property object (1)', 1, '[{\"added\": {}}]', 11, 1),
(4, '2021-09-10 03:34:23.828341', '2', 'Property object (2)', 1, '[{\"added\": {}}]', 11, 1),
(5, '2021-09-10 03:45:11.368664', '2', 'Property object (2)', 2, '[]', 11, 1),
(6, '2021-09-10 05:40:05.344739', '3', 'Property object (3)', 1, '[{\"added\": {}}]', 11, 1),
(7, '2021-09-10 14:12:05.513254', '1', 'Property object (1)', 2, '[{\"changed\": {\"fields\": [\"propertyName\", \"streetAddress\", \"city\"]}}]', 11, 1),
(8, '2021-09-10 14:54:33.939696', '3', 'Property object (3)', 2, '[{\"changed\": {\"fields\": [\"propertyImage\"]}}]', 11, 1),
(9, '2021-09-10 14:54:33.944700', '3', 'Property object (3)', 2, '[{\"changed\": {\"fields\": [\"propertyImage\"]}}]', 11, 1),
(10, '2021-09-10 15:32:23.119156', '1', 'Property object (1)', 2, '[{\"changed\": {\"fields\": [\"propertyImage\"]}}]', 11, 1),
(11, '2021-09-11 03:21:03.286935', '3', 'Property object (3)', 2, '[{\"changed\": {\"fields\": [\"slug\"]}}]', 11, 1),
(12, '2021-09-11 03:34:06.769052', '1', 'Property object (1)', 2, '[{\"changed\": {\"fields\": [\"slug\"]}}]', 11, 1),
(13, '2021-09-11 03:34:29.810707', '2', 'Property object (2)', 2, '[{\"changed\": {\"fields\": [\"slug\"]}}]', 11, 1),
(14, '2021-09-11 03:34:49.990231', '2', 'Property object (2)', 2, '[{\"changed\": {\"fields\": [\"propertyImage\"]}}]', 11, 1),
(15, '2021-09-11 06:06:29.443841', '3', 'Property object (3)', 2, '[{\"changed\": {\"fields\": [\"propertyType\", \"useOptions\"]}}]', 11, 1),
(16, '2021-09-11 06:06:42.021875', '2', 'Property object (2)', 2, '[{\"changed\": {\"fields\": [\"propertyType\", \"description\"]}}]', 11, 1),
(17, '2021-09-12 14:55:29.297085', '1', 'Request object (1)', 1, '[{\"added\": {}}]', 13, 1),
(18, '2021-09-12 14:55:42.745080', '2', 'Request object (2)', 1, '[{\"added\": {}}]', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(14, 'app', 'customers'),
(15, 'app', 'orders'),
(11, 'app', 'property'),
(13, 'app', 'request'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'covid19', 'donateplasma'),
(9, 'covid19', 'otherrequest'),
(7, 'covid19', 'requestbed'),
(12, 'ipn', 'paypalipn'),
(10, 'property', 'listings'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-09-09 00:40:44.880946'),
(2, 'auth', '0001_initial', '2021-09-09 00:40:44.898944'),
(3, 'admin', '0001_initial', '2021-09-09 00:40:44.914942'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-09-09 00:40:44.925946'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-09 00:40:44.935943'),
(6, 'app', '0001_initial', '2021-09-09 00:40:44.946944'),
(7, 'app', '0002_auto_20210507_1213', '2021-09-09 00:40:45.275905'),
(8, 'contenttypes', '0002_remove_content_type_name', '2021-09-09 00:40:45.395711'),
(9, 'auth', '0002_alter_permission_name_max_length', '2021-09-09 00:40:45.489306'),
(10, 'auth', '0003_alter_user_email_max_length', '2021-09-09 00:40:45.577975'),
(11, 'auth', '0004_alter_user_username_opts', '2021-09-09 00:40:45.587978'),
(12, 'auth', '0005_alter_user_last_login_null', '2021-09-09 00:40:45.648976'),
(13, 'auth', '0006_require_contenttypes_0002', '2021-09-09 00:40:45.656977'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2021-09-09 00:40:45.667975'),
(15, 'auth', '0008_alter_user_username_max_length', '2021-09-09 00:40:45.747979'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2021-09-09 00:40:45.810978'),
(17, 'auth', '0010_alter_group_name_max_length', '2021-09-09 00:40:45.873981'),
(18, 'auth', '0011_update_proxy_permissions', '2021-09-09 00:40:45.884911'),
(19, 'covid19', '0001_initial', '2021-09-09 00:40:45.945093'),
(20, 'covid19', '0002_auto_20210507_1348', '2021-09-09 00:40:46.442692'),
(21, 'covid19', '0003_auto_20210507_1414', '2021-09-09 00:40:46.777020'),
(22, 'covid19', '0004_requestbed_bedtype', '2021-09-09 00:40:46.830021'),
(23, 'covid19', '0005_auto_20210507_2305', '2021-09-09 00:40:46.904018'),
(24, 'covid19', '0006_auto_20210508_1111', '2021-09-09 00:40:47.121982'),
(25, 'covid19', '0007_auto_20210508_1203', '2021-09-09 00:40:47.187978'),
(26, 'covid19', '0008_donateplasma', '2021-09-09 00:40:47.234977'),
(27, 'covid19', '0009_auto_20210508_1536', '2021-09-09 00:40:47.405977'),
(28, 'covid19', '0010_auto_20210508_2006', '2021-09-09 00:40:48.242679'),
(29, 'covid19', '0011_auto_20210508_2027', '2021-09-09 00:40:48.298902'),
(30, 'covid19', '0012_otherrequest', '2021-09-09 00:40:48.336334'),
(31, 'covid19', '0013_auto_20210513_1805', '2021-09-09 00:40:48.426386'),
(32, 'covid19', '0014_auto_20210513_1834', '2021-09-09 00:40:48.508124'),
(33, 'covid19', '0015_auto_20210513_2128', '2021-09-09 00:40:48.815765'),
(34, 'covid19', '0016_auto_20210514_0004', '2021-09-09 00:40:48.870035'),
(35, 'covid19', '0017_auto_20210905_1623', '2021-09-09 00:40:48.877045'),
(36, 'sessions', '0001_initial', '2021-09-09 00:40:48.915627'),
(37, 'property', '0001_initial', '2021-09-09 02:20:00.758584'),
(38, 'property', '0002_auto_20210909_0811', '2021-09-09 02:26:16.049028'),
(39, 'app', '0003_property', '2021-09-09 05:32:25.122681'),
(40, 'property', '0003_auto_20210909_1117', '2021-09-09 05:32:25.375495'),
(41, 'app', '0004_auto_20210910_2036', '2021-09-10 14:51:28.478115'),
(42, 'ipn', '0001_initial', '2021-09-10 16:49:28.045787'),
(43, 'ipn', '0002_paypalipn_mp_id', '2021-09-10 16:49:28.148789'),
(44, 'ipn', '0003_auto_20141117_1647', '2021-09-10 16:49:28.312789'),
(45, 'ipn', '0004_auto_20150612_1826', '2021-09-10 16:49:30.852217'),
(46, 'ipn', '0005_auto_20151217_0948', '2021-09-10 16:49:31.028285'),
(47, 'ipn', '0006_auto_20160108_1112', '2021-09-10 16:49:31.187003'),
(48, 'ipn', '0007_auto_20160219_1135', '2021-09-10 16:49:31.215160'),
(49, 'ipn', '0008_auto_20181128_1032', '2021-09-10 16:49:31.256157'),
(50, 'app', '0005_property_slug', '2021-09-11 02:55:22.194176'),
(51, 'app', '0002_auto_20210911_2003', '2021-09-11 14:19:00.991801'),
(52, 'app', '0003_customers_orders_request', '2021-09-12 03:21:09.953364');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('g6tivhs004kbuoehb8o9xejxuus7i0av', 'MDhhOTFlNDNkZTMyNWRiOGY1OWY0MzhlZGI3ODZkOTJmMjIxYzU2Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOTVhMzBjN2NhMTM5NjBjOGE3YjA3MjI3Yjc5OGEwOTNlZDdhODUzIn0=', '2021-09-26 03:04:25.740795');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn`
--

CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_property`
--
ALTER TABLE `app_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_property_slug_2fe2ba18` (`slug`);

--
-- Indexes for table `app_request`
--
ALTER TABLE `app_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_request_user_id_c2fa2736_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `covid19_donateplasma`
--
ALTER TABLE `covid19_donateplasma`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `covid19_otherrequest`
--
ALTER TABLE `covid19_otherrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `covid19_requestbed`
--
ALTER TABLE `covid19_requestbed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_property`
--
ALTER TABLE `app_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `app_request`
--
ALTER TABLE `app_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `covid19_donateplasma`
--
ALTER TABLE `covid19_donateplasma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `covid19_otherrequest`
--
ALTER TABLE `covid19_otherrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `covid19_requestbed`
--
ALTER TABLE `covid19_requestbed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_request`
--
ALTER TABLE `app_request`
  ADD CONSTRAINT `app_request_user_id_c2fa2736_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
