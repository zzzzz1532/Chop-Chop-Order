<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel='stylesheet' href="<c:url value='/css/styles.css' />" />
    <script>
		 function deleteEmployee(ids, empno){
			if (confirm('確定要刪除商品編號為: ' + empno +' 這筆紀錄?')) {
				let url = "<c:url value='/product/ProductDelete' />" + "/" + ids;
				let input1 = document.createElement("input");
				let input2 = document.createElement("input");
				
				let container = document.forms[0];
                container.appendChild(input1);
                container.appendChild(input2);
                
                input1.type = "text";
                input1.name = "empNo";
                input1.value = empno;
                
                input2.type = "text";
                input2.name = "_method";
                input2.value = "DELETE";
                
                document.forms[0].action=url;
				document.forms[0].method="POST";
				document.forms[0].submit();
                return true;
			 } else {
                exit;
             }
		  }
	</script>
</head>
<body>
  <div class='container my-5'>
      <div class='alert alert-success'><h2 align='center'>所有商品總覽</h2>
      </div>
   <h4 align='center'>${message}&nbsp;</h4>
   <table class='table table-bordered' style='width:100%'>
        <thead>
            <tr>
            	<th>商品ID</th>
                <th>商品名稱</th>
                <th>圖片</th>
                <th>類別</th>
                <th>商品介紹</th>
                <th>份量</th>
                <th>價格(元)</th>
                <th>庫存</th>
                <th>上架狀態/時間</th>
                <th>客製標籤</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var='employee' items='${productList}' >
            
            <tr>
            	<td>${product.productId}</td>
                <td>${product.productName}</td>
                <td><img width='50' height='60' src='${product.dataUri}'></td>
                <td>${product.categoryName}</td>
                <td>${product.productDescription}</td>
                <td>${product.productPortion}</td>
                <td>${product.productPrice}</td>
                <td>${product.productStock}</td>
                <td>${product.created_at}</td>
                <td>${product.label}</td>
                <td>                                 
                  <a class='btn btn-primary btn-sm' href="<c:url value='/product/findById/${product.id}' />">修改</a>&nbsp;
                  <a class='btn btn-danger btn-sm'  onclick="return deleteProduct('${product.id}', '${product.productId}');">刪除</a>                                 
                </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>      
      <div align='center'>
  			<a class='btn btn-outline-primary' href="<c:url value='/' />" role='button'>回首頁</a>
      </div>
    </div>
    <form action="#" method='POST'>
    </form> 
</body>
</html>