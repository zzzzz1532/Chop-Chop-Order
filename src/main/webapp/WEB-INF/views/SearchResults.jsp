<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
		.table{
			width: 90%;
			text-align: center;
			margin: 0 auto;
		}
		.container-fluid{
		    width: 91%;
		}
	</style>
</head>
<body>
	<div>	
		<div class='container-fluid'>
			<label class="form-label" >搜尋結果：</label> 
		</div>
		<div>
			<table class="table table-success table-striped">
			    <thead>
			        <tr>
			            <th>商品編號</th>
			            <th>商品名稱</th>
			            <th>圖片</th>
			            <th>類別</th>
			            <th>商品介紹</th>
			            <th>份量</th>
			            <th>價格(元)</th>
			            <th>庫存</th>
			            <th>上架時間</th>
			            <th>客製標籤</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach var="product" items="${searchResults}">
			          <tr>
			              <td>${product.productId}</td>
			              <td>${product.productName}</td>
			              <td><img  width='150' height='100' src='${product.dataUri}'></td>
			              <td>${product.category.categoryName}</td>
			              <td>${product.productDescription}</td>
			              <td>${product.productPortion}</td>
			              <td>${product.productPrice}</td>
			              <td>${product.productStock}</td>
			              <td>${product.created_at}</td>
			              <td>
			                  <c:choose>
			                      <c:when test="${empty product.labels}">無</c:when>
			                      <c:otherwise>
			                          <c:forEach var="label" items="${product.labels}">
			                              ${label.labelName} (+${label.labelPrice}元)<br>
			                          </c:forEach>
			                      </c:otherwise>
			                  </c:choose>
			              </td>
			          </tr>
			      </c:forEach>
			    </tbody>
			</table>	
		</div> 
	    <p>
	    <div align='center'>
	        <a class='btn btn-outline-primary' href="<c:url value='/product' />" role='button'>返回</a>
	    </div>
   	</div>	
</body>
</html>
