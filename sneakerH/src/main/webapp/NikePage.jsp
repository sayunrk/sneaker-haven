<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Nike Shoes</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/NikePage.css" />
</head>
<body> 

	<jsp:include page="header.jsp" />
	
    <video loop autoplay muted>
      <source src="nike product.mp4" type="video/mp4" />
    </video>
  <div class="container">
    <div class="card">
      <img src="air force.jpg" alt="Nike air force">
      <h3>Air Force 1</h3>
      <p>Shoes</p>
      <p>1 Color</p>
      <p class="price">Rs. 32,000</p>
    </div>
    <div class="card">
      
      <img src="nike blazer.jpg" alt="Nike Blazer">
      <h3>Nike Blazer</h3>
      <p>Shoes</p>
      <p>5 Color</p>
      <p class="price">Rs. 33,000</p>
    </div>
    <div class="card">
      <img src="Air Jordan 1 High OG Rare Air.jpg" alt="Air Jordan 1 High OG Rare Air">
      <h3>Air Jordan 1 High OG "Rare Air"</h3>
      <p>Men's Shoes</p>
      <p>1 Color</p>
      <p class="price">Rs. 1,29,990</p>
    </div>
    <div class="card">
      <img src="nike dunk.jpg" alt="nike dunk">
      <h3>Nike Dunk Low Retro</h3>
      <p>Men's Shoes</p>
      <p>1 Color</p>
      <p class="price">Rs. 40,990</p>
    </div>
  </div>
  
  <div class="container">
    <div class="card">
      <img src="Nike Vomero 18.png" alt="Nike Vomero 18">
      <h3>Nike Vomero 18</h3>
      <p>Women's Shoes</p>
      <p>3 Color</p>
      <p class="price">Rs. 22,340</p>
    </div>
    <div class="card">
      
      <img src="StarRunner.png" alt="Nike Blazer">
      <h3>Nike Star Runner</h3>
      <p>Unisex Shoes</p>
      <p>4 Color</p>
      <p class="price">Rs. 15,000</p>
    </div>
    <div class="card">
      <img src="Maxfly.png" alt="Maxfly">
      <h3>Nike Air Maxfly 2</h3>
      <p>Men's Shoes</p>
      <p>1 Color</p>
      <p class="price">Rs. 50,990</p>
    </div>
    <div class="card">
      <img src="Nike Zoom Vomero 5.jpg" alt="nike dunk">
      <h3>Nike Zoom Vomero 5</h3>
      <p>Unisex Shoes</p>
      <p>3 Color</p>
      <p class="price">Rs. 65,990</p>
    </div>
  </div>
  
  <jsp:include page="footer.jsp" />
  
</body>
</html>