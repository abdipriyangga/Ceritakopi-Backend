-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 04, 2021 at 03:14 AM
-- Server version: 10.3.29-MariaDB-0+deb10u1
-- PHP Version: 7.3.29-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b22_coffee_shop`
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
(4, 'Food', '2021-05-28 02:46:02', '2021-06-11 13:40:53'),
(5, 'Add on', '2021-06-11 02:37:54', '2021-06-11 13:41:13');

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
(2, 'Susu Soda', NULL, 13000, 0, NULL, 'Minuman yang dibuat dengan sepenuh hati menggunakan susu kualitas terbaik.', '2021-05-30 18:57:25', NULL),
(3, 'Teh Tarik', NULL, 18000, 0, NULL, 'Minuman yang dibuat dengan teknikmenarik menggunakan teh kualitas terbaik.', '2021-05-30 21:38:16', NULL),
(4, 'Cold Brew', NULL, 15000, 0, NULL, 'Cold brew coffee merupakan sebutan untuk sebuah teknik penyeduhan dari bubuk kopi hitam dengan menggunakan air yang dingin dalam kurun waktu 12 hingga 24 jam. Bubuk kopi direndam di air dingin kemudian sehabis didiamkan lalu disaring dengan alat khusus seperti cold drip.', '2021-05-30 21:40:12', NULL),
(5, 'Espresso', NULL, 14000, 0, NULL, 'Espreso adalah minuman yang dihasilkan dengan mengekstraksi biji kopi yang sudah digiling dengan menyemburkan air panas di bawah tekanan tinggi.', '2021-05-30 21:41:17', NULL),
(6, 'Drumstick Chicken Wings', NULL, 30000, 0, NULL, 'ocok dijadikan ide bekal si kecil nih bunda, sebagai camilan atau lauk juga bisa, anak2 pasti suka deh. Bisa stok di freezer bunda, goreng setengah matang (asal layu aja) dulu setelah dingin baru simpan freezer goreng jika mau dihidangkan.', '2021-05-30 21:43:59', NULL),
(7, 'Special Fried Rice', NULL, 25000, 0, NULL, 'Nasi Goreng spesial dengan lauik yang terdiri dari telur, suwiran ayam, potogan sosis.', '2021-05-30 21:46:01', NULL),
(8, 'Ubi Goreng', NULL, 18000, 0, NULL, 'Ubi yang ditanam sendiri tentu memiliki rasa yang tiada tara', '2021-05-30 21:47:21', NULL),
(9, 'Lemon Soda', NULL, 22000, 0, NULL, 'Lemon Soda minuman yang menyegarkan karena dibuat dengan lemon kualitas terbaik.', '2021-05-31 03:25:49', NULL),
(10, 'Matcha Latte', NULL, 25000, 0, NULL, 'Minuman matcha yang memiliki latte dengan kualitas bagus.', '2021-06-02 00:55:14', NULL),
(11, 'Coffee Latte', NULL, 25000, 0, NULL, 'Minuman kopi yang memiliki latte dengan kualitas bagus.', '2021-06-02 00:55:52', NULL),
(12, 'Lemon Tea', NULL, 20000, 0, NULL, 'Minuman teh yang dicampur dengan lemon', '2021-06-02 02:49:34', NULL),
(13, 'Beef Steak', NULL, 35000, 0, NULL, 'Makanan steak dagiing dengan kualitas dan rasa yang enak', '2021-06-02 02:50:48', NULL),
(14, 'Fried Rice Seafood', NULL, 25000, 0, NULL, 'Makanan nasi goreng dengan campuran seafood kualitas dan rasa yang enak', '2021-06-02 02:51:58', NULL),
(15, 'Chcken Katsu Moza', NULL, 40000, 0, NULL, 'Ayam dengan mozarella meleleh dimulut', '2021-06-02 02:54:30', NULL),
(16, 'French Fries', NULL, 15000, 0, NULL, 'Kentang goreng pilihan yang sangat enak', '2021-06-02 02:57:51', NULL),
(18, 'Pasta Caramel Moza', NULL, 45000, 0, NULL, 'Pasta yang enak dan berkualitas', '2021-06-03 19:37:42', NULL),
(19, 'Affogato', NULL, 25000, 10, 'Monday to me', 'Minuman perpaduan kopi dan ice cream', '2021-06-04 18:55:48', NULL),
(33, 'Strawberry Milk Shake', NULL, 30000, 10, 'Monday to me', 'Minuman susu strawberry kocok', '2021-06-11 13:33:55', NULL),
(34, 'Chocolate Milk Shake', NULL, 30000, 10, 'Monday to me', 'Minuman susu strawberry kocok', '2021-06-11 13:36:01', NULL),
(40, 'Teh Tarik', '/upload/img-1623809106120.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 02:05:06', NULL),
(41, 'Teh Tarik', '/upload/img-1623809190290.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 02:06:30', NULL),
(42, 'Teh Tarik', '/upload/img-1623813911680.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 03:25:11', NULL),
(43, 'Teh Tarik', '/upload/img-1623813943016.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 03:25:43', NULL),
(44, 'Teh Tarik', '/upload/img-1623814271662.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 03:31:11', NULL),
(45, 'Kopi Luwak Super ', '/upload/img-1623814480863.png', 20000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 03:34:40', '2021-06-16 09:22:23'),
(46, 'Teh Tarik Ku', NULL, 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 09:41:14', NULL),
(47, 'Teh Tarik Ku', '/upload/img-1623884889888.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-06-16 23:08:09', NULL),
(48, 'Teh Tarik Ku', '/upload/img-1627444988835.png', 15000, 10, 'Today', 'teh tarik yang ditarik--tarik', '2021-07-28 04:03:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items_transaction`
--

CREATE TABLE `items_transaction` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
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

INSERT INTO `items_transaction` (`id`, `name`, `amount`, `price`, `id_item`, `id_transaction`, `created_at`, `updated_at`) VALUES
(1, 'Teh Tarik', '1', 15000, 44, 19, '2021-07-29 03:49:28', NULL),
(2, 'Kopi Luwak Super ', '2', 20000, 45, 19, '2021-07-29 03:49:28', NULL),
(3, 'Teh Tarik', '1', 15000, 44, 20, '2021-07-29 03:49:52', NULL),
(4, 'Kopi Luwak Super ', '2', 20000, 45, 20, '2021-07-29 03:49:52', NULL);

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
(17, 48, 2, '2021-07-28 04:03:08', NULL);

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
(7, 3000, 48, 2, '2021-07-28 04:03:09', NULL);

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
(1, 'CS/1662021/1', 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:33:18', NULL),
(2, 'CS/1662021/1', 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:33:33', NULL),
(3, 'CS/1662021/1', 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:34:14', NULL),
(4, 'CS/1662021/1', 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:35:00', NULL),
(5, NULL, 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:37:14', NULL),
(6, NULL, 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:40:07', NULL),
(7, NULL, 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:42:01', NULL),
(8, NULL, 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:45:16', NULL),
(9, NULL, 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:46:00', NULL),
(10, NULL, 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:49:39', NULL),
(11, NULL, 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:50:20', NULL),
(12, NULL, 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:51:18', NULL),
(13, 'CS/1662021/1', 2, 55000, 5500, 'Bank', 10000, 'Jln. Kenangan ', '2021-06-16 08:53:16', NULL),
(14, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:26:07', NULL),
(15, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:27:24', NULL),
(16, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:30:06', NULL),
(17, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:31:22', NULL),
(18, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:41:11', NULL),
(19, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:49:28', NULL),
(20, 'CS/2972021/1', 17, 55000, 5500, 'Bank', 10000, NULL, '2021-07-29 03:49:52', NULL);

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
(1, NULL, 'hello@gmail.com', '$2b$10$dBuSc1b.KTvED3q50RhJW.8no4wr7/9ak7w/CM3eOGw1AuUnHXAgu', NULL, '081127128767', NULL, NULL, NULL, '2021-06-15 08:06:08', NULL),
(2, NULL, 'admin@gmail.com', '$2b$10$y.C/aSWlYLsDX5SMlyCimOxmtVWRY0XK4aXIVzcgt7wODBEDJfdO2', NULL, '089659597621', NULL, 'Jln. Kenangan ', NULL, '2021-06-15 13:07:42', NULL),
(17, NULL, 'admin2@gmail.com', '$2b$10$gUkzW3HPQKmRm7gFIn7Uk.9iUHlsWXKscuGzreOZblJLTD8/t0jPS', NULL, '089659597621', NULL, NULL, NULL, '2021-06-16 09:18:41', NULL),
(18, NULL, 'mabdipme@gmail.com', '$2b$10$UJFDclzoL9v5mOmNop2B9eWAsfBGvPbJz8c1NS4u/RPx0OpUc8puu', NULL, '089659597621', NULL, NULL, NULL, '2021-07-01 06:02:29', NULL),
(19, NULL, 'angga123@gmail.com', '$2b$10$f9Dprv8HsETFaqEsbFNp1eAoJllJeaV0yWDgAUDT.R9ErYPvRQM2O', NULL, '089659597621', NULL, NULL, NULL, '2021-07-12 04:05:02', NULL);

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
(3, 'Extra Large', 'XL', '2021-05-28 02:47:57', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `items_transaction`
--
ALTER TABLE `items_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `item_variants`
--
ALTER TABLE `item_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
