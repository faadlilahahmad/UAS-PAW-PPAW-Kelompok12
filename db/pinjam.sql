-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2021 at 12:32 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pinjam`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(4) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(12) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `alamat`, `telp`, `username`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', 'Karawang', '08123456789', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_supir` int(11) NOT NULL,
  `jasa_supir` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `id_jenis` int(4) NOT NULL,
  `no_fasilitas` varchar(10) NOT NULL,
  `alamat_fasilitas` varchar(100) NOT NULL,
  `nama_fasilitas` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `harga` int(7) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `id_jenis`, `no_fasilitas`, `alamat_fasilitas`, `nama_fasilitas`, `gambar`, `harga`, `status`) VALUES
(1, 1, 'ambulance1', 'Jl. Raya Klari No.38', 'Ambulance', '1.jpg', 500000, '0'),
(3, 2, 'Lapangan1', 'Jl. Puri Tlk. Jambe No.21', 'Lapangan Bola', '2.jpg', 510000, '0'),
(6, 2, 'Lapangan2', 'Jl. Puri Tlk. Jambe No.21, Telukjambe', 'Lapangan Basket Peruri', '3.jpg', 650000, '0'),
(7, 3, 'Aula1', 'Jl. Kertabumi No.42', 'Aula Peruri', '4.jpg', 700000, '0'),
(11, 1, 'mobil2', 'Serpong, Tangerang Selatan Kota', 'Honda Accord', '19122021173735.jpg', 300000, '1'),
(12, 1, 'mobil1', 'Soekarno Hatta, Jawa Barat', 'Honda CR-V', '19122021174146.jpg', 200000, '1'),
(13, 1, 'mobil3', 'Depok, Jawa Barat', 'Mazda MAZDA2 GT SKYACTIVE', '19122021175326.jpg', 220000, '1'),
(14, 3, 'aula2', 'Sukolilo, Surabaya 60111, Indonesia', 'Aula Prof. Handayani Tjandrasa', '19122021180049.jpg', 1000000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(4) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama`) VALUES
(1, 'Kendaraan'),
(2, 'Lapangan'),
(3, 'Aula');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id_konfirmasi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `bukti` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`id_konfirmasi`, `id_transaksi`, `bukti`) VALUES
(2, 2, '219122021170309.png'),
(3, 3, '219122021203706.png'),
(4, 5, '219122021214626.png');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `no_ktp` char(16) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_telp` char(12) NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `no_ktp`, `nama`, `email`, `no_telp`, `alamat`, `username`, `password`) VALUES
(2, '3215003300500000', 'Faadlilah Ahmad Purwanto', 'pfaadlilahahmad@gmail.com', '082122451607', 'SIRNABAYA INDAH BLOK.C4/01, RT/RW 001/005, Kel/Des', 'faadlilah', '202cb962ac59075b964b07152d234b70'),
(3, '3215003300500000', 'Faadlilah Ahmad', 'tuanfadli64@gmail.com', '082122451607', 'SIRNABAYA INDAH BLOK.C4/01, RT/RW 001/005, Kel/Des', 'faadlilah8', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `supir`
--

CREATE TABLE `supir` (
  `id_supir` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `telp` char(12) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supir`
--

INSERT INTO `supir` (`id_supir`, `nama`, `telp`, `alamat`, `status`) VALUES
(1, 'Rendi', '081551155115', 'Ngawi', '1');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_fasilitas` int(11) NOT NULL,
  `tgl_sewa` datetime NOT NULL,
  `tgl_ambil` datetime DEFAULT NULL,
  `tgl_kembali` datetime DEFAULT NULL,
  `lama` tinyint(1) NOT NULL,
  `total_harga` int(7) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `jaminan` varchar(30) NOT NULL,
  `denda` int(7) DEFAULT 0,
  `jatuh_tempo` datetime NOT NULL,
  `konfirmasi` enum('0','1') DEFAULT NULL,
  `pembatalan` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_fasilitas`, `tgl_sewa`, `tgl_ambil`, `tgl_kembali`, `lama`, `total_harga`, `status`, `jaminan`, `denda`, `jatuh_tempo`, `konfirmasi`, `pembatalan`) VALUES
(2, 2, 7, '2021-12-19 16:45:57', '2021-12-09 16:45:57', '2021-12-19 21:00:00', 1, 700000, '1', 'Sertifikat Rumah', 7700000, '2021-12-19 19:45:57', '1', '0'),
(3, 2, 6, '2021-12-19 16:50:26', '2022-12-12 16:50:26', NULL, 2, 1300000, '0', 'STNK', NULL, '2021-12-19 19:50:26', '1', '0'),
(4, 2, 6, '2021-12-19 20:36:34', '2021-07-18 20:36:34', NULL, 2, 1300000, '0', 'Sertifikat Rumah', NULL, '2021-12-19 23:36:34', '0', '0'),
(5, 2, 1, '2021-12-19 21:41:35', '2021-10-04 21:41:35', NULL, 3, 1500000, '0', 'Sertifikat Rumah', NULL, '2021-12-20 00:41:35', '1', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `fk_transaksi` (`id_transaksi`),
  ADD KEY `fk_supir` (`id_supir`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`),
  ADD KEY `fk_jenis` (`id_jenis`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id_konfirmasi`),
  ADD KEY `fk_transaksi` (`id_transaksi`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`id_supir`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_pelanggan` (`id_pelanggan`),
  ADD KEY `fk_fasilitas` (`id_fasilitas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id_fasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id_konfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supir`
--
ALTER TABLE `supir`
  MODIFY `id_supir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_3` FOREIGN KEY (`id_supir`) REFERENCES `supir` (`id_supir`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD CONSTRAINT `fasilitas_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `jenis` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `konfirmasi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_fasilitas`) REFERENCES `fasilitas` (`id_fasilitas`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
