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
		<li class="active"><a href="${ctx}/order/orders/enquiry">投保</a></li>
		<shiro:hasPermission name="insur:insurProduct:edit"><li><a href="${ctx}/insur/insurProduct/form">insur_product添加</a></li></shiro:hasPermission>
	</ul>

	<ul class="nav nav-tabs">
		<c:forEach items="${fns:getDictList('insur_type')}" var="dict">
			<li><a href="#" onclick="location='${ctx}/order/orders/enquiry?insuretype=${dict.value}'">${dict.label}</a></li>
		</c:forEach>
	</ul>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>险种名称</th>
				<th>保险对象</th>
				<th>被保险人年龄</th>
				<th>保费</th>
				<th>保额</th>
				<th>保险条款</th>
				<th>产品介绍</th>
				<th>配套材料</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="insurProduct">
			<tr>
				<td>
					${insurProduct.productName}
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
					${insurProduct.insureItems}
				</td>
				<td>
					${insurProduct.introduction}
				</td>
				<td>
					${insurProduct.material}
				</td>
				<shiro:hasPermission name="insur:insurProduct:edit"><td>
    				<a href="${ctx}/insur/insurProduct/form?id=${insurProduct.id}">修改</a>
					<a href="${ctx}/insur/insurProduct/delete?id=${insurProduct.id}" onclick="return confirmx('确认要删除该insur_product吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
				<td>
					<a href="${ctx}/order/orders/clent?id=${insurProduct.id}">在线投保</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>