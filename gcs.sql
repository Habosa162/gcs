-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2022 at 11:02 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gcs`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `acceptedtasksview`
-- (See below for the actual view)
--
CREATE TABLE `acceptedtasksview` (
`id` int(11)
,`room` varchar(10)
,`problem` varchar(10)
,`department_id` int(11)
,`start_time` datetime
,`department_time` datetime
,`worker` varchar(20)
,`note` varchar(200)
,`requested_by` varchar(20)
,`status` varchar(20)
,`department` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `closedtasksview`
-- (See below for the actual view)
--
CREATE TABLE `closedtasksview` (
`id` int(11)
,`room` varchar(10)
,`problem` varchar(10)
,`department` varchar(20)
,`status` varchar(20)
,`start_time` datetime
,`department_time` datetime
,`end_time` datetime
,`worker` varchar(20)
,`duration` time
);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `body` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `task_id`, `body`) VALUES
(41, 17, 187, 'undefined'),
(42, 17, 188, 'undefined'),
(43, 17, 199, 'undefined'),
(44, 17, 198, 'undefined'),
(45, 17, 190, 'undefined'),
(46, 17, 191, 'undefined'),
(47, 17, 194, 'undefined'),
(48, 17, 197, 'undefined'),
(49, 17, 193, 'undefined'),
(50, 17, 202, 'undefined'),
(51, 17, 203, 'undefined'),
(52, 17, 192, 'undefined');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `get_task` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `get_task`) VALUES
(1, 'IT', 0),
(2, 'Front Office', 0),
(3, 'Engineering', 1),
(4, 'House Keeping', 1),
(5, 'GM', 0),
(6, 'Master', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `openedtasks`
-- (See below for the actual view)
--
CREATE TABLE `openedtasks` (
`id` int(11)
,`room` varchar(10)
,`depratment` varchar(20)
,`problem` varchar(10)
,`status` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `problem`
--

CREATE TABLE `problem` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `time` time NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `problem`
--

INSERT INTO `problem` (`id`, `name`, `time`, `department_id`) VALUES
(7, 'lamb', '00:15:00', 3),
(8, 'towles', '00:15:00', 4),
(9, 'Room clean', '00:30:00', 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `problemview`
-- (See below for the actual view)
--
CREATE TABLE `problemview` (
`id` int(11)
,`name` varchar(10)
,`time` time
,`department_id` int(11)
,`department` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `requestedtasks`
-- (See below for the actual view)
--
CREATE TABLE `requestedtasks` (
`id` int(11)
,`room` varchar(10)
,`department_id` int(11)
,`problem` varchar(10)
,`department` varchar(20)
,`status` varchar(20)
,`start_time` datetime
,`note` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `dep_id`) VALUES
(1, 'IT manger', 1),
(2, 'general manager', 5),
(3, 'front office', 2),
(4, 'House keeping O.T', 4),
(5, 'Engineering O.T', 3),
(6, 'Engineering Worker', 3),
(7, 'House keeping Worker', 4);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `number`) VALUES
(1, '12c'),
(2, '134');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'ASSIGNED'),
(2, 'IN PROGRESS'),
(3, 'FIXED'),
(4, 'CONFIRMED'),
(5, 'RE OPENED');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `fo_id` int(11) NOT NULL,
  `ot_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `opened` int(11) NOT NULL,
  `accepted_department` tinyint(1) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `reopened` tinyint(1) NOT NULL DEFAULT 0,
  `start_time` datetime DEFAULT NULL,
  `department_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `confirmed_time` datetime NOT NULL,
  `duration_time` datetime DEFAULT NULL,
  `note` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `problem_id`, `department_id`, `fo_id`, `ot_id`, `status_id`, `room_id`, `opened`, `accepted_department`, `confirmed`, `reopened`, `start_time`, `department_time`, `end_time`, `confirmed_time`, `duration_time`, `note`) VALUES
(187, 8, 4, 0, 0, 4, 1, 0, 1, 1, 0, '2022-01-29 09:08:27', '2022-01-29 09:20:42', '2022-01-29 09:25:44', '2022-01-29 09:26:21', NULL, 'undefined'),
(188, 8, 4, 0, 0, 5, 1, 1, 1, 0, 0, '2022-01-29 09:38:38', '2022-01-29 09:38:46', '2022-01-29 09:42:32', '0000-00-00 00:00:00', NULL, 'undefined'),
(189, 7, 3, 0, 0, 1, 1, 1, 0, 0, 0, '2022-01-30 02:10:20', NULL, NULL, '0000-00-00 00:00:00', NULL, 'undefined'),
(190, 8, 4, 0, 0, 5, 1, 1, 1, 0, 0, '2022-01-30 02:10:26', '2022-01-30 05:13:54', '2022-01-30 05:31:31', '0000-00-00 00:00:00', NULL, 'undefined'),
(191, 8, 4, 0, 0, 5, 1, 1, 1, 0, 0, '2022-01-30 02:10:31', '2022-01-30 05:13:56', '2022-01-30 05:31:31', '0000-00-00 00:00:00', NULL, 'undefined'),
(192, 8, 4, 0, 0, 2, 2, 1, 1, 0, 0, '2022-01-30 02:10:36', '2022-02-03 07:40:42', NULL, '0000-00-00 00:00:00', NULL, 'undefined'),
(193, 8, 4, 0, 0, 5, 2, 1, 1, 0, 0, '2022-01-30 02:10:43', '2022-01-30 06:06:46', '2022-01-30 06:07:18', '0000-00-00 00:00:00', NULL, 'undefined'),
(194, 8, 4, 0, 0, 5, 1, 1, 1, 0, 0, '2022-01-30 02:12:23', '2022-01-30 05:14:01', '2022-01-30 05:31:32', '0000-00-00 00:00:00', NULL, 'undefined'),
(195, 8, 4, 0, 0, 1, 1, 1, 0, 0, 0, '2022-01-30 02:12:24', NULL, NULL, '0000-00-00 00:00:00', NULL, 'undefined'),
(196, 8, 4, 0, 0, 1, 1, 1, 0, 0, 0, '2022-01-30 02:12:33', NULL, NULL, '0000-00-00 00:00:00', NULL, 'undefined'),
(197, 8, 4, 0, 0, 5, 2, 1, 1, 0, 0, '2022-01-30 02:12:38', '2022-01-30 05:14:28', '2022-01-30 05:31:32', '0000-00-00 00:00:00', NULL, 'undefined'),
(198, 8, 4, 0, 0, 5, 2, 1, 1, 0, 0, '2022-01-30 02:12:51', '2022-01-30 04:40:20', '2022-01-30 05:31:32', '0000-00-00 00:00:00', NULL, 'undefined'),
(199, 8, 4, 0, 0, 5, 2, 1, 1, 0, 0, '2022-01-30 02:13:43', '2022-01-30 04:39:08', '2022-01-30 05:31:33', '0000-00-00 00:00:00', NULL, 'undefined'),
(200, 8, 4, 0, 0, 1, 1, 1, 0, 0, 0, '2022-01-30 02:16:01', NULL, NULL, '0000-00-00 00:00:00', NULL, 'undefined'),
(201, 8, 4, 0, 0, 1, 1, 1, 0, 0, 0, '2022-01-30 02:16:08', NULL, NULL, '0000-00-00 00:00:00', NULL, 'undefined'),
(202, 8, 4, 0, 0, 3, 1, 0, 1, 0, 0, '2022-01-30 06:03:21', '2022-01-30 06:06:52', '2022-01-30 06:07:16', '0000-00-00 00:00:00', NULL, 'this is a note'),
(203, 9, 4, 0, 0, 3, 2, 0, 1, 0, 0, '2022-02-03 07:37:53', '2022-02-03 07:39:34', '2022-02-03 07:44:08', '0000-00-00 00:00:00', NULL, 'undefined');

-- --------------------------------------------------------

--
-- Stand-in structure for view `taskview`
-- (See below for the actual view)
--
CREATE TABLE `taskview` (
`id` int(11)
,`room` varchar(10)
,`problem` varchar(10)
,`department` varchar(20)
,`status` varchar(20)
,`opened` int(11)
,`accepted_department` tinyint(1)
,`confirmed` tinyint(1)
,`start_time` datetime
,`department_time` datetime
,`end_time` datetime
,`confirmed_time` datetime
,`duration` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `taskworker`
--

CREATE TABLE `taskworker` (
  `task_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taskworker`
--

INSERT INTO `taskworker` (`task_id`, `worker_id`) VALUES
(187, 5),
(188, 10),
(199, 10),
(198, 10),
(190, 10),
(191, 11),
(194, 12),
(197, 14),
(193, 10),
(202, 5),
(203, 10),
(192, 10);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `testime` datetime(1) DEFAULT NULL,
  `testime2` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `time`, `testime`, `testime2`) VALUES
(1, '2022-01-14 11:21:27.000000', NULL, NULL),
(2, '0000-00-00 00:00:00.000000', NULL, NULL),
(3, '2022-01-14 11:21:27.000000', NULL, NULL),
(4, '0000-00-00 00:00:00.000000', '2022-01-14 11:21:27.0', NULL),
(5, '0000-00-00 00:00:00.000000', NULL, '2022-01-14 11:21:27');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `password`, `role_id`, `dep_id`, `active`) VALUES
(2, 'habosa', 'mohamed', '$2b$06$GrxDd2MkwOtv260sMBAsFuuLGDFeBn.xgxgKpgVZwzg0CFQ8gmSWy', 1, 1, 1),
(3, 'habosa1', 'mohamed', '$2b$06$yuxB3JrWllw050iHEeAqB.BK38riV0b6yMN.vEOEBCiPVAh1M9lsm', 1, 1, 1),
(4, 'habosa3', 'mohamed', '$2b$06$n7k/PgVmyrBCSQ9Cyx1Oc.swEz4LhbuDRWBN40siTQx1NaY3VirK2', 1, 1, 1),
(7, 'hambozo', 'hambozoo', '$2b$06$AE4sj.sEEmXgWuU0tYKTBuFDQSK5cHcIbn3XpbbORXQ3ggwO965TK', 6, 3, 1),
(8, 'm.hany', 'hambozoo', '$2b$06$OQNRfbolALMEO9IZDFhMxON9wH/Ql2GEZ1Uk5L1z.95dJ9uuh8Px.', 5, 3, 1),
(9, 'sssssssssssss', 'undefined', '$2b$06$lgf/VklXBA6TEBvH.zzgVediRZPXywQMf1aOizusHafM01fA.6Yw.', 4, 2, 1),
(10, 'hk1', 'undefined', '$2b$06$m16xEwm/lsBVyx5DJCN05OJ9p1GojvGPm4QAkopoykTqFE9N1meHC', 4, 4, 1),
(11, 'ssssssssssssss', 'undefined', '$2b$06$pD26CvB0JB68Yq6GR54Ne.kTUXoe6AB0dxSrN1cREEHKH0HIh3XOG', 4, 2, 1),
(12, 'mohamed', 'undefined', '$2b$06$D..neQ19Ry6TnXfuaxTnmOhGs4cHE.zGLHBftr7BGsYn9f9eDzdyG', 4, 4, 1),
(13, 'hk3', 'mohamed', '$2b$06$nrtBRaAr1ZB1UhKD0VSy2.3WNy4LaKxz5POQhdmurXJX8Nakw1f8.', 4, 4, 1),
(14, 'hk4', 'mohamed', '$2b$06$nm5tZ99mkkrxscpTLxkgBuk1e9pFqKnVbbI8MzDsntX4koxDqaQkS', 4, 4, 1),
(15, 'fo1', 'mahrous', '$2b$06$7xRP7tRU6/n5aZZ7TU5YJ.85OsHyPTKS/C9QuR/YXlIw4/SRs.7P2', 3, 2, 1),
(16, 'eng1', 'mohamed hany', '$2b$06$Yh.V9U2O55ElKuwhG.IvNupRa22rLi6tQtvrlqb4I4zE3..FtrQmG', 5, 3, 1),
(17, 'hk10', 'mohamed hany', '$2b$06$YvPl4T9tShUItcVJ54Vs7eDoVlwEqRZD.BBhhoOccs9n7si5jsMEa', 4, 4, 1),
(18, 'fo1', 'mohamed', '$2b$06$aNwcGQxRAvzILUfBMvIoYusiVEPwlmziB6kcSaw.2wxF6MdQNwWbi', 3, 2, 1),
(19, 'malak', 'malak hany', '$2b$06$QlzzQp9cpHS19Jb//iTqYuWIfffksW1WsD/arcELJNeMsFpoT.nZK', 3, 2, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `usersview`
-- (See below for the actual view)
--
CREATE TABLE `usersview` (
`id` int(11)
,`name` varchar(20)
,`username` varchar(20)
,`password` varchar(100)
,`department_id` int(11)
,`department` varchar(20)
,`role_id` int(11)
,`role` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `worker`
--

CREATE TABLE `worker` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `department_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `worker`
--

INSERT INTO `worker` (`id`, `username`, `name`, `department_id`, `active`) VALUES
(1, 'mahros', 'mahros', 3, 1),
(2, 'mahros', 'mahros', 3, 1),
(5, 'atia', 'attia78', 4, 1),
(8, 'ddddd', 'ddddddddddddddd', 4, 1),
(9, 'mohamed', 'hanyyy', 3, 1),
(10, 'fathy1', 'fathy', 4, 1),
(11, 'testttt', 'sssss', 4, 1),
(12, 'testtttt', 'testtttt', 4, 1),
(13, 'attia16', 'attia mohamed', 4, 1),
(14, 'ibrahem elabyad', 'ibrahem elabyad', 4, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `workerview`
-- (See below for the actual view)
--
CREATE TABLE `workerview` (
`id` int(11)
,`username` varchar(20)
,`name` varchar(20)
,`department` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `acceptedtasksview`
--
DROP TABLE IF EXISTS `acceptedtasksview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `acceptedtasksview`  AS SELECT `task`.`id` AS `id`, `room`.`number` AS `room`, `problem`.`name` AS `problem`, `task`.`department_id` AS `department_id`, `task`.`start_time` AS `start_time`, `task`.`department_time` AS `department_time`, `worker`.`name` AS `worker`, `task`.`note` AS `note`, `user`.`username` AS `requested_by`, `status`.`name` AS `status`, `department`.`name` AS `department` FROM (((((((`task` join `taskworker` on(`taskworker`.`task_id` = `task`.`id`)) join `worker` on(`taskworker`.`worker_id` = `worker`.`id`)) join `problem` on(`task`.`problem_id` = `problem`.`id`)) left join `user` on(`task`.`fo_id` = `user`.`id`)) join `room` on(`room`.`id` = `task`.`room_id`)) join `status` on(`status`.`id` = `task`.`status_id`)) join `department` on(`department`.`id` = `task`.`department_id`)) WHERE `task`.`accepted_department` = 1 AND `task`.`opened` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `closedtasksview`
--
DROP TABLE IF EXISTS `closedtasksview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `closedtasksview`  AS SELECT `task`.`id` AS `id`, `room`.`number` AS `room`, `problem`.`name` AS `problem`, `department`.`name` AS `department`, `status`.`name` AS `status`, `task`.`start_time` AS `start_time`, `task`.`department_time` AS `department_time`, `task`.`end_time` AS `end_time`, `worker`.`name` AS `worker`, timediff(`task`.`end_time`,`task`.`department_time`) AS `duration` FROM ((((((`task` join `department` on(`task`.`department_id` = `department`.`id`)) join `problem` on(`task`.`problem_id` = `problem`.`id`)) join `taskworker` on(`taskworker`.`task_id` = `task`.`id`)) join `worker` on(`worker`.`id` = `taskworker`.`worker_id`)) join `room` on(`room`.`id` = `task`.`room_id`)) join `status` on(`status`.`id` = `task`.`status_id`)) WHERE `task`.`opened` = 0 AND `task`.`confirmed` = 0 ;

-- --------------------------------------------------------

--
-- Structure for view `openedtasks`
--
DROP TABLE IF EXISTS `openedtasks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `openedtasks`  AS SELECT `task`.`id` AS `id`, `room`.`number` AS `room`, `department`.`name` AS `depratment`, `problem`.`name` AS `problem`, `status`.`name` AS `status` FROM ((((`task` join `room` on(`room`.`id` = `task`.`room_id`)) join `department` on(`department`.`id` = `task`.`department_id`)) join `problem` on(`problem`.`id` = `task`.`problem_id`)) join `status` on(`status`.`id` = `task`.`status_id`)) WHERE `task`.`opened` <> 0 ;

-- --------------------------------------------------------

--
-- Structure for view `problemview`
--
DROP TABLE IF EXISTS `problemview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `problemview`  AS SELECT `problem`.`id` AS `id`, `problem`.`name` AS `name`, `problem`.`time` AS `time`, `problem`.`department_id` AS `department_id`, `department`.`name` AS `department` FROM (`problem` join `department` on(`department`.`id` = `problem`.`department_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `requestedtasks`
--
DROP TABLE IF EXISTS `requestedtasks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `requestedtasks`  AS SELECT `task`.`id` AS `id`, `room`.`number` AS `room`, `task`.`department_id` AS `department_id`, `problem`.`name` AS `problem`, `department`.`name` AS `department`, `status`.`name` AS `status`, `task`.`start_time` AS `start_time`, `task`.`note` AS `note` FROM ((((`task` join `department` on(`task`.`department_id` = `department`.`id`)) join `problem` on(`task`.`problem_id` = `problem`.`id`)) join `room` on(`room`.`id` = `task`.`room_id`)) join `status` on(`status`.`id` = `task`.`status_id`)) WHERE `task`.`opened` = 1 AND `task`.`accepted_department` = 0 ;

-- --------------------------------------------------------

--
-- Structure for view `taskview`
--
DROP TABLE IF EXISTS `taskview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `taskview`  AS SELECT `task`.`id` AS `id`, `room`.`number` AS `room`, `problem`.`name` AS `problem`, `department`.`name` AS `department`, `status`.`name` AS `status`, `task`.`opened` AS `opened`, `task`.`accepted_department` AS `accepted_department`, `task`.`confirmed` AS `confirmed`, `task`.`start_time` AS `start_time`, `task`.`department_time` AS `department_time`, `task`.`end_time` AS `end_time`, `task`.`confirmed_time` AS `confirmed_time`, `task`.`duration_time` AS `duration` FROM ((((`task` join `room` on(`room`.`id` = `task`.`room_id`)) join `department` on(`department`.`id` = `task`.`department_id`)) join `status` on(`status`.`id` = `task`.`status_id`)) join `problem` on(`problem`.`id` = `task`.`problem_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `usersview`
--
DROP TABLE IF EXISTS `usersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usersview`  AS SELECT `user`.`id` AS `id`, `user`.`name` AS `name`, `user`.`username` AS `username`, `user`.`password` AS `password`, `user`.`dep_id` AS `department_id`, `department`.`name` AS `department`, `role`.`id` AS `role_id`, `role`.`name` AS `role` FROM ((`user` join `department` on(`user`.`dep_id` = `department`.`id`)) join `role` on(`user`.`role_id` = `role`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `workerview`
--
DROP TABLE IF EXISTS `workerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `workerview`  AS SELECT `worker`.`id` AS `id`, `worker`.`username` AS `username`, `worker`.`name` AS `name`, `department`.`name` AS `department` FROM (`worker` join `department` on(`department`.`id` = `worker`.`department_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `problem`
--
ALTER TABLE `problem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `problem_id` (`problem_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `fo_id` (`fo_id`),
  ADD KEY `ot_id` (`ot_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `taskworker`
--
ALTER TABLE `taskworker`
  ADD KEY `task_id` (`task_id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ibfk_1` (`dep_id`),
  ADD KEY `user_ibfk_2` (`role_id`);

--
-- Indexes for table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `problem`
--
ALTER TABLE `problem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `worker`
--
ALTER TABLE `worker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`);

--
-- Constraints for table `problem`
--
ALTER TABLE `problem`
  ADD CONSTRAINT `problem_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Constraints for table `taskworker`
--
ALTER TABLE `taskworker`
  ADD CONSTRAINT `taskworker_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  ADD CONSTRAINT `taskworker_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `department` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
