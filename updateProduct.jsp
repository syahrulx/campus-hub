<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<div class="col-md-8 col-md-offset-2">
				<h2 class="page-title">Edit Listing</h2>
				
				<!-- Current Item Info -->
				<div class="alert alert-info">
					<strong>Editing:</strong> iPhone 13 Pro (128GB) - Listed on Nov 20, 2025
				</div>

				<div class="panel panel-default">
					<div class="panel-body">
						<form action="sellerListings.html">
							<div class="form-group">
								<label>Product Name</label>
								<input type="text" class="form-control" value="APPLE iPhone 13 Pro (128GB)" required>
							</div>
							<div class="form-group">
								<label>Category</label>
								<select class="form-control" required>
									<option>Textbooks & Notes</option>
									<option selected>Electronics</option>
									<option>Clothing & Fashion</option>
									<option>Dorm Items</option>
									<option>Entertainment</option>
									<option>Transportation</option>
									<option>Stationery</option>
									<option>Gaming</option>
								</select>
							</div>
							<div class="form-group">
								<label>Condition</label>
								<select class="form-control" required>
									<option>New</option>
									<option selected>Like New</option>
									<option>Good</option>
									<option>Fair</option>
								</select>
							</div>
							<div class="form-group">
								<label>Description</label>
								<textarea class="form-control" rows="4" required>Selling my iPhone 13 Pro 128GB in excellent condition. Bought last year, always used with a case and screen protector. Battery health at 92%. Comes with original box, charger, and a free case.</textarea>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Price (RM)</label>
										<input type="number" class="form-control" value="5000" required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Location</label>
										<input type="text" class="form-control" value="UTM Skudai, Johor" required>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>Product Images</label>
								<div style="display: flex; gap: 10px; margin-bottom: 10px;">
									<img src="images/iPhone.webp" style="width: 80px; height: 80px; object-fit: cover; border-radius: 4px;">
									<img src="images/profile.jpg" style="width: 80px; height: 80px; object-fit: cover; border-radius: 4px;">
								</div>
								<input type="file" class="form-control">
								<p class="help-block">Upload new images to replace existing ones</p>
							</div>
							<hr>
							<div style="display: flex; gap: 10px; justify-content: space-between;">
								<a href="sellerListings.html" class="btn btn-default">Cancel</a>
								<div>
									<button type="button" class="btn btn-danger">Delete Listing</button>
									<button type="submit" class="btn btn-primary">Save Changes</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>