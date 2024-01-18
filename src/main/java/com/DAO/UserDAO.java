package com.DAO;
import com.Entity.User;
public interface UserDAO {
    public boolean UserRegister(User user);
    public User Login(String email, String password);
    User getUserByEmail(String email);
    void updateUser(User user);
    public boolean isEmailExists(String email);
    public boolean checkPassword(int id, String password);
    public boolean updateProfile(User user);
    public boolean updatePassword(User user);
    public boolean updateAddress(User user);
    public User getUserById(int id);
} 

