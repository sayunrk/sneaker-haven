<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:choose>
    <c:when test="${sessionScope.role == null or sessionScope.role != 'admin'}">
        <c:redirect url="login.jsp?error=Unauthorized access" />
    </c:when>
    <c:otherwise>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <title>Delete Product</title>
            <link rel="stylesheet" type="text/css" href="remove.css" />
                <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/deleteProduct.css" />
        </head>
        <body>
            <div class="container">
                <div class="form-section">
                    <img id="Image" src="${pageContext.request.contextPath}/resources/images/system/haven logo/haven.png" alt="Logo">
                    <h2>DELETE PRODUCT</h2>
                    <form action="DeleteProduct" method="post">
                        <label for="id">Product ID to Delete:</label>
                        <input type="number" id="id" name="productId" placeholder="Enter Product ID" required />
                        <button type="submit">Delete</button>
                        
                    </form>

                    <c:if test="${not empty requestScope.message}">
                        <p class="message">${requestScope.message}</p>
                    </c:if>
                </div>

                <div class="right-box">
      				<img src="${pageContext.request.contextPath}/resources/images/system/addUpdateRemove/removecon.jpg" class="sneaker" alt="Sneaker Image"/>
    			</div>
            </div>
        </body>
        </html>
    </c:otherwise>
</c:choose>