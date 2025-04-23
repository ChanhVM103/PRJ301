<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Questions</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f4f7f6;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }

        header {
            background-color: #00796b;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        header h2 {
            font-size: 2rem;
            margin: 0;
        }

        h3 {
            color: #00796b;
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #00796b;
            color: white;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        button {
            padding: 10px 20px;
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

        footer {
            text-align: center;
            margin-top: 30px;
            padding: 10px;
            background-color: #00796b;
            color: white;
            border-radius: 8px;
        }

        footer p {
            margin: 0;
        }

        .error-message {
            text-align: center;
            color: #e60000;
            background-color: #ffebee;
            padding: 10px;
            border-radius: 5px;
            margin: 20px auto;
            width: 90%;
            max-width: 500px;
        }

        @media (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                padding: 10px;
            }

            header h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <h2>Manage Exams</h2>
    </header>
    
    <h3>Exam List</h3>
    <c:if test="${not empty requestScope.error}">
        <div class="error-message">${requestScope.error}</div>
    </c:if>
        
    <table>
        <thead>
            <tr>
                <th>Exam ID</th>
                <th>Exam Title</th>
                <th>Subject</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="exam" items="${requestScope.exams}">
                <tr>
                    <td>${exam.exam_id}</td>
                    <td>${exam.exam_title}</td>
                    <td>${exam.subject}</td>
                    <td>
                        <form action="addQuestion.jsp" method="get">
                            <input type="hidden" name="examID" value="${exam.exam_id}" />
                            <button type="submit">Add Question</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <footer>
        <p>&copy; 2025 Quiz System. All rights reserved.</p>
    </footer>
</body>
</html>