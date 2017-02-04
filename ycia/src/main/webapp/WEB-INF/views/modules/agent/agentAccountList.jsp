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
		function check(){
			var money = document.getElementById("money").value;
			var balance = document.getElementById("balance").value;
			if (balance-money < 0){
				document.getElementById("cpi").innerText="提现金额不能多于余额，请重新填写！！！";
				return false;
			}else {
				return true;
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/agent/agentAccount/">代理人账户</a></li>
		<%-- <shiro:hasPermission name="agent:agentAccount:edit"><li><a href="${ctx}/agent/agentAccount/form">保存代理人账户成功添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="agentAccount" action="${ctx}/agent/agentAccount/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
		<%-- <li><label>id：</label>
				<form:input path="id" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>agent_id：</label>
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li> --%>
		<li><label>余额：</label>
				<form:input path="balance" readonly="true" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>累计收入：</label>
				<form:input path="income" readonly="true" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>累计提现：</label>
				<form:input path="withdraw" readonly="true" htmlEscape="false" class="input-medium"/>
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
			</li>
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
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>--%>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	
	<form:form id="searchForm" action="${ctx}/agent/agentAccount/saveFundDetail" method="post" class="breadcrumb form-search" onsubmit="return check()">
		<%-- <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/> --%>
		<ul class="ul-form">
		<%-- <li><label>id：</label>
				<form:input path="id"  htmlEscape="false" maxlength="11" class="input-medium"/>
			</li> --%>
			<input id="agentId" name="agentId" type="hidden" value="${agentAccount.agentId}"/>
			<input id="tradeType" name="tradeType" type="hidden" value="1"/>
			<input id="balance" name="balance" type="hidden" value="${agentAccount.balance}"/>
			<%-- <li><label>agent_id：</label>
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li> --%>
			<li><label>提现：</label>
				<input id="money" name="money" type="text" value=""/>
			</li>
			
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="提现"/></li>
			<div style="width:400px;padding-left:45px;color: #f00;font-size: 16px;margin-top: 10px; margin-left: 341px;"><span id = "cpi"></span></div>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	
	<sys:message content="${message}"/>
	<li class="active"><th>交易列表</th></li>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="display:none">id</th>
				<th style="display:none">agent_id</th>
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
				<c:if test="${agentFundDetail.tradeStatus == '2'}">返现</c:if>
				</td>
				<td>
					${agentFundDetail.operateBy}
				</td>
				<td>
    				<a href="${ctx}/agent/agentFundDetail/form?id=${agentFundDetail.id}">查看</a>
					<%-- <a href="${ctx}/agent/agentFundDetail/delete?id=${agentFundDetail.id}" onclick="return confirmx('确认要删除该保存资金明细成功吗？', this.href)">删除</a> --%>
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
</body>
</html>