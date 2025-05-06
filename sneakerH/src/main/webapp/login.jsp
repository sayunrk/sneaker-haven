<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
</head>
<body>
    <form action="LoginServlet" method="post">
        <div class="container">
            <div class="left-box">
                <img id="Image" src="${pageContext.request.contextPath}/resources/images/system/haven logo/haven.png" alt="Logo">
                <h2>Login</h2>

                <label for="User_Name">User name:</label>
                <input type="text" id="User_Name" name="userName" placeholder="Enter your Full Name" required/>

                <label for="Password">Password:</label>
                <input type="password" id="Password" name="password" placeholder="Enter password" required/>

                <button type="submit">Login</button>

                <div class="register">
                    <p>Don't have an account? <br><a href="register.jsp">Register here</a></p>
                </div>
            </div>

            <div class="right-box">
                
                <div class="welcome-text">WELCOME<br>BACK</div>
            </div>
        </div>
    </form>
</body>
</html>
