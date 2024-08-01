-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 01, 2024 at 07:21 AM
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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

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
(72, 'Can view course categories', 18, 'view_coursecategories');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carousel_images`
--

INSERT INTO `carousel_images` (`id`, `carousel_image`, `carousel_title`, `carousel_description`, `carousel_redirect_link`, `is_mobile`) VALUES
(1, 'carousel_images/web_development_banner_Mesa_de_trabajo_1.png', 'web', 'None', '#', 0),
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
  `course_description` longtext NOT NULL,
  `course_short_description` varchar(350) NOT NULL,
  `course_image` varchar(100) NOT NULL,
  `course_syllabus` varchar(100) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `tags` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_name` (`course_name`),
  UNIQUE KEY `Courses_slug_50cd5cd5_uniq` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_description`, `course_short_description`, `course_image`, `course_syllabus`, `is_published`, `slug`, `tags`) VALUES
(1, 'Python', '<p>In this comprehensive Python Programming Course, we will take you from the fundamentals of coding to more advanced concepts, providing you with a strong foundation to build upon. Whether you are an absolute beginner with no prior coding experience or an intermediate learner seeking to enhance your skills, this course will meet you at your current level and guide you towards proficiency.</p>\r\n<p><strong>What You\'ll Learn:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Python Basics:</strong> We\'ll start from scratch, introducing you to the basic syntax, data types, and control structures of Python. You\'ll gain a solid understanding of how to write and run Python programs.</p>\r\n</li>\r\n<li>\r\n<p><strong>Data Manipulation:</strong> Learn to work with variables, lists, dictionaries, and other data structures to store and manipulate information efficiently.</p>\r\n</li>\r\n<li>\r\n<p><strong>Functions and Modules:</strong> Explore the world of functions and modules to organize your code and make it more reusable and maintainable.</p>\r\n</li>\r\n<li>\r\n<p><strong>Object-Oriented Programming (OOP):</strong> Delve into the principles of OOP, a crucial paradigm in modern programming, and discover how to create and utilize classes and objects.</p>\r\n</li>\r\n<li>\r\n<p><strong>File Handling:</strong> Learn to read from and write to files, enabling you to work with external data seamlessly.</p>\r\n</li>\r\n<li>\r\n<p><strong>Error Handling:</strong> Discover how to handle errors gracefully in your code, ensuring a smooth execution and better user experience.</p>\r\n</li>\r\n<li>\r\n<p><strong>Intermediate Concepts:</strong> Dive into more advanced topics such as working with APIs, web scraping, and data visualization using libraries like NumPy and Matplotlib.</p>\r\n</li>\r\n<li>\r\n<p><strong>Project Development:</strong> Apply your newly acquired knowledge to real-world projects, solidifying your skills and boosting your confidence as a Python programmer.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Why Choose Our Python Course:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Beginner-Friendly:</strong> No prior coding experience? No problem! Our course is crafted with beginners in mind, providing a gentle and supportive learning environment.</p>\r\n</li>\r\n<li>\r\n<p><strong>Experienced Instructors:</strong> Learn from industry-experienced instructors who are passionate about Python and committed to your success.</p>\r\n</li>\r\n<li>\r\n<p><strong>Practical Hands-On Learning:</strong> We emphasize hands-on practice and project-based learning to ensure you can apply your knowledge effectively.</p>\r\n</li>\r\n<li>\r\n<p><strong>Flexibility:</strong> Choose from flexible class schedules that fit your busy lifestyle, enabling you to learn at your own pace.</p>\r\n</li>\r\n<li>\r\n<p><strong>Career Opportunities:</strong> Python is in high demand across various industries, making this course an excellent stepping stone towards rewarding career opportunities.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Get Started Today:</strong></p>\r\n<p>Unleash your coding potential with our Python Programming Course! Whether you aspire to be a software developer, data analyst, or simply want to enhance your problem-solving abilities, Python is the perfect language to begin your journey. Join us now and embark on an enriching learning experience that will shape your future in the world of technology.</p>', 'Are you eager to embark on your coding journey and learn one of the most versatile and beginner-friendly programming languages? Join our Python Programming Essentials course and dive into the exciting world of Python.', 'thumbnails/Python-logo-notext.svg.png', 'course_syllabus/pyrthon-language-syllabus.pdf', 1, 'python-course', 'python, language'),
(2, 'Django', '<p>Our Django Web Development course is designed for aspiring developers who want to create modern web applications with ease. Django, a high-level Python web framework, enables rapid development while following the \"Don\'t Repeat Yourself\" (DRY) principle.</p>\r\n<p><strong>What You\'ll Learn:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Introduction to Django:</strong> Familiarize yourself with the fundamentals of Django, its architecture, and how it simplifies web development.</p>\r\n</li>\r\n<li>\r\n<p><strong>Creating Models:</strong> Learn to design database models and work with Django\'s Object-Relational Mapping (ORM) to interact with the database.</p>\r\n</li>\r\n<li>\r\n<p><strong>Views and Templates:</strong> Explore views, the logic behind web pages, and leverage templates to render dynamic content.</p>\r\n</li>\r\n<li>\r\n<p><strong>URL Routing:</strong> Understand URL configuration and mapping, ensuring smooth navigation within your Django applications.</p>\r\n</li>\r\n<li>\r\n<p><strong>Forms and Validation:</strong> Master form handling and validation to create user-friendly and secure data input mechanisms.</p>\r\n</li>\r\n<li>\r\n<p><strong>User Authentication and Authorization:</strong> Implement user registration, login, and permissions to secure your web applications.</p>\r\n</li>\r\n<li>\r\n<p><strong>Handling Media and Static Files:</strong> Manage media uploads and static files to deliver a seamless user experience.</p>\r\n</li>\r\n<li>\r\n<p><strong>Django REST Framework (DRF):</strong> Discover how to create RESTful APIs to enable interaction with your applications programmatically.</p>\r\n</li>\r\n<li>\r\n<p><strong>Deployment and Hosting:</strong> Learn the best practices for deploying Django applications to production servers and hosting platforms.</p>\r\n</li>\r\n<li>\r\n<p><strong>Project Development:</strong> Work on practical projects that simulate real-world scenarios, putting your Django skills into action.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Why Choose Our Django Web Development Course:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Comprehensive Learning:</strong> Our course covers all aspects of Django development, empowering you to create end-to-end web applications.</p>\r\n</li>\r\n<li>\r\n<p><strong>Experienced Instructors:</strong> Learn from seasoned Django developers who are passionate about sharing their expertise and industry insights.</p>\r\n</li>\r\n<li>\r\n<p><strong>Hands-On Projects:</strong> Dive into hands-on projects that allow you to apply your knowledge and build a remarkable portfolio.</p>\r\n</li>\r\n<li>\r\n<p><strong>Community Support:</strong> Join a community of Django enthusiasts, collaborate, and grow together.</p>\r\n</li>\r\n<li>\r\n<p><strong>Career Opportunities:</strong> Django\'s versatility and popularity make it a sought-after skill, opening doors to exciting job opportunities.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Enroll Now:</strong><span> Take the first step towards becoming a skilled Django web developer. Join our Django Web Development course and unleash your creativity in building powerful web applications that make an impact in the digital world.</span></p>', 'Are you ready to take your Python skills to the next level and venture into the realm of web development? Join our Django Web Development course and discover the power of building dynamic and robust web applications using the Django framework.', 'thumbnails/django_TOaBRrs.png', 'course_syllabus/django-syllabus.pdf', 1, 'django', 'language, django'),
(3, 'Javascript', '<p>Our JavaScript Masterclass is designed to cater to individuals with a basic understanding of HTML and CSS who want to take their web development skills to the next level. JavaScript is a versatile and essential programming language that empowers developers to add interactivity and dynamism to websites.</p>\r\n<p><strong>What You\'ll Learn:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>JavaScript Basics:</strong> Get started with the fundamentals of JavaScript, including variables, data types, operators, and control structures.</p>\r\n</li>\r\n<li>\r\n<p><strong>DOM Manipulation:</strong> Master the Document Object Model (DOM) and learn how to interact with web page elements dynamically.</p>\r\n</li>\r\n<li>\r\n<p><strong>Event Handling:</strong> Discover how to respond to user interactions and create interactive web experiences using event listeners.</p>\r\n</li>\r\n<li>\r\n<p><strong>Functions and Scope:</strong> Understand the importance of functions and scoping in JavaScript for writing modular and efficient code.</p>\r\n</li>\r\n<li>\r\n<p><strong>Arrays and Objects:</strong> Explore JavaScript\'s powerful data structures to store and manipulate data effectively.</p>\r\n</li>\r\n<li>\r\n<p><strong>Asynchronous JavaScript:</strong> Dive into asynchronous programming with callbacks, promises, and async/await to handle non-blocking operations.</p>\r\n</li>\r\n<li>\r\n<p><strong>AJAX and API Interaction:</strong> Learn how to fetch data from external APIs and update your web pages dynamically.</p>\r\n</li>\r\n<li>\r\n<p><strong>ES6 and Modern JavaScript:</strong> Embrace the latest features of ES6, including arrow functions, classes, and modules, to write more elegant code.</p>\r\n</li>\r\n<li>\r\n<p><strong>Web Application Development:</strong> Combine HTML, CSS, and JavaScript to build interactive web applications.</p>\r\n</li>\r\n<li>\r\n<p><strong>Project-Based Learning:</strong> Apply your JavaScript knowledge to real-world projects, solidifying your skills and boosting your confidence.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Why Choose Our JavaScript Masterclass:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Intermediate Level Course:</strong> Ideal for learners with a basic understanding of front-end web development, this course will take you deeper into the world of JavaScript.</p>\r\n</li>\r\n<li>\r\n<p><strong>Experienced Instructors:</strong> Learn from skilled web developers who are passionate about empowering others with JavaScript expertise.</p>\r\n</li>\r\n<li>\r\n<p><strong>Hands-On Practice:</strong> We emphasize hands-on coding exercises and projects, allowing you to gain practical experience.</p>\r\n</li>\r\n<li>\r\n<p><strong>Web Development Advancements:</strong> JavaScript is at the forefront of web development, and mastering it will keep you relevant in the industry.</p>\r\n</li>\r\n<li>\r\n<p><strong>Career Growth:</strong> JavaScript developers are in high demand, offering a wide range of career opportunities.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Enroll Now:</strong><span> Elevate your web development skills with our JavaScript Masterclass. Join us and embark on a journey of creating captivating web experiences that delight users and leave a lasting impression.</span></p>', 'Are you ready to breathe life into your web pages and create engaging user experiences? Join our JavaScript Masterclass and discover the fascinating world of front-end web development.', 'thumbnails/js_0y7s07M.png', 'course_syllabus/JAVASCRIPT_SYLLABUS.pdf', 1, 'javascript', 'Language, script, client-side scripting, JS'),
(4, 'React JS', '<p>Our React.js Essentials course is designed for developers who want to harness the potential of React.js, a popular JavaScript library maintained by Facebook. React.js allows you to create reusable and efficient components that enable seamless updates and user interactions.</p>\r\n<p><strong>What You\'ll Learn:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Introduction to React.js:</strong> Get acquainted with the core concepts of React.js and its component-based architecture.</p>\r\n</li>\r\n<li>\r\n<p><strong>JSX and Virtual DOM:</strong> Discover JSX, a syntax extension for JavaScript, and learn how React efficiently updates the Virtual DOM.</p>\r\n</li>\r\n<li>\r\n<p><strong>Components and Props:</strong> Master the art of building reusable and composable React components, passing data using props.</p>\r\n</li>\r\n<li>\r\n<p><strong>State and Lifecycle Methods:</strong> Understand React component state and lifecycle methods to manage dynamic data and UI updates.</p>\r\n</li>\r\n<li>\r\n<p><strong>Handling Events:</strong> Learn to handle user interactions and events, making your React applications interactive.</p>\r\n</li>\r\n<li>\r\n<p><strong>React Hooks:</strong> Embrace the power of React Hooks to add state and lifecycle capabilities to functional components.</p>\r\n</li>\r\n<li>\r\n<p><strong>Forms and Form Handling:</strong> Explore techniques to manage form data and handle form submissions in React.</p>\r\n</li>\r\n<li>\r\n<p><strong>React Router:</strong> Implement client-side routing with React Router to create single-page applications (SPAs).</p>\r\n</li>\r\n<li>\r\n<p><strong>Styling in React:</strong> Discover different approaches to styling React components, including CSS modules and styled-components.</p>\r\n</li>\r\n<li>\r\n<p><strong>React Context and Redux (Optional):</strong> Delve into advanced state management using React Context API or Redux.</p>\r\n</li>\r\n<li>\r\n<p><strong>Project Development:</strong> Apply your React.js knowledge to real-world projects, building interactive web applications.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Why Choose Our React.js Essentials Course:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Cutting-Edge Web Development:</strong> React.js is at the forefront of modern web development, and our course equips you with essential skills in this dynamic field.</p>\r\n</li>\r\n<li>\r\n<p><strong>Experienced Instructors:</strong> Learn from experienced web developers who are passionate about React.js and its real-world applications.</p>\r\n</li>\r\n<li>\r\n<p><strong>Hands-On Projects:</strong> Engage in hands-on coding projects that allow you to put your knowledge into practice.</p>\r\n</li>\r\n<li>\r\n<p><strong>React Community Support:</strong> Join a vibrant community of React enthusiasts, collaborate, and share knowledge.</p>\r\n</li>\r\n<li>\r\n<p><strong>Career Opportunities:</strong> Mastering React.js opens doors to exciting career opportunities in the front-end development domain.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Enroll Now:</strong><span> Elevate your front-end web development skills with our React.js Essentials course. Join us and discover the thrill of building cutting-edge user interfaces that captivate users and elevate web experiences.</span></p>', 'Are you ready to dive into the world of modern front-end web development? Join our React.js Essentials course and unlock the power of building dynamic and interactive user interfaces.', 'thumbnails/react-logo-1000-transparent_PcHxNZX.png', 'course_syllabus/react-js-syllabus.pdf', 1, 'react-js', ''),
(5, 'C', '<p>Our C Programming Fundamentals course is designed for individuals with little to no prior coding experience. C is a powerful and versatile programming language that lays the groundwork for various software applications, from operating systems to embedded systems.</p>\r\n<p><strong>What You\'ll Learn:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Introduction to C:</strong> Get started with the basics of C programming, including data types, variables, and operators.</p>\r\n</li>\r\n<li>\r\n<p><strong>Control Structures:</strong> Learn how to control the flow of a program using loops, conditional statements, and branching.</p>\r\n</li>\r\n<li>\r\n<p><strong>Functions:</strong> Understand the significance of functions in C, breaking down code into manageable and reusable modules.</p>\r\n</li>\r\n<li>\r\n<p><strong>Arrays and Pointers:</strong> Explore arrays and pointers, essential concepts for memory management and efficient data manipulation.</p>\r\n</li>\r\n<li>\r\n<p><strong>Strings and Character Handling:</strong> Work with strings and learn how to handle characters effectively in C.</p>\r\n</li>\r\n<li>\r\n<p><strong>File I/O:</strong> Discover file input and output operations, enabling data storage and retrieval from external files.</p>\r\n</li>\r\n<li>\r\n<p><strong>Memory Management:</strong> Gain insight into memory allocation and deallocation to optimize resource usage.</p>\r\n</li>\r\n<li>\r\n<p><strong>Structures and Unions:</strong> Learn how to create user-defined data types with structures and unions.</p>\r\n</li>\r\n<li>\r\n<p><strong>Error Handling:</strong> Explore error handling techniques, ensuring smooth execution of your C programs.</p>\r\n</li>\r\n<li>\r\n<p><strong>Project Development:</strong> Apply your C programming knowledge to practical projects, solidifying your understanding.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Why Choose Our C Programming Fundamentals Course:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Beginner-Friendly:</strong> Our course is designed for beginners, making it the perfect entry point into the world of programming.</p>\r\n</li>\r\n<li>\r\n<p><strong>Experienced Instructors:</strong> Learn from experienced programmers who are passionate about sharing their knowledge and expertise.</p>\r\n</li>\r\n<li>\r\n<p><strong>Hands-On Learning:</strong> We emphasize hands-on practice and coding exercises, allowing you to gain confidence in C programming.</p>\r\n</li>\r\n<li>\r\n<p><strong>Foundation for Software Development:</strong> C is the foundation for many programming languages, giving you a strong base to explore other languages.</p>\r\n</li>\r\n<li>\r\n<p><strong>Career Opportunities:</strong> Mastering C programming can lead to rewarding career opportunities in various domains, including software development and embedded systems.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Enroll Now:</strong><span> Begin your journey into the world of programming with our C Programming Fundamentals course. Join us and unlock the potential to create powerful and efficient software applications.</span></p>', 'Are you eager to step into the world of programming and software development? Join our C Programming Fundamentals course and discover the foundational language that has shaped the modern computing landscape.', 'thumbnails/c_wkd1I9B.png', 'course_syllabus/c_basic_syllabus.pdf', 0, 'c', ''),
(6, 'C++', '<p>Our C++ Programming Essentials course is designed for individuals with some programming background who want to explore the world of object-oriented programming and gain a deeper understanding of C++.</p>\r\n<p><strong>What You\'ll Learn:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Introduction to C++:</strong> Get acquainted with the basics of C++ programming, including data types, variables, and control structures.</p>\r\n</li>\r\n<li>\r\n<p><strong>Object-Oriented Programming (OOP):</strong> Dive into the principles of OOP, such as classes, objects, inheritance, polymorphism, and encapsulation.</p>\r\n</li>\r\n<li>\r\n<p><strong>C++ Functions and Libraries:</strong> Understand functions in C++ and leverage pre-built libraries to enhance your programs.</p>\r\n</li>\r\n<li>\r\n<p><strong>Pointers and Memory Management:</strong> Explore pointers and dynamic memory allocation, essential for efficient memory usage.</p>\r\n</li>\r\n<li>\r\n<p><strong>C++ Standard Template Library (STL):</strong> Learn how to use the powerful STL to simplify data structures and algorithms.</p>\r\n</li>\r\n<li>\r\n<p><strong>File Handling:</strong> Discover file input and output operations in C++, enabling data storage and retrieval from external files.</p>\r\n</li>\r\n<li>\r\n<p><strong>Exception Handling:</strong> Master the art of handling errors and exceptions gracefully in your C++ programs.</p>\r\n</li>\r\n<li>\r\n<p><strong>Templates and Generic Programming:</strong> Understand templates and create generic functions and classes for reusable code.</p>\r\n</li>\r\n<li>\r\n<p><strong>STL Containers and Algorithms:</strong> Dive deeper into the STL and explore various containers and algorithms it offers.</p>\r\n</li>\r\n<li>\r\n<p><strong>Project Development:</strong> Apply your C++ programming knowledge to real-world projects, solidifying your understanding.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Why Choose Our C++ Programming Essentials Course:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Intermediate Level Course:</strong> Ideal for learners with basic programming knowledge, our course takes you deeper into C++ and object-oriented concepts.</p>\r\n</li>\r\n<li>\r\n<p><strong>Experienced Instructors:</strong> Learn from experienced C++ developers who are passionate about sharing their knowledge and insights.</p>\r\n</li>\r\n<li>\r\n<p><strong>Hands-On Practice:</strong> We prioritize hands-on coding exercises and projects to ensure you gain practical experience.</p>\r\n</li>\r\n<li>\r\n<p><strong>Versatile and Efficient Language:</strong> C++ is widely used in various domains, including system programming, game development, and high-performance applications.</p>\r\n</li>\r\n<li>\r\n<p><strong>Career Opportunities:</strong> Mastering C++ can lead to exciting career opportunities in software development and tech-related industries.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Enroll Now:</strong><span> Elevate your programming skills with our C++ Programming Essentials course. Join us and unlock the potential to build efficient and powerful software applications using the principles of object-oriented programming.</span></p>', 'Are you ready to take your programming skills to the next level? Join our C++ Programming Essentials course and discover the versatility and efficiency of one of the most popular and widely used programming languages.', 'thumbnails/C-Logo.wine_4U3rIDD.png', 'course_syllabus/c_basic_syllabus_HCPxs1T.pdf', 1, 'c-plus-plus', ''),
(7, 'JAVA', '<p>Our Java Programming Masterclass is designed for individuals with a basic understanding of programming concepts who want to delve into the world of Java, one of the most popular and versatile programming languages.</p>\r\n<p><strong>What You\'ll Learn:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Introduction to Java:</strong> Get acquainted with the fundamentals of Java, including variables, data types, and control structures.</p>\r\n</li>\r\n<li>\r\n<p><strong>Object-Oriented Programming (OOP):</strong> Dive into the principles of OOP, such as classes, objects, inheritance, polymorphism, and encapsulation.</p>\r\n</li>\r\n<li>\r\n<p><strong>Java Standard Library (Java API):</strong> Explore the rich collection of pre-built classes and methods available in the Java API.</p>\r\n</li>\r\n<li>\r\n<p><strong>Exception Handling:</strong> Learn how to handle errors and exceptions gracefully in your Java programs.</p>\r\n</li>\r\n<li>\r\n<p><strong>File I/O:</strong> Discover file input and output operations in Java, enabling data storage and retrieval from external files.</p>\r\n</li>\r\n<li>\r\n<p><strong>Collections Framework:</strong> Master the collections framework to manage and manipulate groups of objects efficiently.</p>\r\n</li>\r\n<li>\r\n<p><strong>Java GUI (Swing and JavaFX):</strong> Create interactive graphical user interfaces using Swing and JavaFX libraries.</p>\r\n</li>\r\n<li>\r\n<p><strong>Multithreading and Concurrency:</strong> Implement multithreading for improved performance and concurrent execution.</p>\r\n</li>\r\n<li>\r\n<p><strong>Database Connectivity (JDBC):</strong> Integrate Java applications with databases using JDBC, enabling seamless data management.</p>\r\n</li>\r\n<li>\r\n<p><strong>Web Development with Java (Optional):</strong> Explore Java web development using frameworks like Spring and Servlets.</p>\r\n</li>\r\n<li>\r\n<p><strong>Project Development:</strong> Apply your Java programming knowledge to practical projects, solidifying your understanding.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Why Choose Our Java Programming Masterclass:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Intermediate Level Course:</strong> Ideal for learners with basic programming knowledge, this course takes you deeper into Java and OOP concepts.</p>\r\n</li>\r\n<li>\r\n<p><strong>Experienced Instructors:</strong> Learn from experienced Java developers who are passionate about sharing their knowledge and expertise.</p>\r\n</li>\r\n<li>\r\n<p><strong>Hands-On Projects:</strong> Engage in hands-on coding projects to apply your learning effectively.</p>\r\n</li>\r\n<li>\r\n<p><strong>Versatile Language:</strong> Java\'s versatility makes it suitable for various domains, from software development to mobile app creation.</p>\r\n</li>\r\n<li>\r\n<p><strong>Career Growth:</strong> Java developers are in high demand, offering diverse and rewarding career opportunities.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Enroll Now:</strong><span> Elevate your programming skills with our Java Programming course. Join us and embark on a journey of creating powerful applications that make an impact in the digital world.</span></p>', 'Are you ready to become a proficient Java developer and unlock endless possibilities in software development? Join our Java Programming Masterclass and embark on a journey of creating versatile and scalable applications.', 'thumbnails/java_p4Gf9rQ.png', 'course_syllabus/Java_syllabus.pdf', 1, 'java', ''),
(8, 'MySQL', '<p>Our MySQL Database Fundamentals course is designed for individuals with little to no prior experience in databases. MySQL is a powerful and reliable database system that enables efficient data storage, retrieval, and manipulation.</p>\r\n<p><strong>What You\'ll Learn:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Introduction to Databases:</strong> Understand the significance of databases in modern applications and the relational database model.</p>\r\n</li>\r\n<li>\r\n<p><strong>MySQL Installation and Setup:</strong> Learn how to install and configure MySQL on your system for local development.</p>\r\n</li>\r\n<li>\r\n<p><strong>SQL Basics:</strong> Explore the fundamentals of SQL (Structured Query Language), the language used to interact with MySQL databases.</p>\r\n</li>\r\n<li>\r\n<p><strong>Creating and Managing Databases and Tables:</strong> Master the art of creating databases and tables to organize and store your data efficiently.</p>\r\n</li>\r\n<li>\r\n<p><strong>Data Insertion and Retrieval:</strong> Discover how to insert data into MySQL tables and retrieve information using various SQL queries.</p>\r\n</li>\r\n<li>\r\n<p><strong>Data Updating and Deletion:</strong> Learn to update and delete data in MySQL tables to maintain accurate and up-to-date records.</p>\r\n</li>\r\n<li>\r\n<p><strong>Data Constraints and Indexes:</strong> Implement data constraints and indexes to ensure data integrity and optimize query performance.</p>\r\n</li>\r\n<li>\r\n<p><strong>Joins and Relationships:</strong> Understand how to establish relationships between tables and perform powerful joins to fetch related data.</p>\r\n</li>\r\n<li>\r\n<p><strong>Aggregation and Grouping:</strong> Explore advanced SQL concepts, including aggregation functions and grouping of data.</p>\r\n</li>\r\n<li>\r\n<p><strong>Database Backup and Restoration:</strong> Learn how to create database backups and restore them in case of data loss.</p>\r\n</li>\r\n<li>\r\n<p><strong>Project Development:</strong> Apply your MySQL knowledge to practical projects, solidifying your understanding of database management.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Why Choose Our MySQL Database Fundamentals Course:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Beginner-Friendly:</strong> Our course is designed for beginners, making it the perfect starting point for understanding databases and SQL.</p>\r\n</li>\r\n<li>\r\n<p><strong>Experienced Instructors:</strong> Learn from experienced database administrators who are passionate about sharing their knowledge.</p>\r\n</li>\r\n<li>\r\n<p><strong>Hands-On Learning:</strong> We prioritize hands-on practice and interactive exercises, allowing you to gain practical experience.</p>\r\n</li>\r\n<li>\r\n<p><strong>Widely Used Database System:</strong> MySQL is extensively used in web development and various applications, making it a valuable skill in the tech industry.</p>\r\n</li>\r\n<li>\r\n<p><strong>Career Opportunities:</strong> Mastering MySQL opens doors to exciting career opportunities in database administration and data analysis.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Enroll Now:</strong><span> Begin your journey into the world of databases with our MySQL Database Fundamentals course. Join us and unlock the potential to manage and query data effectively.</span></p>', 'Are you eager to dive into the world of databases and data management? Join our MySQL Database Fundamentals course and unlock the power of one of the most popular and widely used relational database management systems.', 'thumbnails/MySQL_logo_logotype_mWbiAYm.png', 'course_syllabus/MySQL_syllabus.pdf', 1, 'mysql', ''),
(9, 'Computer Basic', '<p>Our Computer Basics course is designed for individuals with little to no prior experience with computers. We aim to demystify technology and equip you with essential skills to navigate computers, operating systems, and common software applications.</p>\r\n<p><strong>What You\'ll Learn:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Introduction to Computers:</strong> Understand the components and functions of a computer system, including hardware and software.</p>\r\n</li>\r\n<li>\r\n<p><strong>Operating Systems:</strong> Learn about different operating systems and get familiar with essential tasks like file management.</p>\r\n</li>\r\n<li>\r\n<p><strong>Internet and Web Browsing:</strong> Navigate the internet with ease, mastering web browsers and conducting online searches.</p>\r\n</li>\r\n<li>\r\n<p><strong>Email and Communication:</strong> Set up and manage email accounts, and explore effective communication through email.</p>\r\n</li>\r\n<li>\r\n<p><strong>Word Processing:</strong> Discover word processing software and learn to create and edit documents professionally.</p>\r\n</li>\r\n<li>\r\n<p><strong>Spreadsheets:</strong> Get introduced to spreadsheets and learn how to use them for data organization and analysis.</p>\r\n</li>\r\n<li>\r\n<p><strong>Presentations:</strong> Create visually appealing and impactful presentations using presentation software.</p>\r\n</li>\r\n<li>\r\n<p><strong>Computer Security and Privacy:</strong> Understand essential practices for ensuring computer security and safeguarding personal information.</p>\r\n</li>\r\n<li>\r\n<p><strong>Troubleshooting and Maintenance:</strong> Learn basic troubleshooting techniques and how to maintain a healthy computer system.</p>\r\n</li>\r\n<li>\r\n<p><strong>Digital Citizenship:</strong> Explore responsible and ethical practices for digital interaction and online presence.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Why Choose Our Computer Basics Course:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Beginner-Friendly:</strong> Our course is tailored for beginners, providing a friendly and supportive learning environment.</p>\r\n</li>\r\n<li>\r\n<p><strong>Patient Instructors:</strong> Learn from patient and knowledgeable instructors who guide you through every step of your learning journey.</p>\r\n</li>\r\n<li>\r\n<p><strong>Hands-On Practice:</strong> We prioritize hands-on exercises and interactive sessions to build your confidence with computer skills.</p>\r\n</li>\r\n<li>\r\n<p><strong>Versatile Knowledge:</strong> Computer basics are fundamental in both personal and professional life, making this course highly practical.</p>\r\n</li>\r\n<li>\r\n<p><strong>Empowerment through Technology:</strong> Mastering computer basics empowers you to embrace technology with ease and opens doors to new opportunities.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Enroll Now:</strong><span> Take your first step into the digital world with our Computer Basics course. Join us and become proficient in essential computer skills, setting yourself on the path to technological success.</span></p>', 'Are you new to the world of computers or seeking to enhance your foundational knowledge? Join our Computer Basics course and embark on a journey to become proficient in navigating the digital landscape with confidence.', 'thumbnails/computer_AFAbkJw.jpg', 'course_syllabus/computer_basic_course_syllabus.pdf', 1, 'computer-basic', ''),
(10, 'HTML & CSS', '<p>In this beginner-friendly course, we\'ll introduce you to the essential concepts of HTML and CSS. From structuring web content with HTML to styling and layout with CSS, you\'ll gain the foundational knowledge to create stunning web pages from scratch.</p>\r\n<p><strong>What You\'ll Learn:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>HTML Essentials:</strong> Learn the structure and semantics of HTML elements, creating headings, paragraphs, lists, images, and hyperlinks to connect web pages.</p>\r\n</li>\r\n<li>\r\n<p><strong>CSS Styling:</strong> Dive into the world of CSS and explore how to apply colors, fonts, borders, and backgrounds to breathe life into your web pages.</p>\r\n</li>\r\n<li>\r\n<p><strong>Layout and Flexbox:</strong> Master the art of layout design using CSS, and leverage the power of Flexbox to build responsive and flexible web layouts.</p>\r\n</li>\r\n<li>\r\n<p><strong>Responsive Web Design:</strong> Discover techniques to make your websites adapt gracefully to various screen sizes and devices.</p>\r\n</li>\r\n<li>\r\n<p><strong>CSS Transitions and Animations:</strong> Add interactivity to your web pages with CSS transitions and animations, enhancing the user experience.</p>\r\n</li>\r\n<li>\r\n<p><strong>Web Accessibility:</strong> Understand the importance of web accessibility and how to create inclusive websites for all users.</p>\r\n</li>\r\n<li>\r\n<p><strong>Project-based Learning:</strong> Work on hands-on projects that challenge you to apply your knowledge and creativity to real-world scenarios.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Why Choose Our HTML and CSS Course:</strong></p>\r\n<ol>\r\n<li>\r\n<p><strong>Beginner-Friendly:</strong> No prior web design experience required. Our course welcomes individuals from all backgrounds who are eager to learn.</p>\r\n</li>\r\n<li>\r\n<p><strong>Experienced Instructors:</strong> Learn from experienced web developers who will guide you through every step of your learning journey.</p>\r\n</li>\r\n<li>\r\n<p><strong>Hands-On Practice:</strong> We prioritize hands-on practice and interactive exercises, ensuring you build a robust skillset.</p>\r\n</li>\r\n<li>\r\n<p><strong>Portfolio Building:</strong> Showcase your projects and accomplishments in a portfolio that can impress potential employers or clients.</p>\r\n</li>\r\n<li>\r\n<p><strong>Career Opportunities:</strong> Web design is a sought-after skill in today\'s digital world, opening doors to various creative and technical job opportunities.</p>\r\n</li>\r\n</ol>\r\n<p><strong>Enroll Now:</strong><span> Start creating captivating web experiences with our HTML and CSS Fundamentals course. Unlock the art of web design and see your ideas come to life on the digital canvas.</span></p>', 'Are you fascinated by the art of web design? Join our HTML and CSS Fundamentals course to explore the building blocks of the web and unleash your creativity in crafting visually appealing and interactive websites.', 'thumbnails/html_EzI246K.png', 'course_syllabus/html_css_js_syllabus.pdf', 1, 'html-and-css', ''),
(11, 'Graphic Designing', '<p>Unlock your creative potential and become a master graphic designer with our comprehensive course in Adobe Illustrator, Adobe Photoshop, and Autodesk Maya. Whether you\'re a beginner looking to dive into the world of graphic design or an experienced designer aiming to enhance your skills, this course is tailored to meet your needs.</p>\r\n<p>Course Overview:</p>\r\n<ol>\r\n<li>\r\n<p><strong>Adobe Illustrator Fundamentals (Duration: 4 weeks)</strong></p>\r\n<p>In the Adobe Illustrator section, you will learn:</p>\r\n<ul>\r\n<li>The essentials of vector graphics and how to create stunning illustrations.</li>\r\n<li>Tools and techniques for precise drawing, typography, and logo design.</li>\r\n<li>How to leverage advanced features such as gradient mesh, pattern creation, and 3D effects.</li>\r\n<li>Practical projects to apply your knowledge and develop a strong foundation in vector design.</li>\r\n</ul>\r\n</li>\r\n<li>\r\n<p><strong>Adobe Photoshop Mastery (Duration: 6 weeks)</strong></p>\r\n<p>In the Adobe Photoshop segment, you will explore:</p>\r\n<ul>\r\n<li>Core principles of image editing, photo manipulation, and retouching.</li>\r\n<li>Advanced techniques like compositing, digital painting, and color correction.</li>\r\n<li>Creating compelling web graphics, social media visuals, and print-ready materials.</li>\r\n<li>Real-world projects that challenge your creativity and sharpen your Photoshop skills.</li>\r\n</ul>\r\n</li>\r\n<li>\r\n<p><strong>3D Design and Animation with Autodesk Maya (Duration: 8 weeks)</strong></p>\r\n<p>In the Autodesk Maya section, you will delve into:</p>\r\n<ul>\r\n<li>3D modeling, texturing, and lighting to bring your ideas to life.</li>\r\n<li>Animation principles, rigging characters, and creating dynamic scenes.</li>\r\n<li>Special effects and visual storytelling for game design, film, and more.</li>\r\n<li>Hands-on projects that showcase your 3D design and animation talents.</li>\r\n</ul>\r\n</li>\r\n</ol>\r\n<p>Course Highlights:</p>\r\n<ul>\r\n<li>Interactive, hands-on lessons with practical exercises to reinforce your learning.</li>\r\n<li>Expert guidance from experienced industry professionals.</li>\r\n<li>Personalized feedback and critiques to help you improve your work.</li>\r\n<li>Access to the latest software and tools for graphic design and 3D modeling.</li>\r\n<li>A certificate of completion to showcase your newfound skills to potential clients or employers.</li>\r\n</ul>\r\n<p>By the end of this course, you will have the knowledge and expertise to create stunning visual content, whether it\'s for branding, advertising, animation, or any other creative endeavor. Join us on this exciting journey to become a Graphic Design Master with Adobe Illustrator, Adobe Photoshop, and Autodesk Maya.</p>\r\n<p>Don\'t miss this opportunity to elevate your graphic design skills and open up new career possibilities. Enroll now and start your path to becoming a design virtuoso!</p>', 'Master Adobe Illustrator, Photoshop, and Autodesk Maya. Elevate your graphic design skills with expert guidance. Unlock creative potential and excel in design. Enroll today!', 'thumbnails/pngwing.com_3.png', 'course_syllabus/graphic_designing_syllabus.pdf', 1, 'graphic-designing', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses_category`
--

INSERT INTO `courses_category` (`id`, `courses_id`, `coursecategories_id`) VALUES
(7, 2, 2),
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
(26, 11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

DROP TABLE IF EXISTS `course_categories`;
CREATE TABLE IF NOT EXISTS `course_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`id`, `name`) VALUES
(1, 'Programming'),
(2, 'Language'),
(3, 'Database'),
(4, 'Graphics'),
(5, 'Beginner'),
(6, 'Front End'),
(7, 'Back End');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
(18, 'homepage', 'coursecategories');

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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

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
(32, 'homepage', '0014_coursecategories_courses_category', '2024-07-27 06:17:48.746753');

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
('lyj2zezwm3ucbav1dl31m1dlt6vvh208', '.eJxVjMsOwiAQRf-FtSG8YVy69xvIwIBUDU1KuzL-uzbpQrf3nHNfLOK2triNssSJ2JlJdvrdEuZH6TugO_bbzPPc12VKfFf4QQe_zlSel8P9O2g42reuZLSwUquCPqBVwmgPoVZXQnXJabRAKThPlXwGEWQ2yYIBQKGyAc3eH9QAN2I:1sXgAG:G_fM-WNyQkJLc6Y-FnmEvqeskBYr2cWnaXbOoLv2RIo', '2024-08-10 12:04:44.119007');

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
(1, 'pbkdf2_sha256$390000$tNRNjBnDg1g56QZxPfwdq6$7egjKmrn6cCpKd7WOfMYmEAq3LnJa0LHmJ3NSWCUY4I=', '2024-07-27 12:04:44.116501', 1, 1, 1, '2024-04-09 10:06:53.872460', 'admin@webxter.in', 'admin', 'admin', NULL, '', '', '', '', 0),
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_call_back`
--

INSERT INTO `request_call_back` (`id`, `name`, `email`, `message`, `phone_number`, `date`, `time`, `is_opened`) VALUES
(1, 'veer dharam', 'veerdharam0786@gmail.com', 'sfhsidhfsdhfdshfh hsidfbsu', '7355017830', '10-4-2024', '18:13', 1);

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
