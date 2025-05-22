<!DOCTYPE html>
<html>
<head>
    <title>Sneaker Haven Header</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
    <header class="header">

        <!-- Brand logo -->
        <div class="logo">
            <img src="${pageContext.request.contextPath}/resources/images/system/haven logo/haven.png" alt="Sneaker Haven logo">
        </div>

        <div class="header-right">
            <!-- Icons -->
            <div class="icons">
                <a href="Home.jsp" target="_blank" style="color: black; text-decoration: none;">
				        <i class="fa-solid fa-house"></i>
			   </a>
			   <a href="ProfileServlet" target="_blank" style="color: black; text-decoration: none;">
				        <i class="fa-solid fa-user"></i>
			   </a>
			   <a href="cart.jsp" target="_blank" style="color: black; text-decoration: none;">
				        <i class="fa-solid fa-cart-shopping"></i>
			   </a>
            </div>
        </div>

    </header>
    <hr>
</body>
</html>
