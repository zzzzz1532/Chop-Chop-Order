<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>歷史訂單查詢</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
    
        header {
            background-color: #35424a;
            color: white;
            padding: 10px;
            text-align: center;
        }
    
        .container {
            max-width: 900px;
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
        
        .webpage2 {
            display: none;
        }
    
        th,
        td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
    
        th {
            background-color: #f4f4f4;
        }
    
        .accept-button {
            text-align: center;
        }
    
        .completed {
            background-color: #d1ffd8;
        }
    
        .pending {
            background-color: white;
        }
    
        /* 調整"待處理訂單"表格欄位大小 */
        table.pending tbody td:nth-child(1),
        table.pending tbody th:nth-child(1) {
            width: 10%;
        }
    
        table.pending tbody td:nth-child(2),
        table.pending tbody th:nth-child(2) {
            width: 20%; /* 调整總額的比例 */
        }
    
        table.pending tbody td:nth-child(3),
        table.pending tbody th:nth-child(3) {
            width: 30%; /* 调整客戶送單時間的比例 */
        }
    
        table.pending tbody td:nth-child(4),
        table.pending tbody th:nth-child(4) {
            width: 40%; /* 调整操作的比例 */
        }
    
        /* 調整"已完成訂單"表格欄位大小 */
        table.completed tbody td:nth-child(1),
        table.completed tbody th:nth-child(1) {
            width: 10%;
        }
    
        table.completed tbody td:nth-child(2),
        table.completed tbody th:nth-child(2) {
            width: 20%; /* 调整總額的比例 */
        }
    
        table.completed tbody td:nth-child(3),
        table.completed tbody th:nth-child(3) {
            width: 20%; /* 调整完成时间的比例 */
        }
    
        table.completed tbody td:nth-child(4),
        table.completed tbody th:nth-child(4) {
            width: 50%; /* 调整操作的比例 */
        }
    
        .button-group {
            display: flex;
            justify-content: center;
        }
    
        .button {
            background-color: #6dc26d;
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
            margin-right: 10px; /* 調整按鈕之間的右邊距 */
        }
    
        .complete-button {
            background-color: #3498db;
        }
    
        .delete-button {
            background-color: #e74c3c;
        }
    </style>

    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.5.1/jquery.js' />"></script>
    
    
       <script>
       function fetchData() {
           var xhr = new XMLHttpRequest();
           xhr.open("GET", "<c:url value='/findCompletedOrder'/>", true);
           xhr.send();

           xhr.onreadystatechange = function () {
               if (xhr.readyState == 4 && xhr.status == 200) {
                   var orders = JSON.parse(xhr.responseText);
                   var content = "";

                   for (var i = 0; i < orders.length; i++) {
                       content += "<tr>";
                       content += "<td>" + (orders[i][0] || "") + "</td>";
                       content += "<td>" + (orders[i][3] || "") + "</td>";
                       content += "<td>" + (orders[i][2] || "") + "</td>";
                       content += "<td>";
                       content += "<button class='button' onclick='showDetails(" + orders[i][0] + ")'>查看品項</button>";
                       content += "</td>";
                       content += "</tr>";

                       content += "<tr id='" + i + "' class='webpage2'>";
                       content += "<td style='background-color: #f4f4f4;'>品項</td><td style='background-color: #f4f4f4;'>數量</td>";
                       content += "<tr id='" + i + "' class='webpage2'>";
                       content += "<td>" + (orders[i][2] || "") + "</td>" + "<td>" + (orders[i][7] || "") + "</td>";
                       content += "</tr>";
                       content += "</tr>";
                   }

                   var tableBody = document.getElementById("tableBody");
                   tableBody.innerHTML = content;
               }
           };
       }


    function showDetails(orderNo) {
        alert(); // Add an alert for testing purposes
        const webpage2 = document.getElementById(orderNo); // Change getElementsByID to getElementById
        console.log(webpage2);
        console.log(webpage2.style);

        if (webpage2.style === null || webpage2.style.display === 'none') { // Check if the display style is 'none'
            webpage2.style.display = 'block';
        } else {
            webpage2.style.display = 'none';
        }
    }

    
    // <----------------------------------------------------------------------------------->

    window.onload = function () {
        fetchData();
        setInterval(fetchData, 8000); // 每 8 秒更新一次資料
    }
</script>
    
    
    
    
</head>

<body>
    <header>
        <h1>接單系統</h1>
    </header>

    <table class="container">
        <thead>
            <tr>
                <th>單號</th>
                <th>總額</th>
                <th>客戶送單時間</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody id="tableBody">
            <!-- 動態生成表格行 -->
        </tbody>
    </table>
</body>

</html>