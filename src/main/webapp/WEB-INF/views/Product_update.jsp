<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage='true' pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>修改商品資料</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<link rel='stylesheet' href="<c:url value='/css/styles.css' />"type="text/css" />
	<script>
	   let inputFileToLoad = null;
	   let image = null;
	   let img = null;
	   window.addEventListener('load', function(){
	     inputFileToLoad = document.getElementById("inputFileToLoad");
	     image = document.getElementById("image");
	     img = document.getElementById("img");
	     inputFileToLoad.addEventListener('change', loadImageFileAsURL);
	   }
	   );
	   function loadImageFileAsURL(){
	      let filesSelected = inputFileToLoad.files;
	      if (filesSelected.length > 0)
	      {
	          let fileReader = new FileReader();    
	          let fileToLoad = filesSelected[0];            
	          fileReader.onload = function(fileLoadedEvent) 
	          {
	              image.value = fileLoadedEvent.target.result;
	              console.log("image.value=" + image.value );
	              img.src = fileLoadedEvent.target.result;
	          };
	          fileReader.readAsDataURL(fileToLoad);
	      }
	 }
	</script>
	<style type="text/css">
		span.error {
			color: red;
			display: inline-block;
			font-size: 11pt;
		}		
		.fieldset-auto-width {
			display: inline-block;
		}
	</style>
</head>

<c:set var="id"  					    value = "${product.id}" />
<c:set var="productId"  			value = "${product.productId}" />
<c:set var="previous_productId"  	value = "${sessionScope.previous_product_id}" />
<c:set var="productName"  			value = "${product.productName}" />
<c:choose>
   <c:when test='${ empty requestScope.image}'>
		<c:set var="image"  value = "${product.dataUri}" />
   </c:when>
   <c:otherwise>
   		<c:set var="image"  value = "${requestScope.image}" />
   </c:otherwise>
</c:choose>
<c:set var="category"  		value = "${product.category}" />
<c:set var="productDescription"  	value = "${product.productDescription}" />
<c:set var="productPrice"  		    value = "${product.productPrice}" />
<c:set var="productPortion"  		value = "${product.productPortion}" />
<c:set var="productStock"  		    value = "${product.productStock}" />
<c:set var="labels"  		    value = "${product.labels}" />

<body>
    <div class='container my-5'>
    <div class='alert alert-success'><h2 align='center'>修改商品資料</h2></div>
     <c:url var='updateUrl' value='/product/editProduct/${id}'/>
     <form:form method='POST' action="${updateUrl}" modelAttribute='product'>    
        <div class='row mb-3'>
            <label class='col-sm-2'>商品編號</label>
            <div class='col-sm-6'>
                <input type='text' class='form-control' name='productId' value="${productId}" >
                <input type='hidden' name='previous_productId' value="${previous_productId}" >
                <input type='hidden' name='_method' value="PUT" >
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productId' />
            </div>
        </div>
        
        <div class='row mb-3'>
            <label class='col-sm-2'>商品名稱</label>
            <div class='col-sm-6'>
                <input type='text' class='form-control' name='productName' value="${productName}" >
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productName' />
            </div>
        </div>
        
        <div class='row mb-3'>
            <label class='col-sm-2'>圖片</label>
            <div class='col-sm-4	'>
                <form:input type='file' id='inputFileToLoad' class='form-control' path='fileName'
                       placeholder="請挑選圖片"  value='${product.fileName}'  />
            </div>
            <div class='col-sm-2'>
                <c:choose>
                   <c:when test='${empty image}' >
<!-- 		                <img id='img' width='60' height='80'> -->
<!-- 		                <input type='hidden' id='image' name='image' > -->
                   </c:when>
                   <c:otherwise>
                        <img id='img' width='200' height='150' src='${image}' >
                        <input type='hidden' name='image' id='image' value='${image}'>
                   </c:otherwise>
                </c:choose>
            </div>    
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='fileName' />
            </div>
        </div>
        
		<div class='row mb-3'>
            <label class='col-sm-2'>類別名稱</label>
		    <div class="col-sm-6">
				<select class="form-select" name="category">
				    <option value="none">Select a category</option>
				    <c:forEach var="category" items="${allcategories}">
				        <option value="${category.id}" ${category.id == selectedCategory.id ? 'selected' : ''}>
				            ${category.categoryName}
				        </option>
				    </c:forEach>
				</select>
		    </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='category' />
            </div>
        </div>
        
        <div class='row mb-3'>
            <label class='col-sm-2'>商品介紹</label>
            <div class='col-sm-6'>
				<textarea class='form-control' name='productDescription'>${productDescription}</textarea>
				<input type='hidden' name='_method' value="PUT" />
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productDescription' />
            </div>
        </div>
              
        <div class='row mb-3'>
            <label class='col-sm-2'>份量</label>
            <div class='col-sm-6'>
                <input type='text' class='form-control' name='productPortion' value="${productPortion}"/>
            </div>
             <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productPortion' />
            </div>
        </div>
        
        <div class='row mb-3'>
            <label class='col-sm-2'>價格</label>
            <div class='col-sm-6'>
                <input type='number' min="0" class='form-control' name='productPrice' value="${productPrice}" />
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productPrice' />
            </div>
        </div>
        
        <div class='row mb-3'>
            <label class='col-sm-2'>庫存</label>
            <div class='col-sm-6'>
                <input type='number' min="0" class='form-control' name='productStock' value="${productStock}"/>
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productStock' />
            </div>
        </div>

		<div class='row mb-3'>
		    <label class='col-sm-2'>客製標籤</label>
		    <div class='col-sm-6'>
		        <c:forEach var="label" items="${alllabels}">
		            <label>
		                <input type="checkbox" name="labels" value="${label.id}" 
		                    <c:if test="${selectedLabels.contains(label)}">checked</c:if>> ${label.labelName}
		            </label><br>
		        </c:forEach>
		    </div>  
		    <div class='col-sm-4'>
		        <form:errors cssClass="error" path="labels"  />
		    </div>
		</div>
				
		<div class='row mb-3'>
	        <div class='offset-sm-3 col-sm-3 d-grid'>
	            <button type='submit' class='btn btn-primary'>確認</button>
	        </div>
	        <div class='col-sm-3 d-grid'>  
	            <a class='btn btn-outline-primary' href="<c:url value='/product' />" role='button'>離開</a>
	        </div>
	    </div>
		</form:form>
	</div>
    <hr> 
</body>
</html>