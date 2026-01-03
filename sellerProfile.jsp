<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />


	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<!-- Seller Header -->
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-md-2 text-center">
							<img src="images/profile.jpg" alt="Ahmad Faiz" style="width: 120px; height: 120px; border-radius: 50%; object-fit: cover;">
						</div>
						<div class="col-md-6">
							<h2 style="margin-top: 0;">Ahmad Faiz</h2>
							<div style="color: #f39c12; margin-bottom: 10px;">
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty"></span>
								<span style="color: #666; margin-left: 5px;">4.2 (15 reviews)</span>
							</div>
							<p style="color: #666;"><span class="glyphicon glyphicon-map-marker"></span> UTM Skudai, Johor</p>
							<p style="color: #666;"><span class="glyphicon glyphicon-time"></span> Member since January 2023</p>
							<p style="margin-top: 10px;">Selling quality electronics and gadgets at student-friendly prices!</p>
						</div>
						<div class="col-md-4 text-right">
							<a href="messages.html" class="btn btn-primary btn-lg">
								<span class="glyphicon glyphicon-envelope"></span> Message Seller
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Stats -->
			<div class="row" style="margin-bottom: 30px;">
				<div class="col-md-3">
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<h3 style="margin: 0; color: var(--primary);">23</h3>
							<p style="margin: 0; color: #666;">Items Sold</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<h3 style="margin: 0; color: var(--primary);">8</h3>
							<p style="margin: 0; color: #666;">Active Listings</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<h3 style="margin: 0; color: var(--primary);">98%</h3>
							<p style="margin: 0; color: #666;">Response Rate</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<h3 style="margin: 0; color: var(--primary);">&lt;1hr</h3>
							<p style="margin: 0; color: #666;">Response Time</p>
						</div>
					</div>
				</div>
			</div>
			<!-- Listings -->
			<h3 class="page-title">Current Listings</h3>
			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="images/iPhone.webp" alt="iPhone 13 Pro">
						<div class="caption">
							<p class="productname">iPhone 13 Pro (128GB)</p>
							<p class="productinfo">Like New</p>
							<p class="price">RM 5,000.00</p>
							<a href="productDetail.html" class="btn btn-primary btn-block">View</a>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="images/airpods.png" alt="AirPods">
						<div class="caption">
							<p class="productname">AirPods Pro</p>
							<p class="productinfo">Good Condition</p>
							<p class="price">RM 800.00</p>
							<a href="productDetail.html" class="btn btn-primary btn-block">View</a>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="images/profile.jpg" alt="Apple Watch">
						<div class="caption">
							<p class="productname">Apple Watch Series 7</p>
							<p class="productinfo">Like New</p>
							<p class="price">RM 1,200.00</p>
							<a href="productDetail.html" class="btn btn-primary btn-block">View</a>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="images/profile.jpg" alt="iPad">
						<div class="caption">
							<p class="productname">iPad Air (2022)</p>
							<p class="productinfo">Like New</p>
							<p class="price">RM 2,500.00</p>
							<a href="productDetail.html" class="btn btn-primary btn-block">View</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Reviews -->
			<h3 class="page-title" style="margin-top: 40px;">Reviews</h3>
			<div class="panel panel-default">
				<div class="panel-body">
					<div style="border-bottom: 1px solid #eee; padding-bottom: 15px; margin-bottom: 15px;">
						<div style="display: flex; justify-content: space-between;">
							<strong>Wei Ming</strong>
							<span style="color: #999; font-size: 12px;">2 days ago</span>
						</div>
						<div style="color: #f39c12;">
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star"></span>
						</div>
						<p style="margin-top: 8px;">Great seller! Fast response and item exactly as described.</p>
					</div>
					<div style="border-bottom: 1px solid #eee; padding-bottom: 15px; margin-bottom: 15px;">
						<div style="display: flex; justify-content: space-between;">
							<strong>Sarah Lim</strong>
							<span style="color: #999; font-size: 12px;">1 week ago</span>
						</div>
						<div style="color: #f39c12;">
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star-empty"></span>
						</div>
						<p style="margin-top: 8px;">Good transaction. Item was in good condition.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<jsp:include page="footer.jsp" />
</body>
</html>