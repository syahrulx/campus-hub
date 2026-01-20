<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20 flex items-center justify-center">
		<div class="max-w-xl w-full mx-auto px-4">
			
			<!-- Header -->
			<div class="text-center mb-12">
				<h1 class="text-4xl font-black text-gray-900 tracking-tighter italic uppercase mb-3">Sync Listing</h1>
				<p class="text-sm text-gray-400 font-medium uppercase tracking-widest italic">Locate your digital inventory for optimization</p>
			</div>

			<!-- Search System -->
			<div class="bg-white rounded-[3rem] shadow-2xl shadow-gray-200/50 border border-gray-100 p-10 sm:p-12 mb-12">
				<form action="updateProduct.jsp" class="space-y-6">
					<div class="relative group">
						<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Descriptor / Segment ID</label>
						<input type="text" placeholder="e.g., iPhone or PROD-001" required
							class="w-full px-6 py-5 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 focus:border-primary focus:ring-0 transition-all text-center">
					</div>
					<button type="submit" class="w-full py-5 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-[0.2em] shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95 flex items-center justify-center gap-2">
						Initiate Search
					</button>
				</form>
			</div>

			<!-- Quick Link Feed -->
			<div class="space-y-6">
				<div class="flex items-center justify-between px-6">
					<h3 class="text-[10px] font-black text-gray-400 uppercase tracking-widest">Recent Transmissions</h3>
					<span class="w-2 h-2 bg-primary rounded-full animate-ping"></span>
				</div>
				
				<div class="grid grid-cols-1 gap-4">
					<!-- Item 1 -->
					<a href="updateProduct.jsp" class="group bg-white p-6 rounded-[2rem] border border-gray-100 hover:border-primary/20 transition-all duration-500 shadow-sm hover:shadow-xl hover:shadow-gray-200/50 flex items-center gap-6">
						<div class="w-16 h-16 rounded-xl overflow-hidden bg-gray-50 border border-gray-50 flex-shrink-0">
							<img src="images/iPhone.webp" class="w-full h-full object-cover">
						</div>
						<div class="flex-1 min-w-0">
							<h4 class="text-sm font-black text-gray-900 italic uppercase tracking-tight group-hover:text-primary transition-colors">iPhone 13 Pro</h4>
							<p class="text-[9px] font-bold text-gray-400 uppercase tracking-widest mt-1">Nov 20, 2025</p>
						</div>
						<div class="flex items-center gap-2">
							<div class="w-1.5 h-1.5 bg-green-500 rounded-full"></div>
							<span class="text-[9px] font-black text-green-600 uppercase tracking-widest">Active</span>
						</div>
					</a>

					<!-- Item 2 -->
					<a href="updateProduct.jsp" class="group bg-white p-6 rounded-[2rem] border border-gray-100 hover:border-primary/20 transition-all duration-500 shadow-sm hover:shadow-xl hover:shadow-gray-200/50 flex items-center gap-6 text-opacity-50">
						<div class="w-16 h-16 rounded-xl overflow-hidden bg-gray-50 border border-gray-50 flex-shrink-0 grayscale">
							<img src="images/profile.jpg" class="w-full h-full object-cover">
						</div>
						<div class="flex-1 min-w-0">
							<h4 class="text-sm font-black text-gray-400 italic uppercase tracking-tight">Calculus Textbook</h4>
							<p class="text-[9px] font-bold text-gray-300 uppercase tracking-widest mt-1">Oct 15, 2025</p>
						</div>
						<div class="flex items-center gap-2">
							<div class="w-1.5 h-1.5 bg-yellow-500 rounded-full"></div>
							<span class="text-[9px] font-black text-yellow-600 uppercase tracking-widest">Pending</span>
						</div>
					</a>
				</div>
			</div>

			<!-- Back Action -->
			<div class="mt-12 text-center">
				<a href="sellerListings.jsp" class="inline-flex items-center gap-2 text-[10px] font-black text-gray-400 hover:text-primary transition-colors uppercase tracking-[0.3em] italic">
					<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
					Back to My Listings
				</a>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>