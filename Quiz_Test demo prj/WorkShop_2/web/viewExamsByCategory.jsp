<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Exams by Category</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            color: #00796b;
            margin-bottom: 20px;
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: 100%;
            max-width: 500px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        select, button {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-top: 10px;
            width: 100%;
        }

        button {
            background-color: #00796b;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #004d40;
        }

        table {
            width: 100%;
            max-width: 800px;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
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
            font-weight: bold;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .message {
            color: #00796b;
            font-size: 18px;
            margin: 20px 0;
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

<h2>View Exams by Category</h2>

<!-- Form chọn danh mục -->
<form action="ExamsByCategoryController" method="get">
    <label for="category">Choose a category:</label>
    <select id="category" name="category_id">
        <c:forEach var="category" items="${requestScope.categories}">
            <option value="${category.category_id}">${category.category_name}</option>
        </c:forEach>
    </select>
    <button type="submit">View Exams</button>
</form>

<!-- Hiển thị các kỳ thi nếu có -->
<c:if test="${not empty requestScope.exams}">
    <h3>Exams in Selected Category:</h3>
    <table>
        <thead>
            <tr>
                <th>Exam Title</th>
                <th>Subject</th>
                <th>Total Marks</th>
                <th>Duration (minutes)</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="exam" items="${requestScope.exams}">
                <tr>
                    <td>${exam.exam_title}</td>
                    <td>${exam.subject}</td>
                    <td>${exam.total_marks}</td>
                    <td>${exam.duration}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
 <a href="StudentDashboard.jsp" class="back-button">Back Dashboard</a>

</body>
</html>