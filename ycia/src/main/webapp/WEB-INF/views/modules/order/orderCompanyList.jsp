<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保险公司订单管理</title>
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
		<li class="active"><a href="${ctx}/order/orderCompany/">保险公司订单列表</a></li>
		<shiro:hasPermission name="order:orderCompany:edit"><li><a href="${ctx}/order/orderCompany/form">保险公司订单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="orderCompany" action="${ctx}/order/orderCompany/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>id：</label>
				<form:input path="id" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>订单id：</label>
				<form:input path="orderId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>订单编号：</label>
				<form:input path="orderNo" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>保费：</label>
				<form:input path="premium" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>保额：</label>
				<form:input path="amount" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>安途手续费费率：</label>
				<form:input path="feeRate" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>安途手续费：</label>
				<form:input path="fee" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>代理人佣金费率：</label>
				<form:input path="rate" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>代理人佣金：</label>
				<form:input path="commission" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>订单状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>保险公司：</label>
				<form:input path="companyId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>报价人：</label>
				<form:input path="offer" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>操作人：</label>
				<form:input path="createBy" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${orderCompany.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新人：</label>
				<form:input path="updateBy" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>更新时间：</label>
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${orderCompany.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>备注：</label>
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-medium"/>
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
				<th>订单id</th>
				<th>订单编号</th>
				<th>保费</th>
				<th>保额</th>
				<th>安途手续费费率</th>
				<th>安途手续费</th>
				<th>代理人佣金费率</th>
				<th>代理人佣金</th>
				<th>订单状态</th>
				<th>保险公司</th>
				<th>报价人</th>
				<th>操作人</th>
				<th>创建时间</th>
				<th>更新人</th>
				<th>更新时间</th>
				<th>备注</th>
				<shiro:hasPermission name="order:orderCompany:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="orderCompany">
			<tr>
				<td><a href="${ctx}/order/orderCompany/form?id=${orderCompany.id}">
					${orderCompany.id}
				</a></td>
				<td>
					${orderCompany.orderId}
				</td>
				<td>
					${orderCompany.orderNo}
				</td>
				<td>
					${orderCompany.premium}
				</td>
				<td>
					${orderCompany.amount}
				</td>
				<td>
					${orderCompany.feeRate}
				</td>
				<td>
					${orderCompany.fee}
				</td>
				<td>
					${orderCompany.rate}
				</td>
				<td>
					${orderCompany.commission}
				</td>
				<td>
					${orderCompany.status}
				</td>
				<td>
					${orderCompany.companyId}
				</td>
				<td>
					${orderCompany.offer}
				</td>
				<td>
					${orderCompany.createBy}
				</td>
				<td>
					<fmt:formatDate value="${orderCompany.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${orderCompany.updateBy}
				</td>
				<td>
					<fmt:formatDate value="${orderCompany.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${orderCompany.remarks}
				</td>
				<shiro:hasPermission name="order:orderCompany:edit"><td>
    				<a href="${ctx}/order/orderCompany/form?id=${orderCompany.id}">修改</a>
					<a href="${ctx}/order/orderCompany/delete?id=${orderCompany.id}" onclick="return confirmx('确认要删除该保险公司订单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>