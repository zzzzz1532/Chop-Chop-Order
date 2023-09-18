<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>測試</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="script.js"></script>
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
    
</head>
<body>
    <div id="dailyTotalRevenue"></div>
    
    <script>
        // 使用JavaScript發送Ajax請求
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 從後端獲取的數據
                var data = xhr.responseText;
                
                // 在前端顯示數據
                document.getElementById("dailyTotalRevenue").innerHTML = "日營業總額: " + data;
            }
        };
        xhr.open("GET", "/dailyTotalRevenue", true);
        xhr.send();
        
        $(document).ready(function() {
            // 发送AJAX请求以获取JSON数据
            $.ajax({
                type: 'GET',
                url: '/weeklyHotProduct', // 这里填写你的API端点
                dataType: 'json',
                success: function(data) {
                    // 循环遍历JSON数据并将其添加到表格中
                    var productTableBody = $('#productTableBody');
                    $.each(data, function(index, product) {
                        var row = $('<tr>');
                        row.append($('<td>').text(product.productName));
                        row.append($('<td>').text(product.productQuantity));
                        row.append($('<td>').text(product.productPrice));
                        productTableBody.append(row);
                    });
                },
                error: function() {
                    alert('无法获取数据，请检查API端点。');
                }
            });
        });

        
    </script>
    
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody id="productTableBody">
            <!-- Data will be inserted here -->
        </tbody>
    </table>
    
    
    <form action="/queryData" method="post">
    <label for="startDate">開始日期：</label>
    <input type="date" id="startDate" name="startDate" required>

    <label for="endDate">結束日期：</label>
    <input type="date" id="endDate" name="endDate" required>

    <input type="submit" value="查詢">
</form>
    
    
    
    
    
</body>
</html>
