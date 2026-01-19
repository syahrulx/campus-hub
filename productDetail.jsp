<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Redirect to servlet if not forwarded
    if (request.getAttribute("product") == null) {
        String id = request.getParameter("id");
        if (id != null) {
            response.sendRedirect("productDetail?id=" + id);
        } else {
            response.sendRedirect("products");
        }
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<!-- Breadcrumb -->
			<nav class="flex mb-8" aria-label="Breadcrumb">
				<ol class="flex items-center space-x-2 text-sm text-gray-400">
					<li><a href="products" class="hover:text-primary transition-colors">Home</a></li>
					<li><svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg></li>
					<li><a href="products?category=${product.categoryId}" class="hover:text-primary transition-colors">${categoryName}</a></li>
					<li><svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg></li>
					<li class="text-gray-900 font-bold">${product.name}</li>
				</ol>
			</nav>

			<div class="lg:flex lg:gap-12 items-start">
				<!-- Left: Image Section -->
				<div class="lg:w-7/12 sticky top-28 mb-12 lg:mb-0">
					<div class="bg-white rounded-[2.5rem] overflow-hidden shadow-sm border border-gray-100 aspect-square flex items-center justify-center p-8 group">
						<img src="${not empty product.imageUrl ? product.imageUrl : 'images/product-placeholder.png'}" 
							 alt="${product.name}" 
							 class="max-w-full max-h-full object-contain transform group-hover:scale-105 transition-transform duration-700" />
					</div>
				</div>

				<!-- Right: Product Information -->
				<div class="lg:w-5/12">
					<div class="space-y-8">
						<!-- Status & Title -->
						<div class="space-y-4">
							<div class="flex items-center gap-3">
								<c:choose>
									<c:when test="${product.status == 'AVAILABLE'}">
										<span class="inline-flex items-center px-4 py-1 rounded-full text-xs font-black bg-green-50 text-green-600 border border-green-100 uppercase tracking-widest">Available</span>
									</c:when>
									<c:otherwise>
										<span class="inline-flex items-center px-4 py-1 rounded-full text-xs font-black bg-red-50 text-red-600 border border-red-100 uppercase tracking-widest">${product.status}</span>
									</c:otherwise>
								</c:choose>
								<span class="inline-flex items-center px-4 py-1 rounded-full text-xs font-black bg-secondary text-gray-500 border border-gray-200 uppercase tracking-widest">${product.condition}</span>
							</div>
							<h1 class="text-4xl sm:text-5xl font-black text-gray-900 leading-tight tracking-tight italic">
								${product.name}
							</h1>
							<div class="text-3xl font-black text-primary">
								<fmt:formatNumber value="${product.price}" type="currency" currencySymbol="RM"/>
							</div>
						</div>

						<!-- Description -->
						<div class="bg-white p-8 rounded-3xl shadow-sm border border-gray-100 relative overflow-hidden">
							<div class="absolute top-0 right-0 w-24 h-24 bg-primary/5 rounded-bl-full -mr-12 -mt-12"></div>
							<h3 class="text-xs font-black text-gray-400 uppercase tracking-[0.2em] mb-4">Description</h3>
							<p class="text-gray-600 leading-relaxed text-lg">
								${product.description}
							</p>
						</div>

						<!-- Details Grid -->
						<div class="grid grid-cols-2 gap-4">
							<div class="bg-gray-100/50 p-6 rounded-2xl border border-gray-200">
								<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1">Category</p>
								<p class="text-sm font-bold text-gray-900">${categoryName}</p>
							</div>
							<div class="bg-gray-100/50 p-6 rounded-2xl border border-gray-200">
								<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1">Listed On</p>
								<p class="text-sm font-bold text-gray-900"><fmt:formatDate value="${product.listedAt}" pattern="MMM dd, yyyy"/></p>
							</div>
						</div>

						<!-- Actions -->
						<c:if test="${product.status == 'AVAILABLE'}">
							<div class="space-y-4 pt-4">
								<c:choose>
									<c:when test="${product.sellerId == sessionScope.userId}">
										<a href="editProduct?id=${product.productId}" class="flex items-center justify-center w-full bg-orange-400 hover:bg-orange-500 text-white py-5 rounded-2xl font-black text-lg shadow-xl shadow-orange-200 transition-all active:scale-[0.98]">
											<svg class="w-6 h-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
											Edit Listing
										</a>
									</c:when>
									<c:when test="${not empty sessionScope.userId}">
										<form action="cart" method="POST">
											<input type="hidden" name="action" value="add">
											<input type="hidden" name="productId" value="${product.productId}">
											<input type="hidden" name="quantity" value="1">
											<button type="submit" class="w-full bg-primary hover:bg-opacity-90 text-white py-5 rounded-2xl font-black text-lg shadow-xl shadow-red-100 hover:shadow-red-200 transition-all active:scale-[0.98] flex items-center justify-center group">
												<svg class="w-6 h-6 mr-3 transform group-hover:rotate-12 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
												Add to Cart
											</button>
										</form>
										<a href="messages?with=${product.sellerId}&about=${product.productId}" class="flex items-center justify-center w-full bg-white text-gray-900 border-2 border-gray-100 py-5 rounded-2xl font-bold hover:bg-gray-50 transition-all">
											<svg class="w-6 h-6 mr-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path></svg>
											Contact Seller
										</a>
									</c:when>
									<c:otherwise>
										<a href="login.jsp" class="flex items-center justify-center w-full bg-gray-900 text-white py-5 rounded-2xl font-black text-lg shadow-xl transition-all">
											Login to Purchase
										</a>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>

						<!-- Seller Premium Card -->
						<c:if test="${seller != null}">
							<div class="bg-white p-8 rounded-[2rem] shadow-sm border border-gray-100 flex items-center gap-6 relative group overflow-hidden">
								<div class="absolute top-0 right-0 w-32 h-32 bg-gray-50 rounded-full -mr-16 -mt-16 group-hover:bg-primary/5 transition-colors duration-500"></div>
								<div class="flex-shrink-0 w-16 h-16 rounded-2xl bg-primary flex items-center justify-center text-white font-black text-2xl shadow-lg shadow-red-100">
									${seller.name.substring(0,1).toUpperCase()}
								</div>
								<div class="flex-grow">
									<h4 class="text-xl font-black text-gray-900 leading-tight">${seller.name}</h4>
									<p class="text-sm font-medium text-gray-400 mt-1">${seller.university}</p>
								</div>
								<div class="flex-shrink-0">
									<div class="w-10 h-10 rounded-full bg-gray-50 flex items-center justify-center text-gray-300 group-hover:text-primary transition-colors">
										<svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l5-5z" clip-rule="evenodd"></path></svg>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>

			<!-- Related Products Grid -->
			<c:if test="${not empty relatedProducts}">
				<div class="mt-24">
					<div class="flex items-center justify-between mb-10">
						<h3 class="text-2xl font-black text-gray-900 italic tracking-tight">You might also like</h3>
						<div class="h-[2px] bg-primary w-24"></div>
					</div>
					
					<div class="grid grid-cols-2 lg:grid-cols-4 gap-8">
						<c:forEach var="rp" items="${relatedProducts}">
							<a href="productDetail?id=${rp.productId}" class="group bg-white rounded-3xl overflow-hidden border border-gray-100 shadow-sm hover:shadow-xl transition-all duration-300">
								<div class="aspect-square bg-gray-100 overflow-hidden">
									<img src="${not empty rp.imageUrl ? rp.imageUrl : 'images/product-placeholder.png'}" 
										 alt="${rp.name}" 
										 class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500" />
								</div>
								<div class="p-6">
									<h4 class="font-bold text-gray-900 group-hover:text-primary transition-colors mb-2 truncate">${rp.name}</h4>
									<p class="text-lg font-black text-primary italic">
										<fmt:formatNumber value="${rp.price}" type="currency" currencySymbol="RM"/>
									</p>
								</div>
							</a>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
