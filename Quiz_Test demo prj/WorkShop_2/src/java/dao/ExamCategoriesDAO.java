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
import java.util.ArrayList;
import java.util.List;
import untils.DBUtils;

/**
 *
 * @author vomin
 */
public class ExamCategoriesDAO {
    public List<ExamCategoriesDTO>readAll(){
     List<ExamCategoriesDTO>list= new ArrayList<>();
     String querry ="select * from [dbo].[tblExamCategories]";
        try {
            Connection conn= DBUtils.getConnection();
            PreparedStatement stmt= conn.prepareStatement(querry);
            ResultSet rs= stmt.executeQuery();
            while(rs.next()){
                ExamCategoriesDTO s= new ExamCategoriesDTO(rs.getInt(1),rs.getString(2),rs.getString(3));
              list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<ExamsDTO> getExamsByCategory(int categoryId) {
        List<ExamsDTO> exams = new ArrayList<>();
        String query = "SELECT * FROM dbo.tblExams WHERE category_id = ?";
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ExamsDTO exam = new ExamsDTO(
                    rs.getInt("exam_id"),
                    rs.getString("exam_title"),
                    rs.getString("subject"),
                    rs.getInt("category_id"),    
                    rs.getInt("total_marks"),
                    rs.getInt("duration")
                );
                exams.add(exam);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exams;
    }
}
    

