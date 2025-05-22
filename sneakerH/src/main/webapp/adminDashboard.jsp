<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard</title>
  <style>
  body {
  margin: 0;
  font-family: Arial, sans-serif;
  background: white;
}

.container {
  display: flex;
  height: 100vh;
}

.sidebar {
  width: 200px;
  background: black;
  padding: 20px;
  font-weight: bold;
  color: white;
}

.sidebar h2 {
  font-size: 25px;
  margin-bottom: 20px;
  color: white;
}

.sidebar ul {
  list-style: none;
  padding: 0;
}

.sidebar li {
  margin: 50px 0;
  font-size: 25px;
  color: white;
}

.main {
  flex: 1;
  background: url('resources/images/system/addUpdateRemove/dashboard_background.jpg'); 
  display: flex;
  justify-content: center;
  align-items: center;
}

.box {
  background: black;
  color: white;
  border-radius: 20px;
  padding: 30px;
  width: 450px;
  text-align: center;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.box h3 {
  margin: 10px 0;
  letter-spacing: 2px;
  color: white;
}

.box p {
  margin: 8px 0;
  color: white;
}

hr {
  border: none;
  border-top: 3px dashed white;
  margin: 20px 0;
}
  
  </style>
</head>
<body>

	<jsp:include page="header.jsp" />
	
  <div class="container">
    <div class="sidebar">
      <h2><b>DASHBOARD</b></h2>
      <ul>
		  <li><a href="${pageContext.request.contextPath}/ProductDisplayServlet" style="color: white;">PRODUCTS</a></li>
		  <hr>
		  <li><a href="${pageContext.request.contextPath}/addProduct.jsp" style="color: white;">ADD PRODUCTS</a></li>
		  <hr>
		  <li><a href="${pageContext.request.contextPath}/deleteProduct.jsp" style="color: white;">REMOVE PRODUCT</a></li>
		  <hr>
		  <li><a href="${pageContext.request.contextPath}/updateProduct.jsp" style="color: white;">UPDATE PRODUCT</a></li>
	  </ul>


    </div>
    <div class="main">
      <div class="box">
        <h3>CURRENT STOCK</h3>
        <p>IN STOCK: 4758</p>
        <p>OUT OF STOCK: 2358</p>
        <hr>
        <h3>CURRENT ORDERS</h3>
        <p>ORDERS: 302</p>
        <p>PENDING ORDERS: 158</p>
        <p>IN PROCESS ORDERS: 49</p>
        <p>COMPLETED ORDERS: 95</p>
      </div>
    </div>
  </div>
</body>
</html>
