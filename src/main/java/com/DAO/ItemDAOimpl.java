package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Item;
public class ItemDAOimpl implements ItemDAO{
    private Connection conn;
    public ItemDAOimpl(Connection conn) {
        this.conn = conn;
    }

    public boolean addCart(Item item) {
        boolean check = false;
        try {
            String checkExistingSql = "SELECT * FROM item WHERE userId = ? AND bookId = ? AND orderId IS NULL";
            try (PreparedStatement checkExistingPs = conn.prepareStatement(checkExistingSql)) {
                checkExistingPs.setInt(1, item.getUserId());
                checkExistingPs.setInt(2, item.getBookId());
                ResultSet existingRs = checkExistingPs.executeQuery();
    
                if (existingRs.next()) {
                    int existingQuantity = existingRs.getInt("quantity");
                    int newQuantity = item.getQuantity() + existingQuantity;
    
                    String updateSql = "UPDATE item SET quantity = ? WHERE userId = ? AND bookId = ? AND orderId IS NULL";
                    try (PreparedStatement updatePs = conn.prepareStatement(updateSql)) {
                        updatePs.setInt(1, newQuantity);
                        updatePs.setInt(2, item.getUserId());
                        updatePs.setInt(3, item.getBookId());
                        int updateResult = updatePs.executeUpdate();
    
                        if (updateResult == 1) {
                            check = true;
                        }
                    }
                } else {
                    String insertSql = "INSERT INTO item (userId, bookId, quantity) VALUES (?,?,?)";
                    try (PreparedStatement insertPs = conn.prepareStatement(insertSql)) {
                        insertPs.setInt(1, item.getUserId());
                        insertPs.setInt(2, item.getBookId());
                        insertPs.setInt(3, item.getQuantity());
    
                        int insertResult = insertPs.executeUpdate();
    
                        if (insertResult == 1) {
                            check = true;
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }    
    public List<Item> getBookByUser(int userId) {
        List<Item> list = new ArrayList<Item>();
        try {
            String sql = "SELECT item.*, book.bookName FROM item JOIN book ON item.bookId = book.bookId WHERE item.userId=? AND item.orderId IS NULL";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Item item = new Item();
                item.setItemId(rs.getInt(1));
                item.setUserId(rs.getInt(2));
                item.setBookId(rs.getInt(3));
                item.setQuantity(rs.getInt(4));
                item.setPrice(rs.getDouble(5));
                item.setBookName(rs.getString("bookName"));
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteBook(int bookId, int userId)
    {
        boolean check = false;
        try {
            String sql = "DELETE FROM item where bookId =? AND userId =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookId);
            ps.setInt(2, userId);
            int i = ps.executeUpdate();
        if(i == 1)
        {
            check = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return check;
    }
    
    public boolean updateOrderIdByUserId(int userId, int orderId) {
        boolean check = false;
        try {
            String sql = "UPDATE item SET orderId = ? WHERE userId = ? AND orderId IS NULL";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            ps.setInt(2, userId);

            int i = ps.executeUpdate();
            if (i > 0) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

}

    
