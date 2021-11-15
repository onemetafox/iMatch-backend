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

 Date: 15/11/2021 07:01:01
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_matchusers
-- ----------------------------
INSERT INTO `tb_matchusers` VALUES (2, 13, 2, 'accept', 1);

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
  PRIMARY KEY (`not_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1089 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_notification
-- ----------------------------
INSERT INTO `tb_notification` VALUES (1, 20, 1, 'raveena added you as squad', 'Add_Bestie', 1, '2020-09-10 20:18:34');
INSERT INTO `tb_notification` VALUES (2, 1, 20, 'You have added Akshay to your squad list', 'Add_Bestie', 1, '2020-09-10 20:18:34');
INSERT INTO `tb_notification` VALUES (3, 20, 3, 'raveena added you as bestie', 'Add_Bestie', 2, '2020-09-10 20:19:02');
INSERT INTO `tb_notification` VALUES (4, 3, 20, 'You have added jitheesh to your bestie list', 'Add_Bestie', 2, '2020-09-10 20:19:02');
INSERT INTO `tb_notification` VALUES (5, 1, 3, 'Akshay added you as squad', 'Add_Bestie', 3, '2020-09-10 21:46:24');
INSERT INTO `tb_notification` VALUES (6, 3, 1, 'You have added jitheesh to your squad list', 'Add_Bestie', 3, '2020-09-10 21:46:24');
INSERT INTO `tb_notification` VALUES (7, 1, 2, 'Akshay added you as squad', 'Add_Bestie', 4, '2020-09-10 21:48:30');
INSERT INTO `tb_notification` VALUES (8, 2, 1, 'You have added Ravi to your squad list', 'Add_Bestie', 4, '2020-09-10 21:48:30');
INSERT INTO `tb_notification` VALUES (9, 1, 6, 'Akshay added you as squad', 'Add_Bestie', 5, '2020-09-10 22:31:44');
INSERT INTO `tb_notification` VALUES (10, 6, 1, 'You have added Test 2 to your squad list', 'Add_Bestie', 5, '2020-09-10 22:31:44');
INSERT INTO `tb_notification` VALUES (11, 1, 9, 'Akshay added you as squad', 'Add_Bestie', 6, '2020-09-10 22:35:25');
INSERT INTO `tb_notification` VALUES (12, 9, 1, 'You have added Aoc to your squad list', 'Add_Bestie', 6, '2020-09-10 22:35:25');
INSERT INTO `tb_notification` VALUES (13, 1, 5, 'Akshay added you as squad', 'Add_Bestie', 7, '2020-09-11 01:41:53');
INSERT INTO `tb_notification` VALUES (14, 5, 1, 'You have added jitheesh  to your squad list', 'Add_Bestie', 7, '2020-09-11 01:41:53');
INSERT INTO `tb_notification` VALUES (15, 20, 1, 'raveena added you as squad', 'Add_Bestie', 8, '2020-09-11 03:56:53');
INSERT INTO `tb_notification` VALUES (16, 1, 20, 'You have added Akshay to your squad list', 'Add_Bestie', 8, '2020-09-11 03:56:53');
INSERT INTO `tb_notification` VALUES (17, 20, 3, 'raveena added you as bestie', 'Add_Bestie', 9, '2020-09-11 03:57:22');
INSERT INTO `tb_notification` VALUES (18, 3, 20, 'You have added jitheesh to your bestie list', 'Add_Bestie', 9, '2020-09-11 03:57:22');
INSERT INTO `tb_notification` VALUES (19, 21, 19, 'Lisa added you as squad', 'Add_Bestie', 10, '2020-09-13 19:55:04');
INSERT INTO `tb_notification` VALUES (20, 19, 21, 'You have added Binoy to your squad list', 'Add_Bestie', 10, '2020-09-13 19:55:04');
INSERT INTO `tb_notification` VALUES (21, 21, 1, 'Lisa added you as squad', 'Add_Bestie', 11, '2020-09-13 19:55:09');
INSERT INTO `tb_notification` VALUES (22, 1, 21, 'You have added Akshay to your squad list', 'Add_Bestie', 11, '2020-09-13 19:55:09');
INSERT INTO `tb_notification` VALUES (23, 21, 19, 'Lisa added you as bestie', 'Add_Bestie', 12, '2020-09-13 19:55:37');
INSERT INTO `tb_notification` VALUES (24, 19, 21, 'You have added Binoy to your bestie list', 'Add_Bestie', 12, '2020-09-13 19:55:37');
INSERT INTO `tb_notification` VALUES (25, 21, 7, 'Lisa added you as bestie', 'Add_Bestie', 13, '2020-09-13 19:55:52');
INSERT INTO `tb_notification` VALUES (26, 7, 21, 'You have added Sam to your bestie list', 'Add_Bestie', 13, '2020-09-13 19:55:52');
INSERT INTO `tb_notification` VALUES (27, 21, 8, 'Lisa added you as bestie', 'Add_Bestie', 14, '2020-09-13 19:55:55');
INSERT INTO `tb_notification` VALUES (28, 8, 21, 'You have added Neethu to your bestie list', 'Add_Bestie', 14, '2020-09-13 19:55:55');
INSERT INTO `tb_notification` VALUES (29, 21, 1, 'Lisa added you as bestie', 'Add_Bestie', 15, '2020-09-13 19:56:12');
INSERT INTO `tb_notification` VALUES (30, 1, 21, 'You have added Akshay to your bestie list', 'Add_Bestie', 15, '2020-09-13 19:56:12');
INSERT INTO `tb_notification` VALUES (31, 1, 2, 'Akshay added you as bestie', 'Add_Bestie', 16, '2020-09-15 21:48:26');
INSERT INTO `tb_notification` VALUES (32, 2, 1, 'You have added Ravi to your bestie list', 'Add_Bestie', 16, '2020-09-15 21:48:26');
INSERT INTO `tb_notification` VALUES (33, 1, 3, 'Akshay added you as bestie', 'Add_Bestie', 17, '2020-09-15 21:54:58');
INSERT INTO `tb_notification` VALUES (34, 3, 1, 'You have added jitheesh to your bestie list', 'Add_Bestie', 17, '2020-09-15 21:54:58');
INSERT INTO `tb_notification` VALUES (35, 1, 11, 'Akshay added you as bestie', 'Add_Bestie', 18, '2020-09-16 07:05:44');
INSERT INTO `tb_notification` VALUES (36, 11, 1, 'You have added kunjan to your bestie list', 'Add_Bestie', 18, '2020-09-16 07:05:44');
INSERT INTO `tb_notification` VALUES (37, 1, 5, 'Akshay added you as bestie', 'Add_Bestie', 19, '2020-09-16 07:13:34');
INSERT INTO `tb_notification` VALUES (38, 5, 1, 'You have added jitheesh  to your bestie list', 'Add_Bestie', 19, '2020-09-16 07:13:34');
INSERT INTO `tb_notification` VALUES (39, 1, 17, 'Akshay added you as bestie', 'Add_Bestie', 20, '2020-09-16 07:18:27');
INSERT INTO `tb_notification` VALUES (40, 17, 1, 'You have added Ram to your bestie list', 'Add_Bestie', 20, '2020-09-16 07:18:27');
INSERT INTO `tb_notification` VALUES (41, 1, 6, 'Akshay added you as bestie', 'Add_Bestie', 21, '2020-09-16 07:19:50');
INSERT INTO `tb_notification` VALUES (42, 6, 1, 'You have added Test 2 to your bestie list', 'Add_Bestie', 21, '2020-09-16 07:19:50');
INSERT INTO `tb_notification` VALUES (43, 22, 1, 'Philip added you as bestie', 'Add_Bestie', 22, '2020-09-16 08:21:49');
INSERT INTO `tb_notification` VALUES (44, 1, 22, 'You have added Akshay to your bestie list', 'Add_Bestie', 22, '2020-09-16 08:21:49');
INSERT INTO `tb_notification` VALUES (45, 7, 8, 'Sam added you as squad', 'Add_Bestie', 23, '2020-09-17 02:18:30');
INSERT INTO `tb_notification` VALUES (46, 8, 7, 'You have added Neethu to your squad list', 'Add_Bestie', 23, '2020-09-17 02:18:30');
INSERT INTO `tb_notification` VALUES (47, 7, 12, 'Sam added you as squad', 'Add_Bestie', 24, '2020-09-17 02:18:49');
INSERT INTO `tb_notification` VALUES (48, 12, 7, 'You have added Kanna to your squad list', 'Add_Bestie', 24, '2020-09-17 02:18:49');
INSERT INTO `tb_notification` VALUES (49, 7, 19, 'Sam added you as squad', 'Add_Bestie', 25, '2020-09-17 02:18:53');
INSERT INTO `tb_notification` VALUES (50, 19, 7, 'You have added Binoy to your squad list', 'Add_Bestie', 25, '2020-09-17 02:18:53');
INSERT INTO `tb_notification` VALUES (51, 7, 19, 'Sam added you as bestie', 'Add_Bestie', 26, '2020-09-17 02:29:31');
INSERT INTO `tb_notification` VALUES (52, 19, 7, 'You have added Binoy to your bestie list', 'Add_Bestie', 26, '2020-09-17 02:29:31');
INSERT INTO `tb_notification` VALUES (53, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 1, '2020-09-18 09:27:43');
INSERT INTO `tb_notification` VALUES (54, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 1, '2020-09-18 09:27:43');
INSERT INTO `tb_notification` VALUES (63, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-18 09:57:36');
INSERT INTO `tb_notification` VALUES (64, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-18 09:57:36');
INSERT INTO `tb_notification` VALUES (65, 23, 8, 'Kiran added you as bestie', 'Add_Bestie', 27, '2020-09-21 00:05:05');
INSERT INTO `tb_notification` VALUES (66, 8, 23, 'You have added Neethu to your bestie list', 'Add_Bestie', 27, '2020-09-21 00:05:05');
INSERT INTO `tb_notification` VALUES (67, 1, 4, 'Akshay added you as bestie', 'Add_Bestie', 28, '2020-09-21 00:28:21');
INSERT INTO `tb_notification` VALUES (68, 4, 1, 'You have added jitheesh to your bestie list', 'Add_Bestie', 28, '2020-09-21 00:28:21');
INSERT INTO `tb_notification` VALUES (69, 1, 19, 'Akshay added you as bestie', 'Add_Bestie', 29, '2020-09-21 00:34:32');
INSERT INTO `tb_notification` VALUES (70, 19, 1, 'You have added Binoy to your bestie list', 'Add_Bestie', 29, '2020-09-21 00:34:32');
INSERT INTO `tb_notification` VALUES (71, 1, 15, 'Akshay added you as squad', 'Add_Bestie', 30, '2020-09-21 00:36:36');
INSERT INTO `tb_notification` VALUES (72, 15, 1, 'You have added Ravi to your squad list', 'Add_Bestie', 30, '2020-09-21 00:36:36');
INSERT INTO `tb_notification` VALUES (73, 7, 1, 'Sam added you as squad', 'Add_Bestie', 31, '2020-09-21 03:44:31');
INSERT INTO `tb_notification` VALUES (74, 1, 7, 'You have added Akshay to your squad list', 'Add_Bestie', 31, '2020-09-21 03:44:31');
INSERT INTO `tb_notification` VALUES (75, 23, 8, 'Kiran Invited you from bestie list to have a Match of 01:00:00 duration', 'Match_invitation', 2, '2020-09-22 05:09:26');
INSERT INTO `tb_notification` VALUES (76, 8, 23, 'You have Invited Neethu from bestie list to have a Match of 01:00:00 duration', 'Match_invitation', 2, '2020-09-22 05:09:26');
INSERT INTO `tb_notification` VALUES (77, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-23 21:31:09');
INSERT INTO `tb_notification` VALUES (78, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-23 21:31:09');
INSERT INTO `tb_notification` VALUES (79, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-23 22:01:20');
INSERT INTO `tb_notification` VALUES (80, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-23 22:01:20');
INSERT INTO `tb_notification` VALUES (81, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-23 22:02:03');
INSERT INTO `tb_notification` VALUES (82, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-23 22:02:03');
INSERT INTO `tb_notification` VALUES (83, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-23 22:02:40');
INSERT INTO `tb_notification` VALUES (84, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-23 22:02:40');
INSERT INTO `tb_notification` VALUES (85, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-23 22:03:11');
INSERT INTO `tb_notification` VALUES (86, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-23 22:03:11');
INSERT INTO `tb_notification` VALUES (87, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-24 00:59:15');
INSERT INTO `tb_notification` VALUES (88, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-24 00:59:15');
INSERT INTO `tb_notification` VALUES (89, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-24 02:58:40');
INSERT INTO `tb_notification` VALUES (90, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-24 02:58:40');
INSERT INTO `tb_notification` VALUES (91, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-24 21:04:03');
INSERT INTO `tb_notification` VALUES (92, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-24 21:04:03');
INSERT INTO `tb_notification` VALUES (93, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-24 21:51:28');
INSERT INTO `tb_notification` VALUES (94, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-24 21:51:28');
INSERT INTO `tb_notification` VALUES (95, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-24 21:55:39');
INSERT INTO `tb_notification` VALUES (96, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-24 21:55:39');
INSERT INTO `tb_notification` VALUES (97, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 1, '2020-09-24 22:16:47');
INSERT INTO `tb_notification` VALUES (98, 1, 2, 'You have rejected Invitation from Ravi', 'match_reply', 1, '2020-09-24 22:16:47');
INSERT INTO `tb_notification` VALUES (99, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-24 22:17:27');
INSERT INTO `tb_notification` VALUES (100, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-24 22:17:27');
INSERT INTO `tb_notification` VALUES (101, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-24 22:19:47');
INSERT INTO `tb_notification` VALUES (102, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-24 22:19:47');
INSERT INTO `tb_notification` VALUES (103, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-24 22:25:23');
INSERT INTO `tb_notification` VALUES (104, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-24 22:25:23');
INSERT INTO `tb_notification` VALUES (105, 8, 1, 'Neethu Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 3, '2020-09-24 23:43:09');
INSERT INTO `tb_notification` VALUES (106, 1, 8, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 3, '2020-09-24 23:43:09');
INSERT INTO `tb_notification` VALUES (107, 5, 1, 'jitheesh  Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 4, '2020-09-24 23:44:02');
INSERT INTO `tb_notification` VALUES (108, 1, 5, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 4, '2020-09-24 23:44:02');
INSERT INTO `tb_notification` VALUES (109, 1, 5, 'Akshay Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 5, '2020-09-24 23:45:47');
INSERT INTO `tb_notification` VALUES (110, 5, 1, 'You have Invited jitheesh  from bestie list to have a Match of 1 hour duration', 'Match_invitation', 5, '2020-09-24 23:45:47');
INSERT INTO `tb_notification` VALUES (111, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-25 00:36:10');
INSERT INTO `tb_notification` VALUES (112, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-25 00:36:10');
INSERT INTO `tb_notification` VALUES (113, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-25 00:36:45');
INSERT INTO `tb_notification` VALUES (114, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-25 00:36:45');
INSERT INTO `tb_notification` VALUES (115, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-25 00:37:42');
INSERT INTO `tb_notification` VALUES (116, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-25 00:37:42');
INSERT INTO `tb_notification` VALUES (117, 23, 8, 'Your Invitation is accepted by Neethu', 'match_reply', 2, '2020-09-25 01:46:13');
INSERT INTO `tb_notification` VALUES (118, 8, 23, 'You have accepted Invitation from Kiran', 'match_reply', 2, '2020-09-25 01:46:13');
INSERT INTO `tb_notification` VALUES (119, 23, 8, 'Your Invitation is rejected by Neethu', 'match_reply', 2, '2020-09-25 02:09:32');
INSERT INTO `tb_notification` VALUES (120, 8, 23, 'You have rejected Invitation from Kiran', 'match_reply', 2, '2020-09-25 02:09:32');
INSERT INTO `tb_notification` VALUES (121, 1, 5, 'Akshay Invited you from squad list to have a Match of 1 hour duration', 'Match_invitation', 6, '2020-09-25 05:08:38');
INSERT INTO `tb_notification` VALUES (122, 5, 1, 'You have Invited jitheesh  from squad list to have a Match of 1 hour duration', 'Match_invitation', 6, '2020-09-25 05:08:38');
INSERT INTO `tb_notification` VALUES (123, 1, 2, 'Akshay Invited you from squad list to have a Match of 1 hour duration', 'Match_invitation', 7, '2020-09-25 05:12:22');
INSERT INTO `tb_notification` VALUES (124, 2, 1, 'You have Invited Ravi from squad list to have a Match of 1 hour duration', 'Match_invitation', 7, '2020-09-25 05:12:22');
INSERT INTO `tb_notification` VALUES (125, 5, 1, 'jitheesh  Invited you from squad list to have a Match of 1 hour duration', 'Match_invitation', 8, '2020-09-25 05:18:58');
INSERT INTO `tb_notification` VALUES (126, 1, 5, 'You have Invited Akshay from squad list to have a Match of 1 hour duration', 'Match_invitation', 8, '2020-09-25 05:18:58');
INSERT INTO `tb_notification` VALUES (127, 2, 1, 'Ravi Invited you from squad list to have a Match of 1 hour duration', 'Match_invitation', 9, '2020-09-25 05:51:00');
INSERT INTO `tb_notification` VALUES (128, 1, 2, 'You have Invited Akshay from squad list to have a Match of 1 hour duration', 'Match_invitation', 9, '2020-09-25 05:51:00');
INSERT INTO `tb_notification` VALUES (129, 3, 1, 'jitheesh Invited you from squad list to have a Match of 1 hour duration', 'Match_invitation', 10, '2020-09-25 05:51:06');
INSERT INTO `tb_notification` VALUES (130, 1, 3, 'You have Invited Akshay from squad list to have a Match of 1 hour duration', 'Match_invitation', 10, '2020-09-25 05:51:06');
INSERT INTO `tb_notification` VALUES (131, 8, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 3, '2020-09-25 06:07:08');
INSERT INTO `tb_notification` VALUES (132, 1, 8, 'You have accepted Invitation from Neethu', 'match_reply', 3, '2020-09-25 06:07:08');
INSERT INTO `tb_notification` VALUES (133, 2, 5, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 11, '2020-09-28 05:10:51');
INSERT INTO `tb_notification` VALUES (134, 5, 2, 'You have Invited jitheesh  from bestie list to have a Match of 1 hour duration', 'Match_invitation', 11, '2020-09-28 05:10:51');
INSERT INTO `tb_notification` VALUES (135, 2, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 11, '2020-09-28 05:11:21');
INSERT INTO `tb_notification` VALUES (136, 5, 2, 'You have accepted Invitation from Ravi', 'match_reply', 11, '2020-09-28 05:11:21');
INSERT INTO `tb_notification` VALUES (137, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 7, '2020-09-28 22:09:38');
INSERT INTO `tb_notification` VALUES (138, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 7, '2020-09-28 22:09:38');
INSERT INTO `tb_notification` VALUES (139, 1, 2, 'Akshay added you as fan', 'Add_Fan', 1, '2020-09-28 22:41:33');
INSERT INTO `tb_notification` VALUES (140, 2, 1, 'You have added Ravi to your fan list', 'Add_Fan', 1, '2020-09-28 22:41:33');
INSERT INTO `tb_notification` VALUES (141, 1, 2, 'Akshay added you as fan_of', 'Add_Fan', 2, '2020-09-28 22:41:50');
INSERT INTO `tb_notification` VALUES (142, 2, 1, 'You have added Ravi to your fan_of list', 'Add_Fan', 2, '2020-09-28 22:41:50');
INSERT INTO `tb_notification` VALUES (143, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 4, '2020-09-29 08:36:59');
INSERT INTO `tb_notification` VALUES (144, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 4, '2020-09-29 08:36:59');
INSERT INTO `tb_notification` VALUES (145, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 7, '2020-09-29 23:01:24');
INSERT INTO `tb_notification` VALUES (146, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 7, '2020-09-29 23:01:24');
INSERT INTO `tb_notification` VALUES (147, 1, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 5, '2020-09-29 23:01:32');
INSERT INTO `tb_notification` VALUES (148, 5, 1, 'You have accepted Invitation from Akshay', 'match_reply', 5, '2020-09-29 23:01:32');
INSERT INTO `tb_notification` VALUES (149, 1, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 6, '2020-09-29 23:01:39');
INSERT INTO `tb_notification` VALUES (150, 5, 1, 'You have accepted Invitation from Akshay', 'match_reply', 6, '2020-09-29 23:01:39');
INSERT INTO `tb_notification` VALUES (151, 1, 20, 'Akshay Invited you from bestie list to have a Match of 7 day duration', 'Match_invitation', 12, '2020-09-30 01:41:00');
INSERT INTO `tb_notification` VALUES (152, 20, 1, 'You have Invited raveena from bestie list to have a Match of 7 day duration', 'Match_invitation', 12, '2020-09-30 01:41:00');
INSERT INTO `tb_notification` VALUES (153, 1, 11, 'Akshay Invited you from bestie list to have a Match of 7 day duration', 'Match_invitation', 13, '2020-09-30 01:47:35');
INSERT INTO `tb_notification` VALUES (154, 11, 1, 'You have Invited kunjan from bestie list to have a Match of 7 day duration', 'Match_invitation', 13, '2020-09-30 01:47:35');
INSERT INTO `tb_notification` VALUES (155, 1, 21, 'Akshay Invited you from bestie list to have a Match of 7 day duration', 'Match_invitation', 14, '2020-09-30 04:32:21');
INSERT INTO `tb_notification` VALUES (156, 21, 1, 'You have Invited Lisa from bestie list to have a Match of 7 day duration', 'Match_invitation', 14, '2020-09-30 04:32:21');
INSERT INTO `tb_notification` VALUES (157, 1, 2, 'Akshay Invited you from bestie list to have a Match of 7 day duration', 'Match_invitation', 15, '2020-09-30 04:32:49');
INSERT INTO `tb_notification` VALUES (158, 2, 1, 'You have Invited Ravi from bestie list to have a Match of 7 day duration', 'Match_invitation', 15, '2020-09-30 04:32:49');
INSERT INTO `tb_notification` VALUES (159, 1, 19, 'Akshay Invited you from bestie list to have a Match of 7 day duration', 'Match_invitation', 16, '2020-09-30 04:49:20');
INSERT INTO `tb_notification` VALUES (160, 19, 1, 'You have Invited Binoy from bestie list to have a Match of 7 day duration', 'Match_invitation', 16, '2020-09-30 04:49:20');
INSERT INTO `tb_notification` VALUES (161, 1, 6, 'Akshay Invited you from bestie list to have a Match of 3 day duration', 'Match_invitation', 17, '2020-09-30 04:55:04');
INSERT INTO `tb_notification` VALUES (162, 6, 1, 'You have Invited Test 2 from bestie list to have a Match of 3 day duration', 'Match_invitation', 17, '2020-09-30 04:55:04');
INSERT INTO `tb_notification` VALUES (163, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 1, '2020-09-30 09:42:09');
INSERT INTO `tb_notification` VALUES (164, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 1, '2020-09-30 09:42:09');
INSERT INTO `tb_notification` VALUES (165, 2, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 11, '2020-09-30 09:42:18');
INSERT INTO `tb_notification` VALUES (166, 5, 2, 'You have accepted Invitation from Ravi', 'match_reply', 11, '2020-09-30 09:42:18');
INSERT INTO `tb_notification` VALUES (167, 1, 20, 'Your Invitation is accepted by raveena', 'match_reply', 12, '2020-10-01 03:25:49');
INSERT INTO `tb_notification` VALUES (168, 20, 1, 'You have accepted Invitation from Akshay', 'match_reply', 12, '2020-10-01 03:25:49');
INSERT INTO `tb_notification` VALUES (169, 1, 11, 'Your Invitation is accepted by kunjan', 'match_reply', 13, '2020-10-01 03:25:54');
INSERT INTO `tb_notification` VALUES (170, 11, 1, 'You have accepted Invitation from Akshay', 'match_reply', 13, '2020-10-01 03:25:54');
INSERT INTO `tb_notification` VALUES (171, 1, 21, 'Your Invitation is accepted by Lisa', 'match_reply', 14, '2020-10-01 03:25:59');
INSERT INTO `tb_notification` VALUES (172, 21, 1, 'You have accepted Invitation from Akshay', 'match_reply', 14, '2020-10-01 03:25:59');
INSERT INTO `tb_notification` VALUES (173, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 15, '2020-10-01 03:26:04');
INSERT INTO `tb_notification` VALUES (174, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 15, '2020-10-01 03:26:04');
INSERT INTO `tb_notification` VALUES (175, 1, 19, 'Your Invitation is accepted by Binoy', 'match_reply', 16, '2020-10-01 03:26:09');
INSERT INTO `tb_notification` VALUES (176, 19, 1, 'You have accepted Invitation from Akshay', 'match_reply', 16, '2020-10-01 03:26:09');
INSERT INTO `tb_notification` VALUES (177, 1, 6, 'Your Invitation is accepted by Test 2', 'match_reply', 17, '2020-10-01 03:26:23');
INSERT INTO `tb_notification` VALUES (178, 6, 1, 'You have accepted Invitation from Akshay', 'match_reply', 17, '2020-10-01 03:26:23');
INSERT INTO `tb_notification` VALUES (179, 1, 3, 'Akshay Invited you from undefined list to have a Match of 7 day duration', 'Match_invitation', 18, '2020-10-08 04:24:40');
INSERT INTO `tb_notification` VALUES (180, 3, 1, 'You have Invited jitheesh from undefined list to have a Match of 7 day duration', 'Match_invitation', 18, '2020-10-08 04:24:40');
INSERT INTO `tb_notification` VALUES (181, 1, 2, 'Akshay Invited you from undefined list to have a Match of 7 day duration', 'Match_invitation', 19, '2020-10-08 21:38:39');
INSERT INTO `tb_notification` VALUES (182, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 7 day duration', 'Match_invitation', 19, '2020-10-08 21:38:39');
INSERT INTO `tb_notification` VALUES (183, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 19, '2020-10-08 21:44:09');
INSERT INTO `tb_notification` VALUES (184, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 19, '2020-10-08 21:44:09');
INSERT INTO `tb_notification` VALUES (185, 1, 3, 'Your Invitation is accepted by jitheesh', 'match_reply', 18, '2020-10-08 21:44:15');
INSERT INTO `tb_notification` VALUES (186, 3, 1, 'You have accepted Invitation from Akshay', 'match_reply', 18, '2020-10-08 21:44:15');
INSERT INTO `tb_notification` VALUES (187, 1, 6, 'Akshay Invited you from undefined list to have a Match of 7 day duration', 'Match_invitation', 20, '2020-10-08 22:52:27');
INSERT INTO `tb_notification` VALUES (188, 6, 1, 'You have Invited Test 2 from undefined list to have a Match of 7 day duration', 'Match_invitation', 20, '2020-10-08 22:52:27');
INSERT INTO `tb_notification` VALUES (189, 1, 10, 'Akshay Invited you from undefined list to have a Match of 5 day duration', 'Match_invitation', 21, '2020-10-12 08:31:01');
INSERT INTO `tb_notification` VALUES (190, 10, 1, 'You have Invited Nizam from undefined list to have a Match of 5 day duration', 'Match_invitation', 21, '2020-10-12 08:31:01');
INSERT INTO `tb_notification` VALUES (191, 1, 7, 'Akshay Invited you from undefined list to have a Match of 4 day duration', 'Match_invitation', 22, '2020-10-12 20:02:48');
INSERT INTO `tb_notification` VALUES (192, 7, 1, 'You have Invited Sam from undefined list to have a Match of 4 day duration', 'Match_invitation', 22, '2020-10-12 20:02:48');
INSERT INTO `tb_notification` VALUES (193, 7, 19, 'Sam Invited you from undefined list to have a Match of 19 hour duration', 'Match_invitation', 23, '2020-10-13 23:18:32');
INSERT INTO `tb_notification` VALUES (194, 19, 7, 'You have Invited Binoy from undefined list to have a Match of 19 hour duration', 'Match_invitation', 23, '2020-10-13 23:18:32');
INSERT INTO `tb_notification` VALUES (195, 7, 8, 'Sam Invited you from undefined list to have a Match of 21 hour duration', 'Match_invitation', 24, '2020-10-13 23:19:30');
INSERT INTO `tb_notification` VALUES (196, 8, 7, 'You have Invited Neethu from undefined list to have a Match of 21 hour duration', 'Match_invitation', 24, '2020-10-13 23:19:30');
INSERT INTO `tb_notification` VALUES (197, 1, 7, 'Akshay added you as bestie', 'Add_Bestie', 32, '2020-10-13 23:22:07');
INSERT INTO `tb_notification` VALUES (198, 7, 1, 'You have added Sam to your bestie list', 'Add_Bestie', 32, '2020-10-13 23:22:07');
INSERT INTO `tb_notification` VALUES (199, 7, 1, 'Sam Invited you from undefined list to have a Match of 3 hour duration', 'Match_invitation', 25, '2020-10-14 00:12:54');
INSERT INTO `tb_notification` VALUES (200, 1, 7, 'You have Invited Akshay from undefined list to have a Match of 3 hour duration', 'Match_invitation', 25, '2020-10-14 00:12:54');
INSERT INTO `tb_notification` VALUES (201, 1, 26, 'Akshay Invited you from undefined list to have a Match of 5 hour duration', 'Match_invitation', 26, '2020-10-14 04:23:01');
INSERT INTO `tb_notification` VALUES (202, 1, 26, 'Akshay Invited you from undefined list to have a Match of 5 hour duration', 'Match_invitation', 27, '2020-10-14 04:23:01');
INSERT INTO `tb_notification` VALUES (203, 26, 1, 'You have Invited Kavitha from undefined list to have a Match of 5 hour duration', 'Match_invitation', 26, '2020-10-14 04:23:01');
INSERT INTO `tb_notification` VALUES (204, 26, 1, 'You have Invited Kavitha from undefined list to have a Match of 5 hour duration', 'Match_invitation', 27, '2020-10-14 04:23:01');
INSERT INTO `tb_notification` VALUES (205, 1, 3, 'Akshay added you as fans', 'Add_Bestie', 33, '2020-10-14 04:55:55');
INSERT INTO `tb_notification` VALUES (206, 3, 1, 'You have added jitheesh to your fans list', 'Add_Bestie', 33, '2020-10-14 04:55:55');
INSERT INTO `tb_notification` VALUES (207, 1, 3, 'Akshay added you as fan', 'Add_Bestie', 34, '2020-10-14 04:56:27');
INSERT INTO `tb_notification` VALUES (208, 3, 1, 'You have added jitheesh to your fan list', 'Add_Bestie', 34, '2020-10-14 04:56:27');
INSERT INTO `tb_notification` VALUES (209, 1, 3, 'Akshay added you as fan_of', 'Add_Bestie', 35, '2020-10-14 04:56:36');
INSERT INTO `tb_notification` VALUES (210, 3, 1, 'You have added jitheesh to your fan_of list', 'Add_Bestie', 35, '2020-10-14 04:56:36');
INSERT INTO `tb_notification` VALUES (211, 1, 9, 'Akshay Invited you from undefined list to have a Match of 7 day duration', 'Match_invitation', 28, '2020-10-14 22:37:24');
INSERT INTO `tb_notification` VALUES (212, 9, 1, 'You have Invited Aoc from undefined list to have a Match of 7 day duration', 'Match_invitation', 28, '2020-10-14 22:37:24');
INSERT INTO `tb_notification` VALUES (213, 1, 21, 'Akshay Invited you from undefined list to have a Match of 7 day duration', 'Match_invitation', 29, '2020-10-14 22:38:26');
INSERT INTO `tb_notification` VALUES (214, 21, 1, 'You have Invited Lisa from undefined list to have a Match of 7 day duration', 'Match_invitation', 29, '2020-10-14 22:38:26');
INSERT INTO `tb_notification` VALUES (215, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 30, '2020-10-14 23:13:58');
INSERT INTO `tb_notification` VALUES (216, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 31, '2020-10-14 23:13:58');
INSERT INTO `tb_notification` VALUES (217, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 30, '2020-10-14 23:13:58');
INSERT INTO `tb_notification` VALUES (218, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 31, '2020-10-14 23:13:58');
INSERT INTO `tb_notification` VALUES (219, 1, 6, 'Your Invitation is accepted by Test 2', 'match_reply', 20, '2020-10-14 23:23:00');
INSERT INTO `tb_notification` VALUES (220, 6, 1, 'You have accepted Invitation from Akshay', 'match_reply', 20, '2020-10-14 23:23:00');
INSERT INTO `tb_notification` VALUES (221, 1, 10, 'Your Invitation is accepted by Nizam', 'match_reply', 21, '2020-10-14 23:23:06');
INSERT INTO `tb_notification` VALUES (222, 10, 1, 'You have accepted Invitation from Akshay', 'match_reply', 21, '2020-10-14 23:23:06');
INSERT INTO `tb_notification` VALUES (223, 1, 7, 'Your Invitation is accepted by Sam', 'match_reply', 22, '2020-10-14 23:23:10');
INSERT INTO `tb_notification` VALUES (224, 7, 1, 'You have accepted Invitation from Akshay', 'match_reply', 22, '2020-10-14 23:23:10');
INSERT INTO `tb_notification` VALUES (225, 7, 19, 'Your Invitation is accepted by Binoy', 'match_reply', 23, '2020-10-14 23:23:13');
INSERT INTO `tb_notification` VALUES (226, 19, 7, 'You have accepted Invitation from Sam', 'match_reply', 23, '2020-10-14 23:23:13');
INSERT INTO `tb_notification` VALUES (227, 7, 8, 'Your Invitation is accepted by Neethu', 'match_reply', 24, '2020-10-14 23:23:31');
INSERT INTO `tb_notification` VALUES (228, 8, 7, 'You have accepted Invitation from Sam', 'match_reply', 24, '2020-10-14 23:23:31');
INSERT INTO `tb_notification` VALUES (229, 7, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 25, '2020-10-14 23:23:34');
INSERT INTO `tb_notification` VALUES (230, 1, 7, 'You have accepted Invitation from Sam', 'match_reply', 25, '2020-10-14 23:23:34');
INSERT INTO `tb_notification` VALUES (231, 1, 26, 'Your Invitation is accepted by Kavitha', 'match_reply', 26, '2020-10-14 23:23:39');
INSERT INTO `tb_notification` VALUES (232, 26, 1, 'You have accepted Invitation from Akshay', 'match_reply', 26, '2020-10-14 23:23:39');
INSERT INTO `tb_notification` VALUES (233, 1, 26, 'Your Invitation is accepted by Kavitha', 'match_reply', 27, '2020-10-14 23:23:45');
INSERT INTO `tb_notification` VALUES (234, 26, 1, 'You have accepted Invitation from Akshay', 'match_reply', 27, '2020-10-14 23:23:45');
INSERT INTO `tb_notification` VALUES (235, 1, 9, 'Your Invitation is accepted by Aoc', 'match_reply', 28, '2020-10-14 23:24:00');
INSERT INTO `tb_notification` VALUES (236, 9, 1, 'You have accepted Invitation from Akshay', 'match_reply', 28, '2020-10-14 23:24:00');
INSERT INTO `tb_notification` VALUES (237, 1, 21, 'Your Invitation is accepted by Lisa', 'match_reply', 29, '2020-10-14 23:24:05');
INSERT INTO `tb_notification` VALUES (238, 21, 1, 'You have accepted Invitation from Akshay', 'match_reply', 29, '2020-10-14 23:24:05');
INSERT INTO `tb_notification` VALUES (239, 1, 19, 'Your Invitation is accepted by Binoy', 'match_reply', 30, '2020-10-14 23:24:11');
INSERT INTO `tb_notification` VALUES (240, 19, 1, 'You have accepted Invitation from Akshay', 'match_reply', 30, '2020-10-14 23:24:11');
INSERT INTO `tb_notification` VALUES (241, 1, 19, 'Your Invitation is accepted by Binoy', 'match_reply', 31, '2020-10-14 23:24:15');
INSERT INTO `tb_notification` VALUES (242, 19, 1, 'You have accepted Invitation from Akshay', 'match_reply', 31, '2020-10-14 23:24:15');
INSERT INTO `tb_notification` VALUES (243, 1, 28, 'Akshay Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 32, '2020-10-14 23:29:01');
INSERT INTO `tb_notification` VALUES (244, 28, 1, 'You have Invited William from undefined list to have a Match of 2 hour duration', 'Match_invitation', 32, '2020-10-14 23:29:01');
INSERT INTO `tb_notification` VALUES (245, 1, 27, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 33, '2020-10-14 23:29:48');
INSERT INTO `tb_notification` VALUES (246, 27, 1, 'You have Invited Veena from undefined list to have a Match of 1 hour duration', 'Match_invitation', 33, '2020-10-14 23:29:48');
INSERT INTO `tb_notification` VALUES (247, 1, 3, 'Akshay added you as fan_of', 'Add_Fan', 5, '2020-10-15 03:52:44');
INSERT INTO `tb_notification` VALUES (248, 3, 1, 'You have added jitheesh to your fan_of list', 'Add_Fan', 5, '2020-10-15 03:52:44');
INSERT INTO `tb_notification` VALUES (249, 1, 3, 'Akshay added you as fan', 'Add_Fan', 6, '2020-10-15 03:53:10');
INSERT INTO `tb_notification` VALUES (250, 3, 1, 'You have added jitheesh to your fan list', 'Add_Fan', 6, '2020-10-15 03:53:10');
INSERT INTO `tb_notification` VALUES (251, 1, 5, 'Akshay added you as fan_of', 'Add_Fan', 7, '2020-10-15 03:53:44');
INSERT INTO `tb_notification` VALUES (252, 5, 1, 'You have added jitheesh  to your fan_of list', 'Add_Fan', 7, '2020-10-15 03:53:44');
INSERT INTO `tb_notification` VALUES (253, 1, 5, 'Akshay added you as fan', 'Add_Fan', 8, '2020-10-15 03:53:55');
INSERT INTO `tb_notification` VALUES (254, 5, 1, 'You have added jitheesh  to your fan list', 'Add_Fan', 8, '2020-10-15 03:53:55');
INSERT INTO `tb_notification` VALUES (255, 1, 2, 'Akshay added you as fan', 'Add_Fan', 9, '2020-10-15 04:18:50');
INSERT INTO `tb_notification` VALUES (256, 2, 1, 'You have added Ravi to your fan list', 'Add_Fan', 9, '2020-10-15 04:18:50');
INSERT INTO `tb_notification` VALUES (257, 1, 10, 'Akshay added you as fan', 'Add_Fan', 10, '2020-10-15 04:19:00');
INSERT INTO `tb_notification` VALUES (258, 10, 1, 'You have added Nizam to your fan list', 'Add_Fan', 10, '2020-10-15 04:19:00');
INSERT INTO `tb_notification` VALUES (259, 1, 15, 'Akshay added you as fan', 'Add_Fan', 11, '2020-10-15 04:19:05');
INSERT INTO `tb_notification` VALUES (260, 15, 1, 'You have added Ravi to your fan list', 'Add_Fan', 11, '2020-10-15 04:19:05');
INSERT INTO `tb_notification` VALUES (261, 1, 15, 'Akshay added you as fan_of', 'Add_Fan', 12, '2020-10-15 04:19:15');
INSERT INTO `tb_notification` VALUES (262, 15, 1, 'You have added Ravi to your fan_of list', 'Add_Fan', 12, '2020-10-15 04:19:15');
INSERT INTO `tb_notification` VALUES (263, 1, 9, 'Akshay added you as fan_of', 'Add_Fan', 13, '2020-10-15 04:19:37');
INSERT INTO `tb_notification` VALUES (264, 9, 1, 'You have added Aoc to your fan_of list', 'Add_Fan', 13, '2020-10-15 04:19:37');
INSERT INTO `tb_notification` VALUES (265, 1, 14, 'Akshay added you as fan', 'Add_Fan', 14, '2020-10-15 05:04:08');
INSERT INTO `tb_notification` VALUES (266, 14, 1, 'You have added krishnan to your fan list', 'Add_Fan', 14, '2020-10-15 05:04:08');
INSERT INTO `tb_notification` VALUES (267, 1, 6, 'Akshay added you as fan', 'Add_Fan', 15, '2020-10-15 05:17:52');
INSERT INTO `tb_notification` VALUES (268, 6, 1, 'You have added Test 2 to your fan list', 'Add_Fan', 15, '2020-10-15 05:17:52');
INSERT INTO `tb_notification` VALUES (269, 1, 6, 'Akshay added you as fan_of', 'Add_Fan', 16, '2020-10-15 06:45:02');
INSERT INTO `tb_notification` VALUES (270, 6, 1, 'You have added Test 2 to your fan_of list', 'Add_Fan', 16, '2020-10-15 06:45:02');
INSERT INTO `tb_notification` VALUES (271, 1, 28, 'Your Invitation is accepted by William', 'match_reply', 32, '2020-10-19 04:18:53');
INSERT INTO `tb_notification` VALUES (272, 28, 1, 'You have accepted Invitation from Akshay', 'match_reply', 32, '2020-10-19 04:18:53');
INSERT INTO `tb_notification` VALUES (273, 1, 27, 'Your Invitation is accepted by Veena', 'match_reply', 33, '2020-10-19 04:19:22');
INSERT INTO `tb_notification` VALUES (274, 27, 1, 'You have accepted Invitation from Akshay', 'match_reply', 33, '2020-10-19 04:19:22');
INSERT INTO `tb_notification` VALUES (275, 1, 11, 'Akshay Invited you from undefined list to have a Match of 5 hour duration', 'Match_invitation', 34, '2020-10-20 21:15:18');
INSERT INTO `tb_notification` VALUES (276, 11, 1, 'You have Invited kunjan from undefined list to have a Match of 5 hour duration', 'Match_invitation', 34, '2020-10-20 21:15:18');
INSERT INTO `tb_notification` VALUES (277, 1, 12, 'Akshay Invited you from undefined list to have a Match of 6 hour duration', 'Match_invitation', 35, '2020-10-20 21:16:11');
INSERT INTO `tb_notification` VALUES (278, 12, 1, 'You have Invited Kanna from undefined list to have a Match of 6 hour duration', 'Match_invitation', 35, '2020-10-20 21:16:11');
INSERT INTO `tb_notification` VALUES (279, 29, 19, 'Joe Invited you from undefined list to have a Match of 6 hour duration', 'Match_invitation', 36, '2020-10-21 04:10:56');
INSERT INTO `tb_notification` VALUES (280, 19, 29, 'You have Invited Binoy from undefined list to have a Match of 6 hour duration', 'Match_invitation', 36, '2020-10-21 04:10:56');
INSERT INTO `tb_notification` VALUES (281, 29, 8, 'Joe added you as squad', 'Add_Bestie', 36, '2020-10-21 04:11:37');
INSERT INTO `tb_notification` VALUES (282, 8, 29, 'You have added Neethu to your squad list', 'Add_Bestie', 36, '2020-10-21 04:11:37');
INSERT INTO `tb_notification` VALUES (283, 29, 7, 'Joe added you as squad', 'Add_Bestie', 37, '2020-10-21 04:11:40');
INSERT INTO `tb_notification` VALUES (284, 7, 29, 'You have added Sam to your squad list', 'Add_Bestie', 37, '2020-10-21 04:11:40');
INSERT INTO `tb_notification` VALUES (285, 1, 30, 'Akshay Invited you from undefined list to have a Match of 8 hour duration', 'Match_invitation', 37, '2020-10-21 06:46:29');
INSERT INTO `tb_notification` VALUES (286, 30, 1, 'You have Invited Joe from undefined list to have a Match of 8 hour duration', 'Match_invitation', 37, '2020-10-21 06:46:29');
INSERT INTO `tb_notification` VALUES (287, 1, 24, 'Akshay Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 38, '2020-10-21 06:49:13');
INSERT INTO `tb_notification` VALUES (288, 24, 1, 'You have Invited lallu from undefined list to have a Match of 2 hour duration', 'Match_invitation', 38, '2020-10-21 06:49:13');
INSERT INTO `tb_notification` VALUES (289, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 39, '2020-10-21 07:34:08');
INSERT INTO `tb_notification` VALUES (290, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 39, '2020-10-21 07:34:08');
INSERT INTO `tb_notification` VALUES (291, 4, 1, 'jitheesh Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 40, '2020-10-21 07:34:15');
INSERT INTO `tb_notification` VALUES (292, 1, 4, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 40, '2020-10-21 07:34:15');
INSERT INTO `tb_notification` VALUES (293, 6, 1, 'Test 2 Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 41, '2020-10-21 07:34:27');
INSERT INTO `tb_notification` VALUES (294, 1, 6, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 41, '2020-10-21 07:34:27');
INSERT INTO `tb_notification` VALUES (295, 7, 1, 'Sam Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 42, '2020-10-21 07:42:30');
INSERT INTO `tb_notification` VALUES (296, 1, 7, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 42, '2020-10-21 07:42:30');
INSERT INTO `tb_notification` VALUES (297, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 8, '2020-10-21 07:43:12');
INSERT INTO `tb_notification` VALUES (298, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 8, '2020-10-21 07:43:12');
INSERT INTO `tb_notification` VALUES (299, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 9, '2020-10-21 07:43:17');
INSERT INTO `tb_notification` VALUES (300, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 9, '2020-10-21 07:43:17');
INSERT INTO `tb_notification` VALUES (301, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 10, '2020-10-21 07:43:32');
INSERT INTO `tb_notification` VALUES (302, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 10, '2020-10-21 07:43:32');
INSERT INTO `tb_notification` VALUES (303, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 40, '2020-10-21 07:43:36');
INSERT INTO `tb_notification` VALUES (304, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 40, '2020-10-21 07:43:36');
INSERT INTO `tb_notification` VALUES (305, 1, 29, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 43, '2020-10-21 08:00:18');
INSERT INTO `tb_notification` VALUES (306, 29, 1, 'You have Invited Joe from undefined list to have a Match of 1 hour duration', 'Match_invitation', 43, '2020-10-21 08:00:18');
INSERT INTO `tb_notification` VALUES (307, 31, 1, 'Koyal added you as bestie', 'Add_Bestie', 38, '2020-10-21 08:40:56');
INSERT INTO `tb_notification` VALUES (308, 1, 31, 'You have added Akshay to your bestie list', 'Add_Bestie', 38, '2020-10-21 08:40:56');
INSERT INTO `tb_notification` VALUES (309, 31, 31, 'Koyal Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 44, '2020-10-21 08:47:02');
INSERT INTO `tb_notification` VALUES (310, 31, 31, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 44, '2020-10-21 08:47:02');
INSERT INTO `tb_notification` VALUES (311, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 45, '2020-10-22 21:39:40');
INSERT INTO `tb_notification` VALUES (312, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 45, '2020-10-22 21:39:40');
INSERT INTO `tb_notification` VALUES (313, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 46, '2020-10-22 21:39:40');
INSERT INTO `tb_notification` VALUES (314, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 46, '2020-10-22 21:39:40');
INSERT INTO `tb_notification` VALUES (315, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 47, '2020-10-23 00:36:09');
INSERT INTO `tb_notification` VALUES (316, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 47, '2020-10-23 00:36:09');
INSERT INTO `tb_notification` VALUES (317, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 48, '2020-10-23 00:36:10');
INSERT INTO `tb_notification` VALUES (318, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 48, '2020-10-23 00:36:10');
INSERT INTO `tb_notification` VALUES (319, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 49, '2020-10-23 00:36:46');
INSERT INTO `tb_notification` VALUES (320, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 49, '2020-10-23 00:36:46');
INSERT INTO `tb_notification` VALUES (321, 1, 31, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 50, '2020-10-23 00:36:46');
INSERT INTO `tb_notification` VALUES (322, 31, 1, 'You have Invited Koyal from undefined list to have a Match of 1 hour duration', 'Match_invitation', 50, '2020-10-23 00:36:46');
INSERT INTO `tb_notification` VALUES (323, 1, 11, 'Your Invitation is accepted by kunjan', 'match_reply', 34, '2020-10-23 06:06:45');
INSERT INTO `tb_notification` VALUES (324, 11, 1, 'You have accepted Invitation from Akshay', 'match_reply', 34, '2020-10-23 06:06:45');
INSERT INTO `tb_notification` VALUES (325, 1, 12, 'Your Invitation is accepted by Kanna', 'match_reply', 35, '2020-10-23 06:06:51');
INSERT INTO `tb_notification` VALUES (326, 12, 1, 'You have accepted Invitation from Akshay', 'match_reply', 35, '2020-10-23 06:06:51');
INSERT INTO `tb_notification` VALUES (327, 29, 19, 'Your Invitation is accepted by Binoy', 'match_reply', 36, '2020-10-23 06:06:55');
INSERT INTO `tb_notification` VALUES (328, 19, 29, 'You have accepted Invitation from Joe', 'match_reply', 36, '2020-10-23 06:06:55');
INSERT INTO `tb_notification` VALUES (329, 1, 30, 'Your Invitation is accepted by Joe', 'match_reply', 37, '2020-10-23 06:07:00');
INSERT INTO `tb_notification` VALUES (330, 30, 1, 'You have accepted Invitation from Akshay', 'match_reply', 37, '2020-10-23 06:07:00');
INSERT INTO `tb_notification` VALUES (331, 1, 24, 'Your Invitation is accepted by lallu', 'match_reply', 38, '2020-10-23 06:07:04');
INSERT INTO `tb_notification` VALUES (332, 24, 1, 'You have accepted Invitation from Akshay', 'match_reply', 38, '2020-10-23 06:07:04');
INSERT INTO `tb_notification` VALUES (333, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 39, '2020-10-23 06:07:08');
INSERT INTO `tb_notification` VALUES (334, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 39, '2020-10-23 06:07:08');
INSERT INTO `tb_notification` VALUES (335, 6, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 41, '2020-10-23 06:07:23');
INSERT INTO `tb_notification` VALUES (336, 1, 6, 'You have accepted Invitation from Test 2', 'match_reply', 41, '2020-10-23 06:07:23');
INSERT INTO `tb_notification` VALUES (337, 7, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 42, '2020-10-23 06:07:28');
INSERT INTO `tb_notification` VALUES (338, 1, 7, 'You have accepted Invitation from Sam', 'match_reply', 42, '2020-10-23 06:07:28');
INSERT INTO `tb_notification` VALUES (339, 1, 29, 'Your Invitation is accepted by Joe', 'match_reply', 43, '2020-10-23 06:07:32');
INSERT INTO `tb_notification` VALUES (340, 29, 1, 'You have accepted Invitation from Akshay', 'match_reply', 43, '2020-10-23 06:07:32');
INSERT INTO `tb_notification` VALUES (341, 31, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 44, '2020-10-23 06:07:36');
INSERT INTO `tb_notification` VALUES (342, 31, 31, 'You have accepted Invitation from Koyal', 'match_reply', 44, '2020-10-23 06:07:36');
INSERT INTO `tb_notification` VALUES (343, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 45, '2020-10-23 06:07:40');
INSERT INTO `tb_notification` VALUES (344, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 45, '2020-10-23 06:07:40');
INSERT INTO `tb_notification` VALUES (345, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 46, '2020-10-23 06:07:54');
INSERT INTO `tb_notification` VALUES (346, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 46, '2020-10-23 06:07:54');
INSERT INTO `tb_notification` VALUES (347, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 47, '2020-10-23 06:07:59');
INSERT INTO `tb_notification` VALUES (348, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 47, '2020-10-23 06:07:59');
INSERT INTO `tb_notification` VALUES (349, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 48, '2020-10-23 06:08:04');
INSERT INTO `tb_notification` VALUES (350, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 48, '2020-10-23 06:08:04');
INSERT INTO `tb_notification` VALUES (351, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 49, '2020-10-23 06:08:08');
INSERT INTO `tb_notification` VALUES (352, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 49, '2020-10-23 06:08:08');
INSERT INTO `tb_notification` VALUES (353, 1, 31, 'Your Invitation is accepted by Koyal', 'match_reply', 50, '2020-10-23 06:08:18');
INSERT INTO `tb_notification` VALUES (354, 31, 1, 'You have accepted Invitation from Akshay', 'match_reply', 50, '2020-10-23 06:08:18');
INSERT INTO `tb_notification` VALUES (355, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 day duration', 'Match_invitation', 51, '2020-10-24 06:40:34');
INSERT INTO `tb_notification` VALUES (356, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 day duration', 'Match_invitation', 52, '2020-10-24 06:40:34');
INSERT INTO `tb_notification` VALUES (357, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 day duration', 'Match_invitation', 51, '2020-10-24 06:40:34');
INSERT INTO `tb_notification` VALUES (358, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 day duration', 'Match_invitation', 52, '2020-10-24 06:40:34');
INSERT INTO `tb_notification` VALUES (359, 1, 11, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 53, '2020-10-24 06:41:03');
INSERT INTO `tb_notification` VALUES (360, 11, 1, 'You have Invited kunjan from undefined list to have a Match of 1 hour duration', 'Match_invitation', 53, '2020-10-24 06:41:03');
INSERT INTO `tb_notification` VALUES (361, 1, 11, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 54, '2020-10-24 06:41:03');
INSERT INTO `tb_notification` VALUES (362, 11, 1, 'You have Invited kunjan from undefined list to have a Match of 1 hour duration', 'Match_invitation', 54, '2020-10-24 06:41:03');
INSERT INTO `tb_notification` VALUES (363, 1, 7, 'Akshay added you as fan', 'Add_Fan', 17, '2020-10-24 06:41:40');
INSERT INTO `tb_notification` VALUES (364, 7, 1, 'You have added Sam to your fan list', 'Add_Fan', 17, '2020-10-24 06:41:40');
INSERT INTO `tb_notification` VALUES (365, 1, 31, 'Akshay added you as fan_of', 'Add_Fan', 18, '2020-10-24 06:43:33');
INSERT INTO `tb_notification` VALUES (366, 31, 1, 'You have added Koyal to your fan_of list', 'Add_Fan', 18, '2020-10-24 06:43:33');
INSERT INTO `tb_notification` VALUES (367, 1, 14, 'Akshay added you as bestie', 'Add_Bestie', 39, '2020-10-24 06:47:12');
INSERT INTO `tb_notification` VALUES (368, 14, 1, 'You have added krishnan to your bestie list', 'Add_Bestie', 39, '2020-10-24 06:47:12');
INSERT INTO `tb_notification` VALUES (369, 1, 23, 'Akshay added you as squad', 'Add_Bestie', 40, '2020-10-24 06:48:05');
INSERT INTO `tb_notification` VALUES (370, 23, 1, 'You have added Kiran to your squad list', 'Add_Bestie', 40, '2020-10-24 06:48:05');
INSERT INTO `tb_notification` VALUES (371, 33, 5, 'Krishnanunni added you as bestie', 'Add_Bestie', 41, '2020-10-24 06:59:15');
INSERT INTO `tb_notification` VALUES (372, 5, 33, 'You have added jitheesh  to your bestie list', 'Add_Bestie', 41, '2020-10-24 06:59:15');
INSERT INTO `tb_notification` VALUES (373, 33, 3, 'Krishnanunni added you as fan', 'Add_Fan', 19, '2020-10-26 20:48:16');
INSERT INTO `tb_notification` VALUES (374, 3, 33, 'You have added jitheesh to your fan list', 'Add_Fan', 19, '2020-10-26 20:48:16');
INSERT INTO `tb_notification` VALUES (375, 33, 6, 'Krishnanunni added you as fan_of', 'Add_Fan', 20, '2020-10-26 20:53:14');
INSERT INTO `tb_notification` VALUES (376, 6, 33, 'You have added Test 2 to your fan_of list', 'Add_Fan', 20, '2020-10-26 20:53:14');
INSERT INTO `tb_notification` VALUES (377, 33, 3, 'Krishnanunni added you as fan', 'Add_Fan', 21, '2020-10-26 21:58:50');
INSERT INTO `tb_notification` VALUES (378, 3, 33, 'You have added jitheesh to your fan list', 'Add_Fan', 21, '2020-10-26 21:58:50');
INSERT INTO `tb_notification` VALUES (379, 33, 5, 'Krishnanunni added you as fan', 'Add_Fan', 22, '2020-10-26 21:59:59');
INSERT INTO `tb_notification` VALUES (380, 5, 33, 'You have added jitheesh  to your fan list', 'Add_Fan', 22, '2020-10-26 21:59:59');
INSERT INTO `tb_notification` VALUES (381, 33, 4, 'Krishnanunni added you as fan', 'Add_Fan', 23, '2020-10-26 22:00:03');
INSERT INTO `tb_notification` VALUES (382, 4, 33, 'You have added jitheesh to your fan list', 'Add_Fan', 23, '2020-10-26 22:00:03');
INSERT INTO `tb_notification` VALUES (383, 33, 3, 'Krishnanunni added you as fan', 'Add_Fan', 24, '2020-10-26 22:00:10');
INSERT INTO `tb_notification` VALUES (384, 3, 33, 'You have added jitheesh to your fan list', 'Add_Fan', 24, '2020-10-26 22:00:10');
INSERT INTO `tb_notification` VALUES (385, 33, 7, 'Krishnanunni added you as fan', 'Add_Fan', 25, '2020-10-26 22:10:40');
INSERT INTO `tb_notification` VALUES (386, 7, 33, 'You have added Sam to your fan list', 'Add_Fan', 25, '2020-10-26 22:10:40');
INSERT INTO `tb_notification` VALUES (387, 33, 10, 'Krishnanunni added you as fan', 'Add_Fan', 26, '2020-10-26 22:10:44');
INSERT INTO `tb_notification` VALUES (388, 10, 33, 'You have added Nizam to your fan list', 'Add_Fan', 26, '2020-10-26 22:10:44');
INSERT INTO `tb_notification` VALUES (389, 33, 14, 'Krishnanunni added you as fan', 'Add_Fan', 27, '2020-10-26 22:10:46');
INSERT INTO `tb_notification` VALUES (390, 14, 33, 'You have added krishnan to your fan list', 'Add_Fan', 27, '2020-10-26 22:10:46');
INSERT INTO `tb_notification` VALUES (391, 33, 5, 'Krishnanunni added you as fan_of', 'Add_Fan', 28, '2020-10-26 22:11:11');
INSERT INTO `tb_notification` VALUES (392, 5, 33, 'You have added jitheesh  to your fan_of list', 'Add_Fan', 28, '2020-10-26 22:11:11');
INSERT INTO `tb_notification` VALUES (393, 33, 2, 'Krishnanunni added you as fan_of', 'Add_Fan', 29, '2020-10-26 22:11:15');
INSERT INTO `tb_notification` VALUES (394, 2, 33, 'You have added Ravi to your fan_of list', 'Add_Fan', 29, '2020-10-26 22:11:15');
INSERT INTO `tb_notification` VALUES (395, 33, 8, 'Krishnanunni added you as fan_of', 'Add_Fan', 30, '2020-10-26 22:11:20');
INSERT INTO `tb_notification` VALUES (396, 8, 33, 'You have added Neethu to your fan_of list', 'Add_Fan', 30, '2020-10-26 22:11:20');
INSERT INTO `tb_notification` VALUES (397, 33, 5, 'Krishnanunni added you as squad', 'Add_Bestie', 42, '2020-10-26 22:12:18');
INSERT INTO `tb_notification` VALUES (398, 5, 33, 'You have added jitheesh  to your squad list', 'Add_Bestie', 42, '2020-10-26 22:12:18');
INSERT INTO `tb_notification` VALUES (399, 33, 7, 'Krishnanunni added you as squad', 'Add_Bestie', 43, '2020-10-26 22:14:36');
INSERT INTO `tb_notification` VALUES (400, 7, 33, 'You have added Sam to your squad list', 'Add_Bestie', 43, '2020-10-26 22:14:36');
INSERT INTO `tb_notification` VALUES (401, 33, 11, 'Krishnanunni added you as squad', 'Add_Bestie', 44, '2020-10-26 22:16:42');
INSERT INTO `tb_notification` VALUES (402, 11, 33, 'You have added kunjan to your squad list', 'Add_Bestie', 44, '2020-10-26 22:16:42');
INSERT INTO `tb_notification` VALUES (403, 7, 2, 'Sam added you as bestie', 'Add_Bestie', 45, '2020-10-29 22:41:35');
INSERT INTO `tb_notification` VALUES (404, 2, 7, 'You have added Ravi to your bestie list', 'Add_Bestie', 45, '2020-10-29 22:41:36');
INSERT INTO `tb_notification` VALUES (405, 2, 5, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 55, '2020-11-02 22:03:02');
INSERT INTO `tb_notification` VALUES (406, 5, 2, 'You have Invited jitheesh  from bestie list to have a Match of 1 hour duration', 'Match_invitation', 55, '2020-11-02 22:03:02');
INSERT INTO `tb_notification` VALUES (407, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 51, '2020-11-02 22:03:45');
INSERT INTO `tb_notification` VALUES (408, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 51, '2020-11-02 22:03:46');
INSERT INTO `tb_notification` VALUES (409, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 52, '2020-11-02 22:03:50');
INSERT INTO `tb_notification` VALUES (410, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 52, '2020-11-02 22:03:51');
INSERT INTO `tb_notification` VALUES (411, 2, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 55, '2020-11-02 22:03:56');
INSERT INTO `tb_notification` VALUES (412, 5, 2, 'You have accepted Invitation from Ravi', 'match_reply', 55, '2020-11-02 22:03:56');
INSERT INTO `tb_notification` VALUES (413, 2, 5, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 56, '2020-11-03 00:26:44');
INSERT INTO `tb_notification` VALUES (414, 5, 2, 'You have Invited jitheesh  from bestie list to have a Match of 1 hour duration', 'Match_invitation', 56, '2020-11-03 00:26:44');
INSERT INTO `tb_notification` VALUES (415, 2, 5, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 57, '2020-11-03 00:26:55');
INSERT INTO `tb_notification` VALUES (416, 5, 2, 'You have Invited jitheesh  from bestie list to have a Match of 1 hour duration', 'Match_invitation', 57, '2020-11-03 00:26:55');
INSERT INTO `tb_notification` VALUES (417, 2, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 57, '2020-11-03 00:30:38');
INSERT INTO `tb_notification` VALUES (418, 5, 2, 'You have accepted Invitation from Ravi', 'match_reply', 57, '2020-11-03 00:30:38');
INSERT INTO `tb_notification` VALUES (419, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 58, '2020-11-03 00:31:23');
INSERT INTO `tb_notification` VALUES (420, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 58, '2020-11-03 00:31:23');
INSERT INTO `tb_notification` VALUES (421, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 59, '2020-11-03 04:16:38');
INSERT INTO `tb_notification` VALUES (422, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 hour duration', 'Match_invitation', 59, '2020-11-03 04:16:38');
INSERT INTO `tb_notification` VALUES (423, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 58, '2020-11-03 04:18:23');
INSERT INTO `tb_notification` VALUES (424, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 58, '2020-11-03 04:18:23');
INSERT INTO `tb_notification` VALUES (425, 5, 1, 'jitheesh  Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 60, '2020-11-03 04:18:46');
INSERT INTO `tb_notification` VALUES (426, 1, 5, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 60, '2020-11-03 04:18:46');
INSERT INTO `tb_notification` VALUES (427, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 60, '2020-11-03 04:19:00');
INSERT INTO `tb_notification` VALUES (428, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 60, '2020-11-03 04:19:00');
INSERT INTO `tb_notification` VALUES (429, 1, 7, 'Akshay Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 61, '2020-11-03 20:46:28');
INSERT INTO `tb_notification` VALUES (430, 7, 1, 'You have Invited Sam from bestie list to have a Match of 1 hour duration', 'Match_invitation', 61, '2020-11-03 20:46:28');
INSERT INTO `tb_notification` VALUES (431, 1, 7, 'Akshay Invited you from bestie list to have a Match of 1 hour duration', 'Match_invitation', 62, '2020-11-03 20:46:28');
INSERT INTO `tb_notification` VALUES (432, 7, 1, 'You have Invited Sam from bestie list to have a Match of 1 hour duration', 'Match_invitation', 62, '2020-11-03 20:46:28');
INSERT INTO `tb_notification` VALUES (433, 1, 2, 'Akshay added you as fan_of', 'Add_Fan', 31, '2020-11-06 03:21:48');
INSERT INTO `tb_notification` VALUES (434, 2, 1, 'You have added Ravi to your fan_of list', 'Add_Fan', 31, '2020-11-06 03:21:48');
INSERT INTO `tb_notification` VALUES (435, 1, 7, 'Akshay added you as fan', 'Add_Fan', 32, '2020-11-10 05:16:46');
INSERT INTO `tb_notification` VALUES (436, 7, 1, 'You have added Sam to your fan list', 'Add_Fan', 32, '2020-11-10 05:16:46');
INSERT INTO `tb_notification` VALUES (437, 1, 34, 'Akshay added you as fan', 'Add_Fan', 33, '2020-11-10 05:18:12');
INSERT INTO `tb_notification` VALUES (438, 34, 1, 'You have added Christiana Mariya to your fan list', 'Add_Fan', 33, '2020-11-10 05:18:12');
INSERT INTO `tb_notification` VALUES (439, 1, 3, 'Akshay added you as fan', 'Add_Fan', 34, '2020-11-12 07:21:02');
INSERT INTO `tb_notification` VALUES (440, 3, 1, 'You have added jitheesh to your fan list', 'Add_Fan', 34, '2020-11-12 07:21:02');
INSERT INTO `tb_notification` VALUES (441, 1, 6, 'Akshay added you as fan', 'Add_Fan', 35, '2020-11-12 07:21:07');
INSERT INTO `tb_notification` VALUES (442, 6, 1, 'You have added Test 2 to your fan list', 'Add_Fan', 35, '2020-11-12 07:21:07');
INSERT INTO `tb_notification` VALUES (443, 1, 9, 'Akshay added you as fan', 'Add_Fan', 36, '2020-11-12 07:21:12');
INSERT INTO `tb_notification` VALUES (444, 9, 1, 'You have added Aoc to your fan list', 'Add_Fan', 36, '2020-11-12 07:21:12');
INSERT INTO `tb_notification` VALUES (445, 1, 8, 'Akshay added you as fan', 'Add_Fan', 37, '2020-11-12 07:21:14');
INSERT INTO `tb_notification` VALUES (446, 8, 1, 'You have added Neethu to your fan list', 'Add_Fan', 37, '2020-11-12 07:21:14');
INSERT INTO `tb_notification` VALUES (447, 1, 11, 'Akshay added you as fan', 'Add_Fan', 38, '2020-11-12 07:21:18');
INSERT INTO `tb_notification` VALUES (448, 11, 1, 'You have added kunjan to your fan list', 'Add_Fan', 38, '2020-11-12 07:21:18');
INSERT INTO `tb_notification` VALUES (449, 1, 3, 'Akshay added you as fan_of', 'Add_Fan', 39, '2020-11-12 07:29:44');
INSERT INTO `tb_notification` VALUES (450, 3, 1, 'You have added jitheesh to your fan_of list', 'Add_Fan', 39, '2020-11-12 07:29:44');
INSERT INTO `tb_notification` VALUES (451, 1, 7, 'Akshay added you as fan_of', 'Add_Fan', 40, '2020-11-12 07:29:53');
INSERT INTO `tb_notification` VALUES (452, 7, 1, 'You have added Sam to your fan_of list', 'Add_Fan', 40, '2020-11-12 07:29:53');
INSERT INTO `tb_notification` VALUES (453, 1, 10, 'Akshay added you as fan_of', 'Add_Fan', 41, '2020-11-12 07:29:56');
INSERT INTO `tb_notification` VALUES (454, 10, 1, 'You have added Nizam to your fan_of list', 'Add_Fan', 41, '2020-11-12 07:29:56');
INSERT INTO `tb_notification` VALUES (455, 1, 24, 'Akshay added you as fan_of', 'Add_Fan', 42, '2020-11-12 07:30:00');
INSERT INTO `tb_notification` VALUES (456, 24, 1, 'You have added lallu to your fan_of list', 'Add_Fan', 42, '2020-11-12 07:30:00');
INSERT INTO `tb_notification` VALUES (457, 2, 5, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 63, '2020-11-23 02:52:30');
INSERT INTO `tb_notification` VALUES (458, 5, 2, 'You have Invited jitheesh  from bestie list to have a Match of 1 day duration', 'Match_invitation', 63, '2020-11-23 02:52:30');
INSERT INTO `tb_notification` VALUES (459, 2, 5, 'Your Invitation is accepted by jitheesh ', 'match_reply', 63, '2020-11-23 02:57:03');
INSERT INTO `tb_notification` VALUES (460, 5, 2, 'You have accepted Invitation from Ravi', 'match_reply', 63, '2020-11-23 02:57:03');
INSERT INTO `tb_notification` VALUES (461, 2, 1, 'Your Match with Akshay is over', 'match_reply', 1, '2020-11-23 03:46:22');
INSERT INTO `tb_notification` VALUES (462, 1, 2, 'Your Match with Ravi is over', 'match_reply', 1, '2020-11-23 03:47:12');
INSERT INTO `tb_notification` VALUES (463, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 64, '2020-11-23 04:12:25');
INSERT INTO `tb_notification` VALUES (464, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 64, '2020-11-23 04:12:25');
INSERT INTO `tb_notification` VALUES (465, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 64, '2020-11-23 04:12:33');
INSERT INTO `tb_notification` VALUES (466, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 64, '2020-11-23 04:12:33');
INSERT INTO `tb_notification` VALUES (467, 2, 5, 'Your Match with jitheesh  is over', 'match_reply', 63, '2020-11-24 02:58:01');
INSERT INTO `tb_notification` VALUES (468, 5, 2, 'Your Match with Ravi is over', 'match_reply', 63, '2020-11-24 02:58:01');
INSERT INTO `tb_notification` VALUES (469, 7, 2, 'Sam added you as squad', 'Add_Bestie', 46, '2020-11-24 02:58:30');
INSERT INTO `tb_notification` VALUES (470, 2, 7, 'You have added Ravi to your squad list', 'Add_Bestie', 46, '2020-11-24 02:58:30');
INSERT INTO `tb_notification` VALUES (471, 7, 43, 'Sam added you as squad', 'Add_Bestie', 47, '2020-11-24 02:58:58');
INSERT INTO `tb_notification` VALUES (472, 43, 7, 'You have added Bino to your squad list', 'Add_Bestie', 47, '2020-11-24 02:58:58');
INSERT INTO `tb_notification` VALUES (473, 7, 16, 'Sam added you as squad', 'Add_Bestie', 48, '2020-11-24 02:59:31');
INSERT INTO `tb_notification` VALUES (474, 16, 7, 'You have added Ram to your squad list', 'Add_Bestie', 48, '2020-11-24 02:59:31');
INSERT INTO `tb_notification` VALUES (475, 7, 42, 'Sam added you as squad', 'Add_Bestie', 49, '2020-11-24 02:59:36');
INSERT INTO `tb_notification` VALUES (476, 42, 7, 'You have added Himanshu to your squad list', 'Add_Bestie', 49, '2020-11-24 02:59:36');
INSERT INTO `tb_notification` VALUES (477, 7, 22, 'Sam added you as squad', 'Add_Bestie', 50, '2020-11-24 02:59:54');
INSERT INTO `tb_notification` VALUES (478, 22, 7, 'You have added Philip to your squad list', 'Add_Bestie', 50, '2020-11-24 02:59:54');
INSERT INTO `tb_notification` VALUES (479, 7, 43, 'Sam added you as fan_of', 'Add_Fan', 43, '2020-11-24 03:00:56');
INSERT INTO `tb_notification` VALUES (480, 43, 7, 'You have added Bino to your fan_of list', 'Add_Fan', 43, '2020-11-24 03:00:56');
INSERT INTO `tb_notification` VALUES (481, 7, 43, 'Sam added you as bestie', 'Add_Bestie', 51, '2020-11-24 03:02:44');
INSERT INTO `tb_notification` VALUES (482, 43, 7, 'You have added Bino to your bestie list', 'Add_Bestie', 51, '2020-11-24 03:02:44');
INSERT INTO `tb_notification` VALUES (483, 7, 43, 'Sam Invited you from undefined list to have a Match of 7 hour duration', 'Match_invitation', 65, '2020-11-24 03:04:39');
INSERT INTO `tb_notification` VALUES (484, 43, 7, 'You have Invited Bino from undefined list to have a Match of 7 hour duration', 'Match_invitation', 65, '2020-11-24 03:04:39');
INSERT INTO `tb_notification` VALUES (485, 7, 43, 'Sam Invited you from undefined list to have a Match of 7 hour duration', 'Match_invitation', 66, '2020-11-24 03:04:40');
INSERT INTO `tb_notification` VALUES (486, 43, 7, 'You have Invited Bino from undefined list to have a Match of 7 hour duration', 'Match_invitation', 66, '2020-11-24 03:04:40');
INSERT INTO `tb_notification` VALUES (487, 2, 1, 'Your Match with Akshay is over', 'match_reply', 64, '2020-11-24 04:13:01');
INSERT INTO `tb_notification` VALUES (488, 1, 2, 'Your Match with Ravi is over', 'match_reply', 64, '2020-11-24 04:13:01');
INSERT INTO `tb_notification` VALUES (489, 1, 8, 'Akshay added you as bestie', 'Add_Bestie', 52, '2020-11-25 05:53:04');
INSERT INTO `tb_notification` VALUES (490, 8, 1, 'You have added Neethu to your bestie list', 'Add_Bestie', 52, '2020-11-25 05:53:04');
INSERT INTO `tb_notification` VALUES (491, 1, 9, 'Akshay added you as bestie', 'Add_Bestie', 53, '2020-11-25 05:55:53');
INSERT INTO `tb_notification` VALUES (492, 9, 1, 'You have added Aoc to your bestie list', 'Add_Bestie', 53, '2020-11-25 05:55:53');
INSERT INTO `tb_notification` VALUES (493, 1, 24, 'Akshay added you as bestie', 'Add_Bestie', 54, '2020-11-25 05:56:58');
INSERT INTO `tb_notification` VALUES (494, 24, 1, 'You have added lallu to your bestie list', 'Add_Bestie', 54, '2020-11-25 05:56:58');
INSERT INTO `tb_notification` VALUES (495, 1, 10, 'Akshay added you as bestie', 'Add_Bestie', 55, '2020-11-25 05:59:43');
INSERT INTO `tb_notification` VALUES (496, 10, 1, 'You have added Nizam to your bestie list', 'Add_Bestie', 55, '2020-11-25 05:59:43');
INSERT INTO `tb_notification` VALUES (497, 1, 12, 'Akshay added you as bestie', 'Add_Bestie', 56, '2020-11-25 06:00:40');
INSERT INTO `tb_notification` VALUES (498, 12, 1, 'You have added Kanna to your bestie list', 'Add_Bestie', 56, '2020-11-25 06:00:40');
INSERT INTO `tb_notification` VALUES (499, 1, 35, 'Akshay added you as bestie', 'Add_Bestie', 57, '2020-11-25 06:10:39');
INSERT INTO `tb_notification` VALUES (500, 35, 1, 'You have added Second to your bestie list', 'Add_Bestie', 57, '2020-11-25 06:10:39');
INSERT INTO `tb_notification` VALUES (501, 1, 4, 'Akshay added you as squad', 'Add_Bestie', 58, '2020-11-25 06:19:01');
INSERT INTO `tb_notification` VALUES (502, 4, 1, 'You have added jitheesh to your squad list', 'Add_Bestie', 58, '2020-11-25 06:19:01');
INSERT INTO `tb_notification` VALUES (503, 1, 10, 'Akshay added you as squad', 'Add_Bestie', 59, '2020-11-25 06:20:46');
INSERT INTO `tb_notification` VALUES (504, 10, 1, 'You have added Nizam to your squad list', 'Add_Bestie', 59, '2020-11-25 06:20:46');
INSERT INTO `tb_notification` VALUES (505, 1, 16, 'Akshay added you as squad', 'Add_Bestie', 60, '2020-11-25 06:22:40');
INSERT INTO `tb_notification` VALUES (506, 16, 1, 'You have added Ram to your squad list', 'Add_Bestie', 60, '2020-11-25 06:22:40');
INSERT INTO `tb_notification` VALUES (507, 1, 7, 'Akshay added you as fan', 'Add_Fan', 44, '2020-11-25 21:06:36');
INSERT INTO `tb_notification` VALUES (508, 7, 1, 'You have added Sam to your fan list', 'Add_Fan', 44, '2020-11-25 21:06:36');
INSERT INTO `tb_notification` VALUES (509, 1, 2, 'Akshay added you as bestie', 'Add_Bestie', 61, '2020-11-26 00:00:25');
INSERT INTO `tb_notification` VALUES (510, 2, 1, 'You have added Ravi to your bestie list', 'Add_Bestie', 61, '2020-11-26 00:00:25');
INSERT INTO `tb_notification` VALUES (511, 1, 5, 'Akshay added you as bestie', 'Add_Bestie', 62, '2020-11-26 01:06:43');
INSERT INTO `tb_notification` VALUES (512, 5, 1, 'You have added jitheesh  to your bestie list', 'Add_Bestie', 62, '2020-11-26 01:06:43');
INSERT INTO `tb_notification` VALUES (513, 1, 2, 'Akshay added you as squad', 'Add_Bestie', 63, '2020-11-26 01:07:24');
INSERT INTO `tb_notification` VALUES (514, 2, 1, 'You have added Ravi to your squad list', 'Add_Bestie', 63, '2020-11-26 01:07:24');
INSERT INTO `tb_notification` VALUES (515, 1, 31, 'Akshay added you as fan', 'Add_Fan', 45, '2020-11-28 00:23:01');
INSERT INTO `tb_notification` VALUES (516, 31, 1, 'You have added Koyal to your fan list', 'Add_Fan', 45, '2020-11-28 00:23:01');
INSERT INTO `tb_notification` VALUES (517, 1, 42, 'Akshay added you as fan', 'Add_Fan', 46, '2020-11-28 00:23:20');
INSERT INTO `tb_notification` VALUES (518, 42, 1, 'You have added Himanshu to your fan list', 'Add_Fan', 46, '2020-11-28 00:23:20');
INSERT INTO `tb_notification` VALUES (519, 1, 37, 'Akshay added you as fan', 'Add_Fan', 47, '2020-11-28 00:23:30');
INSERT INTO `tb_notification` VALUES (520, 37, 1, 'You have added Ashik to your fan list', 'Add_Fan', 47, '2020-11-28 00:23:30');
INSERT INTO `tb_notification` VALUES (521, 1, 12, 'Akshay added you as fan', 'Add_Fan', 48, '2020-11-28 00:23:47');
INSERT INTO `tb_notification` VALUES (522, 12, 1, 'You have added Kanna to your fan list', 'Add_Fan', 48, '2020-11-28 00:23:47');
INSERT INTO `tb_notification` VALUES (523, 1, 26, 'Akshay added you as fan_of', 'Add_Fan', 49, '2020-11-28 00:24:52');
INSERT INTO `tb_notification` VALUES (524, 26, 1, 'You have added Kavitha to your fan_of list', 'Add_Fan', 49, '2020-11-28 00:24:52');
INSERT INTO `tb_notification` VALUES (525, 1, 7, 'Akshay added you as bestie', 'Add_Bestie', 64, '2020-11-28 00:25:23');
INSERT INTO `tb_notification` VALUES (526, 7, 1, 'You have added Sam to your bestie list', 'Add_Bestie', 64, '2020-11-28 00:25:23');
INSERT INTO `tb_notification` VALUES (527, 1, 16, 'Akshay added you as bestie', 'Add_Bestie', 65, '2020-11-28 00:25:38');
INSERT INTO `tb_notification` VALUES (528, 16, 1, 'You have added Ram to your bestie list', 'Add_Bestie', 65, '2020-11-28 00:25:38');
INSERT INTO `tb_notification` VALUES (529, 1, 18, 'Akshay added you as squad', 'Add_Bestie', 66, '2020-11-28 00:27:53');
INSERT INTO `tb_notification` VALUES (530, 18, 1, 'You have added Ram to your squad list', 'Add_Bestie', 66, '2020-11-28 00:27:53');
INSERT INTO `tb_notification` VALUES (531, 1, 5, 'Akshay added you as squad', 'Add_Bestie', 67, '2020-11-28 00:28:01');
INSERT INTO `tb_notification` VALUES (532, 5, 1, 'You have added jitheesh  to your squad list', 'Add_Bestie', 67, '2020-11-28 00:28:01');
INSERT INTO `tb_notification` VALUES (533, 7, 2, 'Sam added you as fan', 'Add_Fan', 50, '2020-12-01 02:51:11');
INSERT INTO `tb_notification` VALUES (534, 2, 7, 'You have added Ravi to your fan list', 'Add_Fan', 50, '2020-12-01 02:51:11');
INSERT INTO `tb_notification` VALUES (535, 7, 1, 'Sam Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 67, '2020-12-07 23:19:42');
INSERT INTO `tb_notification` VALUES (536, 1, 7, 'You have Invited Akshay from undefined list to have a Match of 2 hour duration', 'Match_invitation', 67, '2020-12-07 23:19:42');
INSERT INTO `tb_notification` VALUES (537, 7, 1, 'Sam Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 68, '2020-12-07 23:19:42');
INSERT INTO `tb_notification` VALUES (538, 1, 7, 'You have Invited Akshay from undefined list to have a Match of 2 hour duration', 'Match_invitation', 68, '2020-12-07 23:19:42');
INSERT INTO `tb_notification` VALUES (539, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 69, '2020-12-15 21:10:33');
INSERT INTO `tb_notification` VALUES (540, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 69, '2020-12-15 21:10:33');
INSERT INTO `tb_notification` VALUES (541, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 70, '2020-12-15 21:12:55');
INSERT INTO `tb_notification` VALUES (542, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 70, '2020-12-15 21:12:55');
INSERT INTO `tb_notification` VALUES (543, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 71, '2020-12-17 03:34:49');
INSERT INTO `tb_notification` VALUES (544, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 71, '2020-12-17 03:34:49');
INSERT INTO `tb_notification` VALUES (545, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 72, '2020-12-17 04:23:07');
INSERT INTO `tb_notification` VALUES (546, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 72, '2020-12-17 04:23:07');
INSERT INTO `tb_notification` VALUES (547, 1, 3, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 73, '2020-12-17 05:26:16');
INSERT INTO `tb_notification` VALUES (548, 3, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 73, '2020-12-17 05:26:16');
INSERT INTO `tb_notification` VALUES (549, 1, 3, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 74, '2020-12-17 05:26:16');
INSERT INTO `tb_notification` VALUES (550, 3, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 74, '2020-12-17 05:26:16');
INSERT INTO `tb_notification` VALUES (551, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 75, '2020-12-17 05:43:06');
INSERT INTO `tb_notification` VALUES (552, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 76, '2020-12-17 05:43:06');
INSERT INTO `tb_notification` VALUES (553, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 75, '2020-12-17 05:43:06');
INSERT INTO `tb_notification` VALUES (554, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 76, '2020-12-17 05:43:06');
INSERT INTO `tb_notification` VALUES (555, 1, 4, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 77, '2020-12-17 06:03:00');
INSERT INTO `tb_notification` VALUES (556, 4, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 77, '2020-12-17 06:03:00');
INSERT INTO `tb_notification` VALUES (557, 1, 4, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 78, '2020-12-17 06:03:00');
INSERT INTO `tb_notification` VALUES (558, 4, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 78, '2020-12-17 06:03:00');
INSERT INTO `tb_notification` VALUES (559, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 79, '2020-12-17 06:05:00');
INSERT INTO `tb_notification` VALUES (560, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 79, '2020-12-17 06:05:00');
INSERT INTO `tb_notification` VALUES (561, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 80, '2020-12-17 06:05:00');
INSERT INTO `tb_notification` VALUES (562, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 80, '2020-12-17 06:05:00');
INSERT INTO `tb_notification` VALUES (563, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 81, '2020-12-17 06:11:09');
INSERT INTO `tb_notification` VALUES (564, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 81, '2020-12-17 06:11:09');
INSERT INTO `tb_notification` VALUES (565, 1, 2, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 82, '2020-12-17 06:11:09');
INSERT INTO `tb_notification` VALUES (566, 2, 1, 'You have Invited Ravi from undefined list to have a Match of 1 hour duration', 'Match_invitation', 82, '2020-12-17 06:11:09');
INSERT INTO `tb_notification` VALUES (567, 1, 6, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 83, '2020-12-17 06:17:18');
INSERT INTO `tb_notification` VALUES (568, 6, 1, 'You have Invited Test 2 from undefined list to have a Match of 1 hour duration', 'Match_invitation', 83, '2020-12-17 06:17:18');
INSERT INTO `tb_notification` VALUES (569, 1, 6, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 84, '2020-12-17 06:17:18');
INSERT INTO `tb_notification` VALUES (570, 6, 1, 'You have Invited Test 2 from undefined list to have a Match of 1 hour duration', 'Match_invitation', 84, '2020-12-17 06:17:18');
INSERT INTO `tb_notification` VALUES (571, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 85, '2020-12-17 06:21:25');
INSERT INTO `tb_notification` VALUES (572, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 86, '2020-12-17 06:21:25');
INSERT INTO `tb_notification` VALUES (573, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 85, '2020-12-17 06:21:25');
INSERT INTO `tb_notification` VALUES (574, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 86, '2020-12-17 06:21:25');
INSERT INTO `tb_notification` VALUES (575, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 87, '2020-12-17 06:26:39');
INSERT INTO `tb_notification` VALUES (576, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 88, '2020-12-17 06:26:39');
INSERT INTO `tb_notification` VALUES (577, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 88, '2020-12-17 06:26:39');
INSERT INTO `tb_notification` VALUES (578, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 87, '2020-12-17 06:26:39');
INSERT INTO `tb_notification` VALUES (579, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 89, '2020-12-17 06:28:51');
INSERT INTO `tb_notification` VALUES (580, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 89, '2020-12-17 06:28:51');
INSERT INTO `tb_notification` VALUES (581, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 90, '2020-12-17 06:29:35');
INSERT INTO `tb_notification` VALUES (582, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 90, '2020-12-17 06:29:35');
INSERT INTO `tb_notification` VALUES (583, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 91, '2020-12-17 06:29:53');
INSERT INTO `tb_notification` VALUES (584, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 91, '2020-12-17 06:29:53');
INSERT INTO `tb_notification` VALUES (585, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 90, '2020-12-17 06:33:04');
INSERT INTO `tb_notification` VALUES (586, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 90, '2020-12-17 06:33:04');
INSERT INTO `tb_notification` VALUES (587, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 89, '2020-12-17 06:35:34');
INSERT INTO `tb_notification` VALUES (588, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 89, '2020-12-17 06:35:34');
INSERT INTO `tb_notification` VALUES (589, 1, 20, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 92, '2020-12-17 06:37:14');
INSERT INTO `tb_notification` VALUES (590, 20, 1, 'You have Invited raveena from undefined list to have a Match of 1 hour duration', 'Match_invitation', 92, '2020-12-17 06:37:14');
INSERT INTO `tb_notification` VALUES (591, 1, 20, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 93, '2020-12-17 06:37:14');
INSERT INTO `tb_notification` VALUES (592, 20, 1, 'You have Invited raveena from undefined list to have a Match of 1 hour duration', 'Match_invitation', 93, '2020-12-17 06:37:14');
INSERT INTO `tb_notification` VALUES (593, 1, 20, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 94, '2020-12-17 06:38:54');
INSERT INTO `tb_notification` VALUES (594, 20, 1, 'You have Invited raveena from undefined list to have a Match of 1 hour duration', 'Match_invitation', 94, '2020-12-17 06:38:54');
INSERT INTO `tb_notification` VALUES (595, 1, 20, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 95, '2020-12-17 06:38:54');
INSERT INTO `tb_notification` VALUES (596, 20, 1, 'You have Invited raveena from undefined list to have a Match of 1 hour duration', 'Match_invitation', 95, '2020-12-17 06:38:54');
INSERT INTO `tb_notification` VALUES (597, 1, 10, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 96, '2020-12-17 06:42:57');
INSERT INTO `tb_notification` VALUES (598, 10, 1, 'You have Invited Nizam from undefined list to have a Match of 1 hour duration', 'Match_invitation', 96, '2020-12-17 06:42:57');
INSERT INTO `tb_notification` VALUES (599, 1, 10, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 97, '2020-12-17 06:42:57');
INSERT INTO `tb_notification` VALUES (600, 10, 1, 'You have Invited Nizam from undefined list to have a Match of 1 hour duration', 'Match_invitation', 97, '2020-12-17 06:42:57');
INSERT INTO `tb_notification` VALUES (601, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 98, '2020-12-17 06:47:14');
INSERT INTO `tb_notification` VALUES (602, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 98, '2020-12-17 06:47:14');
INSERT INTO `tb_notification` VALUES (603, 1, 6, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 99, '2020-12-17 06:54:58');
INSERT INTO `tb_notification` VALUES (604, 6, 1, 'You have Invited Test 2 from undefined list to have a Match of 1 hour duration', 'Match_invitation', 99, '2020-12-17 06:54:58');
INSERT INTO `tb_notification` VALUES (605, 1, 5, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 100, '2020-12-17 06:57:10');
INSERT INTO `tb_notification` VALUES (606, 5, 1, 'You have Invited jitheesh  from undefined list to have a Match of 1 hour duration', 'Match_invitation', 100, '2020-12-17 06:57:10');
INSERT INTO `tb_notification` VALUES (607, 1, 18, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 101, '2020-12-17 08:31:34');
INSERT INTO `tb_notification` VALUES (608, 18, 1, 'You have Invited Ram from undefined list to have a Match of 1 hour duration', 'Match_invitation', 101, '2020-12-17 08:31:34');
INSERT INTO `tb_notification` VALUES (609, 1, 21, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 102, '2020-12-17 09:12:17');
INSERT INTO `tb_notification` VALUES (610, 21, 1, 'You have Invited Lisa from undefined list to have a Match of 1 hour duration', 'Match_invitation', 102, '2020-12-17 09:12:17');
INSERT INTO `tb_notification` VALUES (611, 1, 23, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 103, '2020-12-18 00:41:42');
INSERT INTO `tb_notification` VALUES (612, 1, 23, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 104, '2020-12-18 00:41:42');
INSERT INTO `tb_notification` VALUES (613, 23, 1, 'You have Invited Kiran from undefined list to have a Match of 1 hour duration', 'Match_invitation', 103, '2020-12-18 00:41:42');
INSERT INTO `tb_notification` VALUES (614, 23, 1, 'You have Invited Kiran from undefined list to have a Match of 1 hour duration', 'Match_invitation', 104, '2020-12-18 00:41:42');
INSERT INTO `tb_notification` VALUES (615, 1, 8, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 105, '2020-12-18 23:18:13');
INSERT INTO `tb_notification` VALUES (616, 8, 1, 'You have Invited Neethu from undefined list to have a Match of 1 hour duration', 'Match_invitation', 105, '2020-12-18 23:18:13');
INSERT INTO `tb_notification` VALUES (617, 1, 14, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 106, '2020-12-18 23:40:20');
INSERT INTO `tb_notification` VALUES (618, 14, 1, 'You have Invited krishnan from undefined list to have a Match of 1 hour duration', 'Match_invitation', 106, '2020-12-18 23:40:20');
INSERT INTO `tb_notification` VALUES (619, 1, 9, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 107, '2020-12-19 10:00:44');
INSERT INTO `tb_notification` VALUES (620, 9, 1, 'You have Invited Aoc from undefined list to have a Match of 1 hour duration', 'Match_invitation', 107, '2020-12-19 10:00:44');
INSERT INTO `tb_notification` VALUES (621, 1, 17, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 108, '2020-12-19 10:04:43');
INSERT INTO `tb_notification` VALUES (622, 17, 1, 'You have Invited Ram from undefined list to have a Match of 1 hour duration', 'Match_invitation', 108, '2020-12-19 10:04:43');
INSERT INTO `tb_notification` VALUES (623, 1, 24, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 109, '2020-12-19 10:07:21');
INSERT INTO `tb_notification` VALUES (624, 24, 1, 'You have Invited lallu from undefined list to have a Match of 1 hour duration', 'Match_invitation', 109, '2020-12-19 10:07:21');
INSERT INTO `tb_notification` VALUES (625, 1, 34, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 110, '2020-12-21 01:37:29');
INSERT INTO `tb_notification` VALUES (626, 34, 1, 'You have Invited Christiana Mariya from undefined list to have a Match of 1 hour duration', 'Match_invitation', 110, '2020-12-21 01:37:29');
INSERT INTO `tb_notification` VALUES (627, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 111, '2020-12-21 01:43:05');
INSERT INTO `tb_notification` VALUES (628, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 111, '2020-12-21 01:43:05');
INSERT INTO `tb_notification` VALUES (629, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 112, '2020-12-21 01:43:39');
INSERT INTO `tb_notification` VALUES (630, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 112, '2020-12-21 01:43:39');
INSERT INTO `tb_notification` VALUES (631, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 113, '2020-12-21 01:43:44');
INSERT INTO `tb_notification` VALUES (632, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 113, '2020-12-21 01:43:44');
INSERT INTO `tb_notification` VALUES (633, 1, 35, 'Akshay Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 114, '2020-12-21 01:45:43');
INSERT INTO `tb_notification` VALUES (634, 35, 1, 'You have Invited Second from undefined list to have a Match of 2 hour duration', 'Match_invitation', 114, '2020-12-21 01:45:43');
INSERT INTO `tb_notification` VALUES (635, 1, 35, 'Akshay Invited you from undefined list to have a Match of 2 hour duration', 'Match_invitation', 115, '2020-12-21 01:45:43');
INSERT INTO `tb_notification` VALUES (636, 35, 1, 'You have Invited Second from undefined list to have a Match of 2 hour duration', 'Match_invitation', 115, '2020-12-21 01:45:43');
INSERT INTO `tb_notification` VALUES (637, 1, 32, 'Akshay Invited you from undefined list to have a Match of 3 hour duration', 'Match_invitation', 116, '2020-12-21 02:07:58');
INSERT INTO `tb_notification` VALUES (638, 1, 32, 'Akshay Invited you from undefined list to have a Match of 3 hour duration', 'Match_invitation', 117, '2020-12-21 02:07:58');
INSERT INTO `tb_notification` VALUES (639, 32, 1, 'You have Invited Ajmal from undefined list to have a Match of 3 hour duration', 'Match_invitation', 116, '2020-12-21 02:07:58');
INSERT INTO `tb_notification` VALUES (640, 32, 1, 'You have Invited Ajmal from undefined list to have a Match of 3 hour duration', 'Match_invitation', 117, '2020-12-21 02:07:58');
INSERT INTO `tb_notification` VALUES (641, 47, 5, 'Medoosa  added you as fan', 'Add_Fan', 51, '2020-12-21 04:58:50');
INSERT INTO `tb_notification` VALUES (642, 5, 47, 'You have added jitheesh  to your fan list', 'Add_Fan', 51, '2020-12-21 04:58:50');
INSERT INTO `tb_notification` VALUES (643, 47, 1, 'Medoosa  added you as fan_of', 'Add_Fan', 52, '2020-12-21 04:59:10');
INSERT INTO `tb_notification` VALUES (644, 1, 47, 'You have added Akshay to your fan_of list', 'Add_Fan', 52, '2020-12-21 04:59:10');
INSERT INTO `tb_notification` VALUES (645, 47, 1, 'Medoosa  Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 118, '2020-12-21 05:09:51');
INSERT INTO `tb_notification` VALUES (646, 1, 47, 'You have Invited Akshay from undefined list to have a Match of 1 hour duration', 'Match_invitation', 118, '2020-12-21 05:09:51');
INSERT INTO `tb_notification` VALUES (647, 47, 1, 'Medoosa  Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 119, '2020-12-21 05:09:51');
INSERT INTO `tb_notification` VALUES (648, 1, 47, 'You have Invited Akshay from undefined list to have a Match of 1 hour duration', 'Match_invitation', 119, '2020-12-21 05:09:51');
INSERT INTO `tb_notification` VALUES (649, 1, 38, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 120, '2020-12-21 05:23:43');
INSERT INTO `tb_notification` VALUES (650, 1, 38, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 121, '2020-12-21 05:23:43');
INSERT INTO `tb_notification` VALUES (651, 38, 1, 'You have Invited Dev from undefined list to have a Match of 1 hour duration', 'Match_invitation', 120, '2020-12-21 05:23:43');
INSERT INTO `tb_notification` VALUES (652, 38, 1, 'You have Invited Dev from undefined list to have a Match of 1 hour duration', 'Match_invitation', 121, '2020-12-21 05:23:43');
INSERT INTO `tb_notification` VALUES (653, 1, 38, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 122, '2020-12-21 05:25:17');
INSERT INTO `tb_notification` VALUES (654, 38, 1, 'You have Invited Dev from undefined list to have a Match of 1 hour duration', 'Match_invitation', 122, '2020-12-21 05:25:17');
INSERT INTO `tb_notification` VALUES (655, 1, 38, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 123, '2020-12-21 05:25:17');
INSERT INTO `tb_notification` VALUES (656, 38, 1, 'You have Invited Dev from undefined list to have a Match of 1 hour duration', 'Match_invitation', 123, '2020-12-21 05:25:17');
INSERT INTO `tb_notification` VALUES (657, 1, 3, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 124, '2020-12-21 08:21:08');
INSERT INTO `tb_notification` VALUES (658, 3, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 124, '2020-12-21 08:21:08');
INSERT INTO `tb_notification` VALUES (659, 1, 3, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 125, '2020-12-21 08:21:08');
INSERT INTO `tb_notification` VALUES (660, 3, 1, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 125, '2020-12-21 08:21:08');
INSERT INTO `tb_notification` VALUES (661, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 126, '2020-12-21 20:23:32');
INSERT INTO `tb_notification` VALUES (662, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 126, '2020-12-21 20:23:32');
INSERT INTO `tb_notification` VALUES (663, 1, 41, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 127, '2020-12-21 22:17:34');
INSERT INTO `tb_notification` VALUES (664, 41, 1, 'You have Invited Vineetha Koshy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 127, '2020-12-21 22:17:34');
INSERT INTO `tb_notification` VALUES (665, 1, 41, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 128, '2020-12-21 22:17:34');
INSERT INTO `tb_notification` VALUES (666, 41, 1, 'You have Invited Vineetha Koshy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 128, '2020-12-21 22:17:34');
INSERT INTO `tb_notification` VALUES (667, 1, 19, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 129, '2020-12-21 22:36:07');
INSERT INTO `tb_notification` VALUES (668, 19, 1, 'You have Invited Binoy from undefined list to have a Match of 1 hour duration', 'Match_invitation', 129, '2020-12-21 22:36:07');
INSERT INTO `tb_notification` VALUES (669, 1, 8, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 130, '2020-12-21 22:38:25');
INSERT INTO `tb_notification` VALUES (670, 8, 1, 'You have Invited Neethu from undefined list to have a Match of 1 hour duration', 'Match_invitation', 130, '2020-12-21 22:38:25');
INSERT INTO `tb_notification` VALUES (671, 1, 8, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 131, '2020-12-21 22:43:03');
INSERT INTO `tb_notification` VALUES (672, 8, 1, 'You have Invited Neethu from undefined list to have a Match of 1 hour duration', 'Match_invitation', 131, '2020-12-21 22:43:03');
INSERT INTO `tb_notification` VALUES (673, 1, 6, 'Akshay Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 132, '2020-12-22 00:53:45');
INSERT INTO `tb_notification` VALUES (674, 6, 1, 'You have Invited Test 2 from undefined list to have a Match of 1 hour duration', 'Match_invitation', 132, '2020-12-22 00:53:45');
INSERT INTO `tb_notification` VALUES (675, 1, 14, 'Akshay added you as fan_of', 'Add_Fan', 53, '2020-12-29 02:04:50');
INSERT INTO `tb_notification` VALUES (676, 14, 1, 'You have added krishnan to your fan_of list', 'Add_Fan', 53, '2020-12-29 02:04:50');
INSERT INTO `tb_notification` VALUES (677, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 133, '2020-12-29 02:44:18');
INSERT INTO `tb_notification` VALUES (678, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 133, '2020-12-29 02:44:18');
INSERT INTO `tb_notification` VALUES (679, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 133, '2020-12-29 02:44:30');
INSERT INTO `tb_notification` VALUES (680, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 133, '2020-12-29 02:44:30');
INSERT INTO `tb_notification` VALUES (681, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 133, '2020-12-29 03:52:09');
INSERT INTO `tb_notification` VALUES (682, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 133, '2020-12-29 03:52:09');
INSERT INTO `tb_notification` VALUES (683, 7, 2, 'Sam Invited you from undefined list to have a Match of 4 hour duration', 'Match_invitation', 134, '2020-12-29 23:06:23');
INSERT INTO `tb_notification` VALUES (684, 2, 7, 'You have Invited Ravi from undefined list to have a Match of 4 hour duration', 'Match_invitation', 134, '2020-12-29 23:06:23');
INSERT INTO `tb_notification` VALUES (685, 7, 2, 'Sam Invited you from undefined list to have a Match of 4 hour duration', 'Match_invitation', 135, '2020-12-29 23:06:24');
INSERT INTO `tb_notification` VALUES (686, 2, 7, 'You have Invited Ravi from undefined list to have a Match of 4 hour duration', 'Match_invitation', 135, '2020-12-29 23:06:24');
INSERT INTO `tb_notification` VALUES (687, 7, 1, 'Sam Invited you from undefined list to have a Match of 3 hour duration', 'Match_invitation', 136, '2020-12-30 02:45:08');
INSERT INTO `tb_notification` VALUES (688, 1, 7, 'You have Invited Akshay from undefined list to have a Match of 3 hour duration', 'Match_invitation', 136, '2020-12-30 02:45:08');
INSERT INTO `tb_notification` VALUES (689, 2, 1, 'Your Match with Akshay is over', 'match_reply', 133, '2020-12-30 03:53:01');
INSERT INTO `tb_notification` VALUES (690, 1, 2, 'Your Match with Ravi is over', 'match_reply', 133, '2020-12-30 03:53:01');
INSERT INTO `tb_notification` VALUES (691, 2, 1, 'Ravi Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 137, '2020-12-30 04:02:10');
INSERT INTO `tb_notification` VALUES (692, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 1 day duration', 'Match_invitation', 137, '2020-12-30 04:02:10');
INSERT INTO `tb_notification` VALUES (693, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 137, '2020-12-30 04:02:31');
INSERT INTO `tb_notification` VALUES (694, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 137, '2020-12-30 04:02:31');
INSERT INTO `tb_notification` VALUES (695, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 138, '2020-12-30 04:02:53');
INSERT INTO `tb_notification` VALUES (696, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 138, '2020-12-30 04:02:53');
INSERT INTO `tb_notification` VALUES (697, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 138, '2020-12-30 04:03:02');
INSERT INTO `tb_notification` VALUES (698, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 138, '2020-12-30 04:03:02');
INSERT INTO `tb_notification` VALUES (699, 7, 4, 'Sam Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 139, '2020-12-30 07:52:12');
INSERT INTO `tb_notification` VALUES (700, 4, 7, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 139, '2020-12-30 07:52:12');
INSERT INTO `tb_notification` VALUES (701, 7, 4, 'Sam Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 140, '2020-12-30 07:52:38');
INSERT INTO `tb_notification` VALUES (702, 4, 7, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 140, '2020-12-30 07:52:38');
INSERT INTO `tb_notification` VALUES (703, 7, 4, 'Sam Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 141, '2020-12-30 07:52:43');
INSERT INTO `tb_notification` VALUES (704, 4, 7, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 141, '2020-12-30 07:52:43');
INSERT INTO `tb_notification` VALUES (705, 7, 4, 'Sam Invited you from undefined list to have a Match of 1 hour duration', 'Match_invitation', 142, '2020-12-30 07:53:06');
INSERT INTO `tb_notification` VALUES (706, 4, 7, 'You have Invited jitheesh from undefined list to have a Match of 1 hour duration', 'Match_invitation', 142, '2020-12-30 07:53:06');
INSERT INTO `tb_notification` VALUES (707, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 143, '2020-12-31 02:51:47');
INSERT INTO `tb_notification` VALUES (708, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 143, '2020-12-31 02:51:48');
INSERT INTO `tb_notification` VALUES (709, 2, 1, 'Your Match with Akshay is over', 'match_reply', 137, '2020-12-31 04:03:01');
INSERT INTO `tb_notification` VALUES (710, 1, 2, 'Your Match with Ravi is over', 'match_reply', 137, '2020-12-31 04:03:01');
INSERT INTO `tb_notification` VALUES (711, 3, 1, 'Your Match with Akshay is over', 'match_reply', 138, '2021-01-01 04:04:01');
INSERT INTO `tb_notification` VALUES (712, 1, 3, 'Your Match with jitheesh is over', 'match_reply', 138, '2021-01-01 04:04:01');
INSERT INTO `tb_notification` VALUES (713, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 144, '2021-01-01 07:39:18');
INSERT INTO `tb_notification` VALUES (714, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 144, '2021-01-01 07:39:18');
INSERT INTO `tb_notification` VALUES (715, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 145, '2021-01-03 20:45:22');
INSERT INTO `tb_notification` VALUES (716, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 145, '2021-01-03 20:45:22');
INSERT INTO `tb_notification` VALUES (717, 3, 1, 'jitheesh Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 146, '2021-01-03 21:17:02');
INSERT INTO `tb_notification` VALUES (718, 1, 3, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 146, '2021-01-03 21:17:02');
INSERT INTO `tb_notification` VALUES (719, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 146, '2021-01-03 21:17:49');
INSERT INTO `tb_notification` VALUES (720, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 146, '2021-01-03 21:17:49');
INSERT INTO `tb_notification` VALUES (721, 2, 1, 'Ravi Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 147, '2021-01-04 07:39:34');
INSERT INTO `tb_notification` VALUES (722, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 147, '2021-01-04 07:39:34');
INSERT INTO `tb_notification` VALUES (723, 7, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 68, '2021-01-04 21:19:05');
INSERT INTO `tb_notification` VALUES (724, 1, 7, 'You have accepted Invitation from Sam', 'match_reply', 68, '2021-01-04 21:19:05');
INSERT INTO `tb_notification` VALUES (725, 7, 1, 'Your Match with Akshay is over', 'match_reply', 68, '2021-01-04 23:20:01');
INSERT INTO `tb_notification` VALUES (726, 1, 7, 'Your Match with Sam is over', 'match_reply', 68, '2021-01-04 23:20:01');
INSERT INTO `tb_notification` VALUES (727, 0, 4, ' Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 149, '2021-01-05 00:27:02');
INSERT INTO `tb_notification` VALUES (728, 4, 0, 'You have Invited jitheesh from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 149, '2021-01-05 00:27:02');
INSERT INTO `tb_notification` VALUES (729, 0, 4, ' Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 150, '2021-01-05 00:27:11');
INSERT INTO `tb_notification` VALUES (730, 4, 0, 'You have Invited jitheesh from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 150, '2021-01-05 00:27:11');
INSERT INTO `tb_notification` VALUES (731, 0, 5, ' Invited you from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 151, '2021-01-05 00:32:39');
INSERT INTO `tb_notification` VALUES (732, 5, 0, 'You have Invited jitheesh  from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 151, '2021-01-05 00:32:39');
INSERT INTO `tb_notification` VALUES (733, 2, 1, 'Ravi Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 152, '2021-01-05 02:40:35');
INSERT INTO `tb_notification` VALUES (734, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 152, '2021-01-05 02:40:35');
INSERT INTO `tb_notification` VALUES (735, 1, 9, 'Akshay Invited you from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 153, '2021-01-05 04:06:06');
INSERT INTO `tb_notification` VALUES (736, 9, 1, 'You have Invited Aoc from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 153, '2021-01-05 04:06:06');
INSERT INTO `tb_notification` VALUES (737, 1, 7, 'Akshay Invited you from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 154, '2021-01-05 07:25:47');
INSERT INTO `tb_notification` VALUES (738, 7, 1, 'You have Invited Sam from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 154, '2021-01-05 07:25:47');
INSERT INTO `tb_notification` VALUES (739, 3, 1, 'Your Match with Akshay is over', 'match_reply', 146, '2021-01-05 21:18:01');
INSERT INTO `tb_notification` VALUES (740, 1, 3, 'Your Match with jitheesh is over', 'match_reply', 146, '2021-01-05 21:18:01');
INSERT INTO `tb_notification` VALUES (741, 1, 6, 'Akshay Invited you from Basic Method list to have a Match of 4 hour duration', 'Match_invitation', 155, '2021-01-06 07:14:49');
INSERT INTO `tb_notification` VALUES (742, 6, 1, 'You have Invited Test 2 from Basic Method list to have a Match of 4 hour duration', 'Match_invitation', 155, '2021-01-06 07:14:49');
INSERT INTO `tb_notification` VALUES (743, 27, 12, 'Veena added you as bestie', 'Add_Bestie', 68, '2021-01-06 07:52:41');
INSERT INTO `tb_notification` VALUES (744, 12, 27, 'You have added Kanna to your bestie list', 'Add_Bestie', 68, '2021-01-06 07:52:41');
INSERT INTO `tb_notification` VALUES (745, 7, 43, 'Sam Invited you from Basic Method list to have a Match of 4 hour duration', 'Match_invitation', 156, '2021-01-07 02:08:07');
INSERT INTO `tb_notification` VALUES (746, 43, 7, 'You have Invited Bino from Basic Method list to have a Match of 4 hour duration', 'Match_invitation', 156, '2021-01-07 02:08:07');
INSERT INTO `tb_notification` VALUES (747, 7, 2, 'Sam added you as fan', 'Add_Fan', 54, '2021-01-07 02:30:21');
INSERT INTO `tb_notification` VALUES (748, 2, 7, 'You have added Ravi to your fan list', 'Add_Fan', 54, '2021-01-07 02:30:21');
INSERT INTO `tb_notification` VALUES (749, 7, 1, 'Sam added you as fan_of', 'Add_Fan', 55, '2021-01-07 02:30:31');
INSERT INTO `tb_notification` VALUES (750, 1, 7, 'You have added Akshay to your fan_of list', 'Add_Fan', 55, '2021-01-07 02:30:31');
INSERT INTO `tb_notification` VALUES (751, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 2 hour duration', 'Match_invitation', 157, '2021-01-07 02:31:35');
INSERT INTO `tb_notification` VALUES (752, 1, 7, 'You have Invited Akshay from Basic Method list to have a Match of 2 hour duration', 'Match_invitation', 157, '2021-01-07 02:31:35');
INSERT INTO `tb_notification` VALUES (753, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 98, '2021-01-08 01:39:07');
INSERT INTO `tb_notification` VALUES (754, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 98, '2021-01-08 01:39:07');
INSERT INTO `tb_notification` VALUES (755, 2, 1, 'Your Match with Akshay is over', 'match_reply', 98, '2021-01-09 01:40:01');
INSERT INTO `tb_notification` VALUES (756, 1, 2, 'Your Match with Ravi is over', 'match_reply', 98, '2021-01-09 01:40:01');
INSERT INTO `tb_notification` VALUES (757, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 111, '2021-01-10 23:36:36');
INSERT INTO `tb_notification` VALUES (758, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 111, '2021-01-10 23:36:36');
INSERT INTO `tb_notification` VALUES (759, 2, 1, 'Your Match with Akshay is over', 'match_reply', 111, '2021-01-11 23:37:01');
INSERT INTO `tb_notification` VALUES (760, 1, 2, 'Your Match with Ravi is over', 'match_reply', 111, '2021-01-11 23:37:01');
INSERT INTO `tb_notification` VALUES (761, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:22:37');
INSERT INTO `tb_notification` VALUES (762, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:22:37');
INSERT INTO `tb_notification` VALUES (763, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:22:37');
INSERT INTO `tb_notification` VALUES (764, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:22:37');
INSERT INTO `tb_notification` VALUES (765, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:22:38');
INSERT INTO `tb_notification` VALUES (766, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:22:38');
INSERT INTO `tb_notification` VALUES (767, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:22:38');
INSERT INTO `tb_notification` VALUES (768, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:22:38');
INSERT INTO `tb_notification` VALUES (769, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 112, '2021-01-14 00:22:38');
INSERT INTO `tb_notification` VALUES (770, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 112, '2021-01-14 00:22:38');
INSERT INTO `tb_notification` VALUES (771, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:35:17');
INSERT INTO `tb_notification` VALUES (772, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:35:17');
INSERT INTO `tb_notification` VALUES (773, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:35:17');
INSERT INTO `tb_notification` VALUES (774, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:35:17');
INSERT INTO `tb_notification` VALUES (775, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:35:17');
INSERT INTO `tb_notification` VALUES (776, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:35:17');
INSERT INTO `tb_notification` VALUES (777, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 00:35:17');
INSERT INTO `tb_notification` VALUES (778, 7, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 157, '2021-01-14 00:35:17');
INSERT INTO `tb_notification` VALUES (779, 1, 7, 'You have accepted Invitation from Sam', 'match_reply', 157, '2021-01-14 00:35:17');
INSERT INTO `tb_notification` VALUES (780, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 2 hour duration', 'Match_invitation', 158, '2021-01-14 01:25:06');
INSERT INTO `tb_notification` VALUES (781, 1, 7, 'You have Invited Akshay from Basic Method list to have a Match of 2 hour duration', 'Match_invitation', 158, '2021-01-14 01:25:06');
INSERT INTO `tb_notification` VALUES (782, 2, 1, 'Ravi Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 159, '2021-01-14 01:41:36');
INSERT INTO `tb_notification` VALUES (783, 1, 2, 'You have Invited Akshay from bestie list to have a Match of 2 day duration', 'Match_invitation', 159, '2021-01-14 01:41:36');
INSERT INTO `tb_notification` VALUES (784, 2, 1, 'Ravi Invited you from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 160, '2021-01-14 01:54:27');
INSERT INTO `tb_notification` VALUES (785, 1, 2, 'You have Invited Akshay from Basic Method list to have a Match of 5 hour duration', 'Match_invitation', 160, '2021-01-14 01:54:27');
INSERT INTO `tb_notification` VALUES (786, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 01:59:48');
INSERT INTO `tb_notification` VALUES (787, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 01:59:48');
INSERT INTO `tb_notification` VALUES (788, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 01:59:48');
INSERT INTO `tb_notification` VALUES (789, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 01:59:48');
INSERT INTO `tb_notification` VALUES (790, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 01:59:48');
INSERT INTO `tb_notification` VALUES (791, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 01:59:48');
INSERT INTO `tb_notification` VALUES (792, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 01:59:48');
INSERT INTO `tb_notification` VALUES (793, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 01:59:48');
INSERT INTO `tb_notification` VALUES (794, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 113, '2021-01-14 01:59:48');
INSERT INTO `tb_notification` VALUES (795, 1, 2, 'You have accepted Invitation from Ravi', 'match_reply', 113, '2021-01-14 01:59:48');
INSERT INTO `tb_notification` VALUES (796, 2, 1, 'Ravi Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 161, '2021-01-14 02:00:10');
INSERT INTO `tb_notification` VALUES (797, 1, 2, 'You have Invited Akshay from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 161, '2021-01-14 02:00:10');
INSERT INTO `tb_notification` VALUES (798, 1, 2, 'Akshay Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 162, '2021-01-14 02:01:19');
INSERT INTO `tb_notification` VALUES (799, 2, 1, 'You have Invited Ravi from bestie list to have a Match of 2 day duration', 'Match_invitation', 162, '2021-01-14 02:01:19');
INSERT INTO `tb_notification` VALUES (800, 1, 2, 'Akshay Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 163, '2021-01-14 02:04:08');
INSERT INTO `tb_notification` VALUES (801, 2, 1, 'You have been Invited by Ravi to have a Match of 2 day duration', 'Match_invitation', 163, '2021-01-14 02:04:08');
INSERT INTO `tb_notification` VALUES (802, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:06:26');
INSERT INTO `tb_notification` VALUES (803, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:06:26');
INSERT INTO `tb_notification` VALUES (804, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:06:26');
INSERT INTO `tb_notification` VALUES (805, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:06:26');
INSERT INTO `tb_notification` VALUES (806, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:06:26');
INSERT INTO `tb_notification` VALUES (807, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:06:26');
INSERT INTO `tb_notification` VALUES (808, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:06:26');
INSERT INTO `tb_notification` VALUES (809, 1, 2, '1 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:06:26');
INSERT INTO `tb_notification` VALUES (810, 1, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 75, '2021-01-14 02:06:26');
INSERT INTO `tb_notification` VALUES (811, 2, 1, 'You have accepted Invitation from Akshay', 'match_reply', 75, '2021-01-14 02:06:26');
INSERT INTO `tb_notification` VALUES (812, 1, 2, 'Your Invitation is rejected by Ravi', 'match_reply', 79, '2021-01-14 02:07:05');
INSERT INTO `tb_notification` VALUES (813, 2, 1, 'You have rejected Invitation from Akshay', 'match_reply', 79, '2021-01-14 02:07:05');
INSERT INTO `tb_notification` VALUES (814, 7, 2, '7 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:07:10');
INSERT INTO `tb_notification` VALUES (815, 7, 2, '7 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:07:10');
INSERT INTO `tb_notification` VALUES (816, 7, 2, '7 added a new open match with 2, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:07:10');
INSERT INTO `tb_notification` VALUES (817, 7, 2, 'Your Invitation is accepted by Ravi', 'match_reply', 134, '2021-01-14 02:07:10');
INSERT INTO `tb_notification` VALUES (818, 2, 7, 'You have accepted Invitation from Sam', 'match_reply', 134, '2021-01-14 02:07:10');
INSERT INTO `tb_notification` VALUES (819, 2, 1, 'Raveena Invited you from Basic Method list to have a Match of 15 hour duration', 'Match_invitation', 164, '2021-01-14 02:21:43');
INSERT INTO `tb_notification` VALUES (820, 1, 2, 'You have been Invited by Akshay to have a Match of 15 hour duration', 'Match_invitation', 164, '2021-01-14 02:21:43');
INSERT INTO `tb_notification` VALUES (821, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:24:49');
INSERT INTO `tb_notification` VALUES (822, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:24:49');
INSERT INTO `tb_notification` VALUES (823, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:24:49');
INSERT INTO `tb_notification` VALUES (824, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:24:49');
INSERT INTO `tb_notification` VALUES (825, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:24:49');
INSERT INTO `tb_notification` VALUES (826, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:24:49');
INSERT INTO `tb_notification` VALUES (827, 47, 1, '47 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:24:49');
INSERT INTO `tb_notification` VALUES (828, 47, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 118, '2021-01-14 02:24:49');
INSERT INTO `tb_notification` VALUES (829, 1, 47, 'You have accepted Invitation from Medoosa ', 'match_reply', 118, '2021-01-14 02:24:49');
INSERT INTO `tb_notification` VALUES (830, 47, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 119, '2021-01-14 02:25:33');
INSERT INTO `tb_notification` VALUES (831, 1, 47, 'You have rejected Invitation from Medoosa ', 'match_reply', 119, '2021-01-14 02:25:33');
INSERT INTO `tb_notification` VALUES (832, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:25:44');
INSERT INTO `tb_notification` VALUES (833, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:25:44');
INSERT INTO `tb_notification` VALUES (834, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:25:44');
INSERT INTO `tb_notification` VALUES (835, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:25:44');
INSERT INTO `tb_notification` VALUES (836, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:25:44');
INSERT INTO `tb_notification` VALUES (837, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:25:44');
INSERT INTO `tb_notification` VALUES (838, 7, 1, '7 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-14 02:25:44');
INSERT INTO `tb_notification` VALUES (839, 7, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 136, '2021-01-14 02:25:44');
INSERT INTO `tb_notification` VALUES (840, 1, 7, 'You have accepted Invitation from Sam', 'match_reply', 136, '2021-01-14 02:25:44');
INSERT INTO `tb_notification` VALUES (841, 1, 2, 'Akshay Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 165, '2021-01-14 02:29:32');
INSERT INTO `tb_notification` VALUES (842, 2, 1, 'You have been Invited by Raveena to have a Match of 2 day duration', 'Match_invitation', 165, '2021-01-14 02:29:32');
INSERT INTO `tb_notification` VALUES (843, 2, 1, 'Raveena Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 166, '2021-01-14 02:35:58');
INSERT INTO `tb_notification` VALUES (844, 1, 2, 'You have been Invited by Akshay to have a Match of 2 day duration', 'Match_invitation', 166, '2021-01-14 02:35:58');
INSERT INTO `tb_notification` VALUES (845, 7, 1, 'Your Match with Akshay is over', 'match_reply', 157, '2021-01-14 02:36:01');
INSERT INTO `tb_notification` VALUES (846, 1, 7, 'Your Match with Sam is over', 'match_reply', 157, '2021-01-14 02:36:01');
INSERT INTO `tb_notification` VALUES (847, 2, 5, 'Raveena Invited you from bestie list to have a Match of 2 day duration', 'Match_invitation', 167, '2021-01-14 02:38:52');
INSERT INTO `tb_notification` VALUES (848, 5, 2, 'You have been Invited by jitheesh  to have a Match of 2 day duration', 'Match_invitation', 167, '2021-01-14 02:38:52');
INSERT INTO `tb_notification` VALUES (849, 1, 2, 'Your Match with Raveena is over', 'match_reply', 75, '2021-01-14 03:07:01');
INSERT INTO `tb_notification` VALUES (850, 2, 1, 'Your Match with Akshay is over', 'match_reply', 75, '2021-01-14 03:07:01');
INSERT INTO `tb_notification` VALUES (851, 47, 1, 'Your Match with Akshay is over', 'match_reply', 118, '2021-01-14 03:25:01');
INSERT INTO `tb_notification` VALUES (852, 1, 47, 'Your Match with Medoosa  is over', 'match_reply', 118, '2021-01-14 03:25:01');
INSERT INTO `tb_notification` VALUES (853, 2, 1, 'Raveena Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 169, '2021-01-14 03:31:47');
INSERT INTO `tb_notification` VALUES (854, 1, 2, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 169, '2021-01-14 03:31:47');
INSERT INTO `tb_notification` VALUES (855, 2, 1, 'Raveena Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 170, '2021-01-14 03:32:37');
INSERT INTO `tb_notification` VALUES (856, 1, 2, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 170, '2021-01-14 03:32:37');
INSERT INTO `tb_notification` VALUES (857, 2, 1, 'Raveena Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 171, '2021-01-14 03:43:22');
INSERT INTO `tb_notification` VALUES (858, 1, 2, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 171, '2021-01-14 03:43:22');
INSERT INTO `tb_notification` VALUES (859, 2, 1, 'Raveena Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 172, '2021-01-14 03:43:44');
INSERT INTO `tb_notification` VALUES (860, 1, 2, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 172, '2021-01-14 03:43:44');
INSERT INTO `tb_notification` VALUES (861, 5, 1, 'jitheesh  Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 173, '2021-01-14 03:43:53');
INSERT INTO `tb_notification` VALUES (862, 1, 5, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 173, '2021-01-14 03:43:53');
INSERT INTO `tb_notification` VALUES (863, 4, 1, 'jitheesh Invited you from bestie list to have a Match of 1 day duration', 'Match_invitation', 174, '2021-01-14 03:44:13');
INSERT INTO `tb_notification` VALUES (864, 1, 4, 'You have been Invited by Akshay to have a Match of 1 day duration', 'Match_invitation', 174, '2021-01-14 03:44:13');
INSERT INTO `tb_notification` VALUES (865, 7, 1, 'Your Match with Akshay is over', 'match_reply', 136, '2021-01-14 05:26:02');
INSERT INTO `tb_notification` VALUES (866, 1, 7, 'Your Match with Sam is over', 'match_reply', 136, '2021-01-14 05:26:02');
INSERT INTO `tb_notification` VALUES (867, 7, 2, 'Your Match with Raveena is over', 'match_reply', 134, '2021-01-14 06:08:01');
INSERT INTO `tb_notification` VALUES (868, 2, 7, 'Your Match with Sam is over', 'match_reply', 134, '2021-01-14 06:08:01');
INSERT INTO `tb_notification` VALUES (869, 2, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 126, '2021-01-14 07:24:41');
INSERT INTO `tb_notification` VALUES (870, 1, 2, 'You have rejected Invitation from Raveena', 'match_reply', 126, '2021-01-14 07:24:41');
INSERT INTO `tb_notification` VALUES (871, 2, 1, 'Your Match with Akshay is over', 'match_reply', 112, '2021-01-15 00:23:01');
INSERT INTO `tb_notification` VALUES (872, 1, 2, 'Your Match with Raveena is over', 'match_reply', 112, '2021-01-15 00:23:01');
INSERT INTO `tb_notification` VALUES (873, 2, 1, 'Your Match with Akshay is over', 'match_reply', 113, '2021-01-15 02:00:01');
INSERT INTO `tb_notification` VALUES (874, 1, 2, 'Your Match with Raveena is over', 'match_reply', 113, '2021-01-15 02:00:01');
INSERT INTO `tb_notification` VALUES (875, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:12:32');
INSERT INTO `tb_notification` VALUES (876, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:12:32');
INSERT INTO `tb_notification` VALUES (877, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:12:32');
INSERT INTO `tb_notification` VALUES (878, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:12:32');
INSERT INTO `tb_notification` VALUES (879, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:12:32');
INSERT INTO `tb_notification` VALUES (880, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:12:32');
INSERT INTO `tb_notification` VALUES (881, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 03:12:32');
INSERT INTO `tb_notification` VALUES (882, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 03:12:32');
INSERT INTO `tb_notification` VALUES (883, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:13:28');
INSERT INTO `tb_notification` VALUES (884, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:13:28');
INSERT INTO `tb_notification` VALUES (885, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:13:28');
INSERT INTO `tb_notification` VALUES (886, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:13:28');
INSERT INTO `tb_notification` VALUES (887, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:13:28');
INSERT INTO `tb_notification` VALUES (888, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:13:28');
INSERT INTO `tb_notification` VALUES (889, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 143, '2021-01-15 03:13:28');
INSERT INTO `tb_notification` VALUES (890, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 143, '2021-01-15 03:13:28');
INSERT INTO `tb_notification` VALUES (891, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:17:17');
INSERT INTO `tb_notification` VALUES (892, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:17:17');
INSERT INTO `tb_notification` VALUES (893, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:17:17');
INSERT INTO `tb_notification` VALUES (894, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:17:17');
INSERT INTO `tb_notification` VALUES (895, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:17:17');
INSERT INTO `tb_notification` VALUES (896, 3, 1, '3 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:17:17');
INSERT INTO `tb_notification` VALUES (897, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 144, '2021-01-15 03:17:17');
INSERT INTO `tb_notification` VALUES (898, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 144, '2021-01-15 03:17:17');
INSERT INTO `tb_notification` VALUES (899, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:21:54');
INSERT INTO `tb_notification` VALUES (900, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:21:54');
INSERT INTO `tb_notification` VALUES (901, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:21:54');
INSERT INTO `tb_notification` VALUES (902, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:21:54');
INSERT INTO `tb_notification` VALUES (903, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:21:54');
INSERT INTO `tb_notification` VALUES (904, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:21:54');
INSERT INTO `tb_notification` VALUES (905, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:21:54');
INSERT INTO `tb_notification` VALUES (906, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:21:54');
INSERT INTO `tb_notification` VALUES (907, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 160, '2021-01-15 03:21:54');
INSERT INTO `tb_notification` VALUES (908, 1, 2, 'You have accepted Invitation from Raveena', 'match_reply', 160, '2021-01-15 03:21:55');
INSERT INTO `tb_notification` VALUES (909, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (910, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (911, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (912, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (913, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (914, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (915, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (916, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (917, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (918, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 173, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (919, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 173, '2021-01-15 03:31:56');
INSERT INTO `tb_notification` VALUES (920, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:34:39');
INSERT INTO `tb_notification` VALUES (921, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:34:39');
INSERT INTO `tb_notification` VALUES (922, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:34:39');
INSERT INTO `tb_notification` VALUES (923, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:34:39');
INSERT INTO `tb_notification` VALUES (924, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:34:39');
INSERT INTO `tb_notification` VALUES (925, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:34:39');
INSERT INTO `tb_notification` VALUES (926, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:34:39');
INSERT INTO `tb_notification` VALUES (927, 2, 1, '2 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:34:40');
INSERT INTO `tb_notification` VALUES (928, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 172, '2021-01-15 03:34:40');
INSERT INTO `tb_notification` VALUES (929, 1, 2, 'You have accepted Invitation from Raveena', 'match_reply', 172, '2021-01-15 03:34:40');
INSERT INTO `tb_notification` VALUES (930, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:38:48');
INSERT INTO `tb_notification` VALUES (931, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:38:48');
INSERT INTO `tb_notification` VALUES (932, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:38:48');
INSERT INTO `tb_notification` VALUES (933, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:38:48');
INSERT INTO `tb_notification` VALUES (934, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:38:48');
INSERT INTO `tb_notification` VALUES (935, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:38:48');
INSERT INTO `tb_notification` VALUES (936, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 03:38:48');
INSERT INTO `tb_notification` VALUES (937, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 03:38:48');
INSERT INTO `tb_notification` VALUES (938, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:39:52');
INSERT INTO `tb_notification` VALUES (939, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:39:52');
INSERT INTO `tb_notification` VALUES (940, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:39:52');
INSERT INTO `tb_notification` VALUES (941, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:39:52');
INSERT INTO `tb_notification` VALUES (942, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:39:52');
INSERT INTO `tb_notification` VALUES (943, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:39:52');
INSERT INTO `tb_notification` VALUES (944, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 03:39:52');
INSERT INTO `tb_notification` VALUES (945, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 03:39:52');
INSERT INTO `tb_notification` VALUES (946, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:41:54');
INSERT INTO `tb_notification` VALUES (947, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:41:54');
INSERT INTO `tb_notification` VALUES (948, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:41:54');
INSERT INTO `tb_notification` VALUES (949, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:41:55');
INSERT INTO `tb_notification` VALUES (950, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:41:55');
INSERT INTO `tb_notification` VALUES (951, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:41:55');
INSERT INTO `tb_notification` VALUES (952, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 03:41:55');
INSERT INTO `tb_notification` VALUES (953, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 03:41:55');
INSERT INTO `tb_notification` VALUES (954, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:42:15');
INSERT INTO `tb_notification` VALUES (955, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:42:15');
INSERT INTO `tb_notification` VALUES (956, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:42:15');
INSERT INTO `tb_notification` VALUES (957, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:42:15');
INSERT INTO `tb_notification` VALUES (958, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:42:15');
INSERT INTO `tb_notification` VALUES (959, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:42:15');
INSERT INTO `tb_notification` VALUES (960, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 03:42:15');
INSERT INTO `tb_notification` VALUES (961, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 03:42:15');
INSERT INTO `tb_notification` VALUES (962, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:46:52');
INSERT INTO `tb_notification` VALUES (963, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:46:52');
INSERT INTO `tb_notification` VALUES (964, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:46:52');
INSERT INTO `tb_notification` VALUES (965, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:46:52');
INSERT INTO `tb_notification` VALUES (966, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:46:52');
INSERT INTO `tb_notification` VALUES (967, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:46:52');
INSERT INTO `tb_notification` VALUES (968, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 03:46:52');
INSERT INTO `tb_notification` VALUES (969, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 03:46:52');
INSERT INTO `tb_notification` VALUES (970, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:11');
INSERT INTO `tb_notification` VALUES (971, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:11');
INSERT INTO `tb_notification` VALUES (972, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:11');
INSERT INTO `tb_notification` VALUES (973, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:11');
INSERT INTO `tb_notification` VALUES (974, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:11');
INSERT INTO `tb_notification` VALUES (975, 4, 1, '4 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:11');
INSERT INTO `tb_notification` VALUES (976, 4, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 174, '2021-01-15 03:47:11');
INSERT INTO `tb_notification` VALUES (977, 1, 4, 'You have accepted Invitation from jitheesh', 'match_reply', 174, '2021-01-15 03:47:11');
INSERT INTO `tb_notification` VALUES (978, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (979, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (980, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (981, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (982, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (983, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (984, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (985, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (986, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (987, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 173, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (988, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 173, '2021-01-15 03:47:22');
INSERT INTO `tb_notification` VALUES (989, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (990, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (991, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (992, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (993, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (994, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (995, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (996, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (997, 5, 1, '5 added a new open match with 1, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (998, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 173, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (999, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 173, '2021-01-15 03:49:24');
INSERT INTO `tb_notification` VALUES (1000, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1001, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1002, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1003, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1004, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1005, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1006, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1007, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1008, 5, 1, 'jitheesh  added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1009, 5, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 173, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1010, 1, 5, 'You have accepted Invitation from jitheesh ', 'match_reply', 173, '2021-01-15 03:53:14');
INSERT INTO `tb_notification` VALUES (1011, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 04:05:45');
INSERT INTO `tb_notification` VALUES (1012, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 04:05:45');
INSERT INTO `tb_notification` VALUES (1013, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 04:05:45');
INSERT INTO `tb_notification` VALUES (1014, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 04:05:45');
INSERT INTO `tb_notification` VALUES (1015, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 04:05:45');
INSERT INTO `tb_notification` VALUES (1016, 3, 1, 'jitheesh added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-15 04:05:45');
INSERT INTO `tb_notification` VALUES (1017, 3, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 145, '2021-01-15 04:05:45');
INSERT INTO `tb_notification` VALUES (1018, 1, 3, 'You have accepted Invitation from jitheesh', 'match_reply', 145, '2021-01-15 04:05:45');
INSERT INTO `tb_notification` VALUES (1019, 2, 1, 'Your Match with Akshay is over', 'match_reply', 160, '2021-01-15 08:22:01');
INSERT INTO `tb_notification` VALUES (1020, 1, 2, 'Your Match with Raveena is over', 'match_reply', 160, '2021-01-15 08:22:02');
INSERT INTO `tb_notification` VALUES (1021, 2, 1, 'Your Match with Akshay is over', 'match_reply', 172, '2021-01-16 03:35:01');
INSERT INTO `tb_notification` VALUES (1022, 1, 2, 'Your Match with Raveena is over', 'match_reply', 172, '2021-01-16 03:35:01');
INSERT INTO `tb_notification` VALUES (1023, 2, 1, 'Your Match with Akshay is over', 'match_reply', 171, '2021-01-16 03:37:01');
INSERT INTO `tb_notification` VALUES (1024, 1, 2, 'Your Match with Raveena is over', 'match_reply', 171, '2021-01-16 03:37:01');
INSERT INTO `tb_notification` VALUES (1025, 4, 1, 'Your Match with Akshay is over', 'match_reply', 174, '2021-01-16 03:48:01');
INSERT INTO `tb_notification` VALUES (1026, 1, 4, 'Your Match with jitheesh is over', 'match_reply', 174, '2021-01-16 03:48:01');
INSERT INTO `tb_notification` VALUES (1027, 5, 1, 'Your Match with Akshay is over', 'match_reply', 173, '2021-01-16 03:54:01');
INSERT INTO `tb_notification` VALUES (1028, 1, 5, 'Your Match with jitheesh  is over', 'match_reply', 173, '2021-01-16 03:54:01');
INSERT INTO `tb_notification` VALUES (1029, 3, 1, 'Your Match with Akshay is over', 'match_reply', 143, '2021-01-17 03:14:01');
INSERT INTO `tb_notification` VALUES (1030, 1, 3, 'Your Match with jitheesh is over', 'match_reply', 143, '2021-01-17 03:14:01');
INSERT INTO `tb_notification` VALUES (1031, 3, 1, 'Your Match with Akshay is over', 'match_reply', 144, '2021-01-17 03:18:01');
INSERT INTO `tb_notification` VALUES (1032, 1, 3, 'Your Match with jitheesh is over', 'match_reply', 144, '2021-01-17 03:18:01');
INSERT INTO `tb_notification` VALUES (1033, 3, 1, 'Your Match with Akshay is over', 'match_reply', 145, '2021-01-17 04:06:01');
INSERT INTO `tb_notification` VALUES (1034, 1, 3, 'Your Match with jitheesh is over', 'match_reply', 145, '2021-01-17 04:06:01');
INSERT INTO `tb_notification` VALUES (1035, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 175, '2021-01-17 22:28:55');
INSERT INTO `tb_notification` VALUES (1036, 1, 7, 'You have been Invited by Akshay to have a Match of 1 hour duration', 'Match_invitation', 175, '2021-01-17 22:28:55');
INSERT INTO `tb_notification` VALUES (1037, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 176, '2021-01-17 22:33:40');
INSERT INTO `tb_notification` VALUES (1038, 1, 7, 'You have been Invited by Akshay to have a Match of 1 hour duration', 'Match_invitation', 176, '2021-01-17 22:33:40');
INSERT INTO `tb_notification` VALUES (1039, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 2 hour duration', 'Match_invitation', 177, '2021-01-18 02:20:21');
INSERT INTO `tb_notification` VALUES (1040, 1, 7, 'You have been Invited by Akshay to have a Match of 2 hour duration', 'Match_invitation', 177, '2021-01-18 02:20:21');
INSERT INTO `tb_notification` VALUES (1041, 7, 1, 'Sam Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 178, '2021-01-21 22:45:17');
INSERT INTO `tb_notification` VALUES (1042, 1, 7, 'You have been Invited by Akshay to have a Match of 1 hour duration', 'Match_invitation', 178, '2021-01-21 22:45:17');
INSERT INTO `tb_notification` VALUES (1043, 49, 7, 'Sara added you as fan_of', 'Add_Fan', 56, '2021-01-22 00:54:19');
INSERT INTO `tb_notification` VALUES (1044, 7, 49, 'You have added Sam to your fan_of list', 'Add_Fan', 56, '2021-01-22 00:54:19');
INSERT INTO `tb_notification` VALUES (1045, 49, 7, 'Sara added you as bestie', 'Add_Bestie', 69, '2021-01-22 00:54:39');
INSERT INTO `tb_notification` VALUES (1046, 7, 49, 'You have added Sam to your bestie list', 'Add_Bestie', 69, '2021-01-22 00:54:39');
INSERT INTO `tb_notification` VALUES (1047, 49, 7, 'Sara added you as squad', 'Add_Bestie', 70, '2021-01-22 00:54:59');
INSERT INTO `tb_notification` VALUES (1048, 7, 49, 'You have added Sam to your squad list', 'Add_Bestie', 70, '2021-01-22 00:54:59');
INSERT INTO `tb_notification` VALUES (1049, 7, 49, 'Sam Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 179, '2021-01-22 01:31:47');
INSERT INTO `tb_notification` VALUES (1050, 49, 7, 'You have been Invited by Sara to have a Match of 1 hour duration', 'Match_invitation', 179, '2021-01-22 01:31:47');
INSERT INTO `tb_notification` VALUES (1051, 1, 7, 'Your Invitation is rejected by Sam', 'match_reply', 61, '2021-01-22 01:32:36');
INSERT INTO `tb_notification` VALUES (1052, 7, 1, 'You have rejected Invitation from Akshay', 'match_reply', 61, '2021-01-22 01:32:36');
INSERT INTO `tb_notification` VALUES (1053, 1, 7, 'Your Invitation is rejected by Sam', 'match_reply', 62, '2021-01-22 01:32:39');
INSERT INTO `tb_notification` VALUES (1054, 7, 1, 'You have rejected Invitation from Akshay', 'match_reply', 62, '2021-01-22 01:32:39');
INSERT INTO `tb_notification` VALUES (1055, 1, 7, 'Your Invitation is rejected by Sam', 'match_reply', 154, '2021-01-22 01:32:43');
INSERT INTO `tb_notification` VALUES (1056, 7, 1, 'You have rejected Invitation from Akshay', 'match_reply', 154, '2021-01-22 01:32:43');
INSERT INTO `tb_notification` VALUES (1057, 7, 49, 'Sam added a new open match with Sara, Open app to view the contest', 'fan_notification', 0, '2021-01-22 02:47:05');
INSERT INTO `tb_notification` VALUES (1058, 7, 49, 'Your Invitation is accepted by Sara', 'match_reply', 179, '2021-01-22 02:47:05');
INSERT INTO `tb_notification` VALUES (1059, 49, 7, 'You have accepted Invitation from Sam', 'match_reply', 179, '2021-01-22 02:47:05');
INSERT INTO `tb_notification` VALUES (1060, 49, 7, 'Sara Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 186, '2021-01-22 03:11:29');
INSERT INTO `tb_notification` VALUES (1061, 7, 49, 'You have been Invited by Sam to have a Match of 1 hour duration', 'Match_invitation', 186, '2021-01-22 03:11:29');
INSERT INTO `tb_notification` VALUES (1062, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 03:40:46');
INSERT INTO `tb_notification` VALUES (1063, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 03:40:46');
INSERT INTO `tb_notification` VALUES (1064, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 03:40:46');
INSERT INTO `tb_notification` VALUES (1065, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 03:40:46');
INSERT INTO `tb_notification` VALUES (1066, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 03:40:46');
INSERT INTO `tb_notification` VALUES (1067, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 03:40:46');
INSERT INTO `tb_notification` VALUES (1068, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 03:40:46');
INSERT INTO `tb_notification` VALUES (1069, 2, 1, 'Raveena added a new open match with Akshay, Open app to view the contest', 'fan_notification', 0, '2021-01-22 03:40:46');
INSERT INTO `tb_notification` VALUES (1070, 2, 1, 'Your Invitation is accepted by Akshay', 'match_reply', 147, '2021-01-22 03:40:46');
INSERT INTO `tb_notification` VALUES (1071, 1, 2, 'You have accepted Invitation from Raveena', 'match_reply', 147, '2021-01-22 03:40:46');
INSERT INTO `tb_notification` VALUES (1072, 7, 49, 'Your Match with Sara is over', 'match_reply', 179, '2021-01-22 03:48:01');
INSERT INTO `tb_notification` VALUES (1073, 49, 7, 'Your Match with Sam is over', 'match_reply', 179, '2021-01-22 03:48:01');
INSERT INTO `tb_notification` VALUES (1074, 7, 1, 'Your Invitation is rejected by Akshay', 'match_reply', 177, '2021-01-22 07:36:28');
INSERT INTO `tb_notification` VALUES (1075, 1, 7, 'You have rejected Invitation from Sam', 'match_reply', 177, '2021-01-22 07:36:28');
INSERT INTO `tb_notification` VALUES (1076, 49, 7, 'Sara added a new open match with Sam, Open app to view the contest', 'fan_notification', 0, '2021-01-22 08:21:41');
INSERT INTO `tb_notification` VALUES (1077, 49, 7, 'Your Invitation is accepted by Sam', 'match_reply', 186, '2021-01-22 08:21:41');
INSERT INTO `tb_notification` VALUES (1078, 7, 49, 'You have accepted Invitation from Sara', 'match_reply', 186, '2021-01-22 08:21:41');
INSERT INTO `tb_notification` VALUES (1079, 49, 7, 'Your Match with Sam is over', 'match_reply', 186, '2021-01-22 09:22:01');
INSERT INTO `tb_notification` VALUES (1080, 7, 49, 'Your Match with Sara is over', 'match_reply', 186, '2021-01-22 09:22:01');
INSERT INTO `tb_notification` VALUES (1081, 2, 1, 'Your Match with Akshay is over', 'match_reply', 147, '2021-01-24 03:41:01');
INSERT INTO `tb_notification` VALUES (1082, 1, 2, 'Your Match with Raveena is over', 'match_reply', 147, '2021-01-24 03:41:01');
INSERT INTO `tb_notification` VALUES (1083, 49, 1, 'Sara Invited you from Basic Method list to have a Match of 1 hour duration', 'Match_invitation', 187, '2021-01-25 22:48:52');
INSERT INTO `tb_notification` VALUES (1084, 1, 49, 'You have been Invited by Akshay to have a Match of 1 hour duration', 'Match_invitation', 187, '2021-01-25 22:48:52');
INSERT INTO `tb_notification` VALUES (1085, 49, 1, 'Sara added you as squad', 'Add_Bestie', 71, '2021-01-25 23:22:13');
INSERT INTO `tb_notification` VALUES (1086, 1, 49, 'You have added Akshay to your squad list', 'Add_Bestie', 71, '2021-01-25 23:22:13');
INSERT INTO `tb_notification` VALUES (1087, 1, 2, 'test Invited you from Personalized list to have a Match of 3 hour duration', 'Match_invitation', 12, '2021-11-15 07:41:51');
INSERT INTO `tb_notification` VALUES (1088, 2, 1, 'user1@gmail.com Invited you from Personalized list to have a Match of 2 hour duration', 'Match_invitation', 13, '2021-11-15 09:20:48');

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tb_user` VALUES (2, 'user1@gmail.com', 'user1@gmail.com', '215654984', 'cXdlUVdFMTIzIUAj', '', '+234', NULL, NULL, NULL, 1, '2021-11-15 23:18:01', '', '', '2021-11-14 10:00:27', '2021-11-15 09:48:01');
INSERT INTO `tb_user` VALUES (3, 'user2@gmail.com', 'user2@gmail.com', '4565151321', 'cXdlUVdFMTIzIUAj', '', '+234', NULL, NULL, NULL, 1, NULL, '', '', '2021-11-15 09:48:28', '2021-11-15 09:48:28');
INSERT INTO `tb_user` VALUES (4, 'User 3', 'user3@gmail.com', '65483251321', 'cXdlUVdFMTIzIUAj', '', '+234', NULL, NULL, NULL, 1, NULL, '', '', '2021-11-15 09:49:04', '2021-11-15 09:49:04');
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
