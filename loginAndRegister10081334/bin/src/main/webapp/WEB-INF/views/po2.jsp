<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 抄憲春+薏仁表格 -->
<!DOCTYPE html>
<html>
<head>
    <title>JSON 數據表格</title>
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
		
 		.complete-button { 
 			background-color: #6dc26d; 
			border: none; 
			color: white; 
 			padding: 8px 16px; 
			text-align: center; 
			text-decoration: none; 
 			display: inline-block; 
 			font-size: 14px; 
 			margin: auto; 
 			cursor: pointer; 
			border-radius: 4px; 
 		} 
		
 		.completed { 
 			background-color: #d3d3d3; 
 		} 
	</style>
	<script type="text/javascript"
	src="<c:url value='/webjars/jquery/3.5.1/jquery.js' />"></script>
	<script>
	window.onload = function() {
		function fetchData() {	
			var xhr = new XMLHttpRequest(); //AJAX Engine
			xhr.open("Get", "<c:url value='/pendingOrder'/>", true);
			xhr.send(); //readyState 0->1, 1->2, 2->3, 3->4
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var content = "<table>";
					content += "<tr><th colspan='7'>暫存訂單JSON</th></tr>";
					content += "<tr ><th>單號</th><th>內用外帶</th><th>總額</th>"
							+ "<th>品名</th><th>數量</th>"
							+ "<th>接單時間</th></tr>";
					console.log(xhr.responseText);
					var orders = JSON.parse(xhr.responseText); // 解析 orders[i].orderId
					console.log(orders);
					for (var i = 0; i < orders.length; i++) {
	
						content += "<tr>"
								+ "<td>"
								+ orders[i].orderNo
								+ "</td>"
								+ "<td>"
								+ orders[i].diningLocation
								+ "</td>"
								+ "<td>"
								+ orders[i].orderPrice
								+ "&nbsp;</td>"
								+ "<td>"
								+ orders[i].foodName
								+ "</td>"
								+ "<td>"
								+ orders[i].foodQuantity
								+ "</td>"
								+ "<td>"
								+ orders[i].created_at
								+ "</td>"
								+ "</tr>";
					}
					content += "</table>";
					var divs = document.getElementById("somedivS");
					divs.innerHTML = content;
				}
			}
		}
	   // 使用 setInterval 定期執行 fetchData 函數
    	setInterval(fetchData, 1000); // 每 5 秒更新一次資料
	}	
	</script>
</head>
<body>

	<div class="container" id='somedivS'>
	</div>

</body>
</html>
