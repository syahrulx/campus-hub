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
	<div class="bg-gray-50 min-h-screen pt-32 pb-24">
		<div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="text-center mb-16">
				<p class="text-xs font-black text-primary uppercase tracking-[0.3em] mb-4">Verified Exchange</p>
				<h1 class="text-5xl font-black text-gray-900 tracking-tighter uppercase italic">List an Item</h1>
			</div>

			<!-- Error Message -->
			<c:if test="${not empty error}">
				<div class="mb-10 max-w-3xl mx-auto bg-red-50 border-l-4 border-red-500 p-6 rounded-2xl flex items-center gap-4">
					<div class="w-10 h-10 bg-red-100 rounded-full flex items-center justify-center flex-shrink-0 text-red-500">
						<svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
					</div>
					<p class="text-sm font-bold text-red-900 italic uppercase tracking-wide">${error}</p>
				</div>
			</c:if>

			<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 overflow-hidden">
				<form action="addProduct" method="POST" enctype="multipart/form-data" class="p-10 sm:p-14">
					
					<div class="grid grid-cols-1 lg:grid-cols-12 gap-10 lg:gap-16 items-start">
						
						<!-- Left Column: Image Upload -->
						<div class="lg:col-span-4 space-y-4">
							<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block px-2">Product Image</label>
							<div class="relative group">
								<input type="file" name="imageFile" id="imageFile" accept="image/*" required class="hidden" onchange="previewImage(this)">
								<label for="imageFile" class="relative block w-full aspect-[3/4] rounded-[2rem] border-2 border-dashed border-gray-200 hover:border-primary hover:bg-gray-50 transition-all cursor-pointer flex flex-col items-center justify-center gap-4 overflow-hidden group">
									
									<div id="uploadPlaceholder" class="flex flex-col items-center text-center p-6 transition-opacity duration-300">
										<div class="w-16 h-16 bg-primary/5 text-primary rounded-[1.5rem] flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-primary group-hover:text-white transition-all duration-500">
											<svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
										</div>
										<span class="text-xs font-black text-gray-900 uppercase tracking-widest">Upload Photo</span>
										<span class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mt-2">JPG / PNG • Max 5MB</span>
									</div>
									
									<img id="imagePreview" src="" alt="Preview" class="hidden absolute inset-0 w-full h-full object-cover">
								</label>
							</div>
							<p class="text-[10px] font-bold text-gray-300 uppercase tracking-widest text-center">Portrait (Vertical) Recommended</p>
						</div>

						<!-- Right Column: Form Details -->
						<div class="lg:col-span-8 space-y-8">
							
							<!-- Product Name -->
							<div>
								<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-3 px-2">Product Name</label>
								<input type="text" name="name" placeholder="E.G. ENGINEERING CALCULATOR" required
									class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-8 py-5 rounded-[1.5rem] font-bold text-gray-900 placeholder-gray-300 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 text-sm uppercase tracking-wide">
							</div>

							<div class="grid grid-cols-1 md:grid-cols-2 gap-8">
								<!-- Category -->
								<div>
									<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-3 px-2">Category</label>
									<div class="relative">
										<select name="categoryId" required class="w-full appearance-none bg-gray-50 border-2 border-gray-50 focus:border-primary px-8 py-5 rounded-[1.5rem] font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 text-sm uppercase tracking-wide cursor-pointer">
											<option value="" disabled selected>SELECT CATEGORY</option>
											<c:forEach var="cat" items="${categories}">
												<option value="${cat[0]}">${cat[1]}</option>
											</c:forEach>
										</select>
										<div class="absolute inset-y-0 right-0 flex items-center px-6 pointer-events-none text-gray-400">
											<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
										</div>
									</div>
								</div>

								<!-- Condition -->
								<div>
									<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-3 px-2">Condition</label>
									<div class="relative">
										<select name="condition" required class="w-full appearance-none bg-gray-50 border-2 border-gray-50 focus:border-primary px-8 py-5 rounded-[1.5rem] font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 text-sm uppercase tracking-wide cursor-pointer">
											<option value="" disabled selected>SELECT CONDITION</option>
											<c:forEach var="cond" items="${['New', 'Like New', 'Good', 'Fair']}">
												<option value="${cond}">${cond}</option>
											</c:forEach>
										</select>
										<div class="absolute inset-y-0 right-0 flex items-center px-6 pointer-events-none text-gray-400">
											<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
										</div>
									</div>
								</div>
							</div>

						<!-- Price -->
						<div class="grid grid-cols-2 gap-6">
							<div>
								<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-3 px-2">Price (RM)</label>
								<div class="relative">
									<div class="absolute inset-y-0 left-0 pl-8 flex items-center pointer-events-none">
										<span class="text-sm font-black text-gray-900 italic">RM</span>
									</div>
									<input type="number" name="price" placeholder="0.00" step="0.01" min="0" required
										class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary pl-20 pr-8 py-5 rounded-[1.5rem] font-bold text-gray-900 placeholder-gray-300 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 text-sm">
								</div>
							</div>
							<div>
								<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-3 px-2">Quantity</label>
								<input type="number" name="quantity" placeholder="1" min="1" value="1" required
									class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-8 py-5 rounded-[1.5rem] font-bold text-gray-900 placeholder-gray-300 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 text-sm">
							</div>
						</div>

							<!-- Description -->
							<div>
								<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-3 px-2">Description</label>
								<textarea name="description" rows="5" required placeholder="DESCRIBE YOUR ITEM..."
									class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-8 py-5 rounded-[2rem] font-medium text-gray-900 placeholder-gray-300 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 resize-none text-sm leading-relaxed"></textarea>
							</div>

							<!-- Actions -->
							<div class="pt-8 border-t border-gray-50 flex items-center justify-between gap-6">
								<a href="products" class="px-8 py-4 border-2 border-gray-300 text-gray-500 rounded-[1.5rem] font-black text-[10px] uppercase tracking-widest hover:bg-gray-50 transition-all">
									CANCEL
								</a>
								<button type="submit" class="px-10 py-5 bg-gray-900 text-white rounded-[1.5rem] font-black text-xs uppercase tracking-widest hover:bg-primary transition-all shadow-xl shadow-gray-200 hover:shadow-primary/20 transform hover:-translate-y-1 active:translate-y-0">
									POST LISTING
								</button>
							</div>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
	function previewImage(input) {
		const preview = document.getElementById('imagePreview');
		const placeholder = document.getElementById('uploadPlaceholder');
		
		if (input.files && input.files[0]) {
			const reader = new FileReader();
			reader.onload = function(e) {
				preview.src = e.target.result;
				preview.classList.remove('hidden');
				placeholder.classList.add('opacity-0'); // Hide placeholder content but keep layout
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	</script>

	
<jsp:include page="footer.jsp" />
</body>
</html>