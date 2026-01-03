<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

	<!-- Search Bar -->
	<div class="container-fluid text-center">
		<form class="form-inline" action="searchResults.jsp" method="get">
			<div class="input-group" style="max-width: 600px;">
				<input type="text" class="form-control" name="search" placeholder="Search for items..." value="iPhone">
				<div class="input-group-btn">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Breadcrumb -->
	<div class="container" style="margin-top: 20px;">
		<ol class="breadcrumb">
			<li><a href="userHome.html">Home</a></li>
			<li><a href="categories.html">Electronics</a></li>
			<li class="active">Search: "iPhone"</li>
		</ol>
	</div>

	<!-- Main Content -->
	<div class="main-content" style="padding-top: 0;">
		<div class="container">
			<div class="row">
				
				<!-- Filter Sidebar -->
				<div class="col-md-3">
					<div class="filter-sidebar">
						<h4 style="margin-top: 0;">Filters</h4>
						
						<!-- Category Filter -->
						<div class="filter-section">
							<h5>Category</h5>
							<div class="filter-option">
								<input type="checkbox" id="cat-electronics" checked>
								<label for="cat-electronics">Electronics (24)</label>
							</div>
							<div class="filter-option">
								<input type="checkbox" id="cat-phones">
								<label for="cat-phones">Phones (18)</label>
							</div>
							<div class="filter-option">
								<input type="checkbox" id="cat-accessories">
								<label for="cat-accessories">Accessories (12)</label>
							</div>
						</div>

						<!-- Price Range -->
						<div class="filter-section">
							<h5>Price Range</h5>
							<div class="filter-option">
								<input type="checkbox" id="price-1">
								<label for="price-1">Under RM 100</label>
							</div>
							<div class="filter-option">
								<input type="checkbox" id="price-2">
								<label for="price-2">RM 100 - RM 500</label>
							</div>
							<div class="filter-option">
								<input type="checkbox" id="price-3">
								<label for="price-3">RM 500 - RM 2,000</label>
							</div>
							<div class="filter-option">
								<input type="checkbox" id="price-4" checked>
								<label for="price-4">RM 2,000+</label>
							</div>
						</div>

						<!-- Condition -->
						<div class="filter-section">
							<h5>Condition</h5>
							<div class="filter-option">
								<input type="checkbox" id="cond-new">
								<label for="cond-new">New (5)</label>
							</div>
							<div class="filter-option">
								<input type="checkbox" id="cond-likenew" checked>
								<label for="cond-likenew">Like New (12)</label>
							</div>
							<div class="filter-option">
								<input type="checkbox" id="cond-good">
								<label for="cond-good">Good (8)</label>
							</div>
							<div class="filter-option">
								<input type="checkbox" id="cond-fair">
								<label for="cond-fair">Fair (3)</label>
							</div>
						</div>

						<!-- Location -->
						<div class="filter-section">
							<h5>Location</h5>
							<div class="filter-option">
								<input type="checkbox" id="loc-utm" checked>
								<label for="loc-utm">UTM Skudai</label>
							</div>
							<div class="filter-option">
								<input type="checkbox" id="loc-kl">
								<label for="loc-kl">UTM KL</label>
							</div>
						</div>

						<button class="btn btn-primary btn-block">Apply Filters</button>
						<button class="btn btn-default btn-block">Clear All</button>
					</div>
				</div>

				<!-- Search Results -->
				<div class="col-md-9">
					
					<!-- Sort Bar -->
					<div class="sort-bar">
						<span class="results-count">Showing <strong>24 results</strong> for "iPhone"</span>
						<div>
							<label style="margin-right: 10px;">Sort by:</label>
							<select class="form-control" style="width: auto; display: inline-block;">
								<option>Newest First</option>
								<option>Price: Low to High</option>
								<option>Price: High to Low</option>
								<option>Most Popular</option>
							</select>
						</div>
					</div>

					<!-- Results Grid -->
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="images/iPhone.webp" alt="iPhone 13 Pro">
								<div class="caption">
									<p class="productname">APPLE iPhone 13 Pro (128GB)</p>
									<p class="productinfo">Like New | UTM Skudai</p>
									<p class="price">RM 5,000.00</p>
									<a href="productDetail.jsp" class="btn btn-primary btn-block">View Details</a>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="images/profile.jpg" alt="iPhone 12">
								<div class="caption">
									<p class="productname">iPhone 12 (64GB)</p>
									<p class="productinfo">Good Condition | UTM Skudai</p>
									<p class="price">RM 2,800.00</p>
									<a href="productDetail.jsp" class="btn btn-primary btn-block">View Details</a>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="images/profile.jpg" alt="iPhone 11">
								<div class="caption">
									<p class="productname">iPhone 11 (128GB)</p>
									<p class="productinfo">Like New | UTM KL</p>
									<p class="price">RM 2,200.00</p>
									<a href="productDetail.jsp" class="btn btn-primary btn-block">View Details</a>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="images/profile.jpg" alt="iPhone Case">
								<div class="caption">
									<p class="productname">iPhone 13 Clear Case</p>
									<p class="productinfo">New | UTM Skudai</p>
									<p class="price">RM 35.00</p>
									<a href="productDetail.jsp" class="btn btn-primary btn-block">View Details</a>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="images/profile.jpg" alt="iPhone Charger">
								<div class="caption">
									<p class="productname">iPhone Fast Charger 20W</p>
									<p class="productinfo">New | UTM Skudai</p>
									<p class="price">RM 89.00</p>
									<a href="productDetail.jsp" class="btn btn-primary btn-block">View Details</a>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="images/profile.jpg" alt="iPhone SE">
								<div class="caption">
									<p class="productname">iPhone SE 2022 (64GB)</p>
									<p class="productinfo">Like New | UTM Skudai</p>
									<p class="price">RM 1,800.00</p>
									<a href="productDetail.jsp" class="btn btn-primary btn-block">View Details</a>
								</div>
							</div>
						</div>
					</div>

					<!-- Pagination -->
					<nav class="text-center">
						<ul class="pagination">
							<li class="disabled"><a href="#">Previous</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">Next</a></li>
						</ul>
					</nav>

				</div>
			</div>
		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
