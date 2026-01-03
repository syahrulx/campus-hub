<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<h2 class="page-title">Messages</h2>

			<div class="chat-container">
				<!-- Conversation List -->
				<div class="conversation-list">
					<div class="conversation-item active">
						<img src="images/profile.jpg" alt="Ahmad Faiz" class="conversation-avatar">
						<div class="conversation-info">
							<p class="conversation-name">Ahmad Faiz <span class="unread-badge">2</span></p>
							<p class="conversation-preview">Sure, the iPhone is still available!</p>
						</div>
						<span class="conversation-time">2m</span>
					</div>

					<div class="conversation-item">
						<img src="images/profile.jpg" alt="Sarah Lim" class="conversation-avatar">
						<div class="conversation-info">
							<p class="conversation-name">Sarah Lim</p>
							<p class="conversation-preview">Thanks for the purchase!</p>
						</div>
						<span class="conversation-time">1h</span>
					</div>

					<div class="conversation-item">
						<img src="images/profile.jpg" alt="Ali Hassan" class="conversation-avatar">
						<div class="conversation-info">
							<p class="conversation-name">Ali Hassan</p>
							<p class="conversation-preview">Can we meet at KTF tomorrow?</p>
						</div>
						<span class="conversation-time">3h</span>
					</div>

					<div class="conversation-item">
						<img src="images/profile.jpg" alt="Nurul Ain" class="conversation-avatar">
						<div class="conversation-info">
							<p class="conversation-name">Nurul Ain</p>
							<p class="conversation-preview">Is the textbook still for sale?</p>
						</div>
						<span class="conversation-time">1d</span>
					</div>

					<div class="conversation-item">
						<img src="images/profile.jpg" alt="Wei Ming" class="conversation-avatar">
						<div class="conversation-info">
							<p class="conversation-name">Wei Ming</p>
							<p class="conversation-preview">Order received, thanks!</p>
						</div>
						<span class="conversation-time">2d</span>
					</div>
				</div>

				<!-- Chat Window -->
				<div class="chat-window">
					<!-- Chat Header -->
					<div class="chat-header">
						<img src="images/profile.jpg" alt="Ahmad Faiz" class="conversation-avatar">
						<div>
							<p style="margin: 0; font-weight: 600;">Ahmad Faiz</p>
							<p style="margin: 0; color: #4CAF50; font-size: 12px;">Online</p>
						</div>
						<a href="sellerProfile.html" class="btn btn-default btn-sm" style="margin-left: auto;">View Profile</a>
					</div>

					<!-- Product Reference -->
					<div class="chat-product">
						<img src="images/iPhone.webp" alt="iPhone 13 Pro">
						<div>
							<p style="margin: 0; font-weight: 500;">iPhone 13 Pro (128GB)</p>
							<p style="margin: 0; color: var(--primary); font-weight: 600;">RM 5,000.00</p>
						</div>
						<a href="productDetail.html" class="btn btn-default btn-sm" style="margin-left: auto;">View Item</a>
					</div>

					<!-- Messages -->
					<div class="chat-messages">
						<div class="message received">
							<div>
								<div class="message-bubble">
									Hello! I'm interested in your iPhone 13 Pro. Is it still available?
								</div>
								<p class="message-time">10:30 AM</p>
							</div>
						</div>

						<div class="message sent">
							<div>
								<div class="message-bubble">
									Hi there! Yes, it's still available. Are you from UTM?
								</div>
								<p class="message-time">10:32 AM</p>
							</div>
						</div>

						<div class="message received">
							<div>
								<div class="message-bubble">
									Yes, I'm a student at UTM Skudai. Can I see it in person before buying?
								</div>
								<p class="message-time">10:35 AM</p>
							</div>
						</div>

						<div class="message sent">
							<div>
								<div class="message-bubble">
									Sure! We can meet at the library or KTF. When are you free?
								</div>
								<p class="message-time">10:36 AM</p>
							</div>
						</div>

						<div class="message received">
							<div>
								<div class="message-bubble">
									How about tomorrow at 3pm at the library? Also, is the price negotiable?
								</div>
								<p class="message-time">10:40 AM</p>
							</div>
						</div>

						<div class="message sent">
							<div>
								<div class="message-bubble">
									Tomorrow 3pm works for me! I can do RM 4,800 if you pay cash. The battery health is still at 92% and comes with original accessories.
								</div>
								<p class="message-time">10:42 AM</p>
							</div>
						</div>

						<div class="message received">
							<div>
								<div class="message-bubble">
									Sure, the iPhone is still available! Let me know if you want to proceed.
								</div>
								<p class="message-time">Just now</p>
							</div>
						</div>
					</div>

					<!-- Chat Input -->
					<div class="chat-input">
						<input type="text" placeholder="Type a message...">
						<button class="btn btn-primary">
							<span class="glyphicon glyphicon-send"></span> Send
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>