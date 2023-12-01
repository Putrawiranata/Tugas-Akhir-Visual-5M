-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Des 2023 pada 09.33
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penyewaan_alatcamping`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `id_account` int(30) NOT NULL,
  `nik` int(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` enum('Laki-laki','Perempuan','','') NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `no_telp` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `account`
--

INSERT INTO `account` (`id_account`, `nik`, `nama`, `jk`, `username`, `password`, `no_telp`, `email`) VALUES
(3, 1232546, 'Cristiano Ronaldo', 'Laki-laki', 'Ronaldo', 'CR7', '0895473482', 'ronaldo7@gmail.com'),
(4, 5689032, 'Selena Gomez', 'Perempuan', 'Selena', 'Selgomez72', '0833456731', 'selmez42@gmail.com'),
(5, 1232540, 'Budi Utomo', 'Laki-laki', 'Budi', 'Budtomo14', '0895473345', 'budtomo7@gmail.com'),
(6, 1232345, 'Muhammad Rafi\'i', 'Laki-laki', 'Arul', 'Rulkun2', '0815678123', 'rlkunlwin17@gmail.com'),
(7, 1223457, 'Victoria Aprilia', 'Perempuan', 'Lia', 'victroialia1', '0815678756', 'aprilia87@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(30) NOT NULL,
  `nm_barang` varchar(50) NOT NULL,
  `harga_sewa` varchar(30) NOT NULL,
  `stok_barang` varchar(30) NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `ket_gambar` varchar(50) NOT NULL,
  `update_gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nm_barang`, `harga_sewa`, `stok_barang`, `gambar`, `ket_gambar`, `update_gambar`) VALUES
(2, 'Matras EIGER ', '10.000', '8', 'Matras EIGER', 'Matras EIGER ORI', 'Matras EIGER'),
(3, 'Gas Kaleng', '10.000', '10', 'Gas Portable isi ulang', 'Gas Kaleng isi ulang', 'Gas Kaleng'),
(4, 'Kompor Gas Portable', '20.000', '3', 'Kompor Gas Portable', 'Kompor Gas Mawar Portable', 'Kompor Gas Portable'),
(5, 'Tenda EIGER 4P', '55.000', '4', 'Tenda EIGER 4P', 'Tenda EIGER muatan 4 orang', 'Tenda EIGER 4P'),
(6, 'Kursi Lipat', '10.000', '6', 'Kursi Lipat Portable', 'Kursi Lipat Portable', 'Kursi Lipat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tgl_peminjaman` varchar(20) NOT NULL,
  `tgl_pengembalian` varchar(20) NOT NULL,
  `jumlah_pinjam` varchar(30) NOT NULL,
  `total_barang` varchar(30) NOT NULL,
  `denda` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `username`, `tgl_peminjaman`, `tgl_pengembalian`, `jumlah_pinjam`, `total_barang`, `denda`) VALUES
(2, 'Ronaldo', '2 Desember 2023', '4 Desember 2023', '2', '50.000', '10.000'),
(3, 'Brozovic', '2 Desember 2023', '4 Desember 2023', '2', '35.000', '5.000'),
(4, 'Otavio', '2 Desember 2023', '4 Desember 2023', '2', '25.000', '10.000'),
(5, 'Fofana', '2 Desember 2023', '4 Desember 2023', '1', '25.000', '10.000'),
(6, 'Talisca', '2 Desember 2023', '4 Desember 2023', '4', '140.000', '20.000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perpanjangan`
--

CREATE TABLE `perpanjangan` (
  `biaya_perpanjangan` int(30) NOT NULL,
  `perpanjangan_brg` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `perpanjangan`
--

INSERT INTO `perpanjangan` (`biaya_perpanjangan`, `perpanjangan_brg`) VALUES
(5000, 3),
(15000, 3),
(20000, 3),
(25000, 3),
(30000, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(30) NOT NULL,
  `req_account` varchar(50) NOT NULL,
  `edit_account` varchar(50) NOT NULL,
  `req_peminjaman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `req_account`, `edit_account`, `req_peminjaman`) VALUES
(8, 'Arul', 'Arulkun', 'Tenda REY 4P'),
(9, 'Herlambang', 'Lambang', 'Gas Portable'),
(10, 'Budi', 'Budi Utomo', 'Matras'),
(11, 'Bara Teguh', 'Bara', 'Kursi Lipat'),
(12, 'Bayu', 'Bayu Kunto Aji', 'Frame Tenda');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_account`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- Indeks untuk tabel `perpanjangan`
--
ALTER TABLE `perpanjangan`
  ADD PRIMARY KEY (`biaya_perpanjangan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `id_account` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_pinjam` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `perpanjangan`
--
ALTER TABLE `perpanjangan`
  MODIFY `biaya_perpanjangan` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30002;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
