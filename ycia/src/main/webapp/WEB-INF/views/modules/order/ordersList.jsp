<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单管理管理</title>
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
		<li class="active"><a href="${ctx}/order/orders/list">订单列表</a></li>
		<shiro:hasPermission name="order:orders:edit"><li><a href="${ctx}/order/orders/form">订单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="orders" action="${ctx}/order/orders/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			
			<li><label>订单编号：</label>
				<form:input path="orderNo" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>投保人：</label>
				<form:input path="insureName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
<!-- 			<li><label>订单状态：</label> -->
<%-- 				<form:input path="status" htmlEscape="false" maxlength="1" class="input-medium"/> --%>
<!-- 			</li> -->
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${orders.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>订单编号</th>
				<th>投保人</th>
				<th>险种</th>
				<th>保额</th>
				<th>保费</th>
				<th>订单状态</th>
				<th>提交日期</th>
				<th>保险公司</th>
				<th>报价状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="orders">
			<tr>
				<td>${orders.orderNo}</td>
				<td>${orders.insureName}</td>
				<td>${orders.productId}</td>
				<td>${orders.amount}</td>
				<td>${orders.premium}</td>
				<td>${fns:getDictLabel(orders.status,'order_status','')}</td>
				<td><fmt:formatDate value="${orders.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<c:set value="${ fn:split(orders.companyId, ',') }" var="companyId" />
					<c:forEach items="${companyId}" var="s">
						${fns:getDictLabel(s,'insur_company','')}<br>
					</c:forEach>
				</td>
				<td>
					<c:set value="${ fn:split(orders.companyStatus, ',') }" var="companyStatus" />
					<c:forEach items="${companyStatus}" var="s">
						(${fns:getDictLabel(s,'order_status','')})<br>
					</c:forEach>
				</td>
				<td><a href="${ctx}/order/orders/detail?id=${orders.id}">查看详情</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>