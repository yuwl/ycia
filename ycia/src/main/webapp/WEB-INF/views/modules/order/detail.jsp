<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单详情</title>
	<meta name="decorator" content="default" />
</head>
<body>
	<form:form id="inputForm" modelAttribute="offerDto" action="" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<div class="form-actions">
			<label class="control-label">投保人信息</label>
			<input id="orderNo" name="orderNo" type="hidden" value="${offerDto.orderNo}">
		</div>
		<div class="control-group">
			<label class="control-label">投保人名称:</label>
			<div class="controls">
				<input id="insureName" name="insureName" type="hidden" value="${orderPolicy.insureName}">
				<form:input path="insureName" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件号码:</label>
			<div class="controls">
				<input id="insureCardNo" name="insureCardNo" type="hidden" value="${orderPolicy.insureCardNo}">
				<form:input path="insureCardNo" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话:</label>
			<div class="controls">
				<input id="insurePhone" name="insurePhone" type="hidden" value="${orderPolicy.insurePhone}">
				<form:input path="insurePhone" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系地址:</label>
			<div class="controls">
				<input id="insureAddress" name="insureAddress" type="hidden" value="${orderPolicy.insureAddress}">
				<form:input path="insureAddress" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮政编码:</label>
			<div class="controls">
				<input id="insurePostcode" name="insurePostcode" type="hidden" value="${orderPolicy.insurePostcode}">
				<form:input path="insurePostcode" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电子邮箱:</label>
			<div class="controls">
				<input id="insureEmail" name="insureEmail" type="hidden" value="${orderPolicy.insureEmail}">
				<form:input path="insureEmail" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<label class="control-label">被保人信息</label>
		</div>
		<div class="control-group">
			<label class="control-label">被保人名称:</label>
			<div class="controls">
				<input id="insuredName" name="insuredName" type="hidden" value="${orderPolicy.insuredName}">
				<form:input path="insuredName" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件号码:</label>
			<div class="controls">
				<input id="insuredCardNo" name="insuredCardNo" type="hidden" value="${orderPolicy.insuredCardNo}">
				<form:input path="insuredCardNo" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话:</label>
			<div class="controls">
				<input id="insuredPhone" name="insuredPhone" type="hidden" value="${orderPolicy.insuredPhone}">
				<form:input path="insuredPhone" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系地址:</label>
			<div class="controls">
				<input id="insuredAddress" name="insuredAddress" type="hidden" value="${orderPolicy.insuredAddress}">
				<form:input path="insuredAddress" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮政编码:</label>
			<div class="controls">
				<input id="insuredPostcode" name="insuredPostcode" type="hidden" value="${orderPolicy.insuredPostcode}">
				<form:input path="insuredPostcode" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电子邮箱:</label>
			<div class="controls">
				<input id="insuredEmail" name="insuredEmail" type="hidden" value="${orderPolicy.insuredEmail}">
				<form:input path="insuredEmail" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<label class="control-label">受益人信息</label>
		</div>
		<div class="control-group">
			<label class="control-label">受益人名称:</label>
			<div class="controls">
				<input id="benefitName" name="benefitName" type="hidden" value="${orderPolicy.benefitName}">
				<form:input path="benefitName" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件号码:</label>
			<div class="controls">
				<input id="benefitCardNo" name="benefitCardNo" type="hidden" value="${orderPolicy.benefitCardNo}">
				<form:input path="benefitCardNo" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话:</label>
			<div class="controls">
				<input id="benefitPhone" name="benefitPhone" type="hidden" value="${orderPolicy.benefitPhone}">
				<form:input path="benefitPhone" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系地址:</label>
			<div class="controls">
				<input id="benefitAddress" name="benefitAddress" type="hidden" value="${orderPolicy.benefitAddress}">
				<form:input path="benefitAddress" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮政编码:</label>
			<div class="controls">
				<input id="benefitPostcode" name="benefitPostcode" type="hidden" value="${orderPolicy.benefitPostcode}">
				<form:input path="benefitPostcode" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电子邮箱:</label>
			<div class="controls">
				<input id="benefitEmail" name="benefitEmail" type="hidden" value="${orderPolicy.benefitEmail}">
				<form:input path="benefitEmail" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<label class="control-label">其他信息</label>
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
		</div><br>
		<div class="control-group">
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<tr>
					<th>保险公司</th>
					<th>报价状态</th>
					<th>保额</th>
					<th>保费</th>
					<th>查看报价</th>
					<th>下载模板</th>
					<th>上传盖章凭证</th>
					<th>上传支付凭证</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${orderCompanyList}" var="list" varStatus="ord">
					<tr>
						<td>${fns:getDictLabel(list.companyId,'insur_company','')}</td>
						<td>${fns:getDictLabel(list.status,'order_status','')}</td>
						<td>${list.amount}</td>
						<td>${list.premium}</td>
						<td>
							<input type="hidden" name="ordercompanyId" value="${list.id}" />
							<input type="hidden" name="companyId" value="${list.companyId}" />
							<input name="show" class="btn btn-primary" type="button" value="查看报价"/>
						</td>
						<td>
							<input name="print" class="btn btn-primary" type="button" value="下载打印" onclick="pprint('${list.status}','${list.orderId}','${list.companyId}');"/>
						</td>
						<td>
							<input type="hidden" id="sealCret${ord.index}" name="sealCret${ord.index}"/>
							<c:if test="${list.sealCret!=''}">
								<img src="${list.sealCret}" width="100" height="100">
							</c:if>
							<sys:ckfinder input="sealCret${ord.index}" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"></div>
						</td>
						<td>
							<input type="hidden" id="payCret${ord.index}" name="payCret${ord.index}"/>
							<c:if test="${list.payCret!=''}">
								<img src="${list.payCret}" width="100" height="100">
							</c:if>
							<sys:ckfinder input="payCret${ord.index}" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/><div style="width:210px;padding-left:45px;color: #f00;font-size: 12px; padding-bottom: 8px;text-align: left:"></div>
						</td>
						<td>
							<c:if test="${list.status=='60'}">
								<input type="hidden" name="ordercompanyIds" value="${list.id}" />
								<input type="hidden" name="companyIds" value="${list.companyId}" />
								<input id="done" name="done" class="btn btn-primary" type="button" value="完成" />
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="button" value="上传凭证" />
			<input id="btnCancel" class="btn" type="button" value="返回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
		function pprint(status,orderId,companyId){
			if(status<20){
				alert("暂未报价，无法下载");
			}else{
				window.location = "${ctx}/order/orders/download?orderId="+orderId+"&companyId="+companyId;
			}
		}
		$("input[name='show']").click(function(){
			
			var ordercompanyId = $(this).siblings("input:eq(0)").val();
			var companyId = $(this).siblings("input:eq(1)").val();
			top.$.jBox.open("iframe:${ctx}/order/orders/showOffer?id="+ordercompanyId+"&companyId="+companyId, "查看报价",810,$(top.document).height()-240,{
				buttons:{"关闭":true},submit:function(v, h, f){
					
				}, loaded:function(h){
					$(".jbox-content", top.document).css("overflow-y","hidden");
				}
			});
		});
		
		$("#done").bind("click",function(){ 
			
			var orderCompanyId =  $("input[name='ordercompanyIds']").val(); 
			var companyId =  $("input[name='companyIds']").val(); 
			var orderNo = $("#orderNo").val();
			window.location = "${ctx}/order/orders/doneUpdateStatus?orderCompanyId="+orderCompanyId+"&companyId="+companyId+"&orderNo="+orderNo;
        });
		
		$(document).ready(function(){
			$("#btnSubmit").bind("click",function(){
				var sc='',pc='',orderCompanyId='',companyId='';
				$('#contentTable').find('tr').each(function(){
					var sealCret = $(this).find('td:eq(6) input:eq(0)').val(); 
					var payCret = $(this).find('td:eq(7) input:eq(0)').val();
					if(sealCret!== undefined && sealCret!== '' && payCret!==undefined && payCret!==''){
						orderCompanyId =  $(this).find('td:eq(4) input:eq(0)').val(); 
						companyId =  $(this).find('td:eq(4) input:eq(1)').val(); 
						sc = sealCret;
						pc = payCret;
					}
		        })
		        if(sc == '' || pc == ''){
		        	alert("请上传盖章凭证及支付凭证");
		        }else{
		        	var orderNo = $("#orderNo").val();
		        	window.location = "${ctx}/order/orders/uploadCret?orderCompanyId="+orderCompanyId+"&companyId="+companyId+"&sealCret="+sc+"&payCret="+pc+"&orderNo="+orderNo;
		        }
	       	});
		});
		
		

	</script>
</body>
</html>