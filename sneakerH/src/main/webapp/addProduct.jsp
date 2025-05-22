<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:if test="${empty sessionScope.role || sessionScope.role ne 'admin'}">
    <c:redirect url="login.jsp">
        <c:param name="error" value="Unauthorized access"/>
    </c:redirect>
</c:if>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Add Product</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addProduct.css" />
</head>
<body>
<form action="addProduct" method="post" enctype="multipart/form-data">
  <div class="container">
    <div class="left-box">
      <img id="Image" src="${pageContext.request.contextPath}/resources/images/system/haven logo/haven.png" alt="Logo">
      <h2>ADD PRODUCT</h2>

      <label for="Product_Name">Product Name:</label>
      <input type="text" id="Product_Name" name="Product_Name" placeholder="Enter Product Name" required/>

      <label for="Size">Size:</label>
      <input type="text" id="Size" name="Size" placeholder="Enter Shoe Size" required/>

      <label for="Quantity">Quantity:</label>
      <input type="number" id="Quantity" name="Quantity" placeholder="Enter Quantity" required/>

      <label for="Image" style="display: block; font-weight: bold; margin-top: 15px; margin-bottom: 8px; font-family: Arial, sans-serif; font-size: 14px; color: #333;">
  		Upload Product Image:
	  </label>
	<input type="file" id="Image" name="Image" accept="image/*"
	  style="display: block; padding: 8px 12px; border: 1px solid #ccc; border-radius: 6px; background-color: #f9f9f9; font-family: Arial, sans-serif; font-size: 14px; color: #333; cursor: pointer; width: 100%; max-width: 350px; box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);" />
	

      <label for="Price">Price:</label>
      <input type="number" id="Price" name="Price" placeholder="Enter Shoe Price" required/>
      
      <label for="Description">Description:</label>
      <input type="text" id="Description" name="Description" placeholder="Description" required/>

      <button type="submit">Add Product</button>
      
    </div>

    <div class="right-box">
      <img src="${pageContext.request.contextPath}/resources/images/system/loginregister/doit.jpeg" class="sneaker" alt="Sneaker Image"/>
    </div>
  </div>
</form>

<c:if test="${not empty requestScope.error}">
  <p style="color: red;">${requestScope.error}</p>
</c:if>
</body>
</html>
