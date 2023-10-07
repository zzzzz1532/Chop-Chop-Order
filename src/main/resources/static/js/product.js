$(document).ready(function () {
	const cartdata = JSON.parse(localStorage.getItem('cartdata'));
	if (cartdata) {
        // 存在 cartdata，说明用户是从购物车页面点击“修改”按钮跳转过来的
        // 在这里执行更新购物车的操作
        
        // 更新完购物车后，记得将 cartdata 从 localStorage 中移除
        localStorage.removeItem('cartdata');
    }
    $('.fa-angle-left').click(function () {
		localStorage.removeItem('cartdata');
        window.history.back();
    });
    $('.footer1').click(function () {
        // 获取已有的订单数据（如果有）
        const existingData = JSON.parse(localStorage.getItem('orderData')) || [];
        // 获取产品名称和价格
        const productName = document.querySelector('.divflex h4').textContent;
        const productPrice = document.querySelector('.divflex span').textContent;
        // 获取选中的客製化选项
        const customizedInput  = document.querySelector('input[name="customized"]:checked');
        const customized = customizedInput ? customizedInput.value : '';
        let labels = document.querySelectorAll('input[name="toppings"]:checked');
        let labelsData = [];
        labels.forEach(function(label) {
		    let labelID = label.dataset.labelsid;
		    labelsData.push(labelID);
		});
        // 获取选中的加料选项
        const toppings = Array.from(document.querySelectorAll('input[name="toppings"]:checked'))
            .map(checkbox => checkbox.value);
        // 获取備註
        const remark = document.querySelector('#remark input').value;
        // 获取数量
        const itemCount = document.querySelector('#itemcount span').textContent;
        let productID = window.location.pathname.split('/').pop();
        const singlePrice = finaltotalPrice / itemCount;
        const cartId = Date.now();
        // 将数据存储到 LocalStorage
        const newData = {
            cartId: cartId,
            productID:productID,
            name: productName,
            price: productPrice,
            labelid:labelsData,
            customized: customized,
            toppings: toppings,
            remark: remark,
            itemCount: itemCount,
            finaltotalPrice: finaltotalPrice,
            toppingsPrices: {},
            singlePrice: singlePrice
        };
        //更新 toppingsPrices
        toppings.forEach(topping => {
            const toppingName = topping;
            const toppingPriceText = parseInt(document.querySelector(`input[value="${topping}"]`).nextElementSibling.querySelector('span:last-child').textContent, 10);
            const toppingPrice = parseInt(toppingPriceText) || 0;
            newData.toppingsPrices[toppingName] = toppingPrice;
        });
        // 将新的订单数据添加到已有的订单数据中
        existingData.push(newData);
        localStorage.setItem('orderData', JSON.stringify(existingData));
        window.location.href = '/main';
    });
    var spanElement = $("#itemcount span");
    var interval;

    $("#itemcount input[value='+']").on('mousedown touchstart', function () {
        interval = setInterval(function () {
            var currentValue = parseInt(spanElement.text(), 10);
            if (currentValue < 99) {
                spanElement.text(currentValue + 1);
                updatePrice();
            }
        }, 100);
    }).on('mouseup touchend', function () {
        clearInterval(interval);
    });

    $("#itemcount input[value='-']").on('mousedown touchstart', function () {
        interval = setInterval(function () {
            var currentValue = parseInt(spanElement.text(), 10);
            if (currentValue > 1) {
                spanElement.text(currentValue - 1);
                updatePrice();
            }
        }, 100);
    }).on('mouseup touchend', function () {
        clearInterval(interval);
    });

    // 点击加号按钮时增加数字
    $("#itemcount input[value='+']").click(function () {
        var currentValue = parseInt(spanElement.text(), 10);
        if (currentValue < 99) {
            spanElement.text(currentValue + 1);
            updatePrice();
        }
    });

    // 点击减号按钮时减少数字
    $("#itemcount input[value='-']").click(function () {
        var currentValue = parseInt(spanElement.text(), 10);
        if (currentValue > 1) {
            spanElement.text(currentValue - 1);
            updatePrice();
        }
    });
    // 原价
    const originalPriceText = document.querySelector('.divflex span').textContent;
    const originalPrice = parseInt(originalPriceText, 10);
    let finaltotalPrice = originalPrice;
    let toppingsPrices = {};
    // 监听客製选项变化
    document.querySelectorAll('input[name="toppings"]').forEach(function (input) {
        input.addEventListener('change', updatePrice);
    });

    // 更新价格的函数
    function updatePrice() {
        let totalPrice = originalPrice;

        // 获取选中的加料选项
        const toppings = Array.from(document.querySelectorAll('input[name="toppings"]:checked'));

        // 根据加料选项来调整价格
        toppings.forEach(topping => {
            const toppingPriceText = parseInt(topping.nextElementSibling.querySelector('span:last-child').textContent, 10);
            const toppingPrice = parseInt(toppingPriceText) || 0;
            totalPrice += toppingPrice;
        });
        //數量
        const itemCountText = document.querySelector('#itemcount span').textContent;
        const itemCount = parseInt(itemCountText, 10);
        totalPrice = itemCount * totalPrice;
        // 更新显示的价格
        document.querySelector('.footer1 span').textContent = `NT$${totalPrice}`;
        finaltotalPrice = totalPrice;
    }

    // 初始时更新一次价格
    updatePrice();
    document.querySelectorAll('input[type="checkbox"]').forEach(function (checkbox) {
        const lastSpan = checkbox.nextElementSibling.querySelector('span:last-child');
        const priceElement = checkbox.nextElementSibling.querySelector('.price');

        if (lastSpan.textContent.trim() !== '') {
            priceElement.style.display = 'inline';
        } else {
            priceElement.style.display = 'none';
        }
    });

});
