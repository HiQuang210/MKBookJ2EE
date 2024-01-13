package com.DAO;
import com.Entity.User;
public interface UserDAO {
    public boolean UserRegister(User user);

    public User Login(String email, String password);
} 

