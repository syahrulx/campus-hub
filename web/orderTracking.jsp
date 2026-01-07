<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Redirect to servlet if not forwarded
    if (request.getAttribute("order") == null) {
        response.sendRedirect("orders");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<!-- Back Button -->
			<a href="orders" class="inline-flex items-center gap-2 text-gray-400 hover:text-gray-600 font-black text-xs uppercase tracking-widest mb-8 group">
				<svg class="w-4 h-4 group-hover:-translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
				Back to Orders
			</a>

			<!-- Order Card -->
			<div class="bg-white rounded-[3rem] shadow-xl border border-gray-100 overflow-hidden">
				
				<!-- Header -->
				<div class="bg-gray-50 px-10 py-6 border-b border-gray-100">
					<div class="flex flex-wrap items-center justify-between gap-4">
						<div>
							<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest">Order ID</p>
							<p class="text-lg font-black text-gray-900 italic tracking-tight">#${order[0]}</p>
						</div>
						<div class="text-right">
							<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest">Order Date</p>
							<p class="text-sm font-bold text-gray-600"><fmt:formatDate value="${order[5]}" pattern="MMM dd, yyyy · HH:mm"/></p>
						</div>
					</div>
				</div>

				<div class="p-10">
					
					<!-- Status Timeline -->
					<div class="mb-12">
						<h3 class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-6">Order Status</h3>
						<div class="flex items-center justify-between relative">
							<!-- Progress Line -->
							<div class="absolute left-0 right-0 top-1/2 h-1 bg-gray-100 -translate-y-1/2 rounded-full overflow-hidden">
								<c:choose>
									<c:when test="${order[4] == 'COMPLETED'}">
										<div class="h-full bg-green-500 w-full"></div>
									</c:when>
									<c:when test="${order[4] == 'SHIPPED'}">
										<div class="h-full bg-blue-500 w-2/3"></div>
									</c:when>
									<c:when test="${order[4] == 'CANCELLED'}">
										<div class="h-full bg-red-500 w-1/3"></div>
									</c:when>
									<c:otherwise>
										<div class="h-full bg-yellow-500 w-1/3"></div>
									</c:otherwise>
								</c:choose>
							</div>
							
							<!-- Step 1: Pending -->
							<div class="relative z-10 flex flex-col items-center">
								<div class="w-10 h-10 rounded-full flex items-center justify-center
									<c:choose>
										<c:when test="${order[4] == 'CANCELLED'}">bg-red-500 text-white</c:when>
										<c:otherwise>bg-green-500 text-white</c:otherwise>
									</c:choose>
								">
									<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
								</div>
								<p class="text-[10px] font-black uppercase tracking-widest mt-2 text-gray-600">Ordered</p>
							</div>
							
							<!-- Step 2: Shipped -->
							<div class="relative z-10 flex flex-col items-center">
								<div class="w-10 h-10 rounded-full flex items-center justify-center
									<c:choose>
										<c:when test="${order[4] == 'SHIPPED' || order[4] == 'COMPLETED'}">bg-blue-500 text-white</c:when>
										<c:when test="${order[4] == 'CANCELLED'}">bg-gray-200 text-gray-400</c:when>
										<c:otherwise>bg-gray-200 text-gray-400</c:otherwise>
									</c:choose>
								">
									<c:choose>
										<c:when test="${order[4] == 'SHIPPED' || order[4] == 'COMPLETED'}">
											<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
										</c:when>
										<c:otherwise>
											<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path></svg>
										</c:otherwise>
									</c:choose>
								</div>
								<p class="text-[10px] font-black uppercase tracking-widest mt-2 ${order[4] == 'SHIPPED' || order[4] == 'COMPLETED' ? 'text-gray-600' : 'text-gray-300'}">Shipped</p>
							</div>
							
							<!-- Step 3: Delivered -->
							<div class="relative z-10 flex flex-col items-center">
								<div class="w-10 h-10 rounded-full flex items-center justify-center
									<c:choose>
										<c:when test="${order[4] == 'COMPLETED'}">bg-green-500 text-white</c:when>
										<c:when test="${order[4] == 'CANCELLED'}">bg-gray-200 text-gray-400</c:when>
										<c:otherwise>bg-gray-200 text-gray-400</c:otherwise>
									</c:choose>
								">
									<c:choose>
										<c:when test="${order[4] == 'COMPLETED'}">
											<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
										</c:when>
										<c:otherwise>
											<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
										</c:otherwise>
									</c:choose>
								</div>
								<p class="text-[10px] font-black uppercase tracking-widest mt-2 ${order[4] == 'COMPLETED' ? 'text-gray-600' : 'text-gray-300'}">Delivered</p>
							</div>
						</div>
						
						<!-- Status Badge -->
						<div class="mt-8 text-center">
							<c:choose>
								<c:when test="${order[4] == 'COMPLETED'}">
									<span class="inline-flex items-center px-6 py-2 rounded-full bg-green-50 text-green-600 text-xs font-black uppercase tracking-widest border border-green-100">
										<span class="w-2 h-2 bg-green-500 rounded-full mr-3"></span>
										Delivered Successfully
									</span>
								</c:when>
								<c:when test="${order[4] == 'SHIPPED'}">
									<span class="inline-flex items-center px-6 py-2 rounded-full bg-blue-50 text-blue-600 text-xs font-black uppercase tracking-widest border border-blue-100">
										<span class="w-2 h-2 bg-blue-500 rounded-full mr-3 animate-pulse"></span>
										In Transit
									</span>
								</c:when>
								<c:when test="${order[4] == 'CANCELLED'}">
									<span class="inline-flex items-center px-6 py-2 rounded-full bg-red-50 text-red-600 text-xs font-black uppercase tracking-widest border border-red-100">
										<span class="w-2 h-2 bg-red-500 rounded-full mr-3"></span>
										Order Cancelled
									</span>
								</c:when>
								<c:otherwise>
									<span class="inline-flex items-center px-6 py-2 rounded-full bg-yellow-50 text-yellow-600 text-xs font-black uppercase tracking-widest border border-yellow-100">
										<span class="w-2 h-2 bg-yellow-500 rounded-full mr-3"></span>
										Awaiting Shipment
									</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<!-- Product Info -->
					<div class="flex items-center gap-6 p-6 bg-gray-50 rounded-3xl border border-gray-100 mb-8">
						<div class="w-24 h-24 rounded-2xl overflow-hidden bg-white border border-gray-100 shadow-inner flex-shrink-0">
							<img src="${order[6]}" alt="${order[1]}" class="w-full h-full object-cover">
						</div>
						<div class="flex-grow min-w-0">
							<h4 class="text-lg font-black text-gray-900 italic tracking-tight uppercase truncate">${order[1]}</h4>
							<p class="text-sm text-gray-400 font-medium mt-1">Quantity: <span class="text-gray-900 font-bold">${order[2]}</span></p>
							<p class="text-sm text-gray-400 font-medium">Unit Price: <span class="text-gray-900 font-bold">RM <fmt:formatNumber value="${order[8]}" pattern="#,##0.00"/></span></p>
						</div>
						<div class="text-right flex-shrink-0">
							<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest">Total</p>
							<p class="text-2xl font-black text-primary italic">RM <fmt:formatNumber value="${order[3]}" pattern="#,##0.00"/></p>
						</div>
					</div>

					<!-- Seller Info -->
					<div class="p-6 bg-gray-50 rounded-3xl border border-gray-100">
						<h3 class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-4">Seller Information</h3>
						<div class="flex items-center gap-4">
							<div class="w-14 h-14 bg-primary/10 rounded-2xl flex items-center justify-center">
								<span class="text-xl font-black text-primary italic">${order[10].substring(0,1)}</span>
							</div>
							<div class="flex-grow">
								<p class="font-black text-gray-900 italic uppercase">${order[10]}</p>
								<div class="flex flex-wrap items-center gap-4 mt-1 text-xs font-bold text-gray-400">
									<span class="flex items-center gap-1">
										<svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
										${order[11]}
									</span>
									<c:if test="${not empty order[12]}">
										<span class="flex items-center gap-1">
											<svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path></svg>
											${order[12]}
										</span>
									</c:if>
								</div>
							</div>
							<a href="messages" class="px-6 py-3 bg-primary text-white rounded-2xl font-black text-[10px] uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all active:scale-95">
								Message
							</a>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>

<jsp:include page="footer.jsp" />
</body>
</html>
