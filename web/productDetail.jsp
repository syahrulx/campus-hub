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
	<div class="bg-transparent min-h-screen pb-20">
		<div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<!-- Breadcrumb -->
			<nav class="flex mb-12" aria-label="Breadcrumb">
				<ol class="flex items-center space-x-3 text-[10px] font-black uppercase tracking-widest text-gray-400 italic">
					<li><a href="products" class="hover:text-primary transition-colors">Marketplace</a></li>
					<li><div class="w-1 h-1 rounded-full bg-gray-300"></div></li>
					<li><a href="products?category=${product.categoryId}" class="hover:text-primary transition-colors">${categoryName}</a></li>
					<li><div class="w-1 h-1 rounded-full bg-primary/40"></div></li>
					<li class="text-gray-900">${product.name}</li>
				</ol>
			</nav>

			<div class="lg:flex lg:gap-16 items-start">
				<!-- Left: Image Section -->
				<div class="lg:w-5/12 sticky top-32 mb-16 lg:mb-0">
					<div class="glass-card rounded-[3rem] overflow-hidden aspect-[3/4] flex items-center justify-center p-8 group border-white/40">
						<img src="${not empty product.imageUrl ? product.imageUrl : 'images/product-placeholder.png'}" 
							 alt="${product.name}" 
							 class="max-w-full max-h-full object-contain transform group-hover:scale-110 transition-transform duration-1000" />
					</div>
				</div>

				<!-- Right: Product Information -->
				<div class="lg:w-7/12">
					<div class="space-y-12">
						<!-- Status & Title -->
						<div class="space-y-6">
							<div class="flex items-center gap-4">
								<c:choose>
									<c:when test="${product.status == 'AVAILABLE'}">
										<span class="inline-flex items-center px-5 py-2 rounded-2xl text-[10px] font-black bg-green-500/10 text-green-600 border border-green-500/20 uppercase tracking-widest italic">Available</span>
									</c:when>
									<c:otherwise>
										<span class="inline-flex items-center px-5 py-2 rounded-2xl text-[10px] font-black bg-red-500/10 text-red-600 border border-red-500/20 uppercase tracking-widest italic">${product.status}</span>
									</c:otherwise>
								</c:choose>
								<div class="w-1 h-1 rounded-full bg-gray-200"></div>
								<span class="text-[10px] font-black text-gray-400 uppercase tracking-widest italic">${product.condition} Condition</span>
							</div>
							<h1 class="text-4xl sm:text-5xl font-black text-gray-900 leading-tight tracking-tighter heading-aura italic uppercase">
								${product.name}
							</h1>
							<div class="text-3xl font-black text-primary italic">
								RM <fmt:formatNumber value="${product.price}" pattern="#,##0.00"/>
							</div>
						</div>

						<!-- Description -->
						<!-- Description -->
						<div class="bg-white rounded-[2rem] shadow-sm p-8 border border-gray-100">
							<p class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] mb-4">Description</p>
							<p class="text-gray-600 leading-relaxed font-medium text-base">
								${product.description}
							</p>
						</div>

						<!-- Details Grid -->
						<div class="grid grid-cols-3 gap-4">
							<div class="bg-gray-50 p-5 rounded-[2rem] border border-gray-100 text-center">
								<p class="text-[9px] font-black text-gray-400 uppercase tracking-widest mb-2">Category</p>
								<p class="text-sm font-bold text-gray-900 uppercase">${categoryName}</p>
							</div>
							<div class="bg-gray-50 p-5 rounded-[2rem] border border-gray-100 text-center">
								<p class="text-[9px] font-black text-gray-400 uppercase tracking-widest mb-2">In Stock</p>
								<p class="text-sm font-bold ${product.quantity > 0 ? 'text-green-600' : 'text-red-500'} uppercase">${product.quantity} ${product.quantity == 1 ? 'unit' : 'units'}</p>
							</div>
							<div class="bg-gray-50 p-5 rounded-[2rem] border border-gray-100 text-center">
								<p class="text-[9px] font-black text-gray-400 uppercase tracking-widest mb-2">Posted</p>
								<p class="text-sm font-bold text-gray-900 uppercase"><fmt:formatDate value="${product.listedAt}" pattern="MMM dd"/></p>
							</div>
						</div>

						<!-- Actions -->
						<c:if test="${product.status == 'AVAILABLE'}">
							<div class="space-y-6 pt-6">
								<c:choose>
									<c:when test="${product.sellerId == sessionScope.userId}">
										<div class="grid grid-cols-2 gap-4">
											<a href="messages" class="flex items-center justify-center w-full bg-white border-2 border-gray-100 text-gray-900 py-6 rounded-[2rem] font-black text-xs uppercase tracking-[0.2em] hover:bg-gray-50 transition-all active-press">
												<svg class="w-5 h-5 mr-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path></svg>
												Check Inquiries
											</a>
											<a href="editProduct?id=${product.productId}" class="flex items-center justify-center w-full bg-gray-900 text-white py-6 rounded-[2rem] font-black text-xs uppercase tracking-[0.2em] shadow-xl hover:bg-black transition-all active-press">
												<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
												Edit Item
											</a>
										</div>
									</c:when>
									<c:when test="${not empty sessionScope.userId}">
										<form action="cart" method="POST">
											<input type="hidden" name="action" value="add">
											<input type="hidden" name="productId" value="${product.productId}">
											<input type="hidden" name="quantity" value="1">
											<button type="submit" class="w-full bg-primary hover:bg-primary-dark text-white py-6 rounded-[2.5rem] font-black text-sm uppercase tracking-[0.2em] shadow-2xl shadow-primary/20 transition-all active-press flex items-center justify-center group">
												<svg class="w-6 h-6 mr-3 transform group-hover:rotate-12 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
												Add to Cart
											</button>
										</form>
										<a href="messages?with=${product.sellerId}&productId=${product.productId}" class="flex items-center justify-center w-full glass-card hover:bg-white/40 text-gray-900 py-6 rounded-[2.5rem] font-black text-xs uppercase tracking-[0.2em] transition-all border-white/50 active-press">
											<svg class="w-6 h-6 mr-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path></svg>
											Secure Messenger
										</a>
									</c:when>
									<c:otherwise>
										<a href="login.jsp" class="flex items-center justify-center w-full bg-gray-900 text-white py-6 rounded-[2rem] font-black text-xs uppercase tracking-[0.2em] shadow-2xl transition-all active-press">
											AUTH REQUIRED TO PURCHASE
										</a>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>

						<!-- Seller Premium Card -->
                        <c:if test="${seller != null}">
                            <a href="seller?id=${product.sellerId}" class="block bg-white shadow-sm p-6 rounded-[2.5rem] flex items-center gap-6 group hover:shadow-md transition-all border border-gray-100">
                                <div class="flex-shrink-0 w-16 h-16 rounded-[1.2rem] bg-gray-900 flex items-center justify-center text-white font-black text-2xl shadow-lg">
                                    ${seller.name.substring(0,1).toUpperCase()}
                                </div>
                                <div class="flex-grow">
                                    <p class="text-[9px] font-black text-gray-400 uppercase tracking-[0.2em] mb-1">Seller</p>
                                    <h4 class="text-xl font-bold text-gray-900 leading-tight group-hover:text-primary transition-colors uppercase">${seller.name}</h4>
                                    <p class="text-xs font-medium text-gray-500 mt-0.5">${seller.university}</p>
                                </div>
                                <div class="flex-shrink-0">
                                    <div class="w-10 h-10 rounded-xl bg-gray-50 flex items-center justify-center text-gray-400 group-hover:text-primary transition-colors">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
                                    </div>
                                </div>
                            </a>
                        </c:if>
					</div>
				</div>
			</div>

			<!-- Related Products Grid -->
			<c:if test="${not empty relatedProducts}">
				<div class="mt-40">
					<div class="flex items-end justify-between mb-16">
						<div>
							<p class="text-[10px] font-black text-accent uppercase tracking-[0.3em] mb-2">You May Also Like</p>
							<h3 class="text-4xl font-black text-gray-900 italic tracking-tighter uppercase">Similar Products</h3>
						</div>
						<div class="hidden md:block h-px bg-white/50 flex-grow mx-16"></div>
					</div>
					
					<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-12">
						<c:forEach var="rp" items="${relatedProducts}">
							<div class="group flex flex-col h-full glass-card rounded-[3rem] p-5 hover-lift">
								<div class="relative aspect-square rounded-[2.2rem] overflow-hidden bg-white/50 mb-7">
									<img src="${not empty rp.imageUrl ? rp.imageUrl : 'images/product-placeholder.png'}" 
										 alt="${rp.name}" 
										 class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" />
									<div class="absolute inset-0 bg-primary/10 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
										<a href="productDetail?id=${rp.productId}" class="px-8 py-3 bg-white text-gray-900 rounded-xl font-black text-[10px] uppercase tracking-widest shadow-2xl active-press">DETAILS</a>
									</div>
								</div>
								<div class="px-2 flex flex-col flex-1">
									<h4 class="text-sm font-black text-gray-900 italic uppercase tracking-tight truncate mb-4 group-hover:text-primary transition-colors">${rp.name}</h4>
									<p class="text-xl font-black text-primary italic mt-auto">
										RM <fmt:formatNumber value="${rp.price}" pattern="#,##0.00"/>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
	</div>
		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
