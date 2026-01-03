<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<h2 class="page-title">My Wishlist</h2>
			<p style="color: #666; margin-bottom: 30px;">4 items saved</p>

			<!-- Wishlist Items -->
			<div class="wishlist-item">
				<img src="images/iPhone.webp" alt="iPhone 13 Pro" class="wishlist-img">
				<div class="wishlist-info">
					<h4 style="margin: 0 0 8px 0;">APPLE iPhone 13 Pro (128GB)</h4>
					<p style="color: #666; margin: 0 0 8px 0;">Used - Like New | Seller: Ahmad Faiz</p>
					<p class="price" style="margin: 0;">RM 5,000.00</p>
					<span class="label label-success" style="margin-top: 8px; display: inline-block;">Available</span>
				</div>
				<div class="wishlist-actions">
					<a href="cartDetails.html" class="btn btn-primary">
						<span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
					</a>
					<a href="productDetail.html" class="btn btn-default">View</a>
					<button class="btn btn-default" title="Remove from wishlist">
						<span class="glyphicon glyphicon-trash"></span>
					</button>
				</div>
			</div>

			<div class="wishlist-item">
				<img src="images/macbook.jpg" alt="MacBook Pro" class="wishlist-img">
				<div class="wishlist-info">
					<h4 style="margin: 0 0 8px 0;">MacBook Pro 14" (M1 Pro)</h4>
					<p style="color: #666; margin: 0 0 8px 0;">Like New | Seller: Sarah Lim</p>
					<p class="price" style="margin: 0;">RM 7,500.00</p>
					<span class="label label-success" style="margin-top: 8px; display: inline-block;">Available</span>
				</div>
				<div class="wishlist-actions">
					<a href="cartDetails.html" class="btn btn-primary">
						<span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
					</a>
					<a href="productDetail.html" class="btn btn-default">View</a>
					<button class="btn btn-default" title="Remove from wishlist">
						<span class="glyphicon glyphicon-trash"></span>
					</button>
				</div>
			</div>

			<div class="wishlist-item">
				<img src="images/speaker.jpg" alt="JBL Speaker" class="wishlist-img">
				<div class="wishlist-info">
					<h4 style="margin: 0 0 8px 0;">JBL Flip 5 Bluetooth Speaker</h4>
					<p style="color: #666; margin: 0 0 8px 0;">Good Condition | Seller: Ali Hassan</p>
					<p class="price" style="margin: 0;">RM 280.00</p>
					<span class="label label-success" style="margin-top: 8px; display: inline-block;">Available</span>
				</div>
				<div class="wishlist-actions">
					<a href="cartDetails.html" class="btn btn-primary">
						<span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
					</a>
					<a href="productDetail.html" class="btn btn-default">View</a>
					<button class="btn btn-default" title="Remove from wishlist">
						<span class="glyphicon glyphicon-trash"></span>
					</button>
				</div>
			</div>

			<div class="wishlist-item" style="opacity: 0.7;">
				<img src="images/calculator.png" alt="Calculator" class="wishlist-img">
				<div class="wishlist-info">
					<h4 style="margin: 0 0 8px 0;">Casio Scientific Calculator fx-570EX</h4>
					<p style="color: #666; margin: 0 0 8px 0;">Used - Good | Seller: Nurul Ain</p>
					<p class="price" style="margin: 0; text-decoration: line-through;">RM 85.00</p>
					<span class="label label-danger" style="margin-top: 8px; display: inline-block;">Sold</span>
				</div>
				<div class="wishlist-actions">
					<button class="btn btn-default" disabled>
						<span class="glyphicon glyphicon-shopping-cart"></span> Unavailable
					</button>
					<button class="btn btn-default" title="Remove from wishlist">
						<span class="glyphicon glyphicon-trash"></span>
					</button>
				</div>
			</div>

			<!-- Empty State (Hidden) -->
			<div class="text-center" style="padding: 60px 20px; display: none;">
				<span class="glyphicon glyphicon-heart-empty" style="font-size: 64px; color: #ddd;"></span>
				<h3 style="color: #666; margin-top: 20px;">Your wishlist is empty</h3>
				<p style="color: #999;">Save items you love by clicking the heart icon</p>
				<a href="userHome.html" class="btn btn-primary" style="margin-top: 20px;">Browse Products</a>
			</div>

		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>