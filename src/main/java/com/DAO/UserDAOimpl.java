package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Entity.User;

public class UserDAOimpl implements UserDAO{
    private Connection conn;

	public UserDAOimpl(Connection conn) {
        super();
        this.conn = conn;
    }
    public boolean UserRegister(User user) {
        boolean check=false;

        try {
            String sql="INSERT INTO user(firstname,lastname,email,phone,password) VALUES (?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getLastname());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getPassword());

            int i=ps.executeUpdate();
            if(i==1)
            {
                check=true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    public User Login(String email, String password) {
        User user = null;
        try {
            String sql="SELECT * FROM user WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                user = new User();
                user.setId(rs.getInt(1));
                user.setFirstname(rs.getString(2));
                user.setLastname(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setPassword(rs.getString(6));
                user.setAddress(rs.getString(7));
                user.setCity(rs.getString(8));
                user.setZipcode(rs.getInt(9));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}

