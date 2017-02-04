<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存代理人成功管理</title>
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
		<shiro:hasPermission name="agent:agent:edit"><li class="active"><a href="${ctx}/agent/agent/">代理人列表</a></li></shiro:hasPermission>
		<shiro:hasPermission name="agent:agent:edit"><li><a href="${pageContext.request.contextPath}/agent/agent/formv">新增代理人</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="agent" action="${ctx}/agent/agent/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<%-- <li><label>id：</label>
				<form:input type = "hidden" path="id" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>user_id：</label>
				<sys:treeselect id="userId" name="userId" value="${agent.userId}" labelName="" labelValue="${agent.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li> --%>
			<li><label>所属部门：</label>
				<sys:treeselect id="officeId" name="officeId" value="${agent.officeId}" labelName="" labelValue="${agent.officeId}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>代理人姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
		
			<li><label>证件号码：</label>
				<form:input path="cardNo" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>	
				<li><label>代理人状态：</label>
				<div style="width: 205px; margin-bottom: -24px; margin-top: -36px; margin-left: 92px;">
				<select id="delFlag" name="delFlag" style="width: 170px; height: 30px;">
			 	 	<c:forEach items="${fns:getDictList('del_flag')}" var="item">
			 	 		<option value=""></option>
						<option value="${item.value}">${item.label}</option>
				 	</c:forEach>
					<%-- <form:options items="${officeList}" itemLabel="name" itemValue="id" htmlEscape="false"/> --%>
			 	</select>
			 </div>
			
			</li>
			<%-- <form:select path="delFlag" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select> --%>
		<%-- 	</li>
			<li><label>身份证正面照：</label>
				<form:input path="photoFront" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>
			<li><label>身份证反面照：</label>
				<form:input path="photoBack" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li> --%>
				<%-- <li><label>证件类型：</label>
			<form:select path="cardType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('card_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li> --%>
			
			<%--<li><label>佣金费率：</label>
				<form:input path="rate" htmlEscape="false" class="input-medium"/>
			</li>
		 	<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${agent.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>创建人：</label>
				<form:input path="createBy" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>更新时间：</label>
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${agent.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新人：</label>
				<form:input path="updateBy" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li> 
			<li><label>删除标识：</label>
				<form:radiobuttons path="delFlag" items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>--%>
			<%-- <li><label>备注：</label>
				<form:input path="remark" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>被推荐人手机号：</label>
				<form:input path="mobile" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="display:none">id</th>
				<th style="display:none">user_id</th>
				<th>所属部门</th>
				<th>代理人姓名</th>
				<th>证件类型</th>
				<th>证件号码</th>
				<!-- <th>身份证正面照</th>
				<th>身份证反面照</th> -->
				<th>佣金费率</th>
				<!-- <th>创建时间</th>
				<th>创建人</th>
				<th>更新时间</th>
				<th>更新人</th>
				<th>删除标识</th>
				<th>备注</th>
				<th>被推荐人手机号</th> -->
				<th>代理人状态</th>
				<shiro:hasPermission name="agent:agent:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="agent">
			<tr>
				<td style="display:none"><a href="${ctx}/agent/agent/form?id=${agent.id}">
					${agent.id}
				</a></td>
				<td style="display:none">
					${agent.userId}
				</td>
				<td>
					${agent.officeId}
				</td>
				<td>
					${agent.name}
				</td>
				<td>
				<c:if test="${agent.cardType== '0' }">
					身份证</c:if>
					<c:if test="${agent.cardType== '1' }">
					护照</c:if>
				</td>
				<td>
					${agent.cardNo}
				</td>
				<%-- <td>
					${agent.photoFront}
				</td>
				<td>
					${agent.photoBack}
				</td> --%>
				<td>
					${agent.rate}
				</td>
	<%-- 			<td>
					<fmt:formatDate value="${agent.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${agent.createBy}
				</td>
				<td>
					<fmt:formatDate value="${agent.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${agent.updateBy}
				</td>
				<td>
					${fns:getDictLabel(agent.delFlag, 'del_flag', '')}
				</td>
				<td>
					${agent.remark}
				</td>
				<td>
					${agent.mobile}
				</td> --%>
					<td>
					${fns:getDictLabel(agent.delFlag, 'del_flag', '')}
				</td>
				<shiro:hasPermission name="agent:agent:edit"><td>
    				<a href="${ctx}/agent/agent/confirmformv?id=${agent.id}">修改</a>
    				<c:if test="${agent.delFlag == '2'}"><a href="${ctx}/agent/agent/confirmformv?id=${agent.id}">审核</a> </c:if>
					<a href="${ctx}/agent/agent/delete?id=${agent.id}" onclick="return confirmx('确认要删除该保存代理人成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>