-- ----------------------------
-- 日期：2018-01-09 16:32:45
-- 仅用于测试和学习,本程序不适合处理超大量数据
-- ----------------------------

-- ----------------------------
-- Table structure for `bds_admin_access`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_access`;
CREATE TABLE `bds_admin_access` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `bds_admin_group`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_group`;
CREATE TABLE `bds_admin_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `rules` varchar(4000) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Table structure for `bds_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_menu`;
CREATE TABLE `bds_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '上级菜单ID',
  `title` varchar(32) DEFAULT '' COMMENT '菜单名称',
  `en_title` varchar(255) NOT NULL COMMENT '产品分类的英文名',
  `url` varchar(127) DEFAULT '' COMMENT '链接地址',
  `nav` varchar(50) DEFAULT '0' COMMENT '前台导航路径',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `menu_type` tinyint(4) DEFAULT NULL COMMENT '菜单类型',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `rule_id` int(11) DEFAULT NULL COMMENT '权限id',
  `module` varchar(50) DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL COMMENT '三级菜单吗',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='【配置】后台菜单表';

-- ----------------------------
-- Table structure for `bds_admin_post`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_post`;
CREATE TABLE `bds_admin_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '岗位备注',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `status` tinyint(5) DEFAULT '1' COMMENT '状态1启用,0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Table structure for `bds_admin_rule`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_rule`;
CREATE TABLE `bds_admin_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `name` varchar(100) DEFAULT '' COMMENT '定义',
  `level` tinyint(5) DEFAULT NULL COMMENT '级别。1模块,2控制器,3操作',
  `pid` int(11) DEFAULT '0' COMMENT '父id，默认0',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态，1启用，0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
-- Table structure for `bds_admin_structure`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_structure`;
CREATE TABLE `bds_admin_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='公司结构表';

-- ----------------------------
-- Table structure for `bds_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_user`;
CREATE TABLE `bds_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) DEFAULT NULL COMMENT '管理后台账号',
  `password` varchar(100) DEFAULT NULL COMMENT '管理后台密码',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `create_time` int(11) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `structure_id` int(11) DEFAULT NULL COMMENT '部门',
  `post_id` int(11) DEFAULT NULL COMMENT '岗位',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态,1启用0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
-- Table structure for `bds_brand`
-- ----------------------------
DROP TABLE IF EXISTS `bds_brand`;
CREATE TABLE `bds_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '案例分类',
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_estonian_ci DEFAULT NULL,
  `type` varchar(50) NOT NULL COMMENT '所属分类',
  `content` text NOT NULL,
  `order` int(11) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '0不推送1推送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- ----------------------------
-- Table structure for `bds_contact`
-- ----------------------------
DROP TABLE IF EXISTS `bds_contact`;
CREATE TABLE `bds_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `hotline` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `posts` varchar(11) NOT NULL COMMENT '邮编',
  `hremail` varchar(50) DEFAULT NULL,
  `backimage` varchar(255) DEFAULT NULL,
  `create_time` varchar(50) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) DEFAULT '2' COMMENT '1公司总/分部2其他',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='分公司表';

-- ----------------------------
-- Table structure for `bds_friend`
-- ----------------------------
DROP TABLE IF EXISTS `bds_friend`;
CREATE TABLE `bds_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Table structure for `bds_joins`
-- ----------------------------
DROP TABLE IF EXISTS `bds_joins`;
CREATE TABLE `bds_joins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '所属分类',
  `en_title` varchar(255) NOT NULL COMMENT '英文标题',
  `title` varchar(255) NOT NULL COMMENT '条目标题',
  `pic` varchar(255) NOT NULL COMMENT '图标',
  `img` varchar(255) NOT NULL COMMENT '优势图',
  `content` text NOT NULL,
  `order` int(11) NOT NULL,
  `create_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='招商加盟表';

-- ----------------------------
-- Table structure for `bds_measure`
-- ----------------------------
DROP TABLE IF EXISTS `bds_measure`;
CREATE TABLE `bds_measure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tel` varchar(25) NOT NULL,
  `ordertime` varchar(25) NOT NULL COMMENT '预约时间',
  `address` varchar(255) NOT NULL COMMENT '预约地址',
  `status` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='预约测量表';

-- ----------------------------
-- Table structure for `bds_news`
-- ----------------------------
DROP TABLE IF EXISTS `bds_news`;
CREATE TABLE `bds_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pid` int(11) NOT NULL COMMENT '新闻分类',
  `content` text,
  `listpic` varchar(255) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `read_num` int(11) NOT NULL COMMENT '阅读次数',
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '1推送0不推送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='新闻动态观点表';

-- ----------------------------
-- Table structure for `bds_order`
-- ----------------------------
DROP TABLE IF EXISTS `bds_order`;
CREATE TABLE `bds_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(11) NOT NULL COMMENT '订单号',
  `status` varchar(55) NOT NULL COMMENT '-1 不存在，0在发货，1已发货',
  `time` varchar(32) NOT NULL,
  `ip` varchar(25) NOT NULL,
  `login_ip` varchar(25) NOT NULL,
  `num` int(3) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='模拟订单表';

-- ----------------------------
-- Table structure for `bds_product`
-- ----------------------------
DROP TABLE IF EXISTS `bds_product`;
CREATE TABLE `bds_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '产品分类id',
  `litpic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `en_title` varchar(255) NOT NULL COMMENT '产品英文名称',
  `subtitle` varchar(255) NOT NULL COMMENT 'banner右下角标题',
  `desc` text NOT NULL COMMENT '描述',
  `desc2` text NOT NULL COMMENT '描述信息第2行',
  `content` text,
  `status` varchar(50) NOT NULL COMMENT '推送状态',
  `create_time` varchar(50) NOT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Table structure for `bds_service`
-- ----------------------------
DROP TABLE IF EXISTS `bds_service`;
CREATE TABLE `bds_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_title` varchar(255) DEFAULT NULL,
  `vice_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `content` text,
  `banner` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL COMMENT '所属部分',
  `create_time` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='服务表';

-- ----------------------------
-- Table structure for `bds_shou_ye`
-- ----------------------------
DROP TABLE IF EXISTS `bds_shou_ye`;
CREATE TABLE `bds_shou_ye` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `path` int(11) DEFAULT NULL COMMENT '子类id',
  `type` int(11) DEFAULT NULL,
  `backimage` varchar(255) DEFAULT NULL COMMENT '栏目banner',
  `url` varchar(100) DEFAULT NULL COMMENT '栏目链接',
  `content` text,
  `order` int(11) DEFAULT NULL COMMENT '栏目排序',
  `create_time` varchar(50) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='网站首页表';

-- ----------------------------
-- Table structure for `bds_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `bds_system_config`;
CREATE TABLE `bds_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(50) DEFAULT '',
  `value` varchar(500) DEFAULT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned DEFAULT '0' COMMENT '配置分组',
  `need_auth` tinyint(4) DEFAULT '1' COMMENT '1需要登录后才能获取，0不需要登录即可获取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `参数名` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='【配置】系统配置表';

-- ----------------------------
-- Records for `bds_admin_access`
-- ----------------------------
INSERT INTO `bds_admin_access` VALUES ('2', '15');
INSERT INTO `bds_admin_access` VALUES ('3', '16');
INSERT INTO `bds_admin_access` VALUES ('4', '16');

-- ----------------------------
-- Records for `bds_admin_group`
-- ----------------------------
INSERT INTO `bds_admin_group` VALUES ('15', '普通会员', '1,2,3,4,5,6,7,8,9,10,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,61,62,63,28,29', '0', '最厉害的组别', '1');
INSERT INTO `bds_admin_group` VALUES ('16', '超级管理员', '10,30,31,32,33,34,35,36,37,28,29,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,61,62,63', '', '超级管理员', '1');

-- ----------------------------
-- Records for `bds_admin_menu`
-- ----------------------------
INSERT INTO `bds_admin_menu` VALUES ('52', '0', '网站后台管理系统', '', '', '', '', '1', '0', '1', '10', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('53', '52', '系统配置', '', '', '', '', '1', '1', '1', '61', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('54', '53', '菜单管理', '', '/home/menu/list', '', '', '1', '1', '1', '21', 'Administrative', 'menu');
INSERT INTO `bds_admin_menu` VALUES ('55', '53', '系统参数', '', '/home/config/add', '', '', '1', '3', '1', '13', 'Administrative', 'systemConfig');
INSERT INTO `bds_admin_menu` VALUES ('56', '53', '权限规则', '', '/home/rule/list', '', '', '1', '2', '1', '13', 'Administrative', 'rule');
INSERT INTO `bds_admin_menu` VALUES ('57', '52', '组织架构', '', '', '', '', '1', '5', '1', '63', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('58', '57', '岗位管理', '', '/home/position/list', '', '', '1', '0', '1', '31', 'Administrative', 'position');
INSERT INTO `bds_admin_menu` VALUES ('59', '57', '部门管理', '', '/home/structures/list', '', '', '1', '0', '1', '39', 'Administrative', 'structures');
INSERT INTO `bds_admin_menu` VALUES ('60', '57', '用户组管理', '', '/home/groups/list', '', '', '1', '0', '1', '47', 'Administrative', 'groups');
INSERT INTO `bds_admin_menu` VALUES ('61', '52', '账户管理', '', '', '', '', '1', '0', '1', '62', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('62', '61', '账户列表', '', '/home/users/list', '', '', '1', '0', '1', '55', 'Administrative', 'users');
INSERT INTO `bds_admin_menu` VALUES ('63', '52', '内容管理', '', '', '', '', '1', '2', '1', '64', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('64', '63', '产品中心', '', '/home/product/list', '/product', '', '1', '1', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('65', '63', '品牌中心', '', '/home/brand/list', '/mark', '', '1', '2', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('66', '63', '服务中心', '', '/home/service/list', '/serve', '', '1', '3', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('67', '63', '新闻资讯', '', '/home/news/list', '/news', '', '1', '4', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('68', '63', '招商加盟', '', '/home/joins/list', '/join', '', '1', '5', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('70', '52', '其他管理', '', '', '', '', '1', '3', '1', '66', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('71', '70', '首页管理', '', '/home/shouye/list', '', '', '1', '1', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('72', '70', '数据库管理', '', '/home/mysqls/list', '', '', '1', '3', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('73', '70', '友情链接', '', '/home/friend/list', '', '', '1', '2', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('74', '70', '预约测量', '', '/home/measure/list', '', '', '1', '3', '1', '66', 'Administrative', 'casetype');
INSERT INTO `bds_admin_menu` VALUES ('77', '64', '儿童房系列', 'CHILDREN ROOM', '/home/product/child/list', '/product/child', 'http://localhost/bds/php/uploads/20180104/d83ab9bf4ad1f62077e4a8de72df0d7c.png', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('78', '64', '套房系列', 'FULL ROOM', '/home/product/taofang', '/product/taofang', 'http://localhost/bds/php/uploads/20180104/09f6864bfee91739dce22e3405e9b43b.png', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('79', '64', '书房系列', 'READING ROOM', '/home/product/book/list', '/product/book', 'http://localhost/bds/php/uploads/20180104/e433a5e29cf7f5bebe918a310f7a3f95.png', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('80', '64', '客厅系列', 'LIVING ROOM', '/home/product/live/list', '/product/live', 'http://localhost/bds/php/uploads/20180104/961d7e1a5eee9b0a4920ce123e69751f.png', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('81', '64', '卧室系列', 'SLEEP ROOM', '/home/product/bedroom/list', '/product/bedroom', 'http://localhost/bds/php/uploads/20180104/6d7ecdceee3114a4f82a4d5a90984dc3.png', '1', '5', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('82', '64', '实木家具', 'SOLID WOOD FUMITURE', '/home/product/shimu/list', '/product/shimu', 'http://localhost/bds/php/uploads/20180104/4abe8e3ae61c11a9ef6df744bd13702e.png', '1', '6', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('83', '64', '定制家居', 'CUSTOMIZED FUMITURE', '/home/product/order/list', '/product/order', 'http://localhost/bds/php/uploads/20180104/e927f13f8e1644498d0b7aea50232e25.png', '1', '7', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('84', '65', '品牌故事', '', '/home/brand/story/list', '/brand/story', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('85', '65', '品牌历程', '', '/home/brand/course/list', '/brand/course', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('86', '65', '品牌荣誉', '', '/home/brand/honor/list', '/brand/honor', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('87', '65', '企业文化', '', '/home/brand/culture/list', '/brand/culture', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('88', '66', '百得胜学院', '', '/home/service/school/list', '/service/school', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('89', '66', '预约测量', 'MAKE MEASURE', '/home/service/measure/list', '/service/measure', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('90', '66', '定制服务', 'WHOLEHEARTEDLY SERVICE', '/home/service/customized/list', '/service/customized', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('91', '66', '订单查询', 'ORDERS INQUIRY', '/home/service/order/list', '/service/order', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('92', '67', '公司咨询', '', '/home/news/ask/list', '/news/ask', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('93', '67', '各地动态', '', '/home/news/dynamic/list', '/news/dynamic', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('94', '67', '活动专题', '', '/home/news/topic/list', '/news/topic', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('95', '67', '行业资讯', '', '/home/news/industry/list', '/news/industry', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('96', '68', '品牌优势', 'INVESTMENT TO JOIN', '/home/joins/advantage/list', '/joins/advantage', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('97', '68', '加盟条件', 'JOINING CONDITION', '/home/joins/condition/list', '/joins/condition', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('98', '68', '加盟流程', 'JOINING CONDITION', '/home/joins/process/list', '/joins/process', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('99', '68', '加盟支持', 'SERVICE SUPPORT', '/home/joins/support/list', '/joins/support', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('100', '63', '联系我们', '', '/home/contact/list', '/call', '', '2', '7', '1', '67', 'Administrative', 'category');

-- ----------------------------
-- Records for `bds_admin_post`
-- ----------------------------
INSERT INTO `bds_admin_post` VALUES ('5', '后端开发工程师', '', '1484706862', '1');
INSERT INTO `bds_admin_post` VALUES ('6', '前端开发工程师', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('7', '设计师', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('11', '文案策划', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('12', '产品助理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('15', '总经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('20', '项目经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('25', '职能', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('26', '项目助理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('28', '人事经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('29', 'CEO', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('30', '品牌策划', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('31', '前端研发工程师', '', '1484706863', '1');

-- ----------------------------
-- Records for `bds_admin_rule`
-- ----------------------------
INSERT INTO `bds_admin_rule` VALUES ('10', '系统基础功能', 'admin', '1', '0', '1');
INSERT INTO `bds_admin_rule` VALUES ('11', '权限规则', 'rules', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('13', '规则列表', 'index', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('14', '权限详情', 'read', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('15', '编辑权限', 'update', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('16', '删除权限', 'delete', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('17', '添加权限', 'save', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('18', '批量删除权限', 'deletes', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('19', '批量启用/禁用权限', 'enables', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('20', '菜单管理', 'menus', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('21', '菜单列表', 'index', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('22', '添加菜单', 'save', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('23', '菜单详情', 'read', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('24', '编辑菜单', 'update', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('25', '删除菜单', 'delete', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('26', '批量删除菜单', 'deletes', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('27', '批量启用/禁用菜单', 'enables', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('28', '系统管理', 'systemConfigs', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('29', '修改系统配置', 'save', '3', '28', '1');
INSERT INTO `bds_admin_rule` VALUES ('30', '岗位管理', 'posts', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('31', '岗位列表', 'index', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('32', '岗位详情', 'read', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('33', '编辑岗位', 'update', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('34', '删除岗位', 'delete', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('35', '添加岗位', 'save', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('36', '批量删除岗位', 'deletes', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('37', '批量启用/禁用岗位', 'enables', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('38', '部门管理', 'structures', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('39', '部门列表', 'index', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('40', '部门详情', 'read', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('41', '编辑部门', 'update', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('42', '删除部门', 'delete', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('43', '添加部门', 'save', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('44', '批量删除部门', 'deletes', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('45', '批量启用/禁用部门', 'enables', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('46', '用户组管理', 'groups', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('47', '用户组列表', 'index', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('48', '用户组详情', 'read', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('49', '编辑用户组', 'update', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('50', '删除用户组', 'delete', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('51', '添加用户组', 'save', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('52', '批量删除用户组', 'deletes', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('53', '批量启用/禁用用户组', 'enables', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('54', '成员管理', 'users', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('55', '成员列表', 'index', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('56', '成员详情', 'read', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('57', '删除成员', 'delete', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('59', '管理菜单', 'Adminstrative', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('61', '系统管理二级菜单', 'systemConfig', '1', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('62', '账户管理二级菜单', 'personnel', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('63', '组织架构二级菜单', 'structures', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('64', '栏目管理二级菜单', 'Class', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('65', '栏目列表', 'index', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('66', '其他管理二级菜单', 'other', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('67', '栏目管理三级菜单', 'three', '3', '59', '1');

-- ----------------------------
-- Records for `bds_admin_structure`
-- ----------------------------
INSERT INTO `bds_admin_structure` VALUES ('57', '企业微信', '0', '1');
INSERT INTO `bds_admin_structure` VALUES ('58', '设计部', '57', '1');
INSERT INTO `bds_admin_structure` VALUES ('59', '网络部', '57', '1');

-- ----------------------------
-- Records for `bds_admin_user`
-- ----------------------------
INSERT INTO `bds_admin_user` VALUES ('1', 'admin', 'd93a5def7511da3d0f2d171d9c344e91', '', '', '超级管理员', '1', '5', '1');
INSERT INTO `bds_admin_user` VALUES ('4', 'admin123', '8b6804ff6d620e1ede6b8289a99fbf8d', '超级管理员', '1509611337', 'lxw', '59', '', '1');

-- ----------------------------
-- Records for `bds_brand`
-- ----------------------------
INSERT INTO `bds_brand` VALUES ('1', '84', 'http://localhost/bds/php/uploads/20171228/a892eb5d4d885ee204ac9c2c3fcf1cc5.png', 'BRAND STORY FURNITURE', '', '<p>百得胜成立于2001年4，环保全屋定制家具实力品牌，上市公司德尔未来（股票代码：002631）全资子公司，定制家具行业标准起草参编单位，歌手“平安”品牌代言。</p><p>百得胜“广州+苏州+成都+铁岭”全国4大生产基地战略布局落定，广州工厂拥有近7万平米标准化厂房，苏州工厂拥有132亩生产基地，于2015年5月正式投产；占地700亩成都生产基地将于2017年启动，第四大生产基地铁岭已置地。公司在岗职工1500余人，其中研发设计人员80余人。</p><p>百得胜凭借过硬的工艺，进口的德国豪迈、温康纳生产设备，好看、好用、环保的品质，赢得了权威机构的肯定并通过ISO国际质量体系认证、环境管理体系认证、国家十环认证、绿家居联盟认证等专业认证，深获千万家庭的信赖。</p><p>广州百得胜家居有限公司2017年开启“板木+板式+橱柜+床垫”小家居战略，整体研发生产实力更上一层楼。</p>', '1', '2017-12-27 17:52', '0');
INSERT INTO `bds_brand` VALUES ('2', '87', 'http://localhost/bds/php/uploads/20171228/e67705a7c0609baa3b74f898e91a566b.png', 'BRAND STORY FURNITURE', '', '<article><h5>使命</h5><h6>为顾客创造价值，为员工谋求福利</h6></article><article><h5>愿景</h5><h6>让百得胜成为市场推崇的家具品牌</h6></article><article><h5>使命</h5><h6>专注、创新、和谐</h6></article>', '2', '2017-12-27 17:56', '0');
INSERT INTO `bds_brand` VALUES ('3', '85', 'http://localhost/bds/php/uploads/20171228/0164e13141746790a6d6b798b683879d.png', 'BRAND STORY FURNITURE', '', '<h5>2001</h5><h6>百得胜依托资本平台，跨界融合，开启“板木+板式+橱柜+床垫”小家居战略。</h6>', '3', '2001-12-28 10:10', '0');
INSERT INTO `bds_brand` VALUES ('4', '85', 'http://localhost/bds/php/uploads/20171228/d6fa24b1fcb61e1bcbf855764e734a0e.png', 'BRAND STORY FURNITURE', '', '<h5>2002</h5><h6>百得胜加入上市公司——德尔未来（股票代码：002631）；成为国家击剑队高级赞助商；投资设立“苏州韩居实木定制家居有限公司”。</h6>', '4', '2002-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('5', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2003</h5><h6>签约歌星平安担任品牌形象代言人；苏州工厂一期正式投产。</h6>', '5', '2003-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('6', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2004</h5><h6>产品基础年，围绕环保、功能、设计全面优化产品体系，推行实施千万大商1314经营计划。</h6>', '6', '2004-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('7', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2005</h5><h6>招商基础年，开启金字塔经营结构模式，渠道网点增长560%。</h6>', '7', '2005-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('8', '86', 'http://localhost/bds/php/uploads/20171228/31d51c58386990ca5c09be825b47383d.png', 'BRAND STORY FURNITURE', '', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514445356130859.png" title="1514445356130859.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356310689.png" title="1514445356310689.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445391133230.png" title="1514445391133230.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356130859.png" title="1514445356130859.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356310689.png" title="1514445356310689.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445391133230.png" title="1514445391133230.png"/></p>', '7', '2006-12-28 10:16', '0');

-- ----------------------------
-- Records for `bds_contact`
-- ----------------------------
INSERT INTO `bds_contact` VALUES ('1', '百得胜', '广州市天河区天河北路906号高科大厦A座12楼', '<p>百得胜公司信息</p>', '（020）85274395/38319021', '400-629-2629', 'lxiaoling@paterson.com.cn', '510545', 'hr@ye2005.com', 'http://192.168.1.138/vuethink/php/uploads/20171211/d7539a258f166ca1615960dc46421925.jpg', '2017-11-27 20:17', '1', '1');

-- ----------------------------
-- Records for `bds_friend`
-- ----------------------------
INSERT INTO `bds_friend` VALUES ('1', '百得胜', 'http://www.paterson.com.cn', '1', '2017-11-30 18:10');
INSERT INTO `bds_friend` VALUES ('2', '德尔未来旗下全资子公司', 'http://www.paterson.com.cn', '22', '2017-11-30 18:12');

-- ----------------------------
-- Records for `bds_joins`
-- ----------------------------
INSERT INTO `bds_joins` VALUES ('1', '96', 'TEN ADVANTACES', '三大基地', 'http://localhost/bds/php/uploads/20180108/85ce66e23fe20687468578c21d99da38.png', 'http://localhost/bds/php/uploads/20180108/953188338f650d0ddb8b74064af2d505.png', '<p>规模化生产基地，百得胜战略布局“广州+苏州+成都+铁岭+天津”全国5大生产基地。纯德式精工生产体系-成熟高效-节约物流成本-缩短交货期。广州总部工厂，德国豪迈生产线及温康纳吸塑机。2015年苏州工厂一期75亩，投资1亿，聘请德国舒乐公司设计，7月正式投产。成都生产基地已征地，将于2015年正式启动，2016年投入生产。</p>', '1', '2017-12-29 15:19');
INSERT INTO `bds_joins` VALUES ('2', '96', 'TEN ADVANTACES', '硬件软件', 'http://localhost/bds/php/uploads/20180108/93cd2ae7c0a7c01fc3e740edfef9a0e7.png', 'http://localhost/bds/php/uploads/20180109/ce56061a2a91f1635ddcaa1a67247b73.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '2', '2017-12-29 15:15');
INSERT INTO `bds_joins` VALUES ('3', '96', 'TEN ADVANTACES', '产品创新', 'http://localhost/bds/php/uploads/20180108/a2b5f48d55d0134faa592f60bb27841a.png', 'http://localhost/bds/php/uploads/20180109/ffd4d8ae6c50cc48370b2d6767a6b54d.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '3', '2017-12-29 15:22');
INSERT INTO `bds_joins` VALUES ('4', '96', 'TEN ADVANTACES', '活动策划', 'http://localhost/bds/php/uploads/20180108/1f365c1860366b04aff5619b5c52f669.png', 'http://localhost/bds/php/uploads/20180109/cb632cbd5514827ee0456cff1027a3bc.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '4', '2017-12-29 15:23');
INSERT INTO `bds_joins` VALUES ('5', '96', 'TEN ADVANTACES', '三大支持', 'http://localhost/bds/php/uploads/20180108/b9f753744036bf6ccc9f0bc9f4d427d5.png', 'http://localhost/bds/php/uploads/20180109/b75587b6a9c76e96533adf11ca1969ff.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '5', '2017-12-29 15:23');
INSERT INTO `bds_joins` VALUES ('6', '96', 'TEN ADVANTACES', '终端形象', 'http://localhost/bds/php/uploads/20180108/e93c04d76dce4b721bd02612c42f649f.png', 'http://localhost/bds/php/uploads/20180109/9a2fc0ce98deb8f0f23d5283483d8da4.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '6', '2017-12-29 15:24');
INSERT INTO `bds_joins` VALUES ('7', '96', 'TEN ADVANTACES', '环保基材', 'http://localhost/bds/php/uploads/20180108/4227bbc24a4897331a3846eed438dbc9.png', 'http://localhost/bds/php/uploads/20180109/1bdd51cbc10859e5e6cf0ad3b21b174f.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '7', '2017-12-29 15:24');
INSERT INTO `bds_joins` VALUES ('8', '96', 'TEN ADVANTACES', '进口配件', 'http://localhost/bds/php/uploads/20180108/cb3f1d02e4d1a0a54b0b98ec264d31b8.png', 'http://localhost/bds/php/uploads/20180109/20e8652bce6ea85b8bbcc2ef1dab8582.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '8', '2017-12-29 15:25');
INSERT INTO `bds_joins` VALUES ('9', '96', 'TEN ADVANTACES', '培训学员', 'http://localhost/bds/php/uploads/20180108/c83cfc79d9a0f2ed52101c3e2719fbb3.png', 'http://localhost/bds/php/uploads/20180109/5ae64ffffa795c01abde5d025f368228.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '9', '2017-12-29 15:26');
INSERT INTO `bds_joins` VALUES ('10', '96', 'TEN ADVANTACES', '六心服务', 'http://localhost/bds/php/uploads/20180108/b201a804350326dbb4fdb1862f1e6f6c.png', 'http://localhost/bds/php/uploads/20180109/cae134a22ee9a6a05ad1826b9a2fb06c.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '10', '2017-12-29 15:26');
INSERT INTO `bds_joins` VALUES ('11', '97', 'JOINING CONDITION', '热爱家具事业，具备合法资格的法人或者自然人', 'http://localhost/bds/php/uploads/20180108/dbe24c4dca18fba9c3f9cbaf0b723f28.png', 'http://localhost/bds/php/uploads/20180108/bf91f9a8dfffbed65c68eb7cf027fb8f.png', '<p>加盟内容<br/></p>', '11', '2017-12-29 15:29');
INSERT INTO `bds_joins` VALUES ('12', '97', 'JOINING CONDITION', '具有一定的文化程度，具备经营管理，运作和持续发展的能力', 'http://localhost/bds/php/uploads/20180108/01216de361bc92bbdd55787b34e72584.png', 'http://localhost/bds/php/uploads/20180109/731d5ea659c5e083e78f8fcab2ad7a7b.jpg', '<p>加盟内容</p>', '12', '2017-12-29 15:32');
INSERT INTO `bds_joins` VALUES ('13', '97', 'JOINING CONDITION', '具有一定的资金中等发达水平地级及以上城市自有资金必须在40万以上', 'http://localhost/bds/php/uploads/20180108/3823ead486071bfed4c6e72ce1f1f642.png', 'http://localhost/bds/php/uploads/20180109/304892c19cb552eaa12ee6ce5508b432.jpg', '<p>加盟内容</p>', '13', '2017-12-29 15:40');
INSERT INTO `bds_joins` VALUES ('14', '97', 'JOINING CONDITION', '有良好的经营条件，符合公司要求的好店面，舍得在装修上花功夫和本钱', 'http://localhost/bds/php/uploads/20180108/8942ed883caad40f333e8f368d668ac6.png', 'http://localhost/bds/php/uploads/20180109/44774e90b3669d05af25d49d1b05c22a.jpg', '<p>加盟内容</p>', '14', '2017-12-29 15:42');
INSERT INTO `bds_joins` VALUES ('15', '98', 'JOINING PROCESS', '建立联系，初步达成合作意向', '', '', '<p>加盟内容</p>', '15', '2017-12-29T07:53:21.539Z');
INSERT INTO `bds_joins` VALUES ('16', '98', 'JOINING PROCESS', '填写申请表', '', '', '<p>盟内容</p>', '16', '2017-12-29 15:54');
INSERT INTO `bds_joins` VALUES ('17', '98', 'JOINING PROCESS', '区域经理考核，来公司实地考察了解', '', '', '<p>加盟内容</p>', '17', '2017-12-29 15:56');
INSERT INTO `bds_joins` VALUES ('18', '99', 'SERVICE SUPPORT', '服务支持', 'http://localhost/bds/php/uploads/20171229/8d24155f3627d332b5a2115bd78ae7a0.png', 'http://localhost/bds/php/uploads/20180108/bfae27130bff397bf53225f47d9f493e.png', '<p>百得胜学院隶属于广州百得胜家居有限公司，是专门为百得胜经销商打造专业人才队伍的基地。学院秉承“全面为经销商提供专业知识和培养专业人才”的办学理念，立足于行业发展和经销商人员管理模式，成立专业的培训团队，组织开发有效实用的培训课程，全方位为经销商培养专业人才，帮助经销商打造人才竞争力，通过专业人才提供专业服务，从而使经销商赢得市场及忠实客户。<br/></p>', '27', '2017-12-29 15:56');
INSERT INTO `bds_joins` VALUES ('19', '0', '33', '333', '', '', '<p>33<br/></p>', '33', '2018-01-06T09:28:24.288Z');
INSERT INTO `bds_joins` VALUES ('20', '97', '', '店面人员配置与素质', 'http://localhost/bds/php/uploads/20180108/821076ae6fce03a7125247fa5fc8a4db.png', 'http://localhost/bds/php/uploads/20180109/0ff7f91c2b27454f04310fb20c510c06.jpg', '<p>加盟内容</p>', '14', '2018-01-08 17:05');
INSERT INTO `bds_joins` VALUES ('21', '98', '', '签订加盟合同', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '18', '2018-01-08T09:08:47.522Z');
INSERT INTO `bds_joins` VALUES ('22', '98', '', '店面装修上样', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '19', '2018-01-08T09:09:31.252Z');
INSERT INTO `bds_joins` VALUES ('23', '98', '', '店面样品设计的确认，并交纳货款', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '20', '2018-01-08T09:10:35.715Z');
INSERT INTO `bds_joins` VALUES ('25', '98', '', '工作人员岗前培训', '', '', '<p>加盟内容</p>', '21', '2018-01-08 18:28');
INSERT INTO `bds_joins` VALUES ('26', '98', '', '店面布局空间设计，施工设计样品设计等', '', '', '<p>加盟内容</p>', '22', '2018-01-08T10:30:14.122Z');
INSERT INTO `bds_joins` VALUES ('27', '98', '', '交纳品牌加盟费与品牌保证金', '', '', '<p>·百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '23', '2018-01-09T03:46:28.487Z');
INSERT INTO `bds_joins` VALUES ('28', '98', '', '店面的装饰布置', '', '', '<p>加盟内容</p>', '24', '2018-01-09T03:47:07.715Z');
INSERT INTO `bds_joins` VALUES ('29', '98', '', '开业前指导与专卖店正式开业', '', '', '<p>加盟内</p>', '25', '2018-01-09T03:48:32.269Z');
INSERT INTO `bds_joins` VALUES ('30', '98', '', '总部定期跟进运营与指导支持', '', '', '<p>加盟内</p>', '26', '2018-01-09T03:49:36.745Z');
INSERT INTO `bds_joins` VALUES ('31', '99', '', '服务支持2', 'http://localhost/bds/php/uploads/20180109/85393cb302ab0e1176789e8d634ab1bd.png', '', '<p>百得胜历经16年市场沉淀，深谙行业无促不销之妙诀：实施终端精准营销，因需特设常规促销及大型主题促销。</p><p><strong>大型主题促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全年度、大力度在全国开展“百得胜无醛添加衣柜系列”大型主题会议营销活动。220计划、360计划、4场大型促销计划，简称234帮扶政策。</p><p><strong>日常常规促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;每年315、五一、十一、元旦等重大节假日开展全国统一促销活动；确保月月有主题、周周有活动</p><p><br/></p>', '28', '2018-01-09 11:53');
INSERT INTO `bds_joins` VALUES ('32', '99', '', '服务支持3', 'http://localhost/bds/php/uploads/20180109/376a4dc84163dc10459f5e3dafa63fcb.png', 'http://localhost/bds/php/', '<p>百得胜历经16年市场沉淀，深谙行业无促不销之妙诀：实施终端精准营销，因需特设常规促销及大型主题促销。</p><p><strong>大型主题促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全年度、大力度在全国开展“百得胜无醛添加衣柜系列”大型主题会议营销活动。220计划、360计划、4场大型促销计划，简称234帮扶政策。</p><p><strong>日常常规促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;每年315、五一、十一、元旦等重大节假日开展全国统一促销活动；确保月月有主题、周周有活动</p><p><br/></p>', '30', '2018-01-09T03:56:18.125Z');

-- ----------------------------
-- Records for `bds_measure`
-- ----------------------------
INSERT INTO `bds_measure` VALUES ('24', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('25', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('26', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('27', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('28', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('29', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');

-- ----------------------------
-- Records for `bds_news`
-- ----------------------------
INSERT INTO `bds_news` VALUES ('1', '专注膜压定制哪家强？百得胜膜压新品横空出世', '92', '<p><span style="font-size:16px"><span style="color:#dd4822">中国环保定制家居先行者——百得胜膜压新品盛大发布，开启全屋定制竞争新序幕。</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 11月30日，“啄木鸟的烦恼”2017年百得胜膜压新品发布会在广东从化韩居丽格膜压馆隆重召开。膜压新品是百得胜在板式、实木（板木）之外，开辟的又一产品线，是百得胜发展新的里程碑。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514451920113535.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>立于风口 膜压新品横空出世</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 近年来，家居市场成为消费升级的前沿阵地。消费者对家居生活品质的追求不断提高，对家具的质量、质感追求也是越来越高。与此同时， 艺术、设计、时尚等精神消费元素越来越多地走进家庭。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;板式家具虽然风格多变，但对追求品质格调的消费者来说已非首选；实木家具因其价格高昂，又让人望而却步；而随着性价比优越的“膜压”产品出现，定制家具的竞争格局也悄然发生变化——“板木”定制开始崭露头角。此时，由膜压之父陈家驹倾情打造的匠心之作、情怀之作——百得胜膜压系列新品应运而生。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/2_副本.jpg"/><br/><span style="font-size:16px">发布会现场宾朋满座</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此次，百得胜近800平米全是膜压产品的实木馆正式落成，意味着百得胜正式占领全屋定制竞争新的制高点。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514451923138428.jpg"/></p><p><span style="font-size:16px">全是膜压产品的实木馆</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;本次发布会膜压新品展馆涉及六大品类十大空间产品定制解决方案，达28+款式，满足9大人群定制需求。从0-5岁咿呀学语的小孩、到6-12岁的儿童、13岁至毕业的学生、单身的奋斗青年、新婚的二人世界、为人父母的三口之家、家成业就的人生赢家、品味人生的魅力中年、三世同堂的大家庭，都能体验百得胜定制家居的魅力。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “<strong>膜压”优势在哪里</strong>？</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/4_副本.jpg"/></p><p><span style="font-size:16px">百得胜执行总裁张健先生致辞</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜品牌负责人认为，传统板式、膜压产品以及实木（板木）就好像宝马的3系、5系以及7系。板式产品占最大量的销售份额，设计经典、功能实用。膜压产品定位是中端消费人群，对于设计、产品细节也更多追求。实木（板木）定位高端市场，<span style="font-family: 宋体;font-size: 14px">工艺日臻成熟</span>。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/5_副本.jpg"/></p><p><span style="font-size:16px">韩居丽格总裁芶良朝先生分享膜压成果</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;在板式家具的创新求变的路上，膜压技术的出现成为了关键。不同于实木容易开裂变形，膜压产品集成了板式家具实用性，且多以高密度板作为基材，不论什么地方物理性能都十分稳定。此外，实木产品因含水率等天然属性在非混油工艺的情况经常会有色差，但膜压则基本不存在这个问题。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;外观设计和价格是消费者最关心的问题。理论上来讲实木定制产品可以实现绝大部分外观效果，但是在做时尚类的产品表现时就有些不合适，价格很昂贵。但膜压产品有类似钢琴烤漆的高光类产品，也有一些水波粼粼效果的3D效果类产品，也有与实木近似度极高的“混”油类产品……而有些价格不到实木定制的一半，甚至部份款式可能仅为实木定制的1/3。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/6_副本.jpg"/></span></p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/7_副本.jpg"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 对标实木产品，膜压产品的优势明显。就物理性能来说，膜压产品相对稳定，不会开裂。韩居丽格供应给百得胜的膜压产品是用密度在810-820KG/立方米的高密度板作为基材，十分稳定。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/8_副本.jpg"/><br/><span style="font-size:16px">中国膜压之父陈家驹先生分享膜压工艺特性</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;百得胜膜压产品还具有媲美实木的外观与手感。发布会现场，通过观察与触摸，经销商家人及媒体朋友们仍感叹难以分辨百得胜膜压板与实木，陈家驹先生对此做出详细的技术说明。目前，百得胜美洲实木转膜压同款与实木的混油工艺产品视觉效果、触觉效果无限接近。膜压板耐脏、耐划、防火的性能，现场也一一演示。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/9_副本.jpg"/></p><p><span style="font-size:16px">膜压板防火性能现场演示</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 环保方面，百得胜使用无醛添加环保板材和水性胶、水性膜，打造更安醛的定制产品。此外，膜压产品还具有生产周期短、饰面效果好，外观时尚美观、性价比高等等优势。由此可见，好的生活，并不贵。百得胜始终致力于为消费者创造“品质好生活”。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;<strong> 专注膜压定制哪家强？</strong></span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/10_副本.jpg"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 作为中国人自己的定制家具品牌，百得胜一直致力于把好看、好用、环保的产品奉献给国人。本次发布会，百得胜领先业界推出多达28款膜压新品，不仅风格多、造型多、品类多、色彩多，每一件新品都是艺术品般的存在。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 目前，在全屋定制家具市场上，膜压产品越来越受到消费者的青睐。韩居丽格自身强大的生产实力＋百得胜专业的全屋定制实力，领衔膜压门板定制，专业专注成熟。在行业内率先实现基材密度板膜压、美洲实木和实木油漆三种工艺的互转，达到目前业内最高的工艺水准。<br/>其成都＋广州＋天津三大实木工厂，规模化定制实木、膜压、移门三大系列1000余款门型。</span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>百得胜&amp;韩居丽格 实力不容小觑</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 麦田的丰收来自肥沃的土壤与精心培育。<strong>百得胜丰富的膜压产品和精湛工艺则得益于强大的产能实力和研发优势。</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;<span style="color:#4444bb">| 研发优势</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;百得胜研发团队基于市场、基于用户、基于未来需求等多个纬度，研发新品。2017年，百得胜与韩居丽格完美融合，实现实木及膜压两大系列近30款新品的快速迭代。而韩居丽格从几十万到数百万的膜压产品生产线，到自动化、信息化等工业4.0符号性设备，为膜压产品总出货量行业第一奠定基础。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “<strong>实木膜压相互转化</strong>”：百得胜在业界率先实现了实木与膜压工艺互转。也就是说，百得胜每一款实木门型，都能对应一个同样样式的膜压门型。同一风格，不同配置，消费者买家具像买车一样来选择高配或标配。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 质美膜压，媲美实木。百得胜的部分膜压产品已与实木的混油工艺产品视觉效果、触觉效果完全一样，同时还拥有超高性价比、更短的生产周期等优势。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:#3c3cc4">| 产能优势</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 产能方面，百得胜&amp;韩居丽格在成都、广州、苏州、天津等多个生产基地，更大产能释放空间，规模化定制实木、膜压、移门三大系列1000余款门型，让百得胜的膜压产品在交货周期上获得极大保障。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/11_副本.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 膜皮的丰富可变性及全行业推动的技术革新，膜压产品在未来有非常广阔的市场前景，将是作为全屋定制领域产品的新增长点。此番，百得胜全屋定制携手韩居丽格，领衔膜压门板定制，实现膜压与实木工艺的互转定制，无疑将占据中国定制家居市场制高点！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><span style="font-family: 宋体;font-size: 14px"><span style="font-family:宋体">&nbsp;&nbsp;&nbsp; 质</span></span>美膜压 给自己更好的，来一起见证百得胜的产品创新力吧！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/dece288f29b0b3e360af06228b1150cc.jpg', '2017/12/28', '佚名', '1', '0', '0');
INSERT INTO `bds_news` VALUES ('2', '百得胜&松博宇强强联合 共赢“板木定制”未来', '92', '<p><span style="font-size:16px">&nbsp;&nbsp; 【前言】国民实木情节根深蒂固，却苦于其价格昂贵。随着国民消费升级催生出行业新风口——“板木定制”。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452085214083.jpg"/><br/><span style="font-size:16px"><strong>签约仪式</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年9月20日，百得胜&amp;松博宇战略合作签约仪式暨媒体见面会在中国·广州隆重举行。百得胜执行总裁张健先生与松博宇董事长詹雄光先生进行签约，正式对外宣布双方携手合作，这不是一场简单的发布会，这是一场志同而气合的战略发布会。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “志同而气合,鱼川泳而鸟云飞也。”松博宇 “原木板式化”与百得胜“板木＋实木”差异化板木定制理念不谋而合，二者战略携手，实现共赢。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 立于板木风口 未来已来</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 中国作为全球第二大经济体，国民消费力在多个领域都暗藏着繁荣之势。随着经济发展和消费升级，催生行业新风口——板木定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜，16年专注环保定制家居，全屋板木定制引领者，推出“板木+实木”的板木定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “板木+实木”的板木定制，不再单纯地追逐全实木，理性分析家居产品的实际使用，继全实木产品之后再推板木定制。</span><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; </strong></span></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 尊重专业</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
松博宇公司成立于2001年7月，专注于木材应用领域十多年，2014年被认定为国家高新技术企业，具备从原木选材到研发、生产、销售再到家居产品配套和服务的完整产业链，其自主研发产品为科技木类、生态有机板类、3D艺术板类、浮雕板及装饰木枋类等，部分产品畅销全球60多个国家和地区，在技术创新、产品内涵、市场价值和品牌竞争力等方面均居于行业前沿。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452086169932.jpg"/></p><p><span style="font-size:16px">百得胜执行总裁张健先生讲话</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 作为原木板式化的倡领与践行者，松博宇精选北美进口原材，配合极致的原木板式化加工工艺，产品走向了世界上六十多个国家和地区，从选材到工艺，从平面到立体，始终站在木业行业潮流的前端。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452087905259.jpg"/></p><p><span style="font-size:16px">松博宇董事长詹雄光先生讲话</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此番百得胜携手松博宇，松博宇自身强大的生产实力＋百得胜专业的全屋定制实力，更加高效整合上下游产业链，降低成本，实现不一样的板木定制。而百得胜全国千店和“OSA”电商模式打通线上与线下渠道之间的双向引流及对接，更是让板木落地开花，共赢板木定制大未来。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 不断夯实小家居大战略</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2016年，百得胜选择一种全新形式的资本之路——加入老牌上市企业德尔未来。在获得资本加持之后，百得胜开始加速布局，大力发展小家居战略。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜的“小家居战略”不同于当下热门的“大家居”，不盲目追逐企业的快速扩张，而是在坚持自有优势产品定制衣柜的基础上，发展全屋定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
而除衣柜产品以外的延伸品类产品百得胜选择了与行业内拥有优势积淀且有发展潜力，已经拥有一定实力的优质企业联手，从2016年开始，百得胜就先后与实木门板企业韩居丽格、橱柜企业丹得橱柜牵手，如今携手松博宇不断夯实小家居战略，此后百得胜还将牵手更多的周边产品企业。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>百得胜+松博宇 走出板木定制差异化</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 如果说，此前百得胜与实木定制强者韩居丽格的携手，让百得胜实木定制梦想终得以实现。那么，此次携手全屋原木定制供应商松博宇，用原木板式化的方式进行全屋定制生产，必然让百得胜走出一条差异化的板木定制之路。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 国民实木情节根深蒂固，却苦于其价格昂贵。那么该怎样实现呢？原木板式化走出了一条不一样的路。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452088471542.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 传统的实木定制一般都是对一块实木原木进行加工，成本比较高。而作为一家专注木业研发制造达到28年的企业，松博宇结合现阶段国内外工业发展的有利条件，提出把原木做成板式化，满足国民根深蒂固的实木情节，这与百得胜的实木梦想不谋而合。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在定制领域，从某种程度上来说，原木板式化是工业4.0的新风向之一。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在强调环保主概念的当下，优质的基材与丰富的产品线是企业竞争的不二砝码，百得胜始终坚持环保主张，更是在洞察市场的深度需求后，提出“板木定制”的战略性手段。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年3月，百得胜全新实木定制馆全面对外亮相，推出“板木+实</span><span style="font-size:16px">木”的“板木定制”概念，不单纯地追逐全实木，而是理性分析产品的实际使用，各取所长，结合实木与板木的双重优势，满足更多家庭及市场的需求。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年6月，百得胜以“好柜配好门”为主题，发布新品美洲实木柜体，与百得胜此前推出的美洲实木柜门形成了完整套系。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/920/图片2.JPG"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 美洲实木柜体的推出，让百得胜形成了“美洲实木柜体+美洲实木门板”此类独创的板木定制环保+抗变形技能满分的定制家具。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 至此，在板式定制+实木定制领域内，百得胜已经成长为值得期待的黑马。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此番携手，更是独辟蹊径，走出一条差异化发展之路，无疑是为百得胜再添腾飞的新助力，专业合作，共赢板木定制未来。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452089680461.jpg"/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/6d3fd3d47de06602566428044e7fc130.png', '2017-12-28', '佚名', '2', '5', '0');
INSERT INTO `bds_news` VALUES ('3', '百得胜T6项目特训营圆满结营', '92', '<p><span style="font-size:16px"><strong>打造标准·专业定制</strong>，经过三天四夜高强度特训，200余位百得胜精英精诚协作、全力拼搏，展示出了优异的学习成果，为此次T6项目特训画上了圆满的句号。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片1.JPG"/></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 胜在培训·赢在服务</strong>，在此次T6终端体验营销系统特训中，培训导师针对性地对百得胜服务方面进行了透彻的分析和团队服务标准化的培训。三天四夜，百得胜学员们一对一完成通关考核，收获满满！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片2.JPG"/></p><p><span style="font-size:16px">T6项目特训营开营授旗仪式</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片3.JPG"/></span></p><p><span style="font-size:16px">全体学员紧张备考中</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片4.JPG"/><br/><span style="font-size:16px">学员们一对一通关考核</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片5.JPG"/><br/><span style="font-size:16px">娱乐精彩一刻</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片6.JPG"/><br/><span style="font-size:16px">产品话术情景模拟</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片7.JPG"/><br/><span style="font-size:16px">聚精会神学习中</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片8.JPG"/></span></p><p><span style="font-size:16px">笔试考核通关</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 不是结束·而是开始</strong>，百得胜T6特训虽然暂告一段落，但这不是终点，而是起点，200余位华丽蜕变的精英们将迅速回到自己的岗位，用所学的知识、所理解的系统做出更出色的发挥，带领各自团队开启新的征程！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片9.JPG"/></p><p><span style="font-size:16px">冠军团队风采</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 引爆终端·破浪前行</strong>，此次百得胜T6特训，针对终端店面的四大痛点，点对点爆破，突破经营瓶颈，用干货解决营销没系统、团队难培养、终端没业绩、培训没效果的难题。百得胜5A+T6组合拳连续出击，快速引爆终端业绩，谁与争锋！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片10.JPG"/><br/><span style="font-size:16px">誓师大会</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年百得胜小家居战略全面推进中，T6项目特训营的培训成果将大大提升百得胜团队战斗力和品牌竞争力，为下半年的全国推广打下坚实基础。系统运营+体验营销，百得胜军团已经吹响2017年胜利的号角，战斗吧小伙伴！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/753e76e0fffc1271ddd1e2e8209d7ec6.png', '2017/12/28', '佚名', '3', '0', '0');
INSERT INTO `bds_news` VALUES ('4', '百得胜张健：成品OR定制？用户说了算！', '92', '<p><span style="font-size:16px">第38届名家具展暨中国(东莞)国际定制家居展在8月11日拉开帷幕，沉淀十八年后，东莞家具展已经进入三展联动时代，而在第十九个年头，首届中国(东莞)国际定制家居展览会无疑成为东莞展最大亮点。在万众瞩目的展会上，慧亚传媒记者采访到百得胜执行总裁张健先生，下面，请跟随记者的镜头走进这家优质企业吧。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/888/图片1.JPG"/><br/>专访嘉宾：百得胜执行总裁 张健</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：张总您好，百得胜是首次参加成品定制的展览吗？参展类型与以往存在些微差异，对此，企业作了哪些准备？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：百得胜是第一次参加成品家具展，大家都知道，成品家具在珠三角乃至全国地区都有影响力，而定制家居又发源于建材，双方间有着千丝万缕的关系。而如今，成品往定制走，定制往大家居去走，相互之间迟早需要碰面，所以这次我们都相当“诚惶诚恐”，毕竟，成品家具在工艺、设计上都比定制家居、建材行业成熟，所以这次，我们是抱着学习的态度来参展的。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片2.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片3.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片4.png"/><br/>参展人潮络绎不绝</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：成品家具与定制市场打得火热，而本次展会的举办也正好印证了这一点，您怎么看待两者的共融？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：现在的市场竞争激烈，成品和定制融合，或者定制有更多的成品化方向，成品有更多定制化的方向，市场的最终走向还是依靠用户的选择来判定，基于用户的需求，两者都有各自的优缺点，不管成品还是定制市场，用户说好，才算真的好。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片5.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片6_副本.png"/><br/>百得胜膜压工艺托斯卡纳新品展示</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：如果用一个关键词来形容您在百得胜近几年的总体情况，您会选择用什么词呢？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：“责任”，近几年，百得胜所走的路与其他定制品牌不尽相同，挑战和机遇并存。进入资本市场之后，因为体量偏小，面对资本市场的竞争和压力很大，同行对百得胜也投放了相当大的预期，因此，要肩负起对公司、团队、乃至于整个经销商体系的责任，百得胜必须要以更好的表现展露人前，对大家有一个合理交代，所以我认为责任是关键词。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：“无人工厂”的生产模式渐渐走红，机器正慢慢地代替人工，那您觉得在这样的趋势下这种模式有什么利和弊呢？</span></strong></p><p><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：我认为，不能独立地以产业或行业的特点去看待“无人工厂”的模式，从根本上还是要从两个层面解读，首先是从用户的角度出发，不管是无人化还是机械化，当它的发展能够贴合用户需要，那便是合适的；其次，从产业链的角度思考，无人化或者智能化是涉及“术”的层面，技术，从本质上说，技术的升级是围绕着企业的经营活动去服务的，经营活动是否需要技术更新？要如何更新？这都要企业从更高的维度去思考，从技术层面上进行反思，想法成熟以后再以AI、智能、无人设备去替代人工，完成升级布局。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
技术的升级、器材的配备都需要讲求深度和适用性，这也与行业的高度、宽度有关。即使企业把设备制造得非常精良，但是通过该设备制造出来的产品不受用户喜欢，或者它被更高阶的行业配套所覆盖掉，那么，哪怕是三头六臂的顶尖设备也起不到一丁点作用。当别人都使用枪了，即使你拥有最锋利的宝剑又如何？</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片7.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片8.png"/></span></p><p><span style="font-size:16px">参展人潮络绎不绝</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：智能化又逐渐兴起，你觉得目前的智能家居对于消费者和企业自身发展而言，是一块鸡肋吗？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：智能家居不是鸡肋，它是未来的必然发展趋势。我认为，未来智能家居的入口将是手机，近几年定制家居发展迅猛，是因为它抢占了家具建材行业的入口，而智能的入口不是家居，是手机。企业、顾客能通过移动端时刻掌握智能化的动态，完成功能性的操作，大大便于消费者的生活，相信不久的将来普及度会有所提升。而针对用户的使用习惯进行合理的研发，将是企业决胜的关键。</span></p><p><span style="font-size:16px">&nbsp;</span><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：张总，下半年百得胜的发展关键词是什么？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：扎好马步，苦练内功，少说多干。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：感谢张总一番精彩解读，祝愿百得胜能走出更强劲的姿态！</span></strong></p><p><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：谢谢大家。</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/b010641eddf3df313768641f253cb8a7.png', '2017-12-28', '佚名', '4', '0', '0');
INSERT INTO `bds_news` VALUES ('5', '偶像来了! 黄家强来了！百得胜第一大店来了！', '93', '<p><span style="font-size:16px">2016年11月6日<br/>百得胜第一大店<br/>百得胜温州千方旗舰店将盛大开业<br/>Beyond成员<strong>黄家强</strong>亲临助阵<br/>倾力打造摇滚音乐盛会<br/>摇出实惠、摇出惊喜<br/>摇出百万现金送送送</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）107_副本.jpg"/></p><p>&nbsp;<br/><span style="font-size:16px">金秋时节，再现光辉岁月<br/>携手Beyond成员黄家强<br/>全力打造温州摇滚狂欢节<br/><strong>一起致敬永不退场的青春<br/>致敬Beyond</strong></span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）169.png"/></p><p>&nbsp;</p><p><span style="font-size:16px">继平安、辛晓琪、周海媚、陈德容......<br/>百得胜再次为您打造超强音乐盛会</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）209.png"/></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>11月6日<br/>百得胜温州千方旗舰店盛大开业<br/>Beyond成员黄家强摇滚音乐会<br/><span style="color:#f70938">花椒、一直播同步直播</span></strong></span></p><p><span style="font-size:16px"><strong>敬请关注，一起狂欢！</strong></span></p><p><br/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/ded4605581a7b0bfc3c386ae14a7b58e.png', '2017/12/28', '佚名', '5', '8', '0');
INSERT INTO `bds_news` VALUES ('14', '百得胜助力集团公司德尔未来打造“中国足球未来星”南京体验活动进行中', '93', '<p><span style="font-size:16px"><br/></span></p><p><span style="font-size:16px"><span style="font-size:16px">百得胜助力集团公司德尔未来携手国际冠军杯足球赛，共同助力打造“中国足球未来星”体验活动落地南京</span></span><br/><span style="font-size:16px">南京40度的高温也抵不住球迷的热情</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜为集团公司德尔未来作为国际冠军杯中国赛高级赞助商助力，为广大喜爱百得胜环保定制的顾客朋友带去了众多优惠及福利！价值999元的冠军杯南京站限量球票幸运降临一波百得胜顾客朋友身上。</span></p><p><span style="font-size:16px">国际冠军杯南京赛999元门票幸运得主在百得胜不亦说乎！</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 更多福利，更多放心，更多开心，尽在百得胜专卖店......喜获国际冠军杯门票的幸运儿，今晚就可以凭票开开心心去现场看球，面见国际巨星，更可近距离一饱一大波足球宝贝的靓丽身影眼福，今晚，南京奥体中心见。</span></p><p>&nbsp;</p><p><br/></p><p><br/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/425b4567276a7b6e3b20d462bc98bac4.JPG', '2018-01-08', '原创', '6', '1', '0');
INSERT INTO `bds_news` VALUES ('15', '平安“震撼”登场 好声音唱响广西百得胜', '93', '<p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西1.jpg"/></span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>来了、来了，平安来了！！！</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 等待了一个多月，终于等到今天！5月31日下午百得胜代言人——实力派歌手平安莅临广西首家无醛添加衣柜馆将盛大开业活动现场火热献唱，为百得胜广西首家无醛添加衣柜馆开业优惠活动助威！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西2.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西图3.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西4.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜、富安居相关领导以及广西十多家媒体见证了百得胜广西首家无醛添加衣柜馆盛大开业的剪彩仪式。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西5.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西6.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西7.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西8.jpg"/></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>疯狂、震撼——“好声音”嗨翻全场</strong><br/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 平安携百得胜环保衣柜“价临”广西富安居中庭！广西富安居建材城内人气火爆，中庭、各楼层都挤满了大批歌迷粉丝、顾客朋友们，人气极其火爆！<br/></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 现场平安演唱《云淡风轻》、《洋葱》等多首经典歌曲，一首《我爱你中国》更是震撼全场，全场气氛彻底达到沸点，现场粉丝们之尖叫疯狂！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西9.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 平安出现活动现场，全场热情急速引爆！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西10.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 好声音震撼疯狂的平安粉丝团</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西11.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;活动现场奶爸、奶妈也追星</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西12.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 现场座无虚席，现场十分火爆</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西13.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>开业优惠更疯狂</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 为了庆祝百得胜衣柜广西首家无醛添加馆开业活动，除了邀请当红歌手平安现场献唱，活动现场开业优惠更疯狂——20万现金现场返现、无醛添加系列满5000抵10000、现场购买赠送价值880元鞋柜、与明星平安近距离合影留念……</span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜广西首家无醛添加衣柜馆盛大开业活动圆满成功！大家不仅享受到了优厚的贵宾服务，享受到工厂直供的价格，还感受到了歌手平安现场带给众人的震撼视听盛宴。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西14.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西15.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西16.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西17.png"/></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
百得胜精研环保定制衣柜14年，尤其在近年，通过不断的努力，打造出无醛添加系列定制家具。百得胜衣柜，优选无醛添加密度板、颗粒板、实木芯，凭借极致环保的无醛添加材质，获得越来越多消费者厚爱追捧！2015年，百得胜携手平安，以无醛添加环保产品为核心，努力打造“平安的家，百得胜定制”的环保家居。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西18.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西19.jpg"/></span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/1ad5f148a23ad52be41ac8ad602a4dfa.jpg', '2018-01-08', '原创', '7', '0', '0');
INSERT INTO `bds_news` VALUES ('16', '哈尔滨，平安来了! 百得胜火了！', '93', '<p><span style="font-size:16px">4月25日，百得胜哈尔滨旗舰店盛大开业。歌手平安亲临现场助阵，为开业优惠活动加油助威，活动现场声势浩大，气氛火爆，创造百得胜开业活动新传奇！</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安1.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安2.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 高空彩球飘扬，现场众人热忱静候平安</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安3.jpg"/></span><span style="font-size:16px"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 气势雄伟的气飘与彩旗，格外惹人关注</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安4.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现场座无虚席，十分火爆</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安5.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排队签单长龙，见头不见尾</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安6.png"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 哈尔滨，惊现北京，深圳的平安粉丝团</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安7.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平安一到场，引众人纷纷抢拍</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安9.jpg"/><br/></span><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平安现场献歌，响彻现场</span><span style="font-size:16px"><br/>&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 本次哈尔滨百得胜旗舰店盛大开业活动圆满成功！现场，大家不仅享受到了优厚的贵宾服务，享受到工厂直供的价格，还感受到了歌手平安现场带给众人的视听盛宴......众消费者纷纷表示不虚此行！</span><span style="font-size:16px"><br/>&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜衣柜经历14的时间沉淀，不仅在行业内享有“环保定制衣柜”的美誉，还获得消费者的广泛认可和各权威机构的认证。用事实见证实力，书写环保定制新传奇。</span>&nbsp;</p><p><span style="font-size:16px"><br/>&nbsp;&nbsp;&nbsp; 平安的家，百得胜定制。再见亦再见！425哈尔滨，再见！51武汉再见，不见不散！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/7237891f8f20f163945513e7653d868e.png', '2018-01-08', '百得胜', '8', '1', '0');
INSERT INTO `bds_news` VALUES ('17', '中国平安万里行——成都首站！4.25, GO百得胜', '93', '<p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里1.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>2015年4月25日下午13:00<br/></strong>&nbsp;&nbsp;&nbsp; <strong>成都高新区都会路99号富森?美家居建材MALL负一楼中庭百得胜衣柜。</strong><br/>&nbsp;&nbsp;&nbsp; 百得胜工厂质检总监亲临成都，给成都的消费者分享真正的家居装修环保知识！让你了解什么叫甲醛0释放时代，如何让家人生活在一个安全无忧的绿色空间！</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里2.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里3.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里4.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里5.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里6.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里7.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里8.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span style="color:#e6421a">4.25，来成都百得胜衣柜，为您省到家！</span></strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里9.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里10.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里11.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里12.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜衣柜进驻成都后，环保健康家居理念逐渐深入人心。<br/>&nbsp;&nbsp;&nbsp; 百得胜全屋收纳定制要做的，就是持之以恒地研发环保定制衣柜产品，为消费者打造安全健康的家居生活。<br/><strong>&nbsp;&nbsp;&nbsp; 更多套餐，敬请到店详询....</strong><br/><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动VIP专线：028-61559394</strong> </span></span></p><p><span style="font-size:16px;color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动时间：2015年4月25日</strong> </span></p><p><span style="font-size:16px"><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>签到时间：下午13:00-13:30</strong> </span></span></p><p><span style="font-size:16px"><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动地点：成都高新区都会路99号富森?美家居建材MALL负一楼中庭</strong></span></span><span style="font-size:16px"> </span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里13.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里14.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里15.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里16.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里17.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里18.jpg"/><br/></span><span style="font-size:16px"><br/></span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/97db874c92269efa2485e255355222c5.jpg', '2018-01-08', '百得胜', '9', '0', '0');
INSERT INTO `bds_news` VALUES ('18', '女神真都来了，让大家与百得胜有了更契合的 “情感密码”', '93', '<p><span style="font-size:16px">大事件,女神真都来南宁百得胜了！！！<br/>惊呆了！抢疯了！嗨疯了！爽翻了！</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神1.jpg"/></span></p><p><br/><span style="font-size:16px">8月30日，娱乐气旋席卷南宁。<br/>南宁富安居百得胜，<br/>双强飓“疯”来袭，<br/>两大台湾实力派唱将，<br/>疗伤系情歌天后辛晓琪来了，<br/>“小张惠妹”简语卉也真来了！<br/>齐聚南宁，亲临南宁富安居百得胜衣柜，<br/>同台飙歌，以歌会友，情动南宁，律动青春情怀。<br/>火力助推南宁百得胜第6家无醛添加馆火爆开业，<br/>一起为百得胜环保而歌。<br/>南宁百得胜衣柜，<br/>迎来了三伏天后的又一次热潮。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神2.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>女神潇洒进场，彻底点燃了现场观众粉丝们的热情</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在一片片热烈的欢呼声中，两大女神潇洒入场，点燃了场观众粉丝们的热情。现场的观众朋友们纷纷拍照录像，现场顿时火爆,引起粉丝疯狂尖叫。<br/>&nbsp;&nbsp;&nbsp; 辛晓琪与“阿妹”登台开唱，互相飙歌。噢噢噢……天后嗓喉一开，赢得观众阵阵掌声，<br/>嗨翻现场！</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神3.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神4.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神5.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神6.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神7.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神8.jpg"/></span></p><p><br/><span style="font-size:16px">两大女神，以情为律，为百得胜环保而歌，<br/>一首风靡一代人的《味道》，<br/>一首一辈子的《深情难了》，<br/>还有浪漫甜蜜的《玫瑰花》，<br/>相伴一生的《牵手》<br/>引爆大家最难忘的记忆高潮，<br/>动情的味道，幸福的玫瑰，一辈子的情缘与牵手<br/>扣动了粉丝们的心弦，<br/>骚动了大家的心灵之魂，<br/>让大家在感情里顿悟.......<br/>两大女神飙歌旋风与百得胜开业抢购“疯”汇，合成最动情的情风，<br/>动听的情歌，开业的盛惠、现场的娱乐互动......高潮不停歇，狂欢不停止！<br/>让更多的消费者与百得胜衣柜有了契合的 “情感密码”。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神9.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神10.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>“小张惠妹”简语卉为大家献歌抽奖</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神11.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>情歌天后辛晓琪为环保，提笔写下“平安的家，百得胜定制”</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神12.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>哎哟，百得胜因环保而出尽了风头，爽歪歪！</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神13.jpg"/></span></p><p><br/><strong><span style="font-size:16px">与情歌天后合影，好嗨森！</span></strong></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 热情碰撞的火花，高大上的月饼现场领，红包现场大派送，豪礼现场任性抽......为南宁客户献上了视觉与听觉的璀璨盛宴。大家现场在百得胜畅享无醛的《味道》，《牵手》共建平安的家......到场客户高兴而来，满载而归，好嗨森！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/495c7251dc8de2490f87def31ea1fde4.jpg', '2018-01-08', '百得胜', '10', '1', '0');

-- ----------------------------
-- Records for `bds_order`
-- ----------------------------
INSERT INTO `bds_order` VALUES ('1', 'thinkphp', 'thihp', '1515380795', '192.168.1.138', '192.168.1.138', '0', '0');
INSERT INTO `bds_order` VALUES ('2', 'THINKPHP', 'THINKPHP', '1515383817', '192.168.1.138', '192.168.1.138', '5', '0');
INSERT INTO `bds_order` VALUES ('3', 'THINKPHP', '44', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('4', '', 'a:0:{}', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('5', 'THINKPHP', 'a:1:{s:8:"order_id";s:8:"THINKPHP";', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('6', 'LXW', 'a:2:{s:8:"order_id";s:3:"LXW";s:6:"', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('7', 'LXW', 'a:2:{s:8:"order_id";s:3:"LXW";s:6:"status";s:3:"123";}', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('8', 'LXW', '202cb962ac59075b964b07152d234b70', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('9', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379029', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('10', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379179', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('11', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379227', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('12', 'LXW', '123', '1515379313', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('13', 'LXW', '123', '1515379412', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('14', 'LXW', '1', '1515379439', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('15', 'LXW', 'hahhh', '1515379463', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('16', 'LXW', '', '1515379595', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('17', 'LXW', 'sdddd', '1515379616', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('18', 'LXW', 'cd3f8d1414719727286eda32fda4b96d', '1515379728', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('19', 'LXW', 'sdddd', '1515383841', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('20', 'LXW', 'sdddd', '1515383844', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('21', 'LXW', 'sdddd', '1515383906', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('22', 'LXW', 'sdddd', '1515383952', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('23', 'LXW', 'sdddd', '1515384086', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('24', 'LXW', 'sdddd', '1515384125', '192.168.1.138', '', '0', '1515384125');

-- ----------------------------
-- Records for `bds_product`
-- ----------------------------
INSERT INTO `bds_product` VALUES ('1', '77', 'http://localhost/bds/php/uploads/20171228/bb968e4538193927f5aa2b7645c5e2fa.png', '儿童房01', 'CHILDREN ROOM', '精湛工艺  执勤工艺', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514345417111456.jpg" title="1514345417111456.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514345417881463.jpg" title="1514345417881463.jpg"/></p>', '1', '2017-12-27 11:30', '1');
INSERT INTO `bds_product` VALUES ('2', '77', 'http://localhost/bds/php/uploads/20171228/7f8a4705e229604b5a0b07cbb5dcc477.png', '儿童房02', 'CHILDREN ROOM', '简约大气的设计，搭配自然细腻的木纹', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514345997399851.jpg" title="1514345997399851.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514345997835332.jpg" title="1514345997835332.jpg"/></p><p><br/></p>', '2', '2017-12-27 11:39', '7');
INSERT INTO `bds_product` VALUES ('3', '80', 'http://localhost/bds/php/uploads/20171228/34b0cb14fb3516f8e761b01da0953b0e.png', '客厅01', 'GUEST ROOM', '在美式家具基础上，融入现代设计风格', '在美式家具基础上，融入现代设计风格。古典中透露出丝丝灵动，现代中带有少许文艺。
门板线条，简洁时尚，白色为基调，融入黄色装饰部分，使产品在简洁大方的基础上增加了现代时尚气息。
既有自在不羁的个性，也在不经意中体现着休闲式的浪漫，让人体验到一种别样的轻生活、慢时光', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514355930586695.jpg" title="1514355930586695.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514355930851857.jpg" title="1514355930851857.jpg"/></p><p><br/></p>', '2', '2017-12-27 14:07', '5');
INSERT INTO `bds_product` VALUES ('4', '80', 'http://localhost/bds/php/uploads/20171228/3fac35bb7c8a86ba5fa88a0a4a9b3b5e.png', '客厅02', 'GUEST ROOM', '精湛工艺 执勤品质', '在美式家具基础上，融入现代设计风格。古典中透露出丝丝灵动，现代中带有少许文艺。
门板线条，简洁时尚，白色为基调，融入黄色装饰部分，使产品在简洁大方的基础上增加了现代时尚气息。
既有自在不羁的个性，也在不经意中体现着休闲式的浪漫，让人体验到一种别样的轻生活、慢时光', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514356445961846.jpg" title="1514356445961846.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514356445769924.jpg" title="1514356445769924.jpg"/></p><p><br/></p>', '1', '2017-12-27 14:33', '2');
INSERT INTO `bds_product` VALUES ('5', '79', 'http://localhost/bds/php/uploads/20171228/7c902985c7931eeac0becfe6f5d7572a.png', '书房系列', 'BOOKING ROOM', '精湛工艺 执勤品质', '
印象系列--B5120701新中式岭南印象-多功能房印象系列--B5120701新中式岭南印象-多功能房印象系列--B5120701新中式岭南印象-多功能房', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514428261120110.jpg" title="1514428261120110.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514428261488023.jpg" title="1514428261488023.jpg"/></p><p><br/></p>', '1', '2017-12-28 10:30', '3');
INSERT INTO `bds_product` VALUES ('6', '80', 'http://localhost/bds/php/uploads/20171228/158942b16e8cf4f7003325ee2cd2f5b3.png', '客厅系列01', 'BOOKING ROOM', '简约大气的设计，', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514431708729991.jpg" title="1514431708729991.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514431708631362.jpg" title="1514431708631362.jpg"/></p><p><br/></p>', '2', '2017-12-28 11:28', '6');
INSERT INTO `bds_product` VALUES ('7', '77', 'http://localhost/bds/php/uploads/20180104/e5150f8a337ecf3a6e37c218b9162ab4.png', '儿童房03', 'CHILDREN ROOM', 'CHILDREN ROOM', 'CHILDREN ROOMCHILDREN ROOMCHILDREN ROOM', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p>FGDF<br/></p>', '0', '2018-01-04 11:52', '8');
INSERT INTO `bds_product` VALUES ('8', '77', 'http://localhost/bds/php/uploads/20180104/7b516fdc9c6cfab8b5843ff8504fd20a.png', '儿童房04', 'CHILDREN ROOM', '儿童房04', '儿童房04儿童房04儿童房04', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p><img src="http://localhost/bds/php/ueditor/20180104/1515038177816485.png" title="1515038177816485.png"/></p><p><img src="http://localhost/bds/php/ueditor/20180104/1515038177700428.png" title="1515038177700428.png"/></p><p><br/></p>', '0', '2018-01-04 11:55', '9');

-- ----------------------------
-- Records for `bds_service`
-- ----------------------------
INSERT INTO `bds_service` VALUES ('1', '概述', '校训、模式、专业', 'http://localhost/bds/php/uploads/20180109/912d3cff130608a72ef6ce5aa26cdfd5.png', '<p class="t2 zz1">百得胜学院隶属于广州百得胜家居有限公司，是专门为百得胜经销商打造专业人才队伍的基地。学院秉承“全面为经销商提供专业知识和培养专业人才”的办学理念，立足于行业发展和经销商人员管理模式，成立专业的培训团队，组织开发有效实用的培训课程，全方位为经销商培养专业人才，帮助经销商打造人才竞争力，通过专业人才提供专业服务，从而使经销商赢得市场及忠实客户。</p><p class="t2 zz1">经过扩建后的百得胜学院教学设施齐全、设备优良，拥有1000多平米的教学场地，有公共课教室，电脑多媒体教室，安装实操教室，能同时进行设计、安装、导购等多个专业的课程，能同时容纳上百人的培训。还配套有1000多平米的公寓，为各地来学院学习的学员提供良好的住宿环境。</p><p><br/></p>', '', 'http://localhost/bds/php/uploads/20171228/c3abcee07ae9746d8001502b06ccc2f5.png', '88', '2017-12-28 16:28', '1');
INSERT INTO `bds_service` VALUES ('2', '免费送货', '', 'http://localhost/bds/php/uploads/20180104/282c87c6a29862d90503ea84605b2ddb.png', '', '', 'http://localhost/bds/php/uploads/20171228/a0c6ce31cd7ca8052774e4ca8d4b362f.png', '90', '2017-12-28 16:45', '4');
INSERT INTO `bds_service` VALUES ('3', '免费安装', '', 'http://localhost/bds/php/uploads/20180104/1f6b53852cc777c668a005a01cb63e20.png', '', '', 'http://localhost/bds/php/uploads/20171228/115e26938f6a193f8db32c130ac4a313.png', '90', '2017-12-28 16:49', '5');
INSERT INTO `bds_service` VALUES ('4', '免费维护', '', 'http://localhost/bds/php/uploads/20180104/47c9fc057f4788e7af23c910e2aef10c.png', '', '', 'http://localhost/bds/php/uploads/20171228/276702d9260bb8d273b77428c4cfc317.png', '90', '2017-12-28 16:49', '6');
INSERT INTO `bds_service` VALUES ('5', '免费维修', '', 'http://localhost/bds/php/uploads/20180104/26a0675e8972a966a93bd722c2ec7fd6.png', '', '', 'http://localhost/bds/php/uploads/20171228/a68764868bfc87782032978815db1a3c.png', '90', '2017-12-28 16:50', '7');
INSERT INTO `bds_service` VALUES ('6', '二次拆装零担忧', '', 'http://localhost/bds/php/uploads/20180104/2f94016a8d23eeeb3fe6374a950a1f83.png', '', '', 'http://localhost/bds/php/uploads/20171228/6886d073384e2f3d1140f82417f12922.png', '90', '2017-12-28 16:50', '8');
INSERT INTO `bds_service` VALUES ('7', '免费测量', '', 'http://localhost/bds/php/uploads/20180104/b00c8d6634e2e754fb23f6da481caa84.png', '', '', 'http://localhost/bds/php/uploads/20171228/59619d4b5c1b47984d0b1bd702f008fe.png', '90', '2017-12-28 16:51', '9');
INSERT INTO `bds_service` VALUES ('8', '免费设计', '', 'http://localhost/bds/php/uploads/20180104/7d2292449e0ccfe3e9254281b506131c.png', '', '', 'http://localhost/bds/php/uploads/20171228/1c989e969d4ef45bc5ffb9471a21163f.png', '90', '2017-12-28 16:52', '10');
INSERT INTO `bds_service` VALUES ('15', '校训、模式、专业', '', 'http://localhost/bds/php/uploads/20180109/50d5c07f0e4502ba289f5d08e0ade68c.png', '<p>学明白、练到位、技艺精、勿忘本</p><p>&nbsp;&nbsp;&nbsp;&nbsp;学院坚持以实用和发展为导向，以学员能够成为专业人员为目标，注重学员实际应用能力的培养，采用理论与实践相结合、所学即所用的培训理念和模拟实训的教学模式，让学员一学就用，一用就通。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;院现设置五大专业：商业发展、店面管理、衣柜设计、店面导购、衣柜安装。每个专业又设置基础课程和专业课程。</p>', '', 'http://localhost/bds/php/uploads/20180109/32bf7473f87c6f100742594307a1cf60.png', '88', '2018-01-09 11:12', '2');
INSERT INTO `bds_service` VALUES ('16', '师资、远景', '', 'http://localhost/bds/php/uploads/20180109/2e7c6f3c32b69e3d981be4e1f02c6aa7.png', '<p>&nbsp;&nbsp;&nbsp;&nbsp;学院拥有专业的师资力量，现有专兼职教师十多名，师资主要为企业内部富有实践经验的中高层管理人士和专业技术骨干以及行业内资深专家队伍。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;学院立足衣柜专业人才培养，面向全国百得胜经销商，为经销商打造专业的人才队伍，提高店面管理水平和服务质量。学院努力构建体系健全、风格独特、设施良&nbsp;&nbsp;&nbsp;&nbsp;好、功能齐全、积极进取的学习环境，力争把学院办成行业内专业人才的摇篮。</p>', '', 'http://localhost/bds/php/uploads/20180109/16a724b6d51e0dc29904968cc75999ca.png', '88', '2018-01-09 11:15', '3');

-- ----------------------------
-- Records for `bds_shou_ye`
-- ----------------------------
INSERT INTO `bds_shou_ye` VALUES ('1', '产品分类', '0', '', '', 'http://localhost/bds/php/uploads/20171228/ec531e23953d6f21f41bb43a33f6918b.png', '', '<p>首页信息产品分类背景图
 &nbsp;</p>', '1', '2017-12-28 14:04');
INSERT INTO `bds_shou_ye` VALUES ('2', '品牌故事', '0', '', '', 'http://localhost/bds/php/uploads/20171228/05103da176ab3702dea4fb5ea1ff3a18.png', '', '<p>品牌故事背景图<br/></p>', '2', '2017-12-28 14:07');
INSERT INTO `bds_shou_ye` VALUES ('3', '发展历程', '0', '', '', 'http://localhost/bds/php/uploads/20171228/11bcb15303103743ffabb02bbffb2d72.png', '', '<p>发展历程背景图<br/></p>', '3', '2017-12-28 14:07');
INSERT INTO `bds_shou_ye` VALUES ('4', '品牌文化', '0', '', '', 'http://localhost/bds/php/uploads/20171228/18bf4fdd652a9f92eee9688cc24e179c.png', '', '<p>品牌文化背景图<br/></p>', '4', '2017-12-28 14:08');
INSERT INTO `bds_shou_ye` VALUES ('5', '客服服务部分', '0', '', '', 'http://localhost/bds/php/uploads/20171228/888c8cdebe8f6ba74a4118deeb594d86.png', '', '<p>客服服务部分<br/></p>', '5', '2017-12-28 14:09');
INSERT INTO `bds_shou_ye` VALUES ('6', '产品中心banner', '64', '', '', 'http://localhost/bds/php/uploads/20171229/a8c337e29da4288410e4fed80a654212.png', '', '', '6', '2017-12-29T10:15:17.680Z');
INSERT INTO `bds_shou_ye` VALUES ('7', '品牌中心banner', '65', '', '', 'http://localhost/bds/php/uploads/20171229/05acaa8a11306c05b78520bc69c3805b.png', '', '<p>精湛工艺 至亲品质</p>', '7', '2017-12-29 18:16');
INSERT INTO `bds_shou_ye` VALUES ('8', '服务中心banner', '66', '', '', 'http://localhost/bds/php/uploads/20171229/1a8a13ca1d6d428deedebcabca0ea3b7.png', '', '', '8', '2017-12-29T10:17:31.899Z');
INSERT INTO `bds_shou_ye` VALUES ('9', '新闻中心banner', '67', '', '', 'http://localhost/bds/php/uploads/20171229/9ea5ce8243db9f042d2de0b4243e6cef.png', '', '', '9', '2017-12-29T10:18:25.771Z');
INSERT INTO `bds_shou_ye` VALUES ('10', '招商中心banner', '68', '', '', 'http://localhost/bds/php/uploads/20171229/d7bbd389aed128bf64e05b575c2aa707.png', '', '', '10', '2017-12-29T10:19:44.003Z');

-- ----------------------------
-- Records for `bds_system_config`
-- ----------------------------
INSERT INTO `bds_system_config` VALUES ('1', 'SYSTEM_NAME', '百得胜后台管理系统', '0', '1');
INSERT INTO `bds_system_config` VALUES ('2', 'SYSTEM_LOGO', 'http://localhost/bds/php/uploads/20180103/ebdac47348266ae2876a1c423f59765e.png', '0', '1');
INSERT INTO `bds_system_config` VALUES ('3', 'LOGIN_SESSION_VALID', '3600000', '0', '1');
INSERT INTO `bds_system_config` VALUES ('4', 'IDENTIFYING_CODE', '0', '0', '1');
INSERT INTO `bds_system_config` VALUES ('5', '  LOGO_TYPE', '', '0', '1');
INSERT INTO `bds_system_config` VALUES ('6', 'COPY_RIGHT', '粤ICP证12029134号', '0', '1');
INSERT INTO `bds_system_config` VALUES ('7', 'BEI_AN', '粤ICP备12029134', '0', '1');
INSERT INTO `bds_system_config` VALUES ('8', 'KEY_WORD', ' 木纹移门衣柜(欧洲红木)三格均分_木纹系列_百得胜官网，平安的家，百得胜全屋定制，定制您平安的家，无醛添加，环保衣柜', '0', '1');
INSERT INTO `bds_system_config` VALUES ('9', 'DESCRIPTION', '木纹移门衣柜(欧洲红木)三格均分_木纹系列_百得胜官网，平安的家，百得胜全屋定制，定制您平安的家，无醛添加，环保衣柜', '0', '1');
INSERT INTO `bds_system_config` VALUES ('10', 'SYSTEM_LOGO_M', 'http://localhost/bds/php/uploads/20180103/134f6d2232cd416dee6b0086f02ede44.png', '0', '1');

-- ----------------------------
-- 日期：2018-01-09 16:32:51
-- 仅用于测试和学习,本程序不适合处理超大量数据
-- ----------------------------

-- ----------------------------
-- Table structure for `bds_admin_access`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_access`;
CREATE TABLE `bds_admin_access` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `bds_admin_group`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_group`;
CREATE TABLE `bds_admin_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `rules` varchar(4000) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Table structure for `bds_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_menu`;
CREATE TABLE `bds_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '上级菜单ID',
  `title` varchar(32) DEFAULT '' COMMENT '菜单名称',
  `en_title` varchar(255) NOT NULL COMMENT '产品分类的英文名',
  `url` varchar(127) DEFAULT '' COMMENT '链接地址',
  `nav` varchar(50) DEFAULT '0' COMMENT '前台导航路径',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `menu_type` tinyint(4) DEFAULT NULL COMMENT '菜单类型',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `rule_id` int(11) DEFAULT NULL COMMENT '权限id',
  `module` varchar(50) DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL COMMENT '三级菜单吗',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='【配置】后台菜单表';

-- ----------------------------
-- Table structure for `bds_admin_post`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_post`;
CREATE TABLE `bds_admin_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '岗位备注',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `status` tinyint(5) DEFAULT '1' COMMENT '状态1启用,0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Table structure for `bds_admin_rule`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_rule`;
CREATE TABLE `bds_admin_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `name` varchar(100) DEFAULT '' COMMENT '定义',
  `level` tinyint(5) DEFAULT NULL COMMENT '级别。1模块,2控制器,3操作',
  `pid` int(11) DEFAULT '0' COMMENT '父id，默认0',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态，1启用，0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
-- Table structure for `bds_admin_structure`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_structure`;
CREATE TABLE `bds_admin_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='公司结构表';

-- ----------------------------
-- Table structure for `bds_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_user`;
CREATE TABLE `bds_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) DEFAULT NULL COMMENT '管理后台账号',
  `password` varchar(100) DEFAULT NULL COMMENT '管理后台密码',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `create_time` int(11) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `structure_id` int(11) DEFAULT NULL COMMENT '部门',
  `post_id` int(11) DEFAULT NULL COMMENT '岗位',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态,1启用0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
-- Table structure for `bds_brand`
-- ----------------------------
DROP TABLE IF EXISTS `bds_brand`;
CREATE TABLE `bds_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '案例分类',
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_estonian_ci DEFAULT NULL,
  `type` varchar(50) NOT NULL COMMENT '所属分类',
  `content` text NOT NULL,
  `order` int(11) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '0不推送1推送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- ----------------------------
-- Table structure for `bds_contact`
-- ----------------------------
DROP TABLE IF EXISTS `bds_contact`;
CREATE TABLE `bds_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `hotline` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `posts` varchar(11) NOT NULL COMMENT '邮编',
  `hremail` varchar(50) DEFAULT NULL,
  `backimage` varchar(255) DEFAULT NULL,
  `create_time` varchar(50) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) DEFAULT '2' COMMENT '1公司总/分部2其他',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='分公司表';

-- ----------------------------
-- Table structure for `bds_friend`
-- ----------------------------
DROP TABLE IF EXISTS `bds_friend`;
CREATE TABLE `bds_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Table structure for `bds_joins`
-- ----------------------------
DROP TABLE IF EXISTS `bds_joins`;
CREATE TABLE `bds_joins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '所属分类',
  `en_title` varchar(255) NOT NULL COMMENT '英文标题',
  `title` varchar(255) NOT NULL COMMENT '条目标题',
  `pic` varchar(255) NOT NULL COMMENT '图标',
  `img` varchar(255) NOT NULL COMMENT '优势图',
  `content` text NOT NULL,
  `order` int(11) NOT NULL,
  `create_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='招商加盟表';

-- ----------------------------
-- Table structure for `bds_measure`
-- ----------------------------
DROP TABLE IF EXISTS `bds_measure`;
CREATE TABLE `bds_measure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tel` varchar(25) NOT NULL,
  `ordertime` varchar(25) NOT NULL COMMENT '预约时间',
  `address` varchar(255) NOT NULL COMMENT '预约地址',
  `status` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='预约测量表';

-- ----------------------------
-- Table structure for `bds_news`
-- ----------------------------
DROP TABLE IF EXISTS `bds_news`;
CREATE TABLE `bds_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pid` int(11) NOT NULL COMMENT '新闻分类',
  `content` text,
  `listpic` varchar(255) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `read_num` int(11) NOT NULL COMMENT '阅读次数',
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '1推送0不推送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='新闻动态观点表';

-- ----------------------------
-- Table structure for `bds_order`
-- ----------------------------
DROP TABLE IF EXISTS `bds_order`;
CREATE TABLE `bds_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(11) NOT NULL COMMENT '订单号',
  `status` varchar(55) NOT NULL COMMENT '-1 不存在，0在发货，1已发货',
  `time` varchar(32) NOT NULL,
  `ip` varchar(25) NOT NULL,
  `login_ip` varchar(25) NOT NULL,
  `num` int(3) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='模拟订单表';

-- ----------------------------
-- Table structure for `bds_product`
-- ----------------------------
DROP TABLE IF EXISTS `bds_product`;
CREATE TABLE `bds_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '产品分类id',
  `litpic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `en_title` varchar(255) NOT NULL COMMENT '产品英文名称',
  `subtitle` varchar(255) NOT NULL COMMENT 'banner右下角标题',
  `desc` text NOT NULL COMMENT '描述',
  `desc2` text NOT NULL COMMENT '描述信息第2行',
  `content` text,
  `status` varchar(50) NOT NULL COMMENT '推送状态',
  `create_time` varchar(50) NOT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Table structure for `bds_service`
-- ----------------------------
DROP TABLE IF EXISTS `bds_service`;
CREATE TABLE `bds_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_title` varchar(255) DEFAULT NULL,
  `vice_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `content` text,
  `banner` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL COMMENT '所属部分',
  `create_time` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='服务表';

-- ----------------------------
-- Table structure for `bds_shou_ye`
-- ----------------------------
DROP TABLE IF EXISTS `bds_shou_ye`;
CREATE TABLE `bds_shou_ye` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `path` int(11) DEFAULT NULL COMMENT '子类id',
  `type` int(11) DEFAULT NULL,
  `backimage` varchar(255) DEFAULT NULL COMMENT '栏目banner',
  `url` varchar(100) DEFAULT NULL COMMENT '栏目链接',
  `content` text,
  `order` int(11) DEFAULT NULL COMMENT '栏目排序',
  `create_time` varchar(50) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='网站首页表';

-- ----------------------------
-- Table structure for `bds_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `bds_system_config`;
CREATE TABLE `bds_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(50) DEFAULT '',
  `value` varchar(500) DEFAULT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned DEFAULT '0' COMMENT '配置分组',
  `need_auth` tinyint(4) DEFAULT '1' COMMENT '1需要登录后才能获取，0不需要登录即可获取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `参数名` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='【配置】系统配置表';

-- ----------------------------
-- Records for `bds_admin_access`
-- ----------------------------
INSERT INTO `bds_admin_access` VALUES ('2', '15');
INSERT INTO `bds_admin_access` VALUES ('3', '16');
INSERT INTO `bds_admin_access` VALUES ('4', '16');

-- ----------------------------
-- Records for `bds_admin_group`
-- ----------------------------
INSERT INTO `bds_admin_group` VALUES ('15', '普通会员', '1,2,3,4,5,6,7,8,9,10,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,61,62,63,28,29', '0', '最厉害的组别', '1');
INSERT INTO `bds_admin_group` VALUES ('16', '超级管理员', '10,30,31,32,33,34,35,36,37,28,29,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,61,62,63', '', '超级管理员', '1');

-- ----------------------------
-- Records for `bds_admin_menu`
-- ----------------------------
INSERT INTO `bds_admin_menu` VALUES ('52', '0', '网站后台管理系统', '', '', '', '', '1', '0', '1', '10', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('53', '52', '系统配置', '', '', '', '', '1', '1', '1', '61', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('54', '53', '菜单管理', '', '/home/menu/list', '', '', '1', '1', '1', '21', 'Administrative', 'menu');
INSERT INTO `bds_admin_menu` VALUES ('55', '53', '系统参数', '', '/home/config/add', '', '', '1', '3', '1', '13', 'Administrative', 'systemConfig');
INSERT INTO `bds_admin_menu` VALUES ('56', '53', '权限规则', '', '/home/rule/list', '', '', '1', '2', '1', '13', 'Administrative', 'rule');
INSERT INTO `bds_admin_menu` VALUES ('57', '52', '组织架构', '', '', '', '', '1', '5', '1', '63', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('58', '57', '岗位管理', '', '/home/position/list', '', '', '1', '0', '1', '31', 'Administrative', 'position');
INSERT INTO `bds_admin_menu` VALUES ('59', '57', '部门管理', '', '/home/structures/list', '', '', '1', '0', '1', '39', 'Administrative', 'structures');
INSERT INTO `bds_admin_menu` VALUES ('60', '57', '用户组管理', '', '/home/groups/list', '', '', '1', '0', '1', '47', 'Administrative', 'groups');
INSERT INTO `bds_admin_menu` VALUES ('61', '52', '账户管理', '', '', '', '', '1', '0', '1', '62', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('62', '61', '账户列表', '', '/home/users/list', '', '', '1', '0', '1', '55', 'Administrative', 'users');
INSERT INTO `bds_admin_menu` VALUES ('63', '52', '内容管理', '', '', '', '', '1', '2', '1', '64', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('64', '63', '产品中心', '', '/home/product/list', '/product', '', '1', '1', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('65', '63', '品牌中心', '', '/home/brand/list', '/mark', '', '1', '2', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('66', '63', '服务中心', '', '/home/service/list', '/serve', '', '1', '3', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('67', '63', '新闻资讯', '', '/home/news/list', '/news', '', '1', '4', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('68', '63', '招商加盟', '', '/home/joins/list', '/join', '', '1', '5', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('70', '52', '其他管理', '', '', '', '', '1', '3', '1', '66', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('71', '70', '首页管理', '', '/home/shouye/list', '', '', '1', '1', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('72', '70', '数据库管理', '', '/home/mysqls/list', '', '', '1', '3', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('73', '70', '友情链接', '', '/home/friend/list', '', '', '1', '2', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('74', '70', '预约测量', '', '/home/measure/list', '', '', '1', '3', '1', '66', 'Administrative', 'casetype');
INSERT INTO `bds_admin_menu` VALUES ('77', '64', '儿童房系列', 'CHILDREN ROOM', '/home/product/child/list', '/product/child', 'http://localhost/bds/php/uploads/20180104/d83ab9bf4ad1f62077e4a8de72df0d7c.png', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('78', '64', '套房系列', 'FULL ROOM', '/home/product/taofang', '/product/taofang', 'http://localhost/bds/php/uploads/20180104/09f6864bfee91739dce22e3405e9b43b.png', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('79', '64', '书房系列', 'READING ROOM', '/home/product/book/list', '/product/book', 'http://localhost/bds/php/uploads/20180104/e433a5e29cf7f5bebe918a310f7a3f95.png', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('80', '64', '客厅系列', 'LIVING ROOM', '/home/product/live/list', '/product/live', 'http://localhost/bds/php/uploads/20180104/961d7e1a5eee9b0a4920ce123e69751f.png', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('81', '64', '卧室系列', 'SLEEP ROOM', '/home/product/bedroom/list', '/product/bedroom', 'http://localhost/bds/php/uploads/20180104/6d7ecdceee3114a4f82a4d5a90984dc3.png', '1', '5', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('82', '64', '实木家具', 'SOLID WOOD FUMITURE', '/home/product/shimu/list', '/product/shimu', 'http://localhost/bds/php/uploads/20180104/4abe8e3ae61c11a9ef6df744bd13702e.png', '1', '6', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('83', '64', '定制家居', 'CUSTOMIZED FUMITURE', '/home/product/order/list', '/product/order', 'http://localhost/bds/php/uploads/20180104/e927f13f8e1644498d0b7aea50232e25.png', '1', '7', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('84', '65', '品牌故事', '', '/home/brand/story/list', '/brand/story', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('85', '65', '品牌历程', '', '/home/brand/course/list', '/brand/course', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('86', '65', '品牌荣誉', '', '/home/brand/honor/list', '/brand/honor', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('87', '65', '企业文化', '', '/home/brand/culture/list', '/brand/culture', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('88', '66', '百得胜学院', '', '/home/service/school/list', '/service/school', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('89', '66', '预约测量', 'MAKE MEASURE', '/home/service/measure/list', '/service/measure', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('90', '66', '定制服务', 'WHOLEHEARTEDLY SERVICE', '/home/service/customized/list', '/service/customized', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('91', '66', '订单查询', 'ORDERS INQUIRY', '/home/service/order/list', '/service/order', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('92', '67', '公司咨询', '', '/home/news/ask/list', '/news/ask', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('93', '67', '各地动态', '', '/home/news/dynamic/list', '/news/dynamic', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('94', '67', '活动专题', '', '/home/news/topic/list', '/news/topic', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('95', '67', '行业资讯', '', '/home/news/industry/list', '/news/industry', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('96', '68', '品牌优势', 'INVESTMENT TO JOIN', '/home/joins/advantage/list', '/joins/advantage', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('97', '68', '加盟条件', 'JOINING CONDITION', '/home/joins/condition/list', '/joins/condition', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('98', '68', '加盟流程', 'JOINING CONDITION', '/home/joins/process/list', '/joins/process', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('99', '68', '加盟支持', 'SERVICE SUPPORT', '/home/joins/support/list', '/joins/support', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('100', '63', '联系我们', '', '/home/contact/list', '/call', '', '2', '7', '1', '67', 'Administrative', 'category');

-- ----------------------------
-- Records for `bds_admin_post`
-- ----------------------------
INSERT INTO `bds_admin_post` VALUES ('5', '后端开发工程师', '', '1484706862', '1');
INSERT INTO `bds_admin_post` VALUES ('6', '前端开发工程师', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('7', '设计师', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('11', '文案策划', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('12', '产品助理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('15', '总经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('20', '项目经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('25', '职能', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('26', '项目助理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('28', '人事经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('29', 'CEO', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('30', '品牌策划', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('31', '前端研发工程师', '', '1484706863', '1');

-- ----------------------------
-- Records for `bds_admin_rule`
-- ----------------------------
INSERT INTO `bds_admin_rule` VALUES ('10', '系统基础功能', 'admin', '1', '0', '1');
INSERT INTO `bds_admin_rule` VALUES ('11', '权限规则', 'rules', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('13', '规则列表', 'index', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('14', '权限详情', 'read', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('15', '编辑权限', 'update', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('16', '删除权限', 'delete', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('17', '添加权限', 'save', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('18', '批量删除权限', 'deletes', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('19', '批量启用/禁用权限', 'enables', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('20', '菜单管理', 'menus', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('21', '菜单列表', 'index', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('22', '添加菜单', 'save', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('23', '菜单详情', 'read', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('24', '编辑菜单', 'update', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('25', '删除菜单', 'delete', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('26', '批量删除菜单', 'deletes', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('27', '批量启用/禁用菜单', 'enables', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('28', '系统管理', 'systemConfigs', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('29', '修改系统配置', 'save', '3', '28', '1');
INSERT INTO `bds_admin_rule` VALUES ('30', '岗位管理', 'posts', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('31', '岗位列表', 'index', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('32', '岗位详情', 'read', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('33', '编辑岗位', 'update', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('34', '删除岗位', 'delete', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('35', '添加岗位', 'save', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('36', '批量删除岗位', 'deletes', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('37', '批量启用/禁用岗位', 'enables', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('38', '部门管理', 'structures', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('39', '部门列表', 'index', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('40', '部门详情', 'read', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('41', '编辑部门', 'update', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('42', '删除部门', 'delete', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('43', '添加部门', 'save', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('44', '批量删除部门', 'deletes', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('45', '批量启用/禁用部门', 'enables', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('46', '用户组管理', 'groups', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('47', '用户组列表', 'index', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('48', '用户组详情', 'read', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('49', '编辑用户组', 'update', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('50', '删除用户组', 'delete', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('51', '添加用户组', 'save', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('52', '批量删除用户组', 'deletes', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('53', '批量启用/禁用用户组', 'enables', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('54', '成员管理', 'users', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('55', '成员列表', 'index', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('56', '成员详情', 'read', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('57', '删除成员', 'delete', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('59', '管理菜单', 'Adminstrative', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('61', '系统管理二级菜单', 'systemConfig', '1', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('62', '账户管理二级菜单', 'personnel', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('63', '组织架构二级菜单', 'structures', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('64', '栏目管理二级菜单', 'Class', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('65', '栏目列表', 'index', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('66', '其他管理二级菜单', 'other', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('67', '栏目管理三级菜单', 'three', '3', '59', '1');

-- ----------------------------
-- Records for `bds_admin_structure`
-- ----------------------------
INSERT INTO `bds_admin_structure` VALUES ('57', '企业微信', '0', '1');
INSERT INTO `bds_admin_structure` VALUES ('58', '设计部', '57', '1');
INSERT INTO `bds_admin_structure` VALUES ('59', '网络部', '57', '1');

-- ----------------------------
-- Records for `bds_admin_user`
-- ----------------------------
INSERT INTO `bds_admin_user` VALUES ('1', 'admin', 'd93a5def7511da3d0f2d171d9c344e91', '', '', '超级管理员', '1', '5', '1');
INSERT INTO `bds_admin_user` VALUES ('4', 'admin123', '8b6804ff6d620e1ede6b8289a99fbf8d', '超级管理员', '1509611337', 'lxw', '59', '', '1');

-- ----------------------------
-- Records for `bds_brand`
-- ----------------------------
INSERT INTO `bds_brand` VALUES ('1', '84', 'http://localhost/bds/php/uploads/20171228/a892eb5d4d885ee204ac9c2c3fcf1cc5.png', 'BRAND STORY FURNITURE', '', '<p>百得胜成立于2001年4，环保全屋定制家具实力品牌，上市公司德尔未来（股票代码：002631）全资子公司，定制家具行业标准起草参编单位，歌手“平安”品牌代言。</p><p>百得胜“广州+苏州+成都+铁岭”全国4大生产基地战略布局落定，广州工厂拥有近7万平米标准化厂房，苏州工厂拥有132亩生产基地，于2015年5月正式投产；占地700亩成都生产基地将于2017年启动，第四大生产基地铁岭已置地。公司在岗职工1500余人，其中研发设计人员80余人。</p><p>百得胜凭借过硬的工艺，进口的德国豪迈、温康纳生产设备，好看、好用、环保的品质，赢得了权威机构的肯定并通过ISO国际质量体系认证、环境管理体系认证、国家十环认证、绿家居联盟认证等专业认证，深获千万家庭的信赖。</p><p>广州百得胜家居有限公司2017年开启“板木+板式+橱柜+床垫”小家居战略，整体研发生产实力更上一层楼。</p>', '1', '2017-12-27 17:52', '0');
INSERT INTO `bds_brand` VALUES ('2', '87', 'http://localhost/bds/php/uploads/20171228/e67705a7c0609baa3b74f898e91a566b.png', 'BRAND STORY FURNITURE', '', '<article><h5>使命</h5><h6>为顾客创造价值，为员工谋求福利</h6></article><article><h5>愿景</h5><h6>让百得胜成为市场推崇的家具品牌</h6></article><article><h5>使命</h5><h6>专注、创新、和谐</h6></article>', '2', '2017-12-27 17:56', '0');
INSERT INTO `bds_brand` VALUES ('3', '85', 'http://localhost/bds/php/uploads/20171228/0164e13141746790a6d6b798b683879d.png', 'BRAND STORY FURNITURE', '', '<h5>2001</h5><h6>百得胜依托资本平台，跨界融合，开启“板木+板式+橱柜+床垫”小家居战略。</h6>', '3', '2001-12-28 10:10', '0');
INSERT INTO `bds_brand` VALUES ('4', '85', 'http://localhost/bds/php/uploads/20171228/d6fa24b1fcb61e1bcbf855764e734a0e.png', 'BRAND STORY FURNITURE', '', '<h5>2002</h5><h6>百得胜加入上市公司——德尔未来（股票代码：002631）；成为国家击剑队高级赞助商；投资设立“苏州韩居实木定制家居有限公司”。</h6>', '4', '2002-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('5', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2003</h5><h6>签约歌星平安担任品牌形象代言人；苏州工厂一期正式投产。</h6>', '5', '2003-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('6', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2004</h5><h6>产品基础年，围绕环保、功能、设计全面优化产品体系，推行实施千万大商1314经营计划。</h6>', '6', '2004-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('7', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2005</h5><h6>招商基础年，开启金字塔经营结构模式，渠道网点增长560%。</h6>', '7', '2005-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('8', '86', 'http://localhost/bds/php/uploads/20171228/31d51c58386990ca5c09be825b47383d.png', 'BRAND STORY FURNITURE', '', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514445356130859.png" title="1514445356130859.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356310689.png" title="1514445356310689.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445391133230.png" title="1514445391133230.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356130859.png" title="1514445356130859.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356310689.png" title="1514445356310689.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445391133230.png" title="1514445391133230.png"/></p>', '7', '2006-12-28 10:16', '0');

-- ----------------------------
-- Records for `bds_contact`
-- ----------------------------
INSERT INTO `bds_contact` VALUES ('1', '百得胜', '广州市天河区天河北路906号高科大厦A座12楼', '<p>百得胜公司信息</p>', '（020）85274395/38319021', '400-629-2629', 'lxiaoling@paterson.com.cn', '510545', 'hr@ye2005.com', 'http://192.168.1.138/vuethink/php/uploads/20171211/d7539a258f166ca1615960dc46421925.jpg', '2017-11-27 20:17', '1', '1');

-- ----------------------------
-- Records for `bds_friend`
-- ----------------------------
INSERT INTO `bds_friend` VALUES ('1', '百得胜', 'http://www.paterson.com.cn', '1', '2017-11-30 18:10');
INSERT INTO `bds_friend` VALUES ('2', '德尔未来旗下全资子公司', 'http://www.paterson.com.cn', '22', '2017-11-30 18:12');

-- ----------------------------
-- Records for `bds_joins`
-- ----------------------------
INSERT INTO `bds_joins` VALUES ('1', '96', 'TEN ADVANTACES', '三大基地', 'http://localhost/bds/php/uploads/20180108/85ce66e23fe20687468578c21d99da38.png', 'http://localhost/bds/php/uploads/20180108/953188338f650d0ddb8b74064af2d505.png', '<p>规模化生产基地，百得胜战略布局“广州+苏州+成都+铁岭+天津”全国5大生产基地。纯德式精工生产体系-成熟高效-节约物流成本-缩短交货期。广州总部工厂，德国豪迈生产线及温康纳吸塑机。2015年苏州工厂一期75亩，投资1亿，聘请德国舒乐公司设计，7月正式投产。成都生产基地已征地，将于2015年正式启动，2016年投入生产。</p>', '1', '2017-12-29 15:19');
INSERT INTO `bds_joins` VALUES ('2', '96', 'TEN ADVANTACES', '硬件软件', 'http://localhost/bds/php/uploads/20180108/93cd2ae7c0a7c01fc3e740edfef9a0e7.png', 'http://localhost/bds/php/uploads/20180109/ce56061a2a91f1635ddcaa1a67247b73.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '2', '2017-12-29 15:15');
INSERT INTO `bds_joins` VALUES ('3', '96', 'TEN ADVANTACES', '产品创新', 'http://localhost/bds/php/uploads/20180108/a2b5f48d55d0134faa592f60bb27841a.png', 'http://localhost/bds/php/uploads/20180109/ffd4d8ae6c50cc48370b2d6767a6b54d.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '3', '2017-12-29 15:22');
INSERT INTO `bds_joins` VALUES ('4', '96', 'TEN ADVANTACES', '活动策划', 'http://localhost/bds/php/uploads/20180108/1f365c1860366b04aff5619b5c52f669.png', 'http://localhost/bds/php/uploads/20180109/cb632cbd5514827ee0456cff1027a3bc.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '4', '2017-12-29 15:23');
INSERT INTO `bds_joins` VALUES ('5', '96', 'TEN ADVANTACES', '三大支持', 'http://localhost/bds/php/uploads/20180108/b9f753744036bf6ccc9f0bc9f4d427d5.png', 'http://localhost/bds/php/uploads/20180109/b75587b6a9c76e96533adf11ca1969ff.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '5', '2017-12-29 15:23');
INSERT INTO `bds_joins` VALUES ('6', '96', 'TEN ADVANTACES', '终端形象', 'http://localhost/bds/php/uploads/20180108/e93c04d76dce4b721bd02612c42f649f.png', 'http://localhost/bds/php/uploads/20180109/9a2fc0ce98deb8f0f23d5283483d8da4.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '6', '2017-12-29 15:24');
INSERT INTO `bds_joins` VALUES ('7', '96', 'TEN ADVANTACES', '环保基材', 'http://localhost/bds/php/uploads/20180108/4227bbc24a4897331a3846eed438dbc9.png', 'http://localhost/bds/php/uploads/20180109/1bdd51cbc10859e5e6cf0ad3b21b174f.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '7', '2017-12-29 15:24');
INSERT INTO `bds_joins` VALUES ('8', '96', 'TEN ADVANTACES', '进口配件', 'http://localhost/bds/php/uploads/20180108/cb3f1d02e4d1a0a54b0b98ec264d31b8.png', 'http://localhost/bds/php/uploads/20180109/20e8652bce6ea85b8bbcc2ef1dab8582.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '8', '2017-12-29 15:25');
INSERT INTO `bds_joins` VALUES ('9', '96', 'TEN ADVANTACES', '培训学员', 'http://localhost/bds/php/uploads/20180108/c83cfc79d9a0f2ed52101c3e2719fbb3.png', 'http://localhost/bds/php/uploads/20180109/5ae64ffffa795c01abde5d025f368228.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '9', '2017-12-29 15:26');
INSERT INTO `bds_joins` VALUES ('10', '96', 'TEN ADVANTACES', '六心服务', 'http://localhost/bds/php/uploads/20180108/b201a804350326dbb4fdb1862f1e6f6c.png', 'http://localhost/bds/php/uploads/20180109/cae134a22ee9a6a05ad1826b9a2fb06c.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '10', '2017-12-29 15:26');
INSERT INTO `bds_joins` VALUES ('11', '97', 'JOINING CONDITION', '热爱家具事业，具备合法资格的法人或者自然人', 'http://localhost/bds/php/uploads/20180108/dbe24c4dca18fba9c3f9cbaf0b723f28.png', 'http://localhost/bds/php/uploads/20180108/bf91f9a8dfffbed65c68eb7cf027fb8f.png', '<p>加盟内容<br/></p>', '11', '2017-12-29 15:29');
INSERT INTO `bds_joins` VALUES ('12', '97', 'JOINING CONDITION', '具有一定的文化程度，具备经营管理，运作和持续发展的能力', 'http://localhost/bds/php/uploads/20180108/01216de361bc92bbdd55787b34e72584.png', 'http://localhost/bds/php/uploads/20180109/731d5ea659c5e083e78f8fcab2ad7a7b.jpg', '<p>加盟内容</p>', '12', '2017-12-29 15:32');
INSERT INTO `bds_joins` VALUES ('13', '97', 'JOINING CONDITION', '具有一定的资金中等发达水平地级及以上城市自有资金必须在40万以上', 'http://localhost/bds/php/uploads/20180108/3823ead486071bfed4c6e72ce1f1f642.png', 'http://localhost/bds/php/uploads/20180109/304892c19cb552eaa12ee6ce5508b432.jpg', '<p>加盟内容</p>', '13', '2017-12-29 15:40');
INSERT INTO `bds_joins` VALUES ('14', '97', 'JOINING CONDITION', '有良好的经营条件，符合公司要求的好店面，舍得在装修上花功夫和本钱', 'http://localhost/bds/php/uploads/20180108/8942ed883caad40f333e8f368d668ac6.png', 'http://localhost/bds/php/uploads/20180109/44774e90b3669d05af25d49d1b05c22a.jpg', '<p>加盟内容</p>', '14', '2017-12-29 15:42');
INSERT INTO `bds_joins` VALUES ('15', '98', 'JOINING PROCESS', '建立联系，初步达成合作意向', '', '', '<p>加盟内容</p>', '15', '2017-12-29T07:53:21.539Z');
INSERT INTO `bds_joins` VALUES ('16', '98', 'JOINING PROCESS', '填写申请表', '', '', '<p>盟内容</p>', '16', '2017-12-29 15:54');
INSERT INTO `bds_joins` VALUES ('17', '98', 'JOINING PROCESS', '区域经理考核，来公司实地考察了解', '', '', '<p>加盟内容</p>', '17', '2017-12-29 15:56');
INSERT INTO `bds_joins` VALUES ('18', '99', 'SERVICE SUPPORT', '服务支持', 'http://localhost/bds/php/uploads/20171229/8d24155f3627d332b5a2115bd78ae7a0.png', 'http://localhost/bds/php/uploads/20180108/bfae27130bff397bf53225f47d9f493e.png', '<p>百得胜学院隶属于广州百得胜家居有限公司，是专门为百得胜经销商打造专业人才队伍的基地。学院秉承“全面为经销商提供专业知识和培养专业人才”的办学理念，立足于行业发展和经销商人员管理模式，成立专业的培训团队，组织开发有效实用的培训课程，全方位为经销商培养专业人才，帮助经销商打造人才竞争力，通过专业人才提供专业服务，从而使经销商赢得市场及忠实客户。<br/></p>', '27', '2017-12-29 15:56');
INSERT INTO `bds_joins` VALUES ('19', '0', '33', '333', '', '', '<p>33<br/></p>', '33', '2018-01-06T09:28:24.288Z');
INSERT INTO `bds_joins` VALUES ('20', '97', '', '店面人员配置与素质', 'http://localhost/bds/php/uploads/20180108/821076ae6fce03a7125247fa5fc8a4db.png', 'http://localhost/bds/php/uploads/20180109/0ff7f91c2b27454f04310fb20c510c06.jpg', '<p>加盟内容</p>', '14', '2018-01-08 17:05');
INSERT INTO `bds_joins` VALUES ('21', '98', '', '签订加盟合同', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '18', '2018-01-08T09:08:47.522Z');
INSERT INTO `bds_joins` VALUES ('22', '98', '', '店面装修上样', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '19', '2018-01-08T09:09:31.252Z');
INSERT INTO `bds_joins` VALUES ('23', '98', '', '店面样品设计的确认，并交纳货款', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '20', '2018-01-08T09:10:35.715Z');
INSERT INTO `bds_joins` VALUES ('25', '98', '', '工作人员岗前培训', '', '', '<p>加盟内容</p>', '21', '2018-01-08 18:28');
INSERT INTO `bds_joins` VALUES ('26', '98', '', '店面布局空间设计，施工设计样品设计等', '', '', '<p>加盟内容</p>', '22', '2018-01-08T10:30:14.122Z');
INSERT INTO `bds_joins` VALUES ('27', '98', '', '交纳品牌加盟费与品牌保证金', '', '', '<p>·百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '23', '2018-01-09T03:46:28.487Z');
INSERT INTO `bds_joins` VALUES ('28', '98', '', '店面的装饰布置', '', '', '<p>加盟内容</p>', '24', '2018-01-09T03:47:07.715Z');
INSERT INTO `bds_joins` VALUES ('29', '98', '', '开业前指导与专卖店正式开业', '', '', '<p>加盟内</p>', '25', '2018-01-09T03:48:32.269Z');
INSERT INTO `bds_joins` VALUES ('30', '98', '', '总部定期跟进运营与指导支持', '', '', '<p>加盟内</p>', '26', '2018-01-09T03:49:36.745Z');
INSERT INTO `bds_joins` VALUES ('31', '99', '', '服务支持2', 'http://localhost/bds/php/uploads/20180109/85393cb302ab0e1176789e8d634ab1bd.png', '', '<p>百得胜历经16年市场沉淀，深谙行业无促不销之妙诀：实施终端精准营销，因需特设常规促销及大型主题促销。</p><p><strong>大型主题促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全年度、大力度在全国开展“百得胜无醛添加衣柜系列”大型主题会议营销活动。220计划、360计划、4场大型促销计划，简称234帮扶政策。</p><p><strong>日常常规促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;每年315、五一、十一、元旦等重大节假日开展全国统一促销活动；确保月月有主题、周周有活动</p><p><br/></p>', '28', '2018-01-09 11:53');
INSERT INTO `bds_joins` VALUES ('32', '99', '', '服务支持3', 'http://localhost/bds/php/uploads/20180109/376a4dc84163dc10459f5e3dafa63fcb.png', 'http://localhost/bds/php/', '<p>百得胜历经16年市场沉淀，深谙行业无促不销之妙诀：实施终端精准营销，因需特设常规促销及大型主题促销。</p><p><strong>大型主题促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全年度、大力度在全国开展“百得胜无醛添加衣柜系列”大型主题会议营销活动。220计划、360计划、4场大型促销计划，简称234帮扶政策。</p><p><strong>日常常规促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;每年315、五一、十一、元旦等重大节假日开展全国统一促销活动；确保月月有主题、周周有活动</p><p><br/></p>', '30', '2018-01-09T03:56:18.125Z');

-- ----------------------------
-- Records for `bds_measure`
-- ----------------------------
INSERT INTO `bds_measure` VALUES ('24', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('25', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('26', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('27', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('28', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('29', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');

-- ----------------------------
-- Records for `bds_news`
-- ----------------------------
INSERT INTO `bds_news` VALUES ('1', '专注膜压定制哪家强？百得胜膜压新品横空出世', '92', '<p><span style="font-size:16px"><span style="color:#dd4822">中国环保定制家居先行者——百得胜膜压新品盛大发布，开启全屋定制竞争新序幕。</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 11月30日，“啄木鸟的烦恼”2017年百得胜膜压新品发布会在广东从化韩居丽格膜压馆隆重召开。膜压新品是百得胜在板式、实木（板木）之外，开辟的又一产品线，是百得胜发展新的里程碑。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514451920113535.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>立于风口 膜压新品横空出世</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 近年来，家居市场成为消费升级的前沿阵地。消费者对家居生活品质的追求不断提高，对家具的质量、质感追求也是越来越高。与此同时， 艺术、设计、时尚等精神消费元素越来越多地走进家庭。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;板式家具虽然风格多变，但对追求品质格调的消费者来说已非首选；实木家具因其价格高昂，又让人望而却步；而随着性价比优越的“膜压”产品出现，定制家具的竞争格局也悄然发生变化——“板木”定制开始崭露头角。此时，由膜压之父陈家驹倾情打造的匠心之作、情怀之作——百得胜膜压系列新品应运而生。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/2_副本.jpg"/><br/><span style="font-size:16px">发布会现场宾朋满座</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此次，百得胜近800平米全是膜压产品的实木馆正式落成，意味着百得胜正式占领全屋定制竞争新的制高点。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514451923138428.jpg"/></p><p><span style="font-size:16px">全是膜压产品的实木馆</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;本次发布会膜压新品展馆涉及六大品类十大空间产品定制解决方案，达28+款式，满足9大人群定制需求。从0-5岁咿呀学语的小孩、到6-12岁的儿童、13岁至毕业的学生、单身的奋斗青年、新婚的二人世界、为人父母的三口之家、家成业就的人生赢家、品味人生的魅力中年、三世同堂的大家庭，都能体验百得胜定制家居的魅力。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “<strong>膜压”优势在哪里</strong>？</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/4_副本.jpg"/></p><p><span style="font-size:16px">百得胜执行总裁张健先生致辞</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜品牌负责人认为，传统板式、膜压产品以及实木（板木）就好像宝马的3系、5系以及7系。板式产品占最大量的销售份额，设计经典、功能实用。膜压产品定位是中端消费人群，对于设计、产品细节也更多追求。实木（板木）定位高端市场，<span style="font-family: 宋体;font-size: 14px">工艺日臻成熟</span>。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/5_副本.jpg"/></p><p><span style="font-size:16px">韩居丽格总裁芶良朝先生分享膜压成果</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;在板式家具的创新求变的路上，膜压技术的出现成为了关键。不同于实木容易开裂变形，膜压产品集成了板式家具实用性，且多以高密度板作为基材，不论什么地方物理性能都十分稳定。此外，实木产品因含水率等天然属性在非混油工艺的情况经常会有色差，但膜压则基本不存在这个问题。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;外观设计和价格是消费者最关心的问题。理论上来讲实木定制产品可以实现绝大部分外观效果，但是在做时尚类的产品表现时就有些不合适，价格很昂贵。但膜压产品有类似钢琴烤漆的高光类产品，也有一些水波粼粼效果的3D效果类产品，也有与实木近似度极高的“混”油类产品……而有些价格不到实木定制的一半，甚至部份款式可能仅为实木定制的1/3。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/6_副本.jpg"/></span></p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/7_副本.jpg"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 对标实木产品，膜压产品的优势明显。就物理性能来说，膜压产品相对稳定，不会开裂。韩居丽格供应给百得胜的膜压产品是用密度在810-820KG/立方米的高密度板作为基材，十分稳定。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/8_副本.jpg"/><br/><span style="font-size:16px">中国膜压之父陈家驹先生分享膜压工艺特性</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;百得胜膜压产品还具有媲美实木的外观与手感。发布会现场，通过观察与触摸，经销商家人及媒体朋友们仍感叹难以分辨百得胜膜压板与实木，陈家驹先生对此做出详细的技术说明。目前，百得胜美洲实木转膜压同款与实木的混油工艺产品视觉效果、触觉效果无限接近。膜压板耐脏、耐划、防火的性能，现场也一一演示。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/9_副本.jpg"/></p><p><span style="font-size:16px">膜压板防火性能现场演示</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 环保方面，百得胜使用无醛添加环保板材和水性胶、水性膜，打造更安醛的定制产品。此外，膜压产品还具有生产周期短、饰面效果好，外观时尚美观、性价比高等等优势。由此可见，好的生活，并不贵。百得胜始终致力于为消费者创造“品质好生活”。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;<strong> 专注膜压定制哪家强？</strong></span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/10_副本.jpg"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 作为中国人自己的定制家具品牌，百得胜一直致力于把好看、好用、环保的产品奉献给国人。本次发布会，百得胜领先业界推出多达28款膜压新品，不仅风格多、造型多、品类多、色彩多，每一件新品都是艺术品般的存在。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 目前，在全屋定制家具市场上，膜压产品越来越受到消费者的青睐。韩居丽格自身强大的生产实力＋百得胜专业的全屋定制实力，领衔膜压门板定制，专业专注成熟。在行业内率先实现基材密度板膜压、美洲实木和实木油漆三种工艺的互转，达到目前业内最高的工艺水准。<br/>其成都＋广州＋天津三大实木工厂，规模化定制实木、膜压、移门三大系列1000余款门型。</span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>百得胜&amp;韩居丽格 实力不容小觑</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 麦田的丰收来自肥沃的土壤与精心培育。<strong>百得胜丰富的膜压产品和精湛工艺则得益于强大的产能实力和研发优势。</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;<span style="color:#4444bb">| 研发优势</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;百得胜研发团队基于市场、基于用户、基于未来需求等多个纬度，研发新品。2017年，百得胜与韩居丽格完美融合，实现实木及膜压两大系列近30款新品的快速迭代。而韩居丽格从几十万到数百万的膜压产品生产线，到自动化、信息化等工业4.0符号性设备，为膜压产品总出货量行业第一奠定基础。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “<strong>实木膜压相互转化</strong>”：百得胜在业界率先实现了实木与膜压工艺互转。也就是说，百得胜每一款实木门型，都能对应一个同样样式的膜压门型。同一风格，不同配置，消费者买家具像买车一样来选择高配或标配。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 质美膜压，媲美实木。百得胜的部分膜压产品已与实木的混油工艺产品视觉效果、触觉效果完全一样，同时还拥有超高性价比、更短的生产周期等优势。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:#3c3cc4">| 产能优势</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 产能方面，百得胜&amp;韩居丽格在成都、广州、苏州、天津等多个生产基地，更大产能释放空间，规模化定制实木、膜压、移门三大系列1000余款门型，让百得胜的膜压产品在交货周期上获得极大保障。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/11_副本.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 膜皮的丰富可变性及全行业推动的技术革新，膜压产品在未来有非常广阔的市场前景，将是作为全屋定制领域产品的新增长点。此番，百得胜全屋定制携手韩居丽格，领衔膜压门板定制，实现膜压与实木工艺的互转定制，无疑将占据中国定制家居市场制高点！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><span style="font-family: 宋体;font-size: 14px"><span style="font-family:宋体">&nbsp;&nbsp;&nbsp; 质</span></span>美膜压 给自己更好的，来一起见证百得胜的产品创新力吧！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/dece288f29b0b3e360af06228b1150cc.jpg', '2017/12/28', '佚名', '1', '0', '0');
INSERT INTO `bds_news` VALUES ('2', '百得胜&松博宇强强联合 共赢“板木定制”未来', '92', '<p><span style="font-size:16px">&nbsp;&nbsp; 【前言】国民实木情节根深蒂固，却苦于其价格昂贵。随着国民消费升级催生出行业新风口——“板木定制”。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452085214083.jpg"/><br/><span style="font-size:16px"><strong>签约仪式</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年9月20日，百得胜&amp;松博宇战略合作签约仪式暨媒体见面会在中国·广州隆重举行。百得胜执行总裁张健先生与松博宇董事长詹雄光先生进行签约，正式对外宣布双方携手合作，这不是一场简单的发布会，这是一场志同而气合的战略发布会。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “志同而气合,鱼川泳而鸟云飞也。”松博宇 “原木板式化”与百得胜“板木＋实木”差异化板木定制理念不谋而合，二者战略携手，实现共赢。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 立于板木风口 未来已来</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 中国作为全球第二大经济体，国民消费力在多个领域都暗藏着繁荣之势。随着经济发展和消费升级，催生行业新风口——板木定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜，16年专注环保定制家居，全屋板木定制引领者，推出“板木+实木”的板木定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “板木+实木”的板木定制，不再单纯地追逐全实木，理性分析家居产品的实际使用，继全实木产品之后再推板木定制。</span><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; </strong></span></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 尊重专业</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
松博宇公司成立于2001年7月，专注于木材应用领域十多年，2014年被认定为国家高新技术企业，具备从原木选材到研发、生产、销售再到家居产品配套和服务的完整产业链，其自主研发产品为科技木类、生态有机板类、3D艺术板类、浮雕板及装饰木枋类等，部分产品畅销全球60多个国家和地区，在技术创新、产品内涵、市场价值和品牌竞争力等方面均居于行业前沿。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452086169932.jpg"/></p><p><span style="font-size:16px">百得胜执行总裁张健先生讲话</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 作为原木板式化的倡领与践行者，松博宇精选北美进口原材，配合极致的原木板式化加工工艺，产品走向了世界上六十多个国家和地区，从选材到工艺，从平面到立体，始终站在木业行业潮流的前端。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452087905259.jpg"/></p><p><span style="font-size:16px">松博宇董事长詹雄光先生讲话</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此番百得胜携手松博宇，松博宇自身强大的生产实力＋百得胜专业的全屋定制实力，更加高效整合上下游产业链，降低成本，实现不一样的板木定制。而百得胜全国千店和“OSA”电商模式打通线上与线下渠道之间的双向引流及对接，更是让板木落地开花，共赢板木定制大未来。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 不断夯实小家居大战略</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2016年，百得胜选择一种全新形式的资本之路——加入老牌上市企业德尔未来。在获得资本加持之后，百得胜开始加速布局，大力发展小家居战略。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜的“小家居战略”不同于当下热门的“大家居”，不盲目追逐企业的快速扩张，而是在坚持自有优势产品定制衣柜的基础上，发展全屋定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
而除衣柜产品以外的延伸品类产品百得胜选择了与行业内拥有优势积淀且有发展潜力，已经拥有一定实力的优质企业联手，从2016年开始，百得胜就先后与实木门板企业韩居丽格、橱柜企业丹得橱柜牵手，如今携手松博宇不断夯实小家居战略，此后百得胜还将牵手更多的周边产品企业。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>百得胜+松博宇 走出板木定制差异化</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 如果说，此前百得胜与实木定制强者韩居丽格的携手，让百得胜实木定制梦想终得以实现。那么，此次携手全屋原木定制供应商松博宇，用原木板式化的方式进行全屋定制生产，必然让百得胜走出一条差异化的板木定制之路。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 国民实木情节根深蒂固，却苦于其价格昂贵。那么该怎样实现呢？原木板式化走出了一条不一样的路。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452088471542.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 传统的实木定制一般都是对一块实木原木进行加工，成本比较高。而作为一家专注木业研发制造达到28年的企业，松博宇结合现阶段国内外工业发展的有利条件，提出把原木做成板式化，满足国民根深蒂固的实木情节，这与百得胜的实木梦想不谋而合。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在定制领域，从某种程度上来说，原木板式化是工业4.0的新风向之一。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在强调环保主概念的当下，优质的基材与丰富的产品线是企业竞争的不二砝码，百得胜始终坚持环保主张，更是在洞察市场的深度需求后，提出“板木定制”的战略性手段。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年3月，百得胜全新实木定制馆全面对外亮相，推出“板木+实</span><span style="font-size:16px">木”的“板木定制”概念，不单纯地追逐全实木，而是理性分析产品的实际使用，各取所长，结合实木与板木的双重优势，满足更多家庭及市场的需求。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年6月，百得胜以“好柜配好门”为主题，发布新品美洲实木柜体，与百得胜此前推出的美洲实木柜门形成了完整套系。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/920/图片2.JPG"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 美洲实木柜体的推出，让百得胜形成了“美洲实木柜体+美洲实木门板”此类独创的板木定制环保+抗变形技能满分的定制家具。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 至此，在板式定制+实木定制领域内，百得胜已经成长为值得期待的黑马。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此番携手，更是独辟蹊径，走出一条差异化发展之路，无疑是为百得胜再添腾飞的新助力，专业合作，共赢板木定制未来。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452089680461.jpg"/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/6d3fd3d47de06602566428044e7fc130.png', '2017-12-28', '佚名', '2', '5', '0');
INSERT INTO `bds_news` VALUES ('3', '百得胜T6项目特训营圆满结营', '92', '<p><span style="font-size:16px"><strong>打造标准·专业定制</strong>，经过三天四夜高强度特训，200余位百得胜精英精诚协作、全力拼搏，展示出了优异的学习成果，为此次T6项目特训画上了圆满的句号。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片1.JPG"/></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 胜在培训·赢在服务</strong>，在此次T6终端体验营销系统特训中，培训导师针对性地对百得胜服务方面进行了透彻的分析和团队服务标准化的培训。三天四夜，百得胜学员们一对一完成通关考核，收获满满！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片2.JPG"/></p><p><span style="font-size:16px">T6项目特训营开营授旗仪式</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片3.JPG"/></span></p><p><span style="font-size:16px">全体学员紧张备考中</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片4.JPG"/><br/><span style="font-size:16px">学员们一对一通关考核</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片5.JPG"/><br/><span style="font-size:16px">娱乐精彩一刻</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片6.JPG"/><br/><span style="font-size:16px">产品话术情景模拟</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片7.JPG"/><br/><span style="font-size:16px">聚精会神学习中</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片8.JPG"/></span></p><p><span style="font-size:16px">笔试考核通关</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 不是结束·而是开始</strong>，百得胜T6特训虽然暂告一段落，但这不是终点，而是起点，200余位华丽蜕变的精英们将迅速回到自己的岗位，用所学的知识、所理解的系统做出更出色的发挥，带领各自团队开启新的征程！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片9.JPG"/></p><p><span style="font-size:16px">冠军团队风采</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 引爆终端·破浪前行</strong>，此次百得胜T6特训，针对终端店面的四大痛点，点对点爆破，突破经营瓶颈，用干货解决营销没系统、团队难培养、终端没业绩、培训没效果的难题。百得胜5A+T6组合拳连续出击，快速引爆终端业绩，谁与争锋！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片10.JPG"/><br/><span style="font-size:16px">誓师大会</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年百得胜小家居战略全面推进中，T6项目特训营的培训成果将大大提升百得胜团队战斗力和品牌竞争力，为下半年的全国推广打下坚实基础。系统运营+体验营销，百得胜军团已经吹响2017年胜利的号角，战斗吧小伙伴！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/753e76e0fffc1271ddd1e2e8209d7ec6.png', '2017/12/28', '佚名', '3', '0', '0');
INSERT INTO `bds_news` VALUES ('4', '百得胜张健：成品OR定制？用户说了算！', '92', '<p><span style="font-size:16px">第38届名家具展暨中国(东莞)国际定制家居展在8月11日拉开帷幕，沉淀十八年后，东莞家具展已经进入三展联动时代，而在第十九个年头，首届中国(东莞)国际定制家居展览会无疑成为东莞展最大亮点。在万众瞩目的展会上，慧亚传媒记者采访到百得胜执行总裁张健先生，下面，请跟随记者的镜头走进这家优质企业吧。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/888/图片1.JPG"/><br/>专访嘉宾：百得胜执行总裁 张健</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：张总您好，百得胜是首次参加成品定制的展览吗？参展类型与以往存在些微差异，对此，企业作了哪些准备？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：百得胜是第一次参加成品家具展，大家都知道，成品家具在珠三角乃至全国地区都有影响力，而定制家居又发源于建材，双方间有着千丝万缕的关系。而如今，成品往定制走，定制往大家居去走，相互之间迟早需要碰面，所以这次我们都相当“诚惶诚恐”，毕竟，成品家具在工艺、设计上都比定制家居、建材行业成熟，所以这次，我们是抱着学习的态度来参展的。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片2.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片3.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片4.png"/><br/>参展人潮络绎不绝</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：成品家具与定制市场打得火热，而本次展会的举办也正好印证了这一点，您怎么看待两者的共融？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：现在的市场竞争激烈，成品和定制融合，或者定制有更多的成品化方向，成品有更多定制化的方向，市场的最终走向还是依靠用户的选择来判定，基于用户的需求，两者都有各自的优缺点，不管成品还是定制市场，用户说好，才算真的好。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片5.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片6_副本.png"/><br/>百得胜膜压工艺托斯卡纳新品展示</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：如果用一个关键词来形容您在百得胜近几年的总体情况，您会选择用什么词呢？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：“责任”，近几年，百得胜所走的路与其他定制品牌不尽相同，挑战和机遇并存。进入资本市场之后，因为体量偏小，面对资本市场的竞争和压力很大，同行对百得胜也投放了相当大的预期，因此，要肩负起对公司、团队、乃至于整个经销商体系的责任，百得胜必须要以更好的表现展露人前，对大家有一个合理交代，所以我认为责任是关键词。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：“无人工厂”的生产模式渐渐走红，机器正慢慢地代替人工，那您觉得在这样的趋势下这种模式有什么利和弊呢？</span></strong></p><p><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：我认为，不能独立地以产业或行业的特点去看待“无人工厂”的模式，从根本上还是要从两个层面解读，首先是从用户的角度出发，不管是无人化还是机械化，当它的发展能够贴合用户需要，那便是合适的；其次，从产业链的角度思考，无人化或者智能化是涉及“术”的层面，技术，从本质上说，技术的升级是围绕着企业的经营活动去服务的，经营活动是否需要技术更新？要如何更新？这都要企业从更高的维度去思考，从技术层面上进行反思，想法成熟以后再以AI、智能、无人设备去替代人工，完成升级布局。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
技术的升级、器材的配备都需要讲求深度和适用性，这也与行业的高度、宽度有关。即使企业把设备制造得非常精良，但是通过该设备制造出来的产品不受用户喜欢，或者它被更高阶的行业配套所覆盖掉，那么，哪怕是三头六臂的顶尖设备也起不到一丁点作用。当别人都使用枪了，即使你拥有最锋利的宝剑又如何？</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片7.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片8.png"/></span></p><p><span style="font-size:16px">参展人潮络绎不绝</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：智能化又逐渐兴起，你觉得目前的智能家居对于消费者和企业自身发展而言，是一块鸡肋吗？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：智能家居不是鸡肋，它是未来的必然发展趋势。我认为，未来智能家居的入口将是手机，近几年定制家居发展迅猛，是因为它抢占了家具建材行业的入口，而智能的入口不是家居，是手机。企业、顾客能通过移动端时刻掌握智能化的动态，完成功能性的操作，大大便于消费者的生活，相信不久的将来普及度会有所提升。而针对用户的使用习惯进行合理的研发，将是企业决胜的关键。</span></p><p><span style="font-size:16px">&nbsp;</span><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：张总，下半年百得胜的发展关键词是什么？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：扎好马步，苦练内功，少说多干。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：感谢张总一番精彩解读，祝愿百得胜能走出更强劲的姿态！</span></strong></p><p><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：谢谢大家。</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/b010641eddf3df313768641f253cb8a7.png', '2017-12-28', '佚名', '4', '0', '0');
INSERT INTO `bds_news` VALUES ('5', '偶像来了! 黄家强来了！百得胜第一大店来了！', '93', '<p><span style="font-size:16px">2016年11月6日<br/>百得胜第一大店<br/>百得胜温州千方旗舰店将盛大开业<br/>Beyond成员<strong>黄家强</strong>亲临助阵<br/>倾力打造摇滚音乐盛会<br/>摇出实惠、摇出惊喜<br/>摇出百万现金送送送</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）107_副本.jpg"/></p><p>&nbsp;<br/><span style="font-size:16px">金秋时节，再现光辉岁月<br/>携手Beyond成员黄家强<br/>全力打造温州摇滚狂欢节<br/><strong>一起致敬永不退场的青春<br/>致敬Beyond</strong></span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）169.png"/></p><p>&nbsp;</p><p><span style="font-size:16px">继平安、辛晓琪、周海媚、陈德容......<br/>百得胜再次为您打造超强音乐盛会</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）209.png"/></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>11月6日<br/>百得胜温州千方旗舰店盛大开业<br/>Beyond成员黄家强摇滚音乐会<br/><span style="color:#f70938">花椒、一直播同步直播</span></strong></span></p><p><span style="font-size:16px"><strong>敬请关注，一起狂欢！</strong></span></p><p><br/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/ded4605581a7b0bfc3c386ae14a7b58e.png', '2017/12/28', '佚名', '5', '8', '0');
INSERT INTO `bds_news` VALUES ('14', '百得胜助力集团公司德尔未来打造“中国足球未来星”南京体验活动进行中', '93', '<p><span style="font-size:16px"><br/></span></p><p><span style="font-size:16px"><span style="font-size:16px">百得胜助力集团公司德尔未来携手国际冠军杯足球赛，共同助力打造“中国足球未来星”体验活动落地南京</span></span><br/><span style="font-size:16px">南京40度的高温也抵不住球迷的热情</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜为集团公司德尔未来作为国际冠军杯中国赛高级赞助商助力，为广大喜爱百得胜环保定制的顾客朋友带去了众多优惠及福利！价值999元的冠军杯南京站限量球票幸运降临一波百得胜顾客朋友身上。</span></p><p><span style="font-size:16px">国际冠军杯南京赛999元门票幸运得主在百得胜不亦说乎！</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 更多福利，更多放心，更多开心，尽在百得胜专卖店......喜获国际冠军杯门票的幸运儿，今晚就可以凭票开开心心去现场看球，面见国际巨星，更可近距离一饱一大波足球宝贝的靓丽身影眼福，今晚，南京奥体中心见。</span></p><p>&nbsp;</p><p><br/></p><p><br/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/425b4567276a7b6e3b20d462bc98bac4.JPG', '2018-01-08', '原创', '6', '1', '0');
INSERT INTO `bds_news` VALUES ('15', '平安“震撼”登场 好声音唱响广西百得胜', '93', '<p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西1.jpg"/></span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>来了、来了，平安来了！！！</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 等待了一个多月，终于等到今天！5月31日下午百得胜代言人——实力派歌手平安莅临广西首家无醛添加衣柜馆将盛大开业活动现场火热献唱，为百得胜广西首家无醛添加衣柜馆开业优惠活动助威！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西2.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西图3.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西4.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜、富安居相关领导以及广西十多家媒体见证了百得胜广西首家无醛添加衣柜馆盛大开业的剪彩仪式。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西5.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西6.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西7.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西8.jpg"/></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>疯狂、震撼——“好声音”嗨翻全场</strong><br/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 平安携百得胜环保衣柜“价临”广西富安居中庭！广西富安居建材城内人气火爆，中庭、各楼层都挤满了大批歌迷粉丝、顾客朋友们，人气极其火爆！<br/></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 现场平安演唱《云淡风轻》、《洋葱》等多首经典歌曲，一首《我爱你中国》更是震撼全场，全场气氛彻底达到沸点，现场粉丝们之尖叫疯狂！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西9.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 平安出现活动现场，全场热情急速引爆！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西10.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 好声音震撼疯狂的平安粉丝团</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西11.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;活动现场奶爸、奶妈也追星</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西12.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 现场座无虚席，现场十分火爆</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西13.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>开业优惠更疯狂</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 为了庆祝百得胜衣柜广西首家无醛添加馆开业活动，除了邀请当红歌手平安现场献唱，活动现场开业优惠更疯狂——20万现金现场返现、无醛添加系列满5000抵10000、现场购买赠送价值880元鞋柜、与明星平安近距离合影留念……</span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜广西首家无醛添加衣柜馆盛大开业活动圆满成功！大家不仅享受到了优厚的贵宾服务，享受到工厂直供的价格，还感受到了歌手平安现场带给众人的震撼视听盛宴。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西14.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西15.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西16.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西17.png"/></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
百得胜精研环保定制衣柜14年，尤其在近年，通过不断的努力，打造出无醛添加系列定制家具。百得胜衣柜，优选无醛添加密度板、颗粒板、实木芯，凭借极致环保的无醛添加材质，获得越来越多消费者厚爱追捧！2015年，百得胜携手平安，以无醛添加环保产品为核心，努力打造“平安的家，百得胜定制”的环保家居。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西18.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西19.jpg"/></span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/1ad5f148a23ad52be41ac8ad602a4dfa.jpg', '2018-01-08', '原创', '7', '0', '0');
INSERT INTO `bds_news` VALUES ('16', '哈尔滨，平安来了! 百得胜火了！', '93', '<p><span style="font-size:16px">4月25日，百得胜哈尔滨旗舰店盛大开业。歌手平安亲临现场助阵，为开业优惠活动加油助威，活动现场声势浩大，气氛火爆，创造百得胜开业活动新传奇！</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安1.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安2.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 高空彩球飘扬，现场众人热忱静候平安</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安3.jpg"/></span><span style="font-size:16px"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 气势雄伟的气飘与彩旗，格外惹人关注</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安4.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现场座无虚席，十分火爆</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安5.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排队签单长龙，见头不见尾</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安6.png"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 哈尔滨，惊现北京，深圳的平安粉丝团</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安7.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平安一到场，引众人纷纷抢拍</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安9.jpg"/><br/></span><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平安现场献歌，响彻现场</span><span style="font-size:16px"><br/>&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 本次哈尔滨百得胜旗舰店盛大开业活动圆满成功！现场，大家不仅享受到了优厚的贵宾服务，享受到工厂直供的价格，还感受到了歌手平安现场带给众人的视听盛宴......众消费者纷纷表示不虚此行！</span><span style="font-size:16px"><br/>&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜衣柜经历14的时间沉淀，不仅在行业内享有“环保定制衣柜”的美誉，还获得消费者的广泛认可和各权威机构的认证。用事实见证实力，书写环保定制新传奇。</span>&nbsp;</p><p><span style="font-size:16px"><br/>&nbsp;&nbsp;&nbsp; 平安的家，百得胜定制。再见亦再见！425哈尔滨，再见！51武汉再见，不见不散！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/7237891f8f20f163945513e7653d868e.png', '2018-01-08', '百得胜', '8', '1', '0');
INSERT INTO `bds_news` VALUES ('17', '中国平安万里行——成都首站！4.25, GO百得胜', '93', '<p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里1.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>2015年4月25日下午13:00<br/></strong>&nbsp;&nbsp;&nbsp; <strong>成都高新区都会路99号富森?美家居建材MALL负一楼中庭百得胜衣柜。</strong><br/>&nbsp;&nbsp;&nbsp; 百得胜工厂质检总监亲临成都，给成都的消费者分享真正的家居装修环保知识！让你了解什么叫甲醛0释放时代，如何让家人生活在一个安全无忧的绿色空间！</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里2.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里3.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里4.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里5.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里6.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里7.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里8.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span style="color:#e6421a">4.25，来成都百得胜衣柜，为您省到家！</span></strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里9.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里10.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里11.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里12.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜衣柜进驻成都后，环保健康家居理念逐渐深入人心。<br/>&nbsp;&nbsp;&nbsp; 百得胜全屋收纳定制要做的，就是持之以恒地研发环保定制衣柜产品，为消费者打造安全健康的家居生活。<br/><strong>&nbsp;&nbsp;&nbsp; 更多套餐，敬请到店详询....</strong><br/><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动VIP专线：028-61559394</strong> </span></span></p><p><span style="font-size:16px;color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动时间：2015年4月25日</strong> </span></p><p><span style="font-size:16px"><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>签到时间：下午13:00-13:30</strong> </span></span></p><p><span style="font-size:16px"><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动地点：成都高新区都会路99号富森?美家居建材MALL负一楼中庭</strong></span></span><span style="font-size:16px"> </span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里13.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里14.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里15.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里16.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里17.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里18.jpg"/><br/></span><span style="font-size:16px"><br/></span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/97db874c92269efa2485e255355222c5.jpg', '2018-01-08', '百得胜', '9', '0', '0');
INSERT INTO `bds_news` VALUES ('18', '女神真都来了，让大家与百得胜有了更契合的 “情感密码”', '93', '<p><span style="font-size:16px">大事件,女神真都来南宁百得胜了！！！<br/>惊呆了！抢疯了！嗨疯了！爽翻了！</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神1.jpg"/></span></p><p><br/><span style="font-size:16px">8月30日，娱乐气旋席卷南宁。<br/>南宁富安居百得胜，<br/>双强飓“疯”来袭，<br/>两大台湾实力派唱将，<br/>疗伤系情歌天后辛晓琪来了，<br/>“小张惠妹”简语卉也真来了！<br/>齐聚南宁，亲临南宁富安居百得胜衣柜，<br/>同台飙歌，以歌会友，情动南宁，律动青春情怀。<br/>火力助推南宁百得胜第6家无醛添加馆火爆开业，<br/>一起为百得胜环保而歌。<br/>南宁百得胜衣柜，<br/>迎来了三伏天后的又一次热潮。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神2.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>女神潇洒进场，彻底点燃了现场观众粉丝们的热情</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在一片片热烈的欢呼声中，两大女神潇洒入场，点燃了场观众粉丝们的热情。现场的观众朋友们纷纷拍照录像，现场顿时火爆,引起粉丝疯狂尖叫。<br/>&nbsp;&nbsp;&nbsp; 辛晓琪与“阿妹”登台开唱，互相飙歌。噢噢噢……天后嗓喉一开，赢得观众阵阵掌声，<br/>嗨翻现场！</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神3.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神4.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神5.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神6.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神7.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神8.jpg"/></span></p><p><br/><span style="font-size:16px">两大女神，以情为律，为百得胜环保而歌，<br/>一首风靡一代人的《味道》，<br/>一首一辈子的《深情难了》，<br/>还有浪漫甜蜜的《玫瑰花》，<br/>相伴一生的《牵手》<br/>引爆大家最难忘的记忆高潮，<br/>动情的味道，幸福的玫瑰，一辈子的情缘与牵手<br/>扣动了粉丝们的心弦，<br/>骚动了大家的心灵之魂，<br/>让大家在感情里顿悟.......<br/>两大女神飙歌旋风与百得胜开业抢购“疯”汇，合成最动情的情风，<br/>动听的情歌，开业的盛惠、现场的娱乐互动......高潮不停歇，狂欢不停止！<br/>让更多的消费者与百得胜衣柜有了契合的 “情感密码”。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神9.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神10.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>“小张惠妹”简语卉为大家献歌抽奖</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神11.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>情歌天后辛晓琪为环保，提笔写下“平安的家，百得胜定制”</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神12.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>哎哟，百得胜因环保而出尽了风头，爽歪歪！</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神13.jpg"/></span></p><p><br/><strong><span style="font-size:16px">与情歌天后合影，好嗨森！</span></strong></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 热情碰撞的火花，高大上的月饼现场领，红包现场大派送，豪礼现场任性抽......为南宁客户献上了视觉与听觉的璀璨盛宴。大家现场在百得胜畅享无醛的《味道》，《牵手》共建平安的家......到场客户高兴而来，满载而归，好嗨森！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/495c7251dc8de2490f87def31ea1fde4.jpg', '2018-01-08', '百得胜', '10', '1', '0');

-- ----------------------------
-- Records for `bds_order`
-- ----------------------------
INSERT INTO `bds_order` VALUES ('1', 'thinkphp', 'thihp', '1515380795', '192.168.1.138', '192.168.1.138', '0', '0');
INSERT INTO `bds_order` VALUES ('2', 'THINKPHP', 'THINKPHP', '1515383817', '192.168.1.138', '192.168.1.138', '5', '0');
INSERT INTO `bds_order` VALUES ('3', 'THINKPHP', '44', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('4', '', 'a:0:{}', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('5', 'THINKPHP', 'a:1:{s:8:"order_id";s:8:"THINKPHP";', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('6', 'LXW', 'a:2:{s:8:"order_id";s:3:"LXW";s:6:"', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('7', 'LXW', 'a:2:{s:8:"order_id";s:3:"LXW";s:6:"status";s:3:"123";}', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('8', 'LXW', '202cb962ac59075b964b07152d234b70', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('9', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379029', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('10', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379179', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('11', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379227', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('12', 'LXW', '123', '1515379313', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('13', 'LXW', '123', '1515379412', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('14', 'LXW', '1', '1515379439', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('15', 'LXW', 'hahhh', '1515379463', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('16', 'LXW', '', '1515379595', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('17', 'LXW', 'sdddd', '1515379616', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('18', 'LXW', 'cd3f8d1414719727286eda32fda4b96d', '1515379728', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('19', 'LXW', 'sdddd', '1515383841', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('20', 'LXW', 'sdddd', '1515383844', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('21', 'LXW', 'sdddd', '1515383906', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('22', 'LXW', 'sdddd', '1515383952', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('23', 'LXW', 'sdddd', '1515384086', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('24', 'LXW', 'sdddd', '1515384125', '192.168.1.138', '', '0', '1515384125');

-- ----------------------------
-- Records for `bds_product`
-- ----------------------------
INSERT INTO `bds_product` VALUES ('1', '77', 'http://localhost/bds/php/uploads/20171228/bb968e4538193927f5aa2b7645c5e2fa.png', '儿童房01', 'CHILDREN ROOM', '精湛工艺  执勤工艺', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514345417111456.jpg" title="1514345417111456.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514345417881463.jpg" title="1514345417881463.jpg"/></p>', '1', '2017-12-27 11:30', '1');
INSERT INTO `bds_product` VALUES ('2', '77', 'http://localhost/bds/php/uploads/20171228/7f8a4705e229604b5a0b07cbb5dcc477.png', '儿童房02', 'CHILDREN ROOM', '简约大气的设计，搭配自然细腻的木纹', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514345997399851.jpg" title="1514345997399851.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514345997835332.jpg" title="1514345997835332.jpg"/></p><p><br/></p>', '2', '2017-12-27 11:39', '7');
INSERT INTO `bds_product` VALUES ('3', '80', 'http://localhost/bds/php/uploads/20171228/34b0cb14fb3516f8e761b01da0953b0e.png', '客厅01', 'GUEST ROOM', '在美式家具基础上，融入现代设计风格', '在美式家具基础上，融入现代设计风格。古典中透露出丝丝灵动，现代中带有少许文艺。
门板线条，简洁时尚，白色为基调，融入黄色装饰部分，使产品在简洁大方的基础上增加了现代时尚气息。
既有自在不羁的个性，也在不经意中体现着休闲式的浪漫，让人体验到一种别样的轻生活、慢时光', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514355930586695.jpg" title="1514355930586695.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514355930851857.jpg" title="1514355930851857.jpg"/></p><p><br/></p>', '2', '2017-12-27 14:07', '5');
INSERT INTO `bds_product` VALUES ('4', '80', 'http://localhost/bds/php/uploads/20171228/3fac35bb7c8a86ba5fa88a0a4a9b3b5e.png', '客厅02', 'GUEST ROOM', '精湛工艺 执勤品质', '在美式家具基础上，融入现代设计风格。古典中透露出丝丝灵动，现代中带有少许文艺。
门板线条，简洁时尚，白色为基调，融入黄色装饰部分，使产品在简洁大方的基础上增加了现代时尚气息。
既有自在不羁的个性，也在不经意中体现着休闲式的浪漫，让人体验到一种别样的轻生活、慢时光', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514356445961846.jpg" title="1514356445961846.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514356445769924.jpg" title="1514356445769924.jpg"/></p><p><br/></p>', '1', '2017-12-27 14:33', '2');
INSERT INTO `bds_product` VALUES ('5', '79', 'http://localhost/bds/php/uploads/20171228/7c902985c7931eeac0becfe6f5d7572a.png', '书房系列', 'BOOKING ROOM', '精湛工艺 执勤品质', '
印象系列--B5120701新中式岭南印象-多功能房印象系列--B5120701新中式岭南印象-多功能房印象系列--B5120701新中式岭南印象-多功能房', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514428261120110.jpg" title="1514428261120110.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514428261488023.jpg" title="1514428261488023.jpg"/></p><p><br/></p>', '1', '2017-12-28 10:30', '3');
INSERT INTO `bds_product` VALUES ('6', '80', 'http://localhost/bds/php/uploads/20171228/158942b16e8cf4f7003325ee2cd2f5b3.png', '客厅系列01', 'BOOKING ROOM', '简约大气的设计，', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514431708729991.jpg" title="1514431708729991.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514431708631362.jpg" title="1514431708631362.jpg"/></p><p><br/></p>', '2', '2017-12-28 11:28', '6');
INSERT INTO `bds_product` VALUES ('7', '77', 'http://localhost/bds/php/uploads/20180104/e5150f8a337ecf3a6e37c218b9162ab4.png', '儿童房03', 'CHILDREN ROOM', 'CHILDREN ROOM', 'CHILDREN ROOMCHILDREN ROOMCHILDREN ROOM', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p>FGDF<br/></p>', '0', '2018-01-04 11:52', '8');
INSERT INTO `bds_product` VALUES ('8', '77', 'http://localhost/bds/php/uploads/20180104/7b516fdc9c6cfab8b5843ff8504fd20a.png', '儿童房04', 'CHILDREN ROOM', '儿童房04', '儿童房04儿童房04儿童房04', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p><img src="http://localhost/bds/php/ueditor/20180104/1515038177816485.png" title="1515038177816485.png"/></p><p><img src="http://localhost/bds/php/ueditor/20180104/1515038177700428.png" title="1515038177700428.png"/></p><p><br/></p>', '0', '2018-01-04 11:55', '9');

-- ----------------------------
-- Records for `bds_service`
-- ----------------------------
INSERT INTO `bds_service` VALUES ('1', '概述', '校训、模式、专业', 'http://localhost/bds/php/uploads/20180109/912d3cff130608a72ef6ce5aa26cdfd5.png', '<p class="t2 zz1">百得胜学院隶属于广州百得胜家居有限公司，是专门为百得胜经销商打造专业人才队伍的基地。学院秉承“全面为经销商提供专业知识和培养专业人才”的办学理念，立足于行业发展和经销商人员管理模式，成立专业的培训团队，组织开发有效实用的培训课程，全方位为经销商培养专业人才，帮助经销商打造人才竞争力，通过专业人才提供专业服务，从而使经销商赢得市场及忠实客户。</p><p class="t2 zz1">经过扩建后的百得胜学院教学设施齐全、设备优良，拥有1000多平米的教学场地，有公共课教室，电脑多媒体教室，安装实操教室，能同时进行设计、安装、导购等多个专业的课程，能同时容纳上百人的培训。还配套有1000多平米的公寓，为各地来学院学习的学员提供良好的住宿环境。</p><p><br/></p>', '', 'http://localhost/bds/php/uploads/20171228/c3abcee07ae9746d8001502b06ccc2f5.png', '88', '2017-12-28 16:28', '1');
INSERT INTO `bds_service` VALUES ('2', '免费送货', '', 'http://localhost/bds/php/uploads/20180104/282c87c6a29862d90503ea84605b2ddb.png', '', '', 'http://localhost/bds/php/uploads/20171228/a0c6ce31cd7ca8052774e4ca8d4b362f.png', '90', '2017-12-28 16:45', '4');
INSERT INTO `bds_service` VALUES ('3', '免费安装', '', 'http://localhost/bds/php/uploads/20180104/1f6b53852cc777c668a005a01cb63e20.png', '', '', 'http://localhost/bds/php/uploads/20171228/115e26938f6a193f8db32c130ac4a313.png', '90', '2017-12-28 16:49', '5');
INSERT INTO `bds_service` VALUES ('4', '免费维护', '', 'http://localhost/bds/php/uploads/20180104/47c9fc057f4788e7af23c910e2aef10c.png', '', '', 'http://localhost/bds/php/uploads/20171228/276702d9260bb8d273b77428c4cfc317.png', '90', '2017-12-28 16:49', '6');
INSERT INTO `bds_service` VALUES ('5', '免费维修', '', 'http://localhost/bds/php/uploads/20180104/26a0675e8972a966a93bd722c2ec7fd6.png', '', '', 'http://localhost/bds/php/uploads/20171228/a68764868bfc87782032978815db1a3c.png', '90', '2017-12-28 16:50', '7');
INSERT INTO `bds_service` VALUES ('6', '二次拆装零担忧', '', 'http://localhost/bds/php/uploads/20180104/2f94016a8d23eeeb3fe6374a950a1f83.png', '', '', 'http://localhost/bds/php/uploads/20171228/6886d073384e2f3d1140f82417f12922.png', '90', '2017-12-28 16:50', '8');
INSERT INTO `bds_service` VALUES ('7', '免费测量', '', 'http://localhost/bds/php/uploads/20180104/b00c8d6634e2e754fb23f6da481caa84.png', '', '', 'http://localhost/bds/php/uploads/20171228/59619d4b5c1b47984d0b1bd702f008fe.png', '90', '2017-12-28 16:51', '9');
INSERT INTO `bds_service` VALUES ('8', '免费设计', '', 'http://localhost/bds/php/uploads/20180104/7d2292449e0ccfe3e9254281b506131c.png', '', '', 'http://localhost/bds/php/uploads/20171228/1c989e969d4ef45bc5ffb9471a21163f.png', '90', '2017-12-28 16:52', '10');
INSERT INTO `bds_service` VALUES ('15', '校训、模式、专业', '', 'http://localhost/bds/php/uploads/20180109/50d5c07f0e4502ba289f5d08e0ade68c.png', '<p>学明白、练到位、技艺精、勿忘本</p><p>&nbsp;&nbsp;&nbsp;&nbsp;学院坚持以实用和发展为导向，以学员能够成为专业人员为目标，注重学员实际应用能力的培养，采用理论与实践相结合、所学即所用的培训理念和模拟实训的教学模式，让学员一学就用，一用就通。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;院现设置五大专业：商业发展、店面管理、衣柜设计、店面导购、衣柜安装。每个专业又设置基础课程和专业课程。</p>', '', 'http://localhost/bds/php/uploads/20180109/32bf7473f87c6f100742594307a1cf60.png', '88', '2018-01-09 11:12', '2');
INSERT INTO `bds_service` VALUES ('16', '师资、远景', '', 'http://localhost/bds/php/uploads/20180109/2e7c6f3c32b69e3d981be4e1f02c6aa7.png', '<p>&nbsp;&nbsp;&nbsp;&nbsp;学院拥有专业的师资力量，现有专兼职教师十多名，师资主要为企业内部富有实践经验的中高层管理人士和专业技术骨干以及行业内资深专家队伍。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;学院立足衣柜专业人才培养，面向全国百得胜经销商，为经销商打造专业的人才队伍，提高店面管理水平和服务质量。学院努力构建体系健全、风格独特、设施良&nbsp;&nbsp;&nbsp;&nbsp;好、功能齐全、积极进取的学习环境，力争把学院办成行业内专业人才的摇篮。</p>', '', 'http://localhost/bds/php/uploads/20180109/16a724b6d51e0dc29904968cc75999ca.png', '88', '2018-01-09 11:15', '3');

-- ----------------------------
-- Records for `bds_shou_ye`
-- ----------------------------
INSERT INTO `bds_shou_ye` VALUES ('1', '产品分类', '0', '', '', 'http://localhost/bds/php/uploads/20171228/ec531e23953d6f21f41bb43a33f6918b.png', '', '<p>首页信息产品分类背景图
 &nbsp;</p>', '1', '2017-12-28 14:04');
INSERT INTO `bds_shou_ye` VALUES ('2', '品牌故事', '0', '', '', 'http://localhost/bds/php/uploads/20171228/05103da176ab3702dea4fb5ea1ff3a18.png', '', '<p>品牌故事背景图<br/></p>', '2', '2017-12-28 14:07');
INSERT INTO `bds_shou_ye` VALUES ('3', '发展历程', '0', '', '', 'http://localhost/bds/php/uploads/20171228/11bcb15303103743ffabb02bbffb2d72.png', '', '<p>发展历程背景图<br/></p>', '3', '2017-12-28 14:07');
INSERT INTO `bds_shou_ye` VALUES ('4', '品牌文化', '0', '', '', 'http://localhost/bds/php/uploads/20171228/18bf4fdd652a9f92eee9688cc24e179c.png', '', '<p>品牌文化背景图<br/></p>', '4', '2017-12-28 14:08');
INSERT INTO `bds_shou_ye` VALUES ('5', '客服服务部分', '0', '', '', 'http://localhost/bds/php/uploads/20171228/888c8cdebe8f6ba74a4118deeb594d86.png', '', '<p>客服服务部分<br/></p>', '5', '2017-12-28 14:09');
INSERT INTO `bds_shou_ye` VALUES ('6', '产品中心banner', '64', '', '', 'http://localhost/bds/php/uploads/20171229/a8c337e29da4288410e4fed80a654212.png', '', '', '6', '2017-12-29T10:15:17.680Z');
INSERT INTO `bds_shou_ye` VALUES ('7', '品牌中心banner', '65', '', '', 'http://localhost/bds/php/uploads/20171229/05acaa8a11306c05b78520bc69c3805b.png', '', '<p>精湛工艺 至亲品质</p>', '7', '2017-12-29 18:16');
INSERT INTO `bds_shou_ye` VALUES ('8', '服务中心banner', '66', '', '', 'http://localhost/bds/php/uploads/20171229/1a8a13ca1d6d428deedebcabca0ea3b7.png', '', '', '8', '2017-12-29T10:17:31.899Z');
INSERT INTO `bds_shou_ye` VALUES ('9', '新闻中心banner', '67', '', '', 'http://localhost/bds/php/uploads/20171229/9ea5ce8243db9f042d2de0b4243e6cef.png', '', '', '9', '2017-12-29T10:18:25.771Z');
INSERT INTO `bds_shou_ye` VALUES ('10', '招商中心banner', '68', '', '', 'http://localhost/bds/php/uploads/20171229/d7bbd389aed128bf64e05b575c2aa707.png', '', '', '10', '2017-12-29T10:19:44.003Z');

-- ----------------------------
-- Records for `bds_system_config`
-- ----------------------------
INSERT INTO `bds_system_config` VALUES ('1', 'SYSTEM_NAME', '百得胜后台管理系统', '0', '1');
INSERT INTO `bds_system_config` VALUES ('2', 'SYSTEM_LOGO', 'http://localhost/bds/php/uploads/20180103/ebdac47348266ae2876a1c423f59765e.png', '0', '1');
INSERT INTO `bds_system_config` VALUES ('3', 'LOGIN_SESSION_VALID', '3600000', '0', '1');
INSERT INTO `bds_system_config` VALUES ('4', 'IDENTIFYING_CODE', '0', '0', '1');
INSERT INTO `bds_system_config` VALUES ('5', '  LOGO_TYPE', '', '0', '1');
INSERT INTO `bds_system_config` VALUES ('6', 'COPY_RIGHT', '粤ICP证12029134号', '0', '1');
INSERT INTO `bds_system_config` VALUES ('7', 'BEI_AN', '粤ICP备12029134', '0', '1');
INSERT INTO `bds_system_config` VALUES ('8', 'KEY_WORD', ' 木纹移门衣柜(欧洲红木)三格均分_木纹系列_百得胜官网，平安的家，百得胜全屋定制，定制您平安的家，无醛添加，环保衣柜', '0', '1');
INSERT INTO `bds_system_config` VALUES ('9', 'DESCRIPTION', '木纹移门衣柜(欧洲红木)三格均分_木纹系列_百得胜官网，平安的家，百得胜全屋定制，定制您平安的家，无醛添加，环保衣柜', '0', '1');
INSERT INTO `bds_system_config` VALUES ('10', 'SYSTEM_LOGO_M', 'http://localhost/bds/php/uploads/20180103/134f6d2232cd416dee6b0086f02ede44.png', '0', '1');

-- ----------------------------
-- 日期：2018-01-09 16:33:12
-- 仅用于测试和学习,本程序不适合处理超大量数据
-- ----------------------------

-- ----------------------------
-- Table structure for `bds_admin_access`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_access`;
CREATE TABLE `bds_admin_access` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `bds_admin_group`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_group`;
CREATE TABLE `bds_admin_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `rules` varchar(4000) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Table structure for `bds_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_menu`;
CREATE TABLE `bds_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '上级菜单ID',
  `title` varchar(32) DEFAULT '' COMMENT '菜单名称',
  `en_title` varchar(255) NOT NULL COMMENT '产品分类的英文名',
  `url` varchar(127) DEFAULT '' COMMENT '链接地址',
  `nav` varchar(50) DEFAULT '0' COMMENT '前台导航路径',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `menu_type` tinyint(4) DEFAULT NULL COMMENT '菜单类型',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `rule_id` int(11) DEFAULT NULL COMMENT '权限id',
  `module` varchar(50) DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL COMMENT '三级菜单吗',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='【配置】后台菜单表';

-- ----------------------------
-- Table structure for `bds_admin_post`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_post`;
CREATE TABLE `bds_admin_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '岗位备注',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `status` tinyint(5) DEFAULT '1' COMMENT '状态1启用,0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Table structure for `bds_admin_rule`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_rule`;
CREATE TABLE `bds_admin_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `name` varchar(100) DEFAULT '' COMMENT '定义',
  `level` tinyint(5) DEFAULT NULL COMMENT '级别。1模块,2控制器,3操作',
  `pid` int(11) DEFAULT '0' COMMENT '父id，默认0',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态，1启用，0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
-- Table structure for `bds_admin_structure`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_structure`;
CREATE TABLE `bds_admin_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='公司结构表';

-- ----------------------------
-- Table structure for `bds_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_user`;
CREATE TABLE `bds_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) DEFAULT NULL COMMENT '管理后台账号',
  `password` varchar(100) DEFAULT NULL COMMENT '管理后台密码',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `create_time` int(11) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `structure_id` int(11) DEFAULT NULL COMMENT '部门',
  `post_id` int(11) DEFAULT NULL COMMENT '岗位',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态,1启用0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
-- Table structure for `bds_brand`
-- ----------------------------
DROP TABLE IF EXISTS `bds_brand`;
CREATE TABLE `bds_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '案例分类',
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_estonian_ci DEFAULT NULL,
  `type` varchar(50) NOT NULL COMMENT '所属分类',
  `content` text NOT NULL,
  `order` int(11) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '0不推送1推送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- ----------------------------
-- Table structure for `bds_contact`
-- ----------------------------
DROP TABLE IF EXISTS `bds_contact`;
CREATE TABLE `bds_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `hotline` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `posts` varchar(11) NOT NULL COMMENT '邮编',
  `hremail` varchar(50) DEFAULT NULL,
  `backimage` varchar(255) DEFAULT NULL,
  `create_time` varchar(50) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) DEFAULT '2' COMMENT '1公司总/分部2其他',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='分公司表';

-- ----------------------------
-- Table structure for `bds_friend`
-- ----------------------------
DROP TABLE IF EXISTS `bds_friend`;
CREATE TABLE `bds_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Table structure for `bds_joins`
-- ----------------------------
DROP TABLE IF EXISTS `bds_joins`;
CREATE TABLE `bds_joins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '所属分类',
  `en_title` varchar(255) NOT NULL COMMENT '英文标题',
  `title` varchar(255) NOT NULL COMMENT '条目标题',
  `pic` varchar(255) NOT NULL COMMENT '图标',
  `img` varchar(255) NOT NULL COMMENT '优势图',
  `content` text NOT NULL,
  `order` int(11) NOT NULL,
  `create_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='招商加盟表';

-- ----------------------------
-- Table structure for `bds_measure`
-- ----------------------------
DROP TABLE IF EXISTS `bds_measure`;
CREATE TABLE `bds_measure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tel` varchar(25) NOT NULL,
  `ordertime` varchar(25) NOT NULL COMMENT '预约时间',
  `address` varchar(255) NOT NULL COMMENT '预约地址',
  `status` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='预约测量表';

-- ----------------------------
-- Table structure for `bds_news`
-- ----------------------------
DROP TABLE IF EXISTS `bds_news`;
CREATE TABLE `bds_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pid` int(11) NOT NULL COMMENT '新闻分类',
  `content` text,
  `listpic` varchar(255) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `read_num` int(11) NOT NULL COMMENT '阅读次数',
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '1推送0不推送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='新闻动态观点表';

-- ----------------------------
-- Table structure for `bds_order`
-- ----------------------------
DROP TABLE IF EXISTS `bds_order`;
CREATE TABLE `bds_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(11) NOT NULL COMMENT '订单号',
  `status` varchar(55) NOT NULL COMMENT '-1 不存在，0在发货，1已发货',
  `time` varchar(32) NOT NULL,
  `ip` varchar(25) NOT NULL,
  `login_ip` varchar(25) NOT NULL,
  `num` int(3) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='模拟订单表';

-- ----------------------------
-- Table structure for `bds_product`
-- ----------------------------
DROP TABLE IF EXISTS `bds_product`;
CREATE TABLE `bds_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '产品分类id',
  `litpic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `en_title` varchar(255) NOT NULL COMMENT '产品英文名称',
  `subtitle` varchar(255) NOT NULL COMMENT 'banner右下角标题',
  `desc` text NOT NULL COMMENT '描述',
  `desc2` text NOT NULL COMMENT '描述信息第2行',
  `content` text,
  `status` varchar(50) NOT NULL COMMENT '推送状态',
  `create_time` varchar(50) NOT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Table structure for `bds_service`
-- ----------------------------
DROP TABLE IF EXISTS `bds_service`;
CREATE TABLE `bds_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_title` varchar(255) DEFAULT NULL,
  `vice_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `content` text,
  `banner` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL COMMENT '所属部分',
  `create_time` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='服务表';

-- ----------------------------
-- Table structure for `bds_shou_ye`
-- ----------------------------
DROP TABLE IF EXISTS `bds_shou_ye`;
CREATE TABLE `bds_shou_ye` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `path` int(11) DEFAULT NULL COMMENT '子类id',
  `type` int(11) DEFAULT NULL,
  `backimage` varchar(255) DEFAULT NULL COMMENT '栏目banner',
  `url` varchar(100) DEFAULT NULL COMMENT '栏目链接',
  `content` text,
  `order` int(11) DEFAULT NULL COMMENT '栏目排序',
  `create_time` varchar(50) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='网站首页表';

-- ----------------------------
-- Table structure for `bds_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `bds_system_config`;
CREATE TABLE `bds_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(50) DEFAULT '',
  `value` varchar(500) DEFAULT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned DEFAULT '0' COMMENT '配置分组',
  `need_auth` tinyint(4) DEFAULT '1' COMMENT '1需要登录后才能获取，0不需要登录即可获取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `参数名` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='【配置】系统配置表';

-- ----------------------------
-- Records for `bds_admin_access`
-- ----------------------------
INSERT INTO `bds_admin_access` VALUES ('2', '15');
INSERT INTO `bds_admin_access` VALUES ('3', '16');
INSERT INTO `bds_admin_access` VALUES ('4', '16');

-- ----------------------------
-- Records for `bds_admin_group`
-- ----------------------------
INSERT INTO `bds_admin_group` VALUES ('15', '普通会员', '1,2,3,4,5,6,7,8,9,10,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,61,62,63,28,29', '0', '最厉害的组别', '1');
INSERT INTO `bds_admin_group` VALUES ('16', '超级管理员', '10,30,31,32,33,34,35,36,37,28,29,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,61,62,63', '', '超级管理员', '1');

-- ----------------------------
-- Records for `bds_admin_menu`
-- ----------------------------
INSERT INTO `bds_admin_menu` VALUES ('52', '0', '网站后台管理系统', '', '', '', '', '1', '0', '1', '10', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('53', '52', '系统配置', '', '', '', '', '1', '1', '1', '61', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('54', '53', '菜单管理', '', '/home/menu/list', '', '', '1', '1', '1', '21', 'Administrative', 'menu');
INSERT INTO `bds_admin_menu` VALUES ('55', '53', '系统参数', '', '/home/config/add', '', '', '1', '3', '1', '13', 'Administrative', 'systemConfig');
INSERT INTO `bds_admin_menu` VALUES ('56', '53', '权限规则', '', '/home/rule/list', '', '', '1', '2', '1', '13', 'Administrative', 'rule');
INSERT INTO `bds_admin_menu` VALUES ('57', '52', '组织架构', '', '', '', '', '1', '5', '1', '63', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('58', '57', '岗位管理', '', '/home/position/list', '', '', '1', '0', '1', '31', 'Administrative', 'position');
INSERT INTO `bds_admin_menu` VALUES ('59', '57', '部门管理', '', '/home/structures/list', '', '', '1', '0', '1', '39', 'Administrative', 'structures');
INSERT INTO `bds_admin_menu` VALUES ('60', '57', '用户组管理', '', '/home/groups/list', '', '', '1', '0', '1', '47', 'Administrative', 'groups');
INSERT INTO `bds_admin_menu` VALUES ('61', '52', '账户管理', '', '', '', '', '1', '0', '1', '62', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('62', '61', '账户列表', '', '/home/users/list', '', '', '1', '0', '1', '55', 'Administrative', 'users');
INSERT INTO `bds_admin_menu` VALUES ('63', '52', '内容管理', '', '', '', '', '1', '2', '1', '64', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('64', '63', '产品中心', '', '/home/product/list', '/product', '', '1', '1', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('65', '63', '品牌中心', '', '/home/brand/list', '/mark', '', '1', '2', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('66', '63', '服务中心', '', '/home/service/list', '/serve', '', '1', '3', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('67', '63', '新闻资讯', '', '/home/news/list', '/news', '', '1', '4', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('68', '63', '招商加盟', '', '/home/joins/list', '/join', '', '1', '5', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('70', '52', '其他管理', '', '', '', '', '1', '3', '1', '66', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('71', '70', '首页管理', '', '/home/shouye/list', '', '', '1', '1', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('72', '70', '数据库管理', '', '/home/mysqls/list', '', '', '1', '3', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('73', '70', '友情链接', '', '/home/friend/list', '', '', '1', '2', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('74', '70', '预约测量', '', '/home/measure/list', '', '', '1', '3', '1', '66', 'Administrative', 'casetype');
INSERT INTO `bds_admin_menu` VALUES ('77', '64', '儿童房系列', 'CHILDREN ROOM', '/home/product/child/list', '/product/child', 'http://localhost/bds/php/uploads/20180104/d83ab9bf4ad1f62077e4a8de72df0d7c.png', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('78', '64', '套房系列', 'FULL ROOM', '/home/product/taofang', '/product/taofang', 'http://localhost/bds/php/uploads/20180104/09f6864bfee91739dce22e3405e9b43b.png', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('79', '64', '书房系列', 'READING ROOM', '/home/product/book/list', '/product/book', 'http://localhost/bds/php/uploads/20180104/e433a5e29cf7f5bebe918a310f7a3f95.png', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('80', '64', '客厅系列', 'LIVING ROOM', '/home/product/live/list', '/product/live', 'http://localhost/bds/php/uploads/20180104/961d7e1a5eee9b0a4920ce123e69751f.png', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('81', '64', '卧室系列', 'SLEEP ROOM', '/home/product/bedroom/list', '/product/bedroom', 'http://localhost/bds/php/uploads/20180104/6d7ecdceee3114a4f82a4d5a90984dc3.png', '1', '5', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('82', '64', '实木家具', 'SOLID WOOD FUMITURE', '/home/product/shimu/list', '/product/shimu', 'http://localhost/bds/php/uploads/20180104/4abe8e3ae61c11a9ef6df744bd13702e.png', '1', '6', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('83', '64', '定制家居', 'CUSTOMIZED FUMITURE', '/home/product/order/list', '/product/order', 'http://localhost/bds/php/uploads/20180104/e927f13f8e1644498d0b7aea50232e25.png', '1', '7', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('84', '65', '品牌故事', '', '/home/brand/story/list', '/brand/story', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('85', '65', '品牌历程', '', '/home/brand/course/list', '/brand/course', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('86', '65', '品牌荣誉', '', '/home/brand/honor/list', '/brand/honor', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('87', '65', '企业文化', '', '/home/brand/culture/list', '/brand/culture', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('88', '66', '百得胜学院', '', '/home/service/school/list', '/service/school', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('89', '66', '预约测量', 'MAKE MEASURE', '/home/service/measure/list', '/service/measure', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('90', '66', '定制服务', 'WHOLEHEARTEDLY SERVICE', '/home/service/customized/list', '/service/customized', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('91', '66', '订单查询', 'ORDERS INQUIRY', '/home/service/order/list', '/service/order', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('92', '67', '公司咨询', '', '/home/news/ask/list', '/news/ask', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('93', '67', '各地动态', '', '/home/news/dynamic/list', '/news/dynamic', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('94', '67', '活动专题', '', '/home/news/topic/list', '/news/topic', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('95', '67', '行业资讯', '', '/home/news/industry/list', '/news/industry', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('96', '68', '品牌优势', 'INVESTMENT TO JOIN', '/home/joins/advantage/list', '/joins/advantage', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('97', '68', '加盟条件', 'JOINING CONDITION', '/home/joins/condition/list', '/joins/condition', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('98', '68', '加盟流程', 'JOINING CONDITION', '/home/joins/process/list', '/joins/process', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('99', '68', '加盟支持', 'SERVICE SUPPORT', '/home/joins/support/list', '/joins/support', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('100', '63', '联系我们', '', '/home/contact/list', '/call', '', '2', '7', '1', '67', 'Administrative', 'category');

-- ----------------------------
-- Records for `bds_admin_post`
-- ----------------------------
INSERT INTO `bds_admin_post` VALUES ('5', '后端开发工程师', '', '1484706862', '1');
INSERT INTO `bds_admin_post` VALUES ('6', '前端开发工程师', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('7', '设计师', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('11', '文案策划', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('12', '产品助理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('15', '总经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('20', '项目经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('25', '职能', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('26', '项目助理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('28', '人事经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('29', 'CEO', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('30', '品牌策划', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('31', '前端研发工程师', '', '1484706863', '1');

-- ----------------------------
-- Records for `bds_admin_rule`
-- ----------------------------
INSERT INTO `bds_admin_rule` VALUES ('10', '系统基础功能', 'admin', '1', '0', '1');
INSERT INTO `bds_admin_rule` VALUES ('11', '权限规则', 'rules', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('13', '规则列表', 'index', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('14', '权限详情', 'read', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('15', '编辑权限', 'update', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('16', '删除权限', 'delete', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('17', '添加权限', 'save', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('18', '批量删除权限', 'deletes', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('19', '批量启用/禁用权限', 'enables', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('20', '菜单管理', 'menus', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('21', '菜单列表', 'index', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('22', '添加菜单', 'save', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('23', '菜单详情', 'read', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('24', '编辑菜单', 'update', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('25', '删除菜单', 'delete', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('26', '批量删除菜单', 'deletes', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('27', '批量启用/禁用菜单', 'enables', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('28', '系统管理', 'systemConfigs', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('29', '修改系统配置', 'save', '3', '28', '1');
INSERT INTO `bds_admin_rule` VALUES ('30', '岗位管理', 'posts', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('31', '岗位列表', 'index', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('32', '岗位详情', 'read', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('33', '编辑岗位', 'update', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('34', '删除岗位', 'delete', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('35', '添加岗位', 'save', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('36', '批量删除岗位', 'deletes', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('37', '批量启用/禁用岗位', 'enables', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('38', '部门管理', 'structures', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('39', '部门列表', 'index', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('40', '部门详情', 'read', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('41', '编辑部门', 'update', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('42', '删除部门', 'delete', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('43', '添加部门', 'save', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('44', '批量删除部门', 'deletes', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('45', '批量启用/禁用部门', 'enables', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('46', '用户组管理', 'groups', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('47', '用户组列表', 'index', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('48', '用户组详情', 'read', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('49', '编辑用户组', 'update', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('50', '删除用户组', 'delete', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('51', '添加用户组', 'save', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('52', '批量删除用户组', 'deletes', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('53', '批量启用/禁用用户组', 'enables', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('54', '成员管理', 'users', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('55', '成员列表', 'index', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('56', '成员详情', 'read', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('57', '删除成员', 'delete', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('59', '管理菜单', 'Adminstrative', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('61', '系统管理二级菜单', 'systemConfig', '1', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('62', '账户管理二级菜单', 'personnel', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('63', '组织架构二级菜单', 'structures', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('64', '栏目管理二级菜单', 'Class', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('65', '栏目列表', 'index', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('66', '其他管理二级菜单', 'other', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('67', '栏目管理三级菜单', 'three', '3', '59', '1');

-- ----------------------------
-- Records for `bds_admin_structure`
-- ----------------------------
INSERT INTO `bds_admin_structure` VALUES ('57', '企业微信', '0', '1');
INSERT INTO `bds_admin_structure` VALUES ('58', '设计部', '57', '1');
INSERT INTO `bds_admin_structure` VALUES ('59', '网络部', '57', '1');

-- ----------------------------
-- Records for `bds_admin_user`
-- ----------------------------
INSERT INTO `bds_admin_user` VALUES ('1', 'admin', 'd93a5def7511da3d0f2d171d9c344e91', '', '', '超级管理员', '1', '5', '1');
INSERT INTO `bds_admin_user` VALUES ('4', 'admin123', '8b6804ff6d620e1ede6b8289a99fbf8d', '超级管理员', '1509611337', 'lxw', '59', '', '1');

-- ----------------------------
-- Records for `bds_brand`
-- ----------------------------
INSERT INTO `bds_brand` VALUES ('1', '84', 'http://localhost/bds/php/uploads/20171228/a892eb5d4d885ee204ac9c2c3fcf1cc5.png', 'BRAND STORY FURNITURE', '', '<p>百得胜成立于2001年4，环保全屋定制家具实力品牌，上市公司德尔未来（股票代码：002631）全资子公司，定制家具行业标准起草参编单位，歌手“平安”品牌代言。</p><p>百得胜“广州+苏州+成都+铁岭”全国4大生产基地战略布局落定，广州工厂拥有近7万平米标准化厂房，苏州工厂拥有132亩生产基地，于2015年5月正式投产；占地700亩成都生产基地将于2017年启动，第四大生产基地铁岭已置地。公司在岗职工1500余人，其中研发设计人员80余人。</p><p>百得胜凭借过硬的工艺，进口的德国豪迈、温康纳生产设备，好看、好用、环保的品质，赢得了权威机构的肯定并通过ISO国际质量体系认证、环境管理体系认证、国家十环认证、绿家居联盟认证等专业认证，深获千万家庭的信赖。</p><p>广州百得胜家居有限公司2017年开启“板木+板式+橱柜+床垫”小家居战略，整体研发生产实力更上一层楼。</p>', '1', '2017-12-27 17:52', '0');
INSERT INTO `bds_brand` VALUES ('2', '87', 'http://localhost/bds/php/uploads/20171228/e67705a7c0609baa3b74f898e91a566b.png', 'BRAND STORY FURNITURE', '', '<article><h5>使命</h5><h6>为顾客创造价值，为员工谋求福利</h6></article><article><h5>愿景</h5><h6>让百得胜成为市场推崇的家具品牌</h6></article><article><h5>使命</h5><h6>专注、创新、和谐</h6></article>', '2', '2017-12-27 17:56', '0');
INSERT INTO `bds_brand` VALUES ('3', '85', 'http://localhost/bds/php/uploads/20171228/0164e13141746790a6d6b798b683879d.png', 'BRAND STORY FURNITURE', '', '<h5>2001</h5><h6>百得胜依托资本平台，跨界融合，开启“板木+板式+橱柜+床垫”小家居战略。</h6>', '3', '2001-12-28 10:10', '0');
INSERT INTO `bds_brand` VALUES ('4', '85', 'http://localhost/bds/php/uploads/20171228/d6fa24b1fcb61e1bcbf855764e734a0e.png', 'BRAND STORY FURNITURE', '', '<h5>2002</h5><h6>百得胜加入上市公司——德尔未来（股票代码：002631）；成为国家击剑队高级赞助商；投资设立“苏州韩居实木定制家居有限公司”。</h6>', '4', '2002-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('5', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2003</h5><h6>签约歌星平安担任品牌形象代言人；苏州工厂一期正式投产。</h6>', '5', '2003-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('6', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2004</h5><h6>产品基础年，围绕环保、功能、设计全面优化产品体系，推行实施千万大商1314经营计划。</h6>', '6', '2004-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('7', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2005</h5><h6>招商基础年，开启金字塔经营结构模式，渠道网点增长560%。</h6>', '7', '2005-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('8', '86', 'http://localhost/bds/php/uploads/20171228/31d51c58386990ca5c09be825b47383d.png', 'BRAND STORY FURNITURE', '', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514445356130859.png" title="1514445356130859.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356310689.png" title="1514445356310689.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445391133230.png" title="1514445391133230.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356130859.png" title="1514445356130859.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356310689.png" title="1514445356310689.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445391133230.png" title="1514445391133230.png"/></p>', '7', '2006-12-28 10:16', '0');

-- ----------------------------
-- Records for `bds_contact`
-- ----------------------------
INSERT INTO `bds_contact` VALUES ('1', '百得胜', '广州市天河区天河北路906号高科大厦A座12楼', '<p>百得胜公司信息</p>', '（020）85274395/38319021', '400-629-2629', 'lxiaoling@paterson.com.cn', '510545', 'hr@ye2005.com', 'http://192.168.1.138/vuethink/php/uploads/20171211/d7539a258f166ca1615960dc46421925.jpg', '2017-11-27 20:17', '1', '1');

-- ----------------------------
-- Records for `bds_friend`
-- ----------------------------
INSERT INTO `bds_friend` VALUES ('1', '百得胜', 'http://www.paterson.com.cn', '1', '2017-11-30 18:10');
INSERT INTO `bds_friend` VALUES ('2', '德尔未来旗下全资子公司', 'http://www.paterson.com.cn', '22', '2017-11-30 18:12');

-- ----------------------------
-- Records for `bds_joins`
-- ----------------------------
INSERT INTO `bds_joins` VALUES ('1', '96', 'TEN ADVANTACES', '三大基地', 'http://localhost/bds/php/uploads/20180108/85ce66e23fe20687468578c21d99da38.png', 'http://localhost/bds/php/uploads/20180108/953188338f650d0ddb8b74064af2d505.png', '<p>规模化生产基地，百得胜战略布局“广州+苏州+成都+铁岭+天津”全国5大生产基地。纯德式精工生产体系-成熟高效-节约物流成本-缩短交货期。广州总部工厂，德国豪迈生产线及温康纳吸塑机。2015年苏州工厂一期75亩，投资1亿，聘请德国舒乐公司设计，7月正式投产。成都生产基地已征地，将于2015年正式启动，2016年投入生产。</p>', '1', '2017-12-29 15:19');
INSERT INTO `bds_joins` VALUES ('2', '96', 'TEN ADVANTACES', '硬件软件', 'http://localhost/bds/php/uploads/20180108/93cd2ae7c0a7c01fc3e740edfef9a0e7.png', 'http://localhost/bds/php/uploads/20180109/ce56061a2a91f1635ddcaa1a67247b73.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '2', '2017-12-29 15:15');
INSERT INTO `bds_joins` VALUES ('3', '96', 'TEN ADVANTACES', '产品创新', 'http://localhost/bds/php/uploads/20180108/a2b5f48d55d0134faa592f60bb27841a.png', 'http://localhost/bds/php/uploads/20180109/ffd4d8ae6c50cc48370b2d6767a6b54d.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '3', '2017-12-29 15:22');
INSERT INTO `bds_joins` VALUES ('4', '96', 'TEN ADVANTACES', '活动策划', 'http://localhost/bds/php/uploads/20180108/1f365c1860366b04aff5619b5c52f669.png', 'http://localhost/bds/php/uploads/20180109/cb632cbd5514827ee0456cff1027a3bc.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '4', '2017-12-29 15:23');
INSERT INTO `bds_joins` VALUES ('5', '96', 'TEN ADVANTACES', '三大支持', 'http://localhost/bds/php/uploads/20180108/b9f753744036bf6ccc9f0bc9f4d427d5.png', 'http://localhost/bds/php/uploads/20180109/b75587b6a9c76e96533adf11ca1969ff.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '5', '2017-12-29 15:23');
INSERT INTO `bds_joins` VALUES ('6', '96', 'TEN ADVANTACES', '终端形象', 'http://localhost/bds/php/uploads/20180108/e93c04d76dce4b721bd02612c42f649f.png', 'http://localhost/bds/php/uploads/20180109/9a2fc0ce98deb8f0f23d5283483d8da4.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '6', '2017-12-29 15:24');
INSERT INTO `bds_joins` VALUES ('7', '96', 'TEN ADVANTACES', '环保基材', 'http://localhost/bds/php/uploads/20180108/4227bbc24a4897331a3846eed438dbc9.png', 'http://localhost/bds/php/uploads/20180109/1bdd51cbc10859e5e6cf0ad3b21b174f.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '7', '2017-12-29 15:24');
INSERT INTO `bds_joins` VALUES ('8', '96', 'TEN ADVANTACES', '进口配件', 'http://localhost/bds/php/uploads/20180108/cb3f1d02e4d1a0a54b0b98ec264d31b8.png', 'http://localhost/bds/php/uploads/20180109/20e8652bce6ea85b8bbcc2ef1dab8582.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '8', '2017-12-29 15:25');
INSERT INTO `bds_joins` VALUES ('9', '96', 'TEN ADVANTACES', '培训学员', 'http://localhost/bds/php/uploads/20180108/c83cfc79d9a0f2ed52101c3e2719fbb3.png', 'http://localhost/bds/php/uploads/20180109/5ae64ffffa795c01abde5d025f368228.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '9', '2017-12-29 15:26');
INSERT INTO `bds_joins` VALUES ('10', '96', 'TEN ADVANTACES', '六心服务', 'http://localhost/bds/php/uploads/20180108/b201a804350326dbb4fdb1862f1e6f6c.png', 'http://localhost/bds/php/uploads/20180109/cae134a22ee9a6a05ad1826b9a2fb06c.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '10', '2017-12-29 15:26');
INSERT INTO `bds_joins` VALUES ('11', '97', 'JOINING CONDITION', '热爱家具事业，具备合法资格的法人或者自然人', 'http://localhost/bds/php/uploads/20180108/dbe24c4dca18fba9c3f9cbaf0b723f28.png', 'http://localhost/bds/php/uploads/20180108/bf91f9a8dfffbed65c68eb7cf027fb8f.png', '<p>加盟内容<br/></p>', '11', '2017-12-29 15:29');
INSERT INTO `bds_joins` VALUES ('12', '97', 'JOINING CONDITION', '具有一定的文化程度，具备经营管理，运作和持续发展的能力', 'http://localhost/bds/php/uploads/20180108/01216de361bc92bbdd55787b34e72584.png', 'http://localhost/bds/php/uploads/20180109/731d5ea659c5e083e78f8fcab2ad7a7b.jpg', '<p>加盟内容</p>', '12', '2017-12-29 15:32');
INSERT INTO `bds_joins` VALUES ('13', '97', 'JOINING CONDITION', '具有一定的资金中等发达水平地级及以上城市自有资金必须在40万以上', 'http://localhost/bds/php/uploads/20180108/3823ead486071bfed4c6e72ce1f1f642.png', 'http://localhost/bds/php/uploads/20180109/304892c19cb552eaa12ee6ce5508b432.jpg', '<p>加盟内容</p>', '13', '2017-12-29 15:40');
INSERT INTO `bds_joins` VALUES ('14', '97', 'JOINING CONDITION', '有良好的经营条件，符合公司要求的好店面，舍得在装修上花功夫和本钱', 'http://localhost/bds/php/uploads/20180108/8942ed883caad40f333e8f368d668ac6.png', 'http://localhost/bds/php/uploads/20180109/44774e90b3669d05af25d49d1b05c22a.jpg', '<p>加盟内容</p>', '14', '2017-12-29 15:42');
INSERT INTO `bds_joins` VALUES ('15', '98', 'JOINING PROCESS', '建立联系，初步达成合作意向', '', '', '<p>加盟内容</p>', '15', '2017-12-29T07:53:21.539Z');
INSERT INTO `bds_joins` VALUES ('16', '98', 'JOINING PROCESS', '填写申请表', '', '', '<p>盟内容</p>', '16', '2017-12-29 15:54');
INSERT INTO `bds_joins` VALUES ('17', '98', 'JOINING PROCESS', '区域经理考核，来公司实地考察了解', '', '', '<p>加盟内容</p>', '17', '2017-12-29 15:56');
INSERT INTO `bds_joins` VALUES ('18', '99', 'SERVICE SUPPORT', '服务支持', 'http://localhost/bds/php/uploads/20171229/8d24155f3627d332b5a2115bd78ae7a0.png', 'http://localhost/bds/php/uploads/20180108/bfae27130bff397bf53225f47d9f493e.png', '<p>百得胜学院隶属于广州百得胜家居有限公司，是专门为百得胜经销商打造专业人才队伍的基地。学院秉承“全面为经销商提供专业知识和培养专业人才”的办学理念，立足于行业发展和经销商人员管理模式，成立专业的培训团队，组织开发有效实用的培训课程，全方位为经销商培养专业人才，帮助经销商打造人才竞争力，通过专业人才提供专业服务，从而使经销商赢得市场及忠实客户。<br/></p>', '27', '2017-12-29 15:56');
INSERT INTO `bds_joins` VALUES ('19', '0', '33', '333', '', '', '<p>33<br/></p>', '33', '2018-01-06T09:28:24.288Z');
INSERT INTO `bds_joins` VALUES ('20', '97', '', '店面人员配置与素质', 'http://localhost/bds/php/uploads/20180108/821076ae6fce03a7125247fa5fc8a4db.png', 'http://localhost/bds/php/uploads/20180109/0ff7f91c2b27454f04310fb20c510c06.jpg', '<p>加盟内容</p>', '14', '2018-01-08 17:05');
INSERT INTO `bds_joins` VALUES ('21', '98', '', '签订加盟合同', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '18', '2018-01-08T09:08:47.522Z');
INSERT INTO `bds_joins` VALUES ('22', '98', '', '店面装修上样', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '19', '2018-01-08T09:09:31.252Z');
INSERT INTO `bds_joins` VALUES ('23', '98', '', '店面样品设计的确认，并交纳货款', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '20', '2018-01-08T09:10:35.715Z');
INSERT INTO `bds_joins` VALUES ('25', '98', '', '工作人员岗前培训', '', '', '<p>加盟内容</p>', '21', '2018-01-08 18:28');
INSERT INTO `bds_joins` VALUES ('26', '98', '', '店面布局空间设计，施工设计样品设计等', '', '', '<p>加盟内容</p>', '22', '2018-01-08T10:30:14.122Z');
INSERT INTO `bds_joins` VALUES ('27', '98', '', '交纳品牌加盟费与品牌保证金', '', '', '<p>·百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '23', '2018-01-09T03:46:28.487Z');
INSERT INTO `bds_joins` VALUES ('28', '98', '', '店面的装饰布置', '', '', '<p>加盟内容</p>', '24', '2018-01-09T03:47:07.715Z');
INSERT INTO `bds_joins` VALUES ('29', '98', '', '开业前指导与专卖店正式开业', '', '', '<p>加盟内</p>', '25', '2018-01-09T03:48:32.269Z');
INSERT INTO `bds_joins` VALUES ('30', '98', '', '总部定期跟进运营与指导支持', '', '', '<p>加盟内</p>', '26', '2018-01-09T03:49:36.745Z');
INSERT INTO `bds_joins` VALUES ('31', '99', '', '服务支持2', 'http://localhost/bds/php/uploads/20180109/85393cb302ab0e1176789e8d634ab1bd.png', '', '<p>百得胜历经16年市场沉淀，深谙行业无促不销之妙诀：实施终端精准营销，因需特设常规促销及大型主题促销。</p><p><strong>大型主题促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全年度、大力度在全国开展“百得胜无醛添加衣柜系列”大型主题会议营销活动。220计划、360计划、4场大型促销计划，简称234帮扶政策。</p><p><strong>日常常规促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;每年315、五一、十一、元旦等重大节假日开展全国统一促销活动；确保月月有主题、周周有活动</p><p><br/></p>', '28', '2018-01-09 11:53');
INSERT INTO `bds_joins` VALUES ('32', '99', '', '服务支持3', 'http://localhost/bds/php/uploads/20180109/376a4dc84163dc10459f5e3dafa63fcb.png', 'http://localhost/bds/php/', '<p>百得胜历经16年市场沉淀，深谙行业无促不销之妙诀：实施终端精准营销，因需特设常规促销及大型主题促销。</p><p><strong>大型主题促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全年度、大力度在全国开展“百得胜无醛添加衣柜系列”大型主题会议营销活动。220计划、360计划、4场大型促销计划，简称234帮扶政策。</p><p><strong>日常常规促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;每年315、五一、十一、元旦等重大节假日开展全国统一促销活动；确保月月有主题、周周有活动</p><p><br/></p>', '30', '2018-01-09T03:56:18.125Z');

-- ----------------------------
-- Records for `bds_measure`
-- ----------------------------
INSERT INTO `bds_measure` VALUES ('24', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('25', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('26', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('27', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('28', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('29', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');

-- ----------------------------
-- Records for `bds_news`
-- ----------------------------
INSERT INTO `bds_news` VALUES ('1', '专注膜压定制哪家强？百得胜膜压新品横空出世', '92', '<p><span style="font-size:16px"><span style="color:#dd4822">中国环保定制家居先行者——百得胜膜压新品盛大发布，开启全屋定制竞争新序幕。</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 11月30日，“啄木鸟的烦恼”2017年百得胜膜压新品发布会在广东从化韩居丽格膜压馆隆重召开。膜压新品是百得胜在板式、实木（板木）之外，开辟的又一产品线，是百得胜发展新的里程碑。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514451920113535.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>立于风口 膜压新品横空出世</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 近年来，家居市场成为消费升级的前沿阵地。消费者对家居生活品质的追求不断提高，对家具的质量、质感追求也是越来越高。与此同时， 艺术、设计、时尚等精神消费元素越来越多地走进家庭。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;板式家具虽然风格多变，但对追求品质格调的消费者来说已非首选；实木家具因其价格高昂，又让人望而却步；而随着性价比优越的“膜压”产品出现，定制家具的竞争格局也悄然发生变化——“板木”定制开始崭露头角。此时，由膜压之父陈家驹倾情打造的匠心之作、情怀之作——百得胜膜压系列新品应运而生。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/2_副本.jpg"/><br/><span style="font-size:16px">发布会现场宾朋满座</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此次，百得胜近800平米全是膜压产品的实木馆正式落成，意味着百得胜正式占领全屋定制竞争新的制高点。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514451923138428.jpg"/></p><p><span style="font-size:16px">全是膜压产品的实木馆</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;本次发布会膜压新品展馆涉及六大品类十大空间产品定制解决方案，达28+款式，满足9大人群定制需求。从0-5岁咿呀学语的小孩、到6-12岁的儿童、13岁至毕业的学生、单身的奋斗青年、新婚的二人世界、为人父母的三口之家、家成业就的人生赢家、品味人生的魅力中年、三世同堂的大家庭，都能体验百得胜定制家居的魅力。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “<strong>膜压”优势在哪里</strong>？</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/4_副本.jpg"/></p><p><span style="font-size:16px">百得胜执行总裁张健先生致辞</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜品牌负责人认为，传统板式、膜压产品以及实木（板木）就好像宝马的3系、5系以及7系。板式产品占最大量的销售份额，设计经典、功能实用。膜压产品定位是中端消费人群，对于设计、产品细节也更多追求。实木（板木）定位高端市场，<span style="font-family: 宋体;font-size: 14px">工艺日臻成熟</span>。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/5_副本.jpg"/></p><p><span style="font-size:16px">韩居丽格总裁芶良朝先生分享膜压成果</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;在板式家具的创新求变的路上，膜压技术的出现成为了关键。不同于实木容易开裂变形，膜压产品集成了板式家具实用性，且多以高密度板作为基材，不论什么地方物理性能都十分稳定。此外，实木产品因含水率等天然属性在非混油工艺的情况经常会有色差，但膜压则基本不存在这个问题。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;外观设计和价格是消费者最关心的问题。理论上来讲实木定制产品可以实现绝大部分外观效果，但是在做时尚类的产品表现时就有些不合适，价格很昂贵。但膜压产品有类似钢琴烤漆的高光类产品，也有一些水波粼粼效果的3D效果类产品，也有与实木近似度极高的“混”油类产品……而有些价格不到实木定制的一半，甚至部份款式可能仅为实木定制的1/3。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/6_副本.jpg"/></span></p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/7_副本.jpg"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 对标实木产品，膜压产品的优势明显。就物理性能来说，膜压产品相对稳定，不会开裂。韩居丽格供应给百得胜的膜压产品是用密度在810-820KG/立方米的高密度板作为基材，十分稳定。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/8_副本.jpg"/><br/><span style="font-size:16px">中国膜压之父陈家驹先生分享膜压工艺特性</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;百得胜膜压产品还具有媲美实木的外观与手感。发布会现场，通过观察与触摸，经销商家人及媒体朋友们仍感叹难以分辨百得胜膜压板与实木，陈家驹先生对此做出详细的技术说明。目前，百得胜美洲实木转膜压同款与实木的混油工艺产品视觉效果、触觉效果无限接近。膜压板耐脏、耐划、防火的性能，现场也一一演示。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/9_副本.jpg"/></p><p><span style="font-size:16px">膜压板防火性能现场演示</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 环保方面，百得胜使用无醛添加环保板材和水性胶、水性膜，打造更安醛的定制产品。此外，膜压产品还具有生产周期短、饰面效果好，外观时尚美观、性价比高等等优势。由此可见，好的生活，并不贵。百得胜始终致力于为消费者创造“品质好生活”。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;<strong> 专注膜压定制哪家强？</strong></span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/10_副本.jpg"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 作为中国人自己的定制家具品牌，百得胜一直致力于把好看、好用、环保的产品奉献给国人。本次发布会，百得胜领先业界推出多达28款膜压新品，不仅风格多、造型多、品类多、色彩多，每一件新品都是艺术品般的存在。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 目前，在全屋定制家具市场上，膜压产品越来越受到消费者的青睐。韩居丽格自身强大的生产实力＋百得胜专业的全屋定制实力，领衔膜压门板定制，专业专注成熟。在行业内率先实现基材密度板膜压、美洲实木和实木油漆三种工艺的互转，达到目前业内最高的工艺水准。<br/>其成都＋广州＋天津三大实木工厂，规模化定制实木、膜压、移门三大系列1000余款门型。</span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>百得胜&amp;韩居丽格 实力不容小觑</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 麦田的丰收来自肥沃的土壤与精心培育。<strong>百得胜丰富的膜压产品和精湛工艺则得益于强大的产能实力和研发优势。</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;<span style="color:#4444bb">| 研发优势</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;百得胜研发团队基于市场、基于用户、基于未来需求等多个纬度，研发新品。2017年，百得胜与韩居丽格完美融合，实现实木及膜压两大系列近30款新品的快速迭代。而韩居丽格从几十万到数百万的膜压产品生产线，到自动化、信息化等工业4.0符号性设备，为膜压产品总出货量行业第一奠定基础。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “<strong>实木膜压相互转化</strong>”：百得胜在业界率先实现了实木与膜压工艺互转。也就是说，百得胜每一款实木门型，都能对应一个同样样式的膜压门型。同一风格，不同配置，消费者买家具像买车一样来选择高配或标配。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 质美膜压，媲美实木。百得胜的部分膜压产品已与实木的混油工艺产品视觉效果、触觉效果完全一样，同时还拥有超高性价比、更短的生产周期等优势。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:#3c3cc4">| 产能优势</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 产能方面，百得胜&amp;韩居丽格在成都、广州、苏州、天津等多个生产基地，更大产能释放空间，规模化定制实木、膜压、移门三大系列1000余款门型，让百得胜的膜压产品在交货周期上获得极大保障。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/11_副本.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 膜皮的丰富可变性及全行业推动的技术革新，膜压产品在未来有非常广阔的市场前景，将是作为全屋定制领域产品的新增长点。此番，百得胜全屋定制携手韩居丽格，领衔膜压门板定制，实现膜压与实木工艺的互转定制，无疑将占据中国定制家居市场制高点！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><span style="font-family: 宋体;font-size: 14px"><span style="font-family:宋体">&nbsp;&nbsp;&nbsp; 质</span></span>美膜压 给自己更好的，来一起见证百得胜的产品创新力吧！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/dece288f29b0b3e360af06228b1150cc.jpg', '2017/12/28', '佚名', '1', '0', '0');
INSERT INTO `bds_news` VALUES ('2', '百得胜&松博宇强强联合 共赢“板木定制”未来', '92', '<p><span style="font-size:16px">&nbsp;&nbsp; 【前言】国民实木情节根深蒂固，却苦于其价格昂贵。随着国民消费升级催生出行业新风口——“板木定制”。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452085214083.jpg"/><br/><span style="font-size:16px"><strong>签约仪式</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年9月20日，百得胜&amp;松博宇战略合作签约仪式暨媒体见面会在中国·广州隆重举行。百得胜执行总裁张健先生与松博宇董事长詹雄光先生进行签约，正式对外宣布双方携手合作，这不是一场简单的发布会，这是一场志同而气合的战略发布会。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “志同而气合,鱼川泳而鸟云飞也。”松博宇 “原木板式化”与百得胜“板木＋实木”差异化板木定制理念不谋而合，二者战略携手，实现共赢。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 立于板木风口 未来已来</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 中国作为全球第二大经济体，国民消费力在多个领域都暗藏着繁荣之势。随着经济发展和消费升级，催生行业新风口——板木定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜，16年专注环保定制家居，全屋板木定制引领者，推出“板木+实木”的板木定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “板木+实木”的板木定制，不再单纯地追逐全实木，理性分析家居产品的实际使用，继全实木产品之后再推板木定制。</span><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; </strong></span></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 尊重专业</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
松博宇公司成立于2001年7月，专注于木材应用领域十多年，2014年被认定为国家高新技术企业，具备从原木选材到研发、生产、销售再到家居产品配套和服务的完整产业链，其自主研发产品为科技木类、生态有机板类、3D艺术板类、浮雕板及装饰木枋类等，部分产品畅销全球60多个国家和地区，在技术创新、产品内涵、市场价值和品牌竞争力等方面均居于行业前沿。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452086169932.jpg"/></p><p><span style="font-size:16px">百得胜执行总裁张健先生讲话</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 作为原木板式化的倡领与践行者，松博宇精选北美进口原材，配合极致的原木板式化加工工艺，产品走向了世界上六十多个国家和地区，从选材到工艺，从平面到立体，始终站在木业行业潮流的前端。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452087905259.jpg"/></p><p><span style="font-size:16px">松博宇董事长詹雄光先生讲话</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此番百得胜携手松博宇，松博宇自身强大的生产实力＋百得胜专业的全屋定制实力，更加高效整合上下游产业链，降低成本，实现不一样的板木定制。而百得胜全国千店和“OSA”电商模式打通线上与线下渠道之间的双向引流及对接，更是让板木落地开花，共赢板木定制大未来。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 不断夯实小家居大战略</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2016年，百得胜选择一种全新形式的资本之路——加入老牌上市企业德尔未来。在获得资本加持之后，百得胜开始加速布局，大力发展小家居战略。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜的“小家居战略”不同于当下热门的“大家居”，不盲目追逐企业的快速扩张，而是在坚持自有优势产品定制衣柜的基础上，发展全屋定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
而除衣柜产品以外的延伸品类产品百得胜选择了与行业内拥有优势积淀且有发展潜力，已经拥有一定实力的优质企业联手，从2016年开始，百得胜就先后与实木门板企业韩居丽格、橱柜企业丹得橱柜牵手，如今携手松博宇不断夯实小家居战略，此后百得胜还将牵手更多的周边产品企业。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>百得胜+松博宇 走出板木定制差异化</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 如果说，此前百得胜与实木定制强者韩居丽格的携手，让百得胜实木定制梦想终得以实现。那么，此次携手全屋原木定制供应商松博宇，用原木板式化的方式进行全屋定制生产，必然让百得胜走出一条差异化的板木定制之路。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 国民实木情节根深蒂固，却苦于其价格昂贵。那么该怎样实现呢？原木板式化走出了一条不一样的路。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452088471542.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 传统的实木定制一般都是对一块实木原木进行加工，成本比较高。而作为一家专注木业研发制造达到28年的企业，松博宇结合现阶段国内外工业发展的有利条件，提出把原木做成板式化，满足国民根深蒂固的实木情节，这与百得胜的实木梦想不谋而合。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在定制领域，从某种程度上来说，原木板式化是工业4.0的新风向之一。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在强调环保主概念的当下，优质的基材与丰富的产品线是企业竞争的不二砝码，百得胜始终坚持环保主张，更是在洞察市场的深度需求后，提出“板木定制”的战略性手段。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年3月，百得胜全新实木定制馆全面对外亮相，推出“板木+实</span><span style="font-size:16px">木”的“板木定制”概念，不单纯地追逐全实木，而是理性分析产品的实际使用，各取所长，结合实木与板木的双重优势，满足更多家庭及市场的需求。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年6月，百得胜以“好柜配好门”为主题，发布新品美洲实木柜体，与百得胜此前推出的美洲实木柜门形成了完整套系。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/920/图片2.JPG"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 美洲实木柜体的推出，让百得胜形成了“美洲实木柜体+美洲实木门板”此类独创的板木定制环保+抗变形技能满分的定制家具。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 至此，在板式定制+实木定制领域内，百得胜已经成长为值得期待的黑马。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此番携手，更是独辟蹊径，走出一条差异化发展之路，无疑是为百得胜再添腾飞的新助力，专业合作，共赢板木定制未来。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452089680461.jpg"/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/6d3fd3d47de06602566428044e7fc130.png', '2017-12-28', '佚名', '2', '5', '0');
INSERT INTO `bds_news` VALUES ('3', '百得胜T6项目特训营圆满结营', '92', '<p><span style="font-size:16px"><strong>打造标准·专业定制</strong>，经过三天四夜高强度特训，200余位百得胜精英精诚协作、全力拼搏，展示出了优异的学习成果，为此次T6项目特训画上了圆满的句号。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片1.JPG"/></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 胜在培训·赢在服务</strong>，在此次T6终端体验营销系统特训中，培训导师针对性地对百得胜服务方面进行了透彻的分析和团队服务标准化的培训。三天四夜，百得胜学员们一对一完成通关考核，收获满满！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片2.JPG"/></p><p><span style="font-size:16px">T6项目特训营开营授旗仪式</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片3.JPG"/></span></p><p><span style="font-size:16px">全体学员紧张备考中</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片4.JPG"/><br/><span style="font-size:16px">学员们一对一通关考核</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片5.JPG"/><br/><span style="font-size:16px">娱乐精彩一刻</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片6.JPG"/><br/><span style="font-size:16px">产品话术情景模拟</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片7.JPG"/><br/><span style="font-size:16px">聚精会神学习中</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片8.JPG"/></span></p><p><span style="font-size:16px">笔试考核通关</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 不是结束·而是开始</strong>，百得胜T6特训虽然暂告一段落，但这不是终点，而是起点，200余位华丽蜕变的精英们将迅速回到自己的岗位，用所学的知识、所理解的系统做出更出色的发挥，带领各自团队开启新的征程！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片9.JPG"/></p><p><span style="font-size:16px">冠军团队风采</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 引爆终端·破浪前行</strong>，此次百得胜T6特训，针对终端店面的四大痛点，点对点爆破，突破经营瓶颈，用干货解决营销没系统、团队难培养、终端没业绩、培训没效果的难题。百得胜5A+T6组合拳连续出击，快速引爆终端业绩，谁与争锋！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片10.JPG"/><br/><span style="font-size:16px">誓师大会</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年百得胜小家居战略全面推进中，T6项目特训营的培训成果将大大提升百得胜团队战斗力和品牌竞争力，为下半年的全国推广打下坚实基础。系统运营+体验营销，百得胜军团已经吹响2017年胜利的号角，战斗吧小伙伴！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/753e76e0fffc1271ddd1e2e8209d7ec6.png', '2017/12/28', '佚名', '3', '0', '0');
INSERT INTO `bds_news` VALUES ('4', '百得胜张健：成品OR定制？用户说了算！', '92', '<p><span style="font-size:16px">第38届名家具展暨中国(东莞)国际定制家居展在8月11日拉开帷幕，沉淀十八年后，东莞家具展已经进入三展联动时代，而在第十九个年头，首届中国(东莞)国际定制家居展览会无疑成为东莞展最大亮点。在万众瞩目的展会上，慧亚传媒记者采访到百得胜执行总裁张健先生，下面，请跟随记者的镜头走进这家优质企业吧。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/888/图片1.JPG"/><br/>专访嘉宾：百得胜执行总裁 张健</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：张总您好，百得胜是首次参加成品定制的展览吗？参展类型与以往存在些微差异，对此，企业作了哪些准备？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：百得胜是第一次参加成品家具展，大家都知道，成品家具在珠三角乃至全国地区都有影响力，而定制家居又发源于建材，双方间有着千丝万缕的关系。而如今，成品往定制走，定制往大家居去走，相互之间迟早需要碰面，所以这次我们都相当“诚惶诚恐”，毕竟，成品家具在工艺、设计上都比定制家居、建材行业成熟，所以这次，我们是抱着学习的态度来参展的。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片2.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片3.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片4.png"/><br/>参展人潮络绎不绝</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：成品家具与定制市场打得火热，而本次展会的举办也正好印证了这一点，您怎么看待两者的共融？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：现在的市场竞争激烈，成品和定制融合，或者定制有更多的成品化方向，成品有更多定制化的方向，市场的最终走向还是依靠用户的选择来判定，基于用户的需求，两者都有各自的优缺点，不管成品还是定制市场，用户说好，才算真的好。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片5.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片6_副本.png"/><br/>百得胜膜压工艺托斯卡纳新品展示</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：如果用一个关键词来形容您在百得胜近几年的总体情况，您会选择用什么词呢？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：“责任”，近几年，百得胜所走的路与其他定制品牌不尽相同，挑战和机遇并存。进入资本市场之后，因为体量偏小，面对资本市场的竞争和压力很大，同行对百得胜也投放了相当大的预期，因此，要肩负起对公司、团队、乃至于整个经销商体系的责任，百得胜必须要以更好的表现展露人前，对大家有一个合理交代，所以我认为责任是关键词。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：“无人工厂”的生产模式渐渐走红，机器正慢慢地代替人工，那您觉得在这样的趋势下这种模式有什么利和弊呢？</span></strong></p><p><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：我认为，不能独立地以产业或行业的特点去看待“无人工厂”的模式，从根本上还是要从两个层面解读，首先是从用户的角度出发，不管是无人化还是机械化，当它的发展能够贴合用户需要，那便是合适的；其次，从产业链的角度思考，无人化或者智能化是涉及“术”的层面，技术，从本质上说，技术的升级是围绕着企业的经营活动去服务的，经营活动是否需要技术更新？要如何更新？这都要企业从更高的维度去思考，从技术层面上进行反思，想法成熟以后再以AI、智能、无人设备去替代人工，完成升级布局。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
技术的升级、器材的配备都需要讲求深度和适用性，这也与行业的高度、宽度有关。即使企业把设备制造得非常精良，但是通过该设备制造出来的产品不受用户喜欢，或者它被更高阶的行业配套所覆盖掉，那么，哪怕是三头六臂的顶尖设备也起不到一丁点作用。当别人都使用枪了，即使你拥有最锋利的宝剑又如何？</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片7.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片8.png"/></span></p><p><span style="font-size:16px">参展人潮络绎不绝</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：智能化又逐渐兴起，你觉得目前的智能家居对于消费者和企业自身发展而言，是一块鸡肋吗？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：智能家居不是鸡肋，它是未来的必然发展趋势。我认为，未来智能家居的入口将是手机，近几年定制家居发展迅猛，是因为它抢占了家具建材行业的入口，而智能的入口不是家居，是手机。企业、顾客能通过移动端时刻掌握智能化的动态，完成功能性的操作，大大便于消费者的生活，相信不久的将来普及度会有所提升。而针对用户的使用习惯进行合理的研发，将是企业决胜的关键。</span></p><p><span style="font-size:16px">&nbsp;</span><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：张总，下半年百得胜的发展关键词是什么？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：扎好马步，苦练内功，少说多干。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：感谢张总一番精彩解读，祝愿百得胜能走出更强劲的姿态！</span></strong></p><p><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：谢谢大家。</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/b010641eddf3df313768641f253cb8a7.png', '2017-12-28', '佚名', '4', '0', '0');
INSERT INTO `bds_news` VALUES ('5', '偶像来了! 黄家强来了！百得胜第一大店来了！', '93', '<p><span style="font-size:16px">2016年11月6日<br/>百得胜第一大店<br/>百得胜温州千方旗舰店将盛大开业<br/>Beyond成员<strong>黄家强</strong>亲临助阵<br/>倾力打造摇滚音乐盛会<br/>摇出实惠、摇出惊喜<br/>摇出百万现金送送送</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）107_副本.jpg"/></p><p>&nbsp;<br/><span style="font-size:16px">金秋时节，再现光辉岁月<br/>携手Beyond成员黄家强<br/>全力打造温州摇滚狂欢节<br/><strong>一起致敬永不退场的青春<br/>致敬Beyond</strong></span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）169.png"/></p><p>&nbsp;</p><p><span style="font-size:16px">继平安、辛晓琪、周海媚、陈德容......<br/>百得胜再次为您打造超强音乐盛会</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）209.png"/></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>11月6日<br/>百得胜温州千方旗舰店盛大开业<br/>Beyond成员黄家强摇滚音乐会<br/><span style="color:#f70938">花椒、一直播同步直播</span></strong></span></p><p><span style="font-size:16px"><strong>敬请关注，一起狂欢！</strong></span></p><p><br/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/ded4605581a7b0bfc3c386ae14a7b58e.png', '2017/12/28', '佚名', '5', '8', '0');
INSERT INTO `bds_news` VALUES ('14', '百得胜助力集团公司德尔未来打造“中国足球未来星”南京体验活动进行中', '93', '<p><span style="font-size:16px"><br/></span></p><p><span style="font-size:16px"><span style="font-size:16px">百得胜助力集团公司德尔未来携手国际冠军杯足球赛，共同助力打造“中国足球未来星”体验活动落地南京</span></span><br/><span style="font-size:16px">南京40度的高温也抵不住球迷的热情</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜为集团公司德尔未来作为国际冠军杯中国赛高级赞助商助力，为广大喜爱百得胜环保定制的顾客朋友带去了众多优惠及福利！价值999元的冠军杯南京站限量球票幸运降临一波百得胜顾客朋友身上。</span></p><p><span style="font-size:16px">国际冠军杯南京赛999元门票幸运得主在百得胜不亦说乎！</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 更多福利，更多放心，更多开心，尽在百得胜专卖店......喜获国际冠军杯门票的幸运儿，今晚就可以凭票开开心心去现场看球，面见国际巨星，更可近距离一饱一大波足球宝贝的靓丽身影眼福，今晚，南京奥体中心见。</span></p><p>&nbsp;</p><p><br/></p><p><br/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/425b4567276a7b6e3b20d462bc98bac4.JPG', '2018-01-08', '原创', '6', '1', '0');
INSERT INTO `bds_news` VALUES ('15', '平安“震撼”登场 好声音唱响广西百得胜', '93', '<p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西1.jpg"/></span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>来了、来了，平安来了！！！</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 等待了一个多月，终于等到今天！5月31日下午百得胜代言人——实力派歌手平安莅临广西首家无醛添加衣柜馆将盛大开业活动现场火热献唱，为百得胜广西首家无醛添加衣柜馆开业优惠活动助威！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西2.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西图3.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西4.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜、富安居相关领导以及广西十多家媒体见证了百得胜广西首家无醛添加衣柜馆盛大开业的剪彩仪式。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西5.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西6.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西7.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西8.jpg"/></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>疯狂、震撼——“好声音”嗨翻全场</strong><br/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 平安携百得胜环保衣柜“价临”广西富安居中庭！广西富安居建材城内人气火爆，中庭、各楼层都挤满了大批歌迷粉丝、顾客朋友们，人气极其火爆！<br/></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 现场平安演唱《云淡风轻》、《洋葱》等多首经典歌曲，一首《我爱你中国》更是震撼全场，全场气氛彻底达到沸点，现场粉丝们之尖叫疯狂！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西9.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 平安出现活动现场，全场热情急速引爆！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西10.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 好声音震撼疯狂的平安粉丝团</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西11.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;活动现场奶爸、奶妈也追星</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西12.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 现场座无虚席，现场十分火爆</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西13.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>开业优惠更疯狂</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 为了庆祝百得胜衣柜广西首家无醛添加馆开业活动，除了邀请当红歌手平安现场献唱，活动现场开业优惠更疯狂——20万现金现场返现、无醛添加系列满5000抵10000、现场购买赠送价值880元鞋柜、与明星平安近距离合影留念……</span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜广西首家无醛添加衣柜馆盛大开业活动圆满成功！大家不仅享受到了优厚的贵宾服务，享受到工厂直供的价格，还感受到了歌手平安现场带给众人的震撼视听盛宴。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西14.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西15.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西16.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西17.png"/></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
百得胜精研环保定制衣柜14年，尤其在近年，通过不断的努力，打造出无醛添加系列定制家具。百得胜衣柜，优选无醛添加密度板、颗粒板、实木芯，凭借极致环保的无醛添加材质，获得越来越多消费者厚爱追捧！2015年，百得胜携手平安，以无醛添加环保产品为核心，努力打造“平安的家，百得胜定制”的环保家居。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西18.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西19.jpg"/></span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/1ad5f148a23ad52be41ac8ad602a4dfa.jpg', '2018-01-08', '原创', '7', '0', '0');
INSERT INTO `bds_news` VALUES ('16', '哈尔滨，平安来了! 百得胜火了！', '93', '<p><span style="font-size:16px">4月25日，百得胜哈尔滨旗舰店盛大开业。歌手平安亲临现场助阵，为开业优惠活动加油助威，活动现场声势浩大，气氛火爆，创造百得胜开业活动新传奇！</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安1.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安2.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 高空彩球飘扬，现场众人热忱静候平安</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安3.jpg"/></span><span style="font-size:16px"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 气势雄伟的气飘与彩旗，格外惹人关注</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安4.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现场座无虚席，十分火爆</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安5.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排队签单长龙，见头不见尾</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安6.png"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 哈尔滨，惊现北京，深圳的平安粉丝团</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安7.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平安一到场，引众人纷纷抢拍</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安9.jpg"/><br/></span><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平安现场献歌，响彻现场</span><span style="font-size:16px"><br/>&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 本次哈尔滨百得胜旗舰店盛大开业活动圆满成功！现场，大家不仅享受到了优厚的贵宾服务，享受到工厂直供的价格，还感受到了歌手平安现场带给众人的视听盛宴......众消费者纷纷表示不虚此行！</span><span style="font-size:16px"><br/>&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜衣柜经历14的时间沉淀，不仅在行业内享有“环保定制衣柜”的美誉，还获得消费者的广泛认可和各权威机构的认证。用事实见证实力，书写环保定制新传奇。</span>&nbsp;</p><p><span style="font-size:16px"><br/>&nbsp;&nbsp;&nbsp; 平安的家，百得胜定制。再见亦再见！425哈尔滨，再见！51武汉再见，不见不散！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/7237891f8f20f163945513e7653d868e.png', '2018-01-08', '百得胜', '8', '1', '0');
INSERT INTO `bds_news` VALUES ('17', '中国平安万里行——成都首站！4.25, GO百得胜', '93', '<p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里1.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>2015年4月25日下午13:00<br/></strong>&nbsp;&nbsp;&nbsp; <strong>成都高新区都会路99号富森?美家居建材MALL负一楼中庭百得胜衣柜。</strong><br/>&nbsp;&nbsp;&nbsp; 百得胜工厂质检总监亲临成都，给成都的消费者分享真正的家居装修环保知识！让你了解什么叫甲醛0释放时代，如何让家人生活在一个安全无忧的绿色空间！</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里2.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里3.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里4.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里5.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里6.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里7.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里8.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span style="color:#e6421a">4.25，来成都百得胜衣柜，为您省到家！</span></strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里9.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里10.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里11.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里12.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜衣柜进驻成都后，环保健康家居理念逐渐深入人心。<br/>&nbsp;&nbsp;&nbsp; 百得胜全屋收纳定制要做的，就是持之以恒地研发环保定制衣柜产品，为消费者打造安全健康的家居生活。<br/><strong>&nbsp;&nbsp;&nbsp; 更多套餐，敬请到店详询....</strong><br/><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动VIP专线：028-61559394</strong> </span></span></p><p><span style="font-size:16px;color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动时间：2015年4月25日</strong> </span></p><p><span style="font-size:16px"><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>签到时间：下午13:00-13:30</strong> </span></span></p><p><span style="font-size:16px"><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动地点：成都高新区都会路99号富森?美家居建材MALL负一楼中庭</strong></span></span><span style="font-size:16px"> </span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里13.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里14.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里15.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里16.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里17.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里18.jpg"/><br/></span><span style="font-size:16px"><br/></span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/97db874c92269efa2485e255355222c5.jpg', '2018-01-08', '百得胜', '9', '0', '0');
INSERT INTO `bds_news` VALUES ('18', '女神真都来了，让大家与百得胜有了更契合的 “情感密码”', '93', '<p><span style="font-size:16px">大事件,女神真都来南宁百得胜了！！！<br/>惊呆了！抢疯了！嗨疯了！爽翻了！</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神1.jpg"/></span></p><p><br/><span style="font-size:16px">8月30日，娱乐气旋席卷南宁。<br/>南宁富安居百得胜，<br/>双强飓“疯”来袭，<br/>两大台湾实力派唱将，<br/>疗伤系情歌天后辛晓琪来了，<br/>“小张惠妹”简语卉也真来了！<br/>齐聚南宁，亲临南宁富安居百得胜衣柜，<br/>同台飙歌，以歌会友，情动南宁，律动青春情怀。<br/>火力助推南宁百得胜第6家无醛添加馆火爆开业，<br/>一起为百得胜环保而歌。<br/>南宁百得胜衣柜，<br/>迎来了三伏天后的又一次热潮。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神2.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>女神潇洒进场，彻底点燃了现场观众粉丝们的热情</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在一片片热烈的欢呼声中，两大女神潇洒入场，点燃了场观众粉丝们的热情。现场的观众朋友们纷纷拍照录像，现场顿时火爆,引起粉丝疯狂尖叫。<br/>&nbsp;&nbsp;&nbsp; 辛晓琪与“阿妹”登台开唱，互相飙歌。噢噢噢……天后嗓喉一开，赢得观众阵阵掌声，<br/>嗨翻现场！</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神3.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神4.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神5.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神6.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神7.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神8.jpg"/></span></p><p><br/><span style="font-size:16px">两大女神，以情为律，为百得胜环保而歌，<br/>一首风靡一代人的《味道》，<br/>一首一辈子的《深情难了》，<br/>还有浪漫甜蜜的《玫瑰花》，<br/>相伴一生的《牵手》<br/>引爆大家最难忘的记忆高潮，<br/>动情的味道，幸福的玫瑰，一辈子的情缘与牵手<br/>扣动了粉丝们的心弦，<br/>骚动了大家的心灵之魂，<br/>让大家在感情里顿悟.......<br/>两大女神飙歌旋风与百得胜开业抢购“疯”汇，合成最动情的情风，<br/>动听的情歌，开业的盛惠、现场的娱乐互动......高潮不停歇，狂欢不停止！<br/>让更多的消费者与百得胜衣柜有了契合的 “情感密码”。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神9.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神10.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>“小张惠妹”简语卉为大家献歌抽奖</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神11.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>情歌天后辛晓琪为环保，提笔写下“平安的家，百得胜定制”</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神12.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>哎哟，百得胜因环保而出尽了风头，爽歪歪！</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神13.jpg"/></span></p><p><br/><strong><span style="font-size:16px">与情歌天后合影，好嗨森！</span></strong></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 热情碰撞的火花，高大上的月饼现场领，红包现场大派送，豪礼现场任性抽......为南宁客户献上了视觉与听觉的璀璨盛宴。大家现场在百得胜畅享无醛的《味道》，《牵手》共建平安的家......到场客户高兴而来，满载而归，好嗨森！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/495c7251dc8de2490f87def31ea1fde4.jpg', '2018-01-08', '百得胜', '10', '1', '0');

-- ----------------------------
-- Records for `bds_order`
-- ----------------------------
INSERT INTO `bds_order` VALUES ('1', 'thinkphp', 'thihp', '1515380795', '192.168.1.138', '192.168.1.138', '0', '0');
INSERT INTO `bds_order` VALUES ('2', 'THINKPHP', 'THINKPHP', '1515383817', '192.168.1.138', '192.168.1.138', '5', '0');
INSERT INTO `bds_order` VALUES ('3', 'THINKPHP', '44', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('4', '', 'a:0:{}', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('5', 'THINKPHP', 'a:1:{s:8:"order_id";s:8:"THINKPHP";', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('6', 'LXW', 'a:2:{s:8:"order_id";s:3:"LXW";s:6:"', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('7', 'LXW', 'a:2:{s:8:"order_id";s:3:"LXW";s:6:"status";s:3:"123";}', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('8', 'LXW', '202cb962ac59075b964b07152d234b70', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('9', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379029', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('10', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379179', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('11', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379227', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('12', 'LXW', '123', '1515379313', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('13', 'LXW', '123', '1515379412', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('14', 'LXW', '1', '1515379439', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('15', 'LXW', 'hahhh', '1515379463', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('16', 'LXW', '', '1515379595', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('17', 'LXW', 'sdddd', '1515379616', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('18', 'LXW', 'cd3f8d1414719727286eda32fda4b96d', '1515379728', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('19', 'LXW', 'sdddd', '1515383841', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('20', 'LXW', 'sdddd', '1515383844', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('21', 'LXW', 'sdddd', '1515383906', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('22', 'LXW', 'sdddd', '1515383952', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('23', 'LXW', 'sdddd', '1515384086', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('24', 'LXW', 'sdddd', '1515384125', '192.168.1.138', '', '0', '1515384125');

-- ----------------------------
-- Records for `bds_product`
-- ----------------------------
INSERT INTO `bds_product` VALUES ('1', '77', 'http://localhost/bds/php/uploads/20171228/bb968e4538193927f5aa2b7645c5e2fa.png', '儿童房01', 'CHILDREN ROOM', '精湛工艺  执勤工艺', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514345417111456.jpg" title="1514345417111456.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514345417881463.jpg" title="1514345417881463.jpg"/></p>', '1', '2017-12-27 11:30', '1');
INSERT INTO `bds_product` VALUES ('2', '77', 'http://localhost/bds/php/uploads/20171228/7f8a4705e229604b5a0b07cbb5dcc477.png', '儿童房02', 'CHILDREN ROOM', '简约大气的设计，搭配自然细腻的木纹', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514345997399851.jpg" title="1514345997399851.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514345997835332.jpg" title="1514345997835332.jpg"/></p><p><br/></p>', '2', '2017-12-27 11:39', '7');
INSERT INTO `bds_product` VALUES ('3', '80', 'http://localhost/bds/php/uploads/20171228/34b0cb14fb3516f8e761b01da0953b0e.png', '客厅01', 'GUEST ROOM', '在美式家具基础上，融入现代设计风格', '在美式家具基础上，融入现代设计风格。古典中透露出丝丝灵动，现代中带有少许文艺。
门板线条，简洁时尚，白色为基调，融入黄色装饰部分，使产品在简洁大方的基础上增加了现代时尚气息。
既有自在不羁的个性，也在不经意中体现着休闲式的浪漫，让人体验到一种别样的轻生活、慢时光', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514355930586695.jpg" title="1514355930586695.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514355930851857.jpg" title="1514355930851857.jpg"/></p><p><br/></p>', '2', '2017-12-27 14:07', '5');
INSERT INTO `bds_product` VALUES ('4', '80', 'http://localhost/bds/php/uploads/20171228/3fac35bb7c8a86ba5fa88a0a4a9b3b5e.png', '客厅02', 'GUEST ROOM', '精湛工艺 执勤品质', '在美式家具基础上，融入现代设计风格。古典中透露出丝丝灵动，现代中带有少许文艺。
门板线条，简洁时尚，白色为基调，融入黄色装饰部分，使产品在简洁大方的基础上增加了现代时尚气息。
既有自在不羁的个性，也在不经意中体现着休闲式的浪漫，让人体验到一种别样的轻生活、慢时光', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514356445961846.jpg" title="1514356445961846.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514356445769924.jpg" title="1514356445769924.jpg"/></p><p><br/></p>', '1', '2017-12-27 14:33', '2');
INSERT INTO `bds_product` VALUES ('5', '79', 'http://localhost/bds/php/uploads/20171228/7c902985c7931eeac0becfe6f5d7572a.png', '书房系列', 'BOOKING ROOM', '精湛工艺 执勤品质', '
印象系列--B5120701新中式岭南印象-多功能房印象系列--B5120701新中式岭南印象-多功能房印象系列--B5120701新中式岭南印象-多功能房', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514428261120110.jpg" title="1514428261120110.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514428261488023.jpg" title="1514428261488023.jpg"/></p><p><br/></p>', '1', '2017-12-28 10:30', '3');
INSERT INTO `bds_product` VALUES ('6', '80', 'http://localhost/bds/php/uploads/20171228/158942b16e8cf4f7003325ee2cd2f5b3.png', '客厅系列01', 'BOOKING ROOM', '简约大气的设计，', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514431708729991.jpg" title="1514431708729991.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514431708631362.jpg" title="1514431708631362.jpg"/></p><p><br/></p>', '2', '2017-12-28 11:28', '6');
INSERT INTO `bds_product` VALUES ('7', '77', 'http://localhost/bds/php/uploads/20180104/e5150f8a337ecf3a6e37c218b9162ab4.png', '儿童房03', 'CHILDREN ROOM', 'CHILDREN ROOM', 'CHILDREN ROOMCHILDREN ROOMCHILDREN ROOM', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p>FGDF<br/></p>', '0', '2018-01-04 11:52', '8');
INSERT INTO `bds_product` VALUES ('8', '77', 'http://localhost/bds/php/uploads/20180104/7b516fdc9c6cfab8b5843ff8504fd20a.png', '儿童房04', 'CHILDREN ROOM', '儿童房04', '儿童房04儿童房04儿童房04', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p><img src="http://localhost/bds/php/ueditor/20180104/1515038177816485.png" title="1515038177816485.png"/></p><p><img src="http://localhost/bds/php/ueditor/20180104/1515038177700428.png" title="1515038177700428.png"/></p><p><br/></p>', '0', '2018-01-04 11:55', '9');

-- ----------------------------
-- Records for `bds_service`
-- ----------------------------
INSERT INTO `bds_service` VALUES ('1', '概述', '校训、模式、专业', 'http://localhost/bds/php/uploads/20180109/912d3cff130608a72ef6ce5aa26cdfd5.png', '<p class="t2 zz1">百得胜学院隶属于广州百得胜家居有限公司，是专门为百得胜经销商打造专业人才队伍的基地。学院秉承“全面为经销商提供专业知识和培养专业人才”的办学理念，立足于行业发展和经销商人员管理模式，成立专业的培训团队，组织开发有效实用的培训课程，全方位为经销商培养专业人才，帮助经销商打造人才竞争力，通过专业人才提供专业服务，从而使经销商赢得市场及忠实客户。</p><p class="t2 zz1">经过扩建后的百得胜学院教学设施齐全、设备优良，拥有1000多平米的教学场地，有公共课教室，电脑多媒体教室，安装实操教室，能同时进行设计、安装、导购等多个专业的课程，能同时容纳上百人的培训。还配套有1000多平米的公寓，为各地来学院学习的学员提供良好的住宿环境。</p><p><br/></p>', '', 'http://localhost/bds/php/uploads/20171228/c3abcee07ae9746d8001502b06ccc2f5.png', '88', '2017-12-28 16:28', '1');
INSERT INTO `bds_service` VALUES ('2', '免费送货', '', 'http://localhost/bds/php/uploads/20180104/282c87c6a29862d90503ea84605b2ddb.png', '', '', 'http://localhost/bds/php/uploads/20171228/a0c6ce31cd7ca8052774e4ca8d4b362f.png', '90', '2017-12-28 16:45', '4');
INSERT INTO `bds_service` VALUES ('3', '免费安装', '', 'http://localhost/bds/php/uploads/20180104/1f6b53852cc777c668a005a01cb63e20.png', '', '', 'http://localhost/bds/php/uploads/20171228/115e26938f6a193f8db32c130ac4a313.png', '90', '2017-12-28 16:49', '5');
INSERT INTO `bds_service` VALUES ('4', '免费维护', '', 'http://localhost/bds/php/uploads/20180104/47c9fc057f4788e7af23c910e2aef10c.png', '', '', 'http://localhost/bds/php/uploads/20171228/276702d9260bb8d273b77428c4cfc317.png', '90', '2017-12-28 16:49', '6');
INSERT INTO `bds_service` VALUES ('5', '免费维修', '', 'http://localhost/bds/php/uploads/20180104/26a0675e8972a966a93bd722c2ec7fd6.png', '', '', 'http://localhost/bds/php/uploads/20171228/a68764868bfc87782032978815db1a3c.png', '90', '2017-12-28 16:50', '7');
INSERT INTO `bds_service` VALUES ('6', '二次拆装零担忧', '', 'http://localhost/bds/php/uploads/20180104/2f94016a8d23eeeb3fe6374a950a1f83.png', '', '', 'http://localhost/bds/php/uploads/20171228/6886d073384e2f3d1140f82417f12922.png', '90', '2017-12-28 16:50', '8');
INSERT INTO `bds_service` VALUES ('7', '免费测量', '', 'http://localhost/bds/php/uploads/20180104/b00c8d6634e2e754fb23f6da481caa84.png', '', '', 'http://localhost/bds/php/uploads/20171228/59619d4b5c1b47984d0b1bd702f008fe.png', '90', '2017-12-28 16:51', '9');
INSERT INTO `bds_service` VALUES ('8', '免费设计', '', 'http://localhost/bds/php/uploads/20180104/7d2292449e0ccfe3e9254281b506131c.png', '', '', 'http://localhost/bds/php/uploads/20171228/1c989e969d4ef45bc5ffb9471a21163f.png', '90', '2017-12-28 16:52', '10');
INSERT INTO `bds_service` VALUES ('15', '校训、模式、专业', '', 'http://localhost/bds/php/uploads/20180109/50d5c07f0e4502ba289f5d08e0ade68c.png', '<p>学明白、练到位、技艺精、勿忘本</p><p>&nbsp;&nbsp;&nbsp;&nbsp;学院坚持以实用和发展为导向，以学员能够成为专业人员为目标，注重学员实际应用能力的培养，采用理论与实践相结合、所学即所用的培训理念和模拟实训的教学模式，让学员一学就用，一用就通。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;院现设置五大专业：商业发展、店面管理、衣柜设计、店面导购、衣柜安装。每个专业又设置基础课程和专业课程。</p>', '', 'http://localhost/bds/php/uploads/20180109/32bf7473f87c6f100742594307a1cf60.png', '88', '2018-01-09 11:12', '2');
INSERT INTO `bds_service` VALUES ('16', '师资、远景', '', 'http://localhost/bds/php/uploads/20180109/2e7c6f3c32b69e3d981be4e1f02c6aa7.png', '<p>&nbsp;&nbsp;&nbsp;&nbsp;学院拥有专业的师资力量，现有专兼职教师十多名，师资主要为企业内部富有实践经验的中高层管理人士和专业技术骨干以及行业内资深专家队伍。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;学院立足衣柜专业人才培养，面向全国百得胜经销商，为经销商打造专业的人才队伍，提高店面管理水平和服务质量。学院努力构建体系健全、风格独特、设施良&nbsp;&nbsp;&nbsp;&nbsp;好、功能齐全、积极进取的学习环境，力争把学院办成行业内专业人才的摇篮。</p>', '', 'http://localhost/bds/php/uploads/20180109/16a724b6d51e0dc29904968cc75999ca.png', '88', '2018-01-09 11:15', '3');

-- ----------------------------
-- Records for `bds_shou_ye`
-- ----------------------------
INSERT INTO `bds_shou_ye` VALUES ('1', '产品分类', '0', '', '', 'http://localhost/bds/php/uploads/20171228/ec531e23953d6f21f41bb43a33f6918b.png', '', '<p>首页信息产品分类背景图
 &nbsp;</p>', '1', '2017-12-28 14:04');
INSERT INTO `bds_shou_ye` VALUES ('2', '品牌故事', '0', '', '', 'http://localhost/bds/php/uploads/20171228/05103da176ab3702dea4fb5ea1ff3a18.png', '', '<p>品牌故事背景图<br/></p>', '2', '2017-12-28 14:07');
INSERT INTO `bds_shou_ye` VALUES ('3', '发展历程', '0', '', '', 'http://localhost/bds/php/uploads/20171228/11bcb15303103743ffabb02bbffb2d72.png', '', '<p>发展历程背景图<br/></p>', '3', '2017-12-28 14:07');
INSERT INTO `bds_shou_ye` VALUES ('4', '品牌文化', '0', '', '', 'http://localhost/bds/php/uploads/20171228/18bf4fdd652a9f92eee9688cc24e179c.png', '', '<p>品牌文化背景图<br/></p>', '4', '2017-12-28 14:08');
INSERT INTO `bds_shou_ye` VALUES ('5', '客服服务部分', '0', '', '', 'http://localhost/bds/php/uploads/20171228/888c8cdebe8f6ba74a4118deeb594d86.png', '', '<p>客服服务部分<br/></p>', '5', '2017-12-28 14:09');
INSERT INTO `bds_shou_ye` VALUES ('6', '产品中心banner', '64', '', '', 'http://localhost/bds/php/uploads/20171229/a8c337e29da4288410e4fed80a654212.png', '', '', '6', '2017-12-29T10:15:17.680Z');
INSERT INTO `bds_shou_ye` VALUES ('7', '品牌中心banner', '65', '', '', 'http://localhost/bds/php/uploads/20171229/05acaa8a11306c05b78520bc69c3805b.png', '', '<p>精湛工艺 至亲品质</p>', '7', '2017-12-29 18:16');
INSERT INTO `bds_shou_ye` VALUES ('8', '服务中心banner', '66', '', '', 'http://localhost/bds/php/uploads/20171229/1a8a13ca1d6d428deedebcabca0ea3b7.png', '', '', '8', '2017-12-29T10:17:31.899Z');
INSERT INTO `bds_shou_ye` VALUES ('9', '新闻中心banner', '67', '', '', 'http://localhost/bds/php/uploads/20171229/9ea5ce8243db9f042d2de0b4243e6cef.png', '', '', '9', '2017-12-29T10:18:25.771Z');
INSERT INTO `bds_shou_ye` VALUES ('10', '招商中心banner', '68', '', '', 'http://localhost/bds/php/uploads/20171229/d7bbd389aed128bf64e05b575c2aa707.png', '', '', '10', '2017-12-29T10:19:44.003Z');

-- ----------------------------
-- Records for `bds_system_config`
-- ----------------------------
INSERT INTO `bds_system_config` VALUES ('1', 'SYSTEM_NAME', '百得胜后台管理系统', '0', '1');
INSERT INTO `bds_system_config` VALUES ('2', 'SYSTEM_LOGO', 'http://localhost/bds/php/uploads/20180103/ebdac47348266ae2876a1c423f59765e.png', '0', '1');
INSERT INTO `bds_system_config` VALUES ('3', 'LOGIN_SESSION_VALID', '3600000', '0', '1');
INSERT INTO `bds_system_config` VALUES ('4', 'IDENTIFYING_CODE', '0', '0', '1');
INSERT INTO `bds_system_config` VALUES ('5', '  LOGO_TYPE', '', '0', '1');
INSERT INTO `bds_system_config` VALUES ('6', 'COPY_RIGHT', '粤ICP证12029134号', '0', '1');
INSERT INTO `bds_system_config` VALUES ('7', 'BEI_AN', '粤ICP备12029134', '0', '1');
INSERT INTO `bds_system_config` VALUES ('8', 'KEY_WORD', ' 木纹移门衣柜(欧洲红木)三格均分_木纹系列_百得胜官网，平安的家，百得胜全屋定制，定制您平安的家，无醛添加，环保衣柜', '0', '1');
INSERT INTO `bds_system_config` VALUES ('9', 'DESCRIPTION', '木纹移门衣柜(欧洲红木)三格均分_木纹系列_百得胜官网，平安的家，百得胜全屋定制，定制您平安的家，无醛添加，环保衣柜', '0', '1');
INSERT INTO `bds_system_config` VALUES ('10', 'SYSTEM_LOGO_M', 'http://localhost/bds/php/uploads/20180103/134f6d2232cd416dee6b0086f02ede44.png', '0', '1');

-- ----------------------------
-- 日期：2018-01-09 16:33:43
-- 仅用于测试和学习,本程序不适合处理超大量数据
-- ----------------------------

-- ----------------------------
-- Table structure for `bds_admin_access`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_access`;
CREATE TABLE `bds_admin_access` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `bds_admin_group`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_group`;
CREATE TABLE `bds_admin_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `rules` varchar(4000) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Table structure for `bds_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_menu`;
CREATE TABLE `bds_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '上级菜单ID',
  `title` varchar(32) DEFAULT '' COMMENT '菜单名称',
  `en_title` varchar(255) NOT NULL COMMENT '产品分类的英文名',
  `url` varchar(127) DEFAULT '' COMMENT '链接地址',
  `nav` varchar(50) DEFAULT '0' COMMENT '前台导航路径',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `menu_type` tinyint(4) DEFAULT NULL COMMENT '菜单类型',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `rule_id` int(11) DEFAULT NULL COMMENT '权限id',
  `module` varchar(50) DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL COMMENT '三级菜单吗',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='【配置】后台菜单表';

-- ----------------------------
-- Table structure for `bds_admin_post`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_post`;
CREATE TABLE `bds_admin_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '岗位备注',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `status` tinyint(5) DEFAULT '1' COMMENT '状态1启用,0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Table structure for `bds_admin_rule`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_rule`;
CREATE TABLE `bds_admin_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `name` varchar(100) DEFAULT '' COMMENT '定义',
  `level` tinyint(5) DEFAULT NULL COMMENT '级别。1模块,2控制器,3操作',
  `pid` int(11) DEFAULT '0' COMMENT '父id，默认0',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态，1启用，0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
-- Table structure for `bds_admin_structure`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_structure`;
CREATE TABLE `bds_admin_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='公司结构表';

-- ----------------------------
-- Table structure for `bds_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `bds_admin_user`;
CREATE TABLE `bds_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) DEFAULT NULL COMMENT '管理后台账号',
  `password` varchar(100) DEFAULT NULL COMMENT '管理后台密码',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `create_time` int(11) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `structure_id` int(11) DEFAULT NULL COMMENT '部门',
  `post_id` int(11) DEFAULT NULL COMMENT '岗位',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态,1启用0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
-- Table structure for `bds_brand`
-- ----------------------------
DROP TABLE IF EXISTS `bds_brand`;
CREATE TABLE `bds_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '案例分类',
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_estonian_ci DEFAULT NULL,
  `type` varchar(50) NOT NULL COMMENT '所属分类',
  `content` text NOT NULL,
  `order` int(11) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '0不推送1推送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- ----------------------------
-- Table structure for `bds_contact`
-- ----------------------------
DROP TABLE IF EXISTS `bds_contact`;
CREATE TABLE `bds_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `hotline` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `posts` varchar(11) NOT NULL COMMENT '邮编',
  `hremail` varchar(50) DEFAULT NULL,
  `backimage` varchar(255) DEFAULT NULL,
  `create_time` varchar(50) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) DEFAULT '2' COMMENT '1公司总/分部2其他',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='分公司表';

-- ----------------------------
-- Table structure for `bds_friend`
-- ----------------------------
DROP TABLE IF EXISTS `bds_friend`;
CREATE TABLE `bds_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Table structure for `bds_joins`
-- ----------------------------
DROP TABLE IF EXISTS `bds_joins`;
CREATE TABLE `bds_joins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '所属分类',
  `en_title` varchar(255) NOT NULL COMMENT '英文标题',
  `title` varchar(255) NOT NULL COMMENT '条目标题',
  `pic` varchar(255) NOT NULL COMMENT '图标',
  `img` varchar(255) NOT NULL COMMENT '优势图',
  `content` text NOT NULL,
  `order` int(11) NOT NULL,
  `create_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='招商加盟表';

-- ----------------------------
-- Table structure for `bds_measure`
-- ----------------------------
DROP TABLE IF EXISTS `bds_measure`;
CREATE TABLE `bds_measure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tel` varchar(25) NOT NULL,
  `ordertime` varchar(25) NOT NULL COMMENT '预约时间',
  `address` varchar(255) NOT NULL COMMENT '预约地址',
  `status` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='预约测量表';

-- ----------------------------
-- Table structure for `bds_news`
-- ----------------------------
DROP TABLE IF EXISTS `bds_news`;
CREATE TABLE `bds_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pid` int(11) NOT NULL COMMENT '新闻分类',
  `content` text,
  `listpic` varchar(255) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `read_num` int(11) NOT NULL COMMENT '阅读次数',
  `status` varchar(50) NOT NULL DEFAULT '0' COMMENT '1推送0不推送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='新闻动态观点表';

-- ----------------------------
-- Table structure for `bds_order`
-- ----------------------------
DROP TABLE IF EXISTS `bds_order`;
CREATE TABLE `bds_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(11) NOT NULL COMMENT '订单号',
  `status` varchar(55) NOT NULL COMMENT '-1 不存在，0在发货，1已发货',
  `time` varchar(32) NOT NULL,
  `ip` varchar(25) NOT NULL,
  `login_ip` varchar(25) NOT NULL,
  `num` int(3) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='模拟订单表';

-- ----------------------------
-- Table structure for `bds_product`
-- ----------------------------
DROP TABLE IF EXISTS `bds_product`;
CREATE TABLE `bds_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '产品分类id',
  `litpic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `en_title` varchar(255) NOT NULL COMMENT '产品英文名称',
  `subtitle` varchar(255) NOT NULL COMMENT 'banner右下角标题',
  `desc` text NOT NULL COMMENT '描述',
  `desc2` text NOT NULL COMMENT '描述信息第2行',
  `content` text,
  `status` varchar(50) NOT NULL COMMENT '推送状态',
  `create_time` varchar(50) NOT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Table structure for `bds_service`
-- ----------------------------
DROP TABLE IF EXISTS `bds_service`;
CREATE TABLE `bds_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_title` varchar(255) DEFAULT NULL,
  `vice_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `content` text,
  `banner` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL COMMENT '所属部分',
  `create_time` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='服务表';

-- ----------------------------
-- Table structure for `bds_shou_ye`
-- ----------------------------
DROP TABLE IF EXISTS `bds_shou_ye`;
CREATE TABLE `bds_shou_ye` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `path` int(11) DEFAULT NULL COMMENT '子类id',
  `type` int(11) DEFAULT NULL,
  `backimage` varchar(255) DEFAULT NULL COMMENT '栏目banner',
  `url` varchar(100) DEFAULT NULL COMMENT '栏目链接',
  `content` text,
  `order` int(11) DEFAULT NULL COMMENT '栏目排序',
  `create_time` varchar(50) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='网站首页表';

-- ----------------------------
-- Table structure for `bds_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `bds_system_config`;
CREATE TABLE `bds_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(50) DEFAULT '',
  `value` varchar(500) DEFAULT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned DEFAULT '0' COMMENT '配置分组',
  `need_auth` tinyint(4) DEFAULT '1' COMMENT '1需要登录后才能获取，0不需要登录即可获取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `参数名` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='【配置】系统配置表';

-- ----------------------------
-- Records for `bds_admin_access`
-- ----------------------------
INSERT INTO `bds_admin_access` VALUES ('2', '15');
INSERT INTO `bds_admin_access` VALUES ('3', '16');
INSERT INTO `bds_admin_access` VALUES ('4', '16');

-- ----------------------------
-- Records for `bds_admin_group`
-- ----------------------------
INSERT INTO `bds_admin_group` VALUES ('15', '普通会员', '1,2,3,4,5,6,7,8,9,10,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,61,62,63,28,29', '0', '最厉害的组别', '1');
INSERT INTO `bds_admin_group` VALUES ('16', '超级管理员', '10,30,31,32,33,34,35,36,37,28,29,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,61,62,63', '', '超级管理员', '1');

-- ----------------------------
-- Records for `bds_admin_menu`
-- ----------------------------
INSERT INTO `bds_admin_menu` VALUES ('52', '0', '网站后台管理系统', '', '', '', '', '1', '0', '1', '10', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('53', '52', '系统配置', '', '', '', '', '1', '1', '1', '61', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('54', '53', '菜单管理', '', '/home/menu/list', '', '', '1', '1', '1', '21', 'Administrative', 'menu');
INSERT INTO `bds_admin_menu` VALUES ('55', '53', '系统参数', '', '/home/config/add', '', '', '1', '3', '1', '13', 'Administrative', 'systemConfig');
INSERT INTO `bds_admin_menu` VALUES ('56', '53', '权限规则', '', '/home/rule/list', '', '', '1', '2', '1', '13', 'Administrative', 'rule');
INSERT INTO `bds_admin_menu` VALUES ('57', '52', '组织架构', '', '', '', '', '1', '5', '1', '63', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('58', '57', '岗位管理', '', '/home/position/list', '', '', '1', '0', '1', '31', 'Administrative', 'position');
INSERT INTO `bds_admin_menu` VALUES ('59', '57', '部门管理', '', '/home/structures/list', '', '', '1', '0', '1', '39', 'Administrative', 'structures');
INSERT INTO `bds_admin_menu` VALUES ('60', '57', '用户组管理', '', '/home/groups/list', '', '', '1', '0', '1', '47', 'Administrative', 'groups');
INSERT INTO `bds_admin_menu` VALUES ('61', '52', '账户管理', '', '', '', '', '1', '0', '1', '62', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('62', '61', '账户列表', '', '/home/users/list', '', '', '1', '0', '1', '55', 'Administrative', 'users');
INSERT INTO `bds_admin_menu` VALUES ('63', '52', '内容管理', '', '', '', '', '1', '2', '1', '64', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('64', '63', '产品中心', '', '/home/product/list', '/product', '', '1', '1', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('65', '63', '品牌中心', '', '/home/brand/list', '/mark', '', '1', '2', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('66', '63', '服务中心', '', '/home/service/list', '/serve', '', '1', '3', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('67', '63', '新闻资讯', '', '/home/news/list', '/news', '', '1', '4', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('68', '63', '招商加盟', '', '/home/joins/list', '/join', '', '1', '5', '1', '64', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('70', '52', '其他管理', '', '', '', '', '1', '3', '1', '66', 'Administrative', '');
INSERT INTO `bds_admin_menu` VALUES ('71', '70', '首页管理', '', '/home/shouye/list', '', '', '1', '1', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('72', '70', '数据库管理', '', '/home/mysqls/list', '', '', '1', '3', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('73', '70', '友情链接', '', '/home/friend/list', '', '', '1', '2', '1', '66', 'Administrative', 'other');
INSERT INTO `bds_admin_menu` VALUES ('74', '70', '预约测量', '', '/home/measure/list', '', '', '1', '3', '1', '66', 'Administrative', 'casetype');
INSERT INTO `bds_admin_menu` VALUES ('77', '64', '儿童房系列', 'CHILDREN ROOM', '/home/product/child/list', '/product/child', 'http://localhost/bds/php/uploads/20180104/d83ab9bf4ad1f62077e4a8de72df0d7c.png', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('78', '64', '套房系列', 'FULL ROOM', '/home/product/taofang', '/product/taofang', 'http://localhost/bds/php/uploads/20180104/09f6864bfee91739dce22e3405e9b43b.png', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('79', '64', '书房系列', 'READING ROOM', '/home/product/book/list', '/product/book', 'http://localhost/bds/php/uploads/20180104/e433a5e29cf7f5bebe918a310f7a3f95.png', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('80', '64', '客厅系列', 'LIVING ROOM', '/home/product/live/list', '/product/live', 'http://localhost/bds/php/uploads/20180104/961d7e1a5eee9b0a4920ce123e69751f.png', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('81', '64', '卧室系列', 'SLEEP ROOM', '/home/product/bedroom/list', '/product/bedroom', 'http://localhost/bds/php/uploads/20180104/6d7ecdceee3114a4f82a4d5a90984dc3.png', '1', '5', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('82', '64', '实木家具', 'SOLID WOOD FUMITURE', '/home/product/shimu/list', '/product/shimu', 'http://localhost/bds/php/uploads/20180104/4abe8e3ae61c11a9ef6df744bd13702e.png', '1', '6', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('83', '64', '定制家居', 'CUSTOMIZED FUMITURE', '/home/product/order/list', '/product/order', 'http://localhost/bds/php/uploads/20180104/e927f13f8e1644498d0b7aea50232e25.png', '1', '7', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('84', '65', '品牌故事', '', '/home/brand/story/list', '/brand/story', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('85', '65', '品牌历程', '', '/home/brand/course/list', '/brand/course', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('86', '65', '品牌荣誉', '', '/home/brand/honor/list', '/brand/honor', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('87', '65', '企业文化', '', '/home/brand/culture/list', '/brand/culture', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('88', '66', '百得胜学院', '', '/home/service/school/list', '/service/school', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('89', '66', '预约测量', 'MAKE MEASURE', '/home/service/measure/list', '/service/measure', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('90', '66', '定制服务', 'WHOLEHEARTEDLY SERVICE', '/home/service/customized/list', '/service/customized', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('91', '66', '订单查询', 'ORDERS INQUIRY', '/home/service/order/list', '/service/order', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('92', '67', '公司咨询', '', '/home/news/ask/list', '/news/ask', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('93', '67', '各地动态', '', '/home/news/dynamic/list', '/news/dynamic', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('94', '67', '活动专题', '', '/home/news/topic/list', '/news/topic', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('95', '67', '行业资讯', '', '/home/news/industry/list', '/news/industry', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('96', '68', '品牌优势', 'INVESTMENT TO JOIN', '/home/joins/advantage/list', '/joins/advantage', '', '1', '1', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('97', '68', '加盟条件', 'JOINING CONDITION', '/home/joins/condition/list', '/joins/condition', '', '1', '2', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('98', '68', '加盟流程', 'JOINING CONDITION', '/home/joins/process/list', '/joins/process', '', '1', '3', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('99', '68', '加盟支持', 'SERVICE SUPPORT', '/home/joins/support/list', '/joins/support', '', '1', '4', '1', '67', 'Administrative', 'category');
INSERT INTO `bds_admin_menu` VALUES ('100', '63', '联系我们', '', '/home/contact/list', '/call', '', '2', '7', '1', '67', 'Administrative', 'category');

-- ----------------------------
-- Records for `bds_admin_post`
-- ----------------------------
INSERT INTO `bds_admin_post` VALUES ('5', '后端开发工程师', '', '1484706862', '1');
INSERT INTO `bds_admin_post` VALUES ('6', '前端开发工程师', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('7', '设计师', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('11', '文案策划', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('12', '产品助理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('15', '总经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('20', '项目经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('25', '职能', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('26', '项目助理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('28', '人事经理', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('29', 'CEO', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('30', '品牌策划', '', '1484706863', '1');
INSERT INTO `bds_admin_post` VALUES ('31', '前端研发工程师', '', '1484706863', '1');

-- ----------------------------
-- Records for `bds_admin_rule`
-- ----------------------------
INSERT INTO `bds_admin_rule` VALUES ('10', '系统基础功能', 'admin', '1', '0', '1');
INSERT INTO `bds_admin_rule` VALUES ('11', '权限规则', 'rules', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('13', '规则列表', 'index', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('14', '权限详情', 'read', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('15', '编辑权限', 'update', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('16', '删除权限', 'delete', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('17', '添加权限', 'save', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('18', '批量删除权限', 'deletes', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('19', '批量启用/禁用权限', 'enables', '3', '11', '1');
INSERT INTO `bds_admin_rule` VALUES ('20', '菜单管理', 'menus', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('21', '菜单列表', 'index', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('22', '添加菜单', 'save', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('23', '菜单详情', 'read', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('24', '编辑菜单', 'update', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('25', '删除菜单', 'delete', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('26', '批量删除菜单', 'deletes', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('27', '批量启用/禁用菜单', 'enables', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('28', '系统管理', 'systemConfigs', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('29', '修改系统配置', 'save', '3', '28', '1');
INSERT INTO `bds_admin_rule` VALUES ('30', '岗位管理', 'posts', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('31', '岗位列表', 'index', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('32', '岗位详情', 'read', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('33', '编辑岗位', 'update', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('34', '删除岗位', 'delete', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('35', '添加岗位', 'save', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('36', '批量删除岗位', 'deletes', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('37', '批量启用/禁用岗位', 'enables', '3', '30', '1');
INSERT INTO `bds_admin_rule` VALUES ('38', '部门管理', 'structures', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('39', '部门列表', 'index', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('40', '部门详情', 'read', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('41', '编辑部门', 'update', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('42', '删除部门', 'delete', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('43', '添加部门', 'save', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('44', '批量删除部门', 'deletes', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('45', '批量启用/禁用部门', 'enables', '3', '38', '1');
INSERT INTO `bds_admin_rule` VALUES ('46', '用户组管理', 'groups', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('47', '用户组列表', 'index', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('48', '用户组详情', 'read', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('49', '编辑用户组', 'update', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('50', '删除用户组', 'delete', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('51', '添加用户组', 'save', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('52', '批量删除用户组', 'deletes', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('53', '批量启用/禁用用户组', 'enables', '3', '46', '1');
INSERT INTO `bds_admin_rule` VALUES ('54', '成员管理', 'users', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('55', '成员列表', 'index', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('56', '成员详情', 'read', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('57', '删除成员', 'delete', '3', '54', '1');
INSERT INTO `bds_admin_rule` VALUES ('59', '管理菜单', 'Adminstrative', '2', '10', '1');
INSERT INTO `bds_admin_rule` VALUES ('61', '系统管理二级菜单', 'systemConfig', '1', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('62', '账户管理二级菜单', 'personnel', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('63', '组织架构二级菜单', 'structures', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('64', '栏目管理二级菜单', 'Class', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('65', '栏目列表', 'index', '3', '20', '1');
INSERT INTO `bds_admin_rule` VALUES ('66', '其他管理二级菜单', 'other', '3', '59', '1');
INSERT INTO `bds_admin_rule` VALUES ('67', '栏目管理三级菜单', 'three', '3', '59', '1');

-- ----------------------------
-- Records for `bds_admin_structure`
-- ----------------------------
INSERT INTO `bds_admin_structure` VALUES ('57', '企业微信', '0', '1');
INSERT INTO `bds_admin_structure` VALUES ('58', '设计部', '57', '1');
INSERT INTO `bds_admin_structure` VALUES ('59', '网络部', '57', '1');

-- ----------------------------
-- Records for `bds_admin_user`
-- ----------------------------
INSERT INTO `bds_admin_user` VALUES ('1', 'admin', 'd93a5def7511da3d0f2d171d9c344e91', '', '', '超级管理员', '1', '5', '1');
INSERT INTO `bds_admin_user` VALUES ('4', 'admin123', '8b6804ff6d620e1ede6b8289a99fbf8d', '超级管理员', '1509611337', 'lxw', '59', '', '1');

-- ----------------------------
-- Records for `bds_brand`
-- ----------------------------
INSERT INTO `bds_brand` VALUES ('1', '84', 'http://localhost/bds/php/uploads/20171228/a892eb5d4d885ee204ac9c2c3fcf1cc5.png', 'BRAND STORY FURNITURE', '', '<p>百得胜成立于2001年4，环保全屋定制家具实力品牌，上市公司德尔未来（股票代码：002631）全资子公司，定制家具行业标准起草参编单位，歌手“平安”品牌代言。</p><p>百得胜“广州+苏州+成都+铁岭”全国4大生产基地战略布局落定，广州工厂拥有近7万平米标准化厂房，苏州工厂拥有132亩生产基地，于2015年5月正式投产；占地700亩成都生产基地将于2017年启动，第四大生产基地铁岭已置地。公司在岗职工1500余人，其中研发设计人员80余人。</p><p>百得胜凭借过硬的工艺，进口的德国豪迈、温康纳生产设备，好看、好用、环保的品质，赢得了权威机构的肯定并通过ISO国际质量体系认证、环境管理体系认证、国家十环认证、绿家居联盟认证等专业认证，深获千万家庭的信赖。</p><p>广州百得胜家居有限公司2017年开启“板木+板式+橱柜+床垫”小家居战略，整体研发生产实力更上一层楼。</p>', '1', '2017-12-27 17:52', '0');
INSERT INTO `bds_brand` VALUES ('2', '87', 'http://localhost/bds/php/uploads/20171228/e67705a7c0609baa3b74f898e91a566b.png', 'BRAND STORY FURNITURE', '', '<article><h5>使命</h5><h6>为顾客创造价值，为员工谋求福利</h6></article><article><h5>愿景</h5><h6>让百得胜成为市场推崇的家具品牌</h6></article><article><h5>使命</h5><h6>专注、创新、和谐</h6></article>', '2', '2017-12-27 17:56', '0');
INSERT INTO `bds_brand` VALUES ('3', '85', 'http://localhost/bds/php/uploads/20171228/0164e13141746790a6d6b798b683879d.png', 'BRAND STORY FURNITURE', '', '<h5>2001</h5><h6>百得胜依托资本平台，跨界融合，开启“板木+板式+橱柜+床垫”小家居战略。</h6>', '3', '2001-12-28 10:10', '0');
INSERT INTO `bds_brand` VALUES ('4', '85', 'http://localhost/bds/php/uploads/20171228/d6fa24b1fcb61e1bcbf855764e734a0e.png', 'BRAND STORY FURNITURE', '', '<h5>2002</h5><h6>百得胜加入上市公司——德尔未来（股票代码：002631）；成为国家击剑队高级赞助商；投资设立“苏州韩居实木定制家居有限公司”。</h6>', '4', '2002-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('5', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2003</h5><h6>签约歌星平安担任品牌形象代言人；苏州工厂一期正式投产。</h6>', '5', '2003-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('6', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2004</h5><h6>产品基础年，围绕环保、功能、设计全面优化产品体系，推行实施千万大商1314经营计划。</h6>', '6', '2004-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('7', '85', '', 'BRAND STORY FURNITURE', '', '<h5>2005</h5><h6>招商基础年，开启金字塔经营结构模式，渠道网点增长560%。</h6>', '7', '2005-12-28 15:13', '0');
INSERT INTO `bds_brand` VALUES ('8', '86', 'http://localhost/bds/php/uploads/20171228/31d51c58386990ca5c09be825b47383d.png', 'BRAND STORY FURNITURE', '', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514445356130859.png" title="1514445356130859.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356310689.png" title="1514445356310689.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445391133230.png" title="1514445391133230.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356130859.png" title="1514445356130859.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445356310689.png" title="1514445356310689.png"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514445391133230.png" title="1514445391133230.png"/></p>', '7', '2006-12-28 10:16', '0');

-- ----------------------------
-- Records for `bds_contact`
-- ----------------------------
INSERT INTO `bds_contact` VALUES ('1', '百得胜', '广州市天河区天河北路906号高科大厦A座12楼', '<p>百得胜公司信息</p>', '（020）85274395/38319021', '400-629-2629', 'lxiaoling@paterson.com.cn', '510545', 'hr@ye2005.com', 'http://192.168.1.138/vuethink/php/uploads/20171211/d7539a258f166ca1615960dc46421925.jpg', '2017-11-27 20:17', '1', '1');

-- ----------------------------
-- Records for `bds_friend`
-- ----------------------------
INSERT INTO `bds_friend` VALUES ('1', '百得胜', 'http://www.paterson.com.cn', '1', '2017-11-30 18:10');
INSERT INTO `bds_friend` VALUES ('2', '德尔未来旗下全资子公司', 'http://www.paterson.com.cn', '22', '2017-11-30 18:12');

-- ----------------------------
-- Records for `bds_joins`
-- ----------------------------
INSERT INTO `bds_joins` VALUES ('1', '96', 'TEN ADVANTACES', '三大基地', 'http://localhost/bds/php/uploads/20180108/85ce66e23fe20687468578c21d99da38.png', 'http://localhost/bds/php/uploads/20180108/953188338f650d0ddb8b74064af2d505.png', '<p>规模化生产基地，百得胜战略布局“广州+苏州+成都+铁岭+天津”全国5大生产基地。纯德式精工生产体系-成熟高效-节约物流成本-缩短交货期。广州总部工厂，德国豪迈生产线及温康纳吸塑机。2015年苏州工厂一期75亩，投资1亿，聘请德国舒乐公司设计，7月正式投产。成都生产基地已征地，将于2015年正式启动，2016年投入生产。</p>', '1', '2017-12-29 15:19');
INSERT INTO `bds_joins` VALUES ('2', '96', 'TEN ADVANTACES', '硬件软件', 'http://localhost/bds/php/uploads/20180108/93cd2ae7c0a7c01fc3e740edfef9a0e7.png', 'http://localhost/bds/php/uploads/20180109/ce56061a2a91f1635ddcaa1a67247b73.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '2', '2017-12-29 15:15');
INSERT INTO `bds_joins` VALUES ('3', '96', 'TEN ADVANTACES', '产品创新', 'http://localhost/bds/php/uploads/20180108/a2b5f48d55d0134faa592f60bb27841a.png', 'http://localhost/bds/php/uploads/20180109/ffd4d8ae6c50cc48370b2d6767a6b54d.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '3', '2017-12-29 15:22');
INSERT INTO `bds_joins` VALUES ('4', '96', 'TEN ADVANTACES', '活动策划', 'http://localhost/bds/php/uploads/20180108/1f365c1860366b04aff5619b5c52f669.png', 'http://localhost/bds/php/uploads/20180109/cb632cbd5514827ee0456cff1027a3bc.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '4', '2017-12-29 15:23');
INSERT INTO `bds_joins` VALUES ('5', '96', 'TEN ADVANTACES', '三大支持', 'http://localhost/bds/php/uploads/20180108/b9f753744036bf6ccc9f0bc9f4d427d5.png', 'http://localhost/bds/php/uploads/20180109/b75587b6a9c76e96533adf11ca1969ff.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '5', '2017-12-29 15:23');
INSERT INTO `bds_joins` VALUES ('6', '96', 'TEN ADVANTACES', '终端形象', 'http://localhost/bds/php/uploads/20180108/e93c04d76dce4b721bd02612c42f649f.png', 'http://localhost/bds/php/uploads/20180109/9a2fc0ce98deb8f0f23d5283483d8da4.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '6', '2017-12-29 15:24');
INSERT INTO `bds_joins` VALUES ('7', '96', 'TEN ADVANTACES', '环保基材', 'http://localhost/bds/php/uploads/20180108/4227bbc24a4897331a3846eed438dbc9.png', 'http://localhost/bds/php/uploads/20180109/1bdd51cbc10859e5e6cf0ad3b21b174f.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '7', '2017-12-29 15:24');
INSERT INTO `bds_joins` VALUES ('8', '96', 'TEN ADVANTACES', '进口配件', 'http://localhost/bds/php/uploads/20180108/cb3f1d02e4d1a0a54b0b98ec264d31b8.png', 'http://localhost/bds/php/uploads/20180109/20e8652bce6ea85b8bbcc2ef1dab8582.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '8', '2017-12-29 15:25');
INSERT INTO `bds_joins` VALUES ('9', '96', 'TEN ADVANTACES', '培训学员', 'http://localhost/bds/php/uploads/20180108/c83cfc79d9a0f2ed52101c3e2719fbb3.png', 'http://localhost/bds/php/uploads/20180109/5ae64ffffa795c01abde5d025f368228.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '9', '2017-12-29 15:26');
INSERT INTO `bds_joins` VALUES ('10', '96', 'TEN ADVANTACES', '六心服务', 'http://localhost/bds/php/uploads/20180108/b201a804350326dbb4fdb1862f1e6f6c.png', 'http://localhost/bds/php/uploads/20180109/cae134a22ee9a6a05ad1826b9a2fb06c.png', '<p>百得胜拥有研发设计人员30余人，专业设计人员50余人，并聘请香港资深设计师，意大利设计师共同把脉产品研发设计。融合中西方设计元素，每年设计出1000余份设计作品，百里挑一，从中甄选出1%，进行设计打样开发，每季发布新品数款，特色无雷同。百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '10', '2017-12-29 15:26');
INSERT INTO `bds_joins` VALUES ('11', '97', 'JOINING CONDITION', '热爱家具事业，具备合法资格的法人或者自然人', 'http://localhost/bds/php/uploads/20180108/dbe24c4dca18fba9c3f9cbaf0b723f28.png', 'http://localhost/bds/php/uploads/20180108/bf91f9a8dfffbed65c68eb7cf027fb8f.png', '<p>加盟内容<br/></p>', '11', '2017-12-29 15:29');
INSERT INTO `bds_joins` VALUES ('12', '97', 'JOINING CONDITION', '具有一定的文化程度，具备经营管理，运作和持续发展的能力', 'http://localhost/bds/php/uploads/20180108/01216de361bc92bbdd55787b34e72584.png', 'http://localhost/bds/php/uploads/20180109/731d5ea659c5e083e78f8fcab2ad7a7b.jpg', '<p>加盟内容</p>', '12', '2017-12-29 15:32');
INSERT INTO `bds_joins` VALUES ('13', '97', 'JOINING CONDITION', '具有一定的资金中等发达水平地级及以上城市自有资金必须在40万以上', 'http://localhost/bds/php/uploads/20180108/3823ead486071bfed4c6e72ce1f1f642.png', 'http://localhost/bds/php/uploads/20180109/304892c19cb552eaa12ee6ce5508b432.jpg', '<p>加盟内容</p>', '13', '2017-12-29 15:40');
INSERT INTO `bds_joins` VALUES ('14', '97', 'JOINING CONDITION', '有良好的经营条件，符合公司要求的好店面，舍得在装修上花功夫和本钱', 'http://localhost/bds/php/uploads/20180108/8942ed883caad40f333e8f368d668ac6.png', 'http://localhost/bds/php/uploads/20180109/44774e90b3669d05af25d49d1b05c22a.jpg', '<p>加盟内容</p>', '14', '2017-12-29 15:42');
INSERT INTO `bds_joins` VALUES ('15', '98', 'JOINING PROCESS', '建立联系，初步达成合作意向', '', '', '<p>加盟内容</p>', '15', '2017-12-29T07:53:21.539Z');
INSERT INTO `bds_joins` VALUES ('16', '98', 'JOINING PROCESS', '填写申请表', '', '', '<p>盟内容</p>', '16', '2017-12-29 15:54');
INSERT INTO `bds_joins` VALUES ('17', '98', 'JOINING PROCESS', '区域经理考核，来公司实地考察了解', '', '', '<p>加盟内容</p>', '17', '2017-12-29 15:56');
INSERT INTO `bds_joins` VALUES ('18', '99', 'SERVICE SUPPORT', '服务支持', 'http://localhost/bds/php/uploads/20171229/8d24155f3627d332b5a2115bd78ae7a0.png', 'http://localhost/bds/php/uploads/20180108/bfae27130bff397bf53225f47d9f493e.png', '<p>百得胜学院隶属于广州百得胜家居有限公司，是专门为百得胜经销商打造专业人才队伍的基地。学院秉承“全面为经销商提供专业知识和培养专业人才”的办学理念，立足于行业发展和经销商人员管理模式，成立专业的培训团队，组织开发有效实用的培训课程，全方位为经销商培养专业人才，帮助经销商打造人才竞争力，通过专业人才提供专业服务，从而使经销商赢得市场及忠实客户。<br/></p>', '27', '2017-12-29 15:56');
INSERT INTO `bds_joins` VALUES ('19', '0', '33', '333', '', '', '<p>33<br/></p>', '33', '2018-01-06T09:28:24.288Z');
INSERT INTO `bds_joins` VALUES ('20', '97', '', '店面人员配置与素质', 'http://localhost/bds/php/uploads/20180108/821076ae6fce03a7125247fa5fc8a4db.png', 'http://localhost/bds/php/uploads/20180109/0ff7f91c2b27454f04310fb20c510c06.jpg', '<p>加盟内容</p>', '14', '2018-01-08 17:05');
INSERT INTO `bds_joins` VALUES ('21', '98', '', '签订加盟合同', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '18', '2018-01-08T09:08:47.522Z');
INSERT INTO `bds_joins` VALUES ('22', '98', '', '店面装修上样', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '19', '2018-01-08T09:09:31.252Z');
INSERT INTO `bds_joins` VALUES ('23', '98', '', '店面样品设计的确认，并交纳货款', '', '', '<p>&nbsp; &nbsp;加盟内</p>', '20', '2018-01-08T09:10:35.715Z');
INSERT INTO `bds_joins` VALUES ('25', '98', '', '工作人员岗前培训', '', '', '<p>加盟内容</p>', '21', '2018-01-08 18:28');
INSERT INTO `bds_joins` VALUES ('26', '98', '', '店面布局空间设计，施工设计样品设计等', '', '', '<p>加盟内容</p>', '22', '2018-01-08T10:30:14.122Z');
INSERT INTO `bds_joins` VALUES ('27', '98', '', '交纳品牌加盟费与品牌保证金', '', '', '<p>·百得胜精研八大系列产品，分别为五大畅销产品群和三大特色产品群。五大畅销产品，风格多样，足以满足不同层面消费者的需求，多重赢利有保障！原创三大特色产品群，独特风格，满足个性群体及高端群体需求，提升形象与利润，确保经销商持续盈利能力。</p>', '23', '2018-01-09T03:46:28.487Z');
INSERT INTO `bds_joins` VALUES ('28', '98', '', '店面的装饰布置', '', '', '<p>加盟内容</p>', '24', '2018-01-09T03:47:07.715Z');
INSERT INTO `bds_joins` VALUES ('29', '98', '', '开业前指导与专卖店正式开业', '', '', '<p>加盟内</p>', '25', '2018-01-09T03:48:32.269Z');
INSERT INTO `bds_joins` VALUES ('30', '98', '', '总部定期跟进运营与指导支持', '', '', '<p>加盟内</p>', '26', '2018-01-09T03:49:36.745Z');
INSERT INTO `bds_joins` VALUES ('31', '99', '', '服务支持2', 'http://localhost/bds/php/uploads/20180109/85393cb302ab0e1176789e8d634ab1bd.png', '', '<p>百得胜历经16年市场沉淀，深谙行业无促不销之妙诀：实施终端精准营销，因需特设常规促销及大型主题促销。</p><p><strong>大型主题促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全年度、大力度在全国开展“百得胜无醛添加衣柜系列”大型主题会议营销活动。220计划、360计划、4场大型促销计划，简称234帮扶政策。</p><p><strong>日常常规促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;每年315、五一、十一、元旦等重大节假日开展全国统一促销活动；确保月月有主题、周周有活动</p><p><br/></p>', '28', '2018-01-09 11:53');
INSERT INTO `bds_joins` VALUES ('32', '99', '', '服务支持3', 'http://localhost/bds/php/uploads/20180109/376a4dc84163dc10459f5e3dafa63fcb.png', 'http://localhost/bds/php/', '<p>百得胜历经16年市场沉淀，深谙行业无促不销之妙诀：实施终端精准营销，因需特设常规促销及大型主题促销。</p><p><strong>大型主题促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全年度、大力度在全国开展“百得胜无醛添加衣柜系列”大型主题会议营销活动。220计划、360计划、4场大型促销计划，简称234帮扶政策。</p><p><strong>日常常规促销</strong><br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;每年315、五一、十一、元旦等重大节假日开展全国统一促销活动；确保月月有主题、周周有活动</p><p><br/></p>', '30', '2018-01-09T03:56:18.125Z');

-- ----------------------------
-- Records for `bds_measure`
-- ----------------------------
INSERT INTO `bds_measure` VALUES ('24', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('25', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('26', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('27', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('28', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');
INSERT INTO `bds_measure` VALUES ('29', '哈哈哈哈', '18231857002', '2018-01-06 15:58', '北京大兴', '');

-- ----------------------------
-- Records for `bds_news`
-- ----------------------------
INSERT INTO `bds_news` VALUES ('1', '专注膜压定制哪家强？百得胜膜压新品横空出世', '92', '<p><span style="font-size:16px"><span style="color:#dd4822">中国环保定制家居先行者——百得胜膜压新品盛大发布，开启全屋定制竞争新序幕。</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 11月30日，“啄木鸟的烦恼”2017年百得胜膜压新品发布会在广东从化韩居丽格膜压馆隆重召开。膜压新品是百得胜在板式、实木（板木）之外，开辟的又一产品线，是百得胜发展新的里程碑。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514451920113535.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>立于风口 膜压新品横空出世</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 近年来，家居市场成为消费升级的前沿阵地。消费者对家居生活品质的追求不断提高，对家具的质量、质感追求也是越来越高。与此同时， 艺术、设计、时尚等精神消费元素越来越多地走进家庭。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;板式家具虽然风格多变，但对追求品质格调的消费者来说已非首选；实木家具因其价格高昂，又让人望而却步；而随着性价比优越的“膜压”产品出现，定制家具的竞争格局也悄然发生变化——“板木”定制开始崭露头角。此时，由膜压之父陈家驹倾情打造的匠心之作、情怀之作——百得胜膜压系列新品应运而生。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/2_副本.jpg"/><br/><span style="font-size:16px">发布会现场宾朋满座</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此次，百得胜近800平米全是膜压产品的实木馆正式落成，意味着百得胜正式占领全屋定制竞争新的制高点。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514451923138428.jpg"/></p><p><span style="font-size:16px">全是膜压产品的实木馆</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;本次发布会膜压新品展馆涉及六大品类十大空间产品定制解决方案，达28+款式，满足9大人群定制需求。从0-5岁咿呀学语的小孩、到6-12岁的儿童、13岁至毕业的学生、单身的奋斗青年、新婚的二人世界、为人父母的三口之家、家成业就的人生赢家、品味人生的魅力中年、三世同堂的大家庭，都能体验百得胜定制家居的魅力。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “<strong>膜压”优势在哪里</strong>？</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/4_副本.jpg"/></p><p><span style="font-size:16px">百得胜执行总裁张健先生致辞</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜品牌负责人认为，传统板式、膜压产品以及实木（板木）就好像宝马的3系、5系以及7系。板式产品占最大量的销售份额，设计经典、功能实用。膜压产品定位是中端消费人群，对于设计、产品细节也更多追求。实木（板木）定位高端市场，<span style="font-family: 宋体;font-size: 14px">工艺日臻成熟</span>。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/5_副本.jpg"/></p><p><span style="font-size:16px">韩居丽格总裁芶良朝先生分享膜压成果</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;在板式家具的创新求变的路上，膜压技术的出现成为了关键。不同于实木容易开裂变形，膜压产品集成了板式家具实用性，且多以高密度板作为基材，不论什么地方物理性能都十分稳定。此外，实木产品因含水率等天然属性在非混油工艺的情况经常会有色差，但膜压则基本不存在这个问题。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;外观设计和价格是消费者最关心的问题。理论上来讲实木定制产品可以实现绝大部分外观效果，但是在做时尚类的产品表现时就有些不合适，价格很昂贵。但膜压产品有类似钢琴烤漆的高光类产品，也有一些水波粼粼效果的3D效果类产品，也有与实木近似度极高的“混”油类产品……而有些价格不到实木定制的一半，甚至部份款式可能仅为实木定制的1/3。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/6_副本.jpg"/></span></p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/7_副本.jpg"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 对标实木产品，膜压产品的优势明显。就物理性能来说，膜压产品相对稳定，不会开裂。韩居丽格供应给百得胜的膜压产品是用密度在810-820KG/立方米的高密度板作为基材，十分稳定。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/8_副本.jpg"/><br/><span style="font-size:16px">中国膜压之父陈家驹先生分享膜压工艺特性</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;百得胜膜压产品还具有媲美实木的外观与手感。发布会现场，通过观察与触摸，经销商家人及媒体朋友们仍感叹难以分辨百得胜膜压板与实木，陈家驹先生对此做出详细的技术说明。目前，百得胜美洲实木转膜压同款与实木的混油工艺产品视觉效果、触觉效果无限接近。膜压板耐脏、耐划、防火的性能，现场也一一演示。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/9_副本.jpg"/></p><p><span style="font-size:16px">膜压板防火性能现场演示</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 环保方面，百得胜使用无醛添加环保板材和水性胶、水性膜，打造更安醛的定制产品。此外，膜压产品还具有生产周期短、饰面效果好，外观时尚美观、性价比高等等优势。由此可见，好的生活，并不贵。百得胜始终致力于为消费者创造“品质好生活”。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;<strong> 专注膜压定制哪家强？</strong></span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/10_副本.jpg"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 作为中国人自己的定制家具品牌，百得胜一直致力于把好看、好用、环保的产品奉献给国人。本次发布会，百得胜领先业界推出多达28款膜压新品，不仅风格多、造型多、品类多、色彩多，每一件新品都是艺术品般的存在。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 目前，在全屋定制家具市场上，膜压产品越来越受到消费者的青睐。韩居丽格自身强大的生产实力＋百得胜专业的全屋定制实力，领衔膜压门板定制，专业专注成熟。在行业内率先实现基材密度板膜压、美洲实木和实木油漆三种工艺的互转，达到目前业内最高的工艺水准。<br/>其成都＋广州＋天津三大实木工厂，规模化定制实木、膜压、移门三大系列1000余款门型。</span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>百得胜&amp;韩居丽格 实力不容小觑</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 麦田的丰收来自肥沃的土壤与精心培育。<strong>百得胜丰富的膜压产品和精湛工艺则得益于强大的产能实力和研发优势。</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;<span style="color:#4444bb">| 研发优势</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; &nbsp;百得胜研发团队基于市场、基于用户、基于未来需求等多个纬度，研发新品。2017年，百得胜与韩居丽格完美融合，实现实木及膜压两大系列近30款新品的快速迭代。而韩居丽格从几十万到数百万的膜压产品生产线，到自动化、信息化等工业4.0符号性设备，为膜压产品总出货量行业第一奠定基础。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “<strong>实木膜压相互转化</strong>”：百得胜在业界率先实现了实木与膜压工艺互转。也就是说，百得胜每一款实木门型，都能对应一个同样样式的膜压门型。同一风格，不同配置，消费者买家具像买车一样来选择高配或标配。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 质美膜压，媲美实木。百得胜的部分膜压产品已与实木的混油工艺产品视觉效果、触觉效果完全一样，同时还拥有超高性价比、更短的生产周期等优势。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:#3c3cc4">| 产能优势</span></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 产能方面，百得胜&amp;韩居丽格在成都、广州、苏州、天津等多个生产基地，更大产能释放空间，规模化定制实木、膜压、移门三大系列1000余款门型，让百得胜的膜压产品在交货周期上获得极大保障。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-12/121/11_副本.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 膜皮的丰富可变性及全行业推动的技术革新，膜压产品在未来有非常广阔的市场前景，将是作为全屋定制领域产品的新增长点。此番，百得胜全屋定制携手韩居丽格，领衔膜压门板定制，实现膜压与实木工艺的互转定制，无疑将占据中国定制家居市场制高点！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><span style="font-family: 宋体;font-size: 14px"><span style="font-family:宋体">&nbsp;&nbsp;&nbsp; 质</span></span>美膜压 给自己更好的，来一起见证百得胜的产品创新力吧！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/dece288f29b0b3e360af06228b1150cc.jpg', '2017/12/28', '佚名', '1', '0', '0');
INSERT INTO `bds_news` VALUES ('2', '百得胜&松博宇强强联合 共赢“板木定制”未来', '92', '<p><span style="font-size:16px">&nbsp;&nbsp; 【前言】国民实木情节根深蒂固，却苦于其价格昂贵。随着国民消费升级催生出行业新风口——“板木定制”。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452085214083.jpg"/><br/><span style="font-size:16px"><strong>签约仪式</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年9月20日，百得胜&amp;松博宇战略合作签约仪式暨媒体见面会在中国·广州隆重举行。百得胜执行总裁张健先生与松博宇董事长詹雄光先生进行签约，正式对外宣布双方携手合作，这不是一场简单的发布会，这是一场志同而气合的战略发布会。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “志同而气合,鱼川泳而鸟云飞也。”松博宇 “原木板式化”与百得胜“板木＋实木”差异化板木定制理念不谋而合，二者战略携手，实现共赢。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 立于板木风口 未来已来</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 中国作为全球第二大经济体，国民消费力在多个领域都暗藏着繁荣之势。随着经济发展和消费升级，催生行业新风口——板木定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜，16年专注环保定制家居，全屋板木定制引领者，推出“板木+实木”的板木定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; “板木+实木”的板木定制，不再单纯地追逐全实木，理性分析家居产品的实际使用，继全实木产品之后再推板木定制。</span><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; </strong></span></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 尊重专业</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
松博宇公司成立于2001年7月，专注于木材应用领域十多年，2014年被认定为国家高新技术企业，具备从原木选材到研发、生产、销售再到家居产品配套和服务的完整产业链，其自主研发产品为科技木类、生态有机板类、3D艺术板类、浮雕板及装饰木枋类等，部分产品畅销全球60多个国家和地区，在技术创新、产品内涵、市场价值和品牌竞争力等方面均居于行业前沿。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452086169932.jpg"/></p><p><span style="font-size:16px">百得胜执行总裁张健先生讲话</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 作为原木板式化的倡领与践行者，松博宇精选北美进口原材，配合极致的原木板式化加工工艺，产品走向了世界上六十多个国家和地区，从选材到工艺，从平面到立体，始终站在木业行业潮流的前端。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452087905259.jpg"/></p><p><span style="font-size:16px">松博宇董事长詹雄光先生讲话</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此番百得胜携手松博宇，松博宇自身强大的生产实力＋百得胜专业的全屋定制实力，更加高效整合上下游产业链，降低成本，实现不一样的板木定制。而百得胜全国千店和“OSA”电商模式打通线上与线下渠道之间的双向引流及对接，更是让板木落地开花，共赢板木定制大未来。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 不断夯实小家居大战略</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2016年，百得胜选择一种全新形式的资本之路——加入老牌上市企业德尔未来。在获得资本加持之后，百得胜开始加速布局，大力发展小家居战略。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜的“小家居战略”不同于当下热门的“大家居”，不盲目追逐企业的快速扩张，而是在坚持自有优势产品定制衣柜的基础上，发展全屋定制。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
而除衣柜产品以外的延伸品类产品百得胜选择了与行业内拥有优势积淀且有发展潜力，已经拥有一定实力的优质企业联手，从2016年开始，百得胜就先后与实木门板企业韩居丽格、橱柜企业丹得橱柜牵手，如今携手松博宇不断夯实小家居战略，此后百得胜还将牵手更多的周边产品企业。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>百得胜+松博宇 走出板木定制差异化</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 如果说，此前百得胜与实木定制强者韩居丽格的携手，让百得胜实木定制梦想终得以实现。那么，此次携手全屋原木定制供应商松博宇，用原木板式化的方式进行全屋定制生产，必然让百得胜走出一条差异化的板木定制之路。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 国民实木情节根深蒂固，却苦于其价格昂贵。那么该怎样实现呢？原木板式化走出了一条不一样的路。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452088471542.jpg"/></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 传统的实木定制一般都是对一块实木原木进行加工，成本比较高。而作为一家专注木业研发制造达到28年的企业，松博宇结合现阶段国内外工业发展的有利条件，提出把原木做成板式化，满足国民根深蒂固的实木情节，这与百得胜的实木梦想不谋而合。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在定制领域，从某种程度上来说，原木板式化是工业4.0的新风向之一。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在强调环保主概念的当下，优质的基材与丰富的产品线是企业竞争的不二砝码，百得胜始终坚持环保主张，更是在洞察市场的深度需求后，提出“板木定制”的战略性手段。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年3月，百得胜全新实木定制馆全面对外亮相，推出“板木+实</span><span style="font-size:16px">木”的“板木定制”概念，不单纯地追逐全实木，而是理性分析产品的实际使用，各取所长，结合实木与板木的双重优势，满足更多家庭及市场的需求。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年6月，百得胜以“好柜配好门”为主题，发布新品美洲实木柜体，与百得胜此前推出的美洲实木柜门形成了完整套系。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/920/图片2.JPG"/></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 美洲实木柜体的推出，让百得胜形成了“美洲实木柜体+美洲实木门板”此类独创的板木定制环保+抗变形技能满分的定制家具。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 至此，在板式定制+实木定制领域内，百得胜已经成长为值得期待的黑马。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 此番携手，更是独辟蹊径，走出一条差异化发展之路，无疑是为百得胜再添腾飞的新助力，专业合作，共赢板木定制未来。</span></p><p>&nbsp;</p><p><img alt="" src="http://localhost//bds/php/ueditor/20171228/1514452089680461.jpg"/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/6d3fd3d47de06602566428044e7fc130.png', '2017-12-28', '佚名', '2', '5', '0');
INSERT INTO `bds_news` VALUES ('3', '百得胜T6项目特训营圆满结营', '92', '<p><span style="font-size:16px"><strong>打造标准·专业定制</strong>，经过三天四夜高强度特训，200余位百得胜精英精诚协作、全力拼搏，展示出了优异的学习成果，为此次T6项目特训画上了圆满的句号。</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片1.JPG"/></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 胜在培训·赢在服务</strong>，在此次T6终端体验营销系统特训中，培训导师针对性地对百得胜服务方面进行了透彻的分析和团队服务标准化的培训。三天四夜，百得胜学员们一对一完成通关考核，收获满满！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片2.JPG"/></p><p><span style="font-size:16px">T6项目特训营开营授旗仪式</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片3.JPG"/></span></p><p><span style="font-size:16px">全体学员紧张备考中</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片4.JPG"/><br/><span style="font-size:16px">学员们一对一通关考核</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片5.JPG"/><br/><span style="font-size:16px">娱乐精彩一刻</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片6.JPG"/><br/><span style="font-size:16px">产品话术情景模拟</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片7.JPG"/><br/><span style="font-size:16px">聚精会神学习中</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片8.JPG"/></span></p><p><span style="font-size:16px">笔试考核通关</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 不是结束·而是开始</strong>，百得胜T6特训虽然暂告一段落，但这不是终点，而是起点，200余位华丽蜕变的精英们将迅速回到自己的岗位，用所学的知识、所理解的系统做出更出色的发挥，带领各自团队开启新的征程！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片9.JPG"/></p><p><span style="font-size:16px">冠军团队风采</span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 引爆终端·破浪前行</strong>，此次百得胜T6特训，针对终端店面的四大痛点，点对点爆破，突破经营瓶颈，用干货解决营销没系统、团队难培养、终端没业绩、培训没效果的难题。百得胜5A+T6组合拳连续出击，快速引爆终端业绩，谁与争锋！</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-09/99/图片10.JPG"/><br/><span style="font-size:16px">誓师大会</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 2017年百得胜小家居战略全面推进中，T6项目特训营的培训成果将大大提升百得胜团队战斗力和品牌竞争力，为下半年的全国推广打下坚实基础。系统运营+体验营销，百得胜军团已经吹响2017年胜利的号角，战斗吧小伙伴！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/753e76e0fffc1271ddd1e2e8209d7ec6.png', '2017/12/28', '佚名', '3', '0', '0');
INSERT INTO `bds_news` VALUES ('4', '百得胜张健：成品OR定制？用户说了算！', '92', '<p><span style="font-size:16px">第38届名家具展暨中国(东莞)国际定制家居展在8月11日拉开帷幕，沉淀十八年后，东莞家具展已经进入三展联动时代，而在第十九个年头，首届中国(东莞)国际定制家居展览会无疑成为东莞展最大亮点。在万众瞩目的展会上，慧亚传媒记者采访到百得胜执行总裁张健先生，下面，请跟随记者的镜头走进这家优质企业吧。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/888/图片1.JPG"/><br/>专访嘉宾：百得胜执行总裁 张健</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：张总您好，百得胜是首次参加成品定制的展览吗？参展类型与以往存在些微差异，对此，企业作了哪些准备？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：百得胜是第一次参加成品家具展，大家都知道，成品家具在珠三角乃至全国地区都有影响力，而定制家居又发源于建材，双方间有着千丝万缕的关系。而如今，成品往定制走，定制往大家居去走，相互之间迟早需要碰面，所以这次我们都相当“诚惶诚恐”，毕竟，成品家具在工艺、设计上都比定制家居、建材行业成熟，所以这次，我们是抱着学习的态度来参展的。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片2.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片3.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片4.png"/><br/>参展人潮络绎不绝</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：成品家具与定制市场打得火热，而本次展会的举办也正好印证了这一点，您怎么看待两者的共融？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：现在的市场竞争激烈，成品和定制融合，或者定制有更多的成品化方向，成品有更多定制化的方向，市场的最终走向还是依靠用户的选择来判定，基于用户的需求，两者都有各自的优缺点，不管成品还是定制市场，用户说好，才算真的好。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片5.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片6_副本.png"/><br/>百得胜膜压工艺托斯卡纳新品展示</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：如果用一个关键词来形容您在百得胜近几年的总体情况，您会选择用什么词呢？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：“责任”，近几年，百得胜所走的路与其他定制品牌不尽相同，挑战和机遇并存。进入资本市场之后，因为体量偏小，面对资本市场的竞争和压力很大，同行对百得胜也投放了相当大的预期，因此，要肩负起对公司、团队、乃至于整个经销商体系的责任，百得胜必须要以更好的表现展露人前，对大家有一个合理交代，所以我认为责任是关键词。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：“无人工厂”的生产模式渐渐走红，机器正慢慢地代替人工，那您觉得在这样的趋势下这种模式有什么利和弊呢？</span></strong></p><p><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：我认为，不能独立地以产业或行业的特点去看待“无人工厂”的模式，从根本上还是要从两个层面解读，首先是从用户的角度出发，不管是无人化还是机械化，当它的发展能够贴合用户需要，那便是合适的；其次，从产业链的角度思考，无人化或者智能化是涉及“术”的层面，技术，从本质上说，技术的升级是围绕着企业的经营活动去服务的，经营活动是否需要技术更新？要如何更新？这都要企业从更高的维度去思考，从技术层面上进行反思，想法成熟以后再以AI、智能、无人设备去替代人工，完成升级布局。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
技术的升级、器材的配备都需要讲求深度和适用性，这也与行业的高度、宽度有关。即使企业把设备制造得非常精良，但是通过该设备制造出来的产品不受用户喜欢，或者它被更高阶的行业配套所覆盖掉，那么，哪怕是三头六臂的顶尖设备也起不到一丁点作用。当别人都使用枪了，即使你拥有最锋利的宝剑又如何？</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片7.png"/></span></p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2017-08/818/图片8.png"/></span></p><p><span style="font-size:16px">参展人潮络绎不绝</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：智能化又逐渐兴起，你觉得目前的智能家居对于消费者和企业自身发展而言，是一块鸡肋吗？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：智能家居不是鸡肋，它是未来的必然发展趋势。我认为，未来智能家居的入口将是手机，近几年定制家居发展迅猛，是因为它抢占了家具建材行业的入口，而智能的入口不是家居，是手机。企业、顾客能通过移动端时刻掌握智能化的动态，完成功能性的操作，大大便于消费者的生活，相信不久的将来普及度会有所提升。而针对用户的使用习惯进行合理的研发，将是企业决胜的关键。</span></p><p><span style="font-size:16px">&nbsp;</span><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：张总，下半年百得胜的发展关键词是什么？</span></strong></p><p><strong><span style="font-size:16px">&nbsp;</span></strong></p><p><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：扎好马步，苦练内功，少说多干。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><strong><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 慧亚传媒：感谢张总一番精彩解读，祝愿百得胜能走出更强劲的姿态！</span></strong></p><p><br/><span style="font-size:16px"><strong>&nbsp;&nbsp;&nbsp; 张总</strong>：谢谢大家。</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/b010641eddf3df313768641f253cb8a7.png', '2017-12-28', '佚名', '4', '0', '0');
INSERT INTO `bds_news` VALUES ('5', '偶像来了! 黄家强来了！百得胜第一大店来了！', '93', '<p><span style="font-size:16px">2016年11月6日<br/>百得胜第一大店<br/>百得胜温州千方旗舰店将盛大开业<br/>Beyond成员<strong>黄家强</strong>亲临助阵<br/>倾力打造摇滚音乐盛会<br/>摇出实惠、摇出惊喜<br/>摇出百万现金送送送</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）107_副本.jpg"/></p><p>&nbsp;<br/><span style="font-size:16px">金秋时节，再现光辉岁月<br/>携手Beyond成员黄家强<br/>全力打造温州摇滚狂欢节<br/><strong>一起致敬永不退场的青春<br/>致敬Beyond</strong></span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）169.png"/></p><p>&nbsp;</p><p><span style="font-size:16px">继平安、辛晓琪、周海媚、陈德容......<br/>百得胜再次为您打造超强音乐盛会</span></p><p>&nbsp;</p><p><img alt="" src="http://www.paterson.com.cn/UploadFiles/2016-09/927/偶像来了!%20%20男神来了！黄家强来了！（2）209.png"/></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>11月6日<br/>百得胜温州千方旗舰店盛大开业<br/>Beyond成员黄家强摇滚音乐会<br/><span style="color:#f70938">花椒、一直播同步直播</span></strong></span></p><p><span style="font-size:16px"><strong>敬请关注，一起狂欢！</strong></span></p><p><br/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20171228/ded4605581a7b0bfc3c386ae14a7b58e.png', '2017/12/28', '佚名', '5', '8', '0');
INSERT INTO `bds_news` VALUES ('14', '百得胜助力集团公司德尔未来打造“中国足球未来星”南京体验活动进行中', '93', '<p><span style="font-size:16px"><br/></span></p><p><span style="font-size:16px"><span style="font-size:16px">百得胜助力集团公司德尔未来携手国际冠军杯足球赛，共同助力打造“中国足球未来星”体验活动落地南京</span></span><br/><span style="font-size:16px">南京40度的高温也抵不住球迷的热情</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜为集团公司德尔未来作为国际冠军杯中国赛高级赞助商助力，为广大喜爱百得胜环保定制的顾客朋友带去了众多优惠及福利！价值999元的冠军杯南京站限量球票幸运降临一波百得胜顾客朋友身上。</span></p><p><span style="font-size:16px">国际冠军杯南京赛999元门票幸运得主在百得胜不亦说乎！</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 更多福利，更多放心，更多开心，尽在百得胜专卖店......喜获国际冠军杯门票的幸运儿，今晚就可以凭票开开心心去现场看球，面见国际巨星，更可近距离一饱一大波足球宝贝的靓丽身影眼福，今晚，南京奥体中心见。</span></p><p>&nbsp;</p><p><br/></p><p><br/></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/425b4567276a7b6e3b20d462bc98bac4.JPG', '2018-01-08', '原创', '6', '1', '0');
INSERT INTO `bds_news` VALUES ('15', '平安“震撼”登场 好声音唱响广西百得胜', '93', '<p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西1.jpg"/></span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>来了、来了，平安来了！！！</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 等待了一个多月，终于等到今天！5月31日下午百得胜代言人——实力派歌手平安莅临广西首家无醛添加衣柜馆将盛大开业活动现场火热献唱，为百得胜广西首家无醛添加衣柜馆开业优惠活动助威！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西2.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西图3.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西4.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜、富安居相关领导以及广西十多家媒体见证了百得胜广西首家无醛添加衣柜馆盛大开业的剪彩仪式。</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西5.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西6.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西7.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西8.jpg"/></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>疯狂、震撼——“好声音”嗨翻全场</strong><br/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 平安携百得胜环保衣柜“价临”广西富安居中庭！广西富安居建材城内人气火爆，中庭、各楼层都挤满了大批歌迷粉丝、顾客朋友们，人气极其火爆！<br/></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 现场平安演唱《云淡风轻》、《洋葱》等多首经典歌曲，一首《我爱你中国》更是震撼全场，全场气氛彻底达到沸点，现场粉丝们之尖叫疯狂！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西9.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 平安出现活动现场，全场热情急速引爆！</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西10.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 好声音震撼疯狂的平安粉丝团</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西11.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;活动现场奶爸、奶妈也追星</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西12.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 现场座无虚席，现场十分火爆</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西13.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>开业优惠更疯狂</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 为了庆祝百得胜衣柜广西首家无醛添加馆开业活动，除了邀请当红歌手平安现场献唱，活动现场开业优惠更疯狂——20万现金现场返现、无醛添加系列满5000抵10000、现场购买赠送价值880元鞋柜、与明星平安近距离合影留念……</span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜广西首家无醛添加衣柜馆盛大开业活动圆满成功！大家不仅享受到了优厚的贵宾服务，享受到工厂直供的价格，还感受到了歌手平安现场带给众人的震撼视听盛宴。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西14.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西15.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西16.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西17.png"/></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 
百得胜精研环保定制衣柜14年，尤其在近年，通过不断的努力，打造出无醛添加系列定制家具。百得胜衣柜，优选无醛添加密度板、颗粒板、实木芯，凭借极致环保的无醛添加材质，获得越来越多消费者厚爱追捧！2015年，百得胜携手平安，以无醛添加环保产品为核心，努力打造“平安的家，百得胜定制”的环保家居。</span></p><p><span style="font-size:16px">&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西18.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-06/广西南宁/广西19.jpg"/></span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/1ad5f148a23ad52be41ac8ad602a4dfa.jpg', '2018-01-08', '原创', '7', '0', '0');
INSERT INTO `bds_news` VALUES ('16', '哈尔滨，平安来了! 百得胜火了！', '93', '<p><span style="font-size:16px">4月25日，百得胜哈尔滨旗舰店盛大开业。歌手平安亲临现场助阵，为开业优惠活动加油助威，活动现场声势浩大，气氛火爆，创造百得胜开业活动新传奇！</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安1.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安2.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 高空彩球飘扬，现场众人热忱静候平安</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安3.jpg"/></span><span style="font-size:16px"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 气势雄伟的气飘与彩旗，格外惹人关注</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安4.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现场座无虚席，十分火爆</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安5.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排队签单长龙，见头不见尾</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安6.png"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 哈尔滨，惊现北京，深圳的平安粉丝团</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安7.jpg"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平安一到场，引众人纷纷抢拍</span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/哈尔滨，平安/哈尔滨，平安9.jpg"/><br/></span><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平安现场献歌，响彻现场</span><span style="font-size:16px"><br/>&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 本次哈尔滨百得胜旗舰店盛大开业活动圆满成功！现场，大家不仅享受到了优厚的贵宾服务，享受到工厂直供的价格，还感受到了歌手平安现场带给众人的视听盛宴......众消费者纷纷表示不虚此行！</span><span style="font-size:16px"><br/>&nbsp;</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜衣柜经历14的时间沉淀，不仅在行业内享有“环保定制衣柜”的美誉，还获得消费者的广泛认可和各权威机构的认证。用事实见证实力，书写环保定制新传奇。</span>&nbsp;</p><p><span style="font-size:16px"><br/>&nbsp;&nbsp;&nbsp; 平安的家，百得胜定制。再见亦再见！425哈尔滨，再见！51武汉再见，不见不散！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/7237891f8f20f163945513e7653d868e.png', '2018-01-08', '百得胜', '8', '1', '0');
INSERT INTO `bds_news` VALUES ('17', '中国平安万里行——成都首站！4.25, GO百得胜', '93', '<p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里1.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; <strong>2015年4月25日下午13:00<br/></strong>&nbsp;&nbsp;&nbsp; <strong>成都高新区都会路99号富森?美家居建材MALL负一楼中庭百得胜衣柜。</strong><br/>&nbsp;&nbsp;&nbsp; 百得胜工厂质检总监亲临成都，给成都的消费者分享真正的家居装修环保知识！让你了解什么叫甲醛0释放时代，如何让家人生活在一个安全无忧的绿色空间！</span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里2.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里3.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里4.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里5.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里6.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里7.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里8.png"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span style="color:#e6421a">4.25，来成都百得胜衣柜，为您省到家！</span></strong></span></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里9.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里10.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里11.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里12.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 百得胜衣柜进驻成都后，环保健康家居理念逐渐深入人心。<br/>&nbsp;&nbsp;&nbsp; 百得胜全屋收纳定制要做的，就是持之以恒地研发环保定制衣柜产品，为消费者打造安全健康的家居生活。<br/><strong>&nbsp;&nbsp;&nbsp; 更多套餐，敬请到店详询....</strong><br/><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动VIP专线：028-61559394</strong> </span></span></p><p><span style="font-size:16px;color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动时间：2015年4月25日</strong> </span></p><p><span style="font-size:16px"><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>签到时间：下午13:00-13:30</strong> </span></span></p><p><span style="font-size:16px"><span style="color:#e61a1a">&nbsp;&nbsp;&nbsp; <strong>活动地点：成都高新区都会路99号富森?美家居建材MALL负一楼中庭</strong></span></span><span style="font-size:16px"> </span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里13.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里14.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里15.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里16.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里17.jpg"/></span></p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-04/平安万里行/中国平安万里18.jpg"/><br/></span><span style="font-size:16px"><br/></span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/97db874c92269efa2485e255355222c5.jpg', '2018-01-08', '百得胜', '9', '0', '0');
INSERT INTO `bds_news` VALUES ('18', '女神真都来了，让大家与百得胜有了更契合的 “情感密码”', '93', '<p><span style="font-size:16px">大事件,女神真都来南宁百得胜了！！！<br/>惊呆了！抢疯了！嗨疯了！爽翻了！</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神1.jpg"/></span></p><p><br/><span style="font-size:16px">8月30日，娱乐气旋席卷南宁。<br/>南宁富安居百得胜，<br/>双强飓“疯”来袭，<br/>两大台湾实力派唱将，<br/>疗伤系情歌天后辛晓琪来了，<br/>“小张惠妹”简语卉也真来了！<br/>齐聚南宁，亲临南宁富安居百得胜衣柜，<br/>同台飙歌，以歌会友，情动南宁，律动青春情怀。<br/>火力助推南宁百得胜第6家无醛添加馆火爆开业，<br/>一起为百得胜环保而歌。<br/>南宁百得胜衣柜，<br/>迎来了三伏天后的又一次热潮。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神2.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>女神潇洒进场，彻底点燃了现场观众粉丝们的热情</strong></span></p><p><br/><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 在一片片热烈的欢呼声中，两大女神潇洒入场，点燃了场观众粉丝们的热情。现场的观众朋友们纷纷拍照录像，现场顿时火爆,引起粉丝疯狂尖叫。<br/>&nbsp;&nbsp;&nbsp; 辛晓琪与“阿妹”登台开唱，互相飙歌。噢噢噢……天后嗓喉一开，赢得观众阵阵掌声，<br/>嗨翻现场！</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神3.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神4.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神5.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神6.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神7.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神8.jpg"/></span></p><p><br/><span style="font-size:16px">两大女神，以情为律，为百得胜环保而歌，<br/>一首风靡一代人的《味道》，<br/>一首一辈子的《深情难了》，<br/>还有浪漫甜蜜的《玫瑰花》，<br/>相伴一生的《牵手》<br/>引爆大家最难忘的记忆高潮，<br/>动情的味道，幸福的玫瑰，一辈子的情缘与牵手<br/>扣动了粉丝们的心弦，<br/>骚动了大家的心灵之魂，<br/>让大家在感情里顿悟.......<br/>两大女神飙歌旋风与百得胜开业抢购“疯”汇，合成最动情的情风，<br/>动听的情歌，开业的盛惠、现场的娱乐互动......高潮不停歇，狂欢不停止！<br/>让更多的消费者与百得胜衣柜有了契合的 “情感密码”。</span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神9.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神10.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>“小张惠妹”简语卉为大家献歌抽奖</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神11.jpg"/></span></p><p><br/><span style="font-size:16px"><strong>情歌天后辛晓琪为环保，提笔写下“平安的家，百得胜定制”</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神12.jpg"/></span></p><p>&nbsp;</p><p><span style="font-size:16px"><strong>哎哟，百得胜因环保而出尽了风头，爽歪歪！</strong></span></p><p>&nbsp;</p><p><span style="font-size:16px"><img alt="" src="http://www.paterson.com.cn/UploadFiles/2015-08/8-27/神13.jpg"/></span></p><p><br/><strong><span style="font-size:16px">与情歌天后合影，好嗨森！</span></strong></p><p>&nbsp;</p><p><span style="font-size:16px">&nbsp;&nbsp;&nbsp; 热情碰撞的火花，高大上的月饼现场领，红包现场大派送，豪礼现场任性抽......为南宁客户献上了视觉与听觉的璀璨盛宴。大家现场在百得胜畅享无醛的《味道》，《牵手》共建平安的家......到场客户高兴而来，满载而归，好嗨森！</span></p><p><br/></p>', 'http://localhost/bds/php/uploads/20180108/495c7251dc8de2490f87def31ea1fde4.jpg', '2018-01-08', '百得胜', '10', '1', '0');

-- ----------------------------
-- Records for `bds_order`
-- ----------------------------
INSERT INTO `bds_order` VALUES ('1', 'thinkphp', 'thihp', '1515380795', '192.168.1.138', '192.168.1.138', '0', '0');
INSERT INTO `bds_order` VALUES ('2', 'THINKPHP', 'THINKPHP', '1515383817', '192.168.1.138', '192.168.1.138', '5', '0');
INSERT INTO `bds_order` VALUES ('3', 'THINKPHP', '44', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('4', '', 'a:0:{}', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('5', 'THINKPHP', 'a:1:{s:8:"order_id";s:8:"THINKPHP";', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('6', 'LXW', 'a:2:{s:8:"order_id";s:3:"LXW";s:6:"', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('7', 'LXW', 'a:2:{s:8:"order_id";s:3:"LXW";s:6:"status";s:3:"123";}', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('8', 'LXW', '202cb962ac59075b964b07152d234b70', '', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('9', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379029', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('10', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379179', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('11', 'LXW', '202cb962ac59075b964b07152d234b70', '1515379227', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('12', 'LXW', '123', '1515379313', '', '', '0', '0');
INSERT INTO `bds_order` VALUES ('13', 'LXW', '123', '1515379412', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('14', 'LXW', '1', '1515379439', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('15', 'LXW', 'hahhh', '1515379463', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('16', 'LXW', '', '1515379595', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('17', 'LXW', 'sdddd', '1515379616', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('18', 'LXW', 'cd3f8d1414719727286eda32fda4b96d', '1515379728', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('19', 'LXW', 'sdddd', '1515383841', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('20', 'LXW', 'sdddd', '1515383844', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('21', 'LXW', 'sdddd', '1515383906', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('22', 'LXW', 'sdddd', '1515383952', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('23', 'LXW', 'sdddd', '1515384086', '192.168.1.138', '', '0', '0');
INSERT INTO `bds_order` VALUES ('24', 'LXW', 'sdddd', '1515384125', '192.168.1.138', '', '0', '1515384125');

-- ----------------------------
-- Records for `bds_product`
-- ----------------------------
INSERT INTO `bds_product` VALUES ('1', '77', 'http://localhost/bds/php/uploads/20171228/bb968e4538193927f5aa2b7645c5e2fa.png', '儿童房01', 'CHILDREN ROOM', '精湛工艺  执勤工艺', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514345417111456.jpg" title="1514345417111456.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514345417881463.jpg" title="1514345417881463.jpg"/></p>', '1', '2017-12-27 11:30', '1');
INSERT INTO `bds_product` VALUES ('2', '77', 'http://localhost/bds/php/uploads/20171228/7f8a4705e229604b5a0b07cbb5dcc477.png', '儿童房02', 'CHILDREN ROOM', '简约大气的设计，搭配自然细腻的木纹', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514345997399851.jpg" title="1514345997399851.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514345997835332.jpg" title="1514345997835332.jpg"/></p><p><br/></p>', '2', '2017-12-27 11:39', '7');
INSERT INTO `bds_product` VALUES ('3', '80', 'http://localhost/bds/php/uploads/20171228/34b0cb14fb3516f8e761b01da0953b0e.png', '客厅01', 'GUEST ROOM', '在美式家具基础上，融入现代设计风格', '在美式家具基础上，融入现代设计风格。古典中透露出丝丝灵动，现代中带有少许文艺。
门板线条，简洁时尚，白色为基调，融入黄色装饰部分，使产品在简洁大方的基础上增加了现代时尚气息。
既有自在不羁的个性，也在不经意中体现着休闲式的浪漫，让人体验到一种别样的轻生活、慢时光', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514355930586695.jpg" title="1514355930586695.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514355930851857.jpg" title="1514355930851857.jpg"/></p><p><br/></p>', '2', '2017-12-27 14:07', '5');
INSERT INTO `bds_product` VALUES ('4', '80', 'http://localhost/bds/php/uploads/20171228/3fac35bb7c8a86ba5fa88a0a4a9b3b5e.png', '客厅02', 'GUEST ROOM', '精湛工艺 执勤品质', '在美式家具基础上，融入现代设计风格。古典中透露出丝丝灵动，现代中带有少许文艺。
门板线条，简洁时尚，白色为基调，融入黄色装饰部分，使产品在简洁大方的基础上增加了现代时尚气息。
既有自在不羁的个性，也在不经意中体现着休闲式的浪漫，让人体验到一种别样的轻生活、慢时光', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171227/1514356445961846.jpg" title="1514356445961846.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171227/1514356445769924.jpg" title="1514356445769924.jpg"/></p><p><br/></p>', '1', '2017-12-27 14:33', '2');
INSERT INTO `bds_product` VALUES ('5', '79', 'http://localhost/bds/php/uploads/20171228/7c902985c7931eeac0becfe6f5d7572a.png', '书房系列', 'BOOKING ROOM', '精湛工艺 执勤品质', '
印象系列--B5120701新中式岭南印象-多功能房印象系列--B5120701新中式岭南印象-多功能房印象系列--B5120701新中式岭南印象-多功能房', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514428261120110.jpg" title="1514428261120110.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514428261488023.jpg" title="1514428261488023.jpg"/></p><p><br/></p>', '1', '2017-12-28 10:30', '3');
INSERT INTO `bds_product` VALUES ('6', '80', 'http://localhost/bds/php/uploads/20171228/158942b16e8cf4f7003325ee2cd2f5b3.png', '客厅系列01', 'BOOKING ROOM', '简约大气的设计，', '简约大气的设计，搭配自然细腻的木纹，让这个现代时尚的空间更显精致。', '每一款产品，每一道工序，每一个环节，从原料到质检，从设计到生产、安装不疏漏环保的任何一个环节，保证每一款产品
都经过全面环保的“绿色通道”。', '<p><img src="http://localhost/bds/php/ueditor/20171228/1514431708729991.jpg" title="1514431708729991.jpg"/></p><p><img src="http://localhost/bds/php/ueditor/20171228/1514431708631362.jpg" title="1514431708631362.jpg"/></p><p><br/></p>', '2', '2017-12-28 11:28', '6');
INSERT INTO `bds_product` VALUES ('7', '77', 'http://localhost/bds/php/uploads/20180104/e5150f8a337ecf3a6e37c218b9162ab4.png', '儿童房03', 'CHILDREN ROOM', 'CHILDREN ROOM', 'CHILDREN ROOMCHILDREN ROOMCHILDREN ROOM', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p>FGDF<br/></p>', '0', '2018-01-04 11:52', '8');
INSERT INTO `bds_product` VALUES ('8', '77', 'http://localhost/bds/php/uploads/20180104/7b516fdc9c6cfab8b5843ff8504fd20a.png', '儿童房04', 'CHILDREN ROOM', '儿童房04', '儿童房04儿童房04儿童房04', '百得胜，率先全线产品使用零甲醛释放的禾香板、FCF猎醛技术环保板以及天然植物木蜡油表面涂层实木板 ', '<p><img src="http://localhost/bds/php/ueditor/20180104/1515038177816485.png" title="1515038177816485.png"/></p><p><img src="http://localhost/bds/php/ueditor/20180104/1515038177700428.png" title="1515038177700428.png"/></p><p><br/></p>', '0', '2018-01-04 11:55', '9');

-- ----------------------------
-- Records for `bds_service`
-- ----------------------------
INSERT INTO `bds_service` VALUES ('1', '概述', '校训、模式、专业', 'http://localhost/bds/php/uploads/20180109/912d3cff130608a72ef6ce5aa26cdfd5.png', '<p class="t2 zz1">百得胜学院隶属于广州百得胜家居有限公司，是专门为百得胜经销商打造专业人才队伍的基地。学院秉承“全面为经销商提供专业知识和培养专业人才”的办学理念，立足于行业发展和经销商人员管理模式，成立专业的培训团队，组织开发有效实用的培训课程，全方位为经销商培养专业人才，帮助经销商打造人才竞争力，通过专业人才提供专业服务，从而使经销商赢得市场及忠实客户。</p><p class="t2 zz1">经过扩建后的百得胜学院教学设施齐全、设备优良，拥有1000多平米的教学场地，有公共课教室，电脑多媒体教室，安装实操教室，能同时进行设计、安装、导购等多个专业的课程，能同时容纳上百人的培训。还配套有1000多平米的公寓，为各地来学院学习的学员提供良好的住宿环境。</p><p><br/></p>', '', 'http://localhost/bds/php/uploads/20171228/c3abcee07ae9746d8001502b06ccc2f5.png', '88', '2017-12-28 16:28', '1');
INSERT INTO `bds_service` VALUES ('2', '免费送货', '', 'http://localhost/bds/php/uploads/20180104/282c87c6a29862d90503ea84605b2ddb.png', '', '', 'http://localhost/bds/php/uploads/20171228/a0c6ce31cd7ca8052774e4ca8d4b362f.png', '90', '2017-12-28 16:45', '4');
INSERT INTO `bds_service` VALUES ('3', '免费安装', '', 'http://localhost/bds/php/uploads/20180104/1f6b53852cc777c668a005a01cb63e20.png', '', '', 'http://localhost/bds/php/uploads/20171228/115e26938f6a193f8db32c130ac4a313.png', '90', '2017-12-28 16:49', '5');
INSERT INTO `bds_service` VALUES ('4', '免费维护', '', 'http://localhost/bds/php/uploads/20180104/47c9fc057f4788e7af23c910e2aef10c.png', '', '', 'http://localhost/bds/php/uploads/20171228/276702d9260bb8d273b77428c4cfc317.png', '90', '2017-12-28 16:49', '6');
INSERT INTO `bds_service` VALUES ('5', '免费维修', '', 'http://localhost/bds/php/uploads/20180104/26a0675e8972a966a93bd722c2ec7fd6.png', '', '', 'http://localhost/bds/php/uploads/20171228/a68764868bfc87782032978815db1a3c.png', '90', '2017-12-28 16:50', '7');
INSERT INTO `bds_service` VALUES ('6', '二次拆装零担忧', '', 'http://localhost/bds/php/uploads/20180104/2f94016a8d23eeeb3fe6374a950a1f83.png', '', '', 'http://localhost/bds/php/uploads/20171228/6886d073384e2f3d1140f82417f12922.png', '90', '2017-12-28 16:50', '8');
INSERT INTO `bds_service` VALUES ('7', '免费测量', '', 'http://localhost/bds/php/uploads/20180104/b00c8d6634e2e754fb23f6da481caa84.png', '', '', 'http://localhost/bds/php/uploads/20171228/59619d4b5c1b47984d0b1bd702f008fe.png', '90', '2017-12-28 16:51', '9');
INSERT INTO `bds_service` VALUES ('8', '免费设计', '', 'http://localhost/bds/php/uploads/20180104/7d2292449e0ccfe3e9254281b506131c.png', '', '', 'http://localhost/bds/php/uploads/20171228/1c989e969d4ef45bc5ffb9471a21163f.png', '90', '2017-12-28 16:52', '10');
INSERT INTO `bds_service` VALUES ('15', '校训、模式、专业', '', 'http://localhost/bds/php/uploads/20180109/50d5c07f0e4502ba289f5d08e0ade68c.png', '<p>学明白、练到位、技艺精、勿忘本</p><p>&nbsp;&nbsp;&nbsp;&nbsp;学院坚持以实用和发展为导向，以学员能够成为专业人员为目标，注重学员实际应用能力的培养，采用理论与实践相结合、所学即所用的培训理念和模拟实训的教学模式，让学员一学就用，一用就通。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;院现设置五大专业：商业发展、店面管理、衣柜设计、店面导购、衣柜安装。每个专业又设置基础课程和专业课程。</p>', '', 'http://localhost/bds/php/uploads/20180109/32bf7473f87c6f100742594307a1cf60.png', '88', '2018-01-09 11:12', '2');
INSERT INTO `bds_service` VALUES ('16', '师资、远景', '', 'http://localhost/bds/php/uploads/20180109/2e7c6f3c32b69e3d981be4e1f02c6aa7.png', '<p>&nbsp;&nbsp;&nbsp;&nbsp;学院拥有专业的师资力量，现有专兼职教师十多名，师资主要为企业内部富有实践经验的中高层管理人士和专业技术骨干以及行业内资深专家队伍。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;学院立足衣柜专业人才培养，面向全国百得胜经销商，为经销商打造专业的人才队伍，提高店面管理水平和服务质量。学院努力构建体系健全、风格独特、设施良&nbsp;&nbsp;&nbsp;&nbsp;好、功能齐全、积极进取的学习环境，力争把学院办成行业内专业人才的摇篮。</p>', '', 'http://localhost/bds/php/uploads/20180109/16a724b6d51e0dc29904968cc75999ca.png', '88', '2018-01-09 11:15', '3');

-- ----------------------------
-- Records for `bds_shou_ye`
-- ----------------------------
INSERT INTO `bds_shou_ye` VALUES ('1', '产品分类', '0', '', '', 'http://localhost/bds/php/uploads/20171228/ec531e23953d6f21f41bb43a33f6918b.png', '', '<p>首页信息产品分类背景图
 &nbsp;</p>', '1', '2017-12-28 14:04');
INSERT INTO `bds_shou_ye` VALUES ('2', '品牌故事', '0', '', '', 'http://localhost/bds/php/uploads/20171228/05103da176ab3702dea4fb5ea1ff3a18.png', '', '<p>品牌故事背景图<br/></p>', '2', '2017-12-28 14:07');
INSERT INTO `bds_shou_ye` VALUES ('3', '发展历程', '0', '', '', 'http://localhost/bds/php/uploads/20171228/11bcb15303103743ffabb02bbffb2d72.png', '', '<p>发展历程背景图<br/></p>', '3', '2017-12-28 14:07');
INSERT INTO `bds_shou_ye` VALUES ('4', '品牌文化', '0', '', '', 'http://localhost/bds/php/uploads/20171228/18bf4fdd652a9f92eee9688cc24e179c.png', '', '<p>品牌文化背景图<br/></p>', '4', '2017-12-28 14:08');
INSERT INTO `bds_shou_ye` VALUES ('5', '客服服务部分', '0', '', '', 'http://localhost/bds/php/uploads/20171228/888c8cdebe8f6ba74a4118deeb594d86.png', '', '<p>客服服务部分<br/></p>', '5', '2017-12-28 14:09');
INSERT INTO `bds_shou_ye` VALUES ('6', '产品中心banner', '64', '', '', 'http://localhost/bds/php/uploads/20171229/a8c337e29da4288410e4fed80a654212.png', '', '', '6', '2017-12-29T10:15:17.680Z');
INSERT INTO `bds_shou_ye` VALUES ('7', '品牌中心banner', '65', '', '', 'http://localhost/bds/php/uploads/20171229/05acaa8a11306c05b78520bc69c3805b.png', '', '<p>精湛工艺 至亲品质</p>', '7', '2017-12-29 18:16');
INSERT INTO `bds_shou_ye` VALUES ('8', '服务中心banner', '66', '', '', 'http://localhost/bds/php/uploads/20171229/1a8a13ca1d6d428deedebcabca0ea3b7.png', '', '', '8', '2017-12-29T10:17:31.899Z');
INSERT INTO `bds_shou_ye` VALUES ('9', '新闻中心banner', '67', '', '', 'http://localhost/bds/php/uploads/20171229/9ea5ce8243db9f042d2de0b4243e6cef.png', '', '', '9', '2017-12-29T10:18:25.771Z');
INSERT INTO `bds_shou_ye` VALUES ('10', '招商中心banner', '68', '', '', 'http://localhost/bds/php/uploads/20171229/d7bbd389aed128bf64e05b575c2aa707.png', '', '', '10', '2017-12-29T10:19:44.003Z');

-- ----------------------------
-- Records for `bds_system_config`
-- ----------------------------
INSERT INTO `bds_system_config` VALUES ('1', 'SYSTEM_NAME', '百得胜后台管理系统', '0', '1');
INSERT INTO `bds_system_config` VALUES ('2', 'SYSTEM_LOGO', 'http://localhost/bds/php/uploads/20180103/ebdac47348266ae2876a1c423f59765e.png', '0', '1');
INSERT INTO `bds_system_config` VALUES ('3', 'LOGIN_SESSION_VALID', '3600000', '0', '1');
INSERT INTO `bds_system_config` VALUES ('4', 'IDENTIFYING_CODE', '0', '0', '1');
INSERT INTO `bds_system_config` VALUES ('5', '  LOGO_TYPE', '', '0', '1');
INSERT INTO `bds_system_config` VALUES ('6', 'COPY_RIGHT', '粤ICP证12029134号', '0', '1');
INSERT INTO `bds_system_config` VALUES ('7', 'BEI_AN', '粤ICP备12029134', '0', '1');
INSERT INTO `bds_system_config` VALUES ('8', 'KEY_WORD', ' 木纹移门衣柜(欧洲红木)三格均分_木纹系列_百得胜官网，平安的家，百得胜全屋定制，定制您平安的家，无醛添加，环保衣柜', '0', '1');
INSERT INTO `bds_system_config` VALUES ('9', 'DESCRIPTION', '木纹移门衣柜(欧洲红木)三格均分_木纹系列_百得胜官网，平安的家，百得胜全屋定制，定制您平安的家，无醛添加，环保衣柜', '0', '1');
INSERT INTO `bds_system_config` VALUES ('10', 'SYSTEM_LOGO_M', 'http://localhost/bds/php/uploads/20180103/134f6d2232cd416dee6b0086f02ede44.png', '0', '1');

