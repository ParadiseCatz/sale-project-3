-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2016 at 02:40 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iton_account`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_pelanggan`
--

CREATE TABLE `data_pelanggan` (
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `full_address` varchar(100) NOT NULL,
  `postal_code` int(32) NOT NULL,
  `phone_number` bigint(64) NOT NULL,
  `id` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pelanggan`
--

INSERT INTO `data_pelanggan` (`username`, `email`, `password`, `full_name`, `full_address`, `postal_code`, `phone_number`, `id`) VALUES
('asd', 'asd@gmail.com', 'asd', 'asd', 'tubagus ismail ', 12345, 81122445566, 2),
('root', 'root@gmail.com', 'root', 'root', 'Dago 12345', 12345, 81122334455, 1),
('wil', 'wil@gmail.com', 'asd', 'william', 'akakaak', 12345, 8111111115, 3);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `username`, `password`, `id`) VALUES
('asd@gmail.com', 'asd', 'asd', 2),
('root@gmail.com', 'root', 'root', 1),
('wil@gmail.com', 'wil', 'asd', 3);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(32) NOT NULL,
  `token` varchar(1024) NOT NULL,
  `expiry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `token`, `expiry`) VALUES
(1, 'j3vc3halndud6kf1l8i2k9c4jk', '2016-11-12 08:11:19'),
(1, '3vqegjnrp9ovaipsuv5se2tpn5', '2016-11-12 08:11:34'),
(2, 'njs7oon45l66s99qool2hmsr61', '2016-11-12 08:12:01'),
(1, 'ie4l9ttb21s157ds0dm2271vr5', '2016-11-12 08:17:47'),
(1, 'pe34appeh0hagpgrnuhk97h4h5', '2016-11-12 08:18:17'),
(1, '5hqm2hs8nehsmqlikb74g9tchp', '2016-11-12 08:26:54'),
(1, 'cisma6q5js1qqcdvulgeih9ohe', '2016-11-12 10:03:44'),
(2, 'f1u0un5krqjqg2be8uv7g4m5d6', '2016-11-12 10:03:59'),
(1, 'd8mad5km2ta2sa0fifvuci93ln', '2016-11-12 10:10:08'),
(1, 'm6g18taippa4eavqgjrl44nlg5', '2016-11-12 10:31:01'),
(1, 'fomfqqg652c9cf3ld35nm5k3cf', '2016-11-12 10:44:12'),
(1, 'no96c5brrvdtibb1nu3r39jqjk', '2016-11-12 10:44:41'),
(1, '4luh7vp3lnuu883c6ue4gujgpf', '2016-11-12 10:46:34'),
(1, '67rpsesmo18a7ilihqhvdgtg5v', '2016-11-12 11:34:17'),
(1, 'g7ar9ou5dp5dt2snm04u7ch6du', '2016-11-12 11:36:36'),
(1, 'rqdsi8q197rr01qe2m3mpsscp1', '2016-11-12 11:38:11'),
(1, 'kvcfp11987b22vigq1nobubksb', '2016-11-12 11:41:12'),
(1, 'alvnqfksu3ugqef3ubdp23s6sh', '2016-11-12 11:41:52'),
(1, 'pjgm9sfp3e8bpkh7a217sq2lm5', '2016-11-12 11:42:15'),
(1, '4uonb5bgi2vp8ro6o0m03d7jev', '2016-11-12 11:49:10'),
(1, '5c9kd2vjp08pvj45kvhuask3h6', '2016-11-12 11:50:53'),
(1, 'hq3d3b9qg5v7v537l6g8erm9em', '2016-11-12 11:51:19'),
(1, 'q6sfe19s81emupu2f0ia2ij4i4', '2016-11-12 11:51:36'),
(1, '4io08i5tp958f4jb5ne0p0t1i5', '2016-11-12 11:52:04'),
(1, '61s36t89hdsl692njk14796ksu', '2016-11-12 11:52:52'),
(1, 'fmov7tfgd9a1qlgaf0k0235ovr', '2016-11-12 11:54:27'),
(1, 'f8uah5p4bo0bls6ke17p6af0a6', '2016-11-12 11:54:51'),
(1, 'lr6k4d8nhvttl7rv4aua11st1l', '2016-11-12 11:56:09'),
(1, 'i9rc79m1cheveva019r6imr8ik', '2016-11-12 11:56:28'),
(1, 'jdi58c1rcj7gc3s5kmvjeeemnm', '2016-11-12 11:57:06'),
(1, 'k00f3dgfibur3t938bgl3p83pv', '2016-11-12 11:57:18'),
(1, 'esnnm2g4plo93r0q017j4gfssb', '2016-11-12 12:00:39'),
(1, 'jb63qne9181uee4ufe8g96huf8', '2016-11-12 12:02:59'),
(2, 'kcb8mu8jbbsd8djuf7hsljbct0', '2016-11-12 12:03:23'),
(3, '8d7uctcp8a806g356f9nrpt936', '2016-11-12 12:03:58'),
(1, 'rrakgb3a9gtojbb58gucn5bea7', '2016-11-12 13:43:42'),
(1, 'pdv51vu97m5150j4rgp1kgdkvb', '2016-11-12 14:07:04'),
(1, '813mkipddh1924raoqi5j4o0qq', '2016-11-12 14:10:04'),
(1, 'flafhdhdj5ai2b5qmvtjbieddt', '2016-11-12 14:11:34'),
(1, 'fvuuod2u8k8smmkare8tbnv8c5', '2016-11-12 14:35:07'),
(1, 'iatbk2d4644nm3o1od3e1s9iso', '2016-11-12 15:30:31'),
(1, 'ie2u8laao898smc91richjoppe', '2016-11-12 16:20:00'),
(1, 'n5ksr1lo1gkttd2nh7ppmmnmeo', '2016-11-12 18:09:55'),
(2, 'hdlt8mf7v26afomtdukgu4pr75', '2016-11-12 18:11:39'),
(1, 'ir7qe1pkks0t8vhpn2khn5sm62', '2016-11-12 18:17:27'),
(1, 'kbt33qnp0svvvk0gut24ep54i5', '2016-11-12 18:39:14'),
(1, 'h5gu6lddusq5b609fi68n5kc1m', '2016-11-12 18:39:33'),
(1, 'fe505fc0rn5jbsbqnve3qk09ko', '2016-11-12 18:40:43'),
(1, 'd3kcc7nc6m67n7hdbvqg47rtnb', '2016-11-12 18:53:18'),
(1, 'a2s2p2jua5srie4mg4s7rpti5i', '2016-11-12 18:53:52'),
(1, '5bgt65r284hb6uqevqopc5ec8t', '2016-11-12 18:57:38'),
(1, '9bi6dl3fck24ujj4jm60cppemi', '2016-11-12 19:12:13'),
(1, '8h8266ofl559mt9hgtm4khp4ht', '2016-11-12 19:13:38'),
(1, 'ktqa6oikk2a4025lgo1e8qpa28', '2016-11-12 19:13:54'),
(1, 'jhc9tqm1aq7sg1uvk0ks210bho', '2016-11-12 19:15:20'),
(1, 'hieqv5gg0ihe7cr2gqpp14g9aq', '2016-11-12 19:16:26'),
(1, 'cdonnbluajabn15g4i5210bqvr', '2016-11-12 19:19:56'),
(1, 'n2998jsqgr7snd46f2k72ncf4t', '2016-11-12 19:20:12'),
(1, '87ilo6h3l44k5ktq4q9gl1kshf', '2016-11-13 09:49:44'),
(1, 'brkfekkmrt018vd5500qa4p360', '2016-11-13 09:50:48'),
(1, 'rvjfvoqm4mhnefbkmm86vd89ts', '2016-11-13 09:54:07'),
(1, 'lp48cfqq7a3v0t8eb9da3dl784', '2016-11-13 09:56:10'),
(1, 'kvaejs02n06tif3k0q8bjearc0', '2016-11-13 09:57:07'),
(1, '6tg6dlr5blab4hjdcak9hhi0mn', '2016-11-13 10:01:55'),
(1, '6o9mgks07cq983b33e4bnn1lhi', '2016-11-13 10:02:44'),
(1, 'mr8ajknfuatd7st5acf4avc9bu', '2016-11-13 10:03:18'),
(1, 'oepesi5kvr5683loe7b77m21ad', '2016-11-13 10:04:42'),
(1, 'kosfc9it1med4clvnht9i9qh5k', '2016-11-13 10:09:57'),
(1, '8f0b00k4t442asvplb96rf9sai', '2016-11-13 10:28:49'),
(1, 'ks4nm59j7be7o9p9a4remu7nrv', '2016-11-13 15:34:33'),
(1, '4rpuj2f0bmrffcg0r2pb66sd5k', '2016-11-13 15:48:06'),
(1, '3ag5tim083pddp0ocl95dflohp', '2016-11-25 15:03:13'),
(2, 'vo2r1a5hnpu2iu32d1nhibtmne', '2016-11-25 15:03:26'),
(1, '5iceijchuog4uvr4ath0jlregk', '2016-11-28 14:03:55'),
(1, 'oo8tran00mjas8qq2pfajs1tvi', '2016-11-28 14:53:47'),
(1, 'ikvu75q2m9a3nfitd7f70dgc2n', '2016-11-28 14:54:42'),
(1, 'erg338if6ej092f0154qtvcki', '2016-11-28 14:56:58'),
(1, '5i8n63g9s283hkm4h9ahs3jc8i', '2016-11-28 14:57:49'),
(1, 'jvv37nn48c4hihh4d642f74e13', '2016-11-28 14:58:21'),
(1, 'rn5rfkqt5ejf1png82gaih14up', '2016-11-28 14:58:54'),
(1, 'iq3li3o05tikv4okm7jc3php6p', '2016-11-28 15:00:38'),
(1, 'qbe1it25n4mbav1bgvqnv77g9i', '2016-11-28 15:00:44'),
(1, 'j2gphtvo5g4k2h94fi11fqaehh', '2016-11-28 15:00:46'),
(1, 'pru30dbee4q0k9shsjh560mh9u', '2016-11-28 15:05:37'),
(1, '62kegpt9fbilgr5af04219sbki', '2016-11-28 15:06:45'),
(1, 'l53fmo7fdi6arfv77ot1nc9kga#Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0#0:0:0:0:0:0:0:1', '2016-11-28 15:33:33'),
(1, 'h2bfamei2d5lkqosqqaios3foq#Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0#0:0:0:0:0:0:0:1', '2016-11-28 15:33:39'),
(1, '9n701mpbbne64puusfji4fg8i3#Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0#0:0:0:0:0:0:0:1', '2016-11-28 15:34:06'),
(1, '9n4ossh6htuuo7i187fn1o8alc#Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0#0:0:0:0:0:0:0:1', '2016-11-28 15:34:32'),
(1, 'f0ri06li6i23qpaul9tlqkjk3u#Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0#0:0:0:0:0:0:0:1', '2016-11-28 15:36:14'),
(1, '48u3o0o6hoesb9qm3sg1i45fnr#Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0#0:0:0:0:0:0:0:1', '2016-11-28 15:37:11'),
(1, 'lr8il7slvphpk5v54ja6f2m3ed#Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0#0:0:0:0:0:0:0:1', '2016-11-28 15:37:16'),
(1, 'rajgme7t2do306eer8s9b9m2tj#Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0#0:0:0:0:0:0:0:1', '2016-11-28 15:37:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  ADD PRIMARY KEY (`username`,`email`,`password`,`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`email`,`username`,`password`,`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
