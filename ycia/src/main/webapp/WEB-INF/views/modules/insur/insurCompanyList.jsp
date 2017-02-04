<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>insur_company管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/insur/insurCompany/">insur_company列表</a></li>
		<shiro:hasPermission name="insur:insurCompany:edit"><li><a href="${ctx}/insur/insurCompany/form">insur_company添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="insurCompany" action="${ctx}/insur/insurCompany/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>id：</label>
				<form:input path="id" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>保险公司名称：</label>
				<form:input path="companyName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>联系人：</label>
				<form:input path="contacts" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>联系方式：</label>
				<form:input path="phone" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${insurCompany.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>id</th>
				<th>保险公司名称</th>
				<th>联系人</th>
				<th>联系方式</th>
				<th>创建时间</th>
				<shiro:hasPermission name="insur:insurCompany:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="insurCompany">
			<tr>
				<td><a href="${ctx}/insur/insurCompany/form?id=${insurCompany.id}">
					${insurCompany.id}
				</a></td>
				<td>
					${insurCompany.companyName}
				</td>
				<td>
					${insurCompany.contacts}
				</td>
				<td>
					${insurCompany.phone}
				</td>
				<td>
					<fmt:formatDate value="${insurCompany.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="insur:insurCompany:edit"><td>
    				<a href="${ctx}/insur/insurCompany/form?id=${insurCompany.id}">修改</a>
					<a href="${ctx}/insur/insurCompany/delete?id=${insurCompany.id}" onclick="return confirmx('确认要删除该insur_company吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>