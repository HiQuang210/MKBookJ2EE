package com.Entity;

public class Item {
    private int ItemId;
    private int userId;
    private int bookId;
    private int quantity;
    private double price;
    private int orderId;
    private String bookName;

    public Item() {
        super();
    }

    public Item(int ItemId, int userId, int bookId, int quantity, double price, int orderId) {
        super();
        this.ItemId = ItemId;
        this.userId = userId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.price = price;
        this.orderId = orderId;
    }

    public int getItemId() {
        return ItemId;
    }

    public void setItemId(int ItemId) {
        this.ItemId = ItemId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String toString() {
        return "Item [ItemId=" + ItemId + ", userId=" + userId + " , bookId=" + bookId + ", quantity=" + quantity + ", price=" + price + "orderId=" + orderId +"]";
    }
}
