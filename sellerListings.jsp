<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
				<h2 class="page-title" style="margin: 0;">My Listings</h2>
				<a href="addProduct.html" class="btn btn-primary">
					<span class="glyphicon glyphicon-plus"></span> Sell New Item
				</a>
			</div>

			<!-- Stats Summary -->
			<div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 20px;">
				<div class="panel panel-default text-center" style="margin: 0;">
					<div class="panel-body">
						<h3 style="margin: 0; color: var(--primary);">RM 12,410</h3>
						<p style="margin: 0; color: #666;">Total Earnings</p>
					</div>
				</div>
				<div class="panel panel-default text-center" style="margin: 0;">
					<div class="panel-body">
						<h3 style="margin: 0; color: var(--primary);">3</h3>
						<p style="margin: 0; color: #666;">Items Sold</p>
					</div>
				</div>
				<div class="panel panel-default text-center" style="margin: 0;">
					<div class="panel-body">
						<h3 style="margin: 0; color: var(--primary);">2</h3>
						<p style="margin: 0; color: #666;">Active Listings</p>
					</div>
				</div>
			</div>

			<!-- Tabs -->
			<ul class="nav nav-tabs" style="margin-bottom: 20px;">
				<li class="active"><a href="sellerListings.html">My Listings (5)</a></li>
				<li><a href="unshippedItems.html">Pending Orders (2)</a></li>
				<li><a href="shippedItems.html">Shipped Orders</a></li>
			</ul>

			<!-- Listings Table -->
			<div class="panel panel-default">
				<div class="panel-body" style="padding: 0;">
					<table class="table table-hover" style="margin-bottom: 0;">
						<thead>
							<tr>
								<th>Image</th>
								<th>Product Name</th>
								<th>Price</th>
								<th>Date Listed</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<img src="images/iPhone.webp" alt="iPhone" style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;">
								</td>
								<td>APPLE iPhone 13 Pro (128GB)</td>
								<td class="price">RM 5,000.00</td>
								<td>Nov 20, 2025</td>
								<td><span class="label label-success">Active</span></td>
								<td>
									<a href="updateProduct.html" class="btn btn-xs btn-warning">Edit</a>
									<a href="removeProduct.html" class="btn btn-xs btn-danger">Remove</a>
								</td>
							</tr>
							<tr>
								<td>
									<img src="images/textbook.png" alt="Textbook" style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;">
								</td>
								<td>Calculus Textbook - James Stewart</td>
								<td class="price">RM 45.00</td>
								<td>Oct 15, 2025</td>
								<td><span class="label label-warning">Pending</span></td>
								<td>
									<a href="updateProduct.html" class="btn btn-xs btn-warning">Edit</a>
									<a href="removeProduct.html" class="btn btn-xs btn-danger">Remove</a>
								</td>
							</tr>
							<tr>
								<td>
									<img src="images/speaker.jpg" alt="Speaker" style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;">
								</td>
								<td>JBL Flip 5 Bluetooth Speaker</td>
								<td class="price">RM 280.00</td>
								<td>Sep 5, 2025</td>
								<td><span class="label label-danger">Sold</span></td>
								<td>
									<span class="text-muted">Completed</span>
								</td>
							</tr>
							<tr>
								<td>
									<img src="images/macbook.jpg" alt="MacBook" style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;">
								</td>
								<td>MacBook Pro 16" (M1 Pro)</td>
								<td class="price">RM 7,000.00</td>
								<td>Aug 20, 2025</td>
								<td><span class="label label-danger">Sold</span></td>
								<td>
									<span class="text-muted">Completed</span>
								</td>
							</tr>
							<tr>
								<td>
									<img src="images/calculator.png" alt="Calculator" style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;">
								</td>
								<td>Casio Calculator fx-570EX</td>
								<td class="price">RM 85.00</td>
								<td>Jul 10, 2025</td>
								<td><span class="label label-danger">Sold</span></td>
								<td>
									<span class="text-muted">Completed</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>