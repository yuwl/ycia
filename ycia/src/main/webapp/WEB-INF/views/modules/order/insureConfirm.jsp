<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>投保</title>
	<meta name="decorator" content="default" />
	<script type="text/javascript">
		$(document).ready(function(){
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				}
			});
		})
		
		jQuery.validator.addMethod("mobile", function(value, element) {
		    var length = value.length;
		    return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/.test(value));
		}, "请正确填写您的手机号码");

	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="orderPolicy" action="${ctx}/order/orders/insureSubmit?clentId=${orderPolicy.clentId}&productId=${productId}" method="post" class="form-horizontal">
		<%-- <form:hidden path="id"/> --%>
		<div class="form-actions">
			<label class="control-label">投保人信息</label>
			<input id="lastNo" name="lastNo" type="hidden" value="${orderPolicy.lastNo}">
		</div>
		<div class="control-group">
			<label class="control-label">投保人名称:</label>
			<div class="controls">
				<%-- <input id="insureName" name="insureName" type="hidden" value="${orderPolicy.insureName}"> --%>
				<form:input path="insureName" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件号码:</label>
			<div class="controls">
				<%-- <input id="insureCardNo" name="insureCardNo" type="hidden" value="${orderPolicy.insureCardNo}"> --%>
				<form:input path="insureCardNo" htmlEscape="false" maxlength="18" class="card" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话:</label>
			<div class="controls">
				<%-- <input id="insurePhone" name="insurePhone" type="hidden" value="${orderPolicy.insurePhone}"> --%>
				<form:input path="insurePhone" htmlEscape="false" maxlength="11" class="mobile" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系地址:</label>
			<div class="controls">
				<%-- <input id="insureAddress" name="insureAddress" type="hidden" value="${orderPolicy.insureAddress}"> --%>
				<form:input path="insureAddress" htmlEscape="false" maxlength="150" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮政编码:</label>
			<div class="controls">
				<%-- <input id="insurePostcode" name="insurePostcode" type="hidden" value="${orderPolicy.insurePostcode}"> --%>
				<form:input path="insurePostcode" htmlEscape="false" maxlength="6" class="zipCode" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电子邮箱:</label>
			<div class="controls">
				<%-- <input id="insureEmail" name="insureEmail" type="hidden" value="${orderPolicy.insureEmail}"> --%>
				<form:input path="insureEmail" htmlEscape="false" maxlength="100" class="email" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<label class="control-label">被保人信息</label>
		</div>
		<div class="control-group">
			<label class="control-label">被保人名称:</label>
			<div class="controls">
				<%-- <input id="insuredName" name="insuredName" type="hidden" value="${orderPolicy.insuredName}"> --%>
				<form:input path="insuredName" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件号码:</label>
			<div class="controls">
				<%-- <input id="insuredCardNo" name="insuredCardNo" type="hidden" value="${orderPolicy.insuredCardNo}"> --%>
				<form:input path="insuredCardNo" htmlEscape="false" maxlength="18" class="card" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话:</label>
			<div class="controls">
				<%-- <input id="insuredPhone" name="insuredPhone" type="hidden" value="${orderPolicy.insuredPhone}"> --%>
				<form:input path="insuredPhone" htmlEscape="false" maxlength="11" class="mobile" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系地址:</label>
			<div class="controls">
				<%-- <input id="insuredAddress" name="insuredAddress" type="hidden" value="${orderPolicy.insuredAddress}"> --%>
				<form:input path="insuredAddress" htmlEscape="false" maxlength="150" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮政编码:</label>
			<div class="controls">
				<%-- <input id="insuredPostcode" name="insuredPostcode" type="hidden" value="${orderPolicy.insuredPostcode}"> --%>
				<form:input path="insuredPostcode" htmlEscape="false" maxlength="6" class="zipCode" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电子邮箱:</label>
			<div class="controls">
				<%-- <input id="insuredEmail" name="insuredEmail" type="hidden" value="${orderPolicy.insuredEmail}">  --%>
				<form:input path="insuredEmail" htmlEscape="false" maxlength="100" class="email" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<label class="control-label">受益人信息</label>
		</div>
		<div class="control-group">
			<label class="control-label">受益人名称:</label>
			<div class="controls">
				<%-- <input id="benefitName" name="benefitName" type="hidden" value="${orderPolicy.benefitName}"> --%>
				<form:input path="benefitName" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件号码:</label>
			<div class="controls">
				<%-- <input id="benefitCardNo" name="benefitCardNo" type="hidden" value="${orderPolicy.benefitCardNo}"> --%>
				<form:input path="benefitCardNo" htmlEscape="false" maxlength="18" class="card" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话:</label>
			<div class="controls">
				<%-- <input id="benefitPhone" name="benefitPhone" type="hidden" value="${orderPolicy.benefitPhone}"> --%>
				<form:input path="benefitPhone" htmlEscape="false" maxlength="11" class="mobile" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系地址:</label>
			<div class="controls">
				<%-- <input id="benefitAddress" name="benefitAddress" type="hidden" value="${orderPolicy.benefitAddress}"> --%>
				<form:input path="benefitAddress" htmlEscape="false" maxlength="150" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮政编码:</label>
			<div class="controls">
				<%-- <input id="benefitPostcode" name="benefitPostcode" type="hidden" value="${orderPolicy.benefitPostcode}"> --%>
				<form:input path="benefitPostcode" htmlEscape="false" maxlength="6" class="zipCode" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电子邮箱:</label>
			<div class="controls">
				<%-- <input id="benefitEmail" name="benefitEmail" type="hidden" value="${orderPolicy.benefitEmail}"> --%>
				<form:input path="benefitEmail" htmlEscape="false" maxlength="100" class="email" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<label class="control-label">其他信息</label>
		</div>
		<div class="control-group">
			<%@include file="../insurCategory/ProZyMbaConfirm.jsp" %>
		</div>
		
		<div class="form-actions">
			<div class="checkbox">
				<label>
					<input type="checkbox" checked="true" class="required" />已阅读并同意《相关协议》
					<span class="help-inline"><font color="red">*</font> </span>
				</label>
			</div>
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交报价" class="required"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>