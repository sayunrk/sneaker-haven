<%@ page import="com.sneaker.models.Product, java.util.List" %>
<%@ page import="com.sneaker.servlets.ProductServlet, java.util.List" %>
<%@ page import="com.sneaker.controller.ProductController, java.util.List" %>
<html>
<head>
    <title>Sneaker Products</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <h2>Sneaker Product Inventory</h2>
    
    <table>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Size</th>
            <th>Quantity</th>
        </tr>
        
        <%
            @SuppressWarnings("unchecked")
            List<Product> products = (List<Product>) request.getAttribute("products");

            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
            <tr>
                <td><%= product.getProductId() %></td>
                <td><%= product.getProductName() %></td>
                <td><%= product.getSize() %></td>
                <td><%= product.getQuantity() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="4">No products found in inventory</td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>