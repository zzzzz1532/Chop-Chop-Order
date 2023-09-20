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
<script>
	$(document).ready(function() {
		$('.fa-angle-left').click(function() {
			window.location.href = 'main.html';
		});
		$('.footer1').click(function() {
			window.location.href = 'finish.html';
		});

	});
</script>

<body>

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
				<div class="footer1 footersticky">
					<div>送出訂單</div>
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
	<script src="https://kit.fontawesome.com/ed6fd4cc97.js"
		crossorigin="anonymous"></script>
</body>

</html>