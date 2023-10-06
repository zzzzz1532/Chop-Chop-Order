// 計算總金額
function updatefooterPrice() {
	let totalAmount = 0;
	const orderData = JSON.parse(localStorage.getItem('orderData')) || [];
	for (const order of orderData) {
		totalAmount += order.finaltotalPrice;
	}
	const footerElement = document.querySelector('.footer1');
	const totalAmountElement = document.querySelector('.footer1 span');
	const allPriceElement = $('#allPrice h4 span');

	if (totalAmount > 0) {
		totalAmountElement.textContent = `NT$${totalAmount}`;
		allPriceElement.text(`NT$${totalAmount}`);
	} else {
		$('.footersticky span').hide();
	}
}
function deleteProduct(button) {
	var productContainer = button.parentElement.parentElement.parentElement; // 獲取包含整個產品的容器元素
	var productId = parseInt(productContainer.dataset.productId); // 獲取產品的 ID

	// 從 local storage 中刪除對應的產品
	var orderData = JSON.parse(localStorage.getItem('orderData')) || [];
	orderData = orderData.filter(product => !(product.cartId === productId));

	// 更新 local storage
	localStorage.setItem('orderData', JSON.stringify(orderData));
	// 從 DOM 中移除相應的 HTML 元素
	productContainer.remove();
	updatefooterPrice();

}

$(document).ready(function() {
	$('.fa-angle-left').click(function() {
		window.location.href = '/main';
	});
	$('.footer1').click(function() {
		// 清除之前的错误消息
		$('.takeouterrmsg').remove();
		$('.payerrmsg').remove();

		// 檢查必填欄位是否有填寫
		var takeoutChecked = $('input[name="diningLocationTakeout"]:checked').length > 0;
		var innerChecked = $('input[name="diningLocationInner"]:checked').length > 0;
		var ecPayChecked = $('#ecPayRadioButton').is(':checked');
		var googlePayChecked = $('#googlePayRadioButton').is(':checked');
		var localPaymentChecked = $('#localPaymentRadioButton').is(':checked');

		// 如果有未選擇的必填欄位
		if (!takeoutChecked && !innerChecked) {
			// 在下方插入一段div顯示提示信息
			var messageDiv = document.createElement('div');
			messageDiv.classList.add('takeouterrmsg');
			messageDiv.textContent = '請選擇用餐方式';
			var container = document.querySelector('.takeout');
			container.appendChild(messageDiv);
			// 將畫面滾動至錯誤訊息位置
			$('html, body').animate({
				scrollTop: $(container).offset().top
			}, 100); // 1000為滾動的時間，以毫秒為單位
		}
		if (!ecPayChecked && !googlePayChecked && !localPaymentChecked) {
			var messageDiv = document.createElement('div');
			messageDiv.classList.add('payerrmsg');
			messageDiv.textContent = '請選擇付款方式';
			var container = document.querySelector('#payradio');
			container.appendChild(messageDiv);
			$('html, body').animate({
				scrollTop: $(container).offset().top
			}, 100);
		}
		if (takeoutChecked && (ecPayChecked || googlePayChecked || localPaymentChecked)) {
			window.location.href = 'finish';
		}
	});

	$('input[name="diningLocationTakeout"]').on('input', function() {
		$('.takeouterrmsg').remove();
	});

	$('input[name="diningLocationInner"]').on('input', function() {
		$('.takeouterrmsg').remove();
	});

	$('input[name="paymentMethod"]').change(function() {
		$('.payerrmsg').remove();
		if (this.value === '線上刷卡' || this.value === 'GooglePay') {
			$('.payinfo').show();
		} else {
			$('.payinfo').hide();
		}
	});



	const orderData = JSON.parse(localStorage.getItem('orderData')) || [];
	const cartContainer = document.getElementById('cartContainer');

	orderData.forEach(data => {
		const div = document.createElement('div');
		div.className = 'orderflex';
		const customizedOptions = data.customized.split(',');
		const customizedHTML = customizedOptions.map(option => {
			return `<div class="customedinfo">${option}</div>`;
		}).join('');
		const toppingsOptions = Object.values(data.toppings).map(option => {
			return `<div class="toppingsinfo">${option}</div>`;
		}).join('');

		const remarkValue = data.remark;
		const productId = data.cartId;
		div.setAttribute('data-product-id', productId); // 將產品的 ID 添加到 data-product-id 屬性中
		div.innerHTML = `
                        <div class="pdtcount">
                            <input type="button" value="-" class="uuu">
                            <span>${data.itemCount}</span>
                            <input type="button" value="+">
                        </div>
                        <div class="cartitemspace" style="width: 60%;"  data-cartID="${data.cartId}">
                            <div class="ordername" data-productID="${data.productID}">${data.name}</div>
                            ${customizedHTML}
                            ${toppingsOptions}
                            <div class="orderrename">餐點備註</div>
                            <div class="pdtrename">${remarkValue}</div>
                            <div class="cartitemRevise">修改</div>
                        </div>
                        <div class="cartitemspace">
                            <div class="pdtPrice">NT$80</div>
                            <div><i class="fa-solid fa-trash-can" style="cursor: pointer;float: right;" onclick="deleteProduct(this)"></i></div>
                        </div>
                        
                    `;

		cartContainer.appendChild(div);

	});
	// 從localStorage中獲取產品數據
	var products = JSON.parse(localStorage.getItem('orderData'));

	// 遍歷每個產品
	products.forEach(function(product, index) {
		// 獲取產品的價格和數量
		var productPrice = parseInt(product.price);
		var toppingPrice = 0;

		// 計算toppingPrice
		if (product.toppings) {
			product.toppings.forEach(function(topping) {
				toppingPrice += parseInt(product.toppingsPrices[topping]);
			});
		}

		var quantity = parseInt(product.itemCount);

		// 計算總價格
		var totalPrice = (productPrice + toppingPrice) * quantity;

		// 將總價格更新到相應的元素中
		var pdtPriceElement = document.querySelectorAll('.pdtPrice')[index];
		pdtPriceElement.textContent = 'NT$' + totalPrice;
	});

	var interval;

	$(".pdtcount input[value='+']").on('mousedown touchstart', function() {

		interval = setInterval(function() {
			var spanElement = $(this).siblings("span");
			var currentValue = parseInt(spanElement.text(), 10);
			if (currentValue < 99) {
				spanElement.text(currentValue + 1);
				updateTotalPrice(this);
				updatefooterPrice();

			}
		}.bind(this), 100);
		$(this).on('mouseup touchend', function() {
			clearInterval(interval);
		});
	});

	$(".pdtcount input[value='-']").on('mousedown touchstart', function() {
		interval = setInterval(function() {
			var spanElement = $(this).siblings("span");
			var currentValue = parseInt(spanElement.text(), 10);
			if (currentValue > 1) {
				spanElement.text(currentValue - 1);
				updateTotalPrice(this);
				updatefooterPrice();

			}
		}.bind(this), 100);
		$(this).on('mouseup touchend', function() {
			clearInterval(interval);
		});
	});

	// 点击加号按钮时增加数字
	$(".pdtcount input[value='+']").click(function() {
		var spanElement = $(this).siblings("span");
		var currentValue = parseInt(spanElement.text(), 10);
		if (currentValue < 99) {
			spanElement.text(currentValue + 1);
			updateTotalPrice(this);
			updatefooterPrice();
		}
	});
	$(".pdtcount input[value='-']").click(function() {
		var spanElement = $(this).siblings("span");
		var currentValue = parseInt(spanElement.text(), 10);
		if (currentValue > 1) {
			spanElement.text(currentValue - 1);
			updateTotalPrice(this);
			updatefooterPrice();
		}
	});
	function updateTotalPrice(button) {
		var pdtPriceElement = button.parentElement.parentElement.querySelector('.pdtPrice');
		let total = 0;
		var priceText = pdtPriceElement.textContent.replace('NT$', '');
		var sumprice = parseInt(priceText);
		var quantity = parseInt(button.parentElement.querySelector('span').textContent);
		var currentProduct = button.parentElement.parentElement;
		var productName = currentProduct.querySelector('.ordername').textContent;
		var customizedOption = currentProduct.querySelector('.customedinfo:nth-child(2)').textContent;
		var toppingsOptions = Array.from(currentProduct.querySelectorAll('.toppingsinfo')).map(option => option.textContent).join(', ');
		const orderData = JSON.parse(localStorage.getItem('orderData')) || [];

		orderData.forEach(function(product, index) {
			var productToppings = product.toppings ? product.toppings.join(', ') : '';
			if (product.name === productName && product.customized === customizedOption && productToppings === toppingsOptions) {
				var singlePrice = product.singlePrice;
				total = quantity * singlePrice;
				orderData[index].itemCount = quantity;
				orderData[index].finaltotalPrice = total;
			}
		});

		localStorage.setItem('orderData', JSON.stringify(orderData));

		pdtPriceElement.textContent = `NT$${total}`;
	}
	$('.orderflex').each(function() {
		var orderRename = $(this).find('.orderrename');
		var pdtRename = $(this).find('.pdtrename');

		if (pdtRename.text().trim() !== '') {
			orderRename.removeClass('renamehidden');
			pdtRename.removeClass('renamehidden');
		} else {
			orderRename.addClass('renamehidden');
			pdtRename.addClass('renamehidden');
		}
	});
	$('.cartitemRevise').click(function() {

		let cartID = $(this).closest('.cartitemspace').data('cartid');
		let productID = $(this).closest('.cartitemspace').find('.ordername').data('productid');

		let itemCount = $(this).parent().parent().find('span').text();
		let customizedHTML = $(this).closest('.cartitemspace').find('.customedinfo').html();
		let toppingsHTML = $(this).closest('.cartitemspace').find('.toppingsinfo').map(function() {
			return $(this).text();
		}).get();

		// 将数据组织成一个 JavaScript 对象
		let cartdata = {
			cartID: cartID,
			productID: productID,
			itemCount: itemCount,
			customized: customizedHTML,
			toppings: toppingsHTML
		};

		// 将 JSON 字符串存储到 localStorage
		localStorage.setItem('cartdata', JSON.stringify(cartdata));
		window.location.href = '/product/' + productID + '?cartID=' + cartID;
	});
	updatefooterPrice();

});