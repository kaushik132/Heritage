-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2026 at 11:12 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `heritage`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 5, 'Dashboard', 'icon-chart-bar', '/', NULL, NULL, '2026-05-16 01:15:30'),
(2, 0, 6, 'Admin', 'icon-server', '', NULL, NULL, '2026-05-16 01:15:30'),
(3, 2, 7, 'Users', 'icon-users', 'auth/users', NULL, NULL, '2026-05-16 01:15:30'),
(4, 2, 8, 'Roles', 'icon-user', 'auth/roles', NULL, NULL, '2026-05-16 01:15:30'),
(5, 2, 9, 'Permission', 'icon-ban', 'auth/permissions', NULL, NULL, '2026-05-16 01:15:30'),
(6, 2, 10, 'Menu', 'icon-bars', 'auth/menu', NULL, NULL, '2026-05-16 01:15:30'),
(7, 2, 11, 'Operation log', 'icon-history', 'auth/logs', NULL, NULL, '2026-05-16 01:15:30'),
(8, 0, 12, 'Helpers', 'icon-cogs', '', NULL, '2026-05-15 01:10:22', '2026-05-16 01:15:30'),
(9, 8, 13, 'Scaffold', 'icon-keyboard', 'helpers/scaffold', NULL, '2026-05-15 01:10:22', '2026-05-16 01:15:30'),
(10, 8, 14, 'Database terminal', 'icon-database', 'helpers/terminal/database', NULL, '2026-05-15 01:10:22', '2026-05-16 01:15:30'),
(11, 8, 15, 'Laravel artisan', 'icon-terminal', 'helpers/terminal/artisan', NULL, '2026-05-15 01:10:22', '2026-05-16 01:15:30'),
(12, 8, 16, 'Routes', 'icon-list-alt', 'helpers/routes', NULL, '2026-05-15 01:10:22', '2026-05-16 01:15:30'),
(13, 16, 2, 'Products', 'icon-file', 'products', '*', '2026-05-15 02:01:55', '2026-05-16 01:15:30'),
(14, 16, 3, 'Product-categories', 'icon-file', 'product-categories', '*', '2026-05-15 04:26:13', '2026-05-16 01:15:30'),
(15, 16, 4, 'Product-images', 'icon-file', 'product-images', NULL, '2026-05-15 05:19:22', '2026-05-16 01:15:30'),
(16, 0, 1, 'Product Section', 'icon-adjust', NULL, '*', '2026-05-16 01:14:28', '2026-05-16 01:15:30'),
(17, 0, 16, 'Wishlists', 'icon-file', 'wishlists', NULL, '2026-05-16 01:23:10', '2026-05-16 01:23:10'),
(18, 16, 16, 'Product-reviews', 'icon-file', 'product-reviews', '*', '2026-05-20 04:41:57', '2026-05-20 04:42:28'),
(19, 0, 16, 'Carts', 'icon-file', 'carts', NULL, '2026-05-20 04:44:09', '2026-05-20 04:44:09'),
(20, 25, 16, 'Orders', 'icon-file', 'orders', '*', '2026-05-20 04:45:05', '2026-05-20 04:49:46'),
(21, 25, 16, 'Order-items', 'icon-file', 'order-items', '*', '2026-05-20 04:45:59', '2026-05-20 04:50:00'),
(22, 0, 16, 'Users', 'icon-file', 'users', NULL, '2026-05-20 04:46:58', '2026-05-20 04:46:58'),
(23, 0, 16, 'User-addresses', 'icon-file', 'user-addresses', NULL, '2026-05-20 04:47:54', '2026-05-20 04:47:54'),
(24, 0, 16, 'Inquiries', 'icon-file', 'inquiries', NULL, '2026-05-20 04:48:41', '2026-05-20 04:48:41'),
(25, 0, 0, 'Order Section', 'icon-archive', NULL, '*', '2026-05-20 04:49:31', '2026-05-20 04:49:31'),
(26, 0, 16, 'Home-banners', 'icon-file', 'home-banners', NULL, '2026-05-21 01:25:46', '2026-05-21 01:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2026-05-15 01:06:59', '2026-05-15 01:06:59'),
(2, 1, 'admin', 'GET', '127.0.0.1', '[]', '2026-05-15 01:10:28', '2026-05-15 01:10:28'),
(3, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-15 01:10:31', '2026-05-15 01:10:31'),
(4, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"products\",\"model_name\":\"App\\\\Models\\\\Product\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\"}', '2026-05-15 02:01:55', '2026-05-15 02:01:55'),
(5, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-15 02:01:56', '2026-05-15 02:01:56'),
(6, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:17', '2026-05-15 02:02:17'),
(7, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:19', '2026-05-15 02:02:19'),
(8, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:22', '2026-05-15 02:02:22'),
(9, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:23', '2026-05-15 02:02:23'),
(10, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:23', '2026-05-15 02:02:23'),
(11, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:24', '2026-05-15 02:02:24'),
(12, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:25', '2026-05-15 02:02:25'),
(13, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:25', '2026-05-15 02:02:25'),
(14, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:26', '2026-05-15 02:02:26'),
(15, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:26', '2026-05-15 02:02:26'),
(16, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:27', '2026-05-15 02:02:27'),
(17, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:27', '2026-05-15 02:02:27'),
(18, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:28', '2026-05-15 02:02:28'),
(19, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:29', '2026-05-15 02:02:29'),
(20, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:29', '2026-05-15 02:02:29'),
(21, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:30', '2026-05-15 02:02:30'),
(22, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:30', '2026-05-15 02:02:30'),
(23, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:31', '2026-05-15 02:02:31'),
(24, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:32', '2026-05-15 02:02:32'),
(25, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:32', '2026-05-15 02:02:32'),
(26, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:33', '2026-05-15 02:02:33'),
(27, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:33', '2026-05-15 02:02:33'),
(28, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:34', '2026-05-15 02:02:34'),
(29, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:34', '2026-05-15 02:02:34'),
(30, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:35', '2026-05-15 02:02:35'),
(31, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:36', '2026-05-15 02:02:36'),
(32, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:37', '2026-05-15 02:02:37'),
(33, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:37', '2026-05-15 02:02:37'),
(34, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:38', '2026-05-15 02:02:38'),
(35, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:39', '2026-05-15 02:02:39'),
(36, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:40', '2026-05-15 02:02:40'),
(37, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:40', '2026-05-15 02:02:40'),
(38, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:41', '2026-05-15 02:02:41'),
(39, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:42', '2026-05-15 02:02:42'),
(40, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:42', '2026-05-15 02:02:42'),
(41, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:43', '2026-05-15 02:02:43'),
(42, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:44', '2026-05-15 02:02:44'),
(43, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:44', '2026-05-15 02:02:44'),
(44, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:45', '2026-05-15 02:02:45'),
(45, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:46', '2026-05-15 02:02:46'),
(46, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:46', '2026-05-15 02:02:46'),
(47, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:47', '2026-05-15 02:02:47'),
(48, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:02:48', '2026-05-15 02:02:48'),
(49, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:11', '2026-05-15 02:03:11'),
(50, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:11', '2026-05-15 02:03:11'),
(51, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:12', '2026-05-15 02:03:12'),
(52, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:13', '2026-05-15 02:03:13'),
(53, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:13', '2026-05-15 02:03:13'),
(54, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:14', '2026-05-15 02:03:14'),
(55, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:14', '2026-05-15 02:03:14'),
(56, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:15', '2026-05-15 02:03:15'),
(57, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:15', '2026-05-15 02:03:15'),
(58, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:16', '2026-05-15 02:03:16'),
(59, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:17', '2026-05-15 02:03:17'),
(60, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:17', '2026-05-15 02:03:17'),
(61, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:18', '2026-05-15 02:03:18'),
(62, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:18', '2026-05-15 02:03:18'),
(63, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:19', '2026-05-15 02:03:19'),
(64, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:19', '2026-05-15 02:03:19'),
(65, 1, 'admin', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:20', '2026-05-15 02:03:20'),
(66, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:20', '2026-05-15 02:03:20'),
(67, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:21', '2026-05-15 02:03:21'),
(68, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:22', '2026-05-15 02:03:22'),
(69, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:22', '2026-05-15 02:03:22'),
(70, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:23', '2026-05-15 02:03:23'),
(71, 1, 'admin', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:45', '2026-05-15 02:03:45'),
(72, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:47', '2026-05-15 02:03:47'),
(73, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:47', '2026-05-15 02:03:47'),
(74, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:48', '2026-05-15 02:03:48'),
(75, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:49', '2026-05-15 02:03:49'),
(76, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:49', '2026-05-15 02:03:49'),
(77, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:50', '2026-05-15 02:03:50'),
(78, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:50', '2026-05-15 02:03:50'),
(79, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:51', '2026-05-15 02:03:51'),
(80, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:52', '2026-05-15 02:03:52'),
(81, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:52', '2026-05-15 02:03:52'),
(82, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:53', '2026-05-15 02:03:53'),
(83, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:54', '2026-05-15 02:03:54'),
(84, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:55', '2026-05-15 02:03:55'),
(85, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:55', '2026-05-15 02:03:55'),
(86, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:56', '2026-05-15 02:03:56'),
(87, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:56', '2026-05-15 02:03:56'),
(88, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:57', '2026-05-15 02:03:57'),
(89, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:58', '2026-05-15 02:03:58'),
(90, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:58', '2026-05-15 02:03:58'),
(91, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:59', '2026-05-15 02:03:59'),
(92, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:03:59', '2026-05-15 02:03:59'),
(93, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:04:16', '2026-05-15 02:04:16'),
(94, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:04:21', '2026-05-15 02:04:21'),
(95, 1, 'admin', 'GET', '127.0.0.1', '[]', '2026-05-15 02:04:23', '2026-05-15 02:04:23'),
(96, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 02:04:24', '2026-05-15 02:04:24'),
(97, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:25:05', '2026-05-15 03:25:05'),
(98, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 03:25:11', '2026-05-15 03:25:11'),
(99, 1, 'admin', 'GET', '127.0.0.1', '[]', '2026-05-15 03:25:13', '2026-05-15 03:25:13'),
(100, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:25:17', '2026-05-15 03:25:17'),
(101, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 03:25:19', '2026-05-15 03:25:19'),
(102, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 03:27:28', '2026-05-15 03:27:28'),
(103, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:29:04', '2026-05-15 03:29:04'),
(104, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 03:29:07', '2026-05-15 03:29:07'),
(105, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:30:02', '2026-05-15 03:30:02'),
(106, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:30:04', '2026-05-15 03:30:04'),
(107, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:31:54', '2026-05-15 03:31:54'),
(108, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 03:31:57', '2026-05-15 03:31:57'),
(109, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,orange\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 03:32:15', '2026-05-15 03:32:15'),
(110, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:32:16', '2026-05-15 03:32:16'),
(111, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 03:32:21', '2026-05-15 03:32:21'),
(112, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,orange\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 03:33:24', '2026-05-15 03:33:24'),
(113, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:33:24', '2026-05-15 03:33:24'),
(114, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 03:33:26', '2026-05-15 03:33:26'),
(115, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,Orange\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 03:33:55', '2026-05-15 03:33:55'),
(116, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:33:56', '2026-05-15 03:33:56'),
(117, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:34:00', '2026-05-15 03:34:00'),
(118, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:34:25', '2026-05-15 03:34:25'),
(119, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:36:40', '2026-05-15 03:36:40'),
(120, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 03:36:42', '2026-05-15 03:36:42'),
(121, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 03:37:06', '2026-05-15 03:37:06'),
(122, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 03:37:16', '2026-05-15 03:37:16'),
(123, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 03:37:41', '2026-05-15 03:37:41'),
(124, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 03:37:41', '2026-05-15 03:37:41'),
(125, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:00:54', '2026-05-15 04:00:54'),
(126, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,Orange\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:01:04', '2026-05-15 04:01:04'),
(127, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:01:04', '2026-05-15 04:01:04'),
(128, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:03:25', '2026-05-15 04:03:25'),
(129, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,Orange\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:03:40', '2026-05-15 04:03:40'),
(130, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:03:40', '2026-05-15 04:03:40'),
(131, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:04:59', '2026-05-15 04:04:59'),
(132, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,Orange\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:05:06', '2026-05-15 04:05:06'),
(133, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:05:07', '2026-05-15 04:05:07'),
(134, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:07:44', '2026-05-15 04:07:44'),
(135, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"\\\"Green,Maroon,Blue,Gold,Orange\\\"\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:07:47', '2026-05-15 04:07:47'),
(136, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:07:47', '2026-05-15 04:07:47'),
(137, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:09:02', '2026-05-15 04:09:02'),
(138, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"\\\"Green,Maroon,Blue,Gold,Orange\\\"\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:09:04', '2026-05-15 04:09:04'),
(139, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:09:05', '2026-05-15 04:09:05'),
(140, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:09:52', '2026-05-15 04:09:52'),
(141, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,Red\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:10:06', '2026-05-15 04:10:06'),
(142, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:10:07', '2026-05-15 04:10:07'),
(143, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:10:49', '2026-05-15 04:10:49'),
(144, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:10:51', '2026-05-15 04:10:51'),
(145, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:10:53', '2026-05-15 04:10:53'),
(146, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:10:56', '2026-05-15 04:10:56'),
(147, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:10:56', '2026-05-15 04:10:56'),
(148, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:11:58', '2026-05-15 04:11:58'),
(149, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,zxcz\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:12:03', '2026-05-15 04:12:03'),
(150, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:12:03', '2026-05-15 04:12:03'),
(151, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:13:24', '2026-05-15 04:13:24'),
(152, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:13:25', '2026-05-15 04:13:25'),
(153, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:13:28', '2026-05-15 04:13:28'),
(154, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"\\\"Green,Maroon,Blue,Gold\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:13:31', '2026-05-15 04:13:31'),
(155, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:13:31', '2026-05-15 04:13:31'),
(156, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:13:47', '2026-05-15 04:13:47'),
(157, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"Silk\",\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,Orange,Red\"],\"search_terms\":null,\"rating\":\"4.8\",\"review_count\":\"4\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:14:00', '2026-05-15 04:14:00'),
(158, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:14:00', '2026-05-15 04:14:00'),
(159, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-15 04:25:42', '2026-05-15 04:25:42'),
(160, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"product_categories\",\"model_name\":\"App\\\\Models\\\\ProductCategory\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductCategoryController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\"}', '2026-05-15 04:26:12', '2026-05-15 04:26:12'),
(161, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-15 04:26:15', '2026-05-15 04:26:15'),
(162, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-15 04:26:30', '2026-05-15 04:26:30'),
(163, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 04:26:32', '2026-05-15 04:26:32'),
(164, 1, 'admin/product-categories/create', 'GET', '127.0.0.1', '[]', '2026-05-15 04:26:34', '2026-05-15 04:26:34'),
(165, 1, 'admin/product-categories/create', 'GET', '127.0.0.1', '[]', '2026-05-15 04:27:21', '2026-05-15 04:27:21'),
(166, 1, 'admin/product-categories/create', 'GET', '127.0.0.1', '[]', '2026-05-15 04:27:56', '2026-05-15 04:27:56'),
(167, 1, 'admin/product-categories/create', 'GET', '127.0.0.1', '[]', '2026-05-15 04:29:33', '2026-05-15 04:29:33'),
(168, 1, 'admin/product-categories', 'POST', '127.0.0.1', '{\"name\":\"Sarees\",\"slug\":null,\"type\":\"retailer\",\"search_terms\":null,\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\"}', '2026-05-15 04:31:03', '2026-05-15 04:31:03'),
(169, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 04:31:04', '2026-05-15 04:31:04'),
(170, 1, 'admin/product-categories/create', 'GET', '127.0.0.1', '[]', '2026-05-15 04:31:17', '2026-05-15 04:31:17'),
(171, 1, 'admin/product-categories', 'POST', '127.0.0.1', '{\"name\":\"Kurtas\",\"slug\":null,\"type\":\"retailer\",\"search_terms\":null,\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\"}', '2026-05-15 04:31:39', '2026-05-15 04:31:39'),
(172, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 04:31:39', '2026-05-15 04:31:39'),
(173, 1, 'admin/product-categories/create', 'GET', '127.0.0.1', '[]', '2026-05-15 04:32:35', '2026-05-15 04:32:35'),
(174, 1, 'admin/product-categories', 'POST', '127.0.0.1', '{\"name\":\"Bridal\",\"slug\":null,\"type\":\"retailer\",\"search_terms\":null,\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\"}', '2026-05-15 04:33:00', '2026-05-15 04:33:00'),
(175, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 04:33:00', '2026-05-15 04:33:00'),
(176, 1, 'admin/product-categories/create', 'GET', '127.0.0.1', '[]', '2026-05-15 04:33:07', '2026-05-15 04:33:07'),
(177, 1, 'admin/product-categories', 'POST', '127.0.0.1', '{\"name\":\"Men Kurtas\",\"slug\":null,\"type\":\"wholeseller\",\"search_terms\":null,\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\"}', '2026-05-15 04:33:50', '2026-05-15 04:33:50'),
(178, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 04:33:51', '2026-05-15 04:33:51'),
(179, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 04:34:21', '2026-05-15 04:34:21'),
(180, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 04:34:28', '2026-05-15 04:34:28'),
(181, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:34:31', '2026-05-15 04:34:31'),
(182, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:35:32', '2026-05-15 04:35:32'),
(183, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:35:34', '2026-05-15 04:35:34'),
(184, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:35:45', '2026-05-15 04:35:45'),
(185, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 04:35:45', '2026-05-15 04:35:45'),
(186, 1, 'admin/product-categories/create', 'GET', '127.0.0.1', '[]', '2026-05-15 04:35:46', '2026-05-15 04:35:46'),
(187, 1, 'admin/product-categories', 'POST', '127.0.0.1', '{\"name\":\"Man Casual Shirt\",\"slug\":null,\"type\":\"retailer\",\"search_terms\":null,\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\"}', '2026-05-15 04:37:27', '2026-05-15 04:37:27'),
(188, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 04:37:27', '2026-05-15 04:37:27'),
(189, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:37:29', '2026-05-15 04:37:29'),
(190, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 04:37:31', '2026-05-15 04:37:31'),
(191, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,Orange,Red\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 04:37:35', '2026-05-15 04:37:35'),
(192, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:37:35', '2026-05-15 04:37:35'),
(193, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:55:34', '2026-05-15 04:55:34'),
(194, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 04:55:49', '2026-05-15 04:55:49'),
(195, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-15 05:18:59', '2026-05-15 05:18:59'),
(196, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"product_images\",\"model_name\":\"App\\\\Models\\\\ProductImage\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductImageController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\"}', '2026-05-15 05:19:22', '2026-05-15 05:19:22'),
(197, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-15 05:19:22', '2026-05-15 05:19:22'),
(198, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-15 05:19:33', '2026-05-15 05:19:33'),
(199, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 05:19:35', '2026-05-15 05:19:35'),
(200, 1, 'admin/product-images/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 05:19:40', '2026-05-15 05:19:40'),
(201, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 05:19:47', '2026-05-15 05:19:47'),
(202, 1, 'admin/product-images/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 05:43:35', '2026-05-15 05:43:35'),
(203, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 05:43:38', '2026-05-15 05:43:38'),
(204, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 05:53:04', '2026-05-15 05:53:04'),
(205, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 05:59:44', '2026-05-15 05:59:44'),
(206, 1, 'admin/product-images/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 05:59:46', '2026-05-15 05:59:46'),
(207, 1, 'admin/product-images/1', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"1\",\"is_primary_cb\":\"on\",\"color\":\"Green\",\"sort_order\":\"0\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 05:59:53', '2026-05-15 05:59:53'),
(208, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 05:59:53', '2026-05-15 05:59:53'),
(209, 1, 'admin/product-images/2/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 05:59:56', '2026-05-15 05:59:56'),
(210, 1, 'admin/product-images/2', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Green\",\"sort_order\":\"1\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:00:03', '2026-05-15 06:00:03'),
(211, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:00:03', '2026-05-15 06:00:03'),
(212, 1, 'admin/product-images/3/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:00:05', '2026-05-15 06:00:05'),
(213, 1, 'admin/product-images/3', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Maroon\",\"sort_order\":\"2\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:00:12', '2026-05-15 06:00:12'),
(214, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:00:13', '2026-05-15 06:00:13'),
(215, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:00:59', '2026-05-15 06:00:59'),
(216, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:01:04', '2026-05-15 06:01:04'),
(217, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 06:02:07', '2026-05-15 06:02:07'),
(218, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:02:07', '2026-05-15 06:02:07'),
(219, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:02:10', '2026-05-15 06:02:10'),
(220, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:02:12', '2026-05-15 06:02:12'),
(221, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:14:32', '2026-05-15 06:14:32'),
(222, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:14:38', '2026-05-15 06:14:38'),
(223, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:15:31', '2026-05-15 06:15:31'),
(224, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:17:28', '2026-05-15 06:17:28'),
(225, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:18:29', '2026-05-15 06:18:29'),
(226, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:18:31', '2026-05-15 06:18:31'),
(227, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2026-05-15 06:18:33', '2026-05-15 06:18:33'),
(228, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:18:41', '2026-05-15 06:18:41'),
(229, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:18:43', '2026-05-15 06:18:43'),
(230, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:19:11', '2026-05-15 06:19:11'),
(231, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:19:19', '2026-05-15 06:19:19'),
(232, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:21:35', '2026-05-15 06:21:35'),
(233, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:21:37', '2026-05-15 06:21:37'),
(234, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:21:44', '2026-05-15 06:21:44'),
(235, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:26:24', '2026-05-15 06:26:24'),
(236, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:26:26', '2026-05-15 06:26:26'),
(237, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:27:53', '2026-05-15 06:27:53'),
(238, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:28:35', '2026-05-15 06:28:35'),
(239, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:28:58', '2026-05-15 06:28:58'),
(240, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:29:00', '2026-05-15 06:29:00'),
(241, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:29:01', '2026-05-15 06:29:01'),
(242, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:29:03', '2026-05-15 06:29:03'),
(243, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:29:34', '2026-05-15 06:29:34'),
(244, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:29:45', '2026-05-15 06:29:45'),
(245, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:29:57', '2026-05-15 06:29:57'),
(246, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:30:30', '2026-05-15 06:30:30'),
(247, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:30:36', '2026-05-15 06:30:36'),
(248, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:30:38', '2026-05-15 06:30:38'),
(249, 1, 'admin/product-images/4/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:30:44', '2026-05-15 06:30:44'),
(250, 1, 'admin/product-images/4', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Maroon\",\"sort_order\":\"3\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:30:50', '2026-05-15 06:30:50'),
(251, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:30:50', '2026-05-15 06:30:50'),
(252, 1, 'admin/product-images/6/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:30:53', '2026-05-15 06:30:53'),
(253, 1, 'admin/product-images/6', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Blue\",\"sort_order\":\"5\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:30:59', '2026-05-15 06:30:59'),
(254, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:30:59', '2026-05-15 06:30:59'),
(255, 1, 'admin/product-images/7/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:31:01', '2026-05-15 06:31:01'),
(256, 1, 'admin/product-images/7', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Gold\",\"sort_order\":\"6\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:31:08', '2026-05-15 06:31:08'),
(257, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:31:09', '2026-05-15 06:31:09'),
(258, 1, 'admin/product-images/8/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:31:11', '2026-05-15 06:31:11'),
(259, 1, 'admin/product-images/8', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Gold\",\"sort_order\":\"7\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:31:17', '2026-05-15 06:31:17'),
(260, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:31:18', '2026-05-15 06:31:18'),
(261, 1, 'admin/product-images/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:31:35', '2026-05-15 06:31:35'),
(262, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:31:40', '2026-05-15 06:31:40'),
(263, 1, 'admin/product-images/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:31:42', '2026-05-15 06:31:42'),
(264, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:31:47', '2026-05-15 06:31:47'),
(265, 1, 'admin/product-images/3/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:31:49', '2026-05-15 06:31:49'),
(266, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:31:50', '2026-05-15 06:31:50'),
(267, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:32:16', '2026-05-15 06:32:16'),
(268, 1, 'admin/product-images/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:32:18', '2026-05-15 06:32:18'),
(269, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:33:33', '2026-05-15 06:33:33'),
(270, 1, 'admin/product-images/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:33:35', '2026-05-15 06:33:35'),
(271, 1, 'admin/product-images/1', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"1\",\"is_primary_cb\":\"on\",\"color\":\"Green\",\"sort_order\":\"0\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:33:42', '2026-05-15 06:33:42'),
(272, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:33:43', '2026-05-15 06:33:43'),
(273, 1, 'admin/product-images/2/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:33:45', '2026-05-15 06:33:45'),
(274, 1, 'admin/product-images/2', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Green\",\"sort_order\":\"1\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:33:52', '2026-05-15 06:33:52'),
(275, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:33:52', '2026-05-15 06:33:52'),
(276, 1, 'admin/product-images/3/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:34:32', '2026-05-15 06:34:32'),
(277, 1, 'admin/product-images/3', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Maroon\",\"sort_order\":\"2\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:34:37', '2026-05-15 06:34:37'),
(278, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:34:37', '2026-05-15 06:34:37'),
(279, 1, 'admin/product-images/4/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:34:40', '2026-05-15 06:34:40'),
(280, 1, 'admin/product-images/4', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Maroon\",\"sort_order\":\"3\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:34:45', '2026-05-15 06:34:45'),
(281, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:34:46', '2026-05-15 06:34:46'),
(282, 1, 'admin/product-images/5/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:35:07', '2026-05-15 06:35:07'),
(283, 1, 'admin/product-images/5', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Blue\",\"sort_order\":\"4\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:35:12', '2026-05-15 06:35:12'),
(284, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:35:13', '2026-05-15 06:35:13'),
(285, 1, 'admin/product-images/6/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:35:15', '2026-05-15 06:35:15'),
(286, 1, 'admin/product-images/6', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Blue\",\"sort_order\":\"5\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:35:19', '2026-05-15 06:35:19'),
(287, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:35:20', '2026-05-15 06:35:20'),
(288, 1, 'admin/product-images/7/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:35:43', '2026-05-15 06:35:43'),
(289, 1, 'admin/product-images/7', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Gold\",\"sort_order\":\"6\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:35:49', '2026-05-15 06:35:49'),
(290, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:35:50', '2026-05-15 06:35:50'),
(291, 1, 'admin/product-images/8/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:35:52', '2026-05-15 06:35:52');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(292, 1, 'admin/product-images/8', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"Gold\",\"sort_order\":\"7\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:35:57', '2026-05-15 06:35:57'),
(293, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:35:57', '2026-05-15 06:35:57'),
(294, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 06:36:00', '2026-05-15 06:36:00'),
(295, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:36:03', '2026-05-15 06:36:03'),
(296, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:36:05', '2026-05-15 06:36:05'),
(297, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"Green\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"Green\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:36:33', '2026-05-15 06:36:33'),
(298, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:36:33', '2026-05-15 06:36:33'),
(299, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold,Orange,Red\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"Green\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"Green\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:36:38', '2026-05-15 06:36:38'),
(300, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:36:38', '2026-05-15 06:36:38'),
(301, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,Orange,Red\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"Green\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"Green\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:36:47', '2026-05-15 06:36:47'),
(302, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:36:48', '2026-05-15 06:36:48'),
(303, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:36:53', '2026-05-15 06:36:53'),
(304, 1, 'admin/product-images/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:36:58', '2026-05-15 06:36:58'),
(305, 1, 'admin/product-images/1', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"1\",\"is_primary_cb\":\"on\",\"color\":\"White\",\"sort_order\":\"0\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:37:07', '2026-05-15 06:37:07'),
(306, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:37:07', '2026-05-15 06:37:07'),
(307, 1, 'admin/product-images/2/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:37:09', '2026-05-15 06:37:09'),
(308, 1, 'admin/product-images/2', 'PUT', '127.0.0.1', '{\"product_id\":\"1\",\"is_primary\":\"0\",\"color\":\"White\",\"sort_order\":\"1\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:37:15', '2026-05-15 06:37:15'),
(309, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 06:37:15', '2026-05-15 06:37:15'),
(310, 1, 'admin/product-images/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:37:19', '2026-05-15 06:37:19'),
(311, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:37:25', '2026-05-15 06:37:25'),
(312, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:37:27', '2026-05-15 06:37:27'),
(313, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:37:31', '2026-05-15 06:37:31'),
(314, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:37:32', '2026-05-15 06:37:32'),
(315, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:37:49', '2026-05-15 06:37:49'),
(316, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Green,Maroon,Blue,Gold\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:37:54', '2026-05-15 06:37:54'),
(317, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:37:55', '2026-05-15 06:37:55'),
(318, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:37:57', '2026-05-15 06:37:57'),
(319, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:38:04', '2026-05-15 06:38:04'),
(320, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:38:04', '2026-05-15 06:38:04'),
(321, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:38:05', '2026-05-15 06:38:05'),
(322, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:38:14', '2026-05-15 06:38:14'),
(323, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:38:15', '2026-05-15 06:38:15'),
(324, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:38:16', '2026-05-15 06:38:16'),
(325, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:38:34', '2026-05-15 06:38:34'),
(326, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:38:41', '2026-05-15 06:38:41'),
(327, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:38:42', '2026-05-15 06:38:42'),
(328, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:40:37', '2026-05-15 06:40:37'),
(329, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 06:40:40', '2026-05-15 06:40:40'),
(330, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 06:40:41', '2026-05-15 06:40:41'),
(331, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 06:40:48', '2026-05-15 06:40:48'),
(332, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 07:18:45', '2026-05-15 07:18:45'),
(333, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:18:46', '2026-05-15 07:18:46'),
(334, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 07:19:38', '2026-05-15 07:19:38'),
(335, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:19:39', '2026-05-15 07:19:39'),
(336, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:21:05', '2026-05-15 07:21:05'),
(337, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/products\"}', '2026-05-15 07:21:08', '2026-05-15 07:21:08'),
(338, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:21:08', '2026-05-15 07:21:08'),
(339, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:21:32', '2026-05-15 07:21:32'),
(340, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 07:21:34', '2026-05-15 07:21:34'),
(341, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:21:34', '2026-05-15 07:21:34'),
(342, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:21:42', '2026-05-15 07:21:42'),
(343, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"2\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"4\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"2\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"6\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"8\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 07:22:24', '2026-05-15 07:22:24'),
(344, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:22:24', '2026-05-15 07:22:24'),
(345, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:22:29', '2026-05-15 07:22:29'),
(346, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:22:32', '2026-05-15 07:22:32'),
(347, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 07:22:46', '2026-05-15 07:22:46'),
(348, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 07:22:52', '2026-05-15 07:22:52'),
(349, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2026-05-15 07:22:54', '2026-05-15 07:22:54'),
(350, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Veda Estrada\",\"slug\":null,\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Voluptate amet nisi\",\"description\":\"Omnis eligendi qui v\",\"price\":\"750\",\"moq\":\"32\",\"stock\":\"99\",\"in_stock\":\"on\",\"in_stock_cb\":\"on\",\"weight\":\"75\",\"width\":\"Rerum elit tenetur\",\"weave\":\"Quia quisquam labore\",\"origin\":\"Dolor qui sunt fugit\",\"composition\":\"Ipsam et dolorum dol\",\"care_instructions\":\"Deleniti perspiciati\",\"india_shipping\":\"Sed cupidatat sit a\",\"international_shipping\":\"Quae illo sit proide\",\"colors\":[\"White\"],\"rating\":\"3\",\"review_count\":\"22\",\"is_featured\":\"on\",\"is_featured_cb\":\"on\",\"is_active\":\"on\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"new_1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\"}', '2026-05-15 07:23:40', '2026-05-15 07:23:40'),
(351, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2026-05-15 07:23:40', '2026-05-15 07:23:40'),
(352, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2026-05-15 07:24:09', '2026-05-15 07:24:09'),
(353, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 07:24:15', '2026-05-15 07:24:15'),
(354, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:24:17', '2026-05-15 07:24:17'),
(355, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 07:24:20', '2026-05-15 07:24:20'),
(356, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 07:24:20', '2026-05-15 07:24:20'),
(357, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 07:24:56', '2026-05-15 07:24:56'),
(358, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 07:26:16', '2026-05-15 07:26:16'),
(359, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 07:26:17', '2026-05-15 07:26:17'),
(360, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 07:26:18', '2026-05-15 07:26:18'),
(361, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:26:21', '2026-05-15 07:26:21'),
(362, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 07:26:24', '2026-05-15 07:26:24'),
(363, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:26:25', '2026-05-15 07:26:25'),
(364, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:26:42', '2026-05-15 07:26:42'),
(365, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 07:26:46', '2026-05-15 07:26:46'),
(366, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:26:47', '2026-05-15 07:26:47'),
(367, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:27:34', '2026-05-15 07:27:34'),
(368, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 07:27:36', '2026-05-15 07:27:36'),
(369, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 07:27:37', '2026-05-15 07:27:37'),
(370, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:27:38', '2026-05-15 07:27:38'),
(371, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 07:27:53', '2026-05-15 07:27:53'),
(372, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"_token\":\"nMNpuNMJBM4SXAMm9Zp3CFtCM8o67IOkgwsdwHIX\",\"_method\":\"PUT\"}', '2026-05-15 07:27:56', '2026-05-15 07:27:56'),
(373, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 07:27:57', '2026-05-15 07:27:57'),
(374, 1, 'admin', 'GET', '127.0.0.1', '[]', '2026-05-15 23:29:40', '2026-05-15 23:29:40'),
(375, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 23:29:46', '2026-05-15 23:29:46'),
(376, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2026-05-15 23:29:49', '2026-05-15 23:29:49'),
(377, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 23:29:55', '2026-05-15 23:29:55'),
(378, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 23:31:14', '2026-05-15 23:31:14'),
(379, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:31:16', '2026-05-15 23:31:16'),
(380, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:32:26', '2026-05-15 23:32:26'),
(381, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:32:29', '2026-05-15 23:32:29'),
(382, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:32:30', '2026-05-15 23:32:30'),
(383, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:33:27', '2026-05-15 23:33:27'),
(384, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:33:28', '2026-05-15 23:33:28'),
(385, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:39:14', '2026-05-15 23:39:14'),
(386, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:39:27', '2026-05-15 23:39:27'),
(387, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:39:33', '2026-05-15 23:39:33'),
(388, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:39:33', '2026-05-15 23:39:33'),
(389, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:40:16', '2026-05-15 23:40:16'),
(390, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:40:16', '2026-05-15 23:40:16');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(391, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:41:49', '2026-05-15 23:41:49'),
(392, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:41:50', '2026-05-15 23:41:50'),
(393, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"on\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:42:07', '2026-05-15 23:42:07'),
(394, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:42:08', '2026-05-15 23:42:08'),
(395, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"on\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:42:15', '2026-05-15 23:42:15'),
(396, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:42:16', '2026-05-15 23:42:16'),
(397, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors\":[\"Maroon,Blue,Gold,White\"],\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"on\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:42:19', '2026-05-15 23:42:19'),
(398, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:42:20', '2026-05-15 23:42:20'),
(399, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:45:29', '2026-05-15 23:45:29'),
(400, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors_input\":\"Maroon, Blue, Gold, White\",\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:45:45', '2026-05-15 23:45:45'),
(401, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:45:47', '2026-05-15 23:45:47'),
(402, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:48:03', '2026-05-15 23:48:03'),
(403, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:49:34', '2026-05-15 23:49:34'),
(404, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors_raw\":\"Maroon, Blue, Gold, White\",\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:49:38', '2026-05-15 23:49:38'),
(405, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 23:49:39', '2026-05-15 23:49:39'),
(406, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:49:42', '2026-05-15 23:49:42'),
(407, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 23:51:02', '2026-05-15 23:51:02'),
(408, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 23:51:05', '2026-05-15 23:51:05'),
(409, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:51:07', '2026-05-15 23:51:07'),
(410, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors_raw\":\"White, Maroon, Blue, Gold\",\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:51:33', '2026-05-15 23:51:33'),
(411, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 23:51:33', '2026-05-15 23:51:33'),
(412, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:51:43', '2026-05-15 23:51:43'),
(413, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"89.99\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors_raw\":\"White, Maroon, Blue, Gold\",\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"bUUorauvbk3mUfxcybtd5VwPT40775sFLeaegGOn\",\"_method\":\"PUT\"}', '2026-05-15 23:52:19', '2026-05-15 23:52:19'),
(414, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-15 23:52:19', '2026-05-15 23:52:19'),
(415, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-15 23:52:54', '2026-05-15 23:52:54'),
(416, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-15 23:53:15', '2026-05-15 23:53:15'),
(417, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-15 23:53:17', '2026-05-15 23:53:17'),
(418, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-16 01:13:50', '2026-05-16 01:13:50'),
(419, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-16 01:14:05', '2026-05-16 01:14:05'),
(420, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Product Section\",\"icon\":\"icon-adjust\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"9h0XVHRQ0pibzosFhvLD05UNPYTv7wVW59iiK0lE\"}', '2026-05-16 01:14:28', '2026-05-16 01:14:28'),
(421, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-16 01:14:29', '2026-05-16 01:14:29'),
(422, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '[]', '2026-05-16 01:14:32', '2026-05-16 01:14:32'),
(423, 1, 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"search_terms\":null,\"title\":\"Products\",\"icon\":\"icon-file\",\"uri\":\"products\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"9h0XVHRQ0pibzosFhvLD05UNPYTv7wVW59iiK0lE\",\"_method\":\"PUT\"}', '2026-05-16 01:14:41', '2026-05-16 01:14:41'),
(424, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-16 01:14:42', '2026-05-16 01:14:42'),
(425, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-16 01:15:08', '2026-05-16 01:15:08'),
(426, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '[]', '2026-05-16 01:15:13', '2026-05-16 01:15:13'),
(427, 1, 'admin/auth/menu/14', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"search_terms\":null,\"title\":\"Product-categories\",\"icon\":\"icon-file\",\"uri\":\"product-categories\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"9h0XVHRQ0pibzosFhvLD05UNPYTv7wVW59iiK0lE\",\"_method\":\"PUT\"}', '2026-05-16 01:15:23', '2026-05-16 01:15:23'),
(428, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-16 01:15:23', '2026-05-16 01:15:23'),
(429, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_order\":\"[{\\\"id\\\":\\\"16\\\",\\\"children\\\":[{\\\"id\\\":\\\"13\\\"},{\\\"id\\\":\\\"14\\\"},{\\\"id\\\":\\\"15\\\"}]},{\\\"id\\\":\\\"1\\\"},{\\\"id\\\":\\\"2\\\",\\\"children\\\":[{\\\"id\\\":\\\"3\\\"},{\\\"id\\\":\\\"4\\\"},{\\\"id\\\":\\\"5\\\"},{\\\"id\\\":\\\"6\\\"},{\\\"id\\\":\\\"7\\\"}]},{\\\"id\\\":\\\"8\\\",\\\"children\\\":[{\\\"id\\\":\\\"9\\\"},{\\\"id\\\":\\\"10\\\"},{\\\"id\\\":\\\"11\\\"},{\\\"id\\\":\\\"12\\\"}]}]\",\"_token\":\"9h0XVHRQ0pibzosFhvLD05UNPYTv7wVW59iiK0lE\"}', '2026-05-16 01:15:30', '2026-05-16 01:15:30'),
(430, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-16 01:15:30', '2026-05-16 01:15:30'),
(431, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-16 01:15:32', '2026-05-16 01:15:32'),
(432, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-16 01:15:38', '2026-05-16 01:15:38'),
(433, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"wishlists\",\"model_name\":\"App\\\\Models\\\\Wishlist\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\WishlistController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"9h0XVHRQ0pibzosFhvLD05UNPYTv7wVW59iiK0lE\"}', '2026-05-16 01:23:10', '2026-05-16 01:23:10'),
(434, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-16 01:23:13', '2026-05-16 01:23:13'),
(435, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-16 01:23:26', '2026-05-16 01:23:26'),
(436, 1, 'admin/wishlists', 'GET', '127.0.0.1', '[]', '2026-05-16 01:23:27', '2026-05-16 01:23:27'),
(437, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-16 03:59:15', '2026-05-16 03:59:15'),
(438, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2026-05-16 03:59:22', '2026-05-16 03:59:22'),
(439, 1, 'admin/products', 'POST', '127.0.0.1', '{\"name\":\"Ivory Polki Kurta Set\",\"slug\":null,\"category\":\"2\",\"search_terms\":null,\"short_description\":\"Set in classic ivory hues, this kurta handcrafted in chanderi with polki work with zari embroidery all over paired with matching ivory pants, and matching stole.\",\"description\":\"Set in classic ivory hues, this kurta handcrafted in chanderi with polki work with zari embroidery all over paired with matching ivory pants, and matching stole. A vibrant essential for the summer festivities!\\r\\n\\r\\nColour Ivory\\r\\nFabric Chanderi and Santoon\\r\\nCare Dry Clean Only\\r\\nFit Tailored\",\"price\":\"14499\",\"moq\":\"10\",\"stock\":\"1\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"130\",\"width\":\"54 inches\",\"weave\":\"Chanderi and Santoon\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors_raw\":\"Ivory\",\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"on\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"wholeseller\",\"images\":{\"new_1\":{\"sort_order\":\"0\",\"color\":\"Ivory\",\"is_primary\":\"on\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"sort_order\":\"1\",\"color\":\"Ivory\",\"is_primary\":\"0\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"sort_order\":\"2\",\"color\":\"Ivory\",\"is_primary\":\"0\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"9h0XVHRQ0pibzosFhvLD05UNPYTv7wVW59iiK0lE\"}', '2026-05-16 04:05:19', '2026-05-16 04:05:19'),
(440, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-16 04:05:19', '2026-05-16 04:05:19'),
(441, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-16 04:05:41', '2026-05-16 04:05:41'),
(442, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"799\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors_raw\":\"White, Maroon, Blue, Gold\",\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"9h0XVHRQ0pibzosFhvLD05UNPYTv7wVW59iiK0lE\",\"_method\":\"PUT\"}', '2026-05-16 04:05:58', '2026-05-16 04:05:58'),
(443, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-16 04:05:58', '2026-05-16 04:05:58'),
(444, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-16 04:06:01', '2026-05-16 04:06:01'),
(445, 1, 'admin/products/1', 'PUT', '127.0.0.1', '{\"name\":\"Heritage Silk Paisley\",\"slug\":\"heritage-silk-paisley\",\"category\":\"5\",\"search_terms\":null,\"short_description\":\"Exquisite hand-embroidered paisley motifs on luxurious silk base\",\"description\":\"Discover the epitome of luxury with our Heritage Silk Paisley fabric.\\r\\n\\r\\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.\",\"price\":\"799.00\",\"moq\":\"50\",\"stock\":\"500\",\"in_stock\":\"1\",\"in_stock_cb\":\"on\",\"weight\":\"250\",\"width\":\"54 inches\",\"weave\":\"Hand-loomed\",\"origin\":\"Jaipur, India\",\"composition\":\"100% Pure Silk\",\"care_instructions\":\"Dry Clean Only\",\"india_shipping\":\"2-3 Business Days\",\"international_shipping\":\"5-7 Business Days\",\"colors_raw\":\"White, Maroon, Blue, Gold\",\"rating\":\"4.4\",\"review_count\":\"5\",\"is_featured\":\"1\",\"is_featured_cb\":\"on\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"type\":\"retailer\",\"images\":{\"1\":{\"sort_order\":\"0\",\"color\":\"White\",\"is_primary\":\"on\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"sort_order\":\"1\",\"color\":\"White\",\"is_primary\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"sort_order\":\"2\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"sort_order\":\"3\",\"color\":\"Maroon\",\"is_primary\":\"0\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"sort_order\":\"4\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"sort_order\":\"5\",\"color\":\"Blue\",\"is_primary\":\"0\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"sort_order\":\"6\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"sort_order\":\"7\",\"color\":\"Gold\",\"is_primary\":\"0\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"9h0XVHRQ0pibzosFhvLD05UNPYTv7wVW59iiK0lE\",\"_method\":\"PUT\"}', '2026-05-16 04:06:41', '2026-05-16 04:06:41'),
(446, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-16 04:06:41', '2026-05-16 04:06:41'),
(447, 1, 'admin/products/3/edit', 'GET', '127.0.0.1', '[]', '2026-05-16 04:07:12', '2026-05-16 04:07:12'),
(448, 1, 'admin', 'GET', '127.0.0.1', '[]', '2026-05-20 04:37:28', '2026-05-20 04:37:28'),
(449, 1, 'admin/wishlists', 'GET', '127.0.0.1', '[]', '2026-05-20 04:37:35', '2026-05-20 04:37:35'),
(450, 1, 'admin/wishlists', 'GET', '127.0.0.1', '[]', '2026-05-20 04:37:45', '2026-05-20 04:37:45'),
(451, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:41:21', '2026-05-20 04:41:21'),
(452, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"product_reviews\",\"model_name\":\"App\\\\Models\\\\ProductReview\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductReviewController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\"}', '2026-05-20 04:41:57', '2026-05-20 04:41:57'),
(453, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:41:59', '2026-05-20 04:41:59'),
(454, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:42:13', '2026-05-20 04:42:13'),
(455, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-20 04:42:17', '2026-05-20 04:42:17'),
(456, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '[]', '2026-05-20 04:42:20', '2026-05-20 04:42:20'),
(457, 1, 'admin/auth/menu/18', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"search_terms\":null,\"title\":\"Product-reviews\",\"icon\":\"icon-file\",\"uri\":\"product-reviews\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\",\"_method\":\"PUT\"}', '2026-05-20 04:42:28', '2026-05-20 04:42:28'),
(458, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-20 04:42:29', '2026-05-20 04:42:29'),
(459, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-20 04:42:30', '2026-05-20 04:42:30'),
(460, 1, 'admin/product-reviews', 'GET', '127.0.0.1', '[]', '2026-05-20 04:42:33', '2026-05-20 04:42:33'),
(461, 1, 'admin/product-reviews/3/edit', 'GET', '127.0.0.1', '[]', '2026-05-20 04:42:38', '2026-05-20 04:42:38'),
(462, 1, 'admin/product-reviews', 'GET', '127.0.0.1', '[]', '2026-05-20 04:42:42', '2026-05-20 04:42:42'),
(463, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-20 04:43:04', '2026-05-20 04:43:04'),
(464, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-20 04:43:05', '2026-05-20 04:43:05'),
(465, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-20 04:43:06', '2026-05-20 04:43:06'),
(466, 1, 'admin/product-reviews', 'GET', '127.0.0.1', '[]', '2026-05-20 04:43:07', '2026-05-20 04:43:07'),
(467, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-20 04:43:32', '2026-05-20 04:43:32'),
(468, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:43:36', '2026-05-20 04:43:36'),
(469, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"carts\",\"model_name\":\"App\\\\Models\\\\Cart\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\CartController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\"}', '2026-05-20 04:44:09', '2026-05-20 04:44:09'),
(470, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:44:10', '2026-05-20 04:44:10'),
(471, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:44:25', '2026-05-20 04:44:25'),
(472, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"orders\",\"model_name\":\"App\\\\Models\\\\Order\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\OrderController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\"}', '2026-05-20 04:45:05', '2026-05-20 04:45:05'),
(473, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:45:05', '2026-05-20 04:45:05'),
(474, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:45:15', '2026-05-20 04:45:15'),
(475, 1, 'admin/carts', 'GET', '127.0.0.1', '[]', '2026-05-20 04:45:17', '2026-05-20 04:45:17'),
(476, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2026-05-20 04:45:18', '2026-05-20 04:45:18'),
(477, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:45:31', '2026-05-20 04:45:31'),
(478, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"order_items\",\"model_name\":\"App\\\\Models\\\\OrderItem\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\OrderItemController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\"}', '2026-05-20 04:45:59', '2026-05-20 04:45:59'),
(479, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:45:59', '2026-05-20 04:45:59'),
(480, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:46:10', '2026-05-20 04:46:10'),
(481, 1, 'admin/order-items', 'GET', '127.0.0.1', '[]', '2026-05-20 04:46:12', '2026-05-20 04:46:12'),
(482, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2026-05-20 04:46:27', '2026-05-20 04:46:27'),
(483, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:46:30', '2026-05-20 04:46:30'),
(484, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"users\",\"model_name\":\"App\\\\Models\\\\User\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\UserController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\"}', '2026-05-20 04:46:58', '2026-05-20 04:46:58'),
(485, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:46:59', '2026-05-20 04:46:59'),
(486, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:47:11', '2026-05-20 04:47:11'),
(487, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"user_addresses\",\"model_name\":\"App\\\\Models\\\\UserAddress\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\UserAddressController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\"}', '2026-05-20 04:47:54', '2026-05-20 04:47:54'),
(488, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:47:55', '2026-05-20 04:47:55'),
(489, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:48:07', '2026-05-20 04:48:07'),
(490, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"inquiries\",\"model_name\":\"App\\\\Models\\\\Inquiry\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\InquiryController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\"}', '2026-05-20 04:48:41', '2026-05-20 04:48:41'),
(491, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:48:41', '2026-05-20 04:48:41'),
(492, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:48:52', '2026-05-20 04:48:52'),
(493, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:48:55', '2026-05-20 04:48:55'),
(494, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-20 04:49:01', '2026-05-20 04:49:01'),
(495, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-20 04:49:14', '2026-05-20 04:49:14'),
(496, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Order Section\",\"icon\":\"icon-archive\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\"}', '2026-05-20 04:49:31', '2026-05-20 04:49:31'),
(497, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-20 04:49:31', '2026-05-20 04:49:31'),
(498, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-20 04:49:33', '2026-05-20 04:49:33'),
(499, 1, 'admin/auth/menu/20/edit', 'GET', '127.0.0.1', '[]', '2026-05-20 04:49:37', '2026-05-20 04:49:37'),
(500, 1, 'admin/auth/menu/20', 'PUT', '127.0.0.1', '{\"parent_id\":\"25\",\"search_terms\":null,\"title\":\"Orders\",\"icon\":\"icon-file\",\"uri\":\"orders\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\",\"_method\":\"PUT\"}', '2026-05-20 04:49:46', '2026-05-20 04:49:46'),
(501, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-20 04:49:46', '2026-05-20 04:49:46'),
(502, 1, 'admin/auth/menu/21/edit', 'GET', '127.0.0.1', '[]', '2026-05-20 04:49:50', '2026-05-20 04:49:50'),
(503, 1, 'admin/auth/menu/21', 'PUT', '127.0.0.1', '{\"parent_id\":\"25\",\"search_terms\":null,\"title\":\"Order-items\",\"icon\":\"icon-file\",\"uri\":\"order-items\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"b8JkAOeRBsr9BiKV8Sf4o6nM2uyM90DiOlA4c680\",\"_method\":\"PUT\"}', '2026-05-20 04:50:00', '2026-05-20 04:50:00'),
(504, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-20 04:50:01', '2026-05-20 04:50:01'),
(505, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2026-05-20 04:50:02', '2026-05-20 04:50:02'),
(506, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2026-05-20 04:50:10', '2026-05-20 04:50:10'),
(507, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2026-05-20 04:51:07', '2026-05-20 04:51:07'),
(508, 1, 'admin/order-items', 'GET', '127.0.0.1', '[]', '2026-05-20 04:51:16', '2026-05-20 04:51:16'),
(509, 1, 'admin/order-items', 'GET', '127.0.0.1', '[]', '2026-05-20 04:52:59', '2026-05-20 04:52:59'),
(510, 1, 'admin/order-items', 'GET', '127.0.0.1', '[]', '2026-05-20 04:53:58', '2026-05-20 04:53:58'),
(511, 1, 'admin/order-items', 'GET', '127.0.0.1', '[]', '2026-05-20 04:54:40', '2026-05-20 04:54:40'),
(512, 1, 'admin/order-items', 'GET', '127.0.0.1', '[]', '2026-05-20 04:55:12', '2026-05-20 04:55:12'),
(513, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2026-05-20 04:55:14', '2026-05-20 04:55:14'),
(514, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-20 04:55:21', '2026-05-20 04:55:21'),
(515, 1, 'admin/product-categories', 'GET', '127.0.0.1', '[]', '2026-05-20 04:55:25', '2026-05-20 04:55:25'),
(516, 1, 'admin/product-images', 'GET', '127.0.0.1', '[]', '2026-05-20 04:55:29', '2026-05-20 04:55:29'),
(517, 1, 'admin/product-reviews', 'GET', '127.0.0.1', '[]', '2026-05-20 04:55:32', '2026-05-20 04:55:32'),
(518, 1, 'admin/product-reviews', 'GET', '127.0.0.1', '[]', '2026-05-20 04:55:41', '2026-05-20 04:55:41'),
(519, 1, 'admin/wishlists', 'GET', '127.0.0.1', '[]', '2026-05-20 04:55:47', '2026-05-20 04:55:47'),
(520, 1, 'admin/wishlists', 'GET', '127.0.0.1', '[]', '2026-05-20 04:55:57', '2026-05-20 04:55:57'),
(521, 1, 'admin/carts', 'GET', '127.0.0.1', '[]', '2026-05-20 04:56:08', '2026-05-20 04:56:08'),
(522, 1, 'admin/carts', 'GET', '127.0.0.1', '[]', '2026-05-20 04:56:21', '2026-05-20 04:56:21'),
(523, 1, 'admin/carts', 'GET', '127.0.0.1', '[]', '2026-05-20 04:57:07', '2026-05-20 04:57:07'),
(524, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2026-05-20 04:57:45', '2026-05-20 04:57:45'),
(525, 1, 'admin/user-addresses', 'GET', '127.0.0.1', '[]', '2026-05-20 04:57:48', '2026-05-20 04:57:48'),
(526, 1, 'admin/inquiries', 'GET', '127.0.0.1', '[]', '2026-05-20 04:57:52', '2026-05-20 04:57:52'),
(527, 1, 'admin/inquiries', 'GET', '127.0.0.1', '[]', '2026-05-20 05:01:42', '2026-05-20 05:01:42'),
(528, 1, 'admin/user-addresses', 'GET', '127.0.0.1', '[]', '2026-05-20 05:03:39', '2026-05-20 05:03:39'),
(529, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2026-05-20 05:03:41', '2026-05-20 05:03:41'),
(530, 1, 'admin', 'GET', '127.0.0.1', '[]', '2026-05-20 05:06:00', '2026-05-20 05:06:00'),
(531, 1, 'admin/inquiries', 'GET', '127.0.0.1', '[]', '2026-05-20 05:06:03', '2026-05-20 05:06:03'),
(532, 1, 'admin/inquiries', 'GET', '127.0.0.1', '[]', '2026-05-20 05:06:31', '2026-05-20 05:06:31'),
(533, 1, 'admin/inquiries', 'GET', '127.0.0.1', '[]', '2026-05-20 05:06:49', '2026-05-20 05:06:49'),
(534, 1, 'admin/inquiries', 'GET', '127.0.0.1', '[]', '2026-05-20 05:07:09', '2026-05-20 05:07:09'),
(535, 1, 'admin', 'GET', '127.0.0.1', '[]', '2026-05-21 01:23:00', '2026-05-21 01:23:00'),
(536, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2026-05-21 01:23:10', '2026-05-21 01:23:10'),
(537, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-21 01:23:12', '2026-05-21 01:23:12'),
(538, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"home_banner\",\"model_name\":\"App\\\\Models\\\\HomeBanner\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\HomeBannerController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\",\"menu_item\"],\"fields\":[{\"name\":\"image\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"title\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"short_description\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"explore_link\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"start_custom_link\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"ZIMRJ4f7W1ds0yJrZwyWfnXS5CQoJsFYfIDFAJ8F\"}', '2026-05-21 01:25:45', '2026-05-21 01:25:45'),
(539, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-21 01:25:48', '2026-05-21 01:25:48'),
(540, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2026-05-21 01:26:00', '2026-05-21 01:26:00'),
(541, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:26:09', '2026-05-21 01:26:09'),
(542, 1, 'admin/home-banners/create', 'GET', '127.0.0.1', '[]', '2026-05-21 01:26:12', '2026-05-21 01:26:12'),
(543, 1, 'admin/home-banners', 'POST', '127.0.0.1', '{\"title\":\"Premium Textile Collection for Modern Living\",\"short_description\":\"Discover high-quality fabrics crafted with elegance, comfort, and timeless design for every lifestyle.\",\"explore_link\":null,\"start_custom_link\":null,\"_token\":\"ZIMRJ4f7W1ds0yJrZwyWfnXS5CQoJsFYfIDFAJ8F\"}', '2026-05-21 01:42:15', '2026-05-21 01:42:15'),
(544, 1, 'admin/home-banners/create', 'GET', '127.0.0.1', '[]', '2026-05-21 01:42:19', '2026-05-21 01:42:19'),
(545, 1, 'admin/home-banners/create', 'GET', '127.0.0.1', '[]', '2026-05-21 01:42:25', '2026-05-21 01:42:25'),
(546, 1, 'admin/home-banners', 'POST', '127.0.0.1', '{\"title\":\"Premium Textile Collection for Modern Living\",\"short_description\":\"Discover high-quality fabrics crafted with elegance, comfort, and timeless design for every lifestyle.\",\"explore_link\":null,\"start_custom_link\":null,\"alt\":\"Luxury textile fabric collection banner with elegant modern designs\",\"is_active\":\"on\",\"is_active_cb\":\"on\",\"_token\":\"ZIMRJ4f7W1ds0yJrZwyWfnXS5CQoJsFYfIDFAJ8F\"}', '2026-05-21 01:42:57', '2026-05-21 01:42:57'),
(547, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:42:57', '2026-05-21 01:42:57'),
(548, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:45:55', '2026-05-21 01:45:55'),
(549, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:46:09', '2026-05-21 01:46:09'),
(550, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:46:16', '2026-05-21 01:46:16'),
(551, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:46:30', '2026-05-21 01:46:30'),
(552, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:47:11', '2026-05-21 01:47:11'),
(553, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:47:30', '2026-05-21 01:47:30'),
(554, 1, 'admin/home-banners/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-21 01:47:49', '2026-05-21 01:47:49'),
(555, 1, 'admin/home-banners/1', 'PUT', '127.0.0.1', '{\"title\":\"Premium Textile Collection for Modern Living\",\"short_description\":\"Discover high-quality fabrics crafted with elegance, comfort, and timeless design for every lifestyle.\",\"explore_link\":\"http:\\/\\/127.0.0.1:8000\\/products\\/heritage-silk-paisley\",\"start_custom_link\":\"http:\\/\\/127.0.0.1:8000\\/products\\/heritage-silk-paisley\",\"alt\":\"Luxury textile fabric collection banner with elegant modern designs\",\"is_active\":\"1\",\"is_active_cb\":\"on\",\"_token\":\"ZIMRJ4f7W1ds0yJrZwyWfnXS5CQoJsFYfIDFAJ8F\",\"_method\":\"PUT\"}', '2026-05-21 01:48:06', '2026-05-21 01:48:06'),
(556, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:48:06', '2026-05-21 01:48:06'),
(557, 1, 'admin/home-banners/create', 'GET', '127.0.0.1', '[]', '2026-05-21 01:48:11', '2026-05-21 01:48:11'),
(558, 1, 'admin/home-banners', 'POST', '127.0.0.1', '{\"title\":\"Tradition Woven with Contemporary Style\",\"short_description\":\"Experience beautifully crafted textiles that blend heritage craftsmanship with modern fashion trends.\",\"explore_link\":\"http:\\/\\/127.0.0.1:8000\\/products\\/ivory-polki-kurta-set\",\"start_custom_link\":\"http:\\/\\/127.0.0.1:8000\\/products\\/ivory-polki-kurta-set\",\"alt\":\"Traditional and modern textile patterns displayed in a stylish banner\",\"is_active\":\"on\",\"is_active_cb\":\"on\",\"_token\":\"ZIMRJ4f7W1ds0yJrZwyWfnXS5CQoJsFYfIDFAJ8F\"}', '2026-05-21 01:48:50', '2026-05-21 01:48:50'),
(559, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:48:50', '2026-05-21 01:48:50'),
(560, 1, 'admin/wishlists', 'GET', '127.0.0.1', '[]', '2026-05-21 01:55:32', '2026-05-21 01:55:32'),
(561, 1, 'admin/carts', 'GET', '127.0.0.1', '[]', '2026-05-21 01:55:33', '2026-05-21 01:55:33'),
(562, 1, 'admin/wishlists', 'GET', '127.0.0.1', '[]', '2026-05-21 01:55:36', '2026-05-21 01:55:36'),
(563, 1, 'admin/carts', 'GET', '127.0.0.1', '[]', '2026-05-21 01:55:37', '2026-05-21 01:55:37'),
(564, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2026-05-21 01:55:39', '2026-05-21 01:55:39'),
(565, 1, 'admin/user-addresses', 'GET', '127.0.0.1', '[]', '2026-05-21 01:55:40', '2026-05-21 01:55:40'),
(566, 1, 'admin/inquiries', 'GET', '127.0.0.1', '[]', '2026-05-21 01:55:42', '2026-05-21 01:55:42'),
(567, 1, 'admin/home-banners', 'GET', '127.0.0.1', '[]', '2026-05-21 01:55:46', '2026-05-21 01:55:46'),
(568, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2026-05-21 03:18:36', '2026-05-21 03:18:36'),
(569, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '[]', '2026-05-21 03:18:38', '2026-05-21 03:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(6, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2026-05-15 01:10:22', '2026-05-15 01:10:22');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2026-04-10 00:14:25', '2026-04-10 00:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 16, NULL, NULL),
(1, 13, NULL, NULL),
(1, 14, NULL, NULL),
(1, 18, NULL, NULL),
(1, 25, NULL, NULL),
(1, 20, NULL, NULL),
(1, 21, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$EwdBRR8cPWg23XXJqu8/0.hPGu85X0iogOIiWMnM3Yfv7m33abkMO', 'Administrator', NULL, NULL, '2026-04-10 00:14:25', '2026-04-10 00:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `color`, `quantity`, `created_at`, `updated_at`) VALUES
(13, 1, 1, 'Maroon', 1, '2026-05-20 04:56:58', '2026-05-20 04:56:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_banner`
--

CREATE TABLE `home_banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explore_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_custom_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_banner`
--

INSERT INTO `home_banner` (`id`, `image`, `title`, `short_description`, `explore_link`, `start_custom_link`, `alt`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'images/clark-street-mercantile-qnKhZJPKFD8-unsplash_1.jpg', 'Premium Textile Collection for Modern Living', 'Discover high-quality fabrics crafted with elegance, comfort, and timeless design for every lifestyle.', 'http://127.0.0.1:8000/products/heritage-silk-paisley', 'http://127.0.0.1:8000/products/heritage-silk-paisley', 'Luxury textile fabric collection banner with elegant modern designs', 1, '2026-05-21 01:42:57', '2026-05-21 01:48:06'),
(2, 'images/alyssa-strohmann-TS--uNw-JqE-unsplash.jpg', 'Tradition Woven with Contemporary Style', 'Experience beautifully crafted textiles that blend heritage craftsmanship with modern fashion trends.', 'http://127.0.0.1:8000/products/ivory-polki-kurta-set', 'http://127.0.0.1:8000/products/ivory-polki-kurta-set', 'Traditional and modern textile patterns displayed in a stylish banner', 1, '2026-05-21 01:48:50', '2026-05-21 01:48:50');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `user_id`, `product_id`, `name`, `phone`, `email`, `quantity`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Kaushik Dey', '7894651321', 'kaushik.dey.ahit1@gmail.com', '100 pieces', 'I\'m interested in bulk order for', '2026-05-20 04:29:46', '2026-05-20 04:29:46'),
(2, 1, 1, 'Kaushik Dey', '7894651321', 'kaushik.dey.ahit1@gmail.com', '50 Picas', 'I\'m interested in bulk order for maroon shirt', '2026-05-20 04:33:27', '2026-05-20 04:33:27'),
(3, NULL, 1, 'Kaushik Dey', '+917894651321', 'kaushik.dey.ahit1@gmail.com', '20 pieces', 'I\'m Intrustedt your prodeuct dm me this number 4546546545', '2026-05-20 05:05:47', '2026-05-20 05:05:47');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2026_05_14_050654_add_fields_to_users_table', 1),
(7, '2026_05_14_053523_add_gender_to_users_table', 1),
(8, '2026_05_14_092537_create_products_table', 1),
(9, '2026_05_14_092615_create_product_images_table', 1),
(10, '2026_05_14_092643_create_product_reviews_table', 1),
(11, '2026_05_15_051323_add_color_to_product_images_table', 2),
(12, '2026_05_15_064941_create_product_categories_table', 3),
(13, '2026_05_15_070422_add_type_to_products_table', 4),
(14, '2026_05_15_093701_fix_colors_json_format_in_products', 5),
(15, '2026_05_15_103443_add_is_active_to_product_categories_table', 6),
(16, '2026_05_16_055006_create_wishlists_table', 7),
(17, '2026_05_18_051218_create_orders_table', 8),
(18, '2026_05_18_051330_create_order_items_table', 9),
(19, '2026_05_18_051400_create_user_addresses_table', 10),
(20, '2026_05_18_051956_create_carts_table', 11),
(21, '2026_05_20_094904_create_inquiries_table', 12),
(22, '2026_05_21_065545_create_home_banner_table', 13),
(23, '2026_05_21_070527_add_is_active_to_home_banner_table', 14),
(24, '2026_05_21_084402_add_seo_to_r_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','accepted','processing','shipped','delivered','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` enum('cod','online') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('pending','paid','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'India',
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `status`, `payment_method`, `payment_status`, `subtotal`, `tax`, `discount`, `total`, `coupon_code`, `first_name`, `last_name`, `email`, `phone`, `street_address`, `city`, `state`, `zip_code`, `country`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 'ORD-CNJLDNCX', 'pending', 'cod', 'pending', '144990.00', '26098.20', '0.00', '171088.20', NULL, 'Kaushik', 'Dey', 'kaushik.dey.ahit1@gmail.com', '7894651321', '43 A pratap nagarh, ramgarhmod', 'JAIPUR', 'Rajasthan', '302002', 'India', 'Home address', '2026-05-19 00:08:30', '2026-05-19 00:08:30'),
(2, 1, 'ORD-7E20PG1F', 'pending', 'cod', 'pending', '15298.00', '2753.64', '0.00', '18051.64', NULL, 'Rohit', 'Singh', 'rohit.singh.ahit@gmail.com', '9874561230', 'near IndusInd Bank Old Ramgadhmod Busstand, Kagdiwara, Brahampuri Ground Floor, Plot No. 57, Gurukripa Enclave, Amer', 'JAIPUR', 'Rajasthan', '302002', 'India', 'Office Address', '2026-05-19 00:14:06', '2026-05-19 00:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `product_image`, `price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Ivory Polki Kurta Set', 'http://127.0.0.1:8000/uploads/products/a675807f326917b84d4d043c954df8cc.jpg', '14499.00', 10, '144990.00', '2026-05-19 00:08:30', '2026-05-19 00:08:30'),
(2, 2, 3, 'Ivory Polki Kurta Set', 'http://127.0.0.1:8000/uploads/products/a675807f326917b84d4d043c954df8cc.jpg', '14499.00', 1, '14499.00', '2026-05-19 00:14:06', '2026-05-19 00:14:06'),
(3, 2, 1, 'Heritage Silk Paisley', 'http://127.0.0.1:8000/uploads/products/d6f84f8c644d1e2c94725ae7c8a6287d.webp', '799.00', 1, '799.00', '2026-05-19 00:14:06', '2026-05-19 00:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `moq` int(11) NOT NULL DEFAULT 50,
  `stock` int(11) NOT NULL DEFAULT 0,
  `in_stock` tinyint(1) NOT NULL DEFAULT 1,
  `weight` int(11) DEFAULT NULL,
  `width` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weave` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `composition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `care_instructions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `india_shipping` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `international_shipping` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`colors`)),
  `rating` decimal(3,1) NOT NULL DEFAULT 0.0,
  `review_count` int(11) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('retailer','wholeseller') COLLATE utf8mb4_unicode_ci DEFAULT 'retailer',
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `category`, `short_description`, `description`, `price`, `moq`, `stock`, `in_stock`, `weight`, `width`, `weave`, `origin`, `composition`, `care_instructions`, `india_shipping`, `international_shipping`, `colors`, `rating`, `review_count`, `is_featured`, `is_active`, `created_at`, `updated_at`, `type`, `seo_title`, `seo_description`, `seo_keyword`) VALUES
(1, 'Heritage Silk Paisley', 'heritage-silk-paisley', '5', 'Exquisite hand-embroidered paisley motifs on luxurious silk base', 'Discover the epitome of luxury with our Heritage Silk Paisley fabric.\r\n\r\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.', '799.00', 1, 500, 1, 250, '54 inches', 'Hand-loomed', 'Jaipur, India', '100% Pure Silk', 'Dry Clean Only', '2-3 Business Days', '5-7 Business Days', '[\"White\",\"Maroon\",\"Blue\",\"Gold\"]', '4.4', 5, 1, 1, '2026-05-15 04:11:41', '2026-05-16 04:05:58', 'retailer', 'Heritage Silk Paisley Title', 'Heritage Silk Paisley Description', 'Heritage Silk Paisley Keyword'),
(3, 'Ivory Polki Kurta Set', 'ivory-polki-kurta-set', '2', 'Set in classic ivory hues, this kurta handcrafted in chanderi with polki work with zari embroidery all over paired with matching ivory pants, and matching stole.', 'Set in classic ivory hues, this kurta handcrafted in chanderi with polki work with zari embroidery all over paired with matching ivory pants, and matching stole. A vibrant essential for the summer festivities!\r\n\r\nColour Ivory\r\nFabric Chanderi and Santoon\r\nCare Dry Clean Only\r\nFit Tailored', '14499.00', 10, 1000, 1, 130, '54 inches', 'Chanderi and Santoon', 'Jaipur, India', '100% Pure Silk', 'Dry Clean Only', '2-3 Business Days', '5-7 Business Days', '[\"Ivory\"]', '4.4', 5, 1, 1, '2026-05-16 04:05:19', '2026-05-16 04:05:19', 'wholeseller', 'Ivory Polki Kurta Set Title', 'Ivory Polki Kurta Set Description', 'Ivory Polki Kurta Set Keyword');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('retailer','wholeseller') COLLATE utf8mb4_unicode_ci DEFAULT 'retailer',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `slug`, `type`, `image`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'Sarees', 'sarees', 'retailer', 'images/71H14jo-awL._SX522_.jpg', '2026-05-15 04:31:04', '2026-05-15 04:31:04', 1),
(2, 'Kurtas', 'kurtas', 'retailer', 'images/shopping (3).webp', '2026-05-15 04:31:39', '2026-05-15 04:31:39', 1),
(3, 'Bridal', 'bridal', 'retailer', 'images/96dfe783d216b2df7bcf114cf94354c5 (1).jpg', '2026-05-15 04:33:00', '2026-05-15 04:33:00', 1),
(4, 'Men Kurtas', 'men-kurtas', 'wholeseller', 'images/shopping (2).webp', '2026-05-15 04:33:50', '2026-05-15 04:33:50', 1),
(5, 'Man Casual Shirt', 'man-casual-shirt', 'retailer', 'images/download.webp', '2026-05-15 04:37:27', '2026-05-15 04:37:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `is_primary`, `color`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'products/d6f84f8c644d1e2c94725ae7c8a6287d.webp', 1, 'White', 0, '2026-05-15 04:11:41', '2026-05-16 04:06:41'),
(2, 1, 'products/0de788479bebc06b3131ee0a57551f6b.webp', 0, 'White', 1, '2026-05-15 04:11:41', '2026-05-16 04:06:41'),
(3, 1, 'products/188f301b00cbb20f4d30d52ca44bf697.webp', 0, 'Maroon', 2, '2026-05-15 04:11:41', '2026-05-16 04:06:41'),
(4, 1, 'products/685e3dee824976874c968ddc712070e5.webp', 0, 'Maroon', 3, '2026-05-15 04:11:41', '2026-05-16 04:06:41'),
(5, 1, 'products/d8f8239f5cd6429aa49a4dda4b2b9f8b.webp', 0, 'Blue', 4, '2026-05-15 04:11:41', '2026-05-16 04:06:41'),
(6, 1, 'products/fd3ee19ebc0b3b302884acdd13ab9bdb.webp', 0, 'Blue', 5, '2026-05-15 04:11:41', '2026-05-16 04:06:41'),
(7, 1, 'products/9a2b16fb22bd56902768f59fc5eda0c7.webp', 0, 'Gold', 6, '2026-05-15 04:11:41', '2026-05-16 04:06:41'),
(8, 1, 'products/740524832cbec68291038c1c42a21ba3.webp', 0, 'Gold', 7, '2026-05-15 04:11:41', '2026-05-16 04:06:41'),
(9, 3, 'products/a675807f326917b84d4d043c954df8cc.jpg', 1, 'Ivory', 0, '2026-05-16 04:05:19', '2026-05-16 04:05:19'),
(10, 3, 'products/1bc551da4c7306de4f78b0348accbaa1.jpg', 0, 'Ivory', 1, '2026-05-16 04:05:19', '2026-05-16 04:05:19'),
(11, 3, 'products/aec757c5d3aa57aa632cf07f17e728b9.jpg', 0, 'Ivory', 2, '2026-05-16 04:05:19', '2026-05-16 04:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `helpful_count` int(11) NOT NULL DEFAULT 0,
  `verified_purchase` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `reviewer_name`, `title`, `body`, `rating`, `helpful_count`, `verified_purchase`, `is_approved`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Priya Sharma', 'Absolutely Stunning!', 'The quality of this textile is exceptional. The craftsmanship is evident in every stitch. Highly recommend to anyone looking for premium fabrics. Worth every rupee spent on this beautiful fabric.', 5, 14, 1, 1, '2026-05-15 04:11:41', '2026-05-15 04:11:41'),
(2, 1, NULL, 'Rahul Mehta', 'Great Quality', 'Ordered 100 meters for my boutique. The color is exactly as shown and the fabric feels luxurious. My customers absolutely love the final products made from this fabric.', 4, 26, 1, 1, '2026-05-15 04:11:41', '2026-05-15 04:11:41'),
(3, 1, NULL, 'Sunita Patel', 'Premium Fabric', 'This silk fabric is truly premium. The weave is tight and the sheen is beautiful. Perfect for bridal wear. Will definitely order again for my next collection.', 5, 6, 1, 1, '2026-05-15 04:11:41', '2026-05-15 04:11:41'),
(4, 1, NULL, 'Amit Kumar', 'Good but delayed', 'The fabric quality is good but delivery was delayed by 2 days. Overall satisfied with the product. The color and texture are as described on the website.', 4, 20, 1, 1, '2026-05-15 04:11:41', '2026-05-15 04:11:41'),
(5, 1, 1, 'Kaushik Dey', 'Absolutely Stunning!', 'The quality of this textile is exceptional. The craftsmanship is evident in every stitch. Highly recommend to anyone looking for premium fabrics. Worth every rupee spent on this beautiful fabric.', 4, 0, 1, 1, '2026-05-15 04:20:49', '2026-05-15 04:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_type` enum('retail','wholesale') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'retail',
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `gender`, `account_type`, `business_name`, `gst_number`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kaushik', 'Dey', 'kaushik.dey.ahit1@gmail.com', '7894651321', 'Male', 'retail', NULL, NULL, NULL, '$2y$12$k1evUl5I8a.HzZVG2iHcVO3NDpjiuQiRKGa6yW0XESGpkyngMq6C6', NULL, '2026-05-15 00:32:36', '2026-05-15 00:32:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'India',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `first_name`, `last_name`, `phone`, `email`, `street_address`, `city`, `state`, `zip_code`, `country`, `is_default`, `created_at`, `updated_at`) VALUES
(2, 1, 'Rohit', 'Singh', '9874561230', 'rohit.singh.ahit@gmail.com', 'near IndusInd Bank Old Ramgadhmod Busstand, Kagdiwara, Brahampuri Ground Floor, Plot No. 57, Gurukripa Enclave, Amer', 'JAIPUR', 'Rajasthan', '302002', 'India', 0, '2026-05-19 00:14:06', '2026-05-19 00:14:06'),
(3, 1, 'Kaushik', 'Dey', '7894651321', 'kaushik.dey.ahit1@gmail.com', '43- A Pratap Nagarh , Old Ramgarh Mode', 'JAIPUR', 'RAJASTHAN', '302002', 'India', 0, '2026-05-19 00:15:57', '2026-05-19 00:15:57');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(8, 1, 3, '2026-05-20 01:48:38', '2026-05-20 01:48:38'),
(9, 1, 1, '2026-05-20 01:50:05', '2026-05-20 01:50:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_user_id_product_id_color_unique` (`user_id`,`product_id`,`color`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_banner`
--
ALTER TABLE `home_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inquiries_user_id_foreign` (`user_id`),
  ADD KEY `inquiries_product_id_foreign` (`product_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_categories_slug_unique` (`slug`),
  ADD UNIQUE KEY `product_categories_image_unique` (`image`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=570;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_banner`
--
ALTER TABLE `home_banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD CONSTRAINT `inquiries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `inquiries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
