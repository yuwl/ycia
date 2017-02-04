<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>insur_product管理</title>
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
		<li class="active"><a href="${ctx}/insur/insurProduct/">insur_product列表</a></li>
		<shiro:hasPermission name="insur:insurProduct:edit"><li><a href="${ctx}/insur/insurProduct/form">insur_product添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="insurProduct" action="${ctx}/insur/insurProduct/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>id：</label>
				<form:input path="id" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>险种名称：</label>
				<form:input path="productName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>险种类型：</label>
				<form:input path="productType" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>保险对象：</label>
				<form:input path="insureObject" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>被保险人年龄：</label>
				<form:input path="insureAge" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>保费：</label>
				<form:input path="premiums" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>保额：</label>
				<form:input path="amonut" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>图片：</label>
				<form:input path="image" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>保险条款：</label>
				<form:input path="insureItems" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>产品介绍：</label>
				<form:input path="introduction" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>配套材料：</label>
				<form:input path="material" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${insurProduct.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>手续费费率：</label>
				<form:input path="rate" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>打印模板：</label>
				<form:input path="template" htmlEscape="false" maxlength="100" class="input-medium"/>
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
				<th>险种名称</th>
				<th>险种类型</th>
				<th>保险对象</th>
				<th>被保险人年龄</th>
				<th>保费</th>
				<th>保额</th>
				<th>图片</th>
				<th>保险条款</th>
				<th>产品介绍</th>
				<th>配套材料</th>
				<th>创建时间</th>
				<th>手续费费率</th>
				<th>打印模板</th>
				<shiro:hasPermission name="insur:insurProduct:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="insurProduct">
			<tr>
				<td><a href="${ctx}/insur/insurProduct/form?id=${insurProduct.id}">
					${insurProduct.id}
				</a></td>
				<td>
					${insurProduct.productName}
				</td>
				<td>
					${insurProduct.productType}
				</td>
				<td>
					${insurProduct.insureObject}
				</td>
				<td>
					${insurProduct.insureAge}
				</td>
				<td>
					${insurProduct.premiums}
				</td>
				<td>
					${insurProduct.amonut}
				</td>
				<td>
					${insurProduct.image}
				</td>
				<td>
					${insurProduct.insureItems}
				</td>
				<td>
					${insurProduct.introduction}
				</td>
				<td>
					${insurProduct.material}
				</td>
				<td>
					<fmt:formatDate value="${insurProduct.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${insurProduct.rate}
				</td>
				<td>
					${insurProduct.template}
				</td>
				<shiro:hasPermission name="insur:insurProduct:edit"><td>
    				<a href="${ctx}/insur/insurProduct/form?id=${insurProduct.id}">修改</a>
					<a href="${ctx}/insur/insurProduct/delete?id=${insurProduct.id}" onclick="return confirmx('确认要删除该insur_product吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>