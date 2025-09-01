-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 01 Sep 2025 pada 12.36
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
-- Database: `desa_adat_cengkilung_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `arsip`
--

CREATE TABLE `arsip` (
  `id` int(11) NOT NULL,
  `pengguna_id` int(11) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `arsip`
--

INSERT INTO `arsip` (`id`, `pengguna_id`, `judul`, `deskripsi`, `file_url`, `dibuat_pada`) VALUES
(1, 3, 'Perarem Desa Adat', 'Perarem Desa 2024/2029', '/uploads/arsip/perarem_desa.pdf', '2025-09-01 05:04:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen`
--

CREATE TABLE `dokumen` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `kategori` enum('Surat','Laporan','Arsip','Regulasi') DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `tanggal_dokumen` date DEFAULT NULL,
  `diunggah_oleh` int(11) DEFAULT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokumen`
--

INSERT INTO `dokumen` (`id`, `judul`, `kategori`, `file_url`, `tanggal_dokumen`, `diunggah_oleh`, `dibuat_pada`) VALUES
(1, 'SK Kepala Desa', 'Surat', '/uploads/dokumen/sk_kepala_desa.pdf', '2025-01-01', 1, '2025-09-01 05:04:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri_foto`
--

CREATE TABLE `galeri_foto` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `tag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tag`)),
  `unggulan` tinyint(1) DEFAULT 0,
  `status` enum('Draft','Published','Archived') DEFAULT 'Published',
  `diunggah_oleh` int(11) DEFAULT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `diperbarui_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `galeri_foto`
--

INSERT INTO `galeri_foto` (`id`, `judul`, `deskripsi`, `kategori_id`, `file_url`, `thumbnail`, `tag`, `unggulan`, `status`, `diunggah_oleh`, `dibuat_pada`, `diperbarui_pada`) VALUES
(1, 'Upacara Adat', 'Foto upacara adat desa', 2, '/uploads/galeri/foto1.png', '/uploads/galeri/thumb1.png', '[\"adat\",\"desa\"]', 1, 'Published', 2, '2025-09-01 05:04:57', '2025-09-01 10:33:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri_video`
--

CREATE TABLE `galeri_video` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `youtube_url` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `tag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tag`)),
  `unggulan` tinyint(1) DEFAULT 0,
  `status` enum('Draft','Published','Archived') DEFAULT 'Published',
  `diunggah_oleh` int(11) DEFAULT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `diperbarui_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `galeri_video`
--

INSERT INTO `galeri_video` (`id`, `judul`, `deskripsi`, `kategori_id`, `youtube_url`, `thumbnail`, `tag`, `unggulan`, `status`, `diunggah_oleh`, `dibuat_pada`, `diperbarui_pada`) VALUES
(1, 'Pelantikan Pengurus', 'Video dokumentasi pelantikan', 2, 'https://youtu.be/j1kdY7LMgW4?si=p6g3-T5GfR9AVTjS', '/uploads/galeri/thumb_video1.png', '[\"kegiatan\",\"video\"]', 1, 'Published', 2, '2025-09-01 05:04:57', '2025-09-01 08:59:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` enum('Berita','Pengumuman','Artikel','Dokumen','Galeri','Sejarah') NOT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `jenis`, `dibuat_pada`) VALUES
(1, 'Umum', 'Berita', '2025-09-01 05:04:56'),
(2, 'Dokumentasi', 'Galeri', '2025-09-01 05:04:56'),
(3, 'Surat Keputusan', 'Dokumen', '2025-09-01 05:04:56'),
(4, 'Sejarah Desa', 'Sejarah', '2025-09-01 05:04:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konten`
--

CREATE TABLE `konten` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `isi` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `penulis_id` int(11) DEFAULT NULL,
  `status` enum('Draft','Published','Archived') DEFAULT 'Draft',
  `jumlah_dilihat` int(11) DEFAULT 0,
  `tanggal_publish` datetime DEFAULT current_timestamp(),
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `diperbarui_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `konten`
--

INSERT INTO `konten` (`id`, `judul`, `slug`, `deskripsi`, `isi`, `thumbnail`, `kategori_id`, `penulis_id`, `status`, `jumlah_dilihat`, `tanggal_publish`, `dibuat_pada`, `diperbarui_pada`) VALUES
(1, 'Berita Desa Hari Ini', 'berita-desa-hari-ini', 'Deskripsi singkat berita', 'Isi lengkap berita...', '/uploads/thumbnail/berita1.jpg', 1, 1, 'Published', 0, '2025-09-01 13:04:56', '2025-09-01 05:04:56', '2025-09-01 05:04:56'),
(2, 'Kegiatan Upacara Adat', 'kegiatan-upacara-adat', 'Deskripsi kegiatan adat', 'Isi lengkap kegiatan adat', '/uploads/thumbnail/galeri1.jpg', 2, 2, 'Published', 0, '2025-09-01 13:04:56', '2025-09-01 05:04:56', '2025-09-01 05:04:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` int(11) NOT NULL,
  `pengguna_id` int(11) DEFAULT NULL,
  `aksi` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id`, `pengguna_id`, `aksi`, `deskripsi`, `ip_address`, `user_agent`, `dibuat_pada`) VALUES
(1, 1, 'Login', 'Admin login ke sistem', '192.168.1.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/139.0.0.0 Safari/537.36', '2025-09-01 05:04:57'),
(2, 2, 'Upload Foto', 'Mengunggah foto kegiatan adat', '192.168.1.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/139.0.0.0 Safari/537.36', '2025-09-01 05:04:57'),
(3, 3, 'Download Arsip', 'Download akte kelahiran', '192.168.1.12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/139.0.0.0 Safari/537.36', '2025-09-01 05:04:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `peran` enum('Admin','Perangkat Desa','Penduduk') DEFAULT 'Penduduk',
  `foto_profil` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `status` enum('Aktif','Non-Aktif') DEFAULT 'Aktif',
  `login_terakhir` timestamp NULL DEFAULT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `diperbarui_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `nik`, `nama_lengkap`, `tanggal_lahir`, `email`, `no_hp`, `username`, `password`, `peran`, `foto_profil`, `alamat`, `status`, `login_terakhir`, `dibuat_pada`, `diperbarui_pada`) VALUES
(1, '5101010101010001', 'Admin Desa', NULL, 'admin@desa.id', NULL, 'admin', '$2b$10$hashed_password', 'Admin', '/uploads/profil/admin.jpg', 'Jl. Raya Desa', 'Aktif', NULL, '2025-09-01 05:04:56', '2025-09-01 05:04:56'),
(2, '5101010101010002', 'Made Suryana', NULL, 'made@desa.id', NULL, 'made', '$2b$10$hashed_password', 'Perangkat Desa', '/uploads/profil/made.jpg', 'Br. Tengah', 'Aktif', NULL, '2025-09-01 05:04:56', '2025-09-01 05:04:56'),
(3, '5101010101010003', 'Ni Luh Ayu', NULL, 'ayu@desa.id', NULL, 'ayu', '$2b$10$hashed_password', 'Penduduk', '/uploads/profil/ayu.jpg', 'Br. Kaja', 'Aktif', NULL, '2025-09-01 05:04:56', '2025-09-01 05:04:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_desa`
--

CREATE TABLE `profil_desa` (
  `id` int(11) NOT NULL,
  `bagian` enum('Gambaran Umum','VisiMisi','StrukturOrganisasi','Sejarah') NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `konten` longtext DEFAULT NULL,
  `gambar_url` varchar(255) DEFAULT NULL,
  `urutan` int(11) DEFAULT 0,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `diperbarui_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `profil_desa`
--

INSERT INTO `profil_desa` (`id`, `bagian`, `judul`, `konten`, `gambar_url`, `urutan`, `dibuat_pada`, `diperbarui_pada`) VALUES
(1, 'Gambaran Umum', 'Desa Cengkilung', 'Desa Cengkilung terletak di Bali...', '/uploads/profil_desa/umum.jpg', 1, '2025-09-01 05:04:57', '2025-09-01 05:04:57'),
(2, 'StrukturOrganisasi', 'Struktur Organisasi Desa Adat Cengkilung', 'Berikut ini adalah nama-nama pengurus Desa Adat Cengkilung:\r\nBandesa Adat: Ngakan Made Tapayasa\r\nWakil Bandesa Adat: I Nyoman Suandi\r\nSekretaris Desa Adat: I Ketut Murdi Wijaya\r\nBendahara Desa Adat: I Made Arsana, SE\r\nKepala Dusun Desa Adat Cengkilung: I Made Judra\r\nKelian Banjar Adat: Made Sudarsana', '/uploads/profil_desa/pengurus.jpg', 2, '2025-09-01 05:04:57', '2025-09-01 07:59:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sejarah`
--

CREATE TABLE `sejarah` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `isi` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  `status` enum('Draft','Published') DEFAULT 'Published',
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `diperbarui_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sejarah`
--

INSERT INTO `sejarah` (`id`, `judul`, `deskripsi`, `isi`, `thumbnail`, `tahun`, `status`, `dibuat_pada`, `diperbarui_pada`) VALUES
(1, 'Asa-Usaul Desa Adat Cengkilung', 'Mengenal awal mula berdirinya Desa Adat Cengkilung', 'Desa Adat Cengkilung memiliki sejarah yang erat kaitannya dengan dinamika politik dan peperangan di Bali pada masa lampau. Keberadaan banjar ini tidak dapat dipisahkan dari konflik bersejarah antara Desa Bun dengan Kerajaan Mengwi yang terjadi berabad-abad silam.\r\n\r\nPada masa itu, Desa Bun dipimpin oleh Anglurah Bun Bija, seorang pemimpin yang merupakan keturunan Arya Pinatih. Dalam suatu pertempuran, laskar Desa Bun berhasil mengalahkan pasukan Mengwi yang dipimpin oleh Cokorda Mahyun. Namun kemenangan ini tidak berlangsung lama.\r\n\r\nKekalahan di tangan laskar Desa Bun membuat Cokorda Mahyun murka dan terus melancarkan serangan. Akhirnya, dalam pertempuran yang sengit, Cokorda Mahyun tewas di tangan laskar Desa Bun. Namun, sisa-sisa laskar Mengwi yang selamat kembali ke kerajaan untuk meminta bantuan dan menyusun serangan balasan.\r\n\r\nSerangan balasan dari Kerajaan Mengwi ternyata berhasil mengalahkan laskar Desa Bun. Desa Bun pun dibakar dan penduduknya terpaksa menyebar ke berbagai wilayah di sekitarnya. Sebagian besar penduduk dari Desa Sibang kemudian berpindah ke arah barat daya Desa Bun, tepatnya ke wilayah yang kini dikenal sebagai Banjar Cengkilung.\r\n\r\nTiga Versi Asal Nama \"Cengkilung\":\r\n  Versi Pertama: Calung-Calung (Lekukan Tanah) → wilayah banyak lekuk tanah.\r\n  Versi Kedua: Kilung-Kilang (Liku Sungai).\r\n  Versi Ketiga: Cangkleng (Ikatan Tawanan).\r\n\r\nMakna Strategis Pembentukan: perpindahan penduduk juga bagian dari strategi Kerajaan Mengwi memperluas kekuasaan ke wilayah selatan untuk memperkuat pertahanan.\r\n\r\n(Disadur dan diolah dari buku \"Bali dalam Perspektif Sejarah dan Tradisi dalam Relevansinya dengan Era Global Menuju Keajegan Bali yang Harmonis\" oleh Drs. I Nyoman Suada, Edisi Revisi Juli 2014, dengan tambahan informasi dari sumber lisan masyarakat setempat)\r\n\r\n', '/uploads/sejarah/thumb1.jpg', NULL, 'Published', '2025-09-01 05:04:57', '2025-09-01 06:50:16'),
(2, 'Keunikan Budaya dan Identitas Desa', 'Deskripsi singkat keunikan budaya', 'Salah satu keunikan yang paling menonjol adalah pelaksanaan upacara Mecaru yang dilakukan setiap Kajeng Kliwon. Tradisi ini berbeda dengan praktik umum masyarakat Bali yang biasanya melaksanakan Mecaru pada Sasih kelima dan keenam, serta saat Ngesanga saja. Mecaru Kajeng Kliwon di Cengkilung menunjukkan kepekaan spiritual masyarakat setempat dalam menjaga keharmonisan dengan alam dan kekuatan-kekuatan gaib.\r\n\r\nDesa ini juga memiliki Pura Mambeng yang jarang ditemukan di desa lain. Keberadaan pura ini menunjukkan kompleksitas sistem kepercayaan masyarakat Cengkilung. Keunikan lainnya adalah tata ruang spiritual berbeda, dimana setra (kuburan) berada jauh dari Pura Dalem.', '/uploads/sejarah/thumb2.jpg', NULL, 'Published', '2025-09-01 06:46:42', '2025-09-01 06:50:07'),
(3, 'Perkembangan Sosial dan Budaya Masa Kini', 'Deskripsi singkat perkembangan sosial dan budaya', 'Pada masa lampau, kehidupan sosial masyarakat Cengkilung sangat kental dengan tradisi. Memasuki era modern, masyarakat mengalami transformasi signifikan, dengan pengaruh globalisasi, teknologi digital, serta menurunnya partisipasi generasi muda. Perubahan yang terjadi meliputi:\r\n  1. Penurunan aspek kepercayaan.\r\n  2. Pengaruh globalisasi & teknologi digital.\r\n  3. Sikap kritis generasi muda terhadap praktik tradisional.\r\n\r\nAdaptasi dilakukan, seperti penyesuaian ritual, penggunaan sound system, hingga penyesuaian waktu dengan jadwal kerja modern.\r\nTantangan yang dihadapi:\r\n  1. Menurunnya partisipasi generasi muda.\r\n  2. Kompetisi waktu dengan aktivitas modern.\r\n  3. Risiko hilangnya pengetahuan filosofis.\r\n  4. Pengaruh budaya luar melalui media sosial.\r\n\r\nUpaya pelestarian dan revitalisasi:\r\n  1. Dokumentasi tradisi dengan teknologi.\r\n  2. Edukasi generasi muda.\r\n  3. Kolaborasi dengan institusi pendidikan.\r\n\r\nPerjalanan Desa Cengkilung mencerminkan dinamika budaya yang sehat: tradisi & modernitas bernegosiasi untuk menciptakan identitas yang kuat namun adaptif.', '/uploads/sejarah/thumb3.jpg', NULL, 'Published', '2025-09-01 06:46:42', '2025-09-01 06:53:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sejarah_dokumentasi`
--

CREATE TABLE `sejarah_dokumentasi` (
  `id` int(11) NOT NULL,
  `sejarah_id` int(11) DEFAULT NULL,
  `foto_url` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `urutan` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sejarah_dokumentasi`
--

INSERT INTO `sejarah_dokumentasi` (`id`, `sejarah_id`, `foto_url`, `deskripsi`, `urutan`) VALUES
(1, 2, '/uploads/sejarah/foto1.jpg', 'Foto dokumentasi awal desa', 1),
(2, 3, '/uploads/sejarah/sosialisasi3.jpg', 'Sosialisasi masyarakat mengenai tradisi', 1),
(3, 0, '/uploads/sejarah/buku-cover.jpg', 'Buku sejarah masyarakat', 2),
(4, 1, '/uploads/sejarah/buku-sejarah1.jpg', 'Halaman sejarah 1', 3),
(5, 0, '/uploads/sejarah/buku-sejarah2.jpg', 'Halaman sejarah 2', 4),
(6, 0, '/uploads/sejarah/buku-sejarah3.jpg', 'Halaman sejarah 3', 5),
(7, 0, '/uploads/sejarah/buku-sejarah4.jpg', 'Halaman sejarah 4', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `statistik_desa`
--

CREATE TABLE `statistik_desa` (
  `id` int(11) NOT NULL,
  `kategori` enum('Kependudukan','Agama','Pekerjaan','Pendidikan','Usia','Status') NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `laki` int(11) DEFAULT 0,
  `perempuan` int(11) DEFAULT 0,
  `tahun` year(4) DEFAULT NULL,
  `diperbarui_oleh` int(11) DEFAULT NULL,
  `diperbarui_pada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `statistik_desa`
--

INSERT INTO `statistik_desa` (`id`, `kategori`, `label`, `laki`, `perempuan`, `tahun`, `diperbarui_oleh`, `diperbarui_pada`) VALUES
(1, 'Kependudukan', 'Warga Asli', 475, 445, '2025', 1, '2025-09-01 05:26:08'),
(2, 'Agama', 'Hindu', 400, 360, '2025', 1, '2025-09-01 05:30:15'),
(3, 'Agama', 'Islam', 75, 85, '2025', 1, '2025-09-01 05:30:44'),
(4, 'Kependudukan', 'Pendatang', 100, 100, '2025', 1, '2025-09-01 05:26:08'),
(5, 'Agama', 'Kristen', 0, 0, '2024', 3, '2025-07-10 10:48:13'),
(6, 'Agama', 'Katholik', 0, 0, '2024', 3, '2025-07-10 10:48:13'),
(7, 'Agama', 'Budha', 0, 0, '2024', 3, '2025-07-10 10:48:13'),
(8, 'Pekerjaan', 'Petani', 250, 220, '2024', 3, '2025-07-14 03:55:36'),
(9, 'Pekerjaan', 'Karyawan Swasta', 100, 110, '2024', 3, '2025-07-14 03:55:36'),
(10, 'Pekerjaan', 'Buruh Kasar', 45, 35, '2024', 3, '2025-07-14 03:55:36'),
(11, 'Pekerjaan', 'Pendidikan', 20, 25, '2024', 3, '2025-07-14 03:55:36'),
(12, 'Pekerjaan', 'Pemerintahan', 20, 10, '2024', 3, '2025-07-14 03:55:36'),
(13, 'Pekerjaan', 'Pedagang', 25, 30, '2024', 3, '2025-07-14 03:55:36'),
(14, 'Pekerjaan', 'Ibu Rumah Tangga', 0, 10, '2024', 3, '2025-07-14 03:55:36'),
(15, 'Pekerjaan', 'Lainnya', 15, 5, '2024', 3, '2025-07-14 03:55:36'),
(16, 'Pendidikan', 'Belum Sekolah', 50, 40, '2024', 3, '2025-07-14 03:55:36'),
(17, 'Pendidikan', 'Belum Tamat SD', 80, 90, '2024', 3, '2025-07-14 03:55:36'),
(18, 'Pendidikan', 'SD Sederajat', 150, 130, '2024', 3, '2025-07-14 03:55:36'),
(19, 'Pendidikan', 'SMP Sederajat', 40, 35, '2024', 3, '2025-07-14 03:55:36'),
(20, 'Pendidikan', 'SMA/SMK Sederajat', 35, 45, '2024', 3, '2025-07-14 03:55:36'),
(21, 'Pendidikan', 'Diploma I/II', 30, 20, '2024', 3, '2025-07-14 03:55:36'),
(22, 'Pendidikan', 'Diploma III/Strata I', 25, 35, '2024', 3, '2025-07-14 03:55:36'),
(23, 'Pendidikan', 'Strata II', 20, 15, '2024', 3, '2025-07-14 03:55:36'),
(24, 'Pendidikan', 'Strata III', 20, 15, '2024', 3, '2025-07-14 03:55:36'),
(25, 'Pendidikan', 'Lainnya', 25, 20, '2024', 3, '2025-07-14 03:55:36'),
(26, 'Usia', '0-14 Tahun', 110, 100, '2024', 3, '2025-07-14 03:55:36'),
(27, 'Usia', '15-29 Tahun', 135, 125, '2024', 3, '2025-07-14 03:55:36'),
(28, 'Usia', '30-44 Tahun', 100, 95, '2024', 3, '2025-07-14 03:55:36'),
(29, 'Usia', '45-59 Tahun', 80, 75, '2024', 3, '2025-07-14 03:55:36'),
(30, 'Usia', '60+ Tahun', 50, 50, '2024', 3, '2025-07-14 03:55:36'),
(31, 'Status', 'Belum Menikah', 200, 180, '2024', 3, '2025-07-10 10:48:13'),
(32, 'Status', 'Menikah', 250, 240, '2024', 3, '2025-07-10 10:48:13'),
(33, 'Status', 'Cerai Hidup', 20, 15, '2024', 3, '2025-07-10 10:48:13'),
(34, 'Status', 'Cerai Mati', 5, 10, '2024', 3, '2025-07-10 10:48:13');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `arsip`
--
ALTER TABLE `arsip`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `galeri_foto`
--
ALTER TABLE `galeri_foto`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `galeri_video`
--
ALTER TABLE `galeri_video`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `konten`
--
ALTER TABLE `konten`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indeks untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `profil_desa`
--
ALTER TABLE `profil_desa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sejarah`
--
ALTER TABLE `sejarah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sejarah_dokumentasi`
--
ALTER TABLE `sejarah_dokumentasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `statistik_desa`
--
ALTER TABLE `statistik_desa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `arsip`
--
ALTER TABLE `arsip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `galeri_foto`
--
ALTER TABLE `galeri_foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `galeri_video`
--
ALTER TABLE `galeri_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `konten`
--
ALTER TABLE `konten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `profil_desa`
--
ALTER TABLE `profil_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sejarah`
--
ALTER TABLE `sejarah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `sejarah_dokumentasi`
--
ALTER TABLE `sejarah_dokumentasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `statistik_desa`
--
ALTER TABLE `statistik_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
