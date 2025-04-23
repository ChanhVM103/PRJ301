/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UsersDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import untils.DBUtils;

/**
 *
 * @author vomin
 */
public class UsersDAO  {
     public UsersDTO checkLogin(String userName, String passWord){
      
        String querry="select * from [dbo].[tblUsers] where username=? and password=? ";
         try {
             Connection conn= DBUtils.getConnection();
             PreparedStatement stmt= conn.prepareStatement(querry);
             stmt.setString(1,userName);
             stmt.setString(2,passWord);
             ResultSet rs= stmt.executeQuery();
             if(rs.next()){
             String username = rs.getString("username");
            String name = rs.getString("name"); 
            String password = rs.getString("password");
            String role = rs.getString("role");
            return new UsersDTO(username, name, password, role);
             }
         } catch (Exception e) {
             e.printStackTrace();
         }
        return null;
    }
}
