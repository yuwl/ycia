<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
	String basePaths = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/";
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String contextPath = request.getContextPath();
	String basePathImg = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
%>
<html>
<head>
	<title>保存资金明细成功管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/agent/agentAccount/">代理人账户</a></li>
		<li class="active"><a href="${ctx}/agent/agentFundDetail/form?id=${agentFundDetail.id}">详情</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="agentFundDetail" action="${ctx}/agent/agentFundDetail/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div style="display:none" class="control-group">
			<label class="control-label">agent_id：</label>
			<div class="controls">
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-xlarge required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">交易金额：</label>
			<div class="controls">
				<form:input path="money" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">交易时间：</label>
			<div class="controls">
				<input name="tradeTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${agentFundDetail.tradeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">交易凭证：</label>
			<div class="controls">
	     		<img src="<%=basePathImg%>${agentFundDetail.imgUrl}" alt="" id="imgUrl" style="width: 400px;height:400px" />
				<form:input path="imgUrl" type="hidden" htmlEscape="false" maxlength="300" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">交易类型：</label>
			<div class="controls">
			
			<form:select path="tradeType">
					<form:options items="${fns:getDictList('trade_type')}" itemLabel="label" itemValue="value" disabled="true" htmlEscape="false"/>
				</form:select>
				<%-- <form:input path="tradeType" htmlEscape="false" maxlength="1" class="input-xlarge "/> --%>
			</div>
		</div>
		<div style="display:none" class="control-group">
			<label class="control-label">交易状态：</label>
			<div class="controls">
				<form:input path="tradeStatus" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">操作人：</label>
			<div class="controls">
				<form:input path="operateBy" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<%-- <shiro:hasPermission name="agent:agentFundDetail:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission> --%>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>