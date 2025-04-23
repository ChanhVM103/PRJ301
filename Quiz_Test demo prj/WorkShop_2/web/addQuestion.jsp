<%-- 
    Document   : addQuestion.jsp
    Created on : Mar 15, 2025, 12:25:28 PM
    Author     : vomin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Question</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body {
                background: #f0f2f5;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .container {
                background: white;
                padding: 2rem;
                border-radius: 12px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 600px;
            }

            h2 {
                color: #2d3436;
                margin-bottom: 1.5rem;
                font-size: 1.8rem;
                text-align: center;
                border-bottom: 2px solid #00796b;
                padding-bottom: 0.5rem;
            }

            .form-group {
                margin-bottom: 1.2rem;
            }

            label {
                display: block;
                margin-bottom: 0.5rem;
                color: #2d3436;
                font-weight: 500;
            }

            input[type="text"],
            input[type="number"],
            textarea,
            select {
                width: 100%;
                padding: 0.8rem;
                border: 2px solid #e0e0e0;
                border-radius: 6px;
                font-size: 1rem;
                transition: border-color 0.3s ease;
            }

            input[type="text"]:focus,
            input[type="number"]:focus,
            textarea:focus,
            select:focus {
                border-color: #00796b;
                outline: none;
            }

            textarea {
                resize: vertical;
                min-height: 100px;
            }

            .options-container {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 1rem;
                margin: 1rem 0;
            }

            button[type="submit"] {
                background: #00796b;
                color: white;
                padding: 0.8rem 1.5rem;
                border: none;
                border-radius: 6px;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                width: 100%;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            button[type="submit"]:hover {
                background: #004d40;
                transform: translateY(-2px);
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .alert {
                padding: 1rem;
                margin-top: 1.5rem;
                border-radius: 6px;
                font-size: 1rem;
                font-weight: 500;
                text-align: center;
            }

            .alert-error {
                background-color: #ffebee;
                color: #c62828;
                border: 1px solid #ef9a9a;
            }

            .alert-success {
                background-color: #e8f5e9;
                color: #2e7d32;
                border: 1px solid #a5d6a7;
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

          
        </style>
    </head>
    <body>
        <div class="container">
            <c:if test="${not empty requestScope.error}">
                <div class="alert alert-error">
                    <h3>${requestScope.error}</h3>
                </div>
            </c:if>
            <c:if test="${not empty requestScope.success}">
                <div class="alert alert-success">
                    <h3>${requestScope.success}</h3>
                </div>
            </c:if>
            
            <form action="AddQuestionController" method="post">
                <h2>Add New Question</h2>
                <input type="hidden" name="examId" value="${param.examID}"> 
                <div class="form-group">
                    <label for="questionId">Question ID:</label>
                    <input type="number" id="questionId" name="questionId" >
                </div>

                <div class="form-group">
                    <label for="questionText">Question Text:</label>
                    <textarea id="questionText" name="questionText" ></textarea>
                </div>

                <div class="options-container">
                    <div class="form-group">
                        <label for="optionA">Option A:</label>
                        <input type="text" id="optionA" name="optionA" >
                    </div>
                    
                    <div class="form-group">
                        <label for="optionB">Option B:</label>
                        <input type="text" id="optionB" name="optionB" >
                    </div>
                    
                    <div class="form-group">
                        <label for="optionC">Option C:</label>
                        <input type="text" id="optionC" name="optionC" >
                    </div>
                    
                    <div class="form-group">
                        <label for="optionD">Option D:</label>
                        <input type="text" id="optionD" name="optionD" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="correctOption">Correct Option:</label>
                    <select id="correctOption" name="correctOption" class="full-width">
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>
                </div>

                <button type="submit">Add Question</button>
            </form>
                <a href="instructorDashboard.jsp" class="back-button">Back Dashboard</a>
        </div>
    </body>
</html>