<%-- 
    Document   : readList
    Created on : Mar 14, 2025, 2:37:49 PM
    Author     : vomin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category List</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
            }

            h1 {
                color: #333;
                margin: 20px 0;
            }

            table {
                width: 80%;
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
        </style>
    </head>
    <body>
        <h1>Category List</h1>
        
        <c:if test="${not empty sessionScope.res}">
            <table>
                <thead>
                    <tr>
                        <th>Category ID</th>
                        <th>Category Name</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" items="${sessionScope.res}">
                        <tr>
                            <td>${i.category_id}</td>
                            <td>${i.category_name}</td>
                            <td>${i.description}</td>
                        </tr>    
                    </c:forEach>    
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty sessionScope.res}">
            <div class="message">No categories found.</div>
        </c:if>
    </body>
</html>