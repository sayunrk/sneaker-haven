package com.sneaker.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sneaker.util.DbConfig;

public class LoginController {

    public boolean authenticateUser(String userName, String password) {
        String sql = "SELECT * FROM user WHERE User_Name = ? AND Password = ?";

        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, userName);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            return rs.next(); 

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
