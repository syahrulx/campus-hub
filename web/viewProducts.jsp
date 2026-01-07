<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

	<!-- Hero Section -->
	<div class="bg-transparent pt-24 pb-12 border-b border-gray-50">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
			<h1 class="text-6xl font-black text-gray-900 tracking-tighter italic uppercase mb-4">Marketplace</h1>
			<p class="text-sm text-gray-400 font-medium uppercase tracking-[0.3em] mb-10">Premium Student Verified Exchange</p>
			
			<form action="products" method="get" class="max-w-2xl mx-auto relative group">
				<div class="absolute inset-y-0 left-6 flex items-center pointer-events-none text-gray-300 group-focus-within:text-primary transition-colors">
					<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
				</div>
				<input type="text" name="search" placeholder="Search for textbooks, electronics, and more..." 
					class="w-full pl-16 pr-24 py-5 bg-gray-50 border-2 border-transparent rounded-[2rem] text-sm font-bold text-gray-900 focus:bg-white focus:border-primary focus:ring-4 focus:ring-primary/5 transition-all outline-none">
				<button type="submit" class="absolute right-3 top-2.5 px-6 py-2.5 bg-primary text-white rounded-2xl font-black text-[10px] uppercase tracking-widest hover:bg-red-600 transition-colors">
					Search
				</button>
			</form>
		</div>
	</div>

	<!-- Main Marketplace -->
	<div class="bg-transparent pb-32">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<!-- Section Header -->
			<div class="py-12 flex items-center justify-between">
				<div class="flex items-center gap-4">
					<div class="w-1.5 h-8 bg-primary rounded-full"></div>
					<h2 class="text-2xl font-black text-gray-900 italic uppercase tracking-tight">Featured Collections</h2>
				</div>
				<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest">Global Marketplace Feed</p>
			</div>

			<!-- Product Grid -->
			<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
				<c:forEach var="product" items="${featuredProducts}">
					<div class="group relative flex flex-col h-full bg-white rounded-[2.5rem] border border-gray-100 hover:border-primary/20 transition-all duration-500 hover:shadow-2xl hover:shadow-gray-200/50 overflow-hidden">
						<!-- Image Container -->
						<div class="relative aspect-square overflow-hidden bg-gray-50">
							<img src="${product.imageUrl}" alt="${product.name}" class="w-full h-full object-cover transform group-hover:scale-110 transition-transform duration-700">
							<div class="absolute inset-0 bg-black/0 group-hover:bg-black/5 transition-colors duration-500"></div>
							
							<!-- Quick Action Overlay -->
							<div class="absolute inset-x-4 bottom-4 translate-y-8 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all duration-500">
								<a href="productDetail.jsp?id=${product.productId}" class="w-full py-3 bg-white text-gray-900 text-center rounded-xl font-bold text-[10px] uppercase tracking-widest shadow-xl shadow-black/10 hover:bg-gray-50 transition-colors block">
									Examine Details
								</a>
							</div>
						</div>

						<!-- Product Details -->
						<div class="p-6 flex flex-col flex-1">
							<h3 class="text-sm font-black text-gray-900 italic uppercase tracking-tight truncate mb-2 group-hover:text-primary transition-colors">
								${product.name}
							</h3>
							<p class="text-[11px] text-gray-400 font-medium line-clamp-2 mb-4 flex-1">
								${product.description}
							</p>
							
							<div class="flex items-center justify-between mt-auto pt-4 border-t border-gray-50">
								<span class="text-sm font-black text-primary italic">RM ${product.price}</span>
								
								<c:choose>
									<c:when test="${not empty sessionScope.userId and product.sellerId == sessionScope.userId}">
										<span class="px-4 py-2 bg-gray-50 text-gray-400 rounded-lg text-[9px] font-black uppercase tracking-widest">
											Your Listing
										</span>
									</c:when>
									<c:when test="${not empty sessionScope.user}">
										<form action="cart" method="POST">
											<input type="hidden" name="action" value="add">
											<input type="hidden" name="productId" value="${product.productId}">
											<input type="hidden" name="quantity" value="1">
											<button type="submit" class="p-2.5 bg-gray-900 text-white rounded-xl hover:bg-primary transition-colors active:scale-95 group/btn">
												<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
											</button>
										</form>
									</c:when>
									<c:otherwise>
										<a href="login.jsp" class="p-2.5 bg-gray-900 text-white rounded-xl hover:bg-primary transition-colors active:scale-95">
											<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
										</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- Empty State -->
			<c:if test="${empty featuredProducts}">
				<div class="py-32 text-center">
					<div class="w-24 h-24 bg-gray-50 rounded-[2.5rem] flex items-center justify-center text-gray-200 mx-auto mb-8">
						<svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path></svg>
					</div>
					<h3 class="text-xl font-black text-gray-900 italic uppercase tracking-tight mb-2">Zero Listings Detected</h3>
					<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest italic mb-8">Wait for new transmissions from campus traders.</p>
					<a href="index.jsp" class="px-8 py-4 bg-gray-900 text-white rounded-2xl font-black text-[10px] uppercase tracking-widest hover:bg-primary transition-colors inline-block">
						Back to Nexus
					</a>
				</div>
			</c:if>

		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
