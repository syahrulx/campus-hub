<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					
					<!-- Success Icon -->
					<div class="success-icon">
						<span class="glyphicon glyphicon-ok"></span>
					</div>

					<h2 style="color: #4CAF50; margin-bottom: 10px;">Order Placed Successfully!</h2>
					<p style="color: #666; font-size: 16px;">
						Thank you for your purchase. Your order has been confirmed.
					</p>

					<!-- Order Details Card -->
					<div class="order-summary-card text-left">
						<h4 style="margin-top: 0; margin-bottom: 20px;">Order Summary</h4>
						
						<table class="table" style="margin-bottom: 0;">
							<tr>
								<td style="border: none; padding: 8px 0;"><strong>Order ID</strong></td>
								<td style="border: none; padding: 8px 0; text-align: right;">#ORD-2024-001234</td>
							</tr>
							<tr>
								<td style="border: none; padding: 8px 0;"><strong>Order Date</strong></td>
								<td style="border: none; padding: 8px 0; text-align: right;">December 13, 2024</td>
							</tr>
							<tr>
								<td style="border: none; padding: 8px 0;"><strong>Payment Method</strong></td>
								<td style="border: none; padding: 8px 0; text-align: right;">Credit Card (****4242)</td>
							</tr>
							<tr>
								<td style="border: none; padding: 8px 0;"><strong>Delivery Address</strong></td>
								<td style="border: none; padding: 8px 0; text-align: right;">Kolej Tun Fatimah, UTM Skudai</td>
							</tr>
						</table>

						<hr>

						<!-- Order Items -->
						<div style="display: flex; align-items: center; gap: 15px; padding: 10px 0;">
							<img src="images/iPhone.webp" alt="iPhone" style="width: 60px; height: 60px; object-fit: cover; border-radius: 4px;">
							<div style="flex: 1;">
								<p style="margin: 0; font-weight: 500;">APPLE iPhone 13 Pro (128GB)</p>
								<p style="margin: 0; color: #666; font-size: 12px;">Qty: 1 | Seller: Ahmad Faiz</p>
							</div>
							<p style="margin: 0; font-weight: 600; color: var(--primary);">RM 5,000.00</p>
						</div>

						<hr>

						<table class="table" style="margin-bottom: 0;">
							<tr>
								<td style="border: none; padding: 8px 0;">Subtotal</td>
								<td style="border: none; padding: 8px 0; text-align: right;">RM 5,000.00</td>
							</tr>
							<tr>
								<td style="border: none; padding: 8px 0;">Delivery Fee</td>
								<td style="border: none; padding: 8px 0; text-align: right;">RM 0.00</td>
							</tr>
							<tr>
								<td style="border: none; padding: 8px 0;"><strong>Total</strong></td>
								<td style="border: none; padding: 8px 0; text-align: right;"><strong style="color: var(--primary); font-size: 18px;">RM 5,000.00</strong></td>
							</tr>
						</table>
					</div>

					<!-- Next Steps -->
					<div class="alert alert-info text-left" style="margin-top: 30px;">
						<h5 style="margin-top: 0;"><span class="glyphicon glyphicon-info-sign"></span> What's Next?</h5>
						<ul style="margin-bottom: 0; padding-left: 20px;">
							<li>The seller has been notified and will prepare your item</li>
							<li>You can message the seller to arrange pickup or delivery</li>
							<li>You will receive a notification when your order is shipped</li>
						</ul>
					</div>

					<!-- Action Buttons -->
					<div style="margin-top: 30px; display: flex; gap: 15px; justify-content: center;">
						<a href="orderDetails.html" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-list-alt"></span> View My Orders
						</a>
						<a href="userHome.html" class="btn btn-default btn-lg">
							Continue Shopping
						</a>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>