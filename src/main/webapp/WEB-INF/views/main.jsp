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
<script>
	function generateRandomID(length) {
		const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
		let randomID = '';
		for (let i = 0; i < length; i++) {
			const randomIndex = Math.floor(Math.random() * characters.length);
			randomID += characters.charAt(randomIndex);
		}
		return randomID;
	}

	// 檢查是否已經存在編號，如果不存在則生成一個並存儲在 localStorage 中
	if (!localStorage.getItem('visitorID')) {
		const randomID = generateRandomID(8); // 在此指定所需的長度
		localStorage.setItem('visitorID', randomID);
	}
</script>
<title>CCO</title>
<style>
html, body {
	height: 100%;
}

.cardheader {
	border-bottom: 2px solid #39c0ed;
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
}

.footersticky {
	position: -webkit-sticky;
	position: sticky;
	bottom: 0;
	z-index: 1000;
}

.footersticky {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	z-index: 1000;
}

a.button-like {
	display: inline-block;
	padding: 5px 10px;
	background-color: #717172;
	color: #ffffff;
	text-decoration: none;
	border-radius: 10px;
	border: none;
	cursor: pointer;
	font-size: 10px;
}

a.button-like:hover {
	background-color: #0056b3;
}

a.button-like:active {
	background-color: #003c6b;
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

/* @media (max-width:600px) {
      .footer1 input {
        width: 90%;
      }
    } */
</style>
</head>
<script>
	$(document).ready(function() {
		$('.productitem').click(function() {
			window.location.href = 'product.html';
		});
		$('.footer1').click(function() {
			window.location.href = 'cart.html';
		});

	});
</script>

<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-lg-8 col-xl-7 mx-auto">
				<div>
					<div style="margin: 10px;">
						<h1>CCO早餐店</h1>
					</div>

					<img src="./img/點餐頁面.jpeg" style="width: 100%;">
					<div class="cardheader">

						<details open>
							<summary style="margin: 20px 0px;">公告</summary>
							<div class="answer">
								<p>結帳方式請選擇『現場支付』、點選其他方式結帳將會取消訂單、送出後請至櫃檯結帳才會出餐、感謝您！
									用餐時間一小時、每週一公休、謝謝！</p>
							</div>
						</details>

					</div>
					<div class="divsticky">

						<a class="nav-link button-like" href="#scrollspyHeading1">蛋餅</a> <a
							class="nav-link button-like" href="#scrollspyHeading2">漢堡</a> <a
							class="nav-link button-like" href="#scrollspyHeading2">漢堡</a> <a
							class="nav-link button-like" href="#scrollspyHeading2">漢堡</a> <a
							class="nav-link button-like" href="#scrollspyHeading2">漢堡</a> <a
							class="nav-link button-like" href="#scrollspyHeading2">漢堡</a> <a
							class="nav-link button-like" href="#scrollspyHeading2">漢堡</a> <a
							class="nav-link button-like" href="#scrollspyHeading2">漢堡</a>

					</div>
					<div class="cardbody">
						<h1 id="scrollspyHeading1">蛋餅</h1>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<h1 id="scrollspyHeading2">漢堡</h1>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
						<div id="productitem" class="productitem">
							<div style="display: flex; align-items: center;">
								<img src="./img/eggcake.jpg">
								<div style="margin-left: 10px;">
									<h6>原味蛋餅</h6>
									<div>
										NT$<span>30</span>
									</div>
								</div>
							</div>
							<span>1</span>
						</div>
						<hr>
					</div>
					<div class="footer1 footersticky">
						<div>查看購物車</div>
						<span>NT$100</span>
					</div>
				</div>

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
	<script>
		// 獲取存儲在localStorage中的遊客登入編號
		const visitorID = localStorage.getItem('visitorID');

		// 創建購物車數據，這只是一個示例
		const shoppingCart = [ {
			product : 'Product 1',
			quantity : 2,
			price : 10.99
		}, {
			product : 'Product 2',
			quantity : 1,
			price : 5.99
		},
		// 其他購物車項目
		];

		// 創建包含遊客登入編號和購物車數據的物件
		const dataToSend = {
			visitorID : visitorID,
			shoppingCart : shoppingCart
		};

		// 使用Ajax將數據發送到後端
		$.ajax({
			url : 'your_backend_url', // 替換為後端接收數據的URL
			method : 'POST', // 或其他HTTP方法，視需求而定
			data : JSON.stringify(dataToSend), // 將物件轉換為JSON字符串
			contentType : 'application/json', // 設置請求標頭以指定JSON數據
			success : function(response) {
				// 在成功回調中處理後端的回應
				console.log('後端回應：', response);
			},
			error : function(error) {
				console.error('發生錯誤：', error);
			}
		});
	</script>

</body>

</html>
