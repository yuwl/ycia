<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存资金明细成功管理</title>
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
		<li class="active"><a href="${ctx}/agent/agentFundDetail/">资金明细列表</a></li>
		<shiro:hasPermission name="agent:agentFundDetail:edit"><li><a href="${ctx}/agent/agentFundDetail/form">详情</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="agentFundDetail" action="${ctx}/agent/agentFundDetail/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>id：</label>
				<form:input path="id" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>agent_id：</label>
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>交易金额：</label>
				<form:input path="money" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>交易时间：</label>
				<input name="tradeTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${agentFundDetail.tradeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>交易凭证：</label>
				<form:input path="imgUrl" htmlEscape="false" maxlength="300" class="input-medium"/>
			</li>
			<li><label>交易类型：</label>
				<form:input path="tradeType" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>交易状态：</label>
				<form:input path="tradeStatus" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>操作人：</label>
				<form:input path="operateBy" htmlEscape="false" maxlength="100" class="input-medium"/>
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
				<th>agent_id</th>
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
				<td><a href="${ctx}/agent/agentFundDetail/form?id=${agentFundDetail.id}">
					${agentFundDetail.id}
				</a></td>
				<td>
					${agentFundDetail.agentId}
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
				<c:if test="${agentFundDetail.tradeStatus == '0'}">提现中</c:if>
				<c:if test="${agentFundDetail.tradeStatus == '1'}">已提现</c:if>
				</td>
				<td>
					${agentFundDetail.operateBy}
				</td>
				<shiro:hasPermission name="agent:agentFundDetail:edit"><td>
    				<a href="${ctx}/agent/agentFundDetail/form?id=${agentFundDetail.id}">修改</a>
					<a href="${ctx}/agent/agentFundDetail/delete?id=${agentFundDetail.id}" onclick="return confirmx('确认要删除该保存资金明细成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>