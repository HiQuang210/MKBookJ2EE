package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Order;

public class OrderDAOimpl implements OrderDAO{
    private Connection conn;

    public OrderDAOimpl(Connection conn) {
        super();
        this.conn = conn;
    }
    public boolean addOrder(Order order) {
    boolean check = false;
    try {
        String sql = "INSERT INTO `order` (userId, amount, paymentType) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, order.getUserId());
        ps.setDouble(2, order.getAmount());
        ps.setString(3, order.getPaymentType());

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                order.setOrderId(generatedKeys.getInt(1));
                check = true;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return check;
    }

    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();

        try {
            String sql = "SELECT * FROM `order` WHERE userId = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, userId);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setOrderId(rs.getInt("orderId"));
                        order.setUserId(rs.getInt("userId"));
                        order.setOrderDate(rs.getString("orderDate"));
                        order.setAmount(rs.getDouble("amount"));
                        order.setPaymentType(rs.getString("paymentType"));

                        orders.add(order);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();

        try {
            String sql = "SELECT * FROM `order`";
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getInt("orderId"));
                    order.setUserId(rs.getInt("userId"));
                    order.setOrderDate(rs.getString("orderDate"));
                    order.setAmount(rs.getDouble("amount"));
                    order.setPaymentType(rs.getString("paymentType"));

                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }
}

