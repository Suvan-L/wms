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
	<title>仓库管理系统</title>

	<link href="${basePath}/resources/wms-admin/plugins/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="${basePath}/resources/wms-admin/plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css" rel="stylesheet"/>
	<link href="${basePath}/resources/wms-admin/plugins/waves-0.7.5/waves.min.css" rel="stylesheet"/>
	<link href="${basePath}/resources/wms-admin/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>
	<link href="${basePath}/resources/wms-admin/css/admin.css" rel="stylesheet"/>
	<style>
		/** skins **/
		/** 动态指定系统的顶部 CSS 皮肤样式 **/
		<c:forEach var="upmsSystem" items="${upmsSystems}">
            #${upmsSystem.name} #header {background: ${upmsSystem.theme};}
            #${upmsSystem.name} .content_tab{background: ${upmsSystem.theme};}
            #${upmsSystem.name} .s-profile>a{background: url(${basePath}${upmsSystem.banner}) left top no-repeat;}
		</c:forEach>
	</style>
</head>
<body>
<header id="header">
	<ul id="menu">
		<li id="guide" class="line-trigger">
			<div class="line-wrap">
				<div class="line top"></div>
				<div class="line center"></div>
				<div class="line bottom"></div>
			</div>
		</li>
		<li id="logo" class="hidden-xs">
			<a href="${basePath}/manage/index">
				<img src="${basePath}/resources/wms-admin/images/logo.png"/>
			</a>
			<!-- 此处在 admin.js 中执行强制替换（数据指定）-->
			<span id="system_title"></span>
		</li>
		<li class="pull-right">
			<ul class="hi-menu">
				<!-- 搜索 -->
				<li class="dropdown">
					<a class="waves-effect waves-light" data-toggle="dropdown" href="javascript:;">
						<i class="him-icon zmdi zmdi-search"></i>
					</a>
					<ul class="dropdown-menu dm-icon pull-right">
						<form id="search-form" class="form-inline">
							<div class="input-group">
								<input id="keywords" type="text" name="keywords" class="form-control" placeholder="搜索"/>
								<div class="input-group-btn">
									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
								</div>
							</div>
						</form>
					</ul>
				</li>
				<li class="dropdown">
					<a class="waves-effect waves-light" data-toggle="dropdown" href="javascript:;">
						<i class="him-icon zmdi zmdi-dropbox"></i>
					</a>
					<ul class="dropdown-menu dm-icon pull-right">
						<li class="skin-switch hidden-xs">
							请选择系统切换
						</li>
						<li class="divider hidden-xs"></li>
						<c:forEach var="upmsSystem" items="${upmsSystems}">
						<li>
							<a class="waves-effect switch-systems" href="javascript:;" systemid="${upmsSystem.systemId}" systemname="${upmsSystem.name}" systemtitle="${upmsSystem.title}"><i class="${upmsSystem.icon}"></i> ${upmsSystem.title}</a>
						</li>
						</c:forEach>
					</ul>
				</li>
				<li class="dropdown">
					<a class="waves-effect waves-light" data-toggle="dropdown" href="javascript:;">
						<i class="him-icon zmdi zmdi-more-vert"></i>
					</a>
					<ul class="dropdown-menu dm-icon pull-right">
						<li class="hidden-xs">
							<a class="waves-effect" data-ma-action="fullscreen" href="javascript:fullPage();"><i class="zmdi zmdi-fullscreen"></i> 全屏模式</a>
						</li>
						<li>
							<a class="waves-effect" data-ma-action="clear-localstorage" href="javascript:;"><i class="zmdi zmdi-delete"></i> 清除缓存</a>
						</li>
						<%--<li>--%>
							<%--<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-face"></i> 隐私管理</a>--%>
						<%--</li>--%>
						<%--<li>--%>
							<%--<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-settings"></i> 系统设置</a>--%>
						<%--</li>--%>
						<li>
							<a class="waves-effect" href="${basePath}/sso/logout"><i class="zmdi zmdi-run"></i> 退出登录</a>
						</li>
					</ul>
				</li>
			</ul>
		</li>
	</ul>
</header>
<section id="main">
	<!-- 左侧导航区 -->
	<aside id="sidebar">
		<!-- 个人资料区 -->
		<div class="s-profile">
			<a class="waves-effect waves-light" href="javascript:;">
				<div class="sp-pic">
					<img src="${basePath}${upmsUser.avatar}"/>
				</div>
				<div class="sp-info">
					${upmsUser.realname}，您好！
					<i class="zmdi zmdi-caret-down"></i>
				</div>
			</a>
			<ul class="main-menu">
				<%--<li>--%>
					<%--<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-account"></i> 个人资料</a>--%>
				<%--</li>--%>
				<%--<li>--%>
					<%--<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-face"></i> 隐私管理</a>--%>
				<%--</li>--%>
				<%--<li>--%>
					<%--<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-settings"></i> 系统设置</a>--%>
				<%--</li>--%>
				<li>
					<a class="waves-effect" href="${basePath}/sso/logout"><i class="zmdi zmdi-run"></i> 退出登录</a>
				</li>
			</ul>
		</div>
		<!-- /个人资料区 -->
		<!-- 菜单区 -->
		<ul class="main-menu">
			<li>
				<a class="waves-effect" href="javascript:Tab.addTab('首页', 'home');"><i class="zmdi zmdi-home"></i> 首页</a>
			</li>
			<c:forEach var="upmsPermission" items="${upmsPermissions}" varStatus="status">
				<c:if test="${upmsPermission.pid == 0}">
				<li class="sub-menu system_menus system_${upmsPermission.systemId} ${status.index}" <c:if test="${upmsPermission.systemId != 1}">style="display:none;"</c:if>>
					<a class="waves-effect" href="javascript:;"><i class="${upmsPermission.icon}"></i> ${upmsPermission.name}</a>
					<ul>
						<c:forEach var="subUpmsPermission" items="${upmsPermissions}">
							<c:if test="${subUpmsPermission.pid == upmsPermission.permissionId}">
								<c:forEach var="upmsSystem" items="${upmsSystems}">
									<c:if test="${subUpmsPermission.systemId == upmsSystem.systemId}">
									<c:set var="systemBasePath" value="${upmsSystem.basepath}"/></c:if>
								</c:forEach>
								<li><a class="waves-effect" href="javascript:Tab.addTab('${subUpmsPermission.name}', '${systemBasePath}${subUpmsPermission.uri}');">${subUpmsPermission.name}</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
				</c:if>
			</c:forEach>
			<li>
				<div class="upms-version">&copy; LIUSHUWEI-UPMS V1.0.0</div>
			</li>
		</ul>
		<!-- /菜单区 -->
	</aside>
	<!-- /左侧导航区 -->
	<section id="content">
		<div class="content_tab">
			<div class="tab_left">
				<a class="waves-effect waves-light" href="javascript:;"><i class="zmdi zmdi-chevron-left"></i></a>
			</div>
			<div class="tab_right">
				<a class="waves-effect waves-light" href="javascript:;"><i class="zmdi zmdi-chevron-right"></i></a>
			</div>
			<ul id="tabs" class="tabs">
				<li id="tab_home" data-index="home" data-closeable="false" class="cur">
					<a class="waves-effect waves-light" href="javascript:;">首页</a>
				</li>
            </ul>
		</div>
		<div class="content_main">
			<div id="iframe_home" class="iframe cur">
                <h3>一. 系统简介</h3>
                <ul>
                    <li>主要是基于 Java Web 的 SSM （Spring & Spring MVC & MyBatis）框架体系的后端系统架构</li>
                    <li>前端主要使用 jQuery & Bootstrap 实现交互界面，并采用 JSP 模板引擎进行交互渲染</li>
                    <li>Jetty 服务器实施 Web 应用部署，MySQL 数据库进行数据存储，努力打造全面智能化的仓储管理企业级系统化解决方案</li>
                </ul>

                <br>

				<h3>二. 权限管理模块 - 功能概述：</h3>
				<p><b>系统管理</b>： 可对不同的子系统进行相应的操作管理，扩展性强，兼容性好</p>
                <p><b>组织管理</b>： 可多企业内部多个分地区的组织部门进行管理</p>
				<p><b>角色管理</b>： 定义三层角色，不同角色拥有系统权限不同，可操作的资源不同</p>
				<p><b>用户管理</b>： 管理用户，系统管管理员可对用户进行相应的管理操作，用户资料修改，赋权</p>
				<p><b>权限管理</b>： 权限资源进行清晰定义，可动态的新增或者修改权限</p>
				<p><b>会话管理</b>： 提供分布式用户会话管理，可监控不同的客户端会话，可强制弹出</p>
				<p><b>操作日志管理</b>： 提供记录用户登录、操作等日志，系统管理员可监控系统内部客户端各种操作，保证企业内仓库管理的安全性</p>

                <br>

                <h3>三. 库存管理模块 - 功能概述：</h3>
                <p><b>入库记录</b>： 添加货品入库物流记录，可视化操作，实时更新(增加)相应仓库货品库存 </p>
                <p><b>出库记录</b>： 添加货品出库物流记录，可视化操作，实时更新(减少)相应仓库货品库存</p>
                <p><b>供应商管理</b>： 对提供货品的供应商信息进行系统化管理</p>
                <p><b>客户管理</b>： 对需求货品的客户信息进行系统化管理</p>
                <p><b>货品管理</b>： 可对货品部分信息进行编辑，货品库存量仅根据出库入库流水进行动态更新</p>
                <p><b>仓库管理</b>： 企业可能在多个地区具备物理仓库储存点，可进行统一管理</p>
                <p><b>仓库容量实时监控</b>: 对多个仓库的实时库存状态进行统一监控管理</p>
			</div>
		</div>
	</section>
</section>
<footer id="footer"></footer>
<script>var BASE_PATH = '${basePath}';</script>
<script src="${basePath}/resources/wms-admin/plugins/jquery.1.12.4.min.js"></script>
<script src="${basePath}/resources/wms-admin/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="${basePath}/resources/wms-admin/plugins/waves-0.7.5/waves.min.js"></script>
<script src="${basePath}/resources/wms-admin/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${basePath}/resources/wms-admin/plugins/BootstrapMenu.min.js"></script>
<script src="${basePath}/resources/wms-admin/plugins/device.min.js"></script>
<script src="${basePath}/resources/wms-admin/plugins/jquery.cookie.js"></script>
<script src="${basePath}/resources/wms-admin/js/admin.js"></script>
<script src="${basePath}/resources/wms-admin/plugins/fullPage/jquery.fullPage.min.js"></script>
<script src="${basePath}/resources/wms-admin/plugins/fullPage/jquery.jdirk.min.js"></script>
</body>
</html>