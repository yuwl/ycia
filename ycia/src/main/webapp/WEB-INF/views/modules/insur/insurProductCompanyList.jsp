<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>insur_product_company管理</title>
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
		<li class="active"><a href="${ctx}/insur/insurProductCompany/">insur_product_company列表</a></li>
		<shiro:hasPermission name="insur:insurProductCompany:edit"><li><a href="${ctx}/insur/insurProductCompany/form">insur_product_company添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="insurProductCompany" action="${ctx}/insur/insurProductCompany/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>id：</label>
				<form:input path="id" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>id：</label>
				<form:input path="tbId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>险种：</label>
				<form:input path="productId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>保险公司：</label>
				<form:input path="companyId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>银行卡开户行：</label>
				<form:input path="bankOpen" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>银行卡卡号：</label>
				<form:input path="bankCardNo" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>银行卡户名：</label>
				<form:input path="bankCardName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${insurProductCompany.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>id</th>
				<th>险种</th>
				<th>保险公司</th>
				<th>银行卡开户行</th>
				<th>银行卡卡号</th>
				<th>银行卡户名</th>
				<th>创建时间</th>
				<shiro:hasPermission name="insur:insurProductCompany:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="insurProductCompany">
			<tr>
				<td><a href="${ctx}/insur/insurProductCompany/form?id=${insurProductCompany.id}">
					${insurProductCompany.id}
				</a></td>
				<td>
					${insurProductCompany.tbId}
				</td>
				<td>
					${insurProductCompany.productId}
				</td>
				<td>
					${insurProductCompany.companyId}
				</td>
				<td>
					${insurProductCompany.bankOpen}
				</td>
				<td>
					${insurProductCompany.bankCardNo}
				</td>
				<td>
					${insurProductCompany.bankCardName}
				</td>
				<td>
					<fmt:formatDate value="${insurProductCompany.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="insur:insurProductCompany:edit"><td>
    				<a href="${ctx}/insur/insurProductCompany/form?id=${insurProductCompany.id}">修改</a>
					<a href="${ctx}/insur/insurProductCompany/delete?id=${insurProductCompany.id}" onclick="return confirmx('确认要删除该insur_product_company吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>