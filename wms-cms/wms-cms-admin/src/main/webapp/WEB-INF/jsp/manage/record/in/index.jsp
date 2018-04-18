﻿<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>入库记录管理</title>
	<jsp:include page="/resources/inc/head.jsp" flush="true"/>
</head>
<body>
<div id="main">
	<div id="toolbar">
		<shiro:hasPermission name="cms:record:in:create"><a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增入库记录</a></shiro:hasPermission>
	</div>
	<table id="table"></table>
</div>
<jsp:include page="/resources/inc/footer.jsp" flush="true"/>
<script>
var $table = $('#table');
$(function() {
	// bootstrap table初始化
	$table.bootstrapTable({
		url: '${basePath}/manage/record/in/list',
		height: getHeight(),
		striped: true,
		search: true,
		showRefresh: true,
		showColumns: true,
		minimumCountColumns: 2,
		clickToSelect: true,
		detailView: true,
		detailFormatter: 'detailFormatter',
		pagination: true,
		paginationLoop: false,
		sidePagination: 'server',
		silentSort: false,
		smartDisplay: false,
		escape: true,
		searchOnEnterKey: true,
		idField: 'recordInId',
		sortName: 'recordInId',
        sortOrder: 'asc',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'ck', checkbox: true},
            {field: 'recordInId', title: '编号', sortable: true, align: 'center'},
            {field: 'goodsId', title: '货物编号', align: 'center', sortable: true},
            {field: 'goodsName', title: '商品名称'},
            {field: 'amount', title: '入库数量', sortable: true},
            {field: 'supplierId', title: '供应商编号', align: 'center', sortable: true},
            {field: 'supplierCompany', title: '供应商公司名称'},
            {field: 'warehouseId', title: '仓库编号', align: 'center', sortable: true},
            {field: 'warehouseAddress', title: '仓库地址'},
            {field: 'ctime', title: '入库时间', formatter: 'timeFormatter', sortable: true},
		]
	});
});
// 格式化操作按钮
function actionFormatter(value, row, index) {
    return [
        '<a class="update" href="javascript:;" onclick="updateAction()" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　'
    ].join('');
}

// 格式化时间
function timeFormatter(value , row, index) {
	return new Date(value).toLocaleString();
}
// 添加
var createDialog;
function createAction() {
	createDialog = $.dialog({
		animationSpeed: 300,
		title: '添加入库记录',
		columnClass: 'xlarge',
		content: 'url:${basePath}/manage/record/in/create',
		onContentReady: function () {
			initMaterialInput();
			$('select').select2();
		}
	});
}
</script>
</body>
</html>