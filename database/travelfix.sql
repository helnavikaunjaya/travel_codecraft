-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Okt 2026 pada 07.40
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `destinasi`
--

CREATE TABLE `destinasi` (
  `id_destinasi` char(5) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `destinasi`
--

INSERT INTO `destinasi` (`id_destinasi`, `tujuan`, `deskripsi`) VALUES
('D01', 'Bali', 'Pulau Dewata dengan pantai Kuta, pura Uluwatu, dan matahari terbenam di Tanah Lot.'),
('D02', 'Yogyakarta', 'Kota budaya dengan Candi Prambanan, Keraton, dan Malioboro.'),
('D03', 'Raja Ampat', 'Surganya wisata bawah laut di ujung timur Indonesia.'),
('D04', 'Bromo', 'Sunrise legendaris dari Bukit Penanjakan dan lautan pasir luas.'),
('D05', 'Dieng', 'Dataran tinggi berkabut dengan Telaga Warna dan Candi Arjuna.'),
('D06', 'Borobudur', 'Candi Buddha terbesar di dunia, warisan dunia UNESCO.'),
('D07', 'Komodo', 'Pulau habitat kadal purba di Taman Nasional Komodo, Flores.'),
('D08', 'Bunaken', 'Taman laut dengan terumbu karang terbaik di Sulawesi Utara.'),
('D09', 'Toba', 'Danau vulkanik terbesar di Asia Tenggara dengan Pulau Samosir.'),
('D10', 'Bandung', 'Kota kembang dengan wisata alam Lembang dan kuliner khas.'),
('D11', 'Semarang', 'Kota Lama bersejarah dengan Lawang Seketu dan Sam Poo Kong.'),
('D12', 'Malang', 'Kota apel sejuk dengan Jatim Park dan agrowisata Batu.'),
('D13', 'Lombok', 'Pantai Kuta yang masih asri dan pendakian Gunung Rinjani.'),
('D14', 'Banyuwangi', 'Blue Fire Ijen dan Sabuk Pantai terpanjang di Jawa.'),
('D15', 'Solo', 'Kota Batik dengan Keraton Surakarta dan Pasar Klewer.'),
('D16', 'Bogor', 'Kota hujan dengan Kebun Raya dan Istana Bogor.'),
('D17', 'Karimunjawa', 'Kepulauan taman laut nasional di utara Jepara.'),
('D18', 'Belitung', 'Pantai pasir putih berbatu granit seperti di Lengkuas.'),
('D19', 'Toraja', 'Budaya Tongkonan dan ritual pemakaman unik di Sulawesi Selatan.'),
('D20', 'Baluran', 'Afrika kecil di Jawa Timur, padang savana Bekol.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` char(10) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_destinasi` char(5) NOT NULL,
  `id_supir` char(5) NOT NULL,
  `id_kendaraan` char(5) NOT NULL,
  `tanggal_berangkat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_user`, `id_destinasi`, `id_supir`, `id_kendaraan`, `tanggal_berangkat`) VALUES
('J0001', 1, 'D01', 'S01', 'K01', '2026-11-10'),
('J0002', 2, 'D02', 'S02', 'K02', '2026-11-11'),
('J0003', 3, 'D03', 'S03', 'K03', '2026-11-12'),
('J0004', 4, 'D04', 'S04', 'K04', '2026-11-13'),
('J0005', 5, 'D05', 'S05', 'K05', '2026-11-14'),
('J0006', 6, 'D06', 'S06', 'K06', '2026-11-15'),
('J0007', 7, 'D07', 'S07', 'K07', '2026-11-16'),
('J0008', 8, 'D08', 'S08', 'K08', '2026-11-17'),
('J0009', 9, 'D09', 'S09', 'K09', '2026-11-18'),
('J0010', 10, 'D10', 'S10', 'K10', '2026-11-19'),
('J0011', 11, 'D11', 'S11', 'K11', '2026-11-20'),
('J0012', 12, 'D12', 'S12', 'K12', '2026-11-21'),
('J0013', 13, 'D13', 'S13', 'K13', '2026-11-22'),
('J0014', 14, 'D14', 'S14', 'K14', '2026-11-23'),
('J0015', 15, 'D15', 'S15', 'K15', '2026-11-24'),
('J0016', 16, 'D16', 'S16', 'K16', '2026-11-25'),
('J0017', 17, 'D17', 'S17', 'K17', '2026-11-26'),
('J0018', 18, 'D18', 'S18', 'K18', '2026-11-27'),
('J0019', 19, 'D19', 'S19', 'K19', '2026-11-28'),
('J0020', 20, 'D20', 'S20', 'K20', '2026-11-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_kendaraan` char(5) NOT NULL,
  `plat_nomor` varchar(10) DEFAULT NULL,
  `jenis_kendaraan` varchar(50) DEFAULT NULL,
  `kapasitas` int(11) DEFAULT NULL,
  `merek` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kendaraan`
--

INSERT INTO `kendaraan` (`id_kendaraan`, `plat_nomor`, `jenis_kendaraan`, `kapasitas`, `merek`) VALUES
('K01', 'B 1200 AX', 'Hiace Minibus', 14, 'Toyota'),
('K02', 'D 1237 BY', 'Innova Reborn', 7, 'Toyota'),
('K03', 'H 1274 CX', 'Elf Microbus', 16, 'Mitsubishi'),
('K04', 'AB 1311 DY', 'APV Arena', 12, 'Suzuki'),
('K05', 'L 1348 AX', 'Elf NLR', 16, 'Isuzu'),
('K06', 'N 1385 BY', 'Evalia', 7, 'Nissan'),
('K07', 'AD 1422 CX', 'Avanza', 6, 'Toyota'),
('K08', 'K 1459 DY', 'Hiace Premio', 14, 'Toyota'),
('K09', 'W 1496 AX', 'L300', 10, 'Mitsubishi'),
('K10', 'M 1533 BY', 'Ertiga', 7, 'Suzuki'),
('K11', 'B 1570 CX', 'Alphard', 6, 'Toyota'),
('K12', 'D 1607 DY', 'Traga Pick Up', 8, 'Isuzu'),
('K13', 'H 1644 AX', 'Kijang Innova Zenix', 7, 'Toyota'),
('K14', 'AB 1681 BY', 'Xpander', 7, 'Mitsubishi'),
('K15', 'L 1718 CX', 'Serena', 7, 'Nissan'),
('K16', 'N 1755 DY', 'Carry Minibus', 10, 'Suzuki'),
('K17', 'AD 1792 AX', 'Coaster', 20, 'Toyota'),
('K18', 'K 1829 BY', 'Lippo Microbus', 19, 'Hino'),
('K19', 'W 1866 CX', 'Rosa Bus', 22, 'Mitsubishi'),
('K20', 'M 1903 DY', 'Gran Max', 12, 'Toyota');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supir`
--

CREATE TABLE `supir` (
  `id_supir` char(5) NOT NULL,
  `nama_supir` varchar(100) DEFAULT NULL,
  `no_hp_supir` varchar(15) DEFAULT NULL,
  `alamat_supir` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supir`
--

INSERT INTO `supir` (`id_supir`, `nama_supir`, `no_hp_supir`, `alamat_supir`) VALUES
('S01', 'Choi Hyunsuk', '081234567001', 'Jl. Diponegoro 21, Semarang'),
('S02', 'Park Jihoon', '081234567002', 'Jl. Pemuda 14, Semarang'),
('S03', 'Kanemoto Yoshinori', '081234567003', 'Jl. Ir. Soekarno 15, Yogyakarta'),
('S04', 'Kim Junkyu', '081234567004', 'Jl. Malioboro 9, Yogyakarta'),
('S05', 'Yoon Jaehyuk', '081234567005', 'Jl. Moh. Hatta 23, Solo'),
('S06', 'Hamada Asahi', '081234567006', 'Jl. Soedirman 20, Bandung'),
('S07', 'Kim Doyoung', '081234567007', 'Jl. Teuku Umar 4, Bandung'),
('S08', 'Watanabe Haruto', '081234567008', 'Jl. Cut Nyak Dien 5, Malang'),
('S09', 'Park Jeongwoo', '081234567009', 'Jl. Pattimura 28, Surabaya'),
('S10', 'So Junghwan', '081234567010', 'Jl. Hasanuddin 18, Surabaya'),
('S11', 'Choi Seungcheol', '081234567011', 'Jl. Thamrin 8, Jakarta'),
('S12', 'Yoon Jeonghan', '081234567012', 'Jl. Antasari 4, Jakarta'),
('S13', 'Han Jisoo', '081234567013', 'Jl. Gajah Mada 30, Bogor'),
('S14', 'Wen Junhui', '081234567014', 'Jl. Pahlawan 10, Semarang'),
('S15', 'Kwon Soonyoung', '081234567015', 'Jl. Kartini 15, Solo'),
('S16', 'Jeon Wonwoo', '081234567016', 'Jl. Hasanuddin 17, Yogyakarta'),
('S17', 'Lee Seokmin', '081234567017', 'Jl. Diponegoro 18, Malang'),
('S18', 'Kim Mingyu', '081234567018', 'Jl. Ki Hajar Dewantara 6, Surabaya'),
('S19', 'Xu Minghao', '081234567019', 'Jl. Pangeran Antasari 7, Yogyakarta'),
('S20', 'Boo Seungkwan', '081234567020', 'Jl. Soedirman 16, Semarang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` char(10) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_jadwal` char(10) NOT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `jumlah` int(5) DEFAULT NULL,
  `harga` int(20) DEFAULT NULL,
  `status_bayar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `id_jadwal`, `tanggal_bayar`, `jumlah`, `harga`, `status_bayar`) VALUES
('T0001', 1, 'J0001', '0000-00-00', 1, 250000, 'BELUM'),
('T0002', 2, 'J0002', '0000-00-00', 2, 600000, 'BELUM'),
('T0003', 3, 'J0003', '2026-11-03', 3, 1050000, 'LUNAS'),
('T0004', 4, 'J0004', '0000-00-00', 1, 400000, 'BELUM'),
('T0005', 5, 'J0005', '0000-00-00', 2, 900000, 'BELUM'),
('T0006', 6, 'J0006', '0000-00-00', 3, 750000, 'BELUM'),
('T0007', 7, 'J0007', '2026-10-30', 1, 300000, 'LUNAS'),
('T0008', 8, 'J0008', '0000-00-00', 2, 700000, 'BELUM'),
('T0009', 9, 'J0009', '0000-00-00', 3, 1200000, 'BELUM'),
('T0010', 10, 'J0010', '0000-00-00', 1, 450000, 'BELUM'),
('T0011', 11, 'J0011', '2026-11-01', 2, 500000, 'LUNAS'),
('T0012', 12, 'J0012', '0000-00-00', 3, 900000, 'BELUM'),
('T0013', 13, 'J0013', '0000-00-00', 1, 350000, 'BELUM'),
('T0014', 14, 'J0014', '0000-00-00', 2, 800000, 'BELUM'),
('T0015', 15, 'J0015', '0000-00-00', 3, 1350000, 'BELUM'),
('T0016', 16, 'J0016', '2026-11-02', 1, 250000, 'LUNAS'),
('T0017', 17, 'J0017', '0000-00-00', 2, 600000, 'BELUM'),
('T0018', 18, 'J0018', '0000-00-00', 3, 1050000, 'BELUM'),
('T0019', 19, 'J0019', '0000-00-00', 1, 400000, 'BELUM'),
('T0020', 20, 'J0020', '0000-00-00', 2, 900000, 'BELUM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `role`) VALUES
(1, 'Admin Utama', 'admin', 'admin123', 'admin'),
(2, 'Lee Heeseung', 'heeseung', 'heeseung123', 'user'),
(3, 'Han Taesan', 'taesan', 'taesan123', 'user'),
(4, 'Choi Beomgyu', 'beomgyu', 'beomgyu123', 'user'),
(5, 'Choi Soobin', 'soobin', 'soobin123', 'user'),
(6, 'Choi Yeonjun', 'yeonjun', 'yeonjun123', 'user'),
(7, 'Kim Suno', 'suno', 'suno123', 'user'),
(8, 'Yang Jungwoon', 'uwon', 'uwon123', 'user'),
(9, 'Sim Jake', 'jake', 'jake123', 'user'),
(10, 'kang Taehyun', 'taehyun', 'taehyun123', 'user'),
(11, 'Park Jay', 'jay', 'jay123', 'user'),
(12, 'Park Sungho', 'sungho', 'sungho123', 'user'),
(13, 'Kim Woonhak', 'woonhak', 'woonhak123', 'user'),
(14, 'Shin Sinyu', 'sinyu', 'sinyu123', 'user'),
(15, 'kim Dohoon', 'dohoon', 'dohoon123', 'user'),
(16, 'Lee Kyungmin', 'kyungmin', 'kyungmin123', 'user'),
(17, 'Jung Ahyeon', 'ahyeon', 'ahyeon123', 'user'),
(18, 'Kim Asa', 'asa', 'asa123', 'user'),
(19, 'Lee Sangwon', 'sangwon', 'sangwon123', 'user'),
(20, 'Kim Juhoon', 'juhoon', 'juhoon123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `destinasi`
--
ALTER TABLE `destinasi`
  ADD PRIMARY KEY (`id_destinasi`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_destinasi` (`id_destinasi`),
  ADD KEY `id_supir` (`id_supir`),
  ADD KEY `id_kendaraan` (`id_kendaraan`);

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`);

--
-- Indeks untuk tabel `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`id_supir`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`id_destinasi`) REFERENCES `destinasi` (`id_destinasi`),
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`id_supir`) REFERENCES `supir` (`id_supir`),
  ADD CONSTRAINT `jadwal_ibfk_4` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id_kendaraan`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
