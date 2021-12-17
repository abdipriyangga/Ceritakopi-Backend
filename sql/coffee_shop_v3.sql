-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2021 at 02:55 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Favorite Products', '2021-05-28 02:45:27', '2021-06-11 13:39:51'),
(2, 'Coffee', '2021-05-28 02:45:27', '2021-06-11 13:40:13'),
(3, 'Non Coffee', '2021-05-28 02:46:02', '2021-06-11 13:40:38'),
(4, 'Foods', '2021-05-28 02:46:02', '2021-09-18 06:48:13'),
(5, 'Add-On', '2021-09-18 06:48:25', '2021-09-18 10:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `isLatest` tinyint(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `message`, `sender`, `recipient`, `isLatest`, `created_at`, `updated_at`) VALUES
(1, 'halo ini dari postman mabdip', '089659597621', '081271408776', 0, '2021-08-18 07:17:35', '2021-08-20 02:52:23'),
(2, 'halo ini dari postman ojan', '081271408776', '081127128767', 0, '2021-08-18 07:51:18', '2021-08-18 09:05:47'),
(3, 'halo ini dari postman ojan 2', '081271408776', '081127128767', 0, '2021-08-18 09:05:47', '2021-08-19 03:17:48'),
(4, 'hai selamat pagi!', '081271408776', '081127128767', 0, '2021-08-19 03:17:48', '2021-08-19 08:02:13'),
(5, 'hai selamat siang!', '081271408776', '081127128767', 1, '2021-08-19 08:02:13', NULL),
(6, 'hi', '081271408776', '081271408776', 0, '2021-08-20 02:50:03', '2021-08-20 02:52:23'),
(7, 'iya pagi', '089659597621', '081271408776', 1, '2021-08-20 02:52:23', NULL),
(8, 'Hai ojan iini angga2', '085609304506', '081271408776', 0, '2021-08-20 04:40:46', '2021-08-20 04:45:26'),
(9, 'Hai ojan iini angga2', '085609304506', '081271408776', 0, '2021-08-20 04:45:26', '2021-08-20 04:51:40'),
(10, 'ojan', '085609304506', '081271408776', 1, '2021-08-20 04:51:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `images` text DEFAULT NULL,
  `price` int(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_on` text DEFAULT NULL,
  `detail` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `images`, `price`, `quantity`, `delivery_on`, `detail`, `created_at`, `updated_at`) VALUES
(45, 'Kopi Luwak Super ', '/upload/img-1623814480863.png', 20000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 03:34:40', '2021-06-16 09:22:23'),
(47, 'Teh Tarik Ku', '/upload/img-1623884889888.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 23:08:09', NULL),
(48, 'Teh Tarik Ku', '/upload/img-1627444988835.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-07-28 04:03:08', NULL),
(49, 'Moccha Ice', '\\upload\\img-1630547751525.png', 15000, 10, 'Today', 'Minuman coffee mocha yang sangat nikmat', '2021-09-02 01:55:51', NULL),
(50, 'Moccha Ice', '\\upload\\img-1630547899213.png', 20000, 10, 'Today', 'Minuman coffee mocha yang sangat nikmat', '2021-09-02 01:58:19', '2021-09-18 09:10:06'),
(51, 'Cappuchino Ice', '\\upload\\img-1630549462167.png', 20000, 10, 'Today', 'Minuman coffee cappucino yang sangat nikmat', '2021-09-02 02:24:22', '2021-09-18 09:09:55'),
(52, 'Cappuchino Ice', '\\upload\\img-1631677666895.png', 20000, 10, 'Today', 'Minuman coffee cappucino yang sangat nikmat', '2021-09-15 03:47:46', NULL),
(53, 'Ayam Potato Spicy', '\\upload\\img-1632008057783.png', 40000, 10, 'Today', 'Makanan ayam yang nikmat sekali', '2021-09-18 23:34:17', NULL),
(54, 'Ayam Penyet', '\\upload\\img-1632008146559.png', 25000, 10, 'Today', 'Makanan ayam penyet dengan sambel super pedas', '2021-09-18 23:35:46', NULL),
(55, 'Gayo Cold Brew', '\\upload\\img-1632033024540.png', 18000, 10, 'Today', 'Kopi dengan biji gayo dari aceh', '2021-09-19 06:30:24', NULL),
(58, 'Robusta Cold Brew', '\\upload\\img-1632197342618.png', 18000, 10, 'Today', 'Kopi dengan biji gayo dari aceh', '2021-09-21 04:09:02', NULL),
(60, 'Nasi Goreng', '\\upload\\img-1632314733851.jpg', 25000, 10, 'Today', 'Nasi goreng adalah sebuah makanan berupa nasi yang digoreng dan diaduk dalam minyak goreng, margarin, atau mentega. Biasanya ditambah kecap manis, bawang merah, bawang putih, asam jawa, lada dan bumbu-bumbu lainnya; seperti telur, ayam, dan kerupuk', '2021-09-22 12:45:34', NULL),
(61, 'Sate Ayam', '\\upload\\img-1632314883641.jpg', 18000, 10, 'Today', 'Sate atau satai adalah makanan yang terbuat dari daging yang dipotong kecil-kecil dan ditusuk sedemikian rupa dengan tusukan lidi tulang daun kelapa atau bambu, kemudian dipanggang menggunakan bara arang kayu. Sate disajikan dengan berbagai macam bumbu yang bergantung pada variasi resep sate.', '2021-09-22 12:48:03', NULL),
(62, 'Mie Goreng', '\\upload\\img-1632314969536.jpg', 15000, 10, 'Today', 'Mi goreng berarti \"mi yang digoreng\" adalah makanan yang berasal dari Indonesia yang populer dan juga digemari di Malaysia, dan Singapura.', '2021-09-22 12:49:29', NULL),
(63, 'Sup Buntut', '\\upload\\img-1632315079045.jpg', 28000, 10, 'Today', 'Sup buntut dibuat dengan ekor sapi. Sedikitnya ada lima versi sup buntut yang populer di seluruh dunia: makanan tradisional Korea, makanan Tiongkok yang lebih mirip semur, ekor sapi goreng/panggang dicampur dengan berbagai variasi sup merupakan makanan populer di Indonesia, makanan etnis Amerika Serikat bagian Selatan yang sudah ada sejak periode sebelum perang revolusi, dan sup kuah tebal dan gurih yang populer di Britania Raya sejak abad ke-18.', '2021-09-22 12:51:19', NULL),
(64, 'Soto Ayam', '\\upload\\img-1632315184279.jpg', 17000, 10, 'Today', 'Soto ayam adalah makanan khas Indonesia yang berupa sejenis sup ayam dengan kuah yang berwarna kekuningan. Warna kuning ini dikarenakan oleh kunyit yang digunakan sebagai bumbu. Soto ayam banyak ditemukan di daerah-daerah di Indonesia dan Singapura.', '2021-09-22 12:53:04', NULL),
(65, 'Kopi Tubruk', '\\upload\\img-1632315328940.jpg', 13000, 10, 'Today', 'Kopi adalah minuman hasil seduhan biji kopi yang telah disangrai dan dihaluskan menjadi bubuk. Kopi merupakan salah satu komoditas di dunia yang dibudidayakan lebih dari 50 negara. Dua spesies pohon kopi yang dikenal secara umum yaitu Kopi Robusta dan Kopi Arabika.', '2021-09-22 12:55:28', NULL),
(66, 'Espresso', '\\upload\\img-1632315446146.jpg', 13000, 10, 'Today', 'Espreso adalah minuman yang dihasilkan dengan mengekstraksi biji kopi yang sudah digiling dengan menyemburkan air panas di bawah tekanan tinggi. Espresso berasal dari Bahasa Italia yang berarti express atau \"cepat\" karena dibuat untuk disajikan dengan segera kepada pelanggan.', '2021-09-22 12:57:26', NULL),
(67, 'Teh Boba ', '\\upload\\1632486847934.jpg', 12000, 10, 'Today', 'Teh susu mutiara atau lebih sering disebut boba adalah sejenis minuman teh susu ditambah dengan \"mutiara\" yang terbuat dari tapioka. Minuman ini berasal dari Taiwan, dan terkenal di Tiongkok, Korea, Filipina, Indonesia, dan juga Eropa, Kanada, dan Amerika Serikat.', '2021-09-24 12:34:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items_transaction`
--

CREATE TABLE `items_transaction` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `variants` varchar(100) DEFAULT NULL,
  `amount` varchar(25) NOT NULL,
  `price` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_transaction` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items_transaction`
--

INSERT INTO `items_transaction` (`id`, `name`, `variants`, `amount`, `price`, `id_item`, `id_transaction`, `created_at`, `updated_at`) VALUES
(1, 'Teh Tarik', NULL, '1', 15000, 44, 19, '2021-07-29 03:49:28', NULL),
(2, 'Kopi Luwak Super ', NULL, '2', 20000, 45, 19, '2021-07-29 03:49:28', NULL),
(3, 'Teh Tarik', NULL, '1', 15000, 44, 20, '2021-07-29 03:49:52', NULL),
(4, 'Kopi Luwak Super ', NULL, '2', 20000, 45, 20, '2021-07-29 03:49:52', NULL),
(5, 'Teh Tarik', NULL, '1', 15000, 44, 21, '2021-09-21 11:33:35', NULL),
(6, 'Kopi Luwak Super ', NULL, '2', 20000, 45, 21, '2021-09-21 11:33:35', NULL),
(7, 'Gayo Cold Brew', NULL, '1', 18000, 57, 22, '2021-09-21 11:34:25', NULL),
(8, 'Robusta Cold Brew', NULL, '2', 18000, 58, 22, '2021-09-21 11:34:25', NULL),
(9, 'Robusta Cold Brew', '1', '1', 18000, 58, 23, '2021-09-21 11:37:28', NULL),
(10, 'Robusta Cold Brew', '2', '1', 18000, 58, 24, '2021-09-21 11:38:51', NULL),
(11, 'Gayo Cold Brew', '2', '1', 18000, 57, 25, '2021-09-21 11:38:51', NULL),
(12, 'Robusta Cold Brew', '1', '1', 18000, 58, 25, '2021-09-21 11:38:51', NULL),
(13, 'Robusta Cold Brew', '1', '1', 18000, 58, 26, '2021-09-22 01:04:40', NULL),
(14, 'Espresso', '1', '1', 13000, 66, 27, '2021-09-22 21:57:07', NULL),
(15, 'Kopi Tubruk', '2', '1', 13000, 65, 28, '2021-09-23 14:30:43', NULL),
(16, 'Espresso', '1', '1', 13000, 66, 28, '2021-09-23 14:30:43', NULL),
(17, 'Teh Boba ', '2', '1', 12000, 67, 29, '2021-09-26 15:02:34', NULL),
(18, 'Espresso', '1', '1', 13000, 66, 30, '2021-11-12 17:44:17', NULL),
(19, 'Espresso', '1', '1', 13000, 66, 31, '2021-11-14 16:51:46', NULL),
(20, 'Espresso', '1', '1', 13000, 66, 32, '2021-11-14 17:07:53', NULL),
(21, 'Espresso', '1', '1', 13000, 66, 33, '2021-11-15 17:55:26', NULL),
(22, 'Espresso', '1', '1', 13000, 66, 34, '2021-11-15 18:01:55', NULL),
(23, 'Espresso', '1', '1', 13000, 66, 35, '2021-11-15 18:06:49', NULL),
(24, 'Kopi Tubruk', '1', '1', 13000, 65, 36, '2021-11-15 18:23:29', NULL),
(25, 'Kopi Tubruk', '1', '1', 13000, 65, 37, '2021-11-16 07:33:20', NULL),
(26, 'Kopi Tubruk', '1', '1', 13000, 65, 38, '2021-11-17 04:11:14', NULL),
(27, 'Espresso', '1', '1', 13000, 66, 38, '2021-11-17 04:11:14', NULL),
(28, 'Espresso', '1', '1', 13000, 66, 39, '2021-11-17 04:16:32', NULL),
(29, 'Soto Ayam', '1', '1', 17000, 64, 40, '2021-11-17 04:16:55', NULL),
(30, 'Kopi Tubruk', '1', '1', 13000, 65, 41, '2021-11-17 04:36:36', NULL),
(31, 'Mie Goreng', '1', '1', 15000, 62, 42, '2021-11-17 04:37:11', NULL),
(32, 'Espresso', '1', '1', 13000, 66, 43, '2021-11-17 04:43:04', NULL),
(33, 'Espresso', '1', '1', 13000, 66, 44, '2021-12-16 02:49:05', NULL),
(34, 'Teh Boba ', '2', '1', 12000, 67, 45, '2021-12-16 05:38:47', NULL),
(35, 'Kopi Tubruk', '1', '1', 13000, 65, 46, '2021-12-16 07:02:52', NULL),
(36, 'Soto Ayam', '1', '1', 17000, 64, 47, '2021-12-16 07:12:10', NULL),
(37, 'Sup Buntut', '1', '1', 28000, 63, 48, '2021-12-16 07:37:46', NULL),
(38, 'Espresso', '1', '1', 13000, 66, 49, '2021-12-16 07:37:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` int(11) NOT NULL,
  `id_item` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`id`, `id_item`, `id_category`, `created_at`, `updated_at`) VALUES
(1, 33, 2, '2021-06-11 13:33:55', NULL),
(2, 33, 1, '2021-06-11 13:33:55', NULL),
(3, 34, 2, '2021-06-11 13:36:01', NULL),
(4, 34, 5, '2021-06-11 13:36:01', NULL),
(5, 39, 3, '2021-06-16 02:03:00', NULL),
(6, 40, 3, '2021-06-16 02:05:06', NULL),
(7, 41, 2, '2021-06-16 02:06:30', NULL),
(8, 41, 5, '2021-06-16 02:06:30', NULL),
(9, 42, 2, '2021-06-16 03:25:11', NULL),
(10, 42, 5, '2021-06-16 03:25:11', NULL),
(11, 43, 2, '2021-06-16 03:25:43', NULL),
(12, 43, 5, '2021-06-16 03:25:43', NULL),
(13, 44, 2, '2021-06-16 03:31:11', NULL),
(14, 45, 2, '2021-06-16 03:34:40', NULL),
(15, 46, 2, '2021-06-16 09:41:14', NULL),
(16, 47, 2, '2021-06-16 23:08:09', NULL),
(17, 48, 2, '2021-07-28 04:03:08', NULL),
(18, 49, 2, '2021-09-02 01:55:51', NULL),
(19, 50, 2, '2021-09-02 01:58:19', NULL),
(20, 51, 2, '2021-09-02 02:24:22', NULL),
(21, 52, 2, '2021-09-15 03:47:46', NULL),
(22, 53, 4, '2021-09-18 23:34:17', NULL),
(23, 54, 4, '2021-09-18 23:35:46', NULL),
(24, 55, 2, '2021-09-19 06:30:24', NULL),
(25, 56, 2, '2021-09-21 03:39:45', NULL),
(26, 57, 2, '2021-09-21 03:48:38', NULL),
(27, 58, 2, '2021-09-21 04:09:02', NULL),
(28, 58, 1, '2021-09-21 04:09:02', NULL),
(29, 59, 2, '2021-09-22 07:12:44', NULL),
(30, 59, 1, '2021-09-22 07:12:44', NULL),
(31, 60, 4, '2021-09-22 12:45:34', NULL),
(32, 60, 1, '2021-09-22 12:45:34', NULL),
(33, 61, 4, '2021-09-22 12:48:03', NULL),
(34, 61, 1, '2021-09-22 12:48:03', NULL),
(35, 62, 4, '2021-09-22 12:49:29', NULL),
(36, 62, 5, '2021-09-22 12:49:29', NULL),
(37, 63, 4, '2021-09-22 12:51:19', NULL),
(38, 63, 5, '2021-09-22 12:51:19', NULL),
(39, 64, 4, '2021-09-22 12:53:04', NULL),
(40, 64, 1, '2021-09-22 12:53:04', NULL),
(41, 65, 2, '2021-09-22 12:55:28', NULL),
(42, 65, 1, '2021-09-22 12:55:28', NULL),
(43, 66, 2, '2021-09-22 12:57:26', NULL),
(44, 66, 1, '2021-09-22 12:57:26', NULL),
(45, 67, 3, '2021-09-24 12:34:07', NULL),
(46, 67, 1, '2021-09-24 12:34:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_variants`
--

CREATE TABLE `item_variants` (
  `id` int(11) NOT NULL,
  `additional_price` int(11) NOT NULL,
  `id_item` int(11) DEFAULT NULL,
  `id_variant` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_variants`
--

INSERT INTO `item_variants` (`id`, `additional_price`, `id_item`, `id_variant`, `created_at`, `updated_at`) VALUES
(1, 0, 33, 1, '2021-06-12 07:16:11', NULL),
(2, 3000, 33, 2, '2021-06-12 07:16:11', NULL),
(3, 5000, 33, 3, '2021-06-12 07:16:27', NULL),
(4, 3000, 45, 2, '2021-06-16 03:34:40', NULL),
(5, 3000, 46, 2, '2021-06-16 09:41:14', NULL),
(6, 3000, 47, 2, '2021-06-16 23:08:10', NULL),
(7, 3000, 48, 2, '2021-07-28 04:03:09', NULL),
(8, 3000, 49, 2, '2021-09-02 01:55:51', NULL),
(9, 3000, 50, 2, '2021-09-02 01:58:19', NULL),
(10, 3000, 51, 2, '2021-09-02 02:24:22', NULL),
(11, 3000, 52, 2, '2021-09-15 03:47:46', NULL),
(12, 3000, 53, 2, '2021-09-18 23:34:17', NULL),
(13, 3000, 54, 2, '2021-09-18 23:35:46', NULL),
(14, 3000, 55, 2, '2021-09-19 06:30:24', NULL),
(15, 0, 58, 1, '2021-09-21 04:09:02', NULL),
(16, 0, 59, 1, '2021-09-22 07:12:44', NULL),
(17, 3000, 59, 2, '2021-09-22 07:12:44', NULL),
(18, 0, 60, 1, '2021-09-22 12:45:34', NULL),
(19, 3000, 61, 2, '2021-09-22 12:48:03', NULL),
(20, 0, 62, 1, '2021-09-22 12:49:29', NULL),
(21, 0, 63, 1, '2021-09-22 12:51:19', NULL),
(22, 0, 64, 1, '2021-09-22 12:53:04', NULL),
(23, 0, 65, 1, '2021-09-22 12:55:28', NULL),
(24, 0, 66, 1, '2021-09-22 12:57:26', NULL),
(25, 3000, 67, 2, '2021-09-24 12:34:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `code_transaction` text DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `shipping_cost` int(11) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `code_transaction`, `id_user`, `total`, `tax`, `payment_method`, `shipping_cost`, `shipping_address`, `created_at`, `updated_at`) VALUES
(14, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:26:07', NULL),
(15, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:27:24', NULL),
(16, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:30:06', NULL),
(17, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:31:22', NULL),
(18, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:41:11', NULL),
(19, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:49:28', NULL),
(20, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:49:52', NULL),
(29, 'CS/2692021/1', 63, 12000, 1200, 'Bank', 10000, 'Palembang-Sumatera Selatan', '2021-09-26 15:02:34', NULL),
(40, 'CS/17112021/1', 75, 28700, 1700, 'Card', 10000, 'Jln Kenangan no 12 Jombang', '2021-11-17 04:16:55', NULL),
(43, 'CS/17112021/1', 77, 24300, 1300, 'Card', 10000, 'Jln kenangan no 12 Jombang', '2021-11-17 04:43:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `images` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `gender`, `phone_number`, `images`, `address`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Rozi', 'hello@gmail.com', '$2b$10$dBuSc1b.KTvED3q50RhJW.8no4wr7/9ak7w/CM3eOGw1AuUnHXAgu', NULL, '081127128767', NULL, NULL, NULL, '2021-06-15 08:06:08', NULL),
(2, 'Admin', 'admin@gmail.com', '$2b$10$y.C/aSWlYLsDX5SMlyCimOxmtVWRY0XK4aXIVzcgt7wODBEDJfdO2', NULL, '089659597621', NULL, 'Jln. Kenangan ', 'admin', '2021-06-15 13:07:42', NULL),
(17, 'Angga', 'admin2@gmail.com', '$2b$10$gUkzW3HPQKmRm7gFIn7Uk.9iUHlsWXKscuGzreOZblJLTD8/t0jPS', NULL, '089659597621', NULL, NULL, NULL, '2021-06-16 09:18:41', '2021-08-20 03:15:38'),
(18, 'Agus', 'mabdipme@gmail.com', '$2b$10$UJFDclzoL9v5mOmNop2B9eWAsfBGvPbJz8c1NS4u/RPx0OpUc8puu', NULL, '089659597621', NULL, NULL, NULL, '2021-07-01 06:02:29', NULL),
(19, 'Nur', 'angga123@gmail.com', '$2b$10$f9Dprv8HsETFaqEsbFNp1eAoJllJeaV0yWDgAUDT.R9ErYPvRQM2O', NULL, '089659597621', NULL, NULL, NULL, '2021-07-12 04:05:02', NULL),
(20, 'Radit', 'ojan@gmail.com', '$2b$10$S6D2sYwoWd5/EuMRNql/6uqNKqWYmPsGj8jvkpiSs.DyDUAvin/Ue', NULL, '081271408776', NULL, NULL, NULL, '2021-08-18 07:11:43', NULL),
(21, 'Angga', 'angga2@gmail.com', '$2b$10$uvR14NVJTs0iABx4bl5yE.8kcQ77VgBNI1qG08l/BEq1emeo2tRXm', NULL, '085609304506', NULL, NULL, NULL, '2021-08-20 03:08:28', '2021-08-20 03:16:33'),
(22, NULL, 'dummy@gmail.com', '$2b$10$ejqeqQpbXpn92U38Lg.Q9.qqHzgaZQbKsCQuFUTi1AKc4OMiXV9zO', NULL, '081288889999', NULL, NULL, NULL, '2021-08-31 15:16:08', NULL),
(23, NULL, 'dummy2@gmail.com', '$2b$10$uw2z2Uyc38woxt3DxhX8nOpXmNoZ4uwVoV0GqfOxlwAgey2hMKc8G', NULL, '081288887777', NULL, NULL, NULL, '2021-08-31 15:27:11', NULL),
(29, NULL, 'dummy3@gmail.com', '$2b$10$FWqlga1UWMMBC/stDnRQ9eETqmE5YFnf7lcwQJvvaM11nH6xRpt7G', NULL, '081211223344', NULL, NULL, NULL, '2021-09-03 06:44:31', NULL),
(39, NULL, 'dummy4@gmail.com', '$2b$10$W3gGMuM4eQ1dzaqeqDZX9.6PSLbFoapJGYPTFEgbdCY5i8Lg9Brwu', NULL, '081211223344', NULL, NULL, NULL, '2021-09-03 07:09:04', NULL),
(43, NULL, 'dummy5@hotmail.com', '$2b$10$mI9WN9A57y1CDddGZ.YjKu5exuMaVvKPVSJ2az8Dkrx4dt32EHBim', NULL, '081211223344', NULL, NULL, NULL, '2021-09-03 07:10:14', NULL),
(48, 'Luffy', 'dummy6@gmail.com', '$2b$10$LDt2dGd3Qrh2UFJv3921zuwxUL7U/6CxNc2heZ9mmerS5/iRNtMea', NULL, '081211223345', NULL, NULL, NULL, '2021-09-03 09:19:33', '2021-09-22 22:19:59'),
(50, 'Abdi Priyangga', 'dummy7@gmail.com', '$2b$10$fIFrnWErgDMar3GL.Cqa2OzHDzkRahHIaFbNuFt2tdbnM8DZb.Nbi', NULL, '081271408776', '/upload/1637047962204.jpg', 'Jombang Jawa-Timur', 'customer', '2021-09-04 06:28:05', '2021-11-16 07:32:42'),
(51, NULL, 'hero@gmail.com', '$2b$10$xHZxJFGuRDZFd5nps9m.w.ejX4LqWCPMOBHsdPM3QJ1mWmJvnCcjG', NULL, '081231228168', NULL, NULL, 'customer', '2021-09-24 09:07:17', NULL),
(52, NULL, 'hero2@gmail.com', '$2b$10$LzI26Je0ihoMni2mQUhi4OEvSzMYpjrxyGasNkWUYExfoh14N3Kd6', NULL, '081221217777', NULL, NULL, 'customer', '2021-09-24 09:13:21', NULL),
(53, NULL, 'heroku@gmail.com', '$2b$10$85o9q9T5/.obzgH.cC36y.H0eyIkUPR0QBXQP/WbP.aqSgYwCJ2xO', NULL, '081233334444', NULL, NULL, 'customer', '2021-09-24 09:16:31', NULL),
(54, NULL, 'zeldris@gmail.com', '$2b$10$bbsKOgfd5RfgxXf2tz3li.ZQeFKK.ftMXpoN8mrrLqPmCUisP4ZGS', NULL, '081272728787', NULL, NULL, 'customer', '2021-09-24 09:17:47', NULL),
(55, NULL, 'zeroto@gmail.com', '$2b$10$Mfmvz7VoYsAJ/VrgyOBcLuNevu7N6x9BZ5dMmM/.lqAb1XsrOVvL2', NULL, '081277889922', NULL, NULL, 'customer', '2021-09-24 09:20:11', NULL),
(56, NULL, 'zeroto2@gmail.com', '$2b$10$pwYgBYvOCuN.YCoXzsoaMOTbgdYUozy7F/efJR.xJu59Z.vS/0u8q', NULL, '081277889933', NULL, NULL, 'customer', '2021-09-24 09:21:02', NULL),
(57, NULL, 'rayzer@gmail.com', '$2b$10$42aiR.OXLOuVVEMeCptRhueZGvzHv5qvNFPR7sLfP/enclN/qsQSK', NULL, '081232345254', NULL, NULL, 'customer', '2021-09-24 09:24:02', NULL),
(58, NULL, 'raye@mail.com', '$2b$10$rVfexFh4DS/uy8ugH6z1y.Z33diY6n4h6uEb0/kj2pbpfsllLCYY6', NULL, '081231318787', NULL, NULL, 'customer', '2021-09-24 22:56:24', NULL),
(59, NULL, 'raye2@mail.com', '$2b$10$UKNsNkzMdLWk9dWsOE2UDOBP2yTP3gJHE97/HcR4f./vTFg9rRv3.', NULL, '081231319090', NULL, NULL, 'customer', '2021-09-24 22:57:40', NULL),
(60, NULL, 'raye4@mail.com', '$2b$10$QnBSzzkTXhEZFum8H2DK2uQt4HAIhWsvmL21ds02WJbvktVPcR/3G', NULL, '081231319091', NULL, NULL, 'customer', '2021-09-24 22:58:47', NULL),
(61, NULL, 'raya2@mail.com', '$2b$10$43PvFM8fjaM.paSJNEHVy.CNh5fo0iTcI.QiQdeYA0wmvTqMLNd5u', NULL, '081299887171', NULL, NULL, 'customer', '2021-09-25 06:46:11', NULL),
(62, NULL, 'joni@mail.com', '$2b$10$wgh/2jK7vpS8DQq8MzsA1O57PETsACYDOJRPcstcfJE5D0fqF9LGO', NULL, '081231323435', NULL, NULL, 'customer', '2021-09-25 06:48:42', NULL),
(63, 'Muhammad Abdi Priyangga', 'abdipriyangga@mail.com', '$2b$10$akiUpkop7GyThNvwxKNYvOdN5xhLfJ1IyIWMdQNv2oXIeKB7rx96q', NULL, '081277889988', '/upload/1632827624010.jpg', 'Palembang-Sumatera Selatan', 'customer', '2021-09-25 06:50:33', '2021-09-28 11:13:44'),
(64, NULL, 'johnson@mail.com', '$2b$10$2VPNnkEW.RMb0gig3x4zMOvwBXphOAufqCE44rYMwN3vXQoDoLOFy', NULL, '', NULL, NULL, 'customer', '2021-10-06 04:23:23', NULL),
(65, NULL, 'lisa@mail.com', '$2b$10$bR7dXpMvM2G6kAlOOyIC9.uCfXsNbQv.tDYpqCJhgVihj4WhKkFhe', NULL, '081274745454', NULL, NULL, 'customer', '2021-10-06 04:32:51', NULL),
(66, NULL, 'lisa1@mail.com', '$2b$10$eyfGpNkreBvIFq9UBY.5ZevkxaSK0JaBFmlgaP1/0ofvNK3YeJXI2', NULL, '081274745656', NULL, NULL, 'customer', '2021-10-06 04:42:56', NULL),
(67, NULL, 'lisa2@mail.com', '$2b$10$EByc1aBli4XLUgMsU5p1EeyBnjsLEKj5RInYrSpP4Qgsuq6jM9HP.', NULL, '081274745858', NULL, NULL, 'customer', '2021-10-06 05:08:05', NULL),
(68, NULL, 'ramsey@mail.com', '$2b$10$aS1IiWTVn9gleAoPNLDIOOd6JVylahPdwQti7inCK4961QJEH8rQW', NULL, '081272727373', NULL, NULL, 'customer', '2021-10-06 06:22:43', NULL),
(69, NULL, 'harukaze@gmail.com', '$2b$10$EAkjCWOXfdNGN/bNb7RFlelxfdJpeKm5lIqlu5OBDZ1GqqPjG0xnO', NULL, '089611223344', NULL, NULL, 'customer', '2021-11-16 07:49:23', NULL),
(70, NULL, 'Tole@gmail.com', '$2b$10$tLLjeM4rFdaqMG5F17RhHeUQYwNXhYMPROLtVquxlUgZbhUowfQSW', NULL, '081274415547', NULL, NULL, 'customer', '2021-11-16 13:13:46', NULL),
(71, NULL, 'John@gmail.com', '$2b$10$yOSZr6mfZI4Gj.j43vaZf.fPSiYr4e4DWcR7W.YMJNUaejJ6HxFW2', NULL, '089612124747', NULL, NULL, 'customer', '2021-11-17 02:21:27', NULL),
(72, 'Abdi Priyangga', 'Dummy10@gmail.com', '$2b$10$7WAW2DfOZOBC8maNiOcTL.nDIfv4FbeMwgyDsAmByeNxA5q6T/l3m', NULL, '085674721514', '/upload/1639635701406.jpg', 'Jombang', 'customer', '2021-11-17 02:32:31', '2021-12-16 06:21:41'),
(73, NULL, 'Cena@gmail.com', '$2b$10$Hv5TPpSWZGA/uATpy7ZbyeTUzBshlxvikYKfCr6.nZqARa0gJi0..', NULL, '081274588569', NULL, NULL, 'customer', '2021-11-17 04:06:31', NULL),
(74, 'Reynard Been', 'Reynard@gmail.com', '$2b$10$vdPcB/1Lq0ReKLh80ZTbWeR/5VoMPBmRXOiNYrolgr5EJMymStEbC', 'Male', '085623655890', '/upload/1637122223397.jpg', 'Jln Kenangan no 99 Jombang', 'customer', '2021-11-17 04:08:48', '2021-11-17 04:10:23'),
(75, 'Jono Joni', 'jono@gmail.com', '$2b$10$z.CL5EtEAeDMTXh5cxDiIOU1f9LgH3QsIcQO/4cCJN0UX1nStsRVC', 'Male', '081232345453', '/upload/1637122563968.jpg', 'Jln Kenangan no 12 Jombang', 'customer', '2021-11-17 04:14:25', '2021-11-17 04:16:04'),
(76, NULL, 'Ellena@gmail.com', '$2b$10$jSt0NDjFRobnamcL0acEQe.GYtUUPR.1LmauwYJgpKvHMKrTdRFTe', NULL, '085621235856', NULL, NULL, 'customer', '2021-11-17 04:31:30', NULL),
(77, 'Resa Rose', 'Resa@gmail.com', '$2b$10$XDtiqxI5WB9MnevvES7Ll.BXmQyhZYL0Rs35a4TwO827F8ydvwEva', 'Female', '082147454854', '/upload/1637123743547.jpg', 'Jln kenangan no 12 Jombang', 'customer', '2021-11-17 04:34:06', '2021-11-17 04:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Regular', 'R', '2021-05-28 02:47:22', NULL),
(2, 'Large', 'L', '2021-05-28 02:47:57', NULL),
(3, 'Extra Large', 'XL', '2021-05-28 02:47:57', NULL),
(5, 'Super Nendang Abis', 'SNA', '2021-09-06 03:51:52', '2021-09-06 04:43:07'),
(10, 'Double Extra Large', 'XXL', '2021-09-06 03:55:31', NULL),
(11, 'Double Extra Large', 'XXL', '2021-09-06 03:56:41', NULL),
(12, 'Double Extra Large', 'XXL', '2021-09-06 03:57:10', NULL),
(16, 'Double Extra Large Gede', 'XXXLL', '2021-09-06 04:29:55', '2021-09-06 04:39:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_transaction`
--
ALTER TABLE `items_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_variants`
--
ALTER TABLE `item_variants`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `items_transaction`
--
ALTER TABLE `items_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `item_variants`
--
ALTER TABLE `item_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
