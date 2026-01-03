<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<h2 class="page-title">Shipped Orders</h2>
			<p style="color: #666; margin-bottom: 20px;">Orders you have completed</p>

			<!-- Tabs -->
			<ul class="nav nav-tabs" style="margin-bottom: 20px;">
				<li><a href="sellerListings.html">My Listings</a></li>
				<li><a href="unshippedItems.html">Pending Orders</a></li>
				<li class="active"><a href="shippedItems.html">Shipped Orders</a></li>
			</ul>

			<div class="panel panel-default">
				<div class="panel-body" style="padding: 0;">
					<table class="table table-hover" style="margin-bottom: 0;">
						<thead>
							<tr>
								<th>Order ID</th>
								<th>Product</th>
								<th>Buyer</th>
								<th>Amount</th>
								<th>Shipped Date</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>#ORD-2024-001220</td>
								<td>
									<div style="display: flex; align-items: center; gap: 10px;">
										<img src="images/macbook.jpg" style="width: 40px; height: 40px; object-fit: cover; border-radius: 4px;">
										<span>MacBook Pro 16"</span>
									</div>
								</td>
								<td>Wei Ming</td>
								<td class="price">RM 7,000.00</td>
								<td>Dec 10, 2024</td>
								<td><span class="label label-success">Completed</span></td>
							</tr>
							<tr>
								<td>#ORD-2024-001205</td>
								<td>
									<div style="display: flex; align-items: center; gap: 10px;">
										<img src="images/profile.jpg" style="width: 40px; height: 40px; object-fit: cover; border-radius: 4px;">
										<span>Physics Textbook</span>
									</div>
								</td>
								<td>Nurul Ain</td>
								<td class="price">RM 55.00</td>
								<td>Dec 5, 2024</td>
								<td><span class="label label-success">Completed</span></td>
							</tr>
							<tr>
								<td>#ORD-2024-001180</td>
								<td>
									<div style="display: flex; align-items: center; gap: 10px;">
										<img src="images/profile.jpg" style="width: 40px; height: 40px; object-fit: cover; border-radius: 4px;">
										<span>Calculator fx-570EX</span>
									</div>
								</td>
								<td>Ali Hassan</td>
								<td class="price">RM 85.00</td>
								<td>Nov 28, 2024</td>
								<td><span class="label label-success">Completed</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<!-- Summary -->
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-4">
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<h3 style="margin: 0; color: var(--primary);">RM 7,140.00</h3>
							<p style="margin: 0; color: #666;">Total Earnings</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<h3 style="margin: 0; color: var(--primary);">3</h3>
							<p style="margin: 0; color: #666;">Items Sold</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-default text-center">
						<div class="panel-body">
							<h3 style="margin: 0; color: #f39c12;">4.8</h3>
							<p style="margin: 0; color: #666;">Average Rating</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>