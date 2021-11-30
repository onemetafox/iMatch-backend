/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : localhost:3306
 Source Schema         : imatch

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 23/11/2021 10:13:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_adminmessage
-- ----------------------------
DROP TABLE IF EXISTS `tb_adminmessage`;
CREATE TABLE `tb_adminmessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `message2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_adminmessage
-- ----------------------------
INSERT INTO `tb_adminmessage` VALUES (1, 'If Your Wife slaps your mom for striking your child', 'If Your Husband slaps your dad for striking your child', '2020-11-03 04:37:46');

-- ----------------------------
-- Table structure for tb_answerlike
-- ----------------------------
DROP TABLE IF EXISTS `tb_answerlike`;
CREATE TABLE `tb_answerlike`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_liked` int(11) NULL DEFAULT NULL,
  `questionid` int(11) NULL DEFAULT NULL,
  `answerid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `like_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IsActive` int(11) NULL DEFAULT 0 COMMENT '0-active,1-not active',
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_bestie
-- ----------------------------
DROP TABLE IF EXISTS `tb_bestie`;
CREATE TABLE `tb_bestie`  (
  `bestie_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_from` int(11) NOT NULL,
  `req_to` int(11) NOT NULL,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `req_status` int(11) NULL DEFAULT 0,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`bestie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bestie
-- ----------------------------
INSERT INTO `tb_bestie` VALUES (1, 2, 3, 'squad', 0, 0, '2021-11-20 11:56:31');
INSERT INTO `tb_bestie` VALUES (2, 2, 3, 'bestie', 0, 0, '2021-11-20 12:04:12');
INSERT INTO `tb_bestie` VALUES (3, 3, 2, 'squad', 1, 1, '2021-11-22 04:38:34');

-- ----------------------------
-- Table structure for tb_bestiecomment
-- ----------------------------
DROP TABLE IF EXISTS `tb_bestiecomment`;
CREATE TABLE `tb_bestiecomment`  (
  `bestie_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bestie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_bestielike
-- ----------------------------
DROP TABLE IF EXISTS `tb_bestielike`;
CREATE TABLE `tb_bestielike`  (
  `bestie_id` int(11) NOT NULL AUTO_INCREMENT,
  `like_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bestie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_bestmoment
-- ----------------------------
DROP TABLE IF EXISTS `tb_bestmoment`;
CREATE TABLE `tb_bestmoment`  (
  `momentid` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`momentid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_bestmomentupload
-- ----------------------------
DROP TABLE IF EXISTS `tb_bestmomentupload`;
CREATE TABLE `tb_bestmomentupload`  (
  `uploadid` int(11) NOT NULL AUTO_INCREMENT,
  `momentid` int(11) NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`uploadid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `replied_commentid` int(11) NULL DEFAULT 0 COMMENT '0=not replied comment',
  `match_id` int(11) NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `contestent_id` int(11) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `commented_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES (1, 0, 6, 2, 0, 'This is the first comment for the Personal Match', '2021-11-15 18:24:35');
INSERT INTO `tb_comment` VALUES (2, 0, 6, 2, 0, 'I hope every body vote for my post', '2021-11-15 18:24:54');
INSERT INTO `tb_comment` VALUES (3, 0, 6, 2, 0, 'Thanks for your posting', '2021-11-15 18:25:10');
INSERT INTO `tb_comment` VALUES (4, 0, 7, 2, 0, 'This is the test comment', '2021-11-15 19:23:05');
INSERT INTO `tb_comment` VALUES (5, 0, 7, 2, 0, 'Second commend', '2021-11-15 19:23:35');
INSERT INTO `tb_comment` VALUES (6, 0, 2, 2, 0, 'This match is good', '2021-11-15 19:43:51');

-- ----------------------------
-- Table structure for tb_commentlike
-- ----------------------------
DROP TABLE IF EXISTS `tb_commentlike`;
CREATE TABLE `tb_commentlike`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentid` int(11) NULL DEFAULT NULL,
  `userliked` int(11) NULL DEFAULT NULL,
  `likestatus` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_countrycode
-- ----------------------------
DROP TABLE IF EXISTS `tb_countrycode`;
CREATE TABLE `tb_countrycode`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `country_code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `iso_code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_countrycode
-- ----------------------------
INSERT INTO `tb_countrycode` VALUES (1, 'Afghanistan', 'AFG', '93', 'Afghanistan.png');
INSERT INTO `tb_countrycode` VALUES (2, 'Albania', 'ALB', '355', 'Albania.png');
INSERT INTO `tb_countrycode` VALUES (3, 'Algeria', 'DZA', '213', 'Algeria.png');
INSERT INTO `tb_countrycode` VALUES (4, 'American_Samoa', 'ASM', '1-684', 'American_Samoa.png');
INSERT INTO `tb_countrycode` VALUES (5, 'Andorra', 'AND', '376', 'Andorra.png');
INSERT INTO `tb_countrycode` VALUES (6, 'Angola', 'AGO', '244', 'Angola.png');
INSERT INTO `tb_countrycode` VALUES (7, 'Anguilla', 'AIA', '1-264', 'Anguilla.png');
INSERT INTO `tb_countrycode` VALUES (8, 'Antarctica', 'ATA', '672', 'Antarctica.png');
INSERT INTO `tb_countrycode` VALUES (9, 'Antigua_and_Barbuda', 'ATG', '1-268', 'Antigua_and_Barbuda.png');
INSERT INTO `tb_countrycode` VALUES (10, 'Argentina', 'ARG', '54', 'Argentina.png');
INSERT INTO `tb_countrycode` VALUES (11, 'Armenia', 'ARM', '374', 'Armenia.png');
INSERT INTO `tb_countrycode` VALUES (12, 'Aruba', 'ABW', '297', 'Aruba.png');
INSERT INTO `tb_countrycode` VALUES (13, 'Australia', 'AUS', '61', 'Australia.png');
INSERT INTO `tb_countrycode` VALUES (14, 'Austria', 'AUT', '43', 'Austria.png');
INSERT INTO `tb_countrycode` VALUES (15, 'Azerbaijan', 'AZE', '994', 'Azerbaijan.png');
INSERT INTO `tb_countrycode` VALUES (16, 'Bahamas', 'BHS', '1-242', 'Bahamas.png');
INSERT INTO `tb_countrycode` VALUES (17, 'Bahrain', 'BHR', '973', 'Bahrain.png');
INSERT INTO `tb_countrycode` VALUES (18, 'Bangladesh', 'BGD', '880', 'Bangladesh.png');
INSERT INTO `tb_countrycode` VALUES (19, 'Barbados', 'BRB', '1-246', 'Barbados.png');
INSERT INTO `tb_countrycode` VALUES (20, 'Belarus', 'BLR', '375', 'Belarus.png');
INSERT INTO `tb_countrycode` VALUES (21, 'Belgium', 'BEL', '32', 'Belgium.png');
INSERT INTO `tb_countrycode` VALUES (22, 'Belize', 'BLZ', '501', 'Belize.png');
INSERT INTO `tb_countrycode` VALUES (23, 'Benin', 'BEN', '229', 'Benin.png');
INSERT INTO `tb_countrycode` VALUES (24, 'Bermuda', 'BMU', '1-441', 'Bermuda.png');
INSERT INTO `tb_countrycode` VALUES (25, 'Bhutan', 'BTN', '975', 'Bhutan.png');
INSERT INTO `tb_countrycode` VALUES (26, 'Bolivia', 'BOL', '591', 'Bolivia.png');
INSERT INTO `tb_countrycode` VALUES (27, 'Bosnia and Herzegovina', 'BIH', '387', 'Bosnia_and_Herzegovina.png');
INSERT INTO `tb_countrycode` VALUES (28, 'Botswana', 'BWA', '267', 'Botswana.png');
INSERT INTO `tb_countrycode` VALUES (29, 'Brazil', 'BRA', '55', 'Brazil.png');
INSERT INTO `tb_countrycode` VALUES (30, 'British Indian Ocean Territory', 'IOT', '246', 'British_Indian_Ocean_Territory.png');
INSERT INTO `tb_countrycode` VALUES (31, 'British Virgin Islands', 'VGB', '1-284', 'British_Virgin_Islands.png');
INSERT INTO `tb_countrycode` VALUES (32, 'Brunei', 'BRN', '673', 'Brunei.png');
INSERT INTO `tb_countrycode` VALUES (33, 'Bulgaria', 'BGR', '359', 'Bulgaria.png');
INSERT INTO `tb_countrycode` VALUES (34, 'Burkina Faso', 'BFA', '226', 'Burkina_Faso.png');
INSERT INTO `tb_countrycode` VALUES (35, 'Burundi', 'BDI', '257', 'Burundi.png');
INSERT INTO `tb_countrycode` VALUES (36, 'Cambodia', 'KHM', '855', 'Cambodia.png');
INSERT INTO `tb_countrycode` VALUES (37, 'Cameroon', 'CMR', '237', 'Cameroon.png');
INSERT INTO `tb_countrycode` VALUES (38, 'Canada', 'CAN', '1', 'Canada.png');
INSERT INTO `tb_countrycode` VALUES (39, 'Cape Verde', 'CPV', '238', 'Cape_Verde.png');
INSERT INTO `tb_countrycode` VALUES (40, 'Cayman Islands', 'CYM', '1-345', 'Cayman_Islands.png');
INSERT INTO `tb_countrycode` VALUES (41, 'Central African Republic', 'CAF', '236', 'Central_African_Republic.png');
INSERT INTO `tb_countrycode` VALUES (42, 'Chad', 'TCD', '235', 'Chad.png');
INSERT INTO `tb_countrycode` VALUES (43, 'Chile', 'CHL', '56', 'Chile.png');
INSERT INTO `tb_countrycode` VALUES (44, 'China', 'CHN', '86', 'China.png');
INSERT INTO `tb_countrycode` VALUES (45, 'Christmas Island', 'CXR', '61', 'Christmas_Island.png');
INSERT INTO `tb_countrycode` VALUES (46, 'Cocos Islands', 'CCK', '61', 'Cocos_Islands.png');
INSERT INTO `tb_countrycode` VALUES (47, 'Colombia', 'COL', '57', 'Colombia.png');
INSERT INTO `tb_countrycode` VALUES (48, 'Comoros', 'COM', '269', 'Comoros.png');
INSERT INTO `tb_countrycode` VALUES (49, 'Cook Islands', 'COK', '682', 'Cook_Islands.png');
INSERT INTO `tb_countrycode` VALUES (50, 'Costa Rica', 'CRI', '506', 'Costa_Rica.png');
INSERT INTO `tb_countrycode` VALUES (51, 'Croatia', 'HRV', '385', 'Croatia.png');
INSERT INTO `tb_countrycode` VALUES (52, 'Cuba', 'CUB', '53', 'Cuba.png');
INSERT INTO `tb_countrycode` VALUES (53, 'Curacao', 'CUW', '599', 'Curacao.png');
INSERT INTO `tb_countrycode` VALUES (54, 'Cyprus', 'CYP', '357', 'Cyprus.png');
INSERT INTO `tb_countrycode` VALUES (55, 'Czech Republic', 'CZE', '420', 'Czech_Republic.png');
INSERT INTO `tb_countrycode` VALUES (56, 'Democratic Republic of the Congo', 'COD', '243', 'Democratic_Republic_of_the_Congo.png');
INSERT INTO `tb_countrycode` VALUES (57, 'Denmark', 'DNK', '45', 'Denmark.png');
INSERT INTO `tb_countrycode` VALUES (58, 'Djibouti', 'DJI', '253', 'Djibouti.png');
INSERT INTO `tb_countrycode` VALUES (59, 'Dominica', 'DMA', '1-767', 'Dominica.png');
INSERT INTO `tb_countrycode` VALUES (60, 'Dominican Republic', 'DOM', '1-809, 1-829, 1-849', 'Dominican_Republic.png');
INSERT INTO `tb_countrycode` VALUES (61, 'East Timor', 'TLS', '670', 'East_Timor.png');
INSERT INTO `tb_countrycode` VALUES (62, 'Ecuador', 'ECU', '593', 'Ecuador.png');
INSERT INTO `tb_countrycode` VALUES (63, 'Egypt', 'EGY', '20', 'Egypt.png');
INSERT INTO `tb_countrycode` VALUES (64, 'El Salvador', 'SLV', '503', 'El_Salvador.png');
INSERT INTO `tb_countrycode` VALUES (65, 'Equatorial Guinea', 'GNQ', '240', 'Equatorial_Guinea.png');
INSERT INTO `tb_countrycode` VALUES (66, 'Eritrea', 'ERI', '291', 'Eritrea.png');
INSERT INTO `tb_countrycode` VALUES (67, 'Estonia', 'EST', '372', 'Estonia.png');
INSERT INTO `tb_countrycode` VALUES (68, 'Ethiopia', 'ETH', '251', 'Ethiopia.png');
INSERT INTO `tb_countrycode` VALUES (69, 'Falkland Islands', 'FLK', '500', 'Falkland_Islands.png');
INSERT INTO `tb_countrycode` VALUES (70, 'Faroe Islands', 'FRO', '298', 'Faroe_Islands.png');
INSERT INTO `tb_countrycode` VALUES (71, 'Fiji', 'FJI', '679', 'Fiji.png');
INSERT INTO `tb_countrycode` VALUES (72, 'Finland', 'FIN', '358', 'Finland.png');
INSERT INTO `tb_countrycode` VALUES (73, 'France', 'FRA', '33', 'France.png');
INSERT INTO `tb_countrycode` VALUES (74, 'French Polynesia', 'PYF', '689', 'French_Polynesia.png');
INSERT INTO `tb_countrycode` VALUES (75, 'Gabon', 'GAB', '241', 'Gabon.png');
INSERT INTO `tb_countrycode` VALUES (76, 'Gambia', 'GMB', '220', 'Gambia.png');
INSERT INTO `tb_countrycode` VALUES (77, 'Georgia', 'GEO', '995', 'Georgia.png');
INSERT INTO `tb_countrycode` VALUES (78, 'Germany', 'DEU', '49', 'Germany.png');
INSERT INTO `tb_countrycode` VALUES (79, 'Ghana', 'GHA', '233', 'Ghana.png');
INSERT INTO `tb_countrycode` VALUES (80, 'Gibraltar', 'GIB', '350', 'Gibraltar.png');
INSERT INTO `tb_countrycode` VALUES (81, 'Greece', 'GRC', '30', 'Greece.png');
INSERT INTO `tb_countrycode` VALUES (82, 'Greenland', 'GRL', '299', 'Greenland.png');
INSERT INTO `tb_countrycode` VALUES (83, 'Grenada', 'GRD', '1-473', 'Grenada.png');
INSERT INTO `tb_countrycode` VALUES (84, 'Guam', 'GUM', '1-671', 'Guam.png');
INSERT INTO `tb_countrycode` VALUES (85, 'Guatemala', 'GTM', '502', 'Guatemala.png');
INSERT INTO `tb_countrycode` VALUES (86, 'Guernsey', 'GGY', '44-1481', 'Guernsey.png');
INSERT INTO `tb_countrycode` VALUES (87, 'Guinea', 'GIN', '224', 'Guinea.png');
INSERT INTO `tb_countrycode` VALUES (88, 'Guinea-Bissau', 'GNB', '245', 'Guinea-Bissau.png');
INSERT INTO `tb_countrycode` VALUES (89, 'Guyana', 'GUY', '592', 'Guyana.png');
INSERT INTO `tb_countrycode` VALUES (90, 'Haiti', 'HTI', '509', 'Haiti.png');
INSERT INTO `tb_countrycode` VALUES (91, 'Honduras', 'HND', '504', 'Honduras.png');
INSERT INTO `tb_countrycode` VALUES (92, 'Hong Kong', 'HKG', '852', 'Hong_Kong.png');
INSERT INTO `tb_countrycode` VALUES (93, 'Hungary', 'HUN', '36', 'Hungary.png');
INSERT INTO `tb_countrycode` VALUES (94, 'Iceland', 'ISL', '354', 'Iceland.png');
INSERT INTO `tb_countrycode` VALUES (95, 'India', 'IND', '91', 'India.png');
INSERT INTO `tb_countrycode` VALUES (96, 'Indonesia', 'IDN', '62', 'Indonesia.png');
INSERT INTO `tb_countrycode` VALUES (97, 'Iran', 'IRN', '98', 'Iran.png');
INSERT INTO `tb_countrycode` VALUES (98, 'Iraq', 'IRQ', '964', 'Iraq.png');
INSERT INTO `tb_countrycode` VALUES (99, 'Ireland', 'IRL', '353', 'Ireland.png');
INSERT INTO `tb_countrycode` VALUES (100, 'Isle of Man', 'IMN', '44-1624', 'Isle_of_Man.png');
INSERT INTO `tb_countrycode` VALUES (101, 'Israel', 'ISR', '972', 'Israel.png');
INSERT INTO `tb_countrycode` VALUES (102, 'Italy', 'ITA', '39', 'Italy.png');
INSERT INTO `tb_countrycode` VALUES (103, 'Ivory Coast', 'CIV', '225', 'Ivory_Coast.png');
INSERT INTO `tb_countrycode` VALUES (104, 'Jamaica', 'JAM', '1-876', 'Jamaica.png');
INSERT INTO `tb_countrycode` VALUES (105, 'Japan', 'JPN', '81', 'Japan.png');
INSERT INTO `tb_countrycode` VALUES (106, 'Jersey', 'JEY', '44-1534', 'Jersey.png');
INSERT INTO `tb_countrycode` VALUES (107, 'Jordan', 'JOR', '962', 'Jordan.png');
INSERT INTO `tb_countrycode` VALUES (108, 'Kazakhstan', 'KAZ', '7', 'Kazakhstan.png');
INSERT INTO `tb_countrycode` VALUES (109, 'Kenya', 'KEN', '254', 'Kenya.png');
INSERT INTO `tb_countrycode` VALUES (110, 'Kiribati', 'KIR', '686', 'Kiribati.png');
INSERT INTO `tb_countrycode` VALUES (111, 'Kosovo', 'XKX', '383', 'Kosovo.png');
INSERT INTO `tb_countrycode` VALUES (112, 'Kuwait', 'KWT', '965', 'Kuwait.png');
INSERT INTO `tb_countrycode` VALUES (113, 'Kyrgyzstan', 'KGZ', '996', 'Kyrgyzstan.png');
INSERT INTO `tb_countrycode` VALUES (114, 'Laos', 'LAO', '856', 'Laos.png');
INSERT INTO `tb_countrycode` VALUES (115, 'Latvia', 'LVA', '371', 'Latvia.png');
INSERT INTO `tb_countrycode` VALUES (116, 'Lebanon', 'LBN', '961', 'Lebanon.png');
INSERT INTO `tb_countrycode` VALUES (117, 'Lesotho', 'LSO', '266', 'Lesotho.png');
INSERT INTO `tb_countrycode` VALUES (118, 'Liberia', 'LBR', '231', 'Liberia.png');
INSERT INTO `tb_countrycode` VALUES (119, 'Libya', 'LBY', '218', 'Libya.png');
INSERT INTO `tb_countrycode` VALUES (120, 'Liechtenstein', 'LIE', '423', 'Liechtenstein.png');
INSERT INTO `tb_countrycode` VALUES (121, 'Lithuania', 'LTU', '370', 'Lithuania.png');
INSERT INTO `tb_countrycode` VALUES (122, 'Luxembourg', 'LUX', '352', 'Luxembourg.png');
INSERT INTO `tb_countrycode` VALUES (123, 'Macau', 'MAC', '853', '');
INSERT INTO `tb_countrycode` VALUES (124, 'Macedonia', 'MKD', '389', '');
INSERT INTO `tb_countrycode` VALUES (125, 'Madagascar', 'MDG', '261', '');
INSERT INTO `tb_countrycode` VALUES (126, 'Malawi', 'MWI', '265', '');
INSERT INTO `tb_countrycode` VALUES (127, 'Malaysia', 'MYS', '60', '');
INSERT INTO `tb_countrycode` VALUES (128, 'Maldives', 'MDV', '960', '');
INSERT INTO `tb_countrycode` VALUES (129, 'Mali', 'MLI', '223', '');
INSERT INTO `tb_countrycode` VALUES (130, 'Malta', 'MLT', '356', '');
INSERT INTO `tb_countrycode` VALUES (131, 'Marshall Islands', 'MHL', '692', '');
INSERT INTO `tb_countrycode` VALUES (132, 'Mauritania', 'MRT', '222', '');
INSERT INTO `tb_countrycode` VALUES (133, 'Mauritius', 'MUS', '230', '');
INSERT INTO `tb_countrycode` VALUES (134, 'Mayotte', 'MYT', '262', '');
INSERT INTO `tb_countrycode` VALUES (135, 'Mexico', 'MEX', '52', '');
INSERT INTO `tb_countrycode` VALUES (136, 'Micronesia', 'FSM', '691', '');
INSERT INTO `tb_countrycode` VALUES (137, 'Moldova', 'MDA', '373', '');
INSERT INTO `tb_countrycode` VALUES (138, 'Monaco', 'MCO', '377', '');
INSERT INTO `tb_countrycode` VALUES (139, 'Mongolia', 'MNG', '976', '');
INSERT INTO `tb_countrycode` VALUES (140, 'Montenegro', 'MNE', '382', '');
INSERT INTO `tb_countrycode` VALUES (141, 'Montserrat', 'MSR', '1-664', '');
INSERT INTO `tb_countrycode` VALUES (142, 'Morocco', 'MAR', '212', '');
INSERT INTO `tb_countrycode` VALUES (143, 'Mozambique', 'MOZ', '258', '');
INSERT INTO `tb_countrycode` VALUES (144, 'Myanmar', 'MMR', '95', '');
INSERT INTO `tb_countrycode` VALUES (145, 'Namibia', 'NAM', '264', '');
INSERT INTO `tb_countrycode` VALUES (146, 'Nauru', 'NRU', '674', '');
INSERT INTO `tb_countrycode` VALUES (147, 'Nepal', 'NPL', '977', '');
INSERT INTO `tb_countrycode` VALUES (148, 'Netherlands', 'NLD', '31', '');
INSERT INTO `tb_countrycode` VALUES (149, 'Netherlands Antilles', 'ANT', '599', 'Netherlands_Antilles.png');
INSERT INTO `tb_countrycode` VALUES (150, 'New Caledonia', 'NCL', '687', '');
INSERT INTO `tb_countrycode` VALUES (151, 'New Zealand', 'NZL', '64', '');
INSERT INTO `tb_countrycode` VALUES (152, 'Nicaragua', 'NIC', '505', '');
INSERT INTO `tb_countrycode` VALUES (153, 'Niger', 'NER', '227', '');
INSERT INTO `tb_countrycode` VALUES (154, 'Nigeria', 'NGA', '234', '');
INSERT INTO `tb_countrycode` VALUES (155, 'Niue', 'NIU', '683', '');
INSERT INTO `tb_countrycode` VALUES (156, 'North Korea', 'PRK', '850', '');
INSERT INTO `tb_countrycode` VALUES (157, 'Northern Mariana Islands', 'MNP', '1-670', '');
INSERT INTO `tb_countrycode` VALUES (158, 'Norway', 'NOR', '47', '');
INSERT INTO `tb_countrycode` VALUES (159, 'Oman', 'OMN', '968', '');
INSERT INTO `tb_countrycode` VALUES (160, 'Pakistan', 'PAK', '92', '');
INSERT INTO `tb_countrycode` VALUES (161, 'Palau', 'PLW', '680', '');
INSERT INTO `tb_countrycode` VALUES (162, 'Palestine', 'PSE', '970', '');
INSERT INTO `tb_countrycode` VALUES (163, 'Panama', 'PAN', '507', '');
INSERT INTO `tb_countrycode` VALUES (164, 'Papua New Guinea', 'PNG', '675', '');
INSERT INTO `tb_countrycode` VALUES (165, 'Paraguay', 'PRY', '595', '');
INSERT INTO `tb_countrycode` VALUES (166, 'Peru', 'PER', '51', '');
INSERT INTO `tb_countrycode` VALUES (167, 'Philippines', 'PHL', '63', '');
INSERT INTO `tb_countrycode` VALUES (168, 'Pitcairn', 'PCN', '64', '');
INSERT INTO `tb_countrycode` VALUES (169, 'Poland', 'POL', '48', '');
INSERT INTO `tb_countrycode` VALUES (170, 'Portugal', 'PRT', '351', '');
INSERT INTO `tb_countrycode` VALUES (171, 'Puerto Rico', 'PRI', '1-787, 1-939', '');
INSERT INTO `tb_countrycode` VALUES (172, 'Qatar', 'QAT', '974', '');
INSERT INTO `tb_countrycode` VALUES (173, 'Republic of the Congo', 'COG', '242', '');
INSERT INTO `tb_countrycode` VALUES (174, 'Reunion', 'REU', '262', '');
INSERT INTO `tb_countrycode` VALUES (175, 'Romania', 'ROU', '40', '');
INSERT INTO `tb_countrycode` VALUES (176, 'Russia', 'RUS', '7', '');
INSERT INTO `tb_countrycode` VALUES (177, 'Rwanda', 'RWA', '250', '');
INSERT INTO `tb_countrycode` VALUES (178, 'Saint Barthelemy', 'BLM', '590', '');
INSERT INTO `tb_countrycode` VALUES (179, 'Saint Helena', 'SHN', '290', '');
INSERT INTO `tb_countrycode` VALUES (180, 'Saint Kitts and Nevis', 'KNA', '1-869', '');
INSERT INTO `tb_countrycode` VALUES (181, 'Saint Lucia', 'LCA', '1-758', '');
INSERT INTO `tb_countrycode` VALUES (182, 'Saint Martin', 'MAF', '590', '');
INSERT INTO `tb_countrycode` VALUES (183, 'Saint Pierre and Miquelon', 'SPM', '508', '');
INSERT INTO `tb_countrycode` VALUES (184, 'Saint Vincent and the Grenadines', 'VCT', '1-784', '');
INSERT INTO `tb_countrycode` VALUES (185, 'Samoa', 'WSM', '685', '');
INSERT INTO `tb_countrycode` VALUES (186, 'San Marino', 'SMR', '378', '');
INSERT INTO `tb_countrycode` VALUES (187, 'Sao Tome and Principe', 'STP', '239', '');
INSERT INTO `tb_countrycode` VALUES (188, 'Saudi Arabia', 'SAU', '966', '');
INSERT INTO `tb_countrycode` VALUES (189, 'Senegal', 'SEN', '221', '');
INSERT INTO `tb_countrycode` VALUES (190, 'Serbia', 'SRB', '381', '');
INSERT INTO `tb_countrycode` VALUES (191, 'Seychelles', 'SYC', '248', '');
INSERT INTO `tb_countrycode` VALUES (192, 'Sierra Leone', 'SLE', '232', '');
INSERT INTO `tb_countrycode` VALUES (193, 'Singapore', 'SGP', '65', '');
INSERT INTO `tb_countrycode` VALUES (194, 'Sint Maarten', 'SXM', '1-721', '');
INSERT INTO `tb_countrycode` VALUES (195, 'Slovakia', 'SVK', '421', '');
INSERT INTO `tb_countrycode` VALUES (196, 'Slovenia', 'SVN', '386', '');
INSERT INTO `tb_countrycode` VALUES (197, 'Solomon Islands', 'SLB', '677', '');
INSERT INTO `tb_countrycode` VALUES (198, 'Somalia', 'SOM', '252', '');
INSERT INTO `tb_countrycode` VALUES (199, 'South Africa', 'ZAF', '27', '');
INSERT INTO `tb_countrycode` VALUES (200, 'South Korea', 'KOR', '82', '');
INSERT INTO `tb_countrycode` VALUES (201, 'South Sudan', 'SSD', '211', '');
INSERT INTO `tb_countrycode` VALUES (202, 'Spain', 'ESP', '34', '');
INSERT INTO `tb_countrycode` VALUES (203, 'Sri Lanka', 'LKA', '94', '');
INSERT INTO `tb_countrycode` VALUES (204, 'Sudan', 'SDN', '249', '');
INSERT INTO `tb_countrycode` VALUES (205, 'Suriname', 'SUR', '597', '');
INSERT INTO `tb_countrycode` VALUES (206, 'Svalbard and Jan Mayen', 'SJM', '47', '');
INSERT INTO `tb_countrycode` VALUES (207, 'Swaziland', 'SWZ', '268', '');
INSERT INTO `tb_countrycode` VALUES (208, 'Sweden', 'SWE', '46', '');
INSERT INTO `tb_countrycode` VALUES (209, 'Switzerland', 'CHE', '41', '');
INSERT INTO `tb_countrycode` VALUES (210, 'Syria', 'SYR', '963', '');
INSERT INTO `tb_countrycode` VALUES (211, 'Taiwan', 'TWN', '886', '');
INSERT INTO `tb_countrycode` VALUES (212, 'Tajikistan', 'TJK', '992', '');
INSERT INTO `tb_countrycode` VALUES (213, 'Tanzania', 'TZA', '255', '');
INSERT INTO `tb_countrycode` VALUES (214, 'Thailand', 'THA', '66', '');
INSERT INTO `tb_countrycode` VALUES (215, 'Togo', 'TGO', '228', '');
INSERT INTO `tb_countrycode` VALUES (216, 'Tokelau', 'TKL', '690', '');
INSERT INTO `tb_countrycode` VALUES (217, 'Tonga', 'TON', '676', '');
INSERT INTO `tb_countrycode` VALUES (218, 'Trinidad and Tobago', 'TTO', '1-868', '');
INSERT INTO `tb_countrycode` VALUES (219, 'Tunisia', 'TUN', '216', '');
INSERT INTO `tb_countrycode` VALUES (220, 'Turkey', 'TUR', '90', '');
INSERT INTO `tb_countrycode` VALUES (221, 'Turkmenistan', 'TKM', '993', '');
INSERT INTO `tb_countrycode` VALUES (222, 'Turks and Caicos Islands', 'TCA', '1-649', '');
INSERT INTO `tb_countrycode` VALUES (223, 'Tuvalu', 'TUV', '688', '');
INSERT INTO `tb_countrycode` VALUES (224, 'U.S. Virgin Islands', 'VIR', '1-340', '');
INSERT INTO `tb_countrycode` VALUES (225, 'Uganda', 'UGA', '256', '');
INSERT INTO `tb_countrycode` VALUES (226, 'Ukraine', 'UKR', '380', '');
INSERT INTO `tb_countrycode` VALUES (227, 'United Arab Emirates', 'ARE', '971', 'United_Arab_Emirates.png');
INSERT INTO `tb_countrycode` VALUES (228, 'United Kingdom', 'GBR', '44', '');
INSERT INTO `tb_countrycode` VALUES (229, 'United States', 'USA', '1', '');
INSERT INTO `tb_countrycode` VALUES (230, 'Uruguay', 'URY', '598', '');
INSERT INTO `tb_countrycode` VALUES (231, 'Uzbekistan', 'UZB', '998', '');
INSERT INTO `tb_countrycode` VALUES (232, 'Vanuatu', 'VUT', '678', '');
INSERT INTO `tb_countrycode` VALUES (233, 'Vatican', 'VAT', '379', '');
INSERT INTO `tb_countrycode` VALUES (234, 'Venezuela', 'VEN', '58', '');
INSERT INTO `tb_countrycode` VALUES (235, 'Vietnam', 'VNM', '84', '');
INSERT INTO `tb_countrycode` VALUES (236, 'Wallis and Futuna', 'WLF', '681', '');
INSERT INTO `tb_countrycode` VALUES (237, 'Western Sahara', 'ESH', '212', '');
INSERT INTO `tb_countrycode` VALUES (238, 'Yemen', 'YEM', '967', '');
INSERT INTO `tb_countrycode` VALUES (239, 'Zambia', 'ZMB', '260', '');
INSERT INTO `tb_countrycode` VALUES (240, 'Zimbabwe', 'ZWE', '263', '');

-- ----------------------------
-- Table structure for tb_fans
-- ----------------------------
DROP TABLE IF EXISTS `tb_fans`;
CREATE TABLE `tb_fans`  (
  `fan_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_from` int(11) NULL DEFAULT NULL,
  `req_to` int(11) NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`fan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_fans
-- ----------------------------
INSERT INTO `tb_fans` VALUES (1, 2, 3, 'fan', '2021-11-20 11:42:10');

-- ----------------------------
-- Table structure for tb_like
-- ----------------------------
DROP TABLE IF EXISTS `tb_like`;
CREATE TABLE `tb_like`  (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_liked` int(11) NULL DEFAULT NULL,
  `matchid` int(11) NULL DEFAULT NULL,
  `contestent_id` int(11) NULL DEFAULT NULL COMMENT '0->common like not based on contestent',
  `like_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `liked_on` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `image_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`like_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_like
-- ----------------------------
INSERT INTO `tb_like` VALUES (1, 2, 6, NULL, 'like', '2021-11-15 04:54:08', 12);
INSERT INTO `tb_like` VALUES (2, 2, 6, NULL, 'like', '2021-11-15 04:54:10', 13);
INSERT INTO `tb_like` VALUES (3, 2, 7, NULL, 'like', '2021-11-15 05:51:35', 16);
INSERT INTO `tb_like` VALUES (4, 2, 2, NULL, 'like', '2021-11-15 06:14:17', 3);

-- ----------------------------
-- Table structure for tb_match
-- ----------------------------
DROP TABLE IF EXISTS `tb_match`;
CREATE TABLE `tb_match`  (
  `matchid` int(11) NOT NULL AUTO_INCREMENT,
  `rival_id` int(11) NOT NULL,
  `opponent_id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `time_duration` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `caption` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `invitation_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `replied_at` timestamp(0) NULL DEFAULT NULL,
  `match_end` timestamp(0) NULL DEFAULT NULL,
  `match_status` int(11) NULL DEFAULT NULL COMMENT '1->ongoing,0->ended',
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `match_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `seen_status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`matchid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_match
-- ----------------------------
INSERT INTO `tb_match` VALUES (1, 1, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 05:59:45', 'personal', NULL);
INSERT INTO `tb_match` VALUES (2, 1, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 06:26:20', 'personal', NULL);
INSERT INTO `tb_match` VALUES (3, 1, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 06:33:50', 'personal', NULL);
INSERT INTO `tb_match` VALUES (4, 1, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 06:54:39', 'personal', NULL);
INSERT INTO `tb_match` VALUES (5, 1, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 15:54:05', 'personal', NULL);
INSERT INTO `tb_match` VALUES (6, 2, 2, NULL, NULL, 'Personal Match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 18:23:49', 'personal', NULL);
INSERT INTO `tb_match` VALUES (7, 2, 2, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 18:26:02', 'personal', NULL);
INSERT INTO `tb_match` VALUES (8, 2, 2, NULL, NULL, 'Personal Match 3', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 18:28:27', 'personal', NULL);
INSERT INTO `tb_match` VALUES (9, 2, 2, NULL, NULL, 'Text Match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 19:21:15', 'personal', NULL);
INSERT INTO `tb_match` VALUES (10, 1, 2, NULL, NULL, 'undefined', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 20:24:53', 'closed', 0);
INSERT INTO `tb_match` VALUES (11, 1, 2, NULL, NULL, 'cllosed match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 20:52:15', 'closed', 0);
INSERT INTO `tb_match` VALUES (13, 2, 0, 'Match Invitation', '2 hour', 'Call for match', 'Personalized', NULL, 'accept', '2021-11-15 18:03:38', '2021-11-15 20:38:03', 1, '2021-11-15 09:38:03', 'open', NULL);
INSERT INTO `tb_match` VALUES (14, 2, 1, NULL, NULL, 'Close Match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-15 21:01:47', 'closed', 0);
INSERT INTO `tb_match` VALUES (15, 3, 0, 'Open Match', '4 hour', 'Open Match', 'Personalized', NULL, 'accept', '2021-11-15 19:27:57', '2021-11-15 23:57:27', 1, '2021-11-15 10:57:27', 'open', NULL);
INSERT INTO `tb_match` VALUES (16, 3, 0, 'Second Open Match', '7 hour', 'Open Match', 'Personalized', NULL, 'accept', '2021-11-15 19:30:55', '2021-11-16 02:55:30', 1, '2021-11-15 10:55:30', 'open', NULL);
INSERT INTO `tb_match` VALUES (17, 2, 0, 'This is the open match invitation', '1 hour', 'invitation test', 'Personalized', NULL, NULL, NULL, NULL, NULL, '2021-11-20 12:06:35', 'open', NULL);

-- ----------------------------
-- Table structure for tb_matchupload
-- ----------------------------
DROP TABLE IF EXISTS `tb_matchupload`;
CREATE TABLE `tb_matchupload`  (
  `mup_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uploaded` int(11) NULL DEFAULT NULL,
  `matchid` int(11) NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `filetype` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `sub_caption` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `old_mupid` int(11) NULL DEFAULT NULL,
  `personal_matchid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`mup_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_matchupload
-- ----------------------------
INSERT INTO `tb_matchupload` VALUES (1, 1, 1, '23b4aaeb0e986e1efcf9b22297f3878c.jpg', 'file', '2021-11-15 01:50:29', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (2, 1, 1, '6a9717a892b9d0a521cc8f8a77ff49fb.jpg', 'file', '2021-11-15 01:52:29', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (3, 1, 2, '98395cef06d073e7e04cc839c9ab977a.jpg', 'file', '2021-11-15 01:20:56', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (4, 1, 2, '64454a078d0e6080c2f6a34895309a54.jpg', 'file', '2021-11-15 01:20:56', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (5, 1, 3, '6421a7a949231606f120d8bd357a13f8.mp4', 'file', '2021-11-15 02:50:03', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (6, 1, 3, '634d87c32b978ef274599bbc22bee3e6.mp4', 'file', '2021-11-15 02:50:03', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (7, 1, 4, '686086b5c41ce96b19a50e7f99e0c39a.jpg', 'file', '2021-11-15 02:39:24', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (8, 1, 4, '0212e03ad57b3af7ba2898cee915e99f.mp4', 'file', '2021-11-15 02:40:24', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (9, 1, 5, 'cdec72b18f8ffdd6b00889ca1c2f831d.jpg', 'file', '2021-11-15 11:06:24', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (10, 1, 5, '89aca895d1db86473a2e30b7230b5b49.jpg', 'file', '2021-11-15 11:06:24', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (11, 1, 5, '0c26f900d41c1109db593c37e94103ba.mp4', 'file', '2021-11-15 11:07:24', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (12, 2, 6, 'e6d3f6541434aa6f76d6e40cfd31f63c.jpg', 'file', '2021-11-15 13:50:53', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (13, 2, 6, '10335bc494cc5b37784660d82e91226a.jpg', 'file', '2021-11-15 13:50:53', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (14, 2, 7, '002d3d246abb383f1a78286f7ea4bffc.jpg', 'file', '2021-11-15 13:03:56', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (15, 2, 7, '08b301f1e752c57e9ab988f5ee71ea40.jpg', 'file', '2021-11-15 13:03:56', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (16, 2, 7, '2ccebe6813ba4c54b1973f0f0165b77d.mp4', 'file', '2021-11-15 13:04:56', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (17, 2, 8, '2692791b109d5052c0d05687051eb28d.mp4', 'file', '2021-11-15 13:29:58', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (18, 2, 8, '95ba230c3287aba32153f902a83a5bee.mp4', 'file', '2021-11-15 13:30:58', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (19, 2, 8, 'ab0caadab3feca5bed22ed895e08c67f.mp4', 'file', '2021-11-15 13:30:58', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (20, 2, 8, '855fd96ef0b48e3d11beed4ed511b8c5.mp4', 'file', '2021-11-15 13:31:58', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (21, 2, 9, 'http://google.com', 'link', '2021-11-15 19:21:15', '', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (22, 2, 9, 'This is the test of text match', 'text', '2021-11-15 19:21:15', '', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (23, 2, 10, 'e6d3f6541434aa6f76d6e40cfd31f63c.jpg', 'file', '2021-11-15 20:53:24', NULL, 12, 6);
INSERT INTO `tb_matchupload` VALUES (24, 2, 10, '10335bc494cc5b37784660d82e91226a.jpg', 'file', '2021-11-15 20:53:24', NULL, 13, 6);
INSERT INTO `tb_matchupload` VALUES (25, 1, 10, 'acfcc06887c46da0690ccf44ec9368f4.jpg', 'file', '2021-11-15 15:53:54', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (26, 1, 10, 'f2414708cfce03ad0f76199ff5d887d5.mp4', 'file', '2021-11-15 15:55:54', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (27, 2, 11, '2692791b109d5052c0d05687051eb28d.mp4', 'file', '2021-11-15 20:15:52', NULL, 17, 8);
INSERT INTO `tb_matchupload` VALUES (28, 2, 11, '95ba230c3287aba32153f902a83a5bee.mp4', 'file', '2021-11-15 20:15:52', NULL, 18, 8);
INSERT INTO `tb_matchupload` VALUES (29, 2, 11, 'ab0caadab3feca5bed22ed895e08c67f.mp4', 'file', '2021-11-15 20:15:52', NULL, 19, 8);
INSERT INTO `tb_matchupload` VALUES (30, 2, 11, '855fd96ef0b48e3d11beed4ed511b8c5.mp4', 'file', '2021-11-15 20:15:52', NULL, 20, 8);
INSERT INTO `tb_matchupload` VALUES (31, 1, 11, '66ecdfa7972f1310e628aec3f878dee8.jpg', 'file', '2021-11-15 16:16:22', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (37, 2, 13, '3bc748cfe96266785fb4a8bc35364ff5.jpg', 'file', '2021-11-15 18:48:20', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (38, 2, 13, '51808ef8082d0db80e91f6a4325b3df8.jpg', 'file', '2021-11-15 18:48:20', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (41, 1, 13, '46b06a94a8188d16a2c46306fd001f2e.jpg', 'file', '2021-11-15 18:03:38', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (42, 1, 13, '8000cfb88f7af9c224da75a16f869204.jpg', 'file', '2021-11-15 18:03:38', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (43, 1, 14, '23b4aaeb0e986e1efcf9b22297f3878c.jpg', 'file', '2021-11-15 21:47:01', NULL, 1, 1);
INSERT INTO `tb_matchupload` VALUES (44, 1, 14, '6a9717a892b9d0a521cc8f8a77ff49fb.jpg', 'file', '2021-11-15 21:47:01', NULL, 2, 1);
INSERT INTO `tb_matchupload` VALUES (45, 2, 14, 'e3dd8d90131de8598c335fb401f2f482.mp4', 'file', '2021-11-15 16:50:31', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (46, 2, 14, '7b259c8b1d49b0736831ea7fc40bc98b.jpg', 'file', '2021-11-15 16:50:31', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (47, 3, 15, '49f6f83b46d16121addf37cc08d22050.jpg', 'file', '2021-11-15 19:07:47', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (48, 3, 15, '051d501240ee8b43dc03f80084b8990e.mp4', 'file', '2021-11-15 19:07:47', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (49, 3, 16, '174429fa1e09700e9b0e3a85ce330433.jpg', 'file', '2021-11-15 19:53:48', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (50, 3, 16, '3ea1901d56ffb90223fb2837f1cd5c6a.mp4', 'file', '2021-11-15 19:54:48', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (51, 2, 15, '4a56aba219c60f567d7858f6a40dfd69.jpg', 'file', '2021-11-15 19:29:52', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (52, 2, 15, 'cb1d9f0bf68f80e88ee736ed8719982b.mp4', 'file', '2021-11-15 19:32:52', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (53, 2, 16, '26fe7e9bd9412ffd5215dfed4326c62d.jpg', 'file', '2021-11-15 19:14:54', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (54, 2, 16, '71bfed88274cd919bfcd276eca28e079.jpg', 'file', '2021-11-15 19:14:54', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (55, 2, 16, '04f63acfed24f5c64b68c3f7ed3d1edb.jpg', 'file', '2021-11-15 19:14:54', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (56, 4, 16, 'ef2c8b96a4d294c77b0236b115857950.mp4', 'file', '2021-11-15 19:35:55', NULL, NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (57, 2, 17, 'test', 'text', '2021-11-20 21:35:06', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_matchusers
-- ----------------------------
DROP TABLE IF EXISTS `tb_matchusers`;
CREATE TABLE `tb_matchusers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `accept_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opponent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_matchusers
-- ----------------------------
INSERT INTO `tb_matchusers` VALUES (2, 13, 2, 'accept', 1);
INSERT INTO `tb_matchusers` VALUES (3, 15, 3, NULL, 1);
INSERT INTO `tb_matchusers` VALUES (4, 15, 3, 'accept', 2);
INSERT INTO `tb_matchusers` VALUES (5, 16, 3, 'accept', 4);
INSERT INTO `tb_matchusers` VALUES (6, 16, 3, 'accept', 2);
INSERT INTO `tb_matchusers` VALUES (7, 17, 2, NULL, 3);

-- ----------------------------
-- Table structure for tb_momentcomment
-- ----------------------------
DROP TABLE IF EXISTS `tb_momentcomment`;
CREATE TABLE `tb_momentcomment`  (
  `mcomment_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `momentid` int(11) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`mcomment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_momentcomment
-- ----------------------------
INSERT INTO `tb_momentcomment` VALUES (1, 2, 1, 'guhyo', '2020-12-14 20:45:29');
INSERT INTO `tb_momentcomment` VALUES (2, 2, 1, 'gihuj', '2020-12-14 21:11:08');
INSERT INTO `tb_momentcomment` VALUES (3, 1, 1, 'wow', '2020-12-15 08:53:47');
INSERT INTO `tb_momentcomment` VALUES (4, 1, 1, 'nice', '2020-12-15 09:30:04');
INSERT INTO `tb_momentcomment` VALUES (5, 1, 1, 'great', '2020-12-15 09:30:17');
INSERT INTO `tb_momentcomment` VALUES (6, 1, 2, 'Great', '2020-12-15 09:36:48');
INSERT INTO `tb_momentcomment` VALUES (7, 1, 3, 'haii', '2020-12-15 10:04:27');
INSERT INTO `tb_momentcomment` VALUES (8, 1, 3, 'hellow', '2020-12-15 10:04:39');
INSERT INTO `tb_momentcomment` VALUES (9, 1, 3, 'wow', '2020-12-15 12:54:02');
INSERT INTO `tb_momentcomment` VALUES (10, 1, 1, 'Hellow', '2020-12-15 13:32:09');
INSERT INTO `tb_momentcomment` VALUES (11, 1, 2, 'Wow', '2020-12-15 13:32:35');
INSERT INTO `tb_momentcomment` VALUES (12, 1, 3, 'hellow oll', '2020-12-16 15:34:14');

-- ----------------------------
-- Table structure for tb_momentlike
-- ----------------------------
DROP TABLE IF EXISTS `tb_momentlike`;
CREATE TABLE `tb_momentlike`  (
  `momentlike_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `momentid` int(11) NULL DEFAULT NULL,
  `like_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`momentlike_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_momentlike
-- ----------------------------
INSERT INTO `tb_momentlike` VALUES (1, 1, 1, 'like', '2020-12-14 20:23:32');
INSERT INTO `tb_momentlike` VALUES (2, 1, 2, 'dislike', '2020-12-15 13:30:19');

-- ----------------------------
-- Table structure for tb_myiquery
-- ----------------------------
DROP TABLE IF EXISTS `tb_myiquery`;
CREATE TABLE `tb_myiquery`  (
  `queryid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `query1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `query2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`queryid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_myiquery
-- ----------------------------
INSERT INTO `tb_myiquery` VALUES (2, 2, 'how are you', 'hello', '2020-11-05 22:37:15');
INSERT INTO `tb_myiquery` VALUES (3, 2, 'how are you', 'doing good', '2020-11-05 22:46:16');
INSERT INTO `tb_myiquery` VALUES (4, 2, 'how are you', 'doing good', '2020-11-05 23:43:13');
INSERT INTO `tb_myiquery` VALUES (12, 36, 'haii', 'helow', '2020-11-08 22:19:38');
INSERT INTO `tb_myiquery` VALUES (13, 36, 'nice', 'great', '2020-11-08 22:46:35');
INSERT INTO `tb_myiquery` VALUES (19, 2, '123', '1234', '2020-11-10 23:59:26');
INSERT INTO `tb_myiquery` VALUES (20, 38, 'When you don\'t know where to start,\njust go to a place you miss so much.', 'After a long silence, Dodge cleared his throat. \"I think I speak for all of us when I say, \'Huh?\'\"\n-Dodge(obviously)', '2020-11-11 01:25:07');
INSERT INTO `tb_myiquery` VALUES (21, 38, 'When you don\'t know where to start,\njust go to a place you miss so much.', 'I do not understand this analogy,\" Mencheres muttered.', '2020-11-11 01:25:20');
INSERT INTO `tb_myiquery` VALUES (22, 1, 'When you don\'t know where to start,\njust go to a place you miss so much.', 'When you don\'t know where to start,\njust go to a place you miss so much.', '2020-11-11 20:42:12');
INSERT INTO `tb_myiquery` VALUES (23, 1, 'I just want to be someone, to mean something to anyone…', 'I just want to be someone, to mean something to anyone…', '2020-11-11 20:42:52');
INSERT INTO `tb_myiquery` VALUES (26, 1, 'I do not understand this analogy,\" Mencheres muttered.', 'I do not understand this analogy,\" Mencheres muttered.', '2020-11-12 07:17:02');
INSERT INTO `tb_myiquery` VALUES (42, 40, 'A real friend is one who walks in when the rest of the world walks out.', 'True friendship comes when the silence between two people is comfortable.', '2020-11-17 00:45:17');
INSERT INTO `tb_myiquery` VALUES (43, 42, 'A single rose can be my garden… a single friend, my world....', 'There’s not a word yet for old friends who’ve just met...', '2020-11-17 02:39:45');
INSERT INTO `tb_myiquery` VALUES (44, 42, 'What you do not want done to yourself, do not do to others.', 'A true friend never gets in your way unless you happen to be going down.', '2020-11-17 02:41:38');
INSERT INTO `tb_myiquery` VALUES (47, 7, 'Hi @ all ', 'Hello @ all', '2020-11-24 02:41:35');

-- ----------------------------
-- Table structure for tb_myiquerycomment
-- ----------------------------
DROP TABLE IF EXISTS `tb_myiquerycomment`;
CREATE TABLE `tb_myiquerycomment`  (
  `querycomment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_commented` int(11) NULL DEFAULT NULL,
  `queryid` int(11) NULL DEFAULT NULL,
  `querynum` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `userstatus` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`querycomment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_myiquerycomment
-- ----------------------------
INSERT INTO `tb_myiquerycomment` VALUES (1, 1, 2, 'query1', 'good', 'vistor', '2020-11-11 01:28:22');
INSERT INTO `tb_myiquerycomment` VALUES (2, 1, 2, 'query1', 'good', 'vistor', '2020-11-11 01:29:29');
INSERT INTO `tb_myiquerycomment` VALUES (3, 38, 7, 'query1', 'haii', 'vistor', '2020-11-11 09:01:53');
INSERT INTO `tb_myiquerycomment` VALUES (4, 38, 7, 'query1', 'nice', 'vistor', '2020-11-11 09:07:41');
INSERT INTO `tb_myiquerycomment` VALUES (5, 38, 7, 'query1', 'Great', 'vistor', '2020-11-11 09:08:20');
INSERT INTO `tb_myiquerycomment` VALUES (6, 38, 7, 'query1', 'Awsome', 'vistor', '2020-11-11 09:08:27');
INSERT INTO `tb_myiquerycomment` VALUES (7, 38, 7, 'query1', 'Cute', 'vistor', '2020-11-11 09:08:36');
INSERT INTO `tb_myiquerycomment` VALUES (8, 38, 7, 'query1', '', 'vistor', '2020-11-11 09:55:59');
INSERT INTO `tb_myiquerycomment` VALUES (9, 38, 7, 'query1', 'hellow guys', 'vistor', '2020-11-11 20:12:44');
INSERT INTO `tb_myiquerycomment` VALUES (10, 38, 7, 'query1', 'haii everybody', 'vistor', '2020-11-11 20:14:34');
INSERT INTO `tb_myiquerycomment` VALUES (11, 38, 10, 'query2', 'haii guys', 'vistor', '2020-11-11 20:22:42');
INSERT INTO `tb_myiquerycomment` VALUES (12, 38, 10, 'query2', 'haii da', 'vistor', '2020-11-11 20:30:25');
INSERT INTO `tb_myiquerycomment` VALUES (13, 38, 10, 'query2', 'haii da', 'vistor', '2020-11-11 20:34:07');
INSERT INTO `tb_myiquerycomment` VALUES (14, 38, 10, 'query2', 'haii deii', 'vistor', '2020-11-11 20:34:32');
INSERT INTO `tb_myiquerycomment` VALUES (15, 38, 10, 'query2', 'Great thought', 'vistor', '2020-11-11 20:34:59');
INSERT INTO `tb_myiquerycomment` VALUES (16, 38, 10, 'query2', 'Great thought', 'vistor', '2020-11-11 20:37:42');
INSERT INTO `tb_myiquerycomment` VALUES (17, 38, 10, 'query2', 'guys', 'vistor', '2020-11-11 20:40:24');
INSERT INTO `tb_myiquerycomment` VALUES (18, 38, 22, 'query2', 'haii guys', 'vistor', '2020-11-11 20:44:45');
INSERT INTO `tb_myiquerycomment` VALUES (19, 38, 22, 'query1', 'hellow', 'vistor', '2020-11-11 21:05:20');
INSERT INTO `tb_myiquerycomment` VALUES (20, 38, 22, 'query1', 'hellow guys', 'vistor', '2020-11-11 21:05:27');
INSERT INTO `tb_myiquerycomment` VALUES (21, 38, 22, 'query1', 'That was reallyu good', 'vistor', '2020-11-11 21:05:40');
INSERT INTO `tb_myiquerycomment` VALUES (22, 38, 22, 'query1', 'That was reallyu good', 'vistor', '2020-11-11 21:05:43');
INSERT INTO `tb_myiquerycomment` VALUES (23, 38, 23, 'query2', 'hey', 'vistor', '2020-11-11 21:08:09');
INSERT INTO `tb_myiquerycomment` VALUES (24, 38, 23, 'query2', 'hellow', 'vistor', '2020-11-11 21:08:15');
INSERT INTO `tb_myiquerycomment` VALUES (25, 38, 23, 'query2', 'how r u guys???', 'vistor', '2020-11-11 21:08:29');
INSERT INTO `tb_myiquerycomment` VALUES (26, 43, 47, 'query1', 'Hello', 'vistor', '2020-11-24 03:11:59');
INSERT INTO `tb_myiquerycomment` VALUES (27, 43, 47, 'query2', 'Hello', 'vistor', '2020-11-24 03:14:00');
INSERT INTO `tb_myiquerycomment` VALUES (28, 43, 47, 'query2', 'Hello again', 'vistor', '2020-11-24 03:14:18');
INSERT INTO `tb_myiquerycomment` VALUES (29, 1, 2, 'query1', 'haii guys', 'vistor', '2020-11-26 02:01:57');
INSERT INTO `tb_myiquerycomment` VALUES (30, 1, 2, 'query1', 'hellow', 'vistor', '2020-11-26 02:02:05');
INSERT INTO `tb_myiquerycomment` VALUES (31, 1, 2, 'query1', 'Heyy', 'vistor', '2020-11-28 00:56:29');
INSERT INTO `tb_myiquerycomment` VALUES (32, 1, 2, 'query2', 'Heyy', 'vistor', '2020-11-28 00:57:40');

-- ----------------------------
-- Table structure for tb_myiquerylike
-- ----------------------------
DROP TABLE IF EXISTS `tb_myiquerylike`;
CREATE TABLE `tb_myiquerylike`  (
  `iquerylike_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_liked` int(11) NULL DEFAULT NULL,
  `myqueryid` int(11) NULL DEFAULT NULL,
  `querynum` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `like_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`iquerylike_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_myiquerylike
-- ----------------------------
INSERT INTO `tb_myiquerylike` VALUES (1, 1, 7, 'query1', 'like', '2020-11-11 01:10:39');
INSERT INTO `tb_myiquerylike` VALUES (2, 1, 10, 'query2', 'like', '2020-11-11 05:23:15');
INSERT INTO `tb_myiquerylike` VALUES (3, 1, 7, 'query2', 'dislike', '2020-11-11 06:54:03');
INSERT INTO `tb_myiquerylike` VALUES (4, 1, 18, 'query2', 'dislike', '2020-11-11 06:54:19');
INSERT INTO `tb_myiquerylike` VALUES (5, 1, 22, 'query2', 'like', '2020-11-11 20:44:32');
INSERT INTO `tb_myiquerylike` VALUES (6, 1, 22, 'query1', 'like', '2020-11-11 21:05:11');
INSERT INTO `tb_myiquerylike` VALUES (7, 7, 47, 'query1', 'like', '2020-11-24 03:08:08');
INSERT INTO `tb_myiquerylike` VALUES (8, 7, 47, 'query2', 'like', '2020-11-24 03:08:11');

-- ----------------------------
-- Table structure for tb_notification
-- ----------------------------
DROP TABLE IF EXISTS `tb_notification`;
CREATE TABLE `tb_notification`  (
  `not_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NULL DEFAULT NULL,
  `receiver_id` int(11) NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `notification_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `request_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `read_status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`not_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_notification
-- ----------------------------
INSERT INTO `tb_notification` VALUES (1, 2, 3, 'user1@gmail.com added you as Fan', 'Add_fan', 1, '2021-11-20 11:42:10', 1);
INSERT INTO `tb_notification` VALUES (2, 2, 3, 'user1@gmail.com wants to add you as squad', 'Add_squad', 1, '2021-11-20 11:56:31', 1);
INSERT INTO `tb_notification` VALUES (3, 2, 3, 'user1@gmail.com wants to add you as bestie', 'Add_bestie', 2, '2021-11-20 12:04:12', 1);
INSERT INTO `tb_notification` VALUES (4, 2, 3, 'user1@gmail.com Invited you from Personalized list to have a Match of 1 hour duration', 'Match_invitation', 17, '2021-11-20 12:06:35', 1);
INSERT INTO `tb_notification` VALUES (6, 3, 2, 'user2@gmail.com wants to add you as squad', 'Add_squad', 3, '2021-11-22 04:38:34', 2);

-- ----------------------------
-- Table structure for tb_statusbar
-- ----------------------------
DROP TABLE IF EXISTS `tb_statusbar`;
CREATE TABLE `tb_statusbar`  (
  `statusid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `text` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `send_to` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`statusid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_statusbar
-- ----------------------------
INSERT INTO `tb_statusbar` VALUES (1, 2, 'story', 'hi i am raveena.', 1, '2020-09-09 07:31:02');
INSERT INTO `tb_statusbar` VALUES (2, 2, 'letter', 'hello nice to meet u', 1, '2020-09-09 07:36:02');
INSERT INTO `tb_statusbar` VALUES (4, 1, 'story', 'The real lover is the man who can thrill you by kissing your forehead or smiling into your eyes or just staring into space.', 2, '2020-09-15 07:07:11');
INSERT INTO `tb_statusbar` VALUES (5, 1, 'slogan', 'Firefighters go where they’re needed, sometimes ignoring the dangers even when no one is inside a burning building to be saved.', 2, '2020-09-16 02:15:35');
INSERT INTO `tb_statusbar` VALUES (6, 1, 'letter', 'Dear Friend,\n\nI know. I know it’s been hard. My lack of positivity, my negative mindset, the complaining, the crying, the silence, the stress… the list goes on. It goes without saying that I haven’t had the best year. It hasn’t been one specific thing, just a million little things that have happened & these million little things have seemingly turned me into a person I don’t necessarily enjoy. But, through it all… you’re still here and I don’t even know how to say how thankful I am for that. When things get tough, a lot of people tend to run as fast as possible. But not you.', 2, '2020-09-16 02:16:20');
INSERT INTO `tb_statusbar` VALUES (8, 7, 'story', 'ggggg', 1, '2020-09-17 02:28:24');
INSERT INTO `tb_statusbar` VALUES (9, 7, 'slogan', 'evnt', 1, '2020-09-17 02:28:45');
INSERT INTO `tb_statusbar` VALUES (10, 7, 'letter', 'Hii', 1, '2020-09-17 02:28:57');
INSERT INTO `tb_statusbar` VALUES (11, 2, 'slogan', 'hi how r u', 1, '2020-12-31 02:44:49');
INSERT INTO `tb_statusbar` VALUES (12, 1, 'story', 'haii', NULL, '2021-01-04 20:33:07');
INSERT INTO `tb_statusbar` VALUES (13, 1, 'story', 'haii', NULL, '2021-01-04 20:33:59');
INSERT INTO `tb_statusbar` VALUES (14, 1, 'story', 'haii', NULL, '2021-01-04 20:34:32');
INSERT INTO `tb_statusbar` VALUES (15, 1, 'story', 'haii', 5, '2021-01-04 20:39:27');
INSERT INTO `tb_statusbar` VALUES (16, 7, 'story', 'Hii', 43, '2021-01-07 02:10:25');
INSERT INTO `tb_statusbar` VALUES (17, 7, 'story', 'Ravii', 2, '2021-01-07 02:10:51');
INSERT INTO `tb_statusbar` VALUES (18, 7, 'slogan', 'La la la', 2, '2021-01-07 02:11:03');
INSERT INTO `tb_statusbar` VALUES (19, 7, 'letter', 'My bestie', 2, '2021-01-07 02:11:16');
INSERT INTO `tb_statusbar` VALUES (20, 2, 'story', 'sdcsdcsdcdcsdc', 2, '2021-11-17 17:09:04');
INSERT INTO `tb_statusbar` VALUES (21, 2, 'slogan', 'sdcsecdc', 2, '2021-11-17 17:11:23');
INSERT INTO `tb_statusbar` VALUES (22, 2, 'letter', 'asdcaecdc', 2, '2021-11-17 17:12:49');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `university_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `isocode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bio` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `profile_pic` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `online_offline_status` int(11) NULL DEFAULT 1 COMMENT '1=offline,0->online',
  `last_seen` timestamp(0) NULL DEFAULT NULL,
  `device_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'test', 'example@gmail.com', '1235468541', 'TmV5bWFyQDIxNQ==', '', '+234', NULL, NULL, NULL, 1, '2021-11-15 21:14:12', '', '', '2021-11-13 03:00:41', '2021-11-15 07:44:12');
INSERT INTO `tb_user` VALUES (2, 'user1@gmail.com', 'user1@gmail.com', '215654984', 'cXdlUVdFMTIzIUAj', '', '+234', NULL, NULL, NULL, 1, '2021-11-18 00:23:17', '', '', '2021-11-14 10:00:27', '2021-11-17 10:53:17');
INSERT INTO `tb_user` VALUES (3, 'user2@gmail.com', 'user2@gmail.com', '4565151321', 'cXdlUVdFMTIzIUAj', '', '+234', NULL, NULL, NULL, 1, '2021-11-16 00:21:13', '', '', '2021-11-15 09:48:28', '2021-11-15 10:51:13');
INSERT INTO `tb_user` VALUES (4, 'User 3', 'user3@gmail.com', '65483251321', 'cXdlUVdFMTIzIUAj', '', '+234', NULL, NULL, NULL, 1, '2021-11-16 00:25:58', '', '', '2021-11-15 09:49:04', '2021-11-15 10:55:58');
INSERT INTO `tb_user` VALUES (5, 'user 4', 'user4@gmail.com', '546454564', 'cXdlUVdFMTIzIUAj', '', '+234', NULL, NULL, NULL, 1, NULL, '', '', '2021-11-15 09:49:42', '2021-11-15 09:49:42');

-- ----------------------------
-- Table structure for tb_useranswer
-- ----------------------------
DROP TABLE IF EXISTS `tb_useranswer`;
CREATE TABLE `tb_useranswer`  (
  `ansid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `questionid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `answer1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `answer2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`ansid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_useranswer
-- ----------------------------
INSERT INTO `tb_useranswer` VALUES (1, 1, '1', 'I am both happy and sad at the same time, and I\'m still trying to figure out how that could be.', 'I am both happy and sad at the same time, and I\'m still trying to figure out how that could be.', '2020-11-03 23:09:27');
INSERT INTO `tb_useranswer` VALUES (3, 2, '2', 'goodsad', 'fighting', '2020-11-17 01:12:25');
INSERT INTO `tb_useranswer` VALUES (4, 40, '3', 'fbjnbkdc', 'fighting', '2020-11-17 01:14:59');
INSERT INTO `tb_useranswer` VALUES (5, 40, '5', 'fbjnbkdc', 'fighting', '2020-11-17 01:49:00');
INSERT INTO `tb_useranswer` VALUES (6, 40, '8', 'fbjnbkdc', 'fighting', '2020-11-17 01:49:14');
INSERT INTO `tb_useranswer` VALUES (7, 41, '1', 'There’s not a word yet for old friends who’ve just met.', 'True friendship comes when the silence between two people is comfortable.', '2020-11-17 02:07:22');
INSERT INTO `tb_useranswer` VALUES (8, 42, '1', 'A single rose can be my garden… a single friend, my world.', 'Don’t make friends who are comfortable to be with. Make friends who will force you to lever yourself up.', '2020-11-17 02:09:59');
INSERT INTO `tb_useranswer` VALUES (9, 7, '1', 'Nothing will do', 'Hello', '2020-11-24 02:40:56');

-- ----------------------------
-- Table structure for tb_userchat
-- ----------------------------
DROP TABLE IF EXISTS `tb_userchat`;
CREATE TABLE `tb_userchat`  (
  `chatid` int(11) NOT NULL AUTO_INCREMENT,
  `userid_from` int(11) NOT NULL,
  `userid_to` int(11) NOT NULL,
  `message` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `chattoken` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`chatid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_userchat
-- ----------------------------
INSERT INTO `tb_userchat` VALUES (1, 1, 5, 'Hi', 'chat15', '2020-11-27 12:49:28');
INSERT INTO `tb_userchat` VALUES (2, 1, 5, 'How are you?', 'chat15', '2020-11-27 12:49:55');
INSERT INTO `tb_userchat` VALUES (3, 1, 2, 'Hi,How are you?', 'chat12', '2020-11-27 12:50:15');
INSERT INTO `tb_userchat` VALUES (4, 1, 2, 'Hi', 'chat12', '2020-11-27 12:51:15');
INSERT INTO `tb_userchat` VALUES (5, 2, 1, 'Hi', 'chat12', '2020-11-27 12:51:44');
INSERT INTO `tb_userchat` VALUES (6, 2, 1, 'i am good', 'chat12', '2020-11-27 12:52:15');
INSERT INTO `tb_userchat` VALUES (7, 2, 5, 'Hi', 'chat25', '2020-11-27 12:53:37');
INSERT INTO `tb_userchat` VALUES (8, 1, 2, 'Can we be frnds?', 'chat12', '2020-11-30 23:07:25');
INSERT INTO `tb_userchat` VALUES (9, 1, 2, 'helloww', 'chat12', '2020-11-30 23:17:05');
INSERT INTO `tb_userchat` VALUES (10, 1, 2, 'hellow', 'chat12', '2020-11-30 23:17:11');
INSERT INTO `tb_userchat` VALUES (11, 1, 2, 'haii', 'chat12', '2020-11-30 23:17:22');
INSERT INTO `tb_userchat` VALUES (12, 1, 2, 'I like to listen. I have learned a great deal from listening carefully. Most people never listen.', 'chat12', '2020-11-30 23:23:41');
INSERT INTO `tb_userchat` VALUES (13, 2, 1, 'haii', 'chat12', '2020-11-30 23:32:45');
INSERT INTO `tb_userchat` VALUES (14, 2, 1, 'i am here', 'chat12', '2020-11-30 23:32:53');
INSERT INTO `tb_userchat` VALUES (15, 2, 1, NULL, 'chat12', '2020-11-30 23:33:03');
INSERT INTO `tb_userchat` VALUES (16, 2, 1, 'tell me', 'chat12', '2020-11-30 23:33:25');
INSERT INTO `tb_userchat` VALUES (17, 1, 2, 'daa', 'chat12', '2020-12-01 11:18:29');
INSERT INTO `tb_userchat` VALUES (18, 1, 2, 'hellow....R u free now?', 'chat12', '2020-12-01 11:22:34');
INSERT INTO `tb_userchat` VALUES (19, 1, 2, 'hellow....R u free now?', 'chat12', '2020-12-01 11:22:42');
INSERT INTO `tb_userchat` VALUES (20, 1, 2, 'haii', 'chat12', '2020-12-01 11:23:26');
INSERT INTO `tb_userchat` VALUES (21, 1, 2, 'hellow', 'chat12', '2020-12-01 11:24:25');
INSERT INTO `tb_userchat` VALUES (22, 1, 2, 'daaa', 'chat12', '2020-12-01 11:24:32');
INSERT INTO `tb_userchat` VALUES (23, 1, 2, 'how r u da?', 'chat12', '2020-12-01 11:24:45');
INSERT INTO `tb_userchat` VALUES (24, 1, 2, 'haii', 'chat12', '2020-12-01 11:29:46');
INSERT INTO `tb_userchat` VALUES (25, 1, 2, 'hellow', 'chat12', '2020-12-01 11:49:02');
INSERT INTO `tb_userchat` VALUES (26, 1, 2, 'hey', 'chat12', '2020-12-01 11:57:15');
INSERT INTO `tb_userchat` VALUES (27, 1, 2, 'heii da', 'chat12', '2020-12-01 11:57:26');
INSERT INTO `tb_userchat` VALUES (28, 1, 2, 'nice', 'chat12', '2020-12-01 11:57:34');
INSERT INTO `tb_userchat` VALUES (29, 1, 2, 'great', 'chat12', '2020-12-01 11:59:11');
INSERT INTO `tb_userchat` VALUES (30, 1, 2, 'heyy', 'chat12', '2020-12-01 11:59:19');
INSERT INTO `tb_userchat` VALUES (31, 1, 2, 'wow', 'chat12', '2020-12-01 11:59:25');
INSERT INTO `tb_userchat` VALUES (32, 1, 2, 'nice', 'chat12', '2020-12-01 11:59:34');
INSERT INTO `tb_userchat` VALUES (33, 1, 2, 'hey', 'chat12', '2020-12-01 12:01:07');
INSERT INTO `tb_userchat` VALUES (34, 1, 2, 'hellow', 'chat12', '2020-12-01 12:01:14');
INSERT INTO `tb_userchat` VALUES (35, 1, 2, 'haii', 'chat12', '2020-12-01 12:01:22');
INSERT INTO `tb_userchat` VALUES (36, 1, 5, 'heyy', 'chat15', '2020-12-01 12:02:34');
INSERT INTO `tb_userchat` VALUES (37, 1, 5, 'daaa', 'chat15', '2020-12-01 12:02:39');
INSERT INTO `tb_userchat` VALUES (38, 1, 5, 'hellow', 'chat15', '2020-12-01 12:02:44');
INSERT INTO `tb_userchat` VALUES (39, 1, 5, 'nice', 'chat15', '2020-12-01 12:02:51');
INSERT INTO `tb_userchat` VALUES (40, 1, 5, 'great', 'chat15', '2020-12-01 12:02:59');
INSERT INTO `tb_userchat` VALUES (41, 1, 5, 'wow', 'chat15', '2020-12-01 12:03:11');
INSERT INTO `tb_userchat` VALUES (42, 1, 5, 'hey', 'chat15', '2020-12-01 12:04:21');
INSERT INTO `tb_userchat` VALUES (43, 1, 5, 'hellow', 'chat15', '2020-12-01 12:04:30');
INSERT INTO `tb_userchat` VALUES (44, 1, 5, 'daaa', 'chat15', '2020-12-01 12:05:39');
INSERT INTO `tb_userchat` VALUES (45, 1, 5, 'hellow', 'chat15', '2020-12-01 12:05:58');
INSERT INTO `tb_userchat` VALUES (46, 1, 5, 'haii', 'chat15', '2020-12-01 12:06:11');
INSERT INTO `tb_userchat` VALUES (47, 1, 5, 'heyy', 'chat15', '2020-12-01 12:09:19');
INSERT INTO `tb_userchat` VALUES (48, 1, 5, 'hey', 'chat15', '2020-12-01 12:17:45');
INSERT INTO `tb_userchat` VALUES (49, 1, 5, 'okey', 'chat15', '2020-12-01 12:17:55');
INSERT INTO `tb_userchat` VALUES (50, 1, 5, 'daaa', 'chat15', '2020-12-01 12:18:04');
INSERT INTO `tb_userchat` VALUES (51, 1, 5, 'daa', 'chat15', '2020-12-01 12:22:12');
INSERT INTO `tb_userchat` VALUES (52, 1, 5, 'hey', 'chat15', '2020-12-01 12:22:19');
INSERT INTO `tb_userchat` VALUES (53, 1, 5, 'haii', 'chat15', '2020-12-01 12:22:27');
INSERT INTO `tb_userchat` VALUES (54, 1, 5, 'hellow', 'chat15', '2020-12-01 12:22:39');
INSERT INTO `tb_userchat` VALUES (55, 1, 5, 'daa', 'chat15', '2020-12-01 12:33:27');
INSERT INTO `tb_userchat` VALUES (56, 1, 5, 'cute', 'chat15', '2020-12-01 12:33:40');
INSERT INTO `tb_userchat` VALUES (57, 1, 5, 'great', 'chat15', '2020-12-01 12:33:50');
INSERT INTO `tb_userchat` VALUES (58, 1, 5, 'hey', 'chat15', '2020-12-01 12:34:38');
INSERT INTO `tb_userchat` VALUES (59, 1, 5, 'nice', 'chat15', '2020-12-01 12:35:03');
INSERT INTO `tb_userchat` VALUES (60, 1, 5, 'wow', 'chat15', '2020-12-01 12:35:15');
INSERT INTO `tb_userchat` VALUES (61, 1, 5, 'r u free now?', 'chat15', '2020-12-01 12:37:09');
INSERT INTO `tb_userchat` VALUES (62, 1, 5, 'nice to meet u da', 'chat15', '2020-12-01 12:37:22');
INSERT INTO `tb_userchat` VALUES (63, 1, 5, 'hellow', 'chat15', '2020-12-01 12:37:34');
INSERT INTO `tb_userchat` VALUES (64, 1, 2, 'hellow da', 'chat12', '2020-12-01 12:45:44');
INSERT INTO `tb_userchat` VALUES (65, 3, 1, 'tell me', 'chat31', '2020-12-01 13:56:11');
INSERT INTO `tb_userchat` VALUES (66, 1, 3, 'haii da', 'chat31', '2020-12-01 14:02:43');
INSERT INTO `tb_userchat` VALUES (67, 1, 3, 'hellow', 'chat31', '2020-12-01 14:02:59');
INSERT INTO `tb_userchat` VALUES (68, 3, 1, 'haii', 'chat31', '2020-12-01 14:03:15');
INSERT INTO `tb_userchat` VALUES (69, 3, 1, 'how r u?', 'chat31', '2020-12-01 14:03:41');
INSERT INTO `tb_userchat` VALUES (70, 1, 3, 'r u free now?', 'chat31', '2020-12-01 14:10:28');
INSERT INTO `tb_userchat` VALUES (71, 3, 1, 'ya', 'chat31', '2020-12-01 14:10:40');
INSERT INTO `tb_userchat` VALUES (72, 3, 1, 'tell me', 'chat31', '2020-12-01 14:10:50');
INSERT INTO `tb_userchat` VALUES (73, 1, 3, 'okey da', 'chat31', '2020-12-01 14:11:37');
INSERT INTO `tb_userchat` VALUES (74, 1, 3, 'fine', 'chat31', '2020-12-01 14:11:47');
INSERT INTO `tb_userchat` VALUES (75, 1, 2, 'haii da', 'chat12', '2020-12-01 19:04:09');
INSERT INTO `tb_userchat` VALUES (76, 1, 2, 'hellow', 'chat12', '2020-12-01 19:04:16');
INSERT INTO `tb_userchat` VALUES (77, 1, 2, 'where r u?', 'chat12', '2020-12-01 19:04:26');
INSERT INTO `tb_userchat` VALUES (78, 1, 2, 'hellow', 'chat12', '2020-12-01 19:04:33');
INSERT INTO `tb_userchat` VALUES (79, 1, 5, 'haii', 'chat15', '2020-12-01 19:05:58');
INSERT INTO `tb_userchat` VALUES (80, 1, 2, 'haii', 'chat12', '2020-12-02 10:58:13');
INSERT INTO `tb_userchat` VALUES (81, 1, 2, 'good Morning', 'chat12', '2020-12-02 10:58:22');
INSERT INTO `tb_userchat` VALUES (82, 1, 2, 'hellow', 'chat12', '2020-12-02 10:59:03');
INSERT INTO `tb_userchat` VALUES (83, 1, 2, 'haii', 'chat12', '2020-12-02 10:59:09');
INSERT INTO `tb_userchat` VALUES (84, 1, 2, 'haiii', 'chat12', '2020-12-02 10:59:24');
INSERT INTO `tb_userchat` VALUES (85, 1, 2, 'hellow', 'chat12', '2020-12-02 10:59:32');
INSERT INTO `tb_userchat` VALUES (86, 1, 2, 'daaa', 'chat12', '2020-12-02 10:59:51');
INSERT INTO `tb_userchat` VALUES (87, 1, 2, 'hellow', 'chat12', '2020-12-02 11:03:11');
INSERT INTO `tb_userchat` VALUES (88, 1, 2, 'haii', 'chat12', '2020-12-02 11:03:21');
INSERT INTO `tb_userchat` VALUES (89, 1, 2, 'daaa', 'chat12', '2020-12-02 11:03:34');
INSERT INTO `tb_userchat` VALUES (90, 1, 2, 'wow', 'chat12', '2020-12-02 11:03:44');
INSERT INTO `tb_userchat` VALUES (91, 1, 7, 'haii', 'chat17', '2020-12-02 13:08:20');
INSERT INTO `tb_userchat` VALUES (92, 1, 10, 'haii', 'chat110', '2020-12-02 13:42:19');
INSERT INTO `tb_userchat` VALUES (93, 1, 10, 'hellow', 'chat110', '2020-12-02 19:48:42');
INSERT INTO `tb_userchat` VALUES (94, 1, 7, 'Hellow', 'chat17', '2020-12-03 10:30:42');
INSERT INTO `tb_userchat` VALUES (95, 1, 2, 'Haii , good mng', 'chat12', '2020-12-03 10:31:29');
INSERT INTO `tb_userchat` VALUES (96, 1, 2, 'Hellow', 'chat12', '2020-12-03 10:31:37');
INSERT INTO `tb_userchat` VALUES (97, 1, 2, 'Haii', 'chat12', '2020-12-03 10:31:51');
INSERT INTO `tb_userchat` VALUES (98, 1, 2, 'Wow', 'chat12', '2020-12-03 10:32:01');
INSERT INTO `tb_userchat` VALUES (99, 1, 2, 'Daaa', 'chat12', '2020-12-03 10:32:09');
INSERT INTO `tb_userchat` VALUES (100, 1, 2, 'Haii', 'chat12', '2020-12-03 10:32:15');
INSERT INTO `tb_userchat` VALUES (101, 1, 2, 'Daa', 'chat12', '2020-12-03 10:32:24');
INSERT INTO `tb_userchat` VALUES (102, 1, 2, 'Deii', 'chat12', '2020-12-03 10:32:32');
INSERT INTO `tb_userchat` VALUES (103, 2, 1, 'tell me', 'chat12', '2020-12-03 10:35:21');
INSERT INTO `tb_userchat` VALUES (104, 2, 1, 'haii', 'chat12', '2020-12-03 10:35:33');
INSERT INTO `tb_userchat` VALUES (105, 2, 1, 'Good mng', 'chat12', '2020-12-03 10:35:51');
INSERT INTO `tb_userchat` VALUES (106, 1, 2, 'haii', 'chat12', '2020-12-03 10:44:33');
INSERT INTO `tb_userchat` VALUES (107, 1, 2, 'haii', 'chat12', '2020-12-03 10:46:13');
INSERT INTO `tb_userchat` VALUES (108, 1, 2, 'haii da', 'chat12', '2020-12-03 12:24:42');
INSERT INTO `tb_userchat` VALUES (109, 2, 1, 'Good mng', 'chat12', '2020-12-03 12:25:46');
INSERT INTO `tb_userchat` VALUES (110, 2, 1, 'Good mng', 'chat12', '2020-12-03 12:25:57');
INSERT INTO `tb_userchat` VALUES (111, 2, 1, 'haii', 'chat12', '2020-12-03 12:26:09');
INSERT INTO `tb_userchat` VALUES (112, 2, 1, 'how r u? da', 'chat12', '2020-12-03 12:26:31');
INSERT INTO `tb_userchat` VALUES (113, 7, 1, 'how r u? da', 'chat17', '2020-12-03 12:38:12');
INSERT INTO `tb_userchat` VALUES (114, 33, 1, 'haii da', 'chat331', '2020-12-03 16:34:08');
INSERT INTO `tb_userchat` VALUES (115, 33, 1, 'How r u?', 'chat331', '2020-12-03 16:34:40');
INSERT INTO `tb_userchat` VALUES (116, 45, 5, 'haii da', 'chat455', '2020-12-03 17:14:17');
INSERT INTO `tb_userchat` VALUES (118, 1, 2, 'haii', 'chat12', '2020-12-07 23:22:28');
INSERT INTO `tb_userchat` VALUES (119, 1, 2, 'how r u da?', 'chat12', '2020-12-07 23:22:43');
INSERT INTO `tb_userchat` VALUES (120, 1, 5, 'Hai !', 'chat15', '2021-01-05 11:56:57');
INSERT INTO `tb_userchat` VALUES (121, 1, 5, 'Hai !', 'chat15', '2021-01-05 11:57:20');
INSERT INTO `tb_userchat` VALUES (122, 1, 7, 'Hai !', 'chat17', '2021-01-05 20:03:52');
INSERT INTO `tb_userchat` VALUES (123, 1, 2, 'haii', 'chat12', '2021-01-07 13:15:43');
INSERT INTO `tb_userchat` VALUES (124, 2, 1, 'Hi', 'chat12', '2021-01-14 15:35:38');
INSERT INTO `tb_userchat` VALUES (125, 2, 1, 'Hello', 'chat12', '2021-01-14 15:35:47');
INSERT INTO `tb_userchat` VALUES (126, 2, 1, 'Good evening', 'chat12', '2021-01-14 16:32:49');

-- ----------------------------
-- Table structure for tb_userchatupload
-- ----------------------------
DROP TABLE IF EXISTS `tb_userchatupload`;
CREATE TABLE `tb_userchatupload`  (
  `up_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid_to` int(11) NULL DEFAULT NULL,
  `userid_from` int(11) NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`up_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_userchatupload
-- ----------------------------
INSERT INTO `tb_userchatupload` VALUES (1, 2, 1, '2e89bc77a8eab69504ef2d9b1850eb5c.wpl', '2020-12-06 23:00:00');
INSERT INTO `tb_userchatupload` VALUES (2, 2, 1, '37423cdaf708a7f6f0d4d72cb59ffd01.pptx', '2020-12-06 23:00:00');
INSERT INTO `tb_userchatupload` VALUES (3, 2, 1, '3cdbb78cd5faa698de0d73c857c4fbc9.csv', '2020-12-07 21:03:05');
INSERT INTO `tb_userchatupload` VALUES (4, 1, 2, '13e9caa8fe8ea91037cab4ffbf1ac74c.jpg', '2020-12-09 03:34:56');
INSERT INTO `tb_userchatupload` VALUES (5, 2, 1, '9241513405a5cacc3908c5fc5a299165.csv', '2020-12-15 03:45:35');
INSERT INTO `tb_userchatupload` VALUES (6, 1, 2, '10cf385ec2bd31bc793071758a53dd73.jpeg', '2020-12-15 05:03:06');
INSERT INTO `tb_userchatupload` VALUES (7, 1, 5, 'c8c11683fa1fe43d7042b642bfc3a5b3.jpg', '2020-12-16 06:29:04');
INSERT INTO `tb_userchatupload` VALUES (8, 1, 5, '2278033aa38856da8a889ef7a91cced9.jpg', '2020-12-16 06:58:52');
INSERT INTO `tb_userchatupload` VALUES (9, 1, 2, '44508bf33af83ac39c049d3aaded13c2.jpg', '2020-12-16 06:59:26');
INSERT INTO `tb_userchatupload` VALUES (10, 1, 2, '747fcbfc90ac123c2b2ba79336dd20d4.jpg', '2020-12-16 07:18:30');
INSERT INTO `tb_userchatupload` VALUES (11, 1, 3, '77b03c8133f5c00ae4928a502ef2f612.jpg', '2020-12-16 07:18:30');
INSERT INTO `tb_userchatupload` VALUES (12, 1, 3, '90fc2c6f0c1e4c65994925349582c5c4.jpg', '2020-12-16 07:19:42');
INSERT INTO `tb_userchatupload` VALUES (13, 1, 2, 'f6583f99209eb0d00d7a3444a7443e14.jpg', '2020-12-16 07:19:42');
INSERT INTO `tb_userchatupload` VALUES (14, 2, 1, '50a467a91f1256f5cab3721f7ebf402a.csv', '2020-12-16 07:33:32');
INSERT INTO `tb_userchatupload` VALUES (15, 5, 2, '030ce76908962586f2532afd49fccf3c.jpg', '2020-12-16 08:28:43');

-- ----------------------------
-- Table structure for tb_usercomments
-- ----------------------------
DROP TABLE IF EXISTS `tb_usercomments`;
CREATE TABLE `tb_usercomments`  (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `userstatus` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`com_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_usercomments
-- ----------------------------
INSERT INTO `tb_usercomments` VALUES (1, 2, 'hello', 'self', '2020-11-06 00:08:42');
INSERT INTO `tb_usercomments` VALUES (2, 2, 'hello', 'self', '2020-11-06 00:20:28');
INSERT INTO `tb_usercomments` VALUES (3, 1, 'wow', 'self', '2020-11-06 02:14:43');
INSERT INTO `tb_usercomments` VALUES (4, 1, 'great', 'self', '2020-11-06 02:14:51');
INSERT INTO `tb_usercomments` VALUES (5, 1, 'second one was really good', 'self', '2020-11-06 02:15:09');
INSERT INTO `tb_usercomments` VALUES (6, 36, 'haii', 'self', '2020-11-08 21:22:09');
INSERT INTO `tb_usercomments` VALUES (7, 36, 'hellow', 'self', '2020-11-08 21:27:22');
INSERT INTO `tb_usercomments` VALUES (8, 36, 'how r u guys?', 'self', '2020-11-08 22:08:00');
INSERT INTO `tb_usercomments` VALUES (9, 1, 'great', 'self', '2020-11-09 22:26:18');
INSERT INTO `tb_usercomments` VALUES (10, 1, 'nice', 'self', '2020-11-09 22:26:49');
INSERT INTO `tb_usercomments` VALUES (11, 1, 'great', 'self', '2020-11-10 05:48:00');
INSERT INTO `tb_usercomments` VALUES (12, 2, 'hello nice to meet you', 'self', '2020-11-11 00:05:01');
INSERT INTO `tb_usercomments` VALUES (13, 38, 'Wow...that first one was really great thought', 'self', '2020-11-11 01:24:16');
INSERT INTO `tb_usercomments` VALUES (14, 7, 'Hlo', 'self', '2020-11-12 06:21:24');
INSERT INTO `tb_usercomments` VALUES (15, 1, 'I do not understand this analogy,\" Mencheres muttered.', 'self', '2020-11-12 07:18:21');
INSERT INTO `tb_usercomments` VALUES (16, 7, 'Hju', 'self', '2020-11-15 22:52:04');
INSERT INTO `tb_usercomments` VALUES (17, 1, 'haii', 'self', '2020-11-16 23:15:40');
INSERT INTO `tb_usercomments` VALUES (18, 42, 'haii', 'self', '2020-11-17 02:39:20');
INSERT INTO `tb_usercomments` VALUES (19, 1, 'hellow', 'self', '2020-11-17 23:16:15');
INSERT INTO `tb_usercomments` VALUES (20, 1, 'heii', 'self', '2020-11-17 23:17:11');
INSERT INTO `tb_usercomments` VALUES (21, 1, 'koooii', 'self', '2020-11-17 23:18:55');
INSERT INTO `tb_usercomments` VALUES (22, 1, 'koooii', 'self', '2020-11-17 23:19:04');
INSERT INTO `tb_usercomments` VALUES (23, 1, 'hellow', 'self', '2020-11-17 23:20:18');
INSERT INTO `tb_usercomments` VALUES (24, 1, 'heyy', 'self', '2020-11-17 23:20:26');
INSERT INTO `tb_usercomments` VALUES (25, 1, 'heyy', 'self', '2020-11-17 23:20:33');
INSERT INTO `tb_usercomments` VALUES (26, 1, 'hey', 'self', '2020-11-17 23:37:23');
INSERT INTO `tb_usercomments` VALUES (27, 1, 'hey', 'self', '2020-11-17 23:37:27');
INSERT INTO `tb_usercomments` VALUES (28, 1, 'hellow', 'self', '2020-11-17 23:37:33');
INSERT INTO `tb_usercomments` VALUES (29, 7, 'Hello', 'self', '2020-11-24 02:41:03');
INSERT INTO `tb_usercomments` VALUES (30, 7, 'Hii', 'self', '2020-11-24 03:06:57');
INSERT INTO `tb_usercomments` VALUES (31, 7, 'hhhh', 'self', '2020-11-30 22:58:49');
INSERT INTO `tb_usercomments` VALUES (32, 7, 'hhhh', 'self', '2020-11-30 22:58:49');
INSERT INTO `tb_usercomments` VALUES (33, 7, 'hhhh', 'self', '2020-11-30 22:58:49');
INSERT INTO `tb_usercomments` VALUES (34, 7, 'hhhh', 'self', '2020-11-30 22:58:50');
INSERT INTO `tb_usercomments` VALUES (35, 7, 'ggggg', 'self', '2020-11-30 22:58:59');

-- ----------------------------
-- Table structure for tb_userupload
-- ----------------------------
DROP TABLE IF EXISTS `tb_userupload`;
CREATE TABLE `tb_userupload`  (
  `fileid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `send_to` int(11) NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`fileid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_userupload
-- ----------------------------
INSERT INTO `tb_userupload` VALUES (1, 2, NULL, '0bb2f060106b4f9a242d80b34ab1a761.mp4', '2020-11-26 08:27:49');
INSERT INTO `tb_userupload` VALUES (2, 2, NULL, 'dee49be2659f120225cd8e0d16ae9713.jpg', '2020-11-26 08:29:05');
INSERT INTO `tb_userupload` VALUES (3, 2, NULL, '3ec19b260e1eafb126c23f16ac7f1277.jpg', '2020-12-15 21:35:13');
INSERT INTO `tb_userupload` VALUES (4, 2, NULL, '93f0db0782781a6f1b21f35bd7c1c01e.jpg', '2020-12-15 22:34:16');
INSERT INTO `tb_userupload` VALUES (5, 1, NULL, '64779090a8fb49dd856e3ebc17cd33c7.jpg', '2020-12-15 22:54:05');
INSERT INTO `tb_userupload` VALUES (6, 1, NULL, '6f84d399e109302461b5b6cae9501d08.jpg', '2020-12-15 23:07:00');
INSERT INTO `tb_userupload` VALUES (7, 1, NULL, '8f3c2ea3502acfcec52f112c7397e450.jpeg', '2020-12-16 05:33:55');
INSERT INTO `tb_userupload` VALUES (8, 1, NULL, '986830b0c240a996c9f7b9b173c0d2e8.jpeg', '2020-12-16 08:24:33');
INSERT INTO `tb_userupload` VALUES (9, 7, NULL, '53293e63cb33654d7a0257c2f64f9bae.jpeg', '2020-12-22 06:29:20');
INSERT INTO `tb_userupload` VALUES (10, 7, NULL, '40a25b5711d59f14c414f05b99c653e9.jpeg', '2020-12-22 06:29:33');
INSERT INTO `tb_userupload` VALUES (11, 2, 1, 'de5603dfe2e363f8ccb70a976fa6811a.jpg', '2021-01-05 01:15:47');

SET FOREIGN_KEY_CHECKS = 1;
