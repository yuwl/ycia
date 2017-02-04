<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>中意小型商业定额A款管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/pro/proZyMba/">中意小型商业定额A款列表</a></li>
		<shiro:hasPermission name="pro:proZyMba:edit"><li><a href="${ctx}/pro/proZyMba/form">中意小型商业定额A款添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="proZyMba" action="${ctx}/pro/proZyMba/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>id</th>
				<th>主险种id</th>
				<th>主订单id</th>
				<th>企业类别</th>
				<th>经营内容</th>
				<th>营业场所</th>
				<th>保险开始时间</th>
				<th>保险结束时间</th>
				<th>累积赔偿限额</th>
				<th>每次赔偿限额</th>
				<th>创建人</th>
				<th>创建时间</th>
				<th>备注</th>
				<shiro:hasPermission name="pro:proZyMba:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="proZyMba">
			<tr>
				<td><a href="${ctx}/pro/proZyMba/form?id=${proZyMba.id}">
					${proZyMba.id}
				</a></td>
				<td>
					${proZyMba.insurProductId}
				</td>
				<td>
					${proZyMba.orderId}
				</td>
				<td>
					${proZyMba.enterpriseType}
				</td>
				<td>
					${proZyMba.businessContent}
				</td>
				<td>
					${proZyMba.openAddress}
				</td>
				<td>
					<fmt:formatDate value="${proZyMba.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${proZyMba.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${proZyMba.totalClaim}
				</td>
				<td>
					${proZyMba.eachClaim}
				</td>
				<td>
					${proZyMba.createBy}
				</td>
				<td>
					<fmt:formatDate value="${proZyMba.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${proZyMba.remarks}
				</td>
				<shiro:hasPermission name="pro:proZyMba:edit"><td>
    				<a href="${ctx}/pro/proZyMba/form?id=${proZyMba.id}">修改</a>
					<a href="${ctx}/pro/proZyMba/delete?id=${proZyMba.id}" onclick="return confirmx('确认要删除该中意小型商业定额A款吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>