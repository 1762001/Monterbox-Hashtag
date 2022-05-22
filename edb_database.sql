-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2022 at 06:39 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edb_database`
--

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
(1, 'Can add category', 1, 'add_category'),
(2, 'Can change category', 1, 'change_category'),
(3, 'Can delete category', 1, 'delete_category'),
(4, 'Can view category', 1, 'view_category'),
(5, 'Can add game', 2, 'add_game'),
(6, 'Can change game', 2, 'change_game'),
(7, 'Can delete game', 2, 'delete_game'),
(8, 'Can view game', 2, 'view_game'),
(9, 'Can add order', 3, 'add_order'),
(10, 'Can change order', 3, 'change_order'),
(11, 'Can delete order', 3, 'delete_order'),
(12, 'Can view order', 3, 'view_order'),
(13, 'Can add team', 4, 'add_team'),
(14, 'Can change team', 4, 'change_team'),
(15, 'Can delete team', 4, 'delete_team'),
(16, 'Can view team', 4, 'view_team'),
(17, 'Can add users', 5, 'add_users'),
(18, 'Can change users', 5, 'change_users'),
(19, 'Can delete users', 5, 'delete_users'),
(20, 'Can view users', 5, 'view_users'),
(21, 'Can add tournament', 6, 'add_tournament'),
(22, 'Can change tournament', 6, 'change_tournament'),
(23, 'Can delete tournament', 6, 'delete_tournament'),
(24, 'Can view tournament', 6, 'view_tournament'),
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product'),
(29, 'Can add player', 8, 'add_player'),
(30, 'Can change player', 8, 'change_player'),
(31, 'Can delete player', 8, 'delete_player'),
(32, 'Can view player', 8, 'view_player'),
(33, 'Can add payment', 9, 'add_payment'),
(34, 'Can change payment', 9, 'change_payment'),
(35, 'Can delete payment', 9, 'delete_payment'),
(36, 'Can view payment', 9, 'view_payment'),
(37, 'Can add feedback', 10, 'add_feedback'),
(38, 'Can change feedback', 10, 'change_feedback'),
(39, 'Can delete feedback', 10, 'delete_feedback'),
(40, 'Can view feedback', 10, 'view_feedback'),
(41, 'Can add log entry', 11, 'add_logentry'),
(42, 'Can change log entry', 11, 'change_logentry'),
(43, 'Can delete log entry', 11, 'delete_logentry'),
(44, 'Can view log entry', 11, 'view_logentry'),
(45, 'Can add permission', 12, 'add_permission'),
(46, 'Can change permission', 12, 'change_permission'),
(47, 'Can delete permission', 12, 'delete_permission'),
(48, 'Can view permission', 12, 'view_permission'),
(49, 'Can add group', 13, 'add_group'),
(50, 'Can change group', 13, 'change_group'),
(51, 'Can delete group', 13, 'delete_group'),
(52, 'Can view group', 13, 'view_group'),
(53, 'Can add user', 14, 'add_user'),
(54, 'Can change user', 14, 'change_user'),
(55, 'Can delete user', 14, 'delete_user'),
(56, 'Can view user', 14, 'view_user'),
(57, 'Can add content type', 15, 'add_contenttype'),
(58, 'Can change content type', 15, 'change_contenttype'),
(59, 'Can delete content type', 15, 'delete_contenttype'),
(60, 'Can view content type', 15, 'view_contenttype'),
(61, 'Can add session', 16, 'add_session'),
(62, 'Can change session', 16, 'change_session'),
(63, 'Can delete session', 16, 'delete_session'),
(64, 'Can view session', 16, 'view_session');

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
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `product_id`, `quantity`, `price`, `user_id`, `added_date`) VALUES
(4, 13, 1, 9499, 10, '2022-02-19');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_image` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`c_id`, `c_name`, `c_image`) VALUES
(17, 'Gaming Keyboards', 'gaming_keyboard.jpg'),
(18, 'Gaming Mouse', 'gaming_mouse.jpeg'),
(19, 'Mouse Pad', 'mouse_pad.jpg'),
(20, 'Gaming Headphones', 'gaming_headphones.jpg'),
(21, 'Gaming Chair', 'gaming_chair.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(30) NOT NULL,
  `contact_email` varchar(200) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`contact_id`, `contact_name`, `contact_email`, `subject`, `message`) VALUES
(1, 'aka_bijli', 'er.sireen@gmail.com', 'Tournament', 'Please Specify About Point Distribution'),
(2, 'shroud', 'shroudyy@gmail.com', 'Edit Profile', 'I coudn\'t change my Profile'),
(3, 'Anita Rogers', 'anita.rogers@gmaill.com', 'Tournament', 'Here for your Website Appreciation, Keep the good Work Going on');

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
(11, 'admin', 'logentry'),
(1, 'admin_page', 'category'),
(10, 'admin_page', 'feedback'),
(2, 'admin_page', 'game'),
(3, 'admin_page', 'order'),
(9, 'admin_page', 'payment'),
(8, 'admin_page', 'player'),
(7, 'admin_page', 'product'),
(4, 'admin_page', 'team'),
(6, 'admin_page', 'tournament'),
(5, 'admin_page', 'users'),
(13, 'auth', 'group'),
(12, 'auth', 'permission'),
(14, 'auth', 'user'),
(15, 'contenttypes', 'contenttype'),
(16, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2019-12-08 03:09:19.836657'),
(2, 'auth', '0001_initial', '2019-12-08 03:09:21.512319'),
(3, 'admin', '0001_initial', '2019-12-08 03:09:32.019795'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-12-08 03:09:33.920166'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-12-08 03:09:34.071244'),
(6, 'admin_page', '0001_initial', '2019-12-08 03:09:39.801066'),
(7, 'contenttypes', '0002_remove_content_type_name', '2019-12-08 03:09:55.636413'),
(8, 'auth', '0002_alter_permission_name_max_length', '2019-12-08 03:09:56.919292'),
(9, 'auth', '0003_alter_user_email_max_length', '2019-12-08 03:09:58.565131'),
(10, 'auth', '0004_alter_user_username_opts', '2019-12-08 03:09:58.655614'),
(11, 'auth', '0005_alter_user_last_login_null', '2019-12-08 03:10:00.205262'),
(12, 'auth', '0006_require_contenttypes_0002', '2019-12-08 03:10:00.309893'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2019-12-08 03:10:00.410127'),
(14, 'auth', '0008_alter_user_username_max_length', '2019-12-08 03:10:01.307869'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2019-12-08 03:10:02.510121'),
(16, 'auth', '0010_alter_group_name_max_length', '2019-12-08 03:10:03.750674'),
(17, 'auth', '0011_update_proxy_permissions', '2019-12-08 03:10:03.862626'),
(18, 'sessions', '0001_initial', '2019-12-08 03:10:04.161297'),
(19, 'admin_page', '0002_auto_20191208_1200', '2019-12-08 06:30:08.940233'),
(20, 'admin_page', '0003_auto_20191208_1214', '2019-12-08 06:44:06.283471'),
(21, 'admin_page', '0004_auto_20191208_1610', '2019-12-08 10:40:27.871242'),
(22, 'admin_page', '0005_auto_20191208_1612', '2019-12-08 10:42:26.310309'),
(23, 'admin_page', '0006_auto_20191208_1616', '2019-12-08 10:46:28.403695'),
(24, 'admin_page', '0007_auto_20191212_1829', '2019-12-12 12:59:38.222665'),
(25, 'admin_page', '0008_auto_20191214_1331', '2019-12-14 08:01:43.210269'),
(26, 'admin_page', '0009_auto_20191214_1553', '2019-12-14 10:23:17.410701');

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
('0xt1a76cxqqre9i5n6rimhwae65hv9fc', 'YWQ5YTdiOGM4MmQ3MjBhYTUxNDIwZjkzOWIxNWFkMTdkYjFiZTFlMDp7ImFfdW5hbWUiOiJTaXJlZW4gR290aGFkaXlhIiwiYV91aWQiOjEsImFfdXNlcm5hbWUiOiJlci5zaXJlZW5AZ21haWwuY29tIiwidGVtYWlsIjoiZXIuc2lyZWVuQGdtYWlsLmNvbSIsInVzZXJuYW1lIjoibXIucGFydGhiYXZpc2hpQGdtYWlsLmNvbSIsInVzZXJfbmFtZSI6IlBhcnRoIEJhdmlzaGkiLCJ1aWQiOjJ9', '2022-03-12 08:25:37.497843'),
('1tiie5884cfdq6ozik6hia3o0i8x3xkk', 'MzViMzg2NzA4N2EzNmY0YzY0ZDI3MDU3Zjk2MjM0NjIzMzk4ODFhMzp7ImFfdWlkIjoxLCJ1c2VybmFtZSI6Im1yLnBhcnRoYmF2aXNoaUBnbWFpbC5jb20iLCJ1aWQiOjJ9', '2022-02-21 07:51:15.583284'),
('4nc4xwxuhkqkc4t82nij9y6iqo5rq2cw', 'NDZiYTRlNGYyNGQ5NTcyZGZkMjgxZDNmODIxNTNiZmRhMGE1OGQ1MDp7InVzZXJuYW1lIjoidW1hbmdtb2RpNjUyMDAwQGdtYWlsLmNvbSIsInRlbWFpbCI6InBhcnRoYmF2aXNoaTM1MzZAZ21haWwuY29tIiwidWlkIjo1fQ==', '2022-02-02 06:44:22.184682'),
('8hd615o9kd6tgrv70pv0jd49rka55cjc', 'YTc3MWZiMmIyMzk4MjcyNmVmZGJkOGZmZTkzNDc3ZDMxOWRiNDdmYzp7InVpZCI6MiwidXNlcl9uYW1lIjoiSmlnbyBCYXZpc2hpIiwidGVtYWlsIjoibXIucGFydGhiYXZpc2hpQGdtYWlsLmNvbSIsImFfdWlkIjoxLCJ1c2VybmFtZSI6InBhdGVsZGhydXZpazQwMUBnbWFpbC5jb20iLCJ1c2VyX2VtYWlsIjoibXIucGFydGhiYXZpc2hpQGdtYWlsLmNvbSJ9', '2022-02-23 07:17:55.401489'),
('8pai3qksy0rvs1yc8m01l7a8eva6nkik', 'YWNkM2JiZTMxNWY3YjM3NzkzOGY3NmE1N2FkM2Q2N2JjMjg1ODMyYTp7ImFfdWlkIjoxLCJhX3VuYW1lIjoiU2lyZWVuIEdvdGhhZGl5YSIsImFfdXNlcm5hbWUiOiJlci5zaXJlZW5AZ21haWwuY29tIiwidGVtYWlsIjoiZXIuc2lyZWVuQGdtYWlsLmNvbSJ9', '2022-03-28 09:37:17.730815'),
('ekdvnp5fs39x8ujvctd1wwnni0i7k7ta', 'MjAxYmMxNWQ3ODNlMmJkZDg3ZjQyM2Q3MmE5MDAwZDhkZTliYjBiMjp7ImFfdWlkIjoxLCJhX3VuYW1lIjoiU2lyZWVuIEdvdGhhZGl5YSIsImFfdXNlcm5hbWUiOiJlci5zaXJlZW5AZ21haWwuY29tIiwidXNlcm5hbWUiOiJtci5wYXJ0aGJhdmlzaGlAZ21haWwuY29tIiwidXNlcl9uYW1lIjoiUGFydGggUGF0ZWwiLCJ1aWQiOjJ9', '2022-03-12 11:27:21.662241'),
('er1tqfl8pxwat0djrqw2ia3yizmvvnyb', 'N2QwZjRlNjI5OGUyNDNhMzM3OTc0ZmFmNmI1ZDgyMTE5YTk5ZWMwMjp7ImFfdWlkIjoxLCJhX3VuYW1lIjoiU2lyZWVuIEdvdGhhZGl5YSIsInVzZXJuYW1lIjoibXIucGFydGhiYXZpc2hpQGdtYWlsLmNvbSIsInVzZXJfbmFtZSI6IkppZ28gQmF2aXNoaSIsInVpZCI6Mn0=', '2022-03-06 17:24:06.845239'),
('f6tb3082ycpsjxjxx52z9dpolcvhy3jd', 'MWNlYzhiN2NhYzc1ZjAxNmZhOGRkNTQ1NDQwNmM5ZWI4YmNkYWE2NTp7ImFfdWlkIjoxLCJhX3VuYW1lIjoiU2lyZWVuIEdvdGhhZGl5YSIsImFfdXNlcm5hbWUiOiJlci5zaXJlZW5AZ21haWwuY29tIn0=', '2022-03-11 18:40:38.005509'),
('gzrvszm2srxzatn9zmkexh1paszvwupi', 'OTIxYWIwNjhmMjE3NWJiMGQxMjNhMzFlMWViOTAwNjAzZjg2NzA3Nzp7InVzZXJuYW1lIjoiZXIuc2lyZWVuQGdtYWlsLmNvbSIsInRlbWFpbCI6ImVyLnNpcmVlbkBnbWFpbC5jb20ifQ==', '2022-01-04 09:09:47.685307'),
('h700o6lihcbebo8owl7gf80vuzwc3cv0', 'MmQ5YTY0MzVlZTYwNWQ4ZGRhNzExNTgwYTNkNjcxYjJjM2MyMzdmZTp7InVzZXJfZW1haWwiOiJwYXRlbGRocnV2aWs0MDFAZ21haWwuY29tIiwidXNlcm5hbWUiOiJwYXRlbGRocnV2aWs0MDFAZ21haWwuY29tIiwidXNlcl9uYW1lIjoiRGhydXZpayBQYXRlbCIsInVpZCI6MTB9', '2022-02-28 18:12:40.738164'),
('hmyw2y258fi1rl7udjdxhm4sem6m35rk', 'NmZiMjgyM2IxMDAxNWFhM2MyNWY5ODIyYWY3OTFhZGI3MzhiMDVmNDp7ImFfdWlkIjoxLCJhX3VuYW1lIjoiU2lyZWVuIEdvdGhhZGl5YSIsImFfdXNlcm5hbWUiOiJlci5zaXJlZW5AZ21haWwuY29tIiwidXNlcm5hbWUiOiJqZXJyeTYyNjFAZ21haWwuY29tIiwidXNlcl9uYW1lIjoiSmVycnkgTGltYmFzaXlhIiwidWlkIjoxMSwic19kYXRlIjoiMjAyMC0wMy0wOCIsImVfZGF0ZSI6IjIwMjAtMDMtMTQifQ==', '2022-03-31 19:56:37.213341'),
('jsd53gnske7nwwx9fkqdn0viwl02fy61', 'YmRhZDhlYzI3MThmY2NlOWM3MzRkMmI5NTU3NTg2YTQ4ZTVhMTlhNzp7ImFfdWlkIjoxLCJhX3VuYW1lIjoiU2lyZWVuIEdvdGhhZGl5YSIsInVzZXJuYW1lIjoiamVycnk2MjYxMzFAZ21haWwuY29tIiwidXNlcl9uYW1lIjoiSmVycnkgTGltYmFzaXlhIiwidWlkIjoxMX0=', '2022-03-06 21:01:13.180891'),
('laogezawf67b7jdy5h3dprv20o8m8rty', 'M2U3ODU0YTVjZGY4NmEzZWVmNzBhYjlkOTQzNTk0MDVlOWVhNDllMzp7InVpZCI6MiwiYV91aWQiOjEsInVzZXJuYW1lIjoiZXIuc2lyZWVuQGdtYWlsLmNvbSJ9', '2022-02-20 09:28:27.738695'),
('nqzho5ygn1vywacegeamttnm600zji1d', 'M2U3ODU0YTVjZGY4NmEzZWVmNzBhYjlkOTQzNTk0MDVlOWVhNDllMzp7InVpZCI6MiwiYV91aWQiOjEsInVzZXJuYW1lIjoiZXIuc2lyZWVuQGdtYWlsLmNvbSJ9', '2022-02-08 07:10:07.618776'),
('p85tc7offap7eg8wes18rndalhgyi9o5', 'ZDlmMDQwMDU1MjcxNDhkMjllOGYzNDhlM2I4OWYxYTE4NWZmZTYxZjp7ImFfdWlkIjoxLCJhX3VuYW1lIjoiU2lyZWVuIEdvdGhhZGl5YSIsImFfdXNlcm5hbWUiOiJlci5zaXJlZW5AZ21haWwuY29tIiwidXNlcm5hbWUiOiJtci5wYXJ0aGJhdmlzaGlAZ21haWwuY29tIiwidXNlcl9uYW1lIjoiUGFydGggQmF2aXNoaSIsInVpZCI6Mn0=', '2022-03-11 16:39:12.276123'),
('thep63clzj90ogusjld3rohhrynrmdmn', 'MWNlYzhiN2NhYzc1ZjAxNmZhOGRkNTQ1NDQwNmM5ZWI4YmNkYWE2NTp7ImFfdWlkIjoxLCJhX3VuYW1lIjoiU2lyZWVuIEdvdGhhZGl5YSIsImFfdXNlcm5hbWUiOiJlci5zaXJlZW5AZ21haWwuY29tIn0=', '2022-06-02 08:05:36.889911'),
('uh6f4b9t0ciqqzlx49ety9oabea8qnhm', 'ZjQyNTFlNDRlNWJiZTc5NjZkZGRlMWRlOTA3MjA3OGRlZGUzNDNlNTp7ImFfdWlkIjoxLCJhX3VuYW1lIjoiU2lyZWVuIEdvdGhhZGl5YSIsImFfdXNlcm5hbWUiOiJlci5zaXJlZW5AZ21haWwuY29tIiwic19kYXRlIjoiMjAyMC0wMi0xMiIsImVfZGF0ZSI6IjIwMjAtMDItMjkifQ==', '2022-06-03 09:08:22.219476'),
('uywlhqb7tb1wz6rdsi965fkmd1h84hiy', 'OTFmZTVhYmJjN2JmYzI4NWYzM2YyMDU1YjQ1OGJjNmQ0Zjk4MmViNDp7InVzZXJuYW1lIjoicGF0ZWxkaHJ1dmlrNDAxQGdtYWlsLmNvbSIsInVzZXJfbmFtZSI6IkRocnV2aWsgUGF0ZWwiLCJ1aWQiOjEwfQ==', '2022-03-04 09:20:31.624593'),
('w3f5236cxmo6zj2gjrzo9jxjt4xq79vj', 'N2QwZjRlNjI5OGUyNDNhMzM3OTc0ZmFmNmI1ZDgyMTE5YTk5ZWMwMjp7ImFfdWlkIjoxLCJhX3VuYW1lIjoiU2lyZWVuIEdvdGhhZGl5YSIsInVzZXJuYW1lIjoibXIucGFydGhiYXZpc2hpQGdtYWlsLmNvbSIsInVzZXJfbmFtZSI6IkppZ28gQmF2aXNoaSIsInVpZCI6Mn0=', '2022-03-06 07:08:43.828552');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `f_id` int(11) NOT NULL,
  `f_desc` varchar(400) NOT NULL,
  `f_date` date NOT NULL,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`f_id`, `f_desc`, `f_date`, `p_id`, `user_id`) VALUES
(3, 'Must Recommended For Amazing Gaming Experience :D', '2022-02-22', 13, 11),
(4, 'Best gaming Keyboard under budget', '2022-02-26', 18, 12),
(5, 'Average Performance under this price point.', '2022-02-27', 24, 2),
(6, 'Best Gaming Experience...\r\n\r\nMust Recommended', '2022-02-27', 31, 2),
(7, 'Backlit looks Cool in Low Light', '2022-02-27', 14, 2),
(8, 'Comfortable Chair ', '2022-02-27', 52, 2);

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `game_id` int(11) NOT NULL,
  `game_name` varchar(300) NOT NULL,
  `platform` varchar(30) NOT NULL,
  `wallpaper` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`game_id`, `game_name`, `platform`, `wallpaper`) VALUES
(2, 'PUBG Mobile', 'Mobile Game', 'pubg_mobile.jpg'),
(3, 'Freefire ', 'Mobile Game', 'free_fire.jpg'),
(4, 'PUBG PC', 'PC Game', 'pubg_pc.jpg'),
(5, 'Apex Legends', 'Mobile Game', 'apex_legends.jpg'),
(6, 'COD: Mobile', 'Mobile Game', 'cod_mobile.jpg'),
(8, 'Call of Duty: Black OPS4', 'PC Game', 'cod_blackops.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `n_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_date` datetime NOT NULL,
  `o_id` int(11) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`n_id`, `description`, `created_date`, `o_id`, `t_id`, `user_id`) VALUES
(3, 'Your Order is Accepted', '2022-02-22 00:00:00', 10, NULL, 11),
(4, 'Your Order is Rejected', '2022-02-22 00:00:00', 9, NULL, 11),
(6, 'Your Order is accepted', '2022-02-23 00:00:00', 6, NULL, 10),
(7, 'Your Order is Rejected', '2022-02-23 00:00:00', 7, NULL, 10),
(9, 'Roomid : 4e564676\r\nPssword: 909090', '2022-02-25 11:51:00', NULL, 2, NULL),
(11, 'Your Order is accepted', '2022-02-25 13:14:00', 12, NULL, 2),
(12, 'Your Order is accepted', '2022-02-27 17:53:00', 24, NULL, 2),
(13, 'Your Order is accepted', '2022-02-27 17:53:00', 25, NULL, 2),
(14, 'Your Order is accepted', '2022-02-27 23:48:00', 10, NULL, 11),
(15, 'Room ID : 943162\r\nPassword :- 93288', '2022-02-28 00:42:00', NULL, 11, NULL),
(16, 'Your Order is accepted', '2022-02-28 00:42:00', 9, NULL, 11),
(17, 'Your Order is accepted', '2022-02-28 03:23:00', 26, NULL, 25),
(18, 'Your Order is Rejected', '2022-03-12 14:42:00', 7, NULL, 10),
(19, 'Your Order is accepted', '2022-03-13 22:58:00', 28, NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `o_id` int(11) NOT NULL,
  `o_date` date NOT NULL,
  `o_address` text NOT NULL,
  `o_contact` varchar(15) NOT NULL DEFAULT '0',
  `o_price` int(11) NOT NULL,
  `o_status` int(11) NOT NULL,
  `p_status` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`o_id`, `o_date`, `o_address`, `o_contact`, `o_price`, `o_status`, `p_status`, `user_id`) VALUES
(6, '2022-02-14', 'Not Uploaded Yet', '0', 9499, 0, 0, 10),
(7, '2022-02-19', 'Not Uploaded Yet', '0', 9499, 2, 0, 10),
(8, '2022-02-19', 'Not Uploaded Yet', '0', 28497, 0, 0, 10),
(9, '2022-02-22', '03, Bhagyoday Society,\nOpp. Subhash School, Thakkarnagar\nAhmedabad\n382350', '8530227750', 29695, 1, 1, 11),
(10, '2022-02-22', '03, Bhagyoday Society,\nOpp. Subhash School, Thakkarnagar\nAhmedabad382350', '8530227750', 10697, 1, 0, 11),
(12, '2022-02-24', 'A-43, Hans Colony,\r\nBapunagar,\r\nAhmedabad,\r\n380024.', '9714123036', 1398, 1, 2, 2),
(24, '2022-02-27', 'A-602, \nShyam Heights,Nr. Sankalp Highschool,Nikol\nAhmedabad382350', '9773055968', 1498, 1, 1, 2),
(25, '2022-02-27', 'A-602, \nShyam Heights,Nr. Sankalp Highschool,Nikol\nAhmedabad382350', '9773055968', 499, 1, 2, 2),
(26, '2022-02-28', '03, Bhagyoday Society,\nOpp. Subhash School, Thakkarnagar\nAhmedabad\n382350', '8530227750', 9998, 1, 2, 25),
(27, '2022-03-12', 'A-602, \nShyam Heights,Nr. Sankalp Highschool,Nikol\nAhmedabad\n382350', '9773055968', 2997, 0, 0, 2),
(28, '2022-03-13', 'A-602, \nShyam Heights,Nr. Sankalp Highschool,Nikol\nAhmedabad\n382350', '9773055968', 2199, 1, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `o_details_id` int(11) NOT NULL,
  `o_date` date NOT NULL,
  `o_qty` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`o_details_id`, `o_date`, `o_qty`, `total_price`, `product_id`, `order_id`) VALUES
(1, '2022-02-14', 1, 9499, 13, 6),
(2, '2022-02-19', 1, 9499, 13, 7),
(3, '2022-02-19', 3, 28497, 13, 8),
(4, '2022-02-22', 3, 28497, 13, 9),
(5, '2022-02-22', 2, 1198, 14, 9),
(6, '2022-02-22', 1, 9499, 13, 10),
(7, '2022-02-22', 2, 1198, 14, 10),
(10, '2022-02-24', 2, 1398, 15, 12),
(20, '2022-02-27', 1, 499, 30, 24),
(21, '2022-02-27', 1, 999, 18, 24),
(22, '2022-02-27', 1, 499, 23, 25),
(23, '2022-02-28', 2, 9998, 22, 26),
(24, '2022-03-12', 3, 2997, 19, 27),
(25, '2022-03-13', 1, 2199, 50, 28);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL,
  `pay_status` varchar(10) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `date_paid` date NOT NULL,
  `o_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `player_name` varchar(30) NOT NULL,
  `player_score` varchar(40) NOT NULL DEFAULT '0',
  `place_pts` int(11) NOT NULL DEFAULT '0',
  `is_main` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `player_name`, `player_score`, `place_pts`, `is_main`, `t_id`, `team_id`, `user_id`) VALUES
(7, 'ATHENA Gaming', '0', 0, 1, 6, 6, 2),
(8, 'MOK Gaming', '0', 0, 0, 6, 6, NULL),
(9, 'Dhruvik Patel', '0', 0, 1, 6, 7, 10),
(10, 'parth', '0', 0, 0, 6, 7, NULL),
(11, 'Dhruvik Patel', '20', 200, 1, 3, NULL, 10),
(12, 'Shroud', '5', 0, 1, 9, 8, 10),
(13, 'S1mple', '4', 0, 0, 9, 8, NULL),
(14, 'chocoTaco', '7', 0, 0, 9, 8, NULL),
(15, 'AXOM | Ghastly', '60', 300, 1, 3, NULL, 2),
(16, 'HydraFlicks', '5', 0, 1, 9, 9, 2),
(17, 'iFlicks', '7', 0, 0, 9, 9, NULL),
(18, 'WEeZzEe', '6', 0, 0, 9, 9, NULL),
(19, 'BTR | Luxxy', '0', 0, 1, 2, 10, 2),
(20, 'BTR | Zuxxy', '0', 0, 0, 2, 10, NULL),
(21, 'BTR | Ryzen', '0', 0, 0, 2, 10, NULL),
(22, 'BTR | Microboy', '0', 0, 0, 2, 10, NULL),
(23, 'XQF | Paraboy', '0', 0, 1, 2, 11, 10),
(24, 'XQF | jimmy', '0', 0, 0, 2, 11, NULL),
(25, 'XQF | Cat', '0', 0, 0, 2, 11, NULL),
(26, 'XQF | Coolboy', '0', 0, 0, 2, 11, NULL),
(27, 'FNC | scoutOP', '0', 0, 1, 2, 13, 12),
(28, 'FNC | Owais', '0', 0, 0, 2, 13, NULL),
(29, 'FNC | Ronak', '0', 0, 0, 2, 13, NULL),
(30, 'FNC | Ash', '0', 0, 0, 2, 13, NULL),
(31, 'Crimsix', '0', 0, 1, 13, 14, 2),
(32, 'Huke', '0', 0, 0, 13, 14, NULL),
(33, 'lllye', '0', 0, 0, 13, 14, NULL),
(34, 'Shotzzy', '0', 0, 0, 13, 14, NULL),
(35, 'FNC - sc0utOP', '0', 0, 1, 11, 15, 2),
(36, 'FNCowais', '0', 0, 0, 11, 15, NULL),
(37, 'FNCRonak', '0', 0, 0, 11, 15, NULL),
(38, 'FNC - paritOsh', '2', 0, 0, 11, 15, NULL),
(39, 'MegaSwagWNL', '2', 0, 1, 11, 16, 10),
(40, 'MegaKull', '0', 0, 0, 11, 16, NULL),
(41, 'MegaVEXE', '3', 0, 0, 11, 16, NULL),
(42, 'MegaENCORE', '5', 0, 0, 11, 16, NULL),
(43, 'TE - Sahil2k', '3', 0, 1, 11, 17, 11),
(44, 'TE - Unreal', '2', 0, 0, 11, 17, NULL),
(45, 'TE - Venxm', '0', 0, 0, 11, 17, NULL),
(46, 'TE - FrostyOP', '2', 0, 0, 11, 17, NULL),
(47, 'SGRxRiddhi', '1', 0, 1, 11, 18, 12),
(48, 'SGRxIshika', '1', 0, 0, 11, 18, NULL),
(49, 'SGRxTanisha', '0', 0, 0, 11, 18, NULL),
(50, 'SGRxOlive', '0', 0, 0, 11, 18, NULL),
(51, 'M40 | CARNAGE', '1', 0, 1, 11, 19, 5),
(52, 'M40 | RIVAL', '1', 0, 0, 11, 19, NULL),
(53, 'M40 | RUTHLESS', '2', 0, 0, 11, 19, NULL),
(54, 'M40 | NExusOP', '4', 0, 0, 11, 19, NULL),
(55, 'BRAWLzebra', '0', 0, 1, 11, 20, 9),
(56, 'BRAWLbomber', '1', 0, 0, 11, 20, NULL),
(57, 'BRAWLiconic', '1', 0, 0, 11, 20, NULL),
(58, 'BRAWLdark', '0', 0, 0, 11, 20, NULL),
(59, 'vsgCRAWcg', '3', 0, 1, 11, 21, 14),
(60, 'vsgCRAWroach', '2', 0, 0, 11, 21, NULL),
(61, 'vsgCRAWavii', '0', 0, 0, 11, 21, NULL),
(62, 'vsgCRAWevoo', '0', 0, 0, 11, 21, NULL),
(63, '8bitAKSHU', '1', 0, 1, 11, 22, 23),
(64, '8bitSe7en', '2', 0, 0, 11, 22, NULL),
(65, 'NorulesXDON', '0', 0, 0, 11, 22, NULL),
(66, '8bitMafia', '2', 0, 0, 11, 22, NULL),
(67, 'SouLmOrtaL', '1', 0, 1, 11, 23, 25),
(68, 'SouLViper', '0', 0, 0, 11, 23, NULL),
(69, 'SouLRegaltoss', '1', 0, 0, 11, 23, NULL),
(70, 'SouLSangwan', '0', 0, 0, 11, 23, NULL),
(71, 'Fuddo', '20', 170, 1, 3, NULL, 11),
(72, 'Topson', '0', 60, 1, 3, NULL, 4),
(73, 'Grubby', '0', 105, 1, 3, NULL, 15),
(74, 'Leffen', '0', 80, 1, 3, NULL, 9),
(75, 'GodV', '20', 135, 1, 3, NULL, 13);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `p_id` int(11) NOT NULL,
  `p_name` text NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_desc` text NOT NULL,
  `in_stock` varchar(50) NOT NULL,
  `p_image` varchar(400) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`p_id`, `p_name`, `p_price`, `p_desc`, `in_stock`, `p_image`, `c_id`) VALUES
(13, 'CORSAIR K70 LUX Mechanical Gaming Keyboard', 9499, '- Aircraft-grade anodized brushed aluminium frame for superior durability\r\n- Advanced lighting control and large font keycaps deliver dynamic, vibrant backlighting\r\n- Cue support enables advanced macro and lighting programming for virtually unlimited game customization\r\n- 100 percent cherry mx red key switches with gold contacts for fast, precise key presses\r\n- 100 percent anti-ghosting with full key rollover on usb\r\n- Detachable soft-touch wrist rest and dedicated multimedia controls\r\n- Usb pass-through port for easy connections', 'In Stock', 'corsair_new.jpg', 17),
(14, 'HexaGear Multicolour LED Backlit Wired Mechanical Gaming Keyboard', 599, 'Professional Mechanical feeling backlit gaming keyboard for gaming and office ,not the real mechanical keyboard,,but it worth more Backlighting on keyboard.', 'Out of Stock', 'hexgear.jpeg', 17),
(15, 'cartup Wired Backlit Floating Gaming Keyboard, Mechanical Feeling Rainbow Illuminated Gaming Keyboard', 700, '-?Professional Gaming Keyboard? UV coated keycaps and arcuated double injection ABS keycaps design, effectively reduce hand fatigue, feel more comfortable, the characters never fade, enhanced durability and tactile feedback. Perfect for various games like Metal Gear Solid, Call of Duty, Star Wars Battlefront, Overwatch, World of Warcraft Legion, etc. Removable keycaps and free keycap puller, clean becomes easier\r\n-?Colorful Illuminated Keyboard?4 LED lighting backlits models, breathing(7-color alternate). 3 Adjustable permanent mixed backlit models, changeable breathing or permanent lighting mode. It can be great for playing game at night even without light', 'Few Lefts', '41evZhcNGkL.jpg', 17),
(16, 'Ant Esports MK3400W Mechanical Gaming Keyboard Wired RGB with Blue Switches LED- Backlit Mode, World of Warships Edition – Black', 1799, '104 Key Mechanical Gaming Keyboard - All keys Non-Conflict keys, removable Keycaps, strengthened Space Key. Specially designed keys for enhanced durability offers a professional gaming feeling..\r\nErgonomic Design -The perfect curves, the ladder-design, 2 rubberized holders under the bottom of the keyboard, streamline key form high to low, a gold-plated corrosion free USB connector.\r\nUnique Mechanical Feeling - With medium resistance, precise actuation, audible click sound, and tactile bump feedback. With a contoured shape, sweat resistant design, skin-friendly.\r\nDurable & Water-Resistant - The double-shot-moulded ABS keycaps and brushed metal panel are extremely durable and abrasion-resistant. Have an incredible 50-million-keystroke lifespan.\r\nWide Compatibility - This mechanical keyboard is compatible, support windows 10, windows 8, windows 7 or windows XP, android and iOS. Works great for desktop, laptop, PC, MacBook and other devices.', 'In Stock', '61rDLUFM35L._SL1100_.jpg', 17),
(17, 'Logitech G613 Wireless Gaming Mechanical Keyboard with Lightspeed Technology', 6495, 'Light speed wireless - advanced wireless performance\r\nRomer-G mechanical switches\r\nProgrammable g-keys, 6 programmable keys\r\nConnect to multiple devices, connect using light speed or Bluetooth\r\nUp to 18 months battery life', 'In Stock', '51tVcPmXPYL._SL1000_.jpg', 17),
(18, 'Redgear Blaze 3 colour backlit gaming keyboard with full aluminium body & windows key lock', 1049, 'Floating key caps for mechanical feel\r\n3 LED color backlight\r\nWindows key lock\r\nFloating Switch: 45g trigger pressure\r\nAluminum structure\r\n19 keys anti-ghost;Kindly install driver to avoid connectivity issues while using', 'Out of Stock', '61M2CPqMgwL._SL1000_.jpg', 17),
(19, 'Offbeat® Slayer Wired Gaming Mechanical Like Keyboard 9 Non-Conflicting Keys, Water-Resistant, Led Backlight Keys with Zero Lag (Medium, Black)', 999, '1.MULTI MEDIA & ANTI GHOSTING : The Gaming Keyboard has 25 conflict free (n-Key Rollover) 8 Dedicated Multimedia keys plus 14 additional FN+ Multimedia keys (Total 114 keys). Keys are quiet, designed for longevity, durability delivering precise tactile feedback. Comes with Full numeric keypad and a gold-plated corrosion free USB connector for a reliable connection and ultimate Gaming performance.\r\n2.8 independent multimedia keys & 14 shortcut keys to facilitate the operation of your entertainment or gaming, there are 8 independent multimedia keys to offer more convenience. Meanwhile the 14 shortcut keys will help a lot during your work or daily use to promote the efficiency and enhance the using experience.\r\n3.Crater Architecture & Excellent Performance compared to common computer keyboard, crater architecture gaming keyboard stands out with independent structure and 2 times longer key life which passed over 10, 000, 000 times of keystroke test. Moderate elasticity of the key reduces fatigue for long-time use. The keycap is detachable for effortless cleaning.\r\n4.RGB BACKLIT GAMING KEYBOARD; 3 different RGB Lighting modes RED, GREEN and YELLOW with brightness level adjust. The membrane keycaps offering clear uniform backlighting, WIN key can be disabled for gaming. The PC Gaming Keyboard has been ergonomically designed to be a superb typing tool for office work as well.. The integrated wrist rest gives you the comfort you need for marathon gaming sessions.', 'In Stock', '81DjADjbiHL._SL1500_.jpg', 17),
(20, 'Offbeat® T – Dagger Wired Gaming Membrane Keyboard 19 Non-Conflicting Keys, Water-Resistant, 3 Led Backlight, 8 Multi-Media Keys with Zero Lag (Large, Black)', 1290, '1.MULTI MEDIA & ANTI GHOSTING : The Gaming Keyboard has 19 conflict free (n-Key Rollover) 8 Dedicated Multimedia keys plus 14 additional FN+ Multimedia keys (Total 114 keys). Keys are quiet, designed for longevity, durability delivering precise tactile feedback. Comes with Full numeric keypad and a gold-plated corrosion free USB connector for a reliable connection and ultimate Gaming performance.\r\n2.8 independent multimedia keys & 14 shortcut keys to facilitate the operation of your entertainment or gaming, there are 8 independent multimedia keys to offer more convenience. Meanwhile the 14 shortcut keys will help a lot during your work or daily use to promote the efficiency and enhance the using experience.\r\n3.Crater Architecture & Excellent Performance compared to common computer keyboard, crater architecture gaming keyboard stands out with independent structure and 2 times longer key life which passed over 10, 000, 000 times of keystroke test. Moderate elasticity of the key reduces fatigue for long-time use. The keycap is detachable for effortless cleaning.\r\n4.RGB BACKLIT GAMING KEYBOARD; 3 different RGB Lighting modes RED, GREEN and YELLOW with brightness level adjust. The membrane keycaps offering clear uniform backlighting, WIN key can be disabled for gaming. The PC Gaming Keyboard has been ergonomically designed to be a superb typing tool for office work as well.. The integrated wrist rest gives you the comfort you need for marathon gaming sessions.', 'In Stock', '71OuNZ+BoYL._SL1280_.jpg', 17),
(21, 'HyperX Alloy Origins Core - Tenkeyless Mechanical Gaming Keyboard - Software Controlled Light & Macro Customization - Compact Form Factor - Linear Switch - HyperX Red - RGB LED Backlit (HX-KB7RDX-US)', 8990, 'HyperX Mechanical Switches rated for 80 million keystrokes\r\nFull aircraft-grade aluminum body\r\nUltra-compact, portable design with detachable cable\r\nDazzling RGB lighting with dynamic effects\r\nAdvanced customization with HyperX NGENUITY software.', 'In Stock', '61b+3QeNq-L._SL1428_.jpg', 17),
(22, 'Tobo F2088 Punk Keycap Black Switch Mechanical Gaming Keyboard with Backlit/Volume Knob - Black Switch.', 4999, '1. Punk keycap design.\r\n2. Dual mode knob for backlit and multimedia control. Backlit mode: Knob indicator lights up, press the knob button can switch backlit displaying modes, and rotate the knob can adjust the backlit brightness.\r\n3. M1/M2/M3: Three different game key area backlit. And you could set the backlit key by yourself, long press M key for 3s, indicator blinks, record the key backlit then short press M key to finish the record.\r\n4. Multimedia mode: Knob indicator light goes out, press the button can mute the audio output, and rotate the knob can adjust the volume.\r\n5. Equipped with a removable wrist pad, suits for long-time typing. Also Supports NKRO.', 'In Stock', '516BpI-jnIL.jpg', 17),
(23, 'Xmate Zorro 3200DPI LED Backlight 6 Button Wired USB Gaming Mouse, Durable ABS Body for Gamers, 4 Color Breathing Lights, 1.5M Nylon Braided Cable (Black)', 499, '4 DPI Levels - Four color RGB breathing light cycle replacement. 4-type DPI rating controlled by touching the DPI button - Violet 800/Blue 1200/Purple 1600/Red 3200\r\nTough Built - Xmate Zorro wired USB gaming mouse is constructed of ABS plastic, leather collar, and rubber finish with plate-mounted mechanical keys and switches that stand up to tough gaming needs\r\n6 Buttons with different functions like the previous page and next page. If you wish you can turn on/off the colorful lights (press next page key + DPI key)\r\nComfy to Use - The ergonomic shape design plus scroll wheel with rubber and skin-friendly surface provide you the most comfortable feeling in hand for a long time\r\nCompatibility - The back and the forward button will be very helpful when browsing the web. Widely compatible with Win98SE/Me/2000/XP/VISTA/WIN 7 etc. No programming function under Mac system', 'In Stock', '61EEM0MgrVL._SL1100_.jpg', 18),
(24, 'MFTEK Tag 3 2000 dpi LED Backlit Wired Gaming Mouse with Unbreakable ABS Body (Black)', 349, 'We built the mftek mouse as a competitive gaming mouse, in a world where milliseconds mean everything, the MFTEK does its job in microseconds\r\nThe mouse surface has been treated with special anti-slip and anti-sweat texture for enhanced grip and comfort for extra long gaming sessions\r\n800-dpi blue, 1200-dpi purple, 1600-dpi red, 2000-dpi rose and 6 keys support macro setting\r\nThis mouse is ergonomically designed and perfectly fits your hand, it prevents unnecessary strain on your hand to enable comfortable grip and pleasant use even during your longest games', 'In Stock', '71BmpO+jj7L._SL1500_.jpg', 18),
(25, 'Offbeat - Killshot Wired 7D Button Gaming Mouse, DPI 1600-6400, RGB Breathing Light PC mice', 599, '7D BUTTONS FOR ULTIMATE GAMING : Killshot gaming mouse is loaded with 7D buttons – { Left click, Right click, Middle click, Forward, backward button, DPI button, Scroll wheel up/down } for ultra-fast response in your 1 hand for ultimate gaming experience.\r\n4 MODES DPI SETTING TO SUIT YOUR SPEED : 4 Mode DPI ranging from 1600, 2400, 3200, 6400 at 500 hz polling rate to suit for speed from slow precision for a headshot to fast reflexive rampage shooting.\r\nADVANCED LASER OPTICAL SENSOR WITH BRAIDED CABLE : Killshot features a one of kind trademark Re-active sensor technology, Laser optical sensors technology is proven as one of the best in gaming world, The booster in Braided 1.5 meter cable ensures zero lag and respond under 1ms with a 60G acceleration & 204 inch/sec speed.\r\nADAPTIVE SYMMETRIC ERGONOMICS LIGHT-WEIGHT DESIGN : Adaptive symmetric design and finger grooves for perfect ergonomic grip with light weight chassis for hours of tireless gaming.', 'In Stock', '612nr6Fa4QL._SL1500_.jpg', 18),
(28, 'Gaming mouse with 6 control buttons Resolution: 800/ 1200/ 2000/ 3200 dpi Ergonomic design for professional gamers Gold-plated USB Connector Mouse cable length 1.8 meters (with braided fibre cable) Compatible with Windows XP and above Interface: USB', 796, '7 programmable buttons for binds and easy to access\r\n16.8 million Color customization options\r\nDPI up to 4800\r\n1.8m braided cable\r\nFor both palm and claw grip', 'In Stock', '51GlZqnZzXL._SL1000_.jpg', 18),
(29, 'Redragon Gainer M610 Wired USB Gaming Mouse - 3200 DPI (Black)', 745, 'LED Backlit Gaming Mouse up to 3200 DPI (user adjustable 1000/1600/2400/3200 DPI)\r\n6 programmable buttons including 2 customizable thumb buttons allow adjusting the mouse for its user\'s needs; Textured surface of the upper button decreases the risk of accidental «blind» hit\r\nHigh precision optical sensor with option of the chosen level of DPI speed indicated by the color of the scroll wheel\r\nSpecially invented Teflon formula ensures excellent gliding; Thanks to enlarged feet surface, balanced feet height and optimal place the mouse moves strictly horizontally\r\nWidened scroll wheel with special ribbed protector make the mouse control easier; The shape and the place of the scroll wheel are optimal for simultaneous movements of index finger from the left button to the wheel back and forth', 'In Stock', '714U1NL7flL._SL1500_.jpg', 18),
(30, 'Ant Esports GM200W Gaming Mouse Wired, 6 Programmable Buttons, 3200 DPI Adjustable, with 7 Breathing Lights, Comfortable Grip Ergonomic Optical PC Computer Gaming Mouse, World of Warships Edition – Black', 499, 'Adjustable DPI buttons adjustable DPI level (3200, 2400, 1600, 1000) can be switched in real time to change the speed of USB Gaming Mouse and satisfy your different needs.\r\nExcellent ergonomic contour & skin-friendly design - more comfortable contour design to keep your hand away from fatigue; unique skin-friendly material to ensure more comfortable hand-feeling.\r\nProfessional gaming engine -adopt new upgrade gaming mouse engine design, report rate: 500hz--more precise and facile movement, to ensure your victory won\'t be delayed.\r\nConvenient to designed for convenient operation, plug and play no driver required.Compatible with WinXP, Win7/8/10, Vista7/8, Linux, and Mac OS. (Note: the side buttons are not available in Mac OS)\r\nReliable quality -Ant Esports hope to participate your every victory-5 millions times using lifespan for the left & right click button, 3 millions times using lifespan for the scroll wheel.', 'In Stock', '71Y2ZmKMkEL._SL1500_.jpg', 18),
(31, 'Redgear A-10 Gaming Mouse with LED and DPI Upto 2400', 349, 'LED Gaming mouse\r\nDPI Range 800-2400\r\nExtra durable switches\r\nFor all types of grip', 'In Stock', '61xuiym9xgL._SL1500_.jpg', 18),
(32, 'Dragonwar ELE-G9 Thor BlueTrack and Blue Sensor Gaming Mouse with Macro Function', 999, 'Package Contents:Dragon War Thor Mouse\r\nMouse Mat (360mm X 250mm)\r\nUser Manual\r\nSoftware CD\r\nResolution: 800/ 1600/ 2400/ 3200 dpi\r\n1 year warranty. Warranty is covered only against manufacturing defects , physical damage is not covered under warranty', 'In Stock', '81TWg+nuMVL._SL1500_.jpg', 18),
(33, 'Corsair CH-9301011-AP Gaming Harpoon RGB Gaming Mouse, Backlit RGB LED, 6000 DPI, Optical Sensor', 1399, '- Six fully-programmable buttons enable completely custom configurations\r\n- Onboard Memory stores your custom DPI settings on the mouse\r\n- High-accuracy 6000 DPI Optical gaming sensor with advanced tracking\r\n- Contoured design provides a natural fit to support your play style', 'In Stock', '51OqSObmZjL._SL1000_.jpg', 18),
(34, 'Lenovo Gaming Mouse - M200 (GX30P93886)', 1259, 'The Lenovo legion M200 RGB gaming mouse is designed for the beginners and amateur PC gamers\r\nAmbidextrous comfortable design, it is affordable in price but uncompromised in functionality and performance,\r\nLegion M200 features a 5-button design, up to 2400 DPI with 4 levels DPI switch. Adjust DPI on the fly\r\n7-color circulating-backlight for the look and feel with the comfort & strength of a braided cable\r\nIt is easy-to-use and set-up without any extra complicated software', 'In Stock', '61h2zvWh+DL._SL1000_.jpg', 18),
(35, 'Redragon Capricorn P012 Large Gaming Mousepad', 329, 'Redragon capricorn p012 gaming mousepad with stitched edges, premium-textured mouse mat, non-slip rubber base mousepad for laptop, computer and pc - 12.8 x 10 x 0.11 inches\r\nDurable stitched edges: Professionally stitched frame greatly increases lifespan and prevent fraying or peeling of the surface, portable and durable for long term use\r\nUltra-smooth surface: Quality fine mesh cloth allows for optimum speed and accurate control while gaming, experience silky-smooth feel and maximum comfort while you surf the web\r\nWashable design with anti-deformation: This mouse is easy to wash without any deformation and crease and it will not fade with repeated cleaning\r\nPremium design: Waterproof surface, anti-slip rubber base, waterproof coating prevents damage from spilled drinks or other accidents. Heavy duty anti-slip rubber backing keeps it secure in one place\r\nWide applicability: Available for all types of mouse, laser and optical, ideal size (12.8inx10x0.11 inches/32.5cmx26x0.3 cm) for your mouse to move without taking up too much space', 'In Stock', '61lxM9HpYNL._SL1500_.jpg', 19),
(36, 'WAR HAMMER GX1050 Speed Type Gaming Mousepad (XL, Black/Red)', 579, '30.8 X 11.8 INCHES EXTENDED SIZE: This XL mouse pad is large enough to fit your mouse, gaming keyboard and other desk items. Keep a clean, uncluttered desk. This helps to improve the gaming experience for gamers or the work efficiency in the office.\r\nDURABLE MANUFACTURING DESIGN: The durable stitched edges and the high-density premium texture which was processed in a 230°F high temperature and high-pressure chamber to ensure long-term use without deformation and degumming\r\nULTRA-SMOOTH LYCRA COVER: Our gaming mouse pad adopts high-quality Lycra cloth on cover for smooth gliding. It was optimized on fast movement while maintaining excellent accuracy and control. It is compatible with mechanical and optical mice.\r\nWATERPROOF COATING: Effectively prevent damage from spilled drinks or other accidents. When liquid splashes on the coating surface, it will form into water drops and slide down. Just need to wipe it with a piece of wet cloth, and job done.', 'In Stock', '71eXGQ-RWdL._SL1500_.jpg', 19),
(37, 'Redgear MPR800 Soft Base Mousepad with 4 LED Spectrum Mode', 1499, 'Speed-type surface mousepad is designed with the use of great technology and craftsmanship especially for professional gamers\r\n4 LED spectrum mode\r\nFit for all gaming mouse, regardless of sensitivity settings\r\nReliable in-game control of your sensitivity with maximum precision\r\nSuits gamers who need to hit targets faster and more efficiently\r\nExtended size: 78 x 30 cm\r\nSoft non-slip base', 'In Stock', '41mKleO6LpL._SL1000_.jpg', 19),
(38, 'Razer Goliathus Mobile - Soft  Mouse Mat - Small – RZ02-01820220-R3M1', 379, 'At a mere 1.5 mm thin, the Razer Goliathus Mobile is easy to carry with you everywhere. You can either place this slim, durable mouse mat between your laptop screen and keyboard, or roll it up and place it in your bag without worrying about it ever warping.\r\nDesigning a mouse mat for gamers on the go means striking a critical balance of supporting different playstyles on a single mat. The result of extensive research and field-testing is the Razer Goliathus Mobile — fully capable of giving you a smooth glide for swiftness and superb stopping power for control.\r\nMeticulous attention to detail went into the creation of the Razer Goliathus Mobile. The super fine micro texture weave is engineered specifically to work with both optical and laser mouse sensors, providing you with an optimal surface for tournament-grade tracking.\r\nTextured cloth finish for perfect balance between speed and control gameplay\r\nOptimized surface for highly responsive trackin\r\nRubberized base for optimal comfort\r\nApprox. size: 215mm / 8.4 in x 270mm / 10.6 in x 1.5mm / 0.05 in', 'In Stock', '71pgyuzvisl-_sl1500_.jpg', 19),
(39, 'RiaTech Water Resistance Coating Natural Rubber Gaming Mouse Pad with Stitched Edges and Non Slippery Rubber Base - (29.5 x 23 x 0.2 cm) Grey', 229, 'Mouse Pad Size : 12\" x 9.5\". Brand new and high quality, Soft material, comfortable. Underside is skid resistant and practical.\r\nProduct Dimensions : Length : 29.5 cm Width : 23 cm Thickness : 0.4 cm. Good for Latest Mouse,Convenient to take and durable\r\nThe RiaTech Gaming Mouse Pad features a smooth high-quality cloth surface, which promotes effortless, snag-free mouse gliding. The thin, sleek pad helps keep you in complete control and focused on the task at hand. Rubberized Base so no need to worry about the mouse pad slipping away—its steady, rubberized base keeps it securely in place. The mouse pad effectively grips any flat, hard, tabletop surface.\r\nWater Resistance Coating Natural Rubber Gaming Mouse Pad, High non-slip rubber, high toughness, the same type, long life, even more firmly seize the Desktop\r\nlarge size Mouse pad, Gaming Mouse pad, mouse pad for pc, mouse pad for laptop.', 'In Stock', '91RmkTRHqBL._SL1500_.jpg', 19),
(40, 'Redgear MP80 Type Gaming Mousepad (Black/Red)', 625, 'Control-type surface mousepad is designed with the use of great technology and craftsmanship especially for professional gamers\r\nMouse Mat Size: 800mm x 300mm x 3mm\r\nFit for all gaming mouse, regardless of sensitivity settings\r\nSensor reactive coating that reflects more light back to the mouse sensor\r\nGreat design with textured surface for control gameplay\r\nReliable in-game control of your sensitivity with maximum precision\r\nMouse moves the way you want it with zero hindrance', 'In Stock', '41qgZFnLNaL.jpg', 19),
(41, 'Hamee XXL Gaming Mouse Pad with Stitched Edges, Large Mousepad Desk Pad Textured Cloth, Non-Slip Rubber Base, Waterproof Keyboard Pad, Mouse Mat for Gamer 60x30X0.2cm - Black', 395, 'Premium XXL gaming mouse mad for the ultimate gaming experience\r\nStitched edges give the mousepad a superior finish.\r\nThe large mouse pad desk pad is made from premium rubber and lycra\r\nThe rubber base is non-slip and gives a good grip while the lycra top surface allows smooth use of the mouse\r\nSize: 60x30X0.2cm.Can be used for gaming, in homes and offices.', 'In Stock', '61-XlEIUYCL._SL1280_.jpg', 19),
(42, 'NIVERA XXL Rubber Base Mouse Pad, Gaming Desk Mat for Office Laptop & Computer - Black', 549, 'Large and perfect size: the size of this XXL gaming mouse pad is 450*400*2mm. Which will fit your desktop perfectly and provide perfect mouse movement space. Applies to all types of keyboards and mice.\r\nUltra-smooth Surface: The XXL mouse pad designed with high quality material, the smooth surface allows more accurate mouse movement. Optimized for fast movement while maintaining excellent speed and control during your work or game.\r\nNon-slip rubber base: dense slip-resistant shading can firmly grip the desktop to provide stable operation of the mouse and keyboard. It can effectively prevent the mouse and keyboard from sliding and moving.\r\nWater resistant coating: effectively prevent accidental damage from spilled liquid. When liquid splashes on the desk-pad, It\'s easy to clean and will not delay your work or game.\r\nDurable and comfortable material: adopting high elasticity natural rubber material, This mouse & Keyboard mat will provide you with the maximum comfort using experience. The durable stitched edges protect the pad from deformation.', 'In Stock', '71BY7sp6BLL._SL1500_.jpg', 19),
(43, 'Storin Long Extended Waterproof Foldable Mouse Pad with Nonslip Base for Desktop, Keyboard-Mouse (70 x 30 cm)', 349, 'EXTENDED SIZE - 70cm x 30cm x 0.4cm - This mouse pad is large enough to fit your mouse and keyboard.You\'ll have plenty of room for pro-style gaming or completing business tasks all while protecting your desk.\r\nULTRA SMOOTH SURFACE - Smooth surface for more accurate mouse positioning.The gaming mouse pad assists you in winning the games.Definately a Best choice for PC games players.\r\nANTI-SLIP RUBBER BAS - Professional anti-slip rubber base to make sure you still have outstanding performance in intense electronic sports game or a busy business office.\r\nSmooth-Feeling Material and Professional Stiched Edges - The mouse pad surface is made of high-quality rubber material,durable,high-quality stitching on the edge to provide a comfortable user experience.Make sure it doesn\'t wear or break like other mouse pads.\r\nWashable And Non-Toxic- This Gaming pad has a waterproof coating to prevent damage from spilled drinks or other accidents. If something bad happens, e.g. you spill a drink or somehow get food on the keyboard mat, it is convenient to clean by hands. IMPORTANT: DO NOT WASH WITH THE BRUSH.', 'In Stock', '41JCLmOYBXL.jpg', 19),
(44, 'Cmhoo XXL Gaming Mouse Pad Extended & Extra Large Gamepads (80x40 insenlin)', 699, 'Extra Large mouse pad design (31.5*15.7*0.1inches/800mm*400mm*2mm) makes it provide larger area fits both for keyboard and mouse.\r\nLarge, smooth surface area allow better mouse movement\r\nIt is Durable Anti-fray rugged stitching surrounds mouse pad to increase durability\r\nUltra-smooth surface make your exceptional tracking performance and aiming precision with optical and laser technology\r\nStability is very good and Non-slip rubber material base that provides heavy grip preventing sliding or movement of mouse pad', 'In Stock', '71lqvSsohnL._SL1000_.jpg', 19),
(45, 'CORSAIR HS50 - Stereo Gaming Headset - Works with PC, Mac, Xbox One, PS4, Nintendo Switch, iOS and Android(CA-9011170-AP) - Carbon', 4149, 'Plush memory foam and swiveling earcups provide exceptional comfort for hours of gameplay.\r\nLegendary CORSAIR build quality and metal construction ensures long-term durability.\r\nPrecision tuned 50mm neodymium speaker drivers bring superior sound quality with wide range and accuracy.\r\nOptimized unidirectional microphone reduces ambient noise for enhanced voice quality and is fully detachable for use on the go.\r\nMulti-platform compatible with PC, Xbox One*, PS4, Nintendo Switch and mobile devices. *May require Microsoft 3.5mm adapter sold separately.\r\nFor any product related queries contact_us on: [1800-22-1988]', 'In Stock', '61gvkkxvgZL._SL1500_.jpg', 20),
(46, 'Logitech G331 Gaming Headset 6 mm Flip-to-Mute Mic for Playstation 4, Xbox One and Nintendo Switch', 3999, 'Big 50 mm audio drivers produce a complete, expansive sound for a more immersive gaming experience. Your favorite games will finally sound the way they’re supposed to: Amazing\r\n6 mm mic makes sure your squadmates can hear you. Flip-to-mute boom silences you when you don’t want to be heard and folds up out of the way when you don’t need it\r\nYour headphones work with your PC or Mac or with gaming consoles including PlayStation 4, Xbox One, Nintendo Switch, and mobile devices via 3.5 mm cable\r\nEverything about these headphones is about comfort: The deluxe lightweight leatherette ear cups and headband are made to keep pressure off your ears. Ear cups rotate up to 90 degrees for convenience; Conveniently and quickly adjust volume on any platform with the ear-cup mounted volume wheel\r\nFrequency response: 20 Hz-20 KHz . For PC, Console and Mobile Devices', 'In Stock', '51F635OpcQL._SL1024_.jpg', 20),
(47, 'EKSA E3000 Wired Gaming Headset with Stereo Surround Sound, Gaming Chat Headphones with Noise Cancelling Mic, LED Light, Over-Ear Headphones with for Mobile, Laptop, PC, PS4, Nintendo Switch', 2199, 'Sound for games: EKSA game headset has a 50mm neodymium driver. Professional tuners fine tune the cavity, three-dimensional sound effect, high and low frequency smooth strong, real restore all kinds of sounds in the game. The upgraded game headset gives you a higher sense of hearing, so you can hear every detail, whether it\'s the sound of footsteps, friction across the grass or gunshots of the enemy.\r\nNoise cancellation and anti-static microphone: EKSA gaming headset adopts sensitive, omnidirectional, adjustable microphone with noise reduction technology. Reduce ambient and background noise and make sure you hear your friends or teammates clearly at all times. The anti-static technology inside the game headset can prevent static electricity (sound). With in-line controls, you can quickly mute the microphone and adjust the volume without affecting your game.\r\nSuper comfortable headband design: it adopts steel frame headband with strong expansibility and super soft and breathable braided headband, which can perfectly fit all kinds of headforms and disperse the force points. The headband do not feel uncomfortable even after prolong play.\r\nBeautiful marquee design: EKSA gaming headset has a cool appearance design, beautiful metallic luster. With the new RGB light design, 6 colors are alternately displayed on the earmuffs, bringing you cool lights when plugged into the computer. Colorful RGB LED effect and game design add fun to the game.', 'In Stock', '71C3pth8egL._SL1200_.jpg', 20),
(48, 'Redgear Thunder-B 7.1 USB RGB Gaming Headphones with RGB LED Effect, Mic and in-line Controller for PC', 1799, '7.1 surround sound\r\nNoise cancellation microphone\r\nLED Effect on the earcups\r\nCustomization driver\r\nRGB LED Effect, Mic and in-line Controller\r\nCD-rom is given inside the box for the driver and alternatively you can download the software from Redgear website', 'In Stock', '51If0cB0jNL._SL1000_.jpg', 20),
(49, 'Redgear HellFury 7.1 USB Professional Gaming Headphones with LED and Mic for PC', 1424, '7.1 surround sound\r\nLED light\r\nIn-line controller\r\nRetractable microphone\r\nEarmuffs are made of skin-friendly leather material and super soft\r\n2.2m cable speaker Diameter: 50mm\r\nFor activating 7.1 feature uninstall the old driver', 'In Stock', '61ksLSReVEL._SL1500_.jpg', 20),
(50, 'Cosmic Byte Equinox Europa 7.1 USB Dual Driver Gaming Headset with Software, Spectra RGB LED and ENC Microphone', 2199, 'Dual Driver System, 7.1 Surround Sound, Braided Cable, Carrying Pouch for the Headset Included\r\nSpectra RGB LED customizable with Software. LED Effects: Breathing, Neon, Sonix Spectrum (LED reacts to Sound), Wave, Colourful Steady\r\nEnvironmental Noise Cancelling Microphone: The inbuilt Noise cancelling processor cancels out of the unwanted noise from the microphone before sending your voice to the receiver\r\nAuto-Adjustable Headband, Flexible Microphone\r\nHD Audio, On-Cable Controller to control LED lights, ENC, Mic On/off, Surround Sound, Volume Rocker\r\nNote :The headphone is designed to work with PC, PS4. It may not work with other devices', 'In Stock', '61PV9ivbx6L._SL1500_.jpg', 20),
(51, 'Cobra GM-1 Extra Height Gaming Chair', 9499, 'Professional gaming office chair in a solid metal structure\r\nHigh quality washable faux leather\r\nReclining mechanism 135 degrees tilt mechanism\r\n2d arm-rests with adjustable height\r\nHeavy duty caster wheels, with dual colour racing finishing class 4 gas lift', 'In Stock', '61294p7VMGL._SL1200_.jpg', 21),
(52, 'GAMING CHAIR GENESIS NITRO 880 BLACK-BLUE', 16950, 'The Nitro 880 is covered with a durable, and high-quality eco leather. In addition, there are two soft cushions Ãâ‚¬â€œ one as a head rest, and the other one with the adjustable straps.\r\nEvery experienced player knows, that his comfort is one of the most important things, which he should take care of.\r\nThe structure of the Nitro880 was made with high-quality, durable metal.\r\nThe Nitro880 characterises combination of high comfort with many functionalities.\r\nFurthermore, the Nitro880 has adjustable backrest angle, which would be really appreciated among the gamers, who sometimes need some rest or a nap during the long-lasting gameplay.', 'In Stock', '71OAWW5goGL._SL1500_.jpg', 21),
(53, 'Hi-Plus Esports Racing Style High Back Gaming Chair - White & Black', 10995, 'PERFECT FOR GAMING : Hi-Plus Esports Gaming Chair is dedicated to making the best gaming chair for pro gamers. Choose us, and improve your gaming experience ! Dimensions: Backrest height :85cm,Backrest width : 55cm,Seat width : 52cm,Seat depth : 54cm, Maximum weight capacity: 130 Kgs.\r\nESPORTS DESIGN: Strong metal frame designed to help promote a comfortable seated position. Thick padded back & seat take this chair to the next level of comfort.\r\nMULTIFUNCTION: Seat-height adjustable; 90° - 180°reclining and rocking; 360°swivel; 5-point base built with heavy duty; Smooth-rolling casters; Removable headrest pillow and a lumbar cushion.\r\nHIGH-QUALITY MATERIAL: Smooth PU leather, added seat cushion, and lumbar & headrest pillows offer added support and comfort. Heavy-duty base and nylon smooth-rolling casters for great stability and mobility.\r\nHIGH BACKREST : Hi-Plus Esports Gaming Chair, features highest backrest in class of 85cm which makes the gaming chairs even more comfortable and provides a relaxing experience.', 'In Stock', '517Yn-gCvpL._SL1000_.jpg', 21),
(54, 'Savya home by Apex Crusader XI Gaming Office Chair', 10999, '??EASY TO PUT TOGETHER? - Our racing chair comes with all hardware & necessary tools. Follow the gaming chair instruction, you\'ll found easy to set up, and office chair estimated assembly time in about 10-15mins. Racing gaming office adjustable computer desk chair.\r\n??MULTI PURPOSE GAMING CHAIR? - Ergonomic racing chair covered by breathable premium PU leather with freely adjustable lumbar support and headrest pillow protecting your spinal and neck. Easy lock-tilt adjustment with recline angel adjuster, relieve tired feeling and pressure during long gaming or working. Office chair gaming chair computer chair ergonomic chair.\r\n??COMFORTABLE SOFT SEATING ? - We present this brand new high back gaming Chair with a unique appearance and thickly cushioned racing chair for maximum comfort. Soft PU leather office chair perfect addition for you in the office, the study room and the meeting room. Racing chair gaming chair office chair adjustable chair desk chair computer chair.\r\n??360-DEGREE SWIVEL & ALLOY STYLE LARGE CASTERS? - Racing chair are designed with human-oriented ergonomic construction that lasts long, and gaming chair have heavy-duty metal base which pass the BIFMA with 360-degree swivel and nylon smooth-rolling casters, rolling 100000, have great stability and mobility. Office chair computer chair racing chair gaming chair ergonomic chair.\r\n??WE ASSURED? - We guarantee you will love this gaming office chair, but if you’re not satisfied with this executive chair, please get in touch with us. BestOffice chair best service for you. Gaming racing chair Office chair desk chair computer chair ergonomic chair.', 'In Stock', '81jVNIpkIFL._SL1500_.jpg', 21),
(55, 'Hi-Plus Esports Racing Style High Back Gaming Chair with Footrest - Black & Grey', 9999, '[HIGHLY ADJUSTABLE]You can adjust every single part of the racing style gaming chair to perfectly fit the type and height of your body.\r\n[RECLINE LOCKING SYSTEM]This Gaming Chair has 90-135 degree adjustable backrest which can be adjusted to meet comfort of your Back. Great for working, gaming, reading or napping\r\n[LUMBAR & HEADREST PILLOWS]SUPPORTIVE and removable headrest, lumbar support pillow, for extra comfort and protecting your neck and spinal for long time seating/SUITABLE for professional video games\r\n[RETRACTABLE FOOTREST] Equipped with an extendable footrest for position reinforcement which is handy, slides in and out.\r\n[COMFORTABLE CUSHION]High density cushion sponges will ensure long-term non-deformation. It has good water resistance and high resilience, provide you a safety feeling and prevent pain for a long time sitting.', 'In Stock', '51lfg6rC7LL._SL1000_.jpg', 21),
(56, 'Ant Esports WB-8077 Red PU + PVC Black Metal Frame, 80mm Class 4 Gas Fit, 350mm Metal Base, Adjustable Backrest Angle 90-135 Degree Gaming Chair (8077 Red)', 8299, 'Form type: high density foam / foam denity: 30 density / chair cover material: pu + pvc\r\nFrame colour: black painting / frame construction: metal frame / rocking range: about 15 degrees\r\nMechanism type: butterfly / gas lift: 80mm class 2 gas fit / tilt lock: yes\r\nBase: 350mm silver painting metal base / adjustable backrest angle: 90-135 degree\r\nCaster size, material: 350mm black colour pu casters / assembly equired: yes', 'In Stock', '61o9kRVrTwL._SL1000_.jpg', 21);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(30) NOT NULL,
  `team_score` int(11) NOT NULL,
  `no_of_player` int(11) NOT NULL,
  `place_pts` int(11) NOT NULL,
  `t_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `team_name`, `team_score`, `no_of_player`, `place_pts`, `t_id`) VALUES
(6, 'KoreanWarriors', 0, 2, 0, 6),
(7, 'Entity', 0, 2, 0, 6),
(8, 'Team Liquid', 26, 3, 10, 9),
(9, 'Indian Rivals', 38, 3, 20, 9),
(10, 'Bigetron eSports', 0, 4, 0, 2),
(11, 'Xquest Force', 0, 4, 0, 2),
(13, 'FNATIC', 0, 4, 0, 2),
(14, 'Dallas Empire', 0, 4, 0, 13),
(15, 'FNATIC', 24, 4, 22, 11),
(16, 'MegaStars', 40, 4, 30, 11),
(17, 'Team Elves', 21, 4, 14, 11),
(18, 'Super Girls', 10, 4, 8, 11),
(19, 'Minus 40', 24, 4, 16, 11),
(20, 'Brawlerss', 12, 4, 10, 11),
(21, 'vsgCRAWLERS', 17, 4, 12, 11),
(22, 'Team 8BIT', 24, 4, 19, 11),
(23, 'Team SouL', 7, 4, 5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tournament`
--

CREATE TABLE `tournament` (
  `t_id` int(11) NOT NULL,
  `t_name` text NOT NULL,
  `t_desc` text NOT NULL,
  `player_limit` int(11) NOT NULL,
  `re_player` int(11) NOT NULL,
  `team_limit` int(11) NOT NULL,
  `activate_result` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `reg_open` int(11) NOT NULL,
  `game_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament`
--

INSERT INTO `tournament` (`t_id`, `t_name`, `t_desc`, `player_limit`, `re_player`, `team_limit`, `activate_result`, `start_date`, `finish_date`, `reg_open`, `game_id`) VALUES
(2, 'Squad Pubg tournament', 'Pride Competitive eSports is hosting daily tournaments that are FREE TO ENTER!\r\n- All Countries are allowed to play\r\n- All Servers are allowed to play\r\n- All Ages are allowed to play\r\n- Squad Matches 4 vs 4', 60, 12, 4, 0, '2022-02-20', '2022-02-26', 1, 2),
(3, 'Free Fire Custom Rooms Solo', '2 Classic Matches\r\n\r\nKill Point - 20 points /kill\r\n1st Position - 300 points\r\n2nd Position - 200 points\r\n3rd Position - 170 points\r\n4th Position - 135 points\r\n5th Position -105 points\r\n6th Position - 80 points\r\n7th Position - 60 points\r\n8th Position - 45 points\r\n9th Position - 30 points\r\n10th Position - 20 points\r\n\r\nRoom Joining Description will be declaredefore 10 minutes of starting match', 10, 7, 1, 1, '2022-02-21', '2022-03-12', 0, 3),
(6, 'Pubg Mobile Duo Tournament', '- 2 Matches per day\r\n   - 1st Erangle ( 4:30 IST )\r\n   - 2nd Sanhok ( 5:30 IST )\r\n- Total 5 days', 50, 4, 2, 0, '2022-02-26', '2022-02-29', 1, 2),
(9, 'Apex Legends Squad Tournament', 'Total 5 matches in 5 days\r\nat 5:30 IST\r\n\r\n1 kill —  1 point\r\n\r\n1st — 12 points\r\n2nd — 9 points\r\n3rd — 7 points\r\n4th — 5 points\r\n5th — 4 points\r\n6th - 10th — 2 points\r\n11th - 15th — 1 point\r\n16th - 20th — 0 points', 60, 6, 3, 0, '2022-02-21', '2022-02-28', 1, 5),
(10, 'Cosmo Intercampus PUBG Tournament 2022', 'Welcome to COSMO PUBG INTERCAMPUS Tournament 2022!\r\n\r\n30 players battle in a 3-round match to find the ultimate COSMO Winner, Winner Chicken Dinner 2022!\r\n\r\nYou may find out more on the players and the results in this page.\r\n\r\nRank score\r\n1=300\r\n2=225\r\n3=190\r\n4=165\r\n5=145\r\n6=130\r\n7=115\r\n8=100\r\n9=85\r\n10=70\r\n11-12=60\r\n13-15=50\r\n16-20=40\r\n21-30=30\r\n\r\n1 Kill=10', 30, 0, 1, 1, '2022-02-26', '2022-02-28', 0, 2),
(11, 'PUBG Mobile Squad Tournament', 'Match Information\r\nMap :- Erangel\r\nFormat :- Squad (TPP)\r\nServer :- Asia\r\n\r\nDate\r\n27 Feb, 2022\r\n\r\nTime\r\n7:00 pm\r\n\r\nID and PASSWORD\r\nThe In Game Leader (IGL) will automatically get it in website notification where room id and password will send 15 min before the match.\r\nIt is the responsibility of the In Game Leader (IGL) to forward\r\nThe ID and PASSWORD with teammates.\r\n\r\n1 30\r\n2 22\r\n3 19\r\n4 16\r\n5 14\r\n6 12\r\n7 10\r\n8 8\r\n9 5\r\n10 2\r\n\r\n1 kill 1 points', 40, 36, 4, 1, '2022-02-26', '2022-02-28', 0, 2),
(12, 'Nepal National Pro Scrims League Season 11', 'Only Team Leader has to register the battle and have to provide Team Member\'s Details.\r\n\r\nThis League is only for Indian Players.\r\nIt’s Pubg Mobile Squad Battle.\r\nThis is Online Event.\r\n\r\nDate: 28th February 2022\r\nTime: 9:00 AM IST\r\nMap: Erangle, TPP\r\nType: Squad battle\r\nServer: Asia\r\nMatch Placement	Points Awarded\r\n1ST	10\r\n2ND	6\r\n3RD	5\r\n4TH	4\r\n5TH	3\r\n6TH	2\r\n7TH	1\r\n8TH	1\r\n9TH – 16TH	0', 64, 0, 4, 0, '2022-02-14', '2022-02-29', 1, 2),
(13, 'Arw Alpha & Play To Slay', '* Players should register their Team members with team Name.\r\n* Team members should be 4 and one substitute will be allowed.\r\n* Match will starts at Sharply in case of late comer organizer will not be responsible.\r\n* If found any indisciplinary action that team will be terminated.\r\n\r\nKill Point - 20 points /kill\r\n1st Position - 300 points\r\n2nd Position - 200 points\r\n3rd Position - 170 points\r\n4th Position - 135 points\r\n5th Position -105 points\r\n6th Position - 80 points\r\n7th Position - 60 points\r\n8th Position - 45 points\r\n9th Position - 30 points\r\n10th Position - 20 points\r\n11th Position - 10 points\r\n12th Position - 0 point', 48, 4, 4, 0, '2022-02-27', '2022-03-06', 1, 3),
(15, 'Free Fire Open Tournaments For Duo', 'Kill Point - 20 points /kill\r\n1st Position - 300 points\r\n2nd Position - 200 points\r\n3rd Position - 170 points\r\n4th Position - 135 points\r\n5th Position -105 points\r\n6th Position - 80 points\r\n7th Position - 60 points\r\n8th Position - 45 points\r\n9th Position - 30 points\r\n10th Position - 20 points\r\n11th Position - 10 points\r\n12th Position - 0 point\r\n\r\nMatchs starts at 1st March 2022, 530:Pm Onwards\r\n\r\nTotal 3 Matches', 24, 0, 2, 0, '2022-02-28', '2022-02-29', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `email` varchar(254) NOT NULL,
  `user_dob` date NOT NULL DEFAULT '2000-07-20',
  `user_gender` varchar(10) DEFAULT NULL,
  `password` text NOT NULL,
  `contact` varchar(15) NOT NULL,
  `is_admin` int(11) DEFAULT '0',
  `otp` varchar(10) DEFAULT NULL,
  `otp_used` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `user_dob`, `user_gender`, `password`, `contact`, `is_admin`, `otp`, `otp_used`) VALUES
(1, 'Sireen Gothadiya', 'er.sireen@gmail.com', '2000-07-20', 'Male', '9328832720', '9773055968', 1, '66944', 1),
(2, 'Parth Patel', 'mr.parthbavishi@gmail.com', '2000-06-11', 'Male', '9714123036', '9714123036', 0, '20118', 0),
(4, 'Mansi Chauhan', 'mansi.j.chauhan@gmail.com', '2000-06-09', 'Female', 'Mansi123', '9773471518', 0, '', NULL),
(5, 'Umang Modi', 'umangmodi652000@gmail.com', '2000-05-06', 'Male', 'Umang123', '8440848622', 0, '', NULL),
(9, 'Ravi Prajapati', 'prajapatiranjit@gmail.com', '2019-12-18', 'Male', 'Ravi123', '8440848622', 0, '', NULL),
(10, 'Dhruvik Patel', 'pateldhruvik401@gmail.com', '1997-11-04', 'Male', 'Dhruvik401', '8320748304', 0, '', 0),
(11, 'Jerry Limbasiya', 'jerry6261@gmail.com', '2000-08-11', 'Male', 'Jerry131', '8530227750', 0, '65337', 1),
(12, 'Devangi Rajput', 'devangi.rj@gmail.com', '1999-12-17', 'Female', 'Devangi123', '2986226614', 0, '', 0),
(13, 'Sarah Smith', 'marisolking70@gmail.com', '2000-07-11', 'Female', 'Sarah123', ' 0451653469', 0, NULL, 0),
(14, 'Wilma Schmidt', 'wilma.schmidt@gmail.com', '1986-03-01', 'Female', 'Wilma123', ' 3425379384\r\n', 0, NULL, 0),
(15, 'Walter Morgan', 'walter.morgan@gmail.com', '2000-07-03', 'Male', 'Walter123', '835843909', 0, NULL, 0),
(16, 'Tara Payne', 'tara.payne@gmail.com\r\n\r\n', '2000-07-05', 'Female', 'Tara123', '4648364856', 0, NULL, 0),
(17, 'Ben Green', 'ben.green@gmail.com', '2000-07-06', 'Male', 'Ben123', '1833909742', 0, NULL, 0),
(18, 'Alexa Peters', 'alexa.peters@gmail.com', '2000-07-07', 'Female', 'Alexa123', '6500055121', 0, NULL, 0),
(19, 'Reginald Hopkins', 'reginald.hopkins@yahoo.com', '2000-05-21', 'Male', 'Regina123', '6360210295', 0, NULL, 0),
(20, 'Cody Duncan', 'cody.duncan@gmail.com', '2000-10-20', 'Male', 'Cody123', '2967236428', 0, NULL, 0),
(21, 'Bernice Powell', 'bernice.powell@example.com', '2000-07-14', 'Female', 'Berni123', '1532469039', 0, NULL, 0),
(22, 'Elijah Rivera', 'elijah.rivera@gmail.com', '2000-07-14', 'Male', 'Elijah12', '2691795641', 0, NULL, 0),
(23, 'Anita Rogers', 'anita.rogers@gmail.com', '2000-03-20', 'Male', 'Anita123', '3975696350', 0, NULL, 0),
(24, 'Barry Neal', 'barry.neal@gmail.com', '1999-02-20', 'Male', 'Barry123', '0978838862', 0, NULL, 0),
(25, 'Jerry Patel', 'jerry626131@gmail.com', '2000-07-20', 'Male', 'Sireen123', '9773055968', 0, '', 0);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`contact_id`);

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
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `feedback_p_id_8fe5a8b2_fk_product_p_id` (`p_id`),
  ADD KEY `feedback_user_id_0104a377_fk_users_user_id` (`user_id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`game_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`n_id`),
  ADD KEY `o_id` (`o_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `order_user_id_e323497c_fk_users_user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`o_details_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `payment_o_id_9444e53e_fk_order_o_id` (`o_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `player_t_id_e68c77d4_fk_tournament_t_id` (`t_id`),
  ADD KEY `player_team_id_84ef9586_fk_team_team_id` (`team_id`),
  ADD KEY `player_user_id_a471e98c_fk_users_user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `product_c_id_ebbba084_fk_category_c_id` (`c_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `tournament`
--
ALTER TABLE `tournament`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `tournament_game_id_cbf8529a_fk_Game_game_id` (`game_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `o_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tournament`
--
ALTER TABLE `tournament`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`p_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_p_id_8fe5a8b2_fk_product_p_id` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  ADD CONSTRAINT `feedback_user_id_0104a377_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `order` (`o_id`),
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`t_id`) REFERENCES `tournament` (`t_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_user_id_e323497c_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`o_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`p_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_o_id_9444e53e_fk_order_o_id` FOREIGN KEY (`o_id`) REFERENCES `order` (`o_id`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_t_id_e68c77d4_fk_tournament_t_id` FOREIGN KEY (`t_id`) REFERENCES `tournament` (`t_id`),
  ADD CONSTRAINT `player_team_id_84ef9586_fk_team_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  ADD CONSTRAINT `player_user_id_a471e98c_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_c_id_ebbba084_fk_category_c_id` FOREIGN KEY (`c_id`) REFERENCES `category` (`c_id`);

--
-- Constraints for table `tournament`
--
ALTER TABLE `tournament`
  ADD CONSTRAINT `tournament_game_id_cbf8529a_fk_Game_game_id` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
