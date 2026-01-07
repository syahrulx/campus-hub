<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Redirect to servlet if not forwarded
    if (request.getAttribute("sellerOrders") == null) {
        response.sendRedirect("sellerOrders");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12">
				<div>
					<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">Manage Orders</h1>
					<p class="text-sm text-gray-400 font-medium uppercase tracking-widest mt-2">Track your campus sales lifecycle</p>
				</div>
				<div>
					<a href="sellerListings" class="flex items-center gap-2 px-6 py-4 bg-white border border-gray-100 text-gray-900 rounded-2xl font-black text-xs uppercase tracking-widest shadow-sm hover:shadow-lg transition-all active:scale-95 group">
						<svg class="w-4 h-4 text-gray-400 group-hover:-translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
						Back to Listings
					</a>
				</div>
			</div>

			<!-- Modern Tabs -->
			<div class="flex items-center gap-2 p-1.5 bg-gray-200/50 rounded-[2rem] w-fit mb-12">
				<a href="sellerOrders?filter=pending" class="px-8 py-3 rounded-[1.5rem] font-black text-[10px] uppercase tracking-widest transition-all ${currentFilter == 'pending' ? 'bg-white text-gray-900 shadow-lg' : 'text-gray-400 hover:text-gray-600'}">
					Pending <span class="ml-2 opacity-50 font-medium">${pendingCount}</span>
				</a>
				<a href="sellerOrders?filter=shipped" class="px-8 py-3 rounded-[1.5rem] font-black text-[10px] uppercase tracking-widest transition-all ${currentFilter == 'shipped' ? 'bg-white text-gray-900 shadow-lg' : 'text-gray-400 hover:text-gray-600'}">
					Shipped <span class="ml-2 opacity-50 font-medium">${shippedCount}</span>
				</a>
				<a href="sellerOrders?filter=completed" class="px-8 py-3 rounded-[1.5rem] font-black text-[10px] uppercase tracking-widest transition-all ${currentFilter == 'completed' ? 'bg-white text-gray-900 shadow-lg' : 'text-gray-400 hover:text-gray-600'}">
					Completed <span class="ml-2 opacity-50 font-medium">${completedCount}</span>
				</a>
			</div>

			<!-- Orders List -->
			<c:choose>
				<c:when test="${empty sellerOrders}">
					<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 py-32 px-10 text-center">
						<div class="w-24 h-24 rounded-[2rem] bg-gray-50 flex items-center justify-center text-gray-200 mx-auto mb-8 border border-dashed border-gray-200">
							<svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path></svg>
						</div>
						<h4 class="text-xl font-black text-gray-900 italic tracking-tight uppercase mb-2">No ${currentFilter} orders</h4>
						<p class="text-sm text-gray-400 font-medium max-w-xs mx-auto">
							<c:choose>
								<c:when test="${currentFilter == 'pending'}">When buyers purchase your items, they'll appear here for fulfillment.</c:when>
								<c:when test="${currentFilter == 'shipped'}">Orders you've marked as delivered or sent will appear here.</c:when>
								<c:otherwise>All successfully fulfilled transactions are archived here.</c:otherwise>
							</c:choose>
						</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="space-y-6">
						<c:forEach var="order" items="${sellerOrders}">
							<div class="bg-white rounded-[2.5rem] shadow-sm border border-gray-100 overflow-hidden group hover:border-primary/20 hover:shadow-xl hover:shadow-gray-100 transition-all duration-500">
								<div class="p-8 sm:p-10">
									<div class="grid grid-cols-1 lg:grid-cols-12 gap-10 items-center">
										
										<!-- Product Detail -->
										<div class="lg:col-span-5 flex items-center gap-6">
											<div class="w-24 h-24 rounded-3xl overflow-hidden bg-gray-50 border border-gray-100 shadow-inner flex-shrink-0">
												<img src="${order[6]}" alt="${order[1]}" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
											</div>
											<div class="min-w-0">
												<h4 class="text-lg font-black text-gray-900 italic truncate tracking-tight uppercase mb-1">${order[1]}</h4>
												<div class="flex items-center gap-3 text-[10px] font-black text-gray-400 uppercase tracking-widest">
													<span>ID: <span class="text-gray-900">${order[0]}</span></span>
													<span class="w-1 h-1 bg-gray-200 rounded-full"></span>
													<span>Qty: <span class="text-gray-900">${order[2]}</span></span>
												</div>
												<p class="text-xl font-black text-primary italic mt-3">RM <fmt:formatNumber value="${order[3]}" pattern="#,##0.00"/></p>
											</div>
										</div>

										<!-- Buyer Section -->
										<div class="lg:col-span-4 space-y-4 pt-6 lg:pt-0 lg:border-l border-gray-50 lg:pl-10">
											<p class="text-[10px] font-black text-gray-300 uppercase tracking-widest">Acquired By</p>
											<div>
												<p class="font-black text-gray-900 italic uppercase flex items-center gap-2">
													${order[7]}
													<span class="w-1.5 h-1.5 bg-green-500 rounded-full"></span>
												</p>
												<div class="mt-2 space-y-1">
													<p class="text-[11px] font-bold text-gray-400 flex items-center gap-2">
														<svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
														${order[8]}
													</p>
													<c:if test="${not empty order[9]}">
														<p class="text-[11px] font-bold text-gray-400 flex items-center gap-2">
															<svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path></svg>
															${order[9]}
														</p>
													</c:if>
												</div>
												<p class="text-[9px] font-black text-gray-300 uppercase tracking-widest mt-4 flex items-center gap-1">
													<svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
													<fmt:formatDate value="${order[5]}" pattern="MMM dd, yyyy · HH:mm"/>
												</p>
											</div>
										</div>

										<!-- Actions Section -->
										<div class="lg:col-span-3 text-right space-y-6 pt-6 lg:pt-0">
											<c:choose>
												<c:when test="${order[4] == 'PENDING'}">
													<span class="inline-flex items-center px-4 py-1.5 rounded-full bg-yellow-50 text-yellow-600 text-[10px] font-black uppercase tracking-widest italic border border-yellow-100">
														<span class="w-1 h-1 bg-yellow-600 rounded-full mr-2"></span>
														Awaiting Dispatch
													</span>
													<div class="flex flex-col gap-2 mt-6">
														<form action="sellerOrders" method="POST">
															<input type="hidden" name="orderId" value="${order[0]}">
															<input type="hidden" name="action" value="ship">
															<button type="submit" class="w-full py-4 bg-primary text-white rounded-2xl font-black text-[10px] uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95 flex items-center justify-center gap-2 group">
																<svg class="w-4 h-4 transform group-hover:translate-x-1 group-hover:-translate-y-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path></svg>
																Mark Shipped
															</button>
														</form>
														<form action="sellerOrders" method="POST">
															<input type="hidden" name="orderId" value="${order[0]}">
															<input type="hidden" name="action" value="cancel">
															<button type="submit" onclick="return confirm('Cancel this order?');" class="w-full py-3 text-gray-300 hover:text-red-500 font-black text-[9px] uppercase tracking-[0.2em] transition-colors">
																Void Transaction
															</button>
														</form>
													</div>
												</c:when>
												<c:when test="${order[4] == 'SHIPPED'}">
													<span class="inline-flex items-center px-4 py-1.5 rounded-full bg-blue-50 text-blue-600 text-[10px] font-black uppercase tracking-widest italic border border-blue-100">
														<span class="w-1 h-1 bg-blue-600 rounded-full mr-2 animate-pulse"></span>
														In Transit
													</span>
													<form action="sellerOrders" method="POST" class="mt-6">
														<input type="hidden" name="orderId" value="${order[0]}">
														<input type="hidden" name="action" value="complete">
														<button type="submit" class="w-full py-4 bg-green-500 text-white rounded-2xl font-black text-[10px] uppercase tracking-widest shadow-lg shadow-green-900/10 hover:bg-green-600 transition-all transform active:scale-95 flex items-center justify-center gap-2 group">
															<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
															Mark Completed
														</button>
													</form>
												</c:when>
												<c:when test="${order[4] == 'COMPLETED'}">
													<div class="flex flex-col items-end gap-2">
														<span class="inline-flex items-center px-4 py-1.5 rounded-full bg-green-50 text-green-600 text-[10px] font-black uppercase tracking-widest italic border border-green-100">
															<svg class="w-3 h-3 mr-2" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>
															Fulfilled
														</span>
														<p class="text-[9px] font-black text-gray-300 uppercase tracking-widest italic">Archived Transaction</p>
													</div>
												</c:when>
												<c:when test="${order[4] == 'CANCELLED'}">
													<span class="inline-flex items-center px-4 py-1.5 rounded-full bg-red-50 text-red-600 text-[10px] font-black uppercase tracking-widest italic border border-red-100">
														Voided
													</span>
												</c:when>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

		</div>
	</div>

<jsp:include page="footer.jsp" />
</body>
</html>
