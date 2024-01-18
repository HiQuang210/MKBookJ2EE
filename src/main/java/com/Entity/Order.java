package com.Entity;

public class Order {
    private int orderId;
    private int userId;
    private String orderDate; // Representing orderDate as String
    private double amount;
    private String paymentType;

    public Order() {
        super();
    }

    public Order(int orderId, int userId, String orderDate, double amount, String paymentType) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.amount = amount;
        this.paymentType = paymentType;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", userId=" + userId +", orderDate=" + orderDate +", amount=" + amount +", paymentType=" + paymentType +'}';
    }
}
