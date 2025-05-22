<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
    <c:when test="${empty sessionScope.userId or (sessionScope.role != 'admin' and sessionScope.role != 'customer')}">
        <c:redirect url="login.jsp?error=Please log in to view products"/>
    </c:when>
    <c:otherwise>
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>Product Gallery</title>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/displayProduct.css" />
            <style>
                .search-container {
                    text-align: center;
                    margin: 20px 0;
                }
                .search-container input[type="text"] {
                    padding: 10px;
                    width: 300px;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    font-size: 16px;
                }
                .search-container button {
                    padding: 10px 20px;
                    background-color: #000;
                    color: white;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    font-size: 16px;
                    margin-left: 10px;
                }
                .search-container button:hover {
                    background-color: #333;
                }
                .error {
                    color: red;
                    text-align: center;
                    margin: 10px 0;
                }
                .no-image {
                    color: #888;
                    text-align: center;
                    font-style: italic;
                    margin: 10px 0;
                }
                .product-image img {
                    max-width: 100%;
                    height: auto;
                    display: block;
                }
            </style>
        </head>
        <body>
            <jsp:include page="header.jsp" />

            <h2>Product Gallery</h2>

            <div class="search-container">
                <form action="ProductSearchServlet" method="post">
                    <input type="text" name="searchTerm" placeholder="Search products by name..." value="${fn:escapeXml(param.searchTerm)}" />
                    <button type="submit">Search</button>
                </form>
            </div>

            <c:if test="${not empty error}">
                <p class="error">${fn:escapeXml(error)}</p>
            </c:if>

            <div class="card-container">
                <c:choose>
                    <c:when test="${empty products}">
                        <p class="no-image">No products found.</p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="product" items="${products}">
                            <div class="product-card">
                                <div class="product-image">
                                    <c:choose>
                                        <c:when test="${not empty product.image}">
                                            <c:choose>
                                                <c:when test="${fn:startsWith(product.image, 'http')}">
                                                    <a href="${pageContext.request.contextPath}/ProductDescription?productId=${product.productId}">
                                                        <img src="${fn:escapeXml(product.image)}" alt="${fn:escapeXml(product.productName)}" class="product-image" />
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="${pageContext.request.contextPath}/ProductDescription?productId=${product.productId}">
                                                        <img src="${pageContext.request.contextPath}/Assets/${fn:escapeXml(product.image)}" alt="${fn:escapeXml(product.productName)}" class="product-image" />
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <p class="no-image">No image available</p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <h3>${fn:escapeXml(product.productName)}</h3>
                                <p>Size: ${fn:escapeXml(product.size)}</p>
                                <p>Price: ${product.price}</p>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <jsp:include page="footer.jsp" />
        </body>
        </html>
    </c:otherwise>
</c:choose>