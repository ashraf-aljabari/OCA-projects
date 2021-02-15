-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2021 at 09:56 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project6`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(20) NOT NULL,
  `admin_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`) VALUES
(7, 'admin@example.com', '123456', 'ashraf'),
(8, 'superAdmin@example.com', '123456', 'admin'),
(18, 'hala@gmail.com', '123', 'Hala');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_image`) VALUES
(38, 'Labtops', 'dell-inspiron-13-5391-laptop-sil_1_4_1_1.jpg'),
(39, 'Mobiles', 'xiaomi-mi-a3-128gb-dual-sim-white.png'),
(41, 'TV', 'tv.png'),
(42, 'Tablets', 'pic_TabS6_lite_Grey3_020520140523_ll.jpg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_product_quantity` int(11) NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `order_total` decimal(10,2) NOT NULL,
  `order_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_product_quantity`, `order_date`, `order_total`, `order_address`) VALUES
(1, 4, 0, '2021-02-06', '97.52', ''),
(2, 4, 0, '2021-02-06', '495.00', ''),
(3, 4, 0, '2021-02-08', '495.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`orders_products_id`, `product_id`, `order_id`, `user_id`) VALUES
(1, 43, 2, 4),
(2, 44, 3, 4),
(3, 43, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_desc` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `discount_per` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `sub_cat_id`, `product_name`, `product_price`, `product_desc`, `type`, `discount_per`) VALUES
(41, 29, 'LG 86 inch 4K smart TV', '800.00', 'True Cinema Experience, Ultra Surround, Low Input Lag, and α7 Gen3 AI Processor 4K.', 'normal', 20),
(42, 29, 'LG UHD 4K TV 65 Inch', '600.00', 'UN80 Series, Cinema Screen Design 4K Active HDR WebOS Smart AI ThinQ', 'featuredproduct', 0),
(43, 29, 'LG UHD TV 58 inch', '550.00', 'UM7340 Series IPS 4K Display 4K Active HDR Smart LED TV w/ ThinQ AI', 'hotproduct', 10),
(44, 30, 'SAMSUNG 55 inch QLED', '1199.00', 'SAMSUNG TELEVISION BLACK QLED SMART', 'featuredproduct', 0),
(45, 30, 'SAMSUNG 58 inch SMART 4K', '550.00', 'SAMSUNG TELEVISION BLACK 4K SMART', 'hotproduct', 25),
(46, 36, 'iPhone 11 PRO 256GB Silver', '900.00', 'Color: Silver, Warranty 1 Year, Memory 256GB, Screen Size 5.8 (inch) ', 'featuredproduct', 22),
(48, 39, 'HUAWEI Mediapad', '189.00', 'HUAWEI TABLETS SPACE GRAY 4G', 'hotproduct', 2),
(49, 39, 'Huawei MatePad T10 WiFi', '106.00', 'Huawei MatePad T10 WiFi 2GB 16GB 9.7', 'featuredproduct', 8),
(50, 42, 'Lenovo Tab X606X - 4G', '479.00', 'Lenovo Tab X606X - 4G, Warranty 1 Year', 'hotproduct', 4),
(51, 42, 'Lenovo Tab -7305f Wifi', '179.00', 'Lenovo Tab -7305f Wifi, color: black, Warranty 1 Year, Battery 3500 MAh', 'normal', 3),
(52, 40, 'Huawei MateBook D 15.6\"', '122.00', 'Huawei MateBook D 15.6, Memory 256GB SSD + 1TB HDD, Memory RAM 8GB', 'hotproduct', 0),
(53, 40, 'Huawei MateBook X 2020', '1300.00', 'Memory 512GB SSD, LCD Display13” 2K IPS with 90% Screen-to-body-ration & Touch Screen', 'featuredproduct', 10),
(54, 41, 'LENOVO Laptop', '619.00', 'LENOVO LAPTOPS BLACK Core i7 1 TB HDD 8 GB RAM', 'hotproduct', 8),
(55, 41, 'LENOVO Laptop 4 GB RAM', '400.00', 'Lenovo ideapad 130 Corei3-8130U 4 GB 1TB', 'hotproduct', 2),
(56, 38, 'Huawei Nova 7 5G', '350.00', 'Android 10, EMUI 10.1, no Google Play Services', 'hotproduct', 6),
(57, 38, 'HUAWEI P40', '500.00', 'Silver Frost, Blush Gold, Deep Sea Blue, Ice White, Black', 'normal', 10),
(58, 43, 'APPLE iPad 7', '300.00', 'APPLE iPad 7 (10.2\",3GB RAM,32GB,8MP) Gray', 'normal', 20),
(59, 43, 'APPLE iPad 8TH', '400.00', 'APPLE iPad 8TH Gen (10.2\",3GB RAM,32GB,WiFi) Space Gray', 'featuredproduct', 10),
(60, 37, 'SONY TV', '1999.00', 'SONY TV (65 Inch, LED-UHD, 4K, Smart)', 'normal', 0),
(61, 37, 'SONY TV 50 inch', '900.00', 'SONY TV(50 inch, LED, FHD SMART)', 'normal', 20),
(62, 32, 'Apple MacBook', '1200.00', 'Apple MacBook Pro 2020, Apple M1(8GB, 256GB, 13 inch, Touch Bar) Space Grey', 'featuredproduct', 5),
(63, 32, 'Apple MacBook Pro 2020', '1400.00', 'Apple MacBook Pro 2020, Apple M1(8GB, 512GB, 13 inch, Touch Bar) Space Grey', 'hotproduct', 10),
(64, 35, 'HP Pavilion Gaming 144Hz', '1249.00', 'HP Gaming Pavilion 16-a0014ne 10Gen Intel Core i7 up to 5.0GHz  6-Cores 12M Cache,  16GB DDR4 , 256GB PCIe® NVMe™ M.2 SSD + 1TB HDD ,  Nvidia RTX 2060 6GB DDR6  , 16.1\" FHD 144 Hz IPS 300 nits , Camera , Wireless , Bluetooth , Windows 10 Notebook', 'hotproduct', 0),
(65, 35, 'OMEN by HP 10Gen Core i7', '1769.00', 'HP OMEN 15-dh1003ne 10Gen Intel Core i7 up to 5.0GHz 12M Cache 6-Cores , 32GB DDR4 , 1TB SSD PCIe® NVMe™ M.2 SSD , Nvidia RTX 2070 SUPER 8GB , 15.6\" FHD 300 Hz IPS anti-glare,  Windows 10 Notebook (Black)', 'normal', 0),
(66, 35, 'OMEN by HP NEW (2020) 300Hz', '1499.00', 'HP OMEN 15-ek0003ne 10Gen Intel Core i7 up to 5.0GHz 12M Cache 6 -Cores ,  32GB DDR4 ,  1TB NVMe™ M.2 SSD ,  Nvidia RTX 2060 6GB DDR6  , 15.6\" IPS FHD 300 nits 100% sRGB  ,  Camera , Wireless , Bluetooth, Windows 10 Notebook (Black) , 1 Year Warranty', 'hotproduct', 90);

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

CREATE TABLE `products_images` (
  `image_id` int(11) NOT NULL,
  `image_name` varchar(500) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_images`
--

INSERT INTO `products_images` (`image_id`, `image_name`, `product_id`) VALUES
(38, '50-inch-smart-4k-led-tv-500x500.jpeg', 41),
(39, '6401777cv13d.jpg', 41),
(40, 'c8af71d1-05b4-453e-b195-00b88db0d164_1.33f395c67347a5f749a9ca6a32222cdb.jpeg', 41),
(41, 'Ua039b0b3a841417090fe9697de4940ed1.jpg_q50.jpg', 41),
(42, 'GUEST_d96d7570-f487-4271-aea6-e79177a47a7d.jfif', 42),
(44, 'lg-65-inch-4k-uhd-hdr-smart-led-tv-65sk8000pua-pakistan-priceoye-4nzka.jpg', 42),
(45, '6b27e5b1-5dd3-407c-ae00-b34a501f2a60.3f46d934ed39a4486a80eaf4e9602328.png', 43),
(46, 'a0bfa64ce04da07da2d11ae08eaa0007.jpg', 43),
(47, 's-l640.jpg', 43),
(48, 'uf680t_2_result_1.jpg', 43),
(49, 'Samsung_65_Q95T.png', 44),
(52, '8796718235678.jfif', 44),
(53, 'images.jfif', 44),
(54, 'download.jfif', 44),
(55, '1549898185_1455651.jpg', 45),
(56, '8796751855646.jfif', 45),
(57, 'images.jfif', 45),
(58, '8796576481310.jfif', 46),
(59, 'apple_iphone_11_pro_max_64gb_dual_sim_space_gray_-_non_pta_compliant.jpg', 46),
(60, 'iPhone-11-Pro-silver-back.png', 46),
(61, 'mwc82ba_1.jpg', 46),
(62, 'mwhd2ba_1.jpg', 46),
(68, '51BDUikrYxL._AC_SL1024_.jpg', 48),
(69, '8796716564510.jfif', 48),
(70, 'huawei_mediapad_t_8_deep_sea_blue_03_ad_l__17935.1602494751.webp', 48),
(71, 'Huawei-MediaPad-T3-7-Tablet-1-1.jpg', 48),
(72, 'Screen_Shot_2019_10_31_at_2.03.04_PM.jfif', 48),
(73, '428_428_8E3386A5FC85B5BFB801F0DD8165042536EB7230C62E0B15.png', 49),
(74, '428_428_09EE1B3E7020AAB941C234F3EEA331CAE637CD28A050B347.png', 49),
(75, 'Case-For-Huawei-MediaPad-T1-10-PU-Protective-Smart-cover-Leather-Tablet-Sleeve-Case-Note-9.webp', 49),
(76, 'huawei_matepad_t10_10_2gb_32gb_wifi_azul_09_ad_l.jpg', 49),
(77, 'HUO0823ST0009.jpg', 49),
(78, '61VlmrTM6wL._SL1500_.jpg', 50),
(79, '194552945978_media_3_480Wx480H.jfif', 50),
(80, '195042521665.jpg', 50),
(81, '8801528348702.jfif', 50),
(82, 'lenovo-tab-m10-hd-tb-x306x-10-1-32gb-lte-gris.jpg', 50),
(83, '61VlmrTM6wL._SL1500_.jpg', 51),
(84, '81Xjef5HFZL._SL1500_.jpg', 51),
(85, '8801527693342.jfif', 51),
(86, '53010UAJ_g2.jpg', 52),
(87, 'huawei-matebook-d15.jpg', 52),
(88, 'huawei-matebook-d-laptop-16gb-256gb-grey-1574132600597.jpg', 52),
(89, 'huawei-matebook-x-pro-laptop-8gb-256gb-silver-1574132595498._w500_.jpg', 52),
(90, 'HUO0803ST0004.jpg', 52),
(91, '51XMAo9vzHL._AC_SS350_.jpg', 53),
(92, 'HUO0803ST0006.jpg', 53),
(93, 'matebook-xpro.jpg', 53),
(94, 'res_918cf99099b824ea5a19f952625c9077.webp', 53),
(95, '41PSh7XotvL._AC_SS350_.jpg', 54),
(96, '8797071081502.jfif', 54),
(97, 'E490-1200x1200.jpg', 54),
(98, 'lenovo-ideapad-flex-5-14-i5-8gb-512gb-ssd-d-202012010938107_9827477w.jpg', 54),
(99, 'lenovo-thinkpad-e490.jpg', 54),
(100, '41PSh7XotvL._AC_SS350_.jpg', 55),
(101, '8797071081502.jfif', 55),
(102, 'E490-1200x1200.jpg', 55),
(103, 'lenovo-ideapad-flex-5-14-i5-8gb-512gb-ssd-d-202012010938107_9827477w.jpg', 55),
(104, 'lenovo-thinkpad-e490.jpg', 55),
(105, '428_428_F52C677F047D45E4E7955A22EE68BE1D9B53DFCF106F1F63.jpg', 56),
(106, '8797599465502.jfif', 56),
(107, 'huawei_nova_7_5g_1_.jpg', 56),
(108, 'Huawei-nova-7-5G.jpg', 56),
(109, 'Huawei-NOVA-7-5G-256GB-Midsummer-Purple.jfif', 56),
(110, 'Huawei-Nova-7-5G-giant-600x600.jpg', 56),
(111, '643be119ef2b097f4d48a0700adb0f57.jpg', 57),
(112, '8796711387166.jfif', 57),
(113, 'Huawei-P40-Lite-5G.jpg', 57),
(114, 'huawei-p40-lite-dual-sim-en-verde-de-128gb-y-6gb-ram.jpg', 57),
(115, 'huawei-p40-pro-plus-black.jpg', 57),
(116, 'protector_tg_huawei_p40_pro_01_transparente_l.jpg', 57),
(117, '605348_917146_01_front_zoom.jpg', 58),
(118, '612225_994509_01_front_zoom.jpg', 58),
(119, 'apple-ipad-7th-gen.jpg', 58),
(120, 'HN0A2_AV4.jfif', 58),
(121, 'HNTD2.jfif', 58),
(122, '4de1b526324b642ed2876976889c46f11fd57906_square2978026_1.jpg', 59),
(123, 'acmyl92lla.jpg', 59),
(124, 'MPU92_AV2.jfif', 59),
(125, 'MXTF2_AV2.jfif', 59),
(126, 'Screenshot_2020-12-23_233823__58420.1608759532.webp', 59),
(127, '7330e6d37c178d8930475bcc68628ca3.webp', 60),
(128, 'd553a22107969f70107c7c417f979a7d.webp', 60),
(129, 'images.jfif', 60),
(130, 'KD65A8H_6.png', 60),
(131, 'Screenshot_2021-01-07_112308__29348.1610011430.webp', 60),
(132, '7330e6d37c178d8930475bcc68628ca3.webp', 61),
(133, 'd553a22107969f70107c7c417f979a7d.webp', 61),
(134, 'images.jfif', 61),
(135, 'KD65A8H_6.png', 61),
(136, 'Screenshot_2021-01-07_112308__29348.1610011430.webp', 61),
(137, 'Apple_MacBook_Pro_16_inch_Space_Gray_1000_0002.jpg', 62),
(138, 'MVVJ2BA_apple_macbookpro16_06.jpg', 62),
(139, 'MXK32BA_1_Supersize.jpg', 62),
(140, 'refurb-mbp16touch-space-gallery-2019_AV2.jfif', 62),
(141, '1605032111_1604825.jpg', 63),
(142, 'apple-macbook-air-m1-2020-8gb-256gb-mgn63-c4phpl.jpg', 63),
(143, 'images.jfif', 63),
(144, 'imageService.jfif', 63),
(145, '0014-1200x1200.jpg', 64),
(146, '00141-1200x1200.jpg', 64),
(147, 'PAV162-1200x1200.jpg', 64),
(148, 'PAV163-1200x1200.jpg', 64),
(155, 'OMN1-1200x1200.jpg', 66),
(156, 'OMN2-1200x1200 (1).jpg', 66),
(157, 'OMN3-1200x1200.jpg', 66),
(158, 'OMN-650x400.png', 66),
(159, '15dh-1200x1200.jpg', 65),
(160, 'omnsup1-1200x1200.jpg', 65),
(161, 'imageService.jpg', 42);

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `review` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_review`
--

INSERT INTO `product_review` (`review_id`, `product_id`, `user_id`, `user_name`, `review`, `timestamp`) VALUES
(7, 41, 4, 'Ashraf', 'nice screen!', '2021-02-06 13:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `sub_cat`
--

CREATE TABLE `sub_cat` (
  `sub_cat_id` int(11) NOT NULL,
  `sub_cat_name` varchar(50) NOT NULL,
  `sub_cat_image` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_cat`
--

INSERT INTO `sub_cat` (`sub_cat_id`, `sub_cat_name`, `sub_cat_image`, `category_id`) VALUES
(29, 'LG TV', 'lg-vector-logo.png', 41),
(30, 'Samsung TV', 'samsung-group-vector-logo.png', 41),
(32, 'Apple laptops', '40db0f8dbf844d9f265fb64f025c08db.jpg', 38),
(35, 'HP Laptops', 'hp-logo-vector-download.jpg', 38),
(36, 'Apple mobiles', '40db0f8dbf844d9f265fb64f025c08db.jpg', 39),
(37, 'Sony TV', 'top-og.jpg', 41),
(38, 'Huawei mobiles', 'e1gkwldo.png', 39),
(39, 'Huawei Tablets', 'e1gkwldo.png', 42),
(40, 'Huawei Laptops', 'e1gkwldo.png', 38),
(41, 'Lenovo Laptops', 'lenovo-226431.webp', 38),
(42, 'Lenovo Tablets', 'lenovo-226431.webp', 42),
(43, 'Apple Tablets', '40db0f8dbf844d9f265fb64f025c08db.jpg', 42);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_image` varchar(255) NOT NULL DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_name`, `user_password`, `user_image`) VALUES
(4, 'ashraf@gmail.com', 'Ashraf Al jabari', '123456', 'ashrafpic.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wish_list`
--

CREATE TABLE `wish_list` (
  `wish_list_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wish_list`
--

INSERT INTO `wish_list` (`wish_list_id`, `user_id`, `product_id`) VALUES
(4, 4, 42),
(5, 4, 46);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_email` (`admin_email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`orders_products_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `sub_cat_id` (`sub_cat_id`);

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sub_cat`
--
ALTER TABLE `sub_cat`
  ADD PRIMARY KEY (`sub_cat_id`),
  ADD UNIQUE KEY `sub_cat_name` (`sub_cat_name`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD PRIMARY KEY (`wish_list_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `orders_products_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sub_cat`
--
ALTER TABLE `sub_cat`
  MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wish_list`
--
ALTER TABLE `wish_list`
  MODIFY `wish_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD CONSTRAINT `orders_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orders_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `orders_products_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sub_cat_id`) REFERENCES `sub_cat` (`sub_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_images`
--
ALTER TABLE `products_images`
  ADD CONSTRAINT `products_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_review`
--
ALTER TABLE `product_review`
  ADD CONSTRAINT `product_review_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_cat`
--
ALTER TABLE `sub_cat`
  ADD CONSTRAINT `sub_cat_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD CONSTRAINT `wish_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wish_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
