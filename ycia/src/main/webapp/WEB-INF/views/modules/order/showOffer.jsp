<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>报价</title>
	<meta name="decorator" content="default" />
</head>
<body>
<form:form id="inputForm" modelAttribute="offerDto" action="" method="post" class="form-horizontal">
	<div class="control-group">
		<label class="control-label">投保险种</label>
		<label class="control-label">保险金额/责任限额(元)</label>
		<label class="control-label">保险费(元)</label>
	</div>
	<div class="control-group">
		<label class="control-label">${offerDto.productId }</label>
		<label class="control-label">${offerDto.totalClaim }</label>
		<div class="controls">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
		<div class="controls">
			<form:input path="premium" htmlEscape="false" maxlength="6" class="required"/>
		</div>
	</div>
		<div class="control-group">
		<label class="control-label">免赔额(元)</label>
		<div class="controls">
			<form:input path="deductible" htmlEscape="false" maxlength="6" class="required"/>
		</div>
	</div>
		<div class="control-group">
		<label class="control-label">免赔细则</label> 
		<div class="controls">
			<form:textarea path="deductibleDesc" htmlEscape="false" maxlength="500" class="required"/>
		</div>
	</div>
</form:form>
</body>
</html>