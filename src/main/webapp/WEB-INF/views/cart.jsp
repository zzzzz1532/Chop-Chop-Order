<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/cart.css' />">
    <script src="<c:url value='/js/cart.js' />"></script>
    <title>CCO</title>
    <style>

    </style>
</head>
<script>



</script>

<body>

    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-lg-8 col-xl-7 mx-auto">
            	<div class="nocartdiv">
                    <i class="fa-solid fa-cart-shopping" style="font-size: 100px;"></i>
                    <div class="nocarttext">您的購物車中沒有任何餐點</div>
                    <div class="nocarttext viewmeun">瀏覽餐點</div>
                </div>
                <div id="allcartpage">
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
	                    <div class="neworder">
	                        <span>新增餐點</span>
	                    </div>
	                </div>
	                <div id="cartContainer">
	
	                </div>
	
	                <div style="margin: 20px 0;">
	                    <h4>訂單備註：</h4>
	                    <div>
	                        <input type="text" placeholder="新增備註" class="remarkinput">
	                    </div>
	
	                </div>
	                <hr>
	                <div class="takeout" style="margin: 20px 0;">
	                    <h4>用餐方式*</h4>
	                    <div>
	                        <label>
	                            <input type="radio" name="takeout" value="外帶" required>
	                            <span class="round button">外帶</span>
	                        </label>
	                        <label>
	                            <input type="radio" name="takeout" value="內用" required>
	                            <span class="round button">內用</span>
	                        </label>
	
	                    </div>
	                </div>
	                <hr>
	                <h4>付款方式*</h4>
	                <div id="payradio">
	                    <label class="payradioflex">
	                        <input type="radio" name="label" value="線上刷卡" required>
	
	                        <div>
	                            <span class="round button">線上刷卡</span>
	                            <p>接受國內信用卡與簽帳金融卡</p>
	                        </div>
	
	                    </label>
	
<!-- 	                    <label class="payradioflex"> -->
<!-- 	                        <input type="radio" name="label" value="GooglePay" required> -->
<!-- 	                        <div> -->
<!-- 	                            <span class="round button">Google Pay</span> -->
<!-- 	                            <p>將於送出訂單後才會進行扣款</p> -->
<!-- 	                        </div> -->
	
<!-- 	                    </label> -->
	                    <label class="payradioflex">
	                        <input type="radio" name="label" value="現場付款" required>
	                        <div>
	                            <span class="round button">現場付款</span>
	                            <p>送出訂單後，請先至櫃台付款</p>
	                        </div>
	
	                    </label>
	
	                </div>
<!-- 	                <div class="payinfo"> -->
<!-- 	                    <h4>付款人資訊*</h4> -->
<!-- 	                    <div>刷卡通知將發送到此信箱</div> -->
<!-- 	                    <div> -->
<!-- 	                        <input type="text" placeholder="Email" class="remarkinput"> -->
<!-- 	                    </div> -->
	
<!-- 	                </div> -->
	                <div id="allPrice" class=" divflex">
	                    <h4>總計金額</h4>
	                    <h4><span>NT$70</span></h4>
	                </div>
	
	                <div class="footer1 footersticky">
	                    <div>送出訂單</div>
	                    <span>NT$100</span>
	                </div>
				</div>
            </div>
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/ed6fd4cc97.js" crossorigin="anonymous"></script>
</body>

</html>