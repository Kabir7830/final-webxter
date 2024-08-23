-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 23, 2024 at 12:51 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cloudmagika_webxter`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_companyuser'),
(22, 'Can change user', 6, 'change_companyuser'),
(23, 'Can delete user', 6, 'delete_companyuser'),
(24, 'Can view user', 6, 'view_companyuser'),
(25, 'Can add carousel images', 7, 'add_carouselimages'),
(26, 'Can change carousel images', 7, 'change_carouselimages'),
(27, 'Can delete carousel images', 7, 'delete_carouselimages'),
(28, 'Can view carousel images', 7, 'view_carouselimages'),
(29, 'Can add coaching', 8, 'add_coaching'),
(30, 'Can change coaching', 8, 'change_coaching'),
(31, 'Can delete coaching', 8, 'delete_coaching'),
(32, 'Can view coaching', 8, 'view_coaching'),
(33, 'Can add company info', 9, 'add_companyinfo'),
(34, 'Can change company info', 9, 'change_companyinfo'),
(35, 'Can delete company info', 9, 'delete_companyinfo'),
(36, 'Can view company info', 9, 'view_companyinfo'),
(37, 'Can add courses', 10, 'add_courses'),
(38, 'Can change courses', 10, 'change_courses'),
(39, 'Can delete courses', 10, 'delete_courses'),
(40, 'Can view courses', 10, 'view_courses'),
(41, 'Can add request call back', 11, 'add_requestcallback'),
(42, 'Can change request call back', 11, 'change_requestcallback'),
(43, 'Can delete request call back', 11, 'delete_requestcallback'),
(44, 'Can view request call back', 11, 'view_requestcallback'),
(45, 'Can add notes', 12, 'add_notes'),
(46, 'Can change notes', 12, 'change_notes'),
(47, 'Can delete notes', 12, 'delete_notes'),
(48, 'Can view notes', 12, 'view_notes'),
(49, 'Can add enrolled students', 13, 'add_enrolledstudents'),
(50, 'Can change enrolled students', 13, 'change_enrolledstudents'),
(51, 'Can delete enrolled students', 13, 'delete_enrolledstudents'),
(52, 'Can view enrolled students', 13, 'view_enrolledstudents'),
(53, 'Can add certificate_ids', 14, 'add_certificate_ids'),
(54, 'Can change certificate_ids', 14, 'change_certificate_ids'),
(55, 'Can delete certificate_ids', 14, 'delete_certificate_ids'),
(56, 'Can view certificate_ids', 14, 'view_certificate_ids'),
(57, 'Can add blogs', 15, 'add_blogs'),
(58, 'Can change blogs', 15, 'change_blogs'),
(59, 'Can delete blogs', 15, 'delete_blogs'),
(60, 'Can view blogs', 15, 'view_blogs'),
(61, 'Can add user otp', 16, 'add_userotp'),
(62, 'Can change user otp', 16, 'change_userotp'),
(63, 'Can delete user otp', 16, 'delete_userotp'),
(64, 'Can view user otp', 16, 'view_userotp'),
(65, 'Can add Company', 17, 'add_company'),
(66, 'Can change Company', 17, 'change_company'),
(67, 'Can delete Company', 17, 'delete_company'),
(68, 'Can view Company', 17, 'view_company'),
(69, 'Can add course categories', 18, 'add_coursecategories'),
(70, 'Can change course categories', 18, 'change_coursecategories'),
(71, 'Can delete course categories', 18, 'delete_coursecategories'),
(72, 'Can view course categories', 18, 'view_coursecategories'),
(73, 'Can add demo class registration', 19, 'add_democlassregistration'),
(74, 'Can change demo class registration', 19, 'change_democlassregistration'),
(75, 'Can delete demo class registration', 19, 'delete_democlassregistration'),
(76, 'Can view demo class registration', 19, 'view_democlassregistration'),
(77, 'Can add batches', 20, 'add_batches'),
(78, 'Can change batches', 20, 'change_batches'),
(79, 'Can delete batches', 20, 'delete_batches'),
(80, 'Can view batches', 20, 'view_batches'),
(81, 'Can add time slots', 21, 'add_timeslots'),
(82, 'Can change time slots', 21, 'change_timeslots'),
(83, 'Can delete time slots', 21, 'delete_timeslots'),
(84, 'Can view time slots', 21, 'view_timeslots'),
(85, 'Can add student id', 22, 'add_studentid'),
(86, 'Can change student id', 22, 'change_studentid'),
(87, 'Can delete student id', 22, 'delete_studentid'),
(88, 'Can view student id', 22, 'view_studentid'),
(89, 'Can add registeration form', 23, 'add_registerationform'),
(90, 'Can change registeration form', 23, 'change_registerationform'),
(91, 'Can delete registeration form', 23, 'delete_registerationform'),
(92, 'Can view registeration form', 23, 'view_registerationform');

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

DROP TABLE IF EXISTS `batches`;
CREATE TABLE IF NOT EXISTS `batches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `duration` date NOT NULL,
  `is_expired` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(60) NOT NULL,
  `blog_content` longtext NOT NULL,
  `written_on` varchar(60) DEFAULT NULL,
  `edited_on` varchar(60) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `user_id_id` bigint(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `blogs_user_id_id_88691ead` (`user_id_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `blog_title`, `blog_content`, `written_on`, `edited_on`, `is_published`, `user_id_id`, `slug`) VALUES
(1, 'What is the use of Python', '<p><span>Python is a versatile and powerful programming language renowned for its simplicity and readability. Its areas of application span widely, from web development and data analysis to artificial intelligence and scientific computing. Python\'s extensive libraries and frameworks, such as Django and NumPy, streamline development processes, making it an ideal choice for both beginners and experienced developers. Its clear syntax and dynamic typing enable rapid prototyping and efficient coding, while its cross-platform compatibility ensures seamless deployment across different operating systems. Moreover, Python\'s vibrant community continuously contributes to its growth, ensuring an abundance of resources, tutorials, and support for users at all levels. In essence, Python\'s utility lies in its ability to empower developers to tackle diverse challenges and create innovative solutions across various domains.</span></p>', '10/4/2024', '', 1, 10, 'what-is-the-use-of-python');

-- --------------------------------------------------------

--
-- Table structure for table `carousel_images`
--

DROP TABLE IF EXISTS `carousel_images`;
CREATE TABLE IF NOT EXISTS `carousel_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carousel_image` varchar(100) NOT NULL,
  `carousel_title` varchar(100) DEFAULT NULL,
  `carousel_description` varchar(300) DEFAULT NULL,
  `carousel_redirect_link` longtext NOT NULL,
  `is_mobile` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carousel_images`
--

INSERT INTO `carousel_images` (`id`, `carousel_image`, `carousel_title`, `carousel_description`, `carousel_redirect_link`, `is_mobile`) VALUES
(1, 'carousel_images/web_development_banner_Mesa_de_trabajo_1.png', 'web dev', 'None', '<p>#</p>', 0),
(2, 'carousel_images/Graphic_Design_Training_Banner-01-01.png', 'Graphic', 'None', '#', 0),
(4, 'carousel_images/3D_Artist_Banner_Mesa_de_trabajo_1_Mesa_de_trabajo_1.png', '3D', '', '#', 0),
(5, 'carousel_images/web_development_banner_mobile-02.png', 'Mobile Banner', 'None', '#', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certificate_ids`
--

DROP TABLE IF EXISTS `certificate_ids`;
CREATE TABLE IF NOT EXISTS `certificate_ids` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `certificate_number` varchar(40) NOT NULL,
  `student_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificate_number` (`certificate_number`),
  UNIQUE KEY `student_id_id` (`student_id_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `certificate_ids`
--

INSERT INTO `certificate_ids` (`id`, `certificate_number`, `student_id_id`) VALUES
(1, '#45643', 1);

-- --------------------------------------------------------

--
-- Table structure for table `coaching`
--

DROP TABLE IF EXISTS `coaching`;
CREATE TABLE IF NOT EXISTS `coaching` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `classes` varchar(600) NOT NULL,
  `mode` varchar(20) NOT NULL,
  `timings` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `short_description` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `syllabus` varchar(100) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coaching_slug_56c57235_uniq` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coaching`
--

INSERT INTO `coaching` (`id`, `subject`, `classes`, `mode`, `timings`, `description`, `short_description`, `image`, `syllabus`, `is_published`, `slug`) VALUES
(1, 'Maths', '5th - 10th', 'offline', 'Flexiable', '<p>Unlock logic, precision, and problem-solving with our engaging mathematics courses. Prepare for academic success and STEM careers with our expert instructors. Join us to explore the universal language</p>\r\n<p>Mathematics is the universal language of logic, problem-solving, and precision. At our institute, we offer a comprehensive mathematics program that empowers students with the skills and knowledge needed to excel in this vital subject.</p>\r\n<p>Our math courses cover a wide range of topics, from foundational concepts to advanced calculus and statistics. Our experienced instructors use innovative teaching methods and real-world applications to make math engaging and accessible to all learners.</p>\r\n<p>Whether you\'re a student looking to strengthen your mathematical foundation or an aspiring mathematician aiming for advanced studies, our courses are tailored to meet your needs. We foster critical thinking, creativity, and analytical abilities, preparing our students not only for academic success but also for a future where math plays a pivotal role in various careers, including science, technology, engineering, and finance.</p>\r\n<p>Join us on a journey to unlock the power of mathematics and discover how it shapes the world around us.</p>\r\n<p>Classes</p>\r\n<table border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Classes</td>\r\n</tr>\r\n<tr>\r\n<td>6th - 10th</td>\r\n</tr>\r\n<tr>\r\n<td>BCA</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p></p>\r\n<table border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Available Modes</td>\r\n</tr>\r\n<tr>\r\n<td>Offline</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Unlock logic, precision, and problem-solving with our engaging mathematics courses. Prepare for academic success and STEM careers with our expert instructors. Join us to explore the universal language', 'coaching_thumbnails/maths2.jpg', '', 1, 'maths'),
(2, 'English', '5th - +2, Graduation', 'offline', 'Flexiable', '<p>Explore language, literature, and communication. Prepare for careers in writing, communication, and more. Join us to unleash the power of English.</p>\r\n<p>Our English program is a journey through the intricate world of language, literature, and communication. Whether you\'re an aspiring writer, a future communicator, or simply looking to strengthen your language skills, our comprehensive courses are designed to empower you.</p>\r\n<p>Our experienced instructors will guide you through grammar essentials, advanced writing techniques, literary analysis, and effective communication strategies. You\'ll delve into the realms of classic and contemporary literature, exploring the beauty and depth of human expression through words.</p>\r\n<p>In an increasingly interconnected world, proficiency in English is not just an asset but a necessity. Our courses not only prepare you for academic excellence but also for diverse careers in writing, journalism, public relations, marketing, teaching, and more.</p>\r\n<p>Immerse yourself in the power of language, harness the art of effective communication, and open doors to a world of opportunities. Join us on this educational odyssey where the English language becomes your key to success and self-expression.</p>', 'Explore language, literature, and communication. Prepare for careers in writing, communication, and more. Join us to unleash the power of English.', 'coaching_thumbnails/DaleEnglish.png', '', 1, 'english'),
(3, 'Science', '5th - 10th', 'offline', 'Flexiable', '<p>Science is the gateway to understanding the natural world and unlocking its mysteries. Our science program is designed to ignite curiosity, nurture critical thinking, and cultivate a deep appreciation for the wonders of the universe.</p>\r\n<p>Through a blend of theory and hands-on experimentation, students explore various scientific disciplines, from biology and chemistry to physics and environmental science. Our expert instructors foster a dynamic learning environment where students engage with scientific principles and real-world applications.</p>\r\n<p>As science is the foundation of technological advancements and innovations, our courses not only prepare students for academic success but also for careers in research, healthcare, engineering, and beyond. Whether you aspire to unravel the complexities of life or contribute to solving global challenges, our science program equips you with the knowledge and skills needed to make a difference.</p>\r\n<p>Join us on a journey of discovery, where you\'ll uncover the fascinating intricacies of the natural world and become a part of the scientific community driving progress and innovation. Embrace the future with a strong foundation in science.</p>', 'Explore the wonders of science - from biology to physics. Unlock knowledge and shape the future. Join us in the pursuit of discovery', 'coaching_thumbnails/30969-7-science.png', '', 1, 'science'),
(4, 'IT', '5th - +2, Graduation', 'both', 'Flexiable', '<p>In today\'s digital age, information technology is the backbone of virtually every industry. Our comprehensive IT program empowers students with the skills and knowledge to thrive in this ever-evolving field.</p>\r\n<p>Our courses cover a wide spectrum of IT topics, from fundamental concepts to advanced technologies. Students gain hands-on experience in areas such as computer hardware, software development, network administration, cybersecurity, and data analysis. Our expert instructors ensure that students not only grasp theoretical knowledge but also apply it to real-world scenarios.</p>\r\n<p>In a world driven by technology, IT professionals are in high demand. Our program not only prepares students for a successful career in IT but also equips them to innovate and lead in a rapidly changing landscape. Whether you aspire to become a software developer, network engineer, data scientist, or IT manager, our program provides a solid foundation and opportunities for specialization.</p>\r\n<p>Join us on a journey of exploration and innovation in the dynamic realm of IT. Unleash your potential, and become a part of the digital transformation that is shaping the future of business, healthcare, finance, and beyond. Choose IT and choose limitless possibilities.</p>', '\"Master IT essentials, coding, and tech innovation. Launch your tech career with us! #InformationTechnology', 'coaching_thumbnails/Information-Technology-PNG-Pic.png', '', 1, 'it'),
(5, 'Digital Electronics', 'Graduation', 'offline', 'Flexiable', '<p>In the modern age, digital electronics form the foundation of countless technological marvels that enhance our lives. Our comprehensive digital electronics program is designed to equip students with the knowledge and skills necessary to navigate and contribute to this transformative field.</p>\r\n<p>Our courses cover a broad range of digital electronics concepts, from basic principles to advanced applications. Students delve into topics such as logic gates, binary systems, microcontrollers, digital circuit design, and embedded systems. Hands-on experiences and practical projects ensure that students not only grasp theoretical knowledge but also develop the ability to design, troubleshoot, and innovate.</p>\r\n<p>As technology continues to advance, digital electronics professionals are in high demand across industries like telecommunications, robotics, automation, and consumer electronics. Our program not only prepares students for successful careers but also fosters the creativity and adaptability needed to stay ahead in this rapidly evolving field.</p>\r\n<p>Embark on a journey of exploration and innovation in the dynamic realm of digital electronics. Discover how this discipline shapes our interconnected world and learn how you can be part of the innovation driving it forward. Choose digital electronics and open the door to limitless possibilities in the digital age.</p>', 'Dive into digital electronics! Learn circuits, coding, and innovation. Shape the future with iDigital Electronics', 'coaching_thumbnails/Electronic-PNG-File-Download-Free.png', '', 1, 'digital-electronics');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(14) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `favicon` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `currency_symbol` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `description`, `email`, `phone_number`, `logo`, `favicon`, `address`, `currency_symbol`) VALUES
(1, 'Webxter', 'Unlock the world of web development at Webxter! Learn HTML and master the building blocks of the internet. Our institute offers expert-led classes in Django, CSS, Python, React JS, C/C+, Java, and Graphic Designing. From 6th-grade basics to advanced graduation-level programming, Webxter is your gateway to a comprehensive tech education.', 'info@webxter.in', '7355017830', 'logo/webxter_logo_no_bg_NENaBWN.png', 'favicon/webxter_logo_no_bg_FjIYcXa.jpg', '218 Diamond Block, Imperial City, Loharka Road, Amritsar, Punjab, India - 143001', '₹');

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

DROP TABLE IF EXISTS `company_info`;
CREATE TABLE IF NOT EXISTS `company_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_logo` varchar(100) DEFAULT NULL,
  `company_fav_icon` varchar(100) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `company_about_us` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`id`, `company_logo`, `company_fav_icon`, `company_name`, `company_about_us`) VALUES
(1, 'logos/webxter_logo_no_bg.png', 'fav_icons/webxter_logo_no_bg.png', 'Webxter', '<p style=\"text-align: justify;\"><span style=\"font-family: arial, helvetica, sans-serif; font-size: 12pt;\">At <strong>Webxter</strong>, we are committed to nurturing the minds of aspiring IT enthusiasts and empowering them with cutting-edge knowledge and skills. Our tuition center is dedicated to providing high-quality education and comprehensive training in various IT domains, catering to students from 6th to 10th grade. Additionally, we offer specialized courses in programming languages and web development, equipping learners with the tools they need to excel in the ever-evolving digital landscape.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-family: arial, helvetica, sans-serif; font-size: 12pt;\">At Webxter, we believe in the transformative power of education and technology. Our mission is to empower aspiring IT enthusiasts and learners of all ages to unlock their full potential and embrace the limitless opportunities that the digital world offers. With a passion for teaching and a commitment to excellence, we strive to shape the minds of the future, equipping them with the skills and knowledge they need to thrive in an ever-evolving technological landscape. Join us on this exciting journey of discovery, innovation, and growth, as we together pave the way for a brighter and more connected tomorrow.</span></p>');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(300) NOT NULL,
  `course_short_description` varchar(350) NOT NULL,
  `course_image` varchar(100) NOT NULL,
  `course_syllabus` varchar(100) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `tags` longtext NOT NULL,
  `benefits` longtext NOT NULL,
  `curriculum` longtext NOT NULL,
  `details` longtext NOT NULL,
  `featured_image` varchar(100) NOT NULL,
  `overview` longtext NOT NULL,
  `summary` varchar(200) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `duration` int(11) NOT NULL,
  `number_of_projects` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_name` (`course_name`),
  UNIQUE KEY `Courses_slug_50cd5cd5_uniq` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_short_description`, `course_image`, `course_syllabus`, `is_published`, `slug`, `tags`, `benefits`, `curriculum`, `details`, `featured_image`, `overview`, `summary`, `is_featured`, `is_new`, `duration`, `number_of_projects`) VALUES
(1, 'Python Programming: A Complete Guide', 'Are you eager to embark on your coding journey and learn one of the most versatile and beginner-friendly programming languages? Join our Python Programming Essentials course and dive into the exciting world of Python.', 'thumbnails/python.jpg', 'course_syllabus/pyrthon-language-syllabus.pdf', 1, 'python-programming-a-complete-guide', 'python, language', '<ul>\r\n	<li><strong>Versatility:</strong> Python is a multi-purpose language, useful in web development, data analysis, AI, machine learning, automation, and more.</li>\r\n	<li><strong>Easy to Learn:</strong> Python&rsquo;s simple syntax and readability make it an excellent choice for beginners.</li>\r\n	<li><strong>Large Community Support:</strong> A vast community means plenty of resources, libraries, and frameworks to assist with almost any project.</li>\r\n	<li><strong>High Demand in the Job Market:</strong> Python is widely used in many industries, leading to strong job prospects for Python developers.</li>\r\n	<li><strong>Integration Capabilities:</strong> Python can easily integrate with other languages like C, C++, Java, and more, making it a flexible tool in a developer&rsquo;s toolkit.</li>\r\n	<li><strong>Extensive Libraries and Frameworks:</strong> Python offers libraries like NumPy, Pandas, TensorFlow, and Django, which speed up development and reduce the need for writing code from scratch.</li>\r\n	<li><strong>Support for Automation:</strong> Python is great for automating repetitive tasks, such as web scraping, data entry, and batch file processing.</li>\r\n	<li><strong>Platform Independence: </strong>Python runs on various operating systems, including Windows, macOS, Linux, and others, allowing for cross-platform development.</li>\r\n	<li><strong>Strong Community and Corporate Support:</strong> Major tech companies like Google, Facebook, and Instagram use Python, ensuring ongoing development and stability.</li>\r\n	<li><strong>Open Source and Free:</strong> Python is open-source, meaning it&rsquo;s free to use, distribute, and modify, making it accessible to everyone.</li>\r\n</ul>', '<ul>\r\n	<li>Module 1: Introduction to Python</li>\r\n	<li>Module 2: Numbers, Strings, and Conversions</li>\r\n	<li>Module 3: Dates and String Formatting</li>\r\n	<li>Module 4: Input</li>\r\n	<li>Module 5: Operators</li>\r\n	<li>Module 6: Conditional Statements</li>\r\n	<li>Module 7: Loops (while and for)</li>\r\n	<li>Module 8: Lists</li>\r\n	<li>Module 9: Sets and Tuples</li>\r\n	<li>Module 10: Dictionaries</li>\r\n	<li>Module 11: Functions</li>\r\n	<li>Module 12: Modules</li>\r\n	<li>Module 13: Exception Handling</li>\r\n	<li>Module 14: File Handling</li>\r\n	<li>Module 15: Course Review</li>\r\n	<li>Module 16: Final Projects and Assignments</li>\r\n</ul>', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,</p>', 'featured_images/bg_image.png', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,</p>', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.', 1, 0, 18, 2),
(2, 'Django', 'Are you ready to take your Python skills to the next level and venture into the realm of web development? Join our Django Web Development course and discover the power of building dynamic and robust web applications using the Django framework.', 'thumbnails/django_TOaBRrs.png', 'course_syllabus/django-syllabus.pdf', 1, 'django', 'language, django, long term', '', '', '', '', '', '', 0, 1, 6, 1),
(3, 'Javascript', 'Are you ready to breathe life into your web pages and create engaging user experiences? Join our JavaScript Masterclass and discover the fascinating world of front-end web development.', 'thumbnails/js_0y7s07M.png', 'course_syllabus/JAVASCRIPT_SYLLABUS.pdf', 1, 'javascript', 'Language, script, client-side scripting, JS', '', '', '', '', '', '', 0, 1, 6, 1),
(4, 'React JS', 'Are you ready to dive into the world of modern front-end web development? Join our React.js Essentials course and unlock the power of building dynamic and interactive user interfaces.', 'thumbnails/reactjs.jpg', 'course_syllabus/react-js-syllabus.pdf', 1, 'react-js', '', '<ul>\r\n	<li><strong>ersatility:</strong>&nbsp;Python is a multi-purpose language, useful in web development, data analysis, AI, machine learning, automation, and more.</li>\r\n	<li><strong>Easy to Learn:</strong>&nbsp;Python&rsquo;s simple syntax and readability make it an excellent choice for beginners.</li>\r\n	<li><strong>Large Community Support:</strong>&nbsp;A vast community means plenty of resources, libraries, and frameworks to assist with almost any project.</li>\r\n	<li><strong>High Demand in the Job Market:</strong>&nbsp;Python is widely used in many industries, leading to strong job prospects for Python developers.</li>\r\n	<li><strong>Integration Capabilities:</strong>&nbsp;Python can easily integrate with other languages like C, C++, Java, and more, making it a flexible tool in a developer&rsquo;s toolkit.</li>\r\n	<li><strong>Extensive Libraries and Frameworks:</strong>&nbsp;Python offers libraries like NumPy, Pandas, TensorFlow, and Django, which speed up development and reduce the need for writing code from scratch.</li>\r\n	<li><strong>Support for Automation:</strong>&nbsp;Python is great for automating repetitive tasks, such as web scraping, data entry, and batch file processing.</li>\r\n	<li><strong>Platform Independence:&nbsp;</strong>Python runs on various operating systems, including Windows, macOS, Linux, and others, allowing for cross-platform development.</li>\r\n	<li><strong>Strong Community and Corporate Support:</strong>&nbsp;Major tech companies like Google, Facebook, and Instagram use Python, ensuring ongoing development and stability.</li>\r\n	<li><strong>Open Source and Free:</strong>&nbsp;Python is open-source, meaning it&rsquo;s free to use, distribute, and modify, making it accessible to everyone.</li>\r\n</ul>', '<ul>\r\n	<li>Module 1: Introduction to Python</li>\r\n	<li>Module 2: Numbers, Strings, and Conversions</li>\r\n	<li>Module 3: Dates and String Formatting</li>\r\n	<li>Module 4: Input</li>\r\n	<li>Module 5: Operators</li>\r\n	<li>Module 6: Conditional Statements</li>\r\n	<li>Module 7: Loops (while and for)</li>\r\n	<li>Module 8: Lists</li>\r\n	<li>Module 9: Sets and Tuples</li>\r\n	<li>Module 10: Dictionaries</li>\r\n	<li>Module 11: Functions</li>\r\n	<li>Module 12: Modules</li>\r\n	<li>Module 13: Exception Handling</li>\r\n	<li>Module 14: File Handling</li>\r\n	<li>Module 15: Course Review</li>\r\n	<li>Module 16: Final Projects and Assignments</li>\r\n</ul>', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,</p>', 'featured_images/reactjs.jpg', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc</p>', 'Are you eager to embark on your coding journey and learn one of the most versatile and beginner-friendly programming languages?', 1, 0, 6, 1),
(5, 'C', 'Are you eager to step into the world of programming and software development? Join our C Programming Fundamentals course and discover the foundational language that has shaped the modern computing landscape.', 'thumbnails/c_wkd1I9B.png', 'course_syllabus/c_basic_syllabus.pdf', 0, 'c', '', '', '', '', '', '', '', 0, 1, 6, 1),
(6, 'C++', 'Are you ready to take your programming skills to the next level? Join our C++ Programming Essentials course and discover the versatility and efficiency of one of the most popular and widely used programming languages.', 'thumbnails/C-Logo.wine_4U3rIDD.png', 'course_syllabus/c_basic_syllabus_HCPxs1T.pdf', 1, 'c-plus-plus', '', '', '', '', '', '', '', 0, 1, 6, 1),
(7, 'JAVA', 'Are you ready to become a proficient Java developer and unlock endless possibilities in software development? Join our Java Programming Masterclass and embark on a journey of creating versatile and scalable applications.', 'thumbnails/java_p4Gf9rQ.png', 'course_syllabus/Java_syllabus.pdf', 1, 'java', '', '', '', '', '', '', '', 1, 1, 6, 1),
(8, 'MySQL', 'Are you eager to dive into the world of databases and data management? Join our MySQL Database Fundamentals course and unlock the power of one of the most popular and widely used relational database management systems.', 'thumbnails/MySQL_logo_logotype_mWbiAYm.png', 'course_syllabus/MySQL_syllabus.pdf', 1, 'mysql', '', '', '', '', '', '', '', 0, 1, 6, 1),
(9, 'Computer Basic', 'Are you new to the world of computers or seeking to enhance your foundational knowledge? Join our Computer Basics course and embark on a journey to become proficient in navigating the digital landscape with confidence.', 'thumbnails/computer_AFAbkJw.jpg', 'course_syllabus/computer_basic_course_syllabus.pdf', 1, 'computer-basic', '', '', '', '', '', '', '', 0, 1, 6, 1),
(10, 'HTML & CSS', 'Are you fascinated by the art of web design? Join our HTML and CSS Fundamentals course to explore the building blocks of the web and unleash your creativity in crafting visually appealing and interactive websites.', 'thumbnails/html_EzI246K.png', 'course_syllabus/html_css_js_syllabus.pdf', 1, 'html-and-css', 'short_term, short term', '', '', '', '', '', '', 0, 1, 6, 1),
(11, 'Graphic Designing', 'Master Adobe Illustrator, Photoshop, and Autodesk Maya. Elevate your graphic design skills with expert guidance. Unlock creative potential and excel in design. Enroll today!', 'thumbnails/pngwing.com_3.png', 'course_syllabus/graphic_designing_syllabus.pdf', 1, 'graphic-designing', '', '', '', '', '', '', '', 0, 1, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses_category`
--

DROP TABLE IF EXISTS `courses_category`;
CREATE TABLE IF NOT EXISTS `courses_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `courses_id` bigint(20) NOT NULL,
  `coursecategories_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Courses_category_courses_id_coursecategories_id_75680f62_uniq` (`courses_id`,`coursecategories_id`),
  KEY `Courses_category_courses_id_48e630bf` (`courses_id`),
  KEY `Courses_category_coursecategories_id_e5f85e6e` (`coursecategories_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses_category`
--

INSERT INTO `courses_category` (`id`, `courses_id`, `coursecategories_id`) VALUES
(7, 2, 8),
(9, 1, 2),
(8, 1, 1),
(10, 2, 1),
(11, 3, 1),
(12, 3, 2),
(13, 4, 1),
(14, 4, 6),
(15, 5, 1),
(16, 5, 2),
(17, 6, 1),
(18, 6, 2),
(19, 7, 1),
(20, 7, 2),
(21, 8, 3),
(22, 9, 5),
(23, 10, 1),
(24, 10, 2),
(25, 10, 6),
(26, 11, 4),
(28, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

DROP TABLE IF EXISTS `course_categories`;
CREATE TABLE IF NOT EXISTS `course_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`id`, `name`, `image`, `is_featured`) VALUES
(1, 'Programming', 'category_thumbnails/default_image.jpg', 0),
(2, 'Language', 'category_thumbnails/default_image.jpg', 0),
(3, 'Database', 'category_thumbnails/database.webp', 1),
(4, 'Graphics', 'category_thumbnails/graphics.jpg', 1),
(5, 'Beginner', 'category_thumbnails/beginer.jpg', 1),
(6, 'Front End', 'default_image.jpg', 0),
(7, 'Back End', 'default_image.jpg', 0),
(8, 'Web Development', 'category_thumbnails/web-development.jpg', 1),
(9, '3D Artist', 'category_thumbnails/3D-image.jpeg', 1),
(10, 'AR/VR', 'category_thumbnails/ar-vr.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `demo_class_registeration`
--

DROP TABLE IF EXISTS `demo_class_registeration`;
CREATE TABLE IF NOT EXISTS `demo_class_registeration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `time_slot_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `alternate_number` varchar(15) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(100) NOT NULL,
  `date_slot` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `demo_class_registeration_course_id_d7cce3a0` (`course_id`),
  KEY `demo_class_registeration_time_slot_id_007c460e` (`time_slot_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'homepage', 'companyuser'),
(7, 'homepage', 'carouselimages'),
(8, 'homepage', 'coaching'),
(9, 'homepage', 'companyinfo'),
(10, 'homepage', 'courses'),
(11, 'homepage', 'requestcallback'),
(12, 'homepage', 'notes'),
(13, 'homepage', 'enrolledstudents'),
(14, 'homepage', 'certificate_ids'),
(15, 'homepage', 'blogs'),
(16, 'homepage', 'userotp'),
(17, 'homepage', 'company'),
(18, 'homepage', 'coursecategories'),
(19, 'homepage', 'democlassregistration'),
(20, 'homepage', 'batches'),
(21, 'homepage', 'timeslots'),
(22, 'homepage', 'studentid'),
(23, 'homepage', 'registerationform');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-09 10:04:27.768355'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-04-09 10:04:27.780834'),
(3, 'auth', '0001_initial', '2024-04-09 10:04:27.834272'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-04-09 10:04:27.841284'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-04-09 10:04:27.845283'),
(6, 'auth', '0004_alter_user_username_opts', '2024-04-09 10:04:27.848282'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-04-09 10:04:27.851283'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-04-09 10:04:27.852282'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-04-09 10:04:27.855306'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-04-09 10:04:27.858326'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-04-09 10:04:27.863325'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-04-09 10:04:27.871290'),
(13, 'auth', '0011_update_proxy_permissions', '2024-04-09 10:04:27.875289'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-04-09 10:04:27.878296'),
(15, 'homepage', '0001_initial', '2024-04-09 10:04:28.008755'),
(16, 'admin', '0001_initial', '2024-04-09 10:04:28.036802'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-04-09 10:04:28.043610'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-09 10:04:28.052285'),
(19, 'sessions', '0001_initial', '2024-04-09 10:04:28.062249'),
(20, 'homepage', '0002_companyuser_is_verified_userotp', '2024-04-09 11:30:18.532803'),
(21, 'homepage', '0003_alter_userotp_user', '2024-04-09 11:33:58.854828'),
(22, 'homepage', '0004_courses_slug', '2024-04-10 10:32:25.715675'),
(23, 'homepage', '0005_alter_courses_slug', '2024-04-10 10:35:17.732698'),
(24, 'homepage', '0006_coaching_slug', '2024-04-10 10:42:47.992507'),
(25, 'homepage', '0007_alter_coaching_slug', '2024-04-10 10:43:50.193988'),
(26, 'homepage', '0008_blogs_slug_notes_slug', '2024-04-10 11:05:14.671217'),
(27, 'homepage', '0009_company', '2024-04-15 05:47:41.691395'),
(28, 'homepage', '0010_enrolledstudents_is_read', '2024-07-26 07:32:26.575125'),
(29, 'homepage', '0011_carouselimages_carousel_redirect_link', '2024-07-26 10:16:18.306715'),
(30, 'homepage', '0012_carouselimages_is_mobile', '2024-07-27 05:23:39.185501'),
(31, 'homepage', '0013_courses_tags', '2024-07-27 05:55:11.833969'),
(32, 'homepage', '0014_coursecategories_courses_category', '2024-07-27 06:17:48.746753'),
(33, 'homepage', '0015_democlassregistration', '2024-08-07 06:01:00.398152'),
(34, 'homepage', '0016_batches_timeslots_and_more', '2024-08-07 06:01:00.505160'),
(35, 'homepage', '0017_rename_phone_number_democlassregistration_contact_number', '2024-08-07 06:01:00.515344'),
(36, 'homepage', '0018_rename_time_slot_timeslots_end_slot_and_more', '2024-08-07 06:01:00.536344'),
(37, 'homepage', '0019_democlassregistration_date_slot', '2024-08-07 06:01:00.552508'),
(38, 'homepage', '0020_alter_democlassregistration_date_slot', '2024-08-07 06:01:00.560509'),
(39, 'homepage', '0021_rename_emergency_conatct_relationship_registerationform_emergency_contact_relationship', '2024-08-07 06:01:00.571269'),
(40, 'homepage', '0022_rename_higest_education_qualification_registerationform_highest_education_qualification', '2024-08-07 06:01:00.581925'),
(41, 'homepage', '0023_remove_courses_course_description_courses_benefits_and_more', '2024-08-07 06:01:00.648160'),
(42, 'homepage', '0024_alter_courses_benefits_alter_courses_curriculum_and_more', '2024-08-07 06:01:00.663998'),
(43, 'homepage', '0025_alter_courses_course_syllabus_and_more', '2024-08-07 06:01:00.677531'),
(44, 'homepage', '0026_requestcallback_course', '2024-08-20 06:51:07.305251'),
(45, 'homepage', '0027_courses_is_featured_courses_is_new', '2024-08-23 06:32:26.000314'),
(46, 'homepage', '0028_coursecategories_image_coursecategories_is_featured', '2024-08-23 07:00:59.755947'),
(47, 'homepage', '0029_alter_coursecategories_image', '2024-08-23 07:01:44.872591'),
(48, 'homepage', '0030_courses_duration_courses_number_of_projects', '2024-08-23 11:50:48.974687');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('x1cz4bmk58yhk6o9up8m6gvjodgb7jia', '.eJxVjMEOgjAQRP-lZ9NshS3Uo3e_gex2txY1JaFwMv67kHDQ0yTz3szbDLQueVirzsMo5mIcmNNvyRSfWnYiDyr3ycapLPPIdlfsQau9TaKv6-H-HWSqeVs3wTGhT84JSwcRlcBL2LKH2DUcwGsbesfYpl7FN5g8KkhIeCZgNp8vDq84ZQ:1ruUHq:iO0hrs_AKplO1jJTvFGDCKmA4dpIiVjpJ0AFEChvUng', '2024-04-24 09:30:34.913480'),
('320981snw4xvnl2zyl8aklqq0kyxovaw', '.eJxVjMsOwiAQRf-FtSG8YVy69xvIwIBUDU1KuzL-uzbpQrf3nHNfLOK2triNssSJ2JlJdvrdEuZH6TugO_bbzPPc12VKfFf4QQe_zlSel8P9O2g42reuZLSwUquCPqBVwmgPoVZXQnXJabRAKThPlXwGEWQ2yYIBQKGyAc3eH9QAN2I:1ruay0:aU_t2P-K8H-bQjDx4RpTPtFKQB9JeIiVyFmXx0dUssY', '2024-04-24 16:38:32.975195'),
('r2chkyzsdcjbwmhyvs1myjqt50rtrv6a', '.eJxVjMsOwiAQRf-FtSG8YVy69xvIwIBUDU1KuzL-uzbpQrf3nHNfLOK2triNssSJ2JlJdvrdEuZH6TugO_bbzPPc12VKfFf4QQe_zlSel8P9O2g42reuZLSwUquCPqBVwmgPoVZXQnXJabRAKThPlXwGEWQ2yYIBQKGyAc3eH9QAN2I:1rwHZz:VTsM4Wtk4bl8SqxdvbDiVM4MgI_kksnLeg_whMjpt7M', '2024-04-29 08:20:43.436002'),
('0mlovnu2jzhml9bv8ndjylrc51ukr3vy', '.eJxVjMsOwiAQRf-FtSG8YVy69xvIwIBUDU1KuzL-uzbpQrf3nHNfLOK2triNssSJ2JlJdvrdEuZH6TugO_bbzPPc12VKfFf4QQe_zlSel8P9O2g42reuZLSwUquCPqBVwmgPoVZXQnXJabRAKThPlXwGEWQ2yYIBQKGyAc3eH9QAN2I:1sXFRZ:aCTqSKiw438NiQhRLKqXP1ozqJiH9BJPuXsORjLdWiE', '2024-08-09 07:32:49.757795'),
('8rw4x1c8id8n1t2kabrued4mt6g5mu01', '.eJxVjMsOwiAQRf-FtSG8YVy69xvIwIBUDU1KuzL-uzbpQrf3nHNfLOK2triNssSJ2JlJdvrdEuZH6TugO_bbzPPc12VKfFf4QQe_zlSel8P9O2g42reuZLSwUquCPqBVwmgPoVZXQnXJabRAKThPlXwGEWQ2yYIBQKGyAc3eH9QAN2I:1sXZue:aF4SWYwQxasE7A8jstcuWX1qOaHSsIX4zpwntVjUinw', '2024-08-10 05:24:12.229138'),
('lyj2zezwm3ucbav1dl31m1dlt6vvh208', '.eJxVjMsOwiAQRf-FtSG8YVy69xvIwIBUDU1KuzL-uzbpQrf3nHNfLOK2triNssSJ2JlJdvrdEuZH6TugO_bbzPPc12VKfFf4QQe_zlSel8P9O2g42reuZLSwUquCPqBVwmgPoVZXQnXJabRAKThPlXwGEWQ2yYIBQKGyAc3eH9QAN2I:1sXgAG:G_fM-WNyQkJLc6Y-FnmEvqeskBYr2cWnaXbOoLv2RIo', '2024-08-10 12:04:44.119007'),
('uns15r2kaygpgxj3gdk1l69xfj4juwqn', '.eJxVjMsOwiAQRf-FtSG8YVy69xvIwIBUDU1KuzL-uzbpQrf3nHNfLOK2triNssSJ2JlJdvrdEuZH6TugO_bbzPPc12VKfFf4QQe_zlSel8P9O2g42reuZLSwUquCPqBVwmgPoVZXQnXJabRAKThPlXwGEWQ2yYIBQKGyAc3eH9QAN2I:1sgHg3:qzadQUp-H6pArPDFRl7_HoFLBJuagYgQiX-dg_g9YSU', '2024-09-03 05:45:07.472899');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_students`
--

DROP TABLE IF EXISTS `enrolled_students`;
CREATE TABLE IF NOT EXISTS `enrolled_students` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enrolled_date` varchar(60) NOT NULL,
  `enrolled_time` varchar(60) NOT NULL,
  `course_id_id` bigint(20) NOT NULL,
  `student_id_id` bigint(20) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enrolled_students_course_id_id_aae6437a` (`course_id_id`),
  KEY `enrolled_students_student_id_id_53dc8458` (`student_id_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled_students`
--

INSERT INTO `enrolled_students` (`id`, `enrolled_date`, `enrolled_time`, `course_id_id`, `student_id_id`, `is_read`) VALUES
(1, '10 - 4 - 2024', '15 : 38', 3, 10, 1),
(2, '10 - 4 - 2024', '21 : 56', 2, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `homepage_companyuser`
--

DROP TABLE IF EXISTS `homepage_companyuser`;
CREATE TABLE IF NOT EXISTS `homepage_companyuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `security_question_1` longtext NOT NULL,
  `security_question_2` longtext NOT NULL,
  `security_question_1_answer` varchar(300) NOT NULL,
  `security_question_2_answer` varchar(300) NOT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `homepage_companyuser`
--

INSERT INTO `homepage_companyuser` (`id`, `password`, `last_login`, `is_superuser`, `is_staff`, `is_active`, `date_joined`, `email`, `first_name`, `last_name`, `date_of_birth`, `security_question_1`, `security_question_2`, `security_question_1_answer`, `security_question_2_answer`, `is_verified`) VALUES
(1, 'pbkdf2_sha256$390000$tNRNjBnDg1g56QZxPfwdq6$7egjKmrn6cCpKd7WOfMYmEAq3LnJa0LHmJ3NSWCUY4I=', '2024-08-20 05:45:07.472899', 1, 1, 1, '2024-04-09 10:06:53.872460', 'admin@webxter.in', 'admin', 'admin', NULL, '', '', '', '', 0),
(10, 'pbkdf2_sha256$390000$Qc010meWMAu1hR9XZPP2L7$qi5pI5mfKb/IbnpyP5bmXXFiSw24oCaTVUvhO2NP5PI=', '2024-04-10 09:30:34.911481', 1, 1, 1, '2024-04-10 09:30:22.047210', 'kabir.behal7830@gmail.com', 'kabir', 'behal', NULL, 'What was the name of your first pet?', 'What is your favorite movie?', 'dingo', 'harry potter', 0),
(13, 'pbkdf2_sha256$390000$yTDbSUo4F16igGveXsx9HX$T4F2qim5A/j4exkKssTFvRwmuf3v6no/lWKTUC9+N74=', '2024-04-10 16:26:04.688013', 0, 0, 1, '2024-04-10 16:25:31.994105', 'aman.behal25@gmail.com', 'Aman', 'Behal', NULL, 'What was the name of your first pet?', 'What is your favorite movie?', 'dingo', 'harry potter', 0);

-- --------------------------------------------------------

--
-- Table structure for table `homepage_companyuser_groups`
--

DROP TABLE IF EXISTS `homepage_companyuser_groups`;
CREATE TABLE IF NOT EXISTS `homepage_companyuser_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `homepage_companyuser_gro_companyuser_id_group_id_ab24ab9a_uniq` (`companyuser_id`,`group_id`),
  KEY `homepage_companyuser_groups_companyuser_id_317df2fc` (`companyuser_id`),
  KEY `homepage_companyuser_groups_group_id_19e30e89` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `homepage_companyuser_user_permissions`
--

DROP TABLE IF EXISTS `homepage_companyuser_user_permissions`;
CREATE TABLE IF NOT EXISTS `homepage_companyuser_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `homepage_companyuser_use_companyuser_id_permissio_cd7ada21_uniq` (`companyuser_id`,`permission_id`),
  KEY `homepage_companyuser_user_permissions_companyuser_id_64d3b722` (`companyuser_id`),
  KEY `homepage_companyuser_user_permissions_permission_id_96482856` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notes_title` varchar(60) NOT NULL,
  `notes` longtext NOT NULL,
  `written_on` varchar(60) NOT NULL,
  `edited_on` varchar(60) NOT NULL,
  `user_id_id` bigint(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `notes_user_id_id_55c81644` (`user_id_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `notes_title`, `notes`, `written_on`, `edited_on`, `user_id_id`, `slug`) VALUES
(1, 'New features', '<p>1) make sidebar navigation links to button</p>\r\n<p>2) add blogs and notes banner to homepage so that user should signup to use that feature</p>\r\n<p>3) Make ratings for blogs.</p>\r\n<p>4) Search available for notes and blogs and overallpage</p>', '16/9/2023', '3/10/2023', 1, 'new-features'),
(2, 'New Features - 2', '<p>1) make subjects also as cards and put detail of every subject in that llike show maths subject as card on the homepage and put some brief description and when someone open the maths subjects there it shows every detial of maths subject like which classes, timings etc etc.&nbsp;</p>\r\n<p>2) Add a serach bar to search subjects and courses</p>\r\n<p>3) Put syllabus with every course</p>\r\n<p>4) Remove about us section form homepage</p>', '3/10/2023', '3/10/2023', 1, 'new-features-2'),
(3, 'Homepage changes - 1', '<p>1) Make cards slider on mobile not like grid showing all in a row.</p>\r\n<p>2) Make syllabus section both read and download</p>\r\n<p></p>\r\n<p></p>\r\n<p></p>\r\n<p></p>\r\n<p></p>\r\n<p></p>\r\n<p></p>\r\n<p></p>\r\n<p></p>\r\n<p></p>\r\n<p></p>', '13/11/2023', '', 1, 'homepage-changes'),
(4, 'automated email code for python', '<p># Import the following module&nbsp;<br />from email.mime.text import MIMEText&nbsp;<br />from email.mime.image import MIMEImage&nbsp;<br />from email.mime.application import MIMEApplication&nbsp;<br />from email.mime.multipart import MIMEMultipart&nbsp;<br />import smtplib&nbsp;<br />import os&nbsp;</p>\r\n<p># initialize connection to our&nbsp;<br /># email server, we will use gmail here&nbsp;<br />smtp = smtplib.SMTP(\'smtp.gmail.com\', 587)&nbsp;<br />smtp.ehlo()&nbsp;<br />smtp.starttls()&nbsp;</p>\r\n<p># Login with your email and password&nbsp;<br />smtp.login(\'kabir.behal7830@gmail.com\', \'oowk vcgs jdyu bgqp\')&nbsp;</p>\r\n<p><br /># send our email message \'msg\' to our boss&nbsp;<br />def message(subject=\"Python Notification\",&nbsp;<br />&nbsp; &nbsp; &nbsp; text=\"test mail\", img=None,&nbsp;<br />&nbsp; &nbsp; &nbsp; attachment=None):&nbsp;</p>\r\n<p>&nbsp; # build message contents&nbsp;<br />&nbsp; msg = MIMEMultipart()&nbsp;</p>\r\n<p>&nbsp; # Add Subject&nbsp;<br />&nbsp; msg[\'Subject\'] = subject&nbsp;</p>\r\n<p>&nbsp; # Add text contents&nbsp;<br />&nbsp; msg.attach(MIMEText(text))&nbsp;</p>\r\n<p>&nbsp; # Check if we have anything&nbsp;<br />&nbsp; # given in the img parameter&nbsp;<br />&nbsp; if img is not None:&nbsp;</p>\r\n<p>&nbsp; &nbsp; # Check whether we have the lists of images or not!&nbsp;<br />&nbsp; &nbsp; if type(img) is not list:&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; # if it isn\'t a list, make it one&nbsp;<br />&nbsp; &nbsp; &nbsp; img = [img]&nbsp;</p>\r\n<p>&nbsp; &nbsp; # Now iterate through our list&nbsp;<br />&nbsp; &nbsp; for one_img in img:&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; # read the image binary data&nbsp;<br />&nbsp; &nbsp; &nbsp; img_data = open(one_img, \'rb\').read()&nbsp;<br />&nbsp; &nbsp; &nbsp; # Attach the image data to MIMEMultipart&nbsp;<br />&nbsp; &nbsp; &nbsp; # using MIMEImage, we add the given filename use os.basename&nbsp;<br />&nbsp; &nbsp; &nbsp; msg.attach(MIMEImage(img_data,&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name=os.path.basename(one_img)))&nbsp;</p>\r\n<p>&nbsp; # We do the same for&nbsp;<br />&nbsp; # attachments as we did for images&nbsp;<br />&nbsp; if attachment is not None:&nbsp;</p>\r\n<p>&nbsp; &nbsp; # Check whether we have the&nbsp;<br />&nbsp; &nbsp; # lists of attachments or not!&nbsp;<br />&nbsp; &nbsp; if type(attachment) is not list:&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; # if it isn\'t a list, make it one&nbsp;<br />&nbsp; &nbsp; &nbsp; attachment = [attachment]&nbsp;</p>\r\n<p>&nbsp; &nbsp; for one_attachment in attachment:&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; with open(one_attachment, \'rb\') as f:&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; # Read in the attachment&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; # using MIMEApplication&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; file = MIMEApplication(&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; f.read(),&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name=os.path.basename(one_attachment)&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; )&nbsp;<br />&nbsp; &nbsp; &nbsp; file[\'Content-Disposition\'] = f\'\'\'attachment;\\<br />&nbsp; &nbsp; &nbsp; filename=\"{os.path.basename(one_attachment)}\"\'\'\'&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; # At last, Add the attachment to our message object&nbsp;<br />&nbsp; &nbsp; &nbsp; msg.attach(file)&nbsp;<br />&nbsp; return msg&nbsp;</p>\r\n<p><br /># Call the message function&nbsp;<br />msg = message(\"Good!\", \"Hi there!\",)&nbsp;</p>\r\n<p># Make a list of emails, where you wanna send mail&nbsp;<br />to = [\"veerdharam0786@gmail.com\"]&nbsp;</p>\r\n<p># Provide some data to the sendmail function!&nbsp;<br />smtp.sendmail(from_addr=\"hello@gmail.com\",&nbsp;<br />&nbsp; &nbsp; &nbsp; to_addrs=to, msg=msg.as_string())&nbsp;</p>\r\n<p># Finally, don\'t forget to close the connection&nbsp;<br />smtp.quit()</p>', '22/11/2023', '', 1, 'automated-emails-for-python');

-- --------------------------------------------------------

--
-- Table structure for table `registeration_form`
--

DROP TABLE IF EXISTS `registeration_form`;
CREATE TABLE IF NOT EXISTS `registeration_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `alternate_number` varchar(15) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `highest_education_qualification` varchar(600) NOT NULL,
  `institute_name` varchar(600) NOT NULL,
  `privious_courses` longtext,
  `relevant_certifications` longtext,
  `is_returning_student` tinyint(1) NOT NULL,
  `webxter_student_id` varchar(20) DEFAULT NULL,
  `emergency_contact_name` varchar(255) NOT NULL,
  `emergency_contact_number` varchar(15) NOT NULL,
  `emergency_contact_relationship` varchar(500) NOT NULL,
  `batch_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registeration_form_batch_id_9f644513` (`batch_id`),
  KEY `registeration_form_course_id_f300be73` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request_call_back`
--

DROP TABLE IF EXISTS `request_call_back`;
CREATE TABLE IF NOT EXISTS `request_call_back` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `email` varchar(254) NOT NULL,
  `message` longtext NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL,
  `is_opened` tinyint(1) NOT NULL,
  `course` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_call_back`
--

INSERT INTO `request_call_back` (`id`, `name`, `email`, `message`, `phone_number`, `date`, `time`, `is_opened`, `course`) VALUES
(1, 'veer dharam', 'veerdharam0786@gmail.com', 'sfhsidhfsdhfdshfh hsidfbsu', '7355017830', '10-4-2024', '18:13', 1, ''),
(2, 'kabir behal', 'kabir.behal7830@gmail.com', '', '7355017830', '1-8-2024', '21:8', 0, ''),
(7, 'kabir behal', 'kabir.behal7830@gmail.com', 'Testing', '7355017830', '1-8-2024', '23:42', 0, ''),
(8, 'veer', 'veerdharam0786@gmail.com', 'Testing', '7355017830', '1-8-2024', '23:48', 0, ''),
(11, 'kabir behal', 'kabir.behal7830@gmail.com', 'sdasdasdasd', '07355017830', '20-8-2024', '12:54', 0, 'Python');

-- --------------------------------------------------------

--
-- Table structure for table `students_id`
--

DROP TABLE IF EXISTS `students_id`;
CREATE TABLE IF NOT EXISTS `students_id` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `webxter_student_id` int(11) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

DROP TABLE IF EXISTS `time_slots`;
CREATE TABLE IF NOT EXISTS `time_slots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_slot` time(6) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `is_for_demo` tinyint(1) NOT NULL,
  `start_slot` time(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_otp`
--

DROP TABLE IF EXISTS `user_otp`;
CREATE TABLE IF NOT EXISTS `user_otp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `otp` varchar(255) NOT NULL,
  `expiry` varchar(255) NOT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `user` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_otp`
--

INSERT INTO `user_otp` (`id`, `otp`, `expiry`, `is_verified`, `user`) VALUES
(10, '8749', '2024-04-10 15:04:34', 1, 'kabir.behal7830@gmail.com'),
(3, '7607', '2024-04-10 11:33:53', 0, 'admin@gmail.com'),
(4, '1376', '2024-04-10 12:29:13', 1, 'admin@webxter.in'),
(6, '4980', '2024-04-10 13:30:14', 0, 'this@gmail.com'),
(18, '8568', '2024-04-10 21:58:36', 1, 'aman.behal25@gmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
