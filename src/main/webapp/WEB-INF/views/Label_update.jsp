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
    <title>修改客制標籤資料</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel='stylesheet' href="<c:url value='/css/styles.css' />"  type="text/css" />
</head>
	<c:set var="labelId"  			value = "${label.labelId}" />
	<c:set var="previous_labelId"  	value = "${sessionScope.previous_label_id}" />
	<c:set var="labelName"  		value = "${label.labelName}" />
	
<body>
    <div class='container'>
    <div class='alert alert-success'><h2 align='center'>修改標籤資料</h2></div>
    <c:url var='updateUrl' value='/label/editLabel/${id}' />
    <form:form method='POST' modelAttribute="label" action="${updateUrl}">
    	
    	<div class='row mb-3'>
            <label class='col-sm-2'>標籤編號</label>
            <div class='col-sm-6'>
                <input type='text' class='form-control' name='labelId' value='${labelId}' />
                <input type='hidden' name='previous_labelId' value="${previous_labelId}" >   
                <input type='hidden' name='_method' value="PUT" >                                 
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='labelId' />
            </div>
        </div>
    	
        <div class='row mb-3'>
            <label class='col-sm-2'>標籤名稱</label>
            <div class='col-sm-6'>
                <input type='text' class='form-control' name='labelName' value="${labelName}"/>                                    
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='labelName' />
            </div>
        </div>
        <div class='row mb-3'>
            <label class='col-sm-2'>標籤價格</label>
            <div class='col-sm-6'>
                <input type='number' min="0" class='form-control' name='labelPrice' value="${labelPrice}" />
            </div>
            <div class='col-sm-4'>
            	<form:errors cssClass="error" path='labelPrice' />
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
                <a class='btn btn-outline-primary' href="<c:url value='/label' />" role='button'>離開</a>
            </div>
        </div>
        </form:form>
        <hr>
        
    </div>
</body>
</html>
