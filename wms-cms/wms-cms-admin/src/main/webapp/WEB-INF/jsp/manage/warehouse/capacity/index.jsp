<%@ page contentType="text/html; charset=utf-8"%>
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
	<title>库存实时监控</title>
	<jsp:include page="/resources/inc/head.jsp" flush="true"/>
</head>
<body>
<div id="main">
	<table id="table"></table>
</div>
<jsp:include page="/resources/inc/footer.jsp" flush="true"/>
<script>
var $table = $('#table');
$(function() {
	// bootstrap table初始化
	$table.bootstrapTable({
		url: '${basePath}/manage/warehouse/capacity/list',
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
		idField: 'articleId',
		sortName: 'orders',
        sortOrder: 'desc',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'ck', checkbox: true},
			{field: 'warehouseCapacityId', title: '编号', sortable: true, align: 'center'},
			{field: 'goodsId', title: '货物编号', align: 'center'},
            {field: 'goodsName', title: '货物名称'},
            {field: 'goodsCount', title: '货物总数'},
			{field: 'warehouseCapacityUseArea', title: '货物总占地面积'},
            {field: 'warehouseId', title: '仓库编号', align: 'center'},
            {field: 'warehouseAddress', title: '仓库地址'},
            {field: 'warehouseStatus', title: '仓库状态(已用百分比)'}
		]
	});
});
</script>
</body>
</html>