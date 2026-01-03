<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- MAIN LOGIN CONTENT -->
	<div class="main-content" style="margin-top: 60px; display: flex; align-items: center;">
		<div class="container">
			<div class="row">

				<!-- LEFT IMAGE -->
				<div class="col-md-6" style="padding-right: 40px;">
					<img src="images/profile.jpg" alt="Shopping"
						style="width: 100%; height: 400px; object-fit: cover; border-radius: 4px;">
				</div>

				<!-- RIGHT LOGIN FORM -->
				<div class="col-md-6">
					<div style="max-width: 380px; margin-left: auto;">

						<h2 style="font-size: 36px; font-weight: 500; margin-bottom: 16px;">
							Log in to CampusHub
						</h2>
						<p style="color: #7f7f7f; margin-bottom: 32px;">
							Enter your details below
						</p>

						<form action="userHome.html" method="get">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Email or Phone Number" required
									style="border: none; border-bottom: 1px solid #e0e0e0; border-radius: 0; padding-left: 0; background: transparent;">
							</div>

							<div class="form-group">
								<input type="password" class="form-control" placeholder="Password" required
									style="border: none; border-bottom: 1px solid #e0e0e0; border-radius: 0; padding-left: 0; background: transparent;">
							</div>

							<div
								style="display: flex; justify-content: space-between; align-items: center; margin-top: 24px;">
								<button type="submit" class="btn btn-primary" style="padding: 12px 48px;">
									Log In
								</button>
								<a href="forgotPassword.html" style="color: #DB4444; font-size: 14px;">Forgot Password?</a>
							</div>
						</form>

						<div style="margin-top: 32px; padding-top: 32px; border-top: 1px solid #e0e0e0;">
							<p style="color: #7f7f7f; font-size: 14px; text-align: center;">
								Demo Mode: Quick Access
							</p>

							<div style="display: flex; gap: 12px;">
								<a href="userHome.html" class="btn btn-success" style="flex: 1; text-align: center;">
									Customer
								</a>
							</div>
						</div>

						<p style="text-align: center; margin-top: 24px; color: #7f7f7f; font-size: 14px;">
							Don't have an account?
							<a href="register.html" style="color: #000; font-weight: 500;">Sign Up</a>
						</p>

					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- FOOTER -->
	
<jsp:include page="footer.jsp" />
</body>
</html>