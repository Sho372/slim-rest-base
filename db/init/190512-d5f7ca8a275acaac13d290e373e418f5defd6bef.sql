-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: 2019 年 5 月 12 日 01:44
-- サーバのバージョン： 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wholesale`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `bundles`
--

CREATE TABLE `bundles` (
  `id` int(10) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `memo` varchar(5000) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `bundles_categories`
--

CREATE TABLE `bundles_categories` (
  `id` int(11) NOT NULL,
  `bundle_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `bundles_exports`
--

CREATE TABLE `bundles_exports` (
  `bundle_id` int(11) NOT NULL,
  `export_ponumber` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `bundles_grades`
--

CREATE TABLE `bundles_grades` (
  `id` int(11) NOT NULL,
  `bundle_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `bundles_m3`
--

CREATE TABLE `bundles_m3` (
  `bundle_id` int(11) NOT NULL,
  `m3` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `bundles_shapes`
--

CREATE TABLE `bundles_shapes` (
  `id` int(11) NOT NULL,
  `bundle_id` int(11) NOT NULL,
  `shape_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `bundles_size`
--

CREATE TABLE `bundles_size` (
  `id` int(11) NOT NULL,
  `bundle_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `eng` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`id`, `name`, `eng`) VALUES
(1, 'SPF', 'SPF'),
(2, 'ポンデロサパイン', 'PP');

-- --------------------------------------------------------

--
-- テーブルの構造 `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) CHARACTER SET utf8 NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `eng` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `grades`
--

INSERT INTO `grades` (`id`, `name`, `eng`) VALUES
(1, 'J Grade', 'J GRADE'),
(2, 'No.1', '#1'),
(3, 'なし', 'none');

-- --------------------------------------------------------

--
-- テーブルの構造 `operation_histories`
--

CREATE TABLE `operation_histories` (
  `id` int(11) NOT NULL,
  `bundle_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `user_id` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `places`
--

INSERT INTO `places` (`id`, `name`) VALUES
(1, 'バンクーバー'),
(2, '横浜');

-- --------------------------------------------------------

--
-- テーブルの構造 `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `purchase_ponumber` varchar(200) CHARACTER SET utf8 NOT NULL,
  `tag_number` varchar(100) CHARACTER SET utf8 NOT NULL,
  `purchase_date` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `bundle_id` int(11) NOT NULL,
  `company_name` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `memo` varchar(5000) CHARACTER SET utf8 NOT NULL,
  `reservation_date` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `sales`
--

CREATE TABLE `sales` (
  `bundle_id` int(11) NOT NULL,
  `sale_ponumber` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `sale_company_name` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `state_id` int(11) NOT NULL,
  `sale_memo` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `sale_date` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `shapes`
--

CREATE TABLE `shapes` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `eng` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `shapes`
--

INSERT INTO `shapes` (`id`, `name`, `eng`) VALUES
(1, 'T&G（さね加工）', 'T&G'),
(2, 'フローリング', 'FLOORING');

-- --------------------------------------------------------

--
-- テーブルの構造 `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `size`
--

INSERT INTO `size` (`id`, `name`) VALUES
(1, '1x2'),
(2, '6/4x10');

-- --------------------------------------------------------

--
-- テーブルの構造 `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, '入荷'),
(2, '出荷'),
(3, '卸販売'),
(4, '直売'),
(5, 'コンサイメント'),
(6, 'お取置き');

-- --------------------------------------------------------

--
-- テーブルの構造 `stocks`
--

CREATE TABLE `stocks` (
  `bundle_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'test', 'test', '$2y$10$8cyq4/ZCuu/06ExgZTHCZ.qkbJMIOX9.jdLhKXE6lTb3HnLIQqj8S');

-- --------------------------------------------------------

--
-- テーブルの構造 `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `vendors`
--

INSERT INTO `vendors` (`id`, `name`) VALUES
(1, 'INTEREX'),
(2, 'KERMODE'),
(3, 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bundles`
--
ALTER TABLE `bundles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bundles_categories`
--
ALTER TABLE `bundles_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bundles_exports`
--
ALTER TABLE `bundles_exports`
  ADD UNIQUE KEY `bundle_id` (`bundle_id`);

--
-- Indexes for table `bundles_grades`
--
ALTER TABLE `bundles_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bundles_m3`
--
ALTER TABLE `bundles_m3`
  ADD UNIQUE KEY `bundle_id` (`bundle_id`);

--
-- Indexes for table `bundles_shapes`
--
ALTER TABLE `bundles_shapes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `bundles_size`
--
ALTER TABLE `bundles_size`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `operation_histories`
--
ALTER TABLE `operation_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`bundle_id`);

--
-- Indexes for table `shapes`
--
ALTER TABLE `shapes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`bundle_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bundles`
--
ALTER TABLE `bundles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bundles_categories`
--
ALTER TABLE `bundles_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `bundles_grades`
--
ALTER TABLE `bundles_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `bundles_shapes`
--
ALTER TABLE `bundles_shapes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bundles_size`
--
ALTER TABLE `bundles_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `operation_histories`
--
ALTER TABLE `operation_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
