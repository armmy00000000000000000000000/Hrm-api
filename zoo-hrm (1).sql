-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 16, 2025 at 02:32 AM
-- Server version: 8.0.36
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zoo-hrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `id` int NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `detail_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `work_end_time` time DEFAULT '17:00:00' COMMENT 'เวลาเลิกงานของแต่ละหน่วยงาน',
  `status` tinyint DEFAULT '1' COMMENT '1 = เปิดใช้งาน, 0 = ปิด',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`id`, `code`, `name`, `name_en`, `detail`, `detail_en`, `work_end_time`, `status`, `created_at`, `updated_at`) VALUES
(1, '01', 'สวนสัตว์เปิดเขาเขียว', 'Khao Kheow Open Zoo', 'สวนสัตว์เปิดเขาเขียว', 'Khao Kheow Open Zoo very big', '16:30:00', 1, '2025-06-20 15:05:27', '2025-06-20 15:05:27'),
(2, '02', 'สวนสัตว์เชียงใหม่', 'Chiangmai Zoo', 'สวนสัตว์เชียงใหม่', 'Chiangmai Zoo', '16:30:00', 1, '2025-06-20 15:05:27', '2025-06-20 15:05:27'),
(3, '03', 'สวนสัตว์นครราชสีมา', 'Nakhon Si Thammarat Zoo', 'สวนสัตว์นครราชสีมา', 'Nakhon Si Thammarat Zoo', '16:30:00', 1, '2025-06-20 15:05:27', '2025-06-20 15:05:27'),
(4, '04', 'สวนสัตว์อุบลราชธานี', 'Ubon Ratchathani Zoo', 'สวนสัตว์อุบลราชธานี', 'Ubon Ratchathani Zoo', '16:30:00', 1, '2025-06-20 15:05:27', '2025-06-20 15:05:27'),
(5, '05', 'สวนสัตว์ขอนแก่น', 'Khon Kaen Zoo', 'สวนสัตว์ขอนแก่น', 'Khon Kaen Zoo', '16:30:00', 1, '2025-06-20 15:05:27', '2025-06-20 15:05:27'),
(6, '06', 'สวนสัตว์สงขลา', 'Songkhla Zoo', 'สวนสัตว์สงขลา', 'Songkhla Zoo', '16:30:00', 1, '2025-06-20 15:05:27', '2025-06-20 15:05:27'),
(7, NULL, 'บริษัท แอดเพย์ เซอร์วิสพอยท์ จำกัด', NULL, NULL, NULL, '17:00:00', 1, '2025-06-20 15:05:27', '2025-06-20 15:05:27'),
(8, NULL, 'องค์การสวนสัตว์แห่งประเทศไทย', NULL, NULL, NULL, '17:00:00', 1, '2025-07-09 10:59:55', '2025-07-09 10:59:55'),
(9, NULL, 'test name', NULL, 'test detall', NULL, '17:00:00', 1, '2025-07-11 08:40:08', '2025-07-11 08:40:08'),
(10, NULL, 'เทศบาล', NULL, '1111', NULL, '17:00:00', 1, '2025-07-12 02:42:33', '2025-07-12 02:42:33'),
(11, NULL, 'สำนักงานสวนสัตว์', NULL, 'สำนักงานสวนสัตว์', NULL, '17:00:00', 1, '2025-07-12 02:51:13', '2025-07-12 02:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int NOT NULL,
  `status` enum('expired','active') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expiration_date` datetime NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `status`, `token`, `expiration_date`, `user_id`) VALUES
(700, 'active', 'PJV||5YWPcFGJdogl5nVXS1Wk46vVbzqMMZXK3LhYBfll', '2025-07-12 10:34:33', 1),
(708, 'active', 'PJV||YZqvPSZitAHOIP4JO2JytAAgRnftOwvXPCAyrcjK', '2025-07-12 17:19:05', 23);

-- --------------------------------------------------------

--
-- Table structure for table `management_departments`
--

CREATE TABLE `management_departments` (
  `id` int NOT NULL,
  `department_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `agency_id` int DEFAULT NULL COMMENT 'id หน่วยงาน '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_employees`
--

CREATE TABLE `management_employees` (
  `id` int NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_general_ci,
  `photo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `work_location_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_employee_family`
--

CREATE TABLE `management_employee_family` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `relation_type` enum('ผู้ติดต่อฉุกเฉิน','ผู้รับผลประโยชน์') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `relationship` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_employment_history`
--

CREATE TABLE `management_employment_history` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `note` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_positions`
--

CREATE TABLE `management_positions` (
  `id` int NOT NULL,
  `position_code` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position_title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level_description` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_work_locations`
--

CREATE TABLE `management_work_locations` (
  `id` int NOT NULL,
  `location_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `address` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int NOT NULL,
  `menu_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `icons` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_name`, `icons`, `details`) VALUES
(1, 'employee_management', 'fas fa-users', 'จัดการข้อมูลพื้นฐานของพนักงาน'),
(2, 'recruitment_onboarding', 'fas fa-briefcase', 'ระบบรับสมัครงานและบันทึกข้อมูลพนักงานใหม่'),
(3, 'attendance_leave', 'fas fa-calendar-check', 'ระบบบันทึกเวลาเข้าออก และการลา'),
(4, 'payroll_benefits', 'fas fa-money-check-alt', 'คำนวณเงินเดือนและสิทธิประโยชน์'),
(5, 'performance_management', 'fas fa-chart-line', 'การตั้ง KPI และประเมินผลพนักงาน'),
(6, 'training_development', 'fas fa-chalkboard-teacher', 'ระบบอบรมและพัฒนาศักยภาพ'),
(7, 'document_management', 'fas fa-file-contract', 'เก็บเอกสารต่าง ๆ ที่เกี่ยวข้องกับพนักงาน'),
(8, 'internal_communication', 'fas fa-bullhorn', 'ระบบประกาศและการสื่อสารภายในองค์กร'),
(9, 'reports_analytics', 'fas fa-chart-bar', 'รายงานการลา เงินเดือน และสถิติต่าง ๆ'),
(10, 'Resource', 'fas fa-chart-bar', 'ตั้งค่าระบบ'),
(12, 'dashboard', NULL, 'รายงานต่าง ๆ ของระบบ hrm');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int NOT NULL,
  `position_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `departments_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_onboarding_applicants`
--

CREATE TABLE `recruitment_onboarding_applicants` (
  `id` int NOT NULL,
  `job_post_id` int DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resume_file` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apply_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('รอพิจารณา','ผ่านรอบแรก','ไม่ผ่าน','รอสัมภาษณ์','รับเข้าทำงาน') COLLATE utf8mb4_general_ci DEFAULT 'รอพิจารณา'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_onboarding_applicant_interviews`
--

CREATE TABLE `recruitment_onboarding_applicant_interviews` (
  `id` int NOT NULL,
  `applicant_id` int DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interviewer_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_general_ci,
  `result` enum('ผ่าน','ไม่ผ่าน','รอผล') COLLATE utf8mb4_general_ci DEFAULT 'รอผล'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_onboarding_job_posts`
--

CREATE TABLE `recruitment_onboarding_job_posts` (
  `id` int NOT NULL,
  `position_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `agency_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `requirements` text COLLATE utf8mb4_general_ci,
  `posted_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status` enum('เปิดรับสมัคร','ปิดรับสมัคร') COLLATE utf8mb4_general_ci DEFAULT 'เปิดรับสมัคร'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_onboarding_onboarded_employees`
--

CREATE TABLE `recruitment_onboarding_onboarded_employees` (
  `id` int NOT NULL,
  `applicant_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `onboard_date` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_roles` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `detall` text COLLATE utf8mb4_general_ci NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_roles`, `name`, `detall`, `datetime`) VALUES
(1, 'admin', 'รายการแสดงผล ส่วนผู้ดูแลระบบ', '2025-07-11 06:58:56'),
(2, 'HR', 'การบริหารจัดการทรัพยากรมนุษย์ (Human Resource Management : HRM)', '2025-07-11 06:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `sub_menus`
--

CREATE TABLE `sub_menus` (
  `id` int NOT NULL,
  `menu_id` int NOT NULL,
  `sub_menu_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `details` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_menus`
--

INSERT INTO `sub_menus` (`id`, `menu_id`, `sub_menu_name`, `details`) VALUES
(1, 1, 'personal_info', 'ข้อมูลส่วนตัว'),
(2, 1, 'job_and_department', 'ข้อมูลฝ่ายและตำแหน่ง'),
(3, 1, 'work_history', 'ประวัติและประสบการณ์ก่อนเข้าบริษัท'),
(4, 1, 'family_info', 'ผู้ติดต่อฉุกเฉิน และผู้รับผลประโยชน์'),
(5, 2, 'job_postings', 'ลงประกาศและจัดการตำแหน่งงาน'),
(6, 2, 'application_tracking', 'บันทึกและติดตามสถานะใบสมัคร'),
(7, 2, 'interview_evaluation', 'ระบบจัดการสัมภาษณ์'),
(8, 2, 'new_employee_info', 'ลงทะเบียนพนักงานที่ผ่านการรับเข้าทำงาน'),
(9, 3, 'attendance_tracking', 'บันทึกด้วยระบบบัตรหรือ Biometric'),
(10, 3, 'leave_request', 'ลากิจ, ลาป่วย, ลาพักร้อน'),
(11, 3, 'leave_approval', 'ระบบอนุมัติลาทุกประเภท'),
(12, 3, 'leave_reports', 'รายงานวันลาที่ใช้และวันลาคงเหลือ'),
(13, 4, 'salary_and_bonus', 'ระบบเงินเดือนอัตโนมัติ'),
(14, 4, 'tax_and_social_security', 'คำนวณภาษี, ประกันสังคม และกองทุน'),
(15, 4, 'benefits', 'ประกันสุขภาพและสิทธิอื่น ๆ'),
(16, 4, 'salary_payment', 'ออกสลิปเงินเดือน'),
(17, 5, 'kpi_setting', 'กำหนดเป้าหมายรายบุคคลหรือฝ่าย'),
(18, 5, 'performance_review', 'ระบบการประเมินผลงาน'),
(19, 5, 'development_tracking', 'บันทึกการพัฒนาหลังประเมิน'),
(20, 6, 'training_courses', 'รายการหลักสูตรต่าง ๆ'),
(21, 6, 'training_registration', 'ระบบสมัครเข้าอบรม'),
(22, 6, 'training_evaluation', 'วัดผลหลังการฝึกอบรม'),
(23, 7, 'employment_contracts', 'เอกสารเกี่ยวกับสัญญาจ้างงาน'),
(24, 7, 'licenses', 'ใบอนุญาตทำงานหรืออื่น ๆ'),
(25, 7, 'other_documents', 'เอกสารทั่วไปที่เกี่ยวข้อง'),
(26, 8, 'announcements', 'ข่าวภายในองค์กร'),
(27, 8, 'internal_messages', 'ระบบส่งข้อความภายใน'),
(28, 9, 'employee_reports', 'รายงานสถิติเกี่ยวกับพนักงาน'),
(29, 9, 'leave_reports_summary', 'สรุปข้อมูลวันลา'),
(30, 9, 'salary_reports', 'แสดงเงินเดือนย้อนหลัง'),
(31, 9, 'data_analytics', 'สรุปและวิเคราะห์เชิงลึก'),
(32, 10, 'agency', 'หน่วยงาน'),
(33, 10, 'User', 'ผู้ใช้งานระบบ'),
(34, 10, 'Roles', 'สิทธิ์การใช้งานระบบ'),
(35, 10, 'Permission', 'การอนุญาตสิทธิ์'),
(37, 12, 'report_kpi', 'รายงาน KPI');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position_id` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token_line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status_gpf` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'no' COMMENT 'สถานะการจ่าย กยศ	',
  `status_sso` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'no' COMMENT 'สถานะการจ่ายประกันสังคอม	',
  `status_advance_payment` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'no' COMMENT 'สถานะการเบิกล่วงหน้า',
  `salary` decimal(10,2) DEFAULT NULL COMMENT 'เงินเดือนพนักงาน',
  `working_status` enum('ทำงาน','ลาออก') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ทำงาน' COMMENT 'สถานะการทำงานพนักงาน',
  `sso` decimal(10,2) DEFAULT NULL COMMENT 'ประกันสังคม',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `username`, `password`, `department`, `role`, `position_id`, `token_line`, `img`, `status_gpf`, `status_sso`, `status_advance_payment`, `salary`, `working_status`, `sso`, `created_at`) VALUES
(1, 'admin', '0801252125', 'chitipat@gmail.com', '$2y$10$28C/FuwYVw2gfGeAjYIB.uZWNAnmIRrQ852/sBN5yd7ai9karUuPe', '8', '1', NULL, '212123133123231', NULL, 'no', 'no', 'no', 0.00, 'ทำงาน', NULL, '2025-06-21 09:26:04'),
(23, 'Test HRM', '0801252125', 'chitipat.bu.64@ubu.ac.th', '$2y$10$Ru/dK76MSP1jz47i7YH0zeHj/dLGsvXoJIftTvTUMg/r83GZbippu', '8', '2', NULL, NULL, NULL, 'no', 'no', 'no', NULL, 'ทำงาน', NULL, '2025-07-12 02:43:47'),
(24, 'Beam1234', '0931453456', 'Beam@gmail.com', '$2y$10$a8mv8M0ol9ZV.sLzXp9EMO12I3gNj1yQwMuVM4JxqeMAcTMrK6k0G', '8', '1', NULL, NULL, NULL, 'no', 'no', 'no', NULL, 'ทำงาน', NULL, '2025-07-12 07:36:04'),
(25, 'UserMe', '0523658794', 'arm@pay.dev', '$2y$10$pKJ3jKkcJSCMUJBI2Rs3xeHYKU/BomcbQlJ7sWGFkOoA/27Wytywe', '8', '2', NULL, NULL, NULL, 'no', 'no', 'no', NULL, 'ทำงาน', NULL, '2025-07-12 07:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_menu_permissions`
--

CREATE TABLE `user_menu_permissions` (
  `id` int NOT NULL,
  `roles_id` int NOT NULL,
  `menu_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_menu_permissions`
--

INSERT INTO `user_menu_permissions` (`id`, `roles_id`, `menu_id`) VALUES
(28, 1, 1),
(29, 1, 2),
(30, 1, 3),
(31, 1, 4),
(32, 1, 5),
(33, 1, 6),
(34, 1, 7),
(35, 1, 8),
(36, 1, 9),
(37, 1, 10),
(41, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `management_departments`
--
ALTER TABLE `management_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `management_employees`
--
ALTER TABLE `management_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `work_location_id` (`work_location_id`);

--
-- Indexes for table `management_employee_family`
--
ALTER TABLE `management_employee_family`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `management_employment_history`
--
ALTER TABLE `management_employment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `management_positions`
--
ALTER TABLE `management_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `management_work_locations`
--
ALTER TABLE `management_work_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `recruitment_onboarding_applicants`
--
ALTER TABLE `recruitment_onboarding_applicants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_post_id` (`job_post_id`);

--
-- Indexes for table `recruitment_onboarding_applicant_interviews`
--
ALTER TABLE `recruitment_onboarding_applicant_interviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applicant_id` (`applicant_id`);

--
-- Indexes for table `recruitment_onboarding_job_posts`
--
ALTER TABLE `recruitment_onboarding_job_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `recruitment_onboarding_onboarded_employees`
--
ALTER TABLE `recruitment_onboarding_onboarded_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applicant_id` (`applicant_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`);

--
-- Indexes for table `sub_menus`
--
ALTER TABLE `sub_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`username`);

--
-- Indexes for table `user_menu_permissions`
--
ALTER TABLE `user_menu_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`roles_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=709;

--
-- AUTO_INCREMENT for table `management_departments`
--
ALTER TABLE `management_departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management_employees`
--
ALTER TABLE `management_employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management_employee_family`
--
ALTER TABLE `management_employee_family`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management_employment_history`
--
ALTER TABLE `management_employment_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management_positions`
--
ALTER TABLE `management_positions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management_work_locations`
--
ALTER TABLE `management_work_locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recruitment_onboarding_applicants`
--
ALTER TABLE `recruitment_onboarding_applicants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recruitment_onboarding_applicant_interviews`
--
ALTER TABLE `recruitment_onboarding_applicant_interviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recruitment_onboarding_job_posts`
--
ALTER TABLE `recruitment_onboarding_job_posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recruitment_onboarding_onboarded_employees`
--
ALTER TABLE `recruitment_onboarding_onboarded_employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sub_menus`
--
ALTER TABLE `sub_menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_menu_permissions`
--
ALTER TABLE `user_menu_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `management_employees`
--
ALTER TABLE `management_employees`
  ADD CONSTRAINT `management_employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `management_departments` (`id`),
  ADD CONSTRAINT `management_employees_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `management_positions` (`id`),
  ADD CONSTRAINT `management_employees_ibfk_3` FOREIGN KEY (`work_location_id`) REFERENCES `management_work_locations` (`id`);

--
-- Constraints for table `management_employee_family`
--
ALTER TABLE `management_employee_family`
  ADD CONSTRAINT `management_employee_family_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `management_employees` (`id`);

--
-- Constraints for table `management_employment_history`
--
ALTER TABLE `management_employment_history`
  ADD CONSTRAINT `management_employment_history_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `management_employees` (`id`),
  ADD CONSTRAINT `management_employment_history_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `management_positions` (`id`),
  ADD CONSTRAINT `management_employment_history_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `management_departments` (`id`);

--
-- Constraints for table `recruitment_onboarding_applicants`
--
ALTER TABLE `recruitment_onboarding_applicants`
  ADD CONSTRAINT `recruitment_onboarding_applicants_ibfk_1` FOREIGN KEY (`job_post_id`) REFERENCES `recruitment_onboarding_job_posts` (`id`);

--
-- Constraints for table `recruitment_onboarding_applicant_interviews`
--
ALTER TABLE `recruitment_onboarding_applicant_interviews`
  ADD CONSTRAINT `recruitment_onboarding_applicant_interviews_ibfk_1` FOREIGN KEY (`applicant_id`) REFERENCES `recruitment_onboarding_applicants` (`id`);

--
-- Constraints for table `recruitment_onboarding_job_posts`
--
ALTER TABLE `recruitment_onboarding_job_posts`
  ADD CONSTRAINT `recruitment_onboarding_job_posts_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `management_positions` (`id`),
  ADD CONSTRAINT `recruitment_onboarding_job_posts_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `management_departments` (`id`);

--
-- Constraints for table `recruitment_onboarding_onboarded_employees`
--
ALTER TABLE `recruitment_onboarding_onboarded_employees`
  ADD CONSTRAINT `recruitment_onboarding_onboarded_employees_ibfk_1` FOREIGN KEY (`applicant_id`) REFERENCES `recruitment_onboarding_applicants` (`id`),
  ADD CONSTRAINT `recruitment_onboarding_onboarded_employees_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `management_employees` (`id`);

--
-- Constraints for table `sub_menus`
--
ALTER TABLE `sub_menus`
  ADD CONSTRAINT `sub_menus_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_menu_permissions`
--
ALTER TABLE `user_menu_permissions`
  ADD CONSTRAINT `foreing key menu_id tabel menus` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreing key roles_id tabel roles` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id_roles`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
