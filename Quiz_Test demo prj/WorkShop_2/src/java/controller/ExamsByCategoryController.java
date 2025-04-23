/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ExamCategoriesDAO;
import dto.ExamCategoriesDTO;
import dto.ExamsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vomin
 */
@WebServlet(name = "ExamsByCategoryController", urlPatterns = {"/ExamsByCategoryController"})
public class ExamsByCategoryController extends HttpServlet {

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
            out.println("<title>Servlet ExamsByCategoryController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExamsByCategoryController at " + request.getContextPath() + "</h1>");
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
      // Lấy danh mục từ cơ sở dữ liệu để hiển thị cho người dùng chọn
        ExamCategoriesDAO a= new ExamCategoriesDAO();
        List<ExamCategoriesDTO> categories =  a.readAll(); // Lấy tất cả các danh mục
        request.setAttribute("categories", categories);
        
        String categoryIdParam = request.getParameter("category_id");

        if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
            try {
                // Lọc kỳ thi theo category_id nếu người dùng đã chọn danh mục
                int categoryId = Integer.parseInt(categoryIdParam);
                
                ExamCategoriesDAO examDAO = new ExamCategoriesDAO();
                List<ExamsDTO> exams = examDAO.getExamsByCategory(categoryId); // Lấy kỳ thi theo danh mục
                
                // Truyền danh sách kỳ thi vào request để hiển thị trên JSP
                request.setAttribute("exams", exams);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("errorPage.jsp"); // Xử lý nếu category_id không hợp lệ
                return;
            }
        }
        
        // Chuyển tiếp đến JSP để hiển thị danh sách kỳ thi và danh mục
        request.getRequestDispatcher("viewExamsByCategory.jsp").forward(request, response);
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
        processRequest(request, response);
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
