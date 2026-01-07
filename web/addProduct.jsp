<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Redirect to servlet if categories not loaded
    if (request.getAttribute("categories") == null) {
        response.sendRedirect("addProduct");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="text-center mb-10">
				<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">Sell local</h1>
				<p class="text-sm text-gray-400 font-medium uppercase tracking-widest mt-2">List your item for the campus community</p>
			</div>

			<!-- Error Message -->
			<c:if test="${not empty error}">
				<div class="mb-8 bg-red-50 border-l-4 border-red-500 p-4 rounded-r-xl animate-in fade-in slide-in-from-top-4 duration-500">
					<div class="flex">
						<div class="flex-shrink-0">
							<svg class="h-5 w-5 text-red-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
						</div>
						<div class="ml-3">
							<p class="text-sm text-red-700 font-bold italic">${error}</p>
						</div>
					</div>
				</div>
			</c:if>

			<div class="grid grid-cols-1 lg:grid-cols-3 gap-10">
				<!-- Form Column -->
				<div class="lg:col-span-2 space-y-10">
					<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 overflow-hidden">
						<div class="p-10 sm:p-12">
							<form action="addProduct" method="POST" enctype="multipart/form-data" class="space-y-8">
								
								<!-- Product Info -->
								<div class="space-y-6">
									<div>
										<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Product Identity *</label>
										<input type="text" name="name" placeholder="e.g. iPhone 13 Pro 128GB" required
											class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-6 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5">
									</div>

									<div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
										<div>
											<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Dept / Category *</label>
											<div class="relative group">
												<select name="categoryId" required class="w-full appearance-none bg-gray-50 border-2 border-gray-50 focus:border-primary px-6 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 cursor-pointer">
													<option value="" disabled selected>Select Dept</option>
													<c:forEach var="cat" items="${categories}">
														<option value="${cat[0]}">${cat[1]}</option>
													</c:forEach>
												</select>
												<span class="absolute inset-y-0 right-0 pr-6 flex items-center text-gray-300 pointer-events-none group-focus-within:text-primary transition-colors">
													<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
												</span>
											</div>
										</div>
										<div>
											<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Condition *</label>
											<div class="relative group">
												<select name="condition" required class="w-full appearance-none bg-gray-50 border-2 border-gray-50 focus:border-primary px-6 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 cursor-pointer">
													<option value="" disabled selected>Select State</option>
													<c:forEach var="cond" items="${['New', 'Like New', 'Good', 'Fair']}">
														<option value="${cond}">${cond}</option>
													</c:forEach>
												</select>
												<span class="absolute inset-y-0 right-0 pr-6 flex items-center text-gray-300 pointer-events-none group-focus-within:text-primary transition-colors">
													<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
												</span>
											</div>
										</div>
									</div>

									<div>
										<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Narrative / Bio *</label>
										<textarea name="description" rows="5" required placeholder="Describe your item, include details about condition, reason for selling..."
											class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-6 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 resize-none"></textarea>
									</div>

									<div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
										<div>
											<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">valuation (RM) *</label>
											<div class="relative group">
												<span class="absolute inset-y-0 left-0 pl-6 flex items-center text-gray-400 group-focus-within:text-primary transition-colors font-black italic">RM</span>
												<input type="number" name="price" placeholder="0.00" step="0.01" min="0" required
													class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary pl-14 pr-6 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5">
											</div>
										</div>
										<div>
											<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Visual Asset URL</label>
											<div class="relative group">
												<span class="absolute inset-y-0 left-0 pl-6 flex items-center text-gray-400 group-focus-within:text-primary transition-colors">
													<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
												</span>
												<input type="text" name="imageUrl" placeholder="HTTPS://IMAGE-HOST.COM/PHOTO.JPG"
													class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-14 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5">
											</div>
										</div>
									</div>
								</div>

								<div class="pt-6 border-t border-gray-50 flex flex-col sm:flex-row gap-4 justify-end">
									<a href="products" class="px-10 py-4 bg-gray-50 text-gray-900 rounded-2xl font-black text-xs uppercase tracking-widest border border-gray-100 hover:bg-white hover:shadow-lg transition-all text-center">
										Cancel
									</a>
									<button type="submit" class="px-12 py-4 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95 flex items-center justify-center gap-2 group">
										<svg class="w-4 h-4 transform group-hover:rotate-12 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path></svg>
										Post Listing
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- Tips Column -->
				<div class="space-y-6">
					<div class="bg-gray-900 rounded-[2.5rem] p-8 text-white shadow-2xl relative overflow-hidden group">
						<div class="absolute -top-10 -right-10 w-40 h-40 bg-primary/20 rounded-full group-hover:scale-110 transition-transform duration-700"></div>
						
						<div class="relative z-10">
							<div class="w-12 h-12 bg-primary rounded-xl flex items-center justify-center mb-6">
								<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>
							</div>
							<h3 class="text-xl font-black italic tracking-tighter uppercase mb-4">Pro Listings</h3>
							<ul class="space-y-4">
								<li class="flex items-start gap-4">
									<div class="w-5 h-5 rounded-full bg-primary/20 flex items-center justify-center flex-shrink-0 mt-0.5">
										<div class="w-1.5 h-1.5 bg-primary rounded-full"></div>
									</div>
									<p class="text-sm text-gray-300 font-medium">Use clear, high-resolution product imagery.</p>
								</li>
								<li class="flex items-start gap-4">
									<div class="w-5 h-5 rounded-full bg-primary/20 flex items-center justify-center flex-shrink-0 mt-0.5">
										<div class="w-1.5 h-1.5 bg-primary rounded-full"></div>
									</div>
									<p class="text-sm text-gray-300 font-medium">Price competitively by checking similar campus ads.</p>
								</li>
								<li class="flex items-start gap-4">
									<div class="w-5 h-5 rounded-full bg-primary/20 flex items-center justify-center flex-shrink-0 mt-0.5">
										<div class="w-1.5 h-1.5 bg-primary rounded-full"></div>
									</div>
									<p class="text-sm text-gray-300 font-medium">Full transparency about condition is non-negotiable.</p>
								</li>
								<li class="flex items-start gap-4">
									<div class="w-5 h-5 rounded-full bg-primary/20 flex items-center justify-center flex-shrink-0 mt-0.5">
										<div class="w-1.5 h-1.5 bg-primary rounded-full"></div>
									</div>
									<p class="text-sm text-gray-300 font-medium">Lightning-fast responses close the most deals.</p>
								</li>
							</ul>
						</div>
					</div>

					<div class="bg-white rounded-[2.5rem] p-8 border border-gray-100 shadow-sm text-center">
						<div class="w-12 h-12 bg-blue-50 text-blue-500 rounded-xl flex items-center justify-center mx-auto mb-4">
							<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path></svg>
						</div>
						<h4 class="text-sm font-black text-gray-900 uppercase tracking-widest italic mb-2">Campus Shield</h4>
						<p class="text-xs text-gray-400 font-medium leading-relaxed">Transactions are protected and verified. Never share personal bank details in chat.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	
<jsp:include page="footer.jsp" />
</body>
</html>