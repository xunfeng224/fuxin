/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : fuxin

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 26/03/2022 00:36:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_delivery_address', '收货地址表', NULL, NULL, 'SysDeliveryAddress', 'crud', 'com.fuxin.system', 'system', 'address', '收货地址', 'xfeng', '0', '/', '{}', 'admin', '2022-03-18 11:21:32', '', '2022-03-18 11:27:54', NULL);
INSERT INTO `gen_table` VALUES (2, 'sys_order_detail', '订单商品详情表', NULL, NULL, 'SysOrderDetail', 'crud', 'com.fuxin.system', 'system', 'orderdetail', '订单商品详情', 'xfeng', '0', '/', '{}', 'admin', '2022-03-18 17:35:01', '', '2022-03-18 17:44:09', NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_order_logistics', '订单物流表', NULL, NULL, 'SysOrderLogistics', 'crud', 'com.fuxin.system', 'system', 'logistics', '订单物流', 'xfeng', '0', '/', '{}', 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:55', NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_product', '商品表', NULL, NULL, 'SysProduct', 'crud', 'com.fuxin.system', 'system', 'product', '商品', 'xfeng', '0', '/', '{}', 'admin', '2022-03-20 10:45:06', '', '2022-03-20 11:04:29', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'address_id', '收货地址表主键id', 'bigint', 'Long', 'addressId', '1', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (2, '1', 'customer_id', '用户编号', 'bigint', 'Long', 'customerId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (3, '1', 'realname', '收件人姓名', 'varchar(50)', 'String', 'realname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (4, '1', 'telphone', '联系电话', 'varchar(11)', 'String', 'telphone', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (5, '1', 'telphone2', '备用联系电话', 'varchar(11)', 'String', 'telphone2', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (6, '1', 'country', '国家', 'varchar(10)', 'String', 'country', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (7, '1', 'province', '省份', 'varchar(10)', 'String', 'province', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (8, '1', 'city', '城市', 'varchar(10)', 'String', 'city', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (9, '1', 'area', '地区', 'varchar(10)', 'String', 'area', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (10, '1', 'street', '街道/详细收获地址', 'varchar(255)', 'String', 'street', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (11, '1', 'zip', '邮政编码', 'varchar(10)', 'String', 'zip', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (12, '1', 'is_default_address', '是否默认收获地址，1是，0否', 'tinyint', 'Long', 'isDefaultAddress', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'is_default_address', 12, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (13, '1', 'created_time', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', NULL, '1', NULL, '1', '1', 'BETWEEN', 'datetime', '', 13, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (14, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-03-18 11:21:33', '', '2022-03-18 11:27:54');
INSERT INTO `gen_table_column` VALUES (15, '2', 'order_detail_id', '订单商品详情编号', 'bigint', 'Long', 'orderDetailId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (16, '2', 'order_id', '订单编号', 'bigint', 'Long', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (17, '2', 'product_id', '商品编号', 'bigint', 'Long', 'productId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (18, '2', 'product_name', '商品名称', 'varchar(50)', 'String', 'productName', '0', '0', NULL, '1', '1', '1', NULL, 'LIKE', 'input', '', 4, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (19, '2', 'product_price', '商品价格', 'double', 'Long', 'productPrice', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (20, '2', 'product_marque', '商品型号', 'varchar(50)', 'String', 'productMarque', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (21, '2', 'product_store_barcode', '商品仓库条码', 'varchar(50)', 'String', 'productStoreBarcode', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (22, '2', 'product_mode_desc', '商品型号信息', 'json', 'String', 'productModeDesc', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', NULL, '', 8, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (23, '2', 'product_mode_params', '商品型号参数', 'json', 'String', 'productModeParams', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', NULL, '', 9, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (24, '2', 'discount_rate', '折扣比例', 'double', 'Long', 'discountRate', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (25, '2', 'discount_amount', '折扣金额', 'double', 'Long', 'discountAmount', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (26, '2', 'number', '购买数量', 'int', 'Long', 'number', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (27, '2', 'subtotal', '总金额', 'double', 'Long', 'subtotal', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (28, '2', 'is_product_exists', '商品是否下架', 'tinyint', 'Long', 'isProductExists', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', 'is_product_exists', 14, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (29, '2', 'remark', '客户备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (30, '2', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-03-18 17:35:02', '', '2022-03-18 17:44:09');
INSERT INTO `gen_table_column` VALUES (31, '3', 'orderlogistics_id', '物流表id', 'bigint', 'Long', 'orderlogisticsId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:55');
INSERT INTO `gen_table_column` VALUES (32, '3', 'order_id', '订单编号', 'bigint', 'Long', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:55');
INSERT INTO `gen_table_column` VALUES (33, '3', 'express_no', '物流单号', 'varchar(255)', 'String', 'expressNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:55');
INSERT INTO `gen_table_column` VALUES (34, '3', 'consignee_realname', '收货人姓名', 'varchar(30)', 'String', 'consigneeRealname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (35, '3', 'consignee_telphone', '联系电话', 'varchar(11)', 'String', 'consigneeTelphone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (36, '3', 'consignee_telphone2', '备用联系电话', 'varchar(11)', 'String', 'consigneeTelphone2', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (37, '3', 'consignee_address', '收货地址', 'varchar(255)', 'String', 'consigneeAddress', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (38, '3', 'consigne_zip', '邮政编码', 'varchar(20)', 'String', 'consigneZip', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (39, '3', 'logistics_type', '物流方式', 'tinyint', 'Long', 'logisticsType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'logistics_type', 9, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (40, '3', 'logistics_id', '物流商家编号', 'bigint', 'Long', 'logisticsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (41, '3', 'logistics_fee', '物流发货运费', 'int', 'Long', 'logisticsFee', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (42, '3', 'delivery_amount', '付款金额', 'int', 'Long', 'deliveryAmount', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (43, '3', 'orderlogistics_status', '物流状态', 'tinyint', 'Long', 'orderlogisticsStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'order_logistics_status', 13, 'admin', '2022-03-18 20:45:49', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (44, '3', 'logistics_settlement_status', '物流结算状态', 'tinyint', 'Long', 'logisticsSettlementStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2022-03-18 20:45:50', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (45, '3', 'logistics_result', '物流描述', 'varchar(255)', 'String', 'logisticsResult', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2022-03-18 20:45:50', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (46, '3', 'logistics_create_time', '物流发货时间', 'datetime', 'Date', 'logisticsCreateTime', '0', '0', NULL, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 16, 'admin', '2022-03-18 20:45:50', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (47, '3', 'logistics_update_time', '物流更新时间', 'datetime', 'Date', 'logisticsUpdateTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 17, 'admin', '2022-03-18 20:45:50', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (48, '3', 'logistics_settlement_time', '物流结算时间', 'datetime', 'Date', 'logisticsSettlementTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 18, 'admin', '2022-03-18 20:45:50', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (49, '3', 'logistics_pay_channel', '物流订单支付渠道', 'tinyint', 'Long', 'logisticsPayChannel', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', 'sys_pay_channel', 19, 'admin', '2022-03-18 20:45:50', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (50, '3', 'out_trade_no', '物流订单支付单号', 'varchar(255)', 'String', 'outTradeNo', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 20, 'admin', '2022-03-18 20:45:50', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (51, '3', 'reconciliation_status', '物流公司对账状态', 'tinyint', 'Long', 'reconciliationStatus', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'radio', 'reconciliation_status', 21, 'admin', '2022-03-18 20:45:50', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (52, '3', 'reconciliation_time', '物流公司对账日期', 'datetime', 'Date', 'reconciliationTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 22, 'admin', '2022-03-18 20:45:50', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (53, '3', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2022-03-18 20:45:50', '', '2022-03-18 20:52:56');
INSERT INTO `gen_table_column` VALUES (54, '4', 'product_id', '商品编号id', 'bigint', 'Long', 'productId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (55, '4', 'product_name', '商品名称', 'varchar(50)', 'String', 'productName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (56, '4', 'avatar', '商品图片地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (57, '4', 'product_price', '商品价格', 'double(10,2)', 'BigDecimal', 'productPrice', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (58, '4', 'product_marque', '商品型号', 'varchar(50)', 'String', 'productMarque', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'product_category', 6, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (59, '4', 'product_store_barcode', '商品仓库条码', 'varchar(50)', 'String', 'productStoreBarcode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (60, '4', 'product_mode_desc', '商品型号信息', 'json', 'String', 'productModeDesc', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', NULL, '', 8, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (61, '4', 'product_mode_params', '商品型号参数', 'json', 'String', 'productModeParams', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', NULL, '', 9, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (62, '4', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, 10, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (63, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 11, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (64, '4', 'update_time', '删除时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 12, 'admin', '2022-03-20 10:45:06', NULL, '2022-03-20 11:04:29');
INSERT INTO `gen_table_column` VALUES (66, '4', 'product_category', '商品类别', 'char(1)', 'String', 'productCategory', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2022-03-20 11:03:30', '', '2022-03-20 11:04:29');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2022-03-16 08:35:52', 'admin', '2022-03-19 17:31:05', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-03-16 08:35:52', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2022-03-16 08:35:52', 'admin', '2022-03-19 17:31:38', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-03-16 08:35:52', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_customer
-- ----------------------------
DROP TABLE IF EXISTS `sys_customer`;
CREATE TABLE `sys_customer`  (
  `cus_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `cus_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客户昵称',
  `cus_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '客户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '客户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '客户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '客户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_customer
-- ----------------------------
INSERT INTO `sys_customer` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-07 18:43:18', 'admin', '2022-03-07 18:43:18', 'admin', NULL, '管理员');
INSERT INTO `sys_customer` VALUES (110, 104, '123', '123', '00', '123', '', '0', '', '123', '0', '0', '', NULL, '', '2022-03-15 09:32:30', '', NULL, NULL);
INSERT INTO `sys_customer` VALUES (111, 105, '431', '14', '00', '', '', '0', '', '', '0', '0', '', NULL, '', '2022-03-16 10:03:10', '', NULL, NULL);
INSERT INTO `sys_customer` VALUES (112, NULL, '431', '123', '00', '', '', '0', '', '', '0', '0', '', NULL, '', '2022-03-18 11:07:11', '', NULL, NULL);
INSERT INTO `sys_customer` VALUES (113, NULL, '431', '123', '00', '', '', '0', '', '', '0', '0', '', NULL, '', '2022-03-18 11:09:06', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_delivery_address
-- ----------------------------
DROP TABLE IF EXISTS `sys_delivery_address`;
CREATE TABLE `sys_delivery_address`  (
  `address_id` bigint(0) NOT NULL COMMENT '收货地址表主键id',
  `customer_id` bigint(0) NULL DEFAULT NULL COMMENT '用户编号',
  `realname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `telphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `telphone2` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备用联系电话',
  `country` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
  `area` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地区',
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '街道/详细收获地址',
  `zip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `is_default_address` tinyint(0) NULL DEFAULT NULL COMMENT '是否默认收获地址，1是，0否',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_delivery_address
-- ----------------------------
INSERT INTO `sys_delivery_address` VALUES (1, 110, 'xiaoming', '15888888888', '15888888889', '中国', '广东', '佛山', '南海区', '软件科技园', '525100', 1, '2022-03-18 11:20:56', '2022-03-18 11:20:58');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '福鑫家电有限公司', 0, '福鑫', '15888888888', 'fuxin@qq.com', '0', '0', 'admin', '2022-03-16 08:35:51', 'admin', '2022-03-17 10:55:29');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '广州总公司', 1, '福鑫', '15888888888', 'fuxin@qq.com', '0', '0', 'admin', '2022-03-16 08:35:51', 'admin', '2022-03-25 00:38:57');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-16 08:35:51', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '福鑫', '15888888888', 'fuxin@qq.com', '0', '0', 'admin', '2022-03-16 08:35:51', 'admin', '2022-03-25 00:39:09');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-16 08:35:51', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-16 08:35:51', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-16 08:35:51', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-16 08:35:51', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-16 08:35:51', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-03-16 08:35:51', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '佛山分公司', 3, NULL, NULL, NULL, '0', '0', 'admin', '2022-03-17 10:55:54', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 200, '0,100,200', '销售部门', 1, NULL, NULL, NULL, '0', '0', 'admin', '2022-03-17 10:59:38', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '未付款', '1', 'sys_order_status', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:42:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '已付款', '2', 'sys_order_status', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:42:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '已发货', '3', 'sys_order_status', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:42:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '已签收', '4', 'sys_order_status', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:42:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '退货申请中', '5', 'sys_order_status', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:43:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '退货中', '6', 'sys_order_status', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:43:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '已退货', '7', 'sys_order_status', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:43:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '取消交易', '8', 'sys_order_status', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:43:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '微信支付', '1', 'sys_pay_channel', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:51:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '支付宝支付', '2', 'sys_pay_channel', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:51:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '银行卡支付', '3', 'sys_pay_channel', NULL, 'default', 'N', '0', 'admin', '2022-03-15 18:51:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '是', '1', 'is_default_address', NULL, 'default', 'N', '0', 'admin', '2022-03-18 11:26:50', '', NULL, '为默认收货地址');
INSERT INTO `sys_dict_data` VALUES (112, 0, '否', '0', 'is_default_address', NULL, 'default', 'N', '0', 'admin', '2022-03-18 11:27:14', '', NULL, '不为默认收货地址');
INSERT INTO `sys_dict_data` VALUES (113, 0, '已下架', '0', 'is_product_exists', NULL, 'default', 'N', '0', 'admin', '2022-03-18 17:40:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 0, '未下架', '1', 'is_product_exists', NULL, 'default', 'N', '0', 'admin', '2022-03-18 17:40:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 0, '公路运输', '1', 'logistics_type', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:40:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 0, '铁路运输', '2', 'logistics_type', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:41:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 0, '水路运输', '3', 'logistics_type', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:41:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 0, '航空运输', '4', 'logistics_type', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:41:17', 'admin', '2022-03-18 20:41:47', NULL);
INSERT INTO `sys_dict_data` VALUES (119, 0, '管道运输', '5', 'logistics_type', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:41:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 0, '其他运输方式', '6', 'logistics_type', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:42:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 0, '正在入库', '1', 'order_logistics_status', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:43:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 0, '已发货', '2', 'order_logistics_status', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:43:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 0, '运输中', '3', 'order_logistics_status', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:43:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 0, '已送达', '4', 'order_logistics_status', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:43:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 0, '已签收', '5', 'order_logistics_status', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:44:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 0, '已对账', '1', 'reconciliation_status', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:45:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 0, '未对账', '0', 'reconciliation_status', NULL, 'default', 'N', '0', 'admin', '2022-03-18 20:45:14', 'admin', '2022-03-19 16:57:36', NULL);
INSERT INTO `sys_dict_data` VALUES (128, 0, '已结算', '1', 'logistics_settlement_status', NULL, 'default', 'N', '0', 'admin', '2022-03-18 21:50:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 0, '未结算', '0', 'logistics_settlement_status', NULL, 'default', 'N', '0', 'admin', '2022-03-18 21:50:27', 'admin', '2022-03-18 21:50:33', NULL);
INSERT INTO `sys_dict_data` VALUES (130, 0, '空调器具', '1', 'product_category', NULL, 'default', 'N', '0', 'admin', '2022-03-20 10:52:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 0, '制冷器具', '2', 'product_category', NULL, 'default', 'N', '0', 'admin', '2022-03-20 10:53:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 0, '清洁器具', '3', 'product_category', NULL, 'default', 'N', '0', 'admin', '2022-03-20 10:53:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 0, '照明器具', '4', 'product_category', NULL, 'default', 'N', '0', 'admin', '2022-03-20 10:53:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 0, '厨房器具', '5', 'product_category', NULL, 'default', 'N', '0', 'admin', '2022-03-20 10:53:37', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-03-16 08:35:52', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '订单状态', 'sys_order_status', '0', 'admin', '2022-03-15 18:35:35', 'admin', '2022-03-15 18:45:37', '订单状态');
INSERT INTO `sys_dict_type` VALUES (101, '支付渠道', 'sys_pay_channel', '0', 'admin', '2022-03-15 18:44:32', '', NULL, '订单及物流单支付渠道');
INSERT INTO `sys_dict_type` VALUES (102, '默认收货地址', 'is_default_address', '0', 'admin', '2022-03-18 11:25:10', '', NULL, '是否是默认收货地址');
INSERT INTO `sys_dict_type` VALUES (105, '商品是否下架', 'is_product_exists', '0', 'admin', '2022-03-18 17:39:34', '', NULL, '商品是否下架');
INSERT INTO `sys_dict_type` VALUES (107, '物流方式', 'logistics_type', '0', 'admin', '2022-03-18 20:40:21', '', NULL, '物流方式，1公路运输，2铁路运输，3水运，4航空运输，5管道运输，6其他运输方式');
INSERT INTO `sys_dict_type` VALUES (108, '物流状态', 'order_logistics_status', '0', 'admin', '2022-03-18 20:43:07', 'admin', '2022-03-18 20:43:17', '物流状态，1正在入库，2已发货，3运输中，4已送达，5已签收');
INSERT INTO `sys_dict_type` VALUES (109, '物流公司对账状态', 'reconciliation_status', '0', 'admin', '2022-03-18 20:44:57', '', NULL, '物流公司对账状态');
INSERT INTO `sys_dict_type` VALUES (110, '物流结算状态', 'logistics_settlement_status', '0', 'admin', '2022-03-18 21:50:08', '', NULL, '物流结算状态');
INSERT INTO `sys_dict_type` VALUES (112, '商品类别', 'product_category', '0', 'admin', '2022-03-20 10:51:58', '', NULL, '商品类别，1空调器具，2制冷器具，3清洁器具，4照明器具，5厨房器具');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-03-16 08:35:52', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-03-16 08:35:52', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-03-16 08:35:52', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-16 09:38:09');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-16 17:17:51');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-16 17:18:04');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-16 17:18:11');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-16 18:33:02');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-17 10:30:01');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-17 10:30:52');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-17 11:26:06');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-17 11:26:24');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 11:03:39');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 11:05:07');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-18 11:05:18');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 11:06:03');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 11:33:10');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 15:28:40');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 15:30:08');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 16:24:57');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 16:35:06');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 16:35:27');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-18 16:47:34');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-18 16:47:37');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 16:47:43');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 20:58:57');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-18 21:00:13');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-19 16:49:56');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-20 10:37:24');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-20 11:03:20');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-20 15:55:07');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-20 15:55:08');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-20 16:14:06');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-20 16:20:47');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-20 16:28:15');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-25 00:31:35');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-25 00:31:44');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-25 00:31:56');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-25 00:32:59');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-25 00:33:59');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-25 00:34:06');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-25 07:38:11');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-25 07:44:14');
INSERT INTO `sys_logininfor` VALUES (140, '小李', '127.0.0.1', '0', '登录成功', '2022-03-25 07:44:29');
INSERT INTO `sys_logininfor` VALUES (141, '小李', '127.0.0.1', '0', '退出成功', '2022-03-25 07:44:51');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-25 07:55:16');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '0', '退出成功', '2022-03-25 07:56:15');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '0', '登录成功', '2022-03-25 07:58:00');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2044 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-03-16 08:35:51', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-03-16 08:35:51', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-03-16 08:35:51', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-03-16 08:35:51', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-03-16 08:35:51', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-03-16 08:35:51', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-03-16 08:35:51', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-03-16 08:35:51', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-03-16 08:35:51', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2022-03-16 08:35:51', 'admin', '2022-03-19 17:32:37', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '1', '0', 'system:notice:list', 'message', 'admin', '2022-03-16 08:35:51', 'admin', '2022-03-19 17:32:42', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-03-16 08:35:51', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-03-16 08:35:51', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-03-16 08:35:51', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2022-03-16 08:35:51', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2022-03-16 08:35:51', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-03-16 08:35:51', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-03-16 08:35:51', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-03-16 08:35:51', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-03-16 08:35:51', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2022-03-16 08:35:51', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2022-03-16 08:35:51', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '订单信息', 2012, 1, 'order', 'system/order/index', NULL, 1, 0, 'C', '0', '0', 'system:order:list', 'order', 'admin', '2022-03-16 09:51:09', 'admin', '2022-03-19 17:44:25', '订单菜单');
INSERT INTO `sys_menu` VALUES (2001, '订单查询', 2000, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:query', '#', 'admin', '2022-03-16 09:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '订单新增', 2000, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:add', '#', 'admin', '2022-03-16 09:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '订单修改', 2000, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:edit', '#', 'admin', '2022-03-16 09:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '订单删除', 2000, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:remove', '#', 'admin', '2022-03-16 09:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '订单导出', 2000, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:export', '#', 'admin', '2022-03-16 09:51:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '客户信息', 2013, 1, 'customer', 'system/customer/index', NULL, 1, 0, 'C', '0', '0', 'system:customer:list', 'customerinfo', 'admin', '2022-03-16 09:51:35', 'admin', '2022-03-19 17:48:13', '客户信息菜单');
INSERT INTO `sys_menu` VALUES (2007, '信息查询', 2006, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:customer:query', '#', 'admin', '2022-03-16 09:51:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '信息新增', 2006, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:customer:add', '#', 'admin', '2022-03-16 09:51:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '信息修改', 2006, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:customer:edit', '#', 'admin', '2022-03-16 09:51:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '信息删除', 2006, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:customer:remove', '#', 'admin', '2022-03-16 09:51:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '信息导出', 2006, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:customer:export', '#', 'admin', '2022-03-16 09:51:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '订单管理', 0, 1, 'order', NULL, NULL, 1, 0, 'M', '0', '0', '', 'build', 'admin', '2022-03-16 09:52:47', 'admin', '2022-03-19 17:33:01', '');
INSERT INTO `sys_menu` VALUES (2013, '客户管理', 0, 1, 'customer', NULL, NULL, 1, 0, 'M', '0', '0', '', 'people', 'admin', '2022-03-16 09:53:00', 'admin', '2022-03-19 17:33:28', '');
INSERT INTO `sys_menu` VALUES (2014, '收货地址', 2013, 1, 'address', 'system/address/index', NULL, 1, 0, 'C', '0', '0', 'system:address:list', 'address', 'admin', '2022-03-18 11:28:36', 'admin', '2022-03-19 17:49:14', '收货地址菜单');
INSERT INTO `sys_menu` VALUES (2015, '收货地址查询', 2014, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:address:query', '#', 'admin', '2022-03-18 11:28:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '收货地址新增', 2014, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:address:add', '#', 'admin', '2022-03-18 11:28:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '收货地址修改', 2014, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:address:edit', '#', 'admin', '2022-03-18 11:28:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '收货地址删除', 2014, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:address:remove', '#', 'admin', '2022-03-18 11:28:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '收货地址导出', 2014, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:address:export', '#', 'admin', '2022-03-18 11:28:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '订单商品详情', 2012, 1, 'orderdetail', 'system/orderdetail/index', NULL, 1, 0, 'C', '0', '0', 'system:orderdetail:list', 'orderdetail', 'admin', '2022-03-18 17:44:58', 'admin', '2022-03-19 17:46:53', '订单商品详情菜单');
INSERT INTO `sys_menu` VALUES (2027, '订单商品详情查询', 2026, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:orderdetail:query', '#', 'admin', '2022-03-18 17:44:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '订单商品详情新增', 2026, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:orderdetail:add', '#', 'admin', '2022-03-18 17:44:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '订单商品详情修改', 2026, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:orderdetail:edit', '#', 'admin', '2022-03-18 17:44:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '订单商品详情删除', 2026, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:orderdetail:remove', '#', 'admin', '2022-03-18 17:44:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '订单商品详情导出', 2026, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:orderdetail:export', '#', 'admin', '2022-03-18 17:44:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '订单物流', 2012, 1, 'logistics', 'system/logistics/index', NULL, 1, 0, 'C', '0', '0', 'system:logistics:list', 'orderlogistics', 'admin', '2022-03-18 20:54:10', 'admin', '2022-03-19 17:45:57', '订单物流菜单');
INSERT INTO `sys_menu` VALUES (2033, '订单物流查询', 2032, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:logistics:query', '#', 'admin', '2022-03-18 20:54:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '订单物流新增', 2032, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:logistics:add', '#', 'admin', '2022-03-18 20:54:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '订单物流修改', 2032, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:logistics:edit', '#', 'admin', '2022-03-18 20:54:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '订单物流删除', 2032, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:logistics:remove', '#', 'admin', '2022-03-18 20:54:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '订单物流导出', 2032, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:logistics:export', '#', 'admin', '2022-03-18 20:54:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '商品信息', 2044, 1, 'product', 'system/product/index', NULL, 1, 0, 'C', '0', '0', 'system:product:list', 'productmanager', 'admin', '2022-03-20 10:56:40', 'admin', '2022-03-20 15:53:09', '商品菜单');
INSERT INTO `sys_menu` VALUES (2039, '商品查询', 2038, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:product:query', '#', 'admin', '2022-03-20 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '商品新增', 2038, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:product:add', '#', 'admin', '2022-03-20 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '商品修改', 2038, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:product:edit', '#', 'admin', '2022-03-20 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '商品删除', 2038, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:product:remove', '#', 'admin', '2022-03-20 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '商品导出', 2038, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:product:export', '#', 'admin', '2022-03-20 10:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '商品管理', 0, 1, 'product', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'productmanager', 'admin', '2022-03-20 15:52:27', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-03-16 08:35:52', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-03-16 08:35:52', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 221 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.fuxin.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"订单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"order\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-16 09:52:48');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.fuxin.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"客户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"customer\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-16 09:53:00');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"客户信息\",\"params\":{},\"parentId\":2013,\"isCache\":\"0\",\"path\":\"customer\",\"component\":\"system/customer/index\",\"children\":[],\"createTime\":1647395495000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"system:customer:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-16 09:53:16');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"订单\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"system/order/index\",\"children\":[],\"createTime\":1647395469000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-16 09:53:24');
INSERT INTO `sys_oper_log` VALUES (104, '客户信息', 1, 'com.fuxin.system.controller.SysCustomerController.add()', 'POST', 1, 'admin', NULL, '/customer', '127.0.0.1', '', '{\"cusName\":\"431\",\"nickName\":\"14\",\"params\":{},\"createTime\":1647396189954,\"cusId\":111,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-16 10:03:10');
INSERT INTO `sys_oper_log` VALUES (105, '客户信息', 3, 'com.fuxin.system.controller.SysCustomerController.remove()', 'DELETE', 1, 'admin', NULL, '/customer/111', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-16 10:03:15');
INSERT INTO `sys_oper_log` VALUES (106, '客户信息', 2, 'com.fuxin.system.controller.SysCustomerController.changeStatus()', 'PUT', 1, 'admin', NULL, '/customer/changeStatus', '127.0.0.1', '', '{\"params\":{},\"cusId\":1,\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-16 10:03:50');
INSERT INTO `sys_oper_log` VALUES (107, '客户信息', 2, 'com.fuxin.system.controller.SysCustomerController.changeStatus()', 'PUT', 1, 'admin', NULL, '/customer/changeStatus', '127.0.0.1', '', '{\"params\":{},\"cusId\":1,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-16 10:03:54');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"订单信息\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"system/order/index\",\"children\":[],\"createTime\":1647395469000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-16 10:11:42');
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 2, 'com.fuxin.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"deptName\":\"福鑫家电有限公司\",\"leader\":\"福鑫\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1647390951000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"fuxin@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-17 10:55:30');
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 2, 'com.fuxin.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"deptName\":\"福鑫家电有限公司\",\"leader\":\"福鑫\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1647390951000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"fuxin@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-17 10:55:30');
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 1, 'com.fuxin.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"deptName\":\"佛山分公司\",\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-17 10:55:54');
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 1, 'com.fuxin.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"deptName\":\"销售部门\",\"orderNum\":\"1\",\"params\":{},\"parentId\":200,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,200\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-17 10:59:38');
INSERT INTO `sys_oper_log` VALUES (113, '客户信息', 1, 'com.fuxin.system.controller.SysCustomerController.add()', 'POST', 1, 'admin', NULL, '/customer', '127.0.0.1', '', '{\"cusName\":\"431\",\"nickName\":\"123\",\"params\":{},\"createTime\":1647572831157,\"cusId\":112,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 11:07:12');
INSERT INTO `sys_oper_log` VALUES (114, '客户信息', 1, 'com.fuxin.system.controller.SysCustomerController.add()', 'POST', 1, 'admin', NULL, '/customer', '127.0.0.1', '', '{\"cusName\":\"431\",\"nickName\":\"123\",\"params\":{},\"createTime\":1647572945700,\"cusId\":113,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 11:09:06');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 6, 'com.fuxin.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'sys_delivery_address', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 11:21:35');
INSERT INTO `sys_oper_log` VALUES (116, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"默认收货地址\",\"remark\":\"是否是默认收货地址\",\"params\":{},\"dictType\":\"is_default_address\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 11:25:12');
INSERT INTO `sys_oper_log` VALUES (117, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"默认收货地址\",\"remark\":\"是否是默认收货地址\",\"params\":{},\"dictType\":\"is_default_address\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'is_default_address\' for key \'sys_dict_type.dict_type\'\r\n### The error may exist in file [D:\\Code\\bysj\\Fuxin\\fuxin-modules\\fuxin-system\\target\\classes\\mapper\\system\\SysDictTypeMapper.xml]\r\n### The error may involve com.fuxin.system.mapper.SysDictTypeMapper.insertDictType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dict_type(      dict_name,       dict_type,       status,       remark,       create_by,      create_time    )values(      ?,       ?,       ?,       ?,       ?,      sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'is_default_address\' for key \'sys_dict_type.dict_type\'\n; Duplicate entry \'is_default_address\' for key \'sys_dict_type.dict_type\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'is_default_address\' for key \'sys_dict_type.dict_type\'', '2022-03-18 11:25:14');
INSERT INTO `sys_oper_log` VALUES (118, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"默认收货地址\",\"remark\":\"是否是默认收货地址\",\"params\":{},\"dictType\":\"is_default_address\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'is_default_address\' for key \'sys_dict_type.dict_type\'\r\n### The error may exist in file [D:\\Code\\bysj\\Fuxin\\fuxin-modules\\fuxin-system\\target\\classes\\mapper\\system\\SysDictTypeMapper.xml]\r\n### The error may involve com.fuxin.system.mapper.SysDictTypeMapper.insertDictType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dict_type(      dict_name,       dict_type,       status,       remark,       create_by,      create_time    )values(      ?,       ?,       ?,       ?,       ?,      sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'is_default_address\' for key \'sys_dict_type.dict_type\'\n; Duplicate entry \'is_default_address\' for key \'sys_dict_type.dict_type\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'is_default_address\' for key \'sys_dict_type.dict_type\'', '2022-03-18 11:25:14');
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"remark\":\"为默认收货地址\",\"params\":{},\"dictType\":\"is_default_address\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 11:26:50');
INSERT INTO `sys_oper_log` VALUES (120, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"remark\":\"不为默认收货地址\",\"params\":{},\"dictType\":\"is_default_address\",\"dictLabel\":\"否\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 11:27:14');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'com.fuxin.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-03-18 11:27:59');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"收货地址\",\"params\":{},\"parentId\":2013,\"isCache\":\"0\",\"path\":\"address\",\"component\":\"system/address/index\",\"children\":[],\"createTime\":1647574116000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"system:address:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 11:33:47');
INSERT INTO `sys_oper_log` VALUES (123, '订单', 2, 'com.fuxin.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"orderNo\":\"123445\",\"deliveryTime\":1647273600000,\"cusName\":\"431\",\"orderId\":1,\"payTime\":1647273600000,\"orderStatus\":1,\"remark\":\"无备注\",\"delFlag\":\"0\",\"params\":{},\"productCount\":50,\"productAmountTotal\":2000000,\"addressId\":12345,\"orderlogisticsId\":1234,\"createBy\":\"xiaoming\",\"createTime\":1647325960000,\"cusId\":111,\"outTradeNo\":\"abc123\",\"orderAmountTotal\":1800000,\"orderSettlementTime\":1647273600000,\"payChannel\":1,\"logisticsFee\":500}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 16:36:50');
INSERT INTO `sys_oper_log` VALUES (124, '订单', 2, 'com.fuxin.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"orderNo\":\"123446\",\"deliveryTime\":1647273600000,\"cusName\":\"431\",\"orderId\":2,\"payTime\":1647273600000,\"orderStatus\":1,\"remark\":\"无备注\",\"delFlag\":\"0\",\"params\":{},\"productCount\":50,\"productAmountTotal\":2000000,\"addressId\":1,\"orderlogisticsId\":1234,\"createBy\":\"xiaoming\",\"createTime\":1647325960000,\"cusId\":111,\"outTradeNo\":\"abc123\",\"orderAmountTotal\":1800000,\"orderSettlementTime\":1647273600000,\"payChannel\":1,\"logisticsFee\":500}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 16:48:22');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 6, 'com.fuxin.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'sys_order_detail', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 17:35:03');
INSERT INTO `sys_oper_log` VALUES (126, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"商品是否下架\",\"remark\":\"商品是否下架\",\"params\":{},\"dictType\":\"is_product_exists\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 17:39:36');
INSERT INTO `sys_oper_log` VALUES (127, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"商品是否下架\",\"remark\":\"商品是否下架\",\"params\":{},\"dictType\":\"is_product_exists\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'is_product_exists\' for key \'sys_dict_type.dict_type\'\r\n### The error may exist in file [D:\\Code\\bysj\\Fuxin\\fuxin-modules\\fuxin-system\\target\\classes\\mapper\\system\\SysDictTypeMapper.xml]\r\n### The error may involve com.fuxin.system.mapper.SysDictTypeMapper.insertDictType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dict_type(      dict_name,       dict_type,       status,       remark,       create_by,      create_time    )values(      ?,       ?,       ?,       ?,       ?,      sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'is_product_exists\' for key \'sys_dict_type.dict_type\'\n; Duplicate entry \'is_product_exists\' for key \'sys_dict_type.dict_type\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'is_product_exists\' for key \'sys_dict_type.dict_type\'', '2022-03-18 17:39:37');
INSERT INTO `sys_oper_log` VALUES (128, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"is_product_exists\",\"dictLabel\":\"已下架\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 17:40:05');
INSERT INTO `sys_oper_log` VALUES (129, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"is_product_exists\",\"dictLabel\":\"未下架\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 17:40:16');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 8, 'com.fuxin.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-03-18 17:42:12');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.fuxin.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-03-18 17:44:12');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"订单商品详情\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"orderdetail\",\"component\":\"system/orderdetail/index\",\"children\":[],\"createTime\":1647596698000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2026,\"menuType\":\"C\",\"perms\":\"system:orderdetail:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 17:49:43');
INSERT INTO `sys_oper_log` VALUES (133, '订单商品详情', 2, 'com.fuxin.system.controller.SysOrderDetailController.edit()', 'PUT', 1, 'admin', NULL, '/orderdetail', '127.0.0.1', '', '{\"discountRate\":0,\"isProductExists\":0,\"productId\":80,\"productModeDesc\":\"{}\",\"orderId\":77,\"productModeParams\":\"{}\",\"discountAmount\":48,\"productStoreBarcode\":\"s1\",\"remark\":\"KAUBP\",\"delFlag\":\"0\",\"params\":{},\"orderDetailId\":2,\"productName\":\"洗衣机1\",\"number\":13,\"productMarque\":\"YW2MV2PpT5\",\"subtotal\":85,\"productPrice\":2704}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 18:17:36');
INSERT INTO `sys_oper_log` VALUES (134, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"物流方式\",\"remark\":\"物流方式，1公路运输，2铁路运输，3水运，4航空运输，5管道运输，6其他运输方式\",\"params\":{},\"dictType\":\"logistics_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:40:27');
INSERT INTO `sys_oper_log` VALUES (135, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"logistics_type\",\"dictLabel\":\"公路运输\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:40:49');
INSERT INTO `sys_oper_log` VALUES (136, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"logistics_type\",\"dictLabel\":\"铁路运输\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:41:00');
INSERT INTO `sys_oper_log` VALUES (137, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"logistics_type\",\"dictLabel\":\"水路运输\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:41:10');
INSERT INTO `sys_oper_log` VALUES (138, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"航空运输\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"logistics_type\",\"dictLabel\":\"4\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:41:18');
INSERT INTO `sys_oper_log` VALUES (139, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"logistics_type\",\"dictLabel\":\"管道运输\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:41:25');
INSERT INTO `sys_oper_log` VALUES (140, '字典数据', 2, 'com.fuxin.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"logistics_type\",\"dictLabel\":\"航空运输\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1647607277000,\"dictCode\":118,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:41:47');
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"6\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"logistics_type\",\"dictLabel\":\"其他运输方式\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:42:13');
INSERT INTO `sys_oper_log` VALUES (142, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"物流状态\",\"params\":{},\"dictType\":\"order_logistics_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:43:08');
INSERT INTO `sys_oper_log` VALUES (143, '字典类型', 2, 'com.fuxin.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":1647607387000,\"updateBy\":\"admin\",\"dictName\":\"物流状态\",\"remark\":\"物流状态，1正在入库，2已发货，3运输中，4已送达，5已签收\",\"dictId\":108,\"params\":{},\"dictType\":\"order_logistics_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:43:17');
INSERT INTO `sys_oper_log` VALUES (144, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"order_logistics_status\",\"dictLabel\":\"正在入库\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:43:34');
INSERT INTO `sys_oper_log` VALUES (145, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"order_logistics_status\",\"dictLabel\":\"已发货\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:43:40');
INSERT INTO `sys_oper_log` VALUES (146, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"order_logistics_status\",\"dictLabel\":\"运输中\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:43:46');
INSERT INTO `sys_oper_log` VALUES (147, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"order_logistics_status\",\"dictLabel\":\"已送达\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:43:55');
INSERT INTO `sys_oper_log` VALUES (148, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"order_logistics_status\",\"dictLabel\":\"已签收\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:44:03');
INSERT INTO `sys_oper_log` VALUES (149, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"物流公司对账状态\",\"remark\":\"物流公司对账状态\",\"params\":{},\"dictType\":\"reconciliation_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:44:57');
INSERT INTO `sys_oper_log` VALUES (150, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"reconciliation_status\",\"dictLabel\":\"已对账\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:45:09');
INSERT INTO `sys_oper_log` VALUES (151, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"reconciliation_status\",\"dictLabel\":\"未对账\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:45:14');
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 6, 'com.fuxin.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'sys_order_logistics', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 20:45:50');
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.fuxin.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-03-18 20:53:16');
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 8, 'com.fuxin.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-03-18 20:53:32');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"订单物流\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"logistics\",\"component\":\"system/logistics/index\",\"children\":[],\"createTime\":1647608050000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2032,\"menuType\":\"C\",\"perms\":\"system:logistics:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 21:00:48');
INSERT INTO `sys_oper_log` VALUES (156, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"物流结算状态\",\"remark\":\"物流结算状态\",\"params\":{},\"dictType\":\"logistics_settlement_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 21:50:12');
INSERT INTO `sys_oper_log` VALUES (157, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"物流结算状态\",\"remark\":\"物流结算状态\",\"params\":{},\"dictType\":\"logistics_settlement_status\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'logistics_settlement_status\' for key \'sys_dict_type.dict_type\'\r\n### The error may exist in file [D:\\Code\\bysj\\Fuxin\\fuxin-modules\\fuxin-system\\target\\classes\\mapper\\system\\SysDictTypeMapper.xml]\r\n### The error may involve com.fuxin.system.mapper.SysDictTypeMapper.insertDictType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dict_type(      dict_name,       dict_type,       status,       remark,       create_by,      create_time    )values(      ?,       ?,       ?,       ?,       ?,      sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'logistics_settlement_status\' for key \'sys_dict_type.dict_type\'\n; Duplicate entry \'logistics_settlement_status\' for key \'sys_dict_type.dict_type\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'logistics_settlement_status\' for key \'sys_dict_type.dict_type\'', '2022-03-18 21:50:15');
INSERT INTO `sys_oper_log` VALUES (158, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"logistics_settlement_status\",\"dictLabel\":\"已结算\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 21:50:20');
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"logistics_settlement_status\",\"dictLabel\":\"未结算\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 21:50:27');
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 2, 'com.fuxin.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"logistics_settlement_status\",\"dictLabel\":\"未结算\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1647611427000,\"dictCode\":129,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 21:50:33');
INSERT INTO `sys_oper_log` VALUES (161, '订单物流', 3, 'com.fuxin.system.controller.SysOrderLogisticsController.remove()', 'DELETE', 1, 'admin', NULL, '/logistics/1234', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 22:04:39');
INSERT INTO `sys_oper_log` VALUES (162, '订单物流', 1, 'com.fuxin.system.controller.SysOrderLogisticsController.add()', 'POST', 1, 'admin', NULL, '/logistics', '127.0.0.1', '', '{\"expressNo\":\"123\",\"orderId\":123,\"consigneeRealname\":\"123\",\"orderlogisticsStatus\":0,\"logisticsSettlementStatus\":0,\"consigneeTelphone\":\"123\",\"params\":{},\"orderlogisticsId\":1235,\"reconciliationStatus\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 22:06:05');
INSERT INTO `sys_oper_log` VALUES (163, '订单物流', 3, 'com.fuxin.system.controller.SysOrderLogisticsController.remove()', 'DELETE', 1, 'admin', NULL, '/logistics/1235', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-18 22:06:08');
INSERT INTO `sys_oper_log` VALUES (164, '字典数据', 2, 'com.fuxin.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"reconciliation_status\",\"dictLabel\":\"未对账\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1647607514000,\"dictCode\":127,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 16:57:36');
INSERT INTO `sys_oper_log` VALUES (165, '参数管理', 2, 'com.fuxin.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '127.0.0.1', '', '{\"configName\":\"主框架页-默认皮肤样式名称\",\"configKey\":\"sys.index.skinName\",\"createBy\":\"admin\",\"createTime\":1647390952000,\"updateBy\":\"admin\",\"configId\":1,\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"configType\":\"Y\",\"configValue\":\"skin-green\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:31:06');
INSERT INTO `sys_oper_log` VALUES (166, '参数管理', 2, 'com.fuxin.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '127.0.0.1', '', '{\"configName\":\"主框架页-侧边栏主题\",\"configKey\":\"sys.index.sideTheme\",\"createBy\":\"admin\",\"createTime\":1647390952000,\"updateBy\":\"admin\",\"configId\":3,\"remark\":\"深色主题theme-dark，浅色主题theme-light\",\"configType\":\"Y\",\"configValue\":\"theme-light\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:31:39');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"edit\",\"orderNum\":7,\"menuName\":\"参数设置\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"config\",\"component\":\"system/config/index\",\"children\":[],\"createTime\":1647390951000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":106,\"menuType\":\"C\",\"perms\":\"system:config:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:32:37');
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"message\",\"orderNum\":8,\"menuName\":\"通知公告\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"notice\",\"component\":\"system/notice/index\",\"children\":[],\"createTime\":1647390951000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":107,\"menuType\":\"C\",\"perms\":\"system:notice:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:32:42');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":1,\"menuName\":\"订单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"order\",\"children\":[],\"createTime\":1647395567000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2012,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:33:01');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":1,\"menuName\":\"客户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"customer\",\"children\":[],\"createTime\":1647395580000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2013,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:33:28');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"post\",\"orderNum\":1,\"menuName\":\"客户信息\",\"params\":{},\"parentId\":2013,\"isCache\":\"0\",\"path\":\"customer\",\"component\":\"system/customer/index\",\"children\":[],\"createTime\":1647395495000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"system:customer:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:34:36');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"input\",\"orderNum\":1,\"menuName\":\"收货地址\",\"params\":{},\"parentId\":2013,\"isCache\":\"0\",\"path\":\"address\",\"component\":\"system/address/index\",\"children\":[],\"createTime\":1647574116000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"system:address:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:35:06');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"post\",\"orderNum\":1,\"menuName\":\"订单信息\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"system/order/index\",\"children\":[],\"createTime\":1647395469000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:36:39');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"order\",\"orderNum\":1,\"menuName\":\"订单信息\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"order\",\"component\":\"system/order/index\",\"children\":[],\"createTime\":1647395469000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:44:25');
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"orderlogistics\",\"orderNum\":1,\"menuName\":\"订单商品详情\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"orderdetail\",\"component\":\"system/orderdetail/index\",\"children\":[],\"createTime\":1647596698000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2026,\"menuType\":\"C\",\"perms\":\"system:orderdetail:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:45:26');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"orderlogistics\",\"orderNum\":1,\"menuName\":\"订单物流\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"logistics\",\"component\":\"system/logistics/index\",\"children\":[],\"createTime\":1647608050000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2032,\"menuType\":\"C\",\"perms\":\"system:logistics:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:45:57');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"orderdetail\",\"orderNum\":1,\"menuName\":\"订单商品详情\",\"params\":{},\"parentId\":2012,\"isCache\":\"0\",\"path\":\"orderdetail\",\"component\":\"system/orderdetail/index\",\"children\":[],\"createTime\":1647596698000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2026,\"menuType\":\"C\",\"perms\":\"system:orderdetail:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:46:53');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"customerinfo\",\"orderNum\":1,\"menuName\":\"客户信息\",\"params\":{},\"parentId\":2013,\"isCache\":\"0\",\"path\":\"customer\",\"component\":\"system/customer/index\",\"children\":[],\"createTime\":1647395495000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"system:customer:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:48:13');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"address\",\"orderNum\":1,\"menuName\":\"收货地址\",\"params\":{},\"parentId\":2013,\"isCache\":\"0\",\"path\":\"address\",\"component\":\"system/address/index\",\"children\":[],\"createTime\":1647574116000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"system:address:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-19 17:49:14');
INSERT INTO `sys_oper_log` VALUES (180, '用户头像', 2, 'com.fuxin.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}', 0, NULL, '2022-03-20 10:38:27');
INSERT INTO `sys_oper_log` VALUES (181, '用户头像', 2, 'com.fuxin.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}', 0, NULL, '2022-03-20 10:39:29');
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 6, 'com.fuxin.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'sys_product', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 10:45:07');
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 2, 'com.fuxin.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/sys_product', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 10:50:37');
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 2, 'com.fuxin.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/sys_product', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 10:51:57');
INSERT INTO `sys_oper_log` VALUES (185, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"商品类别\",\"remark\":\"商品类别，1空调器具，2制冷器具，3清洁器具，4照明器具，5厨房器具\",\"params\":{},\"dictType\":\"product_category\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 10:51:58');
INSERT INTO `sys_oper_log` VALUES (186, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"商品类别\",\"remark\":\"商品类别，1空调器具，2制冷器具，3清洁器具，4照明器具，5厨房器具\",\"params\":{},\"dictType\":\"product_category\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'product_category\' for key \'sys_dict_type.dict_type\'\r\n### The error may exist in file [D:\\Code\\bysj\\Fuxin\\fuxin-modules\\fuxin-system\\target\\classes\\mapper\\system\\SysDictTypeMapper.xml]\r\n### The error may involve com.fuxin.system.mapper.SysDictTypeMapper.insertDictType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dict_type(      dict_name,       dict_type,       status,       remark,       create_by,      create_time    )values(      ?,       ?,       ?,       ?,       ?,      sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'product_category\' for key \'sys_dict_type.dict_type\'\n; Duplicate entry \'product_category\' for key \'sys_dict_type.dict_type\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'product_category\' for key \'sys_dict_type.dict_type\'', '2022-03-20 10:51:58');
INSERT INTO `sys_oper_log` VALUES (187, '字典类型', 1, 'com.fuxin.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictName\":\"商品类别\",\"remark\":\"商品类别，1空调器具，2制冷器具，3清洁器具，4照明器具，5厨房器具\",\"params\":{},\"dictType\":\"product_category\",\"status\":\"0\"}', '{\"msg\":\"新增字典\'商品类别\'失败，字典类型已存在\",\"code\":500}', 0, NULL, '2022-03-20 10:52:22');
INSERT INTO `sys_oper_log` VALUES (188, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"product_category\",\"dictLabel\":\"空调器具\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 10:52:53');
INSERT INTO `sys_oper_log` VALUES (189, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"product_category\",\"dictLabel\":\"制冷器具\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 10:53:11');
INSERT INTO `sys_oper_log` VALUES (190, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"product_category\",\"dictLabel\":\"清洁器具\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 10:53:21');
INSERT INTO `sys_oper_log` VALUES (191, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"product_category\",\"dictLabel\":\"照明器具\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 10:53:29');
INSERT INTO `sys_oper_log` VALUES (192, '字典数据', 1, 'com.fuxin.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"product_category\",\"dictLabel\":\"厨房器具\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 10:53:37');
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 8, 'com.fuxin.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-03-20 10:56:16');
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 2, 'com.fuxin.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/sys_product', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 11:03:30');
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 8, 'com.fuxin.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-03-20 11:04:32');
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 1, 'com.fuxin.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"productmanager\",\"orderNum\":1,\"menuName\":\"商品管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"product\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 15:52:49');
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"productmanager\",\"orderNum\":1,\"menuName\":\"商品信息\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"product\",\"component\":\"system/product/index\",\"children\":[],\"createTime\":1647745000000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2038,\"menuType\":\"C\",\"perms\":\"system:product:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 15:53:02');
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.fuxin.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"productmanager\",\"orderNum\":1,\"menuName\":\"商品信息\",\"params\":{},\"parentId\":2044,\"isCache\":\"0\",\"path\":\"product\",\"component\":\"system/product/index\",\"children\":[],\"createTime\":1647745000000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2038,\"menuType\":\"C\",\"perms\":\"system:product:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 15:53:09');
INSERT INTO `sys_oper_log` VALUES (199, '个人信息', 2, 'com.fuxin.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1647390951000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"fuxin@163.com\",\"nickName\":\"福鑫\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1647390951000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-20 16:54:03');
INSERT INTO `sys_oper_log` VALUES (200, '用户头像', 2, 'com.fuxin.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2022/03/25/blob_20220325003344A001.jpeg\",\"code\":200}', 0, NULL, '2022-03-25 00:33:46');
INSERT INTO `sys_oper_log` VALUES (201, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/108', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:36:20');
INSERT INTO `sys_oper_log` VALUES (202, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/102', '127.0.0.1', '', NULL, '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2022-03-25 00:36:27');
INSERT INTO `sys_oper_log` VALUES (203, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/109', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:36:33');
INSERT INTO `sys_oper_log` VALUES (204, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/102', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:36:36');
INSERT INTO `sys_oper_log` VALUES (205, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/103', '127.0.0.1', '', NULL, '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2022-03-25 00:36:39');
INSERT INTO `sys_oper_log` VALUES (206, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/104', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:36:43');
INSERT INTO `sys_oper_log` VALUES (207, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/105', '127.0.0.1', '', NULL, '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2022-03-25 00:36:46');
INSERT INTO `sys_oper_log` VALUES (208, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/106', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:36:49');
INSERT INTO `sys_oper_log` VALUES (209, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/107', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:36:52');
INSERT INTO `sys_oper_log` VALUES (210, '用户管理', 2, 'com.fuxin.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1647390951000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":201,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1647390951000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:37:26');
INSERT INTO `sys_oper_log` VALUES (211, '用户管理', 2, 'com.fuxin.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1647390951000,\"remark\":\"销售员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2,4],\"loginIp\":\"127.0.0.1\",\"email\":\"fuxin@qq.com\",\"nickName\":\"fuxin\",\"sex\":\"1\",\"deptId\":201,\"avatar\":\"\",\"dept\":{\"deptName\":\"销售部门\",\"deptId\":201,\"orderNum\":\"1\",\"params\":{},\"parentId\":200,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1647390951000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:37:48');
INSERT INTO `sys_oper_log` VALUES (212, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/105', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:38:19');
INSERT INTO `sys_oper_log` VALUES (213, '部门管理', 2, 'com.fuxin.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"deptName\":\"广州总公司\",\"leader\":\"福鑫\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1647390951000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"fuxin@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:38:58');
INSERT INTO `sys_oper_log` VALUES (214, '部门管理', 2, 'com.fuxin.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"deptName\":\"研发部门\",\"leader\":\"福鑫\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1647390951000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"fuxin@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 00:39:09');
INSERT INTO `sys_oper_log` VALUES (215, '角色管理', 1, 'com.fuxin.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"saler\",\"roleName\":\"销售1\",\"deptIds\":[],\"menuIds\":[2012,2000,2001,2003,2004,2005,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 07:42:54');
INSERT INTO `sys_oper_log` VALUES (216, '用户管理', 1, 'com.fuxin.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888889999\",\"admin\":false,\"password\":\"123456\",\"postIds\":[4],\"email\":\"fuxin@163.com\",\"nickName\":\"销售小李\",\"sex\":\"0\",\"deptId\":201,\"params\":{},\"userName\":\"小李\",\"roleIds\":[100],\"status\":\"0\"}', '{\"msg\":\"新增用户\'小李\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2022-03-25 07:43:40');
INSERT INTO `sys_oper_log` VALUES (217, '用户管理', 1, 'com.fuxin.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888889999\",\"admin\":false,\"password\":\"$2a$10$dkbjOL4.Hrp3D1g1mGrhj.nnxWBzHwrALbmRrBVFEk7mJdoFqRmhy\",\"postIds\":[4],\"email\":\"xiaoli@163.com\",\"nickName\":\"销售小李\",\"sex\":\"0\",\"deptId\":201,\"params\":{},\"userName\":\"小李\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[100],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 07:43:48');
INSERT INTO `sys_oper_log` VALUES (218, '用户管理', 2, 'com.fuxin.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/user/resetPwd', '127.0.0.1', '', '{\"admin\":false,\"password\":\"$2a$10$u6vV74nOF7DU8xC.x69GRetKluBYNaAYrmtppVhBcKFxFNq20QH9i\",\"updateBy\":\"admin\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 07:44:09');
INSERT INTO `sys_oper_log` VALUES (219, '用户管理', 2, 'com.fuxin.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/user/resetPwd', '127.0.0.1', '', '{\"admin\":false,\"password\":\"$2a$10$cl5Z0rCQBP3Rcd2RvGyxkuMCLkONlteuMLJGEpn1oYvm6qhzvtsLC\",\"updateBy\":\"admin\",\"params\":{},\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-25 07:55:55');
INSERT INTO `sys_oper_log` VALUES (220, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/101', '127.0.0.1', '', NULL, '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2022-03-25 08:08:42');
INSERT INTO `sys_oper_log` VALUES (221, '部门管理', 3, 'com.fuxin.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/201', '127.0.0.1', '', NULL, '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2022-03-25 08:09:55');

-- ----------------------------
-- Table structure for sys_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order`  (
  `order_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单单号，唯一值，供客户查询',
  `order_status` tinyint(0) NULL DEFAULT NULL COMMENT '订单状态，1未付款,2已付款,3已发货,4已签收,5退货申请,6退货中,7已退货,8取消交易',
  `product_count` int(0) NULL DEFAULT NULL COMMENT '商品项目数量，不是商品',
  `product_amount_total` double NULL DEFAULT NULL COMMENT '商品总价',
  `order_amount_total` double NULL DEFAULT NULL COMMENT '订单金额,实际付款金额',
  `logistics_fee` double NULL DEFAULT NULL COMMENT '运费金额',
  `address_id` int(0) NULL DEFAULT NULL COMMENT '收货地址编号,收货地址表自动编号',
  `orderlogistics_id` int(0) NULL DEFAULT NULL COMMENT '订单物流编号,订单物流表自动编号',
  `pay_channel` tinyint(0) NULL DEFAULT NULL COMMENT '订单支付渠道，1微信，2支付宝，3银行卡',
  `out_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单支付单号，第三方支付流水号',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `cus_id` bigint(0) NULL DEFAULT NULL COMMENT '客户编号',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户备注',
  `order_settlement_time` datetime(0) NULL DEFAULT NULL COMMENT '订单结算时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_order
-- ----------------------------
INSERT INTO `sys_order` VALUES (1, '123445', 1, 50, 2000000, 1800000, 500, 12345, 1234, 1, 'abc123', 'xiaoming', '2022-03-15 14:32:40', '2022-03-15 00:00:00', '2022-03-15 00:00:00', 111, '无备注', '2022-03-15 00:00:00', '0');
INSERT INTO `sys_order` VALUES (2, '123446', 1, 50, 2000000, 1800000, 500, 1, 1234, 1, 'abc123', 'xiaoming', '2022-03-15 14:32:40', '2022-03-15 00:00:00', '2022-03-15 00:00:00', 111, '无备注', '2022-03-15 00:00:00', '0');
INSERT INTO `sys_order` VALUES (3, '123447', 1, 50, 2000000, 1800000, 500, 123, 1234, 1, 'abc123', 'xiaoming', '2022-03-15 14:32:40', '2022-03-15 14:32:43', '2022-03-15 14:32:47', 111, '无备注', '2022-03-15 14:33:13', '0');

-- ----------------------------
-- Table structure for sys_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_order_detail`;
CREATE TABLE `sys_order_detail`  (
  `order_detail_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '订单商品详情编号',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL COMMENT '商品编号',
  `product_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称，商品可能删除，所以这里需要记录，不能直接读商品表',
  `product_price` double NULL DEFAULT NULL COMMENT '商品价格',
  `product_marque` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品型号',
  `product_store_barcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品仓库条码',
  `product_mode_desc` json NULL COMMENT '商品型号信息，记录详细商品型号，如颜色，规格，包装等',
  `product_mode_params` json NULL COMMENT '商品型号参数，记录单位编号，颜色编号，规格编号等',
  `discount_rate` double NULL DEFAULT NULL COMMENT '折扣比例',
  `discount_amount` double NULL DEFAULT NULL COMMENT '折扣金额',
  `number` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `subtotal` double NULL DEFAULT NULL COMMENT '小计金额，总金额',
  `is_product_exists` tinyint(0) NULL DEFAULT NULL COMMENT '商品是否有效，1有效，0无效',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`order_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单商品详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_order_detail
-- ----------------------------
INSERT INTO `sys_order_detail` VALUES (2, 77, 80, '洗衣机1', 2704, 'YW2MV2PpT5', 's1', '{}', '{}', 0, 48, 13, 85, 0, 'KAUBP', '0');
INSERT INTO `sys_order_detail` VALUES (3, 37, 4, '洗衣机2', 2462.19, 'ESlCCjxkRT', 's2', '{}', '{}', 0.3, 80.29, 70, 52.84, 1, 'Utszb', '0');
INSERT INTO `sys_order_detail` VALUES (4, 33, 34, '洗衣机3', 1006.177, '184jm4gOVs', 's3', '{}', '{}', 0.7, 24.82, 100, 10.98, 1, 'zdvVW', '0');
INSERT INTO `sys_order_detail` VALUES (5, 54, 49, '洗衣机4', 1503.999, 'X4K2XDSiet', 's4', '{}', '{}', 0.6, 32.75, 13, 62.41, 1, 'B6LGV', '0');
INSERT INTO `sys_order_detail` VALUES (6, 44, 98, '洗衣机5', 2818.676, 'edqhZuHct1', 's5', '{}', '{}', 0, 67.46, 20, 6.42, 1, 'wOhtP', '0');
INSERT INTO `sys_order_detail` VALUES (7, 94, 37, '洗衣机6', 1399.726, 'ICGlkqvutU', 's6', '{}', '{}', 1, 30.43, 83, 13.24, 1, 'NEjyb', '0');
INSERT INTO `sys_order_detail` VALUES (8, 51, 70, '洗衣机7', 1594.041, 'bCopG7zoIV', 's7', '{}', '{}', 0.7, 23.92, 22, 21.34, 1, 'dUy3Z', '0');
INSERT INTO `sys_order_detail` VALUES (9, 99, 29, '洗衣机8', 1176.309, 'wgTtXukrGe', 's8', '{}', '{}', 0.5, 2.09, 80, 57.36, 1, 'TuDAw', '0');
INSERT INTO `sys_order_detail` VALUES (10, 51, 40, '洗衣机9', 2044.62, 'w4q7GTJMl1', 's9', '{}', '{}', 0.3, 42.51, 91, 18.16, 1, 'KDxSL', '0');
INSERT INTO `sys_order_detail` VALUES (11, 64, 46, '洗衣机10', 2123.409, 'XHEpgNVpqI', 's10', '{}', '{}', 0.3, 6.05, 31, 10.11, 1, '0uAJg', '0');
INSERT INTO `sys_order_detail` VALUES (12, 8, 35, '洗衣机11', 2384.524, 'EwVSRx9ubG', 's11', '{}', '{}', 0.7, 36.23, 14, 60.41, 1, '84Lt4', '0');
INSERT INTO `sys_order_detail` VALUES (13, 64, 47, '洗衣机12', 1611.507, 'PawwWfS1QX', 's12', '{}', '{}', 0.6, 48.94, 14, 33.35, 1, 'BOMLc', '0');
INSERT INTO `sys_order_detail` VALUES (14, 22, 48, '洗衣机13', 2766.672, 'j8TJJeMuKE', 's13', '{}', '{}', 0.9, 62.67, 34, 61.26, 1, 'Sxogn', '0');
INSERT INTO `sys_order_detail` VALUES (15, 11, 72, '洗衣机14', 1153.716, 'cNpLR7AJmp', 's14', '{}', '{}', 0.4, 42.86, 93, 72.81, 1, 'xsx1q', '0');
INSERT INTO `sys_order_detail` VALUES (16, 41, 28, '洗衣机15', 1342.321, '0JsmlNUb0V', 's15', '{}', '{}', 0.4, 23.43, 94, 40.48, 1, 'BU4uh', '0');
INSERT INTO `sys_order_detail` VALUES (17, 39, 42, '洗衣机16', 2061.102, 'dp7fEWwARu', 's16', '{}', '{}', 0.1, 85.73, 68, 16.49, 1, 'PAXZs', '0');
INSERT INTO `sys_order_detail` VALUES (18, 3, 93, '洗衣机17', 1683.4, 'Jhgbf8GnMK', 's17', '{}', '{}', 0.2, 62.43, 11, 26.85, 1, 'D2U27', '0');
INSERT INTO `sys_order_detail` VALUES (19, 52, 58, '洗衣机18', 2779.75, 'JEV70mn6pk', 's18', '{}', '{}', 0.3, 92.7, 66, 44.35, 1, 'xrk2c', '0');
INSERT INTO `sys_order_detail` VALUES (20, 9, 82, '洗衣机19', 1747.334, 'xAe7sa395K', 's19', '{}', '{}', 0.2, 94.22, 69, 17.42, 1, 'IuTTW', '0');
INSERT INTO `sys_order_detail` VALUES (21, 40, 19, '洗衣机20', 1050.591, 'oV7akn2i7G', 's20', '{}', '{}', 0.3, 53.84, 80, 41.9, 1, '213Zw', '0');
INSERT INTO `sys_order_detail` VALUES (22, 56, 92, '洗衣机21', 2690.14, 'buRsrdP1PV', 's21', '{}', '{}', 0.1, 83.4, 56, 89.12, 1, 'M9NsU', '0');
INSERT INTO `sys_order_detail` VALUES (23, 71, 93, '洗衣机22', 2212.283, 'qhJDlFBxPD', 's22', '{}', '{}', 0.7, 30.21, 21, 96.91, 1, 'EzuVF', '0');
INSERT INTO `sys_order_detail` VALUES (24, 83, 58, '洗衣机23', 2400.801, 'Z8imN4Mvh0', 's23', '{}', '{}', 0.9, 73.05, 36, 35.93, 1, 'mDEOA', '0');
INSERT INTO `sys_order_detail` VALUES (25, 38, 2, '洗衣机24', 2227.267, 'AFPjN0tgzd', 's24', '{}', '{}', 0.5, 73.96, 38, 49.73, 1, 'r503T', '0');
INSERT INTO `sys_order_detail` VALUES (26, 41, 3, '洗衣机25', 2977.101, 'ieZRkUf8X7', 's25', '{}', '{}', 0.1, 65.5, 9, 96.31, 1, 'G3dXX', '0');
INSERT INTO `sys_order_detail` VALUES (27, 94, 71, '洗衣机26', 1153.225, 'lO94Yatidx', 's26', '{}', '{}', 0.6, 70.24, 60, 13.7, 1, 'a1eae', '0');
INSERT INTO `sys_order_detail` VALUES (28, 70, 12, '洗衣机27', 1544.838, 'KUwufs0y0T', 's27', '{}', '{}', 0.4, 26.84, 35, 30.22, 1, '5I6rr', '0');
INSERT INTO `sys_order_detail` VALUES (29, 61, 24, '洗衣机28', 2219.109, 'g2eGOnt58F', 's28', '{}', '{}', 0.7, 17.34, 42, 89.29, 1, 'HU7uI', '0');
INSERT INTO `sys_order_detail` VALUES (30, 54, 33, '洗衣机29', 2165.943, 'G4o6sj9mV7', 's29', '{}', '{}', 0.2, 43.79, 44, 50.15, 1, '7dIQv', '0');
INSERT INTO `sys_order_detail` VALUES (31, 96, 95, '洗衣机30', 1310.926, 'dBCUFNLjVc', 's30', '{}', '{}', 0.5, 43.56, 64, 41.77, 1, '0SMKU', '0');
INSERT INTO `sys_order_detail` VALUES (32, 43, 87, '洗衣机31', 1902.407, 'EQJR3EK3Kl', 's31', '{}', '{}', 0.9, 6.31, 70, 21.21, 1, 'dcMys', '0');
INSERT INTO `sys_order_detail` VALUES (33, 15, 100, '洗衣机32', 2742.69, '3RW4bd9FIp', 's32', '{}', '{}', 0.6, 36.71, 74, 82.6, 1, '3Yfgc', '0');
INSERT INTO `sys_order_detail` VALUES (34, 26, 59, '洗衣机33', 1347.644, 'Z2HiCA0kMs', 's33', '{}', '{}', 0.3, 47.94, 76, 23.79, 1, 'pJXVZ', '0');
INSERT INTO `sys_order_detail` VALUES (35, 26, 84, '洗衣机34', 1130.358, 'agdJXJGb1w', 's34', '{}', '{}', 0.9, 31.89, 6, 72.2, 1, 'adrOP', '0');
INSERT INTO `sys_order_detail` VALUES (36, 50, 41, '洗衣机35', 2548.359, 'xJMVVq3D2I', 's35', '{}', '{}', 0.3, 57.95, 90, 36.15, 1, '0cL79', '0');
INSERT INTO `sys_order_detail` VALUES (37, 80, 93, '洗衣机36', 1726.471, 'YuqHB2ki26', 's36', '{}', '{}', 0.7, 50.56, 64, 25.92, 1, '1Lbho', '0');
INSERT INTO `sys_order_detail` VALUES (38, 69, 52, '洗衣机37', 1474.913, 'vFWyXuoh4k', 's37', '{}', '{}', 0.1, 73.72, 6, 44.96, 1, 'ujhZm', '0');
INSERT INTO `sys_order_detail` VALUES (39, 36, 64, '洗衣机38', 2927.544, 'TIxzOJkwjz', 's38', '{}', '{}', 0.2, 88.86, 95, 94.52, 1, 'NZOre', '0');
INSERT INTO `sys_order_detail` VALUES (40, 66, 63, '洗衣机39', 2850.984, 'XYdDzX0cEZ', 's39', '{}', '{}', 0.1, 81.36, 23, 18.09, 1, 'mEKIP', '0');
INSERT INTO `sys_order_detail` VALUES (41, 65, 24, '洗衣机40', 1557.545, 'lG7Dx8qGjo', 's40', '{}', '{}', 1, 49.54, 83, 33.53, 1, 'MeLWu', '0');
INSERT INTO `sys_order_detail` VALUES (42, 69, 22, '洗衣机41', 1576.906, 'BGYCv5yBDp', 's41', '{}', '{}', 0.2, 55.67, 97, 84.32, 1, 'RY9f5', '0');
INSERT INTO `sys_order_detail` VALUES (43, 39, 7, '洗衣机42', 1721.001, 'Pw9XAcfJwx', 's42', '{}', '{}', 0.2, 58.71, 46, 26.01, 1, 'dou5n', '0');
INSERT INTO `sys_order_detail` VALUES (44, 84, 36, '洗衣机43', 1526.916, '9zH7QmamBf', 's43', '{}', '{}', 0.6, 59.4, 78, 71.49, 1, 'sgu01', '0');
INSERT INTO `sys_order_detail` VALUES (45, 75, 9, '洗衣机44', 1757.819, 'OUQIlvGoMG', 's44', '{}', '{}', 0.4, 7.38, 35, 95.31, 1, 'WNH0V', '0');
INSERT INTO `sys_order_detail` VALUES (46, 47, 89, '洗衣机45', 1338.184, 'Rnntw1S7do', 's45', '{}', '{}', 0.7, 49.84, 53, 9.2, 1, 'NxalZ', '0');
INSERT INTO `sys_order_detail` VALUES (47, 22, 93, '洗衣机46', 1970.994, 'AD26EvgPU6', 's46', '{}', '{}', 0.1, 85.11, 22, 18.82, 1, '9ix4e', '0');
INSERT INTO `sys_order_detail` VALUES (48, 49, 25, '洗衣机47', 2720.935, 'qy6xYwwMJF', 's47', '{}', '{}', 1, 42.53, 26, 49.89, 1, 'GQOqE', '0');
INSERT INTO `sys_order_detail` VALUES (49, 4, 96, '洗衣机48', 1363.826, 'lKCq0JXN2K', 's48', '{}', '{}', 0.1, 49.99, 36, 47.25, 1, 'L1gqk', '0');
INSERT INTO `sys_order_detail` VALUES (50, 33, 54, '洗衣机49', 2224.631, 'EYLhEOCPIB', 's49', '{}', '{}', 0.7, 16.19, 99, 7.47, 1, 'YgpfL', '0');
INSERT INTO `sys_order_detail` VALUES (51, 73, 26, '洗衣机50', 1865.437, '4i7GcdMNyQ', 's50', '{}', '{}', 0.6, 58.23, 76, 82.78, 1, 'Cypwc', '0');
INSERT INTO `sys_order_detail` VALUES (52, 97, 23, '洗衣机51', 1203.141, 'Q3VU2eJO2c', 's51', '{}', '{}', 0.5, 16.1, 12, 57.52, 1, 'c6olM', '0');
INSERT INTO `sys_order_detail` VALUES (53, 92, 83, '洗衣机52', 1857.301, 'gBUE6OvXEt', 's52', '{}', '{}', 0.3, 13.91, 90, 44.08, 1, 'VdhAp', '0');
INSERT INTO `sys_order_detail` VALUES (54, 3, 10, '洗衣机53', 1360.906, '0ASXrajPSn', 's53', '{}', '{}', 0.3, 63.26, 48, 13.56, 1, 'RQL12', '0');
INSERT INTO `sys_order_detail` VALUES (55, 14, 34, '洗衣机54', 1117.665, 'zCxutNCi8w', 's54', '{}', '{}', 0.1, 33.97, 44, 16.5, 1, '1xGje', '0');
INSERT INTO `sys_order_detail` VALUES (56, 6, 82, '洗衣机55', 2510.034, 'LQ0Zrh8ClO', 's55', '{}', '{}', 0.7, 38.07, 66, 92.63, 1, 'waq95', '0');
INSERT INTO `sys_order_detail` VALUES (57, 49, 37, '洗衣机56', 2754.211, 'VUHL2d8tGe', 's56', '{}', '{}', 0.9, 7.2, 84, 81.98, 1, '6AZkO', '0');
INSERT INTO `sys_order_detail` VALUES (58, 98, 10, '洗衣机57', 1836.589, 'wbLN3kj5qV', 's57', '{}', '{}', 0.2, 40.95, 72, 10.35, 1, 'aNDTK', '0');
INSERT INTO `sys_order_detail` VALUES (59, 82, 24, '洗衣机58', 2184.618, 'IbArRnAlW1', 's58', '{}', '{}', 0.7, 39.82, 26, 9.02, 1, '8A3cG', '0');
INSERT INTO `sys_order_detail` VALUES (60, 35, 13, '洗衣机59', 1713.629, '6etuOqak9z', 's59', '{}', '{}', 0.5, 15.55, 7, 84.01, 1, 'NjRy5', '0');
INSERT INTO `sys_order_detail` VALUES (61, 75, 24, '洗衣机60', 2871.795, '4Up03tGvmG', 's60', '{}', '{}', 0.4, 80.37, 63, 12.85, 1, '1uG6c', '0');
INSERT INTO `sys_order_detail` VALUES (62, 73, 23, '洗衣机61', 1723.051, 'YNIG9wI1gl', 's61', '{}', '{}', 0.1, 70.25, 64, 91.8, 1, 'a8Ewr', '0');
INSERT INTO `sys_order_detail` VALUES (63, 50, 26, '洗衣机62', 1687.26, 't07oTDDyeQ', 's62', '{}', '{}', 0.6, 41.3, 23, 85.36, 1, 'atSKD', '0');
INSERT INTO `sys_order_detail` VALUES (64, 30, 26, '洗衣机63', 2499.914, '58ACtm4c27', 's63', '{}', '{}', 0.3, 31.72, 43, 93.85, 1, 'oh654', '0');
INSERT INTO `sys_order_detail` VALUES (65, 56, 62, '洗衣机64', 1275.169, 'jC2Mop04PI', 's64', '{}', '{}', 0, 82.99, 26, 28.59, 1, 'AdqQx', '0');
INSERT INTO `sys_order_detail` VALUES (66, 99, 64, '洗衣机65', 2995.912, 'I7qLLq92mA', 's65', '{}', '{}', 0.5, 62.66, 94, 12.7, 1, 'M6vcP', '0');
INSERT INTO `sys_order_detail` VALUES (67, 21, 44, '洗衣机66', 1263.557, 't30OXIwzYe', 's66', '{}', '{}', 0.6, 51.32, 81, 46.25, 1, 'oBRkm', '0');
INSERT INTO `sys_order_detail` VALUES (68, 24, 87, '洗衣机67', 2778.947, 'bh9QXznqsZ', 's67', '{}', '{}', 0.8, 30.45, 86, 19.03, 1, 'IX5Il', '0');
INSERT INTO `sys_order_detail` VALUES (69, 30, 90, '洗衣机68', 2395.99, 'HfPJStVjDO', 's68', '{}', '{}', 0.3, 93.52, 68, 49.14, 1, 'OtYt9', '0');
INSERT INTO `sys_order_detail` VALUES (70, 54, 69, '洗衣机69', 2246.869, 'gEeUKkQOIV', 's69', '{}', '{}', 0.8, 18.02, 24, 46.81, 1, 'v3KoB', '0');
INSERT INTO `sys_order_detail` VALUES (71, 52, 52, '洗衣机70', 2039.374, 'pMeQklsSLq', 's70', '{}', '{}', 0.2, 46.71, 59, 47.92, 1, 'zC25p', '0');
INSERT INTO `sys_order_detail` VALUES (72, 96, 44, '洗衣机71', 2663.627, 'pDpaRgZH59', 's71', '{}', '{}', 0.8, 84.33, 60, 99.28, 1, 'B05IO', '0');
INSERT INTO `sys_order_detail` VALUES (73, 61, 82, '洗衣机72', 1235.634, 'xqIgHhhuda', 's72', '{}', '{}', 0.3, 85.99, 54, 11.53, 1, 'zQ8Er', '0');
INSERT INTO `sys_order_detail` VALUES (74, 20, 92, '洗衣机73', 2432.133, '5HUQUMgi6g', 's73', '{}', '{}', 0.1, 47.79, 40, 51.03, 1, 'sBrR7', '0');
INSERT INTO `sys_order_detail` VALUES (75, 31, 79, '洗衣机74', 1058.441, 'Fp105QxKAI', 's74', '{}', '{}', 0.7, 71.14, 1, 85.33, 1, 'QrY6F', '0');
INSERT INTO `sys_order_detail` VALUES (76, 98, 76, '洗衣机75', 1313.638, '0g717Xz6lH', 's75', '{}', '{}', 0.4, 36.4, 40, 15.67, 1, 'PwH20', '0');
INSERT INTO `sys_order_detail` VALUES (77, 84, 7, '洗衣机76', 1322.707, 'ktqetGeNB4', 's76', '{}', '{}', 0, 85.77, 57, 77.17, 1, 'zCJVe', '0');
INSERT INTO `sys_order_detail` VALUES (78, 25, 5, '洗衣机77', 1214.963, 'NaR3znWkxA', 's77', '{}', '{}', 0.4, 77, 51, 18.64, 1, 'URiJw', '0');
INSERT INTO `sys_order_detail` VALUES (79, 6, 53, '洗衣机78', 2393.684, '5qU72HDPDK', 's78', '{}', '{}', 0.7, 13.84, 74, 37.25, 1, '2hnrM', '0');
INSERT INTO `sys_order_detail` VALUES (80, 66, 50, '洗衣机79', 1247.261, 'BhD6tU0zoq', 's79', '{}', '{}', 0.8, 57.56, 18, 91.18, 1, '9OnSg', '0');
INSERT INTO `sys_order_detail` VALUES (81, 94, 54, '洗衣机80', 2567.889, 'XCLHx2zcU5', 's80', '{}', '{}', 0.9, 87.89, 51, 85.57, 1, 'AuVOb', '0');
INSERT INTO `sys_order_detail` VALUES (82, 26, 14, '洗衣机81', 2104.033, 'FPn1D2NZ1q', 's81', '{}', '{}', 1, 70.21, 94, 73.67, 1, 'PUCTq', '0');
INSERT INTO `sys_order_detail` VALUES (83, 22, 29, '洗衣机82', 2826.975, 'yviqSdqBZi', 's82', '{}', '{}', 0.2, 1.36, 37, 28.68, 1, 'gdo9u', '0');
INSERT INTO `sys_order_detail` VALUES (84, 19, 89, '洗衣机83', 1781.424, 'k0BzAtlTdG', 's83', '{}', '{}', 0.1, 67.56, 29, 2.44, 1, 'GrWod', '0');
INSERT INTO `sys_order_detail` VALUES (85, 85, 15, '洗衣机84', 2277.921, 'QWU6PgiXkw', 's84', '{}', '{}', 0.7, 8.64, 64, 58.56, 1, 'AAO7F', '0');
INSERT INTO `sys_order_detail` VALUES (86, 28, 69, '洗衣机85', 2343.539, 'pSLX1fLUxE', 's85', '{}', '{}', 0.3, 28.61, 14, 76.47, 1, 'i6xuF', '0');
INSERT INTO `sys_order_detail` VALUES (87, 30, 12, '洗衣机86', 1789.571, 'RohPY0SZBa', 's86', '{}', '{}', 0.6, 37.53, 22, 25.27, 1, 'mkKhT', '0');
INSERT INTO `sys_order_detail` VALUES (88, 25, 22, '洗衣机87', 1275.516, '70D3apJ18s', 's87', '{}', '{}', 0.1, 34.08, 47, 38.51, 1, '95Oy1', '0');
INSERT INTO `sys_order_detail` VALUES (89, 94, 67, '洗衣机88', 1539.804, 'HaYuMaFsOk', 's88', '{}', '{}', 0.1, 60.95, 46, 11.43, 1, 'qf557', '0');
INSERT INTO `sys_order_detail` VALUES (90, 67, 54, '洗衣机89', 2657.21, '72jYyMnfUq', 's89', '{}', '{}', 0.7, 79.1, 83, 38.15, 1, 'qCeyR', '0');
INSERT INTO `sys_order_detail` VALUES (91, 41, 46, '洗衣机90', 1857.564, 'zmRYBOlOHd', 's90', '{}', '{}', 0.6, 47.32, 25, 19.59, 1, 'ubNPI', '0');
INSERT INTO `sys_order_detail` VALUES (92, 99, 83, '洗衣机91', 2182.153, 'nPrEomOgfv', 's91', '{}', '{}', 0.7, 65.61, 49, 34.95, 1, 'yh0o9', '0');
INSERT INTO `sys_order_detail` VALUES (93, 61, 11, '洗衣机92', 2375.284, 'OsTHbxGneT', 's92', '{}', '{}', 0.4, 95.27, 13, 79.93, 1, 'jEqV5', '0');
INSERT INTO `sys_order_detail` VALUES (94, 82, 47, '洗衣机93', 1916.165, '6bR93PN9x9', 's93', '{}', '{}', 0.1, 90.21, 18, 20.16, 1, '8tRBY', '0');
INSERT INTO `sys_order_detail` VALUES (95, 21, 42, '洗衣机94', 2575.304, 'EWDidOYCV6', 's94', '{}', '{}', 0, 87.54, 17, 66.16, 1, 'sCJih', '0');
INSERT INTO `sys_order_detail` VALUES (96, 60, 31, '洗衣机95', 2175.508, 'PXLPbh7P1g', 's95', '{}', '{}', 0.7, 84.84, 76, 55.2, 1, 'DLV2l', '0');
INSERT INTO `sys_order_detail` VALUES (97, 23, 75, '洗衣机96', 1766.577, 'PdUFbWui8M', 's96', '{}', '{}', 0.7, 4.33, 12, 6.09, 1, 'OSlEq', '0');
INSERT INTO `sys_order_detail` VALUES (98, 44, 37, '洗衣机97', 2612.078, 'CrUyB55QZ4', 's97', '{}', '{}', 0.6, 39.05, 98, 46.98, 1, 'h5CBQ', '0');
INSERT INTO `sys_order_detail` VALUES (99, 20, 66, '洗衣机98', 1436.99, 'tWFockNKZM', 's98', '{}', '{}', 0.7, 79.42, 61, 57.51, 1, 'LWJNL', '0');
INSERT INTO `sys_order_detail` VALUES (100, 64, 24, '洗衣机99', 1715.065, 'SuzaozOWfL', 's99', '{}', '{}', 0.6, 66.17, 33, 36.48, 1, 'nEXzY', '0');
INSERT INTO `sys_order_detail` VALUES (101, 64, 73, '洗衣机100', 1326.877, 'aULsk78ixP', 's100', '{}', '{}', 0.2, 57.11, 50, 82.82, 1, 'Zqlu3', '0');
INSERT INTO `sys_order_detail` VALUES (102, 99, 23, '洗衣机101', 2698.945, 'bKvJWiaqtv', 's101', '{}', '{}', 1, 29.82, 50, 3.13, 1, 'AOMsj', '0');
INSERT INTO `sys_order_detail` VALUES (103, 46, 16, '洗衣机102', 2165.05, 'SZBGpxswmt', 's102', '{}', '{}', 0.1, 86.15, 70, 64.41, 1, 'NJ2oI', '0');
INSERT INTO `sys_order_detail` VALUES (104, 46, 13, '洗衣机103', 1213.333, 'KIZh57lCEl', 's103', '{}', '{}', 1, 88.71, 10, 94.39, 1, '0XLIt', '0');
INSERT INTO `sys_order_detail` VALUES (105, 85, 94, '洗衣机104', 1225.535, 'VRlEj47SaP', 's104', '{}', '{}', 0.5, 47.31, 40, 8.52, 1, 'EyMke', '0');
INSERT INTO `sys_order_detail` VALUES (106, 6, 85, '洗衣机105', 2886.03, 'P1zsZI4gvz', 's105', '{}', '{}', 0.7, 25.95, 29, 48.74, 1, 'beddK', '0');
INSERT INTO `sys_order_detail` VALUES (107, 79, 84, '洗衣机106', 2876.784, 'e4jKVrHIVD', 's106', '{}', '{}', 0.6, 94, 77, 90.63, 1, 'ukHXu', '0');
INSERT INTO `sys_order_detail` VALUES (108, 100, 92, '洗衣机107', 2228.049, 'jmkYHfFNor', 's107', '{}', '{}', 0.5, 16.45, 4, 5.11, 1, 'fNKbg', '0');
INSERT INTO `sys_order_detail` VALUES (109, 44, 17, '洗衣机108', 2446.05, '1c54DthRiV', 's108', '{}', '{}', 0.7, 41.44, 65, 45.45, 1, 'AiuiM', '0');
INSERT INTO `sys_order_detail` VALUES (110, 11, 46, '洗衣机109', 1866.04, 'MxYjPcpVQp', 's109', '{}', '{}', 1, 28.36, 86, 24.36, 1, 'YcGjh', '0');
INSERT INTO `sys_order_detail` VALUES (111, 87, 3, '洗衣机110', 2515.912, 'GZhso6uXju', 's110', '{}', '{}', 0.1, 93.69, 5, 47.13, 1, 'qQKkL', '0');
INSERT INTO `sys_order_detail` VALUES (112, 39, 62, '洗衣机111', 2980.084, 'gucahuyty7', 's111', '{}', '{}', 0.4, 85.83, 28, 85.31, 1, '6BCsr', '0');
INSERT INTO `sys_order_detail` VALUES (113, 79, 66, '洗衣机112', 2171.609, 'tEq76YxGHe', 's112', '{}', '{}', 0.7, 23.78, 66, 83.02, 1, 'apICH', '0');
INSERT INTO `sys_order_detail` VALUES (114, 33, 19, '洗衣机113', 2756.304, 'pcPdYDlo6u', 's113', '{}', '{}', 0.9, 27.8, 35, 88.58, 1, 'zUMgV', '0');
INSERT INTO `sys_order_detail` VALUES (115, 96, 64, '洗衣机114', 1351.602, 'rO7bFa5kTM', 's114', '{}', '{}', 0.5, 89.16, 80, 23.12, 1, 'AVPm0', '0');
INSERT INTO `sys_order_detail` VALUES (116, 18, 33, '洗衣机115', 2565.598, 'sb9lJQu0hx', 's115', '{}', '{}', 0.4, 91.54, 55, 1.67, 1, '2Jq17', '0');
INSERT INTO `sys_order_detail` VALUES (117, 27, 6, '洗衣机116', 2435.994, 'koAmdGsyA9', 's116', '{}', '{}', 0.7, 9.45, 47, 69.72, 1, 'PSf3w', '0');
INSERT INTO `sys_order_detail` VALUES (118, 49, 46, '洗衣机117', 1031.13, 'hbPmVWVXIy', 's117', '{}', '{}', 0.3, 61.31, 11, 38.39, 1, '8FwL4', '0');
INSERT INTO `sys_order_detail` VALUES (119, 36, 56, '洗衣机118', 2959.335, 'pkyxK3S4DW', 's118', '{}', '{}', 0.4, 86.34, 90, 72.42, 1, 'xKhFw', '0');
INSERT INTO `sys_order_detail` VALUES (120, 78, 18, '洗衣机119', 1443.808, 'tkCX1SQMQ1', 's119', '{}', '{}', 0.6, 55.35, 66, 53.72, 1, '4OuWS', '0');
INSERT INTO `sys_order_detail` VALUES (121, 97, 88, '洗衣机120', 2638.361, 'Xr9w2yBBnz', 's120', '{}', '{}', 0.9, 7.95, 55, 15.06, 1, '1ACJI', '0');
INSERT INTO `sys_order_detail` VALUES (122, 24, 95, '洗衣机121', 1080.187, 'T6z8abMJg7', 's121', '{}', '{}', 0.2, 52.42, 69, 55.4, 1, 'RXDb1', '0');
INSERT INTO `sys_order_detail` VALUES (123, 71, 36, '洗衣机122', 1878.118, 'mCedV564PM', 's122', '{}', '{}', 0.1, 33.28, 30, 14.72, 1, 'uTJbP', '0');
INSERT INTO `sys_order_detail` VALUES (124, 80, 33, '洗衣机123', 1707.985, 'YzJCbwUOll', 's123', '{}', '{}', 0.9, 71.76, 87, 33.77, 1, 'fWQb5', '0');
INSERT INTO `sys_order_detail` VALUES (125, 49, 32, '洗衣机124', 2776.504, 'dCoHtMzINl', 's124', '{}', '{}', 0.8, 42.81, 12, 86.59, 1, 'nQ4Rq', '0');
INSERT INTO `sys_order_detail` VALUES (126, 89, 99, '洗衣机125', 2346.815, 'EvDxFhzNc9', 's125', '{}', '{}', 0.2, 85.94, 25, 71.01, 1, 'h8drM', '0');
INSERT INTO `sys_order_detail` VALUES (127, 30, 15, '洗衣机126', 2071.201, '0sCoPqxpJp', 's126', '{}', '{}', 0.3, 1.37, 46, 20.64, 1, 'xsCtT', '0');
INSERT INTO `sys_order_detail` VALUES (128, 68, 16, '洗衣机127', 1944.636, 'XasP1mI46e', 's127', '{}', '{}', 0.6, 58.05, 60, 60.27, 1, 'HsMiM', '0');
INSERT INTO `sys_order_detail` VALUES (129, 100, 78, '洗衣机128', 1420.41, 'IXTgug267S', 's128', '{}', '{}', 0.2, 55.27, 89, 30, 1, 'VqV5O', '0');
INSERT INTO `sys_order_detail` VALUES (130, 79, 82, '洗衣机129', 1524.056, 'iaKUY09rtz', 's129', '{}', '{}', 0.7, 83.66, 81, 48.23, 1, 'Eyrak', '0');
INSERT INTO `sys_order_detail` VALUES (131, 31, 13, '洗衣机130', 1700.039, 'dIL9n1qY8C', 's130', '{}', '{}', 0.9, 23.81, 55, 16, 1, '0cUZ9', '0');
INSERT INTO `sys_order_detail` VALUES (132, 94, 74, '洗衣机131', 1053.402, '8ookbry4KJ', 's131', '{}', '{}', 0.8, 28.58, 28, 65.21, 1, 'qy5PJ', '0');
INSERT INTO `sys_order_detail` VALUES (133, 89, 84, '洗衣机132', 1954.361, 'g86dSFsbeW', 's132', '{}', '{}', 0.5, 76.81, 50, 44.08, 1, 'pKdii', '0');
INSERT INTO `sys_order_detail` VALUES (134, 65, 13, '洗衣机133', 2123.216, 'V3s94WNFSJ', 's133', '{}', '{}', 0.8, 3.54, 7, 8.38, 1, 'Je0Ph', '0');
INSERT INTO `sys_order_detail` VALUES (135, 66, 77, '洗衣机134', 1598.621, '6e7XzYz433', 's134', '{}', '{}', 0.5, 5.41, 83, 58.07, 1, 'Rdopl', '0');
INSERT INTO `sys_order_detail` VALUES (136, 47, 66, '洗衣机135', 1653.889, 'CQDsOUDGjH', 's135', '{}', '{}', 0.6, 82.54, 68, 78.58, 1, 'FBJ5u', '0');
INSERT INTO `sys_order_detail` VALUES (137, 61, 7, '洗衣机136', 1814.028, 'K59yiP5uN9', 's136', '{}', '{}', 0.4, 68.06, 31, 33.54, 1, 't3xrG', '0');
INSERT INTO `sys_order_detail` VALUES (138, 40, 4, '洗衣机137', 1825.812, 'dhIlH7LRHi', 's137', '{}', '{}', 0.2, 24.82, 94, 28.83, 1, 'rmiyx', '0');
INSERT INTO `sys_order_detail` VALUES (139, 97, 100, '洗衣机138', 1728.555, 'VqWzMRxnEm', 's138', '{}', '{}', 0.7, 12.35, 26, 23.48, 1, 'HKJwD', '0');
INSERT INTO `sys_order_detail` VALUES (140, 84, 14, '洗衣机139', 2118.656, 'ybDAJtblXw', 's139', '{}', '{}', 0.2, 7.81, 69, 30.95, 1, 'AXax5', '0');
INSERT INTO `sys_order_detail` VALUES (141, 54, 59, '洗衣机140', 2598.773, '4y4bOV51BQ', 's140', '{}', '{}', 0.8, 98.17, 42, 87.13, 1, 'QKOqL', '0');
INSERT INTO `sys_order_detail` VALUES (142, 30, 56, '洗衣机141', 2597.106, 'gxk5QPhXtT', 's141', '{}', '{}', 0.1, 74.23, 95, 43.99, 1, 'ypruh', '0');
INSERT INTO `sys_order_detail` VALUES (143, 31, 89, '洗衣机142', 1320.642, 'OdikWt8lzl', 's142', '{}', '{}', 0.9, 30.47, 4, 58.95, 1, 'hxOXL', '0');
INSERT INTO `sys_order_detail` VALUES (144, 38, 25, '洗衣机143', 1868.829, 'bY3wDlub1I', 's143', '{}', '{}', 0.1, 20.26, 77, 53.49, 1, 'PIjke', '0');
INSERT INTO `sys_order_detail` VALUES (145, 14, 6, '洗衣机144', 2369.588, 'FJDEs8rM8U', 's144', '{}', '{}', 0.8, 8.71, 36, 71.31, 1, 'gj1jN', '0');
INSERT INTO `sys_order_detail` VALUES (146, 96, 60, '洗衣机145', 2776.34, 'zkHPaSYRHo', 's145', '{}', '{}', 1, 96.08, 28, 1.45, 1, 'MqwkD', '0');
INSERT INTO `sys_order_detail` VALUES (147, 54, 67, '洗衣机146', 1331.938, 'rYjw8ah1H6', 's146', '{}', '{}', 0.4, 73.08, 14, 94.8, 1, '6bAsK', '0');
INSERT INTO `sys_order_detail` VALUES (148, 97, 48, '洗衣机147', 1053.167, 'dEnR7OiDtv', 's147', '{}', '{}', 0.9, 44.8, 39, 42.67, 1, 'RZEIB', '0');
INSERT INTO `sys_order_detail` VALUES (149, 94, 92, '洗衣机148', 2570.783, 'Mt4rCH7YKC', 's148', '{}', '{}', 0, 14.92, 73, 9.98, 1, '5gTTO', '0');
INSERT INTO `sys_order_detail` VALUES (150, 46, 99, '洗衣机149', 1905.826, 'GengX7nJm9', 's149', '{}', '{}', 0.2, 79.03, 11, 94.8, 1, 'qsTKe', '0');
INSERT INTO `sys_order_detail` VALUES (151, 21, 83, '洗衣机150', 1967.557, 'UtIZ7acVR9', 's150', '{}', '{}', 0.4, 16.86, 34, 81.32, 1, 'pC6LQ', '0');
INSERT INTO `sys_order_detail` VALUES (152, 96, 12, '洗衣机151', 2072.608, 'D3r8egfrTa', 's151', '{}', '{}', 0.6, 64.23, 4, 63.93, 1, 'apoQp', '0');
INSERT INTO `sys_order_detail` VALUES (153, 47, 50, '洗衣机152', 1796.133, 'kxYYSStM4P', 's152', '{}', '{}', 0.2, 82.84, 24, 52.68, 1, 'TzBtA', '0');
INSERT INTO `sys_order_detail` VALUES (154, 51, 51, '洗衣机153', 2981.113, '3nn60byVq4', 's153', '{}', '{}', 0.5, 43.39, 10, 43.62, 1, 'wjzzk', '0');
INSERT INTO `sys_order_detail` VALUES (155, 32, 62, '洗衣机154', 2481.734, 'Wqqyh9g4gU', 's154', '{}', '{}', 1, 45.35, 61, 4.46, 1, 'fWUbW', '0');
INSERT INTO `sys_order_detail` VALUES (156, 86, 42, '洗衣机155', 1900.345, 'gaSQuYnIVP', 's155', '{}', '{}', 0.2, 80.01, 83, 88.05, 1, 'CfvyF', '0');
INSERT INTO `sys_order_detail` VALUES (157, 35, 59, '洗衣机156', 1913.085, 'bZcwZLog7S', 's156', '{}', '{}', 0, 81.99, 14, 23.84, 1, 'LzNaE', '0');
INSERT INTO `sys_order_detail` VALUES (158, 53, 69, '洗衣机157', 1115.452, 'H1jDdJeEdL', 's157', '{}', '{}', 0.2, 19.83, 1, 28.5, 1, '2aIYJ', '0');
INSERT INTO `sys_order_detail` VALUES (159, 34, 64, '洗衣机158', 2946.082, 'MyQXJgGEKn', 's158', '{}', '{}', 0.9, 78.42, 94, 90.03, 1, '61i2t', '0');
INSERT INTO `sys_order_detail` VALUES (160, 98, 60, '洗衣机159', 2390.497, 'rogiq32kSq', 's159', '{}', '{}', 0.9, 84.99, 5, 14.82, 1, 'actgc', '0');
INSERT INTO `sys_order_detail` VALUES (161, 42, 32, '洗衣机160', 2315.876, 'wcrSD7P79o', 's160', '{}', '{}', 0.1, 12.43, 99, 75.79, 1, 'cH6tn', '0');
INSERT INTO `sys_order_detail` VALUES (162, 65, 57, '洗衣机161', 1063.942, 'tCaXJmJprP', 's161', '{}', '{}', 0.4, 69.78, 41, 23, 1, 'y3VMM', '0');
INSERT INTO `sys_order_detail` VALUES (163, 3, 99, '洗衣机162', 1259.717, 'C19Cnx8bWd', 's162', '{}', '{}', 0.4, 85.05, 87, 4.38, 1, 'ZPcqM', '0');
INSERT INTO `sys_order_detail` VALUES (164, 12, 85, '洗衣机163', 2687.79, 'qgizW1GTIs', 's163', '{}', '{}', 0.1, 73.34, 79, 78.52, 1, 'wSwJE', '0');
INSERT INTO `sys_order_detail` VALUES (165, 94, 27, '洗衣机164', 1607.945, '5SAAqeAUtm', 's164', '{}', '{}', 0.2, 38.07, 3, 12.66, 1, 'nVlBw', '0');
INSERT INTO `sys_order_detail` VALUES (166, 68, 84, '洗衣机165', 2388.678, 'h2jzFRTfoo', 's165', '{}', '{}', 0.2, 2.73, 24, 96.86, 1, 'quwZL', '0');
INSERT INTO `sys_order_detail` VALUES (167, 100, 70, '洗衣机166', 2559.573, 'aWY3yAYzFa', 's166', '{}', '{}', 0.1, 27.94, 59, 73.98, 1, 'koYYJ', '0');
INSERT INTO `sys_order_detail` VALUES (168, 46, 66, '洗衣机167', 2613.95, 'eAg6AbdrJp', 's167', '{}', '{}', 0.4, 55.02, 90, 98.67, 1, 'hA6iQ', '0');
INSERT INTO `sys_order_detail` VALUES (169, 12, 37, '洗衣机168', 1795.059, 'o1GibBWdxR', 's168', '{}', '{}', 1, 83.48, 92, 65.05, 1, 'yhOVI', '0');
INSERT INTO `sys_order_detail` VALUES (170, 5, 8, '洗衣机169', 1052.486, 'J3k62Y9aPU', 's169', '{}', '{}', 0.9, 33.89, 75, 93.22, 1, 'QFBHp', '0');
INSERT INTO `sys_order_detail` VALUES (171, 2, 17, '洗衣机170', 1614.752, 'EEgEGdE2x0', 's170', '{}', '{}', 0.3, 80.34, 97, 20.98, 1, 'EN1Us', '0');
INSERT INTO `sys_order_detail` VALUES (172, 60, 61, '洗衣机171', 2079.28, 'QGETlagLih', 's171', '{}', '{}', 0.8, 57.86, 11, 84.05, 1, '3f1AD', '0');
INSERT INTO `sys_order_detail` VALUES (173, 39, 71, '洗衣机172', 1914.502, 'USQ0JtJInU', 's172', '{}', '{}', 0.4, 70.02, 80, 70.81, 1, 'Hsrw4', '0');
INSERT INTO `sys_order_detail` VALUES (174, 80, 81, '洗衣机173', 1222.75, 'bYRCp71lb0', 's173', '{}', '{}', 0.4, 9.4, 86, 65.76, 1, 'KHhDy', '0');
INSERT INTO `sys_order_detail` VALUES (175, 53, 82, '洗衣机174', 2943.056, 'JMLkgd6o6U', 's174', '{}', '{}', 0.7, 79.64, 78, 33.59, 1, 'dIzkx', '0');
INSERT INTO `sys_order_detail` VALUES (176, 3, 7, '洗衣机175', 2337.664, 'AfZoCaMt94', 's175', '{}', '{}', 0.1, 4.36, 78, 84.64, 1, 'laRuQ', '0');
INSERT INTO `sys_order_detail` VALUES (177, 3, 23, '洗衣机176', 1715.509, 'NXRG1HpQZj', 's176', '{}', '{}', 0.9, 22.6, 29, 68.33, 1, 'GIOyI', '0');
INSERT INTO `sys_order_detail` VALUES (178, 8, 17, '洗衣机177', 1033.487, 'rVaoKnFew7', 's177', '{}', '{}', 0.2, 87.57, 38, 59.87, 1, 'qIZ0R', '0');
INSERT INTO `sys_order_detail` VALUES (179, 34, 18, '洗衣机178', 1722.102, 'JMoo0ulenZ', 's178', '{}', '{}', 0.2, 89.77, 71, 29.68, 1, 'FpfZn', '0');
INSERT INTO `sys_order_detail` VALUES (180, 92, 10, '洗衣机179', 2808.001, 'dkXvo2fpw7', 's179', '{}', '{}', 0.2, 83.55, 20, 61.22, 1, 'Wj8X8', '0');
INSERT INTO `sys_order_detail` VALUES (181, 51, 5, '洗衣机180', 1554.216, 'alNzcBRubY', 's180', '{}', '{}', 0.5, 66.02, 32, 85.82, 1, 'iVyq7', '0');
INSERT INTO `sys_order_detail` VALUES (182, 3, 37, '洗衣机181', 2802.164, 'rBZDT8ny61', 's181', '{}', '{}', 0.9, 65.92, 41, 69.28, 1, 'Cwb3B', '0');
INSERT INTO `sys_order_detail` VALUES (183, 42, 91, '洗衣机182', 1226.414, 'UWTqjSgYn7', 's182', '{}', '{}', 0.4, 78.69, 67, 60.09, 1, 'KSZiQ', '0');
INSERT INTO `sys_order_detail` VALUES (184, 76, 74, '洗衣机183', 2780.702, 'df0Inx8n1m', 's183', '{}', '{}', 0.3, 2.38, 95, 32.86, 1, 'xPJMS', '0');
INSERT INTO `sys_order_detail` VALUES (185, 48, 40, '洗衣机184', 1089.029, 'FKrSjI8dXo', 's184', '{}', '{}', 0.6, 52.37, 62, 46.75, 1, 'odXyn', '0');
INSERT INTO `sys_order_detail` VALUES (186, 62, 76, '洗衣机185', 1955.611, 'WWhIgSbTcW', 's185', '{}', '{}', 0.5, 35.76, 5, 73.05, 1, 'WTaEv', '0');
INSERT INTO `sys_order_detail` VALUES (187, 82, 37, '洗衣机186', 1225.5, 'VtvfBXrHvr', 's186', '{}', '{}', 0.1, 46.35, 6, 82.33, 1, '18OSK', '0');
INSERT INTO `sys_order_detail` VALUES (188, 97, 57, '洗衣机187', 1561.954, 'Htq91nAYao', 's187', '{}', '{}', 1, 94.23, 15, 59.43, 1, 'r3Gkb', '0');
INSERT INTO `sys_order_detail` VALUES (189, 20, 46, '洗衣机188', 1236.598, '3vHRbGrZGL', 's188', '{}', '{}', 0.4, 43, 53, 33.68, 1, '7ck4G', '0');
INSERT INTO `sys_order_detail` VALUES (190, 25, 64, '洗衣机189', 2686.067, 'oXAPTRpVDw', 's189', '{}', '{}', 0.6, 45.06, 72, 63.31, 1, '5V7z0', '0');
INSERT INTO `sys_order_detail` VALUES (191, 79, 2, '洗衣机190', 1582.719, 'yF5BQXVQBT', 's190', '{}', '{}', 0.7, 22.8, 2, 53.89, 1, 'M48zp', '0');
INSERT INTO `sys_order_detail` VALUES (192, 97, 4, '洗衣机191', 1244.273, '4De2RXsZCN', 's191', '{}', '{}', 1, 81.5, 3, 20.78, 1, '8jzmT', '0');
INSERT INTO `sys_order_detail` VALUES (193, 81, 17, '洗衣机192', 1887.541, 'U7Aor5SiCJ', 's192', '{}', '{}', 0.1, 6.7, 89, 27.19, 1, 'cqit4', '0');
INSERT INTO `sys_order_detail` VALUES (194, 93, 12, '洗衣机193', 2735.137, 'l7rqA9BziI', 's193', '{}', '{}', 0.6, 44.24, 4, 59.53, 1, 'n7gXQ', '0');
INSERT INTO `sys_order_detail` VALUES (195, 27, 7, '洗衣机194', 1641.028, 'L1p4KtYw38', 's194', '{}', '{}', 0, 23.54, 67, 24.5, 1, 'Osp9i', '0');
INSERT INTO `sys_order_detail` VALUES (196, 3, 16, '洗衣机195', 2993.168, 'JXF3m9Pqj9', 's195', '{}', '{}', 0.6, 41.17, 30, 31.46, 1, 'RCgKH', '0');
INSERT INTO `sys_order_detail` VALUES (197, 48, 34, '洗衣机196', 2249.118, '1l0puhop3e', 's196', '{}', '{}', 0.5, 98.12, 4, 58.56, 1, 'r0Bv6', '0');
INSERT INTO `sys_order_detail` VALUES (198, 87, 88, '洗衣机197', 2201.036, 'jkVo68GR05', 's197', '{}', '{}', 0.3, 65.4, 32, 74.5, 1, 'DmVaJ', '0');
INSERT INTO `sys_order_detail` VALUES (199, 63, 89, '洗衣机198', 1958.744, 'tMduvWIAbT', 's198', '{}', '{}', 0, 48.04, 4, 54.06, 1, 'XZVm8', '0');
INSERT INTO `sys_order_detail` VALUES (200, 64, 48, '洗衣机199', 2453.872, 'n2juDUi36f', 's199', '{}', '{}', 0.4, 94.48, 100, 59.61, 1, '8X6bi', '0');
INSERT INTO `sys_order_detail` VALUES (201, 95, 46, '洗衣机200', 1735.497, 'PHVAlgizag', 's200', '{}', '{}', 1, 85.83, 52, 30.36, 1, 'jfyY0', '0');

-- ----------------------------
-- Table structure for sys_order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `sys_order_logistics`;
CREATE TABLE `sys_order_logistics`  (
  `orderlogistics_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '物流表id',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT 'order表订单编号',
  `express_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物流单号，发货快递单号',
  `consignee_realname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人姓名, 收货地址表可能更新或删除，因此要在这里记录',
  `consignee_telphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `consignee_telphone2` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备用联系电话',
  `consignee_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货地址',
  `consigne_zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `logistics_type` tinyint(0) NULL DEFAULT NULL COMMENT '物流方式，1公路运输，2铁路运输，3水运，4航空运输，5管道运输，6其他运输方式',
  `logistics_id` bigint(0) NULL DEFAULT NULL COMMENT '物流商家编号，物流商家物流单号',
  `logistics_fee` int(0) NULL DEFAULT NULL COMMENT '物流发货运费',
  `delivery_amount` int(0) NULL DEFAULT NULL COMMENT '实际支付给物流公司的金额',
  `orderlogistics_status` tinyint(0) NULL DEFAULT NULL COMMENT '物流状态，1正在入库，2已发货，3运输中，4已送达，5已签收',
  `logistics_settlement_status` tinyint(0) NULL DEFAULT NULL COMMENT '物流结算状态',
  `logistics_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物流描述',
  `logistics_create_time` datetime(0) NULL DEFAULT NULL COMMENT '物流发货时间',
  `logistics_update_time` datetime(0) NULL DEFAULT NULL COMMENT '物流更新时间',
  `logistics_settlement_time` datetime(0) NULL DEFAULT NULL COMMENT '物流结算时间',
  `logistics_pay_channel` tinyint(0) NULL DEFAULT NULL COMMENT '物流订单支付渠道，1微信，2支付宝，3银行卡',
  `out_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物流订单支付单号，第三方支付流水号',
  `reconciliation_status` tinyint(0) NULL DEFAULT NULL COMMENT '物流公司对账状态，1已对账，2未对账',
  `reconciliation_time` datetime(0) NULL DEFAULT NULL COMMENT '物流公司对账日期',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`orderlogistics_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1235 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单物流表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_order_logistics
-- ----------------------------
INSERT INTO `sys_order_logistics` VALUES (1235, 1, '123', '123', '15888888888', '15888888889', '广东省佛山市南海区', '525100', 2, 12345678, 500, 400, 1, 1, '0', '2022-03-19 16:54:37', '2022-03-19 16:54:40', '2022-03-19 16:54:43', 1, '123456', 0, '2022-03-19 16:54:53', '0');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-03-16 08:35:51', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-03-16 08:35:51', '', NULL, '');

-- ----------------------------
-- Table structure for sys_product
-- ----------------------------
DROP TABLE IF EXISTS `sys_product`;
CREATE TABLE `sys_product`  (
  `product_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '商品编号id',
  `product_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_category` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品类别，1空调器具，2制冷器具，3清洁器具，4照明器具，5厨房器具',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `product_price` double(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `product_marque` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品型号，前台展示给客户',
  `product_store_barcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品仓库条码',
  `product_mode_desc` json NULL COMMENT '商品型号信息',
  `product_mode_params` json NULL COMMENT '商品型号参数',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_product
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-03-16 08:35:51', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-03-16 08:35:51', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '销售1', 'saler', 3, '1', 1, 1, '0', '0', 'admin', '2022-03-25 07:42:53', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '福鑫', '00', 'fuxin@163.com', '15888888888', '1', 'http://127.0.0.1:9300/statics/2022/03/25/blob_20220325003344A001.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-16 08:35:51', 'admin', '2022-03-16 08:35:51', '', '2022-03-20 16:53:42', '管理员');
INSERT INTO `sys_user` VALUES (2, 201, 'fuxin', 'fuxin', '00', 'fuxin@qq.com', '15666666666', '1', '', '$2a$10$cl5Z0rCQBP3Rcd2RvGyxkuMCLkONlteuMLJGEpn1oYvm6qhzvtsLC', '0', '0', '127.0.0.1', '2022-03-16 08:35:51', 'admin', '2022-03-16 08:35:51', 'admin', '2022-03-25 07:55:55', '销售员');
INSERT INTO `sys_user` VALUES (100, 201, '小李', '销售小李', '00', 'xiaoli@163.com', '15888889999', '0', '', '$2a$10$u6vV74nOF7DU8xC.x69GRetKluBYNaAYrmtppVhBcKFxFNq20QH9i', '0', '0', '', NULL, 'admin', '2022-03-25 07:43:48', 'admin', '2022-03-25 07:44:09', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (2, 4);
INSERT INTO `sys_user_post` VALUES (100, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);

SET FOREIGN_KEY_CHECKS = 1;
