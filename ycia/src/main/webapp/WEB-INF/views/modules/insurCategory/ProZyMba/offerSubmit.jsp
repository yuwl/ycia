<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>报价</title>
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

	</script>
</head>
<body>
<form:form id="inputForm" modelAttribute="offerDto" action="${ctx}/order/orderCompany/offerSubmitComplete" method="post" class="form-horizontal">
	<div class="form-actions">
		<label class="control-label">险种信息</label>
		<input id="orderNo" name="orderNo" type="hidden" value="${offerDto.orderNo}">
		<input id="companyId" name="companyId" type="hidden" value="${offerDto.companyId}">
		<input id="orderCompanyId" name="orderCompanyId" type="hidden" value="${offerDto.orderCompanyId}">
	</div>
	<div class="control-group">
		<label class="control-label">险种名称:</label>
		<div class="controls">
			<%-- <input id="insureName" name="insureName" type="hidden" value="${orderPolicy.insureName}"> --%>
			<form:input path="productId" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">累计赔偿限额及每次事故赔偿限额:</label>
		<div class="controls">
			<form:input path="totalClaim" htmlEscape="false" readonly="true"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">每次事故财产损失赔偿限额:</label>
		<div class="controls">
			<form:input path="eachClaim" htmlEscape="false" readonly="true"/>
		</div>
	</div>
	<div class="form-actions">
		<label class="control-label">投保人信息</label>
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
		<label class="control-label">投保信息</label>
	</div>
	<div class="control-group">
		<label class="control-label">企业类别:</label>
		<div class="controls">
			<form:input path="enterpriseType" htmlEscape="false" readonly="true"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">经营内容:</label>
		<div class="controls">
			<form:input path="businessContent" htmlEscape="false" readonly="true"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">营业/活动场所地区:</label>
		<div class="controls">
			<form:input path="openAddress" htmlEscape="false" readonly="true"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">保险期间:</label>
		<div class="controls">
			<input name="startTime" class="input-medium Wdate required" value="<fmt:formatDate value="${offerDto.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly"/>
			-
			<input name="endTime" class="input-medium Wdate required" value="<fmt:formatDate value="${offerDto.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">累计赔偿限额及每次事故赔偿限额:</label>
		<div class="controls">
			<form:input path="totalClaim" htmlEscape="false" readonly="true"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">每次事故财产损失赔偿限额:</label>
		<div class="controls">
			<form:input path="eachClaim" htmlEscape="false" readonly="true"/>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label">特别条款</label>
		<label class="control-label">每次赔偿限额</label>
		<label class="control-label">累计赔偿限额</label>
	</div>
	<div class="control-group">
		<label class="control-label">火灾和爆炸责任条款</label>
		<label class="control-label">——</label>
		<label class="control-label">——</label>
	</div>
	<div class="control-group">
		<label class="control-label">食品、饮料责任保险</label>
		<label class="control-label">10万</label>
		<label class="control-label">50万</label>
	</div>
	<div class="control-group">
		<label class="control-label">急救费用条款</label>
		<label class="control-label">5千</label>
		<label class="control-label"></label>
	</div>
	<div class="control-group">
		<label class="control-label">社交和体育活动扩展条款</label>
		<label class="control-label">10万</label>
		<label class="control-label">50万</label>
	</div>
	<div class="control-group">
		<label class="control-label">广告及装饰装置责任条款</label>
		<label class="control-label">10万</label>
		<label class="control-label">50万</label>
	</div>
	<div class="control-group">
		<label class="control-label">承租人责任条款</label>
		<label class="control-label">——</label>
		<label class="control-label">——</label>
	</div>
	<div class="control-group">
		<label class="control-label">免赔额</label>
		<div class="controls">
			针对财产损失，每次事故RMB500元或损失金额的10%，以高者为准
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">特别约定</label>
		<div class="controls">
			1. 投保场所面积不超过1000平方米。<br>
			2. 本保险计划不承保任何由被保险人保管之第三者财产的被盗/抢劫或因专业养护、维修、洗涤等造成的损失，我司对于由此产生的损失不负任何赔偿责任。
		</div>
	</div>
	<div class="form-actions">
		<label class="control-label">报价信息</label>
	</div>
	<div class="control-group">
		<label class="control-label">投保险种</label>
		<label class="control-label">保险金额/责任限额(元)</label>
		<label class="control-label">保险费(元)</label>
	</div>
	<div class="control-group">
		<label class="control-label">${offerDto.productId }</label>
		<label class="control-label">${offerDto.totalClaim }</label>
		<div class="controls">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- <input type="text" name="insureName" class="required"/> -->
			<form:input path="premium" htmlEscape="false" maxlength="6" class="required"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">手续费(%)</label>
		<div class="controls"><!-- <input type="text" name="insureName" class="required"/> -->
			<form:input path="feeRate" htmlEscape="false" maxlength="6" class="required"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">总保费</label>
		<div class="controls"><!-- <input type="text" name="insureName" class="required"/> -->
			<form:input path="premium" htmlEscape="false" maxlength="6" class="required"/>
		</div>
	</div>
		<div class="control-group">
		<label class="control-label">免赔额(元)</label>
		<div class="controls"><!-- <input type="text" name="insureName" class="required"/> -->
			<form:input path="deductible" htmlEscape="false" maxlength="6" class="required"/>
		</div>
	</div>
		<div class="control-group">
		<label class="control-label">免赔细则</label> 
		<div class="controls"><!-- <textarea cols="500" rows="5" name="insureName" class="required"></textarea> -->
			<form:textarea path="deductibleDesc" htmlEscape="false" maxlength="500" class="required"/>
		</div>
	</div>
	<div class="form-actions">
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交报价"/>&nbsp;
		<input id="btnCancel" class="btn" type="button" value="返回" onclick="history.go(-1)"/>&nbsp;
	</div>
</form:form>
</body>
</html>