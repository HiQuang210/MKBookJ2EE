package com.DAO;
import java.util.List;
import com.Entity.Item;
public interface ItemDAO {
    
    public boolean addCart(Item item);
    public List<Item> getBookByUser(int userId);
    public boolean deleteBook(int bookId, int userId);
    boolean updateOrderIdByUserId(int userId, int orderId);
}
