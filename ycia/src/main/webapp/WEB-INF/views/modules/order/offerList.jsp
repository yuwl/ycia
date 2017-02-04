<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单报价管理</title>
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
		<li class="active"><a href="#">保险公司订单列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="orderCompany" action="${ctx}/order/orderCompany/offer" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<%-- <ul class="ul-form">
			<li><label>订单编号：</label>
				<form:input path="orderNo" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul> --%>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>保单号</th>
				<th>投保人</th>
				<th>被保人</th>
				<th>受益人</th>
				<th>险种</th>
				<th>提交日期</th>
				<th>保险金额(元)</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="offerDto">
			<tr>
				<td>${offerDto.policyNo}</td>
				<td>${offerDto.insureName}</td>
				<td>${offerDto.insuredName}</td>
				<td>${offerDto.benefitName}</td>
				<td>${offerDto.productId}</td>
				<td><fmt:formatDate value="${offerDto.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${offerDto.amount}</td>
				<td>${fns:getDictLabel(offerDto.status,'order_status','')}</td>
				<td>
					<c:choose>
					    <c:when test="${offerDto.status=='10'}">
							<a href="${ctx}/order/orderCompany/offerSubmit?orderId=${offerDto.orderId}&companyId=${offerDto.companyId}">报价</a>
					    </c:when>   
				     	<c:when test="${offerDto.status=='20' || offerDto.status=='60' || offerDto.status=='70'}">
							<a href="${ctx}/order/orderCompany/detail?orderId=${offerDto.orderId}&companyId=${offerDto.companyId}">查看</a>
					    </c:when>
					    <c:when test="${offerDto.status=='50'}">
							<a href="${ctx}/order/orderCompany/detailConfirm?orderId=${offerDto.orderId}&companyId=${offerDto.companyId}">确认</a>
					    </c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>