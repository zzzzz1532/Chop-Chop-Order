<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<link rel='stylesheet' href="<c:url value='/css/back-end.css' />" />
	<script type="text/javascript" src="/js/back-end.js"></script>
	
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<link rel='stylesheet' href="<c:url value='/css/back-end.css' />" />
	<script type="text/javascript" src="/js/back-end.js"></script>
    <title>接單系統</title>
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
            margin-top: 20px;
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
            margin-right: 10px;
        }

        .complete-button {
            background-color: #3498db;
        }

        .delete-button {
            background-color: #e74c3c;
        }

        /* 調整"待處理訂單"表格欄位大小 */
        table.pending tbody td:nth-child(1),
        table.pending tbody th:nth-child(1) {
            width: 10%;
        }

        table.pending tbody td:nth-child(2),
        table.pending tbody th:nth-child(2) {
            width: 20%;
        }

        table.pending tbody td:nth-child(3),
        table.pending tbody th:nth-child(3) {
            width: 30%;
        }

        table.pending tbody td:nth-child(4),
        table.pending tbody th:nth-child(4) {
            width: 40%;
        }

        /* 調整"已完成訂單"表格欄位大小 */
        table.completed tbody td:nth-child(1),
        table.completed tbody th:nth-child(1) {
            width: 10%;
        }

        table.completed tbody td:nth-child(2),
        table.completed tbody th:nth-child(2) {
            width: 20%;
        }

        table.completed tbody td:nth-child(3),
        table.completed tbody th:nth-child(3) {
            width: 20%;
        }

        table.completed tbody td:nth-child(4),
        table.completed tbody th:nth-child(4) {
            width: 50%;
        }

        .details-row td {
            background-color: #f4f4f4;
            padding: 10px;
            text-align: left;
        }
    </style>

    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.5.1/jquery.js' />"></script>

    <script>
        function fetchData() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "<c:url value='/findorder'/>", true);
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
                        content += "<button class='button complete-button' onclick='completed(" + orders[i][0] + ")'>完成</button>";
                        content += "<button class='button delete-button' onclick='deleteOrder(" + orders[i][0] + ")'>刪除</button>";
                        content += "</td>";
                        content += "</tr>";

                        // Add an empty row for details, you can toggle its display later
                        content += "<tr id='details_" + orders[i][0] + "' class='details-row' style='display: none;'>";
                        content += "<td colspan='4'></td>"; // Adjusted colspan to 4
                        content += "</tr>";
                    }

                    var tableBody = document.getElementById("tableBody");
                    tableBody.innerHTML = content;
                }
            };
        }

        function showDetails(orderNo) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "<c:url value='/findorderbyID/'/>" + orderNo, true);
            xhr.send();

            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var details = JSON.parse(xhr.responseText);
                    var detailsRow = document.getElementById('details_' + orderNo);

                    // Clear previous content
                    detailsRow.innerHTML = "";

                    // Assuming details is an array of details for the given orderNo
                    var content =
                        "<tr>" +
                        "<td colspan='4' style='background-color: #f4f4f4;'>品名</td>" +
                        "<td colspan='4' style='background-color: #f4f4f4;'>數量</td>" +
                        "<td colspan='4' style='background-color: #f4f4f4;'>foodNote</td>" +
                        "</tr>";

                    for (var i = 0; i < details.length; i++) {
                        content += "<tr>";
                        content += "<td colspan='4'>" + (details[i].productName || "") + "</td>";
                        content += "<td colspan='4'>" + (details[i].foodQuantity || "") + "</td>";
                        content += "<td colspan='4'>" + (details[i].foodNote || "") + "</td>";
                        content += "</tr>";
                    }

                    // Update the content of detailsRow
                    detailsRow.innerHTML = content;

                    // Toggle the display
                    if (detailsRow.style.display === 'none') {
                        detailsRow.style.display = 'table-row'; // Use 'table-row' for proper display
                    } else {
                        detailsRow.style.display = 'none';
                    }
                }
            };
        }
        
        function completed(orderNo) {
            var confirmComplete = confirm("此訂單是否完成");

            if (confirmComplete) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "<c:url value='/copy-from-pending'/>" + "/" + orderNo, true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4) {
                        if (xhr.status == 200) {
                            console.log("Order completed successfully");
                            // You might want to update the UI or take additional actions here
                            fetchData();
                        } else {
                            console.error("Failed to complete order");
                            // Regardless of success or failure, you might want to refresh the data
                            fetchData();
                        }
                    }
                };

                xhr.send();
            } else {
                fetchData();
            }
        }


        function deleteOrder(orderNo) {
            alert();
            if (confirm('確定要刪除訂單: ' + orderNo + ' 這筆紀錄?')) {
                var url = "<c:url value='/orderIDdelete' />" + "/" + orderNo;

                var xhr = new XMLHttpRequest();
                xhr.open("POST", url, true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4) {
                        if (xhr.status == 200) {
                            console.log("Order deleted successfully");
                            // You might want to update the UI or take additional actions here

                            // Perform a synchronous redirect after the deletion is successful
                            window.location.href = "/showOrderSystem";
                        } else {
                            console.error("Failed to delete order");
                            // Regardless of success or failure, you might want to refresh the data
                            fetchData();
                        }
                    }
                };

                xhr.send("orderNo=" + orderNo + "&_method=DELETE");
            } else {
                fetchData();
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
        <div class="back-end-header">
            <div class="back-end-openButton"></div>
            <h1 style=" margin: 0;">店家基本資料</h1>
            <ul class="back-end-menuBox" style=" padding-left: 0 ;">
                <div class="back-end-menu-top">
                    <div class="back-end-closeButton"></div>
                </div>
                <li>
                    <a href="/BusinessInformation">基本資料</a>
                </li>
                <li>
                    <a class="click1" href="#">商品管理
                        <img id="click1-buutton" class="click1-buutton0" src="./img/icon/angle-double-small-down.png" alt="" style=" float: right;
                        width: 20px;
                        height: 20px;
                        margin: 6% 5% 0 0;">
                    </a>
                    <ul style="padding: 0;">
                        <li><a href="/Product_all">商品總覽</a></li>
                        <li><a href="/Category_all">商品類別管理</a></li>
                        <li><a href="/Label_all">商品客製標籤管理</a></li>
                    </ul>
                </li>
                <li>
                    <a class="click2" href="#">接單系統
                        <img id="click2-buutton" class="click2-buutton0" src="./img/icon/angle-double-small-down.png" alt=""style=" float: right;
                        width: 20px;
                        height: 20px;
                        margin: 5% 5% 0 0;">
                    </a>
                    <ul style="padding: 0;">
                        <li><a href="/showOrderSystem">待完成訂單</a></li>
                        <li><a href="/kitchenDisplaySystem">廚房刊版系統</a></li>
                        <li><a href="/showcompletedsystem">歷史訂單</a></li>
                    </ul>
                </li>
                <li>
                    <a class="click3" href="/chart">報表分析</a>
                </li>
                <li>
                    <a class="click3" href="/board">系統公告</a>
                </li>
            </ul>
        </div>
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
