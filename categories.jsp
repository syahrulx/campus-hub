<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Hero Banner -->
	<div class="container-fluid text-center">
		<h2>Browse Categories</h2>
		<h6>Find what you need from fellow students</h6>
		<form class="form-inline" action="searchResults.html" method="get">
			<div class="input-group">
				<input type="text" class="form-control" name="search" placeholder="Search for items...">
				<div class="input-group-btn">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Main Content -->
	<div class="main-content">
		<div class="container">
			
			<h3 class="page-title">All Categories</h3>

			<div class="category-grid">
				<!-- Textbooks & Notes -->
				<a href="searchResults.html?category=textbooks" class="category-card">
					<div class="category-icon">
						<span class="glyphicon glyphicon-book"></span>
					</div>
					<p class="category-name">Textbooks & Notes</p>
					<p class="category-count">156 items</p>
				</a>

				<!-- Electronics -->
				<a href="searchResults.html?category=electronics" class="category-card">
					<div class="category-icon">
						<span class="glyphicon glyphicon-phone"></span>
					</div>
					<p class="category-name">Electronics</p>
					<p class="category-count">89 items</p>
				</a>

				<!-- Clothing & Fashion -->
				<a href="searchResults.html?category=clothing" class="category-card">
					<div class="category-icon">
						<span class="glyphicon glyphicon-tags"></span>
					</div>
					<p class="category-name">Clothing & Fashion</p>
					<p class="category-count">234 items</p>
				</a>

				<!-- Dorm Items -->
				<a href="searchResults.html?category=dorm" class="category-card">
					<div class="category-icon">
						<span class="glyphicon glyphicon-home"></span>
					</div>
					<p class="category-name">Dorm Items</p>
					<p class="category-count">78 items</p>
				</a>

				<!-- Entertainment -->
				<a href="searchResults.html?category=entertainment" class="category-card">
					<div class="category-icon">
						<span class="glyphicon glyphicon-headphones"></span>
					</div>
					<p class="category-name">Entertainment</p>
					<p class="category-count">45 items</p>
				</a>

				<!-- Transportation -->
				<a href="searchResults.html?category=transport" class="category-card">
					<div class="category-icon">
						<span class="glyphicon glyphicon-road"></span>
					</div>
					<p class="category-name">Transportation</p>
					<p class="category-count">23 items</p>
				</a>

				<!-- Stationery -->
				<a href="searchResults.html?category=stationery" class="category-card">
					<div class="category-icon">
						<span class="glyphicon glyphicon-pencil"></span>
					</div>
					<p class="category-name">Stationery</p>
					<p class="category-count">112 items</p>
				</a>

				<!-- Gaming -->
				<a href="searchResults.html?category=gaming" class="category-card">
					<div class="category-icon">
						<span class="glyphicon glyphicon-tower"></span>
					</div>
					<p class="category-name">Gaming</p>
					<p class="category-count">67 items</p>
				</a>
			</div>

			<!-- Popular in Campus -->
			<div style="margin-top: 40px;">
				<h3 class="page-title">Popular This Week</h3>
				<div class="row">
					<div class="col-sm-6 col-md-3">
						<div class="thumbnail">
							<img src="images/textbook.png" alt="Textbook">
							<div class="caption">
								<p class="productname">Calculus Textbook</p>
								<p class="productinfo">James Stewart, 8th Edition</p>
								<p class="price">RM 45.00</p>
								<a href="productDetail.html" class="btn btn-primary btn-block">View Details</a>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="thumbnail">
							<img src="images/iPhone.webp" alt="iPhone">
							<div class="caption">
								<p class="productname">iPhone 13 Pro</p>
								<p class="productinfo">128GB, Like New</p>
								<p class="price">RM 5,000.00</p>
								<a href="productDetail.html" class="btn btn-primary btn-block">View Details</a>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="thumbnail">
							<img src="images/macbook.jpg" alt="MacBook">
							<div class="caption">
								<p class="productname">MacBook Pro 14"</p>
								<p class="productinfo">M1 Pro, 16GB RAM</p>
								<p class="price">RM 7,500.00</p>
								<a href="productDetail.html" class="btn btn-primary btn-block">View Details</a>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="thumbnail">
							<img src="images/speaker.jpg" alt="Speaker">
							<div class="caption">
								<p class="productname">JBL Flip 5</p>
								<p class="productinfo">Bluetooth Speaker</p>
								<p class="price">RM 280.00</p>
								<a href="productDetail.html" class="btn btn-primary btn-block">View Details</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>