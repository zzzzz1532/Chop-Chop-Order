<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <h1>New Page</h1>
    
    
    <script>
        // 獲取 URL 参数
        var orderNumbers = '<%= request.getParameter("orderNumbers") %>';

        // 將訂單號顯示在頁面上
        var orderNumberElement = document.getElementById('orderNumbers');
        orderNumberElement.textContent = "訂單編號: " + orderNumbers;
    </script>

    <div id="orderNumbers">
        
    </div>
</div>
</body>
</html>
