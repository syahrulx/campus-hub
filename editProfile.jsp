<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />


	<div class="main-content" style="margin-top: 80px;">
		<div class="container">
			<div class="col-md-8 col-md-offset-2">
				<h2 class="page-title">Edit Profile</h2>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center" style="margin-bottom: 30px;">
							<img src="images/profile.jpg" alt="Profile" style="width: 120px; height: 120px; border-radius: 50%; object-fit: cover;">
							<div style="margin-top: 10px;">
								<button class="btn btn-default btn-sm">Change Photo</button>
							</div>
						</div>
						<form action="userProfile.html">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>First Name</label>
										<input type="text" class="form-control" value="Syahrul">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Last Name</label>
										<input type="text" class="form-control" value="Doe">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" value="syahrul@gmail.com">
							</div>
							<div class="form-group">
								<label>Phone</label>
								<input type="tel" class="form-control" value="+60 12-345 6789">
							</div>
							<div class="form-group">
								<label>University</label>
								<select class="form-control">
									<option selected>Universiti Teknologi Malaysia (UTM)</option>
									<option>Universiti Malaya (UM)</option>
									<option>Other</option>
								</select>
							</div>
							<div class="form-group">
								<label>Campus</label>
								<select class="form-control">
									<option selected>UTM Johor Bahru</option>
									<option>UTM Kuala Lumpur</option>
								</select>
							</div>
							<div class="form-group">
								<label>Faculty</label>
								<input type="text" class="form-control" value="Faculty of Computing">
							</div>
							<div class="form-group">
								<label>Bio</label>
								<textarea class="form-control" rows="3">Computer Science student. Love gadgets!</textarea>
							</div>
							<hr>
							<div style="display: flex; gap: 10px; justify-content: flex-end;">
								<a href="userProfile.html" class="btn btn-default">Cancel</a>
								<button type="submit" class="btn btn-primary">Save Changes</button>
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