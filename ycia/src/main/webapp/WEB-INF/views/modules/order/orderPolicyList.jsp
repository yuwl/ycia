<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保单管理</title>
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
		<li class="active"><a href="${ctx}/order/orderPolicy/list1">保单管理列表</a></li>
		<%-- <shiro:hasPermission name="order:orderPolicy:edit"><li><a href="${ctx}/order/orderPolicy/form">保单管理添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="orderPolicy" action="${ctx}/order/orderPolicy/list1" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><%-- <label>id：</label>
				<form:input path="id" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li> --%>
			<li><label>保单编号：</label>
				<form:input path="policyNo" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<%-- <li><label>order_id：</label>
				<form:input path="orderId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li> --%>
			<li><label>订单编号：</label>
				<form:input path="orderNo" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<%-- <li><label>险种：</label>
				<form:input path="productId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>代理人：</label>
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li> --%>
			<%-- <li><label>user_id：</label>
				<form:input path="userId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li> 
			
			<li><label>所属部门：</label>
				<form:input path="officeId" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>保费：</label>
				<form:input path="premium" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>保额：</label>
				<form:input path="amonut" htmlEscape="false" class="input-medium"/>
			</li>--%>
			<li><label>开始时间：</label>
				<input name="startTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${orderPolicy.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>结束时间：</label>
				<input name="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${orderPolicy.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<%-- <li><label>上一年保单号：</label>
				<form:input path="lastNo" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li> --%>
			<li><label>投保人姓名：</label>
				<form:input path="insureName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<%-- <li><label>投保人证件号码：</label>
				<form:input path="insureCardNo" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>投保人联系电话：</label>
				<form:input path="insurePhone" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>投保人联系地址：</label>
				<form:input path="insureAddress" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>投保人邮政编码：</label>
				<form:input path="insurePostcode" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>投保人电子邮箱：</label>
				<form:input path="insureEmail" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>被保人姓名：</label>
				<form:input path="insuredName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>被保人证件号码：</label>
				<form:input path="insuredCardNo" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>被保人联系电话：</label>
				<form:input path="insuredPhone" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>被保人联系地址：</label>
				<form:input path="insuredAddress" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>被保人邮政编码：</label>
				<form:input path="insuredPostcode" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>被保人电子邮箱：</label>
				<form:input path="insuredEmail" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>受益人姓名：</label>
				<form:input path="benefitName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>受益人证件号码：</label>
				<form:input path="benefitCardNo" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>受益人联系电话：</label>
				<form:input path="benefitPhone" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>受益人联系地址：</label>
				<form:input path="benefitAddress" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>受益人邮政编码：</label>
				<form:input path="benefitPostcode" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>受益人电子邮箱：</label>
				<form:input path="benefitEmail" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>保单状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${orderPolicy.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>创建人：</label>
				<form:input path="createBy" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>备注：</label>
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<!-- <th>id</th> --> 
				<th>保单编号</th>
				<!-- <th>order_id</th> -->
				<th>订单编号</th>
				<th>险种</th>
				<!-- <th>user_id</th> -->
				<th>代理人</th>
				<!-- <th>所属部门</th> -->
				<th>投保人</th>
				<th>被保人</th>
				<th>保费</th>
				<th>保额</th>
				<th>保单开始时间</th>
				<th>保单结束时间</th>
<!-- 				 <th>上一年保单号</th> -->
				<!--<th>投保人证件号码</th>
				<th>投保人联系电话</th>
				<th>投保人联系地址</th>
				<th>投保人邮政编码</th>
				<th>投保人电子邮箱</th>
				<th>被保人姓名</th>
				<th>被保人证件号码</th>
				<th>被保人联系电话</th>
				<th>被保人联系地址</th>
				<th>被保人邮政编码</th>
				<th>被保人电子邮箱</th>
				<th>受益人姓名</th>
				<th>受益人证件号码</th>
				<th>受益人联系电话</th>
				<th>受益人联系地址</th>
				<th>受益人邮政编码</th>
				<th>受益人电子邮箱</th> 
				<th>保单状态</th>
				<th>创建时间</th>
				<th>创建人</th>-->
<!-- 				<th>备注</th> -->
				<th>保单状态</th>
				<shiro:hasPermission name="order:orderPolicy:edit"><th width="100">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="orderPolicy">
			<tr>
				<td style="display:none;">
					${orderPolicy.id}
				</td>
				<td>
				<a href="${ctx}/order/orderPolicy/formv?id=${orderPolicy.id}">
					${orderPolicy.policyNo}
				</a>
					
				</td>
				<%-- <td>
					${orderPolicy.orderId}
				</td> --%>
				<td>
					${orderPolicy.orderNo}
				</td>
				<td style="display:none;">
					${orderPolicy.productId}
				</td>
				<td>
					${orderPolicy.productName}
				</td>
			<%-- 	<td>
					${orderPolicy.userId}
				</td> --%>
				<td>
					${orderPolicy.agentName}
				</td>
				<td>
					${orderPolicy.insureName}
				</td>
				<td>
					${orderPolicy.insuredName}
				</td>
				<%-- <td>
					${orderPolicy.officeId}
				</td> --%>
				<td>
					${orderPolicy.premium}
				</td>
				<td>
					${orderPolicy.amonut}
				</td>
				<td>
					<fmt:formatDate value="${orderPolicy.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${orderPolicy.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
<!-- 			 	<td> -->
<%-- 					${orderPolicy.lastNo} --%>
<!-- 				</td> -->
				
				<%--<td>
					${orderPolicy.insureCardNo}
				</td>
				<td>
					${orderPolicy.insurePhone}
				</td>
				<td>
					${orderPolicy.insureAddress}
				</td>
				<td>
					${orderPolicy.insurePostcode}
				</td>
				<td>
					${orderPolicy.insureEmail}
				</td>
				<td>
					${orderPolicy.insuredName}
				</td>
				<td>
					${orderPolicy.insuredCardNo}
				</td>
				<td>
					${orderPolicy.insuredPhone}
				</td>
				<td>
					${orderPolicy.insuredAddress}
				</td>
				<td>
					${orderPolicy.insuredPostcode}
				</td>
				<td>
					${orderPolicy.insuredEmail}
				</td>
				<td>
					${orderPolicy.benefitName}
				</td>
				<td>
					${orderPolicy.benefitCardNo}
				</td>
				<td>
					${orderPolicy.benefitPhone}
				</td>
				<td>
					${orderPolicy.benefitAddress}
				</td>
				<td>
					${orderPolicy.benefitPostcode}
				</td>
				<td>
					${orderPolicy.benefitEmail}
				</td>
				<td>
					${orderPolicy.status}
				</td>
				<td>
					<fmt:formatDate value="${orderPolicy.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${orderPolicy.createBy}
				</td> --%>
				<td>
<%-- 					${orderPolicy.remarks} --%>
					${fns:getDictLabel(orderPolicy.status,'policy_status','')}
				</td>
				<shiro:hasPermission name="order:orderPolicy:edit"><td>
    				<a href="${ctx}/order/orderPolicy/formv?id=${orderPolicy.id}&chakan=1">查看</a>
    				<a href="${ctx}/order/orders/insure?id=${orderPolicy.clentId}&productId=${orderPolicy.productId}">续保</a>
					<%-- <a href="${ctx}/order/orderPolicy/delete?id=${orderPolicy.id}" onclick="return confirmx('确认要删除该保单管理吗？', this.href)">删除</a> --%>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>