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
 * Author: suvan
 * Modified: 2018.04.06 23:13
 */

-- 使用 wms 数据库
USE wms;

-- 取消外键约束
SET FOREIGN_KEY_CHECKS = 0;


-- ***************************
-- 用户权限管理系统
--    系统
--    日志
--    组织
--    权限
--    角色
--        角色 - 权限
--    用户
--        用户 - 组织
--        用户 - 权限
--        用户 - 角色
-- ***************************

-- 系统
INSERT INTO `upms_system` VALUES ('1', 'zmdi zmdi-shield-security', '/resources/wms-admin/images/wms-upms.png', '#29A176', 'http://upms.wms.cn:1111', '1', 'wms-upms-server', '用户权限管理系统', '用户权限管理系统（RBAC 细粒度用户权限、统一后台、单点登录、会话管理）', '1', '1');
INSERT INTO `upms_system` VALUES ('2', 'zmdi zmdi-wikipedia', '/resources/wms-admin/images/wms-cms.png', '#455EC5', 'http://cms.wms.cn:2222', '1', 'wms-cms-admin', '仓库库存管理系统', '仓库库存管理系统', '2', '2');

-- 日志

-- 组织
INSERT INTO `upms_organization` VALUES ('1', null, '总部', '深圳市', '1488121066236');
INSERT INTO `upms_organization` VALUES ('2', null, '北京分部', '北京市', '1488122466236');
INSERT INTO `upms_organization` VALUES ('3', null, '上海分部', '上海市', '1488122480265');
INSERT INTO `upms_organization` VALUES ('4', null, '河北分部', '河北省石家庄', '1488122493265');
INSERT INTO `upms_organization` VALUES ('5', null, '海外分部', '国外业务', '1488122502752');

-- 权限
INSERT INTO `upms_permission` VALUES ('1', '1', '0', '系统组织管理', '1', '', '', 'zmdi zmdi-accounts-list', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('2', '1', '1', '系统管理', '2', 'upms:system:read', '/manage/system/index', '', '1', '2', '2');
INSERT INTO `upms_permission` VALUES ('3', '1', '1', '组织管理', '2', 'upms:organization:read', '/manage/organization/index', '', '1', '3', '3');
INSERT INTO `upms_permission` VALUES ('4', '1', '0', '角色用户管理', '1', '', '', 'zmdi zmdi-accounts', '1', '4', '4');
INSERT INTO `upms_permission` VALUES ('5', '1', '4', '角色管理', '2', 'upms:role:read', '/manage/role/index', '', '1', '6', '6');
INSERT INTO `upms_permission` VALUES ('6', '1', '4', '用户管理', '2', 'upms:user:read', '/manage/user/index', '', '1', '5', '5');
INSERT INTO `upms_permission` VALUES ('7', '1', '0', '权限资源管理', '1', '', '', 'zmdi zmdi-lock-outline', '1', '7', '7');
INSERT INTO `upms_permission` VALUES ('8', '1', '0', '其他数据管理', '1', '', '', 'zmdi zmdi-more', '1', '12', '12');
INSERT INTO `upms_permission` VALUES ('9', '1', '12', '会话管理', '2', 'upms:session:read', '/manage/session/index', '', '1', '14', '14');
INSERT INTO `upms_permission` VALUES ('10', '1', '12', '日志记录', '2', 'upms:log:read', '/manage/log/index', '', '1', '15', '15');
INSERT INTO `upms_permission` VALUES ('11', '1', '2', '新增系统', '3', 'upms:system:create', '/manage/system/create', 'zmdi zmdi-plus', '1', '24', '24');
INSERT INTO `upms_permission` VALUES ('12', '1', '2', '编辑系统', '3', 'upms:system:update', '/manage/system/update', 'zmdi zmdi-edit', '1', '25', '25');
INSERT INTO `upms_permission` VALUES ('13', '1', '2', '删除系统', '3', 'upms:system:delete', '/manage/system/delete', 'zmdi zmdi-close', '1', '26', '26');
INSERT INTO `upms_permission` VALUES ('14', '1', '3', '新增组织', '3', 'upms:organization:create', '/manage/organization/create', 'zmdi zmdi-plus', '1', '27', '27');
INSERT INTO `upms_permission` VALUES ('15', '1', '3', '编辑组织', '3', 'upms:organization:update', '/manage/organization/update', 'zmdi zmdi-edit', '1', '28', '28');
INSERT INTO `upms_permission` VALUES ('16', '1', '3', '删除组织', '3', 'upms:organization:delete', '/manage/organization/delete', 'zmdi zmdi-close', '1', '29', '29');
INSERT INTO `upms_permission` VALUES ('17', '1', '6', '新增用户', '3', 'upms:user:create', '/manage/user/create', 'zmdi zmdi-plus', '1', '30', '30');
INSERT INTO `upms_permission` VALUES ('18', '1', '6', '编辑用户', '3', 'upms:user:update', '/manage/user/update', 'zmdi zmdi-edit', '1', '31', '31');
INSERT INTO `upms_permission` VALUES ('19', '1', '6', '删除用户', '3', 'upms:user:delete', '/manage/user/delete', 'zmdi zmdi-close', '1', '32', '32');
INSERT INTO `upms_permission` VALUES ('20', '1', '5', '新增角色', '3', 'upms:role:create', '/manage/role/create', 'zmdi zmdi-plus', '1', '33', '33');
INSERT INTO `upms_permission` VALUES ('21', '1', '5', '编辑角色', '3', 'upms:role:update', '/manage/role/update', 'zmdi zmdi-edit', '1', '34', '34');
INSERT INTO `upms_permission` VALUES ('22', '1', '5', '删除角色', '3', 'upms:role:delete', '/manage/role/delete', 'zmdi zmdi-close', '1', '35', '35');
INSERT INTO `upms_permission` VALUES ('23', '1', '39', '新增权限', '3', 'upms:permission:create', '/manage/permission/create', 'zmdi zmdi-plus', '1', '36', '36');
INSERT INTO `upms_permission` VALUES ('24', '1', '39', '编辑权限', '3', 'upms:permission:update', '/manage/permission/update', 'zmdi zmdi-edit', '1', '37', '37');
INSERT INTO `upms_permission` VALUES ('25', '1', '39', '删除权限', '3', 'upms:permission:delete', '/manage/permission/delete', 'zmdi zmdi-close', '1', '38', '38');
INSERT INTO `upms_permission` VALUES ('26', '1', '7', '权限管理', '2', 'upms:permission:read', '/manage/permission/index', null, '1', '39', '39');
INSERT INTO `upms_permission` VALUES ('27', '1', '5', '角色权限', '3', 'upms:role:permission', '/manage/role/permission', 'zmdi zmdi-key', '1', '1488091928257', '1488091928257');
INSERT INTO `upms_permission` VALUES ('28', '1', '6', '用户组织', '3', 'upms:user:organization', '/manage/user/organization', 'zmdi zmdi-accounts-list', '1', '1488120011165', '1488120011165');
INSERT INTO `upms_permission` VALUES ('29', '1', '6', '用户角色', '3', 'upms:user:role', '/manage/user/role', 'zmdi zmdi-accounts', '1', '1488120554175', '1488120554175');
INSERT INTO `upms_permission` VALUES ('30', '1', '6', '用户权限', '3', 'upms:user:permission', '/manage/user/permission', 'zmdi zmdi-key', '1', '1488092013302', '1488092013302');
INSERT INTO `upms_permission` VALUES ('31', '1', '14', '强制退出', '3', 'upms:session:forceout', '/manage/session/forceout', 'zmdi zmdi-run', '1', '1488379514715', '1488379514715');

-- 角色
INSERT INTO `upms_role` VALUES ('1', 'boss', '超级管理员', '拥有所有权限', '1', '1');
INSERT INTO `upms_role` VALUES ('2', 'admin', '管理员', '拥有除权限管理系统外的所有权限', '1487471013117', '2');
INSERT INTO `upms_role` VALUES ('3', 'user', '普通用户', '拥有所有权限', '1487471553117', '3');

-- 角色 - 权限
INSERT INTO `upms_role_permission` VALUES ('1', '1', '1');
INSERT INTO `upms_role_permission` VALUES ('2', '1', '2');
INSERT INTO `upms_role_permission` VALUES ('3', '1', '3');
INSERT INTO `upms_role_permission` VALUES ('4', '1', '4');
INSERT INTO `upms_role_permission` VALUES ('5', '1', '5');
INSERT INTO `upms_role_permission` VALUES ('6', '1', '6');
INSERT INTO `upms_role_permission` VALUES ('7', '1', '7');
INSERT INTO `upms_role_permission` VALUES ('8', '1', '8');
INSERT INTO `upms_role_permission` VALUES ('9', '1', '8');
INSERT INTO `upms_role_permission` VALUES ('10', '1', '10');
INSERT INTO `upms_role_permission` VALUES ('11', '1', '12');
INSERT INTO `upms_role_permission` VALUES ('12', '1', '13');
INSERT INTO `upms_role_permission` VALUES ('13', '1', '14');
INSERT INTO `upms_role_permission` VALUES ('14', '1', '15');
INSERT INTO `upms_role_permission` VALUES ('15', '1', '16');
INSERT INTO `upms_role_permission` VALUES ('16', '1', '17');
INSERT INTO `upms_role_permission` VALUES ('17', '1', '18');
INSERT INTO `upms_role_permission` VALUES ('18', '1', '19');
INSERT INTO `upms_role_permission` VALUES ('19', '1', '10');
INSERT INTO `upms_role_permission` VALUES ('20', '1', '20');
INSERT INTO `upms_role_permission` VALUES ('21', '1', '21');
INSERT INTO `upms_role_permission` VALUES ('22', '1', '22');
INSERT INTO `upms_role_permission` VALUES ('23', '1', '23');
INSERT INTO `upms_role_permission` VALUES ('24', '1', '24');
INSERT INTO `upms_role_permission` VALUES ('25', '1', '25');
INSERT INTO `upms_role_permission` VALUES ('26', '1', '26');
INSERT INTO `upms_role_permission` VALUES ('27', '1', '27');
INSERT INTO `upms_role_permission` VALUES ('28', '1', '28');
INSERT INTO `upms_role_permission` VALUES ('29', '1', '29');
INSERT INTO `upms_role_permission` VALUES ('30', '1', '30');
INSERT INTO `upms_role_permission` VALUES ('31', '1', '31');

-- 用户
INSERT INTO `upms_user` VALUES ('1', 'admin', '3038D9CB63B3152A79B8153FB06C02F7', '66f1b370c660445a8657bf8bf1794486', '刘淑玮', '/resources/wms-admin/images/suvan-min.jpg', '', 'liushuwei0925@gmail.com', '1', '0', '1');

-- 用户 - 组织
INSERT INTO `upms_user_organization` VALUES ('1', '1', '1');
INSERT INTO `upms_user_organization` VALUES ('2', '1', '2');
INSERT INTO `upms_user_organization` VALUES ('3', '1', '3');
INSERT INTO `upms_user_organization` VALUES ('4', '1', '4');
INSERT INTO `upms_user_organization` VALUES ('5', '1', '5');

-- 用户 - 权限
INSERT INTO `upms_user_permission` VALUES ('1', '1', '1', '1');
INSERT INTO `upms_user_permission` VALUES ('2', '1', '1', '-1');

-- 用户 - 角色
INSERT INTO `upms_user_role` VALUES ('1', '1', '1');

-- ***************************
-- 仓库库存管理系统（内容管理系统）
--    供应商
--    客户
--    货物
--    仓库
--    库存容量
--    入库记录
--    出库记录
-- ***************************

-- 供应商
INSERT INTO `cms_supplier` VALUES (1, '浙江奇同电器有限公司', '中国 浙江 温州市龙湾区 龙湾区永强大道1648号', '王泽伟', '13777771126','86827868@126.com', '1');
INSERT INTO `cms_supplier` VALUES (2, '醴陵春天陶瓷实业有限公司', '中国 湖南 醴陵市 东正街15号', '温仙容', '13974167256','23267999@126.com', '2');
INSERT INTO `cms_supplier` VALUES (3, '洛阳嘉吉利饮品有限公司', '中国 广东 佛山市顺德区 北滘镇怡和路2号怡和中心14楼', '郑绮云','26391678','22390898@qq.com', '3');

-- 客户
INSERT INTO `cms_customer` VALUES (1, '醴陵荣旗瓷业有限公司', '中国 湖南 醴陵市 嘉树乡玉茶村柏树组', '陈娟', '17716786888','23369888@136.com', '1');
INSERT INTO `cms_customer` VALUES (2, '深圳市松林达电子有限公司', '中国 广东 深圳市宝安区 深圳市宝安区福永社区桥头村桥塘路育', '刘明','85263335-820','85264958@126.com', '2');
INSERT INTO `cms_customer` VALUES (3, '郑州绿之源饮品有限公司 ', '赵志敬', '87094196', '87092165@qq.com', '中国 河南 郑州市 郑州市嘉亿东方大厦609', '3');

-- 货物
INSERT INTO `cms_goods` VALUES (1, '五孔插座西门子墙壁开关', '电器', 32, 132);
INSERT INTO `cms_goods` VALUES (2, '陶瓷马克杯', '陶瓷', 880, 93);
INSERT INTO `cms_goods` VALUES (3, '精酿苹果醋', '饮料',  312, 64);

-- 仓库
INSERT INTO `cms_warehouse` VALUES (1, '北京顺义南彩工业园区彩祥西路9号', 1111000, 86064, 7.75, '刘淑玮', '饮料类产品储存库');
INSERT INTO `cms_warehouse` VALUES (2, '广州白云石井石潭路大基围工业区', 6000000, 19968, 0.32, '刘淑玮', '电器类产品储存库');
INSERT INTO `cms_warehouse` VALUES (3, '香港北区文锦渡路（红桥新村）', 322000, 0, 0, '刘淑玮', '生活类用品储存库');

-- 仓库容量
INSERT INTO `cms_warehouse_capacity` VALUES (1, 1, 1, 4224);
INSERT INTO `cms_warehouse_capacity` VALUES (2, 2, 1, 81840);
INSERT INTO `cms_warehouse_capacity` VALUES (3, 3, 2, 19968);

-- 入库记录
INSERT INTO `cms_record_in` VALUES (1, 1, 1, 1, 20, '1487471013117');
INSERT INTO `cms_record_in` VALUES (2, 1, 1, 1, 430, '1487471015117');
INSERT INTO `cms_record_in` VALUES (3, 1, 1, 1, 600, '1487471023117');

-- 出库记录
INSERT INTO `cms_record_out` VALUES (1, 1, 1, 1, 1000, '1487471026117');
INSERT INTO `cms_record_out` VALUES (2, 1, 1, 1, 50, '1487471926117');
