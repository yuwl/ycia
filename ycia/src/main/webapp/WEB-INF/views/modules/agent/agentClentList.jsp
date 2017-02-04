<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>代理人客户</title>
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
		<li class="active"><a href="${ctx}/agent/agentClent/">客户列表</a></li>
		<shiro:hasPermission name="agent:agentClent:edit"><li><a href="${ctx}/agent/agentClent/form">添加客户</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="agentClent" action="${ctx}/agent/agentClent/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			 <%-- <li><label>所属代理人：</label>
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>  --%>
			<li><label>客户名称：</label>
				<form:input path="clientName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>客户类型：</label>
				<form:select path="clientType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('client_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>联系电话：</label>
				<form:input path="phone" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
<!-- 				<th>id</th> -->
				<th>客户名称</th>
				<th>所属代理人</th>
				<th>客户类型</th>
				<th>联系电话</th>
				<th>证件类型</th>
				<th>证件号码</th>
				<shiro:hasPermission name="agent:agentClent:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="agentClent">
			<tr>
<%-- 				<td><a href="${ctx}/agent/agentClent/form?id=${agentClent.id}"> --%>
<%-- 					${agentClent.id} --%>
<!-- 				</a></td> -->
<%-- 				<td style="display:none;">${agentClent.agentId}</td> --%>
				<td>
					<a href="${ctx}/agent/agentClent/formv?id=${agentClent.id}&chakan=1">
					${agentClent.clientName}
					</a>
				</td>
				<td>
					${agentClent.agentName}
				</td>
				<td>
				<c:if test="${agentClent.clientType== '0' }">
					企业客户</c:if>
					<c:if test="${agentClent.clientType== '1' }">
					个人客户</c:if>
				</td>
				<td>
					${agentClent.phone}
				</td>
				<td>
				<c:if test="${agentClent.cardType== '0' }">
					身份证</c:if>
					<c:if test="${agentClent.cardType== '1' }">
					护照</c:if>
					<%-- ${agentClent.cardType}${fns:getDictLabel(agentClent.cardType, '护照','身份证')} --%>
				</td>
				<td>
					${agentClent.cardNo}
				</td>
				<shiro:hasPermission name="agent:agentClent:edit">
				<td>
    				<a href="${ctx}/agent/agentClent/form?id=${agentClent.id}">修改</a>
					<a href="${ctx}/agent/agentClent/delete?id=${agentClent.id}" onclick="return confirmx('确认要删除该代理人客户吗？', this.href)">删除</a>
				</td>
				</shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>