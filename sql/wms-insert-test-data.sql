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
INSERT INTO `upms_system` VALUES ('1', 'zmdi zmdi-shield-security', '/resources/wms-admin/images/wms-upms.png', '#29A176', 'http://upms.wms.cn:1111', '1', 'wms-upms-server', '权限管理模块', '实现 RBAC 细粒度用户权限、统一后台、单点登录、会话管理', '1', '1');
INSERT INTO `upms_system` VALUES ('2', 'zmdi zmdi-wikipedia', '/resources/wms-admin/images/wms-cms.png', '#455EC5', 'http://cms.wms.cn:2222', '1', 'wms-cms-admin', '库存管理模块', '对物流信息进行统筹规划', '2', '2');

-- 日志

-- 组织
INSERT INTO `upms_organization` VALUES ('1', null, '总部', '深圳市', '1488121066236');
INSERT INTO `upms_organization` VALUES ('2', null, '北京分部', '北京市', '1488122466236');
INSERT INTO `upms_organization` VALUES ('3', null, '上海分部', '上海市', '1488122480265');
INSERT INTO `upms_organization` VALUES ('4', null, '河北分部', '河北省石家庄', '1488122493265');
INSERT INTO `upms_organization` VALUES ('5', null, '海外分部', '国外业务', '1488122502752');

-- 【系统权限表（权限管理模块 & 库存管理模块）】
-- 【1. 权限管理模块】
-- 系统 & 组织
INSERT INTO `upms_permission` VALUES ('1', '1', '0', '系统组织管理', '1', '', '', 'zmdi zmdi-accounts-list', '1', '1', '1');
-- 系统
INSERT INTO `upms_permission` VALUES ('11', '1', '1', '系统管理', '2', 'upms:system:read', '/manage/system/index', '', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('12', '1', '11', '新增系统', '3', 'upms:system:create', '/manage/system/create', 'zmdi zmdi-plus', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('13', '1', '11', '编辑系统', '3', 'upms:system:update', '/manage/system/update', 'zmdi zmdi-edit', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('14', '1', '11', '删除系统', '3', 'upms:system:delete', '/manage/system/delete', 'zmdi zmdi-close', '1', '1', '3');
-- 组织
INSERT INTO `upms_permission` VALUES ('21', '1', '1', '组织管理', '2', 'upms:organization:read', '/manage/organization/index', '', '1', '1', '3');
INSERT INTO `upms_permission` VALUES ('22', '1', '21', '新增组织', '3', 'upms:organization:create', '/manage/organization/create', 'zmdi zmdi-plus', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('23', '1', '21', '编辑组织', '3', 'upms:organization:update', '/manage/organization/update', 'zmdi zmdi-edit', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('24', '1', '21', '删除组织', '3', 'upms:organization:delete', '/manage/organization/delete', 'zmdi zmdi-close', '1', '1', '3');
-- 角色 & 用户
INSERT INTO `upms_permission` VALUES ('3', '1', '0', '角色用户管理', '1', '', '', 'zmdi zmdi-accounts', '1', '1', '1');
-- 角色
INSERT INTO `upms_permission` VALUES ('31', '1', '3', '角色管理', '2', 'upms:role:read', '/manage/role/index', '', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('32', '1', '31', '新增角色', '3', 'upms:role:create', '/manage/role/create', 'zmdi zmdi-plus', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('33', '1', '31', '编辑角色', '3', 'upms:role:update', '/manage/role/update', 'zmdi zmdi-edit', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('34', '1', '31', '删除角色', '3', 'upms:role:delete', '/manage/role/delete', 'zmdi zmdi-close', '1', '1', '3');
INSERT INTO `upms_permission` VALUES ('35', '1', '31', '角色权限', '3', 'upms:role:permission', '/manage/role/permission', 'zmdi zmdi-key', '1', '1', '4');
-- 用户
INSERT INTO `upms_permission` VALUES ('41', '1', '3', '用户管理', '2', 'upms:user:read', '/manage/user/index', '', '1', '1', '3');
INSERT INTO `upms_permission` VALUES ('42', '1', '41', '新增用户', '3', 'upms:user:create', '/manage/user/create', 'zmdi zmdi-plus', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('43', '1', '41', '编辑用户', '3', 'upms:user:update', '/manage/user/update', 'zmdi zmdi-edit', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('44', '1', '41', '删除用户', '3', 'upms:user:delete', '/manage/user/delete', 'zmdi zmdi-close', '1', '1', '3');
INSERT INTO `upms_permission` VALUES ('45', '1', '41', '用户组织', '3', 'upms:user:organization', '/manage/user/organization', 'zmdi zmdi-accounts-list', '1', '1', '4');
INSERT INTO `upms_permission` VALUES ('46', '1', '41', '用户角色', '3', 'upms:user:role', '/manage/user/role', 'zmdi zmdi-accounts', '1', '1', '5');
INSERT INTO `upms_permission` VALUES ('47', '1', '41', '用户权限', '3', 'upms:user:permission', '/manage/user/permission', 'zmdi zmdi-key', '1', '1', '6');
-- 权限资源
INSERT INTO `upms_permission` VALUES ('5', '1', '0', '权限资源管理', '1', '', '', 'zmdi zmdi-lock-outline', '1', '1', '1');
-- 权限
INSERT INTO `upms_permission` VALUES ('51', '1', '5', '权限管理', '2', 'upms:permission:read', '/manage/permission/index', '', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('52', '1', '51', '新增权限', '3', 'upms:permission:create', '/manage/permission/create', 'zmdi zmdi-plus', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('53', '1', '51', '编辑权限', '3', 'upms:permission:update', '/manage/permission/update', 'zmdi zmdi-edit', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('54', '1', '51', '删除权限', '3', 'upms:permission:delete', '/manage/permission/delete', 'zmdi zmdi-close', '1', '1', '3');
-- 会话 & 日志
INSERT INTO `upms_permission` VALUES ('6', '1', '0', '会话日志管理', '1', '', '', 'zmdi zmdi-dns', '1', '1', '1');
-- 会话
INSERT INTO `upms_permission` VALUES ('61', '1', '6', '会话管理', '2', 'upms:session:read', '/manage/session/index', '', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('62', '1', '61', '会话强制退出', '3', 'upms:session:forceout', '/manage/session/forceout', 'zmdi zmdi-run', '1', '1', '1');
-- 日志
INSERT INTO `upms_permission` VALUES ('71', '1', '6', '日志记录', '2', 'upms:log:read', '/manage/log/index', '', '1', '1', '3');
INSERT INTO `upms_permission` VALUES ('72', '1', '71', '删除日志', '3', 'upms:log:delete', '/manage/log/delete', 'zmdi zmdi-close', '1', '1', '1');

-- 【库存管理模块】
INSERT INTO `upms_permission` VALUES ('100', '2', '0', '库存管理', '1', '', '', 'zmdi zmdi-group', '1', '1', '1');
-- 供应商
INSERT INTO `upms_permission` VALUES ('110', '2', '100', '供应商', '2', 'cms:supplier:read', '/manage/supplier/index', '', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('111', '2', '110', '新增供应商', '3', 'cms:supplier:create', '/manage/supplier/create', 'zmdi zmdi-plus', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('112', '2', '110', '编辑供应商', '3', 'cms:supplier:update', '/manage/supplier/update', 'zmdi zmdi-edit', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('113', '2', '110', '删除供应商', '3', 'cms:supplier:delete', '/manage/supplier/delete', 'zmdi zmdi-close', '1', '1', '3');
-- 客户
INSERT INTO `upms_permission` VALUES ('210', '2', '100', '客户', '2', 'cms:customer:read', '/manage/customer/index', '', '1', '1', '3');
INSERT INTO `upms_permission` VALUES ('211', '2', '210', '新增客户', '3', 'cms:customer:create', '/manage/customer/create', 'zmdi zmdi-plus', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('212', '2', '210', '编辑客户', '3', 'cms:customer:update', '/manage/customer/update', 'zmdi zmdi-edit', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('213', '2', '210', '删除客户', '3', 'cms:customer:delete', '/manage/customer/delete', 'zmdi zmdi-close', '1', '1', '3');
-- 货物
INSERT INTO `upms_permission` VALUES ('310', '2', '100', '货物', '2', 'cms:goods:read', '/manage/goods/index', '', '1', '1', '4');
INSERT INTO `upms_permission` VALUES ('311', '2', '310', '新增货物', '3', 'cms:goods:create', '/manage/goods/create', 'zmdi zmdi-plus', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('312', '2', '310', '编辑货物', '3', 'cms:goods:update', '/manage/goods/update', 'zmdi zmdi-edit', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('313', '2', '310', '删除货物', '3', 'cms:goods:delete', '/manage/goods/delete', 'zmdi zmdi-close', '1', '1', '3');
-- 仓库
INSERT INTO `upms_permission` VALUES ('410', '2', '100', '仓库', '2', 'cms:warehouse:read', '/manage/warehouse/index', '', '1', '1', '5');
INSERT INTO `upms_permission` VALUES ('411', '2', '410', '新增仓库', '3', 'cms:warehouse:create', '/manage/warehouse/create', 'zmdi zmdi-plus', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('412', '2', '410', '编辑仓库', '3', 'cms:warehouse:update', '/manage/warehouse/update', 'zmdi zmdi-edit', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('413', '2', '410', '删除仓库', '3', 'cms:warehouse:delete', '/manage/warehouse/delete', 'zmdi zmdi-close', '1', '1', '3');
-- 仓库容量
INSERT INTO `upms_permission` VALUES ('500', '2', '0', '库存监控', '1', '', '', 'zmdi zmdi-eye', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('510', '2', '500', '仓库容量实时监控', '2', 'cms:warehouse:capacity:read', '/manage/warehouse/capacity/index', '', '1', '1', '2');
-- 入库记录
INSERT INTO `upms_permission` VALUES ('600', '2', '0', '物流记录', '1', '', '', 'zmdi zmdi-book', '1', '1', '1');
INSERT INTO `upms_permission` VALUES ('610', '2', '600', '入库记录', '2', 'cms:record:in:read', '/manage/record/in/index', '', '1', '1', '2');
INSERT INTO `upms_permission` VALUES ('611', '2', '610', '新增入库记录', '3', 'cms:record:in:create', '/manage/record/in/create', '', '1', '1', '1');
-- 出库记录
INSERT INTO `upms_permission` VALUES ('710', '2', '600', '出库记录', '2', 'cms:record:out:read', '/manage/record/out/index', '', '1', '1', '3');
INSERT INTO `upms_permission` VALUES ('711', '2', '710', '新增出库记录', '3', 'cms:record:out:create', '/manage/record/out/create', '', '1', '1', '1');

-- 角色
INSERT INTO `upms_role` VALUES ('1', 'boss', '超级管理员', '拥有所有权限', '1', '1');
INSERT INTO `upms_role` VALUES ('2', 'admin', '管理员', '拥有除操作 “用户权限管理模块“ 以外的所有权限', '1', '2');
INSERT INTO `upms_role` VALUES ('3', 'user', '普通用户', '拥有部分权限', '1', '3');

-- 角色 - 权限【权限管理模块 & 库存管理模块（每个角色设置权限）】
-- 【boss 角色 - 权限管理模块】
-- 系统 & 组织
INSERT INTO `upms_role_permission` VALUES ('1', '1', '1');
INSERT INTO `upms_role_permission` VALUES ('2', '1', '11');
INSERT INTO `upms_role_permission` VALUES ('3', '1', '12');
INSERT INTO `upms_role_permission` VALUES ('4', '1', '13');
INSERT INTO `upms_role_permission` VALUES ('5', '1', '14');
INSERT INTO `upms_role_permission` VALUES ('6', '1', '21');
INSERT INTO `upms_role_permission` VALUES ('7', '1', '22');
INSERT INTO `upms_role_permission` VALUES ('8', '1', '23');
INSERT INTO `upms_role_permission` VALUES ('9', '1', '24');
-- 角色 & 用户
INSERT INTO `upms_role_permission` VALUES ('10', '1', '3');
INSERT INTO `upms_role_permission` VALUES ('11', '1', '31');
INSERT INTO `upms_role_permission` VALUES ('12', '1', '32');
INSERT INTO `upms_role_permission` VALUES ('13', '1', '33');
INSERT INTO `upms_role_permission` VALUES ('14', '1', '34');
INSERT INTO `upms_role_permission` VALUES ('15', '1', '35');
INSERT INTO `upms_role_permission` VALUES ('16', '1', '41');
INSERT INTO `upms_role_permission` VALUES ('17', '1', '42');
INSERT INTO `upms_role_permission` VALUES ('18', '1', '43');
INSERT INTO `upms_role_permission` VALUES ('19', '1', '44');
INSERT INTO `upms_role_permission` VALUES ('20', '1', '45');
INSERT INTO `upms_role_permission` VALUES ('21', '1', '46');
INSERT INTO `upms_role_permission` VALUES ('22', '1', '47');
-- 权限资源
INSERT INTO `upms_role_permission` VALUES ('23', '1', '5');
INSERT INTO `upms_role_permission` VALUES ('24', '1', '51');
INSERT INTO `upms_role_permission` VALUES ('25', '1', '52');
INSERT INTO `upms_role_permission` VALUES ('26', '1', '53');
INSERT INTO `upms_role_permission` VALUES ('27', '1', '54');
-- 会话 & 日志
INSERT INTO `upms_role_permission` VALUES ('28', '1', '6');
INSERT INTO `upms_role_permission` VALUES ('29', '1', '61');
INSERT INTO `upms_role_permission` VALUES ('30', '1', '62');
INSERT INTO `upms_role_permission` VALUES ('31', '1', '71');
INSERT INTO `upms_role_permission` VALUES ('32', '1', '72');

-- 【boss 角色 - 库存管理模块】
INSERT INTO `upms_role_permission` VALUES ('33', '1', '100');
-- 供应商
INSERT INTO `upms_role_permission` VALUES ('34', '1', '110');
INSERT INTO `upms_role_permission` VALUES ('35', '1', '111');
INSERT INTO `upms_role_permission` VALUES ('36', '1', '112');
INSERT INTO `upms_role_permission` VALUES ('37', '1', '113');
-- 客户
INSERT INTO `upms_role_permission` VALUES ('38', '1', '210');
INSERT INTO `upms_role_permission` VALUES ('39', '1', '211');
INSERT INTO `upms_role_permission` VALUES ('40', '1', '212');
INSERT INTO `upms_role_permission` VALUES ('41', '1', '213');
-- 货物
INSERT INTO `upms_role_permission` VALUES ('42', '1', '310');
INSERT INTO `upms_role_permission` VALUES ('43', '1', '311');
INSERT INTO `upms_role_permission` VALUES ('44', '1', '312');
INSERT INTO `upms_role_permission` VALUES ('45', '1', '313');
-- 仓库
INSERT INTO `upms_role_permission` VALUES ('46', '1', '410');
INSERT INTO `upms_role_permission` VALUES ('47', '1', '411');
INSERT INTO `upms_role_permission` VALUES ('48', '1', '412');
INSERT INTO `upms_role_permission` VALUES ('49', '1', '413');
-- 仓库容量
INSERT INTO `upms_role_permission` VALUES ('50', '1', '500');
INSERT INTO `upms_role_permission` VALUES ('51', '1', '510');
-- 物流记录
INSERT INTO `upms_role_permission` VALUES ('52', '1', '600');
-- 入库记录
INSERT INTO `upms_role_permission` VALUES ('53', '1', '610');
INSERT INTO `upms_role_permission` VALUES ('54', '1', '611');
-- 出库记录
INSERT INTO `upms_role_permission` VALUES ('55', '1', '710');
INSERT INTO `upms_role_permission` VALUES ('56', '1', '711');

-- 【admin 角色 - 库存管理系统（可操控库存管理模块所有权限）】
INSERT INTO `upms_role_permission` VALUES ('133', '2', '100');
-- 供应商
INSERT INTO `upms_role_permission` VALUES ('134', '2', '110');
INSERT INTO `upms_role_permission` VALUES ('135', '2', '111');
INSERT INTO `upms_role_permission` VALUES ('136', '2', '112');
INSERT INTO `upms_role_permission` VALUES ('137', '2', '113');
-- 客户
INSERT INTO `upms_role_permission` VALUES ('138', '2', '210');
INSERT INTO `upms_role_permission` VALUES ('139', '2', '211');
INSERT INTO `upms_role_permission` VALUES ('140', '2', '212');
INSERT INTO `upms_role_permission` VALUES ('141', '2', '213');
-- 货物
INSERT INTO `upms_role_permission` VALUES ('142', '2', '310');
INSERT INTO `upms_role_permission` VALUES ('143', '2', '311');
INSERT INTO `upms_role_permission` VALUES ('144', '2', '312');
INSERT INTO `upms_role_permission` VALUES ('145', '2', '313');
-- 仓库
INSERT INTO `upms_role_permission` VALUES ('146', '2', '410');
INSERT INTO `upms_role_permission` VALUES ('147', '2', '411');
INSERT INTO `upms_role_permission` VALUES ('148', '2', '412');
INSERT INTO `upms_role_permission` VALUES ('149', '2', '413');
-- 仓库容量
INSERT INTO `upms_role_permission` VALUES ('150', '2', '500');
INSERT INTO `upms_role_permission` VALUES ('151', '2', '510');
-- 物流记录
INSERT INTO `upms_role_permission` VALUES ('152', '2', '600');
-- 入库记录
INSERT INTO `upms_role_permission` VALUES ('153', '2', '610');
INSERT INTO `upms_role_permission` VALUES ('154', '2', '611');
-- 出库记录
INSERT INTO `upms_role_permission` VALUES ('155', '2', '710');
INSERT INTO `upms_role_permission` VALUES ('156', '2', '711');

-- 【user 角色 - 库存管理系统（仅仅有读取信息权限）】
INSERT INTO `upms_role_permission` VALUES ('233', '2', '100');
-- 供应商
INSERT INTO `upms_role_permission` VALUES ('234', '2', '110');
-- 客户
INSERT INTO `upms_role_permission` VALUES ('238', '2', '210');
-- 货物
INSERT INTO `upms_role_permission` VALUES ('242', '2', '310');
-- 仓库
INSERT INTO `upms_role_permission` VALUES ('246', '2', '410');
-- 仓库容量
INSERT INTO `upms_role_permission` VALUES ('250', '2', '500');
-- 物流记录（读取出入库记录）
INSERT INTO `upms_role_permission` VALUES ('252', '2', '600');
INSERT INTO `upms_role_permission` VALUES ('253', '2', '610');
INSERT INTO `upms_role_permission` VALUES ('255', '2', '710');

-- 用户
INSERT INTO `upms_user` VALUES ('1', 'boss', '3038D9CB63B3152A79B8153FB06C02F7', '66f1b370c660445a8657bf8bf1794486', '老板', '/resources/wms-admin/images/suvan-min.jpg', '', 'boss@wms.com', '1', '0', '1');
INSERT INTO `upms_user` VALUES ('2', 'admin', '3038D9CB63B3152A79B8153FB06C02F7', '66f1b370c660445a8657bf8bf1794486', '仓库管理员', '/resources/wms-admin/images/suvan-min.jpg', '', 'admin@wms.com', '1', '0', '1');
INSERT INTO `upms_user` VALUES ('3', 'user', '3038D9CB63B3152A79B8153FB06C02F7', '66f1b370c660445a8657bf8bf1794486', '普通用户', '/resources/wms-admin/images/suvan-min.jpg', '', 'user@wms.com', '1', '0', '1');

-- 用户 - 组织
INSERT INTO `upms_user_organization` VALUES ('1', '1', '1');
INSERT INTO `upms_user_organization` VALUES ('2', '1', '2');
INSERT INTO `upms_user_organization` VALUES ('3', '1', '3');
INSERT INTO `upms_user_organization` VALUES ('4', '1', '4');
INSERT INTO `upms_user_organization` VALUES ('5', '1', '5');
INSERT INTO `upms_user_organization` VALUES ('6', '2', '2');
INSERT INTO `upms_user_organization` VALUES ('7', '3', '5');

-- 用户 - 权限
INSERT INTO `upms_user_permission` VALUES ('1', '1', '1', '1');
INSERT INTO `upms_user_permission` VALUES ('2', '1', '1', '-1');

-- 用户 - 角色
INSERT INTO `upms_user_role` VALUES ('1', '1', '1');
INSERT INTO `upms_user_role` VALUES ('2', '2', '2');
INSERT INTO `upms_user_role` VALUES ('3', '3', '3');

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
