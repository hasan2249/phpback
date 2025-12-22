-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 22 ديسمبر 2025 الساعة 17:15
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpback`
--

-- --------------------------------------------------------

--
-- بنية الجدول `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) NOT NULL,
  `idea_id` bigint(20) NOT NULL,
  `file_name` varchar(260) NOT NULL,
  `file_type` varchar(260) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `boards`
--

CREATE TABLE `boards` (
  `id` bigint(20) NOT NULL,
  `name` varchar(160) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `boards`
--

INSERT INTO `boards` (`id`, `name`, `description`) VALUES
(1, 'بورد قسم التقنية (IT/Development)', NULL),
(3, 'بورد قسم التسويق  - (Marketing)', NULL),
(5, ' بورد الموارد البشرية (HR)', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `description` text NOT NULL,
  `ideas` int(11) NOT NULL,
  `board_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `ideas`, `board_id`) VALUES
(1, 'جودة المنتج وأدائه', 'تعليقات تتعلق بمتانة المنتج، سرعته، دقة النتائج التي يقدمها، أو وجود أي أعطال تقنية (Bugs) تؤثر على التجربة.', 7, 1),
(2, 'تجربة المستخدم وسهولة الاستخدام (Usability & UX)', 'ملاحظات حول وضوح الواجهات، سلاسة الخطوات للوصول للهدف، ومدى منطقية التصميم وتوزيع الأزرار أو الميزات.', 4, 1),
(3, 'طلب ميزات جديدة (Feature Requests)', 'تعليقات تعبر عن احتياجات مستقبلية، مثل: \"أتمنى لو كان هناك خيار لـ...\" أو \"سيكون رائعاً لو يدعم المنتج خاصية كذا\".', 1, 3),
(4, 'القيمة مقابل السعر (Pricing & Value)', 'آراء حول ما إذا كان السعر عادلاً، مرتفعاً جداً، أو إذا كانت الباقات المتوفرة تناسب ميزانية العميل واحتياجاته.', 1, 3),
(5, 'خدمة العملاء والدعم (Customer Support)', 'تقييم لسرعة استجابة فريق الدعم، مدى قدرتهم على حل المشكلات، ولطافة التعامل أثناء تقديم المساعدة.', 2, 3);

-- --------------------------------------------------------

--
-- بنية الجدول `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `ideaid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `comments`
--

INSERT INTO `comments` (`id`, `content`, `ideaid`, `userid`, `date`) VALUES
(1, 'هذا من دواعي سروري شكرا', 1, 1, '19/12/25 22:13'),
(2, 'بالفعل منتج جميل', 1, 2, '19/12/25 22:17');

-- --------------------------------------------------------

--
-- بنية الجدول `flags`
--

CREATE TABLE `flags` (
  `id` int(11) NOT NULL,
  `toflagid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `flags`
--

INSERT INTO `flags` (`id`, `toflagid`, `userid`, `date`) VALUES
(1, 2, 2, '19/12/25 22:17'),
(2, 1, 2, '19/12/25 22:17');

-- --------------------------------------------------------

--
-- بنية الجدول `ideas`
--

CREATE TABLE `ideas` (
  `id` int(11) NOT NULL,
  `title` tinytext NOT NULL,
  `content` text NOT NULL,
  `authorid` int(11) NOT NULL,
  `date` tinytext NOT NULL,
  `votes` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `status` tinytext NOT NULL,
  `categoryid` int(11) NOT NULL,
  `board_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `ideas`
--

INSERT INTO `ideas` (`id`, `title`, `content`, `authorid`, `date`, `votes`, `comments`, `status`, `categoryid`, `board_id`) VALUES
(1, 'أداء ثابت وموثوق', 'أستخدم المنتج منذ ثلاثة أشهر بشكل يومي، ولم ألاحظ أي تراجع في سرعة الاستجابة أو جودة التصنيع؛ إنه يعمل بنفس الكفاءة التي بدأ بها في اليوم الأول.', 1, '19/12/25 22:10', 3, 2, 'started', 1, 1),
(2, 'مشكلة في المتانة والتحمل', 'للأسف، تعطل الجزء الرئيسي من المنتج بعد أسبوع واحد فقط من الاستخدام البسيط. يبدو أن المواد المستخدمة في التصنيع لا تتحمل الضغط العادي.', 1, '19/12/25 22:11', 0, 0, 'considered', 1, 1),
(3, 'دقة عالية في المخرجات', '\"ما يميز هذا المنتج هو دقة النتائج التي يقدمها مقارنة بالمنافسين؛ التفاصيل واضحة جداً ولا يوجد أي تداخل أو أخطاء في الأداء الوظيفي.', 1, '19/12/25 22:12', 0, 0, 'considered', 2, 1),
(4, 'تجربة للوسوم', 'تجريب التكوير و الوسوم', 1, '20/12/25 01:00', 0, 0, 'planned', 1, 1),
(5, 'فكرة جديدة للاضافة ', 'فكرة جديدة للاضافة  فكرة جديدة للاضافة  فكرة جديدة للاضافة  فكرة جديدة للاضافة ', 1, '20/12/25 01:29', 0, 0, 'completed', 2, 1),
(6, 'منتج جيد جدا ', 'منتج جيد جدا  منتج جيد جدا  منتج جيد جدا ', 1, '20/12/25 01:51', 0, 0, 'considered', 1, 1),
(7, 'منتج جيد جدا ', 'منتج جيد جدا  منتج جيد جدا  منتج جيد جدا ', 1, '20/12/25 01:52', 0, 0, 'planned', 1, 1),
(8, 'مشكلة في تطوير ميزة جديدة لاضافة الملحقات', 'تجربة جديدة لاضافة الملحقات تجربة جديدة لاضافة الملحقات تجربة جديدة لاضافة الملحقات تجربة جديدة لاضافة الملحقات تجربة جديدة لاضافة الملحقات', 1, '20/12/25 02:20', 0, 0, 'considered', 4, 3),
(9, 'خطأ في محاولة جديدة للملحقات', 'محاولة جديدة للملحقات محاولة جديدة للملحقات محاولة جديدة للملحقات محاولة جديدة للملحقات محاولة جديدة للملحقات', 1, '20/12/25 02:30', 0, 0, 'considered', 2, 3),
(10, 'محاول 2 ملحقات', 'محاول 2 ملحقات محاول 2 ملحقاتمحاول 2 ملحقاتمحاول 2 ملحقاتمحاول 2 ملحقاتمحاول 2 ملحقاتمحاول 2 ملحقاتمحاول 2 ملحقاتمحاول 2 ملحقاتمحاول 2 ملحقات', 1, '20/12/25 02:33', 0, 0, 'considered', 5, 3),
(11, 'محاول 3 ملحقات', 'محاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقاتمحاول 3 ملحقات', 1, '20/12/25 02:38', 0, 0, 'considered', 1, 3),
(12, 'تأخر زمني', 'محاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقاتمحاول 4 ملحقات', 1, '20/12/25 02:43', 0, 0, 'considered', 5, 3),
(13, 'تجربة جديدة للملفات ', 'تجربة جديدة للملفات تجربة جديدة للملفات تجربة جديدة للملفات تجربة جديدة للملفات تجربة جديدة للملفات تجربة جديدة للملفات تجربة جديدة للملفات ', 1, '20/12/25 03:00', 0, 0, 'considered', 3, 3),
(14, 'التدقيق الآلي لواجهات الاستخدام (UX Auditor)', 'مشروع يهدف إلى بناء أداة ذكية مخصصة لمرحلة تطوير المواقع، تقوم بفحص الواجهات برمجياً وتحليلها بناءً على معايير تجربة المستخدم العالمية. توفر الأداة تقارير فورية حول سهولة الاستخدام، مثل قياس تباين الألوان، واختبار استجابة العناصر للنقر، والتأكد من توافق الواجهة مع ذوي الاحتياجات الخاصة، مما يقلل الفجوة بين المصمم والمطور ويضمن جودة المنتج النهائي قبل الإطلاق.', 1, '20/12/25 16:31', 0, 0, 'considered', 2, 3),
(15, 'جودة المنتجات عالية جدا', 'جودة المنتجات عالية جدا جودة المنتجات عالية جدا جودة المنتجات عالية جدا جودة المنتجات عالية جدا جودة المنتجات عالية جدا جودة المنتجات عالية جدا جودة المنتجات عالية جدا جودة المنتجات عالية جدا', 1, '20/12/25 19:37', 0, 0, 'considered', 1, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `idea_tags`
--

CREATE TABLE `idea_tags` (
  `id` bigint(20) NOT NULL,
  `idea_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `idea_tags`
--

INSERT INTO `idea_tags` (`id`, `idea_id`, `tag_id`) VALUES
(1, 7, 1),
(2, 7, 2),
(3, 8, 1),
(4, 8, 3),
(5, 9, 3),
(6, 10, 1),
(7, 11, 2),
(8, 12, 3),
(9, 12, 2),
(10, 13, 2),
(11, 14, 1),
(12, 14, 2),
(13, 15, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `content` tinytext NOT NULL,
  `date` tinytext NOT NULL,
  `type` tinytext NOT NULL,
  `toid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `logs`
--

INSERT INTO `logs` (`id`, `content`, `date`, `type`, `toid`) VALUES
(1, '\'جودة المنتج وأدائه\'category has been created', '19/12/25 22:07', 'user', 1),
(2, '\'تجربة المستخدم وسهولة الاستخدام (Usability & UX)\'category has been created', '19/12/25 22:07', 'user', 1),
(3, '\'طلب ميزات جديدة (Feature Requests)\'category has been created', '19/12/25 22:08', 'user', 1),
(4, '\'القيمة مقابل السعر (Pricing & Value)\'category has been created', '19/12/25 22:08', 'user', 1),
(5, '\'خدمة العملاء والدعم (Customer Support)\'category has been created', '19/12/25 22:08', 'user', 1),
(6, 'New idea created: أداء ثابت وموثوق', '19/12/25 22:10', 'user', 1),
(7, 'New idea created: مشكلة في المتانة والتحمل', '19/12/25 22:11', 'user', 1),
(8, 'New idea created: دقة عالية في المخرجات', '19/12/25 22:12', 'user', 1),
(9, 'Approved idea #1', '19/12/25 22:13', 'user', 1),
(10, 'Changed status of idea #1 to started', '19/12/25 22:13', 'user', 1),
(11, 'Idea #1 commented', '19/12/25 22:13', 'user', 1),
(12, 'Idea #1 voted with 3 votes', '19/12/25 22:14', 'user', 1),
(13, 'User registered: User one(user@user.com)', '19/12/25 22:16', 'general', 0),
(14, 'Idea #1 commented', '19/12/25 22:17', 'user', 2),
(15, 'Idea #1 voted with 2 votes', '19/12/25 22:17', 'user', 2),
(16, 'Banned user #2 for 20251220 days', '19/12/25 13:18', 'user', 1),
(17, 'User #$id has been banned', '19/12/25 13:18', 'user', 2),
(18, 'Disabled ban for user #2', '19/12/25 22:49', 'user', 1),
(19, '\'تطوير\'tag has been created', '20/12/25 00:05', 'user', 1),
(20, '\'واجهات\'tag has been created', '20/12/25 00:06', 'user', 1),
(21, '\'هارد\'tag has been created', '20/12/25 00:06', 'user', 1),
(22, '\'كميرا\'tag has been created', '20/12/25 00:06', 'user', 1),
(23, 'Tag \'كميرا\' changed to \'كميرات\'', '20/12/25 00:06', 'user', 1),
(24, 'Tag \'كميرا\' changed to \'كميرات\'', '20/12/25 00:07', 'user', 1),
(25, 'Tag #4 deleted', '20/12/25 00:10', 'user', 1),
(26, 'Tag \'تطوير\' changed to \'تطويات\'', '20/12/25 00:12', 'user', 1),
(27, 'Tag \'هارد\' changed to \'هاردcd\'', '20/12/25 00:15', 'user', 1),
(28, 'Tag \'هارد\' changed to \'هاردcd\'', '20/12/25 00:16', 'user', 1),
(29, 'Tag \'هارد\' changed to \'هاردcd\'', '20/12/25 00:18', 'user', 1),
(30, 'Tag \'هارد\' changed to \'هاردcd\'', '20/12/25 00:20', 'user', 1),
(31, 'New idea created: تجربة للوسوم', '20/12/25 01:00', 'user', 1),
(32, 'New idea created: فكرة جديدة للاضافة ', '20/12/25 01:29', 'user', 1),
(33, 'Approved idea #5', '20/12/25 01:32', 'user', 1),
(34, 'New idea created: منتج جيد جدا ', '20/12/25 01:52', 'user', 1),
(35, 'New idea created: تجربة جديدة لاضافة الملحقات', '20/12/25 02:20', 'user', 1),
(36, 'New idea created: محاولة جديدة للملحقات', '20/12/25 02:30', 'user', 1),
(37, 'New idea created: محاول 2 ملحقات', '20/12/25 02:33', 'user', 1),
(38, 'New idea created: محاول 3 ملحقات', '20/12/25 02:38', 'user', 1),
(39, 'New idea created: محاول 4 ملحقات', '20/12/25 02:43', 'user', 1),
(40, 'Approved idea #12', '20/12/25 02:56', 'user', 1),
(41, 'New idea created: تجربة جديدة للملفات ', '20/12/25 03:00', 'user', 1),
(42, 'Changed status of idea #5 to completed', '20/12/25 10:14', 'user', 1),
(43, 'Approved idea #4', '20/12/25 10:14', 'user', 1),
(44, 'Changed status of idea #4 to planned', '20/12/25 10:14', 'user', 1),
(45, 'Approved idea #13', '20/12/25 11:42', 'user', 1),
(46, 'Approved idea #11', '20/12/25 11:42', 'user', 1),
(47, 'Approved idea #10', '20/12/25 11:43', 'user', 1),
(48, 'Approved idea #9', '20/12/25 11:43', 'user', 1),
(49, 'Approved idea #8', '20/12/25 11:43', 'user', 1),
(50, 'Approved idea #7', '20/12/25 11:43', 'user', 1),
(51, 'Approved idea #6', '20/12/25 11:43', 'user', 1),
(52, 'Approved idea #3', '20/12/25 11:43', 'user', 1),
(53, 'Approved idea #2', '20/12/25 11:43', 'user', 1),
(54, '\'خدمات\'tag has been created', '20/12/25 16:00', 'user', 1),
(55, '\'خدمات\'', '20/12/25 16:00', 'user', 1),
(56, '\'خدمات\'', '20/12/25 16:03', 'user', 1),
(57, '\'خدمات\'name was updated', '20/12/25 16:05', 'user', 1),
(58, '\'خدمات\'name was updated', '20/12/25 16:05', 'user', 1),
(59, '\'خدمات\'name was updated', '20/12/25 16:07', 'user', 1),
(60, '\'مستعجل\'tag has been created', '20/12/25 16:19', 'user', 1),
(61, 'Tag #6 deleted', '20/12/25 16:19', 'user', 1),
(62, 'Tag \'خدمات\' changed to \'خدمات فورية\'', '20/12/25 16:20', 'user', 1),
(63, 'New idea created: التدقيق الآلي لواجهات الاستخدام (UX Auditor)', '20/12/25 16:31', 'user', 1),
(64, 'Approved idea #14', '20/12/25 16:32', 'user', 1),
(65, '\'بورد قسم التقنية (IT/Development)\'Board has been created', '20/12/25 17:15', 'user', 1),
(66, '\'بورد قسم التسويق (Marketing)\'Board has been created', '20/12/25 17:15', 'user', 1),
(67, 'Tag #2 deleted', '20/12/25 17:17', 'user', 1),
(68, '\'بورد قسم التقنية (IT/Development)\'name was updated', '20/12/25 17:17', 'user', 1),
(69, '\'بورد قسم التسويق (Marketing)\'Board has been created', '20/12/25 17:17', 'user', 1),
(70, 'Board \'بورد قسم التسويق (Marketing)\' changed to \'بورد قسم التسويق  - (Marketing)\'', '20/12/25 17:20', 'user', 1),
(71, '\' بورد الموارد البشرية (HR)\'Board has been created', '20/12/25 19:27', 'user', 1),
(72, 'Tag #4 deleted', '20/12/25 19:28', 'user', 1),
(73, 'New idea created: جودة المنتجات عالية جدا', '20/12/25 19:37', 'user', 1),
(74, 'Approved idea #15', '20/12/25 19:38', 'user', 1),
(75, '\' بورد الموارد البشرية (HR)\'Board has been created', '20/12/25 20:46', 'user', 1),
(76, 'User registered: mohammad(editor@admin.com)', '21/12/25 13:38', 'general', 0),
(77, 'User has been updated to administrator', '21/12/25 14:28', 'user', 2),
(78, 'User has been updated to administrator', '21/12/25 14:28', 'user', 3);

-- --------------------------------------------------------

--
-- بنية الجدول `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) NOT NULL,
  `perm_key` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `permissions`
--

INSERT INTO `permissions` (`id`, `perm_key`) VALUES
(1, 'add-tag'),
(2, 'update-tag'),
(3, 'delete-tag');

-- --------------------------------------------------------

--
-- بنية الجدول `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'editor'),
(2, 'admin'),
(3, 'super-admin');

-- --------------------------------------------------------

--
-- بنية الجدول `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 2, 1),
(4, 3, 3),
(5, 2, 2),
(6, 1, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `value` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'title', 'feedback'),
(2, 'welcometext-title', 'Welcome to our feedback'),
(3, 'welcometext-description', 'Here you can suggest ideas to improve our services or vote on ideas from other people'),
(4, 'recaptchapublic', ''),
(5, 'recaptchaprivate', ''),
(6, 'language', 'english'),
(7, 'maxvotes', '20'),
(8, 'mainmail', 'admin@admin.com'),
(9, 'max_results', '10'),
(10, 'smtp-host', ''),
(11, 'smtp-port', '25'),
(12, 'smtp-user', ''),
(13, 'smtp-pass', '');

-- --------------------------------------------------------

--
-- بنية الجدول `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL,
  `name` varchar(160) NOT NULL,
  `board_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tags`
--

INSERT INTO `tags` (`id`, `name`, `board_id`) VALUES
(1, 'تطوير', 1),
(2, 'واجهات', 1),
(3, 'مشاكل', 3),
(5, 'خدمات فورية', 3);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `email` tinytext NOT NULL,
  `pass` tinytext NOT NULL,
  `votes` int(11) NOT NULL,
  `isadmin` tinyint(1) NOT NULL,
  `banned` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `pass`, `votes`, `isadmin`, `banned`) VALUES
(1, 'hasan', 'admin@admin.com', '$2a$08$pV6FVEb42X/VZQUMkMCdweij079qfWAtKS7Vx6eWKGxzYnXSVsifC', 19, 3, 0),
(2, 'User one', 'user@user.com', '$2a$08$6L4TsUuE5a790zfdZC.3HOmAS5FSRGXNXXH.GVJ79PGLUI6kismhO', 18, 2, 0),
(3, 'mohammad', 'editor@admin.com', '$2a$08$atD/Py3eQARRcjjYfV.eleQ2eamZb/yYv8K7eEVbiR0QOVpiKTt9S', 20, 1, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `ideaid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `votes`
--

INSERT INTO `votes` (`id`, `ideaid`, `userid`, `number`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2);

-- --------------------------------------------------------

--
-- بنية الجدول `_sessions`
--

CREATE TABLE `_sessions` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `token` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idea_id` (`idea_id`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `board_id` (`board_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `flags`
--
ALTER TABLE `flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `ideas`
--
ALTER TABLE `ideas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `board_id` (`board_id`);

--
-- Indexes for table `idea_tags`
--
ALTER TABLE `idea_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idea_id` (`idea_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `board_id` (`board_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `_sessions`
--
ALTER TABLE `_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flags`
--
ALTER TABLE `flags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ideas`
--
ALTER TABLE `ideas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `idea_tags`
--
ALTER TABLE `idea_tags`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `_sessions`
--
ALTER TABLE `_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
