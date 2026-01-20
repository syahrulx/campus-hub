<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Redirect to servlet if not forwarded
    if (request.getAttribute("sellerListings") == null) {
        response.sendRedirect("sellerListings");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12">
				<div>
					<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">Seller Dashboard</h1>
					<p class="text-sm text-gray-400 font-medium uppercase tracking-widest mt-2">Manage your campus business</p>
				</div>
				<div class="flex flex-wrap gap-4">
					<a href="messages" class="flex items-center gap-2 px-6 py-4 bg-white border border-gray-100 text-gray-900 rounded-2xl font-black text-xs uppercase tracking-widest shadow-sm hover:shadow-lg transition-all active:scale-95 group">
						<svg class="w-4 h-4 text-gray-400 group-hover:text-primary transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path></svg>
						Check Inquiries
					</a>
					<a href="sellerOrders" class="flex items-center gap-2 px-6 py-4 bg-white border border-gray-100 text-gray-900 rounded-2xl font-black text-xs uppercase tracking-widest shadow-sm hover:shadow-lg transition-all active:scale-95 group">
						<svg class="w-4 h-4 text-gray-400 group-hover:text-primary transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M6 16h.01"></path></svg>
						Manage Orders
					</a>
					<a href="addProduct" class="flex items-center gap-2 px-8 py-4 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all active:scale-95 group">
						<svg class="w-4 h-4 transform group-hover:rotate-12 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
						Sell New Item
					</a>
				</div>
			</div>

			<!-- Stats Summary Dashboard -->
			<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-12">
				<div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100 relative overflow-hidden group">
					<div class="absolute top-0 right-0 w-32 h-32 bg-primary/5 rounded-full -mr-16 -mt-16 group-hover:scale-110 transition-transform duration-700"></div>
					<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-2 italic">Gross Revenue</p>
					<h3 class="text-3xl font-black text-gray-900 italic tracking-tighter">RM <fmt:formatNumber value="${totalEarnings}" pattern="#,##0.00"/></h3>
				</div>
				<div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100 relative overflow-hidden group">
					<div class="absolute top-0 right-0 w-32 h-32 bg-green-500/5 rounded-full -mr-16 -mt-16 group-hover:scale-110 transition-transform duration-700"></div>
					<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-2 italic">Items Sold</p>
					<h3 class="text-3xl font-black text-gray-900 italic tracking-tighter">${soldCount}</h3>
				</div>
				<div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100 lg:col-span-1 sm:col-span-2 relative overflow-hidden group">
					<div class="absolute top-0 right-0 w-32 h-32 bg-blue-500/5 rounded-full -mr-16 -mt-16 group-hover:scale-110 transition-transform duration-700"></div>
					<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-2 italic">Active Adverts</p>
					<h3 class="text-3xl font-black text-gray-900 italic tracking-tighter">${activeCount}</h3>
				</div>
			</div>

			<!-- Listings Table -->
			<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 overflow-hidden">
				<c:choose>
					<c:when test="${empty sellerListings}">
						<div class="flex flex-col items-center justify-center py-32 px-10 text-center">
							<div class="w-24 h-24 rounded-[2rem] bg-gray-50 flex items-center justify-center text-gray-200 mb-8 border border-dashed border-gray-200">
								<svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
							</div>
							<h4 class="text-xl font-black text-gray-900 italic tracking-tight uppercase mb-2">No Listings Yet</h4>
							<p class="text-sm text-gray-400 font-medium max-w-xs mx-auto mb-8">You haven't listed any products yet. Start selling to other students on campus!</p>
							<a href="addProduct" class="px-10 py-4 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all active:scale-95">
								Sell Your First Item
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="overflow-x-auto">
							<table class="w-full">
								<thead>
									<tr class="bg-gray-50/50 border-b border-gray-100">
										<th class="px-8 py-6 text-left text-[10px] font-black text-gray-400 uppercase tracking-widest">Listing</th>
										<th class="px-8 py-6 text-left text-[10px] font-black text-gray-400 uppercase tracking-widest">Price</th>
										<th class="px-8 py-6 text-left text-[10px] font-black text-gray-400 uppercase tracking-widest">Listed On</th>
										<th class="px-8 py-6 text-left text-[10px] font-black text-gray-400 uppercase tracking-widest">Status</th>
										<th class="px-8 py-6 text-right text-[10px] font-black text-gray-400 uppercase tracking-widest">Actions</th>
									</tr>
								</thead>
								<tbody class="divide-y divide-gray-50">
									<c:forEach var="product" items="${sellerListings}">
										<tr class="group hover:bg-gray-50/30 transition-colors">
											<td class="px-8 py-6">
												<div class="flex items-center gap-4">
													<div class="w-14 h-14 rounded-2xl overflow-hidden bg-gray-50 border border-gray-100 shadow-inner flex-shrink-0">
														<img src="${product.imageUrl}" alt="${product.name}" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500">
													</div>
													<div>
														<p class="text-sm font-black text-gray-900 italic tracking-tight uppercase">${product.name}</p>
														<p class="text-[9px] font-black text-gray-300 uppercase tracking-widest mt-0.5">ID: ${product.productId}</p>
													</div>
												</div>
											</td>
											<td class="px-8 py-6">
												<p class="text-sm font-black text-gray-900 italic">RM <fmt:formatNumber value="${product.price}" pattern="#,##0.00"/></p>
											</td>
											<td class="px-8 py-6">
												<p class="text-xs font-bold text-gray-400"><fmt:formatDate value="${product.listedAt}" pattern="MMM dd, yyyy"/></p>
											</td>
											<td class="px-8 py-6">
												<c:choose>
													<c:when test="${product.status == 'AVAILABLE'}">
														<span class="inline-flex items-center px-3 py-1 rounded-full bg-green-50 text-green-600 text-[9px] font-black uppercase tracking-widest italic border border-green-100">
															<span class="w-1 h-1 bg-green-600 rounded-full mr-2"></span>
															Active
														</span>
													</c:when>
													<c:when test="${product.status == 'SOLD'}">
														<span class="inline-flex items-center px-3 py-1 rounded-full bg-red-50 text-red-600 text-[9px] font-black uppercase tracking-widest italic border border-red-100">
															<span class="w-1 h-1 bg-red-600 rounded-full mr-2"></span>
															Sold
														</span>
													</c:when>
													<c:otherwise>
														<span class="inline-flex items-center px-3 py-1 rounded-full bg-gray-50 text-gray-500 text-[9px] font-black uppercase tracking-widest italic border border-gray-100">
															${product.status}
														</span>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="px-8 py-6 text-right">
												<c:if test="${product.status == 'AVAILABLE'}">
													<div class="flex justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
														<a href="editProduct?id=${product.productId}" class="w-10 h-10 rounded-xl bg-white border border-gray-100 flex items-center justify-center text-gray-400 hover:text-yellow-500 hover:shadow-lg transition-all">
															<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
														</a>
														<a href="removeProduct?id=${product.productId}" class="w-10 h-10 rounded-xl bg-white border border-gray-100 flex items-center justify-center text-gray-400 hover:text-red-500 hover:shadow-lg transition-all">
															<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
														</a>
													</div>
												</c:if>
												<c:if test="${product.status == 'SOLD'}">
													<span class="text-[10px] font-black text-gray-300 uppercase tracking-widest italic">Archived</span>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>