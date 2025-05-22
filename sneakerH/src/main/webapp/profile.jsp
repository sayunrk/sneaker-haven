<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #000;
            color: white;
            min-height: 100vh;
        }

        .container {
            background-color: #111;
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.6);
            width: calc(100% - 80px); /* full width with some padding */
            margin: 40px auto;
            padding: 40px;
            color: white;
        }

        h2 {
            letter-spacing: 4px;
            margin-bottom: 20px;
            text-align: center;
        }

        .profile-info, .profile-form {
            margin: 20px 0;
        }

        .profile-info p, .profile-form label {
            font-size: 16px;
            margin: 10px 0;
        }

        .profile-form input, .profile-form button {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        img.profile-image {
            max-width: 200px;
            border-radius: 10px;
            margin: 10px 0;
        }

        .profile-form button,
        .logout-button,
        .admin-button {
            padding: 12px 24px;
            background: linear-gradient(135deg, #1db954, #1ed760);
            color: white;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(30, 215, 96, 0.3);
            margin-top: 10px;
            display: block;
            width: fit-content;
        }

        .profile-form button:hover,
        .logout-button:hover,
        .admin-button:hover {
            background: linear-gradient(135deg, #17a84b, #1db954);
            box-shadow: 0 6px 18px rgba(30, 215, 96, 0.5);
            transform: translateY(-2px);
        }

        .error, .message {
            text-align: center;
            margin: 10px 0;
        }

        .error { color: red; }
        .message { color: green; }

        .button-group {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <c:choose>
        <c:when test="${empty sessionScope.userId}">
            <c:redirect url="login.jsp">
                <c:param name="error" value="Please log in to view your profile"/>
            </c:redirect>
        </c:when>
        <c:when test="${sessionScope.role != 'admin' and sessionScope.role != 'customer'}">
            <c:redirect url="login.jsp">
                <c:param name="error" value="Unauthorized access"/>
            </c:redirect>
        </c:when>
    </c:choose>

    <div class="container">
        <h2>${sessionScope.role == 'admin' ? 'Admin' : 'Customer'} Profile</h2>

        <c:if test="${empty requestScope.user}">
            <c:redirect url="login.jsp">
                <c:param name="error" value="User not found"/>
            </c:redirect>
        </c:if>

        <div class="profile-info">
            <p><strong>User name:</strong> ${user.userName}</p>
            <p><strong>Address:</strong> ${user.address}</p>
            <p><strong>Phone Number:</strong> ${user.phoneNumber}</p>
            <p><strong>Email:</strong> ${user.email}</p>
            <p><strong>Role:</strong> ${user.role == 'admin' ? 'Admin' : 'Customer'}</p>
            <c:choose>
                <c:when test="${not empty user.image}">
                    <p><strong>Profile Image:</strong></p>
                    <img class="profile-image" src="${pageContext.request.contextPath}/Assets/${user.image}" alt="Profile Image">
                </c:when>
                <c:otherwise>
                    <p><strong>Profile Image:</strong> None</p>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="profile-form">
            <form action="ProfileServlet" method="post" enctype="multipart/form-data">
                <label for="userName">User name:</label>
                <input type="text" id="userName" name="userName" value="${user.userName}" required>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="${user.address}" required>
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" required>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${user.email}" required>
                <label for="image">Profile Image:</label>
                <input type="file" id="image" name="image" accept="image/*">
                <button type="submit">Update Profile</button>
            </form>

            <div class="button-group">
                <form action="ProfileServlet" method="post">
                    <input type="hidden" name="action" value="logout">
                    <button type="submit" class="logout-button">Logout</button>
                </form>

                <c:if test="${sessionScope.role == 'admin'}">
                    <form action="adminDashboard.jsp" method="get">
                        <button type="submit" class="admin-button">Go to Admin Dashboard</button>
                    </form>
                </c:if>
            </div>
        </div>

        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <c:if test="${not empty message}">
            <p class="message">${message}</p>
        </c:if>
    </div>
</body>
</html>
