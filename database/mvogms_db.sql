-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2022 at 01:58 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvogms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0,
  `fee` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_list`
--

INSERT INTO `cart_list` (`id`, `client_id`, `product_id`, `quantity`, `fee`) VALUES
(15, 1, 7, 6, 0),
(16, 1, 4, 11, 0),
(17, 1, 1, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(2, 2, 'Sample 101', 'This is a sample Category Only.', 1, 0, '2022-02-09 11:03:40', '2022-02-09 11:05:03'),
(3, 2, 'Sample 102', 'This is a sample Category 102', 1, 0, '2022-02-09 11:05:57', NULL),
(4, 2, 'Category 103', 'Sample Category 103', 1, 0, '2022-02-09 11:06:10', NULL),
(5, 2, 'test', 'test', 0, 1, '2022-02-09 11:06:17', '2022-02-09 11:06:20'),
(6, 1, 'Category 101', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut semper leo vitae dui rutrum ultricies. Etiam sit amet odio lorem. In sit amet cursus justo', 1, 0, '2022-02-09 11:09:36', NULL),
(7, 1, 'Category 102', 'Morbi pellentesque, dolor in sodales pretium, libero leo finibus arcu, vitae pharetra ligula quam quis enim. Quisque suscipit venenatis finibus.', 1, 0, '2022-02-09 11:09:45', NULL),
(8, 1, 'Category 103', 'Curabitur fermentum, diam ut dictum molestie, eros dolor luctus dolor, in hendrerit dui sapien vel lorem. Nulla ultrices gravida nisl, id feugiat turpis varius a. In iaculis lorem nisi. Aliquam nec aliquam ipsum, vitae fermentum dui.', 1, 0, '2022-02-09 11:10:19', NULL),
(9, 1, 'Category 104', 'Phasellus luctus ultricies dui, non euismod massa congue id. Fusce ut nisi convallis, aliquam dolor consectetur, varius enim. Phasellus dignissim, erat ac ullamcorper lacinia, nibh est auctor risus, eget ornare est felis et orci.', 1, 0, '2022-02-09 11:10:35', NULL),
(10, 4, 'Test', 'test', 1, 0, '2022-03-13 21:01:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 'John', 'D', 'Smith', 'Male', '09123456789', 'This is only my sample address', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'uploads/clients/1.png?v=1644386016', 1, 0, '2022-02-09 13:53:36', '2022-02-10 13:42:53'),
(2, '202202-00002', 'test', 'test', 'test', 'Male', '094564654', 'test', 'test@sample.com', 'asd12', 'uploads/clients/2.png?v=1644471867', 1, 1, '2022-02-10 13:44:26', '2022-03-13 18:17:40'),
(3, '202203-00001', 'test', 'asd', 'test', 'Male', '144445', 'tubs', 'testtest@test.com', 'bbba0cdac12dbd5917cc24cc90d4b23a', NULL, 1, 0, '2022-03-13 18:19:41', NULL),
(4, '202203-00002', 'asd12', 'asdasd', 'asdasjdha', 'Male', '1234556677', 'tubs', 'test@gmail.com', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, 0, '2022-03-13 18:24:36', NULL),
(5, '202203-00003', 'asd12', 'asdasd', 'asdasjdha', 'Male', '1234556677', 'tubs', 'test12@gmail.com', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, 0, '2022-03-13 18:25:18', NULL),
(6, '202203-00004', 'Mart', 'G', 'Golocino', 'Male', '1234556677', 'tubs', 'test123@gmail.com', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, 0, '2022-03-13 18:27:19', '2022-03-13 18:47:30'),
(7, '202203-00005', 'asd12', 'asdasd', 'asdasjdha', 'Male', '1234556677', 'tubs', 'test1234@gmail.com', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, 0, '2022-03-13 18:27:47', NULL),
(8, '202203-00006', 'test123', 'asd', 'asd', 'Male', '12345', 'tuburan', 'asd12355@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, 1, 0, '2022-03-14 13:23:04', NULL),
(9, '202203-00007', 'Joemari', 'test', 'test', 'Male', '123566', 'tuburan', 'joemari@test.com', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, 0, '2022-03-15 04:09:00', NULL),
(10, '202203-00008', 'Gleen', 'test', 'test', 'Male', '1234566', 'Tuburan', 'gleen@test.com', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, 0, '2022-03-15 04:13:54', NULL),
(11, '202203-00009', 'Gleen2', 'test', 'test', 'Male', '12345', 'Tuburan', 'gleen@test2.com', '21232f297a57a5a743894a0e4a801fc3', 'uploads/clients/11.png?v=1647289075', 1, 0, '2022-03-15 04:17:54', '2022-03-15 04:17:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(1, 1, 3, 1500, '2022-02-10 09:56:49'),
(2, 7, 10, 285.99, '2022-02-10 09:56:49'),
(3, 4, 5, 50, '2022-02-10 10:29:01'),
(3, 3, 5, 125, '2022-02-10 10:29:01'),
(3, 5, 3, 150, '2022-02-10 10:29:01'),
(4, 6, 3, 45.88, '2022-02-10 10:29:01'),
(4, 7, 3, 285.99, '2022-02-10 10:29:01'),
(5, 6, 4, 45.88, '2022-03-13 18:48:54'),
(6, 11, 2, 122, '2022-03-13 22:49:40'),
(7, 12, 4, 55, '2022-03-13 22:51:05'),
(8, 11, 2, 122, '2022-03-14 11:50:26'),
(9, 10, 4, 22, '2022-03-14 12:09:42'),
(10, 11, 4, 122, '2022-03-14 12:23:19'),
(11, 12, 2, 55, '2022-03-14 12:31:28'),
(12, 10, 5, 22, '2022-03-14 12:49:12'),
(13, 11, 3, 122, '2022-03-14 12:57:07'),
(14, 11, 11, 122, '2022-03-14 13:03:46'),
(15, 11, 3, 122, '2022-03-14 14:23:09'),
(16, 9, 3, 22, '2022-03-14 16:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `fee` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`, `fee`) VALUES
(1, '202202-00001', 1, 1, 4500, 'This is only my sample address', 5, '2022-02-10 09:56:49', '2022-02-10 11:52:53', 0),
(2, '202202-00002', 1, 2, 7359.9, 'This is only my sample address', 0, '2022-02-10 09:56:49', '2022-02-10 09:56:49', 0),
(3, '202202-00003', 1, 1, 1325, 'This is only my sample address', 1, '2022-02-10 10:29:00', '2022-02-10 12:09:59', 0),
(4, '202202-00004', 1, 2, 2320.61, 'This is only my sample address', 0, '2022-02-10 10:29:01', '2022-02-10 10:29:01', 0),
(5, '202203-00001', 6, 2, 183.52, 'tubs', 0, '2022-03-13 18:48:54', '2022-03-13 22:01:32', 50),
(6, '202203-00002', 6, 4, 244, 'Poblacion 1', 4, '2022-03-13 22:49:40', '2022-03-14 12:01:23', 0),
(7, '202203-00003', 6, 4, 220, 'Poblacion 1', 5, '2022-03-13 22:51:05', '2022-03-14 10:13:31', 0),
(8, '202203-00004', 6, 4, 244, 'Poblacion 1', 4, '2022-03-14 11:50:26', '2022-03-14 12:40:52', 0),
(9, '202203-00005', 6, 4, 88, 'Poblacion 1', 4, '2022-03-14 12:09:42', '2022-03-14 12:38:32', 0),
(10, '202203-00006', 6, 4, 488, 'Poblacion 1', 5, '2022-03-14 12:23:19', '2022-03-14 12:29:58', 0),
(11, '202203-00007', 6, 4, 110, 'Poblacion 1', 5, '2022-03-14 12:31:28', '2022-03-14 12:38:16', 0),
(12, '202203-00008', 6, 4, 110, 'Poblacion 1', 4, '2022-03-14 12:49:12', '2022-03-14 12:49:35', 0),
(13, '202203-00009', 6, 4, 366, 'Poblacion 1', 4, '2022-03-14 12:57:07', '2022-03-14 13:15:22', 0),
(14, '202203-00010', 6, 4, 1342, 'Poblacion 1', 4, '2022-03-14 13:03:46', '2022-03-14 14:22:38', 0),
(15, '202203-00011', 6, 4, 366, 'Poblacion 1', 4, '2022-03-14 14:23:09', '2022-03-14 14:23:50', 0),
(16, '202203-00012', 6, 4, 66, 'Poblacion 1', 4, '2022-03-14 16:11:34', '2022-03-14 16:12:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `quantity` int(255) NOT NULL,
  `fee` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`, `quantity`, `fee`) VALUES
(1, 1, 9, 'Product 101', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut semper leo vitae dui rutrum ultricies. Etiam sit amet odio lorem. In sit amet cursus justo. Morbi pellentesque, dolor in sodales pretium, libero leo finibus arcu, vitae pharetra ligula quam quis enim. Quisque suscipit venenatis finibus. Curabitur fermentum, diam ut dictum molestie, eros dolor luctus dolor, in hendrerit dui sapien vel lorem. Nulla ultrices gravida nisl, id feugiat turpis varius a. In iaculis lorem nisi. Aliquam nec aliquam ipsum, vitae fermentum dui.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Phasellus luctus ultricies dui, non euismod massa congue id. Fusce ut nisi convallis, aliquam dolor consectetur, varius enim. Phasellus dignissim, erat ac ullamcorper lacinia, nibh est auctor risus, eget ornare est felis et orci. Pellentesque aliquam, lectus sed porttitor consequat, sem orci fringilla nisi, a pellentesque metus tellus nec tellus. Nullam metus tortor, mattis in tristique et, tincidunt ac dui. Praesent id viverra diam, vel cursus nulla. Vestibulum ut lobortis velit, a euismod eros. Integer dignissim finibus rhoncus. Praesent non neque ac ipsum lobortis commodo sed ac massa. Mauris justo tortor, dapibus sit amet dui sed, congue vehicula urna.</p>', 1500, 'uploads/products/1.png?v=1644379549', 1, 0, '2022-02-09 12:05:49', '2022-03-14 10:19:34', 0, 50),
(2, 1, 9, 'Loaf Bread', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Nullam nisi metus, convallis quis consectetur vitae, laoreet ac nulla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin ligula augue, vestibulum in auctor pharetra, posuere id lacus. Aenean aliquam felis quis condimentum congue. Donec porttitor ultricies mi eget vestibulum. Nullam in magna tortor. Suspendisse ullamcorper ultricies accumsan. Duis ultrices sollicitudin velit sed auctor. Vivamus semper placerat porttitor. Praesent diam lorem, luctus sit amet viverra non, consequat ac elit. Suspendisse eleifend massa sit amet nisl porta, eu rutrum massa blandit. Integer congue lacus non fringilla suscipit.</span><br></p>', 85, 'uploads/products/2.png?v=1644382715', 1, 0, '2022-02-09 12:58:35', '2022-03-14 10:19:37', 0, 50),
(3, 1, 7, 'Canned Soda', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Aliquam erat volutpat. Fusce scelerisque pulvinar bibendum. Proin convallis elit at molestie egestas. Cras ornare ornare dolor quis mattis. Suspendisse in egestas odio. Fusce nibh ante, ultrices nec elit at, auctor elementum nunc. Curabitur facilisis mauris at congue maximus. Integer a facilisis nisl, sed laoreet odio. Nulla facilisi. Vivamus sed tincidunt eros, non convallis metus. Nullam vestibulum nisi at est euismod, et molestie ligula dapibus. Integer ligula felis, volutpat a accumsan id, egestas nec dolor. Duis dignissim condimentum lectus, eget pharetra ex laoreet vitae. Nam enim mauris, pharetra sit amet leo eget, condimentum lacinia neque.</span><br></p>', 125, 'uploads/products/3.png?v=1644382753', 1, 0, '2022-02-09 12:59:13', '2022-03-14 10:19:41', 0, 50),
(4, 1, 6, 'Canned Sardines', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Praesent id pretium neque. Nullam nec scelerisque quam. Donec faucibus erat enim, sit amet aliquet ipsum suscipit at. Suspendisse interdum euismod libero, eu tincidunt ligula elementum a. Nulla id velit vestibulum nisl scelerisque pretium sed at neque. In dignissim purus ut nibh rutrum, at placerat ex elementum. Nam eleifend, sapien ac luctus eleifend, orci purus pulvinar nisl, et scelerisque erat turpis ac tellus. Duis a libero sit amet massa posuere molestie.</span><br></p>', 50, 'uploads/products/4.png?v=1644382779', 1, 0, '2022-02-09 12:59:38', '2022-03-14 14:55:25', 0, 20),
(5, 1, 7, 'Dry 101', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Nam vel velit eget libero scelerisque varius. Morbi sodales consectetur eros sed lacinia. Phasellus lobortis, neque sed consequat commodo, felis elit tempor sapien, eu blandit ante ex eu magna. Maecenas pulvinar lectus sed augue pharetra porttitor et sed ligula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent mattis ante est, sed fringilla nisi posuere non.</span><br></p>', 150, 'uploads/products/5.png?v=1644382802', 1, 0, '2022-02-09 13:00:02', '2022-03-14 10:19:46', 0, 50),
(6, 2, 4, 'Bottled Juice', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Quisque commodo tincidunt rhoncus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas molestie lacus lacus. Pellentesque velit quam, cursus sit amet congue sed, facilisis et risus. Duis ac consequat eros, id venenatis tortor. Nulla vitae iaculis ante. Morbi id felis non ipsum facilisis sagittis. Integer sed quam et metus pretium tempor sit amet non neque. Praesent eu ante a mauris auctor tempor. Pellentesque luctus erat eget metus vulputate iaculis. Sed rhoncus malesuada ipsum, sed imperdiet leo consequat et. In eu mauris eu felis lacinia semper sit amet nec nisi. Aliquam convallis, neque eget dignissim aliquam, sem enim laoreet arcu, vitae maximus nisi nisl vitae tellus.</span><br></p>', 45.88, 'uploads/products/6.png?v=1644382977', 1, 0, '2022-02-09 13:02:57', '2022-03-14 10:19:48', 0, 50),
(7, 2, 2, 'Chicken Wings', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Quisque aliquet tellus sed nulla vulputate pharetra et nec mauris. Nulla placerat magna sed enim ullamcorper, ac tempor turpis varius. Sed in ipsum id odio varius pellentesque. In hac habitasse platea dictumst. Nunc eget nisi sed nisl pellentesque posuere. Nulla quis nibh nec neque ornare mollis sed vitae eros. Nulla nulla turpis, bibendum euismod purus sit amet, semper aliquam enim. Proin dignissim ac nisl in lobortis. Aenean at justo vel ipsum pretium dapibus. Aliquam lorem mi, laoreet eu leo ac, congue blandit orci. Sed vulputate suscipit nibh, at ultrices ipsum sagittis nec.</span><br></p>', 285.99, 'uploads/products/7.png?v=1644383066', 1, 0, '2022-02-09 13:04:25', '2022-03-14 10:19:51', 0, 50),
(8, 2, 4, 'Chicken Fillet Raw', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Ut viverra maximus orci et tincidunt. Aliquam erat volutpat. Morbi convallis nibh nec libero ultrices, id suscipit nisl facilisis. Maecenas sed consectetur leo, id tempus nisl. Maecenas tincidunt ultrices ex sed feugiat. Nunc sit amet arcu enim. Nunc tristique faucibus elit sed mollis. Cras commodo tincidunt porttitor.</span><br></p>', 195.75, 'uploads/products/8.png?v=1644383112', 1, 0, '2022-02-09 13:05:12', '2022-03-14 12:40:38', 0, 49),
(9, 4, 10, 'test', '&lt;p&gt;asd&lt;/p&gt;', 22, NULL, 1, 0, '2022-03-13 21:01:48', '2022-03-14 12:41:44', 3, 47),
(10, 4, 10, 'test12355', '&lt;p&gt;asd&lt;/p&gt;', 22, NULL, 1, 0, '2022-03-13 21:22:21', '2022-03-14 12:29:55', 10, 49),
(11, 4, 10, 'test2', '&lt;p&gt;asd&lt;/p&gt;', 122, NULL, 1, 0, '2022-03-13 21:32:12', '2022-03-14 16:43:16', 17, 47),
(12, 4, 10, 'item', '&lt;p&gt;&lt;b&gt;asd&lt;/b&gt;&lt;/p&gt;', 55, NULL, 1, 0, '2022-03-13 22:12:37', '2022-03-14 12:51:02', -1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Dry Goods', 1, 0, '2022-02-09 08:49:34', NULL),
(2, 'Cosmetics', 1, 0, '2022-02-09 08:49:46', NULL),
(3, 'Produce', 1, 0, '2022-02-09 08:50:31', NULL),
(4, 'Anyy', 1, 0, '2022-02-09 08:50:36', '2022-02-09 08:50:57'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'TubEmart'),
(6, 'short_name', 'TubEmart'),
(11, 'logo', 'uploads/cover_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2022-03-14 17:22:38'),
(11, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-11.png?v=1644472553', NULL, 2, '2022-02-10 13:55:52', '2022-02-10 13:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `fee` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`, `fee`) VALUES
(1, '202202-00001', 4, 'Shop101', 'Shop 101 Owner', '09123456788', 'shop101', 'bbba0cdac12dbd5917cc24cc90d4b23a', 'uploads/vendors/1.png?v=1644375053', 1, 0, '2022-02-09 10:50:53', '2022-03-14 10:20:25', 50),
(2, '202202-00002', 1, 'Shop102', 'John Miller', '09123456789', 'shop102', '90be022251077e3488c998613214df74', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2022-02-09 10:52:09', '2022-03-14 10:20:27', 50),
(3, '202202-00003', 2, 'test', 'test', '123123123', 'test', '123', 'uploads/vendors/3.png?v=1644471934', 1, 1, '2022-02-10 13:45:34', '2022-03-14 10:20:29', 50),
(4, '202203-00001', 2, 'test', 'test test', '91282821', 'vendor1', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, 0, '2022-03-13 20:49:37', '2022-03-13 22:48:03', 50),
(5, '202203-00002', 4, 'vendor2', 'vendor2 vendor', '123455', 'vendor2', '21232f297a57a5a743894a0e4a801fc3', 'uploads/vendors/5.png?v=1647290822', 1, 0, '2022-03-15 04:47:02', '2022-03-15 04:47:02', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
