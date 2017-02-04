<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>代理人客户</title>
	<meta name="decorator" content="default"/>
<style>
.img_width{width:200px;}
.img_width img{width:100%;}
</style>
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
		
		function check(){
			//var clientName = document.getElementById("clientName").value;
			//var phone = document.getElementById("phone").value;
			//var address = document.getElementById("address").value;
			//var postcode = document.getElementById("postcode").value;
			//var email = document.getElementById("email").value;
			//var cardNo = document.getElementById("cardNo").value;
			var photoFront = document.getElementById("photoFront").value;
			var photoBack = document.getElementById("photoBack").value;
			//var createTime = document.getElementById("createTime").value;
			//var clientName = document.getElementById("clientName").value;
			
			if (clientName==""){
				document.getElementById("cn").innerText="请填写客户名称！！！";
				return false;
			}/* else if(phone==""){
				document.getElementById("ct").innerText="请填写联系电话！！！";
				return false;
			}else if(address==""){
				document.getElementById("cd").innerText="请填写联系地址！！！";
				return false;
			}else if(postcode==""){
				document.getElementById("cp").innerText="请填写邮编！！！";
				return false;
			}else if(email==""){
				document.getElementById("cm").innerText="请填写电子邮件！！！";
				return false;
			}else if(cardNo==""){
				document.getElementById("cdn").innerText="请填写身份证号！！！";
				return false;
			} */else if(photoFront==""){
				document.getElementById("cpi").innerText="请上传证件正面照！！！";
				return false;
			}else if(photoBack==""){
				document.getElementById("cpb").innerText="请上传证件背面照！！！";
				return false;
			}else {
				return true;
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/agent/agentClent/">客户列表</a></li>
		<li class="active"><a href="${ctx}/agent/agentClent/form?id=${agentClent.id}"><shiro:hasPermission name="agent:agentClent:edit">${not empty agentClent.id?'客户修改':'添加客户'}</shiro:hasPermission><shiro:lacksPermission name="agent:agentClent:edit">客户查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="agentClent" action="${ctx}/agent/agentClent/save" method="post" class="form-horizontal" onsubmit="return check()">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<%-- <div class="control-group">
			<label class="control-label">所属代理人Id：</label>
			<div class="controls">
				<form:input path="agentId" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">客户名称：</label>
			<div class="controls">
				<form:input path="clientName" htmlEscape="false" maxlength="100" class="required"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cn"></span></div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">客户类型:</label>
			<div class="controls">
				<form:select path="clientType">
					<form:options items="${fns:getDictList('client_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">包括企业客户、个人客户</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" minlength="11" maxlength="11" class="required phone"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "ct"></span></div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系地址：</label>
			<div class="controls">
				<form:input path="address" htmlEscape="false" maxlength="200"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cd"></span></div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮政编码：</label>
			<div class="controls">
				<form:input path="postcode" htmlEscape="false" minlength="6" maxlength="6" class="zipCode"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cp"></span></div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电子邮箱：</label>
			<div class="controls">
				<form:input path="email" htmlEscape="false" maxlength="100" class="email"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cm"></span></div>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">证件类型：</label>
			<div class="controls">
				<form:input path="cardType" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">证件类型:</label>
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
				<form:input path="cardNo" htmlEscape="false" minlength="18" maxlength="18" class="required card"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cdn"></span></div>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">身份证正面照：</label>
			<div class="controls">
				<form:input path="photoFront" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证反面照：</label>
			<div class="controls">
				<form:input path="photoBack" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">证件正面照:</label>
			<div class="controls">
				<form:hidden id="photoFront" path="photoFront" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="photoFront" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cpi"></span></div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件背面照:</label>
			<div class="controls">
				<form:hidden id="photoBack" path="photoBack" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="photoBack" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cpb"></span></div>
			</div>
		</div>
		
									<!-- <td>    
            							<input type="file" id="file1" name="file1" style="width: 150px;"/>
	     								<input type="hidden" name="image1" id="image1"/>	
	     								<div class="img_width">
	     									<img src="" alt="" id="logoImg1" class="logoImg" style="margin-left:20px"/>	
	     								</div>	
	     							</td> 
	     							<td>
	     								<input type="file" id="file2" name="file2" style="width: 150px;"/>			
	     								<input type="hidden" name="image2" id="image2"/>
	     								<div class="img_width">
	     									<img src="" alt="" id="logoImg2" class="logoImg" style="margin-left:20px"/>
	     								</div>
	     							</td> -->
		
		<%-- <div class="control-group">
			<label class="control-label">创建时间：</label>
			<div class="controls">
				<input name="createTime" id="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${agentClent.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"><span id = "cct"></span></div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">更新时间：</label>
			<div class="controls">
				<input name="updateTime" id="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${agentClent.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">user_id：</label>
			<div class="controls">
				<form:input path="userId" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div> --%>
		<div class="form-actions">
			<%-- <shiro:hasPermission name="agent:agentClent:edit"> --%><c:if test="${chakan != '1' }"> <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/></c:if>&nbsp;<%-- </shiro:hasPermission> --%>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>