<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Home.css" />
    <meta name="description" content="This is the home page of our sneaker haven website" />
    <meta name="authors" content="Unison Raj Tuladhar, Sayun Rajkarnikar, Ajoob Sagar Kansakar, Subham Khoju Shrestha, Mayank Bhatta" />
    <meta name="keywords" content="Sneakers" />
    <meta name="contact" content="contact@sneakerhaven.com" />
    <title>Sneaker Haven | Home</title>
  </head>
  <body>
    <jsp:include page="header.jsp" />

    <!-- Hero Section -->
    <section class="video-section">
      <video autoplay muted loop>
        <source src="${pageContext.request.contextPath}/resources/images/system/home page/Nike.mp4" type="video/mp4" />
      </video>
      <div class="desc">
        <div class="desc-inner">
          <h1>Sneaker Haven</h1>
          <p>
            Step into style, comfort, and innovation. Discover your perfect pair at Sneaker Haven —
            where every sneaker tells a story.
          </p>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/ProductSearchServlet">Shop</a>
        </div>
      </div>
    </section>

    <!-- Brands Section -->
    <section class="brand-grid">
      <div class="brand-card">
        <img src="${pageContext.request.contextPath}/resources/images/system/home page/converse.jpg" alt="Converse" />
        <div class="brand-card-footer">
          <a href="${pageContext.request.contextPath}/ProductSearchServlet">
            <button>Shop Converse</button>
          </a>
        </div>
      </div>
      <div class="brand-card">
        <img src="${pageContext.request.contextPath}/resources/images/system/home page/nike.jpg" alt="Nike" />
        <div class="brand-card-footer">
          <a href="${pageContext.request.contextPath}/ProductSearchServlet">
            <button>Shop Nike</button>
          </a>
        </div>
      </div>
      <div class="brand-card">
        <img src="${pageContext.request.contextPath}/resources/images/system/home page/new balance.jpg" alt="New Balance" />
        <div class="brand-card-footer">
          <a href="${pageContext.request.contextPath}/ProductSearchServlet">
            <button>Shop New Balance</button>
          </a>
        </div>
      </div>
    </section>

    <!-- Product Section -->
    <section class="product">
      <div class="container">
        <div class="card">
          <a href="${pageContext.request.contextPath}/ProductDescription?productId=1">
            <img src="${pageContext.request.contextPath}/resources/images/system/home page/air_force.jpg" alt="Air Force 1">
          </a>
          <h3>Air Force 1</h3>
          <p>Men's Shoes</p>
          <p>1 Color</p>
          <p class="price">Rs.21,000</p>
        </div>
        <div class="card">
          <a href="${pageContext.request.contextPath}/ProductDescription?productId=2">
            <img src="${pageContext.request.contextPath}/resources/images/system/home page/nike_blazer.jpg" alt="Nike Blazer">
          </a>
          <h3>Nike Blazer</h3>
          <p>Unisex Shoes</p>
          <p>1 Color</p>
          <p class="price">Rs.25,000</p>
        </div>
        <div class="card">
          <a href="${pageContext.request.contextPath}/ProductDescription?productId=4">
            <img src="${pageContext.request.contextPath}/resources/images/system/home page/converse 1.jpg" alt="Converse High">
          </a>
          <h3>Converse High</h3>
          <p>Men's Shoes</p>
          <p>1 Color</p>
          <p class="price">Rs.12,000</p>
        </div>
        <div class="card">
          <a href="${pageContext.request.contextPath}/ProductDescription?productId=7">
            <img src="${pageContext.request.contextPath}/resources/images/system/home page/air_max.jpg" alt="Travis Scott x Nike Air Jordan 1 Low Reverse Mocha">
          </a>
          <h3>Nike Air Max 270</h3>
          <p>Men's Shoes</p>
          <p>1 Color</p>
          <p class="price">Rs.27,000</p>
        </div>
      </div>
    </section>

    <jsp:include page="footer.jsp" />
  </body>
</html>