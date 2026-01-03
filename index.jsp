<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

	<!-- Hero Banner -->
	<div class="container-fluid text-center">
		<h2>CampusHub</h2>
		<h6>Your Campus Marketplace</h6>
		<form class="form-inline" action="index.jsp" method="get">
			<div class="input-group">
				<input type="text" class="form-control" name="search" placeholder="What are you looking for?">
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

			<!-- Today's Products -->
			<div id="products" class="section-header">
				<h2>Featured Products</h2>
			</div>

			<div class="row">
				<!-- Product 1 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/profile.jpg" alt="iPhone 13 Pro">
						<div class="caption">
							<p class="productname">APPLE iPhone 13 Pro</p>
							<p class="productinfo">Advanced dual-camera system for stunning photos</p>
							<p class="price">RM 125,999</p>
							<div style="display: flex; gap: 8px;">
								<a href="login.html" class="btn btn-primary" style="flex: 1;">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Product 2 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/profile.jpg" alt="Samsung Galaxy S21">
						<div class="caption">
							<p class="productname">Samsung Galaxy S21 Ultra</p>
							<p class="productinfo">Ultimate smartphone with stunning display</p>
							<p class="price">RM 99,999</p>
							<div style="display: flex; gap: 8px;">
								<a href="login.html" class="btn btn-primary" style="flex: 1;">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Product 3 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/profile.jpg" alt="Sony Bravia TV">
						<div class="caption">
							<p class="productname">Sony Bravia 55" 4K TV</p>
							<p class="productinfo">Stunning 4K picture quality with HDR</p>
							<p class="price">RM 75,000</p>
							<div style="display: flex; gap: 8px;">
								<a href="login.html" class="btn btn-primary" style="flex: 1;">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Product 4 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/profile.jpg" alt="Dell XPS 15">
						<div class="caption">
							<p class="productname">Dell XPS 15 Laptop</p>
							<p class="productinfo">Powerful Intel i7 with 16GB RAM</p>
							<p class="price">RM 145,000</p>
							<div style="display: flex; gap: 8px;">
								<a href="login.html" class="btn btn-primary" style="flex: 1;">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Product 5 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/profile.jpg" alt="Canon Camera">
						<div class="caption">
							<p class="productname">Canon EOS 90D</p>
							<p class="productinfo">Professional DSLR with 32.5MP sensor</p>
							<p class="price">RM 89,999</p>
							<div style="display: flex; gap: 8px;">
								<a href="login.html" class="btn btn-primary" style="flex: 1;">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Product 6 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/profile.jpg" alt="JBL Speaker">
						<div class="caption">
							<p class="productname">JBL Flip 5 Speaker</p>
							<p class="productinfo">Portable waterproof Bluetooth speaker</p>
							<p class="price">RM 8,999</p>
							<div style="display: flex; gap: 8px;">
								<a href="login.html" class="btn btn-primary" style="flex: 1;">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Product 7 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/airpods.png" alt="AirPods Pro">
						<div class="caption">
							<p class="productname">Apple AirPods Pro</p>
							<p class="productinfo">Active noise cancellation & transparency</p>
							<p class="price">RM 24,999</p>
							<div style="display: flex; gap: 8px;">
								<a href="login.html" class="btn btn-primary" style="flex: 1;">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Product 8 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/profile.jpg" alt="iPad Pro">
						<div class="caption">
							<p class="productname">iPad Pro 12.9"</p>
							<p class="productinfo">M2 chip with stunning Liquid Retina</p>
							<p class="price">RM 112,900</p>
							<div style="display: flex; gap: 8px;">
								<a href="login.html" class="btn btn-primary" style="flex: 1;">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
