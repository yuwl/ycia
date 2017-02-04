<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>报价明细管理</title>
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
		<li class="active"><a href="${ctx}/order/orderOffer/">报价明细列表</a></li>
		<shiro:hasPermission name="order:orderOffer:edit"><li><a href="${ctx}/order/orderOffer/form">报价明细添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="orderOffer" action="${ctx}/order/orderOffer/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>id</th>
				<th>订单-保险公司id</th>
				<th>保险名称</th>
				<th>主订单id</th>
				<th>保额</th>
				<th>保费</th>
				<th>主/附加险（1：表，0：附）</th>
				<th>创建时间</th>
				<th>创建人</th>
				<th>备注</th>
				<shiro:hasPermission name="order:orderOffer:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="orderOffer">
			<tr>
				<td><a href="${ctx}/order/orderOffer/form?id=${orderOffer.id}">
					${orderOffer.id}
				</a></td>
				<td>
					${orderOffer.orderCompanyId}
				</td>
				<td>
					${orderOffer.productName}
				</td>
				<td>
					${orderOffer.orderId}
				</td>
				<td>
					${orderOffer.amonut}
				</td>
				<td>
					${orderOffer.premium}
				</td>
				<td>
					${orderOffer.insurType}
				</td>
				<td>
					<fmt:formatDate value="${orderOffer.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${orderOffer.createBy}
				</td>
				<td>
					${orderOffer.remarks}
				</td>
				<shiro:hasPermission name="order:orderOffer:edit"><td>
    				<a href="${ctx}/order/orderOffer/form?id=${orderOffer.id}">修改</a>
					<a href="${ctx}/order/orderOffer/delete?id=${orderOffer.id}" onclick="return confirmx('确认要删除该报价明细吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>