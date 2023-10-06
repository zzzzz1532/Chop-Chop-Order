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
    <link rel="stylesheet" href="<c:url value='/css/product.css' />">
    <script src="<c:url value='/js/product.js' />"></script>
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
                <nav class="divsticky" style="margin: 10px 2px;"><i class="fa-solid fa-angle-left fa-xl"
                        style="cursor: pointer;"></i></nav>
                <img src="${ProductDetails.dataUri }" style="width: 100%;height: 350px;">
                <div class="divflex" style="justify-content: space-between;margin: 20px 0px;">
                    <div>
                        <h4>${ProductDetails.productName }</h4>
                    </div>
                    <div>NT$<span>${ProductDetails.productPrice }</span></div>
                </div>

                <div>
                    <p>${ProductDetails.productDescription }</p>
                    <p> ※ 圖片僅供參考，依門市實際提供為主</p>

                </div>
                <hr>
                <form>
                    <div id="radio">
                        <div style="margin: 10px 0px;">
                            <h4>客製化</h4>
                        </div>
                        <c:forEach var="ProductLabels" items="${ProductLabels}">
                        	<c:if test="${ProductLabels.labelPrice == 0}">
	                        <label><input type="radio" name="customized" value="${ProductLabels.labelName}" ><span
	                                class="round button">${ProductLabels.labelName}</span></label>
							 </c:if>
						</c:forEach>
                        <div style="margin: 10px 0px;">
                            <h4>加料區</h4>
                        </div>
                        <c:forEach var="ProductLabels" items="${ProductLabels}">
                        	<c:if test="${ProductLabels.labelPrice != 0}">
	                        <label>
	                            <input type="checkbox" name="toppings" value="${ProductLabels.labelName}"  data-Labelsid="${ProductLabels.id}">
	                            <span class="round button">
	                                ${ProductLabels.labelName}<span class="price">+NT$</span>
	                                <span>${ProductLabels.labelPrice}</span>
	                            </span>
	                        </label>
                        	</c:if>
						</c:forEach>
          
                    </div>
                    <hr>
                    <div style="margin: 10px 0px;">
                        <h4>備註：</h4>
                        <div id="remark">
                            <input type="text" placeholder="新增備註" style="padding: 10px;">
                        </div>
                    </div>
                    <div id="itemcount">
                        <input type="button" value="-">
                        <span>1</span>
                        <input type="button" value="+">
                    </div>

                </form>
                <div class="footer1 footersticky">
                    <div>加入購物車</div>
                    <span></span>
                </div>

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