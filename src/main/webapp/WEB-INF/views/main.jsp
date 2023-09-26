<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List"%>
<%@ page isELIgnored="false"%>

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
	padding: 15px;
	font-size: 15px;
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
	padding: 15px 25px;
	background-color: #717172;
	color: #ffffff;
	text-decoration: none;
	border-radius: 10px;
	border: none;
	cursor: pointer;
	font-size: 12px;
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
			window.location.href = '/product';
		});
		$('.footer1').click(function() {
			window.location.href = '/cart';
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
					<!-- 模态框内容 -->
					<div id="orderChoiceModal" class="modal">
						<div class="modal-content">
							<h2>請選擇內用或外帶</h2>
							<button id="dineInButton">内用</button>
							<button id="takeOutButton">外带</button>
						</div>
					</div>
					<div class="divsticky">
						<c:set var="previousCategory" value="" />
						<c:forEach items="${products}" var="product" varStatus="loop">
							<c:if
								test="${!product.category.categoryName.equals(previousCategory)}">
								<a class="nav-link button-like"
									href="#scrollspyHeading${loop.index + 1}">
									${product.category.categoryName} </a>
								<c:set var="previousCategory"
									value="${product.category.categoryName}" />
							</c:if>
						</c:forEach>
					</div>
					<div class="cardbody">
						<c:set var="previousCategory" value="" />
						<c:forEach items="${products}" var="product">
							<c:if
								test="${!product.category.categoryName.equals(previousCategory)}">
								<h1 id="scrollspyHeading${product.id}">${product.category.categoryName}</h1>
								<c:set var="previousCategory"
									value="${product.category.categoryName}" />
							</c:if>
							<div class="productitem">
								<div style="display: flex; align-items: center;">
									<img src="${product.imageDataUrl}" alt="${product.productName}"
										style="max-width: 100px; max-height: 100px;">
									<div style="margin-left: 10px;">
										<h6>${product.productName}</h6>
										<div>
											NT$<span>${product.productPrice}</span>
										</div>
									</div>
								</div>
								<span>1</span>
							</div>
							<hr>
						</c:forEach>
					</div>
					<div class="footer1 footersticky">
						<div>查看購物車</div>
						<span>NT$100</span>
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
    // 頁面加載完畢後顯示模態框
    $(document).ready(function() {
        $('#orderChoiceModal').show();
    });

    // 處理內用按鈕點擊事件
    dineInButton.addEventListener('click', () => {
        // 創建新的 pendingorder
        var pendingOrder = {
            diningLocation: '内用',
            items: [],
            orderPrice: 0
        };

        // 將新的 pendingorder 存儲到 Local Storage 中
        localStorage.setItem('pendingOrder', JSON.stringify(pendingOrder));

        // 關閉彈出窗口
        orderChoiceModal.style.display = 'none';
    });

    // 處理外帶按鈕點擊事件
    takeOutButton.addEventListener('click', () => {
        // 創建新的 pendingorder
        var pendingOrder = {
            diningLocation: '外帶',
            items: [],
            orderPrice: 0
        };

        // 將新的 pendingorder 存儲到 Local Storage 中
        localStorage.setItem('pendingOrder', JSON.stringify(pendingOrder));

        // 關閉彈出窗口
        orderChoiceModal.style.display = 'none';
    });
</script>

</body>

</html>
