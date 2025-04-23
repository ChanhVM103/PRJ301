/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuestionDAO;
import dto.QuestionDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vomin
 */
@WebServlet(name = "AddQuestionController", urlPatterns = {"/AddQuestionController"})
public class AddQuestionController extends HttpServlet {

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
            out.println("<title>Servlet AddQuestionController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddQuestionController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String questionIdStr = request.getParameter("questionId");
        String examIdStr = request.getParameter("examId");
        String questionText = request.getParameter("questionText");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");

        // Kiểm tra dữ liệu
        if (questionIdStr == null || examIdStr == null || questionText == null || optionA == null || optionB == null || optionC == null || optionD == null || correctOption == null) {
            request.setAttribute("error", "All fields must be filled out.");
            request.getRequestDispatcher("addQuestion.jsp").forward(request, response);
            return;
        }

        try {
            // Chuyển các giá trị từ String thành int
            int questionId = Integer.parseInt(questionIdStr);  // Người dùng nhập question_id
            int examId = Integer.parseInt(examIdStr);

            // Tạo đối tượng QuestionDTO và gọi DAO để lưu vào CSDL
            QuestionDTO question = new QuestionDTO(questionId, examId, questionText, optionA, optionB, optionC, optionD, correctOption);
            QuestionDAO questionDAO = new QuestionDAO();
            boolean isSuccess = questionDAO.addQuestion(question);

            // Xử lý kết quả
            if (isSuccess) {
                request.setAttribute("success", "Question added successfully!");
            } else {
                request.setAttribute("error", "Failed to add question.");
            }

            request.getRequestDispatcher("addQuestion.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input for question ID or exam ID.");
            request.getRequestDispatcher("addQuestion.jsp").forward(request, response);
        }
    }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
