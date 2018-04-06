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
 * Modified: 2018.04.06 22:11
 */

-- 创建数据库
CREATE DATABASE IF NOT EXISTS `wms` CHARACTER SET UTF8;

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
DROP TABLE IF EXISTS `upms_system`;
CREATE TABLE `upms_system` (
  `system_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标 <i class="">',
  `banner` varchar(150) DEFAULT NULL COMMENT '背景图（modules 相对路径）',
  `theme` varchar(50) DEFAULT NULL COMMENT '主题（{background：;}）',
  `basepath` varchar(100) DEFAULT NULL COMMENT '根目录（http 域名地址）',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（-1: 黑名单, 1: 正常）',
  `name` varchar(20) DEFAULT NULL COMMENT '模块系统名称（英文）',
  `title` varchar(20) DEFAULT NULL COMMENT '系统标题（页面 <span id="system_title">',
  `description` varchar(300) DEFAULT NULL COMMENT '系统描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限管理系统 - 系统表';

-- 日志
DROP TABLE IF EXISTS `upms_log`;
CREATE TABLE `upms_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
  `description` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `start_time` bigint(20) DEFAULT NULL COMMENT '操作时间（时间戳，毫秒）',
  `spend_time` int(11) DEFAULT NULL COMMENT '消耗时间（开始 -> 结束，毫秒）',
  `base_path` varchar(500) DEFAULT NULL COMMENT '根路径（http 路径）',
  `uri` varchar(500) DEFAULT NULL COMMENT 'URI（子路径）',
  `url` varchar(500) DEFAULT NULL COMMENT 'URL（完整路径，根路径 + 子路径）',
  `method` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `parameter` mediumtext COMMENT '请求参数记录',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户标识（客户端浏览器参数）',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `result` mediumtext COMMENT '响应结果',
  `permissions` varchar(100) DEFAULT NULL COMMENT '权限值',
  PRIMARY KEY (`log_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限管理系统 - 日志表';

-- 组织
DROP TABLE IF EXISTS `upms_organization`;
CREATE TABLE `upms_organization` (
  `organization_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
  `pid` int(10) DEFAULT NULL COMMENT '所属上级 id',
  `name` varchar(20) DEFAULT NULL COMMENT '组织名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '组织描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限管理系统 - 组织表';

-- 权限
DROP TABLE IF EXISTS `upms_permission`;
CREATE TABLE `upms_permission` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
  `system_id` int(10) unsigned NOT NULL COMMENT '所属系统 id',
  `pid` int(10) DEFAULT NULL COMMENT '所属上级 id',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(1: 目录, 2: 菜单, 3: 按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `uri` varchar(100) DEFAULT NULL COMMENT '子路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标（<i class="">）',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0: 禁止, 1: 正常)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限管理系统 - 权限表';

-- 角色
DROP TABLE IF EXISTS `upms_role`;
CREATE TABLE `upms_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `title` varchar(20) DEFAULT NULL COMMENT '角色标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '角色描述',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  `orders` bigint(20) NOT NULL COMMENT '排序',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限管理系統 - 角色表';

-- 角色 - 权限
DROP TABLE IF EXISTS `upms_role_permission`;
CREATE TABLE `upms_role_permission` (
  `role_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色编号（角色表 id）',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号（权限表 id）',
  PRIMARY KEY (`role_permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='用戶限管理系统 - 角色 - 权限 - 关联表';

-- 用户
DROP TABLE IF EXISTS `upms_user`;
CREATE TABLE `upms_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
  `username` varchar(20) NOT NULL COMMENT '帐号',
  `password` varchar(32) NOT NULL COMMENT '密码 MD5 (密码 + 盐)',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐（每个用户不同，随机生成）',
  `realname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(150) DEFAULT NULL COMMENT '头像（当前模块路径，例如：/resources/wms-admin/images/suvan-min.jpg）',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别（1: 男, 2: 女）',
  `locked` tinyint(4) DEFAULT NULL COMMENT '状态(0: 正常, 1:锁定)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限管理系统 - 用户表';

-- 用户 - 组织
DROP TABLE IF EXISTS `upms_user_organization`;
CREATE TABLE `upms_user_organization` (
  `user_organization_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号（用户表 id）',
  `organization_id` int(10) unsigned NOT NULL COMMENT '组织编号（组织表 id）',
  PRIMARY KEY (`user_organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限管理系统 - 用户 - 组织 - 关联表';

-- 用户 - 权限
DROP TABLE IF EXISTS `upms_user_permission`;
CREATE TABLE `upms_user_permission` (
  `user_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号（用户表 id）',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号（权限表 id）',
  `type` tinyint(4) NOT NULL COMMENT '权限类型(-1: 减权限（删除）, 1: 增权限（增加）',
  PRIMARY KEY (`user_permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限管理系统 - 用户 - 权限 - 关联表';

-- 用户 - 角色
DROP TABLE IF EXISTS `upms_user_role`;
CREATE TABLE `upms_user_role` (
  `user_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号（用户表 id）',
  `role_id` int(10) DEFAULT NULL COMMENT '角色编号（角色表 id）',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限管理系统 - 用户 - 角色 -  关联表';



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
DROP TABLE IF EXISTS `cms_supplier`;
CREATE TABLE cms_supplier (
    `supplier_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
    `company` varchar(30) NOT NULL COMMENT '公司',
    `address` varchar(100) DEFAULT NULL COMMENT '地址',
    `name` varchar(10) DEFAULT NULL COMMENT '联系人',
    `tel` varchar(20) DEFAULT NULL COMMENT '电话',
    `email` varchar(35) DEFAULT NULL COMMENT '邮箱',
    `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='仓库库存管理系统 - 供应商信息表';

-- 客户
DROP TABLE IF EXISTS `cms_customer`;
CREATE TABLE cms_customer (
	  `customer_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
    `company` varchar(30) NOT NULL COMMENT '公司',
    `address` varchar(100) DEFAULT NULL COMMENT '地址',
    `name` varchar(10) DEFAULT NULL COMMENT '联系人',
    `tel` varchar(20) DEFAULT NULL COMMENT '电话',
    `email` varchar(35) DEFAULT NULL COMMENT '邮箱',
    `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY(`customer_id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='仓库库存管理系统 - 客户信息表';

 -- 货物
DROP TABLE IF EXISTS `cms_goods`;
CREATE TABLE cms_goods(
	  `goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
    `name` varchar(30) NOT NULL COMMENT '货物名',
    `type` varchar(20) COMMENT '货物类型',
    `size` int(10) COMMENT '面积（单个货品）',
    `count` int(10) COMMENT '现有数量',
    PRIMARY KEY (`goods_id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='仓库库存管理系统 - 货物表';

-- 仓库
DROP TABLE IF EXISTS `cms_warehouse`;
CREATE TABLE cms_warehouse (
	  `warehouse_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
	  `address` varchar(100) NOT NULL COMMENT '地址',
	  `area` int(10) NOT NULL COMMENT '仓库总面积' ,
	  `goods_area` int(100) NOT NULL COMMENT '所有类型货品的占总面积',
	  `status` double(6, 2) DEFAULT 00.00 COMMENT '仓库状态 0 - 100（根据仓库使用面积进行换算）（0%：空闲，1% - 75%：正常， 75% - 90%：警告， 100%：满仓）',
    `admin` varchar(20) NOT NULL COMMENT '现任管理员',
    `description` varchar(1000) DEFAULT NULL COMMENT '仓库描述',
    primary key(`warehouse_id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='仓库库存管理系统 - 仓库信息表';

-- 仓库容量
DROP TABLE IF EXISTS `cms_warehouse_capacity`;
CREATE TABLE cms_warehouse_capacity (
	  `warehouse_capacity_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
	  `goods_id` int(10) NOT NULL COMMENT '货物编号（货物表 id）',
    `warehouse_id` int(10) NOT NULL COMMENT '仓库编号（仓库信息表 id）',
    `use_area` int(10) NOT NULL COMMENT '该类货品已使用仓库面积（货品表 size * count）',
    primary key(`warehouse_capacity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='仓库库存管理系统 - 仓库容量表';

-- 入库记录
DROP TABLE IF EXISTS `cms_record_in`;
CREATE TABLE cms_record_in (
    `record_in_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
    `supplier_id` int(10) NOT NULL COMMENT '供应商 id',
    `goods_id` int(10) NOT NULL COMMENT '货物 id',
    `warehouse_id` int(10) NOT NULl COMMENT '仓库 id',
    `amount` int(10) NOT NULL COMMENT '入库数量',
    `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`record_in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='仓库库存管理系统 - 入库记录表 - 关联表';

-- 出库记录
DROP TABLE IF EXISTS `cms_record_out`;
CREATE TABLE cms_record_out (
    `record_out_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号（自增 id）',
    `customer_id` int(10) NOT NULL COMMENT '客户 id',
    `goods_id` int(10) NOT NULL COMMENT '货物 id',
    `warehouse_id` int(10) NOT NULl COMMENT '仓库 id',
    `amount` int(10) NOT NULL COMMENT '出库数量',
    `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`record_out_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='仓库库存管理系统 - 出库记录表 - 关联表';
