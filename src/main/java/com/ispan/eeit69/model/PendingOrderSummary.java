package com.ispan.eeit69.model;

import java.util.List;

public class pendingOrderRepository {

    private Integer orderNo;
    private String diningLocation;
    private List<String> productName;
    private List<String> categoryName;
    private List<Integer> foodQuantity;
    private List<Integer> orderPrice;
    private List<String> labelName;
    private List<String> foodNote;
    private List<String> orderNote;
    private String created_at;

    public PendingOrderSummary() {
        // Default constructor
    }

    public PendingOrderSummary(Integer orderNo, String diningLocation, List<String> productName, List<String> categoryName, List<Integer> foodQuantity, List<Integer> orderPrice, List<String> labelName, List<String> foodNote, List<String> orderNote, String created_at) {
        this.orderNo = orderNo;
        this.diningLocation = diningLocation;
        this.productName = productName;
        this.categoryName = categoryName;
        this.foodQuantity = foodQuantity;
        this.orderPrice = orderPrice;
        this.labelName = labelName;
        this.foodNote = foodNote;
        this.orderNote = orderNote;
        this.created_at = created_at;
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

    public List<String> getProductName() {
        return productName;
    }

//    public void setProductName(List<String> productName) {
//        this.productName = productName;
//    }


    public List<String> getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(List<String> categoryName) {
        this.categoryName = categoryName;
    }

    public List<Integer> getFoodQuantity() {
        return foodQuantity;
    }

    public void setFoodQuantity(List<Integer> foodQuantity) {
        this.foodQuantity = foodQuantity;
    }

    public List<Integer> getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(List<Integer> orderPrice) {
        this.orderPrice = orderPrice;
    }

    public List<String> getLabelName() {
        return labelName;
    }

    public void setLabelName(List<String> labelName) {
        this.labelName = labelName;
    }

    public List<String> getFoodNote() {
        return foodNote;
    }

    public void setFoodNote(List<String> foodNote) {
        this.foodNote = foodNote;
    }

    public List<String> getOrderNote() {
        return orderNote;
    }

    public void setOrderNote(List<String> orderNote) {
        this.orderNote = orderNote;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
}
