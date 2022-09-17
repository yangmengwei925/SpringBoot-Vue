/*
 Navicat Premium Data Transfer

 Source Server         : 118.190.247.81--云帆1
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : 118.190.247.81:3306
 Source Schema         : yf_exam_lite

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 15/08/2022 17:31:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for el_exam
-- ----------------------------
DROP TABLE IF EXISTS `el_exam`;
CREATE TABLE `el_exam` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '考试名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '考试描述',
  `open_type` int(11) NOT NULL DEFAULT '1' COMMENT '1公开2部门3定员',
  `join_type` int(11) NOT NULL COMMENT '组题方式1题库,2指定',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '难度:0不限,1普通,2较难',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '考试状态',
  `time_limit` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否限时',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `total_score` int(11) NOT NULL DEFAULT '0' COMMENT '总分数',
  `total_time` int(11) NOT NULL DEFAULT '0' COMMENT '总时长（分钟）',
  `qualify_score` int(11) NOT NULL DEFAULT '0' COMMENT '及格分数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `open_type` (`open_type`),
  KEY `level` (`level`),
  KEY `join_type` (`join_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程';

-- ----------------------------
-- Records of el_exam
-- ----------------------------
BEGIN;
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `join_type`, `level`, `state`, `time_limit`, `start_time`, `end_time`, `create_time`, `update_time`, `total_score`, `total_time`, `qualify_score`) VALUES ('1356425140212076545', '演示考试', '演示考试信息', 1, 1, 0, 0, 0, '2021-02-24 00:00:00', '2021-03-18 00:00:00', '2021-02-02 10:12:09', '2021-02-02 10:12:09', 100, 30, 80);
COMMIT;

-- ----------------------------
-- Table structure for el_exam_depart
-- ----------------------------
DROP TABLE IF EXISTS `el_exam_depart`;
CREATE TABLE `el_exam_depart` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `exam_id` varchar(32) NOT NULL DEFAULT '' COMMENT '考试ID',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `exam_id` (`exam_id`),
  KEY `depart_id` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试部门';

-- ----------------------------
-- Records of el_exam_depart
-- ----------------------------
BEGIN;
INSERT INTO `el_exam_depart` (`id`, `exam_id`, `depart_id`) VALUES ('1356433621732298753', '1356425140212076545', '1318103313740320770');
INSERT INTO `el_exam_depart` (`id`, `exam_id`, `depart_id`) VALUES ('1356433621736493057', '1356425140212076545', '1318103339229106178');
COMMIT;

-- ----------------------------
-- Table structure for el_exam_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_exam_repo`;
CREATE TABLE `el_exam_repo` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `exam_id` varchar(64) NOT NULL COMMENT '考试ID',
  `repo_id` varchar(64) NOT NULL COMMENT '题库ID',
  `radio_count` int(11) NOT NULL DEFAULT '0' COMMENT '单选题数量',
  `radio_score` int(11) NOT NULL DEFAULT '0' COMMENT '单选题分数',
  `multi_count` int(11) NOT NULL DEFAULT '0' COMMENT '多选题数量',
  `multi_score` int(11) NOT NULL DEFAULT '0' COMMENT '多选题分数',
  `judge_count` int(11) NOT NULL DEFAULT '0' COMMENT '判断题数量',
  `judge_score` int(11) NOT NULL DEFAULT '0' COMMENT '判断题分数',
  `saq_count` int(11) NOT NULL DEFAULT '0' COMMENT '简答题数量',
  `saq_score` int(11) NOT NULL DEFAULT '0' COMMENT '简答题分数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `exam_repo_id` (`exam_id`,`repo_id`),
  KEY `rule_id` (`exam_id`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试题库';

-- ----------------------------
-- Records of el_exam_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`) VALUES ('1461506152130015234', '1356425140212076545', '1265561101609795585', 6, 10, 2, 10, 2, 10, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for el_paper
-- ----------------------------
DROP TABLE IF EXISTS `el_paper`;
CREATE TABLE `el_paper` (
  `id` varchar(64) NOT NULL COMMENT '试卷ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `exam_id` varchar(64) NOT NULL COMMENT '规则ID',
  `title` varchar(64) NOT NULL COMMENT '考试标题',
  `total_time` int(11) NOT NULL DEFAULT '0' COMMENT '考试时长',
  `user_time` int(11) NOT NULL DEFAULT '0' COMMENT '用户时长',
  `total_score` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总分',
  `qualify_score` int(11) NOT NULL DEFAULT '0' COMMENT '及格分',
  `obj_score` int(11) NOT NULL DEFAULT '0' COMMENT '客观分',
  `subj_score` int(11) NOT NULL DEFAULT '0' COMMENT '主观分',
  `user_score` int(11) NOT NULL COMMENT '用户得分',
  `has_saq` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否包含简答题',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '试卷状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `limit_time` datetime DEFAULT NULL COMMENT '截止时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `exam_id` (`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试卷';

-- ----------------------------
-- Records of el_paper
-- ----------------------------
BEGIN;
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1356433729043566593', '10001', '1318103313740320770', '1356425140212076545', '演示考试', 60, 1, 100, 80, 30, 0, 30, 0, 2, '2021-02-02 10:46:17', '2021-02-02 10:46:47', '2021-02-02 11:46:17');
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1356434156560584706', '10001', '1318103313740320770', '1356425140212076545', '演示考试', 30, 0, 100, 80, 0, 0, 0, 0, 0, '2021-02-02 10:47:59', '2021-02-02 10:47:59', '2021-02-02 11:17:59');
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1451071753757646850', '10001', '1318103313740320770', '1356425140212076545', '演示考试', 30, 1, 100, 80, 10, 0, 10, 0, 2, '2021-10-21 14:24:00', '2021-10-21 14:24:27', '2021-10-21 14:54:00');
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1451088836384817154', '10001', '1318103313740320770', '1356425140212076545', '演示考试', 30, 9, 100, 80, 0, 0, 0, 0, 2, '2021-10-21 15:31:53', '2021-10-21 15:41:01', '2021-10-21 16:01:53');
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1451091214807994370', '10001', '1318103313740320770', '1356425140212076545', '演示考试', 30, 2, 100, 80, 0, 0, 0, 0, 2, '2021-10-21 15:41:20', '2021-10-21 15:43:57', '2021-10-21 16:11:20');
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1461504905012441090', '1252125239901696002', '1318103339229106178', '1356425140212076545', '演示考试', 30, 1, 100, 80, 0, 0, 0, 0, 2, '2021-11-19 09:21:37', '2021-11-19 09:21:48', '2021-11-19 09:51:37');
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `create_time`, `update_time`, `limit_time`) VALUES ('1461506333319753729', '1252125239901696002', '1318103339229106178', '1356425140212076545', '演示考试', 30, 1, 100, 80, 10, 0, 10, 0, 2, '2021-11-19 09:27:18', '2021-11-19 09:27:46', '2021-11-19 09:57:18');
COMMIT;

-- ----------------------------
-- Table structure for el_paper_qu
-- ----------------------------
DROP TABLE IF EXISTS `el_paper_qu`;
CREATE TABLE `el_paper_qu` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `paper_id` varchar(64) NOT NULL COMMENT '试卷ID',
  `qu_id` varchar(64) NOT NULL COMMENT '题目ID',
  `qu_type` int(11) NOT NULL COMMENT '题目类型',
  `answered` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否已答',
  `answer` varchar(5000) NOT NULL DEFAULT '' COMMENT '主观答案',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '问题排序',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '单题分分值',
  `actual_score` int(11) NOT NULL DEFAULT '0' COMMENT '实际得分(主观题)',
  `is_right` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否答对',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试卷考题';

-- ----------------------------
-- Records of el_paper_qu
-- ----------------------------
BEGIN;
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356433729051955201', '1356433729043566593', '1286859710305226754', 1, 1, '', 0, 10, 10, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356433729144229889', '1356433729043566593', '1286860480865980417', 1, 1, '', 1, 10, 10, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356433729156812801', '1356433729043566593', '1286856786200055810', 1, 1, '', 2, 10, 10, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356433729169395713', '1356433729043566593', '1286856503755624449', 1, 1, '', 3, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356433729186172929', '1356433729043566593', '1286857269660700674', 1, 1, '', 4, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356433729198755842', '1356433729043566593', '1286856991045668865', 1, 1, '', 5, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356433729211338754', '1356433729043566593', '1286859363650195458', 1, 1, '', 6, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356433729223921665', '1356433729043566593', '1286859119977910274', 1, 0, '', 7, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356433729236504577', '1356433729043566593', '1286858826460516353', 1, 0, '', 8, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356433729244893186', '1356433729043566593', '1286858556779352066', 1, 0, '', 9, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356434156568973313', '1356434156560584706', '1286859119977910274', 1, 0, '', 0, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356434156577361922', '1356434156560584706', '1286856991045668865', 1, 0, '', 1, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356434156585750530', '1356434156560584706', '1286858556779352066', 1, 0, '', 2, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356434156594139137', '1356434156560584706', '1286858826460516353', 1, 0, '', 3, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356434156606722049', '1356434156560584706', '1286860480865980417', 1, 0, '', 4, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356434156619304962', '1356434156560584706', '1286859363650195458', 1, 0, '', 5, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356434156623499266', '1356434156560584706', '1286856503755624449', 1, 0, '', 6, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356434156627693570', '1356434156560584706', '1286856786200055810', 1, 0, '', 7, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356434156636082177', '1356434156560584706', '1286857269660700674', 1, 0, '', 8, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1356434156644470786', '1356434156560584706', '1286859710305226754', 1, 0, '', 9, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451071753778618370', '1451071753757646850', '1286858826460516353', 1, 1, '', 0, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451071753841532929', '1451071753757646850', '1286857269660700674', 1, 1, '', 1, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451071753849921537', '1451071753757646850', '1286859119977910274', 1, 1, '', 2, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451071753858310146', '1451071753757646850', '1286859363650195458', 1, 1, '', 3, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451071753870893057', '1451071753757646850', '1286859710305226754', 1, 0, '', 4, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451071753879281665', '1451071753757646850', '1286856991045668865', 1, 1, '', 5, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451071753891864577', '1451071753757646850', '1286858556779352066', 1, 1, '', 6, 10, 10, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451071753900253185', '1451071753757646850', '1286856786200055810', 1, 1, '', 7, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451071753908641793', '1451071753757646850', '1286860480865980417', 1, 1, '', 8, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451071753917030402', '1451071753757646850', '1286856503755624449', 1, 1, '', 9, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451088836397400066', '1451088836384817154', '1286856786200055810', 1, 0, '', 0, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451088836414177282', '1451088836384817154', '1286858826460516353', 1, 0, '', 1, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451088836426760194', '1451088836384817154', '1286858556779352066', 1, 0, '', 2, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451088836439343105', '1451088836384817154', '1286859710305226754', 1, 0, '', 3, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451088836447731714', '1451088836384817154', '1286856503755624449', 1, 0, '', 4, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451088836456120321', '1451088836384817154', '1286859363650195458', 1, 0, '', 5, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451088836464508930', '1451088836384817154', '1286860480865980417', 1, 0, '', 6, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451088836477091842', '1451088836384817154', '1286859119977910274', 1, 0, '', 7, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451088836489674754', '1451088836384817154', '1286857269660700674', 1, 0, '', 8, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451088836498063362', '1451088836384817154', '1286856991045668865', 1, 0, '', 9, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451091214824771585', '1451091214807994370', '1286856786200055810', 1, 0, '', 0, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451091214845743106', '1451091214807994370', '1286859710305226754', 1, 0, '', 1, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451091214854131714', '1451091214807994370', '1286856503755624449', 1, 0, '', 2, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451091214870908929', '1451091214807994370', '1286859363650195458', 1, 0, '', 3, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451091214879297537', '1451091214807994370', '1286858826460516353', 1, 1, '', 4, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451091214887686146', '1451091214807994370', '1286860480865980417', 1, 1, '', 5, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451091214896074753', '1451091214807994370', '1286859119977910274', 1, 0, '', 6, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451091214904463362', '1451091214807994370', '1286857269660700674', 1, 0, '', 7, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451091214908657665', '1451091214807994370', '1286858556779352066', 1, 0, '', 8, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1451091214921240577', '1451091214807994370', '1286856991045668865', 1, 0, '', 9, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461504905066967042', '1461504905012441090', '1286859710305226754', 1, 0, '', 0, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461504905134075905', '1461504905012441090', '1286856503755624449', 1, 0, '', 1, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461504905150853121', '1461504905012441090', '1286858556779352066', 1, 0, '', 2, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461504905159241729', '1461504905012441090', '1286856786200055810', 1, 0, '', 3, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461504905171824642', '1461504905012441090', '1286857269660700674', 1, 0, '', 4, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461504905188601857', '1461504905012441090', '1286858826460516353', 1, 0, '', 5, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461504905192796161', '1461504905012441090', '1286859119977910274', 1, 1, '', 6, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461504905201184770', '1461504905012441090', '1286859363650195458', 1, 0, '', 7, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461504905217961985', '1461504905012441090', '1286856991045668865', 1, 0, '', 8, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461504905222156289', '1461504905012441090', '1286860480865980417', 1, 1, '', 9, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461506333328142337', '1461506333319753729', '1286858826460516353', 1, 0, '', 0, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461506333336530945', '1461506333319753729', '1286859363650195458', 1, 1, '', 1, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461506333344919553', '1461506333319753729', '1286858556779352066', 1, 0, '', 2, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461506333349113858', '1461506333319753729', '1286856991045668865', 1, 0, '', 3, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461506333357502465', '1461506333319753729', '1286856786200055810', 1, 0, '', 4, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461506333365891073', '1461506333319753729', '1286857269660700674', 1, 0, '', 5, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461506333370085377', '1461506333319753729', '1461505751183912961', 2, 1, '', 6, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461506333378473986', '1461506333319753729', '1461505492353413121', 2, 1, '', 7, 10, 10, 0);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461506333382668290', '1461506333319753729', '1461506028981055490', 3, 1, '', 8, 10, 10, 1);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `sort`, `score`, `actual_score`, `is_right`) VALUES ('1461506333386862593', '1461506333319753729', '1461505894142570497', 3, 1, '', 9, 10, 10, 0);
COMMIT;

-- ----------------------------
-- Table structure for el_paper_qu_answer
-- ----------------------------
DROP TABLE IF EXISTS `el_paper_qu_answer`;
CREATE TABLE `el_paper_qu_answer` (
  `id` varchar(64) NOT NULL COMMENT '自增ID',
  `paper_id` varchar(64) NOT NULL COMMENT '试卷ID',
  `answer_id` varchar(32) NOT NULL COMMENT '回答项ID',
  `qu_id` varchar(32) NOT NULL COMMENT '题目ID',
  `is_right` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否正确项',
  `checked` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否选中',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `abc` varchar(64) NOT NULL DEFAULT '' COMMENT '选项标签',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试卷考题备选答案';

-- ----------------------------
-- Records of el_paper_qu_answer
-- ----------------------------
BEGIN;
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('0001be89-457e-420c-b25b-d4022f1f807a', '1451071753757646850', '1286856991062446081', '1286856991045668865', 0, 0, 6, 'G');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('0077a369-fd2e-46a3-8efb-cee288f96117', '1451088836384817154', '1286859710326198274', '1286859710305226754', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('00d81da1-799c-43ea-ae61-4186b430e97b', '1356434156560584706', '1286858826485682181', '1286858826460516353', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('00df7b72-8f57-40df-883f-0db377978bf3', '1356433729043566593', '1286858826485682179', '1286858826460516353', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('02373477-a49f-4fcd-993e-0da7a348a2e4', '1451091214807994370', '1286856786216833025', '1286856786200055810', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('028ee6de-d96f-48ed-9bbe-1d7619a357b7', '1356433729043566593', '1286860480886951937', '1286860480865980417', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('02cc616a-7459-4d33-bae0-77308e7cf6ac', '1461504905012441090', '1286856991062446083', '1286856991045668865', 0, 0, 5, 'F');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('042ccf62-7b91-4443-8aed-05f9dc37f51c', '1356434156560584706', '1286856991062446084', '1286856991045668865', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('043fc1a4-83f9-41ab-a893-8856b7c049f4', '1461504905012441090', '1286858826485682178', '1286858826460516353', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('04869011-b50a-4b92-9e51-fdec8ff82519', '1451088836384817154', '1286859119998881794', '1286859119977910274', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('04a12b6b-7238-4a48-8f97-9d345c7cdab8', '1451071753757646850', '1286860480878563329', '1286860480865980417', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('05611dab-8326-4017-91d4-1455b23b2a4d', '1461504905012441090', '1286860480882757636', '1286860480865980417', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('070e6464-d5a0-4f80-bd92-60a3f5defb92', '1451088836384817154', '1286856503772401665', '1286856503755624449', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('07407ac6-e822-45c8-8236-6111d6cdce78', '1461504905012441090', '1286856786221027330', '1286856786200055810', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('07661633-f2c1-422d-a3d0-d4f6cc7578b5', '1461506333319753729', '1286859363675361282', '1286859363650195458', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('09fc5a3c-b693-4791-ac61-5f2522e29896', '1356434156560584706', '1286857269677477889', '1286857269660700674', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('0ab601d7-efd7-4505-bf97-1c6d0382d789', '1451091214807994370', '1286858826477293569', '1286858826460516353', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('0ad716a9-2efb-488d-94c3-78c6c7f7d9e1', '1461506333319753729', '1286856991062446081', '1286856991045668865', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('0b92947f-dc8a-41c8-93cd-dc1b8534e221', '1451071753757646850', '1286856991058251780', '1286856991045668865', 0, 0, 5, 'F');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('0d4c6509-4406-4275-8ff0-a2f06bfa26ce', '1356434156560584706', '1286856991058251778', '1286856991045668865', 0, 0, 8, 'I');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('0fe2492e-a486-4e9d-ae31-d1e5bb396f90', '1451091214807994370', '1286857269673283586', '1286857269660700674', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1015e8eb-efbc-4ad7-af6e-6836926ad36d', '1356433729043566593', '1286859120003076099', '1286859119977910274', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1016b402-23c6-4c4a-a49f-c82b32d9e7d2', '1451071753757646850', '1286858556800323585', '1286858556779352066', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('11915411-4e72-4ed5-bb86-7122a89e00d4', '1356433729043566593', '1286857269677477889', '1286857269660700674', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('11edbd72-9f70-4826-88eb-f885705de94c', '1356434156560584706', '1286858826485682178', '1286858826460516353', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('12b89a43-adf6-4733-846c-741dcc21160f', '1356433729043566593', '1286858826485682180', '1286858826460516353', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('137e0f43-af67-476d-b738-1f43f23e189d', '1451088836384817154', '1286856991058251780', '1286856991045668865', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1401cb9f-f881-4db0-9095-caba41b2381d', '1451091214807994370', '1286859120003076100', '1286859119977910274', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('162e7d75-3843-4daa-be36-8919697cd8cc', '1451088836384817154', '1286858826485682179', '1286858826460516353', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('170595fb-d74a-4774-98c8-be6075343698', '1451088836384817154', '1286856786221027330', '1286856786200055810', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('17ca599a-f46d-41b4-8afc-8b20d595f0ee', '1356434156560584706', '1286856503776595973', '1286856503755624449', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('17fbaf7b-3738-4b3b-a8db-500c769f4c05', '1356434156560584706', '1286859363675361282', '1286859363650195458', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1838de6c-e3b8-4986-b605-f75b99b39858', '1461504905012441090', '1286858556800323585', '1286858556779352066', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1aab7e6a-fb75-42ae-bd0f-94d178d216de', '1451088836384817154', '1286857269673283585', '1286857269660700674', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1b4b8840-2d29-454d-99ee-f077c766d2b6', '1461506333319753729', '1286859363679555586', '1286859363650195458', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1b53f84f-dfcb-4a18-8a95-8c650058ca59', '1461506333319753729', '1286856991062446084', '1286856991045668865', 0, 0, 8, 'I');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1b633e45-5983-46e5-b79f-60ad9e2006db', '1461504905012441090', '1286859710330392578', '1286859710305226754', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1b8c7847-1759-42c8-a2a5-afe576604bc6', '1356434156560584706', '1286860480882757636', '1286860480865980417', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1c05dd50-f532-4504-88ee-ee8734404bf3', '1451088836384817154', '1286858556800323585', '1286858556779352066', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1c60d767-a497-418a-945f-4c45676034e6', '1356434156560584706', '1286856991062446085', '1286856991045668865', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1c767588-bb32-4154-b2a8-e03b4601dc8a', '1451088836384817154', '1286857269673283587', '1286857269660700674', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1cd1f2bc-b645-466d-ae1f-dbb2d19db619', '1356434156560584706', '1286859363679555587', '1286859363650195458', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1dc3f60d-dfb0-4fb8-abc3-69c99a363e5d', '1356434156560584706', '1286856991062446083', '1286856991045668865', 0, 0, 6, 'G');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1df02b95-4c55-49c2-a031-f1c296b38e7c', '1461504905012441090', '1286860480886951937', '1286860480865980417', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1e2d61ad-9a99-40d1-8ce5-2cf99bf2dd6c', '1461506333319753729', '1286859363675361281', '1286859363650195458', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1e46971e-3b97-46e3-b1ea-843600c7ed28', '1461504905012441090', '1286858556800323586', '1286858556779352066', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1e87eee2-3e1e-4201-9c80-837a15b192a8', '1356433729043566593', '1286856991058251778', '1286856991045668865', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1f5291c4-9f00-43cf-b073-0d1affbfabf1', '1461504905012441090', '1286859710326198274', '1286859710305226754', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('1f85e12b-8f41-40e6-8fc8-5b789d3507e1', '1451091214807994370', '1286859363675361282', '1286859363650195458', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('209135cc-8251-4376-addb-05c0004ea55c', '1461506333319753729', '1286856786221027332', '1286856786200055810', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('20cb8f6d-6218-402e-b3fc-d32b5df5d7bb', '1451088836384817154', '1286858826477293569', '1286858826460516353', 1, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('226b3533-27bc-4c2d-9b04-45bd435c10f4', '1356434156560584706', '1286858556804517889', '1286858556779352066', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2324f7e6-73cb-416b-a739-637d0777afdd', '1451091214807994370', '1286859120003076098', '1286859119977910274', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('23729185-d3ff-4a0e-b58d-f82f4704ff92', '1356433729043566593', '1286859363679555587', '1286859363650195458', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('239f8304-6e14-443c-a3f7-f74038c72b44', '1451091214807994370', '1286860480878563329', '1286860480865980417', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('23a9d977-446f-4c9b-abc4-94d4429b7ada', '1356433729043566593', '1286857269677477890', '1286857269660700674', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('23cc1bc0-48fe-44a2-9f0a-a10a9c96d17a', '1461506333319753729', '1461505751196495873', '1461505751183912961', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('249b0c1a-24ac-4a94-b42d-51b05bdae44c', '1356434156560584706', '1286856786221027332', '1286856786200055810', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('268d8ab3-3b4e-4c5c-9caa-bd4717595a46', '1356434156560584706', '1286856786216833026', '1286856786200055810', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('272139e3-704c-4c97-9ba1-5bcca67d4764', '1356433729043566593', '1286856991062446086', '1286856991045668865', 0, 0, 6, 'G');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('293c5d4f-3578-44f0-aa81-30d7ea627fa1', '1451071753757646850', '1286859363675361282', '1286859363650195458', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2998d8d9-a8e1-4d68-b4fc-16f4f186f3a8', '1451091214807994370', '1286856503776595972', '1286856503755624449', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2a45bc15-4eb9-45c6-ba00-459854728f79', '1461506333319753729', '1286857269677477889', '1286857269660700674', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2a79719a-22db-48e9-8fc3-36c569e4105b', '1451088836384817154', '1286859120003076098', '1286859119977910274', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2b1c3a4a-c8dc-472d-bee3-fde9396ad209', '1356433729043566593', '1286856503772401665', '1286856503755624449', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2b1fd70d-2093-4cbb-a84a-73775660c3da', '1451088836384817154', '1286857269677477889', '1286857269660700674', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2bd6664f-754e-40c8-ab66-42c88b38e94c', '1451088836384817154', '1286856503776595973', '1286856503755624449', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2c55c4f0-0966-4046-adf4-32c4c6239b1e', '1451088836384817154', '1286858556804517889', '1286858556779352066', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2c81a774-911a-4581-89f6-362536133468', '1451091214807994370', '1286856503772401665', '1286856503755624449', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2ca45db0-c607-4098-a742-9a4013987867', '1451071753757646850', '1286856991058251778', '1286856991045668865', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2e1ef9ab-8f95-4a6a-9cf8-953536255797', '1451071753757646850', '1286856991062446083', '1286856991045668865', 0, 1, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2e8a6a4a-d986-4a63-86a7-4c29ac2293f8', '1356434156560584706', '1286858556800323585', '1286858556779352066', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2ec2a2f6-0a80-415b-bb14-4522260cab6c', '1461506333319753729', '1461505894155153409', '1461505894142570497', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2f2d2026-a16e-455f-9514-eada2c363e72', '1356434156560584706', '1286858556800323587', '1286858556779352066', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('2fd1c7c3-7803-44e2-9e8e-c347d2965f78', '1451088836384817154', '1286856991062446086', '1286856991045668865', 0, 0, 7, 'H');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('300a8321-5173-4d87-a273-621b981724af', '1451091214807994370', '1286856991058251780', '1286856991045668865', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('30155aac-0b28-48db-9932-e871d3669583', '1461504905012441090', '1286859710334586881', '1286859710305226754', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('301ce900-9728-46f1-9c7b-ebd183b4ed8c', '1461504905012441090', '1286856503776595970', '1286856503755624449', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3051fb77-3df6-4bd3-a390-3b82271f6e2b', '1356433729043566593', '1286856503776595972', '1286856503755624449', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3086fbdd-4cf9-4feb-bc2d-a0f6868b2952', '1451088836384817154', '1286856503776595970', '1286856503755624449', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('30d4820d-2f67-4a36-b7f0-b1c4f7d1646e', '1356433729043566593', '1286860480882757635', '1286860480865980417', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('30e4b03a-3f4a-42be-927b-5d422e10531f', '1461506333319753729', '1286856991062446083', '1286856991045668865', 0, 0, 7, 'H');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('32545daf-b700-4c75-b493-5774d3592964', '1356433729043566593', '1286859710334586881', '1286859710305226754', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('32fbc699-b510-4878-a24e-095a54402845', '1451071753757646850', '1286856786221027330', '1286856786200055810', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('343fa4ff-33f0-4ba2-a8e0-61fc439736a7', '1451071753757646850', '1286859710330392579', '1286859710305226754', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('347191f1-dfb4-46cd-8ea2-c1eeb602f97d', '1451091214807994370', '1286860480882757634', '1286860480865980417', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('348c9cfa-4797-4b68-a6f6-0909abb93c33', '1451088836384817154', '1286856503776595971', '1286856503755624449', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('34a5f18d-c2de-4a5a-b0c4-236b14552578', '1451071753757646850', '1286858826477293569', '1286858826460516353', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('34bb699a-394c-4fc2-8a1c-dc952e7070a1', '1451091214807994370', '1286859120007270402', '1286859119977910274', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('34eb62aa-5fc6-41f7-986e-54de04444b65', '1451071753757646850', '1286856786216833025', '1286856786200055810', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('362ef277-decc-43f1-83f3-53be0ba4fed0', '1356433729043566593', '1286856786216833026', '1286856786200055810', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('37386bc3-bdc4-46e0-aa80-060f61a3bff5', '1451091214807994370', '1286856503776595970', '1286856503755624449', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('375b3dbd-3c98-4a90-85db-28e986a780e7', '1461506333319753729', '1286858556804517889', '1286858556779352066', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('37c87fbc-03a7-4406-b575-447cc69a66f3', '1461506333319753729', '1461505492395356162', '1461505492353413121', 0, 1, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('389b1390-5f45-47e6-b4c5-d8c010f0102d', '1461504905012441090', '1286857269673283585', '1286857269660700674', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('39a40088-6151-478c-a45f-46f7fb04bb7c', '1356434156560584706', '1286859363679555586', '1286859363650195458', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3a7ef1d8-5842-4d7a-906a-1b54192bab4b', '1451071753757646850', '1286856503776595971', '1286856503755624449', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3abbeef5-cbd0-49c2-8e4e-62af4a48aa57', '1451071753757646850', '1286856991062446082', '1286856991045668865', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3b94eca2-5c4c-4f24-a34b-d1d755a4de61', '1461506333319753729', '1461505492395356161', '1461505492353413121', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3b96aebc-ab64-41da-8c44-46000caa8907', '1356434156560584706', '1286859120007270402', '1286859119977910274', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3cac68af-c5af-4af5-90c8-562a4326a299', '1356434156560584706', '1286856503776595970', '1286856503755624449', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3da3e4c1-ccdc-4771-8a32-658787e17946', '1461504905012441090', '1286859710330392580', '1286859710305226754', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3e0c1506-e896-40e6-96bb-f67684b73261', '1451088836384817154', '1286857269673283586', '1286857269660700674', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3e1e436b-2bc6-414c-8cee-8d8e6c958a98', '1356434156560584706', '1286857269673283587', '1286857269660700674', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3f01d1ac-bb30-47f7-b577-9facb3172def', '1451088836384817154', '1286856991062446082', '1286856991045668865', 1, 0, 5, 'F');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3f0248a8-31d9-4178-b49f-413b3301def9', '1356433729043566593', '1286859710330392580', '1286859710305226754', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3f1b291a-3ddc-43f2-a32c-f61f928098fd', '1356434156560584706', '1286859710330392579', '1286859710305226754', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('3fd02a47-48cc-4cb0-b973-fc33e3e577ab', '1451071753757646850', '1286856503776595972', '1286856503755624449', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('42a0da68-1806-42f1-978c-0edda57df292', '1356434156560584706', '1286858826485682180', '1286858826460516353', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4375ad20-a819-467d-b965-b07457ed0253', '1451091214807994370', '1286860480882757635', '1286860480865980417', 0, 1, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4396ae46-f7da-48ab-ae91-7a1562ff8cbb', '1461504905012441090', '1286856503772401665', '1286856503755624449', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('43ef4e05-ad14-4704-ad94-747b32254a25', '1451091214807994370', '1286856786221027330', '1286856786200055810', 1, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('44574dc6-81a7-4d5b-8d8a-980b1bedd051', '1461504905012441090', '1286858826485682181', '1286858826460516353', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('447aaba8-1dd5-46e1-955e-2c621cfc3787', '1451088836384817154', '1286856503776595972', '1286856503755624449', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('447c8c71-b0cf-4e5a-9ae9-2d5aba5ac52c', '1451088836384817154', '1286856786216833026', '1286856786200055810', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4497ccaa-6454-415f-9dc8-c49491704b02', '1461506333319753729', '1286857269673283586', '1286857269660700674', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('45b7334e-8838-4838-846a-a7732b347a06', '1451088836384817154', '1286857269677477890', '1286857269660700674', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('47b37f96-d170-4cfc-8c82-886dc0502efa', '1356434156560584706', '1286858826477293569', '1286858826460516353', 1, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4888020c-e8fe-4609-b4fe-8ad0ceb4603b', '1461506333319753729', '1286856786221027330', '1286856786200055810', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4b07d644-6c9b-4b37-b5a3-4805179d7cc2', '1356433729043566593', '1286857269673283586', '1286857269660700674', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4bccc610-a6de-4c48-bc91-5cae5e98f268', '1356433729043566593', '1286859119998881794', '1286859119977910274', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4c5cc0dc-22b6-4280-be70-d7f51419bccd', '1356433729043566593', '1286859363675361281', '1286859363650195458', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4c7f185e-439d-4398-bee2-e4be072c7f00', '1461506333319753729', '1286857269673283587', '1286857269660700674', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4cb8bfae-6814-4b01-af16-a6e0f4275937', '1451071753757646850', '1286860480886951937', '1286860480865980417', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4ce68700-fe50-494b-95dc-fb6128cf0b24', '1461504905012441090', '1286858556804517889', '1286858556779352066', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4f1488e2-a23c-4355-99b1-55e7ff146473', '1356434156560584706', '1286859120003076099', '1286859119977910274', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4fa7a35a-de03-452d-b101-30d3d1c7550a', '1451091214807994370', '1286859363679555587', '1286859363650195458', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('4fccb537-d12a-4e05-bf94-3b0c600b0bbb', '1356434156560584706', '1286856786216833025', '1286856786200055810', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5094fad9-1934-4a6d-8fed-4faa4aeeda1a', '1451071753757646850', '1286856503776595970', '1286856503755624449', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('50dea7b7-6c1b-4b16-99dd-f9b4383e818d', '1461504905012441090', '1286859120007270402', '1286859119977910274', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5141ee80-61af-4d7b-8c1a-b073b08b75a4', '1461504905012441090', '1286857269677477890', '1286857269660700674', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('51e2eae8-1de6-47f5-9200-17f348a441f4', '1356433729043566593', '1286856503776595973', '1286856503755624449', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5221e2d2-d5b5-4004-bed0-3ec12225d4a2', '1451091214807994370', '1286859710334586881', '1286859710305226754', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5234f198-b143-48cf-8019-d80ea6d2fa70', '1461506333319753729', '1286858556800323586', '1286858556779352066', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('52495f5e-0770-42e1-ac60-64bd90e66660', '1356434156560584706', '1286860480878563329', '1286860480865980417', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('52ce9d0d-15dc-4739-92fd-c6b8ce6914e5', '1356433729043566593', '1286856991062446084', '1286856991045668865', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5393c907-8f4c-43ba-9e86-aebacf856798', '1461506333319753729', '1461505751200690177', '1461505751183912961', 1, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5450567f-b2d2-4c39-b999-fc50d4d9ff53', '1451071753757646850', '1286859119998881794', '1286859119977910274', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('545e4397-ca12-4e5a-9167-fbb2218f5e2c', '1461504905012441090', '1286859363675361282', '1286859363650195458', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('55f09af1-30fa-43d5-8924-88eb23257c89', '1356434156560584706', '1286860480882757634', '1286860480865980417', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5610900f-0180-422a-8a9e-599257592656', '1461504905012441090', '1286856991062446082', '1286856991045668865', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('57461d31-0ba2-42a8-a1c5-80be2882f363', '1356434156560584706', '1286857269673283586', '1286857269660700674', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('576e9435-dd60-4efd-a961-e5aed279b12e', '1451088836384817154', '1286859363679555588', '1286859363650195458', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('57b2442a-19bc-4564-b8f9-965a817957e1', '1356433729043566593', '1286856991058251779', '1286856991045668865', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('57c2453c-9ef1-4d89-b506-f569e93e9c56', '1356434156560584706', '1286859120003076100', '1286859119977910274', 1, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('58701b4a-b6d4-4834-8e40-7063a336a8de', '1356433729043566593', '1286859363679555588', '1286859363650195458', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('58c2157a-6d53-4841-80be-abde0ef21e37', '1451088836384817154', '1286859363675361281', '1286859363650195458', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('59b09e83-9acb-4f48-8216-b45661f9f77e', '1451088836384817154', '1286858556800323586', '1286858556779352066', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('59dac195-e26e-4d5e-9328-6e1371499ac8', '1356433729043566593', '1286858826477293569', '1286858826460516353', 1, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5bfc6f13-e518-48fe-8b68-1766203d3739', '1356433729043566593', '1286859120007270402', '1286859119977910274', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5cbb6392-7934-481d-b00b-73e556b53091', '1451091214807994370', '1286859710330392580', '1286859710305226754', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5e1204c7-6016-45ab-91d6-80f00618517d', '1451091214807994370', '1286859363679555586', '1286859363650195458', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5e63b7de-3909-4887-b79b-2e0b2f779c23', '1451091214807994370', '1286858826485682178', '1286858826460516353', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5f2ecd1d-f825-4d95-a19c-3519f129fb2c', '1451088836384817154', '1286858826485682181', '1286858826460516353', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('5f305e1b-6b1f-41ee-bcd5-fa31b57356a2', '1461504905012441090', '1286856991058251778', '1286856991045668865', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6008b937-f931-416e-af4b-25c32fb02039', '1461504905012441090', '1286859363679555588', '1286859363650195458', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('60891ef5-2b9b-4320-913f-82e19d1ffa95', '1461506333319753729', '1286858826477293569', '1286858826460516353', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('609f1013-d7f5-46d6-a381-f07f8b68346a', '1356433729043566593', '1286856991062446082', '1286856991045668865', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('613d555e-988e-4026-8502-f6e35aefc94a', '1451091214807994370', '1286856991062446085', '1286856991045668865', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('61c4df44-903a-4691-bc25-8e607caf6afe', '1461506333319753729', '1461505492391161858', '1461505492353413121', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('61d79113-3c2a-4959-a501-bc4663c57097', '1451088836384817154', '1286858826485682178', '1286858826460516353', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('62b6e892-c0cd-43c7-b497-a63f8448534f', '1356433729043566593', '1286859363679555586', '1286859363650195458', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('63f764ff-bb27-4260-bfbd-31e6a639ef6b', '1356434156560584706', '1286856503776595971', '1286856503755624449', 1, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('646a9144-111d-490a-af97-b8b87a2a56e3', '1451091214807994370', '1286858826485682180', '1286858826460516353', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('647a24d5-bd72-4888-85f8-1535556063b1', '1356433729043566593', '1286858556800323588', '1286858556779352066', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6603c1c4-fa73-4220-bfa0-48572f2270fc', '1356433729043566593', '1286857269673283587', '1286857269660700674', 0, 1, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('66e8d672-0b54-46c0-a8af-6ba6c72ad34e', '1451071753757646850', '1286857269673283585', '1286857269660700674', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('66f23d25-6e11-420b-b47a-5a70410fb621', '1451091214807994370', '1286858826485682179', '1286858826460516353', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('67b21bde-b8ec-4e1f-998e-ee006b986f16', '1461506333319753729', '1286858556800323588', '1286858556779352066', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('67ce38c4-3466-41d5-adb9-90419c74fd84', '1451071753757646850', '1286856991062446084', '1286856991045668865', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6887af85-c91f-4a60-a1a5-e7f4b744cbd7', '1451091214807994370', '1286857269673283587', '1286857269660700674', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6998630d-65f4-4068-9075-0f24ba1f8284', '1451091214807994370', '1286856991062446083', '1286856991045668865', 0, 0, 8, 'I');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6a9e5a23-ded4-4bea-b282-e657fa54746d', '1451091214807994370', '1286858826485682181', '1286858826460516353', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6b101f26-c0dd-48e1-a77f-59528c2cbdb8', '1461506333319753729', '1286858556800323585', '1286858556779352066', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6b66149a-9842-4455-a771-081a12c2f325', '1451071753757646850', '1286859120003076100', '1286859119977910274', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6d9995b3-502f-4374-810a-694069b8a09c', '1451088836384817154', '1286859710330392580', '1286859710305226754', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6e16f0dc-1c15-4f4e-87c8-87d3d4d20eaf', '1451088836384817154', '1286856786216833025', '1286856786200055810', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6e5def48-0ec5-42e2-830b-d9fe41f5d655', '1451091214807994370', '1286856503776595971', '1286856503755624449', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('6f1a433b-6e6b-469a-9b7e-7e67053b58b1', '1356433729043566593', '1286856503776595970', '1286856503755624449', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('700fdbb4-da14-4353-ab5a-24cd0eeba191', '1356433729043566593', '1286856991062446081', '1286856991045668865', 0, 0, 7, 'H');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('712dbd90-9b2e-42ac-bdba-82cda08c6953', '1356433729043566593', '1286858556800323586', '1286858556779352066', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('71690873-7085-44a6-8d22-14a8ebbd2344', '1451091214807994370', '1286856503776595973', '1286856503755624449', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7259ace8-8f85-4223-884c-241d11655284', '1451071753757646850', '1286856503776595973', '1286856503755624449', 0, 1, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7294a334-2cb6-4605-a0fa-165961de5312', '1356434156560584706', '1286856503772401665', '1286856503755624449', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('733e0136-3cc5-447a-add6-82e4624718a0', '1451071753757646850', '1286858556800323587', '1286858556779352066', 1, 1, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('738c8d1a-643f-44bc-89bc-4b5404d54d3a', '1356434156560584706', '1286858556800323588', '1286858556779352066', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7471c19a-ca04-499d-aea6-c04dbd8b17ed', '1451091214807994370', '1286856991058251778', '1286856991045668865', 0, 0, 6, 'G');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('774657c0-051d-4ba4-8895-e966257a8bd0', '1356434156560584706', '1286859119998881794', '1286859119977910274', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('77800f7f-8c77-4ffe-9cf4-fcf5dff23b31', '1451091214807994370', '1286858556800323585', '1286858556779352066', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('78ba023e-4196-4bb1-93fa-56a54fa76296', '1451071753757646850', '1286857269677477890', '1286857269660700674', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('79074f41-fd85-4eb4-a2aa-ce3ce5c1256a', '1356434156560584706', '1286860480882757635', '1286860480865980417', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7a6b06ae-76c0-4c5f-958c-fa6eb413cacf', '1451088836384817154', '1286860480882757636', '1286860480865980417', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7a7a1261-282d-433f-8113-6e3b7a72ee66', '1451091214807994370', '1286859710326198274', '1286859710305226754', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7b6e346b-6286-4e6b-8d4f-3df1c75f96a5', '1451088836384817154', '1286860480886951937', '1286860480865980417', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7b9fabd4-593d-4a53-9bf3-3daa41cd73c7', '1356434156560584706', '1286856503776595972', '1286856503755624449', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7c555f01-2ed6-4d90-8339-aea20ed73b69', '1451071753757646850', '1286859363679555588', '1286859363650195458', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7c853181-e9b4-4d8f-ac87-394a3b15061f', '1356434156560584706', '1286856991058251780', '1286856991045668865', 0, 0, 7, 'H');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7d23c306-185e-41b7-aa68-1f9efcaa4743', '1451088836384817154', '1286856786221027331', '1286856786200055810', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7de120a7-95db-44c2-ae24-5ce9273da897', '1356433729043566593', '1286858556804517889', '1286858556779352066', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('7fd62b91-1229-4008-b7eb-a1feb6327fab', '1451091214807994370', '1286859363679555588', '1286859363650195458', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('810792aa-1506-46d3-99fd-67210880a720', '1451091214807994370', '1286857269677477890', '1286857269660700674', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('8110924f-4584-4c39-90f6-16d4eeb4e7ac', '1356434156560584706', '1286859710330392580', '1286859710305226754', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('816010be-62ed-4d55-ae22-ddab33865dde', '1451091214807994370', '1286860480882757636', '1286860480865980417', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('8286b569-3de7-464f-95b0-dfa08ccedc37', '1461504905012441090', '1286858826485682180', '1286858826460516353', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('82e967ce-92fa-4ff1-a015-3f75a8cf670e', '1461504905012441090', '1286856786221027332', '1286856786200055810', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('83d65d6c-76cb-49db-a71f-b14cfd88bbeb', '1356433729043566593', '1286856786221027332', '1286856786200055810', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('842e6b67-db9c-4fe6-9833-4d070a53bfa6', '1451071753757646850', '1286857269673283586', '1286857269660700674', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('84d61de3-6277-4b7a-a6b6-85f1285f610a', '1451071753757646850', '1286857269677477889', '1286857269660700674', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('85644b41-76e6-42f6-9594-2bf0e0d09641', '1356434156560584706', '1286856786221027330', '1286856786200055810', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('857387dd-d4b9-4d25-925a-0cfb24cf907d', '1461504905012441090', '1286856991058251779', '1286856991045668865', 0, 0, 7, 'H');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('85f1e358-4183-45ad-b02c-75a25b4f3ee1', '1451071753757646850', '1286856991058251779', '1286856991045668865', 0, 0, 8, 'I');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('86b09e2c-4787-4be8-ac60-bc2a59415666', '1356433729043566593', '1286860480878563329', '1286860480865980417', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('877c1262-5022-4765-8393-7f7465d74936', '1451071753757646850', '1286860480882757635', '1286860480865980417', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('877c8a32-9e5f-438d-8552-9a691c05a2f2', '1356433729043566593', '1286859120003076098', '1286859119977910274', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('878ddaa8-1f45-4796-9171-75b7e4dc1e31', '1461504905012441090', '1286859363679555586', '1286859363650195458', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('88d0f03e-19b1-43b9-af36-e393a17049e6', '1451088836384817154', '1286859120003076100', '1286859119977910274', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('8b54927f-9cac-4e54-a8e3-c4019a715802', '1451071753757646850', '1286858826485682180', '1286858826460516353', 0, 1, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('8c8dfdfa-cac5-4dbf-81f9-bfec7f2d5fc6', '1451088836384817154', '1286859363675361282', '1286859363650195458', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('8ded7cb4-22b9-4114-8778-6480e858dbb7', '1356434156560584706', '1286858826485682179', '1286858826460516353', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('8e8f79bf-9a3b-447e-a486-099b27fb3167', '1451091214807994370', '1286856991062446086', '1286856991045668865', 0, 0, 7, 'H');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('8f04291d-d1d6-4b38-b8e0-9de15f60fc84', '1356433729043566593', '1286858556800323585', '1286858556779352066', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('901674c6-7f5b-4bc2-8b24-4f42d987c86f', '1356434156560584706', '1286859363675361281', '1286859363650195458', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('90a6c5ba-17e7-4516-b501-0de30b97861f', '1451071753757646850', '1286859710330392578', '1286859710305226754', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('9284d9c6-fbea-4171-99ac-c2f1ae467441', '1451091214807994370', '1286856786221027331', '1286856786200055810', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('94c5a8f3-ca4e-451d-81bd-76a66e815b00', '1451071753757646850', '1286859120007270402', '1286859119977910274', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('9504d772-e8a0-48cf-89be-864cd951d9a4', '1356434156560584706', '1286856991062446081', '1286856991045668865', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('950dd541-a1f5-4258-969c-6cdd5f4b45f8', '1356433729043566593', '1286856991062446083', '1286856991045668865', 0, 0, 8, 'I');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('95371fc1-576c-4bac-95de-12fe89d7a5b8', '1451071753757646850', '1286856503772401665', '1286856503755624449', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('959ffa18-9cf4-41de-b9b6-f5fbe7028e87', '1356433729043566593', '1286856991062446085', '1286856991045668865', 0, 0, 5, 'F');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('9830f8cf-726c-480d-8501-c60f7a6fe4c6', '1451088836384817154', '1286858556800323588', '1286858556779352066', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('9888d41a-9740-4f05-bbdc-234ce013d33c', '1461504905012441090', '1286856991062446081', '1286856991045668865', 0, 0, 6, 'G');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('98e01284-1743-4b67-a4f6-e9d225f17936', '1461506333319753729', '1461505751200690179', '1461505751183912961', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('9922b583-7b85-4e43-b1f6-7efc5d4d9aae', '1461504905012441090', '1286856503776595973', '1286856503755624449', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('9ccb0034-7bf3-40bc-b9e8-74791a4fbca0', '1451088836384817154', '1286859710330392578', '1286859710305226754', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('9cda2443-a6cb-4f66-b90d-ae9f5b24f442', '1356434156560584706', '1286857269677477890', '1286857269660700674', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('9d767614-112e-41e5-b331-28b9b692f0fd', '1451088836384817154', '1286859120007270402', '1286859119977910274', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('9ef88c6f-12c5-4555-92b3-d46dc95d3271', '1451071753757646850', '1286858556800323586', '1286858556779352066', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('9f4168ff-6c0b-4a1c-b1d7-a48dd6aab037', '1461504905012441090', '1286858556800323587', '1286858556779352066', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a08ed5ac-8e5c-4c55-bb32-86372dbb91d5', '1451088836384817154', '1286860480878563329', '1286860480865980417', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a1fcf6b7-e171-4c3c-946a-71992f83d804', '1451091214807994370', '1286858556800323588', '1286858556779352066', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a2049af4-6c89-4926-bc14-3ef3bf06169e', '1451091214807994370', '1286856786216833026', '1286856786200055810', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a25ff958-e8ea-4326-b496-d347f66f8813', '1451071753757646850', '1286858556804517889', '1286858556779352066', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a279cef9-666f-469c-9b21-e4d030241471', '1461506333319753729', '1461506028993638402', '1461506028981055490', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a518e1c7-5798-49a0-91ad-90557dfe433e', '1356433729043566593', '1286860480882757636', '1286860480865980417', 1, 1, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a535cbe7-0c7e-4a3c-870d-4e55b504c558', '1451091214807994370', '1286856991062446084', '1286856991045668865', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a60109c4-6008-4c39-b1d6-ab211120f6d5', '1461504905012441090', '1286858556800323588', '1286858556779352066', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a602895b-3efd-48f8-a6bb-4d37f563b420', '1461504905012441090', '1286856786216833026', '1286856786200055810', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a7fb3128-4777-4d04-a1cd-7b2e90c1e23d', '1461504905012441090', '1286860480882757635', '1286860480865980417', 0, 1, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a8330b61-e023-4185-a7a4-22afb8eb4ed5', '1451091214807994370', '1286856991062446081', '1286856991045668865', 0, 0, 5, 'F');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a892249a-a329-4d0f-b9c9-9acefbf89aad', '1356433729043566593', '1286856786221027331', '1286856786200055810', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a8d71665-4694-4b53-a571-a7d4b1b40640', '1461504905012441090', '1286857269673283587', '1286857269660700674', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('a95fbda2-97d6-4357-b579-3067c3689ca2', '1451088836384817154', '1286856991062446084', '1286856991045668865', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('abac5315-0c64-4f21-a817-17fdc682e3de', '1356434156560584706', '1286856991062446082', '1286856991045668865', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ac4ea5f4-37c8-456f-94f5-02f603aa72eb', '1451091214807994370', '1286858556800323586', '1286858556779352066', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('adc83ec5-173d-4c86-9981-c17bc13c8001', '1461506333319753729', '1286858826485682181', '1286858826460516353', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ae253dd2-34e9-4b75-924f-d9056f5bb817', '1451071753757646850', '1286859710334586881', '1286859710305226754', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ae47f822-3519-4c91-8910-7bcb8768ebc7', '1356434156560584706', '1286858556800323586', '1286858556779352066', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('aea1f39f-739c-48b3-9852-a088d4df9a77', '1461504905012441090', '1286859363679555587', '1286859363650195458', 1, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('af0f24e2-0494-41ff-9932-4848c19f87c7', '1451071753757646850', '1286859363679555587', '1286859363650195458', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('af38cb8e-bfba-41b4-917f-c3db9585a20f', '1451091214807994370', '1286856991062446082', '1286856991045668865', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b02a96d1-f0af-4ae9-960c-a84c56fe8d8e', '1356433729043566593', '1286858826485682181', '1286858826460516353', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b07b17b6-e498-4ea6-bf61-848b460ae718', '1451071753757646850', '1286860480882757636', '1286860480865980417', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b0b9cc80-2e04-4bb7-a9d7-91ea9c0437ef', '1461504905012441090', '1286856786221027331', '1286856786200055810', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b0c2f231-fac4-4d89-b82d-d7bd0ffa18c2', '1451091214807994370', '1286859363675361281', '1286859363650195458', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b114471c-78f4-4bec-8937-af30f38f450e', '1451071753757646850', '1286859120003076099', '1286859119977910274', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b2397630-5bf2-4bf9-91af-a406abdc8eab', '1461506333319753729', '1461505492395356163', '1461505492353413121', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b36689b4-1985-4b96-ad10-affcc9ea59e3', '1461504905012441090', '1286856991062446085', '1286856991045668865', 0, 0, 8, 'I');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b3a35ebf-3ad9-43dc-8f62-9ccda0f49f6f', '1451091214807994370', '1286858556804517889', '1286858556779352066', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b50e253e-5650-4579-a729-2c050cd60e5f', '1356433729043566593', '1286856503776595971', '1286856503755624449', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b5d0b5a7-0b2a-4e98-be25-f3a898bdc572', '1356434156560584706', '1286859710334586881', '1286859710305226754', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b67b5fe8-f3aa-48a8-b74f-a389209e2379', '1451071753757646850', '1286856786216833026', '1286856786200055810', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b6ec907a-d2a4-43d7-a13f-2cff42e4a602', '1451088836384817154', '1286859120003076099', '1286859119977910274', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b824f7dd-e758-450f-8d7b-9cfd68a4f61d', '1451088836384817154', '1286858826485682180', '1286858826460516353', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b89270db-869c-4b88-83fa-304c72b8c3ba', '1451091214807994370', '1286859120003076099', '1286859119977910274', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b952424e-40a5-4347-8ea8-b08afdf5c10d', '1451071753757646850', '1286858556800323588', '1286858556779352066', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b9b9e29d-58f9-4bc9-88ee-5a8a5afef91f', '1356434156560584706', '1286859710330392578', '1286859710305226754', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('b9bc60b0-0e08-4854-8b0e-1cf114e92fd1', '1451091214807994370', '1286857269673283585', '1286857269660700674', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ba9f53e4-0588-459e-9122-a9f6e8a3486b', '1461506333319753729', '1286856991062446086', '1286856991045668865', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('bb1d7e08-692a-432d-9fce-8b0c1324485b', '1461506333319753729', '1286856991062446085', '1286856991045668865', 0, 0, 6, 'G');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('bbd245b7-9ab8-4bc7-97a9-884b4b3704a1', '1451088836384817154', '1286856991058251779', '1286856991045668865', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('bc1fe7bb-9412-4484-a17b-893e77f390b7', '1461504905012441090', '1286856991062446084', '1286856991045668865', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('bcc45dd3-1c1a-4fde-912e-0850b70e1784', '1461504905012441090', '1286859119998881794', '1286859119977910274', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('bd573cb8-d4dc-4a53-b50f-d18b6aad9ccd', '1461506333319753729', '1461506028993638401', '1461506028981055490', 1, 1, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('be32b117-d958-4463-b397-f7931787560e', '1356434156560584706', '1286856786221027331', '1286856786200055810', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c015db51-9976-4980-868f-0c8d8bce5c1a', '1451071753757646850', '1286857269673283587', '1286857269660700674', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c028b0e5-36d5-4635-8982-5cc701b5a07c', '1451088836384817154', '1286860480882757635', '1286860480865980417', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c0f54ab1-33cc-4e76-9e0e-4f82845bbd74', '1356433729043566593', '1286858826485682178', '1286858826460516353', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c1a8ea48-b995-484c-aae2-628f75eb0612', '1451091214807994370', '1286857269677477889', '1286857269660700674', 1, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c21482de-5193-4b7c-bb4b-cce38595d670', '1461504905012441090', '1286856991058251780', '1286856991045668865', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c31d09de-41b4-4076-b90d-a3d36be2ddea', '1461504905012441090', '1286856991062446086', '1286856991045668865', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c32ff94c-44b9-437c-9ebc-9ead109fc84d', '1451091214807994370', '1286856991058251779', '1286856991045668865', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c37ef52e-560d-45c2-b0e5-7f4a2459933f', '1451071753757646850', '1286856786221027331', '1286856786200055810', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c3c6f955-a1ec-486d-aacf-3b890619a492', '1451091214807994370', '1286859710330392579', '1286859710305226754', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c5a9c724-0de6-48dd-9be8-9fa138b2ff57', '1356434156560584706', '1286860480886951937', '1286860480865980417', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c64e390a-6f1b-4b40-b88a-6f6ee4592555', '1461504905012441090', '1286858826477293569', '1286858826460516353', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c743f5e7-af90-4658-ab82-80ffbcd1468f', '1461506333319753729', '1461505751200690178', '1461505751183912961', 1, 1, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c8b85866-fa13-44fa-b8c6-a23e7e804228', '1356433729043566593', '1286856991058251780', '1286856991045668865', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('c909fac1-e373-4c87-b8aa-487d6b7a6da7', '1451071753757646850', '1286858826485682181', '1286858826460516353', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('cab8c2d3-db25-45da-9968-cfdd1b2d50fc', '1356434156560584706', '1286856991058251779', '1286856991045668865', 0, 0, 5, 'F');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('cb34fc21-e5fa-43bd-bbbe-e27edfe45c18', '1451071753757646850', '1286856991062446085', '1286856991045668865', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('cba86c7c-ab73-4682-9d8d-91ebf61eca37', '1451088836384817154', '1286856991062446081', '1286856991045668865', 0, 0, 8, 'I');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('cbfbb91e-0e6e-44ab-86be-47d5447e4f0f', '1356434156560584706', '1286857269673283585', '1286857269660700674', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d2133a9d-4c11-4332-ba59-53a58aae032b', '1461504905012441090', '1286857269673283586', '1286857269660700674', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d37a355b-7f8f-4706-8ddc-22029efab866', '1356433729043566593', '1286860480882757634', '1286860480865980417', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d46ef3a3-16b0-4acd-938e-726789c82eff', '1356434156560584706', '1286859363679555588', '1286859363650195458', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d472b846-a44e-445e-9841-a3619cf174a9', '1451091214807994370', '1286859119998881794', '1286859119977910274', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d4843aa3-c039-4385-8985-4a9aee5150f8', '1461506333319753729', '1461505894159347714', '1461505894142570497', 0, 1, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d6896ec6-2ad3-4e96-8a24-121804cf4d0b', '1461504905012441090', '1286857269677477889', '1286857269660700674', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d6c182c5-e3cb-43fc-86d7-f269fd17646d', '1461504905012441090', '1286860480882757634', '1286860480865980417', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d7603fd6-e625-4c36-8a06-ab197c6f9795', '1461506333319753729', '1286856991058251779', '1286856991045668865', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d84e8164-8c53-409b-a064-3c23ebd933a9', '1461506333319753729', '1286857269673283585', '1286857269660700674', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d86acb09-9fee-4782-b8d7-a7acf410f521', '1451071753757646850', '1286859710330392580', '1286859710305226754', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d89f9be5-794f-44e6-9922-39e286de3d32', '1451088836384817154', '1286859710330392579', '1286859710305226754', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d8ae55a2-c990-4724-9c97-acec0e01e8e3', '1451088836384817154', '1286859363679555586', '1286859363650195458', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('d9d2ba20-9f76-47af-9d8d-fef885e765ea', '1356433729043566593', '1286859710326198274', '1286859710305226754', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('daad2ec3-1484-4e29-afd2-ac506b29c018', '1356433729043566593', '1286859363675361282', '1286859363650195458', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('db79dbb8-6872-4236-839d-29651b3a22aa', '1356433729043566593', '1286856786221027330', '1286856786200055810', 1, 1, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ddfc85ef-3b2e-4946-a825-3d349b159167', '1461506333319753729', '1286856786216833026', '1286856786200055810', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('dfabd907-eed5-48e5-b893-1867fa2af3a0', '1461504905012441090', '1286860480878563329', '1286860480865980417', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('dfb2cd7f-bbcd-4084-9d1a-d84fd5aa81c7', '1356433729043566593', '1286858556800323587', '1286858556779352066', 1, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('dfb7bbc2-cf17-442a-9e1a-25b5fc8150e6', '1461504905012441090', '1286858826485682179', '1286858826460516353', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e0ba6fca-6019-4f87-8730-0c02ce8d8b0e', '1451071753757646850', '1286859710326198274', '1286859710305226754', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e1a6475d-3e96-4dd5-b3dd-b2e37dbc0b74', '1461504905012441090', '1286856503776595971', '1286856503755624449', 1, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e1e1fced-fb5e-4426-be47-cb6b8359c512', '1451071753757646850', '1286856991062446086', '1286856991045668865', 0, 0, 7, 'H');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e2cc183a-e6cc-43c7-832d-ac6a5eabfd49', '1461506333319753729', '1286859363679555587', '1286859363650195458', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e2df2f3d-3718-4f0a-8c95-428e7f4e1ae3', '1461504905012441090', '1286859120003076099', '1286859119977910274', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e349d2c0-0de9-4ba1-82ca-4fa54200fa71', '1451088836384817154', '1286858556800323587', '1286858556779352066', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e4cb2438-1f2e-4a79-90e3-43793edb4a3e', '1451088836384817154', '1286860480882757634', '1286860480865980417', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e62d7e08-a680-420c-b3a2-08060944255a', '1451088836384817154', '1286856991062446085', '1286856991045668865', 0, 0, 6, 'G');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e6a4e4cc-8594-4a30-b248-48047fc3ef9f', '1451091214807994370', '1286859710330392578', '1286859710305226754', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e79b33af-caf4-4991-903f-a4fc4aaed764', '1461504905012441090', '1286856786216833025', '1286856786200055810', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e7c6e9e9-f8fd-4571-8765-cb9a68ce9458', '1356433729043566593', '1286859710330392578', '1286859710305226754', 1, 1, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e8abc8f0-4fc8-4a1d-8c00-72ca9429f49a', '1461506333319753729', '1286859363679555588', '1286859363650195458', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('e92dbbaf-ee14-4b3f-b86c-599490b3241e', '1356433729043566593', '1286857269673283585', '1286857269660700674', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ea29d6bd-2c82-4564-add3-1ea9013f10fe', '1451088836384817154', '1286856786221027332', '1286856786200055810', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('eb423b41-5954-43e4-9fa8-7c70202e00f8', '1461506333319753729', '1286858826485682178', '1286858826460516353', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('eb4f3e29-dd97-491f-be08-2f92f40627d2', '1451071753757646850', '1286859363675361281', '1286859363650195458', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ec076a42-ff29-4ed7-8dda-a04fa9b4b927', '1451088836384817154', '1286859710334586881', '1286859710305226754', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ec571249-cc14-4ad8-8640-42633df269d9', '1451071753757646850', '1286859363679555586', '1286859363650195458', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ecd49cae-d2e1-418c-b5f4-cc07b70f6b78', '1461504905012441090', '1286859120003076100', '1286859119977910274', 1, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ed50a7f0-10df-4422-914a-04b288d7d90f', '1461506333319753729', '1286858826485682180', '1286858826460516353', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('eeb6d98f-173c-4a98-9901-f4ae6e5b15c8', '1451071753757646850', '1286859120003076098', '1286859119977910274', 0, 1, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('eed78278-d3eb-4641-ad28-2b513c1bbb4a', '1451071753757646850', '1286856786221027332', '1286856786200055810', 0, 1, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('ef4cfce8-31a8-4d8c-8d1a-306adaad965e', '1451091214807994370', '1286856786221027332', '1286856786200055810', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('efb2152a-a1a4-450f-9c6e-fd2a3b256a53', '1461506333319753729', '1286858826485682179', '1286858826460516353', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('efec25b9-9b2f-4059-a2b4-78e519b23f62', '1451091214807994370', '1286858556800323587', '1286858556779352066', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f14f569e-cedd-4ba7-aa17-bf6ba95e2a08', '1461506333319753729', '1286856786221027331', '1286856786200055810', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f1654d84-98b1-4726-a707-850781ade022', '1356434156560584706', '1286856991062446086', '1286856991045668865', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f2f6f95a-19ab-4fe2-869e-86712ce988bd', '1461506333319753729', '1286856991058251780', '1286856991045668865', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f41c24e7-d565-402d-9f2a-b94e5affc258', '1461504905012441090', '1286859120003076098', '1286859119977910274', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f4b8a486-015b-4c88-bd88-90bc40feb5b3', '1451088836384817154', '1286856991058251778', '1286856991045668865', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f517c800-35fc-4c91-8810-88966b418f21', '1461506333319753729', '1286857269677477890', '1286857269660700674', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f5cceaef-13b6-4fc7-932d-05c7312712a1', '1461504905012441090', '1286856503776595972', '1286856503755624449', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f60e4b3d-61cd-4da3-a2a6-51e677f0554b', '1356433729043566593', '1286856786216833025', '1286856786200055810', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f6b4e1b3-9263-42d4-bdb1-e5dc684f3b3c', '1451071753757646850', '1286860480882757634', '1286860480865980417', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f6d5f076-40c9-4b97-b55d-b1e4c80f72ca', '1461504905012441090', '1286859363675361281', '1286859363650195458', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f7643e5e-49ed-42f1-b15a-5c60c615b79e', '1356434156560584706', '1286859710326198274', '1286859710305226754', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f794df24-fc6a-4793-a3e7-81bb6fd1adc3', '1451071753757646850', '1286858826485682179', '1286858826460516353', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('f7a20de2-4db3-48e5-b8d3-7b1736269710', '1461504905012441090', '1286859710330392579', '1286859710305226754', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('faf3c960-d78e-41a4-8506-fe162438095a', '1356433729043566593', '1286859710330392579', '1286859710305226754', 0, 0, 0, 'A');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('faf43d9c-bbf6-443c-aaa8-bee2f7d8361a', '1356434156560584706', '1286859120003076098', '1286859119977910274', 0, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('fbbccade-9115-468d-8a0c-1a5adcf22c63', '1461506333319753729', '1286856786216833025', '1286856786200055810', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('fc61e389-ce6e-4229-b89a-efd3ff0b9684', '1461506333319753729', '1286858556800323587', '1286858556779352066', 1, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('fc8732da-9484-4dbe-b8c3-40c21c75f6f6', '1356433729043566593', '1286859120003076100', '1286859119977910274', 1, 0, 4, 'E');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('fd08dcd3-5209-4861-aaf6-f83584e447ee', '1461506333319753729', '1286856991058251778', '1286856991045668865', 0, 0, 1, 'B');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('fd6f66c9-f26d-4cab-94bb-430a4823e1da', '1461506333319753729', '1286856991062446082', '1286856991045668865', 1, 0, 5, 'F');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('fda56f8b-ff92-400a-b1cd-71896af18e29', '1451088836384817154', '1286859363679555587', '1286859363650195458', 1, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('fdf7e281-8992-4305-b2a5-27f8bdfb3d0a', '1451091214807994370', '1286860480886951937', '1286860480865980417', 0, 0, 3, 'D');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('fdfd9ba5-cac0-4a86-8f9b-eeae2b2b55e5', '1451088836384817154', '1286856991062446083', '1286856991045668865', 0, 0, 2, 'C');
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`) VALUES ('fe882846-ebec-49b0-8f62-e35ab868682c', '1451071753757646850', '1286858826485682178', '1286858826460516353', 0, 0, 0, 'A');
COMMIT;

-- ----------------------------
-- Table structure for el_qu
-- ----------------------------
DROP TABLE IF EXISTS `el_qu`;
CREATE TABLE `el_qu` (
  `id` varchar(64) NOT NULL COMMENT '题目ID',
  `qu_type` int(11) NOT NULL COMMENT '题目类型',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '1普通,2较难',
  `image` varchar(500) NOT NULL DEFAULT '' COMMENT '题目图片',
  `content` varchar(2000) NOT NULL COMMENT '题目内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '题目备注',
  `analysis` varchar(2000) NOT NULL DEFAULT '' COMMENT '整题解析',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_type` (`qu_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='问题题目';

-- ----------------------------
-- Records of el_qu
-- ----------------------------
BEGIN;
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286856503755624449', 1, 2, '', '汉期、赛斯、麦克、约翰逊共买苹果144个。汉期买的苹果比赛斯多10个，比麦克多26个，比约翰逊多32个。汉期买了多少个苹果？', '2020-07-25 10:51:13', '2020-07-25 10:51:13', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286856786200055810', 1, 2, '', '五个答案中哪个是最好的类比？女儿对于父亲相当于侄女对于', '2020-07-25 10:52:21', '2020-07-25 10:52:21', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286856991045668865', 1, 2, '', '找出下列数字中多余的一个：', '2020-07-25 10:53:09', '2020-07-25 10:53:09', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286857269660700674', 1, 2, '', '五个答案中哪个是最好的类比？皮对于树相当于鳞对于', '2020-07-25 10:54:16', '2020-07-25 10:54:16', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286858556779352066', 1, 2, '', '火车守车(车尾)长6.4米。机车的长度等于守车的长加上半节车厢的长。车厢长度等于守车长加上机车长。火车的机车、车厢、守车共长多少米？', '2020-07-25 10:59:23', '2020-07-25 10:59:23', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286858826460516353', 1, 2, '', '角对于元相当于小时对于', '2020-07-25 11:00:27', '2020-07-25 11:00:27', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286859119977910274', 1, 2, '', '如果把这个大立方体的六个面全部涂上黑色，然后按图中虚线把它切成36个小方块，两面有黑色的小方块有多少个？', '2020-07-25 11:01:37', '2020-07-25 11:01:37', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286859363650195458', 1, 2, '', '找出与众不同的一个：', '2020-07-25 11:02:35', '2020-07-25 11:02:35', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286859710305226754', 1, 2, '', '图中阴影部分占面积百分之几？', '2020-07-25 11:03:58', '2020-07-25 11:03:58', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286860480865980417', 1, 2, 'http://localhost:8101/upload/file/2021/10/21/1451088569614499842.png', '数数有多少个三角形', '2020-07-25 11:07:02', '2020-07-25 11:07:02', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1461505492353413121', 2, 1, '', '以下哪些是中国的特别行政区？', '2021-11-19 09:23:57', '2021-11-19 09:23:57', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1461505751183912961', 2, 1, '', '中国东北三省是指（）', '2021-11-19 09:24:59', '2021-11-19 09:24:59', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1461505894142570497', 3, 1, '', '咖啡的故乡是非洲吗？', '2021-11-19 09:25:33', '2021-11-19 09:25:33', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1461506028981055490', 3, 1, '', '世界上最长的山脉安第斯山脉', '2021-11-19 09:26:05', '2021-11-19 09:26:05', '', '');
COMMIT;

-- ----------------------------
-- Table structure for el_qu_answer
-- ----------------------------
DROP TABLE IF EXISTS `el_qu_answer`;
CREATE TABLE `el_qu_answer` (
  `id` varchar(64) NOT NULL COMMENT '答案ID',
  `qu_id` varchar(64) NOT NULL COMMENT '问题ID',
  `is_right` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否正确',
  `image` varchar(500) NOT NULL DEFAULT '' COMMENT '选项图片',
  `content` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案内容',
  `analysis` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案分析',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='候选答案';

-- ----------------------------
-- Records of el_qu_answer
-- ----------------------------
BEGIN;
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856503772401665', '1286856503755624449', 0, '', '73', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856503776595970', '1286856503755624449', 0, '', '63', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856503776595971', '1286856503755624449', 1, '', '53', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856503776595972', '1286856503755624449', 0, '', '43', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856503776595973', '1286856503755624449', 0, '', '27', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856786216833025', '1286856786200055810', 0, '', '侄子', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856786216833026', '1286856786200055810', 0, '', '表兄', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856786221027330', '1286856786200055810', 1, '', '叔叔', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856786221027331', '1286856786200055810', 0, '', '母亲', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856786221027332', '1286856786200055810', 0, '', '哥哥', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991058251778', '1286856991045668865', 0, '', '4', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991058251779', '1286856991045668865', 0, '', '5', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991058251780', '1286856991045668865', 0, '', '8', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446081', '1286856991045668865', 0, '', '10', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446082', '1286856991045668865', 1, '', '11', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446083', '1286856991045668865', 0, '', '16', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446084', '1286856991045668865', 0, '', '19', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446085', '1286856991045668865', 0, '', '32', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446086', '1286856991045668865', 0, '', '36', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286857269673283585', '1286857269660700674', 0, '', '鳃', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286857269673283586', '1286857269660700674', 0, '', '大海', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286857269673283587', '1286857269660700674', 0, '', '渔夫', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286857269677477889', '1286857269660700674', 1, '', '鱼', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286857269677477890', '1286857269660700674', 0, '', '鳍', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858556800323585', '1286858556779352066', 0, '', '25.6米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858556800323586', '1286858556779352066', 0, '', '36米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858556800323587', '1286858556779352066', 1, '', '51.2米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858556800323588', '1286858556779352066', 0, '', '64.4米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858556804517889', '1286858556779352066', 0, '', '76.2米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858826477293569', '1286858826460516353', 1, '', '分', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858826485682178', '1286858826460516353', 0, '', '秒', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858826485682179', '1286858826460516353', 0, '', '月', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858826485682180', '1286858826460516353', 0, '', '日', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858826485682181', '1286858826460516353', 0, '', '钟', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859119998881794', '1286859119977910274', 0, '', '8', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859120003076098', '1286859119977910274', 0, '', '10', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859120003076099', '1286859119977910274', 0, '', '12', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859120003076100', '1286859119977910274', 1, '', '16', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859120007270402', '1286859119977910274', 0, '', '20', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859363675361281', '1286859363650195458', 0, '', '南昌', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859363675361282', '1286859363650195458', 0, '', '西安', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859363679555586', '1286859363650195458', 0, '', '郑州', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859363679555587', '1286859363650195458', 1, '', '哈尔滨', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859363679555588', '1286859363650195458', 0, '', '昆明', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859710326198274', '1286859710305226754', 0, '', '20%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859710330392578', '1286859710305226754', 1, '', '25% ', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859710330392579', '1286859710305226754', 0, '', '30%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859710330392580', '1286859710305226754', 0, '', '35%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859710334586881', '1286859710305226754', 0, '', '40%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286860480878563329', '1286860480865980417', 0, 'http://localhost:8101/upload/file/2021/10/21/1451088637159571458.png', '5', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286860480882757634', '1286860480865980417', 0, '', '7', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286860480882757635', '1286860480865980417', 0, 'http://localhost:8101/upload/file/2021/10/21/1451088685704445953.png', '9', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286860480882757636', '1286860480865980417', 1, '', '11', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286860480886951937', '1286860480865980417', 0, '', '13', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505492391161858', '1461505492353413121', 1, '', '香港', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505492395356161', '1461505492353413121', 1, '', '澳门', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505492395356162', '1461505492353413121', 0, '', '珠海', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505492395356163', '1461505492353413121', 0, '', '重庆', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505751196495873', '1461505751183912961', 1, '', '黑龙江省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505751200690177', '1461505751183912961', 1, '', '吉林省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505751200690178', '1461505751183912961', 1, '', '辽宁省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505751200690179', '1461505751183912961', 0, '', '河北省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505894155153409', '1461505894142570497', 1, '', '正确', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505894159347714', '1461505894142570497', 0, '', '错误', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461506028993638401', '1461506028981055490', 1, '', '正确', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461506028993638402', '1461506028981055490', 0, '', '错误', '');
COMMIT;

-- ----------------------------
-- Table structure for el_qu_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_qu_repo`;
CREATE TABLE `el_qu_repo` (
  `id` varchar(64) NOT NULL,
  `qu_id` varchar(64) NOT NULL COMMENT '试题',
  `repo_id` varchar(64) NOT NULL COMMENT '归属题库',
  `qu_type` int(11) NOT NULL DEFAULT '0' COMMENT '题目类型',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试题题库';

-- ----------------------------
-- Records of el_qu_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917208915591170', '1286863891812405250', '1265561101609795585', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917208940756993', '1286863586148306945', '1265561101609795585', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917208957534209', '1286862562465501185', '1265561101609795585', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209184026625', '1286856270095142913', '1265561101609795585', 1, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209213386754', '1286856130881998850', '1265561101609795585', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209234358274', '1286855888933572610', '1265561101609795585', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209255329794', '1286855625946517506', '1265561101609795585', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209284689922', '1286855293522759681', '1265561101609795585', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209305661441', '1286854982146019329', '1265561101609795585', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209330827266', '1286854691942125570', '1265561101609795585', 1, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209355993090', '1286854455957999617', '1265561101609795585', 1, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209381158913', '1286854225275473921', '1265561101609795585', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209406324738', '1286853998313295874', '1265561101609795585', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209431490561', '1286853734541905921', '1265561101609795585', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209452462081', '1286853481637957634', '1265561101609795585', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209473433601', '1286853276834287617', '1265561101609795585', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209502793729', '1286853081350361089', '1265561101609795585', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209519570946', '1286852847618576385', '1265561101609795585', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209540542465', '1286852596111331329', '1265561101609795585', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209565708290', '1286852328741228545', '1265561101609795585', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209586679809', '1286852069432578050', '1265561101609795585', 1, 21);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209607651329', '1286851474533470209', '1265561101609795585', 1, 22);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209628622850', '1286851033166860289', '1265561101609795585', 1, 23);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1288732611425910786', '1288732611354607618', '1265561101609795585', 4, 24);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1288732739364765698', '1288732739331211266', '1265561101609795585', 4, 25);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1288732806037422082', '1288732805995479041', '1265561101609795585', 4, 26);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1288732889676038145', '1288732889634095105', '1265561101609795585', 4, 27);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1288732994294562818', '1288732994244231169', '1265561101609795585', 4, 28);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289451760421343234', '1289451350763671554', '1289451674266144770', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289452450967359489', '1289452449356746754', '1289451674266144770', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289453571878326274', '1289453570242547714', '1289451674266144770', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289454236239302658', '1289454234880348161', '1289451674266144770', 4, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289458747573964801', '1289458693232562177', '1289451674266144770', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289459007058776066', '1289459005381054465', '1289451674266144770', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289459196683259906', '1289459195177504769', '1289451674266144770', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289459624795869185', '1289459623126536193', '1289451674266144770', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289474376330809345', '1289474314263498754', '1289451674266144770', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289474557273083905', '1289474556119650305', '1289451674266144770', 4, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289475133708865537', '1289475132563820546', '1289451674266144770', 4, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293151273635561474', '1293150420467990530', '1265561101609795585', 1, 29);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293317368904454145', '1293317368443080706', '1265561101609795585', 1, 30);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293318286790103041', '1293318285368233985', '1265561101609795585', 1, 31);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293318979924037633', '1293318978334396418', '1265561101609795585', 1, 32);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293319052326113281', '1293319052204478465', '1265561101609795585', 1, 33);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293321638768840706', '1293321638676566017', '1265561101609795585', 1, 34);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293324967540461570', '1293324967427215362', '1265561101609795585', 1, 35);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293338978639941633', '1293338978321174529', '1265561101609795585', 2, 36);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1302610176209121282', '1289475783523995650', '1265561101609795585', 4, 37);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1304704900306857985', '1304704900113920001', '1265561101609795585', 4, 38);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1316945876914327553', '1289471729733373953', '1289451674266144770', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1316945963988078594', '1289471480130342913', '1289451674266144770', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1316946023257788418', '1289471133567586305', '1289451674266144770', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127299303936001', '1289473900633821186', '1265561101609795585', 1, 39);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127879761956865', '1289473577370423297', '1265561101609795585', 3, 40);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127880076529666', '1289473379982282753', '1265561101609795585', 3, 41);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127880294633473', '1289473193486749697', '1265561101609795585', 3, 42);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127880567263233', '1289472863202086914', '1265561101609795585', 3, 43);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127880776978434', '1289453247356637186', '1265561101609795585', 3, 44);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127880932167681', '1288732225914847234', '1265561101609795585', 3, 45);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127950331121666', '1293347439817908225', '1265561101609795585', 2, 46);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127950532448257', '1289458348364304385', '1265561101609795585', 2, 47);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127950679248898', '1289452973904793602', '1265561101609795585', 2, 48);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127950838632449', '1288733204697628674', '1265561101609795585', 2, 49);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127951035764737', '1288731653644009473', '1265561101609795585', 2, 50);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416772810498049', '1356416772491730946', '1265561101609795585', 1, 51);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416773137653762', '1356416773066350594', '1265561101609795585', 1, 52);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416773603221505', '1356416773519335426', '1265561101609795585', 1, 53);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416773829713921', '1356416773770993666', '1265561101609795585', 1, 54);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416774068789250', '1356416774014263298', '1265561101609795585', 1, 55);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416774303670274', '1356416774240755713', '1265561101609795585', 1, 56);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416774580494337', '1356416774530162690', '1265561101609795585', 1, 57);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416774844735489', '1356416774790209538', '1265561101609795585', 1, 58);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416775125753857', '1356416775046062082', '1265561101609795585', 1, 59);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416775360634881', '1356416775306108929', '1265561101609795585', 1, 60);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416775561961473', '1356416775520018433', '1265561101609795585', 1, 61);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416775729733633', '1356416775700373505', '1265561101609795585', 1, 62);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416775918477314', '1356416775889117185', '1265561101609795585', 1, 63);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416776082055170', '1356416776048500737', '1265561101609795585', 1, 64);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416776237244418', '1356416776199495682', '1265561101609795585', 1, 65);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416776413405186', '1356416776375656450', '1265561101609795585', 1, 66);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416776652480513', '1356416776602148865', '1265561101609795585', 1, 67);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416776937693185', '1356416776883167233', '1265561101609795585', 1, 68);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416777193545730', '1356416777151602690', '1265561101609795585', 1, 69);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416777482952705', '1356416777449398274', '1265561101609795585', 1, 70);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416777772359681', '1356416777713639425', '1265561101609795585', 1, 71);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416778086932481', '1356416778040795137', '1265561101609795585', 1, 72);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416778405699586', '1356416778346979329', '1265561101609795585', 1, 73);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416778615414785', '1356416778586054658', '1265561101609795585', 1, 74);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416778829324289', '1356416778787381249', '1265561101609795585', 1, 75);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416779034845186', '1356416779009679362', '1265561101609795585', 1, 76);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416779219394561', '1356416779190034434', '1265561101609795585', 1, 77);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416779529773058', '1356416779492024321', '1265561101609795585', 1, 78);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416779731099649', '1356416779705933825', '1265561101609795585', 1, 79);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416779890483201', '1356416779865317378', '1265561101609795585', 1, 80);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416780041478145', '1356416780016312322', '1265561101609795585', 1, 81);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416780280553474', '1356416780242804738', '1265561101609795585', 1, 82);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416780502851585', '1356416780469297153', '1265561101609795585', 1, 83);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416780716761089', '1356416780687400962', '1265561101609795585', 2, 84);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416780947447809', '1356416780918087682', '1265561101609795585', 3, 85);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781182328834', '1356416781152968706', '1265561101609795585', 2, 86);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781350100993', '1356416781329129473', '1289451674266144770', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781404626946', '1356416781383655426', '1289451674266144770', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781484318722', '1356416781438181378', '1265561101609795585', 2, 87);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781639507969', '1356416781622730754', '1265561101609795585', 3, 88);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781782114306', '1356416781761142785', '1289451674266144770', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781845028866', '1356416781824057346', '1265561101609795585', 2, 89);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781996023809', '1356416781975052290', '1289451674266144770', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782084104193', '1356416782046355458', '1289451674266144770', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782147018753', '1356416782126047233', '1289451674266144770', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782230904834', '1356416782201544706', '1289451674266144770', 1, 21);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782314790913', '1356416782285430786', '1289451674266144770', 1, 22);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782411259906', '1356416782365122561', '1289451674266144770', 1, 23);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782511923202', '1356416782478368769', '1289451674266144770', 1, 24);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782600003585', '1356416782570643458', '1265561101609795585', 3, 90);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782847467521', '1356416782805524482', '1265561101609795585', 3, 91);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416783157846018', '1356416783124291586', '1265561101609795585', 3, 92);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416783413698561', '1356416783384338434', '1265561101609795585', 3, 93);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416783648579585', '1356416783615025154', '1265561101609795585', 1, 94);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416783912820738', '1356416783879266305', '1265561101609795585', 2, 95);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417334901796865', '1356417334570446849', '1265561101609795585', 1, 96);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417335518359554', '1356417335409307650', '1265561101609795585', 1, 97);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417336101367810', '1356417336055230465', '1265561101609795585', 1, 98);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417336508215298', '1356417336420134913', '1265561101609795585', 1, 99);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417336990560257', '1356417336927645698', '1265561101609795585', 1, 100);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417408000126978', '1356417407920435201', '1265561101609795585', 1, 101);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417408453111810', '1356417408386002946', '1265561101609795585', 1, 102);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417408826404866', '1356417408780267522', '1265561101609795585', 1, 103);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417409220669442', '1356417409178726401', '1265561101609795585', 1, 104);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417409522659330', '1356417409480716289', '1265561101609795585', 1, 105);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417409900146690', '1356417409845620737', '1265561101609795585', 1, 106);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417410298605569', '1356417410260856833', '1265561101609795585', 1, 107);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417410701258753', '1356417410621566978', '1265561101609795585', 1, 108);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417411024220162', '1356417410982277122', '1265561101609795585', 1, 109);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417411414290434', '1356417411372347394', '1265561101609795585', 1, 110);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417411770806273', '1356417411728863233', '1265561101609795585', 1, 111);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417412093767681', '1356417412060213250', '1265561101609795585', 1, 112);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417412416729089', '1356417412374786049', '1265561101609795585', 1, 113);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417412722913281', '1356417412680970242', '1265561101609795585', 1, 114);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417413016514562', '1356417412987154434', '1265561101609795585', 1, 115);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417413284950018', '1356417413234618370', '1265561101609795585', 1, 116);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417413570162690', '1356417413536608257', '1265561101609795585', 1, 117);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417413826015233', '1356417413796655105', '1265561101609795585', 1, 118);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417414052507649', '1356417414027341825', '1265561101609795585', 1, 119);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417414299971585', '1356417414279000066', '1265561101609795585', 1, 120);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417414534852610', '1356417414505492482', '1265561101609795585', 1, 121);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417414807482369', '1356417414769733633', '1265561101609795585', 1, 122);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417415101083649', '1356417415059140609', '1265561101609795585', 1, 123);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417415398879234', '1356417415369519106', '1265561101609795585', 1, 124);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417415671508994', '1356417415625371649', '1265561101609795585', 1, 125);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417415914778626', '1356417415885418498', '1265561101609795585', 1, 126);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417416141271042', '1356417416111910913', '1265561101609795585', 1, 127);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417416388734977', '1356417416363569154', '1265561101609795585', 1, 128);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417416648781825', '1356417416619421697', '1265561101609795585', 1, 129);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417416892051457', '1356417416871079938', '1265561101609795585', 1, 130);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417417122738177', '1356417417097572354', '1265561101609795585', 1, 131);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417417391173633', '1356417417361813505', '1265561101609795585', 1, 132);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417417667997697', '1356417417630248961', '1265561101609795585', 1, 133);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417417944821762', '1356417417915461633', '1265561101609795585', 2, 134);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417418246811649', '1356417418217451521', '1265561101609795585', 3, 135);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417418582355969', '1356417418552995842', '1265561101609795585', 2, 136);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417418913705986', '1356417418871762946', '1289451674266144770', 1, 25);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417419014369282', '1356417418985009154', '1289451674266144770', 1, 26);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417419173752833', '1356417419110838274', '1265561101609795585', 2, 137);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417419551240194', '1356417419505102850', '1265561101609795585', 3, 138);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417419970670593', '1356417419945504769', '1289451674266144770', 1, 27);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420100694018', '1356417420054556674', '1265561101609795585', 2, 139);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420402683905', '1356417420373323778', '1289451674266144770', 1, 28);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420520124417', '1356417420486569985', '1289451674266144770', 1, 29);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420604010497', '1356417420583038978', '1289451674266144770', 1, 30);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420704673794', '1356417420675313665', '1289451674266144770', 1, 31);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420801142785', '1356417420771782657', '1289451674266144770', 1, 32);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420910194689', '1356417420872445954', '1289451674266144770', 1, 33);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417421019246593', '1356417420994080769', '1289451674266144770', 1, 34);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417421128298497', '1356417421094744065', '1265561101609795585', 3, 140);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417421384151041', '1356417421367373826', '1265561101609795585', 3, 141);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417421681946626', '1356417421656780802', '1265561101609795585', 3, 142);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417422009102338', '1356417421983936513', '1265561101609795585', 3, 143);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417422269149186', '1356417422239789058', '1265561101609795585', 1, 144);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417422541778945', '1356417422516613121', '1265561101609795585', 2, 145);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418022063009793', '1356418022004289538', '1265561101609795585', 1, 146);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418022377582594', '1356418022348222465', '1265561101609795585', 1, 147);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418022683766786', '1356418022658600961', '1265561101609795585', 1, 148);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418023031894017', '1356418022998339585', '1265561101609795585', 1, 149);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418023321300994', '1356418023291940865', '1265561101609795585', 1, 150);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418114866180097', '1356418114824237058', '1265561101609795585', 1, 151);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418115231084545', '1356418115201724418', '1265561101609795585', 1, 152);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418115549851650', '1356418115516297218', '1265561101609795585', 1, 153);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418115872813058', '1356418115830870018', '1265561101609795585', 1, 154);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418116162220033', '1356418116137054209', '1265561101609795585', 1, 155);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418116443238402', '1356418116409683970', '1265561101609795585', 1, 156);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418116749422593', '1356418116715868162', '1265561101609795585', 1, 157);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418117084966914', '1356418117055606786', '1265561101609795585', 1, 158);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418117361790977', '1356418117332430850', '1265561101609795585', 1, 159);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418117630226433', '1356418117600866306', '1265561101609795585', 1, 160);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418117902856194', '1356418117877690369', '1265561101609795585', 1, 161);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418118183874561', '1356418118158708737', '1265561101609795585', 1, 162);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418118511030273', '1356418118481670145', '1265561101609795585', 1, 163);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418118821408769', '1356418118796242946', '1265561101609795585', 1, 164);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418119094038529', '1356418119068872705', '1265561101609795585', 1, 165);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418119354085377', '1356418119333113857', '1265561101609795585', 1, 166);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418119639298050', '1356418119618326530', '1265561101609795585', 1, 167);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418119903539201', '1356418119878373378', '1265561101609795585', 1, 168);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418120146808833', '1356418120125837313', '1265561101609795585', 1, 169);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418120398467074', '1356418120381689858', '1265561101609795585', 1, 170);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418120658513921', '1356418120637542401', '1265561101609795585', 1, 171);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418120977281025', '1356418120943726594', '1265561101609795585', 1, 172);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418121296048130', '1356418121241522177', '1265561101609795585', 1, 173);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418121639981057', '1356418121610620930', '1265561101609795585', 1, 174);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418121925193729', '1356418121908416514', '1265561101609795585', 1, 175);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418122239766529', '1356418122206212097', '1265561101609795585', 1, 176);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418122541756418', '1356418122516590594', '1265561101609795585', 1, 177);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418122868912130', '1356418122843746305', '1265561101609795585', 1, 178);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418123175096321', '1356418123145736194', '1265561101609795585', 1, 179);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418123456114689', '1356418123439337473', '1265561101609795585', 1, 180);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418123741327361', '1356418123720355841', '1265561101609795585', 1, 181);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418123997179905', '1356418123980402689', '1265561101609795585', 1, 182);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418124282392577', '1356418124248838145', '1265561101609795585', 1, 183);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418124563410946', '1356418124546633730', '1265561101609795585', 2, 184);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418124827652097', '1356418124815069186', '1265561101609795585', 3, 185);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418125125447681', '1356418125096087554', '1265561101609795585', 2, 186);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418125440020482', '1356418125423243265', '1289451674266144770', 1, 35);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418125515517954', '1356418125494546434', '1289451674266144770', 1, 36);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418125599404034', '1356418125574238209', '1265561101609795585', 2, 187);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418125876228098', '1356418125859450881', '1265561101609795585', 3, 188);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126161440769', '1356418126140469250', '1289451674266144770', 1, 37);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126236938241', '1356418126220161026', '1265561101609795585', 2, 189);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126530539522', '1356418126513762306', '1289451674266144770', 1, 38);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126606036994', '1356418126589259777', '1289451674266144770', 1, 39);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126685728770', '1356418126668951554', '1289451674266144770', 1, 40);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126769614850', '1356418126752837633', '1289451674266144770', 1, 41);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126853500930', '1356418126832529410', '1289451674266144770', 1, 42);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126945775618', '1356418126924804097', '1289451674266144770', 1, 43);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418127029661698', '1356418127012884482', '1289451674266144770', 1, 44);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418127142907905', '1356418127121936385', '1265561101609795585', 3, 190);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418127428120578', '1356418127411343361', '1265561101609795585', 3, 191);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418127704944642', '1356418127688167426', '1265561101609795585', 3, 192);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418128040488962', '1356418128019517442', '1265561101609795585', 3, 193);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418128359256066', '1356418128329895937', '1265561101609795585', 1, 194);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418128849989634', '1356418128829018114', '1265561101609795585', 2, 195);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424089304039425', '1286859710305226754', '1265561101609795585', 1, 196);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424089849298945', '1286859363650195458', '1265561101609795585', 1, 197);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424090415529985', '1286859119977910274', '1265561101609795585', 1, 198);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424091002732545', '1286858826460516353', '1265561101609795585', 1, 199);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424091942256641', '1286858556779352066', '1265561101609795585', 1, 200);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424092911140865', '1286857269660700674', '1265561101609795585', 1, 201);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424093372514305', '1286856991045668865', '1265561101609795585', 1, 202);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424093720641537', '1286856786200055810', '1265561101609795585', 1, 203);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424094295261186', '1286856503755624449', '1265561101609795585', 1, 204);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1451088692063010817', '1286860480865980417', '1265561101609795585', 1, 205);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1461505492458270722', '1461505492353413121', '1265561101609795585', 2, 206);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1461505751213273090', '1461505751183912961', '1265561101609795585', 2, 207);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1461505894167736321', '1461505894142570497', '1265561101609795585', 3, 208);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1461506029002027009', '1461506028981055490', '1265561101609795585', 3, 209);
COMMIT;

-- ----------------------------
-- Table structure for el_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_repo`;
CREATE TABLE `el_repo` (
  `id` varchar(64) NOT NULL COMMENT '题库ID',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '题库编号',
  `title` varchar(255) NOT NULL COMMENT '题库名称',
  `radio_count` int(11) NOT NULL DEFAULT '0' COMMENT '单选数量',
  `multi_count` int(11) NOT NULL DEFAULT '0' COMMENT '多选数量',
  `judge_count` int(11) NOT NULL DEFAULT '0' COMMENT '判断数量',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '题库备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库';

-- ----------------------------
-- Records of el_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_repo` (`id`, `code`, `title`, `radio_count`, `multi_count`, `judge_count`, `remark`, `create_time`, `update_time`) VALUES ('1265561101609795585', '新人入职培训题库', '演示题库', 153, 23, 26, '此题库为演示题库', '2020-05-27 16:30:54', '2020-05-27 16:30:54');
COMMIT;

-- ----------------------------
-- Table structure for el_user_book
-- ----------------------------
DROP TABLE IF EXISTS `el_user_book`;
CREATE TABLE `el_user_book` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `exam_id` varchar(32) NOT NULL COMMENT '考试ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `qu_id` varchar(64) NOT NULL COMMENT '题目ID',
  `create_time` datetime DEFAULT NULL COMMENT '加入时间',
  `update_time` datetime DEFAULT NULL COMMENT '最近错误时间',
  `wrong_count` int(11) NOT NULL COMMENT '错误时间',
  `title` varchar(1000) NOT NULL COMMENT '题目标题',
  `sort` int(11) NOT NULL COMMENT '错题序号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `sort` (`sort`),
  KEY `exam_id` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错题本';

-- ----------------------------
-- Records of el_user_book
-- ----------------------------
BEGIN;
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854537142273', '1356425140212076545', '10001', '1286856503755624449', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 4, '汉期、赛斯、麦克、约翰逊共买苹果144个。汉期买的苹果比赛斯多10个，比麦克多26个，比约翰逊多32个。汉期买了多少个苹果？', 1);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854566502401', '1356425140212076545', '10001', '1286857269660700674', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 4, '五个答案中哪个是最好的类比？皮对于树相当于鳞对于', 2);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854600056834', '1356425140212076545', '10001', '1286856991045668865', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 4, '找出下列数字中多余的一个：', 3);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854633611266', '1356425140212076545', '10001', '1286859363650195458', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 4, '找出与众不同的一个：', 4);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854662971393', '1356425140212076545', '10001', '1286859119977910274', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 4, '如果把这个大立方体的六个面全部涂上黑色，然后按图中虚线把它切成36个小方块，两面有黑色的小方块有多少个？', 5);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854700720130', '1356425140212076545', '10001', '1286858826460516353', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 4, '角对于元相当于小时对于', 6);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854746857474', '1356425140212076545', '10001', '1286858556779352066', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 3, '火车守车(车尾)长6.4米。机车的长度等于守车的长加上半节车厢的长。车厢长度等于守车长加上机车长。火车的机车、车厢、守车共长多少米？', 7);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1451071866911580161', '1356425140212076545', '10001', '1286859710305226754', '2021-10-21 14:24:27', '2021-10-21 14:24:27', 3, '图中阴影部分占面积百分之几？', 8);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1451071866953523201', '1356425140212076545', '10001', '1286856786200055810', '2021-10-21 14:24:27', '2021-10-21 14:24:27', 3, '五个答案中哪个是最好的类比？女儿对于父亲相当于侄女对于', 9);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1451071866987077633', '1356425140212076545', '10001', '1286860480865980417', '2021-10-21 14:24:27', '2021-10-21 14:24:27', 3, '数数有多少个三角形', 10);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950365450241', '1356425140212076545', '1252125239901696002', '1286859710305226754', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 1, '图中阴影部分占面积百分之几？', 1);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950394810369', '1356425140212076545', '1252125239901696002', '1286856503755624449', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 1, '汉期、赛斯、麦克、约翰逊共买苹果144个。汉期买的苹果比赛斯多10个，比麦克多26个，比约翰逊多32个。汉期买了多少个苹果？', 2);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950419976194', '1356425140212076545', '1252125239901696002', '1286858556779352066', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '火车守车(车尾)长6.4米。机车的长度等于守车的长加上半节车厢的长。车厢长度等于守车长加上机车长。火车的机车、车厢、守车共长多少米？', 3);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950440947714', '1356425140212076545', '1252125239901696002', '1286856786200055810', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '五个答案中哪个是最好的类比？女儿对于父亲相当于侄女对于', 4);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950461919233', '1356425140212076545', '1252125239901696002', '1286857269660700674', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '五个答案中哪个是最好的类比？皮对于树相当于鳞对于', 5);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950491279361', '1356425140212076545', '1252125239901696002', '1286858826460516353', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '角对于元相当于小时对于', 6);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950524833793', '1356425140212076545', '1252125239901696002', '1286859119977910274', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 1, '如果把这个大立方体的六个面全部涂上黑色，然后按图中虚线把它切成36个小方块，两面有黑色的小方块有多少个？', 7);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950549999618', '1356425140212076545', '1252125239901696002', '1286859363650195458', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '找出与众不同的一个：', 8);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950570971138', '1356425140212076545', '1252125239901696002', '1286856991045668865', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '找出下列数字中多余的一个：', 9);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950596136962', '1356425140212076545', '1252125239901696002', '1286860480865980417', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 1, '数数有多少个三角形', 10);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461506451158724609', '1356425140212076545', '1252125239901696002', '1461505751183912961', '2021-11-19 09:27:46', '2021-11-19 09:27:46', 1, '中国东北三省是指（）', 11);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461506451175501826', '1356425140212076545', '1252125239901696002', '1461505492353413121', '2021-11-19 09:27:46', '2021-11-19 09:27:46', 1, '以下哪些是中国的特别行政区？', 12);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461506451192279042', '1356425140212076545', '1252125239901696002', '1461505894142570497', '2021-11-19 09:27:46', '2021-11-19 09:27:46', 1, '咖啡的故乡是非洲吗？', 13);
COMMIT;

-- ----------------------------
-- Table structure for el_user_exam
-- ----------------------------
DROP TABLE IF EXISTS `el_user_exam`;
CREATE TABLE `el_user_exam` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `exam_id` varchar(32) NOT NULL COMMENT '考试ID',
  `try_count` int(11) NOT NULL DEFAULT '1' COMMENT '考试次数',
  `max_score` int(11) NOT NULL DEFAULT '0' COMMENT '最高分数',
  `passed` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录';

-- ----------------------------
-- Records of el_user_exam
-- ----------------------------
BEGIN;
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `create_time`, `update_time`) VALUES ('1356433854360981505', '10001', '1356425140212076545', 4, 30, 0, '2021-02-02 10:46:47', '2021-10-21 15:43:57');
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `create_time`, `update_time`) VALUES ('1461504950206066690', '1252125239901696002', '1356425140212076545', 2, 10, 0, '2021-11-19 09:21:48', '2021-11-19 09:27:46');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `site_name` varchar(255) DEFAULT NULL COMMENT '系统名称',
  `front_logo` varchar(255) DEFAULT NULL COMMENT '前端LOGO',
  `back_logo` varchar(255) DEFAULT NULL COMMENT '后台LOGO',
  `copy_right` varchar(255) DEFAULT NULL COMMENT '版权信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) DEFAULT '' COMMENT '修改人',
  `data_flag` int(11) DEFAULT '0' COMMENT '数据标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统设置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`id`, `site_name`, `front_logo`, `back_logo`, `copy_right`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1', '云帆在线培训考试系统', NULL, NULL, NULL, '2020-12-03 16:51:30', '2020-12-03 16:51:30', '', '', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart`;
CREATE TABLE `sys_depart` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `dept_type` int(11) NOT NULL DEFAULT '1' COMMENT '1公司2部门',
  `parent_id` varchar(32) NOT NULL COMMENT '所属上级',
  `dept_name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `dept_code` varchar(255) NOT NULL DEFAULT '' COMMENT '部门编码',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门信息';

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
BEGIN;
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302853644578000898', 1, '0', '北京云帆互联科技有限公司', 'A01', 1);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302855940200284161', 1, '1302855776496599041', '后端组', 'A01A01A01', 2);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302855994843676674', 1, '1302855776496599041', '前端组', 'A01A01A02', 1);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302856017283203073', 1, '1302855776496599041', '产品组', 'A01A01A03', 3);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302856084475953154', 1, '1302855776496599041', '测试组', 'A01A01A05', 5);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302856266567467010', 1, '1302855896415944705', '客户一组', 'A01A05A01', 1);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302856320602685442', 1, '1302855896415944705', '客服二组', 'A01A05A02', 2);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1318103313740320770', 1, '1302853644578000898', '技术部', 'A01A01', 1);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1318103339229106178', 1, '1302853644578000898', '人事部', 'A01A02', 2);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1318103362494910465', 1, '1302853644578000898', '财务部', 'A01A03', 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '角色ID',
  `role_name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `role_name`) VALUES ('sa', '超级管理员');
INSERT INTO `sys_role` (`id`, `role_name`) VALUES ('student', '学员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '密码盐',
  `role_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '角色列表',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `data_flag` int(11) NOT NULL DEFAULT '0' COMMENT '0正常,1隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `user_name`, `real_name`, `password`, `salt`, `role_ids`, `depart_id`, `create_time`, `update_time`, `state`, `data_flag`) VALUES ('10001', 'admin', '超管A', '06681cd08837b21adf6b5ef9279d403d', 'XoFFuS', 'sa', '1318103313740320770', '2020-04-20 13:51:03', '2020-04-20 13:51:03', 0, 0);
INSERT INTO `sys_user` (`id`, `user_name`, `real_name`, `password`, `salt`, `role_ids`, `depart_id`, `create_time`, `update_time`, `state`, `data_flag`) VALUES ('1252125239901696002', 'person', '张三', '6dfdd6761a3e8319719f32abb9aeae9c', 'tZCjLq', 'student', '1318103339229106178', '2020-04-20 14:41:35', '2020-04-20 14:41:35', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES ('1318103579445284865', '10001', 'sa');
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES ('1318128865264132097', '1252125239901696002', 'student');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
