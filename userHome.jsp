<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Header -->
	<div class="container-fluid text-center">
		<h2>Welcome Back!</h2>
		<h6>Browse all the students products</h6>
		<form class="form-inline" action="userHome.html" method="get">
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
			<div class="section-header">
				<h2>Our Products</h2>
			</div>

			<div class="row">
				<!-- Product 1 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/iPhone.webp" alt="iPhone 13 Pro">
						<div class="caption">
							<p class="productname">APPLE iPhone 13 Pro</p>
							<p class="productinfo">Advanced dual-camera system</p>
							<p class="price">RM 125,999</p>
							<a href="cartDetails.html" class="btn btn-primary" style="width: 100%;">Add to Cart</a>
						</div>
					</div>
				</div>

				<!-- Product 2 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/iPhone.webp" alt="Samsung Galaxy S21">
						<div class="caption">
							<p class="productname">Samsung Galaxy S21 Ultra</p>
							<p class="productinfo">Ultimate smartphone experience</p>
							<p class="price">RM 99,999</p>
							<a href="cartDetails.html" class="btn btn-primary" style="width: 100%;">Add to Cart</a>
						</div>
					</div>
				</div>

				<!-- Product 3 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/macbook.jpg" alt="Sony Bravia TV">
						<div class="caption">
							<p class="productname">Sony Bravia 55" 4K TV</p>
							<p class="productinfo">Stunning 4K picture quality</p>
							<p class="price">RM 75,000</p>
							<a href="cartDetails.html" class="btn btn-primary" style="width: 100%;">Add to Cart</a>
						</div>
					</div>
				</div>

				<!-- Product 4 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/macbook.jpg" alt="Dell XPS 15">
						<div class="caption">
							<p class="productname">Dell XPS 15 Laptop</p>
							<p class="productinfo">Powerful Intel i7 processor</p>
							<p class="price">RM 145,000</p>
							<a href="cartDetails.html" class="btn btn-primary" style="width: 100%;">Add to Cart</a>
						</div>
					</div>
				</div>

				<!-- Product 5 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/airpods.png" alt="Canon Camera">
						<div class="caption">
							<p class="productname">Canon EOS 90D</p>
							<p class="productinfo">Professional DSLR camera</p>
							<p class="price">RM 89,999</p>
							<a href="cartDetails.html" class="btn btn-primary" style="width: 100%;">Add to Cart</a>
						</div>
					</div>
				</div>

				<!-- Product 6 -->
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="images/speaker.jpg" alt="JBL Speaker">
						<div class="caption">
							<p class="productname">JBL Flip 5 Speaker</p>
							<p class="productinfo">Portable Bluetooth speaker</p>
							<p class="price">RM 8,999</p>
							<a href="cartDetails.html" class="btn btn-primary" style="width: 100%;">Add to Cart</a>
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