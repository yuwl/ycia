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
		<li class="active"><a href="${ctx}/agent/agentAccount/financeMgrList">资金管理</a></li>
		<%-- <shiro:hasPermission name="agent:agentAccount:edit"><li><a href="${ctx}/agent/agentAccount/form">保存代理人账户成功添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="agentAccount" action="${ctx}/agent/agentAccount/financeMgrList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
		<%-- <li><label>id：</label>
				<form:input path="id" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>agent_id：</label>
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li> --%>
			<li><label>代理人：</label>
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
		<%-- 	<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${agentAccount.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新时间：</label>
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${agentAccount.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li> --%>
			<%-- <li><label>id：</label>
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
			</li>--%>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${agentAccount.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新时间：</label>
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${agentAccount.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li> 
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	
	<sys:message content="${message}"/>
	<li class="active"><th>账户列表</th></li>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<!-- --><th style="display:none">id</th> 
				<th style="display:none">agent_id</th>
				<th>代理人</th>
				<th>余额</th>
				<th>累计收入</th>
				<th>累计提现</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="agentAccount">
			<tr>
				<%----%> <td style="display:none"><a href="${ctx}/agent/agentAccount/form?id=${agentAccount.id}">
					${agentAccount.id}
				</a></td>
				<td style="display:none">
					${agentAccount.agentId}
				</td> 
				<td style="display:none">
					${agentAccount.agentId}
				</td>
				<td>
					${agentAccount.agentName}
				</td>
				<td>
					${agentAccount.balance}
				</td>
				<td>
					${agentAccount.income}
				</td>
				<td>
					${agentAccount.withdraw}
				</td>
				<td>
				<fmt:formatDate value="${agentAccount.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					<%-- <fmt:formatDate value="${agentAccount.commission}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
				</td>
				<td>
				<fmt:formatDate value="${agentAccount.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				<%--
				<fmt:formatDate value="${agentAccount.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					 <fmt:formatDate value="${agentAccount.fee}" pattern="yyyy-MM-dd HH:mm:ss"/> 
				</td>--%>
<%-- 				<td>
				${fns:getDictLabel(agentAccount.status,'order_status','')}
					<fmt:formatDate value="${agentAccount.fee}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td> --%>
				<td>
				<c:if test="${fn:contains(agentAccount.tradeType, '1') && fn:contains(agentAccount.tradeStatus, '0')}">
    				<a href="${ctx}/agent/agentAccount/financeWithdrawList?agentId=${agentAccount.agentId}&agentName=${agentAccount.agentName}">提现待回款</a></c:if>
    				&nbsp;<a href="${ctx}/agent/agentAccount/financeWithdrawDetailList?agentId=${agentAccount.agentId}&agentName=${agentAccount.agentName}">详情</a>
    				<%-- <c:if test="${agentAccount.tradeStatus == '1'}">
					<a href="${ctx}/agent/agentAccount/delete?id=${agentAccount.id}" onclick="return confirmx('确认要删除该保存代理人账户成功吗？', this.href)">已回款</a>
				</c:if> --%>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>