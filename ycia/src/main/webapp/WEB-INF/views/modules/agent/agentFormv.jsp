<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
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
	<title>安途一单一议 - 代理人注册</title>
	<meta name="decorator" content="default"/>
		<style type="text/css">
	.img_width{width:300px;}
	.img_width img{width:100%;}
	</style>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script src="${ctxStatic}/jquery/ajaxfileupload.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				rules: {
					loginName: {remote: "${pageContext.request.contextPath}/agent/agent/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')}
				},
				messages: {
					loginName: {remote: "用户登录名已存在"}
				},
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
	<%-- <ul class="nav nav-tabs">
		<shiro:hasPermission name="agent:agent:edit"><li><a href="${ctx}/agent/agent/">代理人列表</a></li></shiro:hasPermission>
		<li class="active"><a href="${pageContext.request.contextPath}/agent/agent/formv?id=${agent.id}">代理人注册</a></li>
	</ul> --%>
	<h1 style="text-align: center;margin-top: 20px;">代理人注册</h1>
	<div id="headDiv">
	<div style="text-align: center;margin-top: 50px;font-size: 14px;">请选择：</div>
	<div style="text-align: center;margin-top: 10px;font-size: 14px;">
		<input type="radio" name="agtype" value="0"/>公司代理人
		<input type="radio" name="agtype" value="1"/>社会代理人
	</div>
	<div style="text-align: center;margin-top: 10px;">
		<input id="btnNext" class="btn btn-primary" type="button" value="下一步"/>
		&nbsp;&nbsp;
		<input class="btn" type="button" value="返 回" onclick="javascript:location.href='${ctx}/login'"/>
	</div>
	</div>
	<div style="width:60%;margin:0 auto;padding:20px 0;display: none" id="formDiv">
	<form:form id="inputForm" modelAttribute="agent" action="${pageContext.request.contextPath}/agent/agent/save" method="post" class="form-horizontal" style="text-align: center;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<%-- <div class="control-group">
			<label class="control-label">user_id：</label>
			<div class="controls">
				<sys:treeselect id="userId" name="userId" value="${agent.userId}" labelName="" labelValue="${agent.userId}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">登录名：</label>
			<div class="controls">
				<input id="oldLoginName" name="oldLoginName" type="hidden" value="${user.loginName}">
				<input id="loginName" name="loginName" type="text" maxlength="50" minlength="3" class="${empty user.id?'required':''} username" style="height: 30px;"/>
				<c:if test="${empty user.id}"><span class="help-inline"><font color="red">*</font> </span></c:if>
				<span class="help-inline">字母数字组合 </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">密码：</label>
			<div class="controls">
				<input id="newPassword" name="newPassword" type="password" value="" maxlength="50" minlength="3" class="${empty user.id?'required':''}" style="height: 30px;"/>
				<c:if test="${empty user.id}"><span class="help-inline"><font color="red">*</font> </span></c:if>
				<c:if test="${not empty user.id}"><span class="help-inline">若不修改密码，请留空。</span></c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">确认密码：</label>
			<div class="controls">
				<input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="50" minlength="3" class="required" equalTo="#newPassword" style="height: 30px;"/>
				<c:if test="${empty user.id}"><span class="help-inline"><font color="red">*</font> </span></c:if>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属机构：</label>
			<div class="controls">
			 <select id="officeId" name="officeId" >
			 	 <c:forEach items="${office}" var="item">
					<option value="${item.id}">${item.name}</option>
				 </c:forEach>
					<%-- <form:options items="${officeList}" itemLabel="name" itemValue="id" htmlEscape="false"/> --%>
			 </select>
				<span class="help-inline"><font color="red">*</font></span> 
				 <%--<sys:treeselect id="officeId" name="officeId" value="${agent.officeId}" labelName="" labelValue="${agent.officeId}"
					title="部门" url="/sys/office/treeDataCompany?type=1"/>
				<span class="help-inline"><font color="red">*</font> </span> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">代理人姓名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100" class=" required" style="height: 30px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机号码：</label>
			<div class="controls">
			<input id="umobile" name="umobile" type="text" value="" maxlength="11" minlength="11" class="${empty user.id?'required':''} mobile" style="height: 30px;">
			<c:if test="${empty user.id}"><span class="help-inline"><font color="red">*</font> </span></c:if>
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
				<form:input path="cardNo" htmlEscape="false" maxlength="100" class=" required card" style="height: 30px;"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件正面照:</label>
			<div class="controls">
			<input type="file" id="file2" name="file2" style="width: 150px;"/>
			<form:hidden id="photoFront" path="photoFront" htmlEscape="false" maxlength="255" class="input-xlarge"/>
	     	<!-- <input type="hidden" name="photoFront" id="photoFront"/> -->	
	     	<div class="">
	     		<img src="" id="logoImg1" class="logoImg"  style="margin-left:20px;height:200px;"/>	
	     	</div>	
				<%-- <form:hidden id="photoFront" path="photoFront" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="photoFront" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cpi"></span></div>
			 --%>
			 </div>
		</div>
		<div class="control-group">
			<label class="control-label">证件背面照:</label>
			<div class="controls">
			
			<input type="file" id="file1" name="file1" style="width: 150px;"/>
	     	<!-- <input type="hidden" name="photoBack" id="photoBack"/> -->
	     	<form:hidden id="photoBack" path="photoBack" htmlEscape="false" maxlength="255" class="input-xlarge"/>	
	     	<div class="">
	     		<img src="" id="logoImg" class="logoImg"  style="margin-left:20px;height:200px;"/>	
	     	</div>	
	     								
				<%-- <form:hidden id="photoBack" path="photoBack" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="photoBack" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cpb"></span></div>
			 --%></div>
		</div>
		<shiro:hasPermission name="agent:agent:edit">
		<div class="control-group">
			<label class="control-label">佣金费率：</label>
			<div class="controls">
				<form:input path="rate" htmlEscape="false" class="input-xlarge  number" style="height: 30px;"/>
			</div>
		</div>
		</shiro:hasPermission>
		<%-- <div class="control-group">
			<label class="control-label">创建时间：</label>
			<div class="controls">
				<input name="createTime" type="text" style="height: 30px;" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${agent.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">更新时间：</label>
			<div class="controls">
				<input name="updateTime" type="text" style="height: 30px;" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${agent.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="remark" htmlEscape="false" maxlength="255" class="" style="height: 30px;"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">推荐人手机号：</label>
			<div class="controls">
				<form:input path="mobile" htmlEscape="false" maxlength="50" class="" style="height: 30px;"/>
			</div>
		</div>
		<shiro:hasPermission name="agent:agent:edit">
		<div class="control-group">
			<label class="control-label">审核结果：</label>
			<div class="controls">
				<form:select path="delFlag">
					<form:options items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">审核通过选择：正常，审核未通过选择：审核未通过</span>
			</div>
		</div>
		</shiro:hasPermission>
		<div class="form-actions" style="padding-left:100px;">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	</div>
	<script type="text/javascript">
	$(function(){
		$("#btnNext").click(function(){
			var agt = $("input[name=agtype]:checked").val();
			if(agt != undefined){
				$("#headDiv").hide();
				$("#formDiv").show();
				if(agt == 0){
					
				}else{
					$("#officeId").parents(".control-group").remove();
				}
			}
			
		});
	});
	
	$("body").on("change","input[name=file1]",function(){
		var filePath = $(this).val();
		var suffix = filePath.substring(filePath.indexOf("."));
		if(suffix == ".jpg" ||suffix == ".JPG" || suffix == ".jpeg" || suffix == ".png" || suffix == ".gif" || suffix == ".bmp"){
			ajaxFileUpload();
		}else{
			alert("请上传图片文件（jpg|png|gif等）");
			$("#photoBack").val()=="";
		}
	});

	function ajaxFileUpload() {
		$.ajaxFileUpload({
	        url: '<%=path%>/agent/agent/uploadPics/ticket.do',
	        secureuri: false,
	        fileElementId: 'file1',
	        dataType: 'text',
	        success: function (data, status) {
	        	$("#photoBack").val(data);
	        	$("#logoImg").attr("src","<%=basePathImg%>img"+data);
	        },
	        error: function (data, status, e){
	            alert(e);
	        }
	    });
	}
	$("body").on("change","input[name=file2]",function(){
		var filePath = $(this).val();
		var suffix = filePath.substring(filePath.indexOf("."));
		if(suffix == ".jpg" ||suffix == ".JPG" || suffix == ".jpeg" || suffix == ".png" || suffix == ".gif" || suffix == ".bmp"){
			ajaxFileUpload2();
		}else{
			alert("请上传图片文件（jpg|png|gif等）");
			$("#photoFront").val()=="";
		}
	});

	function ajaxFileUpload2() {
		$.ajaxFileUpload({
	        url: '<%=path%>/agent/agent/uploadPics/ticket.do',
	        secureuri: false,
	        fileElementId: 'file2',
	        dataType: 'text',
	        success: function (data, status) {
	        	$("#photoFront").val(data);
	        	$("#logoImg1").attr("src","<%=basePathImg%>img"+data);
	        },
	        error: function (data, status, e){
	            alert(e);
	        }
	    });
	}
	</script>
</body>
</html>