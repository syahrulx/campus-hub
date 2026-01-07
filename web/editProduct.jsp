<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Redirect to servlet if product not loaded
    if (request.getAttribute("product") == null) {
        response.sendRedirect("sellerListings");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="text-center mb-10">
				<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">Refine Listing</h1>
				<p class="text-sm text-gray-400 font-medium uppercase tracking-widest mt-2">Update your item's presence on CampusHub</p>
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

			<div class="space-y-10">
				<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 overflow-hidden">
					<div class="p-10 sm:p-12">
						<form action="editProduct" method="POST" class="space-y-8">
							<input type="hidden" name="productId" value="${product.productId}">
							
							<div class="space-y-6">
								<div>
									<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Product Identity *</label>
									<input type="text" name="name" value="${product.name}" required
										class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-6 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5">
								</div>

								<div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
									<div>
										<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Dept / Category *</label>
										<div class="relative group">
											<select name="categoryId" required class="w-full appearance-none bg-gray-50 border-2 border-gray-50 focus:border-primary px-6 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 cursor-pointer">
												<c:forEach var="cat" items="${categories}">
													<option value="${cat[0]}" ${cat[0] == product.categoryId ? 'selected' : ''}>${cat[1]}</option>
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
												<c:forEach var="cond" items="${['New', 'Like New', 'Good', 'Fair']}">
													<option value="${cond}" ${product.condition == cond ? 'selected' : ''}>${cond}</option>
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
									<textarea name="description" rows="5" required
										class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-6 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 resize-none">${product.description}</textarea>
								</div>

								<div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
									<div>
										<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">valuation (RM) *</label>
										<div class="relative group">
											<span class="absolute inset-y-0 left-0 pl-6 flex items-center text-gray-400 group-focus-within:text-primary transition-colors font-black italic">RM</span>
											<input type="number" name="price" value="${product.price}" step="0.01" min="0" required
												class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary pl-14 pr-6 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5">
										</div>
									</div>
									<div>
										<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Visual Asset URL</label>
										<div class="relative group">
											<span class="absolute inset-y-0 left-0 pl-6 flex items-center text-gray-400 group-focus-within:text-primary transition-colors">
												<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
											</span>
											<input type="text" name="imageUrl" value="${product.imageUrl}" placeholder="Leave blank to keep current"
												class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-14 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5">
										</div>
									</div>
								</div>
							</div>

							<div class="pt-10 border-t border-gray-50 flex flex-col sm:flex-row gap-4 items-center justify-between">
								<button type="button" onclick="document.getElementById('delete-modal').classList.remove('hidden')" 
									class="text-[10px] font-black text-red-400 uppercase tracking-widest hover:text-red-600 transition-colors flex items-center gap-2 group">
									<svg class="w-4 h-4 group-hover:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
									Delete Listing
								</button>
								<div class="flex flex-col sm:flex-row gap-4 w-full sm:w-auto">
									<a href="sellerListings" class="px-10 py-4 bg-gray-50 text-gray-900 rounded-2xl font-black text-xs uppercase tracking-widest border border-gray-100 hover:bg-white hover:shadow-lg transition-all text-center">
										Cancel
									</a>
									<button type="submit" class="px-12 py-4 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95 flex items-center justify-center gap-2 group">
										<svg class="w-4 h-4 transform group-hover:rotate-12 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
										Save Changes
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>

				<!-- Danger Zone Indicator -->
				<div class="bg-red-50/50 rounded-[2.5rem] p-8 border border-red-100/50 flex items-center gap-6">
					<div class="w-12 h-12 bg-red-100 text-red-600 rounded-xl flex items-center justify-center flex-shrink-0">
						<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
					</div>
					<div>
						<h4 class="text-sm font-black text-red-900 italic tracking-tight uppercase mb-1">Attention Required</h4>
						<p class="text-xs text-red-700/60 font-medium leading-relaxed">Updating listing details will notify interested buyers. Ensure all information is accurate to maintain campus selling reputation.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Custom Tailwind Modal -->
	<div id="delete-modal" class="hidden fixed inset-0 z-[100] overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
		<div class="flex items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
			<div class="fixed inset-0 bg-gray-900/60 backdrop-blur-sm transition-opacity" aria-hidden="true" onclick="document.getElementById('delete-modal').classList.add('hidden')"></div>

			<span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

			<div class="inline-block align-bottom bg-white rounded-[3rem] text-left overflow-hidden shadow-2xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
				<div class="bg-white px-8 pt-10 pb-8 sm:p-12 sm:pb-10">
					<div class="sm:flex sm:items-start">
						<div class="mx-auto flex-shrink-0 flex items-center justify-center h-16 w-16 rounded-[2rem] bg-red-50 sm:mx-0 sm:h-14 sm:w-14">
							<svg class="h-6 w-6 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
						</div>
						<div class="mt-6 text-center sm:mt-0 sm:ml-6 sm:text-left">
							<h3 class="text-xl font-black text-gray-900 italic uppercase tracking-tight" id="modal-title">Delete Listing?</h3>
							<div class="mt-4">
								<p class="text-sm text-gray-400 font-medium leading-relaxed">Are you sure you want to remove <span class="text-gray-900 font-bold italic">"${product.name}"</span>? This action is permanent and will remove it from the campus marketplace.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="bg-gray-50/50 px-8 py-8 sm:px-12 flex flex-col sm:flex-row-reverse gap-4">
					<form action="editProduct" method="POST" class="w-full sm:w-auto">
						<input type="hidden" name="productId" value="${product.productId}">
						<input type="hidden" name="action" value="delete">
						<button type="submit" class="w-full inline-flex justify-center px-10 py-4 bg-red-500 text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:bg-red-600 transition-all transform active:scale-95">
							Confirm Delete
						</button>
					</form>
					<button type="button" onclick="document.getElementById('delete-modal').classList.add('hidden')" 
						class="w-full sm:w-auto inline-flex justify-center px-10 py-4 bg-white text-gray-900 rounded-2xl font-black text-xs uppercase tracking-widest border border-gray-100 hover:shadow-lg transition-all">
						Cancel
					</button>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
