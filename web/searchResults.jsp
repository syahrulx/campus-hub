<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<!-- Modern Breadcrumb -->
			<nav class="flex mb-10" aria-label="Breadcrumb">
				<ol class="inline-flex items-center space-x-2 sm:space-x-4">
					<li class="inline-flex items-center">
						<a href="products" class="text-[10px] font-black text-gray-400 uppercase tracking-widest hover:text-primary transition-colors">Home</a>
					</li>
					<li>
						<div class="flex items-center">
							<svg class="flex-shrink-0 w-3 h-3 text-gray-300" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
							<span class="ml-2 sm:ml-4 text-[10px] font-black text-primary uppercase tracking-widest italic">Discovery</span>
						</div>
					</li>
				</ol>
			</nav>

			<!-- Search Header -->
			<div class="mb-12">
				<h2 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase mb-2">
					<c:choose>
						<c:when test="${empty searchQuery}">Explore Marketplace</c:when>
						<c:otherwise>Results for "${searchQuery}"</c:otherwise>
					</c:choose>
				</h2>
				<p class="text-sm text-gray-400 font-medium tracking-wide">
					<c:choose>
						<c:when test="${resultCount > 0}">Found <span class="text-primary font-bold italic">${resultCount}</span> items matching your search criteria.</c:when>
						<c:when test="${not empty searchQuery}">No current listings match <span class="text-gray-900 font-bold">"${searchQuery}"</span> nearby.</c:when>
						<c:otherwise>Discover what's trending across the campus community.</c:otherwise>
					</c:choose>
				</p>
			</div>

			<!-- Result Grid -->
			<c:choose>
				<c:when test="${not empty products}">
					<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
						<c:forEach var="product" items="${products}">
							<div class="group bg-white rounded-[2.5rem] overflow-hidden shadow-sm border border-gray-100 hover:shadow-2xl hover:shadow-gray-200 transition-all duration-500 transform hover:-translate-y-2">
								<div class="relative aspect-[4/5] overflow-hidden bg-gray-50">
									<img src="${not empty product.imageUrl ? product.imageUrl : 'images/product-placeholder.png'}" 
										alt="${product.name}" 
										class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
									<div class="absolute inset-0 bg-black/20 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center backdrop-blur-sm">
										<a href="productDetail?id=${product.productId}" class="px-8 py-3 bg-white text-gray-900 rounded-2xl font-black text-[10px] uppercase tracking-widest transform translate-y-4 group-hover:translate-y-0 transition-all duration-500 shadow-xl">
											Quick Look
										</a>
									</div>
									<div class="absolute top-6 left-6">
										<span class="px-4 py-1.5 bg-white/90 backdrop-blur-md rounded-full text-[9px] font-black text-gray-900 uppercase tracking-widest shadow-sm">
											${product.condition}
										</span>
									</div>
								</div>
								<div class="p-8">
									<h3 class="text-lg font-black text-gray-900 italic truncate tracking-tight uppercase mb-1">${product.name}</h3>
									<p class="text-2xl font-black text-primary italic">RM <fmt:formatNumber value="${product.price}" pattern="#,##0.00"/></p>
									<a href="productDetail?id=${product.productId}" class="mt-6 w-full py-4 border-2 border-primary/20 text-primary rounded-2xl font-black text-[10px] uppercase tracking-widest flex items-center justify-center gap-2 group-hover:bg-primary group-hover:text-white group-hover:border-primary transition-all active:scale-95">
										Acquire Item
										<svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:when>
				<c:when test="${not empty searchQuery}">
					<!-- No Results State -->
					<div class="bg-white rounded-[4rem] border border-gray-100 shadow-sm py-32 px-10 text-center">
						<div class="w-24 h-24 rounded-[2.5rem] bg-gray-50 flex items-center justify-center text-gray-200 mx-auto mb-10 border border-dashed border-gray-200">
							<svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
						</div>
						<h3 class="text-2xl font-black text-gray-900 italic uppercase tracking-tight mb-2">Zero Matches Found</h3>
						<p class="text-sm text-gray-400 font-medium max-w-sm mx-auto mb-10 leading-relaxed">We couldn't find items matching your query. Try broadening your keywords or exploring by category.</p>
						<div class="flex flex-col sm:flex-row items-center justify-center gap-4">
							<a href="categories.jsp" class="w-full sm:w-auto px-10 py-5 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95">
								See Categories
							</a>
							<a href="products" class="w-full sm:w-auto px-10 py-5 bg-gray-50 text-gray-900 rounded-2xl font-black text-xs uppercase tracking-widest border border-gray-100 hover:bg-white hover:shadow-lg transition-all active:scale-95">
								All Listings
							</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<!-- Empty Search State -->
					<div class="bg-white rounded-[4rem] border border-gray-100 shadow-sm py-32 px-10 text-center">
						<div class="w-20 h-20 bg-primary/5 rounded-[2rem] flex items-center justify-center text-primary mx-auto mb-8">
							<svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>
						</div>
						<h3 class="text-2xl font-black text-gray-900 italic uppercase tracking-tight mb-2">Market Discovery</h3>
						<p class="text-sm text-gray-400 font-medium max-w-sm mx-auto">Use the global search above to find specific items or equipment across campus.</p>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
