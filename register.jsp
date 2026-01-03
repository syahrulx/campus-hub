<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="main-content" style="margin-top: 60px; display: flex; align-items: center;">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<img src="images/profile.jpg" alt="Shopping" style="width: 100%; height: 400px; object-fit: cover; border-radius: 4px;">
				</div>
				
				<div class="col-md-6">
					<div style="max-width: 380px; margin-left: auto;">
						<h2 style="font-size: 36px; font-weight: 500; margin-bottom: 16px;">Create an account</h2>
						<p style="color: #7f7f7f; margin-bottom: 32px;">Enter your details below</p>
						
						<form action="login.html#registered" method="get">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Name" required style="border: none; border-bottom: 1px solid #e0e0e0; border-radius: 0; padding-left: 0; background: transparent;">
							</div>
							<div class="form-group">
								<input type="email" class="form-control" placeholder="Email or Phone Number" required style="border: none; border-bottom: 1px solid #e0e0e0; border-radius: 0; padding-left: 0; background: transparent;">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Password" required style="border: none; border-bottom: 1px solid #e0e0e0; border-radius: 0; padding-left: 0; background: transparent;">
							</div>
							
							<button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 24px; padding: 12px;">Create Account</button>
							
							<p style="text-align: center; margin-top: 24px; color: #7f7f7f; font-size: 14px;">
								Already have an account? <a href="login.html" style="color: #000; font-weight: 500;">Log in</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>