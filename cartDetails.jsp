<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="main-content" style="margin-top: 60px;">
		<div class="container">
			<h2 class="page-title">Shopping Cart</h2>

			<table class="table">
				<thead>
					<tr>
						<th>Product</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Subtotal</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div style="display: flex; align-items: center; gap: 16px;">
								<img src="images/profile.jpg" style="width: 60px; height: 60px; object-fit: cover; border-radius: 4px;">
								<span>APPLE iPhone 13 Pro</span>
							</div>
						</td>
						<td>RM 125,999</td>
						<td>
							<input type="number" value="1" min="1" style="width: 60px; padding: 8px; border: 1px solid #e0e0e0; border-radius: 4px;">
						</td>
						<td>RM 125,999</td>
					</tr>
					<tr>
						<td>
							<div style="display: flex; align-items: center; gap: 16px;">
								<img src="images/profile.jpg" style="width: 60px; height: 60px; object-fit: cover; border-radius: 4px;">
								<span>Samsung Galaxy S21 Ultra</span>
							</div>
						</td>
						<td>RM 99,999</td>
						<td>
							<input type="number" value="2" min="1" style="width: 60px; padding: 8px; border: 1px solid #e0e0e0; border-radius: 4px;">
						</td>
						<td>RM 199,998</td>
					</tr>
				</tbody>
			</table>

			<div class="row" style="margin-top: 32px;">
				<div class="col-md-6">
					<a href="userHome.html" class="btn btn-success">Continue Shopping</a>
				</div>
				<div class="col-md-6">
					<div style="background: #f5f5f5; padding: 24px; border-radius: 4px;">
						<h4 style="margin-bottom: 16px; font-weight: 600;">Cart Total</h4>
						<p style="display: flex; justify-content: space-between; margin-bottom: 12px;">
							<span>Subtotal:</span>
							<span>RM 325,997</span>
						</p>
						<p style="display: flex; justify-content: space-between; margin-bottom: 12px; padding-bottom: 12px; border-bottom: 1px solid #e0e0e0;">
							<span>Shipping:</span>
							<span>Free</span>
						</p>
						<p style="display: flex; justify-content: space-between; font-weight: 600; font-size: 18px;">
							<span>Total:</span>
							<span>RM 325,997</span>
						</p>
						<a href="payment.html" class="btn btn-primary" style="width: 100%; margin-top: 16px;">Proceed to Checkout</a>
					</div>
				</div>
			</div>

		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
