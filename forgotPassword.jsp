<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="main-content" style="margin-top: 100px;">
		<div class="container">
			<div class="auth-container">
				<div class="auth-header">
					<div class="auth-icon">
						<span class="glyphicon glyphicon-lock"></span>
					</div>
					<h2>Forgot Password?</h2>
					<p>Enter your email address and we'll send you a link to reset your password.</p>
				</div>

				<form action="login.html" method="get">
					<div class="form-group">
						<label for="email">Email Address</label>
						<input type="email" class="form-control" id="email" name="email" 
							placeholder="Enter your registered email" required>
					</div>

					<button type="submit" class="btn btn-primary btn-lg btn-block" style="margin-top: 20px;">
						Send Reset Link
					</button>
				</form>

				<hr style="margin: 30px 0;">

				<div class="text-center">
					<p style="color: #666;">
						Remember your password? 
						<a href="login.html" style="color: var(--primary); font-weight: 500;">Back to Login</a>
					</p>
				</div>

				<!-- Success Message (Demo) -->
				<div class="alert alert-success" style="margin-top: 20px; display: none;" id="successMsg">
					<span class="glyphicon glyphicon-ok-circle"></span>
					<strong>Email Sent!</strong> Check your inbox for the password reset link.
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>