-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 13, 2023 at 11:15 AM
-- Server version: 10.5.19-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gatsexgc_gatsexg2`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(191) NOT NULL,
  `source` varchar(191) NOT NULL,
  `ip_address` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `source`, `ip_address`, `location`, `created_at`, `updated_at`) VALUES
(1, 2, '1', 'Web', '105.112.24.72', '', '2023-04-08 10:53:26', '2023-04-08 10:53:26'),
(2, 2, '1', 'Web', '105.112.24.72', '', '2023-04-08 11:01:55', '2023-04-08 11:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `admin_receive_token_transaction_histories`
--

CREATE TABLE `admin_receive_token_transaction_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `deposit_id` bigint(20) NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `to_address` varchar(191) NOT NULL,
  `from_address` varchar(191) NOT NULL,
  `transaction_hash` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_send_coin_histories`
--

CREATE TABLE `admin_send_coin_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `wallet_id` bigint(20) NOT NULL,
  `amount` decimal(29,18) UNSIGNED NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(180) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `slug`, `value`, `created_at`, `updated_at`) VALUES
(1, 'coin_price', '2.50', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(2, 'coin_name', 'cpc', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(3, 'app_title', 'Gatsexg', '2023-04-06 07:23:57', '2023-04-08 11:21:21'),
(4, 'maximum_withdrawal_daily', '3', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(5, 'mail_from', 'noreply@pexer.com', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(6, 'admin_coin_address', 'address', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(7, 'base_coin_type', 'BTC', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(8, 'minimum_withdrawal_amount', '0.005', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(9, 'maximum_withdrawal_amount', '12', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(10, 'maintenance_mode', 'no', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(11, 'logo', '64316a511b3d11680960081.png', '2023-04-06 07:23:57', '2023-04-08 11:21:21'),
(12, 'login_logo', '64316a51478da1680960081.png', '2023-04-06 07:23:57', '2023-04-08 11:21:21'),
(13, 'landing_logo', '', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(14, 'favicon', '64316a512a3c91680960081.png', '2023-04-06 07:23:57', '2023-04-08 11:21:21'),
(15, 'copyright_text', 'Copyright © 2022 GatsExg.  All Right Reserved. Designed by: Talosmart', '2023-04-06 07:23:57', '2023-04-08 11:21:21'),
(16, 'pagination_count', '10', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(17, 'point_rate', '1', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(18, 'lang', 'en', '2023-04-06 07:23:57', '2023-04-08 11:21:21'),
(19, 'company_name', 'Gatsexg', '2023-04-06 07:23:57', '2023-04-08 11:21:21'),
(20, 'primary_email', 'test@email.com', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(21, 'sms_getway_name', 'twillo', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(22, 'twillo_secret_key', 'MGd256f9f35f1ea5bfeda6ccb7896941c4', '2023-04-06 07:23:57', '2023-04-08 11:31:50'),
(23, 'twillo_auth_token', '5098886d7ee5ea134d6285237531ea29', '2023-04-06 07:23:57', '2023-04-08 11:31:50'),
(24, 'twillo_number', 'Gatsexg', '2023-04-06 07:23:57', '2023-04-08 11:31:50'),
(25, 'ssl_verify', '', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(26, 'mail_driver', 'SMTP', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(27, 'mail_host', 'mail.gatsexg.com', '2023-04-06 07:23:57', '2023-04-08 11:29:59'),
(28, 'mail_port', '465', '2023-04-06 07:23:57', '2023-04-08 11:40:11'),
(29, 'mail_username', 'info@gatsexg.com', '2023-04-06 07:23:57', '2023-04-08 11:42:05'),
(30, 'mail_password', 'TheGatsExchange987.', '2023-04-06 07:23:57', '2023-04-08 11:35:51'),
(31, 'mail_encryption', 'ssl', '2023-04-06 07:23:57', '2023-04-08 11:29:59'),
(32, 'mail_from_address', 'noreply@gatsexg.com', '2023-04-06 07:23:57', '2023-04-08 11:29:59'),
(33, 'braintree_client_token', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(34, 'braintree_environment', 'sandbox', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(35, 'braintree_merchant_id', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(36, 'braintree_public_key', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(37, 'braintree_private_key', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(38, 'clickatell_api_key', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(39, 'number_of_confirmation', '3', '2023-04-06 07:23:57', '2023-04-08 11:21:21'),
(40, 'referral_commission_percentage', '10', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(41, 'referral_signup_reward', '10', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(42, 'max_affiliation_level', '10', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(43, 'coin_api_user', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(44, 'coin_api_pass', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(45, 'coin_api_host', 'test5', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(46, 'coin_api_port', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(47, 'send_fees_type', '1', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(48, 'send_fees_fixed', '0', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(49, 'send_fees_percentage', '0', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(50, 'max_send_limit', '0', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(51, 'deposit_time', '1', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(52, 'COIN_PAYMENT_PUBLIC_KEY', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(53, 'COIN_PAYMENT_PRIVATE_KEY', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(54, 'COIN_PAYMENT_CURRENCY', 'BTC', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(55, 'ipn_merchant_id', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(56, 'ipn_secret', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(57, 'payment_method_coin_payment', '1', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(58, 'payment_method_bank_deposit', '1', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(59, 'chain_id', '97', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(60, 'chain_link', 'https://data-seed-prebsc-1-s1.binance.org:8545', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(61, 'contract_address', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(62, 'wallet_address', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(63, 'private_key', 'test', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(64, 'contract_decimal', '18', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(65, 'gas_limit', '43000', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(66, 'contract_coin_name', 'BNB', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(67, 'kyc_enable_for_withdrawal', '1', '2023-04-06 07:23:57', '2023-04-08 11:33:50'),
(68, 'kyc_nid_enable_for_withdrawal', '1', '2023-04-06 07:23:57', '2023-04-08 11:33:50'),
(69, 'kyc_passport_enable_for_withdrawal', '1', '2023-04-06 07:23:57', '2023-04-08 11:33:50'),
(70, 'kyc_driving_enable_for_withdrawal', '1', '2023-04-06 07:23:57', '2023-04-08 11:33:50'),
(71, 'kyc_enable_for_trade', '1', '2023-04-06 07:23:57', '2023-04-08 11:44:16'),
(72, 'kyc_nid_enable_for_trade', '1', '2023-04-06 07:23:57', '2023-04-08 11:44:16'),
(73, 'kyc_passport_enable_for_trade', '1', '2023-04-06 07:23:57', '2023-04-08 11:44:16'),
(74, 'kyc_driving_enable_for_trade', '1', '2023-04-06 07:23:57', '2023-04-08 11:44:16'),
(75, 'swap_enabled', '1', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(76, 'google_recapcha', '0', '2023-04-06 07:23:57', '2023-04-08 11:16:00'),
(77, 'phone_verification_trade', '1', '2023-04-06 07:23:57', '2023-04-08 11:44:16'),
(78, 'dispute_cancel_time', '15', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(79, 'user_theme_navbar_menu_text_color', '#ffffff', '2023-04-06 07:23:57', '2023-04-08 11:00:15'),
(80, 'user_theme_navbar_active_menu_text_color', '#01daff', '2023-04-06 07:23:57', '2023-04-08 11:00:15'),
(81, 'user_theme_navbar_background_color', '#0170c2', '2023-04-06 07:23:57', '2023-04-08 11:00:15'),
(82, 'user_theme_body_background_color', '#eef0f8', '2023-04-06 07:23:57', '2023-04-08 11:00:15'),
(83, 'user_theme_card_body_background_color', '#ffffff', '2023-04-06 07:23:57', '2023-04-08 11:04:47'),
(84, 'user_theme_primary_text_color', '#033154', '2023-04-06 07:23:57', '2023-04-08 11:05:52'),
(85, 'user_theme_secondary_text_color', '#00738a', '2023-04-06 07:23:57', '2023-04-08 11:06:35'),
(86, 'user_theme_warning_text_color', '#ff0537', '2023-04-06 07:23:57', '2023-04-08 11:07:31'),
(87, 'user_theme_link_text_color', '#0170c3', '2023-04-06 07:23:57', '2023-04-08 11:07:31'),
(88, 'user_theme_button_text_color', '#ffffff', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(89, 'user_theme_button_background_color', '#0170c3', '2023-04-06 07:23:57', '2023-04-08 11:09:28'),
(90, 'user_theme_active_button_background_color', '#01dbff', '2023-04-06 07:23:57', '2023-04-08 11:07:31'),
(91, 'buy_coin_feature', '2', '2023-04-08 11:15:26', '2023-04-08 11:15:26'),
(92, 'NOCAPTCHA_SECRET', '6LefWGIiAAAAAAMIFua9wGiSFDF2dotcdC-J_b4p', '2023-04-08 11:15:26', '2023-04-08 11:15:26'),
(93, 'NOCAPTCHA_SITEKEY', '6LefWGIiAAAAAJv2FlchDKylStM6LSCbN_Zsi5wz', '2023-04-08 11:15:26', '2023-04-08 11:15:26'),
(94, 'font_enable', '0', '2023-04-08 11:15:26', '2023-04-08 11:15:26'),
(95, 'company_address', 'Nigeria', '2023-04-08 11:21:21', '2023-04-08 11:21:21'),
(96, 'company_mobile_no', '+2347049887087', '2023-04-08 11:21:21', '2023-04-08 11:21:21'),
(97, 'company_email_address', 'info@gatsexg.com', '2023-04-08 11:21:21', '2023-04-08 11:21:21'),
(98, 'fees_level1', '2', '2023-04-08 11:32:17', '2023-04-08 11:32:17'),
(99, 'fees_level2', '1', '2023-04-08 11:32:17', '2023-04-08 11:32:17'),
(100, 'fees_level3', '0.5', '2023-04-08 11:32:17', '2023-04-08 11:32:17'),
(101, 'newsletter_description', 'Subscribe to our newsletter', '2023-04-08 12:33:45', '2023-04-08 12:33:45'),
(102, 'contact_address', 'Worldwide', '2023-04-08 12:33:45', '2023-04-08 12:33:45'),
(103, 'site_email', 'info@gatsexg.com', '2023-04-08 12:33:45', '2023-04-08 12:33:45'),
(104, 'footer_description', 'Gatsexg is the best place to trade. Gatsexg is the best place to trade. Gatsexg is the best place to trade. Gatsexg is the best place to trade.', '2023-04-08 12:34:33', '2023-04-08 12:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `affiliation_codes`
--

CREATE TABLE `affiliation_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(180) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affiliation_codes`
--

INSERT INTO `affiliation_codes` (`id`, `user_id`, `code`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, '26431673d27883', 1, NULL, '2023-04-08 11:08:13', '2023-04-08 11:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `affiliation_histories`
--

CREATE TABLE `affiliation_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `system_fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `transaction_id` bigint(20) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `wallet_id` bigint(20) DEFAULT NULL,
  `coin_type` varchar(191) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `account_holder_name` varchar(191) DEFAULT NULL,
  `account_holder_address` varchar(191) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `bank_address` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `swift_code` varchar(191) DEFAULT NULL,
  `iban` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buys`
--

CREATE TABLE `buys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `coin_id` bigint(20) NOT NULL,
  `coin_type` varchar(191) NOT NULL,
  `wallet_id` bigint(20) NOT NULL,
  `country` varchar(191) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `ip` varchar(191) NOT NULL,
  `coin_rate` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `rate_percentage` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `market_price` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `rate_type` tinyint(4) NOT NULL DEFAULT 1,
  `price_type` tinyint(4) NOT NULL DEFAULT 1,
  `minimum_trade_size` bigint(20) NOT NULL DEFAULT 0,
  `maximum_trade_size` bigint(20) NOT NULL DEFAULT 0,
  `headline` varchar(191) NOT NULL,
  `instruction` longtext DEFAULT NULL,
  `terms` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `amount` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `sold_amount` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `payment_time_limit` int(11) DEFAULT NULL,
  `registered_days` int(11) NOT NULL DEFAULT 0,
  `kyc_completed` tinyint(4) NOT NULL DEFAULT 0,
  `holding_amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_coin_histories`
--

CREATE TABLE `buy_coin_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(191) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `coin_id` bigint(20) NOT NULL,
  `coin` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `btc` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `doller` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `transaction_id` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `admin_confirmation` tinyint(4) NOT NULL DEFAULT 0,
  `confirmations` int(11) NOT NULL DEFAULT 0,
  `bank_sleep` varchar(191) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `coin_type` varchar(191) DEFAULT NULL,
  `phase_id` bigint(20) DEFAULT NULL,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `bonus` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `bonus_percentage` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `requested_amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `dispute_id` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `file` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coins`
--

CREATE TABLE `coins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(20) NOT NULL,
  `rate` decimal(19,8) NOT NULL DEFAULT 1.00000000,
  `image` varchar(191) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_withdrawal` tinyint(4) NOT NULL DEFAULT 1,
  `is_deposit` tinyint(4) NOT NULL DEFAULT 1,
  `is_buy` tinyint(4) NOT NULL DEFAULT 1,
  `is_sell` tinyint(4) NOT NULL DEFAULT 1,
  `minimum_withdrawal` decimal(19,8) NOT NULL DEFAULT 0.00001000,
  `maximum_withdrawal` decimal(19,8) NOT NULL DEFAULT 99999999.99990000,
  `minimum_trade_size` decimal(19,8) NOT NULL DEFAULT 0.00100000,
  `maximum_trade_size` decimal(19,8) NOT NULL DEFAULT 99999999.99990000,
  `withdrawal_fees` decimal(19,8) NOT NULL DEFAULT 0.00100000,
  `trade_fees` decimal(19,8) NOT NULL DEFAULT 0.00100000,
  `escrow_fees` decimal(19,8) NOT NULL DEFAULT 0.00100000,
  `max_withdrawal_per_day` decimal(19,8) NOT NULL DEFAULT 999.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coins`
--

INSERT INTO `coins` (`id`, `unique_code`, `name`, `type`, `rate`, `image`, `details`, `status`, `is_withdrawal`, `is_deposit`, `is_buy`, `is_sell`, `minimum_withdrawal`, `maximum_withdrawal`, `minimum_trade_size`, `maximum_trade_size`, `withdrawal_fees`, `trade_fees`, `escrow_fees`, `max_withdrawal_per_day`, `created_at`, `updated_at`) VALUES
(1, '642e8fad68b9e1680773037', 'Bitcoin', 'BTC', '1.00000000', NULL, NULL, 1, 1, 1, 1, 1, '0.00001000', '99999999.99990000', '0.00100000', '99999999.99990000', '0.00100000', '0.00100000', '0.00100000', '999.00000000', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(2, '642e8fad694361680773037', 'Tether USD', 'USDT', '1.00000000', NULL, NULL, 1, 1, 1, 1, 1, '0.00001000', '99999999.99990000', '0.00100000', '99999999.99990000', '0.00100000', '0.00100000', '0.00100000', '999.00000000', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(3, '642e8fad69bf91680773037', 'Ether', 'ETH', '1.00000000', NULL, NULL, 1, 1, 1, 1, 1, '0.00001000', '99999999.99990000', '0.00100000', '99999999.99990000', '0.00100000', '0.00100000', '0.00100000', '999.00000000', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(4, '642e8fad6a2221680773037', 'Litecoin', 'LTC', '1.00000000', NULL, NULL, 1, 1, 1, 1, 1, '0.00001000', '99999999.99990000', '0.00100000', '99999999.99990000', '0.00100000', '0.00100000', '0.00100000', '999.00000000', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(5, '642e8fad6a93f1680773037', 'Ether', 'DOGE', '1.00000000', NULL, NULL, 1, 1, 1, 1, 1, '0.00001000', '99999999.99990000', '0.00100000', '99999999.99990000', '0.00100000', '0.00100000', '0.00100000', '999.00000000', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(6, '642e8fad6b0c91680773037', 'Bitcoin Cash', 'BCH', '1.00000000', NULL, NULL, 1, 1, 1, 1, 1, '0.00001000', '99999999.99990000', '0.00100000', '99999999.99990000', '0.00100000', '0.00100000', '0.00100000', '999.00000000', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(7, '642e8fad6b64f1680773037', 'Dash', 'DASH', '1.00000000', NULL, NULL, 1, 1, 1, 1, 1, '0.00001000', '99999999.99990000', '0.00100000', '99999999.99990000', '0.00100000', '0.00100000', '0.00100000', '999.00000000', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(8, '642e8fad6bfaa1680773037', 'cpc Coin', 'DEFAULT', '1.00000000', NULL, NULL, 1, 1, 1, 1, 1, '0.00001000', '99999999.99990000', '0.00100000', '99999999.99990000', '0.00100000', '0.00100000', '0.00100000', '999.00000000', '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(9, '642e8fad6c65b1680773037', 'LTCT', 'LTCT', '1.00000000', NULL, NULL, 1, 1, 1, 1, 1, '0.00001000', '99999999.99990000', '0.00100000', '99999999.99990000', '0.00100000', '0.00100000', '0.00100000', '999.00000000', '2023-04-06 07:23:57', '2023-04-06 07:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `coin_payment_network_fees`
--

CREATE TABLE `coin_payment_network_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coin_type` varchar(80) NOT NULL,
  `is_fiat` tinyint(4) NOT NULL DEFAULT 0,
  `last_update` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `tx_fee` decimal(19,8) NOT NULL,
  `rate_btc` decimal(29,18) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country_lists`
--

CREATE TABLE `country_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_lists`
--

INSERT INTO `country_lists` (`id`, `key`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(2, 'AL', 'Albania', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(3, 'DZ', 'Algeria', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(4, 'AS', 'American Samoa', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(5, 'AD', 'Andorra', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(6, 'AO', 'Angola', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(7, 'AI', 'Anguilla', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(8, 'AQ', 'Antarctica', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(9, 'AG', 'Antigua and Barbuda', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(10, 'AR', 'Argentina', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(11, 'AM', 'Armenia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(12, 'AW', 'Aruba', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(13, 'AU', 'Australia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(14, 'AT', 'Austria', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(15, 'AZ', 'Azerbaijan', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(16, 'BS', 'Bahamas', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(17, 'BH', 'Bahrain', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(18, 'BD', 'Bangladesh', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(19, 'BB', 'Barbados', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(20, 'BY', 'Belarus', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(21, 'BE', 'Belgium', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(22, 'BZ', 'Belize', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(23, 'BJ', 'Benin', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(24, 'BM', 'Bermuda', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(25, 'BT', 'Bhutan', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(26, 'BO', 'Bolivia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(27, 'BA', 'Bosnia and Herzegovina', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(28, 'BW', 'Botswana', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(29, 'BV', 'Bouvet Island', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(30, 'BR', 'Brazil', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(31, 'IO', 'British Indian Ocean Territory', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(32, 'BN', 'Brunei Darussalam', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(33, 'BG', 'Bulgaria', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(34, 'BF', 'Burkina Faso', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(35, 'BI', 'Burundi', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(36, 'KH', 'Cambodia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(37, 'CM', 'Cameroon', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(38, 'CA', 'Canada', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(39, 'CV', 'Cape Verde', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(40, 'KY', 'Cayman Islands', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(41, 'CF', 'Central African Republic', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(42, 'TD', 'Chad', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(43, 'CL', 'Chile', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(44, 'CN', 'China', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(45, 'CX', 'Christmas Island', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(46, 'CC', 'Cocos (Keeling) Islands', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(47, 'CO', 'Colombia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(48, 'KM', 'Comoros', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(49, 'CG', 'Congo', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(50, 'CD', 'Congo, the Democratic Republic of the', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(51, 'CK', 'Cook Islands', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(52, 'CR', 'Costa Rica', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(53, 'CI', 'Cote D\'Ivoire', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(54, 'HR', 'Croatia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(55, 'CU', 'Cuba', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(56, 'CY', 'Cyprus', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(57, 'CZ', 'Czech Republic', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(58, 'DK', 'Denmark', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(59, 'DJ', 'Djibouti', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(60, 'DM', 'Dominica', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(61, 'DO', 'Dominican Republic', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(62, 'EC', 'Ecuador', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(63, 'EG', 'Egypt', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(64, 'SV', 'El Salvador', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(65, 'GQ', 'Equatorial Guinea', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(66, 'ER', 'Eritrea', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(67, 'EE', 'Estonia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(68, 'ET', 'Ethiopia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(69, 'FK', 'Falkland Islands (Malvinas)', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(70, 'FO', 'Faroe Islands', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(71, 'FJ', 'Fiji', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(72, 'FI', 'Finland', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(73, 'FR', 'France', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(74, 'GF', 'French Guiana', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(75, 'PF', 'French Polynesia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(76, 'TF', 'French Southern Territories', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(77, 'GA', 'Gabon', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(78, 'GM', 'Gambia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(79, 'GE', 'Georgia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(80, 'DE', 'Germany', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(81, 'GH', 'Ghana', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(82, 'GI', 'Gibraltar', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(83, 'GR', 'Greece', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(84, 'GL', 'Greenland', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(85, 'GD', 'Grenada', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(86, 'GP', 'Guadeloupe', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(87, 'GU', 'Guam', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(88, 'GT', 'Guatemala', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(89, 'GN', 'Guinea', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(90, 'GW', 'Guinea-Bissau', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(91, 'GY', 'Guyana', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(92, 'HT', 'Haiti', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(93, 'HM', 'Heard Island and Mcdonald Islands', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(94, 'VA', 'Holy See (Vatican City State)', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(95, 'HN', 'Honduras', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(96, 'HK', 'Hong Kong', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(97, 'HU', 'Hungary', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(98, 'IS', 'Iceland', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(99, 'IN', 'India', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(100, 'ID', 'Indonesia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(101, 'IR', 'Iran, Islamic Republic of', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(102, 'IQ', 'Iraq', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(103, 'IE', 'Ireland', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(104, 'IL', 'Israel', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(105, 'IT', 'Italy', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(106, 'JM', 'Jamaica', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(107, 'JP', 'Japan', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(108, 'JO', 'Jordan', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(109, 'KZ', 'Kazakhstan', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(110, 'KE', 'Kenya', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(111, 'KI', 'Kiribati', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(112, 'KP', 'Korea, Democratic People\'s Republic of', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(113, 'KR', 'Korea, Republic of', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(114, 'KW', 'Kuwait', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(115, 'KG', 'Kyrgyzstan', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(116, 'LA', 'Lao People\'s Democratic Republic', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(117, 'LV', 'Latvia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(118, 'LB', 'Lebanon', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(119, 'LS', 'Lesotho', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(120, 'LR', 'Liberia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(121, 'LY', 'Libyan Arab Jamahiriya', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(122, 'LI', 'Liechtenstein', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(123, 'LT', 'Lithuania', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(124, 'LU', 'Luxembourg', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(125, 'MO', 'Macao', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(126, 'MK', 'Macedonia, the Former Yugoslav Republic of', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(127, 'MG', 'Madagascar', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(128, 'MW', 'Malawi', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(129, 'MY', 'Malaysia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(130, 'MV', 'Maldives', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(131, 'ML', 'Mali', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(132, 'MT', 'Malta', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(133, 'MH', 'Marshall Islands', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(134, 'MQ', 'Martinique', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(135, 'MR', 'Mauritania', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(136, 'MU', 'Mauritius', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(137, 'YT', 'Mayotte', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(138, 'MX', 'Mexico', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(139, 'FM', 'Micronesia, Federated States of', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(140, 'MD', 'Moldova, Republic of', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(141, 'MC', 'Monaco', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(142, 'MN', 'Mongolia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(143, 'MS', 'Montserrat', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(144, 'MA', 'Morocco', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(145, 'MZ', 'Mozambique', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(146, 'MM', 'Myanmar', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(147, 'NA', 'Namibia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(148, 'NR', 'Nauru', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(149, 'NP', 'Nepal', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(150, 'NL', 'Netherlands', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(151, 'AN', 'Netherlands Antilles', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(152, 'NC', 'New Caledonia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(153, 'NZ', 'New Zealand', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(154, 'NI', 'Nicaragua', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(155, 'NE', 'Niger', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(156, 'NG', 'Nigeria', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(157, 'NU', 'Niue', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(158, 'NF', 'Norfolk Island', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(159, 'MP', 'Northern Mariana Islands', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(160, 'NO', 'Norway', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(161, 'OM', 'Oman', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(162, 'PK', 'Pakistan', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(163, 'PW', 'Palau', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(164, 'PS', 'Palestinian Territory, Occupied', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(165, 'PA', 'Panama', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(166, 'PG', 'Papua New Guinea', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(167, 'PY', 'Paraguay', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(168, 'PE', 'Peru', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(169, 'PH', 'Philippines', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(170, 'PN', 'Pitcairn', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(171, 'PL', 'Poland', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(172, 'PT', 'Portugal', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(173, 'PR', 'Puerto Rico', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(174, 'QA', 'Qatar', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(175, 'RE', 'Reunion', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(176, 'RO', 'Romania', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(177, 'RU', 'Russian Federation', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(178, 'RW', 'Rwanda', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(179, 'SH', 'Saint Helena', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(180, 'KN', 'Saint Kitts and Nevis', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(181, 'LC', 'Saint Lucia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(182, 'PM', 'Saint Pierre and Miquelon', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(183, 'VC', 'Saint Vincent and the Grenadines', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(184, 'WS', 'Samoa', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(185, 'SM', 'San Marino', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(186, 'ST', 'Sao Tome and Principe', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(187, 'SA', 'Saudi Arabia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(188, 'SN', 'Senegal', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(189, 'CS', 'Serbia and Montenegro', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(190, 'SC', 'Seychelles', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(191, 'SL', 'Sierra Leone', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(192, 'SG', 'Singapore', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(193, 'SK', 'Slovakia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(194, 'SI', 'Slovenia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(195, 'SB', 'Solomon Islands', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(196, 'SO', 'Somalia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(197, 'ZA', 'South Africa', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(198, 'GS', 'South Georgia and the South Sandwich Islands', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(199, 'ES', 'Spain', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(200, 'LK', 'Sri Lanka', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(201, 'SD', 'Sudan', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(202, 'SR', 'Suriname', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(203, 'SJ', 'Svalbard and Jan Mayen', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(204, 'SZ', 'Swaziland', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(205, 'SE', 'Sweden', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(206, 'CH', 'Switzerland', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(207, 'SY', 'Syrian Arab Republic', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(208, 'TW', 'Taiwan, Province of China', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(209, 'TJ', 'Tajikistan', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(210, 'TZ', 'Tanzania, United Republic of', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(211, 'TH', 'Thailand', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(212, 'TL', 'Timor-Leste', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(213, 'TG', 'Togo', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(214, 'TK', 'Tokelau', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(215, 'TO', 'Tonga', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(216, 'TT', 'Trinidad and Tobago', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(217, 'TN', 'Tunisia', 1, '2023-04-06 07:23:56', '2023-04-06 07:23:56'),
(218, 'TR', 'Turkey', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(219, 'TM', 'Turkmenistan', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(220, 'TC', 'Turks and Caicos Islands', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(221, 'TV', 'Tuvalu', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(222, 'UG', 'Uganda', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(223, 'UA', 'Ukraine', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(224, 'AE', 'United Arab Emirates', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(225, 'GB', 'United Kingdom', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(226, 'US', 'United States', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(227, 'UM', 'United States Minor Outlying Islands', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(228, 'UY', 'Uruguay', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(229, 'UZ', 'Uzbekistan', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(230, 'VU', 'Vanuatu', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(231, 'VE', 'Venezuela', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(232, 'VN', 'Viet Nam', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(233, 'VG', 'Virgin Islands, British', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(234, 'VI', 'Virgin Islands, U.s.', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(235, 'WF', 'Wallis and Futuna', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(236, 'EH', 'Western Sahara', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(237, 'YE', 'Yemen', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(238, 'ZM', 'Zambia', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(239, 'ZW', 'Zimbabwe', 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `country_payment_methods`
--

CREATE TABLE `country_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) NOT NULL,
  `country` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency_lists`
--

CREATE TABLE `currency_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(180) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `rate` decimal(19,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_primary` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_lists`
--

INSERT INTO `currency_lists` (`id`, `name`, `code`, `symbol`, `rate`, `status`, `is_primary`, `created_at`, `updated_at`) VALUES
(1, 'Afghan Afghani', 'AFA', '؋', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:46:13'),
(2, 'Albanian Lek', 'ALL', 'Lek', '103.20', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(3, 'Algerian Dinar', 'DZD', 'دج', '135.63', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(4, 'Angolan Kwanza', 'AOA', 'Kz', '507.75', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(5, 'Argentine Peso', 'ARS', '$', '209.71', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(6, 'Armenian Dram', 'AMD', '֏', '388.24', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(7, 'Aruban Florin', 'AWG', 'ƒ', '1.80', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(8, 'Australian Dollar', 'AUD', '$', '1.50', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(9, 'Azerbaijani Manat', 'AZN', 'm', '1.70', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(10, 'Bahamian Dollar', 'BSD', 'B$', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(11, 'Bahraini Dinar', 'BHD', '.د.ب', '0.38', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(12, 'Bangladeshi Taka', 'BDT', '৳', '105.82', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(13, 'Barbadian Dollar', 'BBD', 'Bds$', '2.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(14, 'Belarusian Ruble', 'BYR', 'Br', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:44:28'),
(15, 'Belgian Franc', 'BEF', 'fr', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:44:28'),
(16, 'Belize Dollar', 'BZD', '$', '2.02', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(17, 'Bermudan Dollar', 'BMD', '$', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(18, 'Bhutanese Ngultrum', 'BTN', 'Nu.', '81.73', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(19, 'Bolivian Boliviano', 'BOB', 'Bs.', '6.91', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(20, 'Bosnia', 'BAM', 'KM', '1.79', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(21, 'Botswanan Pula', 'BWP', 'P', '13.15', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(22, 'Brazilian Real', 'BRL', 'R$', '5.05', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(23, 'British Pound Sterling', 'GBP', '£', '0.81', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(24, 'Brunei Dollar', 'BND', 'B$', '1.33', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(25, 'Bulgarian Lev', 'BGN', 'Лв.', '1.79', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(26, 'Burundian Franc', 'BIF', 'FBu', '2079.47', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(27, 'Cambodian Riel', 'KHR', 'KHR', '4054.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(28, 'Canadian Dollar', 'CAD', '$', '1.36', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(29, 'Cape Verdean Escudo', 'CVE', '$', '101.43', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(30, 'Cayman Islands Dollar', 'KYD', '$', '0.83', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(31, 'CFA Franc BCEAO', 'XOF', 'CFA', '596.23', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(32, 'CFA Franc BEAC', 'XAF', 'FCFA', '596.23', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(33, 'CFP Franc', 'XPF', '₣', '108.47', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(34, 'Chilean Peso', 'CLP', '$', '817.88', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(35, 'Chinese Yuan', 'CNY', '¥', '6.87', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(36, 'Colombian Peso', 'COP', '$', '4549.25', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(37, 'Comorian Franc', 'KMF', 'CF', '451.03', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(38, 'Congolese Franc', 'CDF', 'FC', '2047.49', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(39, 'Costa Rican ColÃ³n', 'CRC', '₡', '537.66', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(40, 'Croatian Kuna', 'HRK', 'kn', '6.91', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(41, 'Cuban Convertible Peso', 'CUC', '$, CUC', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(42, 'Czech Republic Koruna', 'CZK', 'Kč', '21.37', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(43, 'Danish Krone', 'DKK', 'Kr.', '6.83', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(44, 'Djiboutian Franc', 'DJF', 'Fdj', '177.74', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(45, 'Dominican Peso', 'DOP', '$', '54.76', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(46, 'East Caribbean Dollar', 'XCD', '$', '2.70', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(47, 'Egyptian Pound', 'EGP', 'ج.م', '30.73', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(48, 'Eritrean Nakfa', 'ERN', 'Nfk', '14.99', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(49, 'Estonian Kroon', 'EEK', 'kr', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:44:28'),
(50, 'Ethiopian Birr', 'ETB', 'Nkf', '53.94', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(51, 'Euro', 'EUR', '€', '0.91', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(52, 'Falkland Islands Pound', 'FKP', '£', '0.80', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(53, 'Fijian Dollar', 'FJD', 'FJ$', '2.20', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(54, 'Gambian Dalasi', 'GMD', 'D', '62.17', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(55, 'Georgian Lari', 'GEL', 'ლ', '2.55', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(56, 'German Mark', 'DEM', 'DM', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:44:28'),
(57, 'Ghanaian Cedi', 'GHS', 'GH₵', '10.77', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(58, 'Gibraltar Pound', 'GIP', '£', '0.81', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(59, 'Greek Drachma', 'GRD', '₯, Δρχ, Δρ', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:44:28'),
(60, 'Guatemalan Quetzal', 'GTQ', 'Q', '7.80', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(61, 'Guinean Franc', 'GNF', 'FG', '8645.72', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(62, 'Guyanaese Dollar', 'GYD', '$', '211.43', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(63, 'Haitian Gourde', 'HTG', 'G', '154.95', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(64, 'Honduran Lempira', 'HNL', 'L', '24.59', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(65, 'Hong Kong Dollar', 'HKD', '$', '7.85', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(66, 'Hungarian Forint', 'HUF', 'Ft', '344.21', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(67, 'Icelandic KrÃ³na', 'ISK', 'kr', '137.21', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(68, 'Indian Rupee', 'INR', '₹', '81.84', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(69, 'Indonesian Rupiah', 'IDR', 'Rp', '14933.56', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(70, 'Iranian Rial', 'IRR', '﷼', '42229.11', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(71, 'Iraqi Dinar', 'IQD', 'د.ع', '1460.28', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(72, 'Israeli New Sheqel', 'ILS', '₪', '3.60', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(73, 'Italian Lira', 'ITL', 'L,£', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:44:28'),
(74, 'Jamaican Dollar', 'JMD', 'J$', '152.01', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(75, 'Japanese Yen', 'JPY', '¥', '132.09', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(76, 'Jordanian Dinar', 'JOD', 'ا.د', '0.71', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(77, 'Kazakhstani Tenge', 'KZT', 'лв', '445.85', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(78, 'Kenyan Shilling', 'KES', 'KSh', '133.58', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(79, 'Kuwaiti Dinar', 'KWD', 'ك.د', '0.31', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(80, 'Kyrgystani Som', 'KGS', 'лв', '87.38', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(81, 'Laotian Kip', 'LAK', '₭', '17181.50', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(82, 'Latvian Lats', 'LVL', 'Ls', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:44:28'),
(83, 'Lebanese Pound', 'LBP', '£', '15249.96', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(84, 'Lesotho Loti', 'LSL', 'L', '18.27', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(85, 'Liberian Dollar', 'LRD', '$', '162.47', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(86, 'Libyan Dinar', 'LYD', 'د.ل', '4.76', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(87, 'Lithuanian Litas', 'LTL', 'Lt', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:44:28'),
(88, 'Macanese Pataca', 'MOP', '$', '8.08', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(89, 'Macedonian Denar', 'MKD', 'ден', '56.40', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(90, 'Malagasy Ariary', 'MGA', 'Ar', '4360.34', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(91, 'Malawian Kwacha', 'MWK', 'MK', '1022.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(92, 'Malaysian Ringgit', 'MYR', 'RM', '4.40', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(93, 'Maldivian Rufiyaa', 'MVR', 'Rf', '15.35', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:45:24'),
(94, 'Mauritanian Ouguiya', 'MRO', 'MRU', '1.00', 1, 0, '2023-04-08 11:44:28', '2023-04-08 11:44:28'),
(95, 'Mauritian Rupee', 'MUR', '₨', '45.26', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(96, 'Mexican Peso', 'MXN', '$', '18.12', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(97, 'Moldovan Leu', 'MDL', 'L', '18.13', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(98, 'Mongolian Tugrik', 'MNT', '₮', '3517.26', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(99, 'Moroccan Dirham', 'MAD', 'MAD', '10.18', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(100, 'Mozambican Metical', 'MZM', 'MT', '1.00', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:44:29'),
(101, 'Myanmar Kyat', 'MMK', 'K', '2099.29', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(102, 'Namibian Dollar', 'NAD', '$', '18.27', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(103, 'Nepalese Rupee', 'NPR', '₨', '130.77', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(104, 'Netherlands Antillean Guilder', 'ANG', 'ƒ', '1.80', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(105, 'New Taiwan Dollar', 'TWD', '$', '30.39', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(106, 'New Zealand Dollar', 'NZD', '$', '1.59', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(107, 'Nicaraguan CÃ³rdoba', 'NIO', 'C$', '36.51', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(108, 'Nigerian Naira', 'NGN', '₦', '464.77', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(109, 'North Korean Won', 'KPW', '₩', '899.56', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(110, 'Norwegian Krone', 'NOK', 'kr', '10.49', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(111, 'Omani Rial', 'OMR', '.ع.ر', '0.39', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(112, 'Pakistani Rupee', 'PKR', '₨', '283.86', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(113, 'Panamanian Balboa', 'PAB', 'B/.', '1.00', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(114, 'Papua New Guinean Kina', 'PGK', 'K', '3.52', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(115, 'Paraguayan Guarani', 'PYG', '₲', '7167.06', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(116, 'Peruvian Nuevo Sol', 'PEN', 'S/.', '3.76', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(117, 'Philippine Peso', 'PHP', '₱', '54.61', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(118, 'Polish Zloty', 'PLN', 'zł', '4.29', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(119, 'Qatari Rial', 'QAR', 'ق.ر', '3.64', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(120, 'Romanian Leu', 'RON', 'lei', '4.53', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(121, 'Russian Ruble', 'RUB', '₽', '81.06', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(122, 'Rwandan Franc', 'RWF', 'FRw', '1106.45', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(123, 'Salvadoran ColÃ³n', 'SVC', '₡', '8.75', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(124, 'Samoan Tala', 'WST', 'SAT', '2.72', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(125, 'Saudi Riyal', 'SAR', '﷼', '3.75', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(126, 'Serbian Dinar', 'RSD', 'din', '107.49', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(127, 'Seychellois Rupee', 'SCR', 'SRe', '13.97', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(128, 'Sierra Leonean Leone', 'SLL', 'Le', '17656.27', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(129, 'Singapore Dollar', 'SGD', '$', '1.33', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(130, 'Slovak Koruna', 'SKK', 'Sk', '1.00', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:44:29'),
(131, 'Solomon Islands Dollar', 'SBD', 'Si$', '8.29', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(132, 'Somali Shilling', 'SOS', 'Sh.so.', '568.22', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(133, 'South African Rand', 'ZAR', 'R', '18.22', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(134, 'South Korean Won', 'KRW', '₩', '1315.69', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(135, 'Special Drawing Rights', 'XDR', 'SDR', '0.74', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(136, 'Sri Lankan Rupee', 'LKR', 'Rs', '319.65', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(137, 'St. Helena Pound', 'SHP', '£', '0.81', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(138, 'Sudanese Pound', 'SDG', '.س.ج', '599.70', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(139, 'Surinamese Dollar', 'SRD', '$', '36.45', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(140, 'Swazi Lilangeni', 'SZL', 'E', '18.23', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(141, 'Swedish Krona', 'SEK', 'kr', '10.47', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(142, 'Swiss Franc', 'CHF', 'CHf', '0.91', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(143, 'Syrian Pound', 'SYP', 'LS', '2511.29', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(144, 'São Tomé and Príncipe Dobra', 'STD', 'Db', '22812.71', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(145, 'Tajikistani Somoni', 'TJS', 'SM', '10.90', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(146, 'Tanzanian Shilling', 'TZS', 'TSh', '2340.21', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(147, 'Thai Baht', 'THB', '฿', '34.19', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(148, 'Tongan pa\'anga', 'TOP', '$', '2.34', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(149, 'Trinidad & Tobago Dollar', 'TTD', '$', '6.79', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(150, 'Tunisian Dinar', 'TND', 'ت.د', '3.05', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(151, 'Turkish Lira', 'TRY', '₺', '19.24', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(152, 'Turkmenistani Manat', 'TMT', 'T', '3.51', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(153, 'Ugandan Shilling', 'UGX', 'USh', '3740.99', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(154, 'Ukrainian Hryvnia', 'UAH', '₴', '36.75', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(155, 'United Arab Emirates Dirham', 'AED', 'إ.د', '3.67', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(156, 'Uruguayan Peso', 'UYU', '$', '38.70', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(157, 'US Dollar', 'USD', '$', '1.00', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(158, 'Uzbekistan Som', 'UZS', 'лв', '11394.37', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(159, 'Vanuatu Vatu', 'VUV', 'VT', '118.92', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(160, 'Venezuelan BolÃvar', 'VEF', 'Bs', '1.00', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:44:29'),
(161, 'Vietnamese Dong', 'VND', '₫', '23435.07', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(162, 'Yemeni Rial', 'YER', '﷼', '250.23', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:45:24'),
(163, 'Zambian Kwacha', 'ZMK', 'ZK', '1.00', 1, 0, '2023-04-08 11:44:29', '2023-04-08 11:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_about`
--

CREATE TABLE `custom_landing_about` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `video_link` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `button_name` varchar(191) DEFAULT NULL,
  `button_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_about`
--

INSERT INTO `custom_landing_about` (`id`, `landing_page_id`, `image`, `video_link`, `title`, `short_description`, `long_description`, `button_name`, `button_link`, `created_at`, `updated_at`) VALUES
(36, 1, 'landing/about/sMjaym6cRT4LtQxsmYLS0MqstGN50pf37LYdKf4u.png', NULL, 'Secure Trading Made Easy', 'It shouldn\'t be challenging to stay safe trading cryptocurrency.', 'Easy to follow trading processes that enable you to trade safely with escrow protection so you can convert Bitcoin to cash or trade cryptocurrency with hundreds of other payment methods.', 'Know More', 'http://localhost:8000/admin/landing-page-settings', '2021-12-10 11:06:59', NULL),
(45, 3, 'landing/about/cGlApQ4jIQRgk4Ad7ZtrWpIwohFweV8kMrJY4hxT.png', NULL, 'Why You Will Choose Gatsexg For Your Trading?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', 'Cenenatis. Suspendisse est nulla, sollicitudin eget viverra quis, mo quis tortor. Fusce ac lacus ut nisl hendrerit mximus. Intege scsque molestie molestie. Suspendse eleifend urna at euismod ornare. Mauris dolosem, scelerisque eleifend dolor nec, ornare laoreet velit.', 'Know More', 'http://localhost:8000/admin/landing-page-settings', '2021-12-10 11:06:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_about_temp`
--

CREATE TABLE `custom_landing_about_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `video_link` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `button_name` varchar(191) DEFAULT NULL,
  `button_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_about_temp`
--

INSERT INTO `custom_landing_about_temp` (`id`, `landing_page_id`, `image`, `video_link`, `title`, `short_description`, `long_description`, `button_name`, `button_link`, `created_at`, `updated_at`) VALUES
(1, 1, 'landing/about/sMjaym6cRT4LtQxsmYLS0MqstGN50pf37LYdKf4u.png', NULL, 'Secure Trading Made Easy', 'It shouldn\'t be challenging to stay safe trading cryptocurrency.', 'Easy to follow trading processes that enable you to trade safely with escrow protection so you can convert Bitcoin to cash or trade cryptocurrency with hundreds of other payment methods.', 'Know More', 'http://localhost:8000/admin/landing-page-settings', '2021-12-10 11:06:59', NULL),
(2, 2, 'landing/about/ZUk0jJ3Vz8trw24YCtAhYLM2MelLkU22Wd9gyy2n.jpg', NULL, 'Secure Trading Made Easy', 'It shouldn\'t be challenging to stay safe trading cryptocurrency.', 'Easy to follow trading processes that enable you to trade safely with escrow protection so you can convert Bitcoin to cash or trade cryptocurrency with hundreds of other payment methods.', 'Know More', 'http://localhost:8000/admin/landing-page-settings', '2021-12-10 11:06:59', NULL),
(3, 3, 'landing/about/cGlApQ4jIQRgk4Ad7ZtrWpIwohFweV8kMrJY4hxT.png', NULL, 'Why You Will Choose Gatsexg For Your Trading?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', 'Cenenatis. Suspendisse est nulla, sollicitudin eget viverra quis, mo quis tortor. Fusce ac lacus ut nisl hendrerit mximus. Intege scsque molestie molestie. Suspendse eleifend urna at euismod ornare. Mauris dolosem, scelerisque eleifend dolor nec, ornare laoreet velit.', 'Know More', 'http://localhost:8000/admin/landing-page-settings', '2021-12-10 11:06:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_advantage`
--

CREATE TABLE `custom_landing_advantage` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_advantage`
--

INSERT INTO `custom_landing_advantage` (`id`, `landing_page_id`, `serial`, `image`, `sub_title`, `sub_description`, `created_at`, `updated_at`) VALUES
(2, 1, 2, NULL, 'dfsfs sfs', 'sdfs fsd fsfs sf', NULL, NULL),
(3, 1, 3, NULL, 'dfsfs sfs', 'sdfs fsd fsfs sf', NULL, NULL),
(125, 2, 1, 'landing/advantage/JBMsjhsJ4T41pBm3tyDEi1qRLMGam4jPMbq2tQ1s.png', 'Purchase Easily', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum labore natus quidem. dfsd', NULL, NULL),
(126, 2, 2, 'landing/advantage/fy89ZAUzGOzHUfApAyA8hG9ckU2LRi51zstYh5NE.png', 'Instant', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum labore natus quidem.', NULL, NULL),
(127, 2, 3, 'landing/advantage/uA8H5lXakhrL32dLjuD8uFvYF4rQavgGk5g77tuD.png', 'Safe & Secure', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum labore natus quidem.', NULL, NULL),
(128, 2, 4, 'landing/advantage/f83z7ePHzc016jewvliamvVCaX6rMfyEBWz5qM0c.png', 'Convenient', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum labore natus quidem.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_advantage_temp`
--

CREATE TABLE `custom_landing_advantage_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_advantage_temp`
--

INSERT INTO `custom_landing_advantage_temp` (`id`, `landing_page_id`, `serial`, `image`, `sub_title`, `sub_description`, `created_at`, `updated_at`) VALUES
(2, 2, 1, 'landing/advantage/JBMsjhsJ4T41pBm3tyDEi1qRLMGam4jPMbq2tQ1s.png', 'Purchase Easily', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum labore natus quidem. dfsd', NULL, NULL),
(3, 2, 2, 'landing/advantage/fy89ZAUzGOzHUfApAyA8hG9ckU2LRi51zstYh5NE.png', 'Instant', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum labore natus quidem.', NULL, NULL),
(4, 2, 3, 'landing/advantage/uA8H5lXakhrL32dLjuD8uFvYF4rQavgGk5g77tuD.png', 'Safe & Secure', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum labore natus quidem.', NULL, NULL),
(5, 2, 4, 'landing/advantage/f83z7ePHzc016jewvliamvVCaX6rMfyEBWz5qM0c.png', 'Convenient', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum labore natus quidem.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_banner`
--

CREATE TABLE `custom_landing_banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `video_link` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `login_button_name` varchar(191) DEFAULT NULL,
  `register_button_name` varchar(191) DEFAULT NULL,
  `is_filter` tinyint(4) NOT NULL COMMENT '1 = show and 0 = hide',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_banner`
--

INSERT INTO `custom_landing_banner` (`id`, `landing_page_id`, `image`, `video_link`, `title`, `short_description`, `long_description`, `login_button_name`, `register_button_name`, `is_filter`, `created_at`, `updated_at`) VALUES
(66, 2, 'landing/banner/ZCNmI7MOK6aswS2xlJBE03QRW53uyxvvwCJkYzkD.jpg', NULL, 'Most Popular Peer To Peer Crypto Trading Marketplace.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', NULL, 'Login', 'Registration', 1, '2021-12-10 11:05:03', NULL),
(67, 1, 'landing/banner/61xqFrCuFr1d5J4XPQHAXdMB79LngWegLjScfBKU.jpg', NULL, 'Most Popular Peer To Peer Crypto Trading Marketplace.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident iusto enim autem a veniam laborum.', 'Login', 'Registration', 1, '2021-12-10 11:05:03', NULL),
(76, 3, 'landing/banner/yGrYdueYHIzsabkctI3LdmpAtM4pSaTmLL1dBHdz.png', NULL, 'Your Trusted & Reliable E-currency Exchange', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', NULL, 'Login', 'Registration', 0, '2021-12-10 11:05:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_banner_temp`
--

CREATE TABLE `custom_landing_banner_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `video_link` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `login_button_name` varchar(191) DEFAULT NULL,
  `register_button_name` varchar(191) DEFAULT NULL,
  `is_filter` tinyint(4) NOT NULL COMMENT '1 = show and 0 = hide',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_banner_temp`
--

INSERT INTO `custom_landing_banner_temp` (`id`, `landing_page_id`, `image`, `video_link`, `title`, `short_description`, `long_description`, `login_button_name`, `register_button_name`, `is_filter`, `created_at`, `updated_at`) VALUES
(1, 1, 'landing/banner/61xqFrCuFr1d5J4XPQHAXdMB79LngWegLjScfBKU.jpg', NULL, 'Most Popular Peer To Peer Crypto Trading Marketplace.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident iusto enim autem a veniam laborum.', 'Login', 'Registration', 1, '2021-12-10 11:05:03', NULL),
(2, 2, 'landing/banner/ZCNmI7MOK6aswS2xlJBE03QRW53uyxvvwCJkYzkD.jpg', NULL, 'Most Popular Peer To Peer Crypto Trading Marketplace.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', NULL, 'Login', 'Registration', 1, '2021-12-10 11:05:03', NULL),
(3, 3, 'landing/banner/yGrYdueYHIzsabkctI3LdmpAtM4pSaTmLL1dBHdz.png', NULL, 'Your Trusted & Reliable E-currency Exchange', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', NULL, 'Login', 'Registration', 0, '2021-12-10 11:05:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_coins`
--

CREATE TABLE `custom_landing_coins` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `coin_id` int(10) UNSIGNED NOT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_coins`
--

INSERT INTO `custom_landing_coins` (`id`, `landing_page_id`, `serial`, `coin_id`, `sub_description`, `created_at`, `updated_at`) VALUES
(7, 2, 1, 5, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', '2021-12-10 11:19:29', NULL),
(8, 2, 1, 5, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', '2021-12-10 11:19:29', NULL),
(253, 1, 1, 7, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', '2021-12-10 11:19:29', NULL),
(254, 1, 2, 2, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', '2021-12-10 11:19:29', NULL),
(255, 1, 3, 3, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', '2021-12-10 11:19:29', NULL),
(256, 1, 4, 6, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange', NULL, NULL),
(257, 1, 5, 8, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', NULL, NULL),
(258, 1, 6, 7, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', NULL, NULL),
(307, 3, 1, 1, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL),
(308, 3, 2, 2, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL),
(309, 3, 3, 4, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL),
(310, 3, 4, 6, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL),
(311, 3, 5, 3, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL),
(312, 3, 6, 3, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_coins_temp`
--

CREATE TABLE `custom_landing_coins_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `coin_id` int(10) UNSIGNED NOT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_coins_temp`
--

INSERT INTO `custom_landing_coins_temp` (`id`, `landing_page_id`, `serial`, `coin_id`, `sub_description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 7, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', '2021-12-10 11:19:29', NULL),
(2, 1, 2, 2, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', '2021-12-10 11:19:29', NULL),
(3, 1, 3, 3, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', '2021-12-10 11:19:29', NULL),
(7, 2, 1, 5, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', '2021-12-10 11:19:29', NULL),
(8, 2, 1, 5, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', '2021-12-10 11:19:29', NULL),
(91, 1, 4, 6, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange', NULL, NULL),
(95, 3, 1, 1, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL),
(98, 3, 2, 2, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL),
(100, 3, 3, 4, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL),
(101, 1, 5, 8, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', NULL, NULL),
(102, 1, 6, 7, 'Buy Bitcoin (BTC) with over 300+ payment methods, from anywhere in the world with BitValve P2P crypto exchange.', NULL, NULL),
(103, 3, 4, 6, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL),
(104, 3, 5, 3, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL),
(105, 3, 6, 3, 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duiset luctus eleifend elementum. Nulla facilisi. Maecenas non commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_faqs`
--

CREATE TABLE `custom_landing_faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `question` varchar(191) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_faqs`
--

INSERT INTO `custom_landing_faqs` (`id`, `landing_page_id`, `serial`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(262, 2, 1, 'What is Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum.', NULL, NULL),
(263, 2, 2, 'What is Lorem Ipsum?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum.', NULL, NULL),
(264, 2, 4, 'What Is Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum.', NULL, NULL),
(265, 2, 5, 'Why do we use it?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum.', NULL, NULL),
(266, 1, 2, 'What is the workflow ?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum. Fuga sint a iste architecto nulla veritatis ab voluptatum illum voluptates!', '2021-12-10 11:28:37', NULL),
(267, 1, 3, 'How i place a order ?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum. Fuga sint a iste architecto nulla veritatis ab voluptatum illum voluptates!', '2021-12-10 11:28:37', NULL),
(268, 1, 4, 'How i make a withdrawal ?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum. Fuga sint a iste architecto nulla veritatis ab voluptatum illum voluptates!', '2021-12-10 11:28:37', NULL),
(269, 1, 6, 'What is Lorem Ipsum?', 'dssdv fddg', NULL, NULL),
(270, 1, 7, 'What is Lorem Ipsum?', 'dfg dgdf fd df', NULL, NULL),
(303, 3, 5, 'What is Gatsexg ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', NULL, NULL),
(304, 3, 6, 'How it works ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', NULL, NULL),
(305, 3, 7, 'What is the workflow ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', NULL, NULL),
(306, 3, 8, 'How i place a order ?', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_faqs_temp`
--

CREATE TABLE `custom_landing_faqs_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `question` varchar(191) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_faqs_temp`
--

INSERT INTO `custom_landing_faqs_temp` (`id`, `landing_page_id`, `serial`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 'What is the workflow ?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum. Fuga sint a iste architecto nulla veritatis ab voluptatum illum voluptates!', '2021-12-10 11:28:37', NULL),
(3, 1, 3, 'How i place a order ?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum. Fuga sint a iste architecto nulla veritatis ab voluptatum illum voluptates!', '2021-12-10 11:28:37', NULL),
(4, 1, 4, 'How i make a withdrawal ?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum. Fuga sint a iste architecto nulla veritatis ab voluptatum illum voluptates!', '2021-12-10 11:28:37', NULL),
(7, 2, 1, 'What is Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum.', NULL, NULL),
(9, 2, 2, 'What is Lorem Ipsum?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum.', NULL, NULL),
(12, 2, 4, 'What Is Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum.', NULL, NULL),
(18, 1, 6, 'What is Lorem Ipsum?', 'dssdv fddg', NULL, NULL),
(21, 3, 5, 'What is Gatsexg ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', NULL, NULL),
(22, 1, 7, 'What is Lorem Ipsum?', 'dfg dgdf fd df', NULL, NULL),
(23, 3, 6, 'How it works ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', NULL, NULL),
(26, 2, 5, 'Why do we use it?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt quo minus sint, quaerat quidem eius pariatur vero odio illo assumenda unde placeat, dolorum soluta ratione sunt rerum laborum, laudantium doloribus minima ipsum excepturi deserunt quae quos. Sunt, aperiam nostrum.', NULL, NULL),
(27, 3, 7, 'What is the workflow ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', NULL, NULL),
(28, 3, 8, 'How i place a order ?', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_feature`
--

CREATE TABLE `custom_landing_feature` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `footer_status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_feature`
--

INSERT INTO `custom_landing_feature` (`id`, `landing_page_id`, `serial`, `icon`, `sub_title`, `sub_description`, `footer_status`, `created_at`, `updated_at`) VALUES
(249, 2, 1, 'landing/feature/kfYGQKNrCrvS5NfIv7WMkBHu2anPPNRaFNDTFcKs.png', 'Powerful Matching Engine', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at', 0, NULL, NULL),
(250, 2, 2, 'landing/feature/0MmsLGfdEUT7FI1xJaRRPpQhPuTFzg52ux7Txlp5.png', 'Multi-Layer Security', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at', 0, NULL, NULL),
(251, 2, 3, 'landing/feature/eDacbrXaxeiJp2ERnau1x1CPbxRNDPTFBopLiPUB.png', 'Instant KYC And AML Verifications', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at', 0, NULL, NULL),
(252, 2, 4, 'landing/feature/8452eymLxAbhnD0aGaPZoWFWsBpbiA5YvOiiCAFa.png', 'Escrow System', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', 0, NULL, NULL),
(253, 2, 5, 'landing/feature/BbWzXc8rUbHd2YCiyHMX2bHr1gZdL0xXBXzr2Eji.png', 'Atomic Swap', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', 0, NULL, NULL),
(254, 2, 6, 'landing/feature/WmwEeRQXtx3Ju2h0DCktmErH9xOs0J1rfaCd8kH4.png', 'Dispute Management', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', 0, NULL, NULL),
(255, 2, 7, 'landing/feature/uhrYG2VzlMhFwokSqkKEha4t2eC0TsMcgCgTTcD1.png', 'Preferred Trader Selection', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', 0, NULL, NULL),
(256, 2, 8, 'landing/feature/EkTfZYNw0UQOWNu7Dz951H9hIhpkL5R78SmQ82mR.png', 'Admin Panel', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', 0, NULL, NULL),
(257, 2, 9, 'landing/feature/bkZ01KWBrEdWQO4AWtZQlvtyJOtu4bUqk7gj2EfU.png', 'DMulti-Language Support', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', 0, NULL, NULL),
(258, 1, 1, 'landing/feature/lKqxYTJXYLtDW7bEpj2OPpVlnyuCrRfOSq6B69VN.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', 0, NULL, NULL),
(259, 1, 2, 'landing/feature/JJCcoQVRhvL7yWeJsuT9ZB9X5xuDXSNgQMlNTjBc.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', 0, NULL, NULL),
(260, 1, 3, 'landing/feature/W9SC9cAholiSb12PfAh39bgdXdWAfSBgVohe7DZV.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', 0, NULL, NULL),
(261, 1, 4, 'landing/feature/fXDPgvSXwCQN3NeCQMCzTbMwhB4KgVYSwAXQM8NL.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', 0, NULL, NULL),
(262, 1, 5, 'landing/feature/RMDEP4tdgLbuqqhCF11tBo2v2XZefSlngxS3pS3J.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', 0, NULL, NULL),
(263, 1, 6, 'landing/feature/UKJYxtKuDcbEf9PTdzbY4nJouEUfh1aDSi8oqueM.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', 0, NULL, NULL),
(312, 3, 1, NULL, 'Various Ways To Pay', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', 0, NULL, NULL),
(313, 3, 2, NULL, 'No Middleman', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', 1, NULL, NULL),
(314, 3, 3, NULL, 'Worldwide Service', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', 0, NULL, NULL),
(315, 3, 4, NULL, 'Encrypted Message', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', 0, NULL, NULL),
(316, 3, 5, NULL, 'Fast Service', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', 0, NULL, NULL),
(317, 3, 6, NULL, 'Non-custodial', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_feature_temp`
--

CREATE TABLE `custom_landing_feature_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_feature_temp`
--

INSERT INTO `custom_landing_feature_temp` (`id`, `landing_page_id`, `serial`, `icon`, `sub_title`, `sub_description`, `created_at`, `updated_at`) VALUES
(20, 1, 1, 'landing/feature/lKqxYTJXYLtDW7bEpj2OPpVlnyuCrRfOSq6B69VN.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', NULL, NULL),
(21, 1, 2, 'landing/feature/JJCcoQVRhvL7yWeJsuT9ZB9X5xuDXSNgQMlNTjBc.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', NULL, NULL),
(23, 2, 1, 'landing/feature/kfYGQKNrCrvS5NfIv7WMkBHu2anPPNRaFNDTFcKs.png', 'Powerful Matching Engine', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at', NULL, NULL),
(24, 2, 2, 'landing/feature/0MmsLGfdEUT7FI1xJaRRPpQhPuTFzg52ux7Txlp5.png', 'Multi-Layer Security', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at', NULL, NULL),
(25, 2, 3, 'landing/feature/eDacbrXaxeiJp2ERnau1x1CPbxRNDPTFBopLiPUB.png', 'Instant KYC And AML Verifications', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at', NULL, NULL),
(26, 1, 3, 'landing/feature/W9SC9cAholiSb12PfAh39bgdXdWAfSBgVohe7DZV.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', NULL, NULL),
(36, 1, 4, 'landing/feature/fXDPgvSXwCQN3NeCQMCzTbMwhB4KgVYSwAXQM8NL.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', NULL, NULL),
(37, 1, 5, 'landing/feature/RMDEP4tdgLbuqqhCF11tBo2v2XZefSlngxS3pS3J.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', NULL, NULL),
(38, 1, 6, 'landing/feature/UKJYxtKuDcbEf9PTdzbY4nJouEUfh1aDSi8oqueM.svg', 'Buy Bitcoin Online', 'The best way to buy Bitcoin and other cryptocurrencies are the methods that are flexible enough to fit your needs.', NULL, NULL),
(39, 3, 1, NULL, 'Various Ways To Pay', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', NULL, NULL),
(40, 3, 2, NULL, 'No Middleman', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', NULL, NULL),
(41, 3, 3, NULL, 'Worldwide Service', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', NULL, NULL),
(42, 3, 4, NULL, 'Encrypted Message', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', NULL, NULL),
(43, 3, 5, NULL, 'Fast Service', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', NULL, NULL),
(44, 3, 6, NULL, 'Non-custodial', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit ame dignissim.', NULL, NULL),
(45, 2, 4, 'landing/feature/8452eymLxAbhnD0aGaPZoWFWsBpbiA5YvOiiCAFa.png', 'Escrow System', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', NULL, NULL),
(46, 2, 5, 'landing/feature/BbWzXc8rUbHd2YCiyHMX2bHr1gZdL0xXBXzr2Eji.png', 'Atomic Swap', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', NULL, NULL),
(47, 2, 6, 'landing/feature/WmwEeRQXtx3Ju2h0DCktmErH9xOs0J1rfaCd8kH4.png', 'Dispute Management', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', NULL, NULL),
(48, 2, 7, 'landing/feature/uhrYG2VzlMhFwokSqkKEha4t2eC0TsMcgCgTTcD1.png', 'Preferred Trader Selection', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', NULL, NULL),
(49, 2, 8, 'landing/feature/EkTfZYNw0UQOWNu7Dz951H9hIhpkL5R78SmQ82mR.png', 'Admin Panel', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', NULL, NULL),
(50, 2, 9, 'landing/feature/bkZ01KWBrEdWQO4AWtZQlvtyJOtu4bUqk7gj2EfU.png', 'DMulti-Language Support', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat aperiam doloremque autem ex porro adipisci ab a at!', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_p2p`
--

CREATE TABLE `custom_landing_p2p` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_p2p`
--

INSERT INTO `custom_landing_p2p` (`id`, `landing_page_id`, `type`, `serial`, `image`, `sub_title`, `sub_description`, `created_at`, `updated_at`) VALUES
(84, 2, 1, 1, 'landing/work/4OAO6fcrCs1EIEhav5nGzJeIx64Fh4BGIIjVRcgP.png', 'Place An Order', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL),
(85, 2, 1, 2, 'landing/work/fPdLoFLmayEpbdd27d1mpAuDI6jTAEueJilXI0LP.png', 'Pay The Seller', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL),
(86, 2, 1, 3, 'landing/work/aUaLdFZZqQi2qiq7X1kTo3OJOBQNH79Wcu9yy2rB.png', 'Get Your Crypto', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL),
(87, 2, 2, 4, 'landing/work/5cpkfkWWv8nuouMVU4p2cFJbPS2WqPIwzihaeFlF.png', 'Place An Order', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL),
(88, 2, 2, 5, 'landing/work/luEY0QvC1nezSOmhHy2tBzfmT3PimgHyM8ZKexKn.png', 'Pay The Seller', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL),
(89, 2, 2, 6, 'landing/work/Fk7V1FEFytRsfOGRAMTeIEJLGMQwS9IefS1pTR4d.png', 'Get Your Crypto', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_p2p_temp`
--

CREATE TABLE `custom_landing_p2p_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_p2p_temp`
--

INSERT INTO `custom_landing_p2p_temp` (`id`, `landing_page_id`, `type`, `serial`, `image`, `sub_title`, `sub_description`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 'landing/work/4OAO6fcrCs1EIEhav5nGzJeIx64Fh4BGIIjVRcgP.png', 'Place An Order', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL),
(2, 2, 1, 2, 'landing/work/fPdLoFLmayEpbdd27d1mpAuDI6jTAEueJilXI0LP.png', 'Pay The Seller', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL),
(3, 2, 1, 3, 'landing/work/aUaLdFZZqQi2qiq7X1kTo3OJOBQNH79Wcu9yy2rB.png', 'Get Your Crypto', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL),
(6, 2, 2, 4, 'landing/work/5cpkfkWWv8nuouMVU4p2cFJbPS2WqPIwzihaeFlF.png', 'Place An Order', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL),
(7, 2, 2, 5, 'landing/work/luEY0QvC1nezSOmhHy2tBzfmT3PimgHyM8ZKexKn.png', 'Pay The Seller', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL),
(8, 2, 2, 6, 'landing/work/Fk7V1FEFytRsfOGRAMTeIEJLGMQwS9IefS1pTR4d.png', 'Get Your Crypto', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum natus obcaecati vitae neque cumque dolorem ut quos modi tenetur delectus?', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_page`
--

CREATE TABLE `custom_landing_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_title` varchar(191) NOT NULL,
  `page_key` varchar(191) NOT NULL,
  `resource_path` varchar(191) NOT NULL,
  `main_primary_color` varchar(191) DEFAULT NULL,
  `main_hover_color` varchar(191) DEFAULT NULL,
  `temp_primary_color` varchar(191) DEFAULT NULL,
  `temp_hover_color` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 for inactive;1 for active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_page`
--

INSERT INTO `custom_landing_page` (`id`, `page_title`, `page_key`, `resource_path`, `main_primary_color`, `main_hover_color`, `temp_primary_color`, `temp_hover_color`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Custom Landing 1', 'custom_one', 'landing.custom_one', '#FFA400', '#D88D07', '#FFA400', '#D88D07', 0, '2021-12-21 13:52:44', NULL),
(2, 'Custom Landing 2', 'custom_two', 'landing.custom_two', '#0EC6D5', '#14D2E1', '#0EC6D5', '#14D2E1', 0, '2021-12-21 13:52:45', NULL),
(3, 'Custom Landing 3', 'custom_three', 'landing.custom_three', '#ffffff', '#01daff', '#ffffff', '#01daff', 1, '2021-12-21 13:52:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_process`
--

CREATE TABLE `custom_landing_process` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_process`
--

INSERT INTO `custom_landing_process` (`id`, `landing_page_id`, `serial`, `image`, `sub_title`, `sub_description`, `created_at`, `updated_at`) VALUES
(248, 2, 1, 'landing/process/WPx8rEf4ywBMdWm5VG4YMH6FbJ4ep9LKiTL6YXhl.png', 'Make Exchange', 'Make Exchange Make Exchange Make Exchange', NULL, NULL),
(249, 2, 2, 'landing/process/nWE3pZEQSAAxqvYID0mYBp57Lxjvnhm2KlDLxLjK.png', 'Make Exchange', 'Make Exchange Make Exchange Make Exchange', NULL, NULL),
(250, 2, 3, 'landing/process/WwH1flDpPS9JdN5Eqa3GEaDEQldkd6uKiplgLPyI.png', 'Make Exchange', 'Make Exchange Make Exchange Make Exchange', NULL, NULL),
(251, 1, 1, 'landing/process/AO9l5vbBgQ7URF6mX9s5Dc4m3kUbR7d3ITeNkbwL.png', 'Create Account', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(252, 1, 2, 'landing/process/GnMqHtS3nF6ew2EkvjFtjt3goCNUDpfPyHp9BQv1.png', 'Watch Buy And Selling', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(253, 1, 3, 'landing/process/LEt27873HkEDBO31YiFWPUc2RYj9w6KWdEElYSp4.png', 'Open Trade', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(254, 1, 4, 'landing/process/jLSQIblFCDuzo2YQKQlwxvvCA8ajShB7tKtG6sM3.png', 'Make Exchange', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(255, 1, 5, 'landing/process/yEZW14BDdM5Ght3H9MYjCe9Bl8aIMPrJQcH8fM5g.png', 'Make Exchange', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(256, 1, 6, 'landing/process/XXRL0UgIIsJ3PixRZlazqUm5YqRJuiTt9KbgRKbS.png', 'Make Exchange', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(289, 3, 1, 'landing/process/BXfeRlH5iiMAG1m1mO1tGhCGui34HYcmmNnSz3eQ.png', 'Create account', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(290, 3, 2, 'landing/process/uoMO401rtzCBJIQa3xBD3CSvranYFWTOfx5MD97S.png', 'Watch Buy And Selling', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. ds', NULL, NULL),
(291, 3, 3, 'landing/process/uKK1yDXtKk6Uw8iNLafyW87m5qD0Lksc22tJltMO.png', 'Open Trade', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. ds', NULL, NULL),
(292, 3, 4, 'landing/process/i6z2iwBdM1J4khp8Qg80j8CPunqmz2zqznntLqZk.png', 'Make Exchange', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. ds', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_process_temp`
--

CREATE TABLE `custom_landing_process_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_process_temp`
--

INSERT INTO `custom_landing_process_temp` (`id`, `landing_page_id`, `serial`, `image`, `sub_title`, `sub_description`, `created_at`, `updated_at`) VALUES
(11, 2, 1, 'landing/process/WPx8rEf4ywBMdWm5VG4YMH6FbJ4ep9LKiTL6YXhl.png', 'Make Exchange', 'Make Exchange Make Exchange Make Exchange', NULL, NULL),
(12, 2, 2, 'landing/process/nWE3pZEQSAAxqvYID0mYBp57Lxjvnhm2KlDLxLjK.png', 'Make Exchange', 'Make Exchange Make Exchange Make Exchange', NULL, NULL),
(13, 2, 3, 'landing/process/WwH1flDpPS9JdN5Eqa3GEaDEQldkd6uKiplgLPyI.png', 'Make Exchange', 'Make Exchange Make Exchange Make Exchange', NULL, NULL),
(23, 3, 1, 'landing/process/BXfeRlH5iiMAG1m1mO1tGhCGui34HYcmmNnSz3eQ.png', 'Create account', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(24, 3, 2, 'landing/process/uoMO401rtzCBJIQa3xBD3CSvranYFWTOfx5MD97S.png', 'Watch Buy And Selling', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. ds', NULL, NULL),
(25, 3, 3, 'landing/process/uKK1yDXtKk6Uw8iNLafyW87m5qD0Lksc22tJltMO.png', 'Open Trade', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. ds', NULL, NULL),
(26, 3, 4, 'landing/process/i6z2iwBdM1J4khp8Qg80j8CPunqmz2zqznntLqZk.png', 'Make Exchange', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. ds', NULL, NULL),
(27, 1, 1, 'landing/process/AO9l5vbBgQ7URF6mX9s5Dc4m3kUbR7d3ITeNkbwL.png', 'Create Account', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(28, 1, 2, 'landing/process/GnMqHtS3nF6ew2EkvjFtjt3goCNUDpfPyHp9BQv1.png', 'Watch Buy And Selling', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(29, 1, 3, 'landing/process/LEt27873HkEDBO31YiFWPUc2RYj9w6KWdEElYSp4.png', 'Open Trade', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(30, 1, 4, 'landing/process/jLSQIblFCDuzo2YQKQlwxvvCA8ajShB7tKtG6sM3.png', 'Make Exchange', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(31, 1, 5, 'landing/process/yEZW14BDdM5Ght3H9MYjCe9Bl8aIMPrJQcH8fM5g.png', 'Make Exchange', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL),
(32, 1, 6, 'landing/process/XXRL0UgIIsJ3PixRZlazqUm5YqRJuiTt9KbgRKbS.png', 'Make Exchange', 'Donec tristique commodo massa, prtiu egestas metus luctus eu.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_sections`
--

CREATE TABLE `custom_landing_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `section_name` varchar(191) NOT NULL,
  `section_key` varchar(191) NOT NULL,
  `related_table` varchar(191) DEFAULT NULL,
  `section_title` varchar(191) DEFAULT NULL,
  `section_description` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 for inactive;1 for active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_sections`
--

INSERT INTO `custom_landing_sections` (`id`, `landing_page_id`, `section_name`, `section_key`, `related_table`, `section_title`, `section_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Banner', 'banner', 'custom_landing_banner', 'Most Popular Peer To Peer Crypto Trading Marketplace.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', 1, '2021-12-10 10:28:45', NULL),
(2, 1, 'About', 'about', 'custom_landing_about', 'Secure Trading Made Easy', 'It shouldn\'t be challenging to stay safe trading cryptocurrency.', 1, '2021-12-10 11:08:06', NULL),
(3, 1, 'Feature', 'feature', 'custom_landing_feature', 'Pexeer For Your Trading', 'It shouldn\'t be challenging to stay safe trading cryptocurrency.', 1, '2021-12-10 11:08:06', NULL),
(4, 1, 'Coin Buy or Sell', 'coin_buy_sell', 'custom_landing_coins', 'P2P Crypto Exchange', 'Elevate your financial freedom to a higher plane with Pexeer.', 1, '2021-12-10 11:08:06', NULL),
(5, 1, 'Process', 'process', 'custom_landing_process', 'How To Do Pexeer Trading', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', 1, '2021-12-10 11:21:30', NULL),
(6, 1, 'Testimonial', 'testimonial', 'custom_landing_testimonial', 'Testimonials', 'Elevate your financial freedom to a higher plane with Paxful.', 1, '2021-12-10 11:21:30', NULL),
(7, 1, 'Team', 'team', 'custom_landing_teams', 'The Team', 'Elevate your financial freedom to a higher plane with Pexeer.', 1, '2021-12-10 11:21:30', NULL),
(8, 1, 'Faq', 'faq', 'custom_landing_faqs', 'What Want Our Customer', 'Elevate your financial freedom to a higher plane with Pexeer.', 1, '2021-12-10 11:21:30', NULL),
(9, 1, 'Subscribe', 'subscribe', NULL, 'Subscribe To Stay', 'join newsletter & learn about blockchain & bitcoin', 1, '2021-12-10 11:32:53', NULL),
(10, 2, 'Banner', 'banner', 'custom_landing_banner', 'Most Popular Peer To Peer Crypto Trading Marketplace.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', 1, '2021-12-19 21:18:17', NULL),
(11, 2, 'Trade Anywhere', 'trade_anywhere', 'custom_landing_trade', 'Trade Anywhere', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, NULL, NULL),
(12, 2, 'Market Trend', 'market_trend', NULL, 'Market Trend', '\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, NULL, NULL),
(13, 2, 'Cash Crypto Today', 'advantage', 'custom_landing_advantage', 'Cash-In On Crypto Today', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, NULL, NULL),
(14, 2, 'Feature', 'feature', 'custom_landing_feature', 'P2p Cryptocurrency Exchnage Features', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, '2021-12-19 21:18:17', NULL),
(15, 2, 'How P2p Work', 'how_to_work', 'custom_landing_p2p', 'How P2p Work', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, NULL, NULL),
(16, 2, 'Process', 'process', 'custom_landing_process', 'How To Do Pexeer Trading', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, '2021-12-19 21:18:17', NULL),
(17, 2, 'Teams', 'team', 'custom_landing_teams', 'Out Team', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, '2021-12-19 21:18:17', NULL),
(18, 2, 'Testimonial', 'testimonial', 'custom_landing_testimonial', 'Testimonial', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, '2021-12-19 21:18:17', NULL),
(19, 2, 'Faqs', 'faq', 'custom_landing_faqs', 'Faq', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, '2021-12-19 21:18:17', NULL),
(20, 3, 'Banner', 'banner', 'custom_landing_banner_temp', 'Your Trusted & Reliable E-currency Exchange', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', 1, '2021-12-21 13:52:44', NULL),
(21, 3, 'About', 'about', 'custom_landing_about_temp', 'Why You Will Choose Gatsexg For Your Trading?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', 1, NULL, NULL),
(22, 3, 'Feature', 'feature', 'custom_landing_feature_temp', 'Know About Gatsexg’s Feature', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', 1, NULL, NULL),
(23, 3, 'Coin Buy or Sell', 'coin_buy_sell', 'custom_landing_coins_temp', '', '', 1, NULL, NULL),
(24, 3, 'Process', 'process', 'custom_landing_process', 'How To Do Pexeer Trading', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', 1, NULL, NULL),
(25, 3, 'testimonial', 'testimonial', 'custom_landing_testimonial_temp', 'What Says Our Customer', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', 1, NULL, NULL),
(26, 3, 'faq', 'faq', 'custom_landing_faqs_temp', 'Faq', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, NULL, NULL),
(27, 3, 'subscribe', 'subscribe', NULL, 'Join Our Newsletter', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_sections_temp`
--

CREATE TABLE `custom_landing_sections_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `section_name` varchar(191) NOT NULL,
  `section_key` varchar(191) NOT NULL,
  `related_table` varchar(191) DEFAULT NULL,
  `section_title` varchar(191) DEFAULT NULL,
  `section_description` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 for inactive;1 for active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_sections_temp`
--

INSERT INTO `custom_landing_sections_temp` (`id`, `landing_page_id`, `section_name`, `section_key`, `related_table`, `section_title`, `section_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Banner', 'banner', 'custom_landing_banner_temp', 'Most Popular Peer To Peer Crypto Trading Marketplace.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', 1, '2021-12-10 10:28:45', NULL),
(2, 1, 'About', 'about', 'custom_landing_about_temp', 'Secure Trading Made Easy', 'It shouldn\'t be challenging to stay safe trading cryptocurrency.', 1, '2021-12-10 11:08:06', NULL),
(3, 1, 'Feature', 'feature', 'custom_landing_feature_temp', 'Pexeer For Your Trading', 'It shouldn\'t be challenging to stay safe trading cryptocurrency.', 1, '2021-12-10 11:08:06', NULL),
(4, 1, 'Coin Buy or Sell', 'coin_buy_sell', 'custom_landing_coins_temp', 'P2P Crypto Exchange', 'Elevate your financial freedom to a higher plane with Pexeer.', 1, '2021-12-10 11:08:06', NULL),
(5, 1, 'Process', 'process', 'custom_landing_process_temp', 'How To Do Pexeer Trading', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', 1, '2021-12-10 11:21:30', NULL),
(6, 1, 'Testimonial', 'testimonial', 'custom_landing_testimonial_temp', 'Testimonials', 'Elevate your financial freedom to a higher plane with Paxful.', 1, '2021-12-10 11:21:30', NULL),
(7, 1, 'Team', 'team', 'custom_landing_teams_temp', 'The Team', 'Elevate your financial freedom to a higher plane with Pexeer.', 1, '2021-12-10 11:21:30', NULL),
(8, 1, 'Faq', 'faq', 'custom_landing_faqs_temp', 'What Want Our Customer', 'Elevate your financial freedom to a higher plane with Pexeer.', 1, '2021-12-10 11:21:30', NULL),
(9, 1, 'Subscribe', 'subscribe', NULL, 'Subscribe To Stay', 'join newsletter & learn about blockchain & bitcoin', 1, '2021-12-10 11:32:53', NULL),
(10, 2, 'Banner', 'banner', 'custom_landing_banner_temp', 'Most Popular Peer To Peer Crypto Trading Marketplace.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', 1, '2021-12-19 21:18:17', NULL),
(11, 2, 'Trade Anywhere', 'trade_anywhere', 'custom_landing_trade_temp', 'Trade Anywhere', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, NULL, NULL),
(12, 2, 'Market Trend', 'market_trend', NULL, 'Market Trend', '\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, NULL, NULL),
(13, 2, 'Cash Crypto Today', 'advantage', 'custom_landing_advantage_temp', 'Cash-In On Crypto Today', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, NULL, NULL),
(14, 2, 'Feature', 'feature', 'custom_landing_feature_temp', 'P2p Cryptocurrency Exchnage Features', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, '2021-12-19 21:18:17', NULL),
(15, 2, 'How P2p Work', 'how_to_work', 'custom_landing_p2p_temp', 'How P2p Work', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, NULL, NULL),
(16, 2, 'Process', 'process', 'custom_landing_process_temp', 'How To Do Pexeer Trading', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, '2021-12-19 21:18:17', NULL),
(17, 2, 'Teams', 'team', 'custom_landing_teams_temp', 'Out Team', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, '2021-12-19 21:18:17', NULL),
(18, 2, 'Testimonial', 'testimonial', 'custom_landing_testimonial_temp', 'Testimonial', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, '2021-12-19 21:18:17', NULL),
(19, 2, 'Faqs', 'faq', 'custom_landing_faqs_temp', 'Faq', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, '2021-12-19 21:18:17', NULL),
(20, 3, 'Banner', 'banner', 'custom_landing_banner_temp', 'Your Trusted & Reliable E-currency Exchange', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which slightly believable.', 1, '2021-12-21 13:52:44', NULL),
(21, 3, 'About', 'about', 'custom_landing_about_temp', 'Why You Will Choose Gatsexg For Your Trading?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', 1, NULL, NULL),
(22, 3, 'Feature', 'feature', 'custom_landing_feature_temp', 'Know About Gatsexg’s Feature', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', 1, NULL, NULL),
(23, 3, 'Coin Buy or Sell', 'coin_buy_sell', 'custom_landing_coins_temp', '', '', 1, NULL, NULL),
(24, 3, 'Process', 'process', 'custom_landing_process_temp', 'How To Do Pexeer Trading', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', 1, NULL, NULL),
(25, 3, 'testimonial', 'testimonial', 'custom_landing_testimonial_temp', 'What Says Our Customer', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', 1, NULL, NULL),
(26, 3, 'faq', 'faq', 'custom_landing_faqs_temp', 'Faq', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', 1, NULL, NULL),
(27, 3, 'subscribe', 'subscribe', NULL, 'Join Our Newsletter', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_teams`
--

CREATE TABLE `custom_landing_teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_teams`
--

INSERT INTO `custom_landing_teams` (`id`, `landing_page_id`, `serial`, `image`, `sub_title`, `sub_description`, `facebook`, `linkedin`, `twitter`, `created_at`, `updated_at`) VALUES
(169, 2, 2, 'landing/team/Y2GFXb6FWRKkFFrbsjxSCRWYai3u5YjlAQnuldCV.jpg', 'VICKY SMITH', 'Leader', 'https://www.link.com/', 'https://www.link.com/', 'https://www.link.com/', NULL, NULL),
(170, 2, 3, 'landing/team/Fil0zbHGd6sEIjP6NV5znkc2Rn9ugvXrtyRmkwMP.jpg', 'ROWLING', 'Team', 'https://www.link.com/', 'https://www.link.com/', 'https://www.link.com/', NULL, NULL),
(171, 2, 4, 'landing/team/ruGzbCCGNblpEmKaRxkob0vBdXVEqZk58jAeI4zR.jpg', 'TUCKER', 'Team Leader', NULL, NULL, NULL, NULL, NULL),
(172, 1, 2, 'landing/team/wnVehz0lZfFvkINVWKVAhM0voofEKkuzNi43mtR3.jpg', 'Alex Grinfield', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem voluptatem error ducimus doloremque vel minima sed reprehenderit recusandae unde sit?', 'https://www.link.com/', 'https://www.link.com/', 'https://www.link.com/', '2021-12-10 11:26:46', NULL),
(173, 1, 3, 'landing/team/sg82HzIi60BX4gDTrJNLsjUWCSBcTj9HUq2Ta0to.jpg', 'Alex Grinfield', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem voluptatem error ducimus doloremque vel minima sed reprehenderit recusandae unde sit?', 'https://www.link.com/', 'https://www.link.com/', 'https://www.link.com/', '2021-12-10 11:26:46', NULL),
(174, 1, 4, 'landing/team/jNBZpBDhspTcq4XuKU4CsfSZuLHhbk1cklPpQPEN.jpg', 'Alex Grinfield', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem voluptatem error ducimus doloremque vel minima sed reprehenderit recusandae unde sit?', 'https://www.link.com/', 'https://www.link.com/', 'https://www.link.com/', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_teams_temp`
--

CREATE TABLE `custom_landing_teams_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_teams_temp`
--

INSERT INTO `custom_landing_teams_temp` (`id`, `landing_page_id`, `serial`, `image`, `sub_title`, `sub_description`, `facebook`, `linkedin`, `twitter`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 'landing/team/wnVehz0lZfFvkINVWKVAhM0voofEKkuzNi43mtR3.jpg', 'Alex Grinfield', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem voluptatem error ducimus doloremque vel minima sed reprehenderit recusandae unde sit?', 'https://www.link.com/', 'https://www.link.com/', 'https://www.link.com/', '2021-12-10 11:26:46', NULL),
(3, 1, 3, 'landing/team/sg82HzIi60BX4gDTrJNLsjUWCSBcTj9HUq2Ta0to.jpg', 'Alex Grinfield', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem voluptatem error ducimus doloremque vel minima sed reprehenderit recusandae unde sit?', 'https://www.link.com/', 'https://www.link.com/', 'https://www.link.com/', '2021-12-10 11:26:46', NULL),
(5, 1, 4, 'landing/team/jNBZpBDhspTcq4XuKU4CsfSZuLHhbk1cklPpQPEN.jpg', 'Alex Grinfield', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem voluptatem error ducimus doloremque vel minima sed reprehenderit recusandae unde sit?', 'https://www.link.com/', 'https://www.link.com/', 'https://www.link.com/', NULL, NULL),
(9, 2, 2, 'landing/team/Y2GFXb6FWRKkFFrbsjxSCRWYai3u5YjlAQnuldCV.jpg', 'VICKY SMITH', 'Leader', 'https://www.link.com/', 'https://www.link.com/', 'https://www.link.com/', NULL, NULL),
(10, 2, 3, 'landing/team/Fil0zbHGd6sEIjP6NV5znkc2Rn9ugvXrtyRmkwMP.jpg', 'ROWLING', 'Team', 'https://www.link.com/', 'https://www.link.com/', 'https://www.link.com/', NULL, NULL),
(13, 2, 4, 'landing/team/ruGzbCCGNblpEmKaRxkob0vBdXVEqZk58jAeI4zR.jpg', 'TUCKER', 'Team Leader', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_testimonial`
--

CREATE TABLE `custom_landing_testimonial` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_testimonial`
--

INSERT INTO `custom_landing_testimonial` (`id`, `landing_page_id`, `serial`, `image`, `sub_title`, `sub_description`, `created_at`, `updated_at`) VALUES
(174, 2, 1, 'landing/testimonial/ymll7y8RdJiVGci3Uzc02Zef7WTuguW3iOpErNfE.jpg', 'CEO ( Grodins Group )', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum! Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', NULL, NULL),
(175, 2, 2, 'landing/testimonial/NCAhIRcR2Rzhig6QH9t6WoATw9EKyUagAOyQLLzj.jpg', 'CEO ( Grodins Group )', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', NULL, NULL),
(176, 2, 3, 'landing/testimonial/JyzXXpKFFE0PQbtsLfhsngnCF3oiQpQWpnTLdPTP.jpg', 'CEO ( Grodins Group )', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', NULL, NULL),
(177, 2, 4, 'landing/testimonial/IU4BOa2fhKQaGUy7N9NAFlY9aEZlmpms2qGlaY2d.jpg', 'CEO ( Grodins Group )', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea possimus iusto adipisci voluptas dolor vitae, tempore, neque nulla, laudantium veniam accusantium. Laborum corporis odio harum vero. Tenetur maxime adipisci reprehenderit necessitatibus numquam suscipit asperiores, eos ipsam exercitationem a voluptates ipsa molestiae quae neque minima deleniti minus aliquid aperiam amet saepe.', NULL, NULL),
(178, 1, 1, 'landing/testimonial/zM8JIS8ZIfJtJSV0RQDMDzPBEfXxHI3CD0wmj48F.jpg', 'Samanta William', 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duis luctus eleifend elementum. Nulla facilisi. Maecenas no commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed facilisis rhoncus lorem sit amet commodo. Nulla tincidunt volutpa.', NULL, NULL),
(179, 1, 2, 'landing/testimonial/bGrjRN3WQgCAMWMlAbCWO9I9ZdXPOHqdsVTeSOk9.jpg', 'John Doe', 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duis luctus eleifend elementum. Nulla facilisi. Maecenas no commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed facilisis rhoncus lorem sit amet commodo. Nulla tincidunt volutpa.', NULL, NULL),
(196, 3, 1, 'landing/testimonial/MCPWMD2mDr8brkCux9iju9o6HelqbTjqRiQ3S7xd.png', 'Samanta William', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', NULL, NULL),
(197, 3, 2, 'landing/testimonial/Dpzk7AlIoOApts5FzZ1EqXbk5nOVmP5BmUn7mS8n.png', 'Jhon Doe', 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duis luctus eleifend elementum. Nulla facilisi. Maecenas no commodo risus. Orci varius\nnatoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\nSed\nfacilisis rhoncus lorem sit amet commodo. Nulla tincidunt volutpa.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_testimonial_temp`
--

CREATE TABLE `custom_landing_testimonial_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `sub_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_testimonial_temp`
--

INSERT INTO `custom_landing_testimonial_temp` (`id`, `landing_page_id`, `serial`, `image`, `sub_title`, `sub_description`, `created_at`, `updated_at`) VALUES
(13, 2, 1, 'landing/testimonial/ymll7y8RdJiVGci3Uzc02Zef7WTuguW3iOpErNfE.jpg', 'CEO ( Grodins Group )', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum! Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', NULL, NULL),
(16, 2, 2, 'landing/testimonial/NCAhIRcR2Rzhig6QH9t6WoATw9EKyUagAOyQLLzj.jpg', 'CEO ( Grodins Group )', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', NULL, NULL),
(17, 2, 3, 'landing/testimonial/JyzXXpKFFE0PQbtsLfhsngnCF3oiQpQWpnTLdPTP.jpg', 'CEO ( Grodins Group )', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt vitae odio laboriosam exercitationem quos eum!', NULL, NULL),
(18, 3, 1, 'landing/testimonial/MCPWMD2mDr8brkCux9iju9o6HelqbTjqRiQ3S7xd.png', 'Samanta William', 'Donec tristique commodo massa, prtiu egestas metus luctus eu. Morbi consequat scelerisque mauris sit amet dignissim.', NULL, NULL),
(20, 3, 2, 'landing/testimonial/Dpzk7AlIoOApts5FzZ1EqXbk5nOVmP5BmUn7mS8n.png', 'Jhon Doe', 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duis luctus eleifend elementum. Nulla facilisi. Maecenas no commodo risus. Orci varius\nnatoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\nSed\nfacilisis rhoncus lorem sit amet commodo. Nulla tincidunt volutpa.', NULL, NULL),
(45, 2, 4, 'landing/testimonial/IU4BOa2fhKQaGUy7N9NAFlY9aEZlmpms2qGlaY2d.jpg', 'CEO ( Grodins Group )', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea possimus iusto adipisci voluptas dolor vitae, tempore, neque nulla, laudantium veniam accusantium. Laborum corporis odio harum vero. Tenetur maxime adipisci reprehenderit necessitatibus numquam suscipit asperiores, eos ipsam exercitationem a voluptates ipsa molestiae quae neque minima deleniti minus aliquid aperiam amet saepe.', NULL, NULL),
(47, 1, 1, 'landing/testimonial/zM8JIS8ZIfJtJSV0RQDMDzPBEfXxHI3CD0wmj48F.jpg', 'Samanta William', 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duis luctus eleifend elementum. Nulla facilisi. Maecenas no commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed facilisis rhoncus lorem sit amet commodo. Nulla tincidunt volutpa.', NULL, NULL),
(48, 1, 2, 'landing/testimonial/bGrjRN3WQgCAMWMlAbCWO9I9ZdXPOHqdsVTeSOk9.jpg', 'John Doe', 'Fusce dui erat, efficitur ac nibh eget, tristique lobortis erat. Duis luctus eleifend elementum. Nulla facilisi. Maecenas no commodo risus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed facilisis rhoncus lorem sit amet commodo. Nulla tincidunt volutpa.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_trade`
--

CREATE TABLE `custom_landing_trade` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `image_one` varchar(191) DEFAULT NULL,
  `image_two` varchar(191) DEFAULT NULL,
  `video_link` varchar(191) DEFAULT NULL,
  `app_store_link` varchar(191) DEFAULT NULL,
  `play_store_link` varchar(191) DEFAULT NULL,
  `android_apk_link` varchar(191) DEFAULT NULL,
  `windows_link` varchar(191) DEFAULT NULL,
  `linux_link` varchar(191) DEFAULT NULL,
  `mac_link` varchar(191) DEFAULT NULL,
  `api_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_trade`
--

INSERT INTO `custom_landing_trade` (`id`, `landing_page_id`, `image_one`, `image_two`, `video_link`, `app_store_link`, `play_store_link`, `android_apk_link`, `windows_link`, `linux_link`, `mac_link`, `api_link`, `created_at`, `updated_at`) VALUES
(22, 2, 'landing/trade/oGUI9O10aoqUZycNr52lgLRaHdhZs4F6iDoUhdqU.png', 'landing/trade/Ol4Sk5uKZhmo9wpKObeV02uxIpvCFcskJ1Gz5eQo.png', NULL, 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_landing_trade_temp`
--

CREATE TABLE `custom_landing_trade_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `landing_page_id` int(10) UNSIGNED NOT NULL,
  `image_one` varchar(191) DEFAULT NULL,
  `image_two` varchar(191) DEFAULT NULL,
  `video_link` varchar(191) DEFAULT NULL,
  `app_store_link` varchar(191) DEFAULT NULL,
  `play_store_link` varchar(191) DEFAULT NULL,
  `android_apk_link` varchar(191) DEFAULT NULL,
  `windows_link` varchar(191) DEFAULT NULL,
  `linux_link` varchar(191) DEFAULT NULL,
  `mac_link` varchar(191) DEFAULT NULL,
  `api_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_landing_trade_temp`
--

INSERT INTO `custom_landing_trade_temp` (`id`, `landing_page_id`, `image_one`, `image_two`, `video_link`, `app_store_link`, `play_store_link`, `android_apk_link`, `windows_link`, `linux_link`, `mac_link`, `api_link`, `created_at`, `updated_at`) VALUES
(1, 2, 'landing/trade/oGUI9O10aoqUZycNr52lgLRaHdhZs4F6iDoUhdqU.png', 'landing/trade/Ol4Sk5uKZhmo9wpKObeV02uxIpvCFcskJ1Gz5eQo.png', NULL, 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', 'https://pexeer-demo.itech-theme.com/', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL,
  `key` varchar(256) NOT NULL,
  `data_order` int(11) NOT NULL DEFAULT 0,
  `description` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_page_footer_mapping`
--

CREATE TABLE `custom_page_footer_mapping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `landing_page_id` int(11) NOT NULL,
  `custom_page_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposite_transactions`
--

CREATE TABLE `deposite_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(191) NOT NULL,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `sender_wallet_id` bigint(20) DEFAULT NULL,
  `receiver_wallet_id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `btc` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `doller` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `transaction_id` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT '0',
  `received_amount` decimal(29,18) NOT NULL DEFAULT 0.000000000000000000,
  `is_admin_receive` tinyint(4) NOT NULL DEFAULT 0,
  `updated_by` bigint(20) DEFAULT NULL,
  `from_address` varchar(191) DEFAULT NULL,
  `confirmations` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `escrows`
--

CREATE TABLE `escrows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `wallet_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `amount` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `fees_percentage` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_gas_fees_transaction_histories`
--

CREATE TABLE `estimate_gas_fees_transaction_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `deposit_id` bigint(20) NOT NULL,
  `wallet_id` bigint(20) NOT NULL,
  `amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `coin_type` varchar(191) NOT NULL DEFAULT 'BTC',
  `admin_address` varchar(191) NOT NULL,
  `user_address` varchar(191) NOT NULL,
  `transaction_hash` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `question` text NOT NULL,
  `answer` longtext NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `author` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `unique_code`, `question`, `answer`, `status`, `author`, `created_at`, `updated_at`) VALUES
(1, '6431835b82fd91680966491', 'What is Gatsexg ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', 1, 1, '2023-04-06 07:23:57', '2023-04-08 13:08:11'),
(2, '642e8fad6d8b21680773037', 'How it works ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', 1, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(3, '642e8fad6e0501680773037', 'What is the workflow ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', 1, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(4, '642e8fad6e9711680773037', 'How i place a order ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', 1, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(5, '642e8fad6ef771680773037', 'How i make a withdrawal ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', 1, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(6, '642e8fad6f70b1680773037', 'What about the deposit process ?', 'Aenean condimentum nibh vel enim sodales scelerisque. Mauris quisn pellentesque odio, in vulputate turpis. Integer condimentum eni lorem pellentesque euismod. Nam rutrum accumsan nisl vulputate.', 1, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `ico_phases`
--

CREATE TABLE `ico_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phase_name` varchar(191) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `bonus` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `affiliation_level` int(11) DEFAULT NULL,
  `affiliation_percentage` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `language` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `language`, `created_at`, `updated_at`) VALUES
(1, NULL, 'en', '2023-04-06 07:23:55', '2023-04-06 07:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_29_200844_create_languages_table', 1),
(4, '2018_08_29_205156_create_translations_table', 1),
(5, '2019_06_24_092552_create_wallets_table', 1),
(6, '2019_07_24_092303_create_user_settings_table', 1),
(7, '2019_07_24_092331_create_admin_settings_table', 1),
(8, '2019_07_24_092409_create_activity_logs_table', 1),
(9, '2019_07_24_092511_create_wallet_address_histories_table', 1),
(10, '2019_07_24_103207_create_user_verification_codes_table', 1),
(11, '2019_10_17_075927_create_affiliation_codes_table', 1),
(12, '2019_10_17_080002_create_affiliation_histories_table', 1),
(13, '2019_10_17_080031_create_referral_users_table', 1),
(14, '2020_04_29_080822_create_verification_details_table', 1),
(15, '2020_04_29_081029_create_banks_table', 1),
(16, '2020_04_29_081343_create_deposite_transactions_table', 1),
(17, '2020_04_29_081451_create_withdraw_histories_table', 1),
(18, '2020_06_17_123519_create_faqs_table', 1),
(19, '2020_06_19_095619_create_send_mail_records_table', 1),
(20, '2020_06_19_183647_create_notifications_table', 1),
(21, '2020_06_24_080256_create_websockets_statistics_entries_table', 1),
(22, '2020_09_25_105747_create_coins_table', 1),
(23, '2020_10_07_092041_create_payment_methods_table', 1),
(24, '2020_10_07_093129_create_country_payment_methods_table', 1),
(25, '2020_10_07_093437_create_buys_table', 1),
(26, '2020_10_07_095204_create_sells_table', 1),
(27, '2020_10_07_101049_create_orders_table', 1),
(28, '2020_10_07_111845_create_escrows_table', 1),
(29, '2020_10_07_113335_create_order_cancel_reasons_table', 1),
(30, '2020_10_07_114308_create_order_disputes_table', 1),
(31, '2020_10_09_074508_create_offer_payment_methods_table', 1),
(32, '2020_10_12_105310_create_chats_table', 1),
(33, '2020_11_06_121738_create_testimonials_table', 1),
(34, '2020_11_06_132833_create_subscribers_table', 1),
(35, '2021_04_19_123622_add_columns_in_wallets', 1),
(36, '2021_10_07_143335_add_user_id_at_withdrawal_table', 1),
(37, '2021_11_12_085949_create_ico_phases_table', 1),
(38, '2021_11_12_090155_create_buy_coin_histories_table', 1),
(39, '2021_11_12_092148_add_new_column_to_users', 1),
(40, '2021_12_07_101032_create_custom_landing_page', 1),
(41, '2021_12_07_101053_create_custom_landing_sections', 1),
(42, '2021_12_07_101054_create_custom_landing_sections_temp', 1),
(43, '2021_12_07_103652_create_custom_landing_about', 1),
(44, '2021_12_07_103653_create_custom_landing_about_temp', 1),
(45, '2021_12_07_103703_create_custom_landing_feature', 1),
(46, '2021_12_07_103704_create_custom_landing_feature_temp', 1),
(47, '2021_12_07_103728_create_custom_landing_coins', 1),
(48, '2021_12_07_103729_create_custom_landing_coins_temp', 1),
(49, '2021_12_07_103808_create_custom_landing_process', 1),
(50, '2021_12_07_103809_create_custom_landing_process_temp', 1),
(51, '2021_12_07_103818_create_custom_landing_teams', 1),
(52, '2021_12_07_103819_create_custom_landing_teams_temp', 1),
(53, '2021_12_07_104140_create_custom_landing_banner', 1),
(54, '2021_12_07_104141_create_custom_landing_banner_temp', 1),
(55, '2021_12_07_104156_create_custom_landing_testimonial', 1),
(56, '2021_12_07_104157_create_custom_landing_testimonial_temp', 1),
(57, '2021_12_07_104210_create_custom_landing_faqs', 1),
(58, '2021_12_07_104211_create_custom_landing_faqs_temp', 1),
(59, '2021_12_21_061429_create_custom_landing_trade', 1),
(60, '2021_12_21_061438_create_custom_landing_trade_temp', 1),
(61, '2021_12_21_061457_create_custom_landing_p2p', 1),
(62, '2021_12_21_061506_create_custom_landing_p2p_temp', 1),
(63, '2021_12_21_061519_create_custom_landing_advantage', 1),
(64, '2021_12_21_061553_create_custom_landing_advantage_temp', 1),
(65, '2021_12_28_093659_create_custom_pages_table', 1),
(66, '2021_12_28_114208_add_column_to_custom_landing_feature', 1),
(67, '2021_12_28_120539_custom_page_footer_mapping', 1),
(68, '2022_01_07_114229_change_offer_rate_decimal_value', 1),
(69, '2022_01_14_091807_add_pk_at_wallet_address_table', 1),
(70, '2022_01_27_064540_create_estimate_gas_fees_transaction_histories_table', 1),
(71, '2022_01_27_072747_create_admin_receive_token_transaction_histories_table', 1),
(72, '2022_02_03_055021_add_coin_type_at_affiliation_histories', 1),
(73, '2022_02_04_133418_change_order_rate', 1),
(74, '2022_02_15_103315_create_roles_table', 1),
(75, '2022_03_24_061547_add_from_address_to_deposit', 1),
(76, '2022_05_24_055359_create_country_lists_table', 1),
(77, '2022_08_19_063859_add_username_at_user', 1),
(78, '2022_08_23_092918_add_role_to_users_table', 1),
(79, '2022_08_23_093439_create_role_permissions_table', 1),
(80, '2022_08_23_132110_add_group_to_users_table', 1),
(81, '2022_08_26_082031_create_payment_windows_table', 1),
(82, '2022_08_26_091348_add_payment_time_at_order', 1),
(83, '2022_08_26_091707_create_coin_payment_network_fees_table', 1),
(84, '2022_09_01_121551_create_currency_lists_table', 1),
(85, '2022_09_14_121544_add_rate_to_coins_table', 1),
(86, '2022_10_14_105903_add_admin_receive_at_deposite_transactions', 1),
(87, '2022_11_02_092050_create_admin_send_coin_histories_table', 1),
(88, '2022_11_30_071650_add_kyc_to_buy_sell', 1),
(89, '2022_12_20_124113_create_user_payment_methods_table', 1),
(90, '2022_12_21_062728_add_payment_type_to_payment_methods_table', 1),
(91, '2022_12_21_083008_add_dispute_id_at_chat', 1),
(92, '2023_01_02_123433_add_public_key_at_wallet_address_histories', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(191) NOT NULL,
  `notification_body` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer_payment_methods`
--

CREATE TABLE `offer_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` bigint(20) NOT NULL,
  `payment_method_id` bigint(20) NOT NULL,
  `offer_type` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `buyer_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `buyer_wallet_id` bigint(20) DEFAULT NULL,
  `seller_wallet_id` bigint(20) DEFAULT NULL,
  `sell_id` bigint(20) DEFAULT NULL,
  `buy_id` bigint(20) DEFAULT NULL,
  `coin_type` varchar(191) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `rate` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `price` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `fees_percentage` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_success` tinyint(4) NOT NULL DEFAULT 0,
  `who_cancelled` bigint(20) DEFAULT NULL,
  `who_opened` bigint(20) DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `payment_expired_time` datetime DEFAULT NULL,
  `payment_time` int(11) NOT NULL DEFAULT 0,
  `is_reported` tinyint(4) NOT NULL DEFAULT 0,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `payment_id` bigint(20) DEFAULT NULL,
  `payment_sleep` varchar(191) DEFAULT NULL,
  `order_id` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `seller_feedback` int(11) DEFAULT NULL,
  `buyer_feedback` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_cancel_reasons`
--

CREATE TABLE `order_cancel_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` bigint(20) NOT NULL,
  `partner_id` bigint(20) NOT NULL,
  `reason_heading` text NOT NULL,
  `details` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_disputes`
--

CREATE TABLE `order_disputes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `reported_user` bigint(20) NOT NULL,
  `reason_heading` text NOT NULL,
  `details` longtext DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `updated_by` bigint(20) DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `assigned_admin` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `payment_type` tinyint(4) NOT NULL DEFAULT 1,
  `name` varchar(191) NOT NULL,
  `details` longtext DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_windows`
--

CREATE TABLE `payment_windows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_windows`
--

INSERT INTO `payment_windows` (`id`, `payment_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(2, 15, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(3, 20, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(4, 25, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(5, 30, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(6, 35, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57'),
(7, 40, 1, '2023-04-06 07:23:57', '2023-04-06 07:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `referral_users`
--

CREATE TABLE `referral_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `group`) VALUES
(1, 1, 'adminUsers', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'user'),
(2, 1, 'admin_UserAddEdit', 'create', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'user'),
(3, 1, 'admin_UserEdit', 'update', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'user'),
(4, 1, 'admin_user_delete', 'delete', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'user'),
(5, 1, 'user', 'other', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'user'),
(6, 1, 'adminUserIdVerificationPending', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'pending_id'),
(7, 1, 'adminUserVerificationActive', 'active', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'pending_id'),
(8, 1, 'varificationReject', 'reject', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'pending_id'),
(9, 1, 'adminWalletList', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'pocket'),
(10, 1, 'adminTransactionHistory', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'transaction_all'),
(11, 1, 'other', 'other', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'transaction_all'),
(12, 1, 'other', 'other', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'transaction_withdrawal'),
(13, 1, 'adminPendingWithdrawal', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'transaction_withdrawal'),
(14, 1, 'adminAcceptPendingWithdrawal', 'accept', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'transaction_withdrawal'),
(15, 1, 'adminRejectPendingWithdrawal', 'reject', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'transaction_withdrawal'),
(16, 1, 'adminPendingDepositHistory', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'pending_deposit'),
(17, 1, 'adminPendingDepositAccept', 'accept', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'pending_deposit'),
(18, 1, 'adminPendingDepositReject', 'reject', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'pending_deposit'),
(19, 1, 'offerList', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'buy_offer'),
(20, 1, 'offerDetails', 'details', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'buy_offer'),
(21, 1, 'orderList', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'order'),
(22, 1, 'orderDetails', 'details', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'order'),
(23, 1, 'orderDisputeList', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'dispute'),
(24, 1, 'orderDisputeDetails', 'details', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'dispute'),
(25, 1, 'sendNotification', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'notify'),
(26, 1, 'sendNotificationProcess', 'send', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'notify'),
(27, 1, 'sendEmail', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'email'),
(28, 1, 'sendEmailProcess', 'send', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'email'),
(29, 1, 'email', 'other', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'email'),
(30, 1, 'adminTestimonialList', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'testimonial'),
(31, 1, 'adminTestimonialSave', 'create', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'testimonial'),
(32, 1, 'adminTestimonialSave', 'update', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'testimonial'),
(33, 1, 'adminTestimonialDelete', 'delete', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'testimonial'),
(34, 1, 'testimonial', 'other', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'testimonial'),
(35, 1, 'subscribers', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'subscribers'),
(36, 1, 'adminFaqList', 'read', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'faq'),
(37, 1, 'adminFaqSave', 'Create', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'faq'),
(38, 1, 'adminFaqSave', 'update', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'faq'),
(39, 1, 'adminFaqDelete', 'delete', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'faq'),
(40, 1, 'faq', 'other', 1, '2023-04-08 13:13:15', '2023-04-08 13:13:15', 'faq');

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `coin_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `coin_type` varchar(191) NOT NULL,
  `wallet_id` bigint(20) NOT NULL,
  `country` varchar(191) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `ip` varchar(191) NOT NULL,
  `coin_rate` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `rate_percentage` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `market_price` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `rate_type` tinyint(4) NOT NULL DEFAULT 1,
  `price_type` tinyint(4) NOT NULL DEFAULT 1,
  `minimum_trade_size` bigint(20) NOT NULL DEFAULT 0,
  `maximum_trade_size` bigint(20) NOT NULL DEFAULT 0,
  `headline` varchar(191) NOT NULL,
  `terms` longtext DEFAULT NULL,
  `instruction` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `amount` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `sold_amount` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `payment_time_limit` int(11) DEFAULT NULL,
  `registered_days` int(11) NOT NULL DEFAULT 0,
  `kyc_completed` tinyint(4) NOT NULL DEFAULT 0,
  `holding_amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `send_mail_records`
--

CREATE TABLE `send_mail_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `email_type` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(180) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) DEFAULT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(180) NOT NULL,
  `reset_code` varchar(180) DEFAULT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 2,
  `default_module_id` int(11) NOT NULL DEFAULT 2,
  `status` int(11) NOT NULL DEFAULT 1,
  `country_code` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `phone_verified` tinyint(4) NOT NULL DEFAULT 0,
  `country` varchar(191) DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 1,
  `birth_date` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `g2f_enabled` enum('0','1') NOT NULL,
  `google2fa_secret` varchar(191) DEFAULT NULL,
  `is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `password` varchar(191) NOT NULL,
  `language` varchar(191) NOT NULL DEFAULT 'en',
  `device_id` varchar(191) DEFAULT NULL,
  `device_type` tinyint(4) NOT NULL DEFAULT 1,
  `push_notification_status` tinyint(4) NOT NULL DEFAULT 1,
  `email_notification_status` tinyint(4) NOT NULL DEFAULT 1,
  `agree_terms` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(191) DEFAULT NULL COMMENT 'various verification codes',
  `last_seen` timestamp NULL DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `reset_code`, `unique_code`, `role`, `default_module_id`, `status`, `country_code`, `phone`, `phone_verified`, `country`, `gender`, `birth_date`, `photo`, `g2f_enabled`, `google2fa_secret`, `is_verified`, `password`, `language`, `device_id`, `device_type`, `push_notification_status`, `email_notification_status`, `agree_terms`, `remember_token`, `created_at`, `updated_at`, `verification_code`, `last_seen`, `role_id`) VALUES
(1, 'Talosmart', 'Technologies', 'talosmart', 'admin@email.com', NULL, '642e8fad1462b1680773037', 1, 1, 1, NULL, '23408060494409', 0, 'NG', 0, NULL, NULL, '0', NULL, 1, '$2y$10$gW0LOn1RIi0eX32mT2rduOXF0LMViYeUg.L7pNGjrJfdJ1OWQV1EC', 'en', NULL, 1, 1, 1, 0, NULL, '2023-04-06 07:23:57', '2023-04-08 13:13:17', NULL, '2023-04-08 13:13:17', NULL),
(2, 'Mr', 'User', 'user', 'user@email.com', NULL, '642e8fad2bc161680773037', 2, 2, 1, NULL, NULL, 0, 'US', 1, NULL, NULL, '0', NULL, 1, '$2y$10$gW0LOn1RIi0eX32mT2rduOXF0LMViYeUg.L7pNGjrJfdJ1OWQV1EC', 'en', NULL, 1, 1, 1, 0, NULL, '2023-04-06 07:23:57', '2023-04-08 13:05:41', NULL, '2023-04-08 13:05:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_payment_methods`
--

CREATE TABLE `user_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_name` varchar(191) DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_type` tinyint(4) DEFAULT NULL,
  `payment_method_name` varchar(191) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `bank_account_number` varchar(191) DEFAULT NULL,
  `bank_opening_branch_name` varchar(191) DEFAULT NULL,
  `transaction_reference` varchar(191) DEFAULT NULL,
  `mobile_account_number` varchar(191) DEFAULT NULL,
  `card_number` varchar(191) DEFAULT NULL,
  `card_type` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_verification_codes`
--

CREATE TABLE `user_verification_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `expired_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_details`
--

CREATE TABLE `verification_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `field_name` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `photo` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `coin_id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `coin_type` varchar(191) NOT NULL DEFAULT 'BTC',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_primary` tinyint(4) NOT NULL DEFAULT 0,
  `balance` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `referral_balance` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(191) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `unique_code`, `coin_id`, `user_id`, `name`, `coin_type`, `status`, `is_primary`, `balance`, `referral_balance`, `created_at`, `updated_at`, `key`, `type`) VALUES
(1, '643167304eb561680959280', 9, 2, 'LTCT Wallet', 'LTCT', 1, 0, '0.00000000', '0.00000000', '2023-04-08 11:08:00', '2023-04-08 11:08:00', NULL, 1),
(2, '643167304f8741680959280', 8, 2, 'DEFAULT Wallet', 'DEFAULT', 1, 0, '0.00000000', '0.00000000', '2023-04-08 11:08:00', '2023-04-08 11:08:00', NULL, 1),
(3, '64316730516bd1680959280', 7, 2, 'DASH Wallet', 'DASH', 1, 0, '0.00000000', '0.00000000', '2023-04-08 11:08:00', '2023-04-08 11:08:00', NULL, 1),
(4, '6431673052a0c1680959280', 6, 2, 'BCH Wallet', 'BCH', 1, 0, '0.00000000', '0.00000000', '2023-04-08 11:08:00', '2023-04-08 11:08:00', NULL, 1),
(5, '64316730533e21680959280', 5, 2, 'DOGE Wallet', 'DOGE', 1, 0, '0.00000000', '0.00000000', '2023-04-08 11:08:00', '2023-04-08 11:08:00', NULL, 1),
(6, '6431673054cbb1680959280', 4, 2, 'LTC Wallet', 'LTC', 1, 0, '0.00000000', '0.00000000', '2023-04-08 11:08:00', '2023-04-08 11:08:00', NULL, 1),
(7, '64316730565201680959280', 3, 2, 'ETH Wallet', 'ETH', 1, 0, '0.00000000', '0.00000000', '2023-04-08 11:08:00', '2023-04-08 11:08:00', NULL, 1),
(8, '6431673056f8a1680959280', 2, 2, 'USDT Wallet', 'USDT', 1, 0, '0.00000000', '0.00000000', '2023-04-08 11:08:00', '2023-04-08 11:08:00', NULL, 1),
(9, '643167305762c1680959280', 1, 2, 'BTC Wallet', 'BTC', 1, 0, '0.00000000', '0.00000000', '2023-04-08 11:08:00', '2023-04-08 11:08:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_address_histories`
--

CREATE TABLE `wallet_address_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) NOT NULL,
  `coin_type` varchar(191) NOT NULL DEFAULT 'BTC',
  `address` varchar(191) NOT NULL,
  `pk` text DEFAULT NULL,
  `public_key` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(191) NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_histories`
--

CREATE TABLE `withdraw_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_code` varchar(180) DEFAULT NULL,
  `coin_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `coin_type` varchar(191) NOT NULL DEFAULT 'BTC',
  `btc` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `doller` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `address_type` tinyint(4) NOT NULL,
  `address` varchar(191) NOT NULL,
  `transaction_hash` varchar(191) NOT NULL,
  `receiver_wallet_id` varchar(191) DEFAULT NULL,
  `confirmations` varchar(191) DEFAULT NULL,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `used_gas` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `admin_receive_token_transaction_histories`
--
ALTER TABLE `admin_receive_token_transaction_histories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_receive_token_transaction_histories_unique_code_unique` (`unique_code`);

--
-- Indexes for table `admin_send_coin_histories`
--
ALTER TABLE `admin_send_coin_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_settings_slug_unique` (`slug`);

--
-- Indexes for table `affiliation_codes`
--
ALTER TABLE `affiliation_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `affiliation_codes_code_unique` (`code`),
  ADD KEY `affiliation_codes_user_id_foreign` (`user_id`);

--
-- Indexes for table `affiliation_histories`
--
ALTER TABLE `affiliation_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliation_histories_user_id_foreign` (`user_id`),
  ADD KEY `affiliation_histories_child_id_foreign` (`child_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banks_unique_code_unique` (`unique_code`);

--
-- Indexes for table `buys`
--
ALTER TABLE `buys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buys_unique_code_unique` (`unique_code`);

--
-- Indexes for table `buy_coin_histories`
--
ALTER TABLE `buy_coin_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chats_sender_id_foreign` (`sender_id`),
  ADD KEY `chats_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coins_type_unique` (`type`),
  ADD UNIQUE KEY `coins_unique_code_unique` (`unique_code`);

--
-- Indexes for table `coin_payment_network_fees`
--
ALTER TABLE `coin_payment_network_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_lists`
--
ALTER TABLE `country_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_payment_methods`
--
ALTER TABLE `country_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_lists`
--
ALTER TABLE `currency_lists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_lists_code_unique` (`code`);

--
-- Indexes for table `custom_landing_about`
--
ALTER TABLE `custom_landing_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_about_temp`
--
ALTER TABLE `custom_landing_about_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_advantage`
--
ALTER TABLE `custom_landing_advantage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_advantage_temp`
--
ALTER TABLE `custom_landing_advantage_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_banner`
--
ALTER TABLE `custom_landing_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_banner_temp`
--
ALTER TABLE `custom_landing_banner_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_coins`
--
ALTER TABLE `custom_landing_coins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_coins_temp`
--
ALTER TABLE `custom_landing_coins_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_faqs`
--
ALTER TABLE `custom_landing_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_faqs_temp`
--
ALTER TABLE `custom_landing_faqs_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_feature`
--
ALTER TABLE `custom_landing_feature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_feature_temp`
--
ALTER TABLE `custom_landing_feature_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_p2p`
--
ALTER TABLE `custom_landing_p2p`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_p2p_temp`
--
ALTER TABLE `custom_landing_p2p_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_page`
--
ALTER TABLE `custom_landing_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_process`
--
ALTER TABLE `custom_landing_process`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_process_temp`
--
ALTER TABLE `custom_landing_process_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_sections`
--
ALTER TABLE `custom_landing_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_sections_temp`
--
ALTER TABLE `custom_landing_sections_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_teams`
--
ALTER TABLE `custom_landing_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_teams_temp`
--
ALTER TABLE `custom_landing_teams_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_testimonial`
--
ALTER TABLE `custom_landing_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_testimonial_temp`
--
ALTER TABLE `custom_landing_testimonial_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_trade`
--
ALTER TABLE `custom_landing_trade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_landing_trade_temp`
--
ALTER TABLE `custom_landing_trade_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_page_footer_mapping`
--
ALTER TABLE `custom_page_footer_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposite_transactions`
--
ALTER TABLE `deposite_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `escrows`
--
ALTER TABLE `escrows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_gas_fees_transaction_histories`
--
ALTER TABLE `estimate_gas_fees_transaction_histories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estimate_gas_fees_transaction_histories_unique_code_unique` (`unique_code`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faqs_unique_code_unique` (`unique_code`);

--
-- Indexes for table `ico_phases`
--
ALTER TABLE `ico_phases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_payment_methods`
--
ALTER TABLE `offer_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_unique_code_unique` (`unique_code`);

--
-- Indexes for table `order_cancel_reasons`
--
ALTER TABLE `order_cancel_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_disputes`
--
ALTER TABLE `order_disputes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_disputes_unique_code_unique` (`unique_code`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_unique_code_unique` (`unique_code`);

--
-- Indexes for table `payment_windows`
--
ALTER TABLE `payment_windows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_windows_payment_time_unique` (`payment_time`);

--
-- Indexes for table `referral_users`
--
ALTER TABLE `referral_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `referral_users_user_id_unique` (`user_id`),
  ADD KEY `referral_users_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sells_unique_code_unique` (`unique_code`);

--
-- Indexes for table `send_mail_records`
--
ALTER TABLE `send_mail_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testimonials_unique_code_unique` (`unique_code`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_reset_code_unique` (`reset_code`),
  ADD UNIQUE KEY `users_unique_code_unique` (`unique_code`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_payment_methods`
--
ALTER TABLE `user_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_payment_methods_bank_account_number_unique` (`bank_account_number`),
  ADD UNIQUE KEY `user_payment_methods_mobile_account_number_unique` (`mobile_account_number`),
  ADD UNIQUE KEY `user_payment_methods_card_number_unique` (`card_number`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_settings_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_verification_codes`
--
ALTER TABLE `user_verification_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_details`
--
ALTER TABLE `verification_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verification_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallets_unique_code_unique` (`unique_code`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_address_histories`
--
ALTER TABLE `wallet_address_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_histories`
--
ALTER TABLE `withdraw_histories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `withdraw_histories_unique_code_unique` (`unique_code`),
  ADD KEY `withdraw_histories_wallet_id_foreign` (`wallet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_receive_token_transaction_histories`
--
ALTER TABLE `admin_receive_token_transaction_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_send_coin_histories`
--
ALTER TABLE `admin_send_coin_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `affiliation_codes`
--
ALTER TABLE `affiliation_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliation_histories`
--
ALTER TABLE `affiliation_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buys`
--
ALTER TABLE `buys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_coin_histories`
--
ALTER TABLE `buy_coin_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coins`
--
ALTER TABLE `coins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coin_payment_network_fees`
--
ALTER TABLE `coin_payment_network_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country_lists`
--
ALTER TABLE `country_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `country_payment_methods`
--
ALTER TABLE `country_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency_lists`
--
ALTER TABLE `currency_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `custom_landing_about`
--
ALTER TABLE `custom_landing_about`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `custom_landing_about_temp`
--
ALTER TABLE `custom_landing_about_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `custom_landing_advantage`
--
ALTER TABLE `custom_landing_advantage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `custom_landing_advantage_temp`
--
ALTER TABLE `custom_landing_advantage_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `custom_landing_banner`
--
ALTER TABLE `custom_landing_banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `custom_landing_banner_temp`
--
ALTER TABLE `custom_landing_banner_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `custom_landing_coins`
--
ALTER TABLE `custom_landing_coins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT for table `custom_landing_coins_temp`
--
ALTER TABLE `custom_landing_coins_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `custom_landing_faqs`
--
ALTER TABLE `custom_landing_faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `custom_landing_faqs_temp`
--
ALTER TABLE `custom_landing_faqs_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `custom_landing_feature`
--
ALTER TABLE `custom_landing_feature`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- AUTO_INCREMENT for table `custom_landing_feature_temp`
--
ALTER TABLE `custom_landing_feature_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `custom_landing_p2p`
--
ALTER TABLE `custom_landing_p2p`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `custom_landing_p2p_temp`
--
ALTER TABLE `custom_landing_p2p_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `custom_landing_page`
--
ALTER TABLE `custom_landing_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `custom_landing_process`
--
ALTER TABLE `custom_landing_process`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT for table `custom_landing_process_temp`
--
ALTER TABLE `custom_landing_process_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `custom_landing_sections`
--
ALTER TABLE `custom_landing_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `custom_landing_sections_temp`
--
ALTER TABLE `custom_landing_sections_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `custom_landing_teams`
--
ALTER TABLE `custom_landing_teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `custom_landing_teams_temp`
--
ALTER TABLE `custom_landing_teams_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `custom_landing_testimonial`
--
ALTER TABLE `custom_landing_testimonial`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `custom_landing_testimonial_temp`
--
ALTER TABLE `custom_landing_testimonial_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `custom_landing_trade`
--
ALTER TABLE `custom_landing_trade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `custom_landing_trade_temp`
--
ALTER TABLE `custom_landing_trade_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_page_footer_mapping`
--
ALTER TABLE `custom_page_footer_mapping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposite_transactions`
--
ALTER TABLE `deposite_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `escrows`
--
ALTER TABLE `escrows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_gas_fees_transaction_histories`
--
ALTER TABLE `estimate_gas_fees_transaction_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ico_phases`
--
ALTER TABLE `ico_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer_payment_methods`
--
ALTER TABLE `offer_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_cancel_reasons`
--
ALTER TABLE `order_cancel_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_disputes`
--
ALTER TABLE `order_disputes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_windows`
--
ALTER TABLE `payment_windows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `referral_users`
--
ALTER TABLE `referral_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sells`
--
ALTER TABLE `sells`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `send_mail_records`
--
ALTER TABLE `send_mail_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_payment_methods`
--
ALTER TABLE `user_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_verification_codes`
--
ALTER TABLE `user_verification_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_details`
--
ALTER TABLE `verification_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wallet_address_histories`
--
ALTER TABLE `wallet_address_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_histories`
--
ALTER TABLE `withdraw_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `affiliation_codes`
--
ALTER TABLE `affiliation_codes`
  ADD CONSTRAINT `affiliation_codes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `affiliation_histories`
--
ALTER TABLE `affiliation_histories`
  ADD CONSTRAINT `affiliation_histories_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `affiliation_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chats_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `referral_users`
--
ALTER TABLE `referral_users`
  ADD CONSTRAINT `referral_users_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `referral_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verification_details`
--
ALTER TABLE `verification_details`
  ADD CONSTRAINT `verification_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraw_histories`
--
ALTER TABLE `withdraw_histories`
  ADD CONSTRAINT `withdraw_histories_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
