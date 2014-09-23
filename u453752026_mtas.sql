-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2014 at 08:32 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `u453752026_mtas`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
(1, 'movies'),
(2, 'trailers'),
(3, 'serials'),
(4, 'music');

-- --------------------------------------------------------

--
-- Table structure for table `cat_alias`
--

CREATE TABLE IF NOT EXISTS `cat_alias` (
  `cat_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_id` int(11) NOT NULL,
  `ct_alias` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cat_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `cat_alias`
--

INSERT INTO `cat_alias` (`cat_alias_id`, `ct_id`, `ct_alias`) VALUES
(1, 1, 'movie'),
(2, 1, 'movies'),
(3, 1, 'film'),
(4, 1, 'films'),
(5, 1, 'cinema'),
(6, 1, 'cinemas'),
(7, 2, 'trailer'),
(8, 2, 'trailers'),
(9, 2, 'teaser'),
(10, 2, 'teasers'),
(11, 2, 'theatricaltrailer'),
(12, 2, 'firstlook'),
(13, 3, 'serial'),
(14, 3, 'serials'),
(15, 3, 'tv'),
(16, 3, 'show'),
(17, 3, 'shows'),
(18, 3, 'tvshow'),
(19, 3, 'tvshows'),
(20, 3, 'series'),
(21, 3, 'tvseries'),
(22, 4, 'music'),
(23, 4, 'song'),
(24, 4, 'songs'),
(37, 2, 'theatrical'),
(36, 1, 'fullmovies'),
(27, 4, 'videosong'),
(28, 4, 'videosongs'),
(35, 3, 'fullshow'),
(34, 3, 'fullserial'),
(31, 4, 'musicvideo'),
(32, 4, 'musicvideos'),
(33, 1, 'fullmovie'),
(38, 2, 'theatricaltrailers');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `gen_id` int(11) NOT NULL AUTO_INCREMENT,
  `gen_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`gen_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`gen_id`, `gen_name`) VALUES
(1, 'horror'),
(2, 'action'),
(3, 'comedy'),
(4, 'thriller'),
(5, 'romance'),
(6, 'fantasy'),
(7, 'fiction'),
(8, 'devotion'),
(9, 'drama');

-- --------------------------------------------------------

--
-- Table structure for table `gen_alias`
--

CREATE TABLE IF NOT EXISTS `gen_alias` (
  `gen_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `gn_id` int(11) NOT NULL,
  `gn_alias` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`gen_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=68 ;

--
-- Dumping data for table `gen_alias`
--

INSERT INTO `gen_alias` (`gen_alias_id`, `gn_id`, `gn_alias`) VALUES
(1, 1, 'horror'),
(2, 1, 'horrormovie'),
(3, 1, 'horrorfilm'),
(4, 1, 'horrormovies'),
(5, 1, 'horrorfilms'),
(6, 2, 'action'),
(7, 2, 'actionmovie'),
(8, 2, 'actionfilm'),
(9, 2, 'actionmovies'),
(10, 2, 'actionfilms'),
(11, 3, 'comedy'),
(12, 3, 'comedymovie'),
(13, 3, 'comedymovies'),
(14, 3, 'comedyfilm'),
(15, 3, 'comedyfilms'),
(16, 4, 'thriller'),
(17, 4, 'suspense'),
(18, 4, 'thrillerfilm'),
(19, 4, 'thrillerfilms'),
(20, 4, 'thrillermovie'),
(21, 4, 'thrillermovies'),
(22, 4, 'suspensefilm'),
(23, 4, 'suspensefilms'),
(24, 4, 'suspensemovie'),
(25, 4, 'suspensemovies'),
(26, 5, 'romance'),
(27, 5, 'romantic'),
(28, 5, 'romancefilm'),
(29, 5, 'romancefilms'),
(30, 5, 'romancemovie'),
(31, 5, 'romancemovies'),
(32, 5, 'romanticfilm'),
(33, 5, 'romanticfilms'),
(34, 5, 'romanticmovie'),
(35, 5, 'romanticmovies'),
(36, 6, 'fantasy'),
(37, 6, 'fantasyfilm'),
(38, 6, 'fantasyfilms'),
(39, 6, 'fantasymovie'),
(40, 6, 'fantasymovies'),
(41, 7, 'fiction'),
(42, 7, 'sci-fi'),
(43, 7, 'sciencefiction'),
(44, 7, 'scifi'),
(45, 7, 'fictionfilm'),
(46, 7, 'fictionfilms'),
(47, 7, 'fictionmovie'),
(48, 7, 'fictionmovies'),
(49, 7, 'scifimovie'),
(50, 7, 'sci-fimovie'),
(51, 7, 'scifimovies'),
(52, 7, 'sci-fimovies'),
(53, 8, 'devotion'),
(54, 8, 'devotional'),
(55, 8, 'devotionalfilm'),
(56, 8, 'devotionalfilms'),
(57, 8, 'devotionalmovie'),
(58, 8, 'devotionalmovies'),
(59, 8, 'devotionmovie'),
(60, 8, 'devotionmovies'),
(61, 8, 'bhakti'),
(62, 8, 'bhakthi'),
(63, 9, 'drama'),
(64, 9, 'dramafilm'),
(65, 9, 'dramafilms'),
(66, 9, 'dramamovie'),
(67, 9, 'dramamovies');

-- --------------------------------------------------------

--
-- Table structure for table `search_terms`
--

CREATE TABLE IF NOT EXISTS `search_terms` (
  `srch_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_id` int(11) NOT NULL,
  `srch_term` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`srch_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `search_terms`
--

INSERT INTO `search_terms` (`srch_id`, `ct_id`, `srch_term`) VALUES
(1, 1, 'video'),
(2, 1, 'videos'),
(3, 2, 'video'),
(4, 2, 'videos'),
(5, 3, 'video'),
(6, 3, 'videos'),
(7, 4, 'video'),
(8, 4, 'videos'),
(9, 1, 'full'),
(10, 3, 'full');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`) VALUES
(1, 'chiranjeevi konidela'),
(2, 'ram charan konidela'),
(3, 'nagarjuna akkineni'),
(4, 'mahesh babu'),
(5, 'pawan kalyan konidela'),
(13, 'genelia d''souza'),
(12, 'kajal aggarwal'),
(11, 'tamanna bhatia'),
(14, 'samantha ruth prabhu'),
(15, 'anushka shetty'),
(16, 'trisha krishnan'),
(17, 'shriya saran'),
(18, 'jyothika'),
(19, 'namrata shirodkar'),
(20, 'simran'),
(21, 'suhasini maniratnam'),
(22, 'neha sharma'),
(23, 'shruthi hassan'),
(24, 'sonali bendre'),
(25, 'charmy kaur'),
(26, 'tabu'),
(27, 'sneha'),
(28, 'mamta mohandas'),
(29, 'anjali'),
(30, 'bhumika chawla'),
(31, 'keerthi reddy'),
(32, 'ileana d''cruz'),
(33, 'parvati melton'),
(34, 'pranitha subhash'),
(36, 'amala paul'),
(37, 'shazahn padamsee'),
(38, 'allu arjun'),
(39, 'prabhas'),
(40, 'jr. n t r');

-- --------------------------------------------------------

--
-- Table structure for table `tag_alias`
--

CREATE TABLE IF NOT EXISTS `tag_alias` (
  `tag_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `tg_id` int(11) NOT NULL,
  `tg_alias` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tag_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=145 ;

--
-- Dumping data for table `tag_alias`
--

INSERT INTO `tag_alias` (`tag_alias_id`, `tg_id`, `tg_alias`) VALUES
(1, 1, 'chiru'),
(2, 1, 'chiranjeevi'),
(3, 1, 'megastar'),
(75, 17, 'sriya'),
(74, 17, 'shriya'),
(73, 16, 'trisha'),
(72, 15, 'anuska'),
(71, 15, 'anushka'),
(70, 14, 'samantha'),
(69, 14, 'samanta'),
(68, 13, 'jenelia'),
(67, 13, 'genelia'),
(66, 12, 'kajal'),
(65, 11, 'tammana'),
(64, 11, 'tammanna'),
(63, 11, 'tamanna'),
(28, 2, 'cherry'),
(29, 2, 'charan'),
(30, 2, 'mega'),
(31, 2, 'ramcharan'),
(32, 2, 'power'),
(143, 2, 'ram'),
(34, 3, 'nagarjuna'),
(35, 3, 'nag'),
(36, 3, 'king'),
(37, 3, 'akkineni'),
(38, 4, 'mahesh'),
(39, 4, 'prince'),
(40, 4, 'maheshbabu'),
(41, 4, 'super'),
(42, 4, 'superstar'),
(43, 1, 'supremehero'),
(44, 2, 'megapowerstar'),
(45, 5, 'pawan'),
(46, 5, 'pavan'),
(60, 3, 'kingnagarjuna'),
(49, 5, 'powerstar'),
(50, 5, 'power'),
(51, 5, 'pavankalyan'),
(52, 5, 'pawankalyan'),
(53, 5, 'kalyan'),
(62, 3, 'akkineninagarjuna'),
(61, 3, 'kingnag'),
(59, 2, 'megapower'),
(76, 18, 'jyothika'),
(77, 18, 'jyotika'),
(78, 18, 'jotika'),
(79, 18, 'jothika'),
(80, 19, 'namrata'),
(81, 19, 'namratha'),
(82, 20, 'simran'),
(83, 21, 'suhasini'),
(84, 22, 'neha'),
(85, 22, 'nehasharma'),
(86, 22, 'nehasarma'),
(87, 23, 'shruthi'),
(88, 23, 'shruti'),
(89, 23, 'shruthihassan'),
(90, 23, 'shrutihassan'),
(91, 24, 'sonali'),
(92, 24, 'sonalibendre'),
(93, 24, 'bindre'),
(94, 24, 'bendre'),
(95, 25, 'charmy'),
(96, 25, 'charmi'),
(97, 25, 'charmme'),
(98, 26, 'tabu'),
(99, 27, 'sneha'),
(100, 28, 'mamta'),
(101, 28, 'mamata'),
(102, 28, 'mamtamohandas'),
(103, 28, 'mamatamohandas'),
(104, 28, 'mamatha'),
(105, 28, 'mamtha'),
(106, 29, 'anjali'),
(107, 30, 'bhumika'),
(108, 30, 'bhoomika'),
(109, 30, 'bhumikachawla'),
(110, 31, 'keerthi'),
(111, 31, 'keerti'),
(112, 31, 'keerthy'),
(113, 31, 'keerty'),
(114, 31, 'keerthireddy'),
(115, 31, 'keerthyreddy'),
(116, 32, 'ileana'),
(117, 32, 'illeana'),
(118, 32, 'iliana'),
(119, 32, 'illiana'),
(120, 33, 'parvati'),
(121, 33, 'parvathi'),
(122, 33, 'parvatimelton'),
(123, 33, 'parvathimelton'),
(124, 33, 'milton'),
(125, 34, 'pranitha'),
(126, 34, 'pranita'),
(133, 38, 'allu'),
(128, 36, 'amalapaul'),
(129, 36, 'amala'),
(130, 37, 'shazahn'),
(131, 37, 'shazahnpadamsee'),
(132, 37, 'padamsee'),
(134, 38, 'alluarjun'),
(135, 38, 'stylishstar'),
(136, 38, 'stylish'),
(137, 39, 'prabhas'),
(138, 39, 'rebelstar'),
(139, 39, 'rebel'),
(140, 40, 'jrntr'),
(141, 40, 'ntr'),
(142, 40, 'nandamuri'),
(144, 38, 'bunny');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `vid_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_id` int(11) NOT NULL,
  `vid_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `vid_yt_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`vid_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`vid_id`, `ct_id`, `vid_name`, `vid_yt_id`) VALUES
(1, 1, 'tagore', 'sDIQrNyPCzM'),
(2, 1, 'anji', 'fFfX0vmwYEk'),
(3, 1, 'stalin', 'Z9qoFMaDeSI'),
(4, 1, 'chantabbai', '5YZk90nYf1o'),
(5, 1, 'daddy', '9xPFUktKab8'),
(6, 1, 'racha', 'LWv6s-4Zn48'),
(7, 1, 'magadheera', 'plDUrJSUSbY'),
(8, 1, 'nayak', 'OVvzjvwdqkQ'),
(9, 1, 'chirutha', '_jvUsPiPJqM'),
(10, 1, 'orange', 'bigVOl6FrVQ'),
(11, 1, 'yevadu', 'fob0ZaRHapA'),
(12, 1, 'manmadhudu', 'mf7sk4IydGo'),
(13, 1, 'mass', 'stG0g3CuYgM'),
(14, 1, 'sisindri', 'YubHfXNKo9c'),
(15, 1, 'sri ramadasu', '_354QlFAZgA'),
(16, 1, 'king', 'GL8W1GPs7hE'),
(17, 1, 'sainikudu', 'i8jqyH8SsR4'),
(18, 1, 'seethamma vakitlo sirimalle chettu', 'CVCxbun_4Eo'),
(19, 1, 'athadu', '2qUOmRFOzQ8'),
(20, 1, 'businessman', 'qFoUEVGfmO4'),
(21, 1, 'okkadu', 'wWtu9o-IENY'),
(22, 1, 'tholi prema', 'CbklMuDh7i0'),
(23, 1, 'jalsa', '2Dae29huYSM'),
(24, 1, 'gabbar singh', 'E3aAkRpiErI'),
(25, 1, 'khushi', '9ARiy0nzfF0'),
(26, 1, 'attarintiki daredi', 'p9xrgKSt82o'),
(27, 2, 'govindudu andari vadele', '-dy0nIj-OPY'),
(28, 2, 'attarintiki daredi', 'uIDx3eUZ-vw'),
(29, 2, 'aagadu', 'MntBRK8GNag'),
(30, 2, 'manam', 'Y4Bq4SQc_eM'),
(31, 4, 'yevadu', 'lKbZ8ITkww8'),
(32, 4, 'aagadu', 's_A7tiCV_XQ'),
(33, 4, 'manam', 'uCHGnpp_sGE'),
(34, 4, 'attarintiki daredi', 'IeyJLb9Z0As'),
(35, 4, 'shankar dada zindabad', 'TekdTkOu2-8'),
(36, 3, 'jabardasth', 'SimdUk_47co');

-- --------------------------------------------------------

--
-- Table structure for table `vid_alias`
--

CREATE TABLE IF NOT EXISTS `vid_alias` (
  `vid_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `vd_id` int(11) NOT NULL,
  `vd_alias` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`vid_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=182 ;

--
-- Dumping data for table `vid_alias`
--

INSERT INTO `vid_alias` (`vid_alias_id`, `vd_id`, `vd_alias`) VALUES
(1, 1, 'tagore'),
(2, 1, 'tagorefilm'),
(3, 1, 'tagoremovie'),
(4, 1, 'tagur'),
(5, 1, 'tagorefull'),
(6, 2, 'anji'),
(7, 2, 'anjifilm'),
(8, 2, 'anjimovie'),
(9, 2, 'anjifull'),
(10, 1, 'tagorefullmovie'),
(11, 2, 'anjifullmovie'),
(12, 3, 'stalin'),
(13, 3, 'stalinfull'),
(14, 3, 'stalinfilm'),
(15, 3, 'stalinmovie'),
(16, 3, 'stalinfullmovie'),
(17, 4, 'chantabbai'),
(18, 4, 'chantabbaifull'),
(19, 4, 'chantabbayi'),
(20, 4, 'chantabbaimovie'),
(21, 4, 'chantabbaifilm'),
(22, 5, 'daddy'),
(23, 5, 'daddymovie'),
(24, 5, 'daddyfilm'),
(25, 5, 'dady'),
(26, 5, 'daddyfull'),
(27, 6, 'racha'),
(28, 6, 'raccha'),
(29, 6, 'rachafilm'),
(30, 6, 'rachamovie'),
(31, 6, 'rachafull'),
(32, 7, 'magadheera'),
(33, 7, 'magadhira'),
(34, 7, 'magdheera'),
(35, 7, 'magadheerafull'),
(36, 7, 'magadheeramovie'),
(37, 8, 'nayak'),
(38, 8, 'naayak'),
(39, 8, 'nayakfull'),
(40, 8, 'nayakfilm'),
(41, 8, 'nayakmovie'),
(42, 9, 'chirutha'),
(43, 9, 'chiruta'),
(44, 9, 'chiruthafull'),
(45, 9, 'chiruthamovie'),
(46, 9, 'chiruthafilm'),
(47, 10, 'orange'),
(48, 10, 'orangefull'),
(49, 10, 'orangefilm'),
(50, 10, 'orangemovie'),
(51, 10, 'orangefullmovie'),
(52, 11, 'yevadu'),
(53, 11, 'evadu'),
(54, 11, 'yevadufull'),
(55, 11, 'yevadumovie'),
(56, 11, 'yevadufilm'),
(57, 12, 'manmadhudu'),
(58, 12, 'manmadudu'),
(59, 12, 'manmadhudufull'),
(60, 12, 'manmadhudufilm'),
(61, 12, 'manmadhudumovie'),
(62, 13, 'mass'),
(63, 13, 'massfullmovie'),
(64, 13, 'massfull'),
(65, 13, 'massfilm'),
(66, 13, 'massmovie'),
(67, 14, 'sisindri'),
(68, 14, 'sisindrifull'),
(69, 14, 'sisindrifilm'),
(70, 14, 'sisindrimovie'),
(71, 14, 'sisindrifullmovie'),
(72, 15, 'ramadasu'),
(73, 15, 'ramadas'),
(74, 15, 'ramdasu'),
(75, 15, 'ramdas'),
(76, 15, 'rama'),
(78, 15, 'ramadasumovie'),
(79, 16, 'king'),
(80, 16, 'kingfull'),
(81, 16, 'kingfilm'),
(82, 16, 'kingmovie'),
(83, 16, 'kingfullmovie'),
(84, 17, 'sainikudu'),
(85, 17, 'sainikud'),
(86, 17, 'sinikudu'),
(87, 17, 'sainikudumovie'),
(88, 17, 'sainikudufull'),
(89, 18, 'seethamma'),
(90, 18, 'seetamma'),
(91, 18, 'sithamma'),
(92, 18, 'sitamma'),
(93, 18, 'seethammavakitlo'),
(94, 18, 'sirimalle'),
(95, 18, 'sirimallechettu'),
(96, 18, 'chettu'),
(97, 19, 'athadu'),
(98, 19, 'atadu'),
(99, 19, 'athadufull'),
(100, 19, 'athadumovie'),
(101, 19, 'athadufilm'),
(102, 20, 'businessman'),
(103, 20, 'business'),
(104, 20, 'bisiness'),
(105, 20, 'bisinessman'),
(106, 20, 'manfull'),
(107, 21, 'okkadu'),
(108, 21, 'okadu'),
(109, 21, 'okkadufull'),
(110, 21, 'okkadufilm'),
(111, 21, 'okkadumovie'),
(112, 22, 'tholi'),
(113, 22, 'prema'),
(114, 22, 'tholiprema'),
(115, 22, 'toliprema'),
(116, 22, 'toli'),
(117, 23, 'jalsa'),
(118, 23, 'jalsafull'),
(119, 23, 'jalsafilm'),
(120, 23, 'jalsamovie'),
(121, 23, 'jalsafullmovie'),
(122, 24, 'gabbar'),
(123, 24, 'singh'),
(124, 24, 'gabbarsingh'),
(125, 24, 'gabbarsing'),
(126, 24, 'sing'),
(127, 24, 'gabar'),
(128, 25, 'khushi'),
(129, 25, 'kushi'),
(130, 25, 'khusi'),
(131, 25, 'khushifull'),
(132, 25, 'khushimovie'),
(133, 26, 'attarintiki'),
(134, 26, 'atharintiki'),
(135, 26, 'daredi'),
(136, 26, 'attarintikidaredi'),
(137, 26, 'atharintikidaredi'),
(138, 27, 'govindudu'),
(139, 27, 'andari'),
(140, 27, 'vadele'),
(141, 27, 'andarivadele'),
(142, 27, 'govinduduandarivadele'),
(143, 28, 'attarintiki'),
(144, 28, 'atharintiki'),
(145, 28, 'daredi'),
(146, 28, 'attarintikidaredi'),
(147, 28, 'atharintikidaredi'),
(148, 34, 'attarintiki'),
(149, 34, 'atharintiki'),
(150, 34, 'daredi'),
(151, 34, 'attarintikidaredi'),
(152, 34, 'atharintikidaredi'),
(153, 29, 'aagadu'),
(154, 29, 'agadu'),
(155, 29, 'aagadutrailer'),
(156, 29, 'aagaduteaser'),
(157, 29, 'aagadutheatrical'),
(158, 30, 'manam'),
(159, 30, 'manamtrailer'),
(160, 30, 'manamtheatrical'),
(161, 30, 'manamteaser'),
(162, 31, 'yevadu'),
(163, 31, 'evadu'),
(164, 31, 'yevadusongs'),
(165, 31, 'yevadujukebox'),
(166, 32, 'aagadu'),
(167, 32, 'agadu'),
(168, 32, 'aagadusongs'),
(169, 32, 'aagadujukebox'),
(170, 33, 'manam'),
(171, 33, 'manamsongs'),
(172, 33, 'manamjukebox'),
(173, 35, 'shankar'),
(174, 35, 'shankardada'),
(175, 35, 'jindabad'),
(176, 35, 'zindabad'),
(177, 35, 'shankardadazindabad'),
(178, 36, 'jabardasth'),
(179, 36, 'jabardast'),
(180, 36, 'comedyshow'),
(181, 36, 'jabardasthshow');

-- --------------------------------------------------------

--
-- Table structure for table `vid_gen_link`
--

CREATE TABLE IF NOT EXISTS `vid_gen_link` (
  `vid_gen_id` int(11) NOT NULL AUTO_INCREMENT,
  `vd_id` int(11) NOT NULL,
  `gn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vid_gen_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=47 ;

--
-- Dumping data for table `vid_gen_link`
--

INSERT INTO `vid_gen_link` (`vid_gen_id`, `vd_id`, `gn_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 2, 6),
(4, 3, 2),
(5, 4, 3),
(6, 5, 5),
(7, 6, 2),
(8, 6, 5),
(9, 7, 5),
(10, 7, 6),
(11, 8, 2),
(12, 9, 2),
(13, 9, 5),
(14, 10, 5),
(15, 11, 2),
(16, 11, 7),
(17, 12, 5),
(18, 13, 2),
(19, 13, 5),
(20, 14, 3),
(21, 15, 8),
(22, 16, 2),
(23, 16, 3),
(24, 17, 2),
(25, 17, 5),
(26, 18, 5),
(27, 18, 9),
(28, 15, 9),
(29, 19, 2),
(30, 19, 3),
(31, 19, 5),
(32, 19, 9),
(33, 20, 2),
(34, 20, 5),
(35, 21, 2),
(36, 21, 5),
(37, 22, 5),
(38, 23, 2),
(39, 23, 5),
(40, 24, 2),
(41, 24, 3),
(42, 25, 5),
(43, 26, 2),
(44, 26, 3),
(45, 26, 9),
(46, 36, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vid_tag_link`
--

CREATE TABLE IF NOT EXISTS `vid_tag_link` (
  `vid_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `vd_id` int(11) NOT NULL,
  `tg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vid_tag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=83 ;

--
-- Dumping data for table `vid_tag_link`
--

INSERT INTO `vid_tag_link` (`vid_tag_id`, `vd_id`, `tg_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2),
(11, 11, 2),
(12, 12, 3),
(13, 13, 3),
(14, 14, 3),
(15, 15, 3),
(16, 16, 3),
(17, 17, 4),
(18, 18, 4),
(19, 19, 4),
(20, 20, 4),
(21, 21, 4),
(22, 22, 5),
(23, 23, 5),
(24, 24, 5),
(25, 25, 5),
(26, 26, 5),
(27, 27, 2),
(28, 28, 5),
(29, 29, 4),
(30, 30, 3),
(31, 31, 2),
(32, 32, 4),
(33, 33, 3),
(34, 34, 5),
(35, 35, 1),
(36, 36, NULL),
(37, 1, 17),
(38, 1, 18),
(39, 2, 19),
(40, 3, 16),
(41, 4, 21),
(42, 5, 20),
(43, 6, 11),
(44, 7, 12),
(45, 8, 12),
(46, 8, 36),
(47, 9, 22),
(48, 10, 13),
(49, 10, 37),
(50, 11, 12),
(51, 11, 23),
(52, 12, 24),
(53, 13, 18),
(54, 13, 25),
(55, 14, 26),
(56, 15, 27),
(57, 16, 16),
(58, 17, 16),
(59, 18, 29),
(60, 18, 14),
(61, 19, 16),
(62, 20, 12),
(63, 21, 30),
(64, 22, 31),
(65, 23, 32),
(66, 23, 33),
(67, 16, 28),
(68, 24, 23),
(69, 25, 30),
(70, 26, 14),
(71, 26, 34),
(72, 27, 2),
(73, 27, 12),
(74, 28, 5),
(75, 28, 14),
(76, 28, 34),
(77, 29, 4),
(78, 29, 11),
(79, 30, 3),
(80, 30, 14),
(81, 30, 17),
(82, 11, 38);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
