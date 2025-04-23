/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.QuestionDTO;
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
public class QuestionDAO extends DBUtils{
   public boolean addQuestion(QuestionDTO question) {
        String query = "INSERT INTO tblQuestions (question_id, exam_id, question_text, option_a, option_b, option_c, option_d, correct_option) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, question.getQuestionId()); // Dùng question_id người dùng nhập
            ps.setInt(2, question.getExamId());
            ps.setString(3, question.getQuestionText());
            ps.setString(4, question.getOptionA());
            ps.setString(5, question.getOptionB());
            ps.setString(6, question.getOptionC());
            ps.setString(7, question.getOptionD());
            ps.setString(8, question.getCorrectOption());
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
   
   public List<QuestionDTO> getQuestionsByExamId(int examId) throws ClassNotFoundException {
        List<QuestionDTO> questions = new ArrayList<>();
        String query = "SELECT * FROM tblQuestions WHERE exam_id = ?"; 

        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) { 

            ps.setInt(1, examId); 
            ResultSet rs = ps.executeQuery(); 

           
            while (rs.next()) {
                QuestionDTO question = new QuestionDTO(
                    rs.getInt("question_id"), 
                    rs.getInt("exam_id"), 
                    rs.getString("question_text"),
                    rs.getString("option_a"), 
                    rs.getString("option_b"), 
                    rs.getString("option_c"), 
                    rs.getString("option_d"), 
                    rs.getString("correct_option") 
                );
                questions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }

        return questions; 
    }
}
