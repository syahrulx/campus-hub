<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<h2 class="page-title text-center" style="padding-left: 0;">My Profile</h2>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<!-- Profile Header -->
							<div class="text-center" style="margin-bottom: 30px;">
								<img src="images/profile.jpg" alt="Profile" style="width: 120px; height: 120px; border-radius: 50%; object-fit: cover;">
								<h3 style="margin-top: 15px; margin-bottom: 5px;">Syahrul</h3>
								<p style="color: #666;">Member since January 2023</p>
								<div style="color: #f39c12;">
									<span class="glyphicon glyphicon-star"></span>
									<span class="glyphicon glyphicon-star"></span>
									<span class="glyphicon glyphicon-star"></span>
									<span class="glyphicon glyphicon-star"></span>
									<span class="glyphicon glyphicon-star-empty"></span>
									<span style="color: #666; margin-left: 5px;">4.5 (12 reviews)</span>
								</div>
							</div>

							<!-- Profile Details -->
							<table class="table">
								<tr>
									<th style="width: 30%;">Email</th>
									<td>syahrul@gmail.com</td>
								</tr>
								<tr>
									<th>Phone</th>
									<td>+60 12-345 6789</td>
								</tr>
								<tr>
									<th>University</th>
									<td>Universiti Teknologi Malaysia (UTM)</td>
								</tr>
								<tr>
									<th>Campus</th>
									<td>UTM Johor Bahru</td>
								</tr>
								<tr>
									<th>Faculty</th>
									<td>Faculty of Computing</td>
								</tr>
							</table>

							<!-- Stats -->
							<div class="row text-center" style="margin: 30px 0;">
								<div class="col-xs-4">
									<h3 style="margin: 0; color: var(--primary);">12</h3>
									<p style="margin: 0; color: #666;">Items Sold</p>
								</div>
								<div class="col-xs-4">
									<h3 style="margin: 0; color: var(--primary);">5</h3>
									<p style="margin: 0; color: #666;">Active Listings</p>
								</div>
								<div class="col-xs-4">
									<h3 style="margin: 0; color: var(--primary);">8</h3>
									<p style="margin: 0; color: #666;">Purchases</p>
								</div>
							</div>

							<hr>

							<div style="display: flex; gap: 10px; justify-content: center;">
								<a href="editProfile.html" class="btn btn-primary">
									<span class="glyphicon glyphicon-edit"></span> Edit Profile
								</a>
								<a href="sellerListings.html" class="btn btn-default">
									<span class="glyphicon glyphicon-list"></span> My Listings
								</a>
								<a href="orderDetails.html" class="btn btn-default">
									<span class="glyphicon glyphicon-shopping-cart"></span> My Orders
								</a>
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
