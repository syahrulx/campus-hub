<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Redirect to servlet if not forwarded
    if (request.getAttribute("user") == null) {
        response.sendRedirect("profile");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="text-center mb-12">
				<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">Account Profile</h1>
				<p class="text-sm text-gray-400 font-medium uppercase tracking-widest mt-2">Manage your campus identity</p>
			</div>

			<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 overflow-hidden">
				<!-- Profile Header Banner -->
				<div class="h-32 bg-primary/5 relative">
					<div class="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10"></div>
				</div>

				<div class="px-8 pb-12 -mt-16">
					<div class="flex flex-col items-center">
						<!-- Avatar -->
						<div class="relative group">
							<div class="w-32 h-32 rounded-[2.5rem] bg-white p-1.5 shadow-xl shadow-gray-200 group-hover:scale-105 transition-transform duration-500">
								<div class="w-full h-full rounded-[2rem] bg-gray-900 flex items-center justify-center text-white text-4xl font-black italic shadow-inner">
									${user.name.substring(0,1).toUpperCase()}
								</div>
							</div>
							<div class="absolute -bottom-2 -right-2 bg-green-500 w-8 h-8 rounded-xl border-4 border-white flex items-center justify-center text-white shadow-lg">
								<svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>
							</div>
						</div>

						<!-- Basic Info -->
						<div class="mt-6 text-center">
							<h2 class="text-2xl font-black text-gray-900 italic tracking-tight uppercase">${user.name}</h2>
							<p class="text-sm text-gray-400 font-medium mt-1">Joined <fmt:formatDate value="${user.createdAt}" pattern="MMMM yyyy"/></p>
							
							<c:if test="${user.rating > 0}">
								<div class="flex items-center justify-center gap-1 mt-3">
									<c:forEach begin="1" end="5" var="i">
										<svg class="w-4 h-4 ${i <= user.rating ? 'text-yellow-400' : 'text-gray-200'}" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
									</c:forEach>
									<span class="text-xs font-black text-gray-900 ml-1 italic">${user.rating}</span>
								</div>
							</c:if>
						</div>

						<!-- Stats Dashboard -->
						<div class="grid grid-cols-3 w-full gap-4 mt-10">
							<div class="bg-gray-50 p-6 rounded-[2rem] text-center border border-gray-100 hover:bg-white hover:shadow-xl hover:shadow-gray-100 transition-all duration-300">
								<p class="text-2xl font-black text-primary italic leading-none">${itemsSold}</p>
								<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-2">Sold</p>
							</div>
							<div class="bg-gray-50 p-6 rounded-[2rem] text-center border border-gray-100 hover:bg-white hover:shadow-xl hover:shadow-gray-100 transition-all duration-300">
								<p class="text-2xl font-black text-primary italic leading-none">${activeListings}</p>
								<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-2">Listings</p>
							</div>
							<div class="bg-gray-50 p-6 rounded-[2rem] text-center border border-gray-100 hover:bg-white hover:shadow-xl hover:shadow-gray-100 transition-all duration-300">
								<p class="text-2xl font-black text-primary italic leading-none">${purchases}</p>
								<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mt-2">Purchases</p>
							</div>
						</div>

						<!-- Detailed Info -->
						<div class="w-full mt-10 space-y-4">
							<div class="flex items-center p-6 bg-white border border-gray-100 rounded-3xl group hover:border-primary/20 transition-colors">
								<div class="w-10 h-10 rounded-xl bg-gray-50 flex items-center justify-center text-gray-400 group-hover:text-primary transition-colors">
									<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
								</div>
								<div class="ml-6 flex-grow">
									<p class="text-[9px] font-black text-gray-300 uppercase tracking-widest mb-0.5">Contact Email</p>
									<p class="text-sm font-bold text-gray-900">${user.email}</p>
								</div>
							</div>

							<div class="flex items-center p-6 bg-white border border-gray-100 rounded-3xl group hover:border-primary/20 transition-colors">
								<div class="w-10 h-10 rounded-xl bg-gray-50 flex items-center justify-center text-gray-400 group-hover:text-primary transition-colors">
									<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path></svg>
								</div>
								<div class="ml-6 flex-grow">
									<p class="text-[9px] font-black text-gray-300 uppercase tracking-widest mb-0.5">Phone Number</p>
									<p class="text-sm font-bold text-gray-900"><c:out value="${user.phone}" default="Not provided"/></p>
								</div>
							</div>

							<div class="flex items-center p-6 bg-white border border-gray-100 rounded-3xl group hover:border-primary/20 transition-colors">
								<div class="w-10 h-10 rounded-xl bg-gray-50 flex items-center justify-center text-gray-400 group-hover:text-primary transition-colors">
									<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
								</div>
								<div class="ml-6 flex-grow">
									<p class="text-[9px] font-black text-gray-300 uppercase tracking-widest mb-0.5">University / College</p>
									<p class="text-sm font-bold text-gray-900"><c:out value="${user.university}" default="CampusHub Member"/></p>
								</div>
							</div>
						</div>

						<!-- Actions -->
						<div class="grid grid-cols-1 sm:grid-cols-3 w-full gap-4 mt-12">
							<a href="editProfile.jsp" class="flex items-center justify-center gap-2 bg-primary text-white py-4 rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all active:scale-95">
								<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
								Edit Profile
							</a>
							<a href="sellerListings" class="flex items-center justify-center gap-2 bg-gray-900 text-white py-4 rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-gray-200 hover:bg-black transition-all active:scale-95">
								<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
								My Listings
							</a>
							<a href="orders" class="flex items-center justify-center gap-2 bg-gray-50 text-gray-900 py-4 rounded-2xl font-black text-xs uppercase tracking-widest border border-gray-100 hover:bg-white hover:shadow-lg transition-all active:scale-95">
								<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 11-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
								My Orders
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>
