package com.sneaker.controller;

import com.sneaker.models.User;
import com.sneaker.util.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfileController {

    public User getUserById(int userId) {
        String sql = "SELECT User_Id, User_Name, Address, Phone_Number, Email, role, Image FROM user WHERE User_Id = ?";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                    rs.getInt("User_Id"),
                    rs.getString("User_Name"),
                    rs.getString("Address"),
                    rs.getString("Phone_Number"),
                    rs.getString("Email"),
                    rs.getString("role"),
                    rs.getString("Image")
                );
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE user SET User_Name = ?, Address = ?, Phone_Number = ?, Email = ?, Image = COALESCE(?, Image) WHERE User_Id = ?";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUserName());
            stmt.setString(2, user.getAddress());
            stmt.setString(3, user.getPhoneNumber());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getImage());
            stmt.setInt(6, user.getUserId());
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}