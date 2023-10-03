package com.ispan.eeit69.service.Impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ispan.eeit69.service.EcpayOrderService;
import com.ispan.eeit69.service.PendingOrderService;
import com.ispan.eeit69.utils.OrderDto;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Service
public class EcpayOrderServiceImpl implements EcpayOrderService {

    @Autowired
    private PendingOrderService pendingOrderService;

    @Override
    public String ecpayCheckout(OrderDto orderDto) {
        // 直接从OrderDto中获取所需的值
        Integer updatedOrderNo = orderDto.getOrderNo();

        // 继续处理其他逻辑
        String uuId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);

        AllInOne all = new AllInOne("");
        Date currentTime = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String formattedTime = sdf.format(currentTime);

        Integer totalOrderPrice = pendingOrderService.findOrderPrice(updatedOrderNo);

        AioCheckOutALL obj = new AioCheckOutALL();
        obj.setMerchantTradeNo(uuId);
        obj.setMerchantTradeDate(formattedTime);
        obj.setTotalAmount(totalOrderPrice.toString());
        obj.setTradeDesc("CCO");
        obj.setItemName(updatedOrderNo.toString());
        obj.setReturnURL("http://211.23.128.214:5000");
        obj.setNeedExtraPaidInfo("N");
        obj.setClientBackURL("http://localhost:8080/final?updatedOrderNo=" + updatedOrderNo);
        String form = all.aioCheckOut(obj, null);

        return form; // 返回HTML表单字符串
    }
}
