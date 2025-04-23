<%-- 
    Document   : createExam.jsp
    Created on : Mar 14, 2025, 6:37:45 PM
    Author     : vomin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Create New Exam</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .container {
                background-color: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 500px;
                position: relative;
            }

            h1 {
                color: #00796b;
                text-align: center;
                margin-bottom: 20px;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                font-weight: bold;
                color: #333;
                margin-bottom: 5px;
            }

            input[type="text"], input[type="number"], select {
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-bottom: 15px;
                width: 100%;
                box-sizing: border-box;
            }

            input[type="text"]:focus, input[type="number"]:focus, select:focus {
                border-color: #00796b;
                outline: none;
            }

            button {
                padding: 15px;
                font-size: 16px;
                background-color: #00796b;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #004d40;
            }

            button:active {
                background-color: #00332a;
            }

            .alert {
                padding: 1rem;
                margin-top: 1.5rem;
                border-radius: 6px;
                font-size: 1rem;
                font-weight: 500;
                text-align: center;
                width: 100%;
                box-sizing: border-box;
            }

            .alert-success {
                background-color: #e8f5e9;
                color: #2e7d32;
                border: 1px solid #a5d6a7;
            }

            .alert-error {
                background-color: #ffebee;
                color: #c62828;
                border: 1px solid #ef9a9a;
            }

            .info {
                background-color: #e3f2fd;
                color: #1976d2;
                border: 1px solid #90caf9;
            }
            .back-button {
                display: inline-block;
                margin-top: 15px;
                padding: 10px 20px;
                font-size: 16px;
                background-color: #6c757d;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .back-button:hover {
                background-color: #5a6268;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Create New Exam</h1>

            <!-- Hiển thị thông báo -->
            <c:if test="${not empty mes}">
                <div class="alert alert-success">
                    ${mes}
                </div>
            </c:if>

            <c:if test="${not empty Success}">
                <div class="alert alert-success">
                    ${Success}
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    ${error}
                </div>
            </c:if>
            <c:if test="${empty categories}">
                <div class="alert alert-error">
                    No categories found.
                </div>
            </c:if>

            <!-- Form tạo bài thi -->
            <form action="CreateExamController" method="post">
                <label for="examTitle">Exam Id:</label>
                <input type="text" id="examId" name="examiD">

                <label for="examTitle">Exam Title:</label>
                <input type="text" id="examTitle" name="examTitle">

                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject">

                <label for="category">Category:</label>
                <select id="category" name="category_id">
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.category_id}">${category.category_name}</option>
                    </c:forEach>
                </select>

                <label for="totalMarks">Total Marks:</label>
                <input type="number" id="totalMarks" name="totalMarks">

                <label for="duration">Duration (minutes):</label>
                <input type="number" id="duration" name="duration">

                <button type="submit">Create Exam</button>
            </form>
              <a href="instructorDashboard.jsp" class="back-button">Back Dashboard</a>
        </div>
    </body>
</html>