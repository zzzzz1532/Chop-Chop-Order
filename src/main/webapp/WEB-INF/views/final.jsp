<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div id="orderNumbers"></div>
	</div>
	 <script>
        // 獲取 URL 参数
        var urlParams = new URLSearchParams(window.location.search);
        var orderNumbers = urlParams.get('orderNumbers');

        // 檢查是否已經顯示了訂單號，如果沒有，則顯示第一個數值
        var orderNumberElement = document.getElementById('orderNumbers');
        if (orderNumbers && !orderNumberElement.textContent.trim()) {
            var orderNumberArray = orderNumbers.split(',');
            if (orderNumberArray.length > 0) {
                orderNumberElement.textContent = "訂單編號: " + orderNumberArray[0];
            }
        }
    </script>
</body>
</html>
