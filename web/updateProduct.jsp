<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<!-- Page Header -->
			<div class="mb-12 flex items-center justify-between">
				<div>
					<h1 class="text-4xl font-black text-gray-900 tracking-tighter italic uppercase mb-2">Refine Listing</h1>
					<p class="text-sm text-gray-400 font-medium uppercase tracking-widest">Update your item's presence in the hub</p>
				</div>
				<a href="sellerListings.jsp" class="hidden md:flex items-center gap-2 text-[10px] font-black text-gray-400 hover:text-primary transition-colors uppercase tracking-widest">
					<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
					Back to Portal
				</a>
			</div>

			<!-- Dynamic Alert Info -->
			<div class="mb-10 p-6 bg-blue-50 border border-blue-100 rounded-[2.5rem] flex items-center gap-6">
				<div class="w-12 h-12 bg-blue-500 text-white rounded-2xl flex items-center justify-center flex-shrink-0">
					<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
				</div>
				<div>
					<h4 class="text-sm font-black text-blue-900 uppercase tracking-tight mb-0.5 italic">Modifying Transmission</h4>
					<p class="text-xs font-medium text-blue-700 uppercase tracking-wide">iPhone 13 Pro (128GB) · Since Nov 20, 2025</p>
				</div>
			</div>

			<form action="sellerListings.jsp" class="space-y-8">
				
				<!-- Core Information -->
				<div class="bg-white rounded-[3rem] shadow-xl shadow-gray-200/50 border border-gray-100 p-8 sm:p-12">
					<div class="grid grid-cols-1 md:grid-cols-2 gap-8">
						
						<!-- Name -->
						<div class="md:col-span-2 relative group">
							<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Public Name</label>
							<input type="text" value="APPLE iPhone 13 Pro (128GB)" required
								class="w-full px-6 py-5 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 focus:border-primary focus:ring-0 transition-all">
						</div>

						<!-- Category -->
						<div class="relative group">
							<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Feed Category</label>
							<select required class="w-full px-6 py-5 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 focus:border-primary focus:ring-0 transition-all appearance-none cursor-pointer">
								<option>Textbooks & Notes</option>
								<option selected>Electronics</option>
								<option>Clothing & Fashion</option>
								<option>Dorm Items</option>
								<option>Entertainment</option>
								<option>Transportation</option>
								<option>Stationery</option>
								<option>Gaming</option>
							</select>
						</div>

						<!-- Condition -->
						<div class="relative group">
							<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Item Integrity</label>
							<select required class="w-full px-6 py-5 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 focus:border-primary focus:ring-0 transition-all appearance-none cursor-pointer">
								<option>New</option>
								<option selected>Like New</option>
								<option>Good</option>
								<option>Fair</option>
							</select>
						</div>

						<!-- Description -->
						<div class="md:col-span-2 relative group">
							<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Detailed Brief</label>
							<textarea rows="6" required
								class="w-full px-6 py-5 bg-white border-2 border-gray-100 rounded-[2rem] text-sm font-bold text-gray-900 focus:border-primary focus:ring-0 transition-all resize-none">Selling my iPhone 13 Pro 128GB in excellent condition. Bought last year, always used with a case and screen protector. Battery health at 92%. Comes with original box, charger, and a free case.</textarea>
						</div>

						<!-- Price -->
						<div class="relative group">
							<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Valuation (RM)</label>
							<input type="number" value="5000" required
								class="w-full px-6 py-5 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 focus:border-primary focus:ring-0 transition-all">
						</div>

						<!-- Location -->
						<div class="relative group">
							<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Exchange Hub</label>
							<input type="text" value="UTM Skudai, Johor" required
								class="w-full px-6 py-5 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 focus:border-primary focus:ring-0 transition-all">
						</div>

						<!-- Visual Assets -->
						<div class="md:col-span-2 space-y-6">
							<div class="flex items-center justify-between">
								<h3 class="text-xs font-black text-gray-400 uppercase tracking-widest">Active Visuals</h3>
								<p class="text-[10px] font-bold text-gray-300 uppercase">Max 2 Transmissions</p>
							</div>
							
							<div class="grid grid-cols-2 sm:grid-cols-4 lg:grid-cols-6 gap-4">
								<div class="relative aspect-square rounded-2xl overflow-hidden border-2 border-gray-100 group/img">
									<img src="images/iPhone.webp" class="w-full h-full object-cover">
									<div class="absolute inset-0 bg-black/40 opacity-0 group-hover/img:opacity-100 transition-opacity flex items-center justify-center">
										<button type="button" class="p-2 bg-white text-red-500 rounded-lg shadow-xl">
											<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
										</button>
									</div>
								</div>
								
								<button type="button" class="aspect-square rounded-2xl border-2 border-dashed border-gray-100 flex flex-col items-center justify-center gap-2 hover:border-primary/20 hover:bg-primary/5 transition-all text-gray-300 hover:text-primary group">
									<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
									<span class="text-[9px] font-black uppercase tracking-widest">New Slot</span>
								</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Actions -->
				<div class="flex flex-col sm:flex-row items-center justify-between gap-6">
					<button type="button" class="w-full sm:w-auto px-10 py-5 bg-white text-red-500 rounded-2xl font-black text-xs uppercase tracking-widest border-2 border-red-50 hover:bg-red-50 transition-all flex items-center justify-center gap-2">
						<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
						Terminate Listing
					</button>
					<div class="flex flex-col sm:flex-row items-center gap-4 w-full sm:w-auto">
						<a href="sellerListings.jsp" class="w-full sm:w-auto px-10 py-5 text-gray-400 hover:text-gray-900 font-black text-xs uppercase tracking-widest transition-colors">Cancel</a>
						<button type="submit" class="w-full sm:w-auto px-12 py-5 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-xl shadow-primary/20 hover:bg-red-600 transition-all transform active:scale-95">
							Authorize Updates
						</button>
					</div>
				</div>

			</form>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>