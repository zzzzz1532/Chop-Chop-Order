<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href="<c:url value='/css/styles.css' />"  type="text/css" />
</head>
<body>
<div align='center'>
	<h2>商品管理總覽</h2>
	<h3>使用Spring Data JPA技術</h3>
    <hr>
    <a href="<c:url value='/all' />" role='buttom'>商品資料列表</a><p>
    <a href="<c:url value='/insert' />" role='buttom'>新增產品資料</a><p>
</div>
</body>
</html>