<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Redirect to servlet if user not loaded
    if (request.getAttribute("user") == null) {
        response.sendRedirect("editProfile");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-2xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="text-center mb-10">
				<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">Update Profile</h1>
				<p class="text-sm text-gray-400 font-medium uppercase tracking-widest mt-2">Refine your campus identity</p>
			</div>

			<!-- Error/Success Messages -->
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

			<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 overflow-hidden">
				<div class="p-10 sm:p-12">
					<form action="editProfile" method="POST" class="space-y-8">
						
						<div class="space-y-6">
							<!-- Name -->
							<div>
								<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Full Name <span class="text-primary">*</span></label>
								<div class="relative group">
									<span class="absolute inset-y-0 left-0 pl-6 flex items-center text-gray-400 group-focus-within:text-primary transition-colors">
										<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
									</span>
									<input type="text" name="name" value="${user.name}" required
										class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-14 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5">
								</div>
							</div>

							<!-- Email (Disabled) -->
							<div>
								<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Email Address</label>
								<div class="relative opacity-60">
									<span class="absolute inset-y-0 left-0 pl-6 flex items-center text-gray-300">
										<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
									</span>
									<input type="email" value="${user.email}" disabled
										class="w-full bg-gray-100 border-2 border-transparent px-14 py-4 rounded-2xl font-bold text-gray-500 cursor-not-allowed">
								</div>
								<p class="text-[9px] font-black text-gray-300 uppercase tracking-widest mt-2 px-1 italic">Email cannot be modified for security.</p>
							</div>

							<!-- Phone -->
							<div>
								<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Phone Number</label>
								<div class="relative group">
									<span class="absolute inset-y-0 left-0 pl-6 flex items-center text-gray-400 group-focus-within:text-primary transition-colors">
										<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path></svg>
									</span>
									<input type="text" name="phone" value="${user.phone}" placeholder="e.g. 012-3456789"
										class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-14 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5">
								</div>
							</div>

							<!-- University -->
							<div>
								<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Your University</label>
								<div class="relative group">
									<span class="absolute inset-y-0 left-0 pl-6 flex items-center text-gray-400 group-focus-within:text-primary transition-colors">
										<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
									</span>
									<select name="university" class="w-full appearance-none bg-gray-50 border-2 border-gray-50 focus:border-primary px-14 py-4 rounded-2xl font-bold text-gray-900 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 cursor-pointer">
										<option value="" ${empty user.university ? 'selected' : ''}>Select University</option>
										<c:forEach var="u" items="${['UiTM Shah Alam', 'UiTM Puncak Alam', 'UiTM Puncak Perdana', 'UiTM Selangor (Dengkil)', 'Universiti Kebangsaan Malaysia (UKM)', 'Universiti Putra Malaysia (UPM)', 'Universiti Malaya (UM)', 'Universiti Islam Antarabangsa Malaysia (UIAM)', 'Universiti Selangor (UNISEL)', 'Universiti Pertahanan Nasional Malaysia (UPNM)']}">
											<option value="${u}" ${user.university == u ? 'selected' : ''}>${u}</option>
										</c:forEach>
									</select>
									<span class="absolute inset-y-0 right-0 pr-6 flex items-center text-gray-300 pointer-events-none group-focus-within:text-primary transition-colors">
										<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
									</span>
								</div>
							</div>
						</div>

						<div class="pt-6 flex flex-col sm:flex-row gap-4 justify-end">
							<a href="profile" class="px-10 py-4 bg-gray-50 text-gray-900 rounded-2xl font-black text-xs uppercase tracking-widest border border-gray-100 hover:bg-white hover:shadow-lg transition-all text-center">
								Cancel
							</a>
							<button type="submit" class="px-12 py-4 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95 flex items-center justify-center gap-2 group">
								<svg class="w-4 h-4 transform group-hover:rotate-12 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
								Save Changes
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>