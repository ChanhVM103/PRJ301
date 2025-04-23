<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Do Exam</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }

            .container {
                background-color: #fff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 900px;
                margin: 40px auto;
                font-size: 1.1rem;
                border: 1px solid #ddd;
            }

            h2 {
                font-size: 2rem;
                margin-bottom: 20px;
                color: #333;
            }

            .question {
                margin-bottom: 20px;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                border: 1px solid #ddd;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .question p {
                font-weight: bold;
                margin-bottom: 12px;
                color: #444;
            }

            .options {
                margin-left: 20px;
                display: flex;
                flex-direction: column;
            }

            .options label {
                font-size: 1.1rem;
                margin: 8px 0;
                padding: 8px;
                border-radius: 5px;
                cursor: pointer;
                background-color: #f0f2f5;
                transition: background-color 0.3s ease;
            }

            .options label:hover {
                background-color: #dbe2e8;
            }

            input[type="radio"] {
                margin-right: 10px;
            }

            button {
                background-color: #00796b;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1.1rem;
                width: 100%;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #004d40;
            }

            .alert {
                padding: 10px;
                background-color: #f8d7da;
                color: #721c24;
                margin-bottom: 15px;
                border-radius: 5px;
                font-size: 1rem;
            }

            .alert.success {
                background-color: #d4edda;
                color: #155724;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h2>Exam Questions</h2>
            <!-- Hiển thị thông báo nếu có -->
            <c:if test="${not empty error}">
                <div class="alert">
                    ${error}
                </div>
            </c:if>

            <form action="SubmitExamController" method="post">
                <input type="hidden" name="examId" value="${examId}">
                <c:forEach var="question" items="${questions}" varStatus="loop">
                    <div class="question">
                        <p>${loop.index + 1}. ${question.questionText}</p>
                        <div class="options">
                            <label>
                                <input type="radio" name="answer${question.questionId}" value="A"> ${question.optionA}
                            </label>
                            <label>
                                <input type="radio" name="answer${question.questionId}" value="B"> ${question.optionB}
                            </label>
                            <label>
                                <input type="radio" name="answer${question.questionId}" value="C"> ${question.optionC}
                            </label>
                            <label>
                                <input type="radio" name="answer${question.questionId}" value="D"> ${question.optionD}
                            </label>
                        </div>
                    </div>
                </c:forEach>
                <button type="submit">Submit Exam</button>
            </form>
        </div>
    </body>
</html>
