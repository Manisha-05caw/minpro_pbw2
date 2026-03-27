-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 25, 2026 at 07:31 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portofolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengalaman`
--

CREATE TABLE `pengalaman` (
  `id` int NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `posisi` varchar(100) NOT NULL,
  `tempat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengalaman`
--

INSERT INTO `pengalaman` (`id`, `tahun`, `posisi`, `tempat`) VALUES
(1, 'Februari 2026', 'Peserta Bootcamp - Predikat Expert', 'Intensive Bootcamp 2 Weeks Microsoft Excel oleh Karirnex'),
(2, 'Februari 2026', 'Peserta Kelas', 'Belajar Penerapan Data Science dengan Microsoft Fabric - Dicoding Indonesia'),
(3, 'April 2025', 'Peserta Kegiatan', 'Kopirista KMK oleh Keluarga Mahasiswa Katolik St. Tarsisius Universitas Mulawarman');

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `id` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tagline` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `bio` text NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`id`, `nama`, `tagline`, `deskripsi`, `bio`, `foto`) VALUES
(1, 'Syawe Manisha P. Siregar', 'Mahasiswa Sistem Informasi', 'Haloooo Saya mahasiswa Sistem Informasi yang sedang belajar hal baru seputar teknologi dan desain website.', 'Saya pernah menggunakan tools seperti Figma dan Canva untuk membuat desain sederhana.', 'assets/foto.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat`
--

CREATE TABLE `sertifikat` (
  `id` int NOT NULL,
  `judul` varchar(150) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `deskripsi` text NOT NULL,
  `file_url` varchar(200) DEFAULT 'assets/bootcamp.jpeg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sertifikat`
--

INSERT INTO `sertifikat` (`id`, `judul`, `penerbit`, `tahun`, `deskripsi`, `file_url`) VALUES
(1, 'Intensive Bootcamp 2 Weeks - Microsoft Excel', 'Karirnex by PT Ebiz Karisma Internasional', '2026', 'Menyelesaikan bootcamp intensif Microsoft Excel selama 2 minggu dengan predikat Expert.', 'assets/bootcamp.jpeg'),
(2, 'Belajar Penerapan Data Science dengan Microsoft Fabric', 'Dicoding Indonesia', '2026', 'Lulus kelas Data Science menggunakan Microsoft Fabric pada Dicoding Academy.', 'assets/dicoding.png'),
(3, 'Sertifikat Peserta Kopirista KMK', 'KMK St. Tarsisius Universitas Mulawarman', '2025', 'Berpartisipasi dalam kegiatan Kopirista KMK yang diselenggarakan oleh Departemen Kewirausahaan KMK UNMUL.', 'assets/kopiria.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int NOT NULL,
  `nama_skill` varchar(100) NOT NULL,
  `level` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `nama_skill`, `level`) VALUES
(1, 'Microsoft Office (Word, Excel, PowerPoint)', 85),
(2, 'Figma (UI Design Dasar)', 35),
(3, 'HTML & CSS', 30),
(4, 'Canva (Desain Konten)', 65),
(5, 'Pemrograman Dasar (Python / Java)', 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengalaman`
--
ALTER TABLE `pengalaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengalaman`
--
ALTER TABLE `pengalaman`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sertifikat`
--
ALTER TABLE `sertifikat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
