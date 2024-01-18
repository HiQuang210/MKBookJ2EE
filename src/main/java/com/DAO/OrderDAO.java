package com.DAO;
import java.util.List;

import com.Entity.Order;
public interface OrderDAO {
    boolean addOrder(Order order);
    List<Order> getOrdersByUserId(int userId);
    public List<Order> getAllOrders();
}
