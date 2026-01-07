<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="flex items-center justify-between mb-10">
				<h1 class="text-3xl font-black text-gray-900 tracking-tight italic">Your Shopping Cart</h1>
				<a href="products" class="text-sm font-bold text-primary hover:underline flex items-center">
					<svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
					Continue Shopping
				</a>
			</div>

			<c:choose>
				<c:when test="${empty cartItems}">
					<div class="text-center py-24 bg-white rounded-[2.5rem] shadow-sm border border-dashed border-gray-200">
						<div class="w-24 h-24 bg-gray-50 rounded-full flex items-center justify-center mx-auto mb-6 text-gray-300 transform hover:scale-110 transition-transform duration-500">
							<svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 11V7a4 4 0 11-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
						</div>
						<h3 class="text-2xl font-bold text-gray-900 mb-2">Your cart feels lonely</h3>
						<p class="text-gray-500 mb-8 max-w-sm mx-auto">Explore all the amazing deals from fellow students and fill it up!</p>
						<a href="products" class="inline-flex items-center bg-primary text-white px-10 py-4 rounded-2xl font-black shadow-lg hover:shadow-primary/20 transition-all">
							Go Shopping
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="lg:flex lg:gap-12 items-start">
						<!-- Cart Items List -->
						<div class="lg:w-8/12 space-y-6 mb-12 lg:mb-0">
							<c:forEach var="item" items="${cartItems}">
								<div class="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 flex flex-col sm:flex-row items-center gap-6 group hover:shadow-md transition-all duration-300">
									<!-- Image -->
									<div class="w-24 h-24 rounded-2xl bg-gray-50 overflow-hidden flex-shrink-0">
										<img src="${item.product.imageUrl}" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500">
									</div>
									
									<!-- Details -->
									<div class="flex-grow text-center sm:text-left">
										<h4 class="text-lg font-bold text-gray-900 leading-tight">${item.product.name}</h4>
										<p class="text-sm text-gray-400 mt-1">Unit Price: RM <fmt:formatNumber value="${item.product.price}" pattern="#,##0.00"/></p>
										
										<div class="mt-4 flex items-center justify-center sm:justify-start gap-4">
											<form action="cart" method="POST" class="flex items-center bg-gray-50 rounded-xl p-1 border border-gray-100">
												<input type="hidden" name="action" value="update">
												<input type="hidden" name="cartItemId" value="${item.cartItemId}">
												<input type="number" name="quantity" value="${item.quantity}" min="1" 
													class="w-12 bg-transparent text-center font-bold text-gray-900 focus:outline-none">
												<button type="submit" class="text-[10px] font-black uppercase tracking-widest bg-white px-3 py-2 rounded-lg shadow-sm hover:text-primary transition-colors">
													Sync
												</button>
											</form>
											
											<form action="cart" method="POST" class="inline">
												<input type="hidden" name="action" value="remove">
												<input type="hidden" name="cartItemId" value="${item.cartItemId}">
												<button type="submit" class="text-gray-300 hover:text-red-500 transition-colors">
													<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
												</button>
											</form>
										</div>
									</div>

									<!-- Subtotal -->
									<div class="sm:text-right border-t sm:border-t-0 pt-4 sm:pt-0 w-full sm:w-auto">
										<span class="text-[10px] font-black text-gray-300 uppercase tracking-widest block mb-1">Subtotal</span>
										<span class="text-xl font-black text-gray-900 tracking-tight italic">
											RM <fmt:formatNumber value="${item.subtotal}" pattern="#,##0.00"/>
										</span>
									</div>
								</div>
							</c:forEach>
						</div>

						<!-- Order Summary -->
						<div class="lg:w-4/12 sticky top-28">
							<div class="bg-gray-900 rounded-[2.5rem] p-10 text-white shadow-2xl shadow-gray-200 relative overflow-hidden">
								<div class="absolute top-0 right-0 w-32 h-32 bg-primary/20 rounded-bl-full -mr-16 -mt-16"></div>
								<h2 class="text-2xl font-black mb-10 tracking-tight italic">Order Summary</h2>
								
								<div class="space-y-6">
									<div class="flex justify-between items-center text-gray-400">
										<span class="text-sm uppercase tracking-widest font-bold">Subtotal</span>
										<span class="font-bold text-white">RM <fmt:formatNumber value="${cartTotal}" pattern="#,##0.00"/></span>
									</div>
									<div class="flex justify-between items-center text-gray-400">
										<span class="text-sm uppercase tracking-widest font-bold">Shipping</span>
										<span class="text-primary font-black">FREE</span>
									</div>
									<div class="h-[1px] bg-gray-800"></div>
									<div class="flex justify-between items-end">
										<span class="text-sm uppercase tracking-[0.2em] font-black text-primary">Grand Total</span>
										<span class="text-4xl font-black tracking-tight italic">
											RM <fmt:formatNumber value="${cartTotal}" pattern="#,##0.00"/>
										</span>
									</div>
								</div>

								<div class="mt-12">
									<form action="payment" method="GET">
										<button type="submit" class="w-full bg-primary hover:bg-opacity-90 text-white py-5 rounded-2xl font-black text-lg transition-all transform active:scale-[0.98] shadow-xl shadow-red-900/20">
											Checkout Now
										</button>
									</form>
									<p class="text-[10px] text-gray-500 mt-6 text-center uppercase tracking-widest font-bold">
										Secure Encrypted Transaction
									</p>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
