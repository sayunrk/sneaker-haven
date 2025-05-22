<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            background: #000;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            display: flex;
            background-color: #111;
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.6);
            max-width: 950px;
            width: 90%;
        }
        .left-box {
            background: #fff;
            padding: 60px;
            width: 45%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        #Image {
            width: 130px;
            height: auto;
            margin-bottom: 20px;
        }
        .left-box h2 {
            letter-spacing: 6px;
            margin-bottom: 25px;
        }
        form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            font-size: 14px;
            font-weight: 600;
            align-self: flex-start;
            margin-top: 10px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        button {
            width: 60%;
            padding: 12px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 15px;
        }
        .register {
            margin-top: 20px;
            text-align: center;
        }
        .register a {
            color: blue;
            text-decoration: underline;
        }
        .right-box {
            width: 55%;
            background-color: grey;
            color: white;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }
        #mainImage {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.9;
        }
        .welcome-text {
            position: absolute;
            color: white;
            font-size: 28px;
            letter-spacing: 6px;
            text-align: center;
            font-weight: bold;
            z-index: 1;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }
        .error {
            color: red;
            margin-top: 10px;
            text-align: center;
        }
        .success {
            color: green;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-box">
            <img id="Image" src="${pageContext.request.contextPath}/resources/images/system/haven logo/haven.png" alt="Logo">
            <h2>LOGIN</h2>
            <form action="LoginServlet" method="post">
                <label for="userName">Username:</label>
                <input type="text" id="userName" name="userName" placeholder="Enter Username" value="${fn:escapeXml(param.userName)}" required>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter Password" required>
                <button type="submit">Login</button>
            </form>
            <div class="register">
                <p>Don't have an account? <a href="register.jsp">Register here</a></p>
            </div>
            <c:if test="${not empty param.message}">
                <p class="success">${fn:escapeXml(param.message)}</p>
            </c:if>
            <c:if test="${not empty error}">
                <p class="error">${fn:escapeXml(error)}</p>
            </c:if>
        </div>
        <div class="right-box">
            <img id="mainImage" src="${pageContext.request.contextPath}/resources/images/system/loginregister/doit.jpeg" alt="Sneaker Image">
            <div class="welcome-text">WELCOME BACK</div>
        </div>
    </div>
</body>
</html>