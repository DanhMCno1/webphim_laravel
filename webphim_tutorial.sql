/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432
 Source Host           : 127.0.0.1:3306
 Source Schema         : webphim_tutorial

 Target Server Type    : MySQL
 Target Server Version : 100432
 File Encoding         : 65001

 Date: 12/05/2024 21:45:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `position` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (2, 'Phim bộ', 'series', 1, 'phim-bo', 2);
INSERT INTO `categories` VALUES (3, 'Anime', 'anime', 1, 'anime', 1);
INSERT INTO `categories` VALUES (4, 'Phim chiếu rạp', 'điện ảnh', 1, 'phim-chieu-rap', 0);
INSERT INTO `categories` VALUES (5, 'Phim sắp chiếu', 'Coming soon', 1, 'phim-sap-chieu', 0);

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES (2, 'Việt Nam', 'Phim Việt Nam chất lượng cao', 1, 'viet-nam');
INSERT INTO `countries` VALUES (3, 'Mỹ', 'Phim Mỹ cập nhật hàng ngày', 1, 'my');
INSERT INTO `countries` VALUES (4, 'Nhật Bản', 'Phim Nhật Bản cập nhật mỗi cuối tuần', 1, 'nhat-ban');
INSERT INTO `countries` VALUES (5, 'Hàn Quốc', 'korea', 1, 'han-quoc');
INSERT INTO `countries` VALUES (6, 'Trung Quốc', 'china', 1, 'trung-quoc');
INSERT INTO `countries` VALUES (7, 'Thái Lan', 'Thailand', 1, 'thai-lan');

-- ----------------------------
-- Table structure for episodes
-- ----------------------------
DROP TABLE IF EXISTS `episodes`;
CREATE TABLE `episodes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `linkphim` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `episode` int NOT NULL,
  `updated_at` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of episodes
-- ----------------------------
INSERT INTO `episodes` VALUES (7, 32, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/oA-BhGNK7qw?si=xosdKWgrjy2L2hnp\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 1, '2024-05-03 11:50:43', '2024-05-03 11:50:43');
INSERT INTO `episodes` VALUES (10, 20, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/miiLadou1cw?si=KqWdDZqyOojkOlCO\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 1, '2024-05-02 20:29:11', '2024-05-02 20:29:11');
INSERT INTO `episodes` VALUES (11, 20, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/YKnowHCkAA8?si=6bf9tFUHrOQk3kgx\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 2, '2024-05-02 20:59:26', '2024-05-02 20:59:26');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for genres
-- ----------------------------
DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of genres
-- ----------------------------
INSERT INTO `genres` VALUES (1, 'Hài hước', 'joke', 1, 'hai-huoc');
INSERT INTO `genres` VALUES (3, 'Hoạt hình', 'Vui vẻ , phiêu lưu', 1, 'hoat-hinh');
INSERT INTO `genres` VALUES (4, 'Tình cảm', 'love', 1, 'tinh-cam');
INSERT INTO `genres` VALUES (5, 'Hành động', 'action', 1, 'hanh-dong');
INSERT INTO `genres` VALUES (6, 'Kinh dị', 'dark', 1, 'kinh-di');
INSERT INTO `genres` VALUES (7, 'Viễn tưởng', 'fiction', 1, 'vien-tuong');
INSERT INTO `genres` VALUES (8, 'Siêu anh hùng', 'superman', 1, 'sieu-anh-hung');
INSERT INTO `genres` VALUES (9, 'Drama', 'drama', 1, 'drama');
INSERT INTO `genres` VALUES (10, 'Trinh thám', 'virgin', 1, 'trinh-tham');
INSERT INTO `genres` VALUES (11, 'Thần bí', 'magic', 1, 'than-bi');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- ----------------------------
-- Table structure for movie_genre
-- ----------------------------
DROP TABLE IF EXISTS `movie_genre`;
CREATE TABLE `movie_genre`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_genre
-- ----------------------------
INSERT INTO `movie_genre` VALUES (1, 9, 1);
INSERT INTO `movie_genre` VALUES (2, 9, 3);
INSERT INTO `movie_genre` VALUES (3, 9, 4);
INSERT INTO `movie_genre` VALUES (7, 12, 3);
INSERT INTO `movie_genre` VALUES (8, 12, 5);
INSERT INTO `movie_genre` VALUES (9, 37, 4);
INSERT INTO `movie_genre` VALUES (10, 37, 5);
INSERT INTO `movie_genre` VALUES (11, 37, 9);
INSERT INTO `movie_genre` VALUES (12, 9, 5);
INSERT INTO `movie_genre` VALUES (13, 12, 4);
INSERT INTO `movie_genre` VALUES (14, 36, 4);
INSERT INTO `movie_genre` VALUES (15, 36, 5);
INSERT INTO `movie_genre` VALUES (16, 36, 9);
INSERT INTO `movie_genre` VALUES (17, 35, 5);
INSERT INTO `movie_genre` VALUES (18, 35, 6);
INSERT INTO `movie_genre` VALUES (19, 35, 9);
INSERT INTO `movie_genre` VALUES (20, 34, 5);
INSERT INTO `movie_genre` VALUES (21, 34, 7);
INSERT INTO `movie_genre` VALUES (22, 34, 8);
INSERT INTO `movie_genre` VALUES (23, 33, 1);
INSERT INTO `movie_genre` VALUES (24, 33, 4);
INSERT INTO `movie_genre` VALUES (25, 34, 6);
INSERT INTO `movie_genre` VALUES (26, 32, 1);
INSERT INTO `movie_genre` VALUES (27, 32, 4);
INSERT INTO `movie_genre` VALUES (28, 32, 9);
INSERT INTO `movie_genre` VALUES (29, 31, 1);
INSERT INTO `movie_genre` VALUES (30, 31, 4);
INSERT INTO `movie_genre` VALUES (31, 30, 1);
INSERT INTO `movie_genre` VALUES (32, 30, 4);
INSERT INTO `movie_genre` VALUES (33, 13, 3);
INSERT INTO `movie_genre` VALUES (34, 13, 5);
INSERT INTO `movie_genre` VALUES (35, 13, 9);
INSERT INTO `movie_genre` VALUES (36, 29, 6);
INSERT INTO `movie_genre` VALUES (37, 29, 7);
INSERT INTO `movie_genre` VALUES (38, 29, 8);
INSERT INTO `movie_genre` VALUES (39, 29, 9);
INSERT INTO `movie_genre` VALUES (40, 14, 3);
INSERT INTO `movie_genre` VALUES (41, 14, 5);
INSERT INTO `movie_genre` VALUES (42, 14, 8);
INSERT INTO `movie_genre` VALUES (43, 15, 1);
INSERT INTO `movie_genre` VALUES (44, 15, 3);
INSERT INTO `movie_genre` VALUES (45, 15, 4);
INSERT INTO `movie_genre` VALUES (46, 15, 9);
INSERT INTO `movie_genre` VALUES (47, 16, 1);
INSERT INTO `movie_genre` VALUES (48, 16, 3);
INSERT INTO `movie_genre` VALUES (49, 16, 4);
INSERT INTO `movie_genre` VALUES (50, 17, 1);
INSERT INTO `movie_genre` VALUES (51, 17, 3);
INSERT INTO `movie_genre` VALUES (52, 17, 5);
INSERT INTO `movie_genre` VALUES (53, 17, 11);
INSERT INTO `movie_genre` VALUES (54, 18, 1);
INSERT INTO `movie_genre` VALUES (55, 18, 3);
INSERT INTO `movie_genre` VALUES (56, 18, 5);
INSERT INTO `movie_genre` VALUES (57, 18, 8);
INSERT INTO `movie_genre` VALUES (58, 19, 3);
INSERT INTO `movie_genre` VALUES (59, 19, 5);
INSERT INTO `movie_genre` VALUES (60, 19, 7);
INSERT INTO `movie_genre` VALUES (61, 19, 9);
INSERT INTO `movie_genre` VALUES (62, 19, 10);
INSERT INTO `movie_genre` VALUES (63, 20, 3);
INSERT INTO `movie_genre` VALUES (64, 20, 5);
INSERT INTO `movie_genre` VALUES (65, 20, 6);
INSERT INTO `movie_genre` VALUES (66, 20, 11);
INSERT INTO `movie_genre` VALUES (67, 21, 3);
INSERT INTO `movie_genre` VALUES (68, 21, 5);
INSERT INTO `movie_genre` VALUES (69, 21, 6);
INSERT INTO `movie_genre` VALUES (70, 21, 11);
INSERT INTO `movie_genre` VALUES (71, 22, 3);
INSERT INTO `movie_genre` VALUES (72, 22, 4);
INSERT INTO `movie_genre` VALUES (73, 22, 11);
INSERT INTO `movie_genre` VALUES (74, 23, 1);
INSERT INTO `movie_genre` VALUES (75, 23, 4);
INSERT INTO `movie_genre` VALUES (76, 24, 1);
INSERT INTO `movie_genre` VALUES (77, 24, 5);
INSERT INTO `movie_genre` VALUES (78, 24, 8);
INSERT INTO `movie_genre` VALUES (79, 25, 5);
INSERT INTO `movie_genre` VALUES (80, 26, 5);
INSERT INTO `movie_genre` VALUES (81, 26, 7);
INSERT INTO `movie_genre` VALUES (82, 27, 5);
INSERT INTO `movie_genre` VALUES (83, 27, 6);
INSERT INTO `movie_genre` VALUES (84, 28, 9);
INSERT INTO `movie_genre` VALUES (85, 28, 10);

-- ----------------------------
-- Table structure for movies
-- ----------------------------
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trailer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `category_id` int NOT NULL,
  `genre_id` int NOT NULL,
  `country_id` int NOT NULL,
  `phim_hot` int NOT NULL,
  `resolution` int NOT NULL DEFAULT 0,
  `name_eng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phude` int NOT NULL DEFAULT 0,
  `ngaytao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ngaycapnhat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thoiluong` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sotap` int NOT NULL DEFAULT 1,
  `topview` int NULL DEFAULT NULL,
  `season` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movies
-- ----------------------------
INSERT INTO `movies` VALUES (9, 'Đảo Hải Tặc', 'dao-hai-tac', 'Monkey D. Luffy, 1 cậu bé rất thích Đảo hải tặc có ước mơ tìm được kho báu One Piece và trở thành Vua hải tặc - Pirate King. Lúc nhỏ, Luffy tình cờ ăn phải trái quỉ (Devil Fruit) Gomu Gomu, nó cho cơ thể cậu khả năng co dãn đàn hồi như cao su nhưng đổi lại cậu sẽ không bao giờ biết bơi. Sau đó Luffy lại được Shank cứu thoát tuy nhiên ông ta bị mất 1 cánh tay. Sau đấy Shank chia tay Luffy và để lại cho cậu cái mũ rơm (Straw Hat) và nói rằng: Sau này bao giờ thành cướp biển hãy gặp ta và trả lại nó. Chính lời nói này đã thúc đầy Luffy trở thành 1 cướp biển thật sự.Hãy cùng theo dõi xem liệu Luffy có thể trở thành đạt được kho báu One Piece và trở thành Vua Hải Tặc không nhé.', 1, 'one-piece4223.jpg', 'MCb13lbVGE0', 3, 5, 4, 0, 0, 'One Piece', 0, '0', '2024-05-01 16:22:25', '25 phút/ tập', 1103, NULL, NULL);
INSERT INTO `movies` VALUES (12, 'Naruto-Truyền nhân cửu vỹ hồ', 'naruto-truyen-nhan-cuu-vy-ho', 'Phần đầu trong hai loạt phim hoạt hình được sản xuất bởi Studio Pierrot và Aniplex đã công chiếu khắp Nhật Bản trên mạng lưới truyền hình TV Tokyo và mạng lưới hoạt hình truyền hình vệ tinh Animax vào ngày 3 tháng 10 năm 2002. Phần đầu tiên kéo dài trong 9 mùa 12 năm trước, hồ ly 9 đuôi tấn công làng ninja Mộc Diệp, Hokage Đệ Tứ đã đánh bại và phong ấn vào cậu bé Naruto.Từ đó, Naruto bị mọi người xa lánh, vậy nên cậu tìm ra cách được thừa nhận và chú ý duy nhất – qua các trò phá phách và nghịch ngợm.Câu chuyện chính bám theo sự trưởng thành và tiến bộ của Naruto và bạn cậu khi làm ninja, và nhấn mạnh mối quan hệ giữa họ và sự ảnh hưởng của quá khứ đến tính cách họ. Naruto tìm được hai người bạn đồng hành cùng là Uchiha Sasuke và Haruno Sakura, cuộc phiêu lưu bắt đầu.', 1, 'naruto8264.jpg', 'QczGoCmX-pI', 2, 5, 4, 0, 0, 'Naruto', 0, '0', '2024-05-01 16:24:16', '25 phút/ tập', 500, NULL, NULL);
INSERT INTO `movies` VALUES (13, 'Thám Tử Lừng Danh Conan', 'tham-tu-lung-danh-conan', 'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên \"Miền Nhiệt đới\" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX 4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học. Theo lời khuyên của Tiến sĩ Hiroshi Agasa, Shinichi đã che giấu tung tích, để tránh việc Tổ chức Áo đen có thể phát hiện ra rằng cậu vẫn còn sống. Khi Ran hỏi tên cậu, Shinichi đã ghép \"Conan\" trong tên của Sir Arthur Conan Doyle và \"Edogawa\" trong tên của Edogawa Rampo, buột miệng nói ra tên mình là \"Conan Edogawa\". Tiến sĩ Agasa đã nói Conan là một người cháu của mình, nhưng hiện ông đang quá bận rộn không thể chăm sóc cho chú bé nên đã nhờ Ran trông nom Conan giúp mình. Ran nhận lời và từ đó Conan sống tại nhà của Ran tức văn phòng thám tử Mori, vừa che giấu thân phận vừa điều tra tung tích của Tổ chức Áo đen và tìm kiếm thuốc giải độc.', 1, 'conan8944.jpg', 'CVzIBHlH7Ec', 3, 9, 2, 0, 0, 'Detective Conan, Case Closed, Meitantei Conan', 0, '0', '2024-05-01 16:29:49', '25 phút/ tập', 1121, NULL, NULL);
INSERT INTO `movies` VALUES (14, 'Ninja Kamui', 'ninja-kamui', 'Joe Higan là một Nukenin - một cựu ninja đã trốn thoát khỏi gia tộc của mình và đang trốn tránh quá khứ bạo lực của mình ở vùng nông thôn nước Mỹ cùng gia đình. Một đêm nọ, anh bị phục kích bởi một nhóm sát thủ từ tổ chức cũ của anh, những kẻ đã gây ra một quả báo đẫm máu đối với Joe và gia đình anh vì đã phản bội mật mã cổ xưa của họ. Thoát khỏi cái chết dường như của mình, Joe sẽ tái xuất với tư cách là con người cũ của mình - Ninja Kamui - để trả thù cho gia đình và bạn bè. Kamui là một ninja của thế kỷ 21, một kẻ lỗi thời trong bóng tối, người sử dụng các kỹ năng cổ xưa của mình để chống lại vũ khí công nghệ cao với sự khéo léo tàn bạo. Anh ta phải đối đầu với những sát thủ được huấn luyện, chiến đấu với người máy và các ninja đối thủ để hạ bệ chính gia tộc đã tạo ra anh ta.', 1, 'ninja-kamui5926.jpg', 'phzYW8uo6JM', 3, 8, 4, 1, 4, 'Ninja Kamui', 0, '0', '2024-05-01 16:32:44', '25 phút/ tập', 12, NULL, NULL);
INSERT INTO `movies` VALUES (15, 'Dược sư tự sự', 'duoc-su-tu-su', 'Có một quốc gia rộng lớn nào đó ở vùng đồng bằng trung tâm của đại lục. Trong triều đình của hoàng đế của quốc gia đó, có một người thiếu nữ. Tên của thiếu nữ đó là Maomao, một dược sĩ từ khu đèn đỏ, hiện đang làm cung nữ trong Nội cung. Người thiếu nữ, người chắc chắn không được coi là một cô gái đẹp, đang giữ mình chờ đợi cho đến khi kỳ hạn của mình kết thúc. Nàng tự tin rằng mình sẽ không được hoàng đế \"viếng thăm\". Trong thời gian đó, cô biết về cuộc đời ngắn ngủi của những đứa con của hoàng đế. Maomao, nghe nói rằng hai đứa trẻ còn sống sót đang trong tình trạng nguy kịch, bắt đầu cuộc điều tra của mình để tìm ra nguyên nhân. Lấy bối cảnh ở thời trung cổ của phương Đông, cô gái thử độc tiếp tục lần lượt giải quyết các vụ án khó khăn trong triều đình.', 1, 'dsts9323.jpg', 'kn_nZ3_M1s8', 3, 9, 4, 1, 4, 'Kusuriya no Hitorigoto, The Apothecary Diaries, Drugstore Soliloquy', 0, '0', '2024-05-01 16:33:08', '25 phút/ tâp', 24, NULL, NULL);
INSERT INTO `movies` VALUES (16, 'Grand Blue', 'grand-blue', 'Grand Blue xoay quanh Kitahara Iori, một nam sinh vừa đậu vào trường đại học ở thành phố biển xinh đẹp Izu. Những tưởng sẽ được tận hưởng cuộc sống đại học an nhàn, Iori bị buộc phải tham gia một câu lạc bộ bơi lặn, gặp gỡ những cô gái xinh đẹp và những tên “đực rựa” nổi loạn bất kham. Cũng từ đó, cuộc sống mới của Iori chính thức bắt đầu.', 1, 'grand-blue6190.jpg', 'YILULCpNg9U', 3, 4, 4, 0, 0, 'ぐらんぶる', 0, '0', '2024-05-01 16:33:26', '25 phút/ tập', 12, NULL, NULL);
INSERT INTO `movies` VALUES (17, 'Mashle', 'mashle', 'Ngày xửa ngày xưa, có một thế giới nơi phép thuật có thể chi phối mọi thứ. Nhưng sâu trong rừng có một thanh niên dành thời gian để luyện tập cơ bắp. Mặc dù không thể sử dụng phép thuật, nhưng cậu ta có một cuộc sống yên bình với cha mình. Rồi một ngày, cuộc sống của cậu gặp nguy hiểm! Cơ thể của Saitama sẽ bảo vệ cậu ta khỏi những pháp sư? Cơ bắp được luyện tập của cậu có thể sánh vai với các pháp sư ưu tú...? Câu chuyện về Saitama ở Hogwarts bắt đầu!', 1, 'mashle5231.jpg', '_ce5_P1Hj5A', 3, 1, 4, 0, 0, 'Mashle: Magic and Muscles', 0, '0', '2024-05-01 16:33:51', '25 phút/ tập', 24, NULL, NULL);
INSERT INTO `movies` VALUES (18, 'Thánh phồng tôm - One Punch Man', 'thanh-phong-tom-one-punch-man', 'Câu chuyện diễn ra tại thành phố Z của Nhật Bản tại thời điểm thế giới đầy những quái vật bí ẩn với sức mạnh ghê ghớm đã xuất hiện và gây ra biết bao nhiêu thảm họa. Nhưng cũng chính tại đây xuất hiện 1 siêu anh hùng đấm phát chết luôn, có thể dễ dàng đánh bại và tiêu diệt những con quái vật này. Cũng chính vì tài năng hiếm có này mà có rất nhiều nghi ngại về khả năng thực sự của vị siêu anh hùng, thậm chí anh không bao giờ nhận được bất kỳ lòng tin nào từ dân chúng. Câu chuyện sẽ tiếp diễn như thế nào? Mời các bạn theo dõi anime One Punch Man để cùng tham gia vào những cuộc phưu lưu của Saitama, vị anh hùng với sức mạnh không tưởng nhé. Tập 1 và 2 sẽ được giới thiệu tại một buổi chiếu tại Trung tâm Văn hóa thành phố Saitama (Small Hall) vào ngày 06 tháng 9, 2015. phát sóng đầy đủ chính thức sẽ bắt đầu vào ngày 05 tháng 10 2015.', 1, 'OPM2942.jpg', 'Poo5lqoWSGw', 3, 8, 4, 0, 0, 'One Punch Man', 0, '0', '2024-05-01 16:34:12', '25 phút/ tập', 24, NULL, NULL);
INSERT INTO `movies` VALUES (19, 'Đại Chiến Titan', 'dai-chien-titan', 'Eren Jaeger sống trong một thành phố bao bọc bởi tường đá. Titan giết người ở ngoài đó. Trong nhiều thập kỉ, thành viên của Nhóm trinh thám Legion là những con người duy nhất dám bước ra khỏi bức tường và thu thập thông tin về những Titan. Eren, một người yêu hòa bình, không còn nguyện vọng nào to lớn việc gia nhập họ.', 1, 'ato7187.jpg', 'LV-nazLVmgo', 3, 1, 4, 0, 0, 'Shingeki no Kyojin, AoT, Attack on Titan', 0, '0', '2024-05-01 16:34:38', '25 phút/ tập', 24, NULL, NULL);
INSERT INTO `movies` VALUES (20, 'Chú thuật hồi chiến', 'chu-thuat-hoi-chien', 'Trong một thế giới nơi những con quỷ ăn thịt người không nghi ngờ gì, những mảnh vỡ của con quỷ huyền thoại và đáng sợ Ryoumen Sukuna đã bị thất lạc và nằm rải rác. Nếu bất kỳ con quỷ nào tiêu thụ các bộ phận cơ thể của Sukuna, sức mạnh mà chúng có được có thể phá hủy thế giới như chúng ta đã biết. May mắn thay, có một ngôi trường bí ẩn của các Phù thủy Jujutsu tồn tại để bảo vệ sự tồn tại bấp bênh của người sống khỏi xác sống!Yuuji Itadori là một học sinh trung học dành cả ngày để thăm ông nội nằm liệt giường của mình. Mặc dù anh ấy trông giống như một thiếu niên bình thường của bạn, nhưng sức mạnh thể chất to lớn của anh ấy là một điều đáng chú ý! Mọi câu lạc bộ thể thao đều muốn cậu tham gia, nhưng Itadori thà đi chơi với những đứa trẻ bị trường ruồng bỏ trong Câu lạc bộ huyền bí. Một ngày nọ, câu lạc bộ quản lý để có được bàn tay của họ trên một vật thể bị nguyền rủa bị phong ấn, nhưng họ ít biết nỗi kinh hoàng mà họ sẽ gây ra khi phá vỡ phong ấn ...', 1, 'jskaisen7659.jpg', 'f7R6NA4Yo00', 3, 1, 4, 1, 0, 'Jujutsu Kaisen', 0, '0', '2024-05-01 16:35:09', '25 phút/ tập', 24, NULL, NULL);
INSERT INTO `movies` VALUES (21, 'Chú thuật hồi chiến - Mùa 2', 'chu-thuat-hoi-chien-mua-2', 'Jujutsu Kaisen mùa 2 sẽ tập trung vào thời kỳ Gojo Satoru còn là học sinh của trường Cao đẳng Chú thuật Tokyo, khám phá mối quan hệ của anh với Geto Suguru - nhân vật phản diện chính trong phiên bản điện ảnh và phần đầu của anime. Phim cũng giải thích tại sao Gojo là chú thuật sư mạnh nhất của thế hệ này và là mối đe dọa với những linh hồn bị nguyền rủa đang tìm cách hồi sinh Sukuna. Một nhân vật đặc biệt không kém cũng xuất hiện trong phần 2 là Fushiguro Toji - cha của Fushiguro Megumi - cũng là kẻ thù của Gojo Satoru.', 1, 'jjskaisen2nd3131.jpg', 'Pm-wNmS9RGI', 3, 1, 4, 1, 0, 'Jujutsu Kaisen 2nd season', 0, '0', '2024-05-01 16:35:34', '25 phút/ tập', 16, NULL, NULL);
INSERT INTO `movies` VALUES (22, 'Tên cậu là gì ?', 'ten-cau-la-gi', 'Mitsuha là một cô bé học sinh cấp 3 sống tại một vùng nông thôn nằm rúc sâu trong núi. Cha cô là thị trưởng và rất ít khi ở nhà, bản thân cô sống với đứa em gái đang học tiểu học và bà nội. Mitsuha là một cô bé trung thực, nhưng cô không hề thích truyền thống thờ đạo Shinto của gia đình mình, cũng như việc bố cô đang tham gia một chiến dịch tranh cử. Cô than rằng mình sống ở một thị trấn nông thôn chật hẹp, ao ước phong cách sống diệu kỳ của Tokyo. Taki là một cậu học sinh cấp 3 sống tại trung tâm Tokyo. Cậu dành thời gian với bạn bè, làm bán thời gian tại một nhà hàng Ý, và có hứng thú với kiến trúc với mỹ thuật. Vào một ngày, Mitsuha nằm mơ thấy một cậu trai trẻ. Taki cũng nằm mơ thấy một người con gái sống tại một thị trấn hẻo lánh giữa những dãy núi mà cậu chưa đặt chân tới. Bí mật về những trải nhiệm cá nhân trong giấc mơ của họ là gì?', 1, 'yourname133.jpg', '_mifHzxFNQ4', 4, 1, 4, 1, 0, 'Your Name , Kimi no Na wa', 0, '0', '2024-05-01 16:36:05', '90 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (23, 'Yêu lại vợ ngầu', 'yeu-lai-vo-ngau', 'Yêu Lại Vợ Ngầu – Love Reset (2023) kể về cặp vợ chồng trẻ No Jung Yeol (Kang Ha-neul) và Hong Na Ra (Jung So-min) từ cuộc sống hôn nhân màu hồng dần “hiện nguyên hình” trở thành cái gai trong mắt đối phương với vô vàn thói hư, tật xấu. Không thể đi đến tiếng nói chung, Jung Yeol và Na Ra quyết định ra toà ly dị.\r\n\r\nTuy nhiên, họ phải chờ 30 ngày cho đến khi mọi thủ tục chính thức được hoàn tất. Trong khoảng thời gian này, một vụ tai nạn xảy ra khiến cả hai mất đi ký ức và không nhớ người kia là ai. Từ thời gian 30 ngày chờ đợi để được “đường ai nấy đi”, tình huống trớ trêu khiến cả hai bắt đầu nảy sinh tình cảm trở lại. Liệu khi nhớ ra mọi thứ, họ vẫn sẽ ký tên vào tờ giấy ly hôn?', 1, 'Yeu-Lai-Vo-Ngau7748.jpg', 'wWSzkkoeolE', 4, 4, 7, 0, 0, 'Love reset', 0, '0', '2024-05-01 16:36:28', '85 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (24, 'Siêu nhân cuồng phong - kỉ niệm 20 năm', 'sieu-nhan-cuong-phong-ki-niem-20-nam', 'Siêu Nhân Cuồng Phong Kỷ Niệm 20 Năm – Hurricaneger: 20 Years After (2023)\r\nSiêu Nhân Cuồng Phong Kỷ Niệm 20 Năm – Hurricaneger: 20 Years After (2023) lấy bối cảnh ở thời Edo. Vì một lý do chưa rõ, 5 chiến binh quen thuộc của chúng ta đã bị đưa về thời kỳ này. Tại đây, họ sẽ cùng với 5 tổ tiên của mình để chống lại bè lũ phản diện Oilanda và Aunja với mục tiêu giành lại viên đá Tensho – báu vật có sức mạnh hủy diệt thế giới.', 1, 'Sieu-nhan-cuong-phong-ky-niem-20-nam2216.jpg', 'pS1Huh2nGDo', 4, 8, 4, 0, 0, 'Ninpu Sentai Hurricaneger: 20 Years After 2023', 0, '0', '2024-05-01 16:38:26', '75 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (25, 'John Wick - Phần 4', 'john-wick-phan-4', 'John Wick: Phần 4 – John Wick: Chapter 4 là câu chuyện của John Wick (Keanu Reeves) đã khám phá ra con đường để đánh bại High Table. Nhưng trước khi có thể kiếm được tự do, Wick phải đối đầu với kẻ thù mới với những liên minh hùng mạnh trên toàn cầu và những lực lượng biến những người bạn cũ thành kẻ thù.', 1, 'John-Wick-46618.jpg', 'qEVUtrk8_B4', 4, 5, 3, 1, 0, 'John Wick chapter 4', 0, '0', '2024-05-01 16:38:05', '110 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (26, 'Godzilla Đại Chiến Kong', 'godzilla-dai-chien-kong', 'Godzilla Đại Chiến Kong – Godzilla vs. Kong (2021) khi hai kẻ thù truyền kiếp gặp nhau trong một trận chiến ngoạn mục, số phận của cả thế giới vẫn còn bị bỏ ngỏ…\r\n\r\nBị đưa khỏi Đảo Đầu Lâu, Kong cùng Jia, một cô bé mồ côi có mối liên kết mạnh mẽ với mình và đội bảo vệ đặc biệt hướng về mái nhà mới. Bất ngờ, nhóm đụng độ phải Godzilla hùng mạnh, tạo ra một làn sóng hủy diệt trên toàn cầu. Thực chất, cuộc chiến giữa hai kẻ khổng lồ dưới sự thao túng của các thế lực vô hình mới chỉ là điểm khởi đầu để khám phá những bí ẩn nằm sâu trong tâm Trái đất.', 1, 'Godzilla-Dai-Chien-Kong9356.jpg', 'odM92ap8_c0', 4, 7, 3, 0, 0, 'Godzilla vs Kong', 0, '0', '2024-05-01 16:37:45', '120 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (27, 'Gấu Pooh: Máu Và Mật', 'gau-pooh-mau-va-mat', 'Tóm tắt\r\nGấu Pooh: Máu Và Mật – Winnie the Pooh: Blood and Honey (2023) những ngày phiêu lưu và vui vẻ đã kết thúc, khi Christopher Robin, giờ là một chàng trai trẻ, đã để lại Gấu Pooh và Piglet phía sau cho chúng tự lo liệu. Thời gian trôi qua, cảm thấy tức giận và bị bỏ rơi, cả hai dần trở nên hoang dã và thèm khát thức ăn. Và khi Christopher trở lại cũng là lúc cơn thịnh nộ của những sinh vật này bắt đầu.', 1, 'Winnie-the-Pooh-Blood-and-Honey5440.jpg', 'W3E74j_xFtg', 4, 6, 3, 0, 0, 'Winnie the Pooh: Blood and Honey 2023', 0, '0', '2024-05-01 16:38:57', '85 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (28, 'Dạ Điểu', 'da-dieu', 'Dạ Điểu – The Night Owl (2022) Kyung Soo là một danh y mù có kỹ năng châm cứu xuất sắc. Anh được tiến cử vào cung và vô tình vướng vào cái chết của thế tử So Hyun. Những thế lực tàn ác muốn lợi dụng đôi mắt mù lòa của anh, nhưng nào biết khi bóng tối bao trùm, đôi mắt đó lại trở nên sáng rõ.', 1, 'Da-Dieu1186.jpg', 'fEeXWCs3xs8', 4, 1, 5, 0, 0, 'The Night Owl 2022', 0, '0', '2024-05-01 16:39:27', '85 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (29, 'Gã hề', 'ga-he', 'Bộ phim lấy bối cảnh của năm 1981, với sự xuất hiện của nhân vật Arthur Fleck, anh sống cùng mẹ mình trong ngôi nhà xập xệ và phải kiếm sống qua ngày bằng việc đóng vai những chú hề. Tuy nhiên, do mắc phải căn bệnh liên quan đến thần kinh, đồng thời cuộc sống trớ trêu khiến anh gặp phải toàn điều xui xẻo, vì vậy khiến anh mất đi niềm tin trong cuộc sống cũng như đối với những người xung quanh.\r\n\r\nSau nhiều lần trải qua những chấn động tâm lý anh bỗng nhiên trở nên cuồng dại và thành một tên tội phạm với cái tên Joker', 1, 'Joker_(phim_2019)_poster188.jpg', 'xy8aJw1vYHo', 4, 9, 3, 0, 0, 'Joker', 0, '0', '2024-05-01 16:32:00', '90 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (30, 'Cua lại Vợ Bầu', 'cua-lai-vo-bau', 'Trọng Thoại và Nhã Linh yêu nhau đã được bảy năm. Những lỗi lầm nho nhỏ bắt đầu tích tụ thành mâu thuẫn cực lớn đẩy cả hai xa nhau. Lại thêm sự xuất hiện của người cũ Quý Khánh càng khiến Nhã Linh xao lòng. Và rồi, cô có thai. Rốt cuộc đứa bé là của ai và Nhã Linh sẽ chọn người đàn ông nào đi tiếp cùng mình? \r\n\r\nSở hữu dàn diễn viên được đông đảo công chúng biết đến- kết hợp thế hệ diễn viên trẻ và các bậc lão làng kỳ cựu, cộng thêm kịch bản vui tươi nhưng chẳng kém phần cảm động, Cua Lại Vợ Bầu là điển hình cho công thức thành công gần như 100% của phim Việt mùa Tết.', 1, 'cualaivobau5010.jpg', 'QUTwAJe4EOQ', 4, 4, 2, 1, 0, 'Cua lại Vợ Bầu', 0, '0', '2024-05-01 16:28:58', '100 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (31, 'MAI', 'mai', 'Mai 2024 MAI xoay quanh câu chuyện về cuộc đời của một người phụ nữ cùng tên với bộ phim. Trên First-look Poster, Phương Anh Đào tạo ấn tượng mạnh với cái nhìn tĩnh lặng, xuyên thấu, đặc biệt, trên bờ môi nữ diễn viên là hình ảnh cô đang nằm nghiêng trên mặt nước. Được phủ một màn sương mờ ảo, poster đậm chất nghệ thuật của Mai gây tò mò với lời tựa: “Quá khứ chưa ngủ yên, ngày mai liệu sẽ đến?”.', 1, 'mai942.jpg', 'EX6clvId19s', 4, 4, 2, 1, 0, 'MAI', 0, '0', '2024-05-01 16:28:07', '120 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (32, 'Bố già', 'bo-gia', 'Ông Tư – một tài xế xe ôm quần quật làm việc qua ngày để chăm lo cho gia đình của mình. Mặc dù khá bảo thủ, nóng nảy, thường xuyên quát tháo nhưng thực chất ông Tư lại là một người rất giàu lòng yêu thương – không chỉ với người thân mà còn có hàng xóm, bạn bè xung quanh và thậm chí là cả những người xa lạ.\r\n\r\nĐánh giá về thành công của Bố Già, bên cạnh diễn xuất hiệu quả của dàn diễn viên, điểm cộng của phim còn được quyết định bởi nội dung gần gũi, vừa cảm động mà cũng không thiếu những tình huống hài hước. Tuy vậy, đến cuối cùng, cái kết của tác phẩm lại gây ra tranh cãi vì nhiều khán giả cho rằng nó chưa thực sự hợp lý và còn thiếu cao trào. Liệu Bố Già bản điện ảnh có khắc phục được điều này?', 1, 'bo-gia178.jpg', 'jluSu8Rw6YE', 4, 9, 2, 1, 0, 'Older Father', 0, '0', '2024-05-01 16:27:41', '130 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (33, 'Yêu Nhầm Bạn Thân', 'yeu-nham-ban-than', 'Phim \"Friend Zone\" (Yêu Nhầm Bạn Thân) tập trung vào một mối tình đơn phương của Palm, một tiếp viên hàng không. Từ khi còn ngồi trên ghế nhà trường, anh đã đam mê yêu Gink, nhưng sau đó quyết định giữ mối quan hệ bạn bè thân thiết. Trải qua 10 năm, cả hai trưởng thành nhưng vẫn duy trì một mối quan hệ bạn thân giữa nam và nữ. Khi một trong hai gặp khó khăn trong mối quan hệ tình yêu, người kia luôn xuất hiện để giúp đỡ và cứu vãn tình huống.', 1, 'yeu-nham-ban-than5972.jpg', 'LHzwwYcrKks', 4, 4, 7, 0, 0, 'Friendzone', 0, '0', '2024-05-01 16:26:48', '95 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (34, 'Quái nhân Deadpool', 'quai-nhan-deadpool', 'Quái Nhân Deadpool Deadpool 2016 Full HD Vietsub Thuyết Minh Deadpool, Deadpool 2016 Phim Deadpool xoay quanh Wade Wilson, một người mắc bệnh ung thư nan y, từng thử nghiệm để trở thành dị nhân với khả năng hồi phục siêu nhanh như Wolverine, nhưng Deadpool lại có rất nhiều fan hâm mộ. Được người hâm mộ biết đến như một nhân vật cực kỳ hài hước với cái miệng không ngớt lải nhải.', 1, 'deadpool4253.jpg', 'ONHBaC-pfsk', 4, 8, 3, 1, 4, 'Deadpool', 0, '0', '2024-05-01 16:27:14', '115 phút', 1, NULL, NULL);
INSERT INTO `movies` VALUES (35, 'Trò Chơi Con Mực', 'tro-choi-con-muc', 'Squid Game (Trò Chơi Con Mực) là một bộ phim truyền hình Hàn Quốc năm 2021 do Hwang Dong-hyuk viết kịch bản và đạo diễn. Bộ phim kể về một nhóm 456 người chơi tham gia vào một trò chơi sinh tử để giành được giải thưởng 45,6 tỷ won. Các trò chơi dựa trên những trò chơi dân gian của Hàn Quốc và nếu người chơi thua, họ sẽ bị giết.Bộ phim bắt đầu với nhân vật Gi-hun, một người đàn ông gặp khó khăn về tài chính. Anh ta nhận được một lời mời tham gia vào một trò chơi sinh tồn bí ẩn và quyết định tham gia để có cơ hội kiếm tiền. Khi đến nơi, anh ta gặp những người chơi khác, tất cả đều có hoàn cảnh khó khăn như anh ta.Các trò chơi bắt đầu và người chơi nhanh chóng nhận ra rằng đây không phải là một trò chơi bình thường. Các trò chơi nguy hiểm và bạo lực, và người chơi phải chiến đấu để sống sót. Khi trò chơi tiếp tục, người chơi phải đối mặt với những lựa chọn khó khăn và họ phải quyết định liệu họ sẽ sẵn sàng hy sinh bản thân để giành được giải thưởng hay không.Squid Game là một bộ phim hấp dẫn và hồi hộp, với nhiều tình tiết bất ngờ. Bộ phim đã nhận được nhiều lời khen ngợi từ giới phê bình và khán giả, và đã trở thành một trong những bộ phim truyền hình Hàn Quốc thành công nhất mọi thời đại.', 1, 'squid-game4622.jpg', 'oqxAJKy0ii4', 2, 9, 5, 1, 0, 'Squid Game', 0, '0', '2024-05-01 16:25:42', '45 phút/ tập', 8, NULL, NULL);
INSERT INTO `movies` VALUES (36, 'Tầng lớp Iteawon', 'tang-lop-iteawon', 'Tại một khu phố nhộn nhịp của Seoul, một cựu tù nhân và bạn bè mình chiến đấu với đối thủ khó nhằn để biến tham vọng quán bar đường phố của họ thành hiện thực.', 1, 'tang-lop-itaewon3019.jpg', 'NeaHNQJ1kCo', 2, 9, 5, 0, 0, 'Iteawon Class', 0, '0', '2024-05-01 16:25:10', '45 phút/ tập', 16, NULL, NULL);
INSERT INTO `movies` VALUES (37, 'Phi Vụ Triệu Đô', 'phi-vu-trieu-do', 'Phi Vụ Triệu Đô kể về bao mạng sống rơi vào hiểm cảnh khi kế hoạch của Giáo sư dần sáng tỏ và cả nhóm phải chống lại kẻ địch từ cả bên trong lẫn bên ngoài Ngân hàng Tây Ban Nha.', 1, 'phi-vu-trieu-do-phan-4-thumb1967.jpg', '_InqQJRqGW4', 2, 9, 3, 0, 0, 'Money Heist', 0, '0', '2024-05-01 16:21:35', '45 phút/ tập', 13, NULL, NULL);
INSERT INTO `movies` VALUES (38, 'Trò Chơi Con Mực phần 2', 'tro-choi-con-muc-phan-2', 'Coming soon', 1, 'tro-choi-con-muc-phan-2-x5005971.jpg', '6MzxihE41b8', 5, 6, 2, 0, 5, 'Squid Game 2', 0, '2024-04-24 14:10:33', '2024-04-24 16:30:12', '45 phút/ tập', 0, NULL, NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Bùi Công Danh', '0989066517zz@gmail.com', NULL, '$2a$12$Ut3MBji/Qs1fWggrqwsUrOhLrECYChxM0aw6guLpH.qcxkViXlrA.', NULL, '2024-04-16 03:20:21', '2024-04-16 03:20:21');

SET FOREIGN_KEY_CHECKS = 1;
