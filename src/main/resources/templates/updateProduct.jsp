<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage='true'
	pageEncoding="UTF-8"%>
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
	
	<c:set var="productId"  			      value = "${product.productId}" />
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
	<c:set var="categoryName"  		value = "${product.categoryName}" />
	<c:set var="productDescription"  	value = "${product.productDescription}" />
	<c:set var="productPrice"  		      value = "${product.productPrice}" />
	<c:set var="productPortion"  		value = "${product.productPortion}" />
	<c:set var="productStock"  		      value = "${product.productStock}" />
	<c:set var="label"  				    value = "${product.label}" />

<body>
    <div class='container my-5'>
    <div class='alert alert-success'><h2 align='center'>修改商品資料</h2></div>
     <c:url var='updateUrl' value='/employee/editEmployee/${id}' />
     <form:form method='POST' action="${updateUrl}" modelAttribute='employee'>
        
        <div class='row mb-3'>
            <label class='col-sm-2'>商品ID</label>
            <div class='col-sm-6'>
                <input type='text' class='form-control' name='productId' value="${productId}" >
                <input type='hidden' name='previous_employeeId' value="${previous_productId}" >
<%--                 <input type='hidden' name='id' value="${id}" > --%>
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
                <input type='hidden' name='_method' value="PUT" >
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productName' />
            </div>
        </div>
        
        <div class='row mb-3'>
            <label class='col-sm-2'>圖片</label>
            <div class='col-sm-4	'>
                <form:input type='file' id='inputFileToLoad' class='form-control' path='filename'
                       placeholder="請挑選圖片"  value='${product.filename}'  />
            </div>
            <div class='col-sm-2'>
                <c:choose>
                   <c:when test='${empty image}' >
<!-- 		                <img id='img' width='60' height='80'> -->
<!-- 		                <input type='hidden' id='image' name='image' > -->
                   </c:when>
                   <c:otherwise>
                        <img id='img' width='60' height='80' src='${image}' >
                        <input type='hidden' name='image' id='image' value='${image}'>
                   </c:otherwise>
                </c:choose>
            </div>    
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='filename' />
            </div>
        </div>
        
		<div class='row mb-3'>
            <label class='col-sm-2'>類別名稱</label>
            <div class='col-sm-6'>
                <form:select class="form-control" name="categoryName" value="${categoryName}">
				    <form:option value="" label="Select a category" /> <!-- 默认选项 -->
				    <form:options items="${categoryName}" itemValue="value" itemLabel="label" /> <!-- 动态选项 -->
				</form:select>
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='categoryType' />
            </div>
        </div>
        
        <div class='row mb-3'>
            <label class='col-sm-2'>商品介紹</label>
            <div class='col-sm-6'>
                <form:input type='text' class='form-control' name='productDescription' value="${productDescription}" />
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productDescription' />
            </div>
        </div>
              
        <div class='row mb-3'>
            <label class='col-sm-2'>份量</label>
            <div class='col-sm-6'>
                <form:input type='text' class='form-control' name='productPortion' value="${productPortion}"
                       placeholder="請輸入份量 (EX中杯、小杯...)"   />
            </div>
             <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productPortion' />
            </div>
        </div>
        
        <div class='row mb-3'>
            <label class='col-sm-2'>價格</label>
            <div class='col-sm-6'>
                <form:input type='number' class='form-control' name='productPrice' value="${productPrice}" />
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productPrice' />
            </div>
        </div>
        
        <div class='row mb-3'>
            <label class='col-sm-2'>庫存</label>
            <div class='col-sm-6'>
                <form:input type='number' min="0" class='form-control' name='productStock' value="${productStock}"/>
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='productStock' />
            </div>
        </div>
        
<%--<form:checkbox>：这是Spring表单标签库用于生成复选框的标签。 --%>

<!-- path="selectedCategories"：path 属性指定了与复选框关联的模型属性的名称，这是您要在表单中存储用户所选项目的地方。通常，这应该是一个集合，用于存储选中的项。 -->

<%-- items="${allCategories}"：items 属性是一个集合或数组，它包含了要显示的所有选项。在这个例子中，${allCategories} 应该是一个包含所有可选类别的集合。 --%>

<!-- itemValue="categoryId" 和 itemLabel="categoryName"：这些属性用于指定每个选项的值和标签。itemValue 属性表示模型中哪个属性的值将用作选项的值，itemLabel 属性表示模型中哪个属性的值将用作选项的显示标签。 -->
        
        <div class='row mb-3'>
            <label class='col-sm-2'>客制標籤</label>
            <div class='col-sm-6'>
                <form:checkbox name="label" items="${allCategories}" value="${label}"
                itemValue="labelId" itemLabel="labelName" />
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='label' />
            </div>
        </div>
        

        <div class='row mb-3'>
            <div class='offset-sm-3 col-sm-3 d-grid'>
                <button type='submit' class='btn btn-primary'>提交</button>
            </div>
            <div class='col-sm-3 d-grid'>  
                <a class='btn btn-outline-primary' href="<c:url value='/employee/queryProduct' />" role='button'>放棄更新	</a>
            </div>
        </div>
        </form:form>  
    </div>
</body>
</html>