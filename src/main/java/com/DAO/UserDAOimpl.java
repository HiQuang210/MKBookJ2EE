package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public User getUserByEmail(String email) {
        User user = null;
        try {
            String sql = "SELECT * FROM user WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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

    public void updateUser(User user) {
        try {
            String sql = "UPDATE user SET password=? WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getPassword());
            ps.setString(2, user.getEmail());

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated == 0) {
                System.out.println("User not found with email: " + user.getEmail());
            } else {
                System.out.println("User password updated successfully");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isEmailExists(String email) {
        boolean exists = false;
        try {
            String sql = "SELECT COUNT(*) FROM user WHERE email=?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, email);
    
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        int count = rs.getInt(1);
                        exists = count > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    
        return exists;
    }

    public boolean checkPassword(int id, String password) {
        boolean check = false;
        try {
            String sql = "SELECT * FROM user WHERE id=? AND password=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            check = rs.next();
            while (rs.next()) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    public boolean updateProfile(User user) {
        boolean check=false;

        try {
            String sql="UPDATE user SET firstname = ?,lastname = ?, phone = ? WHERE id =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getLastname());
            ps.setString(3, user.getPhone());
            ps.setInt(4, user.getId());

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
    public boolean updatePassword(User user) {
        boolean check = false;
    
        try {
            String sql = "UPDATE user SET password=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getPassword());
            ps.setInt(2, user.getId());
    
            int rowsUpdated = ps.executeUpdate();
    
            if (rowsUpdated == 1) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    public boolean updateAddress(User user) {
        boolean check = false;
        try {
            String sql = "UPDATE user SET address=?, city=?, zipcode=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getAddress());
            ps.setString(2, user.getCity());
            ps.setInt(3, user.getZipcode());
            ps.setInt(4, user.getId());
    
            int rowsUpdated = ps.executeUpdate();
    
            if (rowsUpdated == 1) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    public User getUserById(int id) {
        User user = null;

        try {
            String sql = "SELECT * FROM user WHERE id=?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, id);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        user = new User();
                        user.setId(rs.getInt("id"));
                        user.setFirstname(rs.getString("firstname"));
                        user.setLastname(rs.getString("lastname"));
                        user.setEmail(rs.getString("email"));
                        user.setPhone(rs.getString("phone"));
                        user.setAddress(rs.getString("address"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}

