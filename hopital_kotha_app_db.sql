-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 18, 2020 at 06:59 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hopital_kotha_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabin_info`
--

CREATE TABLE `cabin_info` (
  `id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `cabin_type` int(11) NOT NULL COMMENT '1=normal.2=covid',
  `normal` int(11) NOT NULL,
  `special` int(11) NOT NULL,
  `vip` int(11) NOT NULL,
  `icu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cabin_info`
--

INSERT INTO `cabin_info` (`id`, `hospital_id`, `cabin_type`, `normal`, `special`, `vip`, `icu`) VALUES
(1, 1, 1, 120, 40, 30, 30),
(2, 1, 2, 60, 33, 30, 20),
(3, 2, 1, 50, 50, 20, 10),
(4, 2, 2, 60, 33, 30, 40);

-- --------------------------------------------------------

--
-- Table structure for table `current_cabin_space`
--

CREATE TABLE `current_cabin_space` (
  `id` int(11) NOT NULL,
  `cabin_id` int(11) NOT NULL,
  `normal` int(11) NOT NULL,
  `special` int(11) NOT NULL,
  `vip` int(11) NOT NULL,
  `icu` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `current_cabin_space`
--

INSERT INTO `current_cabin_space` (`id`, `cabin_id`, `normal`, `special`, `vip`, `icu`, `updated_at`) VALUES
(1, 1, 46, 44, 30, 0, '2020-07-18 15:58:00'),
(2, 10, 44, 44, 30, 0, '2020-07-18 06:47:50'),
(3, 3, 54, 54, 54, 0, '2020-07-18 06:47:50'),
(4, 2, 54, 54, 54, 0, '2020-07-18 15:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_info`
--

CREATE TABLE `hospital_info` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'type 1=govt, 2=private',
  `location` varchar(200) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(200) NOT NULL,
  `is_covid_treatment` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital_info`
--

INSERT INTO `hospital_info` (`id`, `name`, `type`, `location`, `phone`, `email`, `address`, `is_covid_treatment`, `is_active`) VALUES
(1, 'Ad-din Hospital', 2, 'Maghbazar', '9353391,9353392,9353393\r\n', 'md.hasanur@gmail.com', '2 Boro Maghbazar, Dhaka-1217, Bangladesh', 0, 1),
(2, 'Anwer Khan Modern Hospital Limited', 2, 'Dhanmondi', '+8809670295,+8809664956', 'md.hasanur@gmail.com', 'House #17, Road #08, Dhanmondi, Dhaka-1205', 1, 1),
(3, 'AMZ Hospital', 2, 'Uttar Badda', '10699, 01847331010\r\n', 'md.hasanur@gmail.com', 'Cha- 80/3, Shadhinota Sarani (Progati Sarani),Uttar Badda, Dhaka-1212,Bangladesh', 1, 1),
(4, 'Azgar Ali Hospital', 2, 'Gandaria (Old Dhaka)', '88 02 47443135-48 , 88 0178 768 3333', 'md.hasanur@gmail.com', '111/1/A Distillery Road, Gandaria (Beside Dhupkhola Playground)\nDhaka-1204, Bangladesh\n', 1, 1),
(5, 'Ahsania Mission General Cancer Hospital', 2, 'New Eskaton', '(880-2) 9008919', 'md.hasanur@gmail.com', 'Plot No. Mobile:1/C, Mirpur-14, Dhaka1206, NewEskaton Road (Noor Nogar), Dhaka', 0, 1),
(6, 'Abedin General HospitalConsultation Centre', 2, 'Mohammadpur', '9133729', 'md.hasanur@gmail.com', '2/13, BI-B, Humayun Road, College Gate, Mohammadpur, Dhaka-1207', 0, 1),
(7, 'Abir General Hospital', 2, 'Eskaton', '8360780, 8360790', 'md.hasanur@gmail.com', '18, New Eskaton Road (Noor Nogar), Dhaka', 0, 1),
(8, 'Afroza Nursing Home & General Hospital', 2, 'Jatrabari', '7514616,7514633, 01712224533', 'md.hasanur@gmail.com', '249/5/A, South Jatrabari, Dhaka-1204', 0, 1),
(9, 'Aichi Hospital', 2, 'Uttara', '8916290, 8920165', 'md.hasanur@gmail.com', 'R-13, Esha Khan Ave, Sec-6, Uttara Model Town, Dhaka', 0, 1),
(10, 'Al-Ashraf General Hospital', 2, 'Uttara', '952851, 852852, 0171877450', 'md.hasanur@gmail.com', 'H-12, R-21, Sec-4, Uttara, Dhaka-1230', 0, 1),
(11, 'AL-Helal Specialized Hospital Ltd', 2, 'Senpara (Mirpur)', '9006820, 8053481, 9008181', 'md.hasanur@gmail.com', '150, Rokeya Sarani, Senpara, Parbata, Dhaka', 0, 1),
(12, 'Al-Manar Hospital (Pvt.) Ltd.', 2, 'Lalmatia', '9121387, 9121588', 'md.hasanur@gmail.com', '5/4, Block-F, Lalmatia, Dhaka', 0, 1),
(13, 'Al-Madina Hospital Ltd', 2, 'Mirpur', '8051974, 01716-857717, 9015914', 'md.hasanur@gmail.com', 'H-5, R-4, BI-A, Sec-6, Mirpur, Dhkaa-1216', 0, 1),
(14, 'Al-Markazul Islami Hospital', 2, 'Shyamoli', '9129426, 9129217', 'md.hasanur@gmail.com', 'R-3, H-29, Shyamoli, Dhaka', 0, 1),
(15, 'Al-Rashid General Hospital', 2, 'Mirpur', '8059567, 01712266258', 'md.hasanur@gmail.com', 'Plot-2 (1st Fl), R-1, BI-B, Mirpur-1, Dhaka-1216', 0, 1),
(16, 'AL-Shaft Hospital Ltd', 2, 'Mirpur', '8023810, 8010101 0171535128', 'md.hasanur@gmail.com', 'H-9, R-6, Mirpur-10/A, Dhaka-1216', 0, 1),
(17, 'Asia Medical Services Ltd', 2, 'Kuril', '8857440, 01712106020', 'md.hasanur@gmail.com', '86/1 Ka, AL-Hera Tower (2nd Ft), Kuratali Jame Masjid Road, Kuril, Dhaka', 0, 1),
(18, 'Asian General & Dental Hospital Ltd', 2, 'Merul Badda', '986000, 9898899', 'md.hasanur@gmail.com', 'H-4, R-11, Progati Sarani, Merul Badda, Dhaka', 0, 1),
(19, 'Ayesha Memorial Hospital', 2, 'Mohakhali', '9122689, 9122690', 'md.hasanur@gmail.com', '74/75, Peacock Square, New Airport Road, Arjatpara, Mohakhali, Dhaka-1215', 0, 1),
(20, 'Amin Bazar Hospital', 1, 'Savar', '01700000000, 01712290100, 01557-304196', 'md.hasanur@gmail.com', 'Amin Bazar Hospital, N5, Aminbazar, Bangladesh', 1, 1),
(21, 'Azgar Ali Hospital', 2, 'Gandaria (Old Dhaka)', '88 02 47443135-48, 88 0178 768 3333', 'md.hasanur@gmail.com', '111/1/A Distillery Road, Gandaria (Beside Dhupkhola Playground)|Dhaka-1204, Bangladesh', 1, 1),
(22, 'Arogya Niketan Hospital Ltd.', 2, 'Malibagh', '880-2-9333730', 'md.hasanur@gmail.com', '242-243, New Circular Road, Malibagh, Dhaka - 1217, Bangladesh', 0, 1),
(23, 'Ahmed Medical Center (Deen Eye Care & Research Institue)', 2, 'Dhanmondi', '+880-2-8113628, 9119738', 'md.hasanur@gmail.com', 'House # 71/1, Road # 15/A, Dhanmondi R/A, (Shankar Bus Stand)Dhaka-1209, Bangladesh', 0, 1),
(24, 'Al-Shefa Dialysis Center', 2, 'Nikunja-2', '+880 2 8816047', 'md.hasanur@gmail.com', 'House No. 33, Road No. 12. Nikunja-2, Dhaka', 0, 1),
(25, 'Advanced Eye Center', 2, 'Humayun Road, College Gate', '+880-2-9123479, 01716-165353', 'md.hasanur@gmail.com', '5/17 Humayun Road, College Gate, Dhaka - 261207, Ban27gladesh', 0, 1),
(26, 'Dr. Sirajul Islam Medical College Hospital', 2, 'Outer Circular Rd', '+880 2-9351887', 'md.hasanur@gmail.com', '12/3,28 Outer Circula29r Rd, Dhaka30, Bangladesh', 0, 1),
(27, 'Al-Barakah Kidney Hospital|', 2, 'New Eskaton', '+880 2 9350884. 9351164, 9337521 4', 'md.hasanur@gmail.com', '129, New Eskaton Road, Dhaka', 0, 1),
(28, 'Al-Fateh Medical Services (Pvt) Ltd.', 2, 'Farmgate', '880-2-9120615', 'md.hasanur@gmail.com', '11, Farmgate over Bridge East Side, Dhaka, Bangladesh|', 0, 1),
(29, 'Al-Raji Hospital Ltd', 2, 'Farmgate', '+880 2 8119229, 9117775', 'md.hasanur@gmail.com', '12, Farmgate Dhaka.', 0, 1),
(30, 'Al-Madina General Hospital (Pvt.) Ltd.', 2, 'Shamoli', '880-2-8118709', 'md.hasanur@gmail.com', '2/A, Golden Street, Ring Road, Shamoli, Dhaka, Bangladesh', 0, 1),
(31, 'AL-Manar Hospital (Pvt.) Ltd.|', 2, 'Lalmatia', '02-9121387, 02-9121588, 015500-20871,015500-20885', 'md.hasanur@gmail.com', '5/4, Block-F, Lalmatia, Dhaka- 1207, Bangladesh|', 0, 1),
(32, 'Bangladesh Kuwait Maitree Uttara Hospital', 1, 'Uttara', '01999-956290', 'md.hasanur@gmail.com', 'Eshakha Avenue Uttara sector- 6|Dhaka-1230, Bangladesh', 1, 1),
(33, '250 Bed Sheikh Rasel Gastro Liver Institute and Hospital', 1, 'Mohakhali,', '880 1819221115', 'md.hasanur@gmail.com', 'Mohakhali,TB Gate,Near.NIDCH,Mohakhali|Dhaka-1212', 1, 1),
(34, 'Bangladesh Community & General Hospital', 2, 'Jatrabari', '7511523, 7515110', 'md.hasanur@gmail.com', '80/A, North Jatrabari, Dhaka', 0, 1),
(35, 'Bangladesh Diabetic Association', 2, 'Mirpur', '9010952, 9010932', 'md.hasanur@gmail.com', 'Darus Salam Mirpur,Dhaka-1216', 0, 1),
(36, 'Bangladesh Eye Hospital', 2, 'Dhanmondi', '8651950-3', 'md.hasanur@gmail.com', 'H-19/1, Road-6, Dhanmondi, Dhaka', 0, 1),
(37, 'Bangladesh Eye Hospital', 2, 'Dhanmondi', '8651950-3', 'md.hasanur@gmail.com', 'House-19/1, Raod-6, Dhanmondi, Dhaka-1205', 0, 1),
(38, 'Bangladesh Heart & Chest Hospital', 2, 'Dhanmondi', '8123977, 9114166, 01711675846', 'md.hasanur@gmail.com', 'R-27, H-47, Dhanmondi, Dhaka', 0, 1),
(39, 'Bangladesh Lions Foundation Hospital', 2, 'Agargaon', '9131990, 8110894', 'md.hasanur@gmail.com', 'Lions Building, Begum Rokeya Sarani, Agargaon', 0, 1),
(40, 'Bangladesh Medical College Hospital', 2, 'Dhanmondi', '9120792, 8115843, 9118202', 'md.hasanur@gmail.com', 'H-33-35, R-14/A, Dhanmondi R/A, Dhaka', 0, 1),
(41, 'Bart Clinic', 2, 'Elephant Road', '8611932', 'md.hasanur@gmail.com', '103, Elephant Road, Dhaka', 0, 1),
(42, 'BDM Hospital & Diagnostic Centre', 2, 'Mohammedpur', '8122806', 'md.hasanur@gmail.com', '5/17, Humayun Road. Block-B, Mohammedpur, Dhaka', 0, 1),
(43, 'Bhuiyan Hospital', 2, 'Eskaton', '9339916', 'md.hasanur@gmail.com', '1/4, Eskaton Garden Road, Dhaka-1217', 0, 1),
(44, 'Birdem Hospital', 2, 'Shahbagh', '9661551-5, 8616641-50', 'md.hasanur@gmail.com', 'Shahbagh, Dhaka,', 0, 1),
(45, 'Brain & Life Hospital', 2, 'Kakoli Banani', '9895652', 'md.hasanur@gmail.com', 'H-93/6, New Air Port Road, Kakoli Banani, Dhak', 0, 1),
(46, 'Brain & Mind Hospital (Pvt) Ltd', 2, 'Farmgate', '9118901, 8120710', 'md.hasanur@gmail.com', '149/A, Airport Road, Farmgate, Dhaka-1215', 0, 1),
(47, 'Brighton Hospital & Diagnostic Centre', 2, 'Hatirpool', '8626901-2', 'md.hasanur@gmail.com', '163-164,Sonargaon Road. Hatirpool.Dhaka-1205', 0, 1),
(48, 'BSMMU (PG Hospital)', 2, 'Sahahbag', '8614001-5, 8618652-6, 8612550-4,8614545-9', 'md.hasanur@gmail.com', 'Sahahbag, Dhaka', 0, 1),
(49, 'BSMMU Cardiac Center', 2, 'Dhaka', '966871, 01819-910552', 'md.hasanur@gmail.com', 'Karonari Care Unit, Cardiac Surgery Block-D, Gr Fl, 2nd, 4th, 6th Floor, Dhaka', 0, 1),
(50, 'Brighton Hospital and Diagnostic center|', 2, 'Hatirpool', '880-2-8626901-2, 8651128-35', 'md.hasanur@gmail.com', '163-164 Sonargaon Road (Hatirpool), Elephant Road, Dhaka - 1215, Bangladesh|', 0, 1),
(51, 'Bangladesh Institute of Health Sciences', 2, 'Mirpur', '+880 2 9010932, 8035502, 01674237114', 'md.hasanur@gmail.com', '125/1, Darus Salam, Mirpur, Dhaka-1207|', 0, 1),
(52, 'BRB Hospitals Ltd.', 2, 'Panthapath', '8802 9131537, 8802 9140333, 8802 9140346', 'md.hasanur@gmail.com', '77/A East Rajabazar, West Panthapath, Dhaka 1215, Bangladesh', 0, 1),
(53, 'B. A. V. S Maternity', 2, 'Mirpur-2', '8016945, 8016414', 'md.hasanur@gmail.com', '7/5, Main Road, Mirpur-2, Dhaka', 0, 1),
(54, 'B. M Hospital', 2, 'Mirpur', '8011352', 'md.hasanur@gmail.com', 'H-2, R-2, Kalwalapara, BI-G, Sec-1, Mirpur, Dhaka-1216', 0, 1),
(55, 'CMH', 1, 'Dhaka Cantonment', '02-9110345,02-9870011,02882770,+8801769013311,+8801724-579521', 'md.hasanur@gmail.com', 'Dhaka Cantonment, Dhaka', 1, 1),
(56, 'Care Hospital Ltd', 2, 'Mohammadpur', '+8802 9134407, 9132548, 8124974, 8110864, 01733588337', 'md.hasanur@gmail.com', '2/1-A Iqbal Road, Mohammadpur (On Main Mirpur Road), Dhaka-1207', 0, 1),
(57, 'Cure Medical Center Ltd. General Hospital', 2, 'Gulshan', '9894776, 8360854', 'md.hasanur@gmail.com', 'House-5. Road-16, Gulshan, Dhaka-1212', 0, 1),
(58, 'Crescent Hospital & Diagnostic Complex Ltd', 2, 'Mohammadpur', '8119775, 9117524', 'md.hasanur@gmail.com', '22/2, Babor Road, Mohammadpur, Dhaka-1207', 0, 1),
(59, 'Crescent Gastro liver & General Hospital Ltd.', 2, 'Dhanmondi', '9116851, 9137181-2', 'md.hasanur@gmail.com', 'H-60, R-8/A, Dhanmondi R/A, Dhaka', 0, 1),
(60, 'Crea (Drug Cure Centre)|', 2, 'Mohammadpur', '8115887', 'md.hasanur@gmail.com', '1/14, Iqbal Road, Mohammadpur, Dhaka', 0, 1),
(61, 'Cosmetic Surgery Center Ltd', 2, 'Satmasjid Road', '8153808, 01711-043435', 'md.hasanur@gmail.com', 'Shankar Plaza 6th fl., 72, Satmasjid Road, Dhaka', 0, 1),
(62, 'Conscious Health Services Ltd', 2, 'Dhanmondi', '9667604, 9665544, 01712114777', 'md.hasanur@gmail.com', 'H-285/A, R-6, Dhanmondi R/A, Dhaka-12054', 0, 1),
(63, 'Comfort Nursing Home (P) Ltd.', 2, 'Dhanmondi, Uttara', '8124990 (Main), 8953797-8 (Uttara)', 'md.hasanur@gmail.com', 'Main Branch: 167/B, Green Road.Dhanmondi. Uttara Branch: H-7, R-14d, Sector-4, Uttara, Dhaka', 0, 1),
(64, 'City Hospital Ltd', 2, 'Mohammedpur', '8143312, 8143437, 8143166, 01815-484600', 'md.hasanur@gmail.com', '1/8, Block-E, Lalmatia Mohammedpur, Dhaka', 0, 1),
(65, 'City Hospital Ltd', 2, 'Panthapath', '8617852, 8623205', 'md.hasanur@gmail.com', '69/1/1, Panthapath, Dhaka-1205', 0, 1),
(66, 'Cosmetic Surgery Center Ltd.', 2, 'Satmasjid Road', '01711043435, +880-2-8153808', 'md.hasanur@gmail.com', 'Shankar Plaza, 5th floor, 72, Satmasjid Road Dhanmondi R/A, Dhaka-1209, Bangladesh', 0, 1),
(67, 'Cancer Home-Mohakhali', 2, 'Mohakhali', '8858817, 8850832', 'md.hasanur@gmail.com', '67, Mohakhali Square, Dhaka-1212', 0, 1),
(68, 'Central Hospital Ltd', 2, 'Dhanmondi', '9660015-19, 8624514-18', 'md.hasanur@gmail.com', 'H-2, R-5, Green Road, Dhanmondi, Dhaka-1205', 0, 1),
(69, 'Chankharpool General Hospital', 2, 'Chankharpool (Old Dhaka)', '7301127, 0175847692, 0189426324', 'md.hasanur@gmail.com', '10/1, Nabab Katara Road, Chankharpool, Dhaka', 0, 1),
(70, 'City General Hospital & Diagnosis', 2, 'Dhanmondi', '83130778, 9120862, 9132542', 'md.hasanur@gmail.com', 'H-120, R-9/A, (New), Dhanmondi R/A, Dhaka-1209', 0, 1),
(71, 'China-Bangla (JV) Ltd.', 2, 'Uttara', '+880 2 8913674, 8913606', 'md.hasanur@gmail.com', 'House #15, Shayesta Khan Avenue, Sector # 4, Uttara, Dhaka', 0, 1),
(72, 'CRP-Mirpur|', 2, 'Mirpur', '8053662, 9025562, 9025563,+8801768152922', 'md.hasanur@gmail.com', 'Plot # A/5, Block # A, Mirpur # 14,|Dhaka - 1206, Bangladesh|', 0, 1),
(73, 'CRP - Savar', 2, 'Savar', '+88027745464, +88027745465', 'md.hasanur@gmail.com', 'CRP-Chapain, Savar, Dhaka 1343, Bangladesh|', 0, 1),
(74, 'Dhaka Medical College and Hospital (DMC)', 1, 'Bakshibazar, Dhaka', '02-55165088', 'md.hasanur@gmail.com', 'Dhaka Medical College|Dhaka- 1000, Bangladesh', 1, 1),
(75, 'Dr. Sirajul Islam Medical College Hospital', 2, 'Outer Circular Rd', '+880 2-9351887', 'md.hasanur@gmail.com', '12/3,28 Outer Circula29r Rd, Dhaka30, Bangladesh', 0, 1),
(76, 'Dhaka Mohanagar General Hospital (BabuBazaar)', 1, 'Noyabazar,Bangshal', '02-57390860', 'md.hasanur@gmail.com', 'Dhaka Mohanagar General Hospital,Noyabazar,Bangshal, Dhaka|Bangladesh', 1, 1),
(77, 'Dhaka Eye Care Hospital', 2, 'Uttara', '8912975, 8918409', 'md.hasanur@gmail.com', '32, Robindra Sarani, Sec-7, Uttara, Dhaka', 0, 1),
(78, 'Dhaka Community Hospital', 2, 'Maghbazar', '+88-02-9351190-1, 8314887', 'md.hasanur@gmail.com', '190/1, Baro Moghbazar, Wireless Railgate Dhaka-1217, Bangladesh.', 0, 1),
(79, 'Dhaka Hospital', 2, 'Old Dhaka', '7320212, 7320709, 7310750', 'md.hasanur@gmail.com', '17, DC Roy Road, Mitford, Dhaka', 0, 1),
(80, 'Dhaka Monorogh Clinic', 2, 'Mirpur', '9005050', 'md.hasanur@gmail.com', 'H-13, R-1, BI11/A, Mirpur, Dhaka', 0, 1),
(81, 'Dhaka National Medical College & Hospital', 2, 'Dhaka', '7117300, 7113469, 7123080', 'md.hasanur@gmail.com', '53/1, Johnson Road, Dhaka-1100', 0, 1),
(82, 'Dhaka New Lions Eye Hospital', 2, 'Gulshan', '9884915, 01715112769', 'md.hasanur@gmail.com', 'La-58, Moddha Badda Progoti Sharani (Asian Highway), Gulshan, Dhaka', 0, 1),
(83, 'Dhaka Paediatric-Neonatal & General Hospital', 2, 'Dhanmondi', '8631795, 8614606', 'md.hasanur@gmail.com', 'H-48/A, R-2/A, Dhanmondi R/A, Dhaka-1209', 0, 1),
(84, 'Dustha Sasthya Kendra Hospital', 2, 'Mohammadpur', '8124952', 'md.hasanur@gmail.com', '22/1, Khilzi Road, Mohammadpur, Dhaka-1207', 0, 1),
(85, 'Dhaka Renal Centre & General Hospital', 2, 'Green Road', '8610928, 8621841-2', 'md.hasanur@gmail.com', '5, Green Corner, Green Road, Dhaka-1205', 0, 1),
(86, 'Dhaka Shishu (Children) Hospital', 2, 'Dhaka', '8114571, 81160612', 'md.hasanur@gmail.com', 'Sher-E-Bangla Nagar, -Dhaka', 0, 1),
(87, 'Dhanmondi Hospital (Pvt) Ltd', 2, 'Green Road', '9675522, 9671660', 'md.hasanur@gmail.com', 'House-19/E, Road-6, Green Road, Dhaka', 0, 1),
(88, 'Dhanmondi South East Hospital', 2, 'Dhanmondi', '9671739, 9669904', 'md.hasanur@gmail.com', 'H-25, R-5, Dhanmondi R/A, Dhaka-1205', 0, 1),
(89, 'Dipham Hospital & Research Centre (Pvt) Ltd.', 2, 'Dhanmondi', '8153301, 8125225, 8121460. 9138399, 01552-417225-8,01818-932142-44', 'md.hasanur@gmail.com', 'H-16, R-16 (Old-27?, Dhanmondi R/A. Dhaka', 0, 1),
(90, 'Doctor?s Support Centre', 2, 'Banani', '9870520', 'md.hasanur@gmail.com', 'H-104, R-3, BI-F, Banani, Dhaka-1213', 0, 1),
(91, 'Dr. Salahuddin hospital', 2, 'Wari', '9122264, 9110948', 'md.hasanur@gmail.com', 'H-37, R-9/A, Dhanmondi, Dhaka-1209', 0, 1),
(92, 'Dream Laser Vision', 2, 'Shantinagar', '9344435', 'md.hasanur@gmail.com', 'H-116, Shantinagar, Dhaka', 0, 1),
(93, 'Delta Medical Center Ltd', 2, 'Dhanmondi', '+880 2 8617141-3, 8017151', 'md.hasanur@gmail.com', 'House-20, Road-4, Dhanmondi, Dhaka|', 0, 1),
(94, 'Dhaka Ent (Ear, Nose, Throat) Hospital|', 2, 'Dhanmondi', '+ 880 2 8617503, 9613986', 'md.hasanur@gmail.com', 'House # 56, Road # 4/A, Dhanmondi R/A|', 0, 1),
(95, 'Dhaka Lab Bhaban', 2, 'Mohammadpur', '+880-2-8123832', 'md.hasanur@gmail.com', '1/20, Humayun Road, Mohammadpur, Dhaka', 0, 1),
(96, 'Dhaka Medical College Burn Unit', 1, 'Bakshibazar', '+880-2-8626812-16', 'md.hasanur@gmail.com', 'Bakshibazar, Dhaka', 0, 1),
(97, 'Dr. Salahuddin Hospital', 2, 'Dhanmondi', '+880 2 9122264, 9121779', 'md.hasanur@gmail.com', 'House # 37 Road # 9/A Dhanmondi R.A. Dhaka-1209', 0, 1),
(98, 'Dr. Refatullah Medi Care Centre', 2, 'Dhanmondi', '-9659472', 'md.hasanur@gmail.com', 'House # 3, Road # 3 (3rd Floor), Mirpur Road, Dhanmondi, Dhaka-1205|', 0, 1),
(99, 'Evercare Hospital Dhaka (Past name Apollo Hospitals Dhaka)', 2, 'Bashundhara', '09666-710678', 'md.hasanur@gmail.com', 'Plot: 81, Block: E, Bashundhara R/A, Dhaka 1229, Bangladesh', 1, 1),
(100, 'Enam Medical College & Hospital', 2, 'Savar', '01716358146, 7712425, 7710364, 7711560, 7712424', 'md.hasanur@gmail.com', '9/3, Parbata Nagar, Thana Road, Savar, Dhaka', 0, 1),
(101, 'Eden MultiCare Hospital', 2, 'Dhanmondi', '8150507-10, 8151506', 'md.hasanur@gmail.com', '753, Satmosjid Road, Dhanmondi, Dhaka', 0, 1),
(102, 'Euro Bangla Heart Hospital Ltd.', 2, 'Lalmatia', '8159711, 8159712', 'md.hasanur@gmail.com', '5/7, Block-D, Lalmatia, Dhaka', 0, 1),
(103, 'Eye Care Center', 2, 'Gulshan', '+880-2-8828650', 'md.hasanur@gmail.com', '101 Gulshan Avenue, RM Center (3th floor), Above Agora House', 0, 1),
(104, 'Faith General Hospital (Pvt) Ltd', 2, 'Uttara', '8955133, 0119908903', 'md.hasanur@gmail.com', 'H-65, R-6, Sec-4, Uttara, Dhaka-1230', 0, 1),
(105, 'Farabi General Hospital Ltd', 2, 'Dhanmondi', '9140442, 8122471', 'md.hasanur@gmail.com', 'H-8/3, R-14, Dhanmondi R/A, Dhaka-1209', 0, 1),
(106, 'Fashion Eye Hospital Ltd', 2, 'Moghbazar', '9338986, 9339964', 'md.hasanur@gmail.com', '98J6a, Elephant Road, Moghbazar, Dhaka-1217', 0, 1),
(107, 'Fuad Al-Khatib Hospital & Diagnostic Centre', 2, 'Mirpur', '9004317, 9007188, 8013638, 01711-609616', 'md.hasanur@gmail.com', '2/2, Kalyanpur, Bus Stand, Mirpur Road, Dhaka-1216', 0, 1),
(108, 'Gulshan Maa O Shishu Hospital', 2, 'Gulshan', '8812992, 8822738', 'md.hasanur@gmail.com', 'H-11, R-48, Kamal Ataturk Ave, Gulshan, Dhaka-1212,', 0, 1),
(109, 'Green Life Hospital Ltd.', 2, 'Dhanmondi', '8628820, 8628821, 8611213.', 'md.hasanur@gmail.com', '(Former New All-Razz Hospital) 25/A, Green Road, Dhanmondi, Dhaka', 0, 1),
(110, 'Green Land Hospital Ltd', 2, 'Uttara', '8956886,8915189, 01714-012239', 'md.hasanur@gmail.com', 'H-6, R-1; B, Sec-9. Uttara; Dhaka-1230', 0, 1),
(111, 'Gonoshastho Nagar Hospital', 2, 'Dhanmondi', '8617208, 9673512, 8617383', 'md.hasanur@gmail.com', 'House-14/E. Road-6. Dhanmondi. Dhaka-1205', 0, 1),
(112, 'Gastro Liver Hospital & Research Institute', 2, 'Panthapath', '8620960, 8625393, 8627853', 'md.hasanur@gmail.com', '69/D, Green Road, Panthapath, Dhaka', 0, 1),
(113, 'General Medical Hospital (Pvt), Ltd', 2, 'Elephant Road', '8628890, 8611932', 'md.hasanur@gmail.com', '103, Elephant Road, (Beside Bata Signal) Dhaka-1205', 0, 1),
(114, 'Holy Family Red Crescent Medical College Hospital', 2, 'Eskatan', '+88 02 48311721-5, 01720-595148', 'md.hasanur@gmail.com', 'Eskatan Garden Road, Dhaka 1000, Bangladesh', 1, 1),
(115, 'Health and Hope Ltd.', 2, 'Green Road', '9137076, 9145786, 0189494530', 'md.hasanur@gmail.com', '152/1-H, Green Road, Panthapath, Dhaka', 0, 1),
(116, 'Harun Eye Foundation Ltd & Green Eye Hospital', 2, 'Dhanmondi', '8612412, 8619068', 'md.hasanur@gmail.com', 'H-31, R-6, Dhanmondi R/A, Dhaka.', 0, 1),
(117, 'Ibn Sina Hospital', 2, 'Dhanmondi', '8119513-5, 8113709.', 'md.hasanur@gmail.com', 'House-68, Road-15/A, Dhanmondi R/A, Dhaka', 0, 1),
(118, 'Ibn Sina Trust', 2, 'Dhanmondi', '9128825-7, 9126625-6', 'md.hasanur@gmail.com', 'H-47, R-9/A, Satmasjid Road, Dhanmondi,Dhaka', 0, 1),
(119, 'Islamia Eye Hospital', 2, 'Farmgate', '8112856, 319315, 9119315', 'md.hasanur@gmail.com', 'Farmgate, Dhaka', 0, 1),
(120, 'Islami Bank General Hospital', 2, 'Kakrail', '9355801-2, 9360331-2', 'md.hasanur@gmail.com', '30, VIP Road, Kakrail, Dhaka', 0, 1),
(121, 'Institute of Child Health & Child Hospital', 2, 'Mirpur-2', '8023894-5', 'md.hasanur@gmail.com', '6/2 Bara Bagh Mirpur-2, Dhaka-1216', 0, 1),
(122, 'International Centre for Diarrhoea Disease Research Bangladesh', 2, 'Mohakhali', '+88-2-8860523-32', 'md.hasanur@gmail.com', '68, Shaheed Tajuddin Ahamed Sharani, Mohakhali, Dhaka-1212, ICDDR, B, GPO Box: 128, Dhaka-1000.', 0, 1),
(123, 'International Center for Diarrheal Disease Research (ICDDRB)|Specialty: Child health, infectious diseases & vaccine sciences, reproductive health, nut', 2, 'Mohakhali', '+880 2 8860523-32, 8822467', 'md.hasanur@gmail.com', 'Mohakhali, Dhaka - 1212, Bangladesh', 0, 1),
(124, 'Imdad-Sitara Khan Kidney Centers', 2, 'Mohammadpur', '+880 2 9356841', 'md.hasanur@gmail.com', '20/3, Babar Road (GF), Mohammadpur, Dhaka-1207', 0, 1),
(125, 'Infertility Care & Research Center (ICRC)', 2, 'Mohammadpur', '+880-2-9119462, 9132033, Cell: +880 1715213783', 'md.hasanur@gmail.com', '5/13 Humayun Road, Block - B, Mohammadpur, Dhaka', 0, 1),
(126, 'Ibrahim Cardiac Hospital & Research Institute', 2, 'Shahbagh', '02-9671141-43, 9671145-47, 9674031, Hotline: 01713003004', 'md.hasanur@gmail.com', 'Birdem Hospital Complex. 122, Kazi Nazrul Islam Avenue, Shahbagh, Dhaka', 0, 1),
(127, 'Islami Bank Hospital', 2, 'Shajahanpur', '+880 2 8317090', 'md.hasanur@gmail.com', '34-B, Outer Circular Road, South Shajahanpur, Dhaka', 0, 1),
(128, 'Institute of Child and Mother Health (ICMH)', 2, 'Matuai', '7542672, 7542673, 7542820-3', 'md.hasanur@gmail.com', 'Institute of Child and Mother Health (ICMH) Matuail, Dhaka-1362. Bangladesh', 0, 1),
(129, 'Islamia Arogya Sadan|Category: General Hospital', 2, 'Dhanmondi', '+880 2 8612798, 8629493, 9671612|', 'md.hasanur@gmail.com', 'House #35, Road #1, Dhanmondi R/A, Dhaka-1205, Bangladesh', 0, 1),
(130, 'Impulse Hospital', 2, 'Tejgaon', '02-9831034|01715-016727', 'md.hasanur@gmail.com', '304/E Shaheed Tazuddin Avenue, Tejgaon (Behind Channel-i office) 1208 Dhaka, Bangladesh', 1, 1),
(131, 'Jinjira 20 bed Hospital', 1, 'Keraniganj', '09666-700100', 'md.hasanur@gmail.com', 'Dhaka, Keraniganj, Jinjira 20 bed Hospital', 1, 1),
(132, 'Jahan Ara Clinic (Pvt.) Ltd.', 2, 'Uttara', '+ 880 2 8912929, 8915522', 'md.hasanur@gmail.com', 'House No. 2, Road No. 1, Sector No. 1, Uttara Model Town, Dhaka - 1230', 0, 1),
(133, 'Jabel-E-Nur General Hospital Ltd.', 2, 'Dhanmondi', '+880 2 8117031, 9131300', 'md.hasanur@gmail.com', 'House-21, Road-9/A Dhanmondi, Dhaka.', 0, 1),
(134, 'Japan - Bangladesh Friendship Hospital (JBFH)', 2, 'Jigatola', '+880-2-9672277, 9676161, 9664028, 9664029,+880 1711647877', 'md.hasanur@gmail.com', '55, Satmasjid Road (Jigatola Bustand), Dhaka - 1209, Bangladesh', 0, 1),
(135, 'Jatrabari Eye Hospital', 2, 'Jatrabari', '7551610, 01819549996', 'md.hasanur@gmail.com', '31/C, Shahid Faruque Sarak, Jatrabari, Dhaka-1204 (Gr FI), Dhaka', 0, 1),
(136, 'Jahangirnagar Hospital Ltd', 2, 'Swamibagh', '7125152, 7125153, 7125154,', 'md.hasanur@gmail.com', '34/1, Munir Hossain Lane, Swamibagh, New Road, Dhaka-1100', 0, 1),
(137, 'Kurmitola General Hospital', 1, 'Kurmitola', '+8802 55062350 (For Emergency) 55062201, 55062349', 'md.hasanur@gmail.com', 'New Airport Road, Kurmitola, Dhaka Cantonment, Dhaka-1206.', 1, 1),
(138, 'Kamrangirchar Hospital, Dhaka Division', 1, 'Kamrangirchar', '1712524226', 'md.hasanur@gmail.com', '-', 1, 1),
(139, 'Kidney Foundation Hospital', 2, 'Dhanmondi', '8653410, 9665440', 'md.hasanur@gmail.com', 'House-6, Road-8, Dhanmondi, Dhaka', 0, 1),
(140, 'Kidney Hospital & Dialysis', 2, 'Dhanmondi', '8122019, 9146094', 'md.hasanur@gmail.com', 'Centre H-51/B (New), R-6/A(New) Dhanmondi, Dhaka', 0, 1),
(141, 'Kidney & Urology Hospital (Pvt.) Ltd.', 2, 'Green Road', '9664535, 0152-445272', 'md.hasanur@gmail.com', 'Fattah Plaza. 70, Green Road, Dhaka', 0, 1),
(142, 'Lalkuthi Hospital Mirpur', 1, 'Mirpur', '01712705166 , 02-58810613', 'md.hasanur@gmail.com', '2/A, Mirpur Puraton Colony, Lalkuthi, Mirpur', 1, 1),
(143, 'Labaid|', 2, 'Dhanmondi', '868.8762526', 'md.hasanur@gmail.com', 'House # 6, Road # 4, Dhanmondi, Dhaka - 1205', 1, 1),
(144, 'Lab King General Hospital', 2, 'Uttara', '8920001, 01718458226', 'md.hasanur@gmail.com', 'Unit-1, House-10, Road-7/D, Sec-9, Uttara, Dhaka', 0, 1),
(145, 'Labaid Cardiac Hospital', 2, 'Dhanmondi', '8610793-8, 9670210-3, 8631177', 'md.hasanur@gmail.com', 'H-1, R-4, Dhanmondi, Dhaka-1205', 0, 1),
(146, 'Life Line Urology Centre & General Hospital', 2, 'Green Road', '9140423, 011911403437', 'md.hasanur@gmail.com', '73/1/Ka, Green Road, Dhaka-1205', 0, 1),
(147, 'Lion Dr. Zafar Khan Eye hospital', 2, 'Mirpur-1', '9010866', 'md.hasanur@gmail.com', 'Mirpur 1no Bus Stand East Side, With Baishakhi Super Market, Chayanir Super Market (2nd & 3rd Fl), Mirpur-1, Dhaka', 0, 1),
(148, 'Lion Foundation Eye Hospital', 2, 'Agargaon', '9003088', 'md.hasanur@gmail.com', 'Agargaon, Dhaka', 0, 1),
(149, 'Liver, Gastric, General Hospital & Research Institute.', 2, 'Dhanmondi', '01715-517621, 01712-839047', 'md.hasanur@gmail.com', 'H-100/1,8-11/A, Dhanmondi R/A, Dhaka', 0, 1),
(150, 'Lake view clinic Category: Clinic', 2, 'Gulshan-2', '+880 2 :8814887, 9889277, +880 19114189', 'md.hasanur@gmail.com', 'House- 5, Road-79, Gulshan-2, Dhaka-1212|', 0, 1),
(151, 'Laser Medical Center', 2, 'Dhanmondi', '+880 2 8613767, 01727 001199, 01915 758449', 'md.hasanur@gmail.com', 'Rifles Square, Ground Floor (behind Agora), Road 2 Dhanmondi, Dhaka 1205', 0, 1),
(152, 'Lexus Vision Care', 2, 'Dhaka', '+880-2-8816413', 'md.hasanur@gmail.com', 'Road # 126, House # 39, Islam Mansion, (4th floor), Dhaka, Bangladesh', 0, 1),
(153, 'Liver Foundation of Bangladesh', 2, 'GreenRoad', '+880-2-9146537, 01732999922', 'md.hasanur@gmail.com', '150, ( 2nd Floor ) GreenRoad, Panthapath, Dhaka - 1215, Bangladesh', 0, 1),
(154, 'Mugda Medical College and Hospital', 1, 'Mugda', '01553-306518 , +88027276032', 'md.hasanur@gmail.com', 'Hazi Kadam Ali Rd, Mugda, Dhaka-1214, Bangladesh', 1, 1),
(155, 'Marks General Hospital', 2, 'Mirpur', '9871527', 'md.hasanur@gmail.com', 'Sector ? 14, Mirpur, Dhaka', 0, 1),
(156, 'Medical College for Womens & Hospital', 2, 'Uttara', '8924358, 8916005, 8913939', 'md.hasanur@gmail.com', 'Plot-4, R-8/9, Sec-4, Uttara, Dhaka-1230', 0, 1),
(157, 'Mediprime Orthopaedic & General Hospital', 2, 'College Gate', '9138086, 9139226', 'md.hasanur@gmail.com', 'College Gate, Dhaka', 0, 1),
(158, 'Meghna General Hospital', 2, 'Waiz Ghat', '7393235, 7394371', 'md.hasanur@gmail.com', '3/A/7, Simson Road, Waiz Ghat, Dhaka', 0, 1),
(159, 'Mental Health Care', 2, 'Mohammadpur', '-', 'md.hasanur@gmail.com', '19/12, Babor Road, Mohammadpur, Dhaka', 0, 1),
(160, 'Metropolitan Medical Centre Ltd.', 2, 'Mohakhali', '8824155, 9887922', 'md.hasanur@gmail.com', '46, Sahid Taj Uddin Ahmed Sarani, Mohakhali, Dhaka', 0, 1),
(161, 'Millennium Heart & General Hospital Ltd.', 2, 'Lalmatia', '9122115, 8120097, 9124046', 'md.hasanur@gmail.com', '4/9, Block-F, Lalmatia, Dhaka', 0, 1),
(162, 'Mirpur Adhunik Hospital Ltd', 2, 'Mirpur', '8016794', 'md.hasanur@gmail.com', 'House-21, Road-5, Sec-V, Pallabi, Mirpur, Dhaka-1216', 0, 1),
(163, 'Mirpur Diagnostic Centre Ltd', 2, 'Mirpur', 'Unit ? 01: +88029007678, +8809012274,+8801915448491, Unit -02 :+88028034157,+8801915448500', 'md.hasanur@gmail.com', 'Unit -01 : House# 01, Road# 02, Block# B, Section# 10, Mirpur, Dhaka1216 |Unit -02 : Janani Complex, 21 Darus Salam Road (South Bishil), Section# 1, Mirpur, Dhaka-1216 ', 0, 1),
(164, 'Mukti Mental Hospital Drug & Alcohol Treatment Center ', 2, 'Gulshan-2', '8814562, 9883991', 'md.hasanur@gmail.com', 'H-2, R-4/9, Gulshan-2, Dhaka-1212', 0, 1),
(165, 'Mother Care Hospital (Pvt) Ltd', 2, 'Mirpur', '9119355, 9142155', 'md.hasanur@gmail.com', '3/10, Lalmatia, BI-A, Mirpur Road, Dhaka-1207', 0, 1),
(166, 'Monowara Hospital (Pvt) Ltd', 2, 'Siddeshwari', '8318135, 8318529', 'md.hasanur@gmail.com', '54, Siddeshwari Road, Dhaka-1217', 0, 1),
(167, 'Monon Psychiatry Hospital|', 2, 'Mohammadpur', '9114550', 'md.hasanur@gmail.com', '20/20, Tajmahal Road, Mohammadpur, Dhaka', 0, 1),
(168, 'Mojibunnessa Eye Hospital Ltd Dhaka', 2, 'Dhanmondi', '9130638, 9130701', 'md.hasanur@gmail.com', 'H-11 (New), R-28 (Old), 25 (New), Dhanmondi R/A', 0, 1),
(169, 'Mohona Hospital & Diagnostic Center Ltd ', 2, 'Savar', '7712253, 01819911265', 'md.hasanur@gmail.com', 'B-2/1, Rajanath Farmd Road. Bank Colony Savar. Dhaka-1340 ', 0, 1),
(170, 'Module General Hospital ', 2, 'Paribagh', '8610512, 8616083', 'md.hasanur@gmail.com', '1/G/3, Paribagh, Dhaka-1000', 0, 1),
(171, 'Modern Psychiatry Hospital', 2, 'Farmgate', '9131958, 8153505', 'md.hasanur@gmail.com', '150, Monipuripara Farmgate, Dhaka', 0, 1),
(172, 'Mirpur Holy Crescent Hospital Pvt Ltd', 2, 'Mirpur-1', '9000633', 'md.hasanur@gmail.com', '33, South Bishal, Mirpur-1, Dhaka-1216', 0, 1),
(173, 'Marie Stopes ', 2, 'Lalmatia', '+880-2-8114392, +880-2-8114394, +880-2-912120', 'md.hasanur@gmail.com', 'House # 6/2, Block-F, Lalmatia Housing Estate, Dhaka-1207, Bangladesh', 0, 1),
(174, 'Medi Aid Clinic Ltd', 2, 'Kalabagan', '+880 2 8118456, 8117043, 9112076', 'md.hasanur@gmail.com', '62, Lake Circus, Kalabagan, Dhaka-1205', 0, 1),
(175, 'Medinet Medical', 2, 'Mirpur', '+880-2-9003681, 8019910', 'md.hasanur@gmail.com', '15, Sweeden Plaza, Section-1, Mirpur, Dhaka', 0, 1),
(176, 'Medinova Medical Services', 2, 'Malibagh', '+880 2 8333811-3', 'md.hasanur@gmail.com', '6/9, Outer Cricular Road, Malibagh More, Dhaka- 1217, Bangladesh', 0, 1),
(177, 'Medinova Medical Services Ltd.', 2, 'Dhanmondi', '+880-2- 8624907-10, 01768122393', 'md.hasanur@gmail.com', 'House-71/A, Road-5/A, Dhanmondi, Dhaka - 1209, Bangladesh ', 0, 1),
(178, 'Medison Diagnostic Center', 2, 'Mirpur-1', '+880-2-9002292, 9000089', 'md.hasanur@gmail.com', '3, Darus Salam Road, Mirpur', 0, 1),
(179, 'Metropolitan Dental ', 2, 'Hatirpul', '+880-2-8625317, 01711-335979', 'md.hasanur@gmail.com', '43 Sonargaon Road, Hatirpul', 0, 1),
(180, 'Metropolitan Medical Center ', 2, 'Mohakhali', '+880 2 9897933, 9899209', 'md.hasanur@gmail.com', '46, Shahid Tajuddin Sarani, Mohakhali, Dhaka', 0, 1),
(181, 'Midway Clinic ', 2, 'Gulshan-1', '+880 2 601904,600960', 'md.hasanur@gmail.com', 'House-7/C, Road 127, Gulshan-1, Dhaka', 0, 1),
(182, 'Mirpur Adhunik Hospital', 2, 'Mirpur', '-8015916', 'md.hasanur@gmail.com', 'House # 20-21, Road # 5 Section 12/ \'Dha\' , Mirpur Pallabi, Dhaka # 1216, Bangladesh|', 0, 1),
(183, 'Mirpur General Hospital ', 2, 'Mirpur', '+880 2 8015444, 9007873', 'md.hasanur@gmail.com', 'House # 35, Road # 1, Section- 10, Mirpur, Dhaka - 1216. Bangladesh', 0, 1),
(184, 'Montys Dental Clinic', 2, 'Hatirpool', '+880-2-9661535, 8613056', 'md.hasanur@gmail.com', '43 Sonargaon Road, Hatirpool, Dhaka - 1205', 0, 1),
(185, 'National Chest Infectious Diseases Hospital (NIDCH)', 1, 'Mohakhali,', '88-02-55067131 - 40', 'md.hasanur@gmail.com', ' National Institute of Diseases of the Chest and HospitalMohakhali, Dhaka, Bangladesh', 1, 1),
(186, 'Nari Moitri (Urban Primary Health Care Centre) ', 2, 'Maghbazar', '8360756', 'md.hasanur@gmail.com', '312, Boro Maghbazar, Dhaka-1217', 0, 1),
(187, 'National Psychiatry Hospital', 2, 'Sher-E-Bangla Nagar', '9111352, 9118171', 'md.hasanur@gmail.com', 'Sher-E-Bangla Nagar Dhaka-1207', 0, 1),
(188, 'National Institute of Kidney Diseases', 2, 'Sher-E-Bangla Nagar', '9134022, 9135690-4, Fax: 88-2-9114954', 'md.hasanur@gmail.com', 'Sher-E-Bangla Nagar Dhaka-1207', 0, 1),
(189, 'National Institute Of Diseases of the Chest & Hospital', 2, 'Mohakhali', '8816268', 'md.hasanur@gmail.com', 'TB Gate Mohakhali, Dhaka-1212', 0, 1),
(190, 'National Institute of Cardiovascular Diseases', 2, 'Sher-E-Bangla Nagar', '8120033', 'md.hasanur@gmail.com', 'Sher-E-Bangla Nagar, Dhaka-1207', 0, 1),
(191, 'National Institute of Ophthalmology ', 2, 'Sher-E-Bangla Nagar', '9131606', 'md.hasanur@gmail.com', 'Sher-E-Bangla Nagar, Dhaka.', 0, 1),
(192, 'National Heart Foundation Hospital & Research Institute', 2, 'Mirpur', '8061314-6, 8053935-6', 'md.hasanur@gmail.com', 'Plot-7/2, Section-2, Mirpur, Dhaka-1216', 0, 1),
(193, 'National Care General Hospital ', 2, 'Mohammadpur', '8126366, 01711-024949', 'md.hasanur@gmail.com', '13/A/8a, Babar Road, BI-B, Shamoly, Mohammadpur, Dhaka-1207', 0, 1),
(194, 'National Eye Science Institute & Hospital', 2, 'Sher-E-Bangla Nagar', '-', 'md.hasanur@gmail.com', 'Shre-E-Bangla Nagar, Dhaka - 1207', 0, 1),
(195, 'National Institute of Cancer Research and Hospital (NICRH)', 2, 'Mohakhali', '+880-2-8111169', 'md.hasanur@gmail.com', 'Mohakhali, Dhaka-1212, Bangladesh', 0, 1),
(196, 'National Institute of Preventive and Social Medicine (NIPSOM)', 2, 'Mohakhali', '+ 880-2-8821236, 9898798', 'md.hasanur@gmail.com', 'Mohakhali, Dhaka-1212', 0, 1),
(197, 'National Institute of Cardiovascular Diseases (NICVD)', 2, 'Sher-E-Bangla Nagar', '+880 2 9111881', 'md.hasanur@gmail.com', 'Sher-e-Bangla Nagar, Dhaka-1207', 0, 1),
(198, 'National Institute of Mental Health', 2, 'Sher-E-Bangla Nagar', '+880 2 9118171', 'md.hasanur@gmail.com', 'Sher-e-Bangla Nagar, Dhaka-1207', 0, 1),
(199, 'National Medical & Hematology Centre', 2, 'Mohammadpur', '-', 'md.hasanur@gmail.com', ' 2/1 , Babor Road, Mohammadpur, Dhaka-1207', 0, 1),
(200, 'New Al-Raji Hospital (Pvt.) Ltd|Category: General ', 2, 'Dhanmondi', '+ 880 2 8628820, 8628821', 'md.hasanur@gmail.com', '25/A, Green Road, Dhanmondi. City, Dhaka - 1205', 0, 1),
(201, 'New Capital Clinic', 2, 'Mohammadpur', '+880-2-9133729', 'md.hasanur@gmail.com', '3/12, Humayun Road, College Gate, Mohammadpur, Dhaka-1207', 0, 1),
(202, 'New Welcare Hospital', 2, 'Mohammadpur', '+880 01712589591, 01746660834', 'md.hasanur@gmail.com', '19/1 Block-B, Babor Road, Mohammadpur, Dhaka-1207', 0, 1),
(203, 'North South Medical Centre', 2, 'Mohammadpur', '+880-2-9126089', 'md.hasanur@gmail.com', '19/10, Babor Road, Mohammadpur, Dhaka-1207', 0, 1),
(204, 'Northern International Medical College & Hospital ', 2, 'Dhanmondi', '+880-2-8156914, 8156839, 9133505, 9111381, +880 16740584355', 'md.hasanur@gmail.com', 'House # 84, Road # 8/A (Old), Dhanmondi, dhaka - 1209', 0, 1),
(205, 'O S B Eye Hospital', 2, 'Mirpur', '9003088', 'md.hasanur@gmail.com', 'Mirpur, Dhaka,', 0, 1),
(206, 'Oncology Centre & General Hospital', 2, 'Lalmatia', '8118138, 9116216', 'md.hasanur@gmail.com', 'H-2/8, R-3, BI-A, Lalmatia, Dhaka-1207', 0, 1),
(207, 'Padma General Hospital Ltd.', 2, 'Sonargoan', '9661528, 9662502, 8620889-90', 'md.hasanur@gmail.com', '290, Sonargoan Road, Dhaka', 0, 1),
(208, 'Paedihope Hospital', 2, 'Dhanmondi', '88-02-9671345, 9671375', 'md.hasanur@gmail.com', 'H-32/A, R-6, Dhanmondi, Dhaka', 0, 1),
(209, 'Pan Pacific Hospital ', 2, 'Shajahanpur ', '9349734, 9351777, 9351476', 'md.hasanur@gmail.com', '24 Outer Circular Road, Dhaka', 0, 1),
(210, 'Pancake Hospital Ltd.', 2, 'Dhanmondi', '8158394, 9142422', 'md.hasanur@gmail.com', 'Dhanmondi Tower. H-4/A, R-16(Old-27), Dhanmondi R/A, Dhaka', 0, 1),
(211, 'Panorama Hospital Ltd', 2, 'Dhanmondi', '8613168, 9668961-63', 'md.hasanur@gmail.com', 'H-16, R-8, Dhanmondi R/A, Dhaka-1205', 0, 1),
(212, 'Parkway General Hospital Ltd.', 2, 'Rajarbagh', '9340275, 9341499', 'md.hasanur@gmail.com', '1, Momenbagh. Rajarbagh Police Line. Dhaka', 0, 1),
(213, 'Pentastar Hospital ', 2, 'Dhanmondi', '9113131, 9143515, 8151394', 'md.hasanur@gmail.com', '16/A, Lake Circus, Kalabagan, Dhanmondi, Dhaka-1205', 0, 1),
(214, 'Pioneer General Hospital & Dental ', 2, 'Malibagh', '9340204', 'md.hasanur@gmail.com', 'College 111 Malibagh DIT Road, Dhaka-1217', 0, 1),
(215, 'Prashanti Hospital ltd', 2, 'Malibagh', '8318699, 9348728', 'md.hasanur@gmail.com', '3, Outer Circular Road. Malibagh, Dhaka', 0, 1),
(216, 'Popular Diagnostic Centre English Road', 2, 'English Road|', '+8802 7115071, +8801930-021943, +8801930-021946', 'md.hasanur@gmail.com', '2 NO. ENGLISH ROAD, DHAKA', 0, 1),
(217, 'Popular Diagnostic Centre Shyamoli', 2, 'Shyamoli', '+8802 9111911', 'md.hasanur@gmail.com', '22/7 A S M Nuruzzaman Road, Block-B, Babor Road, Mohammadpur, Dhaka-1207', 0, 1),
(230, 'Royal Hospital ', 2, 'Mirpur', '9007371', 'md.hasanur@gmail.com', 'H-2, R-7, BI-6, Sec-6, Mirpur, Dhaka-1216', 0, 1),
(231, 'RMC Hospital & Diagnostic Complex Ltd ', 2, 'Uttara', '8923904, 8952157', 'md.hasanur@gmail.com', 'H-19, R-5, Sec-7, Uttara Model Town, Uttara, Dhaka-1230', 0, 1),
(232, 'Renal Hospital & Dialysis Centre ', 2, 'Dhanmondi', '9146094, 8122019', 'md.hasanur@gmail.com', 'H-51/B (New), Road-6/A (New), Dhanmondi, Dhaka-1209 ', 0, 1),
(233, 'Renaissance Hospital & Research Institute Ltd ', 2, 'Dhanmondi', '9664930', 'md.hasanur@gmail.com', 'H-60/A, R-4/A, Dhanmondi, Dhaka-1205', 0, 1),
(234, 'Rafai General Hospital ', 2, 'Chankharpool', '7300977', 'md.hasanur@gmail.com', '81/B-2, Hosni Dalan Road, Chankharpool, Dhaka-1211,', 0, 1),
(235, 'Sheikh Hasina National Burn and Plastic Surgery Institute', 1, 'Chankharpool (Old Dhaka)', '1819220180', 'md.hasanur@gmail.com', 'Chankharpool, Dhaka Metropolitan City, Dhaka', 1, 1),
(236, 'Shaheed Suhrawardy Medical College & Hospital', 1, 'Sher-e-Bangla Nagor, Dhaka', '02-8144048 ,8114856, 9130800-19', 'md.hasanur@gmail.com', 'Sher-E-Bangla Nagar, Dhaka-1207', 1, 1),
(237, 'Sajida Foundation Hospital', 2, 'Gulshan 1', '+8802-9890513,  +8802-9851511', 'md.hasanur@gmail.com', 'OTOBI Center, 5th floor, plot 12,|Block CWS(C), Gulshan South Avenue,Gulshan 1, Dhaka 1212', 1, 1),
(238, 'SIBL Hospital', 2, 'Panthapath', '01991-150900', 'md.hasanur@gmail.com', '70 Green Road, Panthapath Moor, Dhaka 1205 Dhaka, Bangladesh', 1, 1),
(239, 'Square Hospital', 2, 'West Panthapath', '+8802-8159457 (10 Numbers), +8802-8142431 (10 Numbers)', 'md.hasanur@gmail.com', '18/F Bir Uttam Qazi Nuruzzaman Sarak, West Panthapath, Dhaka - 1205, Bangladesh', 1, 1),
(240, 'Shahabuddin Medical College and Hospital', 2, 'Gulshan-2', '01915-055555', 'md.hasanur@gmail.com', 'Road-113/A, House-12,15,16 Gulshan-2', 1, 1),
(241, 'S. Rahman Hospital Ltd Syeed Grand Center, (Basement) ', 2, 'Uttara', '8951928, 8950244, 01712691732,01714710344', 'md.hasanur@gmail.com', 'Plt-89, R 28, Sec-7, Uttara, Dhaka-1230', 0, 1),
(242, 'S.P.R.C & General Hospital', 2, 'New Eskaton', '9339089, 9342744, 8313185', 'md.hasanur@gmail.com', '135, New Eskaton Road, Dhaka-1000', 0, 1),
(243, 'Salauddin Al-Shifa General Hospital Ltd.', 2, 'Hatkhola (Old Dhaka)', '7168411, 7167974', 'md.hasanur@gmail.com', 'Salauddin Bhaban. 44/A, Hatkhola Road, Dhaka', 0, 1),
(244, 'Salimullah Hospital (Pvt) Ltd', 2, 'Savar', '7712285, 01712049857', 'md.hasanur@gmail.com', 'Aricha Road. Savar, Dhaka', 0, 1),
(245, 'Salvation Specialised hospital & research ltd. ', 2, 'Dhanmondi', '9674114. 01715603666, 01715602115-6', 'md.hasanur@gmail.com', 'H-36, R-03, Dhanmondi R/A, Dhaka', 0, 1),
(246, 'Samorita Hospital Ltd', 2, 'Panthapath', '9131901, 9129971', 'md.hasanur@gmail.com', '89/1, Panthapath, Dhaka', 0, 1),
(247, 'Selina General Hospital & Diagnostic Centre', 2, 'Mirpur', '9007827, 9015821, 8016477, 017115818883', 'md.hasanur@gmail.com', 'Almas Tower, 282/1, First Colony, Mazar Road, Mirpur, Dhaka', 0, 1),
(248, 'SPRC & General Hospital ', 2, 'New Eskaton', '8614545-9, 9675187', 'md.hasanur@gmail.com', '135, New Eskaton Road, Dhaka-1000 ', 0, 1),
(249, 'Sir Salimullah Medical College Mitford, Dhaka-1100, Bangladesh', 1, 'Old Dhaka', '7315076, 7314786', 'md.hasanur@gmail.com', 'College Mitford, Dhaka-1100, Bangladesh', 0, 1),
(250, 'Sheba General Hospital ', 2, 'Chankharpool (Old Dhaka)', '7300903, 01711194029', 'md.hasanur@gmail.com', '72/75, Mazed Sarder Sarak, Chankharpool, Dhaka', 0, 1),
(251, 'South Asian Hospital Ltd. ', 2, 'Panthapath', '8616565, 9665852', 'md.hasanur@gmail.com', '69/E, Panthapath, Green Road, Dhaka', 0, 1),
(252, 'Sumona Hospital ', 2, 'Old Dhaka', '7115531, 7112583, 9561786', 'md.hasanur@gmail.com', '3, 4, Patuatuli, Sadar Ghat; Dhaka-1100', 0, 1),
(253, 'The Barakah Hospital & Research Institute Ltd', 2, 'New Eskaton', '9350884, 9351164, 9337521', 'md.hasanur@gmail.com', '129, New Eskaton Road, Dhaka-1000', 0, 1),
(254, 'The Barakah Hospital Ltd. ', 2, 'Rajarbagh', '9337534, 9346265, 8317765, 8354854', 'md.hasanur@gmail.com', '937, Outer Circular Road, Rajarbagh, Dhaka-1217', 0, 1),
(255, 'The Kidney Hospital & Dialysis Centre ', 2, 'Kalabagan', '8122019, 8123056', 'md.hasanur@gmail.com', '161/A, Kalabagan, Dhaka-1205', 0, 1),
(256, 'United Hospital', 2, 'Gulshan ', '10666, 9852466, +880 1914 001234', 'md.hasanur@gmail.com', 'plot 15, Road 71, Gulshan|Dhaka 1212, Bangladesh', 1, 1),
(257, 'University Dental College & Hospital', 2, 'Maghbazar', '937417, 9350575', 'md.hasanur@gmail.com', '120/A, Siddeshwari, Outer Circular Road, Century Arced, Maghbazar, Dhaka-1217', 0, 1),
(258, 'Uposhom Health Complex (Pvt) Ltd ', 2, 'Uttar Badda', '8815690, 9887597, 01711970526, 01819-101613', 'md.hasanur@gmail.com', 'Cha-107/1, Uttar Badda, Badda, Dhaka-1212', 0, 1),
(260, 'Uttara Crescent Hospital', 2, 'Uttara', '8932430, 8912744, 01714040695,0171642633', 'md.hasanur@gmail.com', 'H-21, R-15, Sec-3, Robindra Sarani, Uttara, Dhaka-1230', 0, 1),
(261, 'Vision Eye Hospital ', 2, 'Lalmatia', '8113302', 'md.hasanur@gmail.com', '4/2, Lalmatia, BI-D, Dhaka', 0, 1),
(262, 'Welcare Hospital ', 2, 'Rampura', '01819-004380, 01712-0011325', 'md.hasanur@gmail.com', '1/2, Hazi Para, DIT Road, Rampura, Dhaka', 0, 1),
(263, 'Zainul Haque Sikder Cardiac Care & Research Center ', 2, 'Gulshan-2', '9887458, 8815363', 'md.hasanur@gmail.com', 'H-5, R-10/A, Gulshan-2, Dhaka-1212', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `is_approved` int(11) NOT NULL,
  `secret_code` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `is_active`, `role`, `hospital_id`, `is_approved`, `secret_code`, `created_at`) VALUES
(3, 'Ruhul Amin', 'abdul@gmail.com', '123456', '0171919116511', '123456', 1, 1, 1, 1, 'ee59cb0cd3202c1b9a7e788ac07e6444', '2020-07-04 14:28:08'),
(8, 'Abul kalam', 'kalam1@gmail.com', '1234561', '011311651151', '1234561', 1, 1, 1, 0, 'f47c176e71801380ae785538ea31da47eebeef1e', '2020-07-04 17:46:35'),
(9, 'Abul kalam', 'kalam3@gmail.com', '1234561', '0113131651151', '1234561', 1, 1, 2, 1, '72b9fdd75f33fff4585a9de15149f50fa8cb598a', '2020-07-04 17:49:19'),
(10, 'Abul kalam', 'kalam44@gmail.com', '1234561', '01131341651151', '1234561', 1, 1, 2, 0, 'ec3e35b7c5f2c5281dff7f33ae255432e47ae517', '2020-07-04 19:11:45'),
(11, 'Abul kalam', 'kalzam44@gmail.com', '1234561', '0113134d1651151', '1234561', 1, 1, 2, 0, '371f9f263556ff794234b072bbe9cb067cd7bcfa', '2020-07-04 19:14:23'),
(12, 'Abul kalam', 'kalzamd44@gmail.com', '1234561', '011313d4d1651151', '1234561', 1, 1, 2, 0, '9aadc4a8db3284e04948134bdb426c8f04a5c0f0', '2020-07-04 19:15:59'),
(13, 'Abul kalam', 'kalzamdd44@gmail.com', '1234561', '01131d3d4d1651151', '1234561', 1, 1, 2, 0, '463fcf0ecd5164d8c6ab7e07ab0cbe87d214a580', '2020-07-04 19:17:16'),
(14, 'Abul kalam', 'kalzamddd44@gmail.com', '1234561', '1d3d4d1651151', '1234561', 1, 1, 2, 0, 'dc4a4acafcc4af3dc0e49bf7a3a691dabb8f3fe0', '2020-07-04 19:18:27'),
(15, 'Abul kalam', 'kmddd44@gmail.com', '1234561', '1d3d4ds1651151', '1234561', 1, 1, 2, 0, 'eb3c50f5e3ce4cf55eca86b2e4794485fb6ef35f', '2020-07-04 19:19:31'),
(16, 'Abul kalam', 'kmdtestdd44@gmail.com', '1234561', '14ds1651151', '1234561', 1, 1, 2, 0, '7f907a27bb47db60853bf14c5d7336ac6dcbec38', '2020-07-04 19:21:09'),
(17, 'Abul kalam', 'kmdtesdddddtdd44@gmail.com', '1234561', '14ds1ddd651151', '1234561', 1, 1, 2, 0, '056cda5a142f58898cd1a82d2e21d196e7a3823c', '2020-07-04 19:22:47'),
(19, 'Hasanur Rahaman', 'md.hasanur@gmail.com', 'abcd1234', '+8801717064021', 'abcd1234', 1, 2, 1, 1, '687a83d10ae01cacf5979241b7b6e9be5d515b67', '2020-07-16 08:23:27'),
(21, 'admin', 'hospitaladmin@gmail.com', 'hpadmin', '01919191919', 'asd123456', 1, 2, 1, 0, '71b399dab8a786e21a8bef638961cca2f22c10c4', '2020-07-16 07:43:17'),
(27, 'p', 'p@gg.vv', 'asd123456', '01919191917', 'asd123456', 1, 1, 1, 0, 'b9cc237c14adb223bf1d989b8a8c072fe7a5224c', '2020-07-11 08:10:40'),
(29, 'p', 'p@k.k', 'asd123456', '01919181918', 'asd123456', 1, 1, 1, 0, 'd5b01f520f7542f566ab2199e497e99a66b718b5', '2020-07-11 12:03:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cabin_info`
--
ALTER TABLE `cabin_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `current_cabin_space`
--
ALTER TABLE `current_cabin_space`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital_info`
--
ALTER TABLE `hospital_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cabin_info`
--
ALTER TABLE `cabin_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `current_cabin_space`
--
ALTER TABLE `current_cabin_space`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hospital_info`
--
ALTER TABLE `hospital_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
