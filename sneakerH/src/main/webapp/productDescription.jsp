<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
    <c:when test="${empty sessionScope.userId or (sessionScope.role != 'admin' and sessionScope.role != 'customer')}">
        <c:redirect url="login.jsp?error=Please log in to view product details"/>
    </c:when>
    <c:otherwise>
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>Product Details</title>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/displayProduct.css" />
            <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 1000px;
        margin: 40px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
    }

    .product-details {
        display: flex;
        flex-wrap: wrap;
        gap: 30px;
        align-items: flex-start;
    }

    .product-image {
        flex: 1;
        min-width: 250px;
    }

    .product-image img {
        width: 100%;
        max-width: 300px;
        border-radius: 10px;
        border: 1px solid #ccc;
    }

    .no-image {
        color: #999;
        font-style: italic;
    }

    .details-text {
        flex: 2;
        min-width: 300px;
    }

    .details-text p {
        margin: 10px 0;
        font-size: 16px;
        color: #444;
        line-height: 1.5;
        word-wrap: break-word;
        white-space: pre-wrap; /* handles long descriptions and newlines */
    }

    .error {
        color: red;
        text-align: center;
        margin-bottom: 20px;
    }

    .quantity-input {
        padding: 8px;
        width: 70px;
        margin-right: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    form {
        margin-top: 20px;
    }

    .back-link, .cart-link, .add-to-cart {
    display: inline-block;
    margin-top: 20px;
    margin-right: 10px;
    padding: 10px 20px;
    background-color: #000; 
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-size: 14px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
	}
	
	.back-link:hover, .cart-link:hover, .add-to-cart:hover {
	    background-color: #333; 
	}


    @media (max-width: 768px) {
        .product-details {
            flex-direction: column;
            align-items: center;
        }

        .product-image, .details-text {
            width: 100%;
        }

        .product-image img {
            max-width: 100%;
        }
    }
</style>

        </head>
        <body>
            <jsp:include page="header.jsp" />

            <div class="container">
                <h2>Product Details</h2>
                <c:if test="${not empty error}">
                    <p class="error">${fn:escapeXml(error)}</p>
                </c:if>
                <c:choose>
                    <c:when test="${empty product}">
                        <p class="error">Product not found.</p>
                    </c:when>
                    <c:otherwise>
                        <div class="product-details">
                            <div class="product-image">
                                <c:choose>
                                    <c:when test="${not empty product.image}">
                                        <c:choose>
                                            <c:when test="${fn:startsWith(product.image, 'http')}">
                                                <img src="${fn:escapeXml(product.image)}" alt="${fn:escapeXml(product.productName)}" />
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/Assets/${fn:escapeXml(product.image)}" alt="${fn:escapeXml(product.productName)}" />
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="no-image">No image available</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="details-text">
                                <p><strong>Name:</strong> ${fn:escapeXml(product.productName)}</p>
                                <p><strong>Size:</strong> ${fn:escapeXml(product.size)}</p>
                                <p><strong>Quantity Available:</strong> ${product.quantity}</p>
                                <p><strong>Price:</strong> ${product.price}</p>
                                <p><strong>Description:</strong> ${product.description}</p>
                                <form action="CartServlet" method="post">
                                    <input type="hidden" name="productId" value="${product.productId}">
                                    <input type="number" name="quantity" class="quantity-input" min="1" max="${product.quantity}" value="1" required>
                                    <button type="submit" class="add-to-cart">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <a href="ProductSearchServlet" class="back-link">Back to Gallery</a>
                <a href="CartServlet" class="cart-link">View Cart</a>
            </div>

            <jsp:include page="footer.jsp" />
        </body>
        </html>
    </c:otherwise>
</c:choose>