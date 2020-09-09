-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 27, 2020 at 02:12 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wspt`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `seen`) VALUES
(111, 'Academic History and Reflection', 0),
(333, 'Writing Assessment', 0),
(222, 'Writing Reflection', 0),
(4, 'Reading Assessment', 0),
(555, 'Reading Reflection', 0),
(6, 'Grammar Assessment', 0),
(777, 'Grammar Reflection', 0),
(888, 'About Composition at ODU', 0);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `options_content` varchar(255) NOT NULL,
  `option_credit` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `question_id`, `options_content`, `option_credit`) VALUES
(1, 1, '4.0 or higher', 50),
(2, 1, '3.81- 3.99', 48),
(3, 1, '3.71- 3.80', 46),
(4, 1, '3.61- 3.70', 44),
(5, 1, '3.51- 3.60', 42),
(6, 1, '3.41- 3.50', 40),
(7, 1, '3.31- 3.40', 38),
(8, 1, '3.21- 3.30', 36),
(9, 1, '3.11- 3.20', 34),
(10, 1, '3.01- 3.10', 32),
(11, 1, '2.91- 3.00', 30),
(12, 1, '2.81- 2.90', 28),
(13, 1, '2.71- 2.80', 26),
(16, 1, '2.61- 2.70', 24),
(17, 1, '2.51- 2.60', 22),
(18, 1, '2.41- 2.50', 20),
(19, 1, '2.31- 2.40', 18),
(20, 1, '2.21- 2.30', 16),
(21, 1, '2.11- 2.20', 14),
(22, 1, '2.01- 2.10', 12),
(23, 1, '1.91- 2.00', 10),
(24, 1, '1.81- 1.90', 8),
(25, 1, '1.71- 1.80', 6),
(29, 1, '1.61- 1.70', 4),
(30, 1, '1.51- 1.60', 2),
(31, 1, '1.5 or lower', 0),
(32, 1, 'I do not have a GPA, but I passed the GED English Exam.', 20),
(33, 1, 'None of the above applies to my situation.', 0),
(34, 2, 'SAT', NULL),
(35, 2, 'ACT', NULL),
(36, 3, 'Very difficult', 0),
(37, 3, 'Somewhat difficult', 50),
(38, 3, 'Not difficult', 100),
(40, 4, 'Below 400, 0', NULL),
(41, 4, '400- 549, 5', NULL),
(42, 4, 'Above 550, 9', NULL),
(43, 4, 'I did not take the Verbal portion of the SAT. ', NULL),
(44, 5, 'Very difficult', 0),
(45, 5, 'Somewhat difficult', 50),
(46, 5, 'Not difficult', 100),
(48, 7, 'A', 100),
(49, 7, 'B', 80),
(50, 7, 'C', 60),
(51, 7, 'D', 40),
(52, 7, 'F', 0),
(53, 7, 'I have not taken any writing courses ', 0),
(54, 8, 'I regularly wrote essays in high school.', 100),
(55, 8, 'I sometimes wrote essays in high school.', 67),
(56, 8, 'I rarely wrote essays in high school.', 33),
(57, 8, 'I did not write any essays in high school.', 0),
(58, 8, 'I did not attend high school. Exempt.', 0),
(59, 9, 'I wrote several different kinds of papers for different purposes and audiences in high school.', 100),
(60, 9, 'There was some variety in the types of papers I wrote in high school, but I mainly wrote just one or two different types of papers.', 67),
(61, 9, 'I wrote just one or two different types of papers in high school.', 33),
(62, 9, 'I did not write papers in high school.', 0),
(63, 9, 'I did not attend high school. Exempt', 0),
(64, 9, 'I am not sure how to answer this question.', 0),
(65, 10, 'I often do not understand what is being asked.', 0),
(66, 10, 'I am somewhat confident that I know what is being asked, but may reach out to teachers, parents, tutors, or friends to make sure.', 50),
(67, 10, 'I am usually confident that I understand what is being asked in the assignment.', 100),
(68, 11, 'I typically start and finish writing assignments in one sitting and often right before the deadline (the day of or the night before).', 0),
(69, 11, 'Though I often write my assignments in one sitting, I begin thinking about the assignment and how I will approach it in advance of my drafting.', 50),
(70, 11, 'I usually plan out and complete writing assignments in multiple sittings including prewriting (brainstorming, freewriting, and/or outlining), a rough draft, and a final draft.', 100),
(71, 11, 'I always plan out and complete writing assignments in multiple sittings including prewriting (brainstorming, freewriting, and/or outlining), rough draft(s), and a final draft.', 100),
(72, 12, 'I always have a clear thesis statement and stay on topic throughout my writing.', 100),
(73, 12, 'Generally, I have a thesis statement and I am able to stay on topic throughout my writing.', 50),
(75, 12, 'I have a hard time writing a clear thesis statement and staying on topic in my writing.', 0),
(76, 13, 'I have a lot of experience integrating outside sources, such as scholarly journal or newspaper articles, into my own writing.', 100),
(77, 13, 'I have some experience integrating outside sources, such as scholarly journal or newspaper articles, into my own writing.', 50),
(78, 13, 'I have very little or no experience integrating outside sources, such as scholarly journal or newspaper articles, into my own writing.', 0),
(79, 14, 'I am not comfortable citing outside sources in MLA, APA, or Chicago Style, but I have tried before.', 33),
(80, 14, 'I am somewhat comfortable citing outside sources in one or more of the following styles: MLA, APA, or Chicago Style.', 67),
(81, 14, 'I am very comfortable citing outside sources in one or more of the following styles: MLA, APA, or Chicago Style.', 100),
(82, 14, 'I have never cited outside sources in my writing using MLA, APA, or Chicago Style.', 0),
(83, 15, 'I have not used writing technologies to draft and revise my written work.', 0),
(84, 15, 'I have some experience using writing technologies to draft and revise written work, but I do not feel comfortable using new writing technologies.', 33),
(85, 15, 'I have some experience using writing technologies to draft and revise written work and I feel reasonably comfortable using new writing technologies.', 67),
(86, 15, 'I have a lot of experience and I am very comfortable using writing technologies to draft and revise my written work.', 100),
(87, 17, 'I hate to write because I\'m not good at it.', 0),
(88, 17, 'I hate to write but do it fairly well.', 40),
(89, 17, 'I don\'t mind writing, but I\'m not good at it.', 20),
(90, 17, 'I am a capable writer but I do not enjoy writing.', 60),
(91, 17, 'I am a capable writer who doesn\'t mind writing.', 80),
(92, 17, 'I am a capable writer who enjoys writing.', 100),
(93, 16, '1 not prepared', 0),
(94, 16, '2 somewhat prepared', 33),
(95, 16, '3 prepared', 67),
(96, 16, '4 very prepared', 100),
(97, 18, 'He composed music as a child.', 0),
(98, 18, 'He applied his talents early in life and died young.', 100),
(99, 18, 'Both were born in Belorussia.', 0),
(100, 18, 'He is a master of child psychology.', 0),
(101, 19, 'Children develop as a result of interactions with people, practices, and objects.', 100),
(102, 19, 'Child development happens best without educational intervention.', 0),
(103, 19, 'Culture and history should be taught to children at a young age.', 0),
(104, 19, 'Children develop primarily as a result of relationships with parents and teachers.', 0),
(105, 20, 'Make-believe play for preschoolers can provide the same support as formal instruction for older students.', 0),
(106, 20, 'Concepts that lie outside of a student’s ZPD are hard to reach even with significant instructional efforts.', 0),
(107, 20, 'Teachers can influence a child’s development at any time regardless of the child’s age or capacities.', 100),
(108, 20, 'Children of different ages need different forms of instruction.', 0),
(109, 21, 'A make-believe play area for pre-school children.', 0),
(110, 21, 'The not yet fully developed skills and concepts that can emerge if a child is given appropriate support.', 100),
(111, 21, 'Skills and concepts that lie outside of a child’s developmental reach.', 0),
(112, 21, 'Social interactions and cultural practices that influence a child’s development.', 0),
(113, 22, 'Only those with educators.', 0),
(114, 22, 'Any interaction within a social environment.', 100),
(115, 22, 'Only those with significant objects.', 0),
(116, 22, 'Any cultural practice.', 0),
(117, 23, 'Teachers should offer support for skills only within a child\'s ZPD.', 100),
(118, 23, 'Teachers should offer support only for skills outside of a child\'s ZPD.', 0),
(119, 23, 'Teachers should increase their instructional efforts regarding skills and concepts outside of a child\'s ZPD.', 0),
(120, 23, 'Teachers should recognize that development gains are not possible for all children.', 0),
(121, 24, 'children\'s development occurs spontaneously', 0),
(122, 24, 'culturally specific practices should be encouraged in the classroom', 0),
(123, 24, 'significant efforts should be made to teach skills and concepts outside of a child\'s ZPD', 0),
(124, 24, 'learning can lead to development if it occurs within a child\'s ZPD', 100),
(125, 25, 'Teachers should discourage play.', 0),
(126, 25, 'Teachers should encourage play', 100),
(127, 25, 'Children can learn anything at any age with the appropriate instruction.', 0),
(128, 25, 'Developmental gains happen best without instructional intervention.', 0),
(129, 26, 'Encourage the audience to find humor in life/discredit the genre of the commencement address.', 0),
(130, 26, 'Introduce the main idea of the address mock the commencement address genre', 100),
(131, 26, 'Explain the reason that stories do not work in commencement addresses/encourage creative thinking.', 0),
(132, 26, 'Inform the audience about the commencement address genre/build credibility.', 0),
(133, 27, 'He does not wish to patronize his audience.', 100),
(134, 27, 'He does not wish to coddle his audience.', 0),
(135, 27, 'He does not wish to placate his audience.', 0),
(136, 27, 'He does not wish to entertain his audience.', 0),
(140, 28, 'That a liberal arts education teaches student to value diversity.', 0),
(141, 28, 'That a liberal arts education fills students with knowledge.', 0),
(142, 28, 'That a liberal arts education teaches students how to think.', 100),
(143, 28, 'That a liberal arts education teaches students to be skeptical.', 0),
(144, 29, 'How the blizzard happened', 0),
(145, 29, 'Who the Eskimos were', 0),
(146, 29, 'Why the believer survived', 100),
(147, 29, 'Why the believer got lost', 0),
(149, 30, 'That a liberal arts education discourages students from accepting other people', 0),
(150, 30, 'That a liberal arts education is not useful.', 0),
(151, 30, 'That a liberal arts education falls short of exploring how people form their beliefs.', 100),
(152, 30, 'That a liberal arts education succeeds in its advocacy of diversity.', 0),
(153, 31, 'Identify with his audience so that are likely to view his advice as credible.', 100),
(154, 31, 'Offer a metaphor about what it’s like to be a college student to better illustrate his advice.', 0),
(155, 31, 'Praise the audience to improve their confidence and their likelihood of success.', 0),
(156, 31, 'Offend the audience to make a point about their arrogance.', 0),
(157, 32, 'Religious dogmatists are more problematic than atheists in their beliefs.', 0),
(158, 32, 'Atheists are more problematic than religious dogmatists in their beliefs.', 0),
(159, 32, 'Neither atheists nor religious dogmatists are problematic in their beliefs.', 0),
(160, 32, 'Both atheists and religious dogmatists are problematic in their beliefs.', 100),
(161, 33, 'Appearances can be deceiving.', 100),
(162, 33, 'You get what you pay for.', 0),
(163, 33, 'Just be yourself.', 0),
(164, 33, 'No good deed goes unpunished.', 0),
(165, 34, 'I feel confident that I understood the passage.', 100),
(167, 34, 'I feel somewhat confident that I understood the passage though there may have been a couple of places where I was confused.', 50),
(168, 34, 'I do not feel confident that I understood the passage.', 0),
(169, 35, 'I feel confident that I answered all or most of the questions correctly.', 100),
(170, 35, 'I feel somewhat confident that I answered most of the questions correctly.', 50),
(171, 35, 'I don\'t feel confident that I answered the questions correctly.', 0),
(172, 36, 'I rarely read and only do so when required.', 0),
(173, 36, 'I often do not complete the reading assignments assigned in my courses, but I read online articles, newspapers, magazines, and/or books occasionally.', 25),
(174, 36, 'In addition to reading for my coursework, I also read online articles, newspapers, magazines, and/or books occasionally.', 50),
(175, 36, 'I often do not complete the reading assignments assigned in my courses, but I read online articles, newspapers, magazines, and/or books frequently.', 75),
(176, 36, 'I read for my coursework as well as online articles, newspapers, magazines, and/or books regularly.', 100),
(177, 37, 'I am able to read, understand, and remember important information the first time I read something.', 100),
(178, 37, 'I am usually able to read, understand, and remember important information the first time I read something though I sometimes need to re-read material a couple of times to be able to understand and remember important information.', 50),
(180, 37, 'I often need to re-read material multiple times to understand and remember important information.', 0),
(181, 38, 'I rarely take notes or annotate while I read.', 0),
(182, 38, 'I sometimes take notes or annotate while I read, depending on what I am reading.', 50),
(184, 38, 'I always (or almost always) take notes or annotate while I read to help me recall and think more about important information.', 100),
(185, 39, '1 not prepared', 0),
(186, 39, '2 somewhat prepared', 33),
(187, 39, '3 prepared', 67),
(188, 39, '4 very prepared', 100),
(189, 40, 'I hate to read because I\'m not good at it.', 0),
(190, 40, 'I hate to read but do it fairly well.', 40),
(194, 40, 'I don\'t mind reading, but I\'m not good at it.', 20),
(195, 40, 'I consider myself an average reader who gets the job done.', 60),
(196, 40, 'I am a capable reader who doesn\'t mind reading.', 80),
(197, 40, 'I am a capable reader who enjoys reading.', 100),
(338, 41, 'Are you take', 0),
(339, 41, 'Do you take', 100),
(340, 41, 'You are take', 0),
(341, 41, 'Take you', 0),
(342, 42, 'she is', 0),
(343, 42, 'she\'s', 0),
(344, 42, 'her', 100),
(345, 42, 'she', 0),
(346, 43, 'do', 0),
(347, 43, 'did', 0),
(348, 43, 'was', 0),
(349, 43, 'were', 100),
(350, 44, 'doesn\'t', 0),
(351, 44, 'didn\'t', 0),
(352, 44, 'wasn\'t', 0),
(353, 44, 'weren\'t', 100),
(354, 45, 'Do you see', 0),
(355, 45, 'Do you saw', 0),
(356, 45, 'Did you see', 100),
(357, 45, 'Did you saw', 0),
(358, 46, 'don\'t understands', 0),
(359, 46, 'doesn\'t understand', 0),
(360, 46, 'didn\'t understand', 100),
(361, 46, 'didn\'t understood', 0),
(362, 47, 'are', 0),
(363, 47, 'do', 0),
(364, 47, 'does', 0),
(365, 47, 'is', 100),
(366, 48, 'are you do', 0),
(367, 48, 'are you going to do', 100),
(368, 48, 'do you do', 0),
(369, 48, 'did you do', 0),
(370, 49, 'does this word new mean', 0),
(371, 49, 'does this new word mean', 100),
(372, 49, 'means this word new', 0),
(373, 49, 'means this new word', 0),
(374, 50, 'is rained', 0),
(375, 50, 'is raining', 100),
(376, 50, 'rains', 0),
(377, 50, 'rained', 0),
(378, 51, 'a lot', 0),
(379, 51, 'many', 0),
(380, 51, 'much', 100),
(381, 51, 'some', 0),
(382, 52, 'a meeting club', 0),
(383, 52, 'a club meeting', 100),
(384, 52, 'a meeting of club', 0),
(385, 52, 'a club\'s meeting', 0),
(386, 53, 'quarter', 0),
(387, 53, 'a quarter', 100),
(388, 53, 'any quarter', 0),
(389, 53, 'a few quarter', 0),
(390, 54, 'did you go', 100),
(391, 54, 'did you went', 0),
(392, 54, 'were you go', 0),
(393, 54, 'were you went', 0),
(394, 55, 'on the stage in Saturday', 0),
(395, 55, 'in the stage in Saturday', 0),
(396, 55, 'on the stage on Saturday', 100),
(397, 55, 'in the stage on Saturday', 0),
(398, 56, 'smarter', 100),
(399, 56, 'the smart', 0),
(400, 56, 'more smart', 0),
(401, 56, 'the same smart', 0),
(402, 57, 'tells', 0),
(403, 57, 'told', 100),
(404, 57, 'telled', 0),
(405, 57, 'was tell', 0),
(406, 58, 'Did you go', 100),
(407, 58, 'Did you went', 0),
(408, 58, 'Have you went', 0),
(409, 58, 'Have you gone', 0),
(410, 59, 'him phone with his', 0),
(411, 59, 'him phone with him', 0),
(412, 59, 'his phone with his', 0),
(413, 59, 'his phone with him', 100),
(414, 60, 'one', 0),
(415, 60, 'the other ', 0),
(416, 60, 'it', 100),
(417, 60, 'another', 0),
(418, 61, 'Michelle\'s essay', 100),
(419, 61, 'Michelles\' essay', 0),
(420, 61, 'the Michelle\'s essay', 0),
(421, 61, 'the essay of Michelle', 0),
(422, 62, 'another one', 0),
(423, 62, 'it ', 0),
(424, 62, 'the other one', 100),
(425, 62, 'my', 0),
(426, 63, 'more thicker from', 0),
(427, 63, 'more thick than', 0),
(428, 63, 'thicker from', 0),
(429, 63, 'thicker than', 100),
(430, 64, 'gave', 0),
(431, 64, 'have given', 0),
(432, 64, 'were giving', 0),
(433, 64, 'was giving', 100),
(434, 65, 'enormously', 0),
(435, 65, 'friendly', 100),
(436, 65, 'hardly', 0),
(437, 65, 'quickly', 0),
(438, 66, 'it out', 0),
(439, 66, 'them out', 100),
(440, 66, 'out it', 0),
(441, 66, 'out them', 0),
(442, 67, 'Because', 0),
(443, 67, 'In order', 0),
(444, 67, 'But', 0),
(445, 67, 'Therefore', 100),
(446, 68, 'going', 0),
(447, 68, 'is going to go', 0),
(448, 68, 'to go', 100),
(449, 68, 'was going', 0),
(450, 69, 'so did Laura', 0),
(451, 69, 'too was Laura', 0),
(452, 69, 'Laura did too', 0),
(453, 69, 'Laura was too', 100),
(454, 70, 'had visited already', 0),
(455, 70, 'had already visited', 100),
(456, 70, 'has visited already', 0),
(457, 70, 'has already visited', 0),
(458, 71, 'If someone tells', 0),
(459, 71, 'Someone had told', 0),
(460, 71, 'Would someone tell', 0),
(461, 71, 'Had someone told', 100),
(462, 72, 'different in that', 0),
(463, 72, 'different so that', 0),
(464, 72, 'differ in that', 100),
(465, 72, 'differ so that', 0),
(466, 73, 'For Whom the Bell Tolls was written by Ernest Hemingway', 0),
(467, 73, 'For Whom the Bell Tolls, which was written by Ernest Hemingway,', 100),
(468, 73, 'Ernest Hemingway wrote For Whom the Bell Tolls', 0),
(469, 73, 'it was written by Ernest Hemingway, For Whom the Bell Tolls', 0),
(470, 74, 'day die', 0),
(471, 74, 'die daily', 100),
(472, 74, 'daily dead', 0),
(473, 74, 'dead daily', 0),
(474, 75, 'When I read my own writing, I am able to see where it can improve and can catch my own mistakes in grammar, spelling, and/or punctuation.', 100),
(475, 75, 'When I read my own writing, I am sometimes able to see where it can improve and can sometimes catch my own mistakes in grammar, spelling, and/or punctuation. ', 50),
(476, 75, 'When I read my own writing, I am not able to see where it can improve or catch my own mistakes in grammar, spelling, and/or punctuation. ', 0),
(477, 75, 'I do not re-read my own writing.', 0),
(478, 76, 'I feel somewhat confident that I understand what an audience expects from my writing and can change how I write to fit an audience\'s expectations.', 50),
(479, 76, 'I am not confident that I understand what my audience expects from my writing and am not sure how to change how I write to fit an audience\'s expectations. ', 0),
(480, 76, 'I do not change how I write based on an audience or their expectations.', 0),
(481, 76, 'I feel confident that I understand what an audience expects from my writing and can change how I write to fit an audience\'s expectations.', 100),
(482, 77, '1 not prepared', 0),
(483, 77, '2 somewhat prepared', 33),
(484, 77, '3 prepared', 67),
(485, 77, '4 very prepared', 100),
(486, 3004, 'Option 1: ENGL 101 & 110 (6 credits)', 0),
(487, 3004, 'Option 2: ENGL 110 (3 credits)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `passage`
--

CREATE TABLE `passage` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `passages` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passage`
--

INSERT INTO `passage` (`id`, `category_id`, `passages`) VALUES
(1, 444, '<p align=\"center\" style=\"margin: 10px 0 0 0; padding:0;\">\"Pioneers In Our Field: Lev Vygotsky - Playing to Learn\" </p>\r\n<p align=\"center\" style=\"margin:0; padding:0;\">By Deborah J. Leong, Ph.D., Elena Bodrova, Ph.D.</p>     \r\n\r\n\r\n<p align=\"center\" style=\"margin: 10px 0 0 0; padding:0;\"\">\"In play, a child is always above his average age, above his daily behavior; in play, it is as though he were a head taller than himself.\"</p> <p align=\"right\" style=\"margin:0; padding:0;\">- Lev Vygotsky (1896-1934)</p>\r\n\r\n\r\n<p>Lev Vygotsky is often called the \"Mozart of psychology.\" Similar to the famous composer, Vygotsky applied his genius early in life to many different areas. And like Mozart, Vygotsky died young, at age 37, after a battle with tuberculosis.</p>                       \r\n\r\n<p> Born in 1896 in Belorussia, he began his career as an educator and a psychologist at the time of the 1917 Russian revolution. After moving to Moscow in 1924, Vygotsky set out to create what he hoped would become a new way to understand and solve the social and educational problems of his time.</p> <p> At the core of Vygotsky\'s theory, called the Cultural-Historical Theory, is the idea that child development is the result of the interactions between children and their social environment. These interactions include those with parents and teachers, playmates and classmates, and brothers and sisters. They also involve relationships with significant objects, such as books or toys, and culturally specific practices that children engage in the classroom, at home, and on the playground. Children are active partners in these interactions, constructing knowledge, skills, and attitudes and not just mirroring the world around them.</p><p> Vygotsky opposed the psychologists who believed that children\'s development occurs spontaneously and cannot be affected by education. He also differed with those who claimed that teaching had the power to alter development at any time regardless of the child\'s age or capacities. Instead, Vygotsky felt that learning could lead development if it occurs within the child\'s Zone of Proximal Development (ZPD). The ZPD contains skills and concepts that are not yet fully developed but are \"on the edge of emergence\" emerging only if the child is given appropriate support. For the skills and concepts that lie outside a child\'s ZPD, even significant instructional efforts may fail to produce developmental gains.</p><p> Vygotsky recognized that the kind of assistance needed to help children develop new skills and concepts within their ZPD took different forms for children of different ages. For instance, fostering make-believe play with preschoolers could provide the same support that formal instruction offers for older students: \"A child\'s greatest achievements are possible in play, achievements that tomorrow will become her basic level of real action.\"</p><p>Lev Vygotsky has contributed a wealth of ideas to early childhood education. Most important, he has shown us how children\'s efforts to understand the world around them, working in concert with teachers\' sensitive, responsive interactions, rouses their young minds to life.</p> <p style=\"margin:0; padding:0;\"> You can also view this reading at: <u> https://www.scholastic.com/teachers/articles/teaching-content/pioneers-our-field-lev-vygotsky-playing-learn/ </u> </p> '),
(2, 444, '<p>Transcription of the 2005 Kenyon Commencement Address - <br>May 21, 2005 <br>Written and Delivered by David Foster Wallace</p><p>\"Greetings parents and congratulations to Kenyon\'s graduating class of 2005. There are these two young fish swimming along and they happen to meet an older fish swimming the other way, who nods at them and says \"Morning, boys. How\'s the water?\" And the two young fish swim on for a bit, and then eventually one of them looks over at the other and goes \"What the hell is water?\"</p><p>This is a standard requirement of US commencement speeches, the deployment of didactic little parable-ish stories. The story thing turns out to be one of the better, less bullshitty conventions of the genre, but if you\'re worried that I plan to present myself here as the wise, older fish explaining what water is to you younger fish, please don\'t be. I am not the wise old fish. The point of the fish story is merely that the most obvious, important realities are often the ones that are hardest to see and talk about. Stated as an English sentence, of course, this is just a banal platitude, but the fact is that in the day to day trenches of adult existence, banal platitudes can have a life or death importance, or so I wish to suggest to you on this dry and lovely morning.</p><p>Of course the main requirement of speeches like this is that I\'m supposed to talk about your liberal arts education\'s meaning, to try to explain why the degree you are about to receive has actual human value instead of just a material payoff. So let\'s talk about the single most pervasive cliché in the commencement speech genre, which is that a liberal arts education is not so much about filling you up with knowledge as it is about \"teaching you how to think.\" If you\'re like me as a student, you\'ve never liked hearing this, and you tend to feel a bit insulted by the claim that you needed anybody to teach you how to think, since the fact that you even got admitted to a college this good seems like proof that you already know how to think. But I\'m going to posit to you that the liberal arts cliché turns out not to be insulting at all, because the really significant education in thinking that we\'re supposed to get in a place like this isn\'t really about the capacity to think, but rather about the choice of what to think about. If your total freedom of choice regarding what to think about seems too obvious to waste time discussing, I\'d ask you to think about fish and water, and to bracket for just a few minutes your skepticism about the value of the totally obvious.</p><p>Here\'s another didactic little story. There are these two guys sitting together in a bar in the remote Alaskan wilderness. One of the guys is religious, the other is an atheist, and the two are arguing about the existence of God with that special intensity that comes after about the fourth beer. And the atheist says: \"Look, it\'s not like I don\'t have actual reasons for not believing in God. It\'s not like I haven\'t ever experimented with the whole God and prayer thing. Just last month I got caught away from the camp in that terrible blizzard, and I was totally lost and I couldn\'t see a thing, and it was 50 below, and so I tried it: I fell to my knees in the snow and cried out ‘Oh, God, if there is a God, I\'m lost in this blizzard, and I\'m gonna die if you don\'t help me.\'\" And now, in the bar, the religious guy looks at the atheist all puzzled. \"Well then you must believe now,\" he says,\"After all, here you are, alive.\" The atheist just rolls his eyes. \"No, man, all that was was a couple Eskimos happened to come wandering by and showed me the way back to camp.\"</p><p>It\'s easy to run this story through kind of a standard liberal arts analysis: the exact same experience can mean two totally different things to two different people, given those people\'s two different belief templates and two different ways of constructing meaning from experience. Because we prize tolerance and diversity of belief, nowhere in our liberal arts analysis do we want to claim that one guy\'s interpretation is true and the other guy\'s is false or bad. Which is fine, except we also never end up talking about just where these individual templates and beliefs come from. Meaning, where they come from INSIDE the two guys. As if a person\'s most basic orientation toward the world, and the meaning of his experience were somehow just hard-wired, like height or shoe-size; or automatically absorbed from the culture, like language. As if how we construct meaning were not actually a matter of personal, intentional choice. Plus, there\'s the whole matter of arrogance. The nonreligious guy is so totally certain in his dismissal of the possibility that the passing Eskimos had anything to do with his prayer for help. True, there are plenty of religious people who seem arrogant and certain of their own interpretations, too. They\'re probably even more repulsive than atheists, at least to most of us. But religious dogmatists\' problem is exactly the same as the story\'s unbeliever: blind certainty, a close-mindedness that amounts to an imprisonment so total that the prisoner doesn\'t even know he\'s locked up.</p><p>The point here is that I think this is one part of what teaching me how to think is really supposed to mean. To be just a little less arrogant. To have just a little critical awareness about myself and my certainties. Because a huge percentage of the stuff that I tend to be automatically certain of is, it turns out, totally wrong and deluded. I have learned this the hard way, as I predict you graduates will, too.</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `questions` varchar(1064) NOT NULL,
  `category_id` int(255) NOT NULL,
  `passage_id` int(11) DEFAULT NULL,
  `question_type` varchar(255) NOT NULL,
  `scoreType` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `questions`, `category_id`, `passage_id`, `question_type`, `scoreType`) VALUES
(1, 'What was your high school GPA?', 111, NULL, 'selectOption', 'Partial'),
(5, 'How would you rate the difficulty of the previous section (the essay writing portion) of the exam?', 222, NULL, 'Select', 'Full'),
(6, 'What is the most recent writing class you have taken?', 222, NULL, 'Short Answer', 'No Credit'),
(7, 'What grade did you receive in this course?', 222, NULL, 'Select', 'No Credit'),
(8, 'Choose ONE sentence below that best describes your high school writing experience.', 222, NULL, 'Select', 'Partial'),
(9, 'Choose ONE sentence below that best describes the types of papers you wrote in high school.', 222, NULL, 'Select', 'Partial'),
(11, 'Which statement best represents your typical writing process?', 222, NULL, 'Select', 'Partial'),
(10, 'Which statement best describes your experience when you are assigned a formal writing assignment?', 222, NULL, 'Select', 'Partial'),
(12, 'Which statement best describes your polished formal writing?', 222, NULL, 'Select', 'Partial'),
(13, 'Which statement best describes your experiences integrating outside sources in your writing?', 222, NULL, 'Select', 'Partial'),
(14, 'Which statement best describes your experience citing and attributing outside sources in your work?', 222, NULL, 'Select', 'Partial'),
(15, 'Which sentence best describes your experience using writing technologies, such as Microsoft Word or Google Docs, to draft and revise your writing?', 222, NULL, 'Select', 'Partial'),
(17, 'Choose ONE sentence below that best describes you as a writer and your feelings about writing.', 222, NULL, 'Select', 'Partial'),
(16, 'Students in ENGL 110 will write at least four papers throughout the semester and will also engage in a variety of low-stakes writing assignments (worth fewer points), such as reflective letters, reading responses, and journal entries. How would you rank your preparedness for college writing?', 222, NULL, 'Select', 'Partial'),
(18, 'Vygotsky is often called the \"Mozart of psychology\" because', 4, 1, 'Select', 'Full'),
(19, 'The Cultural-Historical Theory advances the belief that', 4, 1, 'Select', 'Full'),
(20, 'Vygotsky opposed the idea that', 4, 1, 'Select', 'Full'),
(21, 'The Zone of Proximal Development describes', 4, 1, 'Select', 'Full'),
(22, 'In the Cultural-Historical Theory, what forms of interaction can affect a child\'s development?', 4, 1, 'Select', 'Full'),
(23, 'In the description of the Zone of Proximal Development, what does this line imply: \"For the skills and concepts that lie outside a child\'s ZPD, even significant instructional efforts may fail to produce developmental gains?\"', 4, 1, 'Select', 'Full'),
(24, 'A key tenet of Vygotsky\'s theory is that', 4, 1, 'Select', 'Full'),
(25, 'Which of these is correct about instructing young children, according to Vygotsky:', 4, 1, 'Select', 'Full'),
(26, 'What seem to be the two main purposes of the fish story?', 4, 2, 'Select', 'Full'),
(27, 'When the author says, \"I am not the wise old fish,\" what does he imply?', 4, 2, 'Select', 'Full'),
(28, 'What is the \"liberal arts cliché?\"', 4, 2, 'Select', 'Full'),
(29, 'In the Alaskan wilderness story, on what specific point do the believer and non-believer disagree?', 4, 2, 'Select', 'Full'),
(30, 'When the author states \"Because we prize tolerance and diversity of belief, nowhere in our liberal arts analysis do we want to claim that one guy\'s interpretation is true and the other guy\'s is false or bad. Which is fine, except we also never end up talking about just where these individual templates and beliefs come from,\" what does he suggest?', 4, 2, 'Select', 'Full'),
(31, 'When the author states, \"If you\'re like me as a student, you\'ve never liked hearing this, and you tend to feel a bit insulted by the claim that you needed anybody to teach you how to think, since the fact that you even got admitted to a college this good seems like proof that you already know how to think,\" his goal is likely to', 4, 2, 'Select', 'Full'),
(32, 'In his comparison of religious believers and atheists, the author\'s primary purpose is to show that', 4, 2, 'Select', 'Full'),
(33, 'Given the nature of the address, with which platitude would the author likely agree:', 4, 2, 'Select', 'Full'),
(3003, 'Briefly, in one or two sentences, sum up in your own words the main idea of the passage you just read. If you are unable to summarize the reading, please explain that in your response.', 555, NULL, 'Short Answer', 'No Credit'),
(34, 'Describe your experience reading the short passage from the previous section.', 555, NULL, 'Select', 'Partial'),
(35, 'Which statement best describes your experience answering the questions about the short passage in the previous section?', 555, NULL, 'Select', 'Partial'),
(36, 'Choose ONE sentence below that best describes you as a reader.', 555, NULL, 'Select', 'Partial'),
(37, 'Choose ONE sentence below that best describes how you read complex material.', 555, NULL, 'Select', 'Partial'),
(38, 'Choose ONE sentence below that best describes your notetaking or annotating process while you read.', 555, NULL, 'Select', 'Partial'),
(39, 'Students in ENGL 110 will be tasked with reading a variety of texts, such as essays, textbook chapters, blogs, and scholarly articles. On a scale of 1 to 4, how would you rank your preparedness for completing the reading required in ENGL 110?\r\n(1 is poorly prepared; 4 is well-prepared.)', 555, NULL, 'Select', 'Partial'),
(40, 'Choose ONE sentence below that best describes your feelings about reading.', 555, NULL, 'Select', 'Partial'),
(41, '___________ the bus to school?', 6, NULL, 'Select', 'Full'),
(42, 'Molly is driving _______ car now. She is on her way to work.', 6, NULL, 'Select', 'Full'),
(43, 'How many people _________ at the concert this weekend?\r\n', 6, NULL, 'Select', 'Full'),
(44, 'I took a math test yesterday. I was surprised because it ________ very difficult.', 6, NULL, 'Select', 'Full'),
(45, '__________ that movie about cats?', 6, NULL, 'Select', 'Full'),
(46, 'The teacher explained the answer well, but Jack ________ anything the teacher said.', 6, NULL, 'Select', 'Full'),
(47, 'Those shoes are expensive. This ________ expensive, also.', 6, NULL, 'Select', 'Full'),
(48, 'What ________ tonight? If you\'re free, you can join us for dinner.', 6, NULL, 'Select', 'Full'),
(49, 'I need help with this sentence. What _______________?', 6, NULL, 'Select', 'Full'),
(50, 'You should take an umbrella outside. It ____________ really hard!', 6, NULL, 'Select', 'Full'),
(51, 'I need to go to the store. I don\'t have ________ milk left.', 6, NULL, 'Select', 'Full'),
(52, 'We have _______ today.', 6, NULL, 'Select', 'Full'),
(53, 'If you need a coin, there are some on the table. You can have ___________ if you\'d like.', 6, NULL, 'Select', 'Full'),
(54, 'Why _______ to the teacher\'s office? Did you have a question?', 6, NULL, 'Select', 'Full'),
(55, 'The band will perform ________.', 6, NULL, 'Select', 'Full'),
(56, 'Amy is smart, but her brother Diego is ________. ', 6, NULL, 'Select', 'Full'),
(57, ' I didn\'t hear the ending of the story, but my friend ________ it to me.', 6, NULL, 'Select', 'Full'),
(58, '________ to class yesterday?', 6, NULL, 'Select', 'Full'),
(59, 'He went home for the holiday. Of course he took', 6, NULL, 'Select', 'Full'),
(60, 'That movie is not very good. Please don\'t watch', 6, NULL, 'Select', 'Full'),
(61, 'The teacher said that _______ was the best.', 6, NULL, 'Select', 'Full'),
(62, 'I had two earrings. I have one here, but do you know where I put ________?', 6, NULL, 'Select', 'Full'),
(63, 'This ribbon is ___________ than this string.', 6, NULL, 'Select', 'Full'),
(64, 'We got to the meeting late. When we walked in, the speaker _________ a presentation.', 6, NULL, 'Select', 'Full'),
(65, 'He has a very ________ face.', 6, NULL, 'Select', 'Full'),
(66, 'My advisor gave me two forms. I filled _________ right away.', 6, NULL, 'Select', 'Full'),
(67, 'The road was flooded. _____________ , we couldn\'t make it to the meeting.', 6, NULL, 'Select', 'Full'),
(68, 'I tried to convince Michael _________ to the concert with us', 6, NULL, 'Select', 'Full'),
(69, 'Carmen was born in Mexico, and ________', 6, NULL, 'Select', 'Full'),
(70, 'Madison has visited every state in the country. When she was only 15 years old, she     __________ 20 states.', 6, NULL, 'Select', 'Full'),
(71, 'I have a milk allergy. ____________ me that that our meal was made with milk, I would not have eaten it.', 6, NULL, 'Select', 'Full'),
(72, 'Although they appear to be the same material, these shirts _______ one is made with cotton and one is made with polyester.', 6, NULL, 'Select', 'Full'),
(73, 'Set during the Spanish Civil War, ________ , is one of the best war novels of all time.', 6, NULL, 'Select', 'Full'),
(74, 'More than 480,000 cigarette smokers die per year in the United States, including more than 41,000 deaths resulting from secondhand smoke exposure. This statistic indicates that about 1,300 people ______________ from cigarette smoke.', 6, NULL, 'Select', 'Full'),
(75, 'Choose ONE sentence below that best describes you as an editor of your own writing.', 777, NULL, 'Select', 'Partial'),
(76, 'Choose ONE sentence below that best describes how confident you feel making changes in your writing such as those related to structure, content, diction, tone, formality, design, and/or medium based on your audience or reader(s).', 777, NULL, 'Select', 'Partial'),
(77, 'Students in ENGL 110 are expected to demonstrate competency and consistency in the grammar, punctuation, and spelling used in their polished writing intended for a university audience. On a scale of 1 to 4, how would you rank your preparedness to do this?', 777, NULL, 'Select', 'Partial'),
(3004, 'Based on the descriptions of Option 1 and Option 2, which option do you feel is best for you?', 888, NULL, 'Select', 'Full Credit'),
(3005, 'Explain your choice. Why is this option the best choice for you? Be specific.', 888, NULL, 'Long Answer', 'No Credit'),
(3006, '<div oninput=\" this.className = \'\'\" >\r\n    <p class=\"required\" >1. In a paragraph, tell us about your typical process drafting an essay from start to finish. You can guide us through your experience writing a particular essay or speak about your writing process more generally (100-200 words).\r\n    </p>\r\n    <p>You may find it helpful to use some of the following questions to guide your response, but you need not respond to all of these questions or respond to them in order: How do you begin a writing project? Do you begin with free-writing, concept mapping, or outlining, or do you simply begin typing or writing by hand? How many sittings do you typically take to complete an assignment? What does your revision process look like? Do you typically seek feedback from others, such as peers, teachers, or tutors? And, if so, at what point\'s in the process? Do you engage in a final round of editing before submitting your essay? And, if so, tell us about this process.\r\n    </p>\r\n</div>', 333, NULL, 'Long Answer', 'No credit'),
(3007, '<div class=\"justify-content-center\">\r\n    <p >Respond to <u>one</u> of the following prompts in a short thesis-driven essay (250-400 words).</p>\r\n</div>\r\n<div style=\"padding:10px;\">\r\n    <div><p class=\"required\" >2. Tell us about an experience that has shaped how you feel about writing.</p><p><i>*Tips: This can take the shape of a narrative or personal essay (you can use &quot;I&quot;). Additionally, it is okay if the experience you share is not a positive one.</i></p></div>\r\n    <div style=\"text-align: center;\"><p>OR</p></div>\r\n    <div><p class=\"required\" >2. What is something that you know about or are good at that will help you achieve your goals while you are here at ODU? For example, is there an aspect of your work, education, or life experience that you expect to draw on as you work to achieve your goals at ODU?</p><p><i>*Tip: You may want to begin your essay by defining two goals you have for yourself at ODU.</i></p> \r\n    </div>\r\n</div>', 333, NULL, 'Long Answer', 'No credit'),
(3, 'How would you rate the difficulty of the previous section (the grammar diagnostic portion) of the\r\nexam?', 777, NULL, 'Select', 'Full');

-- --------------------------------------------------------

--
-- Table structure for table `response`
--

CREATE TABLE `response` (
  `uin` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option_id` int(11) DEFAULT NULL,
  `text_response` longtext NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `response`
--

INSERT INTO `response` (`uin`, `question_id`, `selected_option_id`, `text_response`, `id`) VALUES
(121, 1, 2, '', 1),
(121, 3006, NULL, 'You may find it helpful to use some of the following questions to guide your response, but you need not respond to all of these questions or respond to them in order', 2),
(121, 3007, NULL, 'You may find it helpful to use some of the following questions to guide your response, but you need not respond to all of these questions or respond to them in order', 3),
(121, 5, 45, '', 4),
(121, 7, 51, '', 5),
(121, 8, 56, '', 6),
(121, 9, 61, '', 7),
(121, 10, 67, '', 8),
(121, 11, 70, '', 9),
(121, 12, 75, '', 10),
(121, 13, 78, '', 11),
(121, 14, 82, '', 12),
(121, 15, 86, '', 13),
(121, 16, 95, '', 14),
(121, 17, 91, '', 15),
(121, 6, NULL, 'sdvcwd', 16),
(121, 32, 159, '', 17),
(121, 26, 131, '', 18),
(121, 28, 141, '', 19),
(121, 31, 155, '', 20),
(121, 29, 147, '', 21),
(121, 34, 167, '', 22),
(121, 35, 170, '', 23),
(121, 36, 175, '', 24),
(121, 37, 180, '', 25),
(121, 38, 184, '', 26),
(121, 39, 188, '', 27),
(121, 40, 195, '', 28),
(121, 3003, NULL, 'sdvjke,d', 29),
(121, 67, 443, '', 30),
(121, 71, 459, '', 31),
(121, 51, 381, '', 32),
(121, 66, 440, '', 33),
(121, 62, 425, '', 34),
(121, 59, 412, '', 35),
(121, 55, 396, '', 36),
(121, 56, 400, '', 37),
(121, 64, 432, '', 38),
(121, 61, 419, '', 39),
(121, 3, 37, '', 40),
(121, 75, 476, '', 41),
(121, 76, 480, '', 42),
(121, 77, 484, '', 43),
(121, 3004, 487, '', 44),
(121, 3005, NULL, 'sgercerg', 45),
(120, 1, 1, '', 46),
(120, 3006, NULL, 'You may find it helpful to use some of the following questions to guide your response, but you need not respond to all of these questions or respond to them in order: How do you begin a writing project? Do you begin with free-writing, concept mapping, or outlining, or do you simply begin typing or writing by hand? How many sittings do you typically take to complete an assignment? What does your revision process look like? Do you typically seek feedback from others, such as peers, teachers, or tutors? And, if so, at what points in the process? Do you engage in a final round of editing before submitting your essay? And, if so, tell us about this process.', 47),
(120, 3007, NULL, 'You may find it helpful to use some of the following questions to guide your response, but you need not respond to all of these questions or respond to them in order: How do you begin a writing project? Do you begin with free-writing, concept mapping, or outlining, or do you simply begin typing or writing by hand? How many sittings do you typically take to complete an assignment? What does your revision process look like? Do you typically seek feedback from others, such as peers, teachers, or tutors? And, if so, at what points in the process? Do you engage in a final round of editing before submitting your essay? And, if so, tell us about this process.You may find it helpful to use some of the following questions to guide your response, but you need not respond to all of these questions or respond to them in order: How do you begin a writing project? Do you begin with free-writing, concept mapping, or outlining, or do you simply begin typing or writing by hand? How many sittings do you typically take to complete an assignment? What does your revision process look like? Do you typically seek feedback from others, such as peers, teachers, or tutors? And, if so, at what points in the process? Do you engage in a final round of editing before submitting your essay? And, if so, tell us about this process.', 48),
(120, 5, 45, '', 49),
(120, 7, 50, '', 50),
(120, 8, 55, '', 51),
(120, 9, 62, '', 52),
(120, 10, 67, '', 53),
(120, 11, 70, '', 54),
(120, 12, 75, '', 55),
(120, 13, 77, '', 56),
(120, 14, 82, '', 57),
(120, 15, 86, '', 58),
(120, 16, 94, '', 59),
(120, 17, 89, '', 60),
(120, 6, NULL, 'enwkjgbf ke', 61),
(120, 20, 106, '', 62),
(120, 24, 123, '', 63),
(120, 18, 99, '', 64),
(120, 23, 119, '', 65),
(120, 22, 114, '', 66),
(120, 34, 167, '', 67),
(120, 35, 169, '', 68),
(120, 36, 173, '', 69),
(120, 37, 178, '', 70),
(120, 38, 184, '', 71),
(120, 39, 187, '', 72),
(120, 40, 195, '', 73),
(120, 3003, NULL, 'fly, in one or two sentences, sum u', 74),
(120, 43, 347, '', 75),
(120, 51, 380, '', 76),
(120, 70, 456, '', 77),
(120, 47, 364, '', 78),
(120, 57, 404, '', 79),
(120, 60, 417, '', 80),
(120, 65, 437, '', 81),
(120, 41, 338, '', 82),
(120, 58, 407, '', 83),
(120, 73, 468, '', 84),
(120, 3, 37, '', 85),
(120, 75, 476, '', 86),
(120, 76, 479, '', 87),
(120, 77, 483, '', 88),
(120, 3004, 487, '', 89),
(120, 3005, NULL, 'fly, in one or two sentences, sum u', 90),
(122, 1, 2, '', 91),
(122, 3006, NULL, 'In a paragraph, tell us about your typical process drafting an essay from start to finish. You can guide us through your experience writing a particular essay or speak about your writing process more generally (100-200 words).', 92),
(122, 3007, NULL, 'In a paragraph, tell us about your typical process drafting an essay from start to finish. You can guide us through your experience writing a particular essay or speak about your writing process more generally (100-200 words).In a paragraph, tell us about your typical process drafting an essay from start to finish. You can guide us through your experience writing a particular essay or speak about your writing process more generally (100-200 words).', 93),
(122, 5, 44, '', 94),
(122, 7, 48, '', 95),
(122, 8, 54, '', 96),
(122, 9, 59, '', 97),
(122, 10, 65, '', 98),
(122, 11, 68, '', 99),
(122, 12, 75, '', 100),
(122, 13, 76, '', 101),
(122, 14, 81, '', 102),
(122, 15, 84, '', 103),
(122, 16, 94, '', 104),
(122, 17, 89, '', 105),
(122, 6, NULL, 'kjlansd', 106);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `UIN` int(11) NOT NULL,
  `final_credit` int(11) DEFAULT NULL,
  `banner_credit` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`UIN`, `final_credit`, `banner_credit`) VALUES
(121, 68, 3),
(120, 70, 3),
(122, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_view_status`
--

CREATE TABLE `student_view_status` (
  `id` int(11) NOT NULL,
  `uin` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_view_status`
--

INSERT INTO `student_view_status` (`id`, `uin`, `category_id`, `seen`, `timestamp`) VALUES
(1, 121, 111, 1, '2020-04-23 01:50:21'),
(2, 121, 333, 1, '2020-04-23 01:54:14'),
(3, 121, 222, 1, '2020-04-23 01:55:58'),
(4, 121, 4, 1, '2020-04-23 01:56:07'),
(5, 121, 555, 1, '2020-04-23 01:56:25'),
(6, 121, 6, 1, '2020-04-23 01:56:37'),
(7, 121, 777, 1, '2020-04-23 01:56:44'),
(8, 121, 888, 1, '2020-04-23 01:56:51'),
(9, 120, 111, 1, '2020-04-23 01:58:56'),
(10, 120, 333, 1, '2020-04-23 02:01:20'),
(11, 120, 222, 1, '2020-04-23 02:02:01'),
(12, 120, 4, 1, '2020-04-23 02:02:08'),
(13, 120, 555, 1, '2020-04-23 02:02:22'),
(14, 120, 6, 1, '2020-04-23 02:02:33'),
(15, 120, 777, 1, '2020-04-23 02:02:39'),
(16, 120, 888, 1, '2020-04-23 02:03:07'),
(17, 122, 111, 1, '2020-04-26 20:50:51'),
(18, 122, 333, 1, '2020-04-26 20:51:05'),
(19, 122, 222, 1, '2020-04-26 23:43:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_fk0` (`question_id`);

--
-- Indexes for table `passage`
--
ALTER TABLE `passage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passage_fk0` (`category_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_fk0` (`category_id`),
  ADD KEY `questions_fk1` (`passage_id`);

--
-- Indexes for table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `response_fk1` (`question_id`),
  ADD KEY `response_fk2` (`selected_option_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`UIN`);

--
-- Indexes for table `student_view_status`
--
ALTER TABLE `student_view_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2223;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=488;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3008;

--
-- AUTO_INCREMENT for table `response`
--
ALTER TABLE `response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `student_view_status`
--
ALTER TABLE `student_view_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
