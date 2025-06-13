-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2025 at 10:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiketlangit`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id_book` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_trip` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id_book`, `id_user`, `id_trip`, `subtotal`, `quantity`) VALUES
(1, 1, 1, 25000000, 1),
(2, 2, 2, 40000000, 2),
(3, 3, 3, 30000000, 1),
(4, 4, 4, 54000000, 2),
(5, 5, 5, 120000000, 3),
(6, 6, 6, 75000000, 5),
(7, 7, 7, 180000000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `destination`
--

CREATE TABLE `destination` (
  `id_dest` int(11) NOT NULL,
  `id_trip` int(11) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destination`
--

INSERT INTO `destination` (`id_dest`, `id_trip`, `lokasi`) VALUES
(1, 1, 'Kjerag'),
(2, 1, 'Geirangerfjord'),
(3, 1, 'Trolitunga'),
(4, 1, 'Lofoten'),
(5, 1, 'Preikestoien'),
(6, 2, 'Saritorini'),
(7, 2, 'Elafonissi Beach'),
(8, 2, 'Mellassini Cave'),
(9, 2, 'Spinalonga Beach'),
(10, 2, 'Museum Acropolis'),
(11, 3, 'Katedral Koin'),
(12, 3, 'Hoistentor'),
(13, 3, 'Bradenburg Gate'),
(14, 3, 'Kastil Neuschwanstein'),
(15, 3, 'Gedung Reichstag'),
(16, 4, 'Universal Studio Jepang'),
(17, 4, 'Tokoy Tower'),
(18, 4, 'Shibuya Crossing Tokoy'),
(19, 4, 'Mount Fuji'),
(20, 4, 'Disney Sea Tokoy'),
(21, 5, 'Statue of Liberty'),
(22, 5, 'Brooklyn Botanic Garden'),
(23, 5, 'Pelham Bay Park'),
(24, 5, 'Central Park'),
(25, 5, 'Broadway'),
(26, 6, 'Parco delle Cave'),
(27, 6, 'Giardini della Guastalla'),
(28, 6, 'Catedral Milano'),
(29, 6, 'Sforzesco Castle'),
(30, 6, 'Plazza del Duomo'),
(31, 7, 'Capel Bridge'),
(32, 7, 'Zurich'),
(33, 7, 'Matterhorn'),
(34, 7, 'Schynigr Platte'),
(35, 7, 'St. Maritz');

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `id_trip` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `date_dep` date NOT NULL,
  `date_arr` date NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`id_trip`, `country`, `date_dep`, `date_arr`, `price`, `description`) VALUES
(1, 'Norwegia', '2025-07-01', '2025-07-05', 25000000, 'Jelajahi Norwegia yang penuh dengan keindahan Lautnya'),
(2, 'Yunani', '2025-09-15', '2025-09-20', 20000000, 'Santorini sunset magic! Elafonissi beach, Museum Acropollis, Mellassini Cave & Spinalonga Beach!'),
(3, 'Germany', '2025-11-25', '2025-11-30', 30000000, 'Wisata German Negara yang kaya akan sejarah, teknologi, dan budaya'),
(4, 'Jepang', '2025-01-04', '2025-01-09', 27000000, 'Kontras sempurna antara tradisi kuno dan teknologi ultra-modern di Negeri Sakura'),
(5, 'New York', '2025-03-17', '2025-03-22', 40000000, 'Petualangan di New York dengan Patung Statue of Liberti yang mencuri Pandang dan Tata Kota yang sangat menarik.'),
(6, 'Milan', '2025-08-08', '2025-08-13', 15000000, 'Eksplorasi Bangunan Gereja yang sangat Unik dan perpaduan alam yang sangat Indah'),
(7, 'Swiss', '2025-12-25', '2025-12-30', 45000000, 'Musim panas dipenghujung Tahun ketika suhu udara dan laut hangat, sempurna untuk bermain');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`) VALUES
(1, 'Abdee', 'de123', 'Abde@tiketlagit.com'),
(2, 'Aji', 'ji123', 'Aji@tiketlagit.com'),
(3, 'Mutiara', 'ara123', 'Mutiara@tiketlagit.com'),
(4, 'Loisa', 'loi123', 'Loisa@tiketlagit.com'),
(5, 'Natasya', 'nata123', 'Natasya@tiketlagit.com'),
(6, 'Siti', 'sit123', 'Siti@tiketlagit.com'),
(7, 'Budi', 'di123', 'Budi@tiketlagit.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_trip` (`id_trip`);

--
-- Indexes for table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`id_dest`),
  ADD KEY `id_trip` (`id_trip`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id_trip`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `destination`
--
ALTER TABLE `destination`
  MODIFY `id_dest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `id_trip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`id_trip`) REFERENCES `trip` (`id_trip`);

--
-- Constraints for table `destination`
--
ALTER TABLE `destination`
  ADD CONSTRAINT `destination_ibfk_1` FOREIGN KEY (`id_trip`) REFERENCES `trip` (`id_trip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
