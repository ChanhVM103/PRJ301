/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ExamCategoriesDTO;
import dto.ExamsDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import untils.DBUtils;

/**
 *
 * @author vomin
 */
public class ExamDAO extends DBUtils{
    public boolean createExam(ExamsDTO exam) throws ClassNotFoundException {
    String query = "INSERT INTO tblExams (exam_id,exam_title, subject, category_id, total_marks, duration) VALUES (?, ?, ?, ?, ?, ?)";

    try (Connection conn = getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setInt(1, exam.getExam_id()); 
        ps.setString(2, exam.getExam_title());     
        ps.setString(3, exam.getSubject());        
        ps.setInt(4, exam.getCategory_id());       
        ps.setInt(5, exam.getTotal_marks());       
        ps.setInt(6, exam.getDuration());        

     
        int rowsAffected = ps.executeUpdate();

       
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
 public List<ExamsDTO>readAll(){
     List<ExamsDTO>list= new ArrayList<>();
     String querry ="select * from [dbo].[tblExams]";
        try {
            Connection conn= getConnection();
            PreparedStatement stmt= conn.prepareStatement(querry);
            ResultSet rs= stmt.executeQuery();
            while(rs.next()){
                ExamsDTO x= new ExamsDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),rs.getInt(6));
                list.add(x);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
