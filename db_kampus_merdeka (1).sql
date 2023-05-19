-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Bulan Mei 2023 pada 06.55
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kampus_merdeka`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `channel` enum('OVO','GOPAY','DANA','VA BCA') NOT NULL,
  `service_fee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `billing`
--

INSERT INTO `billing` (`id`, `order_id`, `channel`, `service_fee`) VALUES
(1, 1, 'OVO', '1000.00'),
(2, 2, 'GOPAY', '0.00'),
(3, 3, 'DANA', '0.00'),
(4, 4, 'VA BCA', '1500.00'),
(5, 5, 'VA BCA', '1500.00'),
(6, 6, 'VA BCA', '1500.00'),
(10, 7, 'OVO', '1000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `created_at`) VALUES
(1, 'Siswo', 'Handoko', 'handoko@eduwork.com', '089687476161', 'JL. RE Martadinata Kav III No 322A Desa Ancaran, Kecamatan Kuningan Kab Kuningan', '2023-03-31 11:58:55'),
(2, 'Muhammad', 'Ridwan', 'ridwan@eduwork.com', '089687476262', 'Jl Margorejo Indah Bl B/107Margorejo,Surabaya,Winocolo,,Indonesia', '2023-03-31 11:58:55'),
(3, 'Christine', 'Hermelina', 'christine@eduwork.com', '089687476363', 'Wisma Gading Permai Menara A 3 Dki Jakarta,Jakarta,Dki Jakarta,14240,Indonesia', '2023-03-31 11:58:55'),
(4, 'Atika', 'Citra1', 'atika@eduwork.com', '089687476464', 'JL Perak Barat No. 22560165,Surabaya,,22560,Indonesia', '2023-03-31 11:58:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` enum('pending','processing','shipped','delivered') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`id`, `customer_id`, `order_date`, `status`) VALUES
(1, 1, '2023-03-27 19:06:33', 'processing'),
(2, 1, '2023-03-30 19:06:33', 'delivered'),
(3, 2, '2023-03-31 19:06:33', 'shipped'),
(4, 3, '2023-03-22 19:06:33', 'processing'),
(5, 4, '2023-03-12 19:06:33', 'pending'),
(6, 4, '2023-03-31 19:06:33', 'shipped');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `qty`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 1),
(4, 3, 4, 2),
(5, 4, 2, 1),
(6, 4, 1, 2),
(7, 5, 1, 3),
(8, 6, 2, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `kategori` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `kategori`) VALUES
(1, 'Permen Yupi', '1000.00', 'Makanan'),
(2, 'Susu SGM', '50000.00', 'Makanan'),
(3, 'Sepatu Nike', '300000.00', 'Pakaian'),
(4, 'Jaket Puma', '250000.00', 'Pakaian'),
(5, 'Tas LV', '1000000.00', 'Pakaian');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indeks untuk tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_customer` (`customer_id`);

--
-- Indeks untuk tabel `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_order` (`order_id`),
  ADD KEY `fk_id_product` (`product_id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_id_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `fk_id_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
