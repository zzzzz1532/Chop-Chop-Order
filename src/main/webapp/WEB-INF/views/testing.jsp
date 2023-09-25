<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 抄憲春+薏仁表格 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>訂單查詢系統</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.container {
	max-width: 800px;
	margin: auto;
	padding: 20px;
	background-color: white;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	margin-top: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f4f4f4;
}
</style>
<script type="text/javascript"
	src="<c:url value='/webjars/jquery/3.5.1/jquery.js' />"></script>
<script>
	$(() => {
		
		
		function requestData() {
	        $.ajax({
	            type: "GET",
	            url: "/findOrders",
	
	            success: function(orders) {
	            	console.log(orders);
	            	
	            	var tableHtml = '<table><tr><th colspan="7">訂單查詢</th></tr><tr ><th>單號</th><th>內用外帶</th><th>總額</th><th>接單時間</th></tr>';

	                $.each(orders, function(index, order) {
	                    tableHtml += '<tr>';
	                    tableHtml += '<td>' + order.orderNo + '</td>';
	                    tableHtml += '<td>' + order.diningLocation + '</td>';
	                    tableHtml += '<td>' + order.orderPrice + '</td>';
	                    tableHtml += '<td>' + order.created_at + '</td>';
	                    tableHtml += '</tr>';
	                });

	                tableHtml += '</tbody></table></div>';

	                $('#historyOrders').html(tableHtml);
	                
	            },
	            error: function(error) {
	                console.log(error);
	            }
	        });
	    }
		 requestData();
	});
	
	</script>
</head>
<body>

	<div class="container" id='historyOrders'></div>

</body>
</html>
