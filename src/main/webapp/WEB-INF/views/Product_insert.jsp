<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
	<title>新增產品資料</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<link rel='stylesheet' href="<c:url value='/css/styles.css' />"type="text/css" />
	<script>
		let inputFileToLoad = null;
		let image = null;
		let img = null;
		window.addEventListener('load', function() {
			inputFileToLoad = document.getElementById("inputFileToLoad");
			image = document.getElementById("image");
			img = document.getElementById("img");
			inputFileToLoad.addEventListener('change', loadImageFileAsURL);
		});
		function loadImageFileAsURL() {
			let filesSelected = inputFileToLoad.files;
			if (filesSelected.length > 0) {
				let fileReader = new FileReader();
				let fileToLoad = filesSelected[0];
				fileReader.onload = function(fileLoadedEvent) {
					image.value = fileLoadedEvent.target.result;
					console.log("image.value=" + image.value);
					img.src = fileLoadedEvent.target.result;
				};
				fileReader.readAsDataURL(fileToLoad);
			}
		}
	</script>
</head>
<body>
	<div class="container-xxl">
		<div class='alert alert-success'><h2 align='center'>新增產品資料</h2></div>
		<c:url var='insertUrl' value='/product/insertProduct' />
		<form:form method='POST' modelAttribute="product" action="${insertUrl}">
			<div class='row mb-3'>
				<label class='col-sm-2'>商品編號</label>
				<div class='col-sm-6'>
					<form:input type='text' class='form-control' path='productId'
						placeholder="請輸入商品編號" /> 
				</div>
				<div class='col-sm-4'>
					<form:errors cssClass="error" path='productId' />
				</div>
			</div>

			<div class='row mb-3'>
				<label class='col-sm-2'>商品名稱</label>
				<div class='col-sm-6'>
					<form:input type='text' class='form-control' path='productName'
						placeholder="請輸入商品名稱" />
				</div>
				<div class='col-sm-4'>
					<form:errors cssClass="error" path='productName' />
				</div>
			</div>

			<div class='row mb-3'>
				<label class='col-sm-2'>圖片</label>
				<div class='col-sm-4	'>
					<form:input type='file' id='inputFileToLoad' class='form-control'
						path='fileName' placeholder="請挑選圖片" value='${product.fileName}' />
				</div>
				<div class='col-sm-2'>
					<c:choose>
						<c:when test='${empty image}'>
							<img id='img' width='200' height='150'>
							<input type='hidden' id='image' name='image'>
						</c:when>
						<c:otherwise>
							<img id='img' width='200' height='150' src='${image}'>
							<input type='hidden' name='image' value='${image}'>
						</c:otherwise>
					</c:choose>
				</div>
				<div class='col-sm-4'>
					<form:errors cssClass="error" path='fileName' />
				</div>
			</div>

			<div class='row mb-3'>
				<label class='col-sm-2'>類別名稱</label>
				<div class='col-sm-6'>
					<form:select class="form-select"  path="category">
						<form:option value="-1"  label="Select a category" />
						<form:options items="${categoryList}" itemValue="id" itemLabel="categoryName" />
					</form:select>
				</div>
				<div class='col-sm-4'>
					<form:errors cssClass="error" path='category' />
				</div>
			</div>

			<div class='row mb-3'>
				<label class='col-sm-2'>商品介紹</label>
				<div class='col-sm-6'>
					<form:textarea class='form-control' path='productDescription'
						placeholder="請輸入商品介紹" />
				</div>
				<div class='col-sm-4'>
					<form:errors cssClass="error" path='productDescription' />
				</div>
			</div>

			<div class='row mb-3'>
				<label class='col-sm-2'>份量</label>
				<div class='col-sm-6'>
					<form:input type='text' class='form-control' path='productPortion'
						placeholder="請輸入份量 (EX中杯、小杯...)" />
				</div>
				<div class='col-sm-4'>
					<form:errors cssClass="error" path='productPortion' />
				</div>
			</div>

			<div class='row mb-3'>
				<label class='col-sm-2'>價格</label>
				<div class='col-sm-6'>
					<form:input type='number' min="0" class='form-control' path='productPrice'
						placeholder="請輸入商品價格" />
				</div>
				<div class='col-sm-4'>
					<form:errors cssClass="error" path='productPrice' />
				</div>
			</div>

			<div class='row mb-3'>
				<label class='col-sm-2'>庫存</label>
				<div class='col-sm-6'>
					<form:input type='number' min="0" class='form-control'
						path='productStock' placeholder="請輸入商品庫存" />
				</div>
				<div class='col-sm-4'>
					<form:errors cssClass="error" path='productStock' />
				</div>
			</div>
			<div class='row mb-3'>
			    <label class='col-sm-2'>客製標籤</label>
			    <div class='col-sm-6'>
			        <c:forEach var="label" items="${labelList}">
			            <label>
			                <input type="checkbox" name="labels" value="${label.id}" 
			                <c:if test="${selectedLabelIds.contains(label.id)}">checked</c:if>> ${label.labelName}
			            </label><br>
			        </c:forEach>
			        <c:if test="${selectedLabelIds.isEmpty() || !selectedLabelIds.contains('0')}">
			            <label>
			                <input type="checkbox" name="labels" value="0" checked> 無
			            </label><br>
			        </c:if>
			    </div>	  
			    <div class='col-sm-4'>
			        <form:errors cssClass="error" path="labels"  />
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
					<a class='btn btn-outline-primary' href="<c:url value='/product' />"
						role='button'>離開</a>
				</div>
			</div>
		</form:form>
		<hr>

	</div>
</body>
</html>