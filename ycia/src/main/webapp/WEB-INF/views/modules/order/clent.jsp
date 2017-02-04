<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存代理人客户成功管理</title>
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
		<li class="active"><a href="${ctx}/agent/agentClent/">投保</a></li>
	</ul>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>客户名称</th>
				<th>客户类型</th>
				<th>联系电话</th>
				<th>证件类型</th>
				<th>证件号码</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="agentClent">
			<tr>
				<td>
					${agentClent.clientName}
				</td>
				<td>
					${fns:getDictLabel(agentClent.clientType,'client_type','')}
				</td>
				<td>
					${agentClent.phone}
				</td>
				<td>
					${fns:getDictLabel(agentClent.cardType,'card_type','')}
				</td>
				<td>
					${agentClent.cardNo}
				</td>
				<td>
					<a href="${ctx}/order/orders/clent">查看</a>
					<a href="${ctx}/order/orders/insure?id=${agentClent.id}&productId=${productId}">投保</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>