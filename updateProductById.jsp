<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<div class="col-md-6 col-md-offset-3">
				<h2 class="page-title">Find Your Listing</h2>
				<p style="color: #666; margin-bottom: 20px;">Search for a listing to edit or manage</p>

				<div class="panel panel-default">
					<div class="panel-body">
						<form action="updateProduct.html">
							<div class="form-group">
								<label>Search by Product Name or ID</label>
								<input type="text" class="form-control" placeholder="e.g., iPhone or #PROD-001" required>
							</div>
							<button type="submit" class="btn btn-primary btn-block">
								<span class="glyphicon glyphicon-search"></span> Search
							</button>
						</form>
					</div>
				</div>

				<h4 style="margin-top: 30px;">Your Recent Listings</h4>
				<div class="list-group">
					<a href="updateProduct.html" class="list-group-item">
						<div style="display: flex; align-items: center; gap: 15px;">
							<img src="images/iPhone.webp" style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;">
							<div style="flex: 1;">
								<h5 style="margin: 0;">iPhone 13 Pro (128GB)</h5>
								<small style="color: #666;">Listed Nov 20, 2025</small>
							</div>
							<span class="label label-success">Active</span>
						</div>
					</a>
					<a href="updateProduct.html" class="list-group-item">
						<div style="display: flex; align-items: center; gap: 15px;">
							<img src="images/profile.jpg" style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;">
							<div style="flex: 1;">
								<h5 style="margin: 0;">Calculus Textbook</h5>
								<small style="color: #666;">Listed Oct 15, 2025</small>
							</div>
							<span class="label label-warning">Pending</span>
						</div>
					</a>
				</div>

				<a href="sellerListings.html" class="btn btn-default" style="margin-top: 20px;">
					<span class="glyphicon glyphicon-arrow-left"></span> Back to My Listings
				</a>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>