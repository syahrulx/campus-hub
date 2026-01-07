<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20 flex items-center justify-center">
		<div class="max-w-xl w-full mx-auto px-4">
			
			<div class="bg-white rounded-[4rem] shadow-2xl shadow-gray-200/50 border border-gray-100 p-10 sm:p-14 text-center">
				<!-- Warning Header -->
				<div class="w-20 h-20 bg-red-50 text-red-500 rounded-[2rem] flex items-center justify-center mx-auto mb-10 transform hover:scale-110 transition-transform duration-500">
					<svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
				</div>

				<h1 class="text-3xl font-black text-gray-900 tracking-tighter italic uppercase mb-3">Void Listing?</h1>
				<p class="text-sm text-gray-400 font-medium leading-relaxed mb-12 max-w-xs mx-auto text-center">
					Are you absolutely certain you wish to terminate this listing? This action is irreversible.
				</p>

				<!-- Product Context Card -->
				<div class="bg-gray-50 rounded-[2.5rem] p-6 mb-12 border border-gray-100 flex items-center gap-6 text-left">
					<div class="w-20 h-20 rounded-2xl overflow-hidden bg-white border border-gray-100 shadow-inner flex-shrink-0">
						<img src="images/profile.jpg" alt="Product Preview" class="w-full h-full object-cover opacity-75 grayscale hover:grayscale-0 transition-all duration-500">
					</div>
					<div class="min-w-0">
						<h3 class="text-sm font-black text-gray-900 italic uppercase tracking-tight truncate mb-1">Calculus Textbook</h3>
						<p class="text-[10px] font-black text-primary uppercase tracking-widest italic mb-1">RM 45.00</p>
						<p class="text-[9px] font-bold text-gray-400 uppercase tracking-widest">Listed Oct 15, 2025</p>
					</div>
				</div>
				
				<!-- Action Systems -->
				<div class="flex flex-col gap-4">
					<a href="sellerListings.jsp" class="w-full py-5 bg-red-500 text-white rounded-2xl font-black text-xs uppercase tracking-[0.2em] shadow-lg shadow-red-500/20 hover:bg-red-600 hover:shadow-red-600/30 transition-all transform active:scale-95 flex items-center justify-center gap-2">
						Confirm Deletion
					</a>
					<a href="sellerListings.jsp" class="w-full py-5 bg-white text-gray-900 rounded-2xl font-black text-xs uppercase tracking-[0.2em] border-2 border-gray-100 hover:bg-gray-50 transition-all active:scale-95">
						Cancel Protocol
					</a>
				</div>

				<div class="mt-12">
					<p class="text-[10px] font-black text-gray-300 uppercase tracking-widest italic tracking-[0.3em]">
						CampusHub Systems Division
					</p>
				</div>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>