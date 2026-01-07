<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20 flex items-center justify-center">
		<div class="max-w-2xl w-full mx-auto px-4 sm:px-6">
			
			<div class="bg-white rounded-[4rem] shadow-2xl shadow-green-900/5 border border-gray-100 p-10 sm:p-16 text-center relative overflow-hidden group">
				<!-- Decorative Background Logic -->
				<div class="absolute -top-24 -right-24 w-64 h-64 bg-green-50 rounded-full group-hover:scale-110 transition-transform duration-700"></div>
				<div class="absolute -bottom-24 -left-24 w-64 h-64 bg-primary/5 rounded-full group-hover:scale-110 transition-transform duration-700"></div>
				
				<div class="relative z-10">
					<!-- Success Icon -->
					<div class="w-24 h-24 bg-green-500 rounded-[2.5rem] flex items-center justify-center mx-auto mb-10 shadow-xl shadow-green-500/20 transform hover:rotate-12 transition-transform duration-500">
						<svg class="w-12 h-12 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path></svg>
					</div>

					<h1 class="text-3xl sm:text-4xl font-black text-gray-900 tracking-tight italic uppercase mb-4">Acquisition Secured</h1>
					<p class="text-sm sm:text-base text-gray-400 font-medium leading-relaxed max-w-sm mx-auto mb-12">
						Your order has been broadcasted to the seller. They'll be reaching out via CampusHub messages shortly.
					</p>

					<!-- Next Steps Card -->
					<div class="bg-gray-50 rounded-[2.5rem] p-8 mb-12 text-left border border-gray-100">
						<h3 class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] mb-4 px-1">Next Phase</h3>
						<div class="space-y-4">
							<div class="flex items-start gap-4">
								<div class="w-2 h-2 rounded-full bg-green-500 mt-1.5 flex-shrink-0"></div>
								<p class="text-sm text-gray-600 font-bold leading-relaxed">Seller will review inventory and confirm the transaction.</p>
							</div>
							<div class="flex items-start gap-4">
								<div class="w-2 h-2 rounded-full bg-gray-200 mt-1.5 flex-shrink-0"></div>
								<p class="text-sm text-gray-400 font-medium leading-relaxed">Coordinate pickup or delivery through our secure messaging system.</p>
							</div>
						</div>
					</div>

					<!-- Navigation Actions -->
					<div class="flex flex-col sm:flex-row items-center justify-center gap-4">
						<a href="orders" class="w-full sm:w-auto px-10 py-5 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95 flex items-center justify-center gap-2">
							<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
							Track Orders
						</a>
						<a href="products" class="w-full sm:w-auto px-10 py-5 bg-white text-gray-900 rounded-2xl font-black text-xs uppercase tracking-widest border border-gray-100 hover:shadow-xl transition-all active:scale-95 flex items-center justify-center gap-2">
							More Shopping
							<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
						</a>
					</div>
				</div>
			</div>

			<p class="text-center text-[10px] font-black text-gray-300 uppercase tracking-widest mt-10 italic">
				CampusHub · Safe Transactions · Student Verified
			</p>
		</div>
	</div>

<jsp:include page="footer.jsp" />
</body>
</html>