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
    <title>刊版系統</title>
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
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
	
	<script>
	window.onload = function() {
	var stompClient = null;

	function connect() {
	    var socket = new SockJS('/websocket');
	    stompClient = Stomp.over(socket);
	    stompClient.connect({}, function(frame) {
	        console.log('Connected TEST1: ' + frame); 
	        stompClient.subscribe('/topic/pendingOrders', function(data) {
	            console.log("成功訂閱");
	        	var orders = JSON.parse(data.body);
	            console.log('Received Data TEST 2:', orders);
	            var content = "<table>";
				content += "<tr><th colspan='7'>刊版系統</th></tr>";
				content += "<tr ><th>單號</th><th>內用外帶</th>"
						+ "<th>品名</th><th>數量</th>"
						+ "<th>接單時間</th></tr>";
				for (var i = 0; i < orders.length; i++) {

					content += "<tr>"
							+ "<td>"
							+ orders[i].orderNo
							+ "</td>"
							+ "<td>"
							+ orders[i].diningLocation
							+ "</td>"
							+ "<td>"
							+ orders[i].productName
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
	            console.log("DONE 123");
	            
	        });
	        // 在連線成功後自動觸發訂閱操作
	        stompClient.send("/app/sendMessage", {}, "");
	    });
	}

	connect();
	}	
	</script>
</head>
<body>

	<div class="container" id='somedivS'>
	</div>

</body>
</html>
