<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>财务管理</title>
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
		<li class="active"><a href="${ctx}/order/orders/financeList">订单管理</a></li>
		<%-- <shiro:hasPermission name="agent:agentAccount:edit"><li><a href="${ctx}/agent/agentAccount/form">保存代理人账户成功添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="orders" action="${ctx}/order/orders/financeList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>代理人：</label>
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>订单编号：</label>
				<form:input path="orderNo" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>投保人：</label>
				<form:input path="insureName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li>
			<label>订单状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('order_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			<%-- <label>订单状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-medium"/> --%>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${orders.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	
	<sys:message content="${message}"/>
	<li class="active"><th>我的订单</th></li>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="display:none">id</th>
				<th style="display:none">agent_id</th>
				<th>代理人</th>
				<th>订单编号</th>
				<th>险种名称</th>
				<th>投保人</th>
				<th>保费</th>
				<th>保额</th>
				<th>佣金</th>
				<th>安途手续费</th>
				<th>订单状态</th>
				<th>保险公司</th>
				<th>报价状态</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="orders">
			<tr>
				<td style="display:none"><a href="${ctx}/order/orders/form?id=${agentAccount.id}">
					${orders.id}
				</a></td>
				<td style="display:none">
					${orders.agentId}
				</td>
				<td>
					${orders.agentName}
				</td>
				<td>
					${orders.orderNo}
				</td>
				<td>
					${orders.productId}
				</td>
				<td>
					${orders.insureName}
				</td>
				<td>
					${orders.premium}
				</td>
				<td>
					${orders.amount}
				</td>
				<td>
				${orders.commission}
					
				</td>
				<td>
				${orders.fee}
					
				</td>
				<td>
				${fns:getDictLabel(orders.status,'order_status','')}
					<%-- <fmt:formatDate value="${agentAccount.fee}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
				</td>
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
				<shiro:hasPermission name="agent:agentAccount:edit"><td>
    				<a href="${ctx}/agent/agentAccount/form?id=${agentAccount.id}">修改</a>
					<a href="${ctx}/agent/agentAccount/delete?id=${agentAccount.id}" onclick="return confirmx('确认要删除该保存代理人账户成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>