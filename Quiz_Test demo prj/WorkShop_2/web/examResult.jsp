<%-- 
    Document   : examResult.jsp
    Created on : Mar 16, 2025, 12:33:17 AM
    Author     : vomin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Exam Result</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                padding: 20px;
            }
            .container {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                max-width: 800px;
                margin: 0 auto;
                text-align: center;
            }
            h2 {
                color: #00796b;
            }
            .result {
                font-size: 24px;
                font-weight: bold;
                margin: 20px 0;
            }
            a {
                color: #00796b;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Exam Result</h2>
            <div class="result">
                Your score: ${score} / ${totalQuestions}
            </div>
            <a href="StudentDashboard.jsp">Back to Dashboard</a>
        </div>
    </body>
</html>