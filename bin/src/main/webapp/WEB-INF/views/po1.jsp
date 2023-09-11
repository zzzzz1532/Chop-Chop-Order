<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 抄憲春AJAX版 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON 數據顯示</title>
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
					var content = "<table border='1'>";
					content += "<tr height='48'  ><th colspan='7' style='font-size: 26px'>暫存訂單JSON</th></tr>";
					content += "<tr ><th width='80'>單號</th><th width='100'>內用外帶</th><th width='180'>總額</th>"
							+ "<th width='90'>品名</th><th width='140'>數量</th>"
							+ "<th width='280'>接單時間</th></tr>";
					console.log(xhr.responseText);
					var orders = JSON.parse(xhr.responseText); // 解析 orders[i].orderId
					console.log(orders);
					for (var i = 0; i < orders.length; i++) {
	
						content += "<tr>"
								+ "<td align='center'>"
								+ orders[i].orderNo
								+ "</td>"
								+ "<td>"
								+ orders[i].diningLocation
								+ "</td>"
								+ "<td align='right'>"
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
	<div class="container">
		<h2>勘版系統</h2>
		<hr>
		<div class='center' id='somedivS'></div>
	</div>
</body>
</html>
