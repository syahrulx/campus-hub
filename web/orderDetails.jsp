<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Redirect to servlet if not forwarded
    if (request.getAttribute("orders") == null) {
        response.sendRedirect("orders");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="text-center mb-12">
				<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">My Collections</h1>
				<p class="text-sm text-gray-400 font-medium uppercase tracking-widest mt-2">Track your campus acquisitions</p>
			</div>

			<c:choose>
				<c:when test="${empty orders}">
					<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 py-32 px-10 text-center">
						<div class="w-24 h-24 rounded-[2rem] bg-gray-50 flex items-center justify-center text-gray-200 mx-auto mb-8 border border-dashed border-gray-200">
							<svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
						</div>
						<h4 class="text-xl font-black text-gray-900 italic tracking-tight uppercase mb-2">No orders yet</h4>
						<p class="text-sm text-gray-400 font-medium max-w-xs mx-auto mb-10">Start browsing the marketplace to find unique items from fellow students.</p>
						<a href="products" class="inline-flex py-4 px-10 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95">
							Browse Products
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="space-y-6">
						<c:forEach var="order" items="${orders}">
							<div class="bg-white rounded-[2.5rem] shadow-sm border border-gray-100 overflow-hidden group hover:border-primary/20 hover:shadow-xl hover:shadow-gray-100 transition-all duration-500">
								<div class="p-8 sm:p-10">
									<div class="flex flex-col sm:flex-row items-center gap-10">
										<!-- Product Preview -->
										<div class="w-28 h-28 rounded-3xl overflow-hidden bg-gray-50 border border-gray-100 shadow-inner flex-shrink-0">
											<img src="${order[6]}" alt="${order[1]}" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
										</div>

										<!-- Order Details -->
										<div class="flex-grow text-center sm:text-left min-w-0">
											<div class="flex flex-wrap items-center justify-center sm:justify-start gap-4 mb-4">
												<c:choose>
													<c:when test="${order[4] == 'COMPLETED'}">
														<span class="px-4 py-1 rounded-full bg-green-50 text-green-600 text-[10px] font-black uppercase tracking-widest italic border border-green-100 flex items-center gap-2">
															<span class="w-1 h-1 bg-green-600 rounded-full"></span>
															Delivered
														</span>
													</c:when>
													<c:when test="${order[4] == 'SHIPPED'}">
														<span class="px-4 py-1 rounded-full bg-blue-50 text-blue-600 text-[10px] font-black uppercase tracking-widest italic border border-blue-100 flex items-center gap-2">
															<span class="w-1 h-1 bg-blue-600 rounded-full animate-pulse"></span>
															In Transit
														</span>
													</c:when>
													<c:otherwise>
														<span class="px-4 py-1 rounded-full bg-yellow-50 text-yellow-600 text-[10px] font-black uppercase tracking-widest italic border border-yellow-100 flex items-center gap-2">
															<span class="w-1 h-1 bg-yellow-600 rounded-full"></span>
															Processing
														</span>
													</c:otherwise>
												</c:choose>
												<span class="text-[10px] font-black text-gray-300 uppercase tracking-widest">
													#${order[0]}
												</span>
											</div>

											<h4 class="text-xl font-black text-gray-900 italic tracking-tight uppercase mb-2 truncate">${order[1]}</h4>
											<div class="flex flex-wrap items-center justify-center sm:justify-start gap-4 text-xs font-bold text-gray-400">
												<span class="flex items-center gap-2">
													<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
													<fmt:formatDate value="${order[5]}" pattern="MMM dd, yyyy"/>
												</span>
												<span class="w-1 h-1 bg-gray-200 rounded-full overflow-hidden"></span>
												<span>Qty: <span class="text-gray-900">${order[2]}</span></span>
											</div>
										</div>

										<!-- Order Amount & Action -->
										<div class="flex flex-col items-center sm:items-end gap-3 flex-shrink-0 pt-6 sm:pt-0 border-t sm:border-t-0 border-gray-50 w-full sm:w-auto">
											<p class="text-2xl font-black text-gray-900 italic">RM <fmt:formatNumber value="${order[3]}" pattern="#,##0.00"/></p>
											<div class="flex gap-2">
												<a href="orderDetail?id=${order[0]}" class="px-6 py-2 bg-gray-50 text-gray-900 rounded-xl font-black text-[10px] uppercase tracking-widest border border-gray-100 hover:bg-white hover:shadow-lg transition-all active:scale-95">
													Details
												</a>
												<c:if test="${order[4] == 'COMPLETED'}">
									<a href="review?orderId=${order[0]}" class="px-6 py-2 bg-primary text-white rounded-xl font-black text-[10px] uppercase tracking-widest shadow-md hover:shadow-primary/20 transition-all active:scale-95">
										Review
									</a>
								</c:if>
											</div>
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

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>