<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<div class="col-md-6 col-md-offset-3 text-center">
				<h2 class="page-title">Remove Listing</h2>
				
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h4 style="margin: 0;">Are you sure you want to remove this listing?</h4>
					</div>
					<div class="panel-body">
						<div style="display: flex; align-items: center; gap: 15px; justify-content: center; margin-bottom: 20px;">
							<img src="images/profile.jpg" style="width: 80px; height: 80px; object-fit: cover; border-radius: 4px;">
							<div style="text-align: left;">
								<h4 style="margin: 0 0 5px 0;">Calculus Textbook</h4>
								<p style="margin: 0; color: #666;">Price: RM 45.00</p>
								<p style="margin: 0; color: #666;">Listed: Oct 15, 2025</p>
							</div>
						</div>
						
						<div class="alert alert-warning">
							<span class="glyphicon glyphicon-warning-sign"></span>
							This action cannot be undone. The listing will be permanently removed.
						</div>

						<div style="display: flex; gap: 10px; justify-content: center;">
							<a href="sellerListings.html" class="btn btn-default btn-lg">Cancel</a>
							<a href="sellerListings.html" class="btn btn-danger btn-lg">
								<span class="glyphicon glyphicon-trash"></span> Yes, Remove Listing
							</a>
						</div>
					</div>
				</div>

				<a href="sellerListings.html" class="btn btn-link">
					<span class="glyphicon glyphicon-arrow-left"></span> Back to My Listings
				</a>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>