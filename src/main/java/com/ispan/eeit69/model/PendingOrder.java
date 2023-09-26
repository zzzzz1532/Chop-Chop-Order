package com.ispan.eeit69.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="pendingorder")
public class PendingOrder implements Serializable{
	
	private static final long serialVersionUID = 1L;
	// Model 版本號 => 1
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer orderId; //編號
	private Integer orderNo; // 訂單號
	private String diningLocation; //內用外帶
	private String ProductName; // 品名
	private String categoryName; //類別名稱
	private Integer foodQuantity; // 數量
	private Integer orderPrice; //訂單總額
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	private Timestamp created_at; // 生成時間
	//上方屬性可能會再修改，依最終暫存訂單資料表為準
	
	public PendingOrder()  {
		
	}


	public PendingOrder(Integer orderId, Integer orderNo, String diningLocation, String ProductName, String categoryName, Integer foodQuantity,
			Integer orderPrice, Timestamp created_at) {
		super();
		this.orderId = orderId;
		this.orderNo = orderNo;
		this.diningLocation = diningLocation;
		this.ProductName = ProductName;
		this.categoryName = categoryName;
		this.foodQuantity = foodQuantity;
		this.orderPrice = orderPrice;
		this.created_at = created_at;
	}


	public Integer getOrderId() {
		return orderId;
	}


	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}


	public Integer getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}


	public String getDiningLocation() {
		return diningLocation;
	}


	public void setDiningLocation(String diningLocation) {
		this.diningLocation = diningLocation;
	}


	public String getProductName() {
		return ProductName;
	}


	public void setProductName(String ProductName) {
		this.ProductName = ProductName;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public Integer getFoodQuantity() {
		return foodQuantity;
	}


	public void setFoodQuantity(Integer foodQuantity) {
		this.foodQuantity = foodQuantity;
	}


	public Integer getOrderPrice() {
		return orderPrice;
	}


	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}


	public Timestamp getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
