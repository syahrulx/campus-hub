<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<!-- Page Header -->
			<div class="mb-12 flex flex-col md:flex-row md:items-end justify-between gap-6">
				<div>
					<h1 class="text-4xl font-black text-gray-900 tracking-tighter italic uppercase mb-2">Order Archive</h1>
					<p class="text-sm text-gray-400 font-medium uppercase tracking-widest">Successful Campus Transactions</p>
				</div>
				
				<!-- Navigation Tabs -->
				<div class="flex bg-white p-1.5 rounded-2xl shadow-sm border border-gray-100">
					<a href="sellerListings.jsp" class="px-6 py-2.5 rounded-xl text-[10px] font-black uppercase tracking-widest text-gray-400 hover:text-gray-900 transition-colors">Current Listings</a>
					<a href="unshippedItems.jsp" class="px-6 py-2.5 rounded-xl text-[10px] font-black uppercase tracking-widest text-gray-400 hover:text-gray-900 transition-colors">Pending Actions</a>
					<a href="shippedItems.jsp" class="px-6 py-2.5 bg-gray-900 text-white rounded-xl text-[10px] font-black uppercase tracking-widest shadow-lg shadow-black/10">Archive Feed</a>
				</div>
			</div>

			<!-- Summary Dashboard -->
			<div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
				<div class="bg-white p-8 rounded-[2.5rem] border border-gray-100 shadow-sm flex flex-col items-center text-center group hover:border-primary/20 transition-all duration-500">
					<div class="w-12 h-12 bg-primary/5 rounded-2xl flex items-center justify-center text-primary mb-4 group-hover:scale-110 transition-transform">
						<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
					</div>
					<h3 class="text-2xl font-black text-gray-900 italic tracking-tight mb-1">RM 7,140.00</h3>
					<p class="text-[9px] font-black text-gray-300 uppercase tracking-widest">Total Secure Revenue</p>
				</div>
				
				<div class="bg-white p-8 rounded-[2.5rem] border border-gray-100 shadow-sm flex flex-col items-center text-center group hover:border-primary/20 transition-all duration-500">
					<div class="w-12 h-12 bg-gray-50 rounded-2xl flex items-center justify-center text-gray-900 mb-4 group-hover:scale-110 transition-transform">
						<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
					</div>
					<h3 class="text-2xl font-black text-gray-900 italic tracking-tight mb-1">03</h3>
					<p class="text-[9px] font-black text-gray-300 uppercase tracking-widest">Processed Items</p>
				</div>

				<div class="bg-white p-8 rounded-[2.5rem] border border-gray-100 shadow-sm flex flex-col items-center text-center group hover:border-primary/20 transition-all duration-500">
					<div class="w-12 h-12 bg-yellow-50 rounded-2xl flex items-center justify-center text-yellow-600 mb-4 group-hover:scale-110 transition-transform">
						<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.54 1.118l-3.976-2.888a1 1 0 00-1.175 0l-3.976 2.888c-.784.57-1.838-.197-1.539-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.382-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z"></path></svg>
					</div>
					<h3 class="text-2xl font-black text-gray-900 italic tracking-tight mb-1">4.8</h3>
					<p class="text-[9px] font-black text-gray-300 uppercase tracking-widest">Mercantile Rating</p>
				</div>
			</div>

			<!-- Archive Table -->
			<div class="bg-white rounded-[3rem] shadow-xl shadow-gray-200/50 border border-gray-100 overflow-hidden">
				<div class="overflow-x-auto">
					<table class="w-full text-left border-collapse">
						<thead>
							<tr class="bg-gray-50 border-b border-gray-100">
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Transaction ID</th>
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Acquisition</th>
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Acquirer</th>
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Valuation</th>
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Finalized</th>
								<th class="px-8 py-6 text-[10px] font-black text-gray-400 uppercase tracking-[0.2em]">Status</th>
							</tr>
						</thead>
						<tbody class="divide-y divide-gray-50">
							<!-- Row 1 -->
							<tr class="group hover:bg-gray-50/50 transition-colors">
								<td class="px-8 py-6">
									<span class="text-xs font-black text-gray-900 group-hover:text-primary transition-colors uppercase tracking-tight">#ORD-2024-001220</span>
								</td>
								<td class="px-8 py-6">
									<div class="flex items-center gap-4">
										<div class="w-10 h-10 rounded-xl overflow-hidden bg-gray-100 border border-gray-100 flex-shrink-0">
											<img src="images/macbook.jpg" class="w-full h-full object-cover">
										</div>
										<span class="text-xs font-bold text-gray-900 italic">MacBook Pro 16"</span>
									</div>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-medium text-gray-500">Wei Ming</span>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-black text-gray-900 italic">RM 7,000.00</span>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-medium text-gray-400">Dec 10, 2024</span>
								</td>
								<td class="px-8 py-6">
									<div class="flex items-center gap-2">
										<div class="w-1.5 h-1.5 bg-green-500 rounded-full animate-pulse"></div>
										<span class="text-[9px] font-black text-green-600 uppercase tracking-widest">Completed</span>
									</div>
								</td>
							</tr>
							<!-- Role 2 -->
							<tr class="group hover:bg-gray-50/50 transition-colors">
								<td class="px-8 py-6">
									<span class="text-xs font-black text-gray-900 group-hover:text-primary transition-colors uppercase tracking-tight">#ORD-2024-001205</span>
								</td>
								<td class="px-8 py-6">
									<div class="flex items-center gap-4">
										<div class="w-10 h-10 rounded-xl overflow-hidden bg-gray-100 border border-gray-100 flex-shrink-0">
											<img src="images/profile.jpg" class="w-full h-full object-cover">
										</div>
										<span class="text-xs font-bold text-gray-900 italic">Physics Textbook</span>
									</div>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-medium text-gray-500">Nurul Ain</span>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-black text-gray-900 italic">RM 55.00</span>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-medium text-gray-400">Dec 5, 2024</span>
								</td>
								<td class="px-8 py-6">
									<div class="flex items-center gap-2">
										<div class="w-1.5 h-1.5 bg-green-500 rounded-full animate-pulse"></div>
										<span class="text-[9px] font-black text-green-600 uppercase tracking-widest">Completed</span>
									</div>
								</td>
							</tr>
							<!-- Row 3 -->
							<tr class="group hover:bg-gray-50/50 transition-colors">
								<td class="px-8 py-6">
									<span class="text-xs font-black text-gray-900 group-hover:text-primary transition-colors uppercase tracking-tight">#ORD-2024-001180</span>
								</td>
								<td class="px-8 py-6">
									<div class="flex items-center gap-4">
										<div class="w-10 h-10 rounded-xl overflow-hidden bg-gray-100 border border-gray-100 flex-shrink-0">
											<img src="images/profile.jpg" class="w-full h-full object-cover">
										</div>
										<span class="text-xs font-bold text-gray-900 italic">Calculator fx-570EX</span>
									</div>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-medium text-gray-500">Ali Hassan</span>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-black text-gray-900 italic">RM 85.00</span>
								</td>
								<td class="px-8 py-6">
									<span class="text-xs font-medium text-gray-400">Nov 28, 2024</span>
								</td>
								<td class="px-8 py-6">
									<div class="flex items-center gap-2">
										<div class="w-1.5 h-1.5 bg-green-500 rounded-full animate-pulse"></div>
										<span class="text-[9px] font-black text-green-600 uppercase tracking-widest">Completed</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>