-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Mar 2023 pada 05.33
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_member`
--

CREATE TABLE `tb_member` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tlp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_member`
--

INSERT INTO `tb_member` (`id`, `nama`, `alamat`, `jenis_kelamin`, `tlp`) VALUES
(1, 'dika', 'pasar dimensi', '', '08925382324'),
(3, 'iqbal', 'jln bunisari', 'L', ''),
(4, 'edwin', 'cimahi', 'L', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_outlet`
--

INSERT INTO `tb_outlet` (`id`, `nama`, `alamat`, `tlp`) VALUES
(1, 'outlet 1', 'cipageran 2', '08296926332'),
(3, 'outlet 2', 'jln.cibeber', '0937649246'),
(4, 'outlet 3', 'cimahi', '08456785525'),
(6, 'outlet 4', 'bandung', '08247036534'),
(8, 'outlet 5', 'gangbungsu', '093047927480');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `jenis` enum('kiloan','selimut','bed_cover','kaos','lain') NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_paket`
--

INSERT INTO `tb_paket` (`id`, `id_outlet`, `jenis`, `nama_paket`, `harga`) VALUES
(5, 1, 'kiloan', 'kiloan', 5000),
(7, 4, 'bed_cover', 'bed cover', 7000),
(8, 6, 'kaos', 'kameja', 5000),
(9, 3, 'bed_cover', 'bed cover', 6000),
(10, 8, 'kaos', 'kaos', 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `kode_invoice` varchar(100) NOT NULL,
  `id_member` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `batas_waktu` datetime NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `biaya_tambahan` int(11) NOT NULL,
  `diskon` double NOT NULL,
  `pajak` int(11) NOT NULL,
  `status` enum('baru','proses','selesai','diambil') NOT NULL,
  `dibayar` enum('dibayar','belum_dibayar') NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` double NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `id_outlet`, `kode_invoice`, `id_member`, `tgl`, `batas_waktu`, `tgl_bayar`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `dibayar`, `id_user`, `id_paket`, `qty`, `keterangan`) VALUES
(2, 3, 'L001', 3, '2023-03-07 00:00:00', '2023-03-09 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 'baru', 'belum_dibayar', 7, 5, 4, 'cuci bersih'),
(3, 3, 'L002', 1, '2023-03-09 00:00:00', '2023-03-09 00:00:00', '2023-03-15 00:00:00', 0, 0, 0, '', 'dibayar', 7, 10, 4, 'bersih');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `role` enum('admin','kasir','owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `id_outlet`, `role`) VALUES
(7, '', 'ziyyan', '$2y$10$EqrHgsdvqY99DWEtxo08rOo.XbYOaq6a141t3RDWfUVKHERcgcema', 3, 'admin'),
(9, 'edwin', 'edwin', '$2y$10$yfz12Q.Q10Lh/R6bK66zdOAH7rOSoIpJJc8VuA4U9GERPhICw5dBi', 3, 'kasir'),
(10, 'ziy', 'ziy', '$2y$10$.a67Ik/BrH3resFRplw7EO5.TvdvZYTVG3b5/Mrsp5hO/n5/W4V/u', 1, 'owner'),
(11, 'andika', 'andika', '$2y$10$9ZPJLQBH6ecx7CH/NdEXqe0Lu4v5mdILDfluBHcsNdtavBNVkNkbi', 4, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_member` (`id_member`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD CONSTRAINT `tb_paket_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`),
  ADD CONSTRAINT `tb_transaksi_ibfk_3` FOREIGN KEY (`id_member`) REFERENCES `tb_member` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
