<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
    <c:when test="${empty sessionScope.userId or (sessionScope.role != 'admin' and sessionScope.role != 'customer')}">
        <c:redirect url="login.jsp?error=Please log in to view your cart"/>
    </c:when>
    <c:otherwise>
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>Shopping Cart</title>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart.css" />
            <style>
                * {
                    box-sizing: border-box;
                }
                body {
                    margin: 0;
                    font-family: Arial, sans-serif;
                    background-color: #000;
                    color: white;
                }
                .wrapper {
                    display: flex;
                    height: 100vh;
                }
                .cart-section {
                    flex: 1;
                    padding: 40px;
                    background-color: #111;
                    overflow-y: auto;
                }
                .image-section {
                    flex: 1;
                    background: url('resources/images/system/addUpdateRemove/cart.jpg'); 
                    background-size: cover;
                    background-position: center;
                    border-left: 3px solid #333;
                }
                .container {
                    max-width: 900px;
                    margin: auto;
                }
                h2 {
                    text-align: center;
                    margin-bottom: 30px;
                }
                .cart-table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-bottom: 20px;
                    font-size: 18px;
                }
                .cart-table th, .cart-table td {
                    padding: 15px;
                    border: 1px solid #444;
                    text-align: left;
                }
                .cart-table th {
                    background-color: #222;
                }
                .cart-table td {
                    background-color: #111;
                }
                .total {
                    text-align: right;
                    font-size: 20px;
                    margin-top: 10px;
                }
                .error {
                    color: red;
                    text-align: center;
                    margin: 10px 0;
                }
                .back-link {
                    display: inline-block;
                    margin-top: 20px;
                    padding: 12px 24px;
                    background-color: #28a745;
                    color: white;
                    text-decoration: none;
                    border: none;
                    border-radius: 5px;
                    font-weight: bold;
                    transition: background-color 0.3s ease;
                }
                .back-link:hover {
                    background-color: #218838;
                }
            </style>
        </head>
        <body>
            <jsp:include page="header.jsp" />

            <div class="wrapper">
                <div class="cart-section">
                    <div class="container">
                        <h2>Shopping Cart</h2>

                        <c:if test="${not empty error}">
                            <p class="error">${fn:escapeXml(error)}</p>
                        </c:if>

                        <c:choose>
                            <c:when test="${empty sessionScope.cart}">
                                <p>Your cart is empty.</p>
                            </c:when>
                            <c:otherwise>
                                <table class="cart-table">
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Size</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                    <c:forEach var="item" items="${sessionScope.cart}">
                                        <tr>
                                            <td>${fn:escapeXml(item.productName)}</td>
                                            <td>${fn:escapeXml(item.size)}</td>
                                            <td>${item.price}</td>
                                            <td>${item.quantity}</td>
                                            <td>${item.totalPrice}</td>
                                        </tr>
                                    </c:forEach>
                                </table>

                                <div class="total">
                                    <strong>Total Price:</strong> 
                                    <c:set var="total" value="0"/>
                                    <c:forEach var="item" items="${sessionScope.cart}">
                                        <c:set var="total" value="${total + item.totalPrice}"/>
                                    </c:forEach>
                                    ${total}
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <a href="ProductSearchServlet" class="back-link">Continue Shopping</a>
                        
                        <a href="thankyou.jsp" class="back-link">Checkout</a>
                    </div>
                </div>
                <div class="image-section"></div>
            </div>

            <jsp:include page="footer.jsp" />
        </body>
        </html>
    </c:otherwise>
</c:choose>
