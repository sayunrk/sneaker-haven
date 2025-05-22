package com.sneaker.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.sneaker.models.User; 
import com.sneaker.util.DbConfig;
import com.sneaker.util.HashUtil;

public class LoginController {

    public User authenticateUser(String userName, String password) {
        String sql = "SELECT User_Id, User_Name, role FROM user WHERE User_Name = ? AND Password = ?";

        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String hashedPassword = HashUtil.hashPassword(password);

            stmt.setString(1, userName);
            stmt.setString(2, hashedPassword);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                    rs.getInt("User_Id"),
                    rs.getString("User_Name"),
                    rs.getString("role")
                );
            }
            return null;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}