-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2021 at 12:20 PM
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
(40, 'Teh Tarik', '/upload/img-1623809106120.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 02:05:06', NULL),
(42, 'Teh Tarik', '/upload/img-1623813911680.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 03:25:11', NULL),
(43, 'Teh Tarik', '/upload/img-1623813943016.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 03:25:43', NULL),
(44, 'Teh Tarik', '/upload/img-1623814271662.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 03:31:11', NULL),
(45, 'Kopi Luwak Super ', '/upload/img-1623814480863.png', 20000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 03:34:40', '2021-06-16 09:22:23'),
(46, 'Teh Tarik Ku', NULL, 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 09:41:14', NULL),
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
(66, 'Espresso', '\\upload\\img-1632315446146.jpg', 13000, 10, 'Today', 'Espreso adalah minuman yang dihasilkan dengan mengekstraksi biji kopi yang sudah digiling dengan menyemburkan air panas di bawah tekanan tinggi. Espresso berasal dari Bahasa Italia yang berarti express atau \"cepat\" karena dibuat untuk disajikan dengan segera kepada pelanggan.', '2021-09-22 12:57:26', NULL);

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
(16, 'Espresso', '1', '1', 13000, 66, 28, '2021-09-23 14:30:43', NULL);

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
(44, 66, 1, '2021-09-22 12:57:26', NULL);

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
(24, 0, 66, 1, '2021-09-22 12:57:26', NULL);

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
(13, 'CS/1662021/1', 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:53:16', NULL),
(14, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:26:07', NULL),
(15, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:27:24', NULL),
(16, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:30:06', NULL),
(17, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:31:22', NULL),
(18, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:41:11', NULL),
(19, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:49:28', NULL),
(20, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:49:52', NULL),
(21, 'CS/2192021/1', 50, 55000, 5500, 'Bank', 10000, NULL, '2021-09-21 11:33:35', NULL),
(22, 'CS/2192021/1', 50, 54000, 5400, 'Bank', 10000, NULL, '2021-09-21 11:34:25', NULL),
(23, 'CS/2192021/1', 50, 18000, 1800, 'Bank', 10000, NULL, '2021-09-21 11:37:28', NULL),
(24, 'CS/2192021/1', 50, 18000, 1800, 'Bank', 10000, NULL, '2021-09-21 11:38:51', NULL),
(25, 'CS/2192021/1', 50, 36000, 3600, 'Bank', 10000, NULL, '2021-09-21 11:38:51', NULL),
(26, 'CS/2292021/1', 50, 18000, 1800, 'Bank', 10000, NULL, '2021-09-22 01:04:40', NULL),
(27, 'CS/2392021/1', 50, 13000, 1300, 'Bank', 10000, NULL, '2021-09-22 21:57:07', NULL),
(28, 'CS/2392021/1', 50, 26000, 2600, 'Bank', 10000, 'Komplek. Yaktapena 1 NO 1220 RT/RW 23/07 Kel. 14 Ulu Kec. Seberang Ulu 2 Palembang', '2021-09-23 14:30:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_gender` int(10) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `name`, `email`, `password`, `id_gender`, `phone_number`, `images`, `address`, `role`, `created_at`, `updated_at`) VALUES
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
(50, 'Samase Ryu', 'dummy7@gmail.com', '$2b$10$fIFrnWErgDMar3GL.Cqa2OzHDzkRahHIaFbNuFt2tdbnM8DZb.Nbi', NULL, '081277887788', NULL, 'Palembang-Sumatera Selatan', 'customer', '2021-09-04 06:28:05', '2021-09-24 07:10:19'),
(51, NULL, 'hero@gmail.com', '$2b$10$xHZxJFGuRDZFd5nps9m.w.ejX4LqWCPMOBHsdPM3QJ1mWmJvnCcjG', NULL, '081231228168', NULL, NULL, 'customer', '2021-09-24 09:07:17', NULL),
(52, NULL, 'hero2@gmail.com', '$2b$10$LzI26Je0ihoMni2mQUhi4OEvSzMYpjrxyGasNkWUYExfoh14N3Kd6', NULL, '081221217777', NULL, NULL, 'customer', '2021-09-24 09:13:21', NULL),
(53, NULL, 'heroku@gmail.com', '$2b$10$85o9q9T5/.obzgH.cC36y.H0eyIkUPR0QBXQP/WbP.aqSgYwCJ2xO', NULL, '081233334444', NULL, NULL, 'customer', '2021-09-24 09:16:31', NULL),
(54, NULL, 'zeldris@gmail.com', '$2b$10$bbsKOgfd5RfgxXf2tz3li.ZQeFKK.ftMXpoN8mrrLqPmCUisP4ZGS', NULL, '081272728787', NULL, NULL, 'customer', '2021-09-24 09:17:47', NULL),
(55, NULL, 'zeroto@gmail.com', '$2b$10$Mfmvz7VoYsAJ/VrgyOBcLuNevu7N6x9BZ5dMmM/.lqAb1XsrOVvL2', NULL, '081277889922', NULL, NULL, 'customer', '2021-09-24 09:20:11', NULL),
(56, NULL, 'zeroto2@gmail.com', '$2b$10$pwYgBYvOCuN.YCoXzsoaMOTbgdYUozy7F/efJR.xJu59Z.vS/0u8q', NULL, '081277889933', NULL, NULL, 'customer', '2021-09-24 09:21:02', NULL),
(57, NULL, 'rayzer@gmail.com', '$2b$10$42aiR.OXLOuVVEMeCptRhueZGvzHv5qvNFPR7sLfP/enclN/qsQSK', NULL, '081232345254', NULL, NULL, 'customer', '2021-09-24 09:24:02', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `items_transaction`
--
ALTER TABLE `items_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `item_variants`
--
ALTER TABLE `item_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
