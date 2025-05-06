<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register Page</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css" />
</head>
<body>
<form action="RegisterServlet" method="post">
  <div class="container">
    <div class="left-box">
      <img id="Image" src="${pageContext.request.contextPath}/resources/images/system/haven logo/haven.png" alt="Logo">
      <h2>REGISTER</h2>

      <label for="User_Name">Name:</label>
      <input type="text" id="User_Name" name="userName" placeholder="Enter your Full Name" required/>

      <label for="Address">Address:</label>
      <input type="text" id="Address" name="address" placeholder="Enter your Address" required/>

      <label for="Phone_Number">Phone Number:</label>
      <input type="tel" id="Phone_Number" name="phoneNumber" placeholder="Enter your Phone Number" required/>

      <label for="Email">Email:</label>
      <input type="email" id="Email" name="email" placeholder="Enter your Email" required/>

      <label for="Password">Password:</label>
      <input type="password" id="Password" name="password" placeholder="Enter password" required/>

      <label for="Confirm_Password">Confirm Password:</label>
      <input type="password" id="Confirm_Password" name="confirmPassword" placeholder="Re-enter password" required/>

      <button type="submit">Submit</button>
      
      <div class="login">
                    <p>Already have an account? <br><a href="login.jsp">Login here</a></p>
                </div>
    </div>

    <div class="right-box">
      <img src="${pageContext.request.contextPath}/resources/images/system/loginregister/doit.jpeg" class="sneaker" alt="Sneaker Image"/>
      <div class="welcome-text">WELCOME</div>
    </div>
  </div>
</form>
</body>
</html>
