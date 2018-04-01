/*
 * Source Server         : 127.0.0.1
 * Source Server Version : 50621
 * Source Host           : localhost:3306
 * Source Database       : wms
 *
 * Target Server Type    : MYSQL
 * Target Server Version : 50621
 * File Encoding         : 65001
 *
 * Date: 2018-04-01 23:43
 * author: suvan
 */

-- 使用 wms 数据库
USE wms;

-- 取消外键约束
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 内容管理系统 - 文章
-- ----------------------------
INSERT INTO `cms_article` VALUES ('3', '0', '中国经济标题1', '1', '1', '1', '1', '1', '1', '1', '0', '资讯内容', '1', '0', '0', '1', '1489827019528', '1489827019528');
INSERT INTO `cms_article` VALUES ('4', '0', '中国经济标题2', '2', '2', '2', '2', '2', '1', '1', '-1', '资讯内容', '1', '0', '0', '1', '1489827340870', '1489827340870');
INSERT INTO `cms_article` VALUES ('5', '0', '中国经济标题3', '3', '3', '3', '3', '3', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1489827581414', '1489827581414');
INSERT INTO `cms_article` VALUES ('8', '1', '日本从地球消失，我们倍(喜)感(大)心(普)痛(奔)', 'shuzheng', '网络', '', '日本消失,日本地震', '日本从地震中消失', '1', '1', '1', '好悲(gao)伤(xing)啊', '1', '12', '0', '1', '1489845594355', '1489845594355');
INSERT INTO `cms_article` VALUES ('9', '0', '中国经济标题4', '4', '4', '4', '4', '4', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460546198', '1490460546198');
INSERT INTO `cms_article` VALUES ('10', '0', '中国经济标题5', '5', '5', '5', '5', '5', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460567137', '1490460567137');
INSERT INTO `cms_article` VALUES ('11', '0', '中国经济标题6', '6', '6', '6', '6', '6', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460575304', '1490460575304');
INSERT INTO `cms_article` VALUES ('12', '0', '中国经济标题7', '7', '7', '7', '7', '7', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460582004', '1490460582004');
INSERT INTO `cms_article` VALUES ('13', '0', '中国经济标题8', '8', '8', '8', '8', '8', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460588840', '1490460588840');
INSERT INTO `cms_article` VALUES ('14', '0', '中国经济标题9', '9', '9', '9', '9', '9', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460596394', '1490460596394');
INSERT INTO `cms_article` VALUES ('15', '0', '中国经济标题10', '10', '10', '10', '10', '10', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460612370', '1490460612370');
INSERT INTO `cms_article` VALUES ('16', '0', '中国经济标题11', '11', '11', '11', '11', '11', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460782767', '1490460782767');
INSERT INTO `cms_article` VALUES ('17', '0', '中国经济标题12', '12', '12', '12', '12', '12', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460792501', '1490460792501');
INSERT INTO `cms_article` VALUES ('18', '0', '中国经济标题13', '13', '13', '13', '13', '13', '1', '1', '1', '资讯内容', '1', '0', '0', '1', '1490460800634', '1490460800634');
INSERT INTO `cms_article` VALUES ('19', '0', '人为什么谈恋爱？', 'test', 'test', 'test', 'test', 'test', '1', '1', '1', '人为什么谈恋爱？', '1', '0', '0', '2', '1490460800635', '1490460800635');
INSERT INTO `cms_article` VALUES ('20', '0', 'java开发笔记', 'test', 'test', 'test', 'test', 'test', '1', '1', '1', '好记性不如烂笔头', '1', '0', '0', '3', '1490460800636', '1490460800636');

-- ----------------------------
-- 内容管理系统 - 文章 - 分类
-- ----------------------------
INSERT INTO `cms_article_category` VALUES ('1', '3', '6');
INSERT INTO `cms_article_category` VALUES ('2', '4', '6');
INSERT INTO `cms_article_category` VALUES ('3', '5', '6');
INSERT INTO `cms_article_category` VALUES ('4', '9', '6');
INSERT INTO `cms_article_category` VALUES ('5', '10', '6');
INSERT INTO `cms_article_category` VALUES ('6', '11', '6');
INSERT INTO `cms_article_category` VALUES ('7', '12', '6');
INSERT INTO `cms_article_category` VALUES ('8', '12', '6');
INSERT INTO `cms_article_category` VALUES ('9', '13', '6');
INSERT INTO `cms_article_category` VALUES ('10', '14', '6');
INSERT INTO `cms_article_category` VALUES ('11', '15', '6');
INSERT INTO `cms_article_category` VALUES ('12', '16', '6');
INSERT INTO `cms_article_category` VALUES ('13', '17', '6');
INSERT INTO `cms_article_category` VALUES ('14', '18', '6');
INSERT INTO `cms_article_category` VALUES ('15', '8', '7');
INSERT INTO `cms_article_category` VALUES ('16', '19', '8');
INSERT INTO `cms_article_category` VALUES ('17', '20', '9');

-- ----------------------------
-- 内容管理系统 - 文章 - 标签
-- ----------------------------
INSERT INTO `cms_article_tag` VALUES ('1', '19', '4');
INSERT INTO `cms_article_tag` VALUES ('2', '20', '5');

-- ----------------------------
-- 内容管理系统 - 分类
-- ----------------------------
INSERT INTO `cms_category` VALUES ('5', null, '1', '经济', '经济类目', '', '1', 'economic', '1', '1489590733919', '1489590733919');
INSERT INTO `cms_category` VALUES ('6', '5', '2', '中国经济', '中国经济类目', '', '1', 'chinaeconomic', '1', '1489590768989', '1489590768989');
INSERT INTO `cms_category` VALUES ('7', '5', '2', '日本经济', '日本经济类目', '', '1', 'japaneconomic', '1', '1491636586316', '1491636586316');
INSERT INTO `cms_category` VALUES ('8', null, '1', '人类', '人类问题', '', '1', 'people', '2', '1491636586317', '1491636586317');
INSERT INTO `cms_category` VALUES ('9', null, '1', '技术', '技术博文', null, '1', 'technic', '3', '1491636586318', '1491636586318');

-- ----------------------------
-- 内容管理系统 - 分类 -标签
-- ----------------------------

-- ----------------------------
-- 内容管理系统 - 评论
-- ----------------------------
INSERT INTO `cms_comment` VALUES ('1', null, '8', '1', '1', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490535749413');
INSERT INTO `cms_comment` VALUES ('2', null, '8', '1', '2', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536186447');
INSERT INTO `cms_comment` VALUES ('3', null, '8', '1', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536192205');
INSERT INTO `cms_comment` VALUES ('4', null, '8', '1', '4', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536460544');
INSERT INTO `cms_comment` VALUES ('5', null, '8', '1', '5', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536462182');
INSERT INTO `cms_comment` VALUES ('6', null, '8', '1', '6', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536463614');
INSERT INTO `cms_comment` VALUES ('7', null, '8', '1', '7', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536464870');
INSERT INTO `cms_comment` VALUES ('8', null, '8', '1', '8', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536465926');
INSERT INTO `cms_comment` VALUES ('9', null, '8', '1', '9', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536466853');
INSERT INTO `cms_comment` VALUES ('10', null, '8', '1', '10', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '1', '1490536467821');
INSERT INTO `cms_comment` VALUES ('11', null, '19', '1', '1', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737900448');
INSERT INTO `cms_comment` VALUES ('12', null, '19', '1', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737902517');
INSERT INTO `cms_comment` VALUES ('13', null, '19', '1', '4', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737903420');
INSERT INTO `cms_comment` VALUES ('14', null, '19', '1', '5', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737904428');
INSERT INTO `cms_comment` VALUES ('15', null, '19', '1', '6', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737905236');
INSERT INTO `cms_comment` VALUES ('16', null, '19', '1', '7', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36', '2', '1491737905980');

-- ----------------------------
-- 内容管理系统 - 菜单
-- ----------------------------
INSERT INTO `cms_menu` VALUES ('1', null, '首页', '/', '_self', '1489847080380');
INSERT INTO `cms_menu` VALUES ('2', null, '问答', '/qa', '_self', '1489847186644');
INSERT INTO `cms_menu` VALUES ('3', null, '博客', '/blog', '_self', '1489847186645');
INSERT INTO `cms_menu` VALUES ('4', null, '资讯', '/news', '_self', '1489847080381');
INSERT INTO `cms_menu` VALUES ('5', null, '专题', '/topic/list', '_self', '1489847186646');
INSERT INTO `cms_menu` VALUES ('6', null, '关于', '/page/about', '_self', '1489847186647');

-- ----------------------------
-- 内容管理系统 - 页面
-- ----------------------------
INSERT INTO `cms_page` VALUES ('1', null, '关于', 'about', '作者：张恕征', '单页关键字', '单页描述', '1489839705049', '1489839705049');

-- ----------------------------
-- 内容管理系统 - 设置
-- ----------------------------
INSERT INTO `cms_setting` VALUES ('1', 'copyright', '© 2017 Zhang Shuzheng');

-- ----------------------------
-- 内容管理系统 - 系统
-- ----------------------------
INSERT INTO `cms_system` VALUES ('1', '资讯', 'news', '资讯', '1', '1');
INSERT INTO `cms_system` VALUES ('2', '问答', 'qa', '问答', '2', '2');
INSERT INTO `cms_system` VALUES ('3', '博客', 'blog', '博客', '3', '3');

-- ----------------------------
-- 内容管理系统 - 标签
-- ----------------------------
INSERT INTO `cms_tag` VALUES ('1', 'JAVA', 'java标签', '', '1', 'java', '1', '1489585694864', '1489585694864');
INSERT INTO `cms_tag` VALUES ('2', 'Android', 'android标签', '', '1', 'android', '1', '1489585720382', '1489585720382');
INSERT INTO `cms_tag` VALUES ('3', 'zheng', 'zheng标签', '', '2', 'zheng', '1', '1489585815042', '1489585815042');
INSERT INTO `cms_tag` VALUES ('4', '谈恋爱', '谈恋爱标签', '', '1', 'love', '2', '1489585815043', '1489585815043');
INSERT INTO `cms_tag` VALUES ('5', 'java', 'java标签', '', '1', 'java', '3', '1489585815044', '1489585815044');

-- ----------------------------
-- 内容管理系统 - 主题
-- ----------------------------
INSERT INTO `cms_topic` VALUES ('1', '日本地震专题', '日本经历灭国性地震，彻底沉入海底', '/topic/1', '1489843484448');


-- ----------------------------
-- 用户权限管理系统 - 日志
-- ----------------------------

-- ----------------------------
-- 用户权限管理系统 - 组织
-- ----------------------------
INSERT INTO `upms_organization` VALUES ('1', null, '总部', '北京总部', '1');
INSERT INTO `upms_organization` VALUES ('4', null, '河北分部', '河北石家庄', '1488122466236');
INSERT INTO `upms_organization` VALUES ('5', null, '河南分部', '河南郑州', '1488122480265');
INSERT INTO `upms_organization` VALUES ('6', null, '湖北分部', '湖北武汉', '1488122493265');
INSERT INTO `upms_organization` VALUES ('7', null, '湖南分部', '湖南长沙', '1488122502752');

-- ----------------------------
-- 用户权限管理系统 - 权限
-- ----------------------------
INSERT INTO `upms_permission` VALUES ('1', '1', '0', '系统组织管理', '1', '', '', 'zmdi zmdi-accounts-list', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('2', '1', '1', '系统管理', '2', 'upms:system:read', '/manage/system/index', '', '1', '2', '2');
INSERT INTO `upms_permission` VALUES ('3', '1', '1', '组织管理', '2', 'upms:organization:read', '/manage/organization/index', '', '1', '3', '3');
INSERT INTO `upms_permission` VALUES ('4', '1', '0', '角色用户管理', '1', '', '', 'zmdi zmdi-accounts', '1', '4', '4');
INSERT INTO `upms_permission` VALUES ('5', '1', '4', '角色管理', '2', 'upms:role:read', '/manage/role/index', '', '1', '6', '6');
INSERT INTO `upms_permission` VALUES ('6', '1', '4', '用户管理', '2', 'upms:user:read', '/manage/user/index', '', '1', '5', '5');
INSERT INTO `upms_permission` VALUES ('7', '1', '0', '权限资源管理', '1', '', '', 'zmdi zmdi-lock-outline', '1', '7', '7');
INSERT INTO `upms_permission` VALUES ('12', '1', '0', '其他数据管理', '1', '', '', 'zmdi zmdi-more', '1', '12', '12');
INSERT INTO `upms_permission` VALUES ('14', '1', '12', '会话管理', '2', 'upms:session:read', '/manage/session/index', '', '1', '14', '14');
INSERT INTO `upms_permission` VALUES ('15', '1', '12', '日志记录', '2', 'upms:log:read', '/manage/log/index', '', '1', '15', '15');
INSERT INTO `upms_permission` VALUES ('17', '2', '0', '标签类目管理', '1', null, null, 'zmdi zmdi-menu', '1', '17', '17');
INSERT INTO `upms_permission` VALUES ('18', '2', '17', '标签管理', '2', 'cms:tag:read', '/manage/tag/index', null, '1', '18', '18');
INSERT INTO `upms_permission` VALUES ('19', '2', '17', '类目管理', '2', 'cms:category:read', '/manage/category/index', null, '1', '19', '19');
INSERT INTO `upms_permission` VALUES ('20', '2', '0', '文章评论管理', '1', null, null, 'zmdi zmdi-collection-text', '1', '20', '20');
INSERT INTO `upms_permission` VALUES ('21', '2', '20', '文章管理', '2', 'cms:article:read', '/manage/article/index', null, '1', '21', '21');
INSERT INTO `upms_permission` VALUES ('22', '2', '20', '回收管理', '2', 'cms:article:read', '/manage/article/recycle', null, '1', '22', '22');
INSERT INTO `upms_permission` VALUES ('24', '1', '2', '新增系统', '3', 'upms:system:create', '/manage/system/create', 'zmdi zmdi-plus', '1', '24', '24');
INSERT INTO `upms_permission` VALUES ('25', '1', '2', '编辑系统', '3', 'upms:system:update', '/manage/system/update', 'zmdi zmdi-edit', '1', '25', '25');
INSERT INTO `upms_permission` VALUES ('26', '1', '2', '删除系统', '3', 'upms:system:delete', '/manage/system/delete', 'zmdi zmdi-close', '1', '26', '26');
INSERT INTO `upms_permission` VALUES ('27', '1', '3', '新增组织', '3', 'upms:organization:create', '/manage/organization/create', 'zmdi zmdi-plus', '1', '27', '27');
INSERT INTO `upms_permission` VALUES ('28', '1', '3', '编辑组织', '3', 'upms:organization:update', '/manage/organization/update', 'zmdi zmdi-edit', '1', '28', '28');
INSERT INTO `upms_permission` VALUES ('29', '1', '3', '删除组织', '3', 'upms:organization:delete', '/manage/organization/delete', 'zmdi zmdi-close', '1', '29', '29');
INSERT INTO `upms_permission` VALUES ('30', '1', '6', '新增用户', '3', 'upms:user:create', '/manage/user/create', 'zmdi zmdi-plus', '1', '30', '30');
INSERT INTO `upms_permission` VALUES ('31', '1', '6', '编辑用户', '3', 'upms:user:update', '/manage/user/update', 'zmdi zmdi-edit', '1', '31', '31');
INSERT INTO `upms_permission` VALUES ('32', '1', '6', '删除用户', '3', 'upms:user:delete', '/manage/user/delete', 'zmdi zmdi-close', '1', '32', '32');
INSERT INTO `upms_permission` VALUES ('33', '1', '5', '新增角色', '3', 'upms:role:create', '/manage/role/create', 'zmdi zmdi-plus', '1', '33', '33');
INSERT INTO `upms_permission` VALUES ('34', '1', '5', '编辑角色', '3', 'upms:role:update', '/manage/role/update', 'zmdi zmdi-edit', '1', '34', '34');
INSERT INTO `upms_permission` VALUES ('35', '1', '5', '删除角色', '3', 'upms:role:delete', '/manage/role/delete', 'zmdi zmdi-close', '1', '35', '35');
INSERT INTO `upms_permission` VALUES ('36', '1', '39', '新增权限', '3', 'upms:permission:create', '/manage/permission/create', 'zmdi zmdi-plus', '1', '36', '36');
INSERT INTO `upms_permission` VALUES ('37', '1', '39', '编辑权限', '3', 'upms:permission:update', '/manage/permission/update', 'zmdi zmdi-edit', '1', '37', '37');
INSERT INTO `upms_permission` VALUES ('38', '1', '39', '删除权限', '3', 'upms:permission:delete', '/manage/permission/delete', 'zmdi zmdi-close', '1', '38', '38');
INSERT INTO `upms_permission` VALUES ('39', '1', '7', '权限管理', '2', 'upms:permission:read', '/manage/permission/index', null, '1', '39', '39');
INSERT INTO `upms_permission` VALUES ('46', '1', '5', '角色权限', '3', 'upms:role:permission', '/manage/role/permission', 'zmdi zmdi-key', '1', '1488091928257', '1488091928257');
INSERT INTO `upms_permission` VALUES ('48', '1', '6', '用户组织', '3', 'upms:user:organization', '/manage/user/organization', 'zmdi zmdi-accounts-list', '1', '1488120011165', '1488120011165');
INSERT INTO `upms_permission` VALUES ('50', '1', '6', '用户角色', '3', 'upms:user:role', '/manage/user/role', 'zmdi zmdi-accounts', '1', '1488120554175', '1488120554175');
INSERT INTO `upms_permission` VALUES ('51', '1', '6', '用户权限', '3', 'upms:user:permission', '/manage/user/permission', 'zmdi zmdi-key', '1', '1488092013302', '1488092013302');
INSERT INTO `upms_permission` VALUES ('53', '1', '14', '强制退出', '3', 'upms:session:forceout', '/manage/session/forceout', 'zmdi zmdi-run', '1', '1488379514715', '1488379514715');
INSERT INTO `upms_permission` VALUES ('54', '2', '18', '新增标签', '3', 'cms:tag:create', '/manage/tag/create', 'zmdi zmdi-plus', '1', '1489417315159', '1489417315159');
INSERT INTO `upms_permission` VALUES ('55', '2', '18', '编辑标签', '3', 'cms:tag:update', 'zmdi zmdi-edit', 'zmdi zmdi-widgets', '1', '1489417344931', '1489417344931');
INSERT INTO `upms_permission` VALUES ('56', '2', '18', '删除标签', '3', 'cms:tag:delete', '/manage/tag/delete', 'zmdi zmdi-close', '1', '1489417372114', '1489417372114');
INSERT INTO `upms_permission` VALUES ('57', '1', '15', '删除权限', '3', 'upms:log:delete', '/manage/log/delete', 'zmdi zmdi-close', '1', '1489503867909', '1489503867909');
INSERT INTO `upms_permission` VALUES ('58', '2', '19', '编辑类目', '3', 'cms:category:update', '/manage/category/update', 'zmdi zmdi-edit', '1', '1489586600462', '1489586600462');
INSERT INTO `upms_permission` VALUES ('59', '2', '19', '删除类目', '3', 'cms:category:delete', '/manage/category/delete', 'zmdi zmdi-close', '1', '1489586633059', '1489586633059');
INSERT INTO `upms_permission` VALUES ('60', '2', '19', '新增类目', '3', 'cms:category:create', '/manage/category/create', 'zmdi zmdi-plus', '1', '1489590342089', '1489590342089');
INSERT INTO `upms_permission` VALUES ('61', '2', '0', '其他数据管理', '1', '', '', 'zmdi zmdi-more', '1', '1489835455359', '1489835455359');
INSERT INTO `upms_permission` VALUES ('62', '2', '20', '评论管理', '2', 'cms:comment:read', '/manage/comment/index', '', '1', '1489591408224', '1489591408224');
INSERT INTO `upms_permission` VALUES ('63', '2', '62', '删除评论', '3', 'cms:comment:delete', '/manage/comment/delete', 'zmdi zmdi-close', '1', '1489591449614', '1489591449614');
INSERT INTO `upms_permission` VALUES ('64', '2', '79', '单页管理', '2', 'cms:page:read', '/manage/page/index', '', '1', '1489591332779', '1489591332779');
INSERT INTO `upms_permission` VALUES ('65', '2', '64', '新增单页', '3', 'cms:page:create', '/manage/page/create', 'zmdi zmdi-plus', '1', '1489591614473', '1489591614473');
INSERT INTO `upms_permission` VALUES ('66', '2', '64', '编辑单页', '3', 'cms:page:update', '/manage/page/update', 'zmdi zmdi-edit', '1', '1489591653000', '1489591653000');
INSERT INTO `upms_permission` VALUES ('67', '2', '64', '删除单页', '3', 'cms:page:delete', '/manage/page/delete', 'zmdi zmdi-close', '1', '1489591683552', '1489591683552');
INSERT INTO `upms_permission` VALUES ('68', '2', '61', '菜单管理', '2', 'cms:menu:read', '/manage/menu/index', 'zmdi zmdi-widgets', '1', '1489591746846', '1489591746846');
INSERT INTO `upms_permission` VALUES ('69', '2', '68', '新增菜单', '3', 'cms:menu:create', '/manage/menu/create', 'zmdi zmdi-plus', '1', '1489591791747', '1489591791747');
INSERT INTO `upms_permission` VALUES ('70', '2', '68', '编辑菜单', '3', 'cms:menu:update', '/manage/menu/update', 'zmdi zmdi-edit', '1', '1489591831878', '1489591831878');
INSERT INTO `upms_permission` VALUES ('71', '2', '68', '删除菜单', '3', 'cms:menu:delete', '/manage/menu/delete', 'zmdi zmdi-close', '1', '1489591865454', '1489591865454');
INSERT INTO `upms_permission` VALUES ('72', '2', '61', '系统设置', '2', 'cms:setting:read', '/manage/setting/index', 'zmdi zmdi-widgets', '1', '1489591981165', '1489591981165');
INSERT INTO `upms_permission` VALUES ('73', '2', '72', '新增设置', '3', 'cms:setting:create', '/manage/setting/create', 'zmdi zmdi-plus', '1', '1489592024762', '1489592024762');
INSERT INTO `upms_permission` VALUES ('74', '2', '72', '编辑设置', '3', 'cms:setting:update', '/manage/setting/update', 'zmdi zmdi-edit', '1', '1489592052582', '1489592052582');
INSERT INTO `upms_permission` VALUES ('75', '2', '72', '删除设置', '3', 'cms:setting:delete', '/manage/setting/delete', 'zmdi zmdi-close', '1', '1489592081426', '1489592081426');
INSERT INTO `upms_permission` VALUES ('76', '2', '21', '新增文章', '3', 'cms:article:create', '/manage/article/create', 'zmdi zmdi-plus', '1', '1489820150404', '1489820150404');
INSERT INTO `upms_permission` VALUES ('77', '2', '21', '编辑文章', '3', 'cms:article:update', '/manage/article/update', 'zmdi zmdi-edit', '1', '1489820178269', '1489820178269');
INSERT INTO `upms_permission` VALUES ('78', '2', '21', '删除文章', '3', 'cms:article:delete', '/manage/article/delete', 'zmdi zmdi-close', '1', '1489820207607', '1489820207607');
INSERT INTO `upms_permission` VALUES ('79', '2', '0', '单页专题管理', '1', '', '', 'zmdi zmdi-view-web', '1', '1489835320327', '1489835320327');
INSERT INTO `upms_permission` VALUES ('80', '2', '79', '专题管理', '2', 'cms:topic:read', '/manage/topic/index', 'zmdi zmdi-widgets', '1', '1489591507566', '1489591507566');
INSERT INTO `upms_permission` VALUES ('81', '2', '80', '新增专题', '3', 'cms:topic:create', '/manage/topic/create', 'zmdi zmdi-plus', '1', '1489843327028', '1489843327028');
INSERT INTO `upms_permission` VALUES ('82', '2', '80', '编辑专题', '3', 'cms:topic:update', '/manage/topic/update', 'zmdi zmdi-edit', '1', '1489843351513', '1489843351513');
INSERT INTO `upms_permission` VALUES ('83', '2', '80', '删除专题', '3', 'cms:topic:delete', '/manage/topic/delete', 'zmdi zmdi-close', '1', '1489843379953', '1489843379953');
INSERT INTO `upms_permission` VALUES ('84', '2', '68', '上移菜单', '3', 'cms:menu:up', '/manage/menu/up', 'zmdi zmdi-long-arrow-up', '1', '1489846486548', '1489846486548');
INSERT INTO `upms_permission` VALUES ('85', '2', '68', '下移菜单', '3', 'cms:menu:down', '/manage/menu/down', 'zmdi zmdi-long-arrow-down', '1', '1489846578051', '1489846578051');

-- ----------------------------
-- 用户权限管理系统 - 角色
-- ----------------------------
INSERT INTO `upms_role` VALUES ('1', 'super', '超级管理员', '拥有所有权限', '1', '1');
INSERT INTO `upms_role` VALUES ('2', 'admin', '管理员', '拥有除权限管理系统外的所有权限', '1487471013117', '1487471013117');

-- ----------------------------
-- 用户权限管理系统 - 角色 - 权限
-- ----------------------------
INSERT INTO `upms_role_permission` VALUES ('1', '1', '1');
INSERT INTO `upms_role_permission` VALUES ('2', '1', '2');
INSERT INTO `upms_role_permission` VALUES ('3', '1', '3');
INSERT INTO `upms_role_permission` VALUES ('4', '1', '4');
INSERT INTO `upms_role_permission` VALUES ('5', '1', '5');
INSERT INTO `upms_role_permission` VALUES ('6', '1', '6');
INSERT INTO `upms_role_permission` VALUES ('7', '1', '7');
INSERT INTO `upms_role_permission` VALUES ('8', '1', '39');
INSERT INTO `upms_role_permission` VALUES ('12', '1', '12');
INSERT INTO `upms_role_permission` VALUES ('14', '1', '14');
INSERT INTO `upms_role_permission` VALUES ('15', '1', '15');
INSERT INTO `upms_role_permission` VALUES ('17', '1', '17');
INSERT INTO `upms_role_permission` VALUES ('19', '1', '19');
INSERT INTO `upms_role_permission` VALUES ('20', '1', '20');
INSERT INTO `upms_role_permission` VALUES ('21', '1', '21');
INSERT INTO `upms_role_permission` VALUES ('24', '1', '24');
INSERT INTO `upms_role_permission` VALUES ('27', '1', '27');
INSERT INTO `upms_role_permission` VALUES ('28', '1', '28');
INSERT INTO `upms_role_permission` VALUES ('29', '1', '29');
INSERT INTO `upms_role_permission` VALUES ('30', '1', '30');
INSERT INTO `upms_role_permission` VALUES ('31', '1', '31');
INSERT INTO `upms_role_permission` VALUES ('32', '1', '32');
INSERT INTO `upms_role_permission` VALUES ('33', '1', '33');
INSERT INTO `upms_role_permission` VALUES ('34', '1', '34');
INSERT INTO `upms_role_permission` VALUES ('35', '1', '35');
INSERT INTO `upms_role_permission` VALUES ('36', '1', '36');
INSERT INTO `upms_role_permission` VALUES ('37', '1', '37');
INSERT INTO `upms_role_permission` VALUES ('38', '1', '38');
INSERT INTO `upms_role_permission` VALUES ('39', '1', '46');
INSERT INTO `upms_role_permission` VALUES ('40', '1', '51');
INSERT INTO `upms_role_permission` VALUES ('44', '1', '48');
INSERT INTO `upms_role_permission` VALUES ('45', '1', '50');
INSERT INTO `upms_role_permission` VALUES ('47', '1', '53');
INSERT INTO `upms_role_permission` VALUES ('48', '1', '18');
INSERT INTO `upms_role_permission` VALUES ('49', '1', '54');
INSERT INTO `upms_role_permission` VALUES ('50', '1', '54');
INSERT INTO `upms_role_permission` VALUES ('51', '1', '55');
INSERT INTO `upms_role_permission` VALUES ('52', '1', '54');
INSERT INTO `upms_role_permission` VALUES ('53', '1', '55');
INSERT INTO `upms_role_permission` VALUES ('54', '1', '56');
INSERT INTO `upms_role_permission` VALUES ('55', '1', '57');
INSERT INTO `upms_role_permission` VALUES ('56', '1', '58');
INSERT INTO `upms_role_permission` VALUES ('57', '1', '58');
INSERT INTO `upms_role_permission` VALUES ('58', '1', '59');
INSERT INTO `upms_role_permission` VALUES ('59', '1', '60');
INSERT INTO `upms_role_permission` VALUES ('60', '1', '61');
INSERT INTO `upms_role_permission` VALUES ('61', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('62', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('63', '1', '63');
INSERT INTO `upms_role_permission` VALUES ('64', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('65', '1', '63');
INSERT INTO `upms_role_permission` VALUES ('66', '1', '64');
INSERT INTO `upms_role_permission` VALUES ('67', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('68', '1', '63');
INSERT INTO `upms_role_permission` VALUES ('69', '1', '64');
INSERT INTO `upms_role_permission` VALUES ('70', '1', '65');
INSERT INTO `upms_role_permission` VALUES ('71', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('72', '1', '63');
INSERT INTO `upms_role_permission` VALUES ('73', '1', '64');
INSERT INTO `upms_role_permission` VALUES ('74', '1', '65');
INSERT INTO `upms_role_permission` VALUES ('75', '1', '66');
INSERT INTO `upms_role_permission` VALUES ('76', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('77', '1', '63');
INSERT INTO `upms_role_permission` VALUES ('78', '1', '64');
INSERT INTO `upms_role_permission` VALUES ('79', '1', '65');
INSERT INTO `upms_role_permission` VALUES ('80', '1', '66');
INSERT INTO `upms_role_permission` VALUES ('81', '1', '67');
INSERT INTO `upms_role_permission` VALUES ('82', '1', '68');
INSERT INTO `upms_role_permission` VALUES ('83', '1', '69');
INSERT INTO `upms_role_permission` VALUES ('84', '1', '69');
INSERT INTO `upms_role_permission` VALUES ('85', '1', '70');
INSERT INTO `upms_role_permission` VALUES ('86', '1', '69');
INSERT INTO `upms_role_permission` VALUES ('87', '1', '70');
INSERT INTO `upms_role_permission` VALUES ('88', '1', '71');
INSERT INTO `upms_role_permission` VALUES ('89', '1', '72');
INSERT INTO `upms_role_permission` VALUES ('90', '1', '72');
INSERT INTO `upms_role_permission` VALUES ('91', '1', '73');
INSERT INTO `upms_role_permission` VALUES ('92', '1', '72');
INSERT INTO `upms_role_permission` VALUES ('93', '1', '73');
INSERT INTO `upms_role_permission` VALUES ('94', '1', '74');
INSERT INTO `upms_role_permission` VALUES ('95', '1', '72');
INSERT INTO `upms_role_permission` VALUES ('96', '1', '73');
INSERT INTO `upms_role_permission` VALUES ('97', '1', '74');
INSERT INTO `upms_role_permission` VALUES ('98', '1', '75');
INSERT INTO `upms_role_permission` VALUES ('99', '1', '76');
INSERT INTO `upms_role_permission` VALUES ('100', '1', '76');
INSERT INTO `upms_role_permission` VALUES ('101', '1', '77');
INSERT INTO `upms_role_permission` VALUES ('102', '1', '76');
INSERT INTO `upms_role_permission` VALUES ('103', '1', '77');
INSERT INTO `upms_role_permission` VALUES ('105', '1', '79');
INSERT INTO `upms_role_permission` VALUES ('106', '1', '80');
INSERT INTO `upms_role_permission` VALUES ('107', '1', '81');
INSERT INTO `upms_role_permission` VALUES ('108', '1', '81');
INSERT INTO `upms_role_permission` VALUES ('109', '1', '82');
INSERT INTO `upms_role_permission` VALUES ('110', '1', '81');
INSERT INTO `upms_role_permission` VALUES ('111', '1', '82');
INSERT INTO `upms_role_permission` VALUES ('112', '1', '83');
INSERT INTO `upms_role_permission` VALUES ('113', '1', '84');
INSERT INTO `upms_role_permission` VALUES ('114', '1', '84');
INSERT INTO `upms_role_permission` VALUES ('115', '1', '85');
INSERT INTO `upms_role_permission` VALUES ('121', '1', '78');
INSERT INTO `upms_role_permission` VALUES ('122', '1', '78');
INSERT INTO `upms_role_permission` VALUES ('124', '1', '25');
INSERT INTO `upms_role_permission` VALUES ('125', '1', '26');

-- ----------------------------
-- 用户权限管理系统 - 权限
-- ----------------------------
INSERT INTO `upms_system` VALUES ('1', 'zmdi zmdi-shield-security', '/resources/wms-admin/images/wms-upms.png', '#29A176', 'http://upms.wms.cn:1111', '1', 'wms-upms-server', '用户权限管理系统', '用户权限管理系统（RBAC 细粒度用户权限、统一后台、单点登录、会话管理）', '1', '1');
INSERT INTO `upms_system` VALUES ('2', 'zmdi zmdi-wikipedia', '/resources/wms-admin/images/wms-cms.png', '#455EC5', 'http://cms.wms.cn:2222', '1', 'wms-cms-admin', '仓库库存管理系统', '仓库库存管理系统', '2', '2');

-- ----------------------------
-- 用户权限管理系统 - 用户
-- ----------------------------
INSERT INTO `upms_user` VALUES ('1', 'admin', '3038D9CB63B3152A79B8153FB06C02F7', '66f1b370c660445a8657bf8bf1794486', '刘淑玮', '/resources/wms-admin/images/suvan-min.jpg', '', 'liushuwei0925@gmail.com', '1', '0', '1');
INSERT INTO `upms_user` VALUES ('2', 'admin', '285C9762F5F9046F5893F752DFAF3476', 'd2d0d03310444ad388a8b290b0fe8564', '张恕征', '/resources/wms-admin/images/avatar.jpg', '', '469741414@qq.com', '1', '0', '1493394720495');

-- ----------------------------
-- 用户权限管理系统 - 用户 - 组织
-- ----------------------------
INSERT INTO `upms_user_organization` VALUES ('19', '1', '1');
INSERT INTO `upms_user_organization` VALUES ('20', '1', '4');
INSERT INTO `upms_user_organization` VALUES ('21', '1', '5');
INSERT INTO `upms_user_organization` VALUES ('22', '1', '6');
INSERT INTO `upms_user_organization` VALUES ('23', '1', '7');

-- ----------------------------
-- 用户权限管理系统 - 用户 - 权限
-- ----------------------------
INSERT INTO `upms_user_permission` VALUES ('3', '1', '22', '-1');
INSERT INTO `upms_user_permission` VALUES ('4', '1', '22', '1');
INSERT INTO `upms_user_permission` VALUES ('5', '2', '24', '-1');
INSERT INTO `upms_user_permission` VALUES ('6', '2', '26', '-1');
INSERT INTO `upms_user_permission` VALUES ('7', '2', '27', '-1');
INSERT INTO `upms_user_permission` VALUES ('8', '2', '29', '-1');
INSERT INTO `upms_user_permission` VALUES ('9', '2', '32', '-1');
INSERT INTO `upms_user_permission` VALUES ('10', '2', '51', '-1');
INSERT INTO `upms_user_permission` VALUES ('11', '2', '48', '-1');
INSERT INTO `upms_user_permission` VALUES ('12', '2', '50', '-1');
INSERT INTO `upms_user_permission` VALUES ('13', '2', '35', '-1');
INSERT INTO `upms_user_permission` VALUES ('14', '2', '46', '-1');
INSERT INTO `upms_user_permission` VALUES ('15', '2', '37', '-1');
INSERT INTO `upms_user_permission` VALUES ('16', '2', '38', '-1');
INSERT INTO `upms_user_permission` VALUES ('17', '2', '57', '-1');
INSERT INTO `upms_user_permission` VALUES ('18', '2', '56', '-1');
INSERT INTO `upms_user_permission` VALUES ('19', '2', '59', '-1');
INSERT INTO `upms_user_permission` VALUES ('20', '2', '78', '-1');
INSERT INTO `upms_user_permission` VALUES ('21', '2', '67', '-1');
INSERT INTO `upms_user_permission` VALUES ('22', '2', '83', '-1');
INSERT INTO `upms_user_permission` VALUES ('23', '2', '71', '-1');
INSERT INTO `upms_user_permission` VALUES ('24', '2', '75', '-1');

-- ----------------------------
-- 用户权限管理系统 - 用户 - 角色
-- ----------------------------
INSERT INTO `upms_user_role` VALUES ('4', '1', '1');
INSERT INTO `upms_user_role` VALUES ('5', '1', '2');
INSERT INTO `upms_user_role` VALUES ('6', '2', '1');
INSERT INTO `upms_user_role` VALUES ('7', '2', '2');
