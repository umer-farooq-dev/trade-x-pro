-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2025 at 03:49 AM
-- Server version: 11.4.8-MariaDB-cll-lve-log
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bahrstmb_tradexpro`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `invitation_code` varchar(255) DEFAULT NULL,
  `isSubAdmin` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `invitation_code`, `isSubAdmin`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'ibsoft0786@gmail.com', 'admin', NULL, '6346ab2e6449f1665575726.png', '$2y$10$/RyZxNX1yzcq/8vjEpGnpODqhAnQAA93cBduSdJjDv0opwtEoZw8G', 'QEjOx97S08vt3yj6kHGRrJDT2QCcgXDa2utcZfxQnbK6E3CDsL8dEszAH5fG', NULL, 0, NULL, '2022-10-12 09:25:27'),
(3, 'SubAdmin', 'subadmin@gmail.com', 'subadmin', NULL, '6346ab2e6449f1665575726.png', '$2y$10$dfkBGd1NsMEjUq8iMrOgQeDBwB6kikiWw19qszpEu97YU87LT5hmy', 'ATSYcddXj9oZQPzFl9ZPYXdT1dy1AoIfpYM8mmsrFhi1IoXWCBl28UURZDI4', 'testcode', 1, NULL, '2022-10-12 09:25:27'),
(4, 'newsubadmin', 'newsubadmin@gmail.com', 'newsubadmin', NULL, NULL, '$2y$10$YjJGTBmOhvZEaDDUebZiXe273xxZMRf0DgMQLrzO7n.1buXRDPyWq', NULL, 'I1eCNsGYms', 1, '2025-04-11 11:33:49', '2025-04-11 11:33:49'),
(5, 'Hamza', 'hamza@gmail.com', 'hamzamalik', NULL, NULL, '$2y$10$biopd7p3qQuf3ng0VJ2KMO.GPvu2hdFzmCJ3HS8cFifvcSmQaLbni', 'PnihK1fhPpwFjSoGSJpODXikzCwm9qOTL24KGHiLNYFObwNp0IQ90a9O9WMf', '2GseQ99rfx', 1, '2025-04-15 23:02:06', '2025-04-15 23:02:06'),
(6, 'moonsoon', 'moonsoon@gmail.com', 'moonsoon', NULL, NULL, '$2y$10$r9aQ.CkOvMKne7EbWST7y.cWhtpjv1.i9/SLE3FEMQG3rims7MJvu', 'YXY7VJA5LNjKB7RTGwATs4MQ9JkOsnxcrGkPvPRBdHOv9g9py12nD0VAGL9t', 'tzK64L5hFs', 1, '2025-04-18 14:09:20', '2025-04-18 14:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `is_read`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'New member registered', 0, '/admin/users/detail/1', '2025-04-09 10:08:36', '2025-04-09 10:08:36'),
(2, 1, 'New withdraw request from awaamalik', 0, '/admin/withdraw/details/1', '2025-04-09 10:12:46', '2025-04-09 10:12:46'),
(3, 2, 'New member registered', 0, '/admin/users/detail/2', '2025-04-09 14:15:26', '2025-04-09 14:15:26'),
(4, 3, 'New member registered', 0, '/admin/users/detail/3', '2025-04-11 11:18:19', '2025-04-11 11:18:19'),
(5, 4, 'New member registered', 0, '/admin/users/detail/4', '2025-04-11 14:08:20', '2025-04-11 14:08:20'),
(6, 5, 'New member registered', 0, '/sub-admin/users/detail/5', '2025-04-15 08:57:01', '2025-04-15 08:57:01'),
(7, 6, 'New member registered', 0, '/sub-admin/users/detail/6', '2025-04-15 09:00:37', '2025-04-15 09:00:37'),
(8, 7, 'New member registered', 0, '/sub-admin/users/detail/7', '2025-04-15 09:03:22', '2025-04-15 09:03:22'),
(9, 8, 'New member registered', 0, '/sub-admin/users/detail/8', '2025-04-15 09:05:47', '2025-04-15 09:05:47'),
(10, 9, 'New member registered', 0, '/sub-admin/users/detail/9', '2025-04-15 09:10:30', '2025-04-15 09:10:30'),
(11, 10, 'New member registered', 0, '/sub-admin/users/detail/10', '2025-04-15 09:44:46', '2025-04-15 09:44:46'),
(12, 11, 'New member registered', 0, '/sub-admin/users/detail/11', '2025-04-15 23:03:42', '2025-04-15 23:03:42'),
(13, 12, 'New member registered', 0, '/sub-admin/users/detail/12', '2025-04-15 23:09:11', '2025-04-15 23:09:11'),
(14, 13, 'New member registered', 0, '/sub-admin/users/detail/13', '2025-04-18 14:10:57', '2025-04-18 14:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection_information`
--

CREATE TABLE `collection_information` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `collection_information`
--

INSERT INTO `collection_information` (`id`, `user_id`, `data`, `created_at`, `updated_at`) VALUES
(1, 3, '\"{\\\"full_name\\\":\\\"Zarak\\\",\\\"bank_name\\\":\\\"Zarak\\\",\\\"account_number\\\":\\\"123456789\\\",\\\"ifsc\\\":\\\"123456789\\\"}\"', '2025-04-11 17:21:04', '2025-04-11 17:21:04'),
(2, 3, '\"{\\\"full_name\\\":\\\"zaraaa\\\",\\\"bank_name\\\":\\\"Zarak\\\",\\\"account_number\\\":\\\"123456789\\\",\\\"ifsc\\\":\\\"123456789\\\"}\"', '2025-04-11 17:24:28', '2025-04-11 17:24:28');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(90) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto_currencies`
--

CREATE TABLE `crypto_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `image` varchar(40) DEFAULT NULL,
  `symbol` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Disable : 0, Enable : 1',
  `price` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rank` bigint(20) NOT NULL DEFAULT 0,
  `one_hour` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `twenty_four` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `seven_day` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `market_cap` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `volume_24h` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `circulating_supply` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crypto_currencies`
--

INSERT INTO `crypto_currencies` (`id`, `name`, `image`, `symbol`, `status`, `price`, `rank`, `one_hour`, `twenty_four`, `seven_day`, `market_cap`, `volume_24h`, `circulating_supply`, `created_at`, `updated_at`) VALUES
(1, 'Bitcoin', '67f6104cc3b791744179276.png', 'BTC', 1, 84488.91508721, 1, -0.08770255, 0.04661499, 2.54464521, 1677356319003.50000000, 20645293696.51100000, 19852975.00000000, '2025-04-09 10:14:37', '2025-04-18 14:10:04'),
(2, 'Ethereum', '67f6454faa7151744192847.png', 'ETH', 1, 1587.37192028, 2, 0.18187757, -0.50330516, 1.86262116, 191596814241.27000000, 10972502607.77700000, 120700644.75363000, '2025-04-09 14:00:47', '2025-04-18 14:10:04'),
(3, 'Tether', '67f6456d6fe7e1744192877.png', 'USDT', 1, 0.99985053, 3, 0.00057508, 0.01249617, 0.06057172, 144774879551.66000000, 44575351992.57000000, 144796521706.92000000, '2025-04-09 14:01:17', '2025-04-18 14:10:04'),
(4, 'XRP', '67f64593a8b861744192915.png', 'XRP', 1, 2.07482360, 4, -0.01465696, -0.98494308, 3.05313244, 121041353240.64000000, 2385252568.12770000, -1791400460.00000000, '2025-04-09 14:01:55', '2025-04-18 14:10:04'),
(5, 'BNB', '67f645baf0b781744192954.png', 'BNB', 1, 589.34147963, 5, -0.01726094, 0.58999124, 1.26952181, 83032886850.48000000, 1433447867.69030000, 140890960.03000000, '2025-04-09 14:02:35', '2025-04-18 14:10:04'),
(6, 'Solana', '67f64606e80ad1744193030.png', 'SOL', 1, 134.52942429, 6, -0.14706591, 0.80439603, 13.71102922, 69467483131.22400000, 3018620340.56970000, 516373897.35593000, '2025-04-09 14:03:51', '2025-04-18 14:10:04'),
(7, 'Dogecoin', '67f646211d4e51744193057.jpg', 'DOGE', 1, 0.15527230, 9, -0.03469916, -0.61307425, -2.07335193, 23120336508.60100000, 568167651.18641000, 148901876383.71000000, '2025-04-09 14:04:17', '2025-04-18 14:10:04'),
(8, 'Cardano', '67f6464321b941744193091.png', 'ADA', 1, 0.61446786, 10, -0.15849183, -0.22326056, -2.52849630, 21682797832.08100000, 427398143.89285000, 35287114426.69200000, '2025-04-09 14:04:51', '2025-04-18 14:10:04'),
(9, 'Stacks', '67f6468bd156f1744193163.png', 'STX', 1, 0.59310609, 66, 0.22915024, 1.89620316, -4.24751997, 902726666.63125000, 16509145.98749800, 1522032360.81540000, '2025-04-09 14:06:03', '2025-04-18 14:10:04'),
(10, 'Binance USD', '67f646b0cc9da1744193200.png', 'BUSD', 1, 0.99994172, 438, -0.01066351, -0.01842966, -0.01403113, 57789299.99269400, 2050124.97606820, 57792668.00411200, '2025-04-09 14:06:40', '2025-04-18 14:10:04'),
(11, 'Polygon', '67f646d2a68251744193234.png', 'MATIC', 1, 0.00000000, 0, 0.94901808, 2.78247204, 1.73021710, 0.00000000, 1267062.58777200, 0.00000000, '2025-04-09 14:07:14', '2025-04-18 14:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text DEFAULT NULL,
  `btc_amo` varchar(255) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `payment_try` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL COMMENT 'object',
  `support` text DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2022-03-22 05:22:24'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2023-02-28 08:49:24'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2023-02-28 08:49:22'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, '2022-03-22 05:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(7, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-17 02:56:14', '2022-10-13 06:13:55'),
(20, 'withdraw_method', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"bank_name\":{\"name\":\"Bank name\",\"label\":\"bank_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"account_number\":{\"name\":\"Account Number\",\"label\":\"account_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"},\"ifsc\":{\"name\":\"IFSC\",\"label\":\"ifsc\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"}}', '2025-04-09 10:06:17', '2025-04-10 10:02:21'),
(21, 'withdraw_method', '[]', '2025-04-10 17:36:57', '2025-04-10 17:36:57');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_keys` varchar(40) NOT NULL,
  `data_values` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(39, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Get 100% payout on as little as 0.1 pip\",\"sub_heading\":\"A trading platform for online trading and investments from the broker Olymp Trade. Start earning money with millions of traders worldwide\",\"button_name\":\"Get Started\",\"button_url\":\"http:\\/\\/localhost\\/highlowNew\\/\",\"background_image\":\"608919b35c94e1619597747.jpg\",\"hero_image\":\"608919c858e481619597768.png\"}', '2021-03-20 06:45:10', '2021-05-04 00:40:22'),
(41, 'banner.element', '{\"has_image\":[\"1\"],\"background_image\":\"60891a5905b791619597913.png\"}', '2021-03-20 07:04:15', '2021-04-28 02:18:33'),
(42, 'banner.element', '{\"has_image\":[\"1\"],\"background_image\":\"60891a4f407e01619597903.png\"}', '2021-03-20 07:04:22', '2021-04-28 02:18:23'),
(43, 'banner.element', '{\"has_image\":[\"1\"],\"background_image\":\"60891a475d57f1619597895.png\"}', '2021-03-20 07:04:25', '2021-04-28 02:18:15'),
(44, 'banner.element', '{\"has_image\":[\"1\"],\"background_image\":\"60891a3fbf2dc1619597887.png\"}', '2021-03-20 07:09:49', '2021-04-28 02:18:07'),
(45, 'trade.content', '{\"heading\":\"Make a Quick Trade\",\"sub_heading\":\"Unfortunately, the idea that this kind of trading is some kind of \\\"get-rich-quick\\\" scheme persists. Some people day trade without sufficient knowledg\",\"trade_tab_1\":\"I\'m a Beginner\",\"trade_tab_2\":\"I\'m an Expert\"}', '2021-03-20 07:18:39', '2021-05-04 00:59:52'),
(46, 'get_started.content', '{\"heading\":\"Get Started Now for instant Cashback\",\"button_name\":\"Get Started\",\"button_url\":\"user\\/register\"}', '2021-03-20 07:26:45', '2023-02-14 09:23:00'),
(48, 'predict.content', '{\"heading\":\"We have differents type of predict\",\"sub_heading\":\"There is a third type of prediction, which is different from the previous two. In the example, we need to have some sort of understanding.\"}', '2021-03-20 23:23:18', '2021-05-04 01:01:13'),
(49, 'predict.element', '{\"title\":\"Turbo Spread\",\"description\":\"Richard McClintock, a Latin scholar from Hampden-Sydney College, is credited with discovering the source behind the ubiquitous filler text. In seeing a sample\",\"icon\":\"<i class=\\\"las la-helicopter\\\"><\\/i>\",\"button_name\":\"Try Quick Demo\",\"button_url\":\"login\"}', '2021-03-20 23:25:10', '2021-05-06 23:29:20'),
(50, 'predict.element', '{\"title\":\"Highlow Options\",\"description\":\"McClintock\'s eye for detail certainly helped narrow the whereabouts of lorem ipsum\'s origin, however, the \\u201chow and when\\u201d still remain something of a mystery, with competing theories and timelines\",\"icon\":\"<i class=\\\"las la-life-ring\\\"><\\/i>\",\"button_name\":\"Try Quick Demo\",\"button_url\":\"login\"}', '2021-03-20 23:27:00', '2021-05-06 23:29:24'),
(51, 'predict.element', '{\"title\":\"Trade\",\"description\":\"McClintock\'s eye for detail certainly helped narrow the whereabouts of lorem ipsum\'s origin, however, the \\u201chow and when\\u201d still remain something of a mystery, with competing theories and timelines\",\"icon\":\"<i class=\\\"lab la-grav\\\"><\\/i>\",\"button_name\":\"Try Quick Demo\",\"button_url\":\"login\"}', '2021-03-20 23:27:53', '2021-05-06 23:29:27'),
(52, 'predict.element', '{\"title\":\"Demo Trade\",\"description\":\"McClintock\'s eye for detail certainly helped narrow the whereabouts of lorem ipsum\'s origin, however, the \\u201chow and when\\u201d still remain something of a mystery, with competing theories and timelines\",\"icon\":\"<i class=\\\"lar la-grin-squint-tears\\\"><\\/i>\",\"button_name\":\"Get Started\",\"button_url\":\"login\"}', '2021-03-20 23:28:25', '2021-05-06 23:29:31'),
(53, 'predict.element', '{\"title\":\"Turbo Spread\",\"description\":\"McClintock\'s eye for detail certainly helped narrow the whereabouts of lorem ipsum\'s origin, however, the \\u201chow and when\\u201d still remain something of a mystery, with competing theories and timelines\",\"icon\":\"<i class=\\\"lar la-futbol\\\"><\\/i>\",\"button_name\":\"Try Quick Demo\",\"button_url\":\"login\"}', '2021-03-20 23:29:08', '2021-05-06 23:29:34'),
(54, 'predict.element', '{\"title\":\"HIGHLOW OPTIONS\",\"description\":\"What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?\",\"icon\":\"<i class=\\\"las la-laugh-beam\\\"><\\/i>\",\"button_name\":\"Try Quick Demo\",\"button_url\":\"login\"}', '2021-03-20 23:29:27', '2021-05-06 23:29:38'),
(55, 'feature.content', '{\"heading\":\"Why Trade with Us\",\"sub_heading\":\"Basic economic concept involving the buying and selling of goods and services, with compensation paid by a buyer to a seller\"}', '2021-03-21 00:17:42', '2021-05-04 00:59:03'),
(56, 'feature.element', '{\"feature_icon\":\"<i class=\\\"las la-hockey-puck\\\"><\\/i>\",\"title\":\"Amazing Support\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:18:51', '2021-03-21 00:18:51'),
(57, 'feature.element', '{\"feature_icon\":\"<i class=\\\"lar la-kiss-wink-heart\\\"><\\/i>\",\"title\":\"Best Payout\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:39:48', '2021-03-21 00:39:48'),
(58, 'feature.element', '{\"feature_icon\":\"<i class=\\\"las la-level-up-alt\\\"><\\/i>\",\"title\":\"Quick Fund Access\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:40:17', '2021-03-21 00:40:17'),
(59, 'feature.element', '{\"feature_icon\":\"<i class=\\\"las la-memory\\\"><\\/i>\",\"title\":\"Cashback Options\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:40:41', '2021-03-21 00:40:41'),
(60, 'feature.element', '{\"feature_icon\":\"<i class=\\\"las la-journal-whills\\\"><\\/i>\",\"title\":\"Best Payout\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:41:03', '2021-03-21 00:41:03'),
(61, 'feature.element', '{\"feature_icon\":\"<i class=\\\"las la-microchip\\\"><\\/i>\",\"title\":\"Best Payout\",\"short_details\":\"Possimus atque magnam autem ad porro, molestias id quaerat, a nihil numquam animi quidem!\"}', '2021-03-21 00:41:27', '2021-03-21 00:41:27'),
(62, 'app.content', '{\"has_image\":\"1\",\"heading\":\"Now It\'s more easy to make a invest by mobile\",\"sub_heading\":\"Numquam sunt dolorum repudiandae commodi culpa ipsam fugit. Facilis, nostrum impedit. Excepturi, delectus nihil? Beatae voluptate earum debitis quas dolorem minus quae! Dolore, voluptas vitae nisi qui, eaque fuga blanditiis vero ratione pariatur error facere consequatur odio quae esse placeat? Assumenda, a ea. Saepe, dolore optio at sunt aliquid dolores minima veniam!\",\"button_one_url\":\"#\",\"button_two_url\":\"#\",\"background_image\":\"6056f1d0ac9261616310736.png\"}', '2021-03-21 01:12:16', '2023-01-07 07:14:55'),
(63, 'blog.content', '{\"heading\":\"Latest News Tips\",\"sub_heading\":\"Quos libero quae fugiat id adipisci error iste beatae eaque incidunt, mollitia similique enim sapiente perferendis alias assumenda\"}', '2021-03-21 01:21:57', '2021-05-04 00:44:14'),
(68, 'footer.content', '{\"heading\":\"Asccusamus illo molestias maiores aut? Provident inventore dolorum minus dolorem ab illum fugiat labore facere porro nesciunt corrupti animi\"}', '2021-03-21 02:03:07', '2021-03-21 02:06:11'),
(69, 'footer.element', '{\"menu\":\"Privacy\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', '2021-03-21 02:03:38', '2021-05-04 00:45:29'),
(70, 'footer.element', '{\"menu\":\"Terms\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">We Don\'t support any child porn or such material.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No harassing material that may cause people to retaliate against you.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No phishing pages.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious Botnets are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Php\\/CGI proxies are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">CGI-IRC is strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Terms &amp; Conditions for Users<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Support<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Hang tight for additional update discharge.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Ownership<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Warranty<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Unauthorized\\/Illegal Usage<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Fiverr, Seoclerks Sellers Or Affiliates<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Payment\\/Refund Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Free Balance \\/ Coupon Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/p><\\/div>\"}', '2021-03-21 02:04:32', '2021-05-04 00:46:11'),
(71, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2021-03-21 02:08:27', '2021-03-21 02:08:27'),
(72, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"twitter.com\"}', '2021-03-21 02:09:00', '2021-03-21 02:10:57'),
(73, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"url\":\"instagram.com\"}', '2021-03-21 02:09:20', '2021-03-21 02:11:10'),
(74, 'social_icon.element', '{\"social_icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"linkedin.com\"}', '2021-03-21 02:09:35', '2021-03-21 02:11:28'),
(75, 'subscribe.content', '{\"heading\":\"Subscribe our newsletter to get regullar news and  tips. we promise we won\'t harass you. Provident inventore dolorum minus\"}', '2021-03-21 02:12:55', '2021-05-04 01:01:57'),
(76, 'contact_us.content', '{\"address\":\"77 St. Road, LAS VEGAS United States\",\"email\":\"contact@tradeness.com\",\"number\":\"+1 765443899\"}', '2021-03-21 07:15:03', '2025-04-09 13:35:30'),
(77, 'faq.element', '{\"question\":\"Libero ipsam recusandae omnis laudantium cum ratione, voluptates, numquam illum iusto, at repellendus?\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book\"}', '2021-03-22 01:09:15', '2021-03-22 01:09:15'),
(78, 'faq.element', '{\"question\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book\"}', '2021-03-22 01:09:25', '2021-03-22 01:09:25'),
(79, 'faq.element', '{\"question\":\"Libero ipsam recusandae omnis laudantium cum ratione, voluptates, numquam illum iusto, at repellendus?\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\"}', '2021-03-22 01:09:33', '2021-03-22 01:09:33'),
(80, 'faq.element', '{\"question\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\"}', '2021-03-22 01:10:04', '2021-03-22 01:10:04'),
(81, 'faq.element', '{\"question\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\"}', '2021-03-22 01:10:23', '2021-03-22 01:10:23'),
(82, 'faq.element', '{\"question\":\"Libero ipsam recusandae omnis laudantium cum ratione, voluptates, numquam illum iusto, at repellendus?\",\"answers\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.\"}', '2021-03-22 01:10:30', '2021-03-22 01:10:30'),
(83, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"605ed645dc0fa1616827973.jpg\"}', '2021-03-27 00:52:53', '2021-03-27 00:52:54'),
(84, 'crypto_price.content', '{\"heading\":\"Today\'s Cryptocurrency Prices\",\"sub_heading\":\"lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have\"}', '2021-03-28 12:51:19', '2021-04-28 01:04:09'),
(85, 'footer.element', '{\"menu\":\"Overview\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We endeavor to make our clients happy with the item they\'ve bought from us. In case you\'re experiencing difficulty with excellent items or trust it is blemished, or potentially you\'re feeling baffled, at that point please present a pass to our Helpdesk to report your inadequate item and our team will help you at the earliest opportunity. For a harmed content, augmentation or layout, we will demand from you a connection and add a screen capture of the issue to be shipped off our help administration.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Refund Is Not Possible When:<\\/h3><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">The framework turns out great on your side yet includes don\'t match or you may have thought something different.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Your necessities are currently modified and you needn\'t bother with the Script anymore.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You end up discovering some other Software which you believe is better.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You don\'t need a site or administration right now.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Our highlights don\'t address your issues and prerequisites or aren\'t as extensive as you suspected.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You don\'t have such an environment for your worker to run our framework.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">On the off chance that you as of now download our framework.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><span style=\\\"font-weight:bolder;\\\">No returns\\/refunds will be offered for digital products except if the product you\\u2019ve purchased is:<\\/span><\\/p><ul><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Completely non-functional \\/ not same as demo.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If you\\u2019ve opened a support ticket but you didn\'t get any response in 48 hours (2 Business days).<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">The product description was fully misleading.<\\/li><\\/ul><p style=\\\"margin-right:0px;margin-left:0px;\\\"><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><\\/p><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\">Please also note that:<\\/h3><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Refunds can take up to 45 days (depends on Bank and payment Methods) to reflect in your account.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">We normally charge 20% (4% gateway fee + 9% Dispute Fee + 7% Processing Fee) as Refund Processing fee.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You can cancel your account at any time; no refunds for cancellation.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You will be unable to download or use the item when you claim for refund.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If you have been downloaded items then no refund allowed.<\\/li><\\/ul><\\/div>\"}', '2021-03-29 02:17:45', '2021-05-04 00:46:47'),
(86, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"forex\",\"Trading platform\",\"Online Trading\",\"Cryptocurrency\",\"Trading tools\",\"Web-based trading\",\"Real-time market data\"],\"description\":\"Tradeness is a unique trading platform. You can make real-time transactions whenever and wherever you like. The platform can be accessed not only from a PC but also from a full-service mobile. It\'s easily installable, controllable through the admin panel, and comes with a responsive design, high security, and interactive User interface. support plugins, LiveChat, Google ReCaptcha, analytics, automatic payment gateway, cards, currencies, and cryptos.\",\"social_title\":\"Tradeness\",\"social_description\":\"Tradeness is a unique trading platform. You can make real-time transactions whenever and wherever you like. The platform can be accessed not only from a PC but also from a full-service mobile. It\'s easily installable, controllable through the admin panel, and comes with a responsive design, high security, and interactive User interface. support plugins, LiveChat, Google ReCaptcha, analytics, automatic payment gateway, cards, currencies, and cryptos.\",\"image\":\"63f339b48607f1676884404.png\"}', '2021-04-28 00:49:34', '2025-04-09 13:40:55'),
(89, 'faq.content', '{\"heading\":\"Frequently Asked Questions\",\"sub_heading\":\"A frequently asked questions (FAQ) forum is often used in articles, websites, email lists, and online forums where common questions tend to recur, for example through\"}', '2021-05-06 22:46:42', '2021-05-06 22:48:27'),
(90, 'kyc_content.content', '{\"unverified_content\":\"Dear User, we need your KYC Data for some action. Don\'t hesitate to provide KYC Data, It\'s so much potential for us too. Don\'t worry,  it\'s very much secure in our system.\",\"pending_content\":\"Dear user, Your submitted KYC Data is currently pending now. Please take us some time to review your Data. Thank you so much for your cooperation.\"}', '2023-01-04 03:57:26', '2023-01-04 03:57:26'),
(92, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<br \\/><\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">We Don\'t support any child porn or such material.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No harassing material that may cause people to retaliate against you.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No phishing pages.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious Botnets are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Php\\/CGI proxies are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">CGI-IRC is strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/font><\\/li><\\/ul><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Terms &amp; Conditions for Users<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/font><\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Support<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/font><\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"font-size:18px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/font><\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Hang tight for additional update discharge.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/font><\\/li><\\/ul><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Ownership<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/font><\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Warranty<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/font><\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Unauthorized\\/Illegal Usage<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segments, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or the item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/font><\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Payment\\/Refund Policy<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/font><\\/p><\\/div><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Free Balance \\/ Coupon Policy<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"margin-top:-16px;line-height:1.3;\\\"><\\/h3><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;color:rgb(33,37,41);font-size:16px;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/font><\\/p><\\/div><\\/div>\"}', '2023-01-07 08:07:32', '2023-02-20 11:09:29');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(94, 'policy_pages.element', '{\"title\":\"Terms Of Service\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We\\r\\n claim all authority to dismiss, end, or handicap any help with or \\r\\nwithout cause per administrator discretion. This is a Complete \\r\\nindependent facilitating, on the off chance that you misuse our ticket \\r\\nor Livechat or emotionally supportive network by submitting \\r\\nsolicitations or protests we will impair your record. The solitary time \\r\\nyou should reach us about the seaward facilitating is if there is an \\r\\nissue with the worker. We have not many substance limitations and \\r\\neverything is as per laws and guidelines. Try not to join on the off \\r\\nchance that you intend to do anything contrary to the guidelines, we do \\r\\ncheck these things and we will know, don\'t burn through our own and your\\r\\n time by joining on the off chance that you figure you will have the \\r\\noption to sneak by us and break the terms.<br \\/><\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Configuration\\r\\n requests - If you have a fully managed dedicated server with us then we\\r\\n offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, \\r\\nDNS, and httpd configurations.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Software\\r\\n requests - Cpanel Extension Installation will be granted as long as it \\r\\ndoes not interfere with the security, stability, and performance of \\r\\nother users on the server.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Emergency\\r\\n Support - We do not provide emergency support \\/ Phone Support \\/ \\r\\nLiveChat Support. Support may take some hours sometimes.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Webmaster\\r\\n help - We do not offer any support for webmaster related issues and \\r\\ndifficulty including coding, &amp; installs, Error solving. if there is \\r\\nan issue where a library or configuration of the server then we can help\\r\\n you if it\'s possible from our end.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">We Don\'t support any child porn or such material.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No harassing material that may cause people to retaliate against you.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No phishing pages.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">If\\r\\n Anyone attempting to hack or exploit the server by using your script or\\r\\n hosting, we will terminate your account to keep safe other users.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious Botnets are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Php\\/CGI proxies are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">CGI-IRC is strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/font><\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Terms &amp; Conditions for Users<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Before\\r\\n getting to this site, you are consenting to be limited by these site \\r\\nTerms and Conditions of Use, every single appropriate law, and \\r\\nguidelines, and concur that you are answerable for consistency with any \\r\\nmaterial neighborhood laws. If you disagree with any of these terms, you\\r\\n are restricted from utilizing or getting to this site.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Support<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Whenever\\r\\n you have downloaded our item, you may get in touch with us for help \\r\\nthrough email and we will give a valiant effort to determine your issue.\\r\\n We will attempt to answer using the Email for more modest bug fixes, \\r\\nafter which we will refresh the center bundle. Content help is offered \\r\\nto confirmed clients by Tickets as it were. Backing demands made by \\r\\nemail and Livechat.<\\/font><\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/font><\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Hang tight for additional update discharge.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/font><\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Ownership<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You\\r\\n may not guarantee scholarly or selective possession of any of our \\r\\nitems, altered or unmodified. All items are property, we created them. \\r\\nOur items are given \\\"with no guarantees\\\" without guarantee of any sort, \\r\\neither communicated or suggested. On no occasion will our juridical \\r\\nindividual be subject to any harms including, however not restricted to,\\r\\n immediate, roundabout, extraordinary, accidental, or significant harms \\r\\nor different misfortunes emerging out of the utilization of or \\r\\npowerlessness to utilize our items.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Warranty<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We\\r\\n don\'t offer any guarantee or assurance of these Services in any way. \\r\\nWhen our Services have been modified we can\'t ensure they will work with\\r\\n all outsider plugins, modules, or internet browsers. Program similarity\\r\\n ought to be tried against the show formats on the demo worker. If you \\r\\ndon\'t mind guarantee that the programs you use will work with the \\r\\ncomponent, as we can not ensure that our systems will work with all \\r\\nprogram mixes.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Unauthorized\\/Illegal Usage<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You\\r\\n may not utilize our things for any illicit or unapproved reason or may \\r\\nyou, in the utilization of the stage, disregard any laws in your locale \\r\\n(counting yet not restricted to copyright laws) just as the laws of your\\r\\n nation and International law. Specifically, it is disallowed to utilize\\r\\n the things on our foundation for pages that advance: brutality, illegal\\r\\n intimidation, hard sexual entertainment, bigotry, obscenity content or \\r\\nwarez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, \\r\\nsell, exchange or adventure any of our segments, utilization of the \\r\\noffered on our things, or admittance to the administration without the \\r\\nexpress composed consent by us or the item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If\\r\\n you make a record on our site, you are liable for keeping up the \\r\\nsecurity of your record, and you are completely answerable for all \\r\\nexercises that happen under the record and some other activities taken \\r\\nregarding the record. You should quickly inform us, of any unapproved \\r\\nemployments of your record or some other penetrates of security.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/h3><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Payment\\/Refund Policy<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">No\\r\\n refund or cash back will be made. After a deposit has been finished, it\\r\\n is extremely unlikely to invert it. You should utilize your equilibrium\\r\\n on requests our administrations, Hosting, SEO campaign. You concur that\\r\\n once you complete a deposit, you won\'t document a debate or a \\r\\nchargeback against us in any way, shape, or form.<br \\/><br \\/>If you document\\r\\n a debate or chargeback against us after a deposit, we claim all \\r\\nauthority to end every single future request, prohibit you from our \\r\\nsite. False action, for example, utilizing unapproved or taken charge \\r\\ncards will prompt the end of your record. There are no special cases.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Free Balance \\/ Coupon Policy<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We\\r\\n offer numerous approaches to get FREE Balance, Coupons and Deposit \\r\\noffers yet we generally reserve the privilege to audit it and deduct it \\r\\nfrom your record offset with any explanation we may it is a sort of \\r\\nmisuse. If we choose to deduct a few or all of free Balance from your \\r\\nrecord balance, and your record balance becomes negative, at that point \\r\\nthe record will naturally be suspended. If your record is suspended \\r\\nbecause of a negative Balance you can request to make a custom payment \\r\\nto settle your equilibrium to actuate your record.<\\/font><\\/p><\\/div>\"}', '2023-01-07 08:08:25', '2023-01-11 13:52:10'),
(96, 'banned.content', '{\"has_image\":\"1\",\"heading\":\"We are Sorry....\",\"image\":\"63f36aa4acdff1676896932.png\"}', '2023-01-07 10:59:24', '2023-02-20 12:42:12'),
(97, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-3\\\" style=\\\"\\\"><h2 style=\\\"text-align: center;\\\"><font color=\\\"#ffffff\\\" size=\\\"5\\\">We\'re just tuning up a few things.<\\/font><\\/h2><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-family: Exo, sans-serif;\\\"><p style=\\\"text-align: center; font-family: Poppins, sans-serif;\\\"><font color=\\\"#ffffff\\\" style=\\\"\\\" size=\\\"3\\\">We apologize for the inconvenience but Front is currently undergoing planned maintenance. Thanks for your patience.<\\/font><\\/p><p style=\\\"font-size: 24px; color: rgb(54, 54, 54); font-family: Poppins, sans-serif; text-align: start;\\\"><br><\\/p><\\/h3><\\/div>\",\"image\":\"63b978a1b12951673099425.png\",\"heading\":\"THE SITE IS UNDER MAINTENANCE\"}', '2023-01-07 11:17:07', '2023-02-20 12:39:57'),
(98, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We\\r\\n gather data from you when you register on our site, submit a request, \\r\\nbuy any services, react to an overview, or round out a structure. At the\\r\\n point when requesting any assistance or enrolling on our site, as \\r\\nsuitable, you might be approached to enter your: name, email address, or\\r\\n telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">All provided delicate\\/credit data is sent through Stripe.<br>After\\r\\n an exchange, your private data (credit cards, social security numbers, \\r\\nfinancials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We\\r\\n don\'t sell, exchange, or in any case move to outside gatherings by and \\r\\nby recognizable data. This does exclude confided in outsiders who help \\r\\nus in working our site, leading our business, or adjusting you, since \\r\\nthose gatherings consent to keep this data private. We may likewise \\r\\ndeliver your data when we accept discharge is suitable to follow the \\r\\nlaw, implement our site strategies, or ensure our own or others\' rights,\\r\\n property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We\\r\\n are consistent with the prerequisites of COPPA (Children\'s Online \\r\\nPrivacy Protection Act), we don\'t gather any data from anybody under 13 \\r\\nyears old. Our site, items, and administrations are completely \\r\\ncoordinated to individuals who are in any event 13 years of age or more \\r\\nestablished.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">At\\r\\n the point when you register for our site, we cycle and keep your \\r\\ninformation we have about you however long you don\'t erase the record or\\r\\n withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We\\r\\n don\'t and will never share, unveil, sell, or in any case give your \\r\\ninformation to different organizations for the promoting of their items \\r\\nor administrations.<\\/p><\\/div>\",\"status\":1}', '2023-01-09 07:21:39', '2023-01-09 07:21:39'),
(99, 'policy_pages.element', '{\"title\":\"Terms of Use\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<br \\/><\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">We Don\'t support any child porn or such material.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No harassing material that may cause people to retaliate against you.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No phishing pages.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious Botnets are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Php\\/CGI proxies are strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">CGI-IRC is strictly forbidden.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/font><\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Terms &amp; Conditions for Users<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Support<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/font><\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"font-size:18px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/font><\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Hang tight for additional update discharge.<\\/font><\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\"><font color=\\\"#ffffff\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/font><\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Ownership<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Warranty<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Unauthorized\\/Illegal Usage<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segments, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or the item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/h3><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Payment\\/Refund Policy<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"margin-bottom:3rem;font-family:Nunito, sans-serif;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Free Balance \\/ Coupon Policy<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\"><font color=\\\"#ffffff\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/font><\\/p><\\/div>\"}', '2023-01-09 09:03:32', '2023-01-11 13:52:34'),
(100, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"5 Tips to Master Cryptocurrency Trading in 2023\",\"description\":\"<h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><span style=\\\"font-weight:700;font-size:18px;line-height:1.75rem;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/h2><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><span style=\\\"font-weight:700;font-size:18px;line-height:1.75rem;\\\"><font color=\\\"#ffffff\\\">For many years, investors have been hooked on traditional financial instruments like stocks, bonds, commodities, and forex for investment purposes. However, cryptocurrency trading has become the new playing field amongst market players, especially day traders.<\\/font><\\/span><\\/h2><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">5 Tips to master cryptocurrency trading\\u00a0<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Short-term traders are usually tempted by the momentum and volatility portrayed by the cryptocurrency market. This volatility has the potential to deliver massive gains over the short run. The beloved digital currency Bitcoin has generated an astonishing return to date, leaving the market participants in awe.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">These fast and furious rallies in the crypto space appear enticing. But, it is hard to neglect sharp trend reversals in cryptocurrencies that make trading a bit difficult. Therefore, having a proper trading plan is essential for traders to prevent impulsive, hasty decisions that can result in substantial financial losses.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">2021 perhaps turned out to be one of the best years for the cryptocurrency market. Given this backdrop, here are some tips for investors to harness the benefits of cryptocurrency trading:<\\/font><\\/p><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">1. Focus on Liquid Currencies<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">While thousands of cryptocurrencies have been created and listed on the crypto exchanges, not all of them are worth trading amidst a lack of liquidity. Liquidity is a key factor that enables short-term traders to enter and exit a position with ease.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">The lack of liquidity in some cryptocurrencies hampers the agility of traders. This makes it challenging for them to get in and out of a large position. Liquidity also affects the impact cost, thereby increasing the overall cost of trading. Hence, it is imperative for a trader to trade such cryptocurrencies where a sufficient volume of trading is already taking place.<\\/font><\\/p><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">2. Trade, Do Not Gamble<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">One thing that is common between trading and gambling is the uncertainty of the outcome. In both the playing fields, one makes a bet and waits for an outcome. However, what separates a trader from a gambler is risk management. What this means is that buying digital currencies without assessing the risk is equivalent to gambling.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">With cryptos being an epitome of volatility, the uncertainty increases manifold than any stable security. Thus, it is even more important for crypto traders to have a robust risk management plan in place. It seems sensible for a trader to use stop-loss orders and just risk an amount he\\/she is comfortable with losing on the trade.<\\/font><\\/p><h4 style=\\\"font-family:Helvetica, Arial, sans-serif;line-height:1.5rem;margin-bottom:0.625rem;margin-top:0.625rem;text-align:center;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/h4><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">3. Buy the Strength, Sell the Weakness<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Unlike other financial assets, cryptocurrencies do not have any intrinsic value attached to them. Therefore, there is practically no such thing as a high price or a low price of a cryptocurrency.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">In such scenarios, traders can purchase a strong uptrend and sell a downtrend with a proper risk management plan in place. However, one need not neglect that cryptos also have an uncanny ability to stay in an overbought\\/oversold zone for a long duration of time. Thus, one should execute mean reversion trades with caution during crypto trading.<\\/font><\\/p><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">4. Ensure Due Diligence for Lower-Priced Cryptos<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Lower-priced crypto assets have been gaining immense popularity among the new traders in the crypto space. The sheer gain in the percentage terms takes centre stage when such cryptocurrencies rise. These attractive gains often lure traders who end up buying these assets in heavy quantities without sufficient research.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Traders need to understand that the cheapest crypto is not always the best choice. Hence, it is imperative for a crypto trader to conduct proper due diligence before investing in such assets. Moreover, traders can hunt for crypto assets having real potential for enticing a user base in the future.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Instead of chasing the cheapest currencies, traders can seek trading platforms charging reasonable fees for processing payments to make cost-efficient crypto trading. One can also look for trading platforms that do not penalise much for converting fiat into digital currency.<\\/font><\\/p><h2 style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:1.75rem;line-height:2rem;margin-bottom:1.5rem;margin-top:1.25rem;\\\"><font color=\\\"#ffffff\\\">5. Keep Emotions in Check<\\/font><\\/h2><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Primary emotions like fear and greed can change the results upside down even with a good trading strategy. Such emotions tend to escalate when a trader experiences large swings in his profit and loss account, which is quite common with crypto holdings amidst their erratic movements.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">Working on trading psychology while containing greed and fear seems instrumental for traders to make money in the cryptocurrency market. Moreover, it is imperative for traders to have the discipline to stick with their respective trading plans and understand when to book profits and losses.<\\/font><\\/p><p style=\\\"font-family:Helvetica, Arial, sans-serif;font-size:18px;line-height:1.625rem;margin:1.125rem 0px;\\\"><font color=\\\"#ffffff\\\">While these tips can help crypto traders avoid some common mistakes and cut down their learning curve, they are not a replacement for a rich experience. Thus, it is crucial for traders to keep learning all the way through their investing years to become proficient in crypto trading. Remember, the \\u201cMarket is the best teacher when it comes to investing\\u201d!<\\/font><\\/p>\",\"image\":\"63f33ee17935a1676885729.jpg\"}', '2023-02-20 09:35:29', '2023-02-20 10:21:16');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(101, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Trading vs. Investing\",\"description\":\"<div class=\\\"DematHeading\\\" style=\\\"padding:0px 15px;font-family:Roboto, sans-serif;font-size:14px;\\\"><h2 class=\\\"comp mntl-sc-block finance-sc-block-heading mntl-sc-block-heading\\\" style=\\\"font-size:1.625rem;font-weight:bolder;line-height:1.2;margin-bottom:0.5rem;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/h2><h2 class=\\\"comp mntl-sc-block finance-sc-block-heading mntl-sc-block-heading\\\" style=\\\"font-size:1.625rem;font-weight:bolder;line-height:1.2;margin-bottom:0.5rem;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\">Trading<\\/font><\\/span><\\/h2><div><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Trading involves more frequent transactions, such as the buying and selling of stocks, commodities,\\u00a0or other instruments. The goal is to generate returns that outperform buy-and-hold investing. While investors may be content with of 10% to 15%, traders might seek a 10% return each month. Trading profits are generated by buying at a lower price and selling at a higher price within a relatively short period of time. The reverse also is true: trading profits can be made by selling at a higher price and buying to cover at a lower price to profit in falling markets.<\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><div class=\\\"comp native mntl-native\\\" style=\\\"width:600px;\\\"><\\/div><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">While buy-and-hold investors wait out less profitable positions, traders seek to make profits within a specified period of time and often use a protective stop-loss order to automatically close out losing positions at a predetermined price level. Traders often employ technical analysis tools, such as moving averages and stochastic oscillators, to find high-probability trading setups.<\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">A trader\'s style refers to the timeframe in which stocks, commodities, or other trading instruments are bought and sold. Traders generally fall into one of four categories:<\\/font><\\/p><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><h2 class=\\\"comp mntl-sc-block finance-sc-block-heading mntl-sc-block-heading\\\" style=\\\"font-size:1.625rem;font-weight:bolder;line-height:1.2;margin-bottom:0.5rem;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\">Investing<\\/font><\\/span><\\/h2><div><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">The goal of investing is to gradually build wealth over an extended period of time through the buying and holding of a portfolio of stocks, baskets of stocks, mutual funds, bonds, and other investment instruments.<\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><div class=\\\"comp mntl-sc-block finance-sc-block-callout mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><div class=\\\"comp theme-important mntl-sc-block mntl-sc-block-callout mntl-block\\\" style=\\\"margin:-0.75rem 0px 1rem;padding:0.5rem;border:1px solid rgb(225,226,230);\\\"><div class=\\\"comp mntl-sc-block-callout-body mntl-text-block\\\" style=\\\"padding-right:1.75rem;padding-left:2rem;\\\"><font color=\\\"#ffffff\\\"><span style=\\\"letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Investments often are held for a period of years, or even decades, taking advantage of perks like interest, dividends, and stock splits along the way. While markets inevitably fluctuate, investors will \\\"ride out\\\" the downtrends with the expectation that prices will rebound and any losses eventually will be recovered. Investors typically are more concerned with market fundamentals, such as price-to-earnings ratios and management forecasts.<\\/font><\\/span><br \\/><\\/font><\\/div><\\/div><\\/div><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Anyone who has a 401(k) or an IRA is investing, even if they are not tracking the performance of their holdings on a daily basis. Since the goal is to grow a retirement account over the course of decades, the day-to-day fluctuations of different mutual funds are less important than consistent growth over an extended period.<\\/font><\\/p><\\/div><div style=\\\"color:rgb(51,51,51);font-family:Roboto, sans-serif;font-size:14px;\\\"><div><div class=\\\"panel-collapse collapse in\\\"><div class=\\\"panel-body\\\" style=\\\"padding:0px 10px 20px 0px;border-bottom:1px solid rgb(205,205,205);\\\"><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">There are several differences between trading and investing, but the most popular differences are the investment approach and the time involved.<\\/p><ul class=\\\"panel-body-li\\\" style=\\\"margin-bottom:20px;margin-left:30px;\\\"><li style=\\\"list-style:none;margin-top:0px;margin-right:0px;margin-left:0px;padding-left:20px;line-height:30px;font-size:17px;\\\"><em style=\\\"width:7px;height:7px;background:rgb(178,207,65);font-size:14px;\\\"><\\/em><strong style=\\\"font-weight:bold;\\\">Investment Approach between Investing and Trading<\\/strong><\\/li><\\/ul><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">The critical difference between investing and trading is the type of approach involved in both methods. In investing, the investor uses the fundamental analysis of the company, and in trading, it involves technical analysis.<\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">Fundamental analysis involves the company\'s financial analysis, previous financial records of the company, analysis of the industry on which the company is based, and the overall performance of the industry based on the macroeconomic situations in the country and the results.<\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">Technical analysis is everyday financial trends such as the company\'s performance in numbers based on the uptrends and downtrends in the market every day. It requires the traders to study the company closely and every day as it makes financial decisions and reflects in the charts and numbers in the stock market. This data helps the traders to make significant predictions of the changes and involves studying trends in volume, price, and moving averages.<\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">Traders need to act dynamically and buy or sell based on the current trends while investors study the company closely, invest in it and hold it for a longer period to earn profit with lesser risk.<\\/p><em style=\\\"width:7px;height:7px;background:rgb(178,207,65);font-size:14px;\\\"><\\/em><strong style=\\\"font-weight:bold;\\\">Time-Based and Risk-Based differences between Investing and Trading<\\/strong><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">There is a difference in time involved in both the market-based money investments. Investing involves studying the company closely and holding it for a longer period with the expectation that it will return profits in the long haul; this type of investment involves lesser risk and may incur not huge profits but are relatively safe to the market trends. A classic example of \\\"investing\\\" is mutual funds and involves lesser risk and lesser profit. Other examples are bonds or baskets of stocks for long holding positions. The time frame can range years together and is less dynamic. The trend in the market that lasts for a shorter period does not make any difference to the investors.<\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">Trading studies the companies closely with everyday trends to predict the future change on which they could earn better profits. This is a short-term investment and can involve buying and selling within a single day, weeks, or months based on the market situations. It is a high risk-reward ratio as the market is volatile, and one wrong decision can incur huge losses. A classic example of trading is the basis of the stock market, where the trader buys a certain number of stocks when the prices are low and sells them when the prices are high to generate huge profits. This time approach not only allows the traders to make quick transactions but also earn more compared to the long-term investors.<\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\"><strong style=\\\"font-weight:bold;\\\">Final words<\\/strong><\\/p><p style=\\\"margin-right:10px;margin-bottom:10px;margin-left:30px;font-size:17px;line-height:30px;color:rgb(74,74,74);\\\">The major differences between investing and trading are approaches, risk, and time involved. It is okay to do both, and it depends on the risk-taking ability and patience of the person to choose between either of these or both of these. Investing is long-term and involves lesser risk, while trading is short-term and involves high risk. Both earn profits, but traders frequently earn more profit compared to investors when they make the right decisions, and the market is performing accordingly.<\\/p><\\/div><\\/div><\\/div><\\/div>\",\"image\":\"63f3464cb6a5c1676887628.jpg\"}', '2023-02-20 09:38:10', '2023-02-20 10:20:28'),
(102, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"How to Use Technical Analysis in Trading\",\"description\":\"<h2 style=\\\"margin-bottom:1.25rem;font-weight:700;line-height:1.375;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/h2><h2 style=\\\"margin-bottom:1.25rem;font-weight:700;line-height:1.375;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;\\\"><font color=\\\"#ffffff\\\">What is Technical Analysis?<\\/font><\\/h2><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Technical analysis is a tool, or\\u00a0, used to predict the probable future price movement of a security \\u2013 such as a\\u00a0or currency pair \\u2013 based on market data.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;font-size:18px;\\\"><font color=\\\"#ffffff\\\">The theory behind the validity of technical analysis is the notion that the collective actions \\u2013 buying and selling \\u2013 of all the participants in the market accurately reflect all relevant information pertaining to a traded security, and therefore, continually assign a fair market value to the<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;\\\"><span style=\\\"color:rgb(255,255,255);\\\"><br \\/><\\/span><\\/p><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;\\\"><span style=\\\"color:rgb(255,255,255);\\\">Past Price as an Indicator of Future Performance<\\/span><\\/p><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Technical traders believe that current or past price action in the market is the most reliable indicator of future price action.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:1.5rem;margin-left:0px;font-family:\'Open Sans\', \'-apple-system\', BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif;font-size:18px;\\\"><font color=\\\"#ffffff\\\">Technical analysis is not only used by technical traders. Many fundamental traders useto determine whether to buy into a market, but having made that decision, then use technical analysis to pinpoint good, low-risk buy entry price levels.<\\/font><\\/p>\",\"image\":\"63f34173307941676886387.jpg\"}', '2023-02-20 09:46:27', '2023-02-20 10:22:02'),
(103, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"What is Algorithmic Trading and How Does it Work?\",\"description\":\"<h2 class=\\\"comp mntl-sc-block finance-sc-block-heading mntl-sc-block-heading\\\" style=\\\"font-size:1.625rem;font-weight:bolder;line-height:1.2;margin-bottom:0.5rem;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-heading__text\\\"><font><br \\/><\\/font><\\/span><\\/h2><h2 class=\\\"comp mntl-sc-block finance-sc-block-heading mntl-sc-block-heading\\\" style=\\\"font-size:1.625rem;font-weight:bolder;line-height:1.2;margin-bottom:0.5rem;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\">What Is Algorithmic Trading?<\\/font><\\/span><\\/h2><div><span class=\\\"mntl-sc-block-heading__text\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Algorithmic trading\\u00a0(also called automated trading,\\u00a0black-box trading,\\u00a0or\\u00a0algo-trading) uses a computer program that follows a defined set of instructions (an algorithm)\\u00a0to place a trade. The trade, in theory, can generate profits\\u00a0at a speed and frequency that is impossible\\u00a0for a human trader.<\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">The defined sets of instructions are based on timing, price, quantity, or any mathematical model. Apart from profit opportunities for the trader, algo-trading renders markets more liquid and trading more systematic by ruling out the impact of human emotions\\u00a0on trading activities.<\\/font><\\/p><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><span style=\\\"font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;font-size:1.625rem;font-weight:bolder;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Advantages and Disadvantages of Algorithmic Trading<\\/font><\\/span><\\/p><h3 class=\\\"comp mntl-sc-block finance-sc-block-subheading mntl-sc-block-subheading\\\" style=\\\"margin-bottom:0.5rem;line-height:1.5;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-subheading__text\\\"><font color=\\\"#ffffff\\\">Advantages<\\/font><\\/span><\\/h3><div><span class=\\\"mntl-sc-block-subheading__text\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/div><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">Algo-trading provides the following advantages:<span class=\\\"mntl-inline-citation mntl-dynamic-tooltip--trigger\\\" style=\\\"vertical-align:baseline;font-size:0.875rem;padding-bottom:0px;margin-left:2px;letter-spacing:0.07em;line-height:1;\\\"><span>1<\\/span><\\/span><\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><ul class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;padding-left:1.5rem;list-style-type:disc;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><li><font color=\\\"#ffffff\\\">Best Execution: Trades are often executed at the best possible prices.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Low Latency: Trade\\u00a0order placement is instant and accurate (there is a high chance of execution at the desired levels). Trades are timed correctly and instantly to avoid significant price changes.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Reduced transaction costs.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Simultaneous automated checks on multiple market conditions.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">No Human Error: Reduced risk of manual errors or mistakes when placing trades. Also negates human traders; tendency to be swayed by\\u00a0emotional and psychological factors.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Backtesting: Algo trading can be\\u00a0using available historical and real-time data<strong style=\\\"font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;\\\">\\u00a0<\\/strong>to see if it is a viable trading strategy.<br \\/><\\/font><\\/li><\\/ul><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><h3 class=\\\"comp mntl-sc-block finance-sc-block-subheading mntl-sc-block-subheading\\\" style=\\\"margin-bottom:0.5rem;line-height:1.5;font-family:\'Cabin-semi-bold\', \'Cabin-fallback\', sans-serif;letter-spacing:0.05px;\\\"><span class=\\\"mntl-sc-block-subheading__text\\\"><font color=\\\"#ffffff\\\">Disadvantages<\\/font><\\/span><\\/h3><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><p class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><font color=\\\"#ffffff\\\">There are also several drawbacks or disadvantages of algorithmic trading to consider:<\\/font><\\/p><div class=\\\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\\\" style=\\\"font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><\\/div><ul class=\\\"comp mntl-sc-block finance-sc-block-html mntl-sc-block-html\\\" style=\\\"margin-bottom:1.75rem;padding-left:1.5rem;list-style-type:disc;font-family:SourceSansPro, \'Source Sans Pro-fallback\', sans-serif;font-size:18px;letter-spacing:0.05px;\\\"><li><font color=\\\"#ffffff\\\">Latency: Algorithmic trading relies on fast execution speeds and low latency, which is the delay in the execution of a trade. If a trade is not executed quickly enough, it may result in missed opportunities or losses.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Black Swan Events: Algorithmic trading relies on historical data and mathematical models to predict future market movements. However, unforeseen market disruptions, known as black swan events, can occur, which can result in losses for algorithmic traders.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Dependence on Technology: Algorithmic trading relies on technology, including computer programs and high-speed internet connections. If there are technical issues or failures, it can disrupt the trading process and result in losses.<\\/font><\\/li><li><font color=\\\"#ffffff\\\">Market Impact: Large algorithmic trades can have a significant impact on market prices, which can result in losses for traders who are not able to adjust their trades in response to these changes. Algo trading has also been suspected of increasing market volatility at times, even leading to so-called\\u00a0<\\/font><\\/li><\\/ul><font color=\\\"#ffffff\\\"><span class=\\\"mntl-sc-block-adslot mntl-sc-block-adslot-inline\\\"><\\/span>Regulation: Algorithmic trading is subject to various regulatory requirements and oversight, which can be complex and time-consuming to comply with.High Capital Costs: The development and implementation of algorithmic trading systems can be costly, and traders may need to pay ongoing fees for software and data feeds.Limited Customization: Algorithmic trading systems are based on pre-defined rules and instructions, which can limit the ability of traders to customize their trades to meet their specific needs or preferences.Lack of Human Judgment: Algorithmic trading relies on mathematical models and historical data, which means that it does not take into account the subjective and qualitative factors that can influence market movements. This lack of human judgment can be a disadvantage for traders who prefer a more intuitive or instinctive approach to trading.<\\/font>\",\"image\":\"63f34273c29a21676886643.jpg\"}', '2023-02-20 09:50:43', '2023-02-20 10:22:57'),
(104, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Introduction to Cryptocurrency Trading\",\"description\":\"<p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">Cryptocurrency trading is the act of speculating on cryptocurrency price movements via a CFD trading account, or buying and selling the underlying coins via an exchange.<\\/font><\\/p><h3 class=\\\"heading\\\" style=\\\"font-size:22px;line-height:30px;margin-bottom:5px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">CFD trading on cryptocurrencies<\\/font><\\/h3><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">CFDs trading are derivatives, which enables you to speculate on cryptocurrency price movements without taking ownership of the underlying coins. You can go long (\\u2018buy\\u2019) if you think a cryptocurrency will rise in value, or short (\\u2018sell\\u2019) if you think it will fall.<\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">Both are leveraged products, meaning you only need to put up a small deposit \\u2013 known as margin \\u2013 to gain full exposure to the underlying market. Your profit or loss is still calculated according to the full size of your position, so leverage will magnify both profits and losses.<\\/font><\\/p><h3 class=\\\"heading\\\" style=\\\"font-size:22px;line-height:30px;margin-bottom:5px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><span lang=\\\"en-us\\\" xml:lang=\\\"en-us\\\"><font color=\\\"#ffffff\\\">Buying and selling cryptocurrencies via an exchange<\\/font><\\/span><\\/h3><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">When you buy cryptocurrencies via an exchange, you purchase the coins themselves. You\\u2019ll need to create an exchange account, put up the full value of the asset to open a position and store the cryptocurrency tokens in your own wallet until you\\u2019re ready to sell.<\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">Exchanges bring their own steep learning curve as you\\u2019ll need to get to grips with the technology involved and learn how to make sense of the data. Many exchanges also have limits on how much you can deposit, while accounts can be very expensive to maintain.<\\/font><\\/p>\",\"image\":\"63f342fde09701676886781.jpg\"}', '2023-02-20 09:53:01', '2023-02-20 10:23:39'),
(105, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Trading for Beginners\",\"description\":\"<font color=\\\"#ffffff\\\"><span style=\\\"font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;font-size:20px;\\\"><font color=\\\"#ffffff\\\">Trading for beginners can be exciting \\u2013 and overwhelming. That\\u2019s why we\\u2019ve outlined everything you need to know for your trading journey, including how to trade stocks and forex trading for beginners.<\\/font><\\/span><br \\/><\\/font><div><span style=\\\"font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;font-size:20px;\\\"><font color=\\\"#ffffff\\\"><br \\/><\\/font><\\/span><\\/div><div><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">When you trade, you\\u2019ll use a platform like ours to access these markets and take a position on whether you think a market\\u2019s price will rise or fall. If your prediction is correct, you\\u2019ll make a profit. If incorrect, you\\u2019ll incur a loss.<\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">The financial instruments you\\u2019ll use to trade on an asset\\u2019s price movements are known as \\u2018derivatives\\u2019. This simply means that the instrument\\u2019s price is \\u2018derived\\u2019 from the price of the underlying, like a company share or an ounce of gold. As the price of the underlying asset changes, so does the value of the derivative.<\\/font><\\/p><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">To understand this, let\\u2019s look at an example of speculating on shares. If the price of a share goes up from $100 to $105, the value of the derivative will increase by the same amount. If you bought the derivative at $100, you could now sell it at $105. Although you never own the share itself, your profit or loss will mirror its price movements.<\\/font><\\/p><h4 class=\\\"heading\\\" style=\\\"font-size:20px;line-height:34px;margin-bottom:5px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">So, why use a derivative?<\\/font><\\/h4><p style=\\\"font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><font color=\\\"#ffffff\\\">With derivatives trading, you can go long or short \\u2013 meaning you can make a profit if that market\\u2019s price rises or falls, as long as you predict it correctly. Contrarily, if the market moved against your speculation, you\\u2019d incur a loss. This is because trading isn\\u2019t owning the actual financial asset. With owning something outright, such as gold for example, you\\u2019ll only make a profit if the gold price climbs.<\\/font><\\/p><p style=\\\"color:rgb(30,26,26);font-size:medium;line-height:22px;margin-bottom:30px;font-family:\'Matter SQ\', \'Arial Fallback\', sans-serif;\\\"><br \\/><\\/p><\\/div>\",\"image\":\"63f345cd2c7101676887501.jpg\"}', '2023-02-20 10:05:01', '2023-02-20 10:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 0, 104, 'Skrill', 'Skrill', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 0, 106, 'Payeer', 'Payeer', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2022-08-28 10:11:14'),
(7, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(8, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:22:38'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 0, 501, 'Blockchain', 'Blockchain', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-03-21 07:41:56'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 0, 505, 'Coingate', 'Coingate', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-03-30 09:24:57'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(27, 0, 115, 'Mollie', 'Mollie', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 0, 116, 'Cashmaal', 'Cashmaal', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2021-06-22 08:05:04'),
(36, 0, 119, 'Mercado Pago', 'MercadoPago', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"APP_USR-7924565816849832-082312-21941521997fab717db925cf1ea2c190-1071840315\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-09-14 07:41:14'),
(37, 0, 120, 'Authorize.net', 'Authorize', 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"59e4P9DBcZv\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"47x47TJyLw2E7DbR\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-08-28 09:33:06'),
(46, 0, 121, 'NMI', 'NMI', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"2F822Rw39fx762MaV7Yy86jXGTC7sCDy\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2023-02-20 07:04:57'),
(55, 0, 122, 'BTCPay', 'BTCPay', 1, '{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"-------\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"------\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/yourbtcpaserver.lndyn.com\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"----------\"}}', '{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}', 1, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}', NULL, NULL, NULL),
(56, 0, 123, 'Now payments hosted', 'NowPaymentsHosted', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 04:42:09'),
(57, 0, 509, 'Now payments checkout', 'NowPaymentsCheckout', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 04:42:09');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `symbol` varchar(40) DEFAULT NULL,
  `method_code` int(11) DEFAULT NULL,
  `gateway_alias` varchar(40) DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) DEFAULT NULL,
  `gateway_parameter` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) DEFAULT NULL,
  `cur_text` varchar(40) DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) DEFAULT NULL,
  `email_template` text DEFAULT NULL,
  `sms_body` varchar(255) DEFAULT NULL,
  `sms_from` varchar(255) DEFAULT NULL,
  `base_color` varchar(40) DEFAULT NULL,
  `mail_config` text DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text DEFAULT NULL,
  `global_shortcodes` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) DEFAULT NULL,
  `system_info` text DEFAULT NULL,
  `multi_language` tinyint(1) NOT NULL DEFAULT 1,
  `practice_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trade_profit` decimal(5,2) NOT NULL DEFAULT 0.00,
  `coinmarketcap_api_key` text DEFAULT NULL,
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `referral_bonus` decimal(5,2) NOT NULL DEFAULT 0.00,
  `cron_error_message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `registration`, `active_template`, `system_info`, `multi_language`, `practice_balance`, `trade_profit`, `coinmarketcap_api_key`, `last_cron_run`, `referral_bonus`, `cron_error_message`, `created_at`, `updated_at`) VALUES
(1, 'Tradeness', 'Bangladeshi Taka', 'BDT', 'info@viserlab.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\"><br></td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2025&nbsp;<a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{fullname}} ({{username}}), {{message}}', 'Tradeness', '72c825', '{\"name\":\"php\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 'basic', '{\"version\":\"3.1\",\"details\":\"\"}', 0, 200.00000000, 10.00, '80dc4b29-9241-43c1-987e-ed05d72e1c74', '2025-04-18 14:10:06', 2.00, NULL, NULL, '2025-10-22 11:49:03');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2020-07-06 03:47:55', '2022-04-09 03:47:04'),
(5, 'Hindi', 'hn', 0, '2020-12-29 02:20:07', '2022-04-09 03:47:04'),
(9, 'Bangla', 'bn', 0, '2021-03-14 04:37:41', '2022-03-30 12:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) DEFAULT NULL,
  `sent_from` varchar(40) DEFAULT NULL,
  `sent_to` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `notification_type` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `subj` varchar(255) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `shortcodes` text DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'Your KYC verification is approved!', '<div><br></div><div><span style=\"color: var(--bs-body-color); font-size: 1rem; text-align: var(--bs-body-text-align);\">We are pleased to inform you that your Know Your Customer (KYC) verification has been approved! Thank you for providing all the necessary documents and information for the verification process.</span><br></div><div><br></div><div>This means that you are now fully verified to use our platform and take advantage of all its features. You can now start trading with confidence, knowing that your account is fully compliant with our regulatory requirements.</div><div><br></div><div>If you have any questions or concerns, please don\'t hesitate to contact our customer support team. We are always here to help you.</div><div><br></div><div>Thank you for choosing our platform for your trading needs. We look forward to serving you.</div><div><br></div>', 'We are pleased to inform you that your Know Your Customer (KYC) verification has been approved! Thank you for providing all the necessary documents and information for the verification process.', '[]', 1, 1, NULL, '2023-02-20 09:23:54'),
(17, 'KYC_REJECT', 'KYC Rejected Successfully', 'Your KYC verification has been rejected', '<div>We regret to inform you that your Know Your Customer (KYC) verification has been rejected. We appreciate your effort to provide us with the necessary documents and information for the verification process, but unfortunately, we were unable to approve your application.</div><div><br></div><div>We understand that this may be disappointing news, but we encourage you to reapply for KYC verification by submitting all the required documents and information accurately and completely. Our team will review your application again as soon as possible.</div><div><br></div><div>If you have any questions or need further assistance, please don\'t hesitate to contact our customer support team. We are always ready to help you.</div><div><br></div><div>Thank you for your understanding and cooperation.</div><div><br></div>', 'We regret to inform you that your Know Your Customer (KYC) verification has been rejected. We appreciate your effort to provide us with the necessary documents and information for the verification process, but unfortunately, we were unable to approve your application.', '[]', 1, 1, NULL, '2023-02-20 09:23:42'),
(18, 'COMMISSION_BONUS', 'Withdraw - Requested', 'Referral commission', '<div style=\"\"><span style=\"font-size: 1rem; text-align: var(--bs-body-text-align);\"><font color=\"#212529\">Congratulations, You get&nbsp;</font></span><span style=\"color: rgb(33, 37, 41); font-size: 1rem; text-align: var(--bs-body-text-align);\">{{amount}}&nbsp;</span><span style=\"font-size: 1rem; text-align: var(--bs-body-text-align);\"><font color=\"#212529\">{{site_currency}}</font></span><span style=\"color: rgb(33, 37, 41); font-size: 1rem; text-align: var(--bs-body-text-align);\">&nbsp;referral bonus from user {{full_name}}. Your current balance is&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem; text-align: var(--bs-body-text-align);\">{{main_balance}}&nbsp;</span><span style=\"font-size: 1rem; text-align: var(--bs-body-text-align);\"><font color=\"#212529\">{{site_currency}}.</font></span><br></div>', 'Congratulations, You get {{amount}} {{site_currency}} referral bonus from user {{full_name}}. Your current balance is {{main_balance}} {{site_currency}}.', '{\"amount\":\"amount\",\"main_balance\":\"Main Balance\",\"trx\":\"Transaction\",\"full_name\":\"From user full name\"}', 1, 1, '2021-11-03 12:00:00', '2023-01-10 13:48:53');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `slug` varchar(40) DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL COMMENT 'template name',
  `secs` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.basic.', '[\"crypto_price\",\"predict\",\"trade\",\"feature\",\"app\",\"blog\",\"faq\"]', 1, '2020-07-11 06:23:58', '2023-01-03 07:00:04'),
(4, 'Blog', 'blog', 'templates.basic.', NULL, 1, '2020-10-22 01:14:43', '2020-10-22 01:14:43'),
(5, 'Contact', 'contact', 'templates.basic.', NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53'),
(20, 'About', 'about', 'templates.basic.', '[\"predict\",\"feature\",\"app\",\"blog\"]', 0, '2023-01-03 07:10:32', '2023-01-03 07:11:40'),
(21, 'Services', 'services', 'templates.basic.', '[\"feature\",\"predict\"]', 0, '2023-01-03 07:10:40', '2023-01-03 07:12:31'),
(22, 'FAQ', 'faq', 'templates.basic.', '[\"faq\"]', 0, '2023-01-03 07:10:49', '2023-01-03 07:12:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ronnie@gmail.com', '100375', '2020-07-07 05:44:47'),
('user@site.comfff', '988862', '2021-05-07 07:31:28'),
('mosta@gmail.com', '865544', '2021-06-10 09:21:05'),
('user@site.com', '835015', '2023-01-11 10:59:21'),
('raihan@gmail.com', '278123', '2023-02-20 12:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `practice_logs`
--

CREATE TABLE `practice_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `crypto_currency_id` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `price_was` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `in_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `high_low` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'High : 1 Low : 2',
  `result` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'win : 1 lose : 2 Draw : 3',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Running : 0 Complete : 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `practice_logs`
--

INSERT INTO `practice_logs` (`id`, `user_id`, `crypto_currency_id`, `amount`, `price_was`, `in_time`, `high_low`, `result`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10.00000000, 77742.48000000, '2025-04-09 12:04:05', 1, 2, 1, '2025-04-09 12:03:51', '2025-04-09 12:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `ticket` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trade_logs`
--

CREATE TABLE `trade_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `crypto_currency_id` int(11) DEFAULT 0,
  `trade_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `price_was` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `in_time` timestamp NULL DEFAULT current_timestamp(),
  `high_low` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'High : 1 Low : 2',
  `result` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'win : 1 lose : 2 Draw : 3',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Running : 0 Complete : 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_processed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trade_logs`
--

INSERT INTO `trade_logs` (`id`, `user_id`, `crypto_currency_id`, `trade_setting_id`, `amount`, `price_was`, `in_time`, `high_low`, `result`, `status`, `created_at`, `updated_at`, `is_processed`) VALUES
(1, 11, 1, 7, 100.00000000, 83324.75000000, '2025-04-16 05:44:56', 1, 1, 1, '2025-04-16 05:43:57', '2025-04-16 05:44:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trade_settings`
--

CREATE TABLE `trade_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `time` int(11) DEFAULT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `profit_margin` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trade_settings`
--

INSERT INTO `trade_settings` (`id`, `time`, `unit`, `profit_margin`, `created_at`, `updated_at`) VALUES
(5, 180, 'seconds', 50, '2025-04-09 14:35:47', '2025-04-16 05:40:23'),
(6, 120, 'seconds', 30, '2025-04-09 14:35:58', '2025-04-16 05:40:04'),
(7, 60, 'seconds', 20, '2025-04-09 14:36:08', '2025-04-16 05:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `details`, `remark`, `created_at`, `updated_at`) VALUES
(24, 4, 50.00000000, 0.00000000, 17850.00000000, '-', '8YYY7QYMHG5O', 'Trade to BNB High', NULL, '2025-04-15 03:26:50', '2025-04-15 03:26:50'),
(25, 4, 50.00000000, 0.00000000, 17900.00000000, '+', '8MMR6Y9KUUXR', 'Trade to BNB WIN', NULL, '2025-04-15 03:27:03', '2025-04-15 03:27:03'),
(26, 4, 10.00000000, 0.00000000, 17890.00000000, '-', 'FUVXY1VE7MNS', 'Trade to BNB High', NULL, '2025-04-15 03:28:05', '2025-04-15 03:28:05'),
(27, 4, 11.00000000, 0.00000000, 17901.00000000, '+', 'XBDQW5P9ZBZU', 'Trade to BNB WIN', NULL, '2025-04-15 03:28:16', '2025-04-15 03:28:16'),
(28, 4, 100.00000000, 0.00000000, 17801.00000000, '-', '252QP4MV9M7J', 'Trade to BNB High', NULL, '2025-04-15 03:29:54', '2025-04-15 03:29:54'),
(29, 4, 100.00000000, 0.00000000, 17801.00000000, '-', '2R7M3V4YWQ76', 'Trade to BNB LOSS', NULL, '2025-04-15 03:30:12', '2025-04-15 03:30:12'),
(30, 4, 100.00000000, 0.00000000, 17701.00000000, '-', 'Z6J8N5AUAMHN', 'Trade to BNB High', NULL, '2025-04-15 03:30:38', '2025-04-15 03:30:38'),
(31, 4, 100.00000000, 0.00000000, 17801.00000000, '+', '771ZBH822JY5', 'Trade to BNB DRAW', NULL, '2025-04-15 03:30:57', '2025-04-15 03:30:57'),
(32, 4, 100.00000000, 0.00000000, 17701.00000000, '-', 'PAD5AGO33SGH', 'Trade to BNB High', NULL, '2025-04-15 03:31:35', '2025-04-15 03:31:35'),
(33, 4, 100.00000000, 0.00000000, 17701.00000000, '-', '9HMBD4BTWBKS', 'Trade to BNB LOSS', NULL, '2025-04-15 03:31:54', '2025-04-15 03:31:54'),
(34, 4, 100.00000000, 0.00000000, 17601.00000000, '-', 'XOH7ZOAJWYEV', 'Trade to Bitcoin High', NULL, '2025-04-15 03:59:34', '2025-04-15 03:59:34'),
(35, 4, 110.00000000, 0.00000000, 17711.00000000, '+', 'AN8OZBAWX6JN', 'Trade to Bitcoin WIN', NULL, '2025-04-15 03:59:40', '2025-04-15 03:59:40'),
(36, 4, 12.00000000, 0.00000000, 17699.00000000, '-', 'MSEUUDAVVMH4', 'Trade to Bitcoin High', NULL, '2025-04-15 04:10:12', '2025-04-15 04:10:12'),
(37, 4, 250.00000000, 0.00000000, 17449.00000000, '-', 'ZVHGNKR5RPTJ', 'Trade to Bitcoin High', NULL, '2025-04-15 04:32:15', '2025-04-15 04:32:15'),
(38, 4, 275.00000000, 0.00000000, 17724.00000000, '+', 'AGOPUM9OMRD2', 'Trade to Bitcoin WIN', NULL, '2025-04-15 04:32:23', '2025-04-15 04:32:23'),
(39, 4, 500.00000000, 0.00000000, 17224.00000000, '-', '3YFE6XQ71UP4', 'Trade to Bitcoin High', NULL, '2025-04-15 06:27:13', '2025-04-15 06:27:13'),
(40, 4, 5.00000000, 0.00000000, 17219.00000000, '-', '37HO1U8G87UV', 'Trade to Bitcoin High', NULL, '2025-04-15 06:41:33', '2025-04-15 06:41:33'),
(41, 4, 100.00000000, 0.00000000, 17119.00000000, '-', 'WARX4XY792VF', 'Trade to Bitcoin High', NULL, '2025-04-15 06:57:57', '2025-04-15 06:57:57'),
(42, 4, 110.00000000, 0.00000000, 17229.00000000, '+', 'J9HAFA17V1JC', 'Trade to Bitcoin WIN', NULL, '2025-04-15 06:58:53', '2025-04-15 06:58:53'),
(43, 4, 20.00000000, 0.00000000, 17209.00000000, '-', 'AYSZ71KSJJJZ', 'Trade to Bitcoin High', NULL, '2025-04-15 07:00:35', '2025-04-15 07:00:35'),
(44, 4, 20.00000000, 0.00000000, 17209.00000000, '-', 'KZM8W279R1JX', 'Trade to Bitcoin LOSS', NULL, '2025-04-15 07:01:06', '2025-04-15 07:01:06'),
(45, 4, 25.00000000, 0.00000000, 17184.00000000, '-', 'GN19XOCY58MM', 'Trade to Bitcoin High', NULL, '2025-04-15 07:12:01', '2025-04-15 07:12:01'),
(46, 4, 27.50000000, 0.00000000, 17211.50000000, '+', 'ZAQZ87YRUXKU', 'Trade to Bitcoin WIN', NULL, '2025-04-15 07:12:31', '2025-04-15 07:12:31'),
(47, 4, 100.00000000, 0.00000000, 17111.50000000, '-', '2RPONGPWRH2G', 'Trade to Bitcoin High', NULL, '2025-04-15 07:16:11', '2025-04-15 07:16:11'),
(48, 4, 5.00000000, 0.00000000, 17106.50000000, '-', 'OHEDGABWB8PP', 'Trade to Bitcoin High', NULL, '2025-04-15 07:19:13', '2025-04-15 07:19:13'),
(49, 4, 5.50000000, 0.00000000, 17112.00000000, '+', '8NE7UJNEAA97', 'Trade to Bitcoin WIN', NULL, '2025-04-15 07:19:46', '2025-04-15 07:19:46'),
(50, 4, 50.00000000, 0.00000000, 17062.00000000, '-', 'TSS4RPJHHH41', 'Trade to Bitcoin High', NULL, '2025-04-15 07:47:33', '2025-04-15 07:47:33'),
(51, 4, 55.00000000, 0.00000000, 17117.00000000, '+', '3ND26DO9UYFT', 'Trade to Bitcoin WIN', NULL, '2025-04-15 07:47:45', '2025-04-15 07:47:45'),
(52, 4, 100.00000000, 0.00000000, 17017.00000000, '-', 'XNYPEE77UW23', 'Trade to Bitcoin High', NULL, '2025-04-15 07:51:29', '2025-04-15 07:51:29'),
(53, 4, 100.00000000, 0.00000000, 17017.00000000, '-', 'FUXJP3JZJKVK', 'Trade to Bitcoin LOSS', NULL, '2025-04-15 07:51:37', '2025-04-15 07:51:37'),
(54, 4, 5.00000000, 0.00000000, 17012.00000000, '-', 'SSUSM85E961F', 'Trade to Bitcoin High', NULL, '2025-04-15 10:09:48', '2025-04-15 10:09:48'),
(55, 4, 5.50000000, 0.00000000, 17017.50000000, '+', 'QDNDO3FVC4YO', 'Trade to Bitcoin WIN', NULL, '2025-04-15 10:10:06', '2025-04-15 10:10:06'),
(56, 3, 100.00000000, 0.00000000, 2522.00000000, '+', 'B98XJZZO3NDF', 'Trade Bitcoin WIN', NULL, '2025-04-15 23:00:11', '2025-04-15 23:00:11'),
(57, 3, 100.00000000, 0.00000000, 2622.00000000, '+', 'TB41N6ZZJ9B9', 'Trade Bitcoin WIN', NULL, '2025-04-15 23:00:12', '2025-04-15 23:00:12'),
(58, 11, 10000.00000000, 0.00000000, 10000.00000000, '+', '3CNDKM5C64YK', 'Reward', 'balance_add', '2025-04-16 05:43:22', '2025-04-16 05:43:22'),
(59, 11, 100.00000000, 0.00000000, 9900.00000000, '-', 'D8EOFDB1OXSB', 'Trade to Bitcoin High', NULL, '2025-04-16 05:43:57', '2025-04-16 05:43:57'),
(60, 11, 120.00000000, 0.00000000, 10020.00000000, '+', 'GF9R8W8Z12B6', 'Trade to Bitcoin WIN', NULL, '2025-04-16 05:44:58', '2025-04-16 05:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `demo_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT 100,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `ref_by`, `balance`, `demo_balance`, `password`, `address`, `status`, `kyc_data`, `kv`, `ev`, `sv`, `profile_complete`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `ban_reason`, `score`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Awaa', 'Malik', 'awaamalik', 'bizbaybrand@gmail.com', 'PK', '923145566765', 0, 250.00000000, 0.00000000, '$2y$10$f62jjuSz9mS4q4VJJDSaruHVaIErmToEtpV6/oPet1X0/q027EDlG', '{\"country\":\"Pakistan\",\"address\":null,\"state\":null,\"zip\":null,\"city\":null}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 100, 'bZlvAJDXp2CxTnI01zZJAGS3zdWnsOfyr8TTq6gztvokDKmbh1wFzZh41s3i', '2025-04-09 10:08:36', '2025-04-09 14:37:50'),
(2, 'Dev', 'malik', 'devmalik', 'devmalik@gmail.com', 'BD', '8806577898755', 3, 0.00000000, 0.00000000, '$2y$10$Xy9AnetsxntiOLgJEHWqs.3ZWAlQH3An/KPiM8ekGtbaTuGfXyuVS', '{\"country\":\"Bangladesh\",\"address\":null,\"state\":null,\"zip\":null,\"city\":null}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-09 14:15:26', '2025-04-09 14:15:47'),
(3, 'Test', 'LastName', 'testnewuser', 'testinguser1@gmail.com', 'PK', '923480500000', 3, 2622.00000000, 0.00000000, '$2y$10$JYr7mnRLObXt24IaD.tZcuS8kEtS1VmOJpx9nF3Y8aUBvo/36z8aW', '{\"country\":\"Pakistan\",\"address\":null,\"state\":null,\"zip\":null,\"city\":null}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-11 11:18:19', '2025-04-15 23:00:12'),
(4, 'test', 'test', 'testssss', 'test@gmail.com', 'AF', '933480597383', 3, 17017.50000000, 0.00000000, '$2y$10$RPS/SR2vczZBGj2m0snA7eML6nSdLZj3nK9mpX1PTn8ER/aBPlfAi', '{\"country\":\"Afghanistan\",\"address\":null,\"state\":null,\"zip\":null,\"city\":null}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-11 14:08:20', '2025-04-15 10:10:06'),
(5, NULL, NULL, 'testing', 'test23@gmail.com', NULL, NULL, 3, 0.00000000, 0.00000000, '$2y$10$lpIQEEpw7DFHpErHFJVI7OQWyUeczTG0osmIdh8vlCBtoBklfi.1S', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":null,\"city\":\"\"}', 1, NULL, 1, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-15 08:57:01', '2025-04-15 08:57:01'),
(6, NULL, NULL, 'testingusernew', 'xarakkhan000+test@gmail.com', NULL, NULL, 3, 0.00000000, 0.00000000, '$2y$10$wjPZtzjkLZzStR.eQ7EJzuuJfvWqNYC29fKanL9/6QVOmoOd6xdQe', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":null,\"city\":\"\"}', 1, NULL, 1, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-15 09:00:37', '2025-04-15 09:00:37'),
(7, NULL, NULL, 'testssssss', 'tessss@gmail.com', NULL, NULL, 3, 0.00000000, 0.00000000, '$2y$10$ZeZU6XrI4WmmUnCjv0rRJ.ycQjN9z44TN7er0nSV0Q03IU.HylGKi', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":null,\"city\":\"\"}', 1, NULL, 1, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-15 09:03:22', '2025-04-15 09:03:22'),
(8, NULL, NULL, 'tsssssss', 'testesfs@gmail.com', NULL, NULL, 3, 0.00000000, 0.00000000, '$2y$10$nVeQ059Y/zgoBLX/sWrd/eVda7nAp4iQwTTWEVDFvpbqatH5XXHwa', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":null,\"city\":\"\"}', 1, NULL, 1, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-15 09:05:47', '2025-04-15 09:05:47'),
(9, NULL, NULL, 'adadaaaa', 'dasdas@gmail.com', NULL, NULL, 3, 0.00000000, 0.00000000, '$2y$10$7Z/yUhbSA0FS6ja2cEWoK.h9IMlZjLD1Wv8KyStR6qABSEVK/nL96', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":null,\"city\":\"\"}', 1, NULL, 1, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-15 09:10:30', '2025-04-15 09:10:30'),
(10, NULL, NULL, 'zaraktest', 'zaraktest@gmail.com', NULL, NULL, 3, 0.00000000, 0.00000000, '$2y$10$.JkWFUDxOcT32FZRETvtr.P0YEyGNv9b5I673vxZAk3kI7ocHehKO', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":null,\"city\":\"\"}', 1, NULL, 1, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-15 09:44:46', '2025-04-15 09:44:46'),
(11, NULL, NULL, 'itsmalik', 'itsmalik@gmail.com', NULL, NULL, 5, 10020.00000000, 0.00000000, '$2y$10$vumGS7YflwUtKTiHBLp5V.uyld5cvsGY2x7bC1umCn9RKTgQDtKJS', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":null,\"city\":\"\"}', 1, NULL, 1, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 100, 'pxJqnCwcXRNXDQGbNOTooHiaTH1BxS0tA4GRbtFNZgvejfRqg7JSENpMdVv3', '2025-04-15 23:03:42', '2025-04-16 05:44:58'),
(12, 'zarak', 'khan', 'newusertest', 'xarakkhan000@gmail.com', NULL, NULL, 5, 0.00000000, 0.00000000, '$2y$10$fcYJdQT7mtmHLRiANGQW1O1mpcPSDOn6jJlDsQJpLOy8Wx2hCtjIq', '{\"address\":null,\"state\":null,\"zip\":null,\"country\":null,\"city\":null}', 1, NULL, 1, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-15 23:09:11', '2025-04-15 23:11:16'),
(13, NULL, NULL, 'moonsoon7', 'moonsoon7@gmail.com', NULL, NULL, 6, 0.00000000, 0.00000000, '$2y$10$eXjsmr1d.VlvgBzWNsQUL.eOu9Img6iRcTpV.fnZaXMvGpYf4RHYK', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":null,\"city\":\"\"}', 1, NULL, 1, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 100, NULL, '2025-04-18 14:10:57', '2025-04-18 14:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `longitude` varchar(40) DEFAULT NULL,
  `latitude` varchar(40) DEFAULT NULL,
  `browser` varchar(40) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(0, 1, '221.120.216.25', '', 'Pakistan', 'PK', '70', '30', 'Chrome', 'Windows 10', '2025-04-09 10:08:36', '2025-04-09 10:08:36'),
(0, 1, '221.120.216.25', '', 'Pakistan', 'PK', '70', '30', 'Chrome', 'Windows 10', '2025-04-09 13:53:57', '2025-04-09 13:53:57'),
(0, 2, '221.120.216.25', '', 'Pakistan', 'PK', '70', '30', 'Chrome', 'Windows 10', '2025-04-09 14:15:26', '2025-04-09 14:15:26'),
(0, 1, '104.28.241.183', 'Rawalpindi', 'Pakistan', 'PK', '73.0436', '33.599', 'Chrome', 'Windows 10', '2025-04-09 15:01:25', '2025-04-09 15:01:25'),
(0, 1, '104.28.241.184', 'Rawalpindi', 'Pakistan', 'PK', '73.0436', '33.599', 'Chrome', 'Windows 10', '2025-04-09 15:02:27', '2025-04-09 15:02:27'),
(0, 1, '154.57.220.5', '', 'Pakistan', 'PK', '70', '30', 'Chrome', 'Windows 10', '2025-04-09 23:04:57', '2025-04-09 23:04:57'),
(0, 1, '223.123.13.118', '', 'Pakistan', 'PK', '70', '30', 'Chrome', 'Windows 10', '2025-04-09 23:24:10', '2025-04-09 23:24:10'),
(0, 1, '104.28.248.226', 'Multan', 'Pakistan', 'PK', '71.4702', '30.2216', 'Chrome', 'Windows 10', '2025-04-10 10:19:12', '2025-04-10 10:19:12'),
(0, 1, '104.28.248.226', 'Multan', 'Pakistan', 'PK', '71.4702', '30.2216', 'Chrome', 'Windows 10', '2025-04-10 10:52:23', '2025-04-10 10:52:23'),
(0, 1, '221.120.216.25', '', 'Pakistan', 'PK', '70', '30', 'Chrome', 'Linux', '2025-04-10 13:47:01', '2025-04-10 13:47:01'),
(0, 3, '127.0.0.1', '', '', '', '', '', 'Firefox', 'Windows 10', '2025-04-11 11:18:20', '2025-04-11 11:18:20'),
(0, 4, '127.0.0.1', '', '', '', '', '', 'Firefox', 'Windows 10', '2025-04-11 14:08:20', '2025-04-11 14:08:20'),
(0, 5, '127.0.0.1', '', '', '', '', '', 'Firefox', 'Windows 10', '2025-04-15 08:57:01', '2025-04-15 08:57:01'),
(0, 6, '127.0.0.1', '', '', '', '', '', 'Firefox', 'Windows 10', '2025-04-15 09:00:37', '2025-04-15 09:00:37'),
(0, 7, '127.0.0.1', '', '', '', '', '', 'Firefox', 'Windows 10', '2025-04-15 09:03:22', '2025-04-15 09:03:22'),
(0, 8, '127.0.0.1', '', '', '', '', '', 'Firefox', 'Windows 10', '2025-04-15 09:05:47', '2025-04-15 09:05:47'),
(0, 9, '127.0.0.1', '', '', '', '', '', 'Firefox', 'Windows 10', '2025-04-15 09:10:30', '2025-04-15 09:10:30'),
(0, 10, '127.0.0.1', '', '', '', '', '', 'Firefox', 'Windows 10', '2025-04-15 09:44:46', '2025-04-15 09:44:46'),
(0, 11, '221.120.216.25', '', 'Pakistan', 'PK', '70', '30', 'Chrome', 'Linux', '2025-04-15 23:03:42', '2025-04-15 23:03:42'),
(0, 12, '223.123.88.150', '', 'Pakistan', 'PK', '70', '30', 'Handheld Browser', 'Android', '2025-04-15 23:09:12', '2025-04-15 23:09:12'),
(0, 11, '221.120.216.25', '', 'Pakistan', 'PK', '70', '30', 'Chrome', 'Linux', '2025-04-16 05:42:25', '2025-04-16 05:42:25'),
(0, 13, '154.198.67.222', 'Islamabad', 'Pakistan', 'PK', '73.0435', '33.7233', 'Chrome', 'Windows 10', '2025-04-18 14:10:58', '2025-04-18 14:10:58');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `method_id`, `user_id`, `amount`, `currency`, `rate`, `charge`, `trx`, `final_amount`, `after_charge`, `withdraw_information`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 50.00000000, 'USD', 1.00000000, 0.00000000, '254ECUHNT9W8', 50.00000000, 50.00000000, '[{\"name\":\"Name\",\"type\":\"text\",\"value\":\"AwiiMalik\"},{\"name\":\"Select Account\",\"type\":\"select\",\"value\":\"Bank\"},{\"name\":\"Account Number\",\"type\":\"textarea\",\"value\":\"089271556098\"}]', 2, NULL, '2025-04-09 10:12:08', '2025-04-09 10:12:46'),
(2, 1, 1, 50.00000000, 'USD', 1.00000000, 0.00000000, 'G9R5TGVBVZ5V', 50.00000000, 50.00000000, NULL, 0, NULL, '2025-04-09 12:14:26', '2025-04-09 12:14:26'),
(3, 1, 1, 100.00000000, 'INR', 1.00000000, 0.00000000, 'K92K4XWROYG7', 100.00000000, 100.00000000, NULL, 0, NULL, '2025-04-10 10:03:56', '2025-04-10 10:03:56'),
(4, 1, 3, 100.00000000, 'INR', 1.00000000, 0.00000000, '6FBKQC2HDHOB', 100.00000000, 100.00000000, NULL, 0, NULL, '2025-04-11 16:22:14', '2025-04-11 16:22:14'),
(5, 1, 3, 100.00000000, 'INR', 1.00000000, 0.00000000, '23K2BRVFRFPC', 100.00000000, 100.00000000, NULL, 0, NULL, '2025-04-11 16:25:42', '2025-04-11 16:25:42');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `form_id`, `name`, `min_limit`, `max_limit`, `fixed_charge`, `rate`, `percent_charge`, `currency`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 20, 'Collection Information', 100.00000000, 500.00000000, 0.00000000, 1.00000000, 0.00, 'BDT', '<br>', 1, '2025-04-09 10:06:17', '2025-04-16 05:41:28'),
(2, 21, 'test', 2.00000000, 5.00000000, 2.00000000, 2.00000000, 2.00, 'USD', '<br>', 1, '2025-04-10 17:36:57', '2025-04-10 17:36:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collection_information`
--
ALTER TABLE `collection_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crypto_currencies`
--
ALTER TABLE `crypto_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `symbol` (`symbol`),
  ADD KEY `name_4` (`name`);
ALTER TABLE `crypto_currencies` ADD FULLTEXT KEY `name_3` (`name`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `practice_logs`
--
ALTER TABLE `practice_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade_logs`
--
ALTER TABLE `trade_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade_settings`
--
ALTER TABLE `trade_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collection_information`
--
ALTER TABLE `collection_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_currencies`
--
ALTER TABLE `crypto_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `practice_logs`
--
ALTER TABLE `practice_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trade_logs`
--
ALTER TABLE `trade_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trade_settings`
--
ALTER TABLE `trade_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
