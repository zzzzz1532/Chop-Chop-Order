<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage='true'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Categories</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel='stylesheet' href="<c:url value='/css/styles.css' />" />
    <script>
		 function deleteCategory(ids, empno){
			if (confirm('確定要刪除類別編號為: ' + empno +' 這筆紀錄?')) {
				let url = "<c:url value='/category/CategoryDelete' />" + "/" + ids;
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
      <div class='alert alert-success'>
      	<h2 align='center'>商品類別列表</h2>
      </div>
      <div>
      	<a class='btn btn-success btn-sm' href="<c:url value='/category/insertCategory' />">新增商品類別</a>
      </div>
   <h4 align='center'>${message}&nbsp;</h4>
   <table class='table table-striped table-hover align-middle' style='width:100%'>
        <thead>
            <tr>
            	<th>類別編號</th>
                <th>類別名稱</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var='category' items='${categoryList}' >          
            <tr>
            	<td>${category.categoryId}</td>
                <td>${category.categoryName}</td>
                <td>                                 
                  <a class='btn btn-warning btn-sm' href="<c:url value='/category/findById/${category.id}' />">修改</a>&nbsp;
                  <a class='btn btn-danger btn-sm'  onclick="return deleteCategory('${category.id}','${category.categoryId}');">刪除</a>                                 
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