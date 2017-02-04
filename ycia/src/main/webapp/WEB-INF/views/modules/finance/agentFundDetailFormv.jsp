<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>回款</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	/* 	$(document).ready(function() {
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
		}); */
		
		function check(){
			var imgUrl = document.getElementById("imgUrl").value;		
			if (imgUrl==""){
				document.getElementById("cpi").innerText="上传支付凭证！！！";
				return false;
			}else {
				return true;
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/agent/agentAccount/financeWithdrawList">代理人账户</a></li>
		<li class="active"><a href="${ctx}/agent/agentFundDetail/formv?id=${agentFundDetail.id}">回款<shiro:hasPermission name="agent:agentFundDetail:edit">${not empty agentFundDetail.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="agent:agentFundDetail:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="agentFundDetail" action="${ctx}/agent/agentFundDetail/paybackSave" method="post" class="form-horizontal" onsubmit="return check()">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div style="display:none" class="control-group">
			<label class="control-label">agent_id：</label>
			<div class="controls">
				<form:input path="agentId"  readonly="true" htmlEscape="false" maxlength="11" class="input-xlarge required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">代理人：</label>
			<input id="agentName" name="agentName" type="text" value="${agentName}"/>
		</div>
		<div class="control-group">
			<label class="control-label">交易金额：</label>
			<div class="controls">
				<form:input readonly="true" path="money" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">交易时间：</label>
			<div class="controls">
				<input name="tradeTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${agentFundDetail.tradeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div> --%>
		
		<div class="control-group">
			<label class="control-label">交易凭证:</label>
			<div class="controls">
				<form:hidden id="imgUrl" path="imgUrl" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imgUrl" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cpi"></span></div>
			</div>
		</div>
		
		<%-- <div class="control-group">
			<label class="control-label">交易凭证：</label>
			<div class="controls">
				<form:input path="imgUrl" htmlEscape="false" maxlength="300" class="input-xlarge "/>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">交易类型：</label>
			<div class="controls">
				<form:input path="tradeType" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
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
		</div>--%>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="确认回款"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>