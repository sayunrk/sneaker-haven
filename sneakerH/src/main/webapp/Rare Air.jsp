<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Air Jordan 1 High OG "Rare Air"</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Rare Air.css" />
</head>
<body>

<jsp:include page="header.jsp" />

  <div class="popup" id="popup">Item added to cart!</div>

  <main class="product-page">
    <div class="product-image-gallery">
      <div class="thumbnail-column">
        <img src="${pageContext.request.contextPath}/resources/images/system/Rare Air1.webp" class="thumbnail" onclick="changeImage(this)">
        <img src="${pageContext.request.contextPath}/resources/images/system/Rare Air.png" class="thumbnail" onclick="changeImage(this)">
        <img src="${pageContext.request.contextPath}/resources/images/system/Rare Air2.png" class="thumbnail" onclick="changeImage(this)">
        <img src="${pageContext.request.contextPath}/resources/images/system/Rare Air3.png" class="thumbnail" onclick="changeImage(this)">
      </div>
      <div class="product-image">
        <img id="mainImage" src="${pageContext.request.contextPath}/resources/images/system/Rare Air1.webp" alt="Main Product">
      </div>
    </div>

    <div class="product-info">
      <h1 class="title">Air Jordan 1 High OG "Rare Air"</h1>
      <p class="description">
        Elevate your sneaker game with the "Air Jordan 1 High OG "Rare Air." Crafted with high-quality leather and subtle detailing, this release captures the spirit of the original while adding a modern, rare-edge appeal.
      </p>
      <div class="price">
        <span class="current-price">Rs.23,000.00</span>
        <span class="old-price">Rs.27,000.00</span>
      </div>

      <div class="btn-group">
        <button class="btn" onclick="showPopup()">Add to cart</button>
        <a href="cart.html" class="btn">Purchase</a>
      </div>

      <div class="dropdown">
        <label>Size:</label>
        <select>
          <option>Select Size</option>
          <option>36</option>
          <option>37</option>
          <option>38</option>
          <option>39</option>
          <option>40</option>
          <option>41</option>
          <option>42</option>
        </select>
      </div>

      <div class="color-picker">
        <label>Color:</label>
        <div class="color-box" style="background-color: whitesmoke;"></div>
        <div class="color-box" style="background-color: darkblue;"></div>
      </div>

      <div class="quantity">
        <label>Quantity:</label>
        <input type="number" value="1" min="1" />
      </div>

      <div class="policies">
        <details>
          <summary>RETURN & REFUND POLICY</summary>
          <p>Returns accepted within 7 days of delivery.</p>
        </details>
        <details>
          <summary>EXCHANGE POLICY</summary>
          <p>Exchanges allowed for size issues within 10 days.</p>
        </details>
        <details>
          <summary>SHIPPING POLICY</summary>
          <p>Free shipping on orders over Rs.3,000.</p>
        </details>
      </div>
    </div>
  </main>

  <script>
    function changeImage(thumbnail) {
      document.getElementById("mainImage").src = thumbnail.src;
    }

    function showPopup() {
      const popup = document.getElementById("popup");
      popup.style.display = "block";
      setTimeout(() => {
        popup.style.display = "none";
      }, 2000);
    }
  </script>
  
  <jsp:include page="footer.jsp" />

</body>
</html>