<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Redirect to products servlet to fetch data
    if (request.getAttribute("featuredProducts") == null) {
        response.sendRedirect("products");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Hero Section -->
	<div class="relative bg-transparent overflow-hidden border-b border-gray-100">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16 sm:py-24">
			<div class="text-center">
				<h1 class="text-4xl font-extrabold tracking-tight text-gray-900 sm:text-6xl mb-4">
					Welcome Back, <span class="text-primary">${sessionScope.userName}</span>!
				</h1>
				<p class="max-w-2xl mx-auto text-xl text-gray-500">
					Explore thousands of student-listed items across your campus.
				</p>
				<div class="mt-10 flex justify-center gap-4">
					<a href="addProduct.jsp" class="bg-primary hover:bg-opacity-90 text-white px-8 py-4 rounded-2xl font-bold shadow-lg transform hover:-translate-y-1 transition-all">
						Start Selling
					</a>
					<a href="categories.jsp" class="bg-gray-50 hover:bg-gray-100 text-gray-900 px-8 py-4 rounded-2xl font-bold transition-all border border-gray-200">
						Browse Categories
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
			<div class="flex items-center justify-between mb-10">
				<h2 class="text-3xl font-extrabold text-gray-900">Featured Products</h2>
				<div class="flex items-center text-sm font-semibold text-primary">
					<span class="mr-1">Latest arrivals</span>
					<div class="w-10 h-[2px] bg-primary"></div>
				</div>
			</div>

			<!-- Product Grid -->
			<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
				<c:forEach var="product" items="${featuredProducts}">
					<div class="group relative bg-white rounded-3xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 border border-gray-100 flex flex-col h-full">
						<!-- Image Container -->
						<div class="relative aspect-square overflow-hidden bg-gray-100">
							<img src="${not empty product.imageUrl ? product.imageUrl : 'images/product-placeholder.png'}" 
								 alt="${product.name}" 
								 class="w-full h-full object-cover transform group-hover:scale-110 transition-transform duration-500">
							<div class="absolute inset-0 bg-black opacity-0 group-hover:opacity-10 transition-opacity"></div>
							
							<!-- Quick Action Overlay -->
							<div class="absolute bottom-4 left-4 right-4 translate-y-full group-hover:translate-y-0 transition-transform duration-300">
								<a href="productDetail?id=${product.productId}" class="block w-full text-center bg-white/90 backdrop-blur text-gray-900 py-3 rounded-xl font-bold text-sm shadow-lg hover:bg-white transition-colors">
									Quick View
								</a>
							</div>
						</div>

						<!-- Product Details -->
						<div class="p-6 flex flex-col flex-grow">
							<div class="mb-2 flex justify-between items-start">
								<h3 class="text-lg font-bold text-gray-900 leading-tight">
									<a href="productDetail?id=${product.productId}">${product.name}</a>
								</h3>
							</div>
							<p class="text-sm text-gray-500 line-clamp-2 mb-4 flex-grow italic">
								"${product.description}"
							</p>
							
							<div class="flex items-center justify-between mt-auto pt-4 border-t border-gray-50">
								<p class="text-xl font-black text-primary">
									<fmt:formatNumber value="${product.price}" type="currency" currencySymbol="RM"/>
								</p>
								
								<c:choose>
									<c:when test="${product.sellerId == sessionScope.userId}">
										<span class="text-xs font-bold text-gray-400 uppercase tracking-wider bg-gray-50 px-3 py-1 rounded-full">Your Listing</span>
									</c:when>
									<c:otherwise>
										<form action="cart" method="POST">
											<input type="hidden" name="action" value="add">
											<input type="hidden" name="productId" value="${product.productId}">
											<input type="hidden" name="quantity" value="1">
											<button type="submit" class="w-10 h-10 rounded-full bg-gray-900 text-white flex items-center justify-center hover:bg-primary transform active:scale-90 transition-all shadow-md">
												<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
											</button>
										</form>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- Empty State -->
			<c:if test="${empty featuredProducts}">
				<div class="text-center py-24 bg-white rounded-3xl shadow-sm border border-dashed border-gray-300">
					<div class="w-20 h-20 bg-gray-50 rounded-full flex items-center justify-center mx-auto mb-6 text-gray-300">
						<svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 11-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
					</div>
					<h3 class="text-2xl font-bold text-gray-900 mb-2">No products found</h3>
					<p class="text-gray-500 mb-8 max-w-sm mx-auto">It looks like the marketplace is quiet right now. Why not be the first to sell something?</p>
					<a href="addProduct.jsp" class="inline-flex items-center bg-primary text-white px-8 py-3 rounded-xl font-bold hover:shadow-lg transition-all">
						<svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
						Sell a Product
					</a>
				</div>
			</c:if>
		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>