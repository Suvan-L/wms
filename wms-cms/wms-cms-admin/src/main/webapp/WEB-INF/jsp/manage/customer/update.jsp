<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<div id="updateDialog" class="crudDialog">
	<form id="updateForm" method="post">
         <div class="form-group">
			<label for="company">公司名称</label>
			<input id="company" type="text" class="form-control" name="company" maxlength="30" value="${customer.company}">
		</div>
		<div class="form-group">
			<label for="address">地址</label>
			<input id="address" type="text" class="form-control" name="address" maxlength="100" value="${customer.address}">
		</div>
		<div class="form-group">
			<label for="name">联系人</label>
			<input id="name" type="text" class="form-control" name="name" maxlength="10" value="${customer.name}">
		</div>
        <div class="form-group">
			<label for="tel">电话</label>
			<input id="tel" type="text" class="form-control" name="tel" maxlength="20" value="${customer.tel}">
		</div>
        <div class="form-group">
			<label for="email">邮箱</label>
			<input id="email" type="text" class="form-control" name="email" maxlength="35" value="${customer.email}">
		</div>
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;" onclick="updateSubmit();">保存</a>
			<a class="waves-effect waves-button" href="javascript:;" onclick="updateDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>
function updateSubmit() {
    $.ajax({
        type: 'post',
        url: '${basePath}/manage/customer/update/${customer.customerId}',
        data: $('#updateForm').serialize(),
        beforeSend: function() {
			if ($('#title').val() == '') {
				$('#title').focus();
				return false;
			}
        },
        success: function(result) {
			if (result.code != 1) {
				if (result.data instanceof Array) {
					$.each(result.data, function(index, value) {
						$.confirm({
							theme: 'dark',
							animation: 'rotateX',
							closeAnimation: 'rotateX',
							title: false,
							content: value.errorMsg,
							buttons: {
								confirm: {
									text: '确认',
									btnClass: 'waves-effect waves-button waves-light'
								}
							}
						});
					});
				} else {
						$.confirm({
							theme: 'dark',
							animation: 'rotateX',
							closeAnimation: 'rotateX',
							title: false,
							content: result.data.errorMsg,
							buttons: {
								confirm: {
									text: '确认',
									btnClass: 'waves-effect waves-button waves-light'
								}
							}
						});
				}
			} else {
				updateDialog.close();
				$table.bootstrapTable('refresh');
			}
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
			$.confirm({
				theme: 'dark',
				animation: 'rotateX',
				closeAnimation: 'rotateX',
				title: false,
				content: textStatus,
				buttons: {
					confirm: {
						text: '确认',
						btnClass: 'waves-effect waves-button waves-light'
					}
				}
			});
        }
    });
}
</script>