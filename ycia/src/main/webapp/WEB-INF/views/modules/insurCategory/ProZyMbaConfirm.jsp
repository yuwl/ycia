<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="control-group">
	<label class="control-label">企业类别:</label>
	<div class="controls">
		<form:input path="proZyMba.enterpriseType" htmlEscape="false" readonly="true"/>
	</div>
</div>
<div class="control-group">
	<label class="control-label">经营内容:</label>
	<div class="controls">
		<form:input path="proZyMba.businessContent" htmlEscape="false" readonly="true"/>
	</div>
</div>
<div class="control-group">
	<label class="control-label">营业/活动场所地区:</label>
	<div class="controls">
		<form:input path="proZyMba.openAddress" htmlEscape="false" readonly="true"/>
	</div>
</div>
<div class="control-group">
	<label class="control-label">保险期间:</label>
	<div class="controls">
		<input name="proZyMba.startTime" class="input-medium Wdate required" value="<fmt:formatDate value="${orderPolicy.proZyMba.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly"/>
		-
		<input name="proZyMba.endTime" class="input-medium Wdate required" value="<fmt:formatDate value="${orderPolicy.proZyMba.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly"/>
	</div>
</div>
<div class="control-group">
	<label class="control-label">累计赔偿限额及每次事故赔偿限额:</label>
	<div class="controls">
		<form:input path="proZyMba.totalClaim" htmlEscape="false" readonly="true"/>
	</div>
</div>
<div class="control-group">
	<label class="control-label">每次事故财产损失赔偿限额:</label>
	<div class="controls">
		<form:input path="proZyMba.eachClaim" htmlEscape="false" readonly="true"/>
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

<script type="text/javascript">
totalClaim 
eachClaim

</script>