<%-- 
    Document   : index.jsp
    Created on : Mar 12, 2025, 10:20:05 PM
    Author     : vomin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Quiz System</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #e0f7fa, #80deea); /* Gradient background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        header {
            background-color: #00796b; /* Dark green */
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 24px;
            font-weight: bold;
            position: fixed;
            top: 0;
            width: 100%;
        }

        footer {
            background-color: #00796b; /* Dark green */
            color: white;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
            font-size: 14px;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Take full height of the page */
        }

        .login-box {
            background-color: white;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 100%;
            max-width: 400px; /* Limit width of the login box */
            text-align: center;
            background-color: #ffffff;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-box h2 {
            margin-bottom: 20px;
            color: #00796b;
            font-size: 28px;
        }

        .login-box label {
            text-align: left;
            width: 100%;
            font-size: 16px;
            color: #00796b;
            display: block;
            margin-bottom: 5px;
        }

        .login-box input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #00796b;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .login-box input:focus {
            border-color: #004d40;
            outline: none;
        }

        .login-box button {
            background-color: #00796b;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .login-box button:hover {
            background-color: #004d40; /* Darken on hover */
        }

        .login-box .forgot-password {
            margin-top: 15px;
            font-size: 14px;
            color: #00796b;
            text-decoration: none;
            display: inline-block;
            transition: color 0.3s ease;
        }

        .login-box .forgot-password:hover {
            color: #004d40;
        }

        .login-box .register-link {
            margin-top: 20px;
            font-size: 14px;
            color: #00796b;
        }

        .login-box .register-link a {
            color: #004d40;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .login-box .register-link a:hover {
            color: #00796b;
        }
    </style>
</head>
<body>
    <header>
        Quiz System Login
    </header>

    <div class="login-container">
        <div class="login-box">
            <h2>Login</h2>
            <form action="LoginController" method="POST">
                <label for="username">Username:</label>
                <input type="text" id="username" name="user"  />

                <label for="password">Password:</label>
                <input type="password" id="password" name="pass"  />
                <button type="submit">Login</button>
            </form>
         
                 <c:if test="${not empty requestScope.error}">
                <div style="color: red;">
                    ${requestScope.error}
                </div>
            </c:if>
        </div>
    </div>
   
    <footer>
        &copy; 2025 Quiz System. All rights reserved.
    </footer>
</body>
</html>