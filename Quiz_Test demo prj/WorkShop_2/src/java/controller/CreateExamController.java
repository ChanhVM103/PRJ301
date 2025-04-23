/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ExamCategoriesDAO;
import dao.ExamDAO;
import dto.ExamCategoriesDTO;
import dto.ExamsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vomin
 */
@WebServlet(name = "CreateExamController", urlPatterns = {"/CreateExamController"})
public class CreateExamController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateExamController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateExamController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ExamCategoriesDAO categoryDAO = new ExamCategoriesDAO();
        List<ExamCategoriesDTO> categories = categoryDAO.readAll();
        
        if (categories != null && !categories.isEmpty()) {
            request.setAttribute("categories", categories);
            System.out.println("Categories set in request: " + categories.size());
        } else {
            request.setAttribute("error", "No categories found.");
        }

        request.getRequestDispatcher("createExam.jsp").forward(request, response);
    }   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String examIDStr= request.getParameter("examiD");
        String examTitle = request.getParameter("examTitle");
        String subject = request.getParameter("subject");
        String categoryIdStr = request.getParameter("category_id");
        String totalMarksStr = request.getParameter("totalMarks");
        String durationStr = request.getParameter("duration");

        if (examIDStr == null || examTitle == null || subject == null || categoryIdStr == null || totalMarksStr == null || durationStr == null
                || examTitle.trim().isEmpty() || subject.trim().isEmpty() || categoryIdStr.trim().isEmpty() || totalMarksStr.trim().isEmpty() || durationStr.trim().isEmpty()) {
            request.setAttribute("error", "All fields must be filled out.");
            request.getRequestDispatcher("createExam.jsp").forward(request, response);
            return;
        }
  try {
        // Chuyển đổi các giá trị từ String sang kiểu dữ liệu số (int)
        int examID = Integer.parseInt(examIDStr);   
        int categoryId = Integer.parseInt(categoryIdStr);
        int totalMarks = Integer.parseInt(totalMarksStr);
        int duration = Integer.parseInt(durationStr);
        
          if (examID < 0 || totalMarks < 0 || duration < 0) {
            request.setAttribute("error", "Exam ID, Total Marks, and Duration cannot be negative.");
            request.getRequestDispatcher("createExam.jsp").forward(request, response);
            return;
        }
        // Tạo đối tượng ExamsDTO
        ExamsDTO e = new ExamsDTO(examID, examTitle, subject, categoryId, totalMarks, duration);

        // Khởi tạo DAO và gọi hàm để tạo bài thi mới
        ExamDAO examDAO = new ExamDAO();
        boolean isSuccess = examDAO.createExam(e);
        
        // Cập nhật danh sách các danh mục
        ExamCategoriesDAO categoryDAO = new ExamCategoriesDAO();
        List<ExamCategoriesDTO> categories = categoryDAO.readAll();
        request.setAttribute("categories", categories);

        // Kiểm tra kết quả tạo bài thi
        if (isSuccess) {
            request.setAttribute("Success", "Create Successful!");
        } else {
            request.setAttribute("mes", "Create Failed!");
        }

    } catch (NumberFormatException e) {
        // Nếu có lỗi khi chuyển đổi số (nhập không hợp lệ)
        request.setAttribute("error", "Please enter valid numbers for exam ID, total marks, and duration.");
    } catch (Exception e) {
        // Xử lý các lỗi không xác định khác
        Logger.getLogger(CreateExamController.class.getName()).log(Level.SEVERE, null, e);
        request.setAttribute("error", "An unexpected error occurred. Please try again.");
    }

        request.getRequestDispatcher("createExam.jsp").forward(request, response);
    }
}
