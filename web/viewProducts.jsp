<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

	<!-- Hero Section -->
	<div class="relative pt-32 pb-20">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
			<h1 class="text-7xl font-black text-gray-900 tracking-tighter heading-aura uppercase mb-6">Marketplace</h1>
			<p class="text-xs font-black text-gray-400 uppercase tracking-[0.4em] mb-12">Premium Student Verified Exchange</p>
			
			<form action="search" method="get" class="max-w-3xl mx-auto relative group">
				<div class="absolute inset-y-0 left-8 flex items-center pointer-events-none text-gray-400 group-focus-within:text-primary transition-all">
					<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
				</div>
				<input type="text" name="q" placeholder="Search textbooks, electronics, or style..." 
					class="w-full pl-20 pr-32 py-7 glass-card rounded-[2.5rem] text-sm font-bold text-gray-900 focus:bg-white focus:ring-8 focus:ring-primary/5 transition-all outline-none border-white/40">
				<button type="submit" class="absolute right-4 top-3 px-10 py-4 bg-primary text-white rounded-[1.5rem] font-black text-xs uppercase tracking-widest hover:bg-primary-dark transition-all shadow-lg shadow-primary/20 active-press">
					EXPLORE
				</button>
			</form>
		</div>
	</div>

	<!-- Main Marketplace -->
	<div class="pb-32 px-4 sm:px-6 lg:px-8">
		<div class="max-w-7xl mx-auto py-12">
			
			<!-- Section Header -->
			<div class="mb-16 flex items-end justify-between">
				<div>
					<p class="text-[10px] font-black text-primary uppercase tracking-[0.3em] mb-2">Verified Listings</p>
					<h2 class="text-4xl font-black text-gray-900 tracking-tighter uppercase italic">Featured Collections</h2>
				</div>
				<div class="hidden md:block h-px bg-white/50 flex-grow mx-12"></div>
				<p class="text-[11px] font-black text-gray-400 uppercase tracking-widest">Global Marketplace Feed</p>
			</div>

			<!-- Product Grid -->
			<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-12">
				<c:forEach var="product" items="${featuredProducts}">
					<div class="group flex flex-col h-full glass-card rounded-[3rem] p-5 hover-lift">
						<!-- Image Container -->
						<div class="relative aspect-square overflow-hidden rounded-[2.2rem] bg-white/50 mb-7">
							<img src="${product.imageUrl}" alt="${product.name}" class="w-full h-full object-cover transform group-hover:scale-110 transition-transform duration-700">
							
							<!-- Price Badge Overlay -->
							<div class="absolute top-5 right-5 bg-white/90 backdrop-blur-md px-4 py-2 rounded-2xl shadow-lg border border-white/50">
								<span class="text-xs font-black text-gray-900 tracking-tight italic">RM ${product.price}</span>
							</div>

							<!-- Quick Action Overlay -->
							<div class="absolute inset-0 bg-primary/10 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
								<a href="productDetail.jsp?id=${product.productId}" class="px-8 py-3 bg-white text-gray-900 rounded-xl font-black text-[10px] uppercase tracking-widest shadow-2xl active-press">
									QUICK VIEW
								</a>
							</div>
						</div>

						<!-- Product Details -->
						<div class="px-2 flex flex-col flex-1">
							<h3 class="text-sm font-black text-gray-900 italic uppercase tracking-tight truncate mb-3 group-hover:text-primary transition-colors">
								${product.name}
							</h3>
							<p class="text-[11px] text-gray-400 font-semibold line-clamp-2 leading-relaxed mb-6 flex-1">
								${product.description}
							</p>
							
							<div class="flex items-center justify-between mt-auto">
								<c:choose>
									<c:when test="${not empty sessionScope.userId and product.sellerId == sessionScope.userId}">
										<span class="w-full py-4 bg-gray-100/50 text-gray-400 text-center rounded-[1.2rem] text-[9px] font-black uppercase tracking-widest">
											YOUR LISTING
										</span>
									</c:when>
									<c:otherwise>
										<div class="flex items-center gap-3 w-full">
											<a href="productDetail.jsp?id=${product.productId}" class="flex-grow py-4 bg-gray-900 text-white text-center rounded-[1.2rem] font-black text-[9px] uppercase tracking-widest hover:bg-black transition-all active-press">
												DETAILS
											</a>
											<c:if test="${not empty sessionScope.user}">
												<form action="cart" method="POST" class="shrink-0">
													<input type="hidden" name="action" value="add">
													<input type="hidden" name="productId" value="${product.productId}">
													<input type="hidden" name="quantity" value="1">
													<button type="submit" class="p-4 bg-primary/10 text-primary rounded-[1.2rem] hover:bg-primary hover:text-white transition-all active-press">
														<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
													</button>
												</form>
											</c:if>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- Empty State -->
			<c:if test="${empty featuredProducts}">
				<div class="py-32 text-center glass-card rounded-[4rem] max-w-4xl mx-auto">
					<div class="w-24 h-24 bg-white/50 rounded-[2.5rem] flex items-center justify-center text-gray-300 mx-auto mb-10 shadow-inner">
						<svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path></svg>
					</div>
					<h3 class="text-2xl font-black text-gray-900 uppercase tracking-tight mb-4 italic">Zero Listings Detected</h3>
					<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-10">Wait for new transmissions from campus traders.</p>
					<a href="index.jsp" class="px-12 py-5 bg-gray-900 text-white rounded-[1.5rem] font-black text-xs uppercase tracking-widest hover:bg-primary transition-all active-press">
						BACK TO NEXUS
					</a>
				</div>
			</c:if>

		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
