<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage='true'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改類別資料</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel='stylesheet' href="<c:url value='/css/styles.css' />"  type="text/css" />
</head>
	<c:set var="categoryId"  			value = "${category.categoryId}" />
	<c:set var="previous_categoryId"  	value = "${sessionScope.previous_category_id}" />
	<c:set var="categoryName"  		value = "${category.categoryName}" />
	
<body>
    <div class='container'>
    <div class='alert alert-success'><h2 align='center'>修改類別資料</h2></div>
    <c:url var='updateUrl' value='/category/editCategory/${id}' />
    <form:form method='POST' modelAttribute="category" action="${updateUrl}">
    	
    	<div class='row mb-3'>
            <label class='col-sm-2'>類別編號</label>
            <div class='col-sm-6'>
                <input type='text' class='form-control' name='categoryId' value='${categoryId}' />
                <input type='hidden' name='previous_categoryId' value="${previous_categoryId}" >   
                <input type='hidden' name='_method' value="PUT" >                                 
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='categoryId' />
            </div>
        </div>
    	
        <div class='row mb-3'>
            <label class='col-sm-2'>類別名稱</label>
            <div class='col-sm-6'>
                <input type='text' class='form-control' name='categoryName' value="${categoryName}"/>                                    
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='categoryName' />
            </div>
        </div>

        <c:if test="${not empty exception}">
	        ${exception}
        </c:if>
        
        <div class='row mb-3'>
            <div class='offset-sm-3 col-sm-3 d-grid'>
                <button type='submit' class='btn btn-primary'>確認</button>
            </div>
            <div class='col-sm-3 d-grid'>
                <a class='btn btn-outline-primary' href="<c:url value='/category' />" role='button'>離開</a>
            </div>
        </div>
        </form:form>
        <hr>
        
    </div>
</body>
</html>
