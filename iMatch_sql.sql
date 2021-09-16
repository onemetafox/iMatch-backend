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

 Date: 16/09/2021 06:22:45
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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_answerlike
-- ----------------------------
INSERT INTO `tb_answerlike` VALUES (4, 1, 1, 'answer1', 'like', 0, '2020-11-05 08:29:36');
INSERT INTO `tb_answerlike` VALUES (5, 1, 1, 'answer2', 'dislike', 0, '2020-11-05 08:29:55');
INSERT INTO `tb_answerlike` VALUES (6, 36, 1, 'answer1', 'dislike', 0, '2020-11-08 22:46:52');
INSERT INTO `tb_answerlike` VALUES (7, 36, 1, 'answer2', 'dislike', 0, '2020-11-08 22:46:55');
INSERT INTO `tb_answerlike` VALUES (8, 38, 1, 'answer1', 'like', 0, '2020-11-10 00:47:06');
INSERT INTO `tb_answerlike` VALUES (9, 7, 1, 'answer1', 'like', 0, '2020-11-12 06:22:01');
INSERT INTO `tb_answerlike` VALUES (10, 7, 1, 'answer2', 'like', 0, '2020-11-12 06:22:03');
INSERT INTO `tb_answerlike` VALUES (11, 42, 1, 'answer1', 'like', 0, '2020-11-17 02:34:05');
INSERT INTO `tb_answerlike` VALUES (12, 42, 1, 'answer2', 'dislike', 0, '2020-11-17 02:38:20');
INSERT INTO `tb_answerlike` VALUES (13, 52, 1, 'answer1', 'like', 0, '2021-09-14 13:39:44');
INSERT INTO `tb_answerlike` VALUES (14, 52, 1, 'answer2', 'like', 0, '2021-09-14 13:39:45');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_bestie
-- ----------------------------
INSERT INTO `tb_bestie` VALUES (1, 1, 2, 'bestie', 0, 0, '2021-09-15 10:13:56');

-- ----------------------------
-- Table structure for tb_bestiecomment
-- ----------------------------
DROP TABLE IF EXISTS `tb_bestiecomment`;
CREATE TABLE `tb_bestiecomment`  (
  `id` int(11) NOT NULL,
  `bestie_id` int(11) NOT NULL,
  `is_active` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_bestielike
-- ----------------------------
DROP TABLE IF EXISTS `tb_bestielike`;
CREATE TABLE `tb_bestielike`  (
  `id` int(11) NOT NULL,
  `bestie_id` int(11) NOT NULL,
  `like_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
  `seen_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`matchid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_match
-- ----------------------------
INSERT INTO `tb_match` VALUES (1, 1, 1, NULL, NULL, 'Test of Personal match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-15 21:46:48', 'personal', NULL);
INSERT INTO `tb_match` VALUES (2, 1, 1, NULL, NULL, 'Second Personal match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-15 21:47:14', 'personal', NULL);
INSERT INTO `tb_match` VALUES (3, 1, 1, NULL, NULL, 'Third Personal Match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-15 21:48:03', 'personal', NULL);
INSERT INTO `tb_match` VALUES (4, 1, 1, NULL, NULL, 'Fourth Personal match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-15 21:48:52', 'personal', NULL);
INSERT INTO `tb_match` VALUES (5, 1, 1, NULL, NULL, 'Fifth Personal match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-15 21:49:21', 'personal', NULL);
INSERT INTO `tb_match` VALUES (6, 1, 1, NULL, NULL, 'Sixth Personal Match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-15 21:49:43', 'personal', NULL);
INSERT INTO `tb_match` VALUES (7, 1, 1, NULL, NULL, 'seventh personal match', NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-15 22:01:35', 'personal', NULL);
INSERT INTO `tb_match` VALUES (8, 1, 2, 'This is the Test of Open Match', '4 hour', 'Open Match', 'Personalized', NULL, 'accept', '2021-09-15 22:15:57', '2021-09-16 02:15:57', 1, '2021-09-15 09:55:00', NULL, NULL);

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
  `old_mupid` int(11) NULL DEFAULT NULL,
  `personal_matchid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`mup_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_matchupload
-- ----------------------------
INSERT INTO `tb_matchupload` VALUES (1, 1, 1, 'f23b9df46c5596a126ff634252a6c04a.jpg', 'file', '2021-09-15 21:46:48', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (2, 1, 1, '631642eff48ec83ad99394827e6c2200.jpg', 'file', '2021-09-15 21:46:48', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (3, 1, 2, '5d10b481779b8e685958daca76c4711d.jpg', 'file', '2021-09-15 21:47:14', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (4, 1, 2, 'ac9cb6e582a6e6fac0b43e052bd32c13.jpg', 'file', '2021-09-15 21:47:14', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (5, 1, 3, '7810481a2df1d7159753bdcbbc9a894e.jpg', 'file', '2021-09-15 21:48:03', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (6, 1, 3, '7dafcb3d11201a31137b73650236b9dc.jpg', 'file', '2021-09-15 21:48:03', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (7, 1, 4, 'e92f47ae6b31744b57048c8cf009daad.png', 'file', '2021-09-15 21:48:52', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (8, 1, 4, '341e2091fde7f69db83ab98c19b8f0d1.jpeg', 'file', '2021-09-15 21:48:52', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (9, 1, 5, '710b629af1dcc38058c0d87bce87c868.png', 'file', '2021-09-15 21:49:21', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (10, 1, 5, '88934910eafe0c3c5ed4d8e5aed939a7.jpg', 'file', '2021-09-15 21:49:21', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (11, 1, 6, '4fdb0945f0ba5938ce4aef64407e1ec3.webp', 'file', '2021-09-15 21:49:43', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (12, 1, 6, 'bb78501b252b8d56f5de61ca18a69665.png', 'file', '2021-09-15 21:49:43', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (13, 1, 7, 'https://wetransfer.com', 'link', '2021-09-15 22:01:35', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (14, 1, 7, 'https://google.com', 'link', '2021-09-15 22:01:35', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (15, 1, 8, 'https://translate.google.com/', 'link', '2021-09-15 22:10:49', NULL, NULL);
INSERT INTO `tb_matchupload` VALUES (16, 2, 8, 'https://www.google.com/', 'link', '2021-09-15 22:15:57', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_notification
-- ----------------------------
INSERT INTO `tb_notification` VALUES (1, 1, 2, 'James Coulter Invited you from Personalized list to have a Match of 4 hour duration', 'Match_invitation', 8, '2021-09-15 09:40:49');
INSERT INTO `tb_notification` VALUES (2, 2, 1, 'You have Invited User One from Personalized list to have a Match of 4 hour duration', 'Match_invitation', 8, '2021-09-15 09:40:49');
INSERT INTO `tb_notification` VALUES (3, 2, 1, 'Your Invitation is accepted by User One', 'match_reply', 8, '2021-09-15 09:45:57');
INSERT INTO `tb_notification` VALUES (4, 1, 2, 'You have accepted Invitation from James Coulter', 'match_reply', 8, '2021-09-15 09:45:57');
INSERT INTO `tb_notification` VALUES (5, 1, 2, 'James Coulter wants to add you as bestie', 'Add_bestie', 1, '2021-09-15 10:13:56');
INSERT INTO `tb_notification` VALUES (6, 2, 1, 'You have added User One to your bestie list', 'Add_to_bestie', 1, '2021-09-15 10:13:56');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_statusbar
-- ----------------------------
INSERT INTO `tb_statusbar` VALUES (1, 1, 'story', 'My mind is clear', 1, '2021-09-15 10:10:11');
INSERT INTO `tb_statusbar` VALUES (2, 1, 'slogan', 'This is my slogan', 1, '2021-09-15 10:13:13');
INSERT INTO `tb_statusbar` VALUES (3, 1, 'letter', 'This is my letter to my best friend', 1, '2021-09-15 10:13:27');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'James Coulter', 'jamesdcoulter1972@gmail.com', '14052838303', 'S01Ta21zMTk5NDAxMjg=', NULL, NULL, '', 'Male', NULL, 1, NULL, '', '', '2021-09-15 09:14:01', '2021-09-15 09:59:10');
INSERT INTO `tb_user` VALUES (2, 'User One', 'TestUserOne@gmail.com', '14052838303', 'S01Ta21zMTk5NDAxMjg=', '', '+234', NULL, NULL, NULL, 1, NULL, '', '', '2021-09-15 09:37:10', '2021-09-15 09:37:10');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
