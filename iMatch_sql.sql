-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 27, 2021 at 01:32 AM
-- Server version: 10.3.22-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iMatch`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_adminmessage`
--

CREATE TABLE `tb_adminmessage` (
  `id` int(11) NOT NULL,
  `message1` varchar(255) DEFAULT NULL,
  `message2` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_adminmessage`
--

INSERT INTO `tb_adminmessage` (`id`, `message1`, `message2`, `created_at`) VALUES
(1, 'If Your Wife slaps your mom for striking your child', 'If Your Husband slaps your dad for striking your child', '2020-11-03 12:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `tb_answerlike`
--

CREATE TABLE `tb_answerlike` (
  `id` int(11) NOT NULL,
  `user_liked` int(11) DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL,
  `answerid` varchar(255) DEFAULT NULL,
  `like_status` varchar(255) DEFAULT NULL,
  `IsActive` int(11) DEFAULT 0 COMMENT '0-active,1-not active',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_answerlike`
--

INSERT INTO `tb_answerlike` (`id`, `user_liked`, `questionid`, `answerid`, `like_status`, `IsActive`, `updated_at`) VALUES
(4, 1, 1, 'answer1', 'like', 0, '2020-11-05 16:29:36'),
(5, 1, 1, 'answer2', 'dislike', 0, '2020-11-05 16:29:55'),
(6, 36, 1, 'answer1', 'dislike', 0, '2020-11-09 06:46:52'),
(7, 36, 1, 'answer2', 'dislike', 0, '2020-11-09 06:46:55'),
(8, 38, 1, 'answer1', 'like', 0, '2020-11-10 08:47:06'),
(9, 7, 1, 'answer1', 'like', 0, '2020-11-12 14:22:01'),
(10, 7, 1, 'answer2', 'like', 0, '2020-11-12 14:22:03'),
(11, 42, 1, 'answer1', 'like', 0, '2020-11-17 10:34:05'),
(12, 42, 1, 'answer2', 'dislike', 0, '2020-11-17 10:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bestie`
--

CREATE TABLE `tb_bestie` (
  `bestie_id` int(11) NOT NULL,
  `req_from` int(11) NOT NULL,
  `req_to` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `req_status` int(11) DEFAULT 0,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bestie`
--

INSERT INTO `tb_bestie` (`bestie_id`, `req_from`, `req_to`, `category`, `req_status`, `read_status`, `created_at`) VALUES
(2, 20, 3, 'squad', 0, 0, '2020-09-11 04:19:02'),
(9, 20, 3, 'bestie', 0, 0, '2020-09-11 11:57:22'),
(10, 21, 19, 'squad', 0, 0, '2020-09-14 03:55:04'),
(12, 21, 19, 'bestie', 0, 0, '2020-09-14 03:55:37'),
(13, 21, 7, 'bestie', 0, 0, '2020-09-14 03:55:52'),
(14, 21, 8, 'bestie', 0, 0, '2020-09-14 03:55:55'),
(23, 7, 8, 'squad', 0, 0, '2020-09-17 10:18:30'),
(24, 7, 12, 'squad', 0, 0, '2020-09-17 10:18:49'),
(25, 7, 19, 'squad', 0, 0, '2020-09-17 10:18:53'),
(26, 7, 19, 'bestie', 0, 0, '2020-09-17 10:29:31'),
(27, 23, 8, 'bestie', 0, 0, '2020-09-21 08:05:05'),
(36, 29, 8, 'squad', 0, 0, '2020-10-21 12:11:37'),
(37, 29, 7, 'squad', 0, 0, '2020-10-21 12:11:40'),
(41, 33, 5, 'bestie', 0, 0, '2020-10-24 14:59:15'),
(42, 33, 5, 'squad', 0, 0, '2020-10-27 06:12:18'),
(43, 33, 7, 'squad', 0, 0, '2020-10-27 06:14:36'),
(44, 33, 11, 'squad', 0, 0, '2020-10-27 06:16:42'),
(45, 7, 2, 'bestie', 0, 0, '2020-10-30 06:41:35'),
(46, 7, 2, 'squad', 0, 0, '2020-11-24 10:58:30'),
(47, 7, 43, 'squad', 0, 0, '2020-11-24 10:58:58'),
(48, 7, 16, 'squad', 0, 0, '2020-11-24 10:59:31'),
(49, 7, 42, 'squad', 0, 0, '2020-11-24 10:59:36'),
(50, 7, 22, 'squad', 0, 0, '2020-11-24 10:59:54'),
(51, 7, 43, 'bestie', 0, 0, '2020-11-24 11:02:44'),
(61, 1, 2, 'bestie', 0, 0, '2020-11-26 08:00:25'),
(62, 1, 5, 'bestie', 0, 0, '2020-11-26 09:06:43'),
(63, 1, 2, 'squad', 0, 0, '2020-11-26 09:07:24'),
(64, 1, 7, 'bestie', 0, 0, '2020-11-28 08:25:23'),
(65, 1, 16, 'bestie', 0, 0, '2020-11-28 08:25:38'),
(66, 1, 18, 'squad', 0, 0, '2020-11-28 08:27:53'),
(67, 1, 5, 'squad', 0, 0, '2020-11-28 08:28:01'),
(68, 27, 12, 'bestie', 0, 0, '2021-01-06 15:52:40'),
(69, 49, 7, 'bestie', 0, 0, '2021-01-22 08:54:39'),
(70, 49, 7, 'squad', 0, 0, '2021-01-22 08:54:59'),
(71, 49, 1, 'squad', 0, 0, '2021-01-26 07:22:13');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bestmoment`
--

CREATE TABLE `tb_bestmoment` (
  `momentid` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bestmoment`
--

INSERT INTO `tb_bestmoment` (`momentid`, `caption`, `userid`, `created_at`) VALUES
(1, 'good scenery', 2, '2020-12-03 07:00:00'),
(2, 'good work', 2, '2020-12-03 16:53:09'),
(3, 'When i was in L.A ( Los Angeles ) ....', 1, '2020-12-10 07:17:37'),
(4, 'When i and mom on my BirthDay', 1, '2020-12-10 07:37:37'),
(5, 'On my Fist Rank party function ...', 1, '2020-12-14 13:43:54'),
(6, 'On My Younger Sister\'s Marrige Function ...', 1, '2020-12-14 13:52:28'),
(7, 'On My Elder Brother\'s Marrige Function ...', 1, '2020-12-14 13:56:58'),
(8, 'When We Was At An Summer Vacation ...', 1, '2020-12-14 13:58:56'),
(9, 'When I was in L.A (Los Angeles)', 1, '2020-12-16 18:25:30'),
(10, 'When i was in Delhi', 1, '2020-12-17 05:16:33'),
(11, 'our trip', 1, '2020-12-17 10:05:27'),
(12, 'When i was in Banglore ...', 1, '2020-12-17 10:17:14'),
(13, 'When i was in Varanasi ...', 1, '2020-12-17 10:21:28'),
(14, 'When i was in Goa ...', 1, '2020-12-17 10:24:26'),
(15, 'When i was in Muscut', 1, '2020-12-17 14:20:18'),
(16, 'Bhangtan', 2, '2021-01-14 10:58:54');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bestmomentupload`
--

CREATE TABLE `tb_bestmomentupload` (
  `uploadid` int(11) NOT NULL,
  `momentid` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tb_bestmomentupload`
--

INSERT INTO `tb_bestmomentupload` (`uploadid`, `momentid`, `filename`, `created_at`) VALUES
(1, 1, '455592e66cbcff19fcf8cbf5bbd7b2d0.jpg', '2020-12-03 14:28:18'),
(2, 1, 'bec7756c6011c9db859831bb5698566f.jpg', '2020-12-03 14:28:55'),
(3, 2, 'f9b091f1fcd7640801a59805ac7939bc.jpg', '2020-12-03 16:55:21'),
(4, 3, 'ae800d53abfc7c111e1803d0366a41e2.jpg', '2020-12-16 10:59:51'),
(9, 2, 'dfa06b82f5855ac04202844633f691a6.jpg', '2020-12-16 16:20:47'),
(10, 2, 'f3583b1d4549ddaac046d4c95b2d18dd.jpg', '2020-12-16 16:31:16'),
(13, 4, '7e8bd22600b96a97dadfc8706b2c0063.jpeg', '2020-12-17 09:51:48'),
(14, 4, '36e8022e023482e7159d931082faf2eb.jpeg', '2020-12-17 09:53:00'),
(15, 3, '5fd8698db3b3963accd65218f7d2d903.jpeg', '2020-12-17 09:55:50'),
(16, 0, 'cac823a2e27fd29146b80dca4358101f.jpeg', '2020-12-17 10:06:12'),
(17, 3, '45c8ae4507f05c1644c852a0bc17b10c.jpeg', '2021-01-07 07:22:29'),
(18, 5, '4c7a3e3154ef7d9198b0210963360e00.jpeg', '2021-01-07 07:23:42'),
(19, 16, 'bf9be46bf629cf5218669a8ea5d92152.jpeg', '2021-01-14 10:59:12'),
(20, 16, '1e1c9d327b3257f607297b73fe24e333.jpeg', '2021-01-14 10:59:40'),
(21, 16, 'f974ce6383e673c30ab16b92070cdf89.jpeg', '2021-01-14 11:00:00'),
(22, 0, '71f4705f127398b227aaea2f3b6926ea.jpeg', '2021-01-14 11:00:53');

-- --------------------------------------------------------

--
-- Table structure for table `tb_comment`
--

CREATE TABLE `tb_comment` (
  `comment_id` int(11) NOT NULL,
  `replied_commentid` int(11) DEFAULT 0 COMMENT '0=not replied comment',
  `match_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `contestent_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `commented_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_comment`
--

INSERT INTO `tb_comment` (`comment_id`, `replied_commentid`, `match_id`, `userid`, `contestent_id`, `comment`, `commented_at`) VALUES
(1, 0, 11, 1, 2, 'come and get it', '2020-09-28 13:36:14'),
(2, 0, 11, 1, 2, 'all the best', '2020-09-28 13:36:30'),
(3, 0, 11, 1, 2, 'haii all', '2020-09-30 09:37:11'),
(4, 0, 11, 1, 2, 'haii everybody', '2020-09-30 09:37:24'),
(5, 0, 11, 1, 2, 'show me some love', '2020-09-30 09:37:42'),
(6, 0, 11, 1, 2, 'we need to win today', '2020-09-30 09:37:57'),
(7, 0, 1, 1, 2, 'haii all', '2020-10-01 13:22:39'),
(8, 0, 1, 1, 2, 'haii all', '2020-10-01 13:22:44'),
(9, 0, 1, 1, 2, 'haii all', '2020-10-01 13:22:46'),
(10, 0, 1, 1, 2, 'how r u?', '2020-10-01 13:22:56'),
(11, 0, 1, 1, 2, 'how r u guys?', '2020-10-01 13:23:02'),
(12, 0, 1, 1, 2, 'how r u guys?', '2020-10-01 13:41:58'),
(13, 0, 1, 1, 2, 'how r u guys?', '2020-10-01 13:42:01'),
(14, 0, 1, 1, 1, 'how r u guys?', '2020-10-01 13:42:06'),
(15, 0, 1, 1, 1, 'how r u guys?', '2020-10-01 13:42:08'),
(16, 0, 1, 2, 1, 'haii', '2020-10-01 15:53:23'),
(17, 0, 1, 2, 2, 'haii', '2020-10-01 15:54:29'),
(18, 0, 1, 2, 2, 'haii da', '2020-10-01 15:54:37'),
(19, 0, 1, 1, 1, 'hai', '2020-10-01 16:25:09'),
(20, 0, 1, 1, 1, 'hai', '2020-10-01 16:25:19'),
(21, 0, 12, 1, 1, 'hai', '2020-10-05 11:19:23'),
(22, 0, 18, 1, 1, 'hai', '2020-10-09 14:19:30'),
(23, 0, 19, 1, 1, 'hai', '2020-10-14 12:28:05'),
(24, 0, 18, 1, 1, 'hai', '2020-10-14 12:32:23'),
(25, 0, 18, 1, 1, 'hai', '2020-10-14 12:32:28'),
(26, 0, 18, 1, 1, 'hai', '2020-10-14 12:32:29'),
(27, 0, 18, 1, 1, 'hai', '2020-10-16 04:48:14'),
(28, 0, 11, 1, 0, 'all the best', '2020-11-17 05:07:47'),
(29, 0, 3, 1, 0, 'haii', '2020-11-17 11:04:22'),
(30, 0, 3, 1, 0, 'haii', '2020-11-17 11:06:50'),
(31, 0, 1, 1, 0, 'haii', '2020-11-17 11:08:02'),
(32, 0, 1, 1, 0, 'haii', '2020-11-17 11:16:01'),
(33, 0, 1, 1, 0, 'haii', '2020-11-17 11:17:31'),
(34, 0, 3, 1, 0, 'haiii', '2020-11-17 11:18:27'),
(35, 0, 3, 1, 0, 'haii', '2020-11-17 11:21:10'),
(36, 0, 8, 1, 0, 'haii', '2020-11-17 11:31:02'),
(37, 0, 8, 1, 0, 'haii', '2020-11-17 11:32:06'),
(38, 0, 1, 1, 0, 'haii', '2020-11-17 12:25:55'),
(46, 0, 1, 1, 0, 'haii', '2020-11-17 13:54:37'),
(47, 0, 1, 1, 0, 'nice', '2020-11-17 13:54:46'),
(48, 0, 1, 1, 0, 'great', '2020-11-17 13:55:28'),
(49, 0, 1, 1, 0, 'deiii', '2020-11-17 14:05:44'),
(50, 0, 1, 1, 0, 'hellow how r u ?', '2020-11-17 14:14:17'),
(51, 0, 1, 1, 0, 'hellow... how r u ?', '2020-11-17 14:14:30'),
(52, 0, 41, 1, 0, 'great', '2020-11-17 14:34:34'),
(53, 0, 41, 1, 0, 'Awsome', '2020-11-17 14:34:45'),
(54, 0, 1, 1, 0, 'Nice', '2020-11-28 08:46:16'),
(55, 0, 1, 1, 0, 'Great ????', '2020-11-28 08:46:59'),
(56, 0, 3, 1, 0, 'Wooow', '2020-11-28 08:47:35'),
(57, 0, 3, 1, 0, 'Well done', '2020-11-28 08:47:45'),
(58, 0, 1, 1, 1, 'hai', '2020-12-15 10:03:37'),
(59, 0, 1, 1, 0, 'haii', '2020-12-15 10:29:34'),
(60, 0, 1, 1, 1, 'hellow', '2020-12-15 10:29:54'),
(61, 0, 22, 7, 0, 'Gghhhhggg', '2020-12-28 05:56:03'),
(62, 0, 22, 7, 0, 'Gghhhhggg', '2020-12-28 05:56:05'),
(63, 0, 133, 1, 1, 'haii', '2020-12-29 11:27:27'),
(64, 0, 133, 1, 1, 'hellow', '2020-12-29 11:27:36'),
(65, 64, 133, 5, 1, 'all the best', '2020-12-29 15:56:59'),
(66, 0, 133, 1, 2, 'all the best', '2020-12-29 15:57:39'),
(67, 0, 113, 2, 2, 'all the best', '2020-12-30 06:51:06'),
(68, 0, 133, 1, 1, 'wow', '2020-12-30 06:54:21'),
(69, 0, 133, 2, 2, 'all the best', '2020-12-30 06:55:04'),
(70, 0, 133, 2, 2, 'all the best', '2020-12-30 06:55:31'),
(71, 0, 133, 1, 1, 'Great', '2020-12-30 06:55:51'),
(72, 0, 133, 2, 1, 'all the best', '2020-12-30 06:58:33'),
(73, 65, 133, 1, 1, 'Tanx da', '2020-12-30 09:51:45'),
(74, 65, 133, 1, 1, 'Tanx da ....', '2020-12-30 09:53:52'),
(75, 0, 137, 1, 1, 'haii', '2020-12-30 12:23:33'),
(76, 75, 137, 1, 1, 'hellow', '2020-12-30 12:24:16'),
(77, 75, 137, 1, 1, 'hellow', '2020-12-30 12:39:08'),
(78, 75, 137, 1, 1, 'wow', '2020-12-30 12:49:38'),
(79, 0, 137, 1, 1, 'hellow', '2020-12-30 12:54:03'),
(80, 75, 137, 1, 1, 'Great', '2020-12-30 13:45:59'),
(81, 0, 137, 1, 1, 'hellow', '2020-12-30 14:25:42'),
(82, 0, 137, 1, 1, 'nice', '2020-12-30 14:26:14'),
(83, 0, 138, 1, 1, 'haii', '2020-12-31 13:35:07'),
(84, 83, 138, 1, 1, 'hellow', '2020-12-31 13:35:48'),
(85, 83, 138, 1, 1, 'hellow', '2020-12-31 13:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `tb_commentlike`
--

CREATE TABLE `tb_commentlike` (
  `id` int(11) NOT NULL,
  `commentid` int(11) DEFAULT NULL,
  `userliked` int(11) DEFAULT NULL,
  `likestatus` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_commentlike`
--

INSERT INTO `tb_commentlike` (`id`, `commentid`, `userliked`, `likestatus`, `created_at`) VALUES
(1, 64, 2, 'dislike', '2020-12-30 06:27:17'),
(2, 63, 1, 'dislike', '2020-12-30 10:31:12'),
(3, 75, 1, 'like', '2020-12-30 15:12:55'),
(4, 79, 1, 'dislike', '2020-12-30 15:13:40');

-- --------------------------------------------------------

--
-- Table structure for table `tb_countrycode`
--

CREATE TABLE `tb_countrycode` (
  `id` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `iso_code` varchar(255) NOT NULL,
  `flag` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_countrycode`
--

INSERT INTO `tb_countrycode` (`id`, `country`, `country_code`, `iso_code`, `flag`) VALUES
(1, 'Afghanistan', 'AFG', '93', 'Afghanistan.png'),
(2, 'Albania', 'ALB', '355', 'Albania.png'),
(3, 'Algeria', 'DZA', '213', 'Algeria.png'),
(4, 'American_Samoa', 'ASM', '1-684', 'American_Samoa.png'),
(5, 'Andorra', 'AND', '376', 'Andorra.png'),
(6, 'Angola', 'AGO', '244', 'Angola.png'),
(7, 'Anguilla', 'AIA', '1-264', 'Anguilla.png'),
(8, 'Antarctica', 'ATA', '672', 'Antarctica.png'),
(9, 'Antigua_and_Barbuda', 'ATG', '1-268', 'Antigua_and_Barbuda.png'),
(10, 'Argentina', 'ARG', '54', 'Argentina.png'),
(11, 'Armenia', 'ARM', '374', 'Armenia.png'),
(12, 'Aruba', 'ABW', '297', 'Aruba.png'),
(13, 'Australia', 'AUS', '61', 'Australia.png'),
(14, 'Austria', 'AUT', '43', 'Austria.png'),
(15, 'Azerbaijan', 'AZE', '994', 'Azerbaijan.png'),
(16, 'Bahamas', 'BHS', '1-242', 'Bahamas.png'),
(17, 'Bahrain', 'BHR', '973', 'Bahrain.png'),
(18, 'Bangladesh', 'BGD', '880', 'Bangladesh.png'),
(19, 'Barbados', 'BRB', '1-246', 'Barbados.png'),
(20, 'Belarus', 'BLR', '375', 'Belarus.png'),
(21, 'Belgium', 'BEL', '32', 'Belgium.png'),
(22, 'Belize', 'BLZ', '501', 'Belize.png'),
(23, 'Benin', 'BEN', '229', 'Benin.png'),
(24, 'Bermuda', 'BMU', '1-441', 'Bermuda.png'),
(25, 'Bhutan', 'BTN', '975', 'Bhutan.png'),
(26, 'Bolivia', 'BOL', '591', 'Bolivia.png'),
(27, 'Bosnia and Herzegovina', 'BIH', '387', 'Bosnia_and_Herzegovina.png'),
(28, 'Botswana', 'BWA', '267', 'Botswana.png'),
(29, 'Brazil', 'BRA', '55', 'Brazil.png'),
(30, 'British Indian Ocean Territory', 'IOT', '246', 'British_Indian_Ocean_Territory.png'),
(31, 'British Virgin Islands', 'VGB', '1-284', 'British_Virgin_Islands.png'),
(32, 'Brunei', 'BRN', '673', 'Brunei.png'),
(33, 'Bulgaria', 'BGR', '359', 'Bulgaria.png'),
(34, 'Burkina Faso', 'BFA', '226', 'Burkina_Faso.png'),
(35, 'Burundi', 'BDI', '257', 'Burundi.png'),
(36, 'Cambodia', 'KHM', '855', 'Cambodia.png'),
(37, 'Cameroon', 'CMR', '237', 'Cameroon.png'),
(38, 'Canada', 'CAN', '1', 'Canada.png'),
(39, 'Cape Verde', 'CPV', '238', 'Cape_Verde.png'),
(40, 'Cayman Islands', 'CYM', '1-345', 'Cayman_Islands.png'),
(41, 'Central African Republic', 'CAF', '236', 'Central_African_Republic.png'),
(42, 'Chad', 'TCD', '235', 'Chad.png'),
(43, 'Chile', 'CHL', '56', 'Chile.png'),
(44, 'China', 'CHN', '86', 'China.png'),
(45, 'Christmas Island', 'CXR', '61', 'Christmas_Island.png'),
(46, 'Cocos Islands', 'CCK', '61', 'Cocos_Islands.png'),
(47, 'Colombia', 'COL', '57', 'Colombia.png'),
(48, 'Comoros', 'COM', '269', 'Comoros.png'),
(49, 'Cook Islands', 'COK', '682', 'Cook_Islands.png'),
(50, 'Costa Rica', 'CRI', '506', 'Costa_Rica.png'),
(51, 'Croatia', 'HRV', '385', 'Croatia.png'),
(52, 'Cuba', 'CUB', '53', 'Cuba.png'),
(53, 'Curacao', 'CUW', '599', 'Curacao.png'),
(54, 'Cyprus', 'CYP', '357', 'Cyprus.png'),
(55, 'Czech Republic', 'CZE', '420', 'Czech_Republic.png'),
(56, 'Democratic Republic of the Congo', 'COD', '243', 'Democratic_Republic_of_the_Congo.png'),
(57, 'Denmark', 'DNK', '45', 'Denmark.png'),
(58, 'Djibouti', 'DJI', '253', 'Djibouti.png'),
(59, 'Dominica', 'DMA', '1-767', 'Dominica.png'),
(60, 'Dominican Republic', 'DOM', '1-809, 1-829, 1-849', 'Dominican_Republic.png'),
(61, 'East Timor', 'TLS', '670', 'East_Timor.png'),
(62, 'Ecuador', 'ECU', '593', 'Ecuador.png'),
(63, 'Egypt', 'EGY', '20', 'Egypt.png'),
(64, 'El Salvador', 'SLV', '503', 'El_Salvador.png'),
(65, 'Equatorial Guinea', 'GNQ', '240', 'Equatorial_Guinea.png'),
(66, 'Eritrea', 'ERI', '291', 'Eritrea.png'),
(67, 'Estonia', 'EST', '372', 'Estonia.png'),
(68, 'Ethiopia', 'ETH', '251', 'Ethiopia.png'),
(69, 'Falkland Islands', 'FLK', '500', 'Falkland_Islands.png'),
(70, 'Faroe Islands', 'FRO', '298', 'Faroe_Islands.png'),
(71, 'Fiji', 'FJI', '679', 'Fiji.png'),
(72, 'Finland', 'FIN', '358', 'Finland.png'),
(73, 'France', 'FRA', '33', 'France.png'),
(74, 'French Polynesia', 'PYF', '689', 'French_Polynesia.png'),
(75, 'Gabon', 'GAB', '241', 'Gabon.png'),
(76, 'Gambia', 'GMB', '220', 'Gambia.png'),
(77, 'Georgia', 'GEO', '995', 'Georgia.png'),
(78, 'Germany', 'DEU', '49', 'Germany.png'),
(79, 'Ghana', 'GHA', '233', 'Ghana.png'),
(80, 'Gibraltar', 'GIB', '350', 'Gibraltar.png'),
(81, 'Greece', 'GRC', '30', 'Greece.png'),
(82, 'Greenland', 'GRL', '299', 'Greenland.png'),
(83, 'Grenada', 'GRD', '1-473', 'Grenada.png'),
(84, 'Guam', 'GUM', '1-671', 'Guam.png'),
(85, 'Guatemala', 'GTM', '502', 'Guatemala.png'),
(86, 'Guernsey', 'GGY', '44-1481', 'Guernsey.png'),
(87, 'Guinea', 'GIN', '224', 'Guinea.png'),
(88, 'Guinea-Bissau', 'GNB', '245', 'Guinea-Bissau.png'),
(89, 'Guyana', 'GUY', '592', 'Guyana.png'),
(90, 'Haiti', 'HTI', '509', 'Haiti.png'),
(91, 'Honduras', 'HND', '504', 'Honduras.png'),
(92, 'Hong Kong', 'HKG', '852', 'Hong_Kong.png'),
(93, 'Hungary', 'HUN', '36', 'Hungary.png'),
(94, 'Iceland', 'ISL', '354', 'Iceland.png'),
(95, 'India', 'IND', '91', 'India.png'),
(96, 'Indonesia', 'IDN', '62', 'Indonesia.png'),
(97, 'Iran', 'IRN', '98', 'Iran.png'),
(98, 'Iraq', 'IRQ', '964', 'Iraq.png'),
(99, 'Ireland', 'IRL', '353', 'Ireland.png'),
(100, 'Isle of Man', 'IMN', '44-1624', 'Isle_of_Man.png'),
(101, 'Israel', 'ISR', '972', 'Israel.png'),
(102, 'Italy', 'ITA', '39', 'Italy.png'),
(103, 'Ivory Coast', 'CIV', '225', 'Ivory_Coast.png'),
(104, 'Jamaica', 'JAM', '1-876', 'Jamaica.png'),
(105, 'Japan', 'JPN', '81', 'Japan.png'),
(106, 'Jersey', 'JEY', '44-1534', 'Jersey.png'),
(107, 'Jordan', 'JOR', '962', 'Jordan.png'),
(108, 'Kazakhstan', 'KAZ', '7', 'Kazakhstan.png'),
(109, 'Kenya', 'KEN', '254', 'Kenya.png'),
(110, 'Kiribati', 'KIR', '686', 'Kiribati.png'),
(111, 'Kosovo', 'XKX', '383', 'Kosovo.png'),
(112, 'Kuwait', 'KWT', '965', 'Kuwait.png'),
(113, 'Kyrgyzstan', 'KGZ', '996', 'Kyrgyzstan.png'),
(114, 'Laos', 'LAO', '856', 'Laos.png'),
(115, 'Latvia', 'LVA', '371', 'Latvia.png'),
(116, 'Lebanon', 'LBN', '961', 'Lebanon.png'),
(117, 'Lesotho', 'LSO', '266', 'Lesotho.png'),
(118, 'Liberia', 'LBR', '231', 'Liberia.png'),
(119, 'Libya', 'LBY', '218', 'Libya.png'),
(120, 'Liechtenstein', 'LIE', '423', 'Liechtenstein.png'),
(121, 'Lithuania', 'LTU', '370', 'Lithuania.png'),
(122, 'Luxembourg', 'LUX', '352', 'Luxembourg.png'),
(123, 'Macau', 'MAC', '853', ''),
(124, 'Macedonia', 'MKD', '389', ''),
(125, 'Madagascar', 'MDG', '261', ''),
(126, 'Malawi', 'MWI', '265', ''),
(127, 'Malaysia', 'MYS', '60', ''),
(128, 'Maldives', 'MDV', '960', ''),
(129, 'Mali', 'MLI', '223', ''),
(130, 'Malta', 'MLT', '356', ''),
(131, 'Marshall Islands', 'MHL', '692', ''),
(132, 'Mauritania', 'MRT', '222', ''),
(133, 'Mauritius', 'MUS', '230', ''),
(134, 'Mayotte', 'MYT', '262', ''),
(135, 'Mexico', 'MEX', '52', ''),
(136, 'Micronesia', 'FSM', '691', ''),
(137, 'Moldova', 'MDA', '373', ''),
(138, 'Monaco', 'MCO', '377', ''),
(139, 'Mongolia', 'MNG', '976', ''),
(140, 'Montenegro', 'MNE', '382', ''),
(141, 'Montserrat', 'MSR', '1-664', ''),
(142, 'Morocco', 'MAR', '212', ''),
(143, 'Mozambique', 'MOZ', '258', ''),
(144, 'Myanmar', 'MMR', '95', ''),
(145, 'Namibia', 'NAM', '264', ''),
(146, 'Nauru', 'NRU', '674', ''),
(147, 'Nepal', 'NPL', '977', ''),
(148, 'Netherlands', 'NLD', '31', ''),
(149, 'Netherlands Antilles', 'ANT', '599', 'Netherlands_Antilles.png'),
(150, 'New Caledonia', 'NCL', '687', ''),
(151, 'New Zealand', 'NZL', '64', ''),
(152, 'Nicaragua', 'NIC', '505', ''),
(153, 'Niger', 'NER', '227', ''),
(154, 'Nigeria', 'NGA', '234', ''),
(155, 'Niue', 'NIU', '683', ''),
(156, 'North Korea', 'PRK', '850', ''),
(157, 'Northern Mariana Islands', 'MNP', '1-670', ''),
(158, 'Norway', 'NOR', '47', ''),
(159, 'Oman', 'OMN', '968', ''),
(160, 'Pakistan', 'PAK', '92', ''),
(161, 'Palau', 'PLW', '680', ''),
(162, 'Palestine', 'PSE', '970', ''),
(163, 'Panama', 'PAN', '507', ''),
(164, 'Papua New Guinea', 'PNG', '675', ''),
(165, 'Paraguay', 'PRY', '595', ''),
(166, 'Peru', 'PER', '51', ''),
(167, 'Philippines', 'PHL', '63', ''),
(168, 'Pitcairn', 'PCN', '64', ''),
(169, 'Poland', 'POL', '48', ''),
(170, 'Portugal', 'PRT', '351', ''),
(171, 'Puerto Rico', 'PRI', '1-787, 1-939', ''),
(172, 'Qatar', 'QAT', '974', ''),
(173, 'Republic of the Congo', 'COG', '242', ''),
(174, 'Reunion', 'REU', '262', ''),
(175, 'Romania', 'ROU', '40', ''),
(176, 'Russia', 'RUS', '7', ''),
(177, 'Rwanda', 'RWA', '250', ''),
(178, 'Saint Barthelemy', 'BLM', '590', ''),
(179, 'Saint Helena', 'SHN', '290', ''),
(180, 'Saint Kitts and Nevis', 'KNA', '1-869', ''),
(181, 'Saint Lucia', 'LCA', '1-758', ''),
(182, 'Saint Martin', 'MAF', '590', ''),
(183, 'Saint Pierre and Miquelon', 'SPM', '508', ''),
(184, 'Saint Vincent and the Grenadines', 'VCT', '1-784', ''),
(185, 'Samoa', 'WSM', '685', ''),
(186, 'San Marino', 'SMR', '378', ''),
(187, 'Sao Tome and Principe', 'STP', '239', ''),
(188, 'Saudi Arabia', 'SAU', '966', ''),
(189, 'Senegal', 'SEN', '221', ''),
(190, 'Serbia', 'SRB', '381', ''),
(191, 'Seychelles', 'SYC', '248', ''),
(192, 'Sierra Leone', 'SLE', '232', ''),
(193, 'Singapore', 'SGP', '65', ''),
(194, 'Sint Maarten', 'SXM', '1-721', ''),
(195, 'Slovakia', 'SVK', '421', ''),
(196, 'Slovenia', 'SVN', '386', ''),
(197, 'Solomon Islands', 'SLB', '677', ''),
(198, 'Somalia', 'SOM', '252', ''),
(199, 'South Africa', 'ZAF', '27', ''),
(200, 'South Korea', 'KOR', '82', ''),
(201, 'South Sudan', 'SSD', '211', ''),
(202, 'Spain', 'ESP', '34', ''),
(203, 'Sri Lanka', 'LKA', '94', ''),
(204, 'Sudan', 'SDN', '249', ''),
(205, 'Suriname', 'SUR', '597', ''),
(206, 'Svalbard and Jan Mayen', 'SJM', '47', ''),
(207, 'Swaziland', 'SWZ', '268', ''),
(208, 'Sweden', 'SWE', '46', ''),
(209, 'Switzerland', 'CHE', '41', ''),
(210, 'Syria', 'SYR', '963', ''),
(211, 'Taiwan', 'TWN', '886', ''),
(212, 'Tajikistan', 'TJK', '992', ''),
(213, 'Tanzania', 'TZA', '255', ''),
(214, 'Thailand', 'THA', '66', ''),
(215, 'Togo', 'TGO', '228', ''),
(216, 'Tokelau', 'TKL', '690', ''),
(217, 'Tonga', 'TON', '676', ''),
(218, 'Trinidad and Tobago', 'TTO', '1-868', ''),
(219, 'Tunisia', 'TUN', '216', ''),
(220, 'Turkey', 'TUR', '90', ''),
(221, 'Turkmenistan', 'TKM', '993', ''),
(222, 'Turks and Caicos Islands', 'TCA', '1-649', ''),
(223, 'Tuvalu', 'TUV', '688', ''),
(224, 'U.S. Virgin Islands', 'VIR', '1-340', ''),
(225, 'Uganda', 'UGA', '256', ''),
(226, 'Ukraine', 'UKR', '380', ''),
(227, 'United Arab Emirates', 'ARE', '971', 'United_Arab_Emirates.png'),
(228, 'United Kingdom', 'GBR', '44', ''),
(229, 'United States', 'USA', '1', ''),
(230, 'Uruguay', 'URY', '598', ''),
(231, 'Uzbekistan', 'UZB', '998', ''),
(232, 'Vanuatu', 'VUT', '678', ''),
(233, 'Vatican', 'VAT', '379', ''),
(234, 'Venezuela', 'VEN', '58', ''),
(235, 'Vietnam', 'VNM', '84', ''),
(236, 'Wallis and Futuna', 'WLF', '681', ''),
(237, 'Western Sahara', 'ESH', '212', ''),
(238, 'Yemen', 'YEM', '967', ''),
(239, 'Zambia', 'ZMB', '260', ''),
(240, 'Zimbabwe', 'ZWE', '263', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_fans`
--

CREATE TABLE `tb_fans` (
  `fan_id` int(11) NOT NULL,
  `req_from` int(11) DEFAULT NULL,
  `req_to` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_fans`
--

INSERT INTO `tb_fans` (`fan_id`, `req_from`, `req_to`, `category`, `created_at`) VALUES
(7, 1, 5, 'fan_of', '2020-10-15 11:53:44'),
(8, 1, 5, 'fan', '2020-10-15 11:53:55'),
(9, 1, 2, 'fan', '2020-10-15 12:18:50'),
(10, 1, 10, 'fan', '2020-10-15 12:19:00'),
(20, 33, 6, 'fan_of', '2020-10-27 04:53:14'),
(22, 33, 5, 'fan', '2020-10-27 05:59:59'),
(26, 33, 10, 'fan', '2020-10-27 06:10:44'),
(28, 33, 5, 'fan_of', '2020-10-27 06:11:11'),
(29, 33, 2, 'fan_of', '2020-10-27 06:11:15'),
(31, 1, 2, 'fan_of', '2020-11-06 11:21:48'),
(41, 1, 10, 'fan_of', '2020-11-12 15:29:56'),
(46, 1, 42, 'fan', '2020-11-28 08:23:20'),
(47, 1, 37, 'fan', '2020-11-28 08:23:30'),
(48, 1, 12, 'fan', '2020-11-28 08:23:47'),
(49, 1, 26, 'fan_of', '2020-11-28 08:24:52'),
(51, 47, 5, 'fan', '2020-12-21 12:58:50'),
(54, 7, 2, 'fan', '2021-01-07 10:30:21'),
(55, 7, 1, 'fan_of', '2021-01-07 10:30:31'),
(56, 49, 7, 'fan_of', '2021-01-22 08:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `tb_like`
--

CREATE TABLE `tb_like` (
  `like_id` int(11) NOT NULL,
  `user_liked` int(11) DEFAULT NULL,
  `matchid` int(11) DEFAULT NULL,
  `contestent_id` int(11) DEFAULT NULL COMMENT '0->common like not based on contestent',
  `like_status` varchar(255) DEFAULT NULL,
  `liked_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_like`
--

INSERT INTO `tb_like` (`like_id`, `user_liked`, `matchid`, `contestent_id`, `like_status`, `liked_on`) VALUES
(1, 3, 11, 2, 'like', '2020-10-01 11:45:41'),
(2, 3, 1, 2, 'like', '2020-10-06 09:59:24'),
(3, 4, 1, 5, 'like', '2020-10-14 09:04:49'),
(4, 20, 1, 5, 'like', '2020-10-14 09:03:00'),
(5, 21, 11, 5, 'like', '2020-10-06 12:51:59'),
(6, 1, 18, 3, 'like', '2020-10-12 10:12:37'),
(7, 1, 19, 2, 'like', '2020-10-12 11:19:49'),
(8, 21, 5, 1, 'like', '2020-10-14 11:22:43'),
(9, 4, 5, 1, 'like', '2020-10-14 11:22:49'),
(10, 4, 6, 5, 'like', '2020-10-14 11:44:36'),
(11, 21, 6, 1, 'like', '2020-10-14 11:44:41'),
(12, 21, 3, 5, 'like', '2020-10-14 10:16:21'),
(13, 3, 6, 1, 'like', '2020-10-14 11:43:41'),
(14, 3, 7, 5, 'like', '2020-10-14 10:17:10'),
(15, 3, 25, 1, 'like', '2020-10-15 13:28:16'),
(16, 3, 31, 19, 'like', '2020-10-15 13:30:00'),
(17, 5, 25, 1, 'like', '2020-10-15 13:30:56'),
(18, 1, 20, 1, 'like', '2020-10-16 06:48:11'),
(19, 1, 22, 2, 'like', '2020-10-16 06:33:21'),
(20, 8, 22, 0, 'dislike', '2020-11-16 13:06:46'),
(21, 1, 1, 0, 'dislike', '2020-11-28 08:46:06'),
(22, 1, 3, 0, 'like', '2020-11-17 10:49:55'),
(23, 1, 42, 0, 'dislike', '2020-11-17 14:30:29'),
(24, 1, 58, 0, 'like', '2020-11-17 14:30:35'),
(25, 8, 63, 5, 'like', '2020-11-23 12:06:32'),
(26, 8, 64, 2, 'like', '2020-11-23 12:15:18'),
(27, 6, 64, 2, 'like', '2020-11-23 12:15:23'),
(28, 1, 64, 1, 'like', '2020-11-24 08:15:10'),
(29, 7, 22, 0, 'like', '2020-12-28 05:55:55'),
(30, 1, 133, 1, 'like', '2020-12-29 11:14:53'),
(31, 1, 98, 1, 'like', '2021-01-08 09:57:37'),
(32, 1, 112, 1, 'like', '2021-01-14 08:23:56'),
(33, 2, 75, 2, 'like', '2021-01-14 11:06:24'),
(34, 2, 112, 1, 'like', '2021-01-14 11:06:30'),
(35, 2, 113, 1, 'like', '2021-01-14 11:06:37'),
(36, 2, 134, 2, 'like', '2021-01-14 11:06:47'),
(37, 7, 179, 7, 'like', '2021-01-22 10:52:56'),
(38, 49, 179, 0, 'dislike', '2021-01-26 07:29:54'),
(39, 1, 147, 1, 'like', '2021-01-22 13:16:26'),
(40, 2, 147, 2, 'like', '2021-01-22 13:19:27'),
(41, 1, 16, 0, 'like', '2021-01-25 10:10:37');

-- --------------------------------------------------------

--
-- Table structure for table `tb_match`
--

CREATE TABLE `tb_match` (
  `matchid` int(11) NOT NULL,
  `rival_id` int(11) NOT NULL,
  `opponent_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time_duration` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `invitation_status` varchar(255) DEFAULT NULL,
  `replied_at` timestamp NULL DEFAULT NULL,
  `match_end` timestamp NULL DEFAULT NULL,
  `match_status` int(11) DEFAULT NULL COMMENT '1->ongoing,0->ended',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_match`
--

INSERT INTO `tb_match` (`matchid`, `rival_id`, `opponent_id`, `description`, `time_duration`, `caption`, `category`, `file_name`, `invitation_status`, `replied_at`, `match_end`, `match_status`, `created_at`) VALUES
(1, 2, 1, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2020-11-19 06:12:09', '2020-11-23 07:00:00', 0, '2020-11-23 11:47:12'),
(2, 23, 8, 'Can we play a photo match', '1 day', 'A Dare Game', 'bestie', NULL, 'reject', '2020-09-25 22:39:32', '0000-00-00 00:00:00', 0, '2020-11-23 10:17:26'),
(3, 8, 1, 'Hai da, lets have a guess match', '1 hour', 'Guess Match', 'bestie', NULL, 'accept', '2020-09-26 02:37:08', '2020-09-26 03:37:08', 0, '2020-11-23 10:17:36'),
(4, 5, 1, 'Hai da, lets have a guess match', '1 hour', 'Guess Match', 'bestie', NULL, 'accept', '2020-09-30 05:06:59', '2020-09-30 06:06:59', 0, '2020-11-23 10:17:36'),
(5, 1, 5, 'Hai da, lets have a guess match', '1 hour', 'Guess Match', 'bestie', NULL, 'accept', '2020-09-30 19:31:32', '2020-09-30 20:31:32', 0, '2020-11-23 10:17:36'),
(6, 1, 5, 'Hai da, lets have a photo match', '1 hour', 'Photo Match', 'squad', NULL, 'accept', '2020-09-30 19:31:39', '2020-09-30 20:31:39', 0, '2020-11-23 10:17:36'),
(7, 1, 2, 'Hai da, lets have a photo match', '1 hour', 'Photo Match', 'squad', NULL, 'accept', '2020-09-30 19:31:24', '2020-09-30 20:31:24', 0, '2020-11-23 10:17:36'),
(8, 5, 1, 'Hai da, lets have a photo match', '1 hour', 'Photo Match', 'squad', NULL, 'accept', '2020-10-22 04:13:12', '2020-10-22 05:13:12', 0, '2020-11-23 10:17:36'),
(9, 2, 1, 'Hai da, lets have a photo match', '1 hour', 'Photo Match', 'squad', NULL, 'accept', '2020-11-13 04:13:17', '2020-11-14 05:13:17', 0, '2020-11-23 10:17:36'),
(10, 3, 1, 'Hai da, lets have a photo match', '1 hour', 'Photo Match', 'squad', NULL, 'accept', '2020-10-22 04:13:32', '2020-10-22 05:13:32', 0, '2020-11-23 10:17:36'),
(11, 2, 5, 'Lets Have a match', '1 hour', 'bestie match', 'bestie', NULL, 'accept', '2020-11-13 07:00:00', '2020-11-14 07:12:18', 0, '2020-11-23 10:17:36'),
(12, 1, 20, 'Haii raveena , how r u ? Lets play a photo match ?', '7 day', 'Photo Match', 'bestie', NULL, 'accept', '2020-10-01 23:55:49', '2020-10-08 23:55:49', 0, '2020-11-23 10:17:36'),
(13, 1, 11, 'Haii da lets have a card match', '7 day', 'Card Match', 'bestie', NULL, 'accept', '2020-10-01 23:55:54', '2020-10-08 23:55:54', 0, '2020-11-23 10:17:36'),
(14, 1, 21, 'haii', '7 day', 'Haii', 'bestie', NULL, 'accept', '2020-10-01 23:55:59', '2020-10-08 23:55:59', 0, '2020-11-23 10:17:36'),
(15, 1, 2, 'haii', '7 day', 'Haii', 'bestie', NULL, 'accept', '2020-10-01 23:56:04', '2020-10-08 23:56:04', 0, '2020-11-23 10:17:36'),
(16, 1, 19, 'haii da', '7 day', 'haii', 'bestie', NULL, 'accept', '2020-10-01 23:56:09', '2020-10-08 23:56:09', 0, '2020-11-23 10:17:36'),
(17, 1, 6, 'crazy match', '3 day', 'Crazy match', 'bestie', NULL, 'accept', '2020-10-01 23:56:23', '2020-10-04 23:56:23', 0, '2020-11-23 10:17:36'),
(18, 1, 3, 'lets have a match of imagination', '7 day', 'Imagination', 'undefined', NULL, 'accept', '2020-10-09 18:14:15', '2020-10-16 18:14:15', 0, '2020-11-23 10:17:36'),
(19, 1, 2, 'haii da lets have a telephone match', '7 day', 'Telephone Match', 'undefined', NULL, 'accept', '2020-10-09 18:14:09', '2020-10-16 18:14:09', 0, '2020-11-23 10:17:36'),
(20, 1, 6, 'haii da, lets have a mind reading match', '7 day', 'Mind Reading Match', 'undefined', NULL, 'accept', '2020-10-15 19:53:00', '2020-10-22 19:53:00', 0, '2020-11-23 10:17:36'),
(21, 1, 10, 'Hai da can we have a wonderful match', '5 day', 'Wonder Match', 'undefined', NULL, 'accept', '2020-10-15 19:53:06', '2020-10-20 19:53:06', 0, '2020-11-23 10:17:36'),
(22, 1, 7, 'Haii Sam.... Get ready for a funny match', '4 day', 'Funny Match', 'undefined', NULL, 'accept', '2020-10-15 19:53:10', '2020-10-19 19:53:10', 0, '2020-11-23 10:17:36'),
(23, 7, 19, 'Hi', '19 hour', 'Hii', 'undefined', NULL, 'accept', '2020-10-15 19:53:13', '2020-10-16 14:53:13', 0, '2020-11-23 10:17:36'),
(24, 7, 8, 'Hii', '21 hour', 'Hello', 'undefined', NULL, 'accept', '2020-10-15 19:53:31', '2020-10-16 16:53:31', 0, '2020-11-23 10:17:36'),
(25, 7, 1, 'Hii', '3 hour', 'Hii', 'undefined', NULL, 'accept', '2020-10-15 19:53:34', '2020-10-15 22:53:34', 0, '2020-11-23 10:17:36'),
(26, 1, 26, 'haii Kavitha can we go for a open match', '5 hour', 'Open Match', 'undefined', NULL, 'accept', '2020-10-15 19:53:39', '2020-10-16 00:53:39', 0, '2020-11-23 10:17:36'),
(27, 1, 26, 'haii Kavitha can we go for a open match', '5 hour', 'Open Match', 'undefined', NULL, 'accept', '2020-10-15 19:53:45', '2020-10-16 00:53:45', 0, '2020-11-23 10:17:36'),
(28, 1, 9, 'haii da .... R u ready to go for a cute match', '7 day', 'Cute Match', 'undefined', NULL, 'accept', '2020-10-15 19:54:00', '2020-10-22 19:54:00', 0, '2020-11-23 10:17:36'),
(29, 1, 21, 'haii', '7 day', 'Match', 'undefined', NULL, 'accept', '2020-10-15 19:54:05', '2020-10-22 19:54:05', 0, '2020-11-23 10:17:36'),
(30, 1, 19, 'haii', '1 hour', 'Haii', 'undefined', NULL, 'accept', '2020-10-15 19:54:11', '2020-10-15 20:54:11', 0, '2020-11-23 10:17:36'),
(31, 1, 19, 'haii', '1 hour', 'Haii', 'undefined', NULL, 'accept', '2020-10-15 19:54:15', '2020-10-15 20:54:15', 0, '2020-11-23 10:17:36'),
(32, 1, 28, 'Haii da ... lets have a temple run ...', '2 hour', 'Temple Run', 'undefined', NULL, 'accept', '2020-10-20 00:48:53', '2020-10-20 02:48:53', 0, '2020-11-23 10:17:36'),
(33, 1, 27, 'haii', '1 hour', 'HAii', 'undefined', NULL, 'accept', '2020-10-20 00:49:22', '2020-10-20 01:49:22', 0, '2020-11-23 10:17:36'),
(34, 1, 11, 'Gold Digger Match', '5 hour', 'Gold Digger', 'undefined', NULL, 'accept', '2020-10-24 02:36:45', '2020-10-24 07:36:45', 0, '2020-11-23 10:17:36'),
(35, 1, 12, 'Blind Show Match', '6 hour', 'Blind Show', 'undefined', NULL, 'accept', '2020-10-24 02:36:51', '2020-10-24 08:36:51', 0, '2020-11-23 10:17:36'),
(36, 29, 19, 'Hii Bino ', '6 hour', 'Hello Dark ', 'undefined', NULL, 'accept', '2020-10-24 02:36:55', '2020-10-24 08:36:55', 0, '2020-11-23 10:17:36'),
(37, 1, 30, 'Amoung Us Game', '8 hour', 'Amoung Us', 'undefined', NULL, 'accept', '2020-10-24 02:37:00', '2020-10-24 10:37:00', 0, '2020-11-23 10:17:36'),
(38, 1, 24, 'Novel Match', '2 hour', 'Novel Match', 'undefined', NULL, 'accept', '2020-10-24 02:37:04', '2020-10-24 04:37:04', 0, '2020-11-23 10:17:36'),
(39, 3, 1, 'Lets Have a match', '1 hour', 'bestie match', 'bestie', NULL, 'accept', '2020-10-24 02:37:08', '2020-10-24 03:37:08', 0, '2020-11-23 10:17:36'),
(40, 4, 1, 'Lets Have a match', '1 hour', 'bestie match', 'bestie', NULL, 'accept', '2020-10-22 04:13:36', '2020-10-22 05:13:36', 0, '2020-11-23 10:17:36'),
(41, 6, 1, 'Lets Have a match', '1 hour', 'bestie match', 'bestie', NULL, 'accept', '2020-10-24 02:37:23', '2020-10-24 03:37:23', 0, '2020-11-23 10:17:36'),
(42, 7, 1, 'Lets Have a match', '1 hour', 'bestie match', 'bestie', NULL, 'accept', '2020-10-24 02:37:28', '2020-10-24 03:37:28', 0, '2020-11-23 10:17:36'),
(43, 1, 29, 'Wow', '1 hour', 'Wow', 'undefined', NULL, 'accept', '2020-10-24 02:37:32', '2020-10-24 03:37:32', 0, '2020-11-23 10:17:36'),
(44, 31, 31, 'Haii', '1 hour', 'Haii', 'undefined', NULL, 'accept', '2020-10-24 02:37:36', '2020-10-24 03:37:36', 0, '2020-11-23 10:17:36'),
(45, 1, 31, 'haii', '1 hour', 'haii', 'undefined', NULL, 'accept', '2020-10-24 02:37:40', '2020-10-24 03:37:40', 0, '2020-11-23 10:17:36'),
(46, 1, 31, 'haii', '1 hour', 'haii', 'undefined', NULL, 'accept', '2020-10-24 02:37:54', '2020-10-24 03:37:54', 0, '2020-11-23 10:17:36'),
(47, 1, 31, 'Match', '1 hour', 'Match', 'undefined', NULL, 'accept', '2020-10-24 02:37:59', '2020-10-24 03:37:59', 0, '2020-11-23 10:17:36'),
(48, 1, 31, 'Match', '1 hour', 'Match', 'undefined', NULL, 'accept', '2020-10-24 02:38:04', '2020-10-24 03:38:04', 0, '2020-11-23 10:17:36'),
(49, 1, 31, 'haii', '1 hour', 'haii', 'undefined', NULL, 'accept', '2020-10-24 02:38:08', '2020-10-24 03:38:08', 0, '2020-11-23 10:17:36'),
(50, 1, 31, 'haii', '1 hour', 'haii', 'undefined', NULL, 'accept', '2020-10-24 02:38:18', '2020-10-24 03:38:18', 0, '2020-11-23 10:17:36'),
(51, 1, 2, 'haii', '1 day', 'Haii', 'undefined', NULL, 'accept', '2020-11-03 18:33:45', '2020-11-04 18:33:45', 0, '2020-11-23 10:17:36'),
(52, 1, 2, 'haii', '1 day', 'Haii', 'undefined', NULL, 'accept', '2020-11-03 18:33:50', '2020-11-04 18:33:50', 0, '2020-11-23 10:17:36'),
(53, 1, 11, 'Great', '1 hour', 'Great', 'undefined', NULL, NULL, NULL, NULL, 0, '2020-11-23 10:17:36'),
(54, 1, 11, 'Great', '1 hour', 'Great', 'undefined', NULL, NULL, NULL, NULL, 0, '2020-11-23 10:17:36'),
(57, 2, 5, 'Lets Have a match', '1 hour', 'bestie match', 'bestie', NULL, 'accept', '2020-11-03 21:00:38', '2020-11-03 22:00:38', 0, '2020-11-23 10:17:36'),
(58, 2, 1, 'Lets Have a match', '1 hour', 'bestie match', 'bestie', NULL, 'accept', '2020-11-04 00:48:23', '2020-11-04 01:48:23', 0, '2020-11-23 10:17:36'),
(60, 5, 1, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2020-11-04 00:49:00', '2020-11-05 00:49:00', 0, '2020-11-23 10:17:36'),
(61, 1, 7, 'haii', '1 hour', 'haii', 'bestie', NULL, 'reject', '2021-01-22 22:02:36', '0000-00-00 00:00:00', 0, '2021-01-22 09:32:36'),
(62, 1, 7, 'haii', '1 hour', 'haii', 'bestie', NULL, 'reject', '2021-01-22 22:02:39', '0000-00-00 00:00:00', 0, '2021-01-22 09:32:39'),
(63, 2, 5, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2020-11-23 23:27:02', '2020-11-24 23:27:03', 0, '2020-11-24 10:58:01'),
(64, 2, 1, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2020-11-24 00:42:33', '2020-11-25 00:42:33', 0, '2020-11-24 12:13:01'),
(66, 7, 43, 'Hi', '7 hour', 'Heloo', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-11-24 11:04:40'),
(68, 7, 1, 'gghahahhhz', '2 hour', 'fHzgsh', 'undefined', NULL, 'accept', '2021-01-05 17:49:05', '2021-01-05 19:49:05', 0, '2021-01-05 07:20:01'),
(73, 1, 3, 'Haii da ... can we have a Telephone Match', '1 hour', 'Telephone Match', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 01:56:16'),
(75, 1, 2, 'haii', '1 hour', 'haii', 'undefined', NULL, 'accept', '2021-01-14 22:36:26', '2021-01-14 23:36:26', 0, '2021-01-14 11:07:01'),
(77, 1, 4, 'Haii', '1 hour', 'Hellow', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 02:33:00'),
(79, 1, 2, 'Hellow', '1 hour', 'Haii', 'undefined', NULL, 'reject', '2021-01-14 22:37:05', '0000-00-00 00:00:00', 0, '2021-01-14 10:07:05'),
(93, 1, 20, 'haii', '1 hour', 'haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 03:07:14'),
(95, 1, 20, 'haii', '1 hour', 'haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 03:08:54'),
(97, 1, 10, 'haii', '1 hour', 'haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 03:12:57'),
(98, 2, 1, 'Test Match from Rave', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-08 22:09:07', '2021-01-09 22:09:07', 0, '2021-01-09 09:40:01'),
(99, 1, 6, 'haii', '1 hour', 'haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 03:24:58'),
(100, 1, 5, 'hellow', '1 hour', 'hellow', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 03:27:10'),
(101, 1, 18, 'haii', '1 hour', 'haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 05:01:34'),
(102, 1, 21, 'haii', '1 hour', 'hammm', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 05:42:17'),
(103, 1, 23, 'hellow', '1 hour', 'Haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 21:11:42'),
(104, 1, 23, 'hellow', '1 hour', 'Haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-18 21:11:42'),
(105, 1, 8, 'kooi', '1 hour', 'koooi', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-19 19:48:13'),
(106, 1, 14, 'haii', '1 hour', 'haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-19 20:10:20'),
(107, 1, 9, 'haii', '1 hour', 'haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-20 06:30:44'),
(108, 1, 17, 'haii', '1 hour', 'haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-20 06:34:43'),
(109, 1, 24, 'haii', '1 hour', 'haii', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-20 06:37:21'),
(110, 1, 34, 'Di', '1 hour', 'Di', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-21 22:07:29'),
(111, 2, 1, 'Test Match from Rave', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-11 20:06:36', '2021-01-12 20:06:36', 0, '2021-01-12 07:37:01'),
(112, 2, 1, 'Test Match from Rave', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-14 20:52:37', '2021-01-15 20:52:37', 0, '2021-01-15 08:23:01'),
(113, 2, 1, 'Test Match from Rave', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-14 22:29:48', '2021-01-15 22:29:48', 0, '2021-01-15 10:00:01'),
(114, 1, 35, 'Da', '2 hour', 'Da', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-21 22:15:43'),
(115, 1, 35, 'Da', '2 hour', 'Da', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-21 22:15:43'),
(116, 1, 32, 'fgh', '3 hour', 'tfgh', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-21 22:37:58'),
(117, 1, 32, 'fgh', '3 hour', 'tfgh', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-21 22:37:58'),
(118, 47, 1, 'Haii da can we have a dream match!!! ', '1 hour', 'Dream Match', 'undefined', NULL, 'accept', '2021-01-14 22:54:49', '2021-01-14 23:54:49', 0, '2021-01-14 11:25:01'),
(119, 47, 1, 'Haii da can we have a dream match!!! ', '1 hour', 'Dream Match', 'undefined', NULL, 'reject', '2021-01-14 22:55:33', '0000-00-00 00:00:00', 0, '2021-01-14 10:25:33'),
(120, 1, 38, 'dfjjd', '1 hour', 'fhhfd', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 01:53:43'),
(121, 1, 38, 'dfjjd', '1 hour', 'fhhfd', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 01:53:43'),
(122, 1, 38, 'dfjjd', '1 hour', 'fhhfd', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 01:55:17'),
(123, 1, 38, 'dfjjd', '1 hour', 'fhhfd', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 01:55:17'),
(124, 1, 3, 'fhgdd', '1 hour', 'ffsdhh', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 04:51:08'),
(125, 1, 3, 'fhgdd', '1 hour', 'ffsdhh', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 04:51:08'),
(126, 2, 1, 'Test Match from Rave', '1 day', 'bestie match', 'bestie', NULL, 'reject', '2021-01-15 03:54:41', '0000-00-00 00:00:00', 0, '2021-01-14 15:24:41'),
(127, 1, 41, 'Haiii', '1 hour', 'Good', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 18:47:34'),
(128, 1, 41, 'Haiii', '1 hour', 'Good', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 18:47:34'),
(129, 1, 19, 'haii', '1 hour', 'hellow', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 19:06:07'),
(130, 1, 8, 'hellow', '1 hour', 'hellow', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 19:08:25'),
(131, 1, 8, 'hellow', '1 hour', 'hellow', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 19:13:03'),
(132, 1, 6, 'figrr', '1 hour', 'ghfd', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-22 21:23:45'),
(133, 2, 1, 'Test Match from Rave', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2020-12-30 00:22:09', '2020-12-31 00:22:09', 0, '2020-12-30 11:53:01'),
(134, 7, 2, 'red face hat photo match', '4 hour', 'be on flèek with red hat', 'undefined', NULL, 'accept', '2021-01-14 22:37:10', '2021-01-15 02:37:10', 0, '2021-01-14 14:08:01'),
(135, 7, 2, 'red face hat photo match', '4 hour', 'be on flèek with red hat', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-30 19:36:24'),
(136, 7, 1, 'a ', '3 hour', 'hey', 'undefined', NULL, 'accept', '2021-01-14 22:55:44', '2021-01-15 01:55:44', 0, '2021-01-14 13:26:02'),
(137, 2, 1, 'Test Match from Rave', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2020-12-31 00:32:31', '2021-01-01 00:32:31', 0, '2020-12-31 12:03:01'),
(138, 3, 1, 'Test Match from Rave', '2 day', 'bestie match', 'bestie', NULL, 'accept', '2020-12-31 00:33:02', '2021-01-02 00:33:02', 0, '2021-01-01 12:04:01'),
(139, 7, 4, 'Hjj', '1 hour', '', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-31 04:22:12'),
(140, 7, 4, 'Hjj', '1 hour', '', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-31 04:22:38'),
(141, 7, 4, 'Hjj', '1 hour', '', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-31 04:22:43'),
(142, 7, 4, 'Hjj', '1 hour', '', 'undefined', NULL, NULL, NULL, NULL, NULL, '2020-12-31 04:23:06'),
(143, 3, 1, 'Test Match from Rave', '2 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-15 23:43:28', '2021-01-17 23:43:28', 0, '2021-01-17 11:14:01'),
(144, 3, 1, 'Test Match from Rave', '2 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-15 23:47:17', '2021-01-17 23:47:17', 0, '2021-01-17 11:18:01'),
(145, 3, 1, 'Test Match from Rave', '2 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-16 00:35:44', '2021-01-18 00:35:45', 0, '2021-01-17 12:06:01'),
(146, 3, 1, 'Test Match from Rave', '2 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-04 17:47:49', '2021-01-06 17:47:49', 0, '2021-01-06 05:18:01'),
(147, 2, 1, 'Test Match from Rave', '2 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-23 00:10:46', '2021-01-25 00:10:46', 0, '2021-01-24 11:41:01'),
(148, 1, 6, 'fhjvff', '5 hour', 'chbfff', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-05 18:38:06'),
(149, 0, 4, 'haii', '1 hour', 'hellow', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-05 20:57:02'),
(150, 0, 4, 'haii', '1 hour', 'hellow', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-05 20:57:11'),
(151, 0, 5, 'fjhff', '5 hour', 'fvhgfff', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-05 21:02:39'),
(152, 2, 1, 'Test Match from Rave', '2 day', 'bestie match', 'bestie', NULL, NULL, NULL, NULL, NULL, '2021-01-05 23:10:35'),
(153, 1, 9, 'Hellow', '5 hour', 'Hellow', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-06 00:36:06'),
(154, 1, 7, 'dggddhbb', '5 hour', 'cvvcxxx', 'Basic Method', NULL, 'reject', '2021-01-22 22:02:43', '0000-00-00 00:00:00', 0, '2021-01-22 09:32:43'),
(155, 1, 6, 'haiiiisdfj', '4 hour', '', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-07 03:44:49'),
(156, 7, 43, 'Hello', '4 hour', 'Call for match with bino', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-07 22:38:07'),
(157, 7, 1, 'Hlo', '2 hour', 'Please register and vote for match', 'Basic Method', NULL, 'accept', '2021-01-14 21:05:16', '2021-01-14 23:05:16', 0, '2021-01-14 10:36:01'),
(158, 7, 1, 'Hi akshay', '2 hour', 'Better far away', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-14 21:55:06'),
(159, 2, 1, 'Test Match from Rave', '2 day', 'bestie match', 'bestie', NULL, NULL, NULL, NULL, NULL, '2021-01-14 22:11:36'),
(160, 2, 1, 'Test Push Notification Match', '5 hour', 'Test match', 'Basic Method', NULL, 'accept', '2021-01-15 23:51:54', '2021-01-16 04:51:54', 0, '2021-01-15 16:22:01'),
(161, 2, 1, 'Test Match', '1 hour', 'Lets see who wins', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-14 22:30:10'),
(162, 1, 2, 'Test Match from Akshay', '2 day', 'bestie match', 'bestie', NULL, NULL, NULL, NULL, NULL, '2021-01-14 22:31:19'),
(163, 1, 2, 'Test Match from Akshay', '2 day', 'bestie match', 'bestie', NULL, NULL, NULL, NULL, NULL, '2021-01-14 22:34:08'),
(164, 2, 1, 'Test', '15 hour', 'Ok go for it', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-14 22:51:43'),
(165, 1, 2, 'Test Match from Akshay', '2 day', 'bestie match', 'bestie', NULL, NULL, NULL, NULL, NULL, '2021-01-14 22:59:32'),
(166, 2, 1, 'Test Match from Raveena', '2 day', 'bestie match', 'bestie', NULL, NULL, NULL, NULL, NULL, '2021-01-14 23:05:58'),
(167, 2, 5, 'Test Match from Raveena', '2 day', 'bestie match', 'bestie', NULL, NULL, NULL, NULL, NULL, '2021-01-14 23:08:52'),
(168, 2, 1, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, NULL, NULL, NULL, NULL, '2021-01-14 23:59:52'),
(169, 2, 1, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, NULL, NULL, NULL, NULL, '2021-01-15 00:01:47'),
(170, 2, 1, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, NULL, NULL, NULL, NULL, '2021-01-15 00:02:36'),
(171, 2, 1, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-16 00:06:37', '2021-01-17 00:06:37', 0, '2021-01-16 11:37:01'),
(172, 2, 1, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-16 00:04:39', '2021-01-17 00:04:39', 0, '2021-01-16 11:35:01'),
(173, 5, 1, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, 'accept', '2021-01-16 00:23:14', '2021-01-17 00:23:14', 0, '2021-01-16 11:54:01'),
(174, 4, 1, 'Lets Have a match', '1 day', 'bestie match', 'bestie', NULL, NULL, '2021-01-16 00:17:11', '2021-01-17 00:17:11', 0, '2021-01-16 11:48:01'),
(175, 7, 1, 'Pic of us in our room', '1 hour', 'Chilling', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-18 18:58:55'),
(176, 7, 1, 'Tgguh', '1 hour', 'Cvhgff', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-18 19:03:40'),
(177, 7, 1, 'Vhn', '2 hour', 'Vnn', 'Basic Method', NULL, 'reject', '2021-01-23 04:06:28', '0000-00-00 00:00:00', 0, '2021-01-22 15:36:28'),
(178, 7, 1, 'Shopping pic', '1 hour', '15 bags full still not done! Beat that momma!', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-22 19:15:17'),
(179, 7, 49, 'I dare you to a shopping spree pic', '1 hour', 'Gozzila shopping! Beat it????', 'Basic Method', NULL, 'accept', '2021-01-22 23:17:05', '2021-01-23 00:17:05', 0, '2021-01-22 11:48:01'),
(180, 49, 3, 'Haii', '1 hour', 'Htya', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-22 23:14:56'),
(181, 49, 3, 'Haii', '1 hour', 'Htya', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-22 23:15:03'),
(182, 49, 3, 'Haii', '1 hour', 'Htya', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-22 23:15:03'),
(183, 49, 3, 'Haii', '1 hour', 'Htya', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-22 23:15:04'),
(184, 49, 3, 'Haii', '1 hour', 'Htya', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-22 23:15:05'),
(185, 49, 3, 'Haii', '1 hour', 'Htya', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-22 23:15:05'),
(186, 49, 7, 'Yrur', '1 hour', 'Ejrj', 'Basic Method', NULL, 'accept', '2021-01-23 04:51:41', '2021-01-23 05:51:41', 0, '2021-01-22 17:22:01'),
(187, 49, 1, 'Hdjd', '1 hour', 'Hyr', 'Basic Method', NULL, NULL, NULL, NULL, NULL, '2021-01-26 19:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `tb_matchupload`
--

CREATE TABLE `tb_matchupload` (
  `mup_id` int(11) NOT NULL,
  `user_uploaded` int(11) DEFAULT NULL,
  `matchid` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filetype` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tb_matchupload`
--

INSERT INTO `tb_matchupload` (`mup_id`, `user_uploaded`, `matchid`, `filename`, `filetype`, `created_at`) VALUES
(1, 1, 169, '47b1818c5b8644c3de061cad5c77ca1b.jpg', 'file', '2020-12-18 00:10:00'),
(2, 2, 170, '293d2b0b48868d422a064a0ad62a5ccd.jpg', 'file', '2020-12-18 00:10:33'),
(3, 1, 171, '6929d23343501fa7784a33e82f0e4368.jpeg', 'file', '2020-12-21 22:38:15'),
(4, 2, 173, '8efcb69aaf99d13d0509be5456acf856.jpg', 'file', '2020-12-22 17:05:03'),
(5, 1, 174, '083919ca82e58e26ac8b90a92b2be14b.jpeg', 'file', '2020-12-22 21:23:58'),
(6, 1, 68, 'd87aedacd026af85c4c6bbc0300ece87.jpeg', 'file', '2020-12-22 22:01:44'),
(7, 7, 135, 'b671c9f189cd5c4c71dd9fb61ef2f354.jpeg', 'file', '2020-12-30 19:37:28'),
(8, 7, 136, 'ec6b03e8c293911ed325326ee648f2b7.jpeg', 'file', '2020-12-30 23:16:04'),
(9, 3, 143, '0d8065b2fcc664e3fc31be229902a2eb.jpg', 'file', '2020-12-31 23:21:47'),
(10, 3, 144, 'f486ed525f5e4457aee955e59befdcf5.jpg', 'file', '2021-01-02 04:09:18'),
(11, 3, 145, '5a93b7ac03bed88d1bd18bac402a15fd.jpg', 'file', '2021-01-04 17:15:22'),
(12, 3, 146, 'd3e8c13503f0068fdc39c9eebadd6055.jpg', 'file', '2021-01-04 17:47:02'),
(13, 2, 147, '19e4e6501c252245303a1ca46a8b7491.jpg', 'file', '2021-01-05 04:08:10'),
(14, 2, 0, '109a89c867c6f140d545511566243c08.jpg', 'file', '2021-01-05 16:19:28'),
(15, 1, 0, '9f378c4831e95dcbaff0244bad95b488.jpeg', 'file', '2021-01-05 18:14:07'),
(16, 1, 0, 'dbc406e3efe1345ad2a1166aa197af5b.jpeg', 'file', '2021-01-05 18:37:46'),
(17, 0, 150, 'fb96eb1f6ddc7f0a4033ec9e93f3f7f4.jpeg', 'file', '2021-01-05 20:56:42'),
(18, 0, 151, '90545096e2db073baf149841c7b390af.jpeg', 'file', '2021-01-05 21:02:20'),
(20, 2, 152, 'https://pixabay.com/photos/tree-sunset-amazing-beautiful-736885/', 'link', '2021-01-05 23:10:08'),
(21, 1, NULL, 'https://www.google.com/search?q=images&sxsrf=ALeKk02PCR3dpyUntmQApoTPvMehqPCLQQ:1609847962842&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiMsN7_3oTuAhWRbisKHXYNBscQ_AUoAXoECCQQAw&biw=1305&bih=593#imgrc=wp1tdfttzeGYZM', 'link', '2021-01-06 00:29:48'),
(22, 1, NULL, 'https://www.google.com/search?q=images&sxsrf=ALeKk02PCR3dpyUntmQApoTPvMehqPCLQQ:1609847962842&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiMsN7_3oTuAhWRbisKHXYNBscQ_AUoAXoECCQQAw&biw=1305&bih=593#imgrc=wp1tdfttzeGYZM', 'link', '2021-01-06 00:31:14'),
(23, 1, NULL, 'https://www.google.com/search?q=images&sxsrf=ALeKk02PCR3dpyUntmQApoTPvMehqPCLQQ:1609847962842&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiMsN7_3oTuAhWRbisKHXYNBscQ_AUoAXoECCQQAw&biw=1305&bih=593#imgrc=wp1tdfttzeGYZM', 'link', '2021-01-06 00:35:14'),
(24, 1, 153, 'https://www.google.com/search?q=images&sxsrf=ALeKk02PCR3dpyUntmQApoTPvMehqPCLQQ:1609847962842&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiMsN7_3oTuAhWRbisKHXYNBscQ_AUoAXoECCQQAw&biw=1305&bih=593#imgrc=wp1tdfttzeGYZM', 'link', '2021-01-06 00:35:58'),
(25, 1, NULL, 'haii', 'link', '2021-01-06 00:47:26'),
(26, 1, NULL, 'https://www.google.com/search?q=images&sxsrf=ALeKk02PCR3dpyUntmQApoTPvMehqPCLQQ:1609847962842&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiMsN7_3oTuAhWRbisKHXYNBscQ_AUoAXoECCQQAw&biw=1305&bih=593#imgrc=wp1tdfttzeGYZM', 'link', '2021-01-06 00:56:54'),
(27, 1, 0, '5d3326ade629b24eb4050a615790cd29.jpeg', 'file', '2021-01-06 03:55:32'),
(28, 1, 98, 'c6d0913c0e6bf195347145460a896627.jpeg', 'file', '2021-01-06 04:02:49'),
(29, 1, 111, 'fc0d27d739df5a68f5298e47c5174d26.jpeg', 'file', '2021-01-06 04:08:29'),
(30, 7, 0, '0ab7a256ce10cc3371fc2cd768aa588b.jpeg', 'file', '2021-01-06 19:26:07'),
(31, 1, 155, 'https://www.google.com/search?q=images&tbm=isch&chips=q:images,g_1:nature:jii0l65qR0s%3D&hl=en-GB&sa=X&ved=2ahUKEwjHxoevzIfuAhXP7TgGHVZMCaAQ4lYoA3oECAEQHg&biw=1351&bih=593#imgrc=sR_qSGaBdBlIzM', 'link', '2021-01-07 03:44:37'),
(32, 7, 0, '6d488e7ad59d441e5fefbfb73d8d54ff.jpeg', 'file', '2021-01-07 22:37:53'),
(33, 7, 0, '205d387ebd6e7c7b785aefc1995f41ef.jpeg', 'file', '2021-01-07 22:42:35'),
(34, 7, 157, 'www.myntra.com', 'link', '2021-01-07 23:01:09'),
(35, 7, 0, 'bf09b76ba1a9869715f1bb723f07b341.jpeg', 'file', '2021-01-14 21:54:57'),
(36, 2, 0, '7c553184fb00e2d896599157d0455a5f.jpeg', 'file', '2021-01-14 22:24:08'),
(37, 1, 113, 'e63faa27e882f63e9d4868a0fc709b77.jpeg', 'file', '2021-01-14 22:29:45'),
(38, 2, 0, '3ffa318d13f2226704d397e22960574a.jpeg', 'file', '2021-01-14 22:29:59'),
(39, 2, 0, 'b26558b350de703bdc256d656e03257f.jpeg', 'file', '2021-01-14 22:51:22'),
(40, 7, 0, '4aea265f2efe45c8eccf77589bd7944c.jpeg', 'file', '2021-01-18 18:36:15'),
(41, 7, 0, '56b2a04dd0c3a3dd947f9db779f00756.jpeg', 'file', '2021-01-18 19:03:33'),
(42, 7, 0, '1dce5036422891fa8a1802d6cb0a5521.jpeg', 'file', '2021-01-18 22:49:49'),
(43, 7, 0, '76b1aeac3b7d4f4f5525827afd71c52d.jpeg', 'file', '2021-01-22 19:14:47'),
(44, 7, 0, '57eaf81717bf8aee67ba16624033f376.jpeg', 'file', '2021-01-22 22:01:15'),
(45, 49, 0, 'e52d7c59b3016b315cdc9b6f124f5950.jpeg', 'file', '2021-01-22 23:41:17'),
(46, 49, 0, '64bed839a1e11e8e4836c4b39fa71821.jpeg', 'file', '2021-01-26 19:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `tb_momentcomment`
--

CREATE TABLE `tb_momentcomment` (
  `mcomment_id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `momentid` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_momentcomment`
--

INSERT INTO `tb_momentcomment` (`mcomment_id`, `userid`, `momentid`, `comment`, `updated_at`) VALUES
(1, 2, 1, 'guhyo', '2020-12-15 04:45:29'),
(2, 2, 1, 'gihuj', '2020-12-15 05:11:08'),
(3, 1, 1, 'wow', '2020-12-15 16:53:47'),
(4, 1, 1, 'nice', '2020-12-15 17:30:04'),
(5, 1, 1, 'great', '2020-12-15 17:30:17'),
(6, 1, 2, 'Great', '2020-12-15 17:36:48'),
(7, 1, 3, 'haii', '2020-12-15 18:04:27'),
(8, 1, 3, 'hellow', '2020-12-15 18:04:39'),
(9, 1, 3, 'wow', '2020-12-15 20:54:02'),
(10, 1, 1, 'Hellow', '2020-12-15 21:32:09'),
(11, 1, 2, 'Wow', '2020-12-15 21:32:35'),
(12, 1, 3, 'hellow oll', '2020-12-16 23:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `tb_momentlike`
--

CREATE TABLE `tb_momentlike` (
  `momentlike_id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `momentid` int(11) DEFAULT NULL,
  `like_status` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_momentlike`
--

INSERT INTO `tb_momentlike` (`momentlike_id`, `userid`, `momentid`, `like_status`, `updated_at`) VALUES
(1, 1, 1, 'like', '2020-12-15 04:23:32'),
(2, 1, 2, 'dislike', '2020-12-15 21:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `tb_MyiQuery`
--

CREATE TABLE `tb_MyiQuery` (
  `queryid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `query1` varchar(255) DEFAULT NULL,
  `query2` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tb_MyiQuery`
--

INSERT INTO `tb_MyiQuery` (`queryid`, `user_id`, `query1`, `query2`, `created_at`) VALUES
(2, 2, 'how are you', 'hello', '2020-11-06 06:37:15'),
(3, 2, 'how are you', 'doing good', '2020-11-06 06:46:16'),
(4, 2, 'how are you', 'doing good', '2020-11-06 07:43:13'),
(12, 36, 'haii', 'helow', '2020-11-09 06:19:38'),
(13, 36, 'nice', 'great', '2020-11-09 06:46:35'),
(19, 2, '123', '1234', '2020-11-11 07:59:26'),
(20, 38, 'When you don\'t know where to start,\njust go to a place you miss so much.', 'After a long silence, Dodge cleared his throat. \"I think I speak for all of us when I say, \'Huh?\'\"\n-Dodge(obviously)', '2020-11-11 09:25:07'),
(21, 38, 'When you don\'t know where to start,\njust go to a place you miss so much.', 'I do not understand this analogy,\" Mencheres muttered.', '2020-11-11 09:25:20'),
(22, 1, 'When you don\'t know where to start,\njust go to a place you miss so much.', 'When you don\'t know where to start,\njust go to a place you miss so much.', '2020-11-12 04:42:12'),
(23, 1, 'I just want to be someone, to mean something to anyone…', 'I just want to be someone, to mean something to anyone…', '2020-11-12 04:42:52'),
(26, 1, 'I do not understand this analogy,\" Mencheres muttered.', 'I do not understand this analogy,\" Mencheres muttered.', '2020-11-12 15:17:02'),
(42, 40, 'A real friend is one who walks in when the rest of the world walks out.', 'True friendship comes when the silence between two people is comfortable.', '2020-11-17 08:45:17'),
(43, 42, 'A single rose can be my garden… a single friend, my world....', 'There’s not a word yet for old friends who’ve just met...', '2020-11-17 10:39:45'),
(44, 42, 'What you do not want done to yourself, do not do to others.', 'A true friend never gets in your way unless you happen to be going down.', '2020-11-17 10:41:38'),
(47, 7, 'Hi @ all ', 'Hello @ all', '2020-11-24 10:41:35');

-- --------------------------------------------------------

--
-- Table structure for table `tb_myiquerycomment`
--

CREATE TABLE `tb_myiquerycomment` (
  `querycomment_id` int(11) NOT NULL,
  `user_commented` int(11) DEFAULT NULL,
  `queryid` int(11) DEFAULT NULL,
  `querynum` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `userstatus` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_myiquerycomment`
--

INSERT INTO `tb_myiquerycomment` (`querycomment_id`, `user_commented`, `queryid`, `querynum`, `comment`, `userstatus`, `updated_at`) VALUES
(1, 1, 2, 'query1', 'good', 'vistor', '2020-11-11 09:28:22'),
(2, 1, 2, 'query1', 'good', 'vistor', '2020-11-11 09:29:29'),
(3, 38, 7, 'query1', 'haii', 'vistor', '2020-11-11 17:01:53'),
(4, 38, 7, 'query1', 'nice', 'vistor', '2020-11-11 17:07:41'),
(5, 38, 7, 'query1', 'Great', 'vistor', '2020-11-11 17:08:20'),
(6, 38, 7, 'query1', 'Awsome', 'vistor', '2020-11-11 17:08:27'),
(7, 38, 7, 'query1', 'Cute', 'vistor', '2020-11-11 17:08:36'),
(8, 38, 7, 'query1', '', 'vistor', '2020-11-11 17:55:59'),
(9, 38, 7, 'query1', 'hellow guys', 'vistor', '2020-11-12 04:12:44'),
(10, 38, 7, 'query1', 'haii everybody', 'vistor', '2020-11-12 04:14:34'),
(11, 38, 10, 'query2', 'haii guys', 'vistor', '2020-11-12 04:22:42'),
(12, 38, 10, 'query2', 'haii da', 'vistor', '2020-11-12 04:30:25'),
(13, 38, 10, 'query2', 'haii da', 'vistor', '2020-11-12 04:34:07'),
(14, 38, 10, 'query2', 'haii deii', 'vistor', '2020-11-12 04:34:32'),
(15, 38, 10, 'query2', 'Great thought', 'vistor', '2020-11-12 04:34:59'),
(16, 38, 10, 'query2', 'Great thought', 'vistor', '2020-11-12 04:37:42'),
(17, 38, 10, 'query2', 'guys', 'vistor', '2020-11-12 04:40:24'),
(18, 38, 22, 'query2', 'haii guys', 'vistor', '2020-11-12 04:44:45'),
(19, 38, 22, 'query1', 'hellow', 'vistor', '2020-11-12 05:05:20'),
(20, 38, 22, 'query1', 'hellow guys', 'vistor', '2020-11-12 05:05:27'),
(21, 38, 22, 'query1', 'That was reallyu good', 'vistor', '2020-11-12 05:05:40'),
(22, 38, 22, 'query1', 'That was reallyu good', 'vistor', '2020-11-12 05:05:43'),
(23, 38, 23, 'query2', 'hey', 'vistor', '2020-11-12 05:08:09'),
(24, 38, 23, 'query2', 'hellow', 'vistor', '2020-11-12 05:08:15'),
(25, 38, 23, 'query2', 'how r u guys???', 'vistor', '2020-11-12 05:08:29'),
(26, 43, 47, 'query1', 'Hello', 'vistor', '2020-11-24 11:11:59'),
(27, 43, 47, 'query2', 'Hello', 'vistor', '2020-11-24 11:14:00'),
(28, 43, 47, 'query2', 'Hello again', 'vistor', '2020-11-24 11:14:18'),
(29, 1, 2, 'query1', 'haii guys', 'vistor', '2020-11-26 10:01:57'),
(30, 1, 2, 'query1', 'hellow', 'vistor', '2020-11-26 10:02:05'),
(31, 1, 2, 'query1', 'Heyy', 'vistor', '2020-11-28 08:56:29'),
(32, 1, 2, 'query2', 'Heyy', 'vistor', '2020-11-28 08:57:40');

-- --------------------------------------------------------

--
-- Table structure for table `tb_myiquerylike`
--

CREATE TABLE `tb_myiquerylike` (
  `iquerylike_id` int(11) NOT NULL,
  `user_liked` int(11) DEFAULT NULL,
  `myqueryid` int(11) DEFAULT NULL,
  `querynum` varchar(255) DEFAULT NULL,
  `like_status` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_myiquerylike`
--

INSERT INTO `tb_myiquerylike` (`iquerylike_id`, `user_liked`, `myqueryid`, `querynum`, `like_status`, `updated_at`) VALUES
(1, 1, 7, 'query1', 'like', '2020-11-11 09:10:39'),
(2, 1, 10, 'query2', 'like', '2020-11-11 13:23:15'),
(3, 1, 7, 'query2', 'dislike', '2020-11-11 14:54:03'),
(4, 1, 18, 'query2', 'dislike', '2020-11-11 14:54:19'),
(5, 1, 22, 'query2', 'like', '2020-11-12 04:44:32'),
(6, 1, 22, 'query1', 'like', '2020-11-12 05:05:11'),
(7, 7, 47, 'query1', 'like', '2020-11-24 11:08:08'),
(8, 7, 47, 'query2', 'like', '2020-11-24 11:08:11');

-- --------------------------------------------------------

--
-- Table structure for table `tb_notification`
--

CREATE TABLE `tb_notification` (
  `not_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `notification_status` varchar(255) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_notification`
--

INSERT INTO `tb_notification` (`not_id`, `sender_id`, `receiver_id`, `message`, `notification_status`, `request_id`, `created_at`) VALUES
(1, 20, 1, 'raveena added you as squad', 'Add_Bestie', 1, '2020-09-11 04:18:34'),
(2, 1, 20, 'You have added Akshay to your squad list', 'Add_Bestie', 1, '2020-09-11 04:18:34'),
(3, 20, 3, 'raveena added you as bestie', 'Add_Bestie', 2, '2020-09-11 04:19:02'),
(4, 3, 20, 'You have added jitheesh to your bestie list', 'Add_Bestie', 2, '2020-09-11 04:19:02'),
(5, 1, 3, 'Akshay added you as squad', 'Add_Bestie', 3, '2020-09-11 05:46:24'),
(6, 3, 1, 'You have added jitheesh to your squad list', 'Add_Bestie', 3, '2020-09-11 05:46:24'),
(7, 1, 2, 'Akshay added you as squad', 'Add_Bestie', 4, '2020-09-11 05:48:30'),
(8, 2, 1, 'You have added Ravi to your squad list', 'Add_Bestie', 4, '2020-09-11 05:48:30'),
(9, 1, 6, 'Akshay added you as squad', 'Add_Bestie', 5, '2020-09-11 06:31:44'),
(10, 6, 1, 'You have added Test 2 to your squad list', 'Add_Bestie', 5, '2020-09-11 06:31:44'),
(11, 1, 9, 'Akshay added you as squad', 'Add_Bestie', 6, '2020-09-11 06:35:25'),
(12, 9, 1, 'You have added Aoc to your squad list', 'Add_Bestie', 6, '2020-09-11 06:35:25'),
(13, 1, 5, 'Akshay added you as squad', 'Add_Bestie', 7, '2020-09-11 09:41:53'),
(14, 5, 1, 'You have added jitheesh  to your squad list', 'Add_Bestie', 7, '2020-09-11 09:41:53'),
(15, 20, 1, 'raveena added you as squad', 'Add_Bestie', 8, '2020-09-11 11:56:53'),
(16, 1, 20, 'You have added Akshay to your squad list', 'Add_Bestie', 8, '2020-09-11 11:56:53'),
(17, 20, 3, 'raveena added you as bestie', 'Add_Bestie', 9, '2020-09-11 11:57:22'),
(18, 3, 20, 'You have added jitheesh to your bestie list', 'Add_Bestie', 9, '2020-09-11 11:57:22'),
(19, 21, 19, 'Lisa added you as squad', 'Add_Bestie', 10, '2020-09-14 03:55:04'),
(20, 19, 21, 'You have added Binoy to your squad list', 'Add_Bestie', 10, '2020-09-14 03:55:04'),
(21, 21, 1, 'Lisa added you as squad', 'Add_Bestie', 11, '2020-09-14 03:55:09'),
(22, 1, 21, 'You have added Akshay to your squad list', 'Add_Bestie', 11, '2020-09-14 03:55:09'),
(23, 21, 19, 'Lisa added you as bestie', 'Add_Bestie', 12, '2020-09-14 03:55:37'),
(24, 19, 21, 'You have added Binoy to your bestie list', 'Add_Bestie', 12, '2020-09-14 03:55:37'),
(25, 21, 7, 'Lisa added you as bestie', 'Add_Bestie', 13, '2020-09-14 03:55:52'),
(26, 7, 21, 'You have added Sam to your bestie list', 'Add_Bestie', 13, '2020-09-14 03:55:52'),
(27, 21, 8, 'Lisa added you as bestie', 'Add_Bestie', 14, '2020-09-14 03:55:55'),
(28, 8, 21, 'You have added Neethu to your bestie list', 'Add_Bestie', 14, '2020-09-14 03:55:55'),
(29, 21, 1, 'Lisa added you as bestie', 'Add_Bestie', 15, '2020-09-14 03:56:12'),
(30, 1, 21, 'You have added Akshay to your bestie list', 'Add_Bestie', 15, '2020-09-14 03:56:12'),
(31, 1, 2, 'Akshay added you as bestie', 'Add_Bestie', 16, '2020-09-16 05:48:26'),
(32, 2, 1, 'You have added Ravi to your bestie list', 'Add_Bestie', 16, '2020-09-16 05:48:26'),
(33, 1, 3, 'Akshay added you as bestie', 'Add_Bestie', 17, '2020-09-16 05:54:58'),
(34, 3, 1, 'You have added jitheesh to your bestie list', 'Add_Bestie', 17, '2020-09-16 05:54:58'),
(35, 1, 11, 'Akshay added you as bestie', 'Add_Bestie', 18, '2020-09-16 15:05:44'),
(36, 11, 1, 'You have added kunjan to your bestie list', 'Add_Bestie', 18, '2020-09-16 15:05:44'),
(37, 1, 5, 'Akshay added you as bestie', 'Add_Bestie', 19, '2020-09-16 15:13:34'),
(38, 5, 1, 'You have added jitheesh  to your bestie list', 'Add_Bestie', 19, '2020-09-16 15:13:34'),
(39, 1, 17, 'Akshay added you as bestie', 'Add_Bestie', 20, '2020-09-16 15:18:27'),
(40, 17, 1, 'You have added Ram to your bestie list', 'Add_Bestie', 20, '2020-09-16 15:18:27'),
(41, 1, 6, 'Akshay added you as bestie', 'Add_Bestie', 21, '2020-09-16 15:19:50'),
(42, 6, 1, 'You have added Test 2 to your bestie list', 'Add_Bestie', 21, '2020-09-16 15:19:50'),
(43, 22, 1, 'Philip added you as bestie', 'Add_Bestie', 22, '2020-09-16 16:21:49'),
(44, 1, 22, 'You have added Akshay to your bestie list', 'Add_Bestie', 22, '2020-09-16 16:21:49'),
(45, 7, 8, 'Sam added you as squad', 'Add_Bestie', 23, '2020-09-17 10:18:30'),
(46, 8, 7, 'You have added Neethu to your squad list', 'Add_Bestie', 23, '2020-09-17 10:18:30'),
(47, 7, 12, 'Sam added you as squad', 'Add_Bestie', 24, '2020-09-17 10:18:49'),
(48, 12, 7, 'You have added Kanna to your squad list', 'Add_Bestie', 24, '2020-09-17 10:18:49'),
(49, 7, 19, 'Sam added you as squad', 'Add_Bestie', 25, '2020-09-17 10:18:53'),
(50, 19, 7, 'You have added Binoy to your squad list', 'Add_Bestie', 25, '2020-09-17 10:18:53'),
(51, 7, 19, 'Sam added you as bestie', 'Add_Bestie', 26, '2020-09-17 10:29:31'),
(52, 19, 7, 'You have added Binoy to your bestie list', 'Add_Bestie', 26, '2020-09-17 10:29:31'),
(53, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 1, '2020-09-18 17:27:43'),
(54, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 1, '2020-09-18 17:27:43'),
(63, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-18 17:57:36'),
(64, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-18 17:57:36'),
(65, 23, 8, 'Kiran added you as bestie', 'Add_Bestie', 27, '2020-09-21 08:05:05'),
(66, 8, 23, 'You have added Neethu to your bestie list', 'Add_Bestie', 27, '2020-09-21 08:05:05'),
(67, 1, 4, 'Akshay added you as bestie', 'Add_Bestie', 28, '2020-09-21 08:28:21'),
(68, 4, 1, 'You have added jitheesh to your bestie list', 'Add_Bestie', 28, '2020-09-21 08:28:21'),
(69, 1, 19, 'Akshay added you as bestie', 'Add_Bestie', 29, '2020-09-21 08:34:32'),
(70, 19, 1, 'You have added Binoy to your bestie list', 'Add_Bestie', 29, '2020-09-21 08:34:32'),
(71, 1, 15, 'Akshay added you as squad', 'Add_Bestie', 30, '2020-09-21 08:36:36'),
(72, 15, 1, 'You have added Ravi to your squad list', 'Add_Bestie', 30, '2020-09-21 08:36:36'),
(73, 7, 1, 'Sam added you as squad', 'Add_Bestie', 31, '2020-09-21 11:44:31'),
(74, 1, 7, 'You have added Akshay to your squad list', 'Add_Bestie', 31, '2020-09-21 11:44:31'),
(75, 23, 8, 'Kiran Invited you from bestie list to have a Match of 01:00:00 duration', 'Match_invitation', 2, '2020-09-22 13:09:26'),
(76, 8, 23, 'You have Invited Neethu from bestie list to have a Match of 01:00:00 duration', 'Match_invitation', 2, '2020-09-22 13:09:26'),
(77, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-24 05:31:09'),
(78, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-24 05:31:09'),
(79, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-24 06:01:20'),
(80, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-24 06:01:20'),
(81, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-24 06:02:03'),
(82, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-24 06:02:03'),
(83, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-24 06:02:40'),
(84, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-24 06:02:40'),
(85, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-24 06:03:11'),
(86, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-24 06:03:11'),
(87, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-24 08:59:15'),
(88, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-24 08:59:15'),
(89, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-24 10:58:40'),
(90, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-24 10:58:40'),
(91, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-25 05:04:03'),
(92, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-25 05:04:03'),
(93, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-25 05:51:28'),
(94, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-25 05:51:28'),
(95, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-25 05:55:39'),
(96, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-25 05:55:39'),
(97, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-25 06:16:47'),
(98, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-25 06:16:47'),
(99, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-25 06:17:27'),
(100, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-25 06:17:27'),
(101, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-25 06:19:47'),
(102, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-25 06:19:47'),
(103, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-25 06:25:23'),
(104, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-25 06:25:23'),
(105, 8, 1, 'Neethu Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 3, '2020-09-25 07:43:09'),
(106, 1, 8, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 3, '2020-09-25 07:43:09'),
(107, 5, 1, 'jitheesh  Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 4, '2020-09-25 07:44:02'),
(108, 1, 5, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 4, '2020-09-25 07:44:02'),
(109, 1, 5, 'Akshay Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 5, '2020-09-25 07:45:47'),
(110, 5, 1, 'You have Invited jitheesh  from bestie list to have a Match of 1 hour duration', 'Match_invitation', 5, '2020-09-25 07:45:47'),
(111, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-25 08:36:10'),
(112, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-25 08:36:10'),
(113, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-25 08:36:45'),
(114, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-25 08:36:45'),
(115, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-25 08:37:42'),
(116, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-25 08:37:42'),
(117, 23, 8, 'Your Invitation is accepted by Neethu', 'match_reply', 2, '2020-09-25 09:46:13'),
(118, 8, 23, 'You have accepted Invitation from Kiran', 'match_reply', 2, '2020-09-25 09:46:13'),
(119, 23, 8, 'Your Invitation is rejected by Neethu', 'match_reply', 2, '2020-09-25 10:09:32'),
(120, 8, 23, 'You have rejected Invitation from Kiran', 'match_reply', 2, '2020-09-25 10:09:32'),
(121, 1, 5, 'Akshay Invited you from squad list to have a Match of 1 hour duration', 'Match_invitation', 6, '2020-09-25 13:08:38'),
(122, 5, 1, 'You have Invited jitheesh  from squad list to have a Match of 1 hour duration', 'Match_invitation', 6, '2020-09-25 13:08:38'),
(123, 1, 2, 'Akshay Invited you from squad list to have a Match of 1 hour duration', 'Match_invitation', 7, '2020-09-25 13:12:22'),
(124, 2, 1, 'You have Invited Ravi from squad list to have a Match of 1 hour duration', 'Match_invitation', 7, '2020-09-25 13:12:22'),
(125, 5, 1, 'jitheesh  Invited you from squad list to have a Match of 1 hour duration', 'Match_invitation', 8, '2020-09-25 13:18:58'),
(126, 1, 5, 'You have Invited Akshay from squad list to have a Match of 1 hour duration', 'Match_invitation', 8, '2020-09-25 13:18:58'),
(127, 2, 1, 'Ravi Invited you from squad list to have a Match of 1 hour duration', 'Match_invitation', 9, '2020-09-25 13:51:00'),
(128, 1, 2, 'You have Invited Akshay from squad list to have a Match of 1 hour duration', 'Match_invitation', 9, '2020-09-25 13:51:00'),
(129, 3, 1, 'jitheesh Invited you from squad list to have a Match of 1 hour duration', 'Match_invitation', 10, '2020-09-25 13:51:06'),
(130, 1, 3, 'You have Invited Akshay from squad list to have a Match of 1 hour duration', 'Match_invitation', 10, '2020-09-25 13:51:06'),
(131, 8, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 3, '2020-09-25 14:07:08'),
(132, 1, 8, 'You have accepted Invitation from Neethu', 'match_reply', 3, '2020-09-25 14:07:08'),
(133, 2, 5, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 11, '2020-09-28 13:10:51'),
(134, 5, 2, 'You have Invited jitheesh  from bestie list to have a Match of 1 hour duration', 'Match_invitation', 11, '2020-09-28 13:10:51'),
(135, 2, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 11, '2020-09-28 13:11:21'),
(136, 5, 2, 'You have accepted Invitation from Ravi', 'match_reply', 11, '2020-09-28 13:11:21'),
(137, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 7, '2020-09-29 06:09:38'),
(138, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 7, '2020-09-29 06:09:38'),
(139, 1, 2, 'Akshay added you as fan', 'Add_Fan', 1, '2020-09-29 06:41:33'),
(140, 2, 1, 'You have added Ravi to your fan list', 'Add_Fan', 1, '2020-09-29 06:41:33'),
(141, 1, 2, 'Akshay added you as fan_of', 'Add_Fan', 2, '2020-09-29 06:41:50'),
(142, 2, 1, 'You have added Ravi to your fan_of list', 'Add_Fan', 2, '2020-09-29 06:41:50'),
(143, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 4, '2020-09-29 16:36:59'),
(144, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 4, '2020-09-29 16:36:59'),
(145, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 7, '2020-09-30 07:01:24'),
(146, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 7, '2020-09-30 07:01:24'),
(147, 1, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 5, '2020-09-30 07:01:32'),
(148, 5, 1, 'You have accepted Invitation from Akshay', 'match_reply', 5, '2020-09-30 07:01:32'),
(149, 1, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 6, '2020-09-30 07:01:39'),
(150, 5, 1, 'You have accepted Invitation from Akshay', 'match_reply', 6, '2020-09-30 07:01:39'),
(151, 1, 20, 'Akshay Invited you from bestie list to have a Match of 7 day duration', 'Match_invitation', 12, '2020-09-30 09:41:00'),
(152, 20, 1, 'You have Invited raveena from bestie list to have a Match of 7 day duration', 'Match_invitation', 12, '2020-09-30 09:41:00'),
(153, 1, 11, 'Akshay Invited you from bestie list to have a Match of 7 day duration', 'Match_invitation', 13, '2020-09-30 09:47:35'),
(154, 11, 1, 'You have Invited kunjan from bestie list to have a Match of 7 day duration', 'Match_invitation', 13, '2020-09-30 09:47:35'),
(155, 1, 21, 'Akshay Invited you from bestie list to have a Match of 7 day duration', 'Match_invitation', 14, '2020-09-30 12:32:21'),
(156, 21, 1, 'You have Invited Lisa from bestie list to have a Match of 7 day duration', 'Match_invitation', 14, '2020-09-30 12:32:21'),
(157, 1, 2, 'Akshay Invited you from bestie list to have a Match of 7 day duration', 'Match_invitation', 15, '2020-09-30 12:32:49'),
(158, 2, 1, 'You have Invited Ravi from bestie list to have a Match of 7 day duration', 'Match_invitation', 15, '2020-09-30 12:32:49'),
(159, 1, 19, 'Akshay Invited you from bestie list to have a Match of 7 day duration', 'Match_invitation', 16, '2020-09-30 12:49:20'),
(160, 19, 1, 'You have Invited Binoy from bestie list to have a Match of 7 day duration', 'Match_invitation', 16, '2020-09-30 12:49:20'),
(161, 1, 6, 'Akshay Invited you from bestie list to have a Match of 3 day duration', 'Match_invitation', 17, '2020-09-30 12:55:04'),
(162, 6, 1, 'You have Invited Test 2 from bestie list to have a Match of 3 day duration', 'Match_invitation', 17, '2020-09-30 12:55:04'),
(163, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-30 17:42:09'),
(164, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-30 17:42:09'),
(165, 2, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 11, '2020-09-30 17:42:18'),
(166, 5, 2, 'You have accepted Invitation from Ravi', 'match_reply', 11, '2020-09-30 17:42:18'),
(167, 1, 20, 'Your Invitation is accepted by raveena', 'match_reply', 12, '2020-10-01 11:25:49'),
(168, 20, 1, 'You have accepted Invitation from Akshay', 'match_reply', 12, '2020-10-01 11:25:49'),
(169, 1, 11, 'Your Invitation is accepted by kunjan', 'match_reply', 13, '2020-10-01 11:25:54'),
(170, 11, 1, 'You have accepted Invitation from Akshay', 'match_reply', 13, '2020-10-01 11:25:54'),
(171, 1, 21, 'Your Invitation is accepted by Lisa', 'match_reply', 14, '2020-10-01 11:25:59'),
(172, 21, 1, 'You have accepted Invitation from Akshay', 'match_reply', 14, '2020-10-01 11:25:59'),
(173, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 15, '2020-10-01 11:26:04'),
(174, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 15, '2020-10-01 11:26:04'),
(175, 1, 19, 'Your Invitation is accepted by Binoy', 'match_reply', 16, '2020-10-01 11:26:09'),
(176, 19, 1, 'You have accepted Invitation from Akshay', 'match_reply', 16, '2020-10-01 11:26:09'),
(177, 1, 6, 'Your Invitation is accepted by Test 2', 'match_reply', 17, '2020-10-01 11:26:23'),
(178, 6, 1, 'You have accepted Invitation from Akshay', 'match_reply', 17, '2020-10-01 11:26:23'),
(179, 1, 3, 'Akshay Invited you from undefined list to have a Match of 7 day duration', 'Match_invitation', 18, '2020-10-08 12:24:40'),
(180, 3, 1, 'You have Invited jitheesh from undefined list to have a Match of 7 day duration', 'Match_invitation', 18, '2020-10-08 12:24:40'),
(181, 1, 2, 'Akshay Invited you from undefined list to have a Match of 7 day duration', 'Match_invitation', 19, '2020-10-09 05:38:39'),
(182, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 7 day duration', 'Match_invitation', 19, '2020-10-09 05:38:39'),
(183, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 19, '2020-10-09 05:44:09'),
(184, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 19, '2020-10-09 05:44:09'),
(185, 1, 3, 'Your Invitation is accepted by jitheesh', 'match_reply', 18, '2020-10-09 05:44:15'),
(186, 3, 1, 'You have accepted Invitation from Akshay', 'match_reply', 18, '2020-10-09 05:44:15'),
(187, 1, 6, 'Akshay Invited you from undefined list to have a Match of 7 day duration', 'Match_invitation', 20, '2020-10-09 06:52:27'),
(188, 6, 1, 'You have Invited Test 2 from undefined list to have a Match of 7 day duration', 'Match_invitation', 20, '2020-10-09 06:52:27'),
(189, 1, 10, 'Akshay Invited you from undefined list to have a Match of 5 day duration', 'Match_invitation', 21, '2020-10-12 16:31:01'),
(190, 10, 1, 'You have Invited Nizam from undefined list to have a Match of 5 day duration', 'Match_invitation', 21, '2020-10-12 16:31:01'),
(191, 1, 7, 'Akshay Invited you from undefined list to have a Match of 4 day duration', 'Match_invitation', 22, '2020-10-13 04:02:48'),
(192, 7, 1, 'You have Invited Sam from undefined list to have a Match of 4 day duration', 'Match_invitation', 22, '2020-10-13 04:02:48'),
(193, 7, 19, 'Sam Invited you from undefined list to have a Match of 19 hour duration', 'Match_invitation', 23, '2020-10-14 07:18:32'),
(194, 19, 7, 'You have Invited Binoy from undefined list to have a Match of 19 hour duration', 'Match_invitation', 23, '2020-10-14 07:18:32'),
(195, 7, 8, 'Sam Invited you from undefined list to have a Match of 21 hour duration', 'Match_invitation', 24, '2020-10-14 07:19:30'),
(196, 8, 7, 'You have Invited Neethu from undefined list to have a Match of 21 hour duration', 'Match_invitation', 24, '2020-10-14 07:19:30'),
(197, 1, 7, 'Akshay added you as bestie', 'Add_Bestie', 32, '2020-10-14 07:22:07'),
(198, 7, 1, 'You have added Sam to your bestie list', 'Add_Bestie', 32, '2020-10-14 07:22:07'),
(199, 7, 1, 'Sam Invited you from undefined list to have a Match of 3 hour duration', 'Match_invitation', 25, '2020-10-14 08:12:54'),
(200, 1, 7, 'You have Invited Akshay from undefined list to have a Match of 3 hour duration', 'Match_invitation', 25, '2020-10-14 08:12:54'),
(201, 1, 26, 'Akshay Invited you from undefined list to have a Match of 5 hour duration', 'Match_invitation', 26, '2020-10-14 12:23:01'),
(202, 1, 26, 'Akshay Invited you from undefined list to have a Match of 5 hour duration', 'Match_invitation', 27, '2020-10-14 12:23:01'),
(203, 26, 1, 'You have Invited Kavitha from undefined list to have a Match of 5 hour duration', 'Match_invitation', 26, '2020-10-14 12:23:01'),
(204, 26, 1, 'You have Invited Kavitha from undefined list to have a Match of 5 hour duration', 'Match_invitation', 27, '2020-10-14 12:23:01'),
(205, 1, 3, 'Akshay added you as fans', 'Add_Bestie', 33, '2020-10-14 12:55:55'),
(206, 3, 1, 'You have added jitheesh to your fans list', 'Add_Bestie', 33, '2020-10-14 12:55:55'),
(207, 1, 3, 'Akshay added you as fan', 'Add_Bestie', 34, '2020-10-14 12:56:27'),
(208, 3, 1, 'You have added jitheesh to your fan list', 'Add_Bestie', 34, '2020-10-14 12:56:27'),
(209, 1, 3, 'Akshay added you as fan_of', 'Add_Bestie', 35, '2020-10-14 12:56:36'),
(210, 3, 1, 'You have added jitheesh to your fan_of list', 'Add_Bestie', 35, '2020-10-14 12:56:36'),
(211, 1, 9, 'Akshay Invited you from undefined list to have a Match of 7 day duration', 'Match_invitation', 28, '2020-10-15 06:37:24'),
(212, 9, 1, 'You have Invited Aoc from undefined list to have a Match of 7 day duration', 'Match_invitation', 28, '2020-10-15 06:37:24'),
(213, 1, 21, 'Akshay Invited you from undefined list to have a Match of 7 day duration', 'Match_invitation', 29, '2020-10-15 06:38:26'),
(214, 21, 1, 'You have Invited Lisa from undefined list to have a Match of 7 day duration', 'Match_invitation', 29, '2020-10-15 06:38:26'),
(215, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 30, '2020-10-15 07:13:58'),
(216, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 31, '2020-10-15 07:13:58'),
(217, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 30, '2020-10-15 07:13:58'),
(218, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 31, '2020-10-15 07:13:58'),
(219, 1, 6, 'Your Invitation is accepted by Test 2', 'match_reply', 20, '2020-10-15 07:23:00'),
(220, 6, 1, 'You have accepted Invitation from Akshay', 'match_reply', 20, '2020-10-15 07:23:00'),
(221, 1, 10, 'Your Invitation is accepted by Nizam', 'match_reply', 21, '2020-10-15 07:23:06'),
(222, 10, 1, 'You have accepted Invitation from Akshay', 'match_reply', 21, '2020-10-15 07:23:06'),
(223, 1, 7, 'Your Invitation is accepted by Sam', 'match_reply', 22, '2020-10-15 07:23:10'),
(224, 7, 1, 'You have accepted Invitation from Akshay', 'match_reply', 22, '2020-10-15 07:23:10'),
(225, 7, 19, 'Your Invitation is accepted by Binoy', 'match_reply', 23, '2020-10-15 07:23:13'),
(226, 19, 7, 'You have accepted Invitation from Sam', 'match_reply', 23, '2020-10-15 07:23:13'),
(227, 7, 8, 'Your Invitation is accepted by Neethu', 'match_reply', 24, '2020-10-15 07:23:31'),
(228, 8, 7, 'You have accepted Invitation from Sam', 'match_reply', 24, '2020-10-15 07:23:31'),
(229, 7, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 25, '2020-10-15 07:23:34'),
(230, 1, 7, 'You have accepted Invitation from Sam', 'match_reply', 25, '2020-10-15 07:23:34'),
(231, 1, 26, 'Your Invitation is accepted by Kavitha', 'match_reply', 26, '2020-10-15 07:23:39'),
(232, 26, 1, 'You have accepted Invitation from Akshay', 'match_reply', 26, '2020-10-15 07:23:39'),
(233, 1, 26, 'Your Invitation is accepted by Kavitha', 'match_reply', 27, '2020-10-15 07:23:45'),
(234, 26, 1, 'You have accepted Invitation from Akshay', 'match_reply', 27, '2020-10-15 07:23:45'),
(235, 1, 9, 'Your Invitation is accepted by Aoc', 'match_reply', 28, '2020-10-15 07:24:00'),
(236, 9, 1, 'You have accepted Invitation from Akshay', 'match_reply', 28, '2020-10-15 07:24:00'),
(237, 1, 21, 'Your Invitation is accepted by Lisa', 'match_reply', 29, '2020-10-15 07:24:05'),
(238, 21, 1, 'You have accepted Invitation from Akshay', 'match_reply', 29, '2020-10-15 07:24:05'),
(239, 1, 19, 'Your Invitation is accepted by Binoy', 'match_reply', 30, '2020-10-15 07:24:11'),
(240, 19, 1, 'You have accepted Invitation from Akshay', 'match_reply', 30, '2020-10-15 07:24:11'),
(241, 1, 19, 'Your Invitation is accepted by Binoy', 'match_reply', 31, '2020-10-15 07:24:15'),
(242, 19, 1, 'You have accepted Invitation from Akshay', 'match_reply', 31, '2020-10-15 07:24:15'),
(243, 1, 28, 'Akshay Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 32, '2020-10-15 07:29:01'),
(244, 28, 1, 'You have Invited William from undefined list to have a Match of 2 hour duration', 'Match_invitation', 32, '2020-10-15 07:29:01'),
(245, 1, 27, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 33, '2020-10-15 07:29:48'),
(246, 27, 1, 'You have Invited Veena from undefined list to have a Match of 1 hour duration', 'Match_invitation', 33, '2020-10-15 07:29:48'),
(247, 1, 3, 'Akshay added you as fan_of', 'Add_Fan', 5, '2020-10-15 11:52:44'),
(248, 3, 1, 'You have added jitheesh to your fan_of list', 'Add_Fan', 5, '2020-10-15 11:52:44'),
(249, 1, 3, 'Akshay added you as fan', 'Add_Fan', 6, '2020-10-15 11:53:10'),
(250, 3, 1, 'You have added jitheesh to your fan list', 'Add_Fan', 6, '2020-10-15 11:53:10'),
(251, 1, 5, 'Akshay added you as fan_of', 'Add_Fan', 7, '2020-10-15 11:53:44'),
(252, 5, 1, 'You have added jitheesh  to your fan_of list', 'Add_Fan', 7, '2020-10-15 11:53:44'),
(253, 1, 5, 'Akshay added you as fan', 'Add_Fan', 8, '2020-10-15 11:53:55'),
(254, 5, 1, 'You have added jitheesh  to your fan list', 'Add_Fan', 8, '2020-10-15 11:53:55'),
(255, 1, 2, 'Akshay added you as fan', 'Add_Fan', 9, '2020-10-15 12:18:50'),
(256, 2, 1, 'You have added Ravi to your fan list', 'Add_Fan', 9, '2020-10-15 12:18:50'),
(257, 1, 10, 'Akshay added you as fan', 'Add_Fan', 10, '2020-10-15 12:19:00'),
(258, 10, 1, 'You have added Nizam to your fan list', 'Add_Fan', 10, '2020-10-15 12:19:00'),
(259, 1, 15, 'Akshay added you as fan', 'Add_Fan', 11, '2020-10-15 12:19:05'),
(260, 15, 1, 'You have added Ravi to your fan list', 'Add_Fan', 11, '2020-10-15 12:19:05'),
(261, 1, 15, 'Akshay added you as fan_of', 'Add_Fan', 12, '2020-10-15 12:19:15'),
(262, 15, 1, 'You have added Ravi to your fan_of list', 'Add_Fan', 12, '2020-10-15 12:19:15'),
(263, 1, 9, 'Akshay added you as fan_of', 'Add_Fan', 13, '2020-10-15 12:19:37'),
(264, 9, 1, 'You have added Aoc to your fan_of list', 'Add_Fan', 13, '2020-10-15 12:19:37'),
(265, 1, 14, 'Akshay added you as fan', 'Add_Fan', 14, '2020-10-15 13:04:08'),
(266, 14, 1, 'You have added krishnan to your fan list', 'Add_Fan', 14, '2020-10-15 13:04:08'),
(267, 1, 6, 'Akshay added you as fan', 'Add_Fan', 15, '2020-10-15 13:17:52'),
(268, 6, 1, 'You have added Test 2 to your fan list', 'Add_Fan', 15, '2020-10-15 13:17:52'),
(269, 1, 6, 'Akshay added you as fan_of', 'Add_Fan', 16, '2020-10-15 14:45:02'),
(270, 6, 1, 'You have added Test 2 to your fan_of list', 'Add_Fan', 16, '2020-10-15 14:45:02'),
(271, 1, 28, 'Your Invitation is accepted by William', 'match_reply', 32, '2020-10-19 12:18:53'),
(272, 28, 1, 'You have accepted Invitation from Akshay', 'match_reply', 32, '2020-10-19 12:18:53'),
(273, 1, 27, 'Your Invitation is accepted by Veena', 'match_reply', 33, '2020-10-19 12:19:22'),
(274, 27, 1, 'You have accepted Invitation from Akshay', 'match_reply', 33, '2020-10-19 12:19:22'),
(275, 1, 11, 'Akshay Invited you from undefined list to have a Match of 5 hour duration', 'Match_invitation', 34, '2020-10-21 05:15:18'),
(276, 11, 1, 'You have Invited kunjan from undefined list to have a Match of 5 hour duration', 'Match_invitation', 34, '2020-10-21 05:15:18'),
(277, 1, 12, 'Akshay Invited you from undefined list to have a Match of 6 hour duration', 'Match_invitation', 35, '2020-10-21 05:16:11'),
(278, 12, 1, 'You have Invited Kanna from undefined list to have a Match of 6 hour duration', 'Match_invitation', 35, '2020-10-21 05:16:11'),
(279, 29, 19, 'Joe Invited you from undefined list to have a Match of 6 hour duration', 'Match_invitation', 36, '2020-10-21 12:10:56'),
(280, 19, 29, 'You have Invited Binoy from undefined list to have a Match of 6 hour duration', 'Match_invitation', 36, '2020-10-21 12:10:56'),
(281, 29, 8, 'Joe added you as squad', 'Add_Bestie', 36, '2020-10-21 12:11:37'),
(282, 8, 29, 'You have added Neethu to your squad list', 'Add_Bestie', 36, '2020-10-21 12:11:37'),
(283, 29, 7, 'Joe added you as squad', 'Add_Bestie', 37, '2020-10-21 12:11:40'),
(284, 7, 29, 'You have added Sam to your squad list', 'Add_Bestie', 37, '2020-10-21 12:11:40'),
(285, 1, 30, 'Akshay Invited you from undefined list to have a Match of 8 hour duration', 'Match_invitation', 37, '2020-10-21 14:46:29'),
(286, 30, 1, 'You have Invited Joe from undefined list to have a Match of 8 hour duration', 'Match_invitation', 37, '2020-10-21 14:46:29'),
(287, 1, 24, 'Akshay Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 38, '2020-10-21 14:49:13'),
(288, 24, 1, 'You have Invited lallu from undefined list to have a Match of 2 hour duration', 'Match_invitation', 38, '2020-10-21 14:49:13'),
(289, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 39, '2020-10-21 15:34:08'),
(290, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 39, '2020-10-21 15:34:08'),
(291, 4, 1, 'jitheesh Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 40, '2020-10-21 15:34:15'),
(292, 1, 4, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 40, '2020-10-21 15:34:15'),
(293, 6, 1, 'Test 2 Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 41, '2020-10-21 15:34:27'),
(294, 1, 6, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 41, '2020-10-21 15:34:27'),
(295, 7, 1, 'Sam Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 42, '2020-10-21 15:42:30'),
(296, 1, 7, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 42, '2020-10-21 15:42:30'),
(297, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 8, '2020-10-21 15:43:12'),
(298, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 8, '2020-10-21 15:43:12'),
(299, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 9, '2020-10-21 15:43:17'),
(300, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 9, '2020-10-21 15:43:17'),
(301, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 10, '2020-10-21 15:43:32'),
(302, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 10, '2020-10-21 15:43:32'),
(303, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 40, '2020-10-21 15:43:36'),
(304, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 40, '2020-10-21 15:43:36'),
(305, 1, 29, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 43, '2020-10-21 16:00:18'),
(306, 29, 1, 'You have Invited Joe from undefined list to have a Match of 1 hour duration', 'Match_invitation', 43, '2020-10-21 16:00:18'),
(307, 31, 1, 'Koyal added you as bestie', 'Add_Bestie', 38, '2020-10-21 16:40:56'),
(308, 1, 31, 'You have added Akshay to your bestie list', 'Add_Bestie', 38, '2020-10-21 16:40:56'),
(309, 31, 31, 'Koyal Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 44, '2020-10-21 16:47:02'),
(310, 31, 31, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 44, '2020-10-21 16:47:02'),
(311, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 45, '2020-10-23 05:39:40'),
(312, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 45, '2020-10-23 05:39:40'),
(313, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 46, '2020-10-23 05:39:40'),
(314, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 46, '2020-10-23 05:39:40'),
(315, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 47, '2020-10-23 08:36:09'),
(316, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 47, '2020-10-23 08:36:09'),
(317, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 48, '2020-10-23 08:36:10'),
(318, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 48, '2020-10-23 08:36:10'),
(319, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 49, '2020-10-23 08:36:46'),
(320, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 49, '2020-10-23 08:36:46'),
(321, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 50, '2020-10-23 08:36:46'),
(322, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 50, '2020-10-23 08:36:46'),
(323, 1, 11, 'Your Invitation is accepted by kunjan', 'match_reply', 34, '2020-10-23 14:06:45'),
(324, 11, 1, 'You have accepted Invitation from Akshay', 'match_reply', 34, '2020-10-23 14:06:45'),
(325, 1, 12, 'Your Invitation is accepted by Kanna', 'match_reply', 35, '2020-10-23 14:06:51'),
(326, 12, 1, 'You have accepted Invitation from Akshay', 'match_reply', 35, '2020-10-23 14:06:51'),
(327, 29, 19, 'Your Invitation is accepted by Binoy', 'match_reply', 36, '2020-10-23 14:06:55'),
(328, 19, 29, 'You have accepted Invitation from Joe', 'match_reply', 36, '2020-10-23 14:06:55'),
(329, 1, 30, 'Your Invitation is accepted by Joe', 'match_reply', 37, '2020-10-23 14:07:00'),
(330, 30, 1, 'You have accepted Invitation from Akshay', 'match_reply', 37, '2020-10-23 14:07:00'),
(331, 1, 24, 'Your Invitation is accepted by lallu', 'match_reply', 38, '2020-10-23 14:07:04'),
(332, 24, 1, 'You have accepted Invitation from Akshay', 'match_reply', 38, '2020-10-23 14:07:04'),
(333, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 39, '2020-10-23 14:07:08'),
(334, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 39, '2020-10-23 14:07:08'),
(335, 6, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 41, '2020-10-23 14:07:23'),
(336, 1, 6, 'You have accepted Invitation from Test 2', 'match_reply', 41, '2020-10-23 14:07:23'),
(337, 7, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 42, '2020-10-23 14:07:28'),
(338, 1, 7, 'You have accepted Invitation from Sam', 'match_reply', 42, '2020-10-23 14:07:28'),
(339, 1, 29, 'Your Invitation is accepted by Joe', 'match_reply', 43, '2020-10-23 14:07:32'),
(340, 29, 1, 'You have accepted Invitation from Akshay', 'match_reply', 43, '2020-10-23 14:07:32'),
(341, 31, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 44, '2020-10-23 14:07:36'),
(342, 31, 31, 'You have accepted Invitation from Koyal', 'match_reply', 44, '2020-10-23 14:07:36'),
(343, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 45, '2020-10-23 14:07:40'),
(344, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 45, '2020-10-23 14:07:40'),
(345, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 46, '2020-10-23 14:07:54'),
(346, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 46, '2020-10-23 14:07:54'),
(347, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 47, '2020-10-23 14:07:59'),
(348, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 47, '2020-10-23 14:07:59'),
(349, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 48, '2020-10-23 14:08:04'),
(350, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 48, '2020-10-23 14:08:04'),
(351, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 49, '2020-10-23 14:08:08'),
(352, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 49, '2020-10-23 14:08:08'),
(353, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 50, '2020-10-23 14:08:18'),
(354, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 50, '2020-10-23 14:08:18'),
(355, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 day duration', 'Match_invitation', 51, '2020-10-24 14:40:34'),
(356, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 day duration', 'Match_invitation', 52, '2020-10-24 14:40:34'),
(357, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 day duration', 'Match_invitation', 51, '2020-10-24 14:40:34'),
(358, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 day duration', 'Match_invitation', 52, '2020-10-24 14:40:34'),
(359, 1, 11, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 53, '2020-10-24 14:41:03'),
(360, 11, 1, 'You have Invited kunjan from undefined list to have a Match of 1 hour duration', 'Match_invitation', 53, '2020-10-24 14:41:03'),
(361, 1, 11, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 54, '2020-10-24 14:41:03'),
(362, 11, 1, 'You have Invited kunjan from undefined list to have a Match of 1 hour duration', 'Match_invitation', 54, '2020-10-24 14:41:03'),
(363, 1, 7, 'Akshay added you as fan', 'Add_Fan', 17, '2020-10-24 14:41:40'),
(364, 7, 1, 'You have added Sam to your fan list', 'Add_Fan', 17, '2020-10-24 14:41:40'),
(365, 1, 31, 'Akshay added you as fan_of', 'Add_Fan', 18, '2020-10-24 14:43:33'),
(366, 31, 1, 'You have added Koyal to your fan_of list', 'Add_Fan', 18, '2020-10-24 14:43:33'),
(367, 1, 14, 'Akshay added you as bestie', 'Add_Bestie', 39, '2020-10-24 14:47:12'),
(368, 14, 1, 'You have added krishnan to your bestie list', 'Add_Bestie', 39, '2020-10-24 14:47:12'),
(369, 1, 23, 'Akshay added you as squad', 'Add_Bestie', 40, '2020-10-24 14:48:05'),
(370, 23, 1, 'You have added Kiran to your squad list', 'Add_Bestie', 40, '2020-10-24 14:48:05'),
(371, 33, 5, 'Krishnanunni added you as bestie', 'Add_Bestie', 41, '2020-10-24 14:59:15'),
(372, 5, 33, 'You have added jitheesh  to your bestie list', 'Add_Bestie', 41, '2020-10-24 14:59:15'),
(373, 33, 3, 'Krishnanunni added you as fan', 'Add_Fan', 19, '2020-10-27 04:48:16'),
(374, 3, 33, 'You have added jitheesh to your fan list', 'Add_Fan', 19, '2020-10-27 04:48:16'),
(375, 33, 6, 'Krishnanunni added you as fan_of', 'Add_Fan', 20, '2020-10-27 04:53:14'),
(376, 6, 33, 'You have added Test 2 to your fan_of list', 'Add_Fan', 20, '2020-10-27 04:53:14'),
(377, 33, 3, 'Krishnanunni added you as fan', 'Add_Fan', 21, '2020-10-27 05:58:50'),
(378, 3, 33, 'You have added jitheesh to your fan list', 'Add_Fan', 21, '2020-10-27 05:58:50'),
(379, 33, 5, 'Krishnanunni added you as fan', 'Add_Fan', 22, '2020-10-27 05:59:59'),
(380, 5, 33, 'You have added jitheesh  to your fan list', 'Add_Fan', 22, '2020-10-27 05:59:59'),
(381, 33, 4, 'Krishnanunni added you as fan', 'Add_Fan', 23, '2020-10-27 06:00:03'),
(382, 4, 33, 'You have added jitheesh to your fan list', 'Add_Fan', 23, '2020-10-27 06:00:03'),
(383, 33, 3, 'Krishnanunni added you as fan', 'Add_Fan', 24, '2020-10-27 06:00:10'),
(384, 3, 33, 'You have added jitheesh to your fan list', 'Add_Fan', 24, '2020-10-27 06:00:10'),
(385, 33, 7, 'Krishnanunni added you as fan', 'Add_Fan', 25, '2020-10-27 06:10:40'),
(386, 7, 33, 'You have added Sam to your fan list', 'Add_Fan', 25, '2020-10-27 06:10:40'),
(387, 33, 10, 'Krishnanunni added you as fan', 'Add_Fan', 26, '2020-10-27 06:10:44'),
(388, 10, 33, 'You have added Nizam to your fan list', 'Add_Fan', 26, '2020-10-27 06:10:44'),
(389, 33, 14, 'Krishnanunni added you as fan', 'Add_Fan', 27, '2020-10-27 06:10:46'),
(390, 14, 33, 'You have added krishnan to your fan list', 'Add_Fan', 27, '2020-10-27 06:10:46'),
(391, 33, 5, 'Krishnanunni added you as fan_of', 'Add_Fan', 28, '2020-10-27 06:11:11'),
(392, 5, 33, 'You have added jitheesh  to your fan_of list', 'Add_Fan', 28, '2020-10-27 06:11:11'),
(393, 33, 2, 'Krishnanunni added you as fan_of', 'Add_Fan', 29, '2020-10-27 06:11:15'),
(394, 2, 33, 'You have added Ravi to your fan_of list', 'Add_Fan', 29, '2020-10-27 06:11:15'),
(395, 33, 8, 'Krishnanunni added you as fan_of', 'Add_Fan', 30, '2020-10-27 06:11:20'),
(396, 8, 33, 'You have added Neethu to your fan_of list', 'Add_Fan', 30, '2020-10-27 06:11:20'),
(397, 33, 5, 'Krishnanunni added you as squad', 'Add_Bestie', 42, '2020-10-27 06:12:18'),
(398, 5, 33, 'You have added jitheesh  to your squad list', 'Add_Bestie', 42, '2020-10-27 06:12:18'),
(399, 33, 7, 'Krishnanunni added you as squad', 'Add_Bestie', 43, '2020-10-27 06:14:36'),
(400, 7, 33, 'You have added Sam to your squad list', 'Add_Bestie', 43, '2020-10-27 06:14:36'),
(401, 33, 11, 'Krishnanunni added you as squad', 'Add_Bestie', 44, '2020-10-27 06:16:42'),
(402, 11, 33, 'You have added kunjan to your squad list', 'Add_Bestie', 44, '2020-10-27 06:16:42'),
(403, 7, 2, 'Sam added you as bestie', 'Add_Bestie', 45, '2020-10-30 06:41:35'),
(404, 2, 7, 'You have added Ravi to your bestie list', 'Add_Bestie', 45, '2020-10-30 06:41:36'),
(405, 2, 5, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 55, '2020-11-03 06:03:02'),
(406, 5, 2, 'You have Invited jitheesh  from bestie list to have a Match of 1 hour duration', 'Match_invitation', 55, '2020-11-03 06:03:02'),
(407, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 51, '2020-11-03 06:03:45'),
(408, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 51, '2020-11-03 06:03:46'),
(409, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 52, '2020-11-03 06:03:50'),
(410, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 52, '2020-11-03 06:03:51'),
(411, 2, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 55, '2020-11-03 06:03:56'),
(412, 5, 2, 'You have accepted Invitation from Ravi', 'match_reply', 55, '2020-11-03 06:03:56'),
(413, 2, 5, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 56, '2020-11-03 08:26:44'),
(414, 5, 2, 'You have Invited jitheesh  from bestie list to have a Match of 1 hour duration', 'Match_invitation', 56, '2020-11-03 08:26:44'),
(415, 2, 5, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 57, '2020-11-03 08:26:55'),
(416, 5, 2, 'You have Invited jitheesh  from bestie list to have a Match of 1 hour duration', 'Match_invitation', 57, '2020-11-03 08:26:55'),
(417, 2, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 57, '2020-11-03 08:30:38'),
(418, 5, 2, 'You have accepted Invitation from Ravi', 'match_reply', 57, '2020-11-03 08:30:38'),
(419, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 58, '2020-11-03 08:31:23'),
(420, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 58, '2020-11-03 08:31:23'),
(421, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 59, '2020-11-03 12:16:38'),
(422, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 59, '2020-11-03 12:16:38'),
(423, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 58, '2020-11-03 12:18:23'),
(424, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 58, '2020-11-03 12:18:23'),
(425, 5, 1, 'jitheesh  Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 60, '2020-11-03 12:18:46'),
(426, 1, 5, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 60, '2020-11-03 12:18:46'),
(427, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 60, '2020-11-03 12:19:00'),
(428, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 60, '2020-11-03 12:19:00'),
(429, 1, 7, 'Akshay Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 61, '2020-11-04 04:46:28'),
(430, 7, 1, 'You have Invited Sam from bestie list to have a Match of 1 hour duration', 'Match_invitation', 61, '2020-11-04 04:46:28'),
(431, 1, 7, 'Akshay Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 62, '2020-11-04 04:46:28'),
(432, 7, 1, 'You have Invited Sam from bestie list to have a Match of 1 hour duration', 'Match_invitation', 62, '2020-11-04 04:46:28'),
(433, 1, 2, 'Akshay added you as fan_of', 'Add_Fan', 31, '2020-11-06 11:21:48'),
(434, 2, 1, 'You have added Ravi to your fan_of list', 'Add_Fan', 31, '2020-11-06 11:21:48'),
(435, 1, 7, 'Akshay added you as fan', 'Add_Fan', 32, '2020-11-10 13:16:46'),
(436, 7, 1, 'You have added Sam to your fan list', 'Add_Fan', 32, '2020-11-10 13:16:46'),
(437, 1, 34, 'Akshay added you as fan', 'Add_Fan', 33, '2020-11-10 13:18:12'),
(438, 34, 1, 'You have added Christiana Mariya to your fan list', 'Add_Fan', 33, '2020-11-10 13:18:12'),
(439, 1, 3, 'Akshay added you as fan', 'Add_Fan', 34, '2020-11-12 15:21:02'),
(440, 3, 1, 'You have added jitheesh to your fan list', 'Add_Fan', 34, '2020-11-12 15:21:02'),
(441, 1, 6, 'Akshay added you as fan', 'Add_Fan', 35, '2020-11-12 15:21:07'),
(442, 6, 1, 'You have added Test 2 to your fan list', 'Add_Fan', 35, '2020-11-12 15:21:07'),
(443, 1, 9, 'Akshay added you as fan', 'Add_Fan', 36, '2020-11-12 15:21:12'),
(444, 9, 1, 'You have added Aoc to your fan list', 'Add_Fan', 36, '2020-11-12 15:21:12'),
(445, 1, 8, 'Akshay added you as fan', 'Add_Fan', 37, '2020-11-12 15:21:14'),
(446, 8, 1, 'You have added Neethu to your fan list', 'Add_Fan', 37, '2020-11-12 15:21:14'),
(447, 1, 11, 'Akshay added you as fan', 'Add_Fan', 38, '2020-11-12 15:21:18'),
(448, 11, 1, 'You have added kunjan to your fan list', 'Add_Fan', 38, '2020-11-12 15:21:18'),
(449, 1, 3, 'Akshay added you as fan_of', 'Add_Fan', 39, '2020-11-12 15:29:44'),
(450, 3, 1, 'You have added jitheesh to your fan_of list', 'Add_Fan', 39, '2020-11-12 15:29:44'),
(451, 1, 7, 'Akshay added you as fan_of', 'Add_Fan', 40, '2020-11-12 15:29:53'),
(452, 7, 1, 'You have added Sam to your fan_of list', 'Add_Fan', 40, '2020-11-12 15:29:53'),
(453, 1, 10, 'Akshay added you as fan_of', 'Add_Fan', 41, '2020-11-12 15:29:56'),
(454, 10, 1, 'You have added Nizam to your fan_of list', 'Add_Fan', 41, '2020-11-12 15:29:56'),
(455, 1, 24, 'Akshay added you as fan_of', 'Add_Fan', 42, '2020-11-12 15:30:00'),
(456, 24, 1, 'You have added lallu to your fan_of list', 'Add_Fan', 42, '2020-11-12 15:30:00'),
(457, 2, 5, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 63, '2020-11-23 10:52:30'),
(458, 5, 2, 'You have Invited jitheesh  from bestie list to have a Match of 1 day duration', 'Match_invitation', 63, '2020-11-23 10:52:30'),
(459, 2, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 63, '2020-11-23 10:57:03'),
(460, 5, 2, 'You have accepted Invitation from Ravi', 'match_reply', 63, '2020-11-23 10:57:03'),
(461, 2, 1, 'Your Match with Akshay is over', 'match_reply', 1, '2020-11-23 11:46:22'),
(462, 1, 2, 'Your Match with Ravi is over', 'match_reply', 1, '2020-11-23 11:47:12'),
(463, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 64, '2020-11-23 12:12:25'),
(464, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 64, '2020-11-23 12:12:25'),
(465, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 64, '2020-11-23 12:12:33'),
(466, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 64, '2020-11-23 12:12:33'),
(467, 2, 5, 'Your Match with jitheesh  is over', 'match_reply', 63, '2020-11-24 10:58:01'),
(468, 5, 2, 'Your Match with Ravi is over', 'match_reply', 63, '2020-11-24 10:58:01'),
(469, 7, 2, 'Sam added you as squad', 'Add_Bestie', 46, '2020-11-24 10:58:30'),
(470, 2, 7, 'You have added Ravi to your squad list', 'Add_Bestie', 46, '2020-11-24 10:58:30'),
(471, 7, 43, 'Sam added you as squad', 'Add_Bestie', 47, '2020-11-24 10:58:58'),
(472, 43, 7, 'You have added Bino to your squad list', 'Add_Bestie', 47, '2020-11-24 10:58:58'),
(473, 7, 16, 'Sam added you as squad', 'Add_Bestie', 48, '2020-11-24 10:59:31'),
(474, 16, 7, 'You have added Ram to your squad list', 'Add_Bestie', 48, '2020-11-24 10:59:31'),
(475, 7, 42, 'Sam added you as squad', 'Add_Bestie', 49, '2020-11-24 10:59:36'),
(476, 42, 7, 'You have added Himanshu to your squad list', 'Add_Bestie', 49, '2020-11-24 10:59:36'),
(477, 7, 22, 'Sam added you as squad', 'Add_Bestie', 50, '2020-11-24 10:59:54'),
(478, 22, 7, 'You have added Philip to your squad list', 'Add_Bestie', 50, '2020-11-24 10:59:54'),
(479, 7, 43, 'Sam added you as fan_of', 'Add_Fan', 43, '2020-11-24 11:00:56'),
(480, 43, 7, 'You have added Bino to your fan_of list', 'Add_Fan', 43, '2020-11-24 11:00:56'),
(481, 7, 43, 'Sam added you as bestie', 'Add_Bestie', 51, '2020-11-24 11:02:44'),
(482, 43, 7, 'You have added Bino to your bestie list', 'Add_Bestie', 51, '2020-11-24 11:02:44'),
(483, 7, 43, 'Sam Invited you from undefined list to have a Match of 7 hour duration', 'Match_invitation', 65, '2020-11-24 11:04:39'),
(484, 43, 7, 'You have Invited Bino from undefined list to have a Match of 7 hour duration', 'Match_invitation', 65, '2020-11-24 11:04:39'),
(485, 7, 43, 'Sam Invited you from undefined list to have a Match of 7 hour duration', 'Match_invitation', 66, '2020-11-24 11:04:40'),
(486, 43, 7, 'You have Invited Bino from undefined list to have a Match of 7 hour duration', 'Match_invitation', 66, '2020-11-24 11:04:40'),
(487, 2, 1, 'Your Match with Akshay is over', 'match_reply', 64, '2020-11-24 12:13:01'),
(488, 1, 2, 'Your Match with Ravi is over', 'match_reply', 64, '2020-11-24 12:13:01'),
(489, 1, 8, 'Akshay added you as bestie', 'Add_Bestie', 52, '2020-11-25 13:53:04'),
(490, 8, 1, 'You have added Neethu to your bestie list', 'Add_Bestie', 52, '2020-11-25 13:53:04'),
(491, 1, 9, 'Akshay added you as bestie', 'Add_Bestie', 53, '2020-11-25 13:55:53'),
(492, 9, 1, 'You have added Aoc to your bestie list', 'Add_Bestie', 53, '2020-11-25 13:55:53');
INSERT INTO `tb_notification` (`not_id`, `sender_id`, `receiver_id`, `message`, `notification_status`, `request_id`, `created_at`) VALUES
(493, 1, 24, 'Akshay added you as bestie', 'Add_Bestie', 54, '2020-11-25 13:56:58'),
(494, 24, 1, 'You have added lallu to your bestie list', 'Add_Bestie', 54, '2020-11-25 13:56:58'),
(495, 1, 10, 'Akshay added you as bestie', 'Add_Bestie', 55, '2020-11-25 13:59:43'),
(496, 10, 1, 'You have added Nizam to your bestie list', 'Add_Bestie', 55, '2020-11-25 13:59:43'),
(497, 1, 12, 'Akshay added you as bestie', 'Add_Bestie', 56, '2020-11-25 14:00:40'),
(498, 12, 1, 'You have added Kanna to your bestie list', 'Add_Bestie', 56, '2020-11-25 14:00:40'),
(499, 1, 35, 'Akshay added you as bestie', 'Add_Bestie', 57, '2020-11-25 14:10:39'),
(500, 35, 1, 'You have added Second to your bestie list', 'Add_Bestie', 57, '2020-11-25 14:10:39'),
(501, 1, 4, 'Akshay added you as squad', 'Add_Bestie', 58, '2020-11-25 14:19:01'),
(502, 4, 1, 'You have added jitheesh to your squad list', 'Add_Bestie', 58, '2020-11-25 14:19:01'),
(503, 1, 10, 'Akshay added you as squad', 'Add_Bestie', 59, '2020-11-25 14:20:46'),
(504, 10, 1, 'You have added Nizam to your squad list', 'Add_Bestie', 59, '2020-11-25 14:20:46'),
(505, 1, 16, 'Akshay added you as squad', 'Add_Bestie', 60, '2020-11-25 14:22:40'),
(506, 16, 1, 'You have added Ram to your squad list', 'Add_Bestie', 60, '2020-11-25 14:22:40'),
(507, 1, 7, 'Akshay added you as fan', 'Add_Fan', 44, '2020-11-26 05:06:36'),
(508, 7, 1, 'You have added Sam to your fan list', 'Add_Fan', 44, '2020-11-26 05:06:36'),
(509, 1, 2, 'Akshay added you as bestie', 'Add_Bestie', 61, '2020-11-26 08:00:25'),
(510, 2, 1, 'You have added Ravi to your bestie list', 'Add_Bestie', 61, '2020-11-26 08:00:25'),
(511, 1, 5, 'Akshay added you as bestie', 'Add_Bestie', 62, '2020-11-26 09:06:43'),
(512, 5, 1, 'You have added jitheesh  to your bestie list', 'Add_Bestie', 62, '2020-11-26 09:06:43'),
(513, 1, 2, 'Akshay added you as squad', 'Add_Bestie', 63, '2020-11-26 09:07:24'),
(514, 2, 1, 'You have added Ravi to your squad list', 'Add_Bestie', 63, '2020-11-26 09:07:24'),
(515, 1, 31, 'Akshay added you as fan', 'Add_Fan', 45, '2020-11-28 08:23:01'),
(516, 31, 1, 'You have added Koyal to your fan list', 'Add_Fan', 45, '2020-11-28 08:23:01'),
(517, 1, 42, 'Akshay added you as fan', 'Add_Fan', 46, '2020-11-28 08:23:20'),
(518, 42, 1, 'You have added Himanshu to your fan list', 'Add_Fan', 46, '2020-11-28 08:23:20'),
(519, 1, 37, 'Akshay added you as fan', 'Add_Fan', 47, '2020-11-28 08:23:30'),
(520, 37, 1, 'You have added Ashik to your fan list', 'Add_Fan', 47, '2020-11-28 08:23:30'),
(521, 1, 12, 'Akshay added you as fan', 'Add_Fan', 48, '2020-11-28 08:23:47'),
(522, 12, 1, 'You have added Kanna to your fan list', 'Add_Fan', 48, '2020-11-28 08:23:47'),
(523, 1, 26, 'Akshay added you as fan_of', 'Add_Fan', 49, '2020-11-28 08:24:52'),
(524, 26, 1, 'You have added Kavitha to your fan_of list', 'Add_Fan', 49, '2020-11-28 08:24:52'),
(525, 1, 7, 'Akshay added you as bestie', 'Add_Bestie', 64, '2020-11-28 08:25:23'),
(526, 7, 1, 'You have added Sam to your bestie list', 'Add_Bestie', 64, '2020-11-28 08:25:23'),
(527, 1, 16, 'Akshay added you as bestie', 'Add_Bestie', 65, '2020-11-28 08:25:38'),
(528, 16, 1, 'You have added Ram to your bestie list', 'Add_Bestie', 65, '2020-11-28 08:25:38'),
(529, 1, 18, 'Akshay added you as squad', 'Add_Bestie', 66, '2020-11-28 08:27:53'),
(530, 18, 1, 'You have added Ram to your squad list', 'Add_Bestie', 66, '2020-11-28 08:27:53'),
(531, 1, 5, 'Akshay added you as squad', 'Add_Bestie', 67, '2020-11-28 08:28:01'),
(532, 5, 1, 'You have added jitheesh  to your squad list', 'Add_Bestie', 67, '2020-11-28 08:28:01'),
(533, 7, 2, 'Sam added you as fan', 'Add_Fan', 50, '2020-12-01 10:51:11'),
(534, 2, 7, 'You have added Ravi to your fan list', 'Add_Fan', 50, '2020-12-01 10:51:11'),
(535, 7, 1, 'Sam Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 67, '2020-12-08 07:19:42'),
(536, 1, 7, 'You have Invited Akshay from undefined list to have a Match of 2 hour duration', 'Match_invitation', 67, '2020-12-08 07:19:42'),
(537, 7, 1, 'Sam Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 68, '2020-12-08 07:19:42'),
(538, 1, 7, 'You have Invited Akshay from undefined list to have a Match of 2 hour duration', 'Match_invitation', 68, '2020-12-08 07:19:42'),
(539, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 69, '2020-12-16 05:10:33'),
(540, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 69, '2020-12-16 05:10:33'),
(541, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 70, '2020-12-16 05:12:55'),
(542, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 70, '2020-12-16 05:12:55'),
(543, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 71, '2020-12-17 11:34:49'),
(544, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 71, '2020-12-17 11:34:49'),
(545, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 72, '2020-12-17 12:23:07'),
(546, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 72, '2020-12-17 12:23:07'),
(547, 1, 3, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 73, '2020-12-17 13:26:16'),
(548, 3, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 73, '2020-12-17 13:26:16'),
(549, 1, 3, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 74, '2020-12-17 13:26:16'),
(550, 3, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 74, '2020-12-17 13:26:16'),
(551, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 75, '2020-12-17 13:43:06'),
(552, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 76, '2020-12-17 13:43:06'),
(553, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 75, '2020-12-17 13:43:06'),
(554, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 76, '2020-12-17 13:43:06'),
(555, 1, 4, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 77, '2020-12-17 14:03:00'),
(556, 4, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 77, '2020-12-17 14:03:00'),
(557, 1, 4, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 78, '2020-12-17 14:03:00'),
(558, 4, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 78, '2020-12-17 14:03:00'),
(559, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 79, '2020-12-17 14:05:00'),
(560, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 79, '2020-12-17 14:05:00'),
(561, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 80, '2020-12-17 14:05:00'),
(562, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 80, '2020-12-17 14:05:00'),
(563, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 81, '2020-12-17 14:11:09'),
(564, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 81, '2020-12-17 14:11:09'),
(565, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 82, '2020-12-17 14:11:09'),
(566, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 82, '2020-12-17 14:11:09'),
(567, 1, 6, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 83, '2020-12-17 14:17:18'),
(568, 6, 1, 'You have Invited Test 2 from undefined list to have a Match of 1 hour duration', 'Match_invitation', 83, '2020-12-17 14:17:18'),
(569, 1, 6, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 84, '2020-12-17 14:17:18'),
(570, 6, 1, 'You have Invited Test 2 from undefined list to have a Match of 1 hour duration', 'Match_invitation', 84, '2020-12-17 14:17:18'),
(571, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 85, '2020-12-17 14:21:25'),
(572, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 86, '2020-12-17 14:21:25'),
(573, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 85, '2020-12-17 14:21:25'),
(574, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 86, '2020-12-17 14:21:25'),
(575, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 87, '2020-12-17 14:26:39'),
(576, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 88, '2020-12-17 14:26:39'),
(577, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 88, '2020-12-17 14:26:39'),
(578, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 87, '2020-12-17 14:26:39'),
(579, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 89, '2020-12-17 14:28:51'),
(580, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 89, '2020-12-17 14:28:51'),
(581, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 90, '2020-12-17 14:29:35'),
(582, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 90, '2020-12-17 14:29:35'),
(583, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 91, '2020-12-17 14:29:53'),
(584, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 91, '2020-12-17 14:29:53'),
(585, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 90, '2020-12-17 14:33:04'),
(586, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 90, '2020-12-17 14:33:04'),
(587, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 89, '2020-12-17 14:35:34'),
(588, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 89, '2020-12-17 14:35:34'),
(589, 1, 20, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 92, '2020-12-17 14:37:14'),
(590, 20, 1, 'You have Invited raveena from undefined list to have a Match of 1 hour duration', 'Match_invitation', 92, '2020-12-17 14:37:14'),
(591, 1, 20, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 93, '2020-12-17 14:37:14'),
(592, 20, 1, 'You have Invited raveena from undefined list to have a Match of 1 hour duration', 'Match_invitation', 93, '2020-12-17 14:37:14'),
(593, 1, 20, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 94, '2020-12-17 14:38:54'),
(594, 20, 1, 'You have Invited raveena from undefined list to have a Match of 1 hour duration', 'Match_invitation', 94, '2020-12-17 14:38:54'),
(595, 1, 20, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 95, '2020-12-17 14:38:54'),
(596, 20, 1, 'You have Invited raveena from undefined list to have a Match of 1 hour duration', 'Match_invitation', 95, '2020-12-17 14:38:54'),
(597, 1, 10, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 96, '2020-12-17 14:42:57'),
(598, 10, 1, 'You have Invited Nizam from undefined list to have a Match of 1 hour duration', 'Match_invitation', 96, '2020-12-17 14:42:57'),
(599, 1, 10, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 97, '2020-12-17 14:42:57'),
(600, 10, 1, 'You have Invited Nizam from undefined list to have a Match of 1 hour duration', 'Match_invitation', 97, '2020-12-17 14:42:57'),
(601, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 98, '2020-12-17 14:47:14'),
(602, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 98, '2020-12-17 14:47:14'),
(603, 1, 6, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 99, '2020-12-17 14:54:58'),
(604, 6, 1, 'You have Invited Test 2 from undefined list to have a Match of 1 hour duration', 'Match_invitation', 99, '2020-12-17 14:54:58'),
(605, 1, 5, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 100, '2020-12-17 14:57:10'),
(606, 5, 1, 'You have Invited jitheesh  from undefined list to have a Match of 1 hour duration', 'Match_invitation', 100, '2020-12-17 14:57:10'),
(607, 1, 18, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 101, '2020-12-17 16:31:34'),
(608, 18, 1, 'You have Invited Ram from undefined list to have a Match of 1 hour duration', 'Match_invitation', 101, '2020-12-17 16:31:34'),
(609, 1, 21, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 102, '2020-12-17 17:12:17'),
(610, 21, 1, 'You have Invited Lisa from undefined list to have a Match of 1 hour duration', 'Match_invitation', 102, '2020-12-17 17:12:17'),
(611, 1, 23, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 103, '2020-12-18 08:41:42'),
(612, 1, 23, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 104, '2020-12-18 08:41:42'),
(613, 23, 1, 'You have Invited Kiran from undefined list to have a Match of 1 hour duration', 'Match_invitation', 103, '2020-12-18 08:41:42'),
(614, 23, 1, 'You have Invited Kiran from undefined list to have a Match of 1 hour duration', 'Match_invitation', 104, '2020-12-18 08:41:42'),
(615, 1, 8, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 105, '2020-12-19 07:18:13'),
(616, 8, 1, 'You have Invited Neethu from undefined list to have a Match of 1 hour duration', 'Match_invitation', 105, '2020-12-19 07:18:13'),
(617, 1, 14, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 106, '2020-12-19 07:40:20'),
(618, 14, 1, 'You have Invited krishnan from undefined list to have a Match of 1 hour duration', 'Match_invitation', 106, '2020-12-19 07:40:20'),
(619, 1, 9, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 107, '2020-12-19 18:00:44'),
(620, 9, 1, 'You have Invited Aoc from undefined list to have a Match of 1 hour duration', 'Match_invitation', 107, '2020-12-19 18:00:44'),
(621, 1, 17, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 108, '2020-12-19 18:04:43'),
(622, 17, 1, 'You have Invited Ram from undefined list to have a Match of 1 hour duration', 'Match_invitation', 108, '2020-12-19 18:04:43'),
(623, 1, 24, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 109, '2020-12-19 18:07:21'),
(624, 24, 1, 'You have Invited lallu from undefined list to have a Match of 1 hour duration', 'Match_invitation', 109, '2020-12-19 18:07:21'),
(625, 1, 34, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 110, '2020-12-21 09:37:29'),
(626, 34, 1, 'You have Invited Christiana Mariya from undefined list to have a Match of 1 hour duration', 'Match_invitation', 110, '2020-12-21 09:37:29'),
(627, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 111, '2020-12-21 09:43:05'),
(628, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 111, '2020-12-21 09:43:05'),
(629, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 112, '2020-12-21 09:43:39'),
(630, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 112, '2020-12-21 09:43:39'),
(631, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 113, '2020-12-21 09:43:44'),
(632, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 113, '2020-12-21 09:43:44'),
(633, 1, 35, 'Akshay Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 114, '2020-12-21 09:45:43'),
(634, 35, 1, 'You have Invited Second from undefined list to have a Match of 2 hour duration', 'Match_invitation', 114, '2020-12-21 09:45:43'),
(635, 1, 35, 'Akshay Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 115, '2020-12-21 09:45:43'),
(636, 35, 1, 'You have Invited Second from undefined list to have a Match of 2 hour duration', 'Match_invitation', 115, '2020-12-21 09:45:43'),
(637, 1, 32, 'Akshay Invited you from undefined list to have a Match of 3 hour duration', 'Match_invitation', 116, '2020-12-21 10:07:58'),
(638, 1, 32, 'Akshay Invited you from undefined list to have a Match of 3 hour duration', 'Match_invitation', 117, '2020-12-21 10:07:58'),
(639, 32, 1, 'You have Invited Ajmal from undefined list to have a Match of 3 hour duration', 'Match_invitation', 116, '2020-12-21 10:07:58'),
(640, 32, 1, 'You have Invited Ajmal from undefined list to have a Match of 3 hour duration', 'Match_invitation', 117, '2020-12-21 10:07:58'),
(641, 47, 5, 'Medoosa  added you as fan', 'Add_Fan', 51, '2020-12-21 12:58:50'),
(642, 5, 47, 'You have added jitheesh  to your fan list', 'Add_Fan', 51, '2020-12-21 12:58:50'),
(643, 47, 1, 'Medoosa  added you as fan_of', 'Add_Fan', 52, '2020-12-21 12:59:10'),
(644, 1, 47, 'You have added Akshay to your fan_of list', 'Add_Fan', 52, '2020-12-21 12:59:10'),
(645, 47, 1, 'Medoosa  Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 118, '2020-12-21 13:09:51'),
(646, 1, 47, 'You have Invited Akshay from undefined list to have a Match of 1 hour duration', 'Match_invitation', 118, '2020-12-21 13:09:51'),
(647, 47, 1, 'Medoosa  Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 119, '2020-12-21 13:09:51'),
(648, 1, 47, 'You have Invited Akshay from undefined list to have a Match of 1 hour duration', 'Match_invitation', 119, '2020-12-21 13:09:51'),
(649, 1, 38, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 120, '2020-12-21 13:23:43'),
(650, 1, 38, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 121, '2020-12-21 13:23:43'),
(651, 38, 1, 'You have Invited Dev from undefined list to have a Match of 1 hour duration', 'Match_invitation', 120, '2020-12-21 13:23:43'),
(652, 38, 1, 'You have Invited Dev from undefined list to have a Match of 1 hour duration', 'Match_invitation', 121, '2020-12-21 13:23:43'),
(653, 1, 38, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 122, '2020-12-21 13:25:17'),
(654, 38, 1, 'You have Invited Dev from undefined list to have a Match of 1 hour duration', 'Match_invitation', 122, '2020-12-21 13:25:17'),
(655, 1, 38, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 123, '2020-12-21 13:25:17'),
(656, 38, 1, 'You have Invited Dev from undefined list to have a Match of 1 hour duration', 'Match_invitation', 123, '2020-12-21 13:25:17'),
(657, 1, 3, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 124, '2020-12-21 16:21:08'),
(658, 3, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 124, '2020-12-21 16:21:08'),
(659, 1, 3, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 125, '2020-12-21 16:21:08'),
(660, 3, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 125, '2020-12-21 16:21:08'),
(661, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 126, '2020-12-22 04:23:32'),
(662, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 126, '2020-12-22 04:23:32'),
(663, 1, 41, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 127, '2020-12-22 06:17:34'),
(664, 41, 1, 'You have Invited Vineetha Koshy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 127, '2020-12-22 06:17:34'),
(665, 1, 41, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 128, '2020-12-22 06:17:34'),
(666, 41, 1, 'You have Invited Vineetha Koshy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 128, '2020-12-22 06:17:34'),
(667, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 129, '2020-12-22 06:36:07'),
(668, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 129, '2020-12-22 06:36:07'),
(669, 1, 8, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 130, '2020-12-22 06:38:25'),
(670, 8, 1, 'You have Invited Neethu from undefined list to have a Match of 1 hour duration', 'Match_invitation', 130, '2020-12-22 06:38:25'),
(671, 1, 8, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 131, '2020-12-22 06:43:03'),
(672, 8, 1, 'You have Invited Neethu from undefined list to have a Match of 1 hour duration', 'Match_invitation', 131, '2020-12-22 06:43:03'),
(673, 1, 6, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 132, '2020-12-22 08:53:45'),
(674, 6, 1, 'You have Invited Test 2 from undefined list to have a Match of 1 hour duration', 'Match_invitation', 132, '2020-12-22 08:53:45'),
(675, 1, 14, 'Akshay added you as fan_of', 'Add_Fan', 53, '2020-12-29 10:04:50'),
(676, 14, 1, 'You have added krishnan to your fan_of list', 'Add_Fan', 53, '2020-12-29 10:04:50'),
(677, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 133, '2020-12-29 10:44:18'),
(678, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 133, '2020-12-29 10:44:18'),
(679, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 133, '2020-12-29 10:44:30'),
(680, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 133, '2020-12-29 10:44:30'),
(681, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 133, '2020-12-29 11:52:09'),
(682, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 133, '2020-12-29 11:52:09'),
(683, 7, 2, 'Sam Invited you from undefined list to have a Match of 4 hour duration', 'Match_invitation', 134, '2020-12-30 07:06:23'),
(684, 2, 7, 'You have Invited Ravi from undefined list to have a Match of 4 hour duration', 'Match_invitation', 134, '2020-12-30 07:06:23'),
(685, 7, 2, 'Sam Invited you from undefined list to have a Match of 4 hour duration', 'Match_invitation', 135, '2020-12-30 07:06:24'),
(686, 2, 7, 'You have Invited Ravi from undefined list to have a Match of 4 hour duration', 'Match_invitation', 135, '2020-12-30 07:06:24'),
(687, 7, 1, 'Sam Invited you from undefined list to have a Match of 3 hour duration', 'Match_invitation', 136, '2020-12-30 10:45:08'),
(688, 1, 7, 'You have Invited Akshay from undefined list to have a Match of 3 hour duration', 'Match_invitation', 136, '2020-12-30 10:45:08'),
(689, 2, 1, 'Your Match with Akshay is over', 'match_reply', 133, '2020-12-30 11:53:01'),
(690, 1, 2, 'Your Match with Ravi is over', 'match_reply', 133, '2020-12-30 11:53:01'),
(691, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 137, '2020-12-30 12:02:10'),
(692, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 137, '2020-12-30 12:02:10'),
(693, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 137, '2020-12-30 12:02:31'),
(694, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 137, '2020-12-30 12:02:31'),
(695, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 138, '2020-12-30 12:02:53'),
(696, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 138, '2020-12-30 12:02:53'),
(697, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 138, '2020-12-30 12:03:02'),
(698, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 138, '2020-12-30 12:03:02'),
(699, 7, 4, 'Sam Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 139, '2020-12-30 15:52:12'),
(700, 4, 7, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 139, '2020-12-30 15:52:12'),
(701, 7, 4, 'Sam Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 140, '2020-12-30 15:52:38'),
(702, 4, 7, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 140, '2020-12-30 15:52:38'),
(703, 7, 4, 'Sam Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 141, '2020-12-30 15:52:43'),
(704, 4, 7, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 141, '2020-12-30 15:52:43'),
(705, 7, 4, 'Sam Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 142, '2020-12-30 15:53:06'),
(706, 4, 7, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 142, '2020-12-30 15:53:06'),
(707, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 143, '2020-12-31 10:51:47'),
(708, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 143, '2020-12-31 10:51:48'),
(709, 2, 1, 'Your Match with Akshay is over', 'match_reply', 137, '2020-12-31 12:03:01'),
(710, 1, 2, 'Your Match with Ravi is over', 'match_reply', 137, '2020-12-31 12:03:01'),
(711, 3, 1, 'Your Match with Akshay is over', 'match_reply', 138, '2021-01-01 12:04:01'),
(712, 1, 3, 'Your Match with jitheesh is over', 'match_reply', 138, '2021-01-01 12:04:01'),
(713, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 144, '2021-01-01 15:39:18'),
(714, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 144, '2021-01-01 15:39:18'),
(715, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 145, '2021-01-04 04:45:22'),
(716, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 145, '2021-01-04 04:45:22'),
(717, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 146, '2021-01-04 05:17:02'),
(718, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 146, '2021-01-04 05:17:02'),
(719, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 146, '2021-01-04 05:17:49'),
(720, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 146, '2021-01-04 05:17:49'),
(721, 2, 1, 'Ravi Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 147, '2021-01-04 15:39:34'),
(722, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 147, '2021-01-04 15:39:34'),
(723, 7, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 68, '2021-01-05 05:19:05'),
(724, 1, 7, 'You have accepted Invitation from Sam', 'match_reply', 68, '2021-01-05 05:19:05'),
(725, 7, 1, 'Your Match with Akshay is over', 'match_reply', 68, '2021-01-05 07:20:01'),
(726, 1, 7, 'Your Match with Sam is over', 'match_reply', 68, '2021-01-05 07:20:01'),
(727, 0, 4, ' Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 149, '2021-01-05 08:27:02'),
(728, 4, 0, 'You have Invited jitheesh from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 149, '2021-01-05 08:27:02'),
(729, 0, 4, ' Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 150, '2021-01-05 08:27:11'),
(730, 4, 0, 'You have Invited jitheesh from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 150, '2021-01-05 08:27:11'),
(731, 0, 5, ' Invited you from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 151, '2021-01-05 08:32:39'),
(732, 5, 0, 'You have Invited jitheesh  from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 151, '2021-01-05 08:32:39'),
(733, 2, 1, 'Ravi Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 152, '2021-01-05 10:40:35'),
(734, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 152, '2021-01-05 10:40:35'),
(735, 1, 9, 'Akshay Invited you from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 153, '2021-01-05 12:06:06'),
(736, 9, 1, 'You have Invited Aoc from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 153, '2021-01-05 12:06:06'),
(737, 1, 7, 'Akshay Invited you from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 154, '2021-01-05 15:25:47'),
(738, 7, 1, 'You have Invited Sam from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 154, '2021-01-05 15:25:47'),
(739, 3, 1, 'Your Match with Akshay is over', 'match_reply', 146, '2021-01-06 05:18:01'),
(740, 1, 3, 'Your Match with jitheesh is over', 'match_reply', 146, '2021-01-06 05:18:01'),
(741, 1, 6, 'Akshay Invited you from Basic Method list to have a Match of 4 hour duration', 'Match_invitation', 155, '2021-01-06 15:14:49'),
(742, 6, 1, 'You have Invited Test 2 from Basic Method list to have a Match of 4 hour duration', 'Match_invitation', 155, '2021-01-06 15:14:49'),
(743, 27, 12, 'Veena added you as bestie', 'Add_Bestie', 68, '2021-01-06 15:52:41'),
(744, 12, 27, 'You have added Kanna to your bestie list', 'Add_Bestie', 68, '2021-01-06 15:52:41'),
(745, 7, 43, 'Sam Invited you from Basic Method list to have a Match of 4 hour duration', 'Match_invitation', 156, '2021-01-07 10:08:07'),
(746, 43, 7, 'You have Invited Bino from Basic Method list to have a Match of 4 hour duration', 'Match_invitation', 156, '2021-01-07 10:08:07'),
(747, 7, 2, 'Sam added you as fan', 'Add_Fan', 54, '2021-01-07 10:30:21'),
(748, 2, 7, 'You have added Ravi to your fan list', 'Add_Fan', 54, '2021-01-07 10:30:21'),
(749, 7, 1, 'Sam added you as fan_of', 'Add_Fan', 55, '2021-01-07 10:30:31'),
(750, 1, 7, 'You have added Akshay to your fan_of list', 'Add_Fan', 55, '2021-01-07 10:30:31'),
(751, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 2 hour duration', 'Match_invitation', 157, '2021-01-07 10:31:35'),
(752, 1, 7, 'You have Invited Akshay from Basic Method list to have a Match of 2 hour duration', 'Match_invitation', 157, '2021-01-07 10:31:35'),
(753, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 98, '2021-01-08 09:39:07'),
(754, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 98, '2021-01-08 09:39:07'),
(755, 2, 1, 'Your Match with Akshay is over', 'match_reply', 98, '2021-01-09 09:40:01'),
(756, 1, 2, 'Your Match with Ravi is over', 'match_reply', 98, '2021-01-09 09:40:01'),
(757, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 111, '2021-01-11 07:36:36'),
(758, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 111, '2021-01-11 07:36:36'),
(759, 2, 1, 'Your Match with Akshay is over', 'match_reply', 111, '2021-01-12 07:37:01'),
(760, 1, 2, 'Your Match with Ravi is over', 'match_reply', 111, '2021-01-12 07:37:01'),
(761, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:22:37'),
(762, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:22:37'),
(763, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:22:37'),
(764, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:22:37'),
(765, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:22:38'),
(766, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:22:38'),
(767, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:22:38'),
(768, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:22:38'),
(769, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 112, '2021-01-14 08:22:38'),
(770, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 112, '2021-01-14 08:22:38'),
(771, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:35:17'),
(772, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:35:17'),
(773, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:35:17'),
(774, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:35:17'),
(775, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:35:17'),
(776, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:35:17'),
(777, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 08:35:17'),
(778, 7, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 157, '2021-01-14 08:35:17'),
(779, 1, 7, 'You have accepted Invitation from Sam', 'match_reply', 157, '2021-01-14 08:35:17'),
(780, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 2 hour duration', 'Match_invitation', 158, '2021-01-14 09:25:06'),
(781, 1, 7, 'You have Invited Akshay from Basic Method list to have a Match of 2 hour duration', 'Match_invitation', 158, '2021-01-14 09:25:06'),
(782, 2, 1, 'Ravi Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 159, '2021-01-14 09:41:36'),
(783, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 159, '2021-01-14 09:41:36'),
(784, 2, 1, 'Ravi Invited you from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 160, '2021-01-14 09:54:27'),
(785, 1, 2, 'You have Invited Akshay from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 160, '2021-01-14 09:54:27'),
(786, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 09:59:48'),
(787, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 09:59:48'),
(788, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 09:59:48'),
(789, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 09:59:48'),
(790, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 09:59:48'),
(791, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 09:59:48'),
(792, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 09:59:48'),
(793, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 09:59:48'),
(794, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 113, '2021-01-14 09:59:48'),
(795, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 113, '2021-01-14 09:59:48'),
(796, 2, 1, 'Ravi Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 161, '2021-01-14 10:00:10'),
(797, 1, 2, 'You have Invited Akshay from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 161, '2021-01-14 10:00:10'),
(798, 1, 2, 'Akshay Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 162, '2021-01-14 10:01:19'),
(799, 2, 1, 'You have Invited Ravi from bestie list to have a Match of 2 day duration', 'Match_invitation', 162, '2021-01-14 10:01:19'),
(800, 1, 2, 'Akshay Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 163, '2021-01-14 10:04:08'),
(801, 2, 1, 'You have been Invited by Ravi to have a Match of 2 day duration', 'Match_invitation', 163, '2021-01-14 10:04:08'),
(802, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:06:26'),
(803, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:06:26'),
(804, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:06:26'),
(805, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:06:26'),
(806, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:06:26'),
(807, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:06:26'),
(808, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:06:26'),
(809, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:06:26'),
(810, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 75, '2021-01-14 10:06:26'),
(811, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 75, '2021-01-14 10:06:26'),
(812, 1, 2, 'Your Invitation is rejected by Ravi', 'match_reply', 79, '2021-01-14 10:07:05'),
(813, 2, 1, 'You have rejected Invitation from Akshay', 'match_reply', 79, '2021-01-14 10:07:05'),
(814, 7, 2, '7 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:07:10'),
(815, 7, 2, '7 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:07:10'),
(816, 7, 2, '7 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:07:10'),
(817, 7, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 134, '2021-01-14 10:07:10'),
(818, 2, 7, 'You have accepted Invitation from Sam', 'match_reply', 134, '2021-01-14 10:07:10'),
(819, 2, 1, 'Raveena Invited you from Basic Method list to have a Match of 15 hour duration', 'Match_invitation', 164, '2021-01-14 10:21:43'),
(820, 1, 2, 'You have been Invited by Akshay to have a Match of 15 hour duration', 'Match_invitation', 164, '2021-01-14 10:21:43'),
(821, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:24:49'),
(822, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:24:49'),
(823, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:24:49'),
(824, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:24:49'),
(825, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:24:49'),
(826, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:24:49'),
(827, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:24:49'),
(828, 47, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 118, '2021-01-14 10:24:49'),
(829, 1, 47, 'You have accepted Invitation from Medoosa ', 'match_reply', 118, '2021-01-14 10:24:49'),
(830, 47, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 119, '2021-01-14 10:25:33'),
(831, 1, 47, 'You have rejected Invitation from Medoosa ', 'match_reply', 119, '2021-01-14 10:25:33'),
(832, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:25:44'),
(833, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:25:44'),
(834, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:25:44'),
(835, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:25:44'),
(836, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:25:44'),
(837, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:25:44'),
(838, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 10:25:44'),
(839, 7, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 136, '2021-01-14 10:25:44'),
(840, 1, 7, 'You have accepted Invitation from Sam', 'match_reply', 136, '2021-01-14 10:25:44'),
(841, 1, 2, 'Akshay Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 165, '2021-01-14 10:29:32'),
(842, 2, 1, 'You have been Invited by Raveena to have a Match of 2 day duration', 'Match_invitation', 165, '2021-01-14 10:29:32'),
(843, 2, 1, 'Raveena Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 166, '2021-01-14 10:35:58'),
(844, 1, 2, 'You have been Invited by Akshay to have a Match of 2 day duration', 'Match_invitation', 166, '2021-01-14 10:35:58'),
(845, 7, 1, 'Your Match with Akshay is over', 'match_reply', 157, '2021-01-14 10:36:01'),
(846, 1, 7, 'Your Match with Sam is over', 'match_reply', 157, '2021-01-14 10:36:01'),
(847, 2, 5, 'Raveena Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 167, '2021-01-14 10:38:52'),
(848, 5, 2, 'You have been Invited by jitheesh  to have a Match of 2 day duration', 'Match_invitation', 167, '2021-01-14 10:38:52'),
(849, 1, 2, 'Your Match with Raveena is over', 'match_reply', 75, '2021-01-14 11:07:01'),
(850, 2, 1, 'Your Match with Akshay is over', 'match_reply', 75, '2021-01-14 11:07:01'),
(851, 47, 1, 'Your Match with Akshay is over', 'match_reply', 118, '2021-01-14 11:25:01'),
(852, 1, 47, 'Your Match with Medoosa  is over', 'match_reply', 118, '2021-01-14 11:25:01'),
(853, 2, 1, 'Raveena Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 169, '2021-01-14 11:31:47'),
(854, 1, 2, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 169, '2021-01-14 11:31:47'),
(855, 2, 1, 'Raveena Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 170, '2021-01-14 11:32:37'),
(856, 1, 2, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 170, '2021-01-14 11:32:37'),
(857, 2, 1, 'Raveena Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 171, '2021-01-14 11:43:22'),
(858, 1, 2, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 171, '2021-01-14 11:43:22'),
(859, 2, 1, 'Raveena Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 172, '2021-01-14 11:43:44'),
(860, 1, 2, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 172, '2021-01-14 11:43:44'),
(861, 5, 1, 'jitheesh  Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 173, '2021-01-14 11:43:53'),
(862, 1, 5, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 173, '2021-01-14 11:43:53'),
(863, 4, 1, 'jitheesh Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 174, '2021-01-14 11:44:13'),
(864, 1, 4, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 174, '2021-01-14 11:44:13'),
(865, 7, 1, 'Your Match with Akshay is over', 'match_reply', 136, '2021-01-14 13:26:02'),
(866, 1, 7, 'Your Match with Sam is over', 'match_reply', 136, '2021-01-14 13:26:02'),
(867, 7, 2, 'Your Match with Raveena is over', 'match_reply', 134, '2021-01-14 14:08:01'),
(868, 2, 7, 'Your Match with Sam is over', 'match_reply', 134, '2021-01-14 14:08:01'),
(869, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 126, '2021-01-14 15:24:41'),
(870, 1, 2, 'You have rejected Invitation from Raveena', 'match_reply', 126, '2021-01-14 15:24:41'),
(871, 2, 1, 'Your Match with Akshay is over', 'match_reply', 112, '2021-01-15 08:23:01'),
(872, 1, 2, 'Your Match with Raveena is over', 'match_reply', 112, '2021-01-15 08:23:01'),
(873, 2, 1, 'Your Match with Akshay is over', 'match_reply', 113, '2021-01-15 10:00:01'),
(874, 1, 2, 'Your Match with Raveena is over', 'match_reply', 113, '2021-01-15 10:00:01'),
(875, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:12:32'),
(876, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:12:32'),
(877, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:12:32'),
(878, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:12:32'),
(879, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:12:32'),
(880, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:12:32'),
(881, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 11:12:32'),
(882, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 11:12:32'),
(883, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:13:28'),
(884, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:13:28'),
(885, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:13:28'),
(886, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:13:28'),
(887, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:13:28'),
(888, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:13:28'),
(889, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 143, '2021-01-15 11:13:28'),
(890, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 143, '2021-01-15 11:13:28'),
(891, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:17:17'),
(892, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:17:17'),
(893, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:17:17'),
(894, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:17:17'),
(895, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:17:17'),
(896, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:17:17'),
(897, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 144, '2021-01-15 11:17:17'),
(898, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 144, '2021-01-15 11:17:17'),
(899, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:21:54'),
(900, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:21:54'),
(901, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:21:54'),
(902, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:21:54'),
(903, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:21:54'),
(904, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:21:54'),
(905, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:21:54'),
(906, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:21:54'),
(907, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 160, '2021-01-15 11:21:54'),
(908, 1, 2, 'You have accepted Invitation from Raveena', 'match_reply', 160, '2021-01-15 11:21:55');
INSERT INTO `tb_notification` (`not_id`, `sender_id`, `receiver_id`, `message`, `notification_status`, `request_id`, `created_at`) VALUES
(909, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:31:56'),
(910, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:31:56'),
(911, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:31:56'),
(912, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:31:56'),
(913, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:31:56'),
(914, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:31:56'),
(915, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:31:56'),
(916, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:31:56'),
(917, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:31:56'),
(918, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 173, '2021-01-15 11:31:56'),
(919, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 173, '2021-01-15 11:31:56'),
(920, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:34:39'),
(921, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:34:39'),
(922, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:34:39'),
(923, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:34:39'),
(924, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:34:39'),
(925, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:34:39'),
(926, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:34:39'),
(927, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:34:40'),
(928, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 172, '2021-01-15 11:34:40'),
(929, 1, 2, 'You have accepted Invitation from Raveena', 'match_reply', 172, '2021-01-15 11:34:40'),
(930, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:38:48'),
(931, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:38:48'),
(932, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:38:48'),
(933, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:38:48'),
(934, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:38:48'),
(935, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:38:48'),
(936, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 11:38:48'),
(937, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 11:38:48'),
(938, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:39:52'),
(939, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:39:52'),
(940, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:39:52'),
(941, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:39:52'),
(942, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:39:52'),
(943, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:39:52'),
(944, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 11:39:52'),
(945, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 11:39:52'),
(946, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:41:54'),
(947, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:41:54'),
(948, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:41:54'),
(949, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:41:55'),
(950, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:41:55'),
(951, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:41:55'),
(952, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 11:41:55'),
(953, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 11:41:55'),
(954, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:42:15'),
(955, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:42:15'),
(956, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:42:15'),
(957, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:42:15'),
(958, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:42:15'),
(959, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:42:15'),
(960, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 11:42:15'),
(961, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 11:42:15'),
(962, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:46:52'),
(963, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:46:52'),
(964, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:46:52'),
(965, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:46:52'),
(966, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:46:52'),
(967, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:46:52'),
(968, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 11:46:52'),
(969, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 11:46:52'),
(970, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:11'),
(971, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:11'),
(972, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:11'),
(973, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:11'),
(974, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:11'),
(975, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:11'),
(976, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 11:47:11'),
(977, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 11:47:11'),
(978, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:22'),
(979, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:22'),
(980, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:22'),
(981, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:22'),
(982, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:22'),
(983, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:22'),
(984, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:22'),
(985, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:22'),
(986, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:47:22'),
(987, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 173, '2021-01-15 11:47:22'),
(988, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 173, '2021-01-15 11:47:22'),
(989, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:49:24'),
(990, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:49:24'),
(991, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:49:24'),
(992, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:49:24'),
(993, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:49:24'),
(994, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:49:24'),
(995, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:49:24'),
(996, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:49:24'),
(997, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:49:24'),
(998, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 173, '2021-01-15 11:49:24'),
(999, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 173, '2021-01-15 11:49:24'),
(1000, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:53:14'),
(1001, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:53:14'),
(1002, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:53:14'),
(1003, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:53:14'),
(1004, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:53:14'),
(1005, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:53:14'),
(1006, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:53:14'),
(1007, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:53:14'),
(1008, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 11:53:14'),
(1009, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 173, '2021-01-15 11:53:14'),
(1010, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 173, '2021-01-15 11:53:14'),
(1011, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 12:05:45'),
(1012, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 12:05:45'),
(1013, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 12:05:45'),
(1014, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 12:05:45'),
(1015, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 12:05:45'),
(1016, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 12:05:45'),
(1017, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 145, '2021-01-15 12:05:45'),
(1018, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 145, '2021-01-15 12:05:45'),
(1019, 2, 1, 'Your Match with Akshay is over', 'match_reply', 160, '2021-01-15 16:22:01'),
(1020, 1, 2, 'Your Match with Raveena is over', 'match_reply', 160, '2021-01-15 16:22:02'),
(1021, 2, 1, 'Your Match with Akshay is over', 'match_reply', 172, '2021-01-16 11:35:01'),
(1022, 1, 2, 'Your Match with Raveena is over', 'match_reply', 172, '2021-01-16 11:35:01'),
(1023, 2, 1, 'Your Match with Akshay is over', 'match_reply', 171, '2021-01-16 11:37:01'),
(1024, 1, 2, 'Your Match with Raveena is over', 'match_reply', 171, '2021-01-16 11:37:01'),
(1025, 4, 1, 'Your Match with Akshay is over', 'match_reply', 174, '2021-01-16 11:48:01'),
(1026, 1, 4, 'Your Match with jitheesh is over', 'match_reply', 174, '2021-01-16 11:48:01'),
(1027, 5, 1, 'Your Match with Akshay is over', 'match_reply', 173, '2021-01-16 11:54:01'),
(1028, 1, 5, 'Your Match with jitheesh  is over', 'match_reply', 173, '2021-01-16 11:54:01'),
(1029, 3, 1, 'Your Match with Akshay is over', 'match_reply', 143, '2021-01-17 11:14:01'),
(1030, 1, 3, 'Your Match with jitheesh is over', 'match_reply', 143, '2021-01-17 11:14:01'),
(1031, 3, 1, 'Your Match with Akshay is over', 'match_reply', 144, '2021-01-17 11:18:01'),
(1032, 1, 3, 'Your Match with jitheesh is over', 'match_reply', 144, '2021-01-17 11:18:01'),
(1033, 3, 1, 'Your Match with Akshay is over', 'match_reply', 145, '2021-01-17 12:06:01'),
(1034, 1, 3, 'Your Match with jitheesh is over', 'match_reply', 145, '2021-01-17 12:06:01'),
(1035, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 175, '2021-01-18 06:28:55'),
(1036, 1, 7, 'You have been Invited by Akshay to have a Match of 1 hour duration', 'Match_invitation', 175, '2021-01-18 06:28:55'),
(1037, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 176, '2021-01-18 06:33:40'),
(1038, 1, 7, 'You have been Invited by Akshay to have a Match of 1 hour duration', 'Match_invitation', 176, '2021-01-18 06:33:40'),
(1039, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 2 hour duration', 'Match_invitation', 177, '2021-01-18 10:20:21'),
(1040, 1, 7, 'You have been Invited by Akshay to have a Match of 2 hour duration', 'Match_invitation', 177, '2021-01-18 10:20:21'),
(1041, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 178, '2021-01-22 06:45:17'),
(1042, 1, 7, 'You have been Invited by Akshay to have a Match of 1 hour duration', 'Match_invitation', 178, '2021-01-22 06:45:17'),
(1043, 49, 7, 'Sara added you as fan_of', 'Add_Fan', 56, '2021-01-22 08:54:19'),
(1044, 7, 49, 'You have added Sam to your fan_of list', 'Add_Fan', 56, '2021-01-22 08:54:19'),
(1045, 49, 7, 'Sara added you as bestie', 'Add_Bestie', 69, '2021-01-22 08:54:39'),
(1046, 7, 49, 'You have added Sam to your bestie list', 'Add_Bestie', 69, '2021-01-22 08:54:39'),
(1047, 49, 7, 'Sara added you as squad', 'Add_Bestie', 70, '2021-01-22 08:54:59'),
(1048, 7, 49, 'You have added Sam to your squad list', 'Add_Bestie', 70, '2021-01-22 08:54:59'),
(1049, 7, 49, 'Sam Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 179, '2021-01-22 09:31:47'),
(1050, 49, 7, 'You have been Invited by Sara to have a Match of 1 hour duration', 'Match_invitation', 179, '2021-01-22 09:31:47'),
(1051, 1, 7, 'Your Invitation is rejected by Sam', 'match_reply', 61, '2021-01-22 09:32:36'),
(1052, 7, 1, 'You have rejected Invitation from Akshay', 'match_reply', 61, '2021-01-22 09:32:36'),
(1053, 1, 7, 'Your Invitation is rejected by Sam', 'match_reply', 62, '2021-01-22 09:32:39'),
(1054, 7, 1, 'You have rejected Invitation from Akshay', 'match_reply', 62, '2021-01-22 09:32:39'),
(1055, 1, 7, 'Your Invitation is rejected by Sam', 'match_reply', 154, '2021-01-22 09:32:43'),
(1056, 7, 1, 'You have rejected Invitation from Akshay', 'match_reply', 154, '2021-01-22 09:32:43'),
(1057, 7, 49, 'Sam added a new open match with Sara, Open app to view the contest', 'fan_notification', 0, '2021-01-22 10:47:05'),
(1058, 7, 49, 'Your Invitation is accepted by Sara', 'match_reply', 179, '2021-01-22 10:47:05'),
(1059, 49, 7, 'You have accepted Invitation from Sam', 'match_reply', 179, '2021-01-22 10:47:05'),
(1060, 49, 7, 'Sara Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 186, '2021-01-22 11:11:29'),
(1061, 7, 49, 'You have been Invited by Sam to have a Match of 1 hour duration', 'Match_invitation', 186, '2021-01-22 11:11:29'),
(1062, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 11:40:46'),
(1063, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 11:40:46'),
(1064, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 11:40:46'),
(1065, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 11:40:46'),
(1066, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 11:40:46'),
(1067, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 11:40:46'),
(1068, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 11:40:46'),
(1069, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 11:40:46'),
(1070, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 147, '2021-01-22 11:40:46'),
(1071, 1, 2, 'You have accepted Invitation from Raveena', 'match_reply', 147, '2021-01-22 11:40:46'),
(1072, 7, 49, 'Your Match with Sara is over', 'match_reply', 179, '2021-01-22 11:48:01'),
(1073, 49, 7, 'Your Match with Sam is over', 'match_reply', 179, '2021-01-22 11:48:01'),
(1074, 7, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 177, '2021-01-22 15:36:28'),
(1075, 1, 7, 'You have rejected Invitation from Sam', 'match_reply', 177, '2021-01-22 15:36:28'),
(1076, 49, 7, 'Sara added a new open match with Sam, Open app to view the contest', 'fan_notification', 0, '2021-01-22 16:21:41'),
(1077, 49, 7, 'Your Invitation is accepted by Sam', 'match_reply', 186, '2021-01-22 16:21:41'),
(1078, 7, 49, 'You have accepted Invitation from Sara', 'match_reply', 186, '2021-01-22 16:21:41'),
(1079, 49, 7, 'Your Match with Sam is over', 'match_reply', 186, '2021-01-22 17:22:01'),
(1080, 7, 49, 'Your Match with Sara is over', 'match_reply', 186, '2021-01-22 17:22:01'),
(1081, 2, 1, 'Your Match with Akshay is over', 'match_reply', 147, '2021-01-24 11:41:01'),
(1082, 1, 2, 'Your Match with Raveena is over', 'match_reply', 147, '2021-01-24 11:41:01'),
(1083, 49, 1, 'Sara Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 187, '2021-01-26 06:48:52'),
(1084, 1, 49, 'You have been Invited by Akshay to have a Match of 1 hour duration', 'Match_invitation', 187, '2021-01-26 06:48:52'),
(1085, 49, 1, 'Sara added you as squad', 'Add_Bestie', 71, '2021-01-26 07:22:13'),
(1086, 1, 49, 'You have added Akshay to your squad list', 'Add_Bestie', 71, '2021-01-26 07:22:13');

-- --------------------------------------------------------

--
-- Table structure for table `tb_statusbar`
--

CREATE TABLE `tb_statusbar` (
  `statusid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `send_to` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_statusbar`
--

INSERT INTO `tb_statusbar` (`statusid`, `userid`, `category`, `text`, `send_to`, `created_at`) VALUES
(1, 2, 'story', 'hi i am raveena.', 1, '2020-09-09 15:31:02'),
(2, 2, 'letter', 'hello nice to meet u', 1, '2020-09-09 15:36:02'),
(4, 1, 'story', 'The real lover is the man who can thrill you by kissing your forehead or smiling into your eyes or just staring into space.', 2, '2020-09-15 15:07:11'),
(5, 1, 'slogan', 'Firefighters go where they’re needed, sometimes ignoring the dangers even when no one is inside a burning building to be saved.', 2, '2020-09-16 10:15:35'),
(6, 1, 'letter', 'Dear Friend,\n\nI know. I know it’s been hard. My lack of positivity, my negative mindset, the complaining, the crying, the silence, the stress… the list goes on. It goes without saying that I haven’t had the best year. It hasn’t been one specific thing, just a million little things that have happened & these million little things have seemingly turned me into a person I don’t necessarily enjoy. But, through it all… you’re still here and I don’t even know how to say how thankful I am for that. When things get tough, a lot of people tend to run as fast as possible. But not you.', 2, '2020-09-16 10:16:20'),
(8, 7, 'story', 'ggggg', 1, '2020-09-17 10:28:24'),
(9, 7, 'slogan', 'evnt', 1, '2020-09-17 10:28:45'),
(10, 7, 'letter', 'Hii', 1, '2020-09-17 10:28:57'),
(11, 2, 'slogan', 'hi how r u', 1, '2020-12-31 10:44:49'),
(12, 1, 'story', 'haii', NULL, '2021-01-05 04:33:07'),
(13, 1, 'story', 'haii', NULL, '2021-01-05 04:33:59'),
(14, 1, 'story', 'haii', NULL, '2021-01-05 04:34:32'),
(15, 1, 'story', 'haii', 5, '2021-01-05 04:39:27'),
(16, 7, 'story', 'Hii', 43, '2021-01-07 10:10:25'),
(17, 7, 'story', 'Ravii', 2, '2021-01-07 10:10:51'),
(18, 7, 'slogan', 'La la la', 2, '2021-01-07 10:11:03'),
(19, 7, 'letter', 'My bestie', 2, '2021-01-07 10:11:16');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `university_name` varchar(255) DEFAULT NULL,
  `isocode` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `online_offline_status` int(11) DEFAULT 1 COMMENT '1=offline,0->online',
  `last_seen` timestamp NULL DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `name`, `email`, `phone`, `password`, `university_name`, `isocode`, `bio`, `gender`, `profile_pic`, `online_offline_status`, `last_seen`, `device_token`, `device_type`, `created_at`, `updated_at`) VALUES
(1, 'Akshay', 'akshaysics123@gmail.com', '8590395024', 'QWtzaGF5MDAwMQ==', 'kerala', 'undefined', 'haii', 'Male', 'f908bf892e89ae450ab5bb607e81ddcb.jpeg', 0, '2021-01-26 04:58:51', '', '', '2020-08-25 07:15:18', '2021-01-25 16:28:51'),
(2, 'Raveena', 'Ravi12345@gmail.com', '9897969594', 'UmF2aTEyMzQ1', NULL, NULL, NULL, NULL, '61b6cc6fae15dad3982fc52e26ae8b5c.jpg', 0, '2021-01-14 23:35:46', 'd1N1fq62QaqSvCNiwo2dsw:APA91bFm5PIxB5O_KNnA1Ww_KH0_qMEAyY98p1S1YvWVMGtdl-Iox7hkUWARcbunrMtilTyRbRHgu5sVjs2dcnUDmxhTh3FsILayExtaIs-WYH-CjtrlEjS6GPfSB-niU5z1CGe4VAA0', 'android', '2020-08-25 10:13:05', '2021-01-15 11:31:03'),
(3, 'jitheesh', 'jitheesh.srishti@gmail.com', '8110083126', 'Sml0aGVlc2gxMjM=', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-02 09:42:17', '2021-01-15 11:30:38'),
(4, 'jitheesh', 'r.jitheesh@gmail.com', '8110083126', 'Sml0aGVlc2gxMjM=', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-02 09:45:09', '2021-01-15 11:30:38'),
(5, 'jitheesh ', 'jitheesh@gmail.com', '8110083126', 'Sml0aGVlc2gzMzM=', NULL, NULL, NULL, NULL, 'd30d88ab2c40484ec359e0b112e3791b.jpg', 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-02 09:48:50', '2021-01-15 11:30:38'),
(6, 'Test 2', 'test@gmail.com', '9632589632', 'VGVzdGF0MTIz', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-02 11:12:14', '2021-01-15 11:30:38'),
(7, 'Sam', 'sams@gmail.com', '8714456389', 'UXdlcnR5eTEyMw==', NULL, NULL, NULL, NULL, 'e691d0d17a8653cd9bf4d25e31ee1268.jpeg', 0, '2021-01-27 03:22:51', 'ftiCKPaSSNu7fmDHitF0gI:APA91bEnKtTkxH2t9zURMdXNlm43UdedZEjkm-X7w4ctqwVjrEe0zeaQa4ZOhUxwkHsIndXpKhIMAl0ljH6DS-JNV8r7YBKrzWOGMi3bZ-RNRZgNklrR2zgIQulzi0-extLLyT-7e1i1', 'android', '2020-09-02 14:17:46', '2021-01-26 14:52:51'),
(8, 'Neethu', 'neetz@gmail.com', '8714456321', 'UXdlcnR5MTIz', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-03 05:47:26', '2021-01-15 11:30:38'),
(9, 'Aoc', 'Aoc12345@gmail.com', '9897969594', 'QW9jMTIzNDU=', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-03 05:51:57', '2021-01-15 11:30:38'),
(10, 'Nizam', 'nizam@gmail.com', '8714456389', 'UXdlcnR5MTIz', NULL, NULL, NULL, NULL, '1a7bf16ad0e5740fbf4429a9fc01d797.jpeg', 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-04 14:21:57', '2021-01-15 11:30:38'),
(11, 'kunjan', 'kunjan123@gmail.com', '9897969594', 'S3VuamFuMTIz', NULL, NULL, NULL, NULL, '', 0, '2020-12-19 18:44:36', 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-05 07:27:18', '2021-01-15 11:30:38'),
(12, 'Kanna', 'kannan123@gmail.com', '9897969594', 'S2FubmFuMTIz', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-05 08:17:21', '2021-01-15 11:30:38'),
(14, 'krishnan', 'Krishnan123@gmail.com', '9897969594', 'S3Jpc2huYW4xMjM=', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-05 08:33:21', '2021-01-15 11:30:38'),
(15, 'Ravi', 'Ravi123@gmail.com', '9897969594', 'UmF2aTEyMzQ1', '', NULL, NULL, NULL, NULL, 1, NULL, 'd1N1fq62QaqSvCNiwo2dsw:APA91bFm5PIxB5O_KNnA1Ww_KH0_qMEAyY98p1S1YvWVMGtdl-Iox7hkUWARcbunrMtilTyRbRHgu5sVjs2dcnUDmxhTh3FsILayExtaIs-WYH-CjtrlEjS6GPfSB-niU5z1CGe4VAA0', NULL, '2020-09-05 08:34:46', '2021-01-15 11:31:20'),
(16, 'Ram', 'ram@gmail.com', '8714456389', 'UXdlcnR5MTIz', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-08 04:28:26', '2021-01-15 11:30:38'),
(17, 'Ram', 'rama@gmail.com', '8714456389', 'UXdlcnR5MTIz', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-08 04:28:49', '2021-01-15 11:30:38'),
(18, 'Ram', 'ran@gmail.com', '8714456388', 'UXdlcnR5MTIz', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-08 04:29:27', '2021-01-15 11:30:38'),
(19, 'Binoy', 'bino@gmail.com', '8714456254', 'UXdlcnR5MTIz', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-09 06:12:21', '2021-01-15 11:30:38'),
(20, 'raveena', 'raveena.sics@gmail.com', '9947518982', 'MTIzNDU2', 'KTU', '91', 'i am btech', 'women', NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-10 11:31:35', '2021-01-15 11:30:38'),
(21, 'Lisa', 'lisa@gmail.com', '8714456325', 'UXdlcnR5MTIz', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-14 03:53:16', '2021-01-15 11:30:38'),
(22, 'Philip', 'philip12345@gmail.com', '9897969594', 'UGhpbGlwMTIzNDU=', '', NULL, NULL, NULL, NULL, 0, '2020-12-21 22:53:44', 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-16 16:19:14', '2021-01-15 11:30:38'),
(23, 'Kiran', 'Kiran12345@gmail.com', '9897969594', 'S2lyYW4xMjM0NQ==', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-21 05:28:46', '2021-01-15 11:30:38'),
(24, 'lallu', 'lallucsr@gmail.com', '9995116044', 'TGFsbHUxMjNTSUNT', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-21 07:50:16', '2021-01-15 11:30:38'),
(25, 'Vimal', 'vimal12345@gmail.com', '9897969594', 'VmltYWwxMjM0NQ==', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-09-28 11:25:02', '2021-01-15 11:30:38'),
(26, 'Kavitha', 'kavitha12345@gmail.com', '9897969594', 'TXkxc3RQcm9qZWN0', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-10-01 09:06:43', '2021-01-15 11:30:38'),
(27, 'Veena', 'Veena12345@gmail.com', '9897969594', 'VmVlbmExMjM0NQ==', '', NULL, NULL, NULL, NULL, 1, '2021-01-15 03:29:21', 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', '', '2020-10-08 11:54:42', '2021-01-15 11:30:38'),
(28, 'William', 'William12345@gmail.com', '9897969594', 'd2lsbGlhTTEyMzQ1', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-10-14 18:12:37', '2021-01-15 11:30:38'),
(29, 'Joe', 'joe@gmail.com', '985565555', 'cXdlcnR5QTEyMw==', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-10-21 12:09:47', '2021-01-15 11:30:38'),
(30, 'Joe', 'joe@gmail.com', '985565555', 'cXdlcnR5QTEyMw==', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-10-21 12:09:47', '2021-01-15 11:30:38'),
(31, 'Koyal', 'Koyal12345@gmail.com', '9897969594', 'S295YWwxMjM0NQ==', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-10-21 16:14:54', '2021-01-15 11:30:38'),
(32, 'Ajmal', 'Ajmal12345@gmail.com', '9897969594', 'QWptYWwxMjM0NQ==', '', NULL, NULL, NULL, NULL, 0, '2020-12-21 22:55:59', 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-10-21 16:42:55', '2021-01-15 11:30:38'),
(33, 'Krishnanunni', 'Krishnanunni12345@gmail.com', '9897969594', 'S3Jpc2huYW51bm5pMTIzNDU=', '', NULL, NULL, NULL, NULL, 0, '2020-12-09 03:09:30', 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-10-24 14:56:12', '2021-01-15 11:30:38'),
(34, 'Christiana Mariya', 'Christiana.maria123@gmail.com', '9897969594', 'Q2hyaXN0aWFuYTEyMw==', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-10-24 15:42:34', '2021-01-15 11:30:38'),
(35, 'Second', 'goldensworld917@gmail.com', '8079756013', 'YWJsZUdvZDI0NzM2Ng==', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-10-30 06:07:51', '2021-01-15 11:30:38'),
(36, 'Aparna', 'Aparna12345@gmail.com', '9897969594', 'QXBhcm5hMTIzNDU=', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-11-09 04:51:11', '2021-01-15 11:30:38'),
(37, 'Ashik', 'Ashik12345@gmail.com', '9897969594', 'QWtzaGFpazEyMzQ1', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-11-09 07:21:10', '2021-01-15 11:30:38'),
(38, 'Dev', 'Dev12345@gmail.com', '9897969594', 'RGV2MTIzNDU=', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-11-10 08:42:33', '2021-01-15 11:30:38'),
(39, 'Ambani', 'Ambani12345@gmail.com', '9897969594', 'QW1iYW5pMTIzNDU=', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-11-10 13:57:08', '2021-01-15 11:30:38'),
(40, 'Sanu Koshi', 'SanuKoshi12345@gmail.com', '9897969594', 'U2FudUtvc2hpMTIzNDU=', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-11-17 07:22:16', '2021-01-15 11:30:38'),
(41, 'Vineetha Koshy', 'VineethaKoshy12345@gmail.com', '9897969594', 'VmluZWV0aGFLb3NoeTEyMzQ1', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-11-17 09:37:47', '2021-01-15 11:30:38'),
(42, 'Himanshu', 'Himanshu12345@gmail.com', '9897969594', 'SGltYW5zaHUxMjM0NQ==', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-11-17 10:08:56', '2021-01-15 11:30:38'),
(43, 'Bino', 'binoy@gmail.com', '8714456389', 'UXdlcnR5eTEyMw==', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-11-24 10:42:47', '2021-01-15 11:30:38'),
(44, 'Chris Harris', 'Chris.haris123@gmail.com', '9897969594', 'Q2hyaXMxMjM=', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-11-25 08:38:19', '2021-01-15 11:30:38'),
(45, 'Triyana', 'Triyana12345@gmail.com', '9897969594', 'VHJpeWFuYTEyMzQ1', '', NULL, NULL, NULL, NULL, 1, NULL, 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-12-03 11:08:45', '2021-01-15 11:30:38'),
(46, 'Mani Kumar', 'Mani12345@gmail.com', '9897969594', 'TWFuaTEyMzQ1', '', NULL, NULL, NULL, NULL, 0, '2020-12-08 02:40:46', 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-12-03 11:50:07', '2021-01-15 11:30:38'),
(47, 'Medoosa ', 'Medoosa123@gmail.com', '9897969594', 'TWVkb29zYTEyMw==', '', NULL, NULL, NULL, NULL, 0, '2020-12-22 01:46:40', 'c1arZ20nQrOmCAweyZujDi:APA91bGft7txyH5HgXiAJ_BsiWQY11CO0d9xR5wZtcmsVf0RVaN124afOo89CG9xh4s1fUtbbEvVICCl_6-ub7iHr80F3g9KUdVSujYHKHhkhh7fFNO4yHaqLY5KqnErMhpL1l2OAi95', NULL, '2020-12-21 12:57:03', '2021-01-15 11:30:38'),
(48, 'Rahul', 'rahulsharma.sharma1950@gmail.com', '8302992687', 'UmFodWxAMTIz', '', '+91', NULL, NULL, NULL, 1, NULL, 'fxyjuBm4QdyOwX2GbonkTW:APA91bGOMM7RvgmDTtl1AjK5T-0Y3zrcTPBOwjZ94kaKHxcqvfU6jIDezJ7jBOoBqmAhhu9eD1kZbyN8rF8FnSwFrV-l9riYOEUB6cHpp8z7g5G-8AGf2hpmzsWJQCKf1qvbLH-717f3', NULL, '2021-01-21 12:50:33', '2021-01-21 12:50:33'),
(49, 'Sara', 'sara@gmail.com', '8717788145', 'UXdlcnR5MTIz', '', '+234', NULL, NULL, NULL, 0, '2021-01-26 20:12:03', 'c0uT8LJ5SBuUc_Lo6yifrC:APA91bHqsIqNbXsPSg34N50HyfLo5JEvlECbX577TM2QLOTdeGwFKQunuiL4vLGSk_kvBogukSqQsOH9Cdgp8PFlU1Rp_3xL8svhWdvcdUwIMAhiWY4Ig8m2pC4xEZgvd1hZLM3MTACg', 'android', '2021-01-22 07:18:12', '2021-01-26 07:42:03'),
(50, 'lallu', 'srishti.lallu@gmail.com', '9995116044', 'TGFsbHVAMTIz', '', '+91', NULL, NULL, NULL, 1, NULL, 'fpYnFQhGSwO-8US2dMSWSA:APA91bEGl9b2tnC_4AeFyjogefx0qkaHCW9Sux2JWBIBCzaounwETsAFW-2X__nFREspS7v81q7eWIQbkdxugo3gSUSI3eTx_0mP8p_aZzvaG5RiAOD4X0OdespvSue4DeDoahGKxudn', NULL, '2021-01-22 07:47:22', '2021-01-22 07:47:22'),
(51, 'Rebecca', 'Rebecca.rex@gmail.com', '9897969594', 'UmViZWNjYTEyMzQ1', '', '+234', NULL, NULL, NULL, 0, '2021-01-25 18:12:48', 'cMqUcZsFQFOnbSIOwuPDov:APA91bHmGyzsQRoWLfWEHmgpW9x6fzf-3RqZtf1nw4Fegr7AeqoURvhSNvtmK3EXX5hBrAawNlRxAv5qOSapsRns4q_lvlbmw5iTAGvQb1kFH1n7n6_w7ThP1AJkZwN_1EHWqgHxZxQ6', 'android', '2021-01-25 05:41:36', '2021-01-25 05:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `tb_useranswer`
--

CREATE TABLE `tb_useranswer` (
  `ansid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `questionid` varchar(255) DEFAULT NULL,
  `answer1` varchar(255) DEFAULT NULL,
  `answer2` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_useranswer`
--

INSERT INTO `tb_useranswer` (`ansid`, `userid`, `questionid`, `answer1`, `answer2`, `created_at`) VALUES
(1, 1, '1', 'I am both happy and sad at the same time, and I\'m still trying to figure out how that could be.', 'I am both happy and sad at the same time, and I\'m still trying to figure out how that could be.', '2020-11-04 07:09:27'),
(3, 2, '2', 'goodsad', 'fighting', '2020-11-17 09:12:25'),
(4, 40, '3', 'fbjnbkdc', 'fighting', '2020-11-17 09:14:59'),
(5, 40, '5', 'fbjnbkdc', 'fighting', '2020-11-17 09:49:00'),
(6, 40, '8', 'fbjnbkdc', 'fighting', '2020-11-17 09:49:14'),
(7, 41, '1', 'There’s not a word yet for old friends who’ve just met.', 'True friendship comes when the silence between two people is comfortable.', '2020-11-17 10:07:22'),
(8, 42, '1', 'A single rose can be my garden… a single friend, my world.', 'Don’t make friends who are comfortable to be with. Make friends who will force you to lever yourself up.', '2020-11-17 10:09:59'),
(9, 7, '1', 'Nothing will do', 'Hello', '2020-11-24 10:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `tb_userchat`
--

CREATE TABLE `tb_userchat` (
  `chatid` int(11) NOT NULL,
  `userid_from` int(11) NOT NULL,
  `userid_to` int(11) NOT NULL,
  `message` varchar(300) DEFAULT NULL,
  `chattoken` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_userchat`
--

INSERT INTO `tb_userchat` (`chatid`, `userid_from`, `userid_to`, `message`, `chattoken`, `created_at`) VALUES
(1, 1, 5, 'Hi', 'chat15', '2020-11-27 12:49:28'),
(2, 1, 5, 'How are you?', 'chat15', '2020-11-27 12:49:55'),
(3, 1, 2, 'Hi,How are you?', 'chat12', '2020-11-27 12:50:15'),
(4, 1, 2, 'Hi', 'chat12', '2020-11-27 12:51:15'),
(5, 2, 1, 'Hi', 'chat12', '2020-11-27 12:51:44'),
(6, 2, 1, 'i am good', 'chat12', '2020-11-27 12:52:15'),
(7, 2, 5, 'Hi', 'chat25', '2020-11-27 12:53:37'),
(8, 1, 2, 'Can we be frnds?', 'chat12', '2020-11-30 23:07:25'),
(9, 1, 2, 'helloww', 'chat12', '2020-11-30 23:17:05'),
(10, 1, 2, 'hellow', 'chat12', '2020-11-30 23:17:11'),
(11, 1, 2, 'haii', 'chat12', '2020-11-30 23:17:22'),
(12, 1, 2, 'I like to listen. I have learned a great deal from listening carefully. Most people never listen.', 'chat12', '2020-11-30 23:23:41'),
(13, 2, 1, 'haii', 'chat12', '2020-11-30 23:32:45'),
(14, 2, 1, 'i am here', 'chat12', '2020-11-30 23:32:53'),
(15, 2, 1, NULL, 'chat12', '2020-11-30 23:33:03'),
(16, 2, 1, 'tell me', 'chat12', '2020-11-30 23:33:25'),
(17, 1, 2, 'daa', 'chat12', '2020-12-01 11:18:29'),
(18, 1, 2, 'hellow....R u free now?', 'chat12', '2020-12-01 11:22:34'),
(19, 1, 2, 'hellow....R u free now?', 'chat12', '2020-12-01 11:22:42'),
(20, 1, 2, 'haii', 'chat12', '2020-12-01 11:23:26'),
(21, 1, 2, 'hellow', 'chat12', '2020-12-01 11:24:25'),
(22, 1, 2, 'daaa', 'chat12', '2020-12-01 11:24:32'),
(23, 1, 2, 'how r u da?', 'chat12', '2020-12-01 11:24:45'),
(24, 1, 2, 'haii', 'chat12', '2020-12-01 11:29:46'),
(25, 1, 2, 'hellow', 'chat12', '2020-12-01 11:49:02'),
(26, 1, 2, 'hey', 'chat12', '2020-12-01 11:57:15'),
(27, 1, 2, 'heii da', 'chat12', '2020-12-01 11:57:26'),
(28, 1, 2, 'nice', 'chat12', '2020-12-01 11:57:34'),
(29, 1, 2, 'great', 'chat12', '2020-12-01 11:59:11'),
(30, 1, 2, 'heyy', 'chat12', '2020-12-01 11:59:19'),
(31, 1, 2, 'wow', 'chat12', '2020-12-01 11:59:25'),
(32, 1, 2, 'nice', 'chat12', '2020-12-01 11:59:34'),
(33, 1, 2, 'hey', 'chat12', '2020-12-01 12:01:07'),
(34, 1, 2, 'hellow', 'chat12', '2020-12-01 12:01:14'),
(35, 1, 2, 'haii', 'chat12', '2020-12-01 12:01:22'),
(36, 1, 5, 'heyy', 'chat15', '2020-12-01 12:02:34'),
(37, 1, 5, 'daaa', 'chat15', '2020-12-01 12:02:39'),
(38, 1, 5, 'hellow', 'chat15', '2020-12-01 12:02:44'),
(39, 1, 5, 'nice', 'chat15', '2020-12-01 12:02:51'),
(40, 1, 5, 'great', 'chat15', '2020-12-01 12:02:59'),
(41, 1, 5, 'wow', 'chat15', '2020-12-01 12:03:11'),
(42, 1, 5, 'hey', 'chat15', '2020-12-01 12:04:21'),
(43, 1, 5, 'hellow', 'chat15', '2020-12-01 12:04:30'),
(44, 1, 5, 'daaa', 'chat15', '2020-12-01 12:05:39'),
(45, 1, 5, 'hellow', 'chat15', '2020-12-01 12:05:58'),
(46, 1, 5, 'haii', 'chat15', '2020-12-01 12:06:11'),
(47, 1, 5, 'heyy', 'chat15', '2020-12-01 12:09:19'),
(48, 1, 5, 'hey', 'chat15', '2020-12-01 12:17:45'),
(49, 1, 5, 'okey', 'chat15', '2020-12-01 12:17:55'),
(50, 1, 5, 'daaa', 'chat15', '2020-12-01 12:18:04'),
(51, 1, 5, 'daa', 'chat15', '2020-12-01 12:22:12'),
(52, 1, 5, 'hey', 'chat15', '2020-12-01 12:22:19'),
(53, 1, 5, 'haii', 'chat15', '2020-12-01 12:22:27'),
(54, 1, 5, 'hellow', 'chat15', '2020-12-01 12:22:39'),
(55, 1, 5, 'daa', 'chat15', '2020-12-01 12:33:27'),
(56, 1, 5, 'cute', 'chat15', '2020-12-01 12:33:40'),
(57, 1, 5, 'great', 'chat15', '2020-12-01 12:33:50'),
(58, 1, 5, 'hey', 'chat15', '2020-12-01 12:34:38'),
(59, 1, 5, 'nice', 'chat15', '2020-12-01 12:35:03'),
(60, 1, 5, 'wow', 'chat15', '2020-12-01 12:35:15'),
(61, 1, 5, 'r u free now?', 'chat15', '2020-12-01 12:37:09'),
(62, 1, 5, 'nice to meet u da', 'chat15', '2020-12-01 12:37:22'),
(63, 1, 5, 'hellow', 'chat15', '2020-12-01 12:37:34'),
(64, 1, 2, 'hellow da', 'chat12', '2020-12-01 12:45:44'),
(65, 3, 1, 'tell me', 'chat31', '2020-12-01 13:56:11'),
(66, 1, 3, 'haii da', 'chat31', '2020-12-01 14:02:43'),
(67, 1, 3, 'hellow', 'chat31', '2020-12-01 14:02:59'),
(68, 3, 1, 'haii', 'chat31', '2020-12-01 14:03:15'),
(69, 3, 1, 'how r u?', 'chat31', '2020-12-01 14:03:41'),
(70, 1, 3, 'r u free now?', 'chat31', '2020-12-01 14:10:28'),
(71, 3, 1, 'ya', 'chat31', '2020-12-01 14:10:40'),
(72, 3, 1, 'tell me', 'chat31', '2020-12-01 14:10:50'),
(73, 1, 3, 'okey da', 'chat31', '2020-12-01 14:11:37'),
(74, 1, 3, 'fine', 'chat31', '2020-12-01 14:11:47'),
(75, 1, 2, 'haii da', 'chat12', '2020-12-01 19:04:09'),
(76, 1, 2, 'hellow', 'chat12', '2020-12-01 19:04:16'),
(77, 1, 2, 'where r u?', 'chat12', '2020-12-01 19:04:26'),
(78, 1, 2, 'hellow', 'chat12', '2020-12-01 19:04:33'),
(79, 1, 5, 'haii', 'chat15', '2020-12-01 19:05:58'),
(80, 1, 2, 'haii', 'chat12', '2020-12-02 10:58:13'),
(81, 1, 2, 'good Morning', 'chat12', '2020-12-02 10:58:22'),
(82, 1, 2, 'hellow', 'chat12', '2020-12-02 10:59:03'),
(83, 1, 2, 'haii', 'chat12', '2020-12-02 10:59:09'),
(84, 1, 2, 'haiii', 'chat12', '2020-12-02 10:59:24'),
(85, 1, 2, 'hellow', 'chat12', '2020-12-02 10:59:32'),
(86, 1, 2, 'daaa', 'chat12', '2020-12-02 10:59:51'),
(87, 1, 2, 'hellow', 'chat12', '2020-12-02 11:03:11'),
(88, 1, 2, 'haii', 'chat12', '2020-12-02 11:03:21'),
(89, 1, 2, 'daaa', 'chat12', '2020-12-02 11:03:34'),
(90, 1, 2, 'wow', 'chat12', '2020-12-02 11:03:44'),
(91, 1, 7, 'haii', 'chat17', '2020-12-02 13:08:20'),
(92, 1, 10, 'haii', 'chat110', '2020-12-02 13:42:19'),
(93, 1, 10, 'hellow', 'chat110', '2020-12-02 19:48:42'),
(94, 1, 7, 'Hellow', 'chat17', '2020-12-03 10:30:42'),
(95, 1, 2, 'Haii , good mng', 'chat12', '2020-12-03 10:31:29'),
(96, 1, 2, 'Hellow', 'chat12', '2020-12-03 10:31:37'),
(97, 1, 2, 'Haii', 'chat12', '2020-12-03 10:31:51'),
(98, 1, 2, 'Wow', 'chat12', '2020-12-03 10:32:01'),
(99, 1, 2, 'Daaa', 'chat12', '2020-12-03 10:32:09'),
(100, 1, 2, 'Haii', 'chat12', '2020-12-03 10:32:15'),
(101, 1, 2, 'Daa', 'chat12', '2020-12-03 10:32:24'),
(102, 1, 2, 'Deii', 'chat12', '2020-12-03 10:32:32'),
(103, 2, 1, 'tell me', 'chat12', '2020-12-03 10:35:21'),
(104, 2, 1, 'haii', 'chat12', '2020-12-03 10:35:33'),
(105, 2, 1, 'Good mng', 'chat12', '2020-12-03 10:35:51'),
(106, 1, 2, 'haii', 'chat12', '2020-12-03 10:44:33'),
(107, 1, 2, 'haii', 'chat12', '2020-12-03 10:46:13'),
(108, 1, 2, 'haii da', 'chat12', '2020-12-03 12:24:42'),
(109, 2, 1, 'Good mng', 'chat12', '2020-12-03 12:25:46'),
(110, 2, 1, 'Good mng', 'chat12', '2020-12-03 12:25:57'),
(111, 2, 1, 'haii', 'chat12', '2020-12-03 12:26:09'),
(112, 2, 1, 'how r u? da', 'chat12', '2020-12-03 12:26:31'),
(113, 7, 1, 'how r u? da', 'chat17', '2020-12-03 12:38:12'),
(114, 33, 1, 'haii da', 'chat331', '2020-12-03 16:34:08'),
(115, 33, 1, 'How r u?', 'chat331', '2020-12-03 16:34:40'),
(116, 45, 5, 'haii da', 'chat455', '2020-12-03 17:14:17'),
(118, 1, 2, 'haii', 'chat12', '2020-12-07 23:22:28'),
(119, 1, 2, 'how r u da?', 'chat12', '2020-12-07 23:22:43'),
(120, 1, 5, 'Hai !', 'chat15', '2021-01-05 11:56:57'),
(121, 1, 5, 'Hai !', 'chat15', '2021-01-05 11:57:20'),
(122, 1, 7, 'Hai !', 'chat17', '2021-01-05 20:03:52'),
(123, 1, 2, 'haii', 'chat12', '2021-01-07 13:15:43'),
(124, 2, 1, 'Hi', 'chat12', '2021-01-14 15:35:38'),
(125, 2, 1, 'Hello', 'chat12', '2021-01-14 15:35:47'),
(126, 2, 1, 'Good evening', 'chat12', '2021-01-14 16:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `tb_userchatupload`
--

CREATE TABLE `tb_userchatupload` (
  `up_id` int(11) NOT NULL,
  `userid_to` int(11) DEFAULT NULL,
  `userid_from` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_userchatupload`
--

INSERT INTO `tb_userchatupload` (`up_id`, `userid_to`, `userid_from`, `filename`, `created_at`) VALUES
(1, 2, 1, '2e89bc77a8eab69504ef2d9b1850eb5c.wpl', '2020-12-07 07:00:00'),
(2, 2, 1, '37423cdaf708a7f6f0d4d72cb59ffd01.pptx', '2020-12-07 07:00:00'),
(3, 2, 1, '3cdbb78cd5faa698de0d73c857c4fbc9.csv', '2020-12-08 05:03:05'),
(4, 1, 2, '13e9caa8fe8ea91037cab4ffbf1ac74c.jpg', '2020-12-09 11:34:56'),
(5, 2, 1, '9241513405a5cacc3908c5fc5a299165.csv', '2020-12-15 11:45:35'),
(6, 1, 2, '10cf385ec2bd31bc793071758a53dd73.jpeg', '2020-12-15 13:03:06'),
(7, 1, 5, 'c8c11683fa1fe43d7042b642bfc3a5b3.jpg', '2020-12-16 14:29:04'),
(8, 1, 5, '2278033aa38856da8a889ef7a91cced9.jpg', '2020-12-16 14:58:52'),
(9, 1, 2, '44508bf33af83ac39c049d3aaded13c2.jpg', '2020-12-16 14:59:26'),
(10, 1, 2, '747fcbfc90ac123c2b2ba79336dd20d4.jpg', '2020-12-16 15:18:30'),
(11, 1, 3, '77b03c8133f5c00ae4928a502ef2f612.jpg', '2020-12-16 15:18:30'),
(12, 1, 3, '90fc2c6f0c1e4c65994925349582c5c4.jpg', '2020-12-16 15:19:42'),
(13, 1, 2, 'f6583f99209eb0d00d7a3444a7443e14.jpg', '2020-12-16 15:19:42'),
(14, 2, 1, '50a467a91f1256f5cab3721f7ebf402a.csv', '2020-12-16 15:33:32'),
(15, 5, 2, '030ce76908962586f2532afd49fccf3c.jpg', '2020-12-16 16:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `tb_usercomments`
--

CREATE TABLE `tb_usercomments` (
  `com_id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `userstatus` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_usercomments`
--

INSERT INTO `tb_usercomments` (`com_id`, `userid`, `comment`, `userstatus`, `created_at`) VALUES
(1, 2, 'hello', 'self', '2020-11-06 08:08:42'),
(2, 2, 'hello', 'self', '2020-11-06 08:20:28'),
(3, 1, 'wow', 'self', '2020-11-06 10:14:43'),
(4, 1, 'great', 'self', '2020-11-06 10:14:51'),
(5, 1, 'second one was really good', 'self', '2020-11-06 10:15:09'),
(6, 36, 'haii', 'self', '2020-11-09 05:22:09'),
(7, 36, 'hellow', 'self', '2020-11-09 05:27:22'),
(8, 36, 'how r u guys?', 'self', '2020-11-09 06:08:00'),
(9, 1, 'great', 'self', '2020-11-10 06:26:18'),
(10, 1, 'nice', 'self', '2020-11-10 06:26:49'),
(11, 1, 'great', 'self', '2020-11-10 13:48:00'),
(12, 2, 'hello nice to meet you', 'self', '2020-11-11 08:05:01'),
(13, 38, 'Wow...that first one was really great thought', 'self', '2020-11-11 09:24:16'),
(14, 7, 'Hlo', 'self', '2020-11-12 14:21:24'),
(15, 1, 'I do not understand this analogy,\" Mencheres muttered.', 'self', '2020-11-12 15:18:21'),
(16, 7, 'Hju', 'self', '2020-11-16 06:52:04'),
(17, 1, 'haii', 'self', '2020-11-17 07:15:40'),
(18, 42, 'haii', 'self', '2020-11-17 10:39:20'),
(19, 1, 'hellow', 'self', '2020-11-18 07:16:15'),
(20, 1, 'heii', 'self', '2020-11-18 07:17:11'),
(21, 1, 'koooii', 'self', '2020-11-18 07:18:55'),
(22, 1, 'koooii', 'self', '2020-11-18 07:19:04'),
(23, 1, 'hellow', 'self', '2020-11-18 07:20:18'),
(24, 1, 'heyy', 'self', '2020-11-18 07:20:26'),
(25, 1, 'heyy', 'self', '2020-11-18 07:20:33'),
(26, 1, 'hey', 'self', '2020-11-18 07:37:23'),
(27, 1, 'hey', 'self', '2020-11-18 07:37:27'),
(28, 1, 'hellow', 'self', '2020-11-18 07:37:33'),
(29, 7, 'Hello', 'self', '2020-11-24 10:41:03'),
(30, 7, 'Hii', 'self', '2020-11-24 11:06:57'),
(31, 7, 'hhhh', 'self', '2020-12-01 06:58:49'),
(32, 7, 'hhhh', 'self', '2020-12-01 06:58:49'),
(33, 7, 'hhhh', 'self', '2020-12-01 06:58:49'),
(34, 7, 'hhhh', 'self', '2020-12-01 06:58:50'),
(35, 7, 'ggggg', 'self', '2020-12-01 06:58:59');

-- --------------------------------------------------------

--
-- Table structure for table `tb_userupload`
--

CREATE TABLE `tb_userupload` (
  `fileid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `send_to` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_userupload`
--

INSERT INTO `tb_userupload` (`fileid`, `user_id`, `send_to`, `filename`, `created_at`) VALUES
(1, 2, NULL, '0bb2f060106b4f9a242d80b34ab1a761.mp4', '2020-11-26 16:27:49'),
(2, 2, NULL, 'dee49be2659f120225cd8e0d16ae9713.jpg', '2020-11-26 16:29:05'),
(3, 2, NULL, '3ec19b260e1eafb126c23f16ac7f1277.jpg', '2020-12-16 05:35:13'),
(4, 2, NULL, '93f0db0782781a6f1b21f35bd7c1c01e.jpg', '2020-12-16 06:34:16'),
(5, 1, NULL, '64779090a8fb49dd856e3ebc17cd33c7.jpg', '2020-12-16 06:54:05'),
(6, 1, NULL, '6f84d399e109302461b5b6cae9501d08.jpg', '2020-12-16 07:07:00'),
(7, 1, NULL, '8f3c2ea3502acfcec52f112c7397e450.jpeg', '2020-12-16 13:33:55'),
(8, 1, NULL, '986830b0c240a996c9f7b9b173c0d2e8.jpeg', '2020-12-16 16:24:33'),
(9, 7, NULL, '53293e63cb33654d7a0257c2f64f9bae.jpeg', '2020-12-22 14:29:20'),
(10, 7, NULL, '40a25b5711d59f14c414f05b99c653e9.jpeg', '2020-12-22 14:29:33'),
(11, 2, 1, 'de5603dfe2e363f8ccb70a976fa6811a.jpg', '2021-01-05 09:15:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_adminmessage`
--
ALTER TABLE `tb_adminmessage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_answerlike`
--
ALTER TABLE `tb_answerlike`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bestie`
--
ALTER TABLE `tb_bestie`
  ADD PRIMARY KEY (`bestie_id`);

--
-- Indexes for table `tb_bestmoment`
--
ALTER TABLE `tb_bestmoment`
  ADD PRIMARY KEY (`momentid`);

--
-- Indexes for table `tb_bestmomentupload`
--
ALTER TABLE `tb_bestmomentupload`
  ADD PRIMARY KEY (`uploadid`);

--
-- Indexes for table `tb_comment`
--
ALTER TABLE `tb_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tb_commentlike`
--
ALTER TABLE `tb_commentlike`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_countrycode`
--
ALTER TABLE `tb_countrycode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_fans`
--
ALTER TABLE `tb_fans`
  ADD PRIMARY KEY (`fan_id`);

--
-- Indexes for table `tb_like`
--
ALTER TABLE `tb_like`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `tb_match`
--
ALTER TABLE `tb_match`
  ADD PRIMARY KEY (`matchid`);

--
-- Indexes for table `tb_matchupload`
--
ALTER TABLE `tb_matchupload`
  ADD PRIMARY KEY (`mup_id`);

--
-- Indexes for table `tb_momentcomment`
--
ALTER TABLE `tb_momentcomment`
  ADD PRIMARY KEY (`mcomment_id`);

--
-- Indexes for table `tb_momentlike`
--
ALTER TABLE `tb_momentlike`
  ADD PRIMARY KEY (`momentlike_id`);

--
-- Indexes for table `tb_MyiQuery`
--
ALTER TABLE `tb_MyiQuery`
  ADD PRIMARY KEY (`queryid`);

--
-- Indexes for table `tb_myiquerycomment`
--
ALTER TABLE `tb_myiquerycomment`
  ADD PRIMARY KEY (`querycomment_id`);

--
-- Indexes for table `tb_myiquerylike`
--
ALTER TABLE `tb_myiquerylike`
  ADD PRIMARY KEY (`iquerylike_id`);

--
-- Indexes for table `tb_notification`
--
ALTER TABLE `tb_notification`
  ADD PRIMARY KEY (`not_id`);

--
-- Indexes for table `tb_statusbar`
--
ALTER TABLE `tb_statusbar`
  ADD PRIMARY KEY (`statusid`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_useranswer`
--
ALTER TABLE `tb_useranswer`
  ADD PRIMARY KEY (`ansid`);

--
-- Indexes for table `tb_userchat`
--
ALTER TABLE `tb_userchat`
  ADD PRIMARY KEY (`chatid`);

--
-- Indexes for table `tb_userchatupload`
--
ALTER TABLE `tb_userchatupload`
  ADD PRIMARY KEY (`up_id`);

--
-- Indexes for table `tb_usercomments`
--
ALTER TABLE `tb_usercomments`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `tb_userupload`
--
ALTER TABLE `tb_userupload`
  ADD PRIMARY KEY (`fileid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_adminmessage`
--
ALTER TABLE `tb_adminmessage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_answerlike`
--
ALTER TABLE `tb_answerlike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_bestie`
--
ALTER TABLE `tb_bestie`
  MODIFY `bestie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tb_bestmoment`
--
ALTER TABLE `tb_bestmoment`
  MODIFY `momentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_bestmomentupload`
--
ALTER TABLE `tb_bestmomentupload`
  MODIFY `uploadid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tb_comment`
--
ALTER TABLE `tb_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `tb_commentlike`
--
ALTER TABLE `tb_commentlike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_countrycode`
--
ALTER TABLE `tb_countrycode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `tb_fans`
--
ALTER TABLE `tb_fans`
  MODIFY `fan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tb_like`
--
ALTER TABLE `tb_like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tb_match`
--
ALTER TABLE `tb_match`
  MODIFY `matchid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `tb_matchupload`
--
ALTER TABLE `tb_matchupload`
  MODIFY `mup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tb_momentcomment`
--
ALTER TABLE `tb_momentcomment`
  MODIFY `mcomment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_momentlike`
--
ALTER TABLE `tb_momentlike`
  MODIFY `momentlike_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_MyiQuery`
--
ALTER TABLE `tb_MyiQuery`
  MODIFY `queryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tb_myiquerycomment`
--
ALTER TABLE `tb_myiquerycomment`
  MODIFY `querycomment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tb_myiquerylike`
--
ALTER TABLE `tb_myiquerylike`
  MODIFY `iquerylike_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_notification`
--
ALTER TABLE `tb_notification`
  MODIFY `not_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1087;

--
-- AUTO_INCREMENT for table `tb_statusbar`
--
ALTER TABLE `tb_statusbar`
  MODIFY `statusid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tb_useranswer`
--
ALTER TABLE `tb_useranswer`
  MODIFY `ansid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_userchat`
--
ALTER TABLE `tb_userchat`
  MODIFY `chatid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `tb_userchatupload`
--
ALTER TABLE `tb_userchatupload`
  MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_usercomments`
--
ALTER TABLE `tb_usercomments`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_userupload`
--
ALTER TABLE `tb_userupload`
  MODIFY `fileid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
