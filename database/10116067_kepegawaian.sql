-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2021 at 11:17 PM
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
-- Database: `10116067_kepegawaian`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPegawai` ()  select p.id_pegawai, p.nama, p.alamat, d.divisi
												  from pegawai p, divisi d
												  where p.id_divisi = d.id_divisi$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` int(11) NOT NULL,
  `divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `divisi`) VALUES
(1, 'operasional'),
(2, 'logistik'),
(3, 'Tukang delman'),
(4, 'dasdd');

-- --------------------------------------------------------

--
-- Table structure for table `log_pegawai`
--

CREATE TABLE `log_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(50) CHARACTER SET latin1 NOT NULL,
  `alamat` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_divisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_pegawai`
--

INSERT INTO `log_pegawai` (`id_pegawai`, `nama`, `alamat`, `id_divisi`) VALUES
(8, 'dadang', 'dipatiukur', 3),
(9, 'dadang', 'dipatiukur', 1),
(10, 'dadang', 'dipatiukur', 3),
(11, 'dadang', 'dipatiukur', 4),
(12, 'toto', 'zimbabwe', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `id_divisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama`, `alamat`, `id_divisi`) VALUES
(16, 'dadang', 'dipatiukur', 4),
(17, 'toto', 'zimbabwe', 1);

--
-- Triggers `pegawai`
--
DELIMITER $$
CREATE TRIGGER `trigger_pegawai` AFTER INSERT ON `pegawai` FOR EACH ROW insert into log_pegawai VALUES(null,NEW.nama,new.alamat,new.id_divisi)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_pegawai_update` AFTER UPDATE ON `pegawai` FOR EACH ROW insert into log_pegawai VALUES(null,NEW.nama,new.alamat,new.id_divisi)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `user`, `pass`, `level`) VALUES
(1, 'admin', '12345', 'admin'),
(2, 'kholiq', '4444', 'user'),
(3, 'taufik', '7777', 'user'),
(4, 'arinku', 'cantiknyo', 'user'),
(6, 'intani', 'pelitaku', 'user'),
(13, 'dodo', '11111', 'user'),
(14, 'dodo', '11111', 'user'),
(16, 'toto', '11111', 'admin'),
(17, 'toto', '1111', 'admin'),
(81, 'dddd', 'dddd', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indexes for table `log_pegawai`
--
ALTER TABLE `log_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `log_pegawai`
--
ALTER TABLE `log_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
