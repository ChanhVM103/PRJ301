package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addQuestion_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       <form action=\"AddQuestionController\" method=\"post\">\n");
      out.write("    <h2>Add a Multiple-Choice Question</h2>\n");
      out.write("    \n");
      out.write("    <!-- Chọn bài thi -->\n");
      out.write("    <label for=\"examId\">Select Exam:</label>\n");
      out.write("    <select id=\"examId\" name=\"examId\">\n");
      out.write("        <c:forEach var=\"exam\" items=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${exams}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("            <option value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${exam.exam_id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write('"');
      out.write('>');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${exam.exam_title}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</option>\n");
      out.write("        </c:forEach>\n");
      out.write("    </select>\n");
      out.write("\n");
      out.write("    <!-- Nhập question_id -->\n");
      out.write("    <label for=\"questionId\">Question ID:</label>\n");
      out.write("    <input type=\"number\" id=\"questionId\" name=\"questionId\" required>\n");
      out.write("\n");
      out.write("    <!-- Nội dung câu hỏi -->\n");
      out.write("    <label for=\"questionText\">Question Text:</label>\n");
      out.write("    <textarea id=\"questionText\" name=\"questionText\" required></textarea>\n");
      out.write("\n");
      out.write("    <!-- Các lựa chọn -->\n");
      out.write("    <label for=\"optionA\">Option A:</label>\n");
      out.write("    <input type=\"text\" id=\"optionA\" name=\"optionA\" required>\n");
      out.write("    \n");
      out.write("    <label for=\"optionB\">Option B:</label>\n");
      out.write("    <input type=\"text\" id=\"optionB\" name=\"optionB\" required>\n");
      out.write("    \n");
      out.write("    <label for=\"optionC\">Option C:</label>\n");
      out.write("    <input type=\"text\" id=\"optionC\" name=\"optionC\" required>\n");
      out.write("    \n");
      out.write("    <label for=\"optionD\">Option D:</label>\n");
      out.write("    <input type=\"text\" id=\"optionD\" name=\"optionD\" required>\n");
      out.write("\n");
      out.write("    <!-- Chọn câu trả lời đúng -->\n");
      out.write("    <label for=\"correctOption\">Correct Option:</label>\n");
      out.write("    <select id=\"correctOption\" name=\"correctOption\">\n");
      out.write("        <option value=\"A\">A</option>\n");
      out.write("        <option value=\"B\">B</option>\n");
      out.write("        <option value=\"C\">C</option>\n");
      out.write("        <option value=\"D\">D</option>\n");
      out.write("    </select>\n");
      out.write("\n");
      out.write("    <button type=\"submit\">Add Question</button>\n");
      out.write("</form>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
