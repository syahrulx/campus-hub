<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<h2 class="page-title">Pending Orders to Ship</h2>
			<p style="color: #666; margin-bottom: 20px;">Orders from buyers waiting to be shipped</p>

			<!-- Tabs -->
			<ul class="nav nav-tabs" style="margin-bottom: 20px;">
				<li><a href="sellerListings.html">My Listings</a></li>
				<li class="active"><a href="unshippedItems.html">Pending Orders</a></li>
				<li><a href="shippedItems.html">Shipped Orders</a></li>
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
								<th>Order Date</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>#ORD-2024-001240</td>
								<td>
									<div style="display: flex; align-items: center; gap: 10px;">
										<img src="images/speaker.jpg" style="width: 40px; height: 40px; object-fit: cover; border-radius: 4px;">
										<span>JBL Flip 5 Speaker</span>
									</div>
								</td>
								<td>Sarah Lim</td>
								<td class="price">RM 280.00</td>
								<td>Dec 13, 2024</td>
								<td>
									<a href="messages.html" class="btn btn-default btn-xs">Message</a>
									<a href="shippedItems.html" class="btn btn-success btn-xs">Mark Shipped</a>
								</td>
							</tr>
							<tr>
								<td>#ORD-2024-001235</td>
								<td>
									<div style="display: flex; align-items: center; gap: 10px;">
										<img src="images/profile.jpg" style="width: 40px; height: 40px; object-fit: cover; border-radius: 4px;">
										<span>Calculus Textbook</span>
									</div>
								</td>
								<td>Ahmad Hassan</td>
								<td class="price">RM 45.00</td>
								<td>Dec 12, 2024</td>
								<td>
									<a href="messages.html" class="btn btn-default btn-xs">Message</a>
									<a href="shippedItems.html" class="btn btn-success btn-xs">Mark Shipped</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="alert alert-info">
				<strong>Reminder:</strong> Please contact the buyer to arrange meetup or delivery before marking as shipped.
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>