<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Instructor Dashboard</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
                background: linear-gradient(135deg, #e0f7fa, #80deea); /* Gradient background */
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
            }

            header {
                background-color: #00796b; /* Dark green */
                color: white;
                text-align: center;
                padding: 20px 0;
                font-size: 24px;
                font-weight: bold;
                width: 100%;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .welcome-message {
                margin: 20px 0;
                font-size: 22px;
                color: black;
                text-align: center;
            }

            .button-container {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap;
                width: 90%;
                max-width: 1200px;
                margin-top: 30px;
                gap: 15px; /* Thêm khoảng cách giữa các nút */
            }

            .button-container form {
                margin: 0;
                text-align: center;
                flex: 1 1 200px; /* Đảm bảo các form có cùng kích thước */
            }

            .button-container button {
                padding: 15px 25px;
                font-size: 16px;
                border-radius: 8px;
                border: none;
                cursor: pointer;
                transition: all 0.3s ease;
                width: 100%; /* Đảm bảo nút bấm chiếm toàn bộ chiều rộng của form */
                background-color: #00796b;
                color: white;
            }

            .button-container button:hover {
                background-color: #004d40;
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            }

            footer {
                background-color: #00796b; /* Dark green */
                color: white;
                text-align: center;
                padding: 15px 0;
                width: 100%;
                position: fixed;
                bottom: 0;
                box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.1);
            }

            .logout-btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #ff4d4d;
                color: white;
                text-decoration: none;
                font-size: 16px;
                font-weight: bold;
                border-radius: 8px;
                transition: background-color 0.3s, transform 0.3s ease;
                text-align: center;
                position: absolute;
                top: 20px;
                right: 20px;
            }

            .logout-btn:hover {
                background-color: #e60000;
                transform: scale(1.1);
            }

            .logout-btn:active {
                background-color: #cc0000;
            }

            .intro-section {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                width: 80%;
                max-width: 800px;
                margin: 20px 0;
                text-align: center;
            }

            .intro-section h2 {
                color: #00796b;
                font-size: 24px;
                margin-bottom: 20px;
            }

            .intro-section p {
                font-size: 16px;
                color: #333;
                line-height: 1.6;
            }
        </style>
    </head>
    <body>
        <%
    // Lấy session và kiểm tra nếu người dùng đã đăng nhập
     session = request.getSession(false);
    
    if (session == null || session.getAttribute("sessionLogin") == null) {
        // Nếu người dùng chưa đăng nhập, chuyển hướng về trang đăng nhập
        response.sendRedirect("index.jsp");
        return;
    }

    // Kiểm tra vai trò người dùng
    String role = (String) session.getAttribute("role");
    if (!"Instructor".equals(role)) {
        // Nếu người dùng không phải Instructor, chuyển hướng về trang đăng nhập
        response.sendRedirect("index.jsp");
        return;
    }
%>
        <header>
            Instructor Dashboard
        </header>

        <div class="welcome-message">
            Welcome, ${sessionScope.sessionLogin.name}!
        </div>

        <!-- Button Container for Instructor Functions -->
        <div class="button-container">
            <form action="ExemCategories" method="get">
                <button type="submit">View Exam Categories</button>
            </form>
            <!-- Create New Exam Button -->
            <form action="CreateExamController" method="get">
                <button type="submit">Create New Exam</button>
            </form>

            <!-- Add Questions Button -->
            <form action="readExamsController" method="get">
                <button type="submit">Add Questions</button>
            </form>
            
            
        </div>

        <!-- Introduction Section -->
        <div class="intro-section">
            <h2>About Instructor Dashboard</h2>
            <p>
                Welcome to the Instructor Dashboard! This platform allows you to manage exams and questions efficiently. 
                You can create new exams, add multiple-choice questions, and manage existing exams. 
                Explore the features and enhance your teaching experience with our comprehensive exam management system.
            </p>
        </div>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0
            response.setDateHeader("Expires", 0); // Proxies
        %>
        <a href="LogoutController" class="logout-btn">Log Out</a>

        <footer>
            &copy; 2025 Quiz System. All rights reserved.
        </footer>
    </body>
</html>