<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="main-content" style="margin-top: 60px;">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h2 class="page-title">Billing Details</h2>
					
					<form action="orderDetails.html" method="get">
						<div class="form-group">
							<label>Full Name *</label>
							<input type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Address *</label>
							<input type="text" class="form-control" required>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>City *</label>
									<input type="text" class="form-control" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Pin Code *</label>
									<input type="text" class="form-control" required>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>Phone Number *</label>
							<input type="tel" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Email Address *</label>
							<input type="email" class="form-control" required>
						</div>
					</form>
				</div>

				<div class="col-md-5">
					<div style="background: #f5f5f5; padding: 24px; border-radius: 4px; margin-top: 48px;">
						<h4 style="margin-bottom: 24px; font-weight: 600;">Your Order</h4>
						
						<div style="display: flex; justify-content: space-between; margin-bottom: 16px; padding-bottom: 16px; border-bottom: 1px solid #e0e0e0;">
							<span>iPhone 13 Pro x1</span>
							<span>RM 125,999</span>
						</div>
						<div style="display: flex; justify-content: space-between; margin-bottom: 16px; padding-bottom: 16px; border-bottom: 1px solid #e0e0e0;">
							<span>Samsung S21 x2</span>
							<span>RM 199,998</span>
						</div>
						
						<div style="display: flex; justify-content: space-between; margin-bottom: 12px;">
							<span>Subtotal:</span>
							<span>RM 325,997</span>
						</div>
						<div style="display: flex; justify-content: space-between; margin-bottom: 12px;">
							<span>Shipping:</span>
							<span>Free</span>
						</div>
						<div style="display: flex; justify-content: space-between; font-weight: 600; font-size: 18px; margin-top: 16px; padding-top: 16px; border-top: 1px solid #e0e0e0;">
							<span>Total:</span>
							<span>RM 325,997</span>
						</div>

						<div style="margin-top: 24px;">
							<label style="display: flex; align-items: center; gap: 8px; margin-bottom: 12px; cursor: pointer;">
								<input type="radio" name="payment" checked> Cash on Delivery
							</label>
							<label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
								<input type="radio" name="payment"> Bank / Card
							</label>
						</div>

						<button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 24px;">Place Order</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>