<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<!-- Page Header -->
			<div class="mb-12 flex flex-col md:flex-row md:items-end justify-between gap-6">
				<div>
					<h1 class="text-4xl font-black text-gray-900 tracking-tighter italic uppercase mb-2">Pending Protocol</h1>
					<p class="text-sm text-gray-400 font-medium uppercase tracking-widest">Active Acquisitions to be Shipped</p>
				</div>
				
				<!-- Navigation Tabs -->
				<div class="flex bg-white p-1.5 rounded-2xl shadow-sm border border-gray-100">
					<a href="sellerListings.jsp" class="px-6 py-2.5 rounded-xl text-[10px] font-black uppercase tracking-widest text-gray-400 hover:text-gray-900 transition-colors">Current Listings</a>
					<a href="unshippedItems.jsp" class="px-6 py-2.5 bg-gray-900 text-white rounded-xl text-[10px] font-black uppercase tracking-widest shadow-lg shadow-black/10">Pending Actions</a>
					<a href="shippedItems.jsp" class="px-6 py-2.5 rounded-xl text-[10px] font-black uppercase tracking-widest text-gray-400 hover:text-gray-900 transition-colors">Archive Feed</a>
				</div>
			</div>

			<!-- Actionable Table -->
			<div class="bg-white rounded-[3rem] shadow-xl shadow-gray-200/50 border border-gray-100 overflow-hidden mb-12">
				<div class="overflow-x-auto">
					<table class="w-full text-left border-collapse">
						<thead>
							<tr class="bg-gray-50 border-b border-gray-100">
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Transaction ID</th>
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Acquisition</th>
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Acquirer</th>
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Valuation</th>
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Authorized Date</th>
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] text-center">Protocol Actions</th>
							</tr>
						</thead>
						<tbody class="divide-y divide-gray-50">
							<!-- Row 1 -->
							<tr class="group hover:bg-gray-50/50 transition-colors">
								<td class="px-8 py-6">
									<span class="text-xs font-black text-gray-900 group-hover:text-primary transition-colors uppercase tracking-tight">#ORD-2024-001240</span>
								</td>
								<td class="px-8 py-6">
									<div class="flex items-center gap-4">
										<div class="w-10 h-10 rounded-xl overflow-hidden bg-gray-100 border border-gray-100 flex-shrink-0">
											<img src="images/speaker.jpg" class="w-full h-full object-cover">
										</div>
										<span class="text-xs font-bold text-gray-900 italic">JBL Flip 5 Speaker</span>
									</div>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-medium text-gray-500">Sarah Lim</span>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-black text-gray-900 italic">RM 280.00</span>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-medium text-gray-400">Dec 13, 2024</span>
								</td>
								<td class="px-8 py-6">
									<div class="flex items-center justify-center gap-2">
										<a href="messages.jsp" class="p-2.5 bg-gray-50 text-gray-400 rounded-xl hover:text-gray-900 transition-colors group/btn relative">
											<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path></svg>
										</a>
										<a href="shippedItems.jsp" class="px-4 py-2 bg-green-500 text-white rounded-xl text-[9px] font-black uppercase tracking-widest shadow-lg shadow-green-500/20 hover:bg-green-600 transition-all active:scale-95">
											Mark Shipped
										</a>
									</div>
								</td>
							</tr>
							<!-- Role 2 -->
							<tr class="group hover:bg-gray-50/50 transition-colors">
								<td class="px-8 py-6">
									<span class="text-xs font-black text-gray-900 group-hover:text-primary transition-colors uppercase tracking-tight">#ORD-2024-001235</span>
								</td>
								<td class="px-8 py-6">
									<div class="flex items-center gap-4">
										<div class="w-10 h-10 rounded-xl overflow-hidden bg-gray-100 border border-gray-100 flex-shrink-0">
											<img src="images/profile.jpg" class="w-full h-full object-cover">
										</div>
										<span class="text-xs font-bold text-gray-900 italic">Calculus Textbook</span>
									</div>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-medium text-gray-500">Ahmad Hassan</span>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-black text-gray-900 italic">RM 45.00</span>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-medium text-gray-400">Dec 12, 2024</span>
								</td>
								<td class="px-8 py-6">
									<div class="flex items-center justify-center gap-2">
										<a href="messages.jsp" class="p-2.5 bg-gray-50 text-gray-400 rounded-xl hover:text-gray-900 transition-colors group/btn">
											<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path></svg>
										</a>
										<a href="shippedItems.jsp" class="px-4 py-2 bg-green-500 text-white rounded-xl text-[9px] font-black uppercase tracking-widest shadow-lg shadow-green-500/20 hover:bg-green-600 transition-all active:scale-95">
											Mark Shipped
										</a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<!-- Protocol Reminder -->
			<div class="p-8 bg-blue-50 border border-blue-100 rounded-[2.5rem] flex flex-col md:flex-row items-center gap-6">
				<div class="w-16 h-16 bg-blue-500 text-white rounded-[1.5rem] flex items-center justify-center flex-shrink-0 animate-pulse">
					<svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
				</div>
				<div class="text-center md:text-left">
					<h4 class="text-sm font-black text-blue-900 uppercase tracking-tight mb-1 italic">Mercantile Advisory</h4>
					<p class="text-xs font-medium text-blue-700 leading-relaxed uppercase tracking-wide">
						Ensure direct communication with acquirers to synchronize logistics before finalizing the shipping status.
					</p>
				</div>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>