<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.cardheader {
	border-bottom: 2px solid #39c0ed;
}

.productitem {
	display: flex;
	align-items: center;
	justify-content: space-between;
	cursor: pointer;
}

.row img {
	max-height: 100%;
	max-width: 100%;
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
}

.footersticky {
	/* position: -webkit-sticky; */
	/* position: sticky; */
	bottom: 0;
	z-index: 1000;
}

.ordercmp {
	color: #10da68;
	font-size: 50px;
	margin: 40px;
	text-align: center;
}

.orderinfo, h2 {
	text-align: center;
	font-weight: bold;
}
</style>
</head>
<script>
	$(document).ready(function() {
		$('.footer1').click(function() {
			window.location.href = '/main';
		});
	});
</script>

<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-lg-8 col-xl-7 mx-auto">

				<div style="margin: 10px;">
					<h2>CCO早餐資展店</h2>
				</div>
				<!-- 店頭圖片 -->
				<img src="">
				<div class="ordercmp">
					<i class="fa-regular fa-circle-check fa-bounce">訂單完成</i>
				</div>
				<div class="orderinfo">
					<div>感謝您的訂購，以下是您的單號</div>
					<div style="margin: 20px; font-size: 48px;">
						<h2>${diningLocation}：${orderNo}</h2>

					</div>
				</div>
				<div class="footer1 footersticky">
					<div class="footer1 footersticky">
						<div>返回首頁</div>

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
			
		</script>
</body>

</html>