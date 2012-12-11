/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 60005
Source Host           : localhost:3306
Source Database       : hrtest

Target Server Type    : MYSQL
Target Server Version : 60005
File Encoding         : 65001

Date: 2012-12-11 17:08:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_optionanswer`
-- ----------------------------
DROP TABLE IF EXISTS `t_optionanswer`;
CREATE TABLE `t_optionanswer` (
  `optansid` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` int(11) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `topicid` int(11) DEFAULT NULL,
  PRIMARY KEY (`optansid`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_optionanswer
-- ----------------------------
INSERT INTO `t_optionanswer` VALUES ('1', '1', '你告诉伙伴们，从送礼单上把你的名字去掉，这样就不必花钱购买礼物了；', '3', '1');
INSERT INTO `t_optionanswer` VALUES ('2', '2', '且不管花费多少钱，你在接到请帖后都要去精心选购礼物，使对方满意；', '1', '1');
INSERT INTO `t_optionanswer` VALUES ('3', '3', '你只给那些对你来说是至关重要的人送礼。', '2', '1');
INSERT INTO `t_optionanswer` VALUES ('4', '1', '你变得灰心丧气，拼命埋怨保险公司；', '3', '2');
INSERT INTO `t_optionanswer` VALUES ('5', '2', '你想办法动手修理，尽量使受到的损失得到挽回；', '1', '2');
INSERT INTO `t_optionanswer` VALUES ('6', '3', '你在考虑是否取消保险。', '2', '2');
INSERT INTO `t_optionanswer` VALUES ('7', '1', '你回到家里，配置一杯浓茶，但没法把神经放松，将此事忘掉；', '3', '3');
INSERT INTO `t_optionanswer` VALUES ('8', '2', '你与你的律师通话讨论可能引起的诉讼案件；', '1', '3');
INSERT INTO `t_optionanswer` VALUES ('9', '3', '你以散步的方式来消气。', '2', '3');
INSERT INTO `t_optionanswer` VALUES ('10', '1', '草莓', '2', '4');
INSERT INTO `t_optionanswer` VALUES ('11', '2', '苹果', '3', '4');
INSERT INTO `t_optionanswer` VALUES ('12', '3', '西瓜', '5', '4');
INSERT INTO `t_optionanswer` VALUES ('13', '4', '菠萝', '10', '4');
INSERT INTO `t_optionanswer` VALUES ('14', '5', '橘子', '15', '4');
INSERT INTO `t_optionanswer` VALUES ('15', '1', '郊外', '2', '5');
INSERT INTO `t_optionanswer` VALUES ('16', '2', '电影院', '3', '5');
INSERT INTO `t_optionanswer` VALUES ('17', '3', '公园', '5', '5');
INSERT INTO `t_optionanswer` VALUES ('18', '4', '商场', '10', '5');
INSERT INTO `t_optionanswer` VALUES ('19', '5', '酒吧', '15', '5');
INSERT INTO `t_optionanswer` VALUES ('20', '6', '练歌房', '20', '5');
INSERT INTO `t_optionanswer` VALUES ('21', '1', '有才气的人', '2', '6');
INSERT INTO `t_optionanswer` VALUES ('22', '2', '依赖你的人', '3', '6');
INSERT INTO `t_optionanswer` VALUES ('23', '3', '优雅的人', '5', '6');
INSERT INTO `t_optionanswer` VALUES ('24', '4', '善良的人', '10', '6');
INSERT INTO `t_optionanswer` VALUES ('25', '5', '性情豪放的人', '15', '6');
INSERT INTO `t_optionanswer` VALUES ('26', '1', '猫', '2', '7');
INSERT INTO `t_optionanswer` VALUES ('27', '2', '马', '3', '7');
INSERT INTO `t_optionanswer` VALUES ('28', '3', '大象', '5', '7');
INSERT INTO `t_optionanswer` VALUES ('29', '4', '猴子', '10', '7');
INSERT INTO `t_optionanswer` VALUES ('30', '5', '狗', '15', '7');
INSERT INTO `t_optionanswer` VALUES ('31', '6', '狮子', '20', '7');
INSERT INTO `t_optionanswer` VALUES ('32', '1', '游泳', '5', '8');
INSERT INTO `t_optionanswer` VALUES ('33', '2', '喝冷饮', '10', '8');
INSERT INTO `t_optionanswer` VALUES ('34', '3', '开空调', '15', '8');
INSERT INTO `t_optionanswer` VALUES ('40', '3', '老鼠', '10', '9');
INSERT INTO `t_optionanswer` VALUES ('39', '4', '苍蝇', '15', '9');
INSERT INTO `t_optionanswer` VALUES ('41', '2', '猪', '5', '9');
INSERT INTO `t_optionanswer` VALUES ('42', '1', '蛇', '2', '9');
INSERT INTO `t_optionanswer` VALUES ('43', '5', '战争枪战类', '15', '10');
INSERT INTO `t_optionanswer` VALUES ('44', '4', '伦理道德类', '10', '10');
INSERT INTO `t_optionanswer` VALUES ('45', '3', '自然科学类', '5', '10');
INSERT INTO `t_optionanswer` VALUES ('46', '2', '童话神话类', '3', '10');
INSERT INTO `t_optionanswer` VALUES ('47', '1', '悬疑推理类', '2', '10');
INSERT INTO `t_optionanswer` VALUES ('48', '5', '手机', '10', '11');
INSERT INTO `t_optionanswer` VALUES ('49', '4', '纸巾', '5', '11');
INSERT INTO `t_optionanswer` VALUES ('50', '3', '记事本', '3', '11');
INSERT INTO `t_optionanswer` VALUES ('51', '2', '口红', '2', '11');
INSERT INTO `t_optionanswer` VALUES ('52', '1', '打火机', '2', '11');
INSERT INTO `t_optionanswer` VALUES ('53', '5', '步行', '15', '12');
INSERT INTO `t_optionanswer` VALUES ('54', '4', '飞机', '10', '12');
INSERT INTO `t_optionanswer` VALUES ('55', '3', '汽车', '5', '12');
INSERT INTO `t_optionanswer` VALUES ('56', '2', '自行车', '3', '12');
INSERT INTO `t_optionanswer` VALUES ('57', '1', '火车', '2', '12');
INSERT INTO `t_optionanswer` VALUES ('58', '6', '红', '15', '13');
INSERT INTO `t_optionanswer` VALUES ('59', '5', '黄', '12', '13');
INSERT INTO `t_optionanswer` VALUES ('60', '4', '白', '8', '13');
INSERT INTO `t_optionanswer` VALUES ('61', '3', '蓝', '5', '13');
INSERT INTO `t_optionanswer` VALUES ('62', '2', '黑', '3', '13');
INSERT INTO `t_optionanswer` VALUES ('63', '1', '紫', '2', '13');
INSERT INTO `t_optionanswer` VALUES ('64', '6', '蹦极', '15', '14');
INSERT INTO `t_optionanswer` VALUES ('65', '5', '足球', '10', '14');
INSERT INTO `t_optionanswer` VALUES ('66', '4', '拳击', '8', '14');
INSERT INTO `t_optionanswer` VALUES ('67', '3', '乒乓球', '5', '14');
INSERT INTO `t_optionanswer` VALUES ('68', '2', '自行车', '3', '14');
INSERT INTO `t_optionanswer` VALUES ('69', '1', '瑜珈', '2', '14');
INSERT INTO `t_optionanswer` VALUES ('70', '5', '城中区', '15', '15');
INSERT INTO `t_optionanswer` VALUES ('71', '4', '森林', '10', '15');
INSERT INTO `t_optionanswer` VALUES ('72', '3', '海边', '5', '15');
INSERT INTO `t_optionanswer` VALUES ('73', '2', '草原', '3', '15');
INSERT INTO `t_optionanswer` VALUES ('74', '1', '湖边', '2', '15');
INSERT INTO `t_optionanswer` VALUES ('75', '5', '雷电', '15', '16');
INSERT INTO `t_optionanswer` VALUES ('76', '4', '雾', '10', '16');
INSERT INTO `t_optionanswer` VALUES ('77', '3', '雨', '5', '16');
INSERT INTO `t_optionanswer` VALUES ('78', '2', '风', '3', '16');
INSERT INTO `t_optionanswer` VALUES ('79', '1', '雪', '2', '16');
INSERT INTO `t_optionanswer` VALUES ('80', '5', '三十层', '15', '17');
INSERT INTO `t_optionanswer` VALUES ('81', '4', '十八层', '10', '17');
INSERT INTO `t_optionanswer` VALUES ('82', '3', '二十三层', '5', '17');
INSERT INTO `t_optionanswer` VALUES ('83', '2', '一层', '3', '17');
INSERT INTO `t_optionanswer` VALUES ('84', '1', '七层', '2', '17');
INSERT INTO `t_optionanswer` VALUES ('85', '6', '北京', '15', '18');
INSERT INTO `t_optionanswer` VALUES ('86', '5', '杭州', '10', '18');
INSERT INTO `t_optionanswer` VALUES ('87', '4', '西安', '8', '18');
INSERT INTO `t_optionanswer` VALUES ('88', '3', '昆明', '5', '18');
INSERT INTO `t_optionanswer` VALUES ('89', '2', '拉萨', '3', '18');
INSERT INTO `t_optionanswer` VALUES ('90', '1', '丽江', '1', '18');
INSERT INTO `t_optionanswer` VALUES ('91', '3', '你坚持与妻子（或丈夫）心平气和地讨论这些烦心事，从而减轻各自心里的压力。', '1', '19');
INSERT INTO `t_optionanswer` VALUES ('92', '2', '你试图与家庭外的第三者谈论那些令人生气的事情，以便使自己的感情能被人所理解；', '2', '19');
INSERT INTO `t_optionanswer` VALUES ('93', '1', '你决定从容不迫地加以忍受，尽量避免争论；', '3', '19');
INSERT INTO `t_optionanswer` VALUES ('94', '3', '你决定向朋友开诚布公地陈述自己的看法。', '1', '20');
INSERT INTO `t_optionanswer` VALUES ('95', '2', '认为这在可不必忧虑，因为时间还长，事情是会起变化的；', '2', '20');
INSERT INTO `t_optionanswer` VALUES ('96', '1', '你说服自己，认识到这种担心纯属多余，应该往好的方面去想；', '3', '20');
INSERT INTO `t_optionanswer` VALUES ('97', '3', '你想方设法节省开支，调整饮食。', '1', '21');
INSERT INTO `t_optionanswer` VALUES ('98', '2', '每次看到东西涨价，心头的愤怒便要增添几分，可是还得无可奈何地去买这些东西；', '2', '21');
INSERT INTO `t_optionanswer` VALUES ('99', '1', '不管怎样涨，决定不改变饮食习惯；', '3', '21');
INSERT INTO `t_optionanswer` VALUES ('100', '3', '你首先认真地分析了这项工作对自已的要求，然后准备积极地去承担它。', '1', '22');
INSERT INTO `t_optionanswer` VALUES ('101', '2', '你怀疑自已是否能胜任这项新的任命；', '2', '22');
INSERT INTO `t_optionanswer` VALUES ('102', '1', '你婉言谢绝，因为要求很严，怕吃不消；', '3', '22');
INSERT INTO `t_optionanswer` VALUES ('103', '3', '你向医生要来一些镇静剂，以帮助自已度过这段痛苦的时间', '3', '23');
INSERT INTO `t_optionanswer` VALUES ('104', '2', '你挂断电话，痛哭流泪', '2', '23');
INSERT INTO `t_optionanswer` VALUES ('105', '1', '你暂时设法控制自已的感情，因为需要你去通知别的熟人；', '1', '23');
INSERT INTO `t_optionanswer` VALUES ('106', '3', '你认为最好的办法是不与任何一方父母在一起，这样可以减少不必要的麻烦。', '3', '24');
INSERT INTO `t_optionanswer` VALUES ('107', '2', '你决定在重要的节假日时与自已最喜欢喜的长辈在一起，而在次要的节假日里不与任何一方父母在一起；', '2', '24');
INSERT INTO `t_optionanswer` VALUES ('108', '1', '你制定出一个严格的五年计划，要求自已统筹兼顾；', '1', '24');
INSERT INTO `t_optionanswer` VALUES ('109', '3', '你认为自已的身体最终会好起来，所以迟迟不去看病。', '3', '25');
INSERT INTO `t_optionanswer` VALUES ('110', '2', '你鼓起勇气与家人谈自已的疾病，并及时去找医生看病；', '1', '25');
INSERT INTO `t_optionanswer` VALUES ('111', '1', '你自已诊断病情；', '2', '25');

-- ----------------------------
-- Table structure for `t_test`
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test` (
  `testid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`testid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_test
-- ----------------------------
INSERT INTO `t_test` VALUES ('1', '职业经理人压力应变能力测评', null);
INSERT INTO `t_test` VALUES ('2', '心理测试', null);
INSERT INTO `t_test` VALUES ('3', '素质测试', null);
INSERT INTO `t_test` VALUES ('4', '判断能力测试题', null);
INSERT INTO `t_test` VALUES ('5', '霍兰德职业倾向测验量表', null);
INSERT INTO `t_test` VALUES ('6', '艾森克情绪稳定性测验', null);
INSERT INTO `t_test` VALUES ('7', 'FPA性格色彩测试题及结果分析', null);
INSERT INTO `t_test` VALUES ('8', 'DISC职业性格测评', null);
INSERT INTO `t_test` VALUES ('9', 'MBTI职业性格测试题', null);
INSERT INTO `t_test` VALUES ('10', '管理能力的测评', null);
INSERT INTO `t_test` VALUES ('11', '基层岗位招聘笔试题', null);
INSERT INTO `t_test` VALUES ('12', '应届生一般能力测验', null);
INSERT INTO `t_test` VALUES ('13', '招聘笔试之综合能力测试题', null);

-- ----------------------------
-- Table structure for `t_testresult`
-- ----------------------------
DROP TABLE IF EXISTS `t_testresult`;
CREATE TABLE `t_testresult` (
  `resultid` int(11) NOT NULL AUTO_INCREMENT,
  `testid` int(11) DEFAULT NULL,
  `stscore` int(11) DEFAULT NULL,
  `edscore` int(11) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`resultid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_testresult
-- ----------------------------
INSERT INTO `t_testresult` VALUES ('1', '1', '10', '15', '在生活压力面前的强者。你的压力应变能力很强。', '你凡事想得开，心胸比较开阔。同时以比较成熟，懂事理，很善于处理日常生活中一些棘手事情，生活是一把任由你弹拔的六弦琴。');
INSERT INTO `t_testresult` VALUES ('2', '1', '16', '25', '有苦恼但可以理顺。压力应变能力尚可。', '对生活中的一般情况，你是较会处理的，不会为那大大小小繁琐的事情所扰。但是当你碰到一些糟糕的事情时，你往往就困扰，不知从何处下手了。有时会产生紧张，不安的情绪。希望你能够迎着困难上，在烦恼中不断锻炼自己。');
INSERT INTO `t_testresult` VALUES ('3', '1', '26', '30', '你好像被压力击垮了。压力应变力很差。', '做事无主见，容易被周围的环境所左右，而且疑心、担忧，心事重重，就是你的特点。碰到生活中的诸多困难，你总不能顺利、完满地解决，相反每每产生过多紧张、忧虑的情绪，有时甚至完全消沉下来。如此对你的身心是十分有害的，希望你对这十个问题再研究一下，对照计分表，看看每一个问题得分最少的那个选择是什么，其实这个选择也就是应付生活压力的最好的行之有效的办法。');
INSERT INTO `t_testresult` VALUES ('4', '2', '180', '999', '意志力强，头脑冷静，有较强的领导欲，事业心强，不达目的不罢休。外表和善，内心自傲，对有利于自己的人际关系比较看重，有时显得性格急噪，咄咄逼人，得理不饶人，不利于自己时顽强抗争，不轻易认输。思维理性，对爱情和婚姻的看法很现实，对金钱的欲望一般。', null);
INSERT INTO `t_testresult` VALUES ('5', '2', '140', '179', '聪明，性格活泼，人缘好，善于交朋友，心机较深。事业心强，渴望成功。思维较理性，崇尚爱情，但当爱情与婚姻发生冲突时会选择有利于自己的婚姻。金钱欲望强烈。', null);
INSERT INTO `t_testresult` VALUES ('6', '2', '100', '139', '爱幻想，思维较感性，以是否与自己投缘为标准来选择朋友。性格显得较孤傲，有时较急噪，有时优柔寡断。事业心较强，喜欢有创造性的工作，不喜欢按常规办事。性格倔强，言语犀利，不善于妥协。崇尚浪漫的爱情，但想法往往不切合实际。金钱欲望一般。', null);
INSERT INTO `t_testresult` VALUES ('7', '2', '70', '99', '好奇心强，喜欢冒险，人缘较好。事业心一般，对待工作，随遇而安，善于妥协。善于发现有趣的事情，但耐心较差，敢于冒险，但有时较胆小。渴望浪漫的爱情，但对婚姻的要求比较现实。不善理财。', null);
INSERT INTO `t_testresult` VALUES ('8', '2', '40', '69', '性情温良，重友谊，性格塌实稳重，但有时也比较狡黠。事业心一般，对本职工作能认真对待，但对自己专业以外事物没有太大兴趣，喜欢有规律的工作和生活，不喜欢冒险，家庭观念强，比较善于理财。', null);
INSERT INTO `t_testresult` VALUES ('9', '2', '0', '39', '散漫，爱玩，富于幻想。聪明机灵，待人热情，爱交朋友，但对朋友没有严格的选择标准。事业心较差，更善于享受生活，意志力和耐心都较差，我行我素。有较好的异性缘，但对爱情不够坚持认真，容易妥协。没有财产观念。', null);

-- ----------------------------
-- Table structure for `t_topic`
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic` (
  `topicid` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` int(11) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `testid` int(11) DEFAULT NULL,
  PRIMARY KEY (`topicid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_topic
-- ----------------------------
INSERT INTO `t_topic` VALUES ('1', '1', '面对至爱亲朋的生日和婚礼等喜庆大事，似乎不花钱是不可能的，这时，你该怎么办？', '1');
INSERT INTO `t_topic` VALUES ('2', '2', '当你房子里的家具和地毯因自来水管漏水而受到损坏时，你发现保险的项目不包括这一类的损失，这时你会：', '1');
INSERT INTO `t_topic` VALUES ('3', '3', '你同邻居打了一架，但什么也没有得到解决，这时你会：', '1');
INSERT INTO `t_topic` VALUES ('4', '1', '你更喜欢吃那种水果？', '2');
INSERT INTO `t_topic` VALUES ('5', '2', '你平时休闲经常去的地方', '2');
INSERT INTO `t_topic` VALUES ('6', '3', '你认为容易吸引你的人是？', '2');
INSERT INTO `t_topic` VALUES ('7', '4', '如果你可以成为一种动物，你希望自己是哪种？', '2');
INSERT INTO `t_topic` VALUES ('8', '5', '天气很热，你更愿意选择什么方式解暑？', '2');
INSERT INTO `t_topic` VALUES ('9', '6', '如果必须与一个你讨厌的动物或昆虫在一起生活，你能容忍哪一个', '2');
INSERT INTO `t_topic` VALUES ('10', '7', '你喜欢看哪类电影、电视剧？', '2');
INSERT INTO `t_topic` VALUES ('11', '8', '以下哪个是你身边必带的物品？', '2');
INSERT INTO `t_topic` VALUES ('12', '9', '你出行时喜欢坐什么交通工具？', '2');
INSERT INTO `t_topic` VALUES ('13', '10', '以下颜色你更喜欢哪种？', '2');
INSERT INTO `t_topic` VALUES ('14', '11', '下列运动中挑选一个你最喜欢的（不一定擅长）？', '2');
INSERT INTO `t_topic` VALUES ('15', '12', '如果你拥有一座别墅，你认为它应当建立在哪里？', '2');
INSERT INTO `t_topic` VALUES ('16', '13', '你更喜欢以下哪种天气现象？', '2');
INSERT INTO `t_topic` VALUES ('17', '14', '你希望自己的窗口在一座30层大楼的第几层？', '2');
INSERT INTO `t_topic` VALUES ('18', '15', '你认为自己更喜欢在以下哪一个城市中生活？', '2');
INSERT INTO `t_topic` VALUES ('19', '4', '现代化的生活节奏所产生的压力使你和妻子（或丈夫）烦躁易怒，这时你会：', '1');
INSERT INTO `t_topic` VALUES ('20', '5', '一位你很要好的朋友就要结婚了，但在你看来，这不是一桩美满的婚姻而是一场灾难，这时你会：', '1');
INSERT INTO `t_topic` VALUES ('21', '6', '你担心物价上涨，但你会：', '1');
INSERT INTO `t_topic` VALUES ('22', '7', '你的能力得到上司的重视，将要被任命去做一项重要的工作，这时你会：', '1');
INSERT INTO `t_topic` VALUES ('23', '8', '你的亲戚朋友中有人在意外事故中受了重伤，当你在电话里听到这个不幸消息时，你会：', '1');
INSERT INTO `t_topic` VALUES ('24', '9', '每逢节假日，你和妻子（或丈夫）之间总有一场争论，到底是拜访自已的双亲还是她（或他）的父母，这时你会：', '1');
INSERT INTO `t_topic` VALUES ('25', '10', '在你的身体感觉不适时，你会：', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70');
INSERT INTO `t_user` VALUES ('2', '高国生', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `t_user` VALUES ('3', 'test', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for `t_useranswer`
-- ----------------------------
DROP TABLE IF EXISTS `t_useranswer`;
CREATE TABLE `t_useranswer` (
  `answid` int(11) NOT NULL AUTO_INCREMENT,
  `topicid` int(11) DEFAULT NULL,
  `optansid` int(11) DEFAULT NULL,
  `utestid` int(11) DEFAULT NULL,
  PRIMARY KEY (`answid`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_useranswer
-- ----------------------------
INSERT INTO `t_useranswer` VALUES ('7', '4', '10', '2');
INSERT INTO `t_useranswer` VALUES ('8', '5', '17', '2');
INSERT INTO `t_useranswer` VALUES ('9', '6', '23', '2');
INSERT INTO `t_useranswer` VALUES ('4', '1', '2', '1');
INSERT INTO `t_useranswer` VALUES ('5', '2', '6', '1');
INSERT INTO `t_useranswer` VALUES ('6', '3', '8', '1');
INSERT INTO `t_useranswer` VALUES ('10', '7', '28', '2');
INSERT INTO `t_useranswer` VALUES ('11', '8', '33', '2');
INSERT INTO `t_useranswer` VALUES ('12', '1', '1', '3');
INSERT INTO `t_useranswer` VALUES ('13', '2', '6', '3');
INSERT INTO `t_useranswer` VALUES ('14', '3', '9', '3');
INSERT INTO `t_useranswer` VALUES ('15', '1', '3', '4');
INSERT INTO `t_useranswer` VALUES ('16', '2', '5', '4');
INSERT INTO `t_useranswer` VALUES ('17', '3', '9', '4');
INSERT INTO `t_useranswer` VALUES ('18', '4', '10', '5');
INSERT INTO `t_useranswer` VALUES ('19', '5', '18', '5');
INSERT INTO `t_useranswer` VALUES ('20', '6', '23', '5');
INSERT INTO `t_useranswer` VALUES ('21', '7', '27', '5');
INSERT INTO `t_useranswer` VALUES ('22', '8', '34', '5');
INSERT INTO `t_useranswer` VALUES ('23', '9', '41', '5');
INSERT INTO `t_useranswer` VALUES ('24', '10', '43', '5');
INSERT INTO `t_useranswer` VALUES ('25', '11', '48', '5');
INSERT INTO `t_useranswer` VALUES ('26', '12', '56', '5');
INSERT INTO `t_useranswer` VALUES ('27', '13', '58', '5');
INSERT INTO `t_useranswer` VALUES ('28', '14', '67', '5');
INSERT INTO `t_useranswer` VALUES ('29', '15', '72', '5');
INSERT INTO `t_useranswer` VALUES ('30', '16', '79', '5');
INSERT INTO `t_useranswer` VALUES ('31', '17', '81', '5');
INSERT INTO `t_useranswer` VALUES ('32', '18', '86', '5');
INSERT INTO `t_useranswer` VALUES ('33', '4', '11', '6');
INSERT INTO `t_useranswer` VALUES ('34', '5', '15', '6');
INSERT INTO `t_useranswer` VALUES ('35', '6', '25', '6');
INSERT INTO `t_useranswer` VALUES ('36', '7', '31', '6');
INSERT INTO `t_useranswer` VALUES ('37', '8', '34', '6');
INSERT INTO `t_useranswer` VALUES ('38', '9', '41', '6');
INSERT INTO `t_useranswer` VALUES ('39', '10', '47', '6');
INSERT INTO `t_useranswer` VALUES ('40', '11', '48', '6');
INSERT INTO `t_useranswer` VALUES ('41', '12', '55', '6');
INSERT INTO `t_useranswer` VALUES ('42', '13', '61', '6');
INSERT INTO `t_useranswer` VALUES ('43', '14', '64', '6');
INSERT INTO `t_useranswer` VALUES ('44', '15', '72', '6');
INSERT INTO `t_useranswer` VALUES ('45', '16', '79', '6');
INSERT INTO `t_useranswer` VALUES ('46', '17', '84', '6');
INSERT INTO `t_useranswer` VALUES ('47', '18', '90', '6');
INSERT INTO `t_useranswer` VALUES ('48', '4', '14', '7');
INSERT INTO `t_useranswer` VALUES ('49', '5', '17', '7');
INSERT INTO `t_useranswer` VALUES ('50', '6', '23', '7');
INSERT INTO `t_useranswer` VALUES ('51', '7', '31', '7');
INSERT INTO `t_useranswer` VALUES ('52', '8', '34', '7');
INSERT INTO `t_useranswer` VALUES ('53', '9', '39', '7');
INSERT INTO `t_useranswer` VALUES ('54', '10', '47', '7');
INSERT INTO `t_useranswer` VALUES ('55', '11', '48', '7');
INSERT INTO `t_useranswer` VALUES ('56', '12', '57', '7');
INSERT INTO `t_useranswer` VALUES ('57', '13', '60', '7');
INSERT INTO `t_useranswer` VALUES ('58', '14', '65', '7');
INSERT INTO `t_useranswer` VALUES ('59', '15', '72', '7');
INSERT INTO `t_useranswer` VALUES ('60', '16', '78', '7');
INSERT INTO `t_useranswer` VALUES ('61', '17', '84', '7');
INSERT INTO `t_useranswer` VALUES ('62', '18', '85', '7');
INSERT INTO `t_useranswer` VALUES ('63', '4', '14', '8');
INSERT INTO `t_useranswer` VALUES ('64', '5', '17', '8');
INSERT INTO `t_useranswer` VALUES ('65', '6', '23', '8');
INSERT INTO `t_useranswer` VALUES ('66', '7', '31', '8');
INSERT INTO `t_useranswer` VALUES ('67', '8', '34', '8');
INSERT INTO `t_useranswer` VALUES ('68', '9', '39', '8');
INSERT INTO `t_useranswer` VALUES ('69', '10', '47', '8');
INSERT INTO `t_useranswer` VALUES ('70', '11', '48', '8');
INSERT INTO `t_useranswer` VALUES ('71', '12', '57', '8');
INSERT INTO `t_useranswer` VALUES ('72', '13', '60', '8');
INSERT INTO `t_useranswer` VALUES ('73', '14', '65', '8');
INSERT INTO `t_useranswer` VALUES ('74', '15', '72', '8');
INSERT INTO `t_useranswer` VALUES ('75', '16', '78', '8');
INSERT INTO `t_useranswer` VALUES ('76', '17', '84', '8');
INSERT INTO `t_useranswer` VALUES ('77', '18', '85', '8');
INSERT INTO `t_useranswer` VALUES ('78', '4', '14', '9');
INSERT INTO `t_useranswer` VALUES ('79', '5', '17', '9');
INSERT INTO `t_useranswer` VALUES ('80', '6', '23', '9');
INSERT INTO `t_useranswer` VALUES ('81', '7', '31', '9');
INSERT INTO `t_useranswer` VALUES ('82', '8', '34', '9');
INSERT INTO `t_useranswer` VALUES ('83', '9', '39', '9');
INSERT INTO `t_useranswer` VALUES ('84', '10', '47', '9');
INSERT INTO `t_useranswer` VALUES ('85', '11', '48', '9');
INSERT INTO `t_useranswer` VALUES ('86', '12', '57', '9');
INSERT INTO `t_useranswer` VALUES ('87', '13', '60', '9');
INSERT INTO `t_useranswer` VALUES ('88', '14', '65', '9');
INSERT INTO `t_useranswer` VALUES ('89', '15', '72', '9');
INSERT INTO `t_useranswer` VALUES ('90', '16', '78', '9');
INSERT INTO `t_useranswer` VALUES ('91', '17', '84', '9');
INSERT INTO `t_useranswer` VALUES ('92', '18', '85', '9');

-- ----------------------------
-- Table structure for `t_usertest`
-- ----------------------------
DROP TABLE IF EXISTS `t_usertest`;
CREATE TABLE `t_usertest` (
  `utestid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `testid` int(11) DEFAULT NULL,
  `creattime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`utestid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_usertest
-- ----------------------------
INSERT INTO `t_usertest` VALUES ('1', '2', '1', '2012-12-10');
INSERT INTO `t_usertest` VALUES ('2', '2', '2', '2012-12-10');
INSERT INTO `t_usertest` VALUES ('3', '2', '1', '2012-12-11');
INSERT INTO `t_usertest` VALUES ('4', '3', '1', '2012-12-11');
INSERT INTO `t_usertest` VALUES ('5', '3', '2', '2012-12-11');
INSERT INTO `t_usertest` VALUES ('6', '3', '2', '2012-12-11');
INSERT INTO `t_usertest` VALUES ('7', '3', '2', '2012-12-11');
INSERT INTO `t_usertest` VALUES ('8', '3', '2', '2012-12-11');
INSERT INTO `t_usertest` VALUES ('9', '3', '2', '2012-12-11');

-- ----------------------------
-- View structure for `v_useranswer`
-- ----------------------------
DROP VIEW IF EXISTS `v_useranswer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_useranswer` AS select `a`.`utestid` AS `utestid`,sum(`b`.`score`) AS `score` from (`t_useranswer` `a` left join `t_optionanswer` `b` on((`a`.`optansid` = `b`.`optansid`))) group by `a`.`utestid` ;

-- ----------------------------
-- View structure for `v_usertest`
-- ----------------------------
DROP VIEW IF EXISTS `v_usertest`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usertest` AS select `a`.`utestid` AS `utestid`,`a`.`userid` AS `userid`,`a`.`testid` AS `testid`,`a`.`creattime` AS `creattime`,`b`.`username` AS `username`,`c`.`score` AS `score`,`d`.`title` AS `title` from (((`t_usertest` `a` left join `t_user` `b` on((`a`.`userid` = `b`.`userid`))) left join `v_useranswer` `c` on((`c`.`utestid` = `a`.`utestid`))) left join `t_test` `d` on((`a`.`testid` = `d`.`testid`))) ;

-- ----------------------------
-- View structure for `v_usertestdetail`
-- ----------------------------
DROP VIEW IF EXISTS `v_usertestdetail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usertestdetail` AS select `a`.`answid` AS `answid`,`a`.`topicid` AS `topicid`,`a`.`optansid` AS `optansid`,`a`.`utestid` AS `utestid`,`c`.`content` AS `topicname`,`c`.`ordernum` AS `topicnum`,`b`.`content` AS `answername`,`b`.`score` AS `score` from ((`t_useranswer` `a` left join `t_optionanswer` `b` on((`a`.`optansid` = `b`.`optansid`))) left join `t_topic` `c` on((`a`.`topicid` = `c`.`topicid`))) ;
