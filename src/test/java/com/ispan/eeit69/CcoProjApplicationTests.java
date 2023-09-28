package com.ispan.eeit69;

import java.sql.Timestamp;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.repository.PendingOrderRepository;

@SpringBootTest
class CcoProjApplicationTests {
	
	@Autowired
	PendingOrderRepository por;
	
	
	@Test
	void contextLoads() {
		try {
		
	    Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		
		
		// 要跳 INSERT
//		PendingOrder po = new PendingOrder(18, 18, "T", "起司蛋餅", "蛋餅類", 1, 200, currentTime, "123", "123", "123" );
//		po = por.save(po);
		
		}catch(Exception e) {
			System.out.println(e);
		}
//		// 要跳 UPDATE
//		po.setOrderNote("辣一點");
//		po = por.save(po);
//		
//		PendingOrder po2 = new PendingOrder(19, 19, "H", "番茄蛋餅", "蛋餅類", 2, 400, null, "null", "null", "null" );
//		po2 =por.save(po2);
	
//		por.delete(po);
		
		
	}
	
	
}
