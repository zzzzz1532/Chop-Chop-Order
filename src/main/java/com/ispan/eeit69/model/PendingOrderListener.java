package com.ispan.eeit69.model;

import javax.persistence.EntityListeners;
import javax.persistence.PostPersist;
import javax.persistence.PostRemove;
import javax.persistence.PostUpdate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ispan.eeit69.controller.WebSocketMessageHandler;

@Component
//@EntityListeners(PendingOrderListener.class)
public class PendingOrderListener {
	
	@Autowired
	WebSocketMessageHandler wsmh;
	
	// 資料插入後執行的邏輯
	@PostPersist
	public void handlePostPersist(PendingOrder pendingOrder) {
		try {
			System.out.println("INSERT COMPLETE!!");
			wsmh.sendPendingOrders();			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		// 可以處理新增資料的相關操作
	}

	// 資料更新後執行的邏輯
	@PostUpdate
	public void handlePostUpdate(PendingOrder pendingOrder) {
		System.out.println("UPDATE COMPLETE!!");
//		wsmh.sendPendingOrders();
		// 可以處理更新資料的相關操作
	}

	// 資料刪除後執行的邏輯
	@PostRemove
	public void handlePostRemove(PendingOrder pendingOrder) {
		System.out.println("DELETE COMPLETE!!");
//		wsmh.sendPendingOrders();
		// 可以處理刪除資料的相關操作
	}
}
