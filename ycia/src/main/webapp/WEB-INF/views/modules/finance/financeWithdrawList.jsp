<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存代理人账户成功管理</title>
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
	<li><a href="${ctx}/agent/agentAccount/financeMgrList">资金管理</a></li>
		<li class="active"><a href="${ctx}/agent/agentAccount/financeWithdrawList">代理人账户</a></li>
		<%-- <shiro:hasPermission name="agent:agentAccount:edit"><li><a href="${ctx}/agent/agentAccount/form">保存代理人账户成功添加</a></li></shiro:hasPermission> --%>
	</ul>
<%-- 	<form:form id="searchForm" modelAttribute="agentAccount" action="${ctx}/agent/agentAccount/financeWithdrawList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
		<li><label>id：</label>
				<form:input path="id" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>agent_id：</label>
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
		<li><label>余额：</label>
				<form:input path="balance" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>累计收入：</label>
				<form:input path="income" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>累计提现：</label>
				<form:input path="withdraw" htmlEscape="false" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form> --%>
	
	<sys:message content="${message}"/>
	<li class="active"><th>交易列表</th></li>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="display:none">id</th>
				<th style="display:none">agent_id</th>
				<th>代理人</th>
				<th>交易金额</th>
				<th>交易时间</th>
				<!-- <th>交易凭证</th> -->
				<th>交易类型</th>
				<th>交易状态</th>
				<th>操作人</th>
				<shiro:hasPermission name="agent:agentFundDetail:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="agentFundDetail">
			<tr>
				<td style="display:none"><a href="${ctx}/agent/agentFundDetail/form?id=${agentFundDetail.id}">
					${agentFundDetail.id}
				</a></td>
				<td style="display:none">
					${agentFundDetail.agentId}
				</td>
				<td>
					${agentName}
				</td>
				<td>
					${agentFundDetail.money}
				</td>
				<td>
					<fmt:formatDate value="${agentFundDetail.tradeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<%-- <td>
					${agentFundDetail.imgUrl}
				</td> --%>
				<td>
				${fns:getDictLabel(agentFundDetail.tradeType,'trade_type','')}
					<%-- ${agentFundDetail.tradeType} --%>
				</td>
				<td>
					<c:if test="${agentFundDetail.tradeStatus == '0'}">提现申请中</c:if>
					<c:if test="${agentFundDetail.tradeStatus == '1'}">已提现</c:if>
				</td>
				<td>
					${agentFundDetail.operateBy}
				</td><td>
				<c:if test="${agentFundDetail.tradeStatus == '0'}">
    				<a href="${ctx}/agent/agentFundDetail/formv?id=${agentFundDetail.id}">回款</a>
    				</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<%-- <li class="active"><th>我的订单</th></li>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<!-- <th>id</th>
				<th>agent_id</th> -->
				<th>订单编号</th>
				<th>险种名称</th>
				<th>投保人</th>
				<th>保额</th>
				<th>佣金</th>
				<th>安途手续费</th>
				<th>订单状态</th>
				<shiro:hasPermission name="agent:agentAccount:edit"><th>安途手续费</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="agentAccount">
			<tr>
				<td><a href="${ctx}/agent/agentAccount/form?id=${agentAccount.id}">
					${agentAccount.id}
				</a></td>
				<td>
					${agentAccount.agentId}
				</td>
					<td>
					${agentAccount.orderNo}
				</td>
				<td>
					${agentAccount.productId}
				</td>
				<td>
					${agentAccount.insureName}
				</td>
				<td>
					${agentAccount.amount}
				</td>
				<td>
				${agentAccount.commission}
					<fmt:formatDate value="${agentAccount.commission}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
				${agentAccount.fee}
					<fmt:formatDate value="${agentAccount.fee}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
				${fns:getDictLabel(agentAccount.status,'order_status','')}
					<fmt:formatDate value="${agentAccount.fee}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="agent:agentAccount:edit"><td>
    				<a href="${ctx}/agent/agentAccount/form?id=${agentAccount.id}">修改</a>
					<a href="${ctx}/agent/agentAccount/delete?id=${agentAccount.id}" onclick="return confirmx('确认要删除该保存代理人账户成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table> --%>
	<div class="pagination">${page}</div>
	<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</body>
</html>