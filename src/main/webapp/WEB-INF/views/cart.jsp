<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>CCO</title>
<style>
html, body {
	height: 100%;
}

.productitem {
	display: flex;
	align-items: center;
	justify-content: space-between;
	cursor: pointer;
}

#productitem img {
	max-height: 100%;
	max-width: 100%;
}

.divsticky {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	background-color: white;
	padding: 10px;
	font-size: 20px;
	z-index: 1000;
	margin: 10px 2px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.divsticky li {
	margin-right: auto;
}

.divsticky div {
	flex: 1;
	text-align: center;
}

.footer1 {
	left: 0;
	bottom: 0;
	width: 100%;
	height: 50px;
	margin: 5px 0;
	padding: 10px;
	color: white;
	border: 0;
	background-color: #1d1e20;
	color: #fff;
	border-radius: 10px;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
}

.footer1 div {
	flex: 1;
	text-align: center;
}

.footer1 span {
	margin-left: auto;
}

.divflex {
	display: flex;
	justify-content: space-between;
}

.footersticky {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	z-index: 1000;
}

#remark input {
	width: 100%;
	height: 50px;
	margin: 5px 0;
}

.payradioflex {
	display: flex;
	width: 100%;
	padding: 5px;
}

.payradioflex span, div, p {
	margin: 5px;
}

.payradioflex p {
	font-size: 14px;
	color: #747373;
}

h2, h4 {
	font-weight: bold;
}

#pdtcount {
	display: flex;
	align-items: center;
	width: 20%;
}

#pdtcount input {
	width: 30px;
	height: 30px;
	margin: 10px;
	border: 0px;
	border-radius: 50%;
	background-color: #e2dfdf;
}

#pdtcount input[value="-"]:hover {
	border: 5px;
	background-color: #bbb;
}

#pdtcount input[value="+"] {
	background-color: #bbb;
}

#pdtcount input[value="+"]:hover {
	background-color: #e2dfdf;
}

.cartitemspace {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.cartiteminfo {
	color: #747373;
	font-size: 14px;
}

.cartitemRevise {
	font-size: 14px;
	color: blue;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="orderNumber">
		<!-- 这里将显示订单号 -->
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-lg-8 col-xl-7 mx-auto">
				<nav class="divsticky">
					<i class="fa-solid fa-angle-left fa-xl" style="cursor: pointer;"></i>
					<div>您的購物車</div>
				</nav>
				<div style="text-align: center;">
					<h2>CCO早餐資展店</h2>
				</div>
				<div class="divflex">
					<div>
						<h4>訂單內容</h4>
					</div>
					<div>
						<span>新增餐點</span>
					</div>
				</div>
				<div style="display: flex; width: 100%;">
					<div id="pdtcount">
						<input type="button" value="-"> <span>1</span> <input
							type="button" value="+">
					</div>
					<div class="cartitemspace" style="width: 60%;">
						<div>原味蛋餅</div>
						<div class="cartiteminfo">不醬</div>
						<div class="cartitemRevise">修改</div>
					</div>
					<div class="cartitemspace">
						<div>NT$80</div>
						<div>
							<i class="fa-solid fa-trash-can"></i>
						</div>
					</div>
				</div>
				<hr>
				<div>
					<h4>訂單備註：</h4>
					<div id="remark">
						<input type="text" placeholder="新增備註" style="padding: 10px;">
					</div>

				</div>
				<hr>
				<h4>付款方式*</h4>
				<div id="payradio">
					<label class="payradioflex"> <input type="radio"
						name="label" value="線上刷卡">

						<div>
							<span class="round button">線上刷卡</span>
							<p>接受國內信用卡與簽帳金融卡</p>
						</div>

					</label> <label class="payradioflex"> <input type="radio"
						name="label" value="GooglePay">
						<div>
							<span class="round button">Google Pay</span>
							<p>將於送出訂單後才會進行扣款</p>
						</div>

					</label> <label class="payradioflex"> <input type="radio"
						name="label" value="現場付款">
						<div>
							<span class="round button">現場付款</span>
							<p>送出訂單後，請先至櫃台付款</p>
						</div>

					</label>

				</div>
				<div class="footer1 footersticky" id="submitOrderButton">
					<div>送出訂單</div>
					<span>NT$100</span>
				</div>

			</div>
		</div>

	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/ed6fd4cc97.js"
		crossorigin="anonymous"></script>



	<script>
		var cartData = [ {
			"productId" : 002,
			"diningLocation" : "內用",
			"productName" : "薯餅蛋餅",
			"categoryName" : "蛋餅",
			"foodQuantity" : 2,
			"singlePrice" : 160,
			"labelId" : 001,
			"labelName" : "加起司",
			"foodNote" : "不要蔥",
			"orderNote" : "多加醬"
		}, {

			"diningLocation" : "外帶",
			"productId" : 001,
			"productName" : "鮮奶茶",
			"categoryName" : "飲料",
			"foodQuantity" : 1,
			"singlePrice" : 90,
			"labelId" : 004,
			"labelName" : "去冰",
			"foodNote" : "加糖",
			"orderNote" : "少冰"
		} ]

		// 將購物車數據轉換為 JSON 格式
		var cartDataJSON = JSON.stringify(cartData);

		// 將購物車數據存儲在 Local Storage 中
		localStorage.setItem('pendingOrder', cartDataJSON);

		console.log('購物車數據已存儲在 Local Storage 中');
	</script>
	<script>
		// 定義一個函式，用於處理送出訂單的 AJAX 呼叫
		function submitOrder() {
			// 從 Local Storage 中擷取資料
			var data = localStorage.getItem('pendingOrder');
			var parsedData = JSON.parse(data);

			// 初始化OrderPrice為0
			var totalOrderPrice = 0;

			// 遍歷每個購物車項目
			parsedData
					.forEach(function(item) {
						// 使用 AJAX 或其他方式查詢對應的product和label資料表，獲取productPrice和labelPrice
						var productPrice = $.ajax({
							url : '/{id}/productprice', // 替換為實際的後端端點
							method : 'GET',
							data : {
								productId : item.productId
							}, // 傳遞相關的產品ID或其他必要的參數
							success : function(productResponse) {
								var productPrice = productResponse.price; // 假設響應中包含產品價格
								// 在這裡使用 productPrice 做進一步的處理
							},
							error : function(error) {
								console.error('Error fetching product price:',
										error);
								// 處理錯誤
							}
						});
						;
						var labelPrice = $.ajax({
							url : '/{id}/labelprice', // 替換為實際的後端端點
							method : 'GET',
							data : {
								labelId : item.labelId
							}, // 傳遞相關的產品ID或其他必要的參數
							success : function(labelResponse) {
								var labelPrice = labelResponse.price; // 假設響應中包含產品價格
								// 在這裡使用 labelPrice 做進一步的處理
							},
							error : function(error) {
								console.error('Error fetching label price:',
										error);
								// 處理錯誤
							}
						});
						;
						;

						// 計算單個項目的價格
						var itemPrice = (productPrice + labelPrice)
								* item.foodQuantity;

						// 將單個項目的價格加到OrderPrice中
						totalOrderPrice += itemPrice;
					});

			// 將購物車數據中的OrderPrice更新為計算後的值
			parsedData.forEach(function(item) {
				item.OrderPrice = totalOrderPrice;
			});

			// 使用 AJAX 將資料發送到後端 Controller
			$.ajax({
				url : '/cart', // 替換為後端 Controller 的 URL 端點
				method : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(parsedData), // 將資料轉換為 JSON 格式
				success : function(response) {
					console.log(response);
					// 在此處處理後端的回應
					window.location.href = '/final?orderNumbers='
							+ response.join(',');
				},
				error : function(error) {
					console.error('Error:', error);
					// 處理錯誤
				}
			});
		}

		// 監聽送出訂單按鈕的點擊事件
		document.getElementById('submitOrderButton').addEventListener('click',
				function() {
					// 呼叫 submitOrder 函式來觸發 AJAX 呼叫
					submitOrder();
				});
	</script>


</body>

</html>