<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="flex flex-col sm:flex-row sm:items-end justify-between gap-6 mb-12">
				<div>
					<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">Activity Feed</h1>
					<p class="text-sm text-gray-400 font-medium uppercase tracking-widest mt-2">Personalized campus updates</p>
				</div>
				<button class="text-[10px] font-black text-primary hover:text-red-700 uppercase tracking-widest transition-colors flex items-center gap-2 group">
					<svg class="w-4 h-4 group-hover:rotate-12 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
					Mark all as read
				</button>
			</div>

			<!-- Modern Filters -->
			<div class="flex flex-wrap items-center gap-3 mb-10 pb-2 overflow-x-auto no-scrollbar">
				<button class="px-8 py-3 bg-primary text-white rounded-[1.5rem] font-black text-[10px] uppercase tracking-widest shadow-lg shadow-red-900/10 transition-all active:scale-95">All</button>
				<button class="px-8 py-3 bg-white text-gray-400 hover:text-gray-900 rounded-[1.5rem] font-black text-[10px] uppercase tracking-widest border border-gray-100 transition-all active:scale-95">Orders</button>
				<button class="px-8 py-3 bg-white text-gray-400 hover:text-gray-900 rounded-[1.5rem] font-black text-[10px] uppercase tracking-widest border border-gray-100 transition-all active:scale-95">Messages</button>
				<button class="px-8 py-3 bg-white text-gray-400 hover:text-gray-900 rounded-[1.5rem] font-black text-[10px] uppercase tracking-widest border border-gray-100 transition-all active:scale-95">Listings</button>
			</div>

			<!-- Notifications List -->
			<div class="space-y-4">
				
				<!-- Unread Order -->
				<div class="bg-white rounded-[2.5rem] p-6 sm:p-8 shadow-sm border-l-4 border-primary border-gray-100 flex items-start gap-6 group hover:shadow-xl hover:shadow-gray-200/50 transition-all duration-500">
					<div class="w-14 h-14 bg-green-50 text-green-500 rounded-2xl flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform">
						<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
					</div>
					<div class="flex-grow min-w-0">
						<div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2 mb-2">
							<h3 class="text-sm font-black text-gray-900 italic uppercase tracking-tight">New Order Received!</h3>
							<span class="text-[9px] font-black text-gray-300 uppercase tracking-widest">5 minutes ago</span>
						</div>
						<p class="text-xs text-gray-400 font-medium leading-relaxed mb-6">
							<span class="text-gray-900 font-bold italic uppercase">Sarah Lim</span> has purchased your <span class="text-gray-900 font-bold">"JBL Flip 5 Bluetooth Speaker"</span> for RM 280.00
						</p>
						<a href="orderDetails.jsp" class="inline-flex py-3 px-8 bg-gray-50 text-gray-900 rounded-xl font-black text-[9px] uppercase tracking-[0.2em] border border-gray-100 hover:bg-white hover:shadow-lg transition-all active:scale-95">
							View Order
						</a>
					</div>
				</div>

				<!-- Unread Message -->
				<div class="bg-white rounded-[2.5rem] p-6 sm:p-8 shadow-sm border-l-4 border-primary border-gray-100 flex items-start gap-6 group hover:shadow-xl hover:shadow-gray-200/50 transition-all duration-500">
					<div class="w-14 h-14 bg-blue-50 text-blue-500 rounded-2xl flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform">
						<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"></path></svg>
					</div>
					<div class="flex-grow min-w-0">
						<div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2 mb-2">
							<h3 class="text-sm font-black text-gray-900 italic uppercase tracking-tight">New Message</h3>
							<span class="text-[9px] font-black text-gray-300 uppercase tracking-widest">2 hours ago</span>
						</div>
						<p class="text-xs text-gray-400 font-medium leading-relaxed mb-6 italic">
							"Sure, the iPhone is still available! Let me know when you..."
						</p>
						<a href="messages.jsp" class="inline-flex py-3 px-8 bg-gray-50 text-gray-900 rounded-xl font-black text-[9px] uppercase tracking-[0.2em] border border-gray-100 hover:bg-white hover:shadow-lg transition-all active:scale-95">
							Direct Message
						</a>
					</div>
				</div>

				<!-- Read Listing Update -->
				<div class="bg-white/60 rounded-[2.5rem] p-6 sm:p-8 shadow-sm border border-gray-100/50 flex items-start gap-6 group hover:shadow-lg hover:shadow-gray-200/20 transition-all duration-500">
					<div class="w-14 h-14 bg-gray-50 text-gray-300 rounded-2xl flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform">
						<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
					</div>
					<div class="flex-grow min-w-0 opacity-60 group-hover:opacity-100 transition-opacity">
						<div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2 mb-2">
							<h3 class="text-sm font-black text-gray-900 italic uppercase tracking-tight">High Engagement</h3>
							<span class="text-[9px] font-black text-gray-300 uppercase tracking-widest">3 hours ago</span>
						</div>
						<p class="text-xs text-gray-400 font-medium leading-relaxed mb-6">
							Your <span class="text-gray-900 font-bold italic uppercase">"iPhone 13 Pro"</span> reached 15 new views. Consider optimizing your valuation for better conversion.
						</p>
						<a href="sellerListings.jsp" class="inline-flex py-3 px-8 bg-gray-50 text-gray-900 rounded-xl font-black text-[9px] uppercase tracking-[0.2em] border border-gray-100 hover:bg-white hover:shadow-lg transition-all active:scale-95">
							Dashboard
						</a>
					</div>
				</div>

				<!-- Read Review -->
				<div class="bg-white/60 rounded-[2.5rem] p-6 sm:p-8 shadow-sm border border-gray-100/50 flex items-start gap-6 group hover:shadow-lg hover:shadow-gray-200/20 transition-all duration-500">
					<div class="w-14 h-14 bg-yellow-50 text-yellow-500 rounded-2xl flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform">
						<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.175 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.382-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z"></path></svg>
					</div>
					<div class="flex-grow min-w-0 opacity-60 group-hover:opacity-100 transition-opacity">
						<div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2 mb-2">
							<h3 class="text-sm font-black text-gray-900 italic uppercase tracking-tight">5-Star Feedback</h3>
							<span class="text-[9px] font-black text-gray-300 uppercase tracking-widest">2 days ago</span>
						</div>
						<p class="text-xs text-gray-400 font-medium leading-relaxed mb-6">
							<span class="text-gray-900 font-bold italic uppercase">Wei Ming</span> left a review: "Great seller! Item exactly as described. Fast response."
						</p>
						<a href="sellerProfile.jsp" class="inline-flex py-3 px-8 bg-gray-50 text-gray-900 rounded-xl font-black text-[9px] uppercase tracking-[0.2em] border border-gray-100 hover:bg-white hover:shadow-lg transition-all active:scale-95">
							View Ratings
						</a>
					</div>
				</div>

			</div>

			<!-- Load More -->
			<div class="text-center mt-12 pb-10">
				<button class="px-12 py-5 bg-white text-gray-900 rounded-3xl font-black text-xs uppercase tracking-widest border border-gray-100 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all active:scale-95">
					Legacy Archive
				</button>
			</div>

		</div>
	</div>

		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>