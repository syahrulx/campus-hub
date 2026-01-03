<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="main-content" style="margin-top: 60px;">
		<div class="container">
			<h2 class="page-title">My Orders</h2>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>Image</th>
						<th>Order ID</th>
						<th>Product</th>
						<th>Qty</th>
						<th>Price</th>
						<th>Date</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img src="images/profile.jpg"
								style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;"></td>
						<td>ORD001</td>
						<td>APPLE iPhone 13 Pro</td>
						<td>1</td>
						<td>RM 125,999</td>
						<td>Dec 15, 2023</td>
						<td><span style="color: #10B981; font-weight: 500;">Shipped</span></td>
					</tr>
					<tr>
						<td><img src="images/profile.jpg"
								style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;"></td>
						<td>ORD002</td>
						<td>Samsung Galaxy S21 Ultra</td>
						<td>2</td>
						<td>RM 199,998</td>
						<td>Dec 20, 2023</td>
						<td><span style="color: #DB4444; font-weight: 500;">Processing</span></td>
					</tr>
					<tr>
						<td><img src="images/profile.jpg"
								style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;"></td>
						<td>ORD003</td>
						<td>Dell XPS 15 Laptop</td>
						<td>1</td>
						<td>RM 145,000</td>
						<td>Dec 22, 2023</td>
						<td><span style="color: #10B981; font-weight: 500;">Delivered</span></td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>