<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
				<h2 class="page-title" style="margin: 0;">Notifications</h2>
				<button class="btn btn-default btn-sm">Mark all as read</button>
			</div>

			<!-- Filter Tabs -->
			<div class="notification-filters">
				<button class="btn btn-primary btn-sm">All</button>
				<button class="btn btn-default btn-sm">Orders</button>
				<button class="btn btn-default btn-sm">Messages</button>
				<button class="btn btn-default btn-sm">Listings</button>
			</div>

			<!-- Notifications List -->
			<div class="notification-item unread">
				<div class="notification-icon order">
					<span class="glyphicon glyphicon-shopping-cart"></span>
				</div>
				<div class="notification-content">
					<p class="notification-title">New Order Received!</p>
					<p class="notification-text">Sarah Lim has purchased your "JBL Flip 5 Bluetooth Speaker" for RM 280.00</p>
					<p class="notification-time">5 minutes ago</p>
				</div>
				<a href="orderDetails.html" class="btn btn-default btn-sm">View Order</a>
			</div>

			<div class="notification-item unread">
				<div class="notification-icon message">
					<span class="glyphicon glyphicon-envelope"></span>
				</div>
				<div class="notification-content">
					<p class="notification-title">New Message from Ahmad Faiz</p>
					<p class="notification-text">"Sure, the iPhone is still available! Let me know when you..."</p>
					<p class="notification-time">2 hours ago</p>
				</div>
				<a href="messages.html" class="btn btn-default btn-sm">Reply</a>
			</div>

			<div class="notification-item unread">
				<div class="notification-icon listing">
					<span class="glyphicon glyphicon-eye-open"></span>
				</div>
				<div class="notification-content">
					<p class="notification-title">Your listing got 15 new views!</p>
					<p class="notification-text">"iPhone 13 Pro (128GB)" is getting attention. Consider updating your price to attract more buyers.</p>
					<p class="notification-time">3 hours ago</p>
				</div>
				<a href="sellerListings.html" class="btn btn-default btn-sm">View Listing</a>
			</div>

			<div class="notification-item">
				<div class="notification-icon order">
					<span class="glyphicon glyphicon-ok-circle"></span>
				</div>
				<div class="notification-content">
					<p class="notification-title">Order Shipped!</p>
					<p class="notification-text">Your order #ORD-2024-001230 for "Calculus Textbook" has been shipped by the seller.</p>
					<p class="notification-time">1 day ago</p>
				</div>
				<a href="orderDetails.html" class="btn btn-default btn-sm">Track Order</a>
			</div>

			<div class="notification-item">
				<div class="notification-icon system">
					<span class="glyphicon glyphicon-star"></span>
				</div>
				<div class="notification-content">
					<p class="notification-title">You received a 5-star review!</p>
					<p class="notification-text">Wei Ming left a review: "Great seller! Item exactly as described. Fast response."</p>
					<p class="notification-time">2 days ago</p>
				</div>
				<a href="sellerProfile.html" class="btn btn-default btn-sm">View Review</a>
			</div>

			<div class="notification-item">
				<div class="notification-icon message">
					<span class="glyphicon glyphicon-envelope"></span>
				</div>
				<div class="notification-content">
					<p class="notification-title">New Message from Nurul Ain</p>
					<p class="notification-text">"Is the textbook still for sale? I need it for my exam..."</p>
					<p class="notification-time">2 days ago</p>
				</div>
				<a href="messages.html" class="btn btn-default btn-sm">Reply</a>
			</div>

			<div class="notification-item">
				<div class="notification-icon order">
					<span class="glyphicon glyphicon-ok-circle"></span>
				</div>
				<div class="notification-content">
					<p class="notification-title">Order Completed!</p>
					<p class="notification-text">Your purchase of "MacBook Pro 14\"" from Ali Hassan has been completed.</p>
					<p class="notification-time">5 days ago</p>
				</div>
				<a href="orderDetails.html" class="btn btn-default btn-sm">Leave Review</a>
			</div>

			<!-- Load More -->
			<div class="text-center" style="margin-top: 30px;">
				<button class="btn btn-default">Load More Notifications</button>
			</div>

		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>