<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String contextPath = request.getContextPath();
	String basePathImg = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/";
%>
<html>
<head>
	<title>保存代理人成功管理</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
	.img_width{width:400px;}
	.img_width img{width:100%;}
	</style>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
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
		<li><a href="${ctx}/agent/agent/">代理人列表</a></li>
		<li class="active"><a href="${ctx}/agent/agent/form?id=${agent.id}"><shiro:hasPermission name="agent:agent:edit">${not empty agent.id?'修改':'新增代理人'}</shiro:hasPermission><shiro:lacksPermission name="agent:agent:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="agent" action="${ctx}/agent/agent/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">user_id：</label>
			<div class="controls">
				<sys:treeselect id="userId" name="userId" value="${agent.userId}" labelName="" labelValue="${agent.userId}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属部门：</label>
			<div class="controls">
				<sys:treeselect id="officeId" name="officeId" value="${agent.officeId}" labelName="" labelValue="${agent.officeId}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">代理人姓名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件类型：</label>
			<div class="controls">
				<form:select path="cardType">
					<form:options items="${fns:getDictList('card_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">包括身份证、护照</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件号码：</label>
			<div class="controls">
				<form:input path="cardNo" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件正面照:</label>
			<div class="controls">
				<form:hidden id="photoFront" path="photoFront" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<%-- <sys:ckfinder input="photoFront" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cpi"></span></div> --%>
					<c:if test="${agent.photoFront != ''}">
								<tr>
									<td><div class="img_width">
	     									<img src="<%=basePathImg%>img${agent.photoFront}" alt="" id="logoImg1" class="logoImg" />
	     								</div></td>
								</tr>
					</c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件背面照:</label>
			<div class="controls">
				<form:hidden id="photoBack" path="photoBack" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<%-- <sys:ckfinder input="photoBack" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cpb"></span></div> --%>
					<c:if test="${agent.photoBack != ''}">
								<tr>
									<td><div class="img_width">
	     									<img src="<%=basePathImg%>img${agent.photoBack}" alt="" id="logoImg2" class="logoImg" />
	     							</div></td>
								</tr>
					</c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">佣金费率：</label>
			<div class="controls">
				<form:input path="rate" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">创建时间：</label>
			<div class="controls">
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${agent.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">更新时间：</label>
			<div class="controls">
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${agent.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="remark" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">推荐人手机号：</label>
			<div class="controls">
				<form:input path="mobile" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核结果：</label>
			<div class="controls">
				<form:select path="delFlag">
					<form:options items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">审核通过选择：正常，审核未通过选择：审核未通过</span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="agent:agent:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>