<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/updateProduct.css" />
    <style>
    * {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  background-color: #000;
  font-family: Arial, sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

/* White box */
.form-box {
  background-color: #fff;
  padding: 30px 40px;
  border-radius: 10px;
  width: 400px;
  text-align: center;
  box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
  color: #000;
}

h2 {
  margin-bottom: 20px;
}

label {
  display: block;
  margin: 10px 0 5px;
  text-align: left;
}

input[type="number"],
input[type="submit"] {
  width: 100%;
  padding: 10px;
  margin-top: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 14px;
}

input[type="submit"] {
  background-color: #000;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
  background-color: #333;
}
</style>
</head>
<body>
<div class="container">
    <div class="form-section">
        <h2>Update Product</h2>
        <!-- Form to load product -->
        <form action="UpdateProductServlet" method="get">
            <label for="productId">Enter Product ID:</label>
            <input type="number" id="productId" name="productId" required>
            <input type="submit" value="Load Product">
        </form>

        <hr>

        <!-- If product is loaded, show editable form -->
        <c:if test="${not empty product}">
            <form action="UpdateProductServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="productId" value="${product.productId}" />

                <label for="productName">Product Name:</label>
                <input type="text" id="productName" name="productName" value="${product.productName}" required />

                <label for="size">Size:</label>
                <input type="text" id="size" name="size" value="${product.size}" required />

                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" value="${product.quantity}" required />

                <label for="image">Image:</label>
                <input type="file" id="image" name="image" accept="image/*" />

                <label for="description">Description:</label>
                <input type="text" id="description" name="description" value="${product.description}" required />

                <c:choose>
                    <c:when test="${not empty product.image}">
                        <small>Current Image: ${product.image}</small><br>
                        <img src="${pageContext.request.contextPath}/Assets/${product.image}" alt="Product Image" style="max-width: 200px;" /><br>
                    </c:when>
                    <c:otherwise>
                        <small>Current Image: None</small><br>
                    </c:otherwise>
                </c:choose>

                <label for="price">Price:</label>
                <input type="number" id="price" name="price" value="${product.price}" required />

                <input type="submit" value="Update Product" />
            </form>
        </c:if>

        <!-- Optional message -->
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>
    </div>
</div>
</body>
</html>
