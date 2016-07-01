/*
Navicat MySQL Data Transfer

Source Server         : 101.251.198.175
Source Server Version : 50173
Source Host           : 101.251.198.175:3306
Source Database       : cnlive_live

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-10-19 14:33:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_activity`
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `epg_name` varchar(50) DEFAULT NULL COMMENT 'epg 条目名称',
  `description` varchar(500) DEFAULT NULL COMMENT '活动描述',
  `place` varchar(255) DEFAULT NULL COMMENT '活动地点',
  `state` tinyint(2) DEFAULT NULL COMMENT '状态：0：未开始 1：直播中 2：结束 3: 回放同步中 4：同步完成',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `contact_user` varchar(255) DEFAULT NULL COMMENT '业务负责人+联系电话',
  `user_id` int(11) DEFAULT NULL COMMENT '当前活动建立者',
  `v_count` int(11) DEFAULT NULL COMMENT '并发数',
  `is_free` tinyint(2) DEFAULT NULL COMMENT '是否免费： 0：收费  1：免费',
  `is_playback` tinyint(2) DEFAULT NULL COMMENT '是否启用回放： 0：不启用 1：启用',
  `logo` varchar(10) DEFAULT NULL COMMENT '画面logo',
  `notify_user` varchar(1024) DEFAULT NULL COMMENT '活动通知人cc',
  `uuid` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `playbak_url` varchar(255) DEFAULT NULL,
  `t_default_video_id` int(11) DEFAULT NULL,
  `chatroom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES ('1', '毕夏《我的音乐故事》1', null, null, null, '0', '2015-07-21 15:06:10', '2015-07-30 21:30:13', null, '1', null, null, null, 'tv', 'liujicheng@cnlive.com', '2b088e657e634db6b0432e2d972b4398', '2015-07-30 15:06:13', '2015-09-18 09:47:18', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '1', null);
INSERT INTO `t_activity` VALUES ('2', '毕夏《我的音乐故事》2', null, null, null, '0', '2015-10-21 15:06:10', '2015-07-30 21:30:13', null, '1', null, null, null, 'tv', null, '9961612a712d4ce1b602bd723fb818b2', '2015-07-30 15:06:13', '2015-09-18 09:47:19', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '2', null);
INSERT INTO `t_activity` VALUES ('3', 'IBF西安区排名赛第3场', null, null, null, '0', '2015-07-21 15:06:10', '2015-07-30 21:30:13', null, '1', null, null, null, 'tv', null, '291f66ffeb544fbeafaf41d7a97f8462', '2015-07-30 15:06:13', '2015-09-18 09:47:19', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '2', null);
INSERT INTO `t_activity` VALUES ('4', '徐怀钰内地首开演唱会', null, null, null, '0', '2015-09-21 15:06:10', '2015-07-30 21:30:13', null, '1', null, null, null, 'tv', null, '8d74bef00b194adeae52e16c90425237', '2015-07-30 15:06:13', '2015-09-18 09:47:19', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '2', null);
INSERT INTO `t_activity` VALUES ('5', '毕夏《我的音乐故事》', null, null, null, '0', '2015-07-21 15:06:10', '2015-07-30 21:30:13', null, '1', null, null, null, 'tv', null, 'c8d21158e164433e9ca0d12752e5a43b', '2015-07-30 15:06:13', '2015-09-18 09:47:19', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '2', null);
INSERT INTO `t_activity` VALUES ('6', '秦勇《我的音乐故事》', null, null, null, '1', '2015-07-21 15:06:10', '2015-07-30 21:30:13', null, '1', null, null, null, 'tv', null, '32dac8a68075470882515aa25d727b18', null, '2015-09-18 09:47:20', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '1', null);
INSERT INTO `t_activity` VALUES ('7', 'IBF北京赛区第三场', null, null, null, '1', '2015-08-21 15:06:10', '2015-07-30 21:30:13', null, '1', null, null, null, 'tv', null, '8b72e0fa081640adb443b3a640202474', null, '2015-09-18 09:47:22', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '1', null);
INSERT INTO `t_activity` VALUES ('8', '活动名称', 'EPG条目名', '', '活动地点', '0', '2015-08-07 11:55:00', '2015-08-07 11:55:00', '业务负责人', '1', '22', '1', '1', 'tv', '抄送相关人员', 'e301ca8176a24ba38ae3283541821caa', '2015-08-07 13:49:05', '2015-09-18 09:47:22', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '1', null);
INSERT INTO `t_activity` VALUES ('10', '温岚唱响新赛歌音乐会', 'EPG条目名11', '活动简述11', '活动地点11', '0', '2015-08-10 08:40:00', '2015-08-11 09:25:00', '业务负责人11', '1', '222', '0', '1', 'tv', '抄送相关人员111', '83e52a91a0ac415c9d74fcfaef581d1a', '2015-08-10 13:44:43', '2015-09-18 09:47:23', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '1', null);
INSERT INTO `t_activity` VALUES ('11', '金润吉《我的音乐故事》', 'EPG条目名11', '活动简述11', '活动地点11', '0', '2015-08-10 08:40:00', '2015-08-11 09:25:00', '业务负责人11', '1', '222', '0', '1', 'tv', '抄送相关人员111', '00ae64a18f244697bf0c44c6c463cd6a', '2015-08-10 13:45:38', '2015-09-18 09:47:17', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '1', null);
INSERT INTO `t_activity` VALUES ('12', '温岚唱响新赛歌音乐会', 'EPG条目名11', '活动简述11', '活动地点11', '0', '2015-08-10 08:40:00', '2015-08-11 09:25:00', '业务负责人11', '1', '222', '0', '1', 'tv', '抄送相关人员111', '270e4319ec7345ba8aacdccacd3fd203', '2015-08-10 13:46:17', '2015-09-18 09:47:17', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '2', null);
INSERT INTO `t_activity` VALUES ('13', '金润吉《我的音乐故事》', 'EPG条目名11', '活动简述111', '活动地点', '0', '2015-07-30 02:10:00', '2015-07-28 01:25:00', '务负责人', '1', '222', '1', '1', 'tv', '送相关人员', '5100ca532cb74524a342372bfa335af8', '2015-08-10 13:48:59', '2015-09-18 09:47:17', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '3', null);
INSERT INTO `t_activity` VALUES ('14', '金润吉《我的音乐故事》', 'EPG条目名11', '活动简述111', '活动地点', '0', '2015-07-30 02:10:00', '2015-07-28 01:25:00', '务负责人', '1', '222', '1', '1', 'tv', '送相关人员', '2b4ac96ac8d44277baf020bacf4f5762', '2015-08-10 13:49:36', '2015-09-18 09:47:17', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '3', null);
INSERT INTO `t_activity` VALUES ('15', '活动名称22', 'EPG条目名22', '活动简述22', '活动地点22', '0', '2015-08-10 05:25:00', '2015-08-04 05:25:00', '务负责人', '1', '299', '0', '1', 'tv', '抄送相关人员', 'b0e304bfa3204bbda06cd2c92325735b', '2015-08-10 13:53:01', '2015-09-18 09:47:16', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '3', null);
INSERT INTO `t_activity` VALUES ('16', 'IBF杭州站第三场直播', 'EPG条目名44', '活动简述44', '活动简述44', '0', '2015-08-10 09:45:00', '2015-08-11 09:45:00', '务负责人', '1', '222', '1', '1', 'null', '抄送相关人员', '8a528fb09d1040b6894bce1d3f01c8cd', '2015-08-10 13:55:32', '2015-09-14 09:52:02', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '3', null);
INSERT INTO `t_activity` VALUES ('17', '活动名称66', 'EPG条目名66', 'EPG条目名66', '活动地点66', '0', '2015-08-10 05:25:00', '2015-08-10 05:25:00', '业务负责人', '1', '33', '0', '0', 'null', '抄送相关人员', '94cc3a93ea0d4da1b1b35b8e23a9114a', '2015-08-10 13:57:00', '2015-09-14 09:52:02', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '3', null);
INSERT INTO `t_activity` VALUES ('18', '活动名称77', 'EPG条目名77', '活动简述77', '活动地点77', '3', '2015-08-18 15:44:00', '2015-07-28 01:36:00', '业务负责人', '1', '399', '0', '0', 'null', '抄送相关人员', '50b609e8a4784a7baeb99b9ca13e6ac9', '2015-08-10 14:12:24', '2015-09-14 09:52:02', 'http://video00.cnlive.com/video/data2/2015/0823/d8ec60a93ae9454e944d492606be71ee_67857_200.mp4', '3', null);
INSERT INTO `t_activity` VALUES ('19', '张学友北京演唱会', '张学友北京演唱会', '张学友北京演唱会', '北京工体', '0', '2015-09-10 20:00:00', '2015-09-10 22:00:00', '曹峰', '1', '333', '1', null, 'tv', 'liujicheng@cnlive.com', '1b4324e4964e4998b3647214d7927d7d', '2015-09-10 10:31:23', '2015-09-18 09:47:09', null, '3', null);
INSERT INTO `t_activity` VALUES ('20', '刘德华北京终结演唱会', '刘德华北京终结演唱会', '刘德华北京终结演唱会', '刘德华北京终结演唱会', '0', '2015-09-18 11:00:00', '2015-09-17 12:00:00', '草鞥', '1', '200', '1', '1', 'tv', 'liujicheng@cnlive.com', '3e2ade3d2f954a6fab1e85bc803028a7', '2015-09-17 10:56:56', '2015-09-17 10:57:03', null, '1', null);
INSERT INTO `t_activity` VALUES ('21', '刘德华北京终结演唱会', '刘德华北京终结演唱会', '刘德华北京终结演唱会', '刘德华北京终结演唱会', '0', '2015-09-17 10:00:00', '2015-09-17 10:55:00', '22', '1', '22', '1', '1', 'tv', 'liujicheng@cnlive.com', 'bf6b4c735b83491b83e9fc6578dbdf36', '2015-09-17 11:00:44', '2015-09-17 11:00:44', null, '1', null);
INSERT INTO `t_activity` VALUES ('22', '刘德华北京终结演唱会', '刘德华北京终结演唱会', '刘德华北京终结演唱会', '刘德华北京终结演唱会', '0', '2015-10-27 14:50:00', '2015-10-27 22:50:00', '曹峰', '1', '200', '1', '1', 'tv', 'liujicheng@cnlive.com', '55a724c348774549bcb82dde4cd89f03', '2015-09-17 11:03:58', '2015-10-15 16:01:27', null, '2', '0');

-- ----------------------------
-- Table structure for `t_activity_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_log`;
CREATE TABLE `t_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_activity_id` int(11) NOT NULL COMMENT 't_activity 主键',
  `t_channel_id` int(11) NOT NULL COMMENT 't_channel 表主键',
  `state` tinyint(2) DEFAULT NULL COMMENT '0: 已经过期，1：正在使用',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `t_activity_id` (`t_activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_activity_log
-- ----------------------------
INSERT INTO `t_activity_log` VALUES ('1', '1', '40', null, null);
INSERT INTO `t_activity_log` VALUES ('2', '2', '40', null, null);
INSERT INTO `t_activity_log` VALUES ('3', '3', '41', null, null);
INSERT INTO `t_activity_log` VALUES ('4', '4', '41', null, null);
INSERT INTO `t_activity_log` VALUES ('5', '5', '41', null, null);
INSERT INTO `t_activity_log` VALUES ('6', '6', '43', null, null);
INSERT INTO `t_activity_log` VALUES ('7', '7', '43', null, null);
INSERT INTO `t_activity_log` VALUES ('8', '3', '43', null, null);
INSERT INTO `t_activity_log` VALUES ('9', '4', '43', null, null);
INSERT INTO `t_activity_log` VALUES ('10', '2', '43', null, null);
INSERT INTO `t_activity_log` VALUES ('11', '15', '82', null, '2015-08-10 13:52:58');
INSERT INTO `t_activity_log` VALUES ('12', '15', '81', null, '2015-08-10 13:52:58');
INSERT INTO `t_activity_log` VALUES ('13', '15', '80', null, '2015-08-10 13:52:58');
INSERT INTO `t_activity_log` VALUES ('14', '15', '79', null, '2015-08-10 13:52:58');
INSERT INTO `t_activity_log` VALUES ('15', '16', '82', null, '2015-08-10 13:55:30');
INSERT INTO `t_activity_log` VALUES ('16', '16', '81', null, '2015-08-10 13:55:30');
INSERT INTO `t_activity_log` VALUES ('17', '16', '80', null, '2015-08-10 13:55:30');
INSERT INTO `t_activity_log` VALUES ('18', '17', '82', null, '2015-08-10 13:57:00');
INSERT INTO `t_activity_log` VALUES ('19', '17', '81', null, '2015-08-10 13:57:01');
INSERT INTO `t_activity_log` VALUES ('20', '17', '80', null, '2015-08-10 13:57:02');
INSERT INTO `t_activity_log` VALUES ('21', '18', '82', null, '2015-08-10 14:12:22');
INSERT INTO `t_activity_log` VALUES ('22', '18', '81', null, '2015-08-10 14:12:23');
INSERT INTO `t_activity_log` VALUES ('23', '18', '80', null, '2015-08-10 14:12:23');
INSERT INTO `t_activity_log` VALUES ('24', '18', '79', null, '2015-08-10 14:12:23');
INSERT INTO `t_activity_log` VALUES ('25', '19', '75', null, '2015-09-10 10:31:23');
INSERT INTO `t_activity_log` VALUES ('26', '19', '72', null, '2015-09-10 10:31:23');
INSERT INTO `t_activity_log` VALUES ('27', '19', '71', null, '2015-09-10 10:31:23');
INSERT INTO `t_activity_log` VALUES ('39', '22', '38', null, '2015-10-15 15:28:19');

-- ----------------------------
-- Table structure for `t_channel`
-- ----------------------------
DROP TABLE IF EXISTS `t_channel`;
CREATE TABLE `t_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name_zh` varchar(50) NOT NULL COMMENT '频道名称',
  `name_en` varchar(50) NOT NULL COMMENT '英文名称 如：news',
  `state` tinyint(2) NOT NULL COMMENT '状态：\r\n0 禁用  \r\n1 启用 \r\n2 直播信号\r\n3 滚播信号',
  `type` tinyint(2) DEFAULT '1' COMMENT '频道类型：\r\n1  自主频道\r\n2  运营商频道\r\n',
  `transcoder_ip` varchar(15) NOT NULL COMMENT '滚播播出设备ip',
  `transcoder_id` int(8) NOT NULL COMMENT '滚播播出设备对应发布点id',
  `chatroom_id` int(11) NOT NULL COMMENT '聊天室id',
  `default_t_wowza_signal_ref_id` int(11) DEFAULT NULL COMMENT '保留切换之前，上一次的wowzaid',
  `t_wowza_signal_ref_id` int(11) DEFAULT NULL COMMENT '当前流媒体服务器 stream name 对应的id \r\n（当前信号定义为主视角）',
  `t_activity_id` int(11) DEFAULT NULL COMMENT '当前直播活动id',
  `play_url` varchar(255) DEFAULT NULL COMMENT '播放地址',
  `poster` varchar(255) DEFAULT NULL COMMENT '海报',
  `uuid` varchar(50) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_channel
-- ----------------------------
INSERT INTO `t_channel` VALUES ('47', 'E娱乐', 'eyule', '1', '1', '172.16.250.91', '37', '0', '60', null, null, null, null, null, '1', '2015-07-28 16:32:27', '2015-10-16 10:09:47');
INSERT INTO `t_channel` VALUES ('48', 'in乐台', 'inyuetai.stream', '1', '1', '172.16.250.91', '1', '0', '1', '2', null, null, null, null, '2', '2015-07-28 16:32:27', '2015-10-16 10:07:47');
INSERT INTO `t_channel` VALUES ('49', '文博会', 'wenbohui', '1', '1', '172.16.250.106', '1', '0', '2', '3', null, null, null, null, '2', '2015-07-28 16:32:27', '2015-10-16 10:07:48');
INSERT INTO `t_channel` VALUES ('50', '家有购物', 'jiayougouwu', '1', '1', '172.16.250.12', '12', '0', '3', '4', null, null, null, null, '3', '2015-07-28 16:32:27', '2015-10-16 10:07:48');
INSERT INTO `t_channel` VALUES ('51', 'I综艺', 'zzzzz', '0', '1', '172.16.250.91', '3', '0', '4', '5', '6', null, null, null, '4', '2015-07-28 16:32:27', '2015-10-16 10:07:48');
INSERT INTO `t_channel` VALUES ('52', '博博堂A', 'bobotanga', '0', '1', '172.16.250.91', '15', '0', '5', '6', null, null, null, null, '5', '2015-07-28 16:32:27', '2015-10-16 10:07:49');
INSERT INTO `t_channel` VALUES ('53', '博博堂B', 'bobotangb', '0', '1', '172.16.250.91', '16', '0', '6', '7', null, null, null, null, '6', '2015-07-28 16:32:27', '2015-10-16 10:07:49');
INSERT INTO `t_channel` VALUES ('54', '潮体育-联通', 'chaotiyu_lt', '1', '2', '172.16.250.12', '17', '0', '7', '8', null, null, null, null, '7', '2015-07-28 16:32:27', '2015-10-16 10:07:50');
INSERT INTO `t_channel` VALUES ('55', '潮体育-移动', 'chaotiyu_yd', '1', '2', '172.16.250.12', '18', '0', '8', '9', null, null, null, null, '8', '2015-07-28 16:32:27', '2015-10-16 10:07:50');
INSERT INTO `t_channel` VALUES ('56', '潮体育-电信', 'chaotiyu_dx', '1', '2', '172.16.250.106', '19', '0', '9', '55', '18', null, null, null, '56', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('57', 'In乐台-联通', 'inyuetai_lt', '1', '2', '172.16.250.12', '20', '0', '8', '56', '18', null, null, null, '57', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('58', 'In乐台-移动', 'inyuetai_yd', '0', '2', '172.16.250.12', '21', '0', '7', '57', '18', null, null, null, '58', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('59', 'In乐台-电信', 'inyuetai_dx', '1', '2', '172.16.250.106', '22', '0', '6', '58', '18', null, null, null, '59', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('60', 'I综艺-联通', 'izongyi_lt', '0', '2', '172.16.250.91', '23', '0', '5', '59', null, null, null, null, '60', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('61', 'I综艺-移动', 'izongyi_yd', '1', '2', '172.16.250.12', '24', '0', '4', '60', null, null, null, null, '61', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('62', 'I综艺-电信', 'izongyi_dx', '1', '2', '172.16.250.106', '25', '0', '3', '61', null, null, null, null, '62', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('63', 'E娱乐-联通', 'eyule_lt', '1', '2', '172.16.250.12', '26', '0', '2', '62', null, null, null, null, '63', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('64', 'E娱乐-移动', 'eyule_yd', '0', '2', '172.16.250.91', '27', '0', '1', '55', null, null, null, null, '64', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('65', 'E娱乐-电信', 'eyule_dx', '1', '2', '172.16.250.106', '28', '0', '9', '56', null, null, null, null, '65', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('66', '新影视-联通', 'xinyingshi_lt', '0', '2', '172.16.250.91', '29', '0', '8', '57', null, null, null, null, '66', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('67', '新影视-移动', 'xinyingshi_yd', '1', '2', '172.16.250.91', '30', '0', '7', '58', null, null, null, null, '67', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('68', '新影视-电信', 'xinyingshi_dx', '0', '2', '172.16.250.91', '31', '0', '6', '59', null, null, null, null, '68', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('38', '幸福秀', 'jidongpindao', '1', '1', '172.16.250.91', '36', '0', '5', null, null, null, null, null, '38', '2015-07-28 16:32:26', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('39', '热动漫', 'redongman', '1', '1', '172.16.250.91', '13', '0', '4', '61', null, null, null, null, '39', '2015-07-28 16:32:26', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('40', '车视界', 'cheshijie', '1', '1', '172.16.250.91', '14', '0', '3', '62', null, null, null, null, '40', '2015-07-28 16:32:26', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('41', 'I综艺', 'izongyi', '2', '1', '172.16.250.91', '11', '0', '2', '55', '6', null, null, null, '41', '2015-07-28 16:32:26', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('42', 'LiveShow', 'liveshow', '2', '1', '172.16.250.107', '1', '0', '1', '56', '4', null, null, null, '42', '2015-07-28 16:32:26', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('43', '潮体育', 'chaotiyu', '2', '1', '172.16.250.107', '3', '0', '9', '98', '22', null, null, null, '43', '2015-07-28 16:32:26', '2015-10-15 15:44:06');
INSERT INTO `t_channel` VALUES ('44', '新影视', 'xinyingshi', '1', '1', '172.16.250.91', '4', '0', '8', '98', '22', null, null, null, '44', '2015-07-28 16:32:27', '2015-10-15 15:44:06');
INSERT INTO `t_channel` VALUES ('45', '炫韩娱', 'xuanhanyu', '1', '1', '172.16.250.12', '8', '0', '7', '98', '22', null, null, null, '45', '2015-07-28 16:32:27', '2015-10-15 15:44:06');
INSERT INTO `t_channel` VALUES ('46', '快新闻', 'news', '1', '1', '172.16.250.91', '5', '0', '6', '60', null, null, null, null, '46', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('69', '快新闻-联通', 'news_lt', '0', '2', '172.16.250.12', '32', '0', '5', '61', null, null, null, null, '69', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('70', '快新闻-移动', 'news_yd', '0', '2', '172.16.250.91', '33', '0', '4', '62', null, null, null, null, '70', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('71', '快新闻-电信', 'news_dx', '1', '2', '172.16.250.106', '34', '0', '3', '3', '18', null, null, null, '71', '2015-07-28 16:32:27', '2015-09-21 16:08:30');
INSERT INTO `t_channel` VALUES ('72', '虚拟互动', 'vhd', '1', '1', '172.16.250.91', '35', '0', '2', '97', '19', null, null, null, '71', '2015-07-28 16:32:27', '2015-09-21 16:08:56');
INSERT INTO `t_channel` VALUES ('75', 'LiveShow-移动', 'yidongliveshow', '1', '2', '172.16.250.107', '2', '0', '1', '3', '18', null, null, null, '74', '2015-07-28 16:32:27', '2015-10-16 10:07:07');
INSERT INTO `t_channel` VALUES ('83', '频道名称', '324234', '1', '1', '2.222.2.222', '32432', '23423', '1', null, null, null, '', '4e7cae33cc284f679696db8837781c17', '76', '2015-09-15 13:29:57', '2015-10-16 10:07:02');

-- ----------------------------
-- Table structure for `t_channel_wowza_ref`
-- ----------------------------
DROP TABLE IF EXISTS `t_channel_wowza_ref`;
CREATE TABLE `t_channel_wowza_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_channel_id` int(11) DEFAULT NULL,
  `t_wowza_signal_ref_id` int(11) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL COMMENT '1：边缘1视角\r\n2：边缘2视角\r\n3：边缘3视角',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_channel_wowza_ref
-- ----------------------------

-- ----------------------------
-- Table structure for `t_default_video`
-- ----------------------------
DROP TABLE IF EXISTS `t_default_video`;
CREATE TABLE `t_default_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `stream_name` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_default_video
-- ----------------------------
INSERT INTO `t_default_video` VALUES ('1', '视讯中国宣传片@tv', null, '2015-09-14 09:42:18');

-- ----------------------------
-- Table structure for `t_signal`
-- ----------------------------
DROP TABLE IF EXISTS `t_signal`;
CREATE TABLE `t_signal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `ip` varchar(15) DEFAULT NULL COMMENT '服务器ip地址',
  `state` tinyint(2) DEFAULT NULL COMMENT '0： 关闭,  1: 开启',
  `type` tinyint(2) DEFAULT NULL COMMENT '1:http   2: rtmp',
  `output_url` varchar(255) DEFAULT NULL,
  `admin_url` varchar(255) DEFAULT NULL COMMENT '信号源 后台管理地址',
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_signal
-- ----------------------------
INSERT INTO `t_signal` VALUES ('43', '体彩信源', '192.168.100.240', '1', '2', 'ticai', 'http://192.168.100.240/live.html', '2015-09-16 13:26:49', '2015-09-16 13:26:48');
INSERT INTO `t_signal` VALUES ('2', 'a01', '172.000.000.001', '0', '1', null, 'www.baidu.com', '2015-07-28 17:07:59', '2015-09-06 13:30:29');
INSERT INTO `t_signal` VALUES ('5', 'in_live3', '192.168.100.21', '1', '2', null, 'http://192.168.100.21/admin', '2015-07-31 09:33:00', '2015-09-06 14:03:14');
INSERT INTO `t_signal` VALUES ('6', 'in_live4', '192.168.120.32', '0', '2', null, 'http://192.168.120.32/admin', '2015-07-31 09:33:04', '2015-09-06 13:30:29');
INSERT INTO `t_signal` VALUES ('7', 'in_live5', '192.168.100.21', '0', '1', null, 'http://192.168.100.21/admin', '2015-07-31 09:33:22', '2015-09-06 14:04:09');
INSERT INTO `t_signal` VALUES ('8', 'in_live6', '192.168.100.21', '0', '1', null, 'http://192.168.100.21/admin', '2015-07-31 09:33:22', '2015-09-06 14:04:09');
INSERT INTO `t_signal` VALUES ('9', 'in_live7', '192.168.100.21', '1', '2', null, 'http://192.168.100.21/admin', '2015-07-31 09:33:22', '2015-09-06 14:14:15');
INSERT INTO `t_signal` VALUES ('10', 'in_live_8', '192.168.100.21', '1', '2', null, 'http://192.168.100.21/admin', '2015-07-31 09:33:22', '2015-09-18 09:39:02');
INSERT INTO `t_signal` VALUES ('11', 'in_live_9', '192.168.100.21', '1', '2', 'rtmp://192.168.100.71:1935/live/_definst_/live13', 'http://192.168.100.21/admin', '2015-07-31 09:33:22', '2015-09-08 11:30:45');
INSERT INTO `t_signal` VALUES ('12', 'in_live_10', '192.168.100.21', '0', '2', 'rtmp://192.168.100.71:1935/live/_definst_/live12', 'http://192.168.100.21/admin', '2015-07-31 09:33:22', '2015-09-14 16:51:46');
INSERT INTO `t_signal` VALUES ('13', 'in_live_11', '192.168.100.21', '0', '2', 'rtmp://192.168.100.71:1935/live/_definst_/live11', 'http://192.168.100.21/admin', '2015-07-31 09:33:22', '2015-09-08 11:30:40');
INSERT INTO `t_signal` VALUES ('41', 'cncodec_name', '172.16.250.87', '0', '1', 'rtmp://192.168.100.71:1935/live/_definst_/live10', 'http://www.baidu.com', '2015-09-06 13:18:23', '2015-09-15 09:39:37');
INSERT INTO `t_signal` VALUES ('42', '信源名称11', '172.172.50.1', '1', '2', 'rtmp://172.16.250.100:1935/live/live1', 'http://172.16.250.11/live.html', '2015-09-15 09:46:06', '2015-09-15 09:46:04');
INSERT INTO `t_signal` VALUES ('44', 'cncodec76', '192.168.100.76', '1', '2', 'cp', 'http://192.168.100.240/live.html', '2015-09-17 17:33:33', '2015-09-17 17:33:32');
INSERT INTO `t_signal` VALUES ('46', 'cp', '192.168.100.76', '1', '2', 'cp', null, null, '2015-09-21 13:37:24');

-- ----------------------------
-- Table structure for `t_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics`;
CREATE TABLE `t_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_channel_id` int(11) NOT NULL,
  `month` date DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_statistics
-- ----------------------------
INSERT INTO `t_statistics` VALUES ('1', '47', '2015-01-01', '8', '2015-08-04 13:56:42');
INSERT INTO `t_statistics` VALUES ('2', '47', '2015-02-01', '4', '2015-08-04 14:01:53');
INSERT INTO `t_statistics` VALUES ('3', '47', '2015-03-01', '6', '2015-08-04 14:01:53');
INSERT INTO `t_statistics` VALUES ('4', '47', '2015-04-01', '2', '2015-08-04 14:01:54');
INSERT INTO `t_statistics` VALUES ('5', '47', '2015-05-01', '1', '2015-08-04 14:01:55');
INSERT INTO `t_statistics` VALUES ('6', '47', '2015-06-01', '5', '2015-08-04 14:01:55');
INSERT INTO `t_statistics` VALUES ('7', '47', '2015-07-01', '2', '2015-08-04 14:01:55');
INSERT INTO `t_statistics` VALUES ('8', '47', '2015-08-01', '6', '2015-08-04 14:01:56');
INSERT INTO `t_statistics` VALUES ('9', '42', '2015-01-01', '2', '2015-08-04 14:01:56');
INSERT INTO `t_statistics` VALUES ('10', '42', '2015-02-01', '6', '2015-08-04 14:01:58');
INSERT INTO `t_statistics` VALUES ('11', '42', '2015-03-01', '3', '2015-08-04 14:02:08');
INSERT INTO `t_statistics` VALUES ('12', '42', '2015-04-01', '8', '2015-08-04 14:02:08');
INSERT INTO `t_statistics` VALUES ('13', '42', '2015-05-01', '6', '2015-08-04 14:02:08');
INSERT INTO `t_statistics` VALUES ('14', '42', '2015-06-01', '9', '2015-08-04 14:02:09');
INSERT INTO `t_statistics` VALUES ('15', '42', '2015-07-01', '4', '2015-08-04 14:08:57');
INSERT INTO `t_statistics` VALUES ('16', '42', '2015-08-01', '6', '2015-08-04 14:08:57');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `is_admin` tinyint(2) DEFAULT NULL COMMENT '0 普通用户  1超级管理员',
  `t_channel_ids` varchar(255) DEFAULT NULL COMMENT '用户所负责频道id\r\n多个id通过逗号隔开',
  `t_signal_ids` varchar(255) DEFAULT NULL COMMENT '用户所负责信号源id，多个id通过逗号分隔开',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '刘基城', '1', '38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,75,76,77,78,79,80,81,82', null, '2015-08-11 15:26:53');
INSERT INTO `t_user` VALUES ('2', '郑香香', '1', '38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,75,76,77,78,79,80,81,82', null, '2015-08-11 15:26:54');

-- ----------------------------
-- Table structure for `t_wowza`
-- ----------------------------
DROP TABLE IF EXISTS `t_wowza`;
CREATE TABLE `t_wowza` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL COMMENT '账号密码通过@符合分隔开，如： root@cnlive',
  `web_account` varchar(50) DEFAULT NULL,
  `lan_ip` varchar(15) DEFAULT NULL COMMENT '172.16.250.111',
  `wan_ip` varchar(15) DEFAULT NULL COMMENT '外网ip',
  `state` tinyint(2) DEFAULT NULL COMMENT '0: 禁用  1：启用',
  `admin_url` varchar(255) DEFAULT NULL COMMENT '后台管理地址',
  `video_path` varchar(100) DEFAULT NULL COMMENT '录制文件存放路径',
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wowza
-- ----------------------------
INSERT INTO `t_wowza` VALUES ('1', 'wowza_huayuanq_11', '系统账号', null, '172.16.250.11', null, '1', null, null, null, '2015-08-17 10:18:14');
INSERT INTO `t_wowza` VALUES ('2', 'wowza_huayuanq_11', '系统账号', null, '172.16.250.11', null, '1', null, null, null, '2015-08-17 10:18:16');
INSERT INTO `t_wowza` VALUES ('3', 'wowza_huayuanq_11', '系统账号', null, '172.16.250.11', null, '1', null, null, null, '2015-08-17 10:18:16');
INSERT INTO `t_wowza` VALUES ('4', 'wowza_huayuanq_11', '系统账号', null, '172.16.250.11', null, '1', null, null, null, '2015-08-17 10:18:17');
INSERT INTO `t_wowza` VALUES ('5', 'wowza_huayuanq_11', '系统账号', null, '172.16.250.11', null, '1', null, null, null, '2015-08-17 13:00:53');
INSERT INTO `t_wowza` VALUES ('6', 'wowza_huayuanq_19', '系统账号', null, '172.16.250.19', null, '1', null, null, null, '2015-08-17 10:18:22');
INSERT INTO `t_wowza` VALUES ('7', 'wowza_huayuanq_19', '系统账号', null, '172.16.250.19', null, '1', null, null, null, '2015-08-17 10:19:07');
INSERT INTO `t_wowza` VALUES ('8', 'wowza_huayuanq_19', '系统账号', null, '172.16.250.19', null, '1', null, null, null, '2015-08-17 10:19:07');
INSERT INTO `t_wowza` VALUES ('9', 'wowza_huayuanq_19', '系统账号', null, '172.16.250.19', null, '1', null, null, null, '2015-08-17 10:19:08');
INSERT INTO `t_wowza` VALUES ('11', 'wowza_huayuanq_19', '系统账号', null, '172.16.250.170', '172.16.250.170', '1', '111', '11', '2015-08-03 13:51:05', '2015-08-17 10:19:25');
INSERT INTO `t_wowza` VALUES ('54', 'wowza_idc_71', '系统账号', null, '192.168.100.71', '192.168.100.71', '1', 'http', '件存放目录', '2015-08-05 10:31:50', '2015-08-17 10:16:26');
INSERT INTO `t_wowza` VALUES ('55', 'wowza_idc_72', '系统账号', null, '192.168.100.71', '192.168.100.71', '1', 'http', '件存放目录', '2015-08-05 10:33:44', '2015-08-17 10:16:44');
INSERT INTO `t_wowza` VALUES ('57', 'wowza_idc_74', '系统账号', null, '192.168.100.73', '192.168.100.73', '1', '84', '8844', '2015-08-05 16:47:54', '2015-08-17 10:16:48');
INSERT INTO `t_wowza` VALUES ('68', 'wowza_test', 'root@cnlive', null, '172.16.250.254', '172.16.250.254', '1', null, null, null, '2015-09-10 13:10:51');
INSERT INTO `t_wowza` VALUES ('69', '花园桥wowza71', 'root@cnlive1', null, '172.16.250.111', '172.16.250.111', '1', 'http://172.16.250.111/wowzaeng/manager.html', '/usr/local/wowza', '2015-09-15 10:21:16', '2015-09-15 10:21:15');
INSERT INTO `t_wowza` VALUES ('70', '花园桥76服务器', 'root/cnLIVE#@76', 'root/cnlive', '192.168.100.76', '192.168.100.76', '1', 'http://192.168.100.76:8088', '/usr/local/WowzaStreamingEngine/content', '2015-09-16 14:21:09', '2015-09-16 14:21:07');
INSERT INTO `t_wowza` VALUES ('71', 'wowza76', 'root/cnlive', 'root/cnlive', '192.168.100.76', '192.168.100.76', '1', 'sf', 'e', '2015-09-18 14:10:06', '2015-09-18 14:10:04');

-- ----------------------------
-- Table structure for `t_wowza_signal_ref`
-- ----------------------------
DROP TABLE IF EXISTS `t_wowza_signal_ref`;
CREATE TABLE `t_wowza_signal_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_wowza_id` int(11) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL COMMENT '1: cncodec信号  2：transcoder 信号',
  `stream_name` varchar(50) DEFAULT NULL,
  `application_name` varchar(50) DEFAULT NULL,
  `publish_url` varchar(255) DEFAULT NULL,
  `t_signal_id` int(11) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wowza_signal_ref
-- ----------------------------
INSERT INTO `t_wowza_signal_ref` VALUES ('1', '1', '2', 'out_zhonghuameishi', 'live7', 'rtmp://192.168.100.11:1935/live/_definst_/out_zhonghuameishi', '5', 'c0888816ede9453eb9f3e7423dd0e90d', '2015-07-31 13:39:22', '2015-09-21 13:20:00');
INSERT INTO `t_wowza_signal_ref` VALUES ('2', '2', '2', 'out_redongman', 'live7', 'rtmp://192.168.100.11:1935/live/_definst_/out_redongman', '6', '49b8dc7ba2064aa7a317bbfe5de938ad', '2015-07-31 13:39:22', '2015-09-21 13:19:59');
INSERT INTO `t_wowza_signal_ref` VALUES ('3', '3', '2', 'out_vhd', 'live6', 'rtmp://192.168.100.11:1935/live/_definst_/out_vhd', '7', '85471847dd3d4bd8a617f86ee98c01bf', '2015-07-31 13:39:22', '2015-09-21 13:19:56');
INSERT INTO `t_wowza_signal_ref` VALUES ('4', '4', '2', 'out_izongyi', 'live6', 'rtmp://192.168.100.11:1935/live/_definst_/out_izongyi', '8', '2b42e5b3e46f4bafa800f7fd763b5fd6', '2015-07-31 13:39:22', '2015-09-21 13:19:55');
INSERT INTO `t_wowza_signal_ref` VALUES ('5', '5', '2', 'out_jiayougouwu', 'live6', 'rtmp://192.168.100.101:1935/live/_definst_/out_jiayougouwu', '9', '98e5a877c1e64d14a30e39c9b0dae891', '2015-07-31 13:39:22', '2015-09-21 13:19:54');
INSERT INTO `t_wowza_signal_ref` VALUES ('6', '6', '2', 'out_caifutianxia', 'live5', 'rtmp://192.168.100.19:1935/live/_definst_/out_caifutianxia', '10', '02fec9d4f8c6496fb771469768f7793e', '2015-07-31 13:39:22', '2015-09-21 13:19:52');
INSERT INTO `t_wowza_signal_ref` VALUES ('7', '7', '2', 'out_zhonghuameishi', 'live5', 'rtmp://192.168.100.19:1935/live/_definst_/out_zhonghuameishi', '11', 'a3d90ef0a075451b9fa1bc98cec360a1', '2015-07-31 13:39:22', '2015-09-21 13:19:49');
INSERT INTO `t_wowza_signal_ref` VALUES ('8', '8', '2', 'out_cctvzhengquan', 'live4', 'rtmp://192.168.100.19:1935/live/_definst_/out_cctvzhengquan', '12', '96a75f70c06b4d62b4b6cb7416341ae0', '2015-07-31 13:39:22', '2015-09-21 13:19:48');
INSERT INTO `t_wowza_signal_ref` VALUES ('9', '9', '2', 'out_xinyingshi', 'live3', 'rtmp://192.168.100.19:1935/live/_definst_/out_xinyingshi', '13', '28100ca8c22149c290cd38add33d3e3e', '2015-07-31 13:39:22', '2015-09-21 13:19:47');
INSERT INTO `t_wowza_signal_ref` VALUES ('55', '54', '2', 'out_chaotiyu', 'live2', 'rtmp://192.168.100.71:1935/live/_definst_/out_chaotiyu', '1', '544c729945f24e489ecc5231999c237a', '2015-08-05 10:31:51', '2015-09-21 13:19:47');
INSERT INTO `t_wowza_signal_ref` VALUES ('56', '54', '2', 'out_eyule', 'live2', 'rtmp://192.168.100.71:1935/live/_definst_/out_eyule', '15', '5635a32674724ca1b8b73e23c33367ce', '2015-08-05 10:31:51', '2015-09-21 13:19:46');
INSERT INTO `t_wowza_signal_ref` VALUES ('57', '55', '2', 'out_liveshow', 'live1', 'rtmp://192.168.100.71:1935/live/_definst_/out_liveshow', '5', 'cfffc1498acf4e9fba3a0d8198989449', '2015-08-05 10:33:45', '2015-09-21 13:19:45');
INSERT INTO `t_wowza_signal_ref` VALUES ('58', '55', '2', 'out_kuaixinw', 'live1', 'rtmp://192.168.100.71:1935/live/_definst_/out_kuaixinw', '1', 'b1295bdd22fd4975985d2dc3e139cc49', '2015-08-05 10:33:45', '2015-09-21 13:19:46');
INSERT INTO `t_wowza_signal_ref` VALUES ('61', '57', '2', 'out_cheshijie', 'live', 'rtmp://192.168.100.71:1935/live/_definst_/out_cheshijie', '5', 'b87fc7830ec041c587c66540802784ac', '2015-08-05 16:47:54', '2015-09-21 13:19:32');
INSERT INTO `t_wowza_signal_ref` VALUES ('62', '57', '2', 'out_yeselive', 'live', 'rtmp://192.168.100.71:1935/live/_definst_/out_yeselive', '6', '129d4114e62449dda18a131c175972a1', '2015-08-05 16:47:54', '2015-09-21 13:19:32');
INSERT INTO `t_wowza_signal_ref` VALUES ('97', '70', '1', 'ticai', 'ticai', 'rtmp://192.168.100.76:1935/ticai/ticai', '43', '2f51daf7a6b14700831947597e514975', '2015-09-16 14:21:09', '2015-09-18 15:10:33');
INSERT INTO `t_wowza_signal_ref` VALUES ('89', '68', '1', 'live13', 'live', 'rtmp://192.168.100.71:1935/live/_definst_/live13', '12', '14d42baff5714f08a2c3811de8bc932b', null, '2015-09-21 13:19:30');
INSERT INTO `t_wowza_signal_ref` VALUES ('96', '69', '1', 'live9', 'live', 'rtmp://1811.1.1.1.1/live9', '42', '46b0d2c797aa437ab7779833a5a584f5', '2015-09-15 10:21:16', '2015-09-21 13:19:31');
INSERT INTO `t_wowza_signal_ref` VALUES ('98', '70', '1', 'cp', 'cp', 'rtmp://192.168.100.76:1935/ticai/cp', '46', null, null, '2015-09-18 15:07:45');
INSERT INTO `t_wowza_signal_ref` VALUES ('100', '71', '2', 'ticai', 'ticai', 'rtmp://192.168.100.76:1935/ticai/ticai', '43', '8e65a442521343daab5123d030c0edc5', '2015-09-18 14:16:20', '2015-09-18 15:10:43');

-- ----------------------------
-- View structure for `v_activity`
-- ----------------------------
DROP VIEW IF EXISTS `v_activity`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_activity` AS select `t_activity`.`id` AS `id`,`t_activity`.`name` AS `name`,`t_activity`.`epg_name` AS `epg_name`,`t_activity`.`description` AS `description`,`t_activity`.`place` AS `place`,`t_activity`.`state` AS `state`,`t_activity`.`start_time` AS `start_time`,`t_activity`.`end_time` AS `end_time`,`t_activity`.`contact_user` AS `contact_user`,`t_activity`.`user_id` AS `user_id`,`t_activity`.`v_count` AS `v_count`,`t_activity`.`is_free` AS `is_free`,`t_activity`.`is_playback` AS `is_playback`,`t_activity`.`logo` AS `logo`,`t_activity`.`notify_user` AS `notify_user`,`t_activity`.`create_time` AS `create_time`,`t_activity`.`update_time` AS `update_time`,`t_activity_log`.`t_channel_id` AS `t_channel_id`,`t_activity`.`playbak_url` AS `playbak_url`,`t_activity`.`t_default_video_id` AS `t_default_video_id`,`t_activity`.`uuid` AS `uuid` from (`t_activity_log` left join `t_activity` on((`t_activity_log`.`t_activity_id` = `t_activity`.`id`))) ;

-- ----------------------------
-- View structure for `v_activity_channel`
-- ----------------------------
DROP VIEW IF EXISTS `v_activity_channel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_activity_channel` AS select `t_activity_log`.`t_activity_id` AS `t_activity_id`,`t_activity_log`.`t_channel_id` AS `t_channel_id` from (`t_activity_log` left join `t_channel` on((`t_activity_log`.`t_channel_id` = `t_channel`.`id`))) ;

-- ----------------------------
-- View structure for `v_activity_width_user`
-- ----------------------------
DROP VIEW IF EXISTS `v_activity_width_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_activity_width_user` AS select `t_activity`.`name` AS `name`,`t_activity`.`epg_name` AS `epg_name`,`t_activity`.`description` AS `description`,`t_activity`.`place` AS `place`,`t_activity`.`state` AS `state`,`t_activity`.`start_time` AS `start_time`,`t_activity`.`end_time` AS `end_time`,`t_activity`.`contact_user` AS `contact_user`,`t_activity`.`user_id` AS `user_id`,`t_activity`.`v_count` AS `v_count`,`t_activity`.`is_free` AS `is_free`,`t_activity`.`is_playback` AS `is_playback`,`t_activity`.`logo` AS `logo`,`t_activity`.`notify_user` AS `notify_user`,`t_activity`.`uuid` AS `uuid`,`t_activity`.`create_time` AS `create_time`,`t_activity`.`update_time` AS `update_time`,`t_activity`.`playbak_url` AS `playbak_url`,`t_activity`.`id` AS `id`,`t_user`.`name` AS `user_name`,`t_activity`.`t_default_video_id` AS `t_default_video_id` from (`t_activity` left join `t_user` on((`t_activity`.`user_id` = `t_user`.`id`))) ;

-- ----------------------------
-- View structure for `v_channel`
-- ----------------------------
DROP VIEW IF EXISTS `v_channel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_channel` AS select `t_channel`.`id` AS `id`,`t_channel`.`name_zh` AS `name_zh`,`t_channel`.`name_en` AS `name_en`,`t_channel`.`state` AS `state`,`t_channel`.`type` AS `type`,`t_channel`.`transcoder_ip` AS `transcoder_ip`,`t_channel`.`transcoder_id` AS `transcoder_id`,`t_channel`.`chatroom_id` AS `chatroom_id`,`t_channel`.`t_wowza_signal_ref_id` AS `t_wowza_signal_ref_id`,`t_channel`.`create_time` AS `create_time`,`t_channel`.`update_time` AS `update_time`,`t_wowza_signal_ref`.`publish_url` AS `publish_url`,`t_channel`.`t_activity_id` AS `t_activity_id`,`t_activity`.`name` AS `activity_name`,`t_channel`.`default_t_wowza_signal_ref_id` AS `default_t_wowza_signal_ref_id`,`t_channel`.`play_url` AS `play_url`,`t_channel`.`poster` AS `poster`,`t_wowza_signal_ref`.`stream_name` AS `stream_name`,`t_wowza_signal_ref`.`application_name` AS `application_name`,`t_wowza_signal_ref`.`uuid` AS `uuid`,`t_signal`.`ip` AS `t_signal_ip`,`t_signal`.`name` AS `t_signal_name`,`t_signal`.`admin_url` AS `t_signal_admin_url`,`default_t_wowza_signal_ref`.`stream_name` AS `default_stream_name`,`t_channel`.`sort` AS `sort` from ((((`t_channel` left join `t_wowza_signal_ref` on((`t_channel`.`t_wowza_signal_ref_id` = `t_wowza_signal_ref`.`id`))) left join `t_activity` on((`t_channel`.`t_activity_id` = `t_activity`.`id`))) left join `t_signal` on((`t_wowza_signal_ref`.`t_signal_id` = `t_signal`.`id`))) left join `t_wowza_signal_ref` `default_t_wowza_signal_ref` on((`t_channel`.`default_t_wowza_signal_ref_id` = `default_t_wowza_signal_ref`.`id`))) ;

-- ----------------------------
-- View structure for `v_channel_count`
-- ----------------------------
DROP VIEW IF EXISTS `v_channel_count`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_channel_count` AS select `t_statistics`.`id` AS `id`,concat('\'',`t_channel`.`name_zh`,'\'') AS `name`,concat('[',cast(group_concat(`t_statistics`.`count` order by `t_statistics`.`month` ASC separator ',') as char charset utf8),']') AS `data` from (`t_statistics` left join `t_channel` on((`t_statistics`.`t_channel_id` = `t_channel`.`id`))) group by `t_statistics`.`t_channel_id` ;

-- ----------------------------
-- View structure for `v_wowza_signal`
-- ----------------------------
DROP VIEW IF EXISTS `v_wowza_signal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_wowza_signal` AS select `t_wowza_signal_ref`.`id` AS `id`,`t_wowza_signal_ref`.`t_wowza_id` AS `t_wowza_id`,`t_wowza_signal_ref`.`publish_url` AS `publish_url`,`t_wowza_signal_ref`.`t_signal_id` AS `t_signal_id`,`t_wowza`.`name` AS `wowza_name`,`t_wowza`.`account` AS `wowza_account`,`t_wowza`.`lan_ip` AS `wowza_lan_ip`,`t_wowza`.`wan_ip` AS `wowza_wan_ip`,`t_wowza`.`state` AS `wowza_state`,`t_signal`.`name` AS `signal_name`,`t_signal`.`ip` AS `signal_ip`,`t_signal`.`type` AS `signal_type`,`t_wowza_signal_ref`.`stream_name` AS `stream_name`,`t_wowza_signal_ref`.`application_name` AS `application_name`,`t_wowza_signal_ref`.`type` AS `type` from ((`t_wowza_signal_ref` left join `t_wowza` on((`t_wowza_signal_ref`.`t_wowza_id` = `t_wowza`.`id`))) left join `t_signal` on((`t_wowza_signal_ref`.`t_signal_id` = `t_signal`.`id`))) ;
