<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />


	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<!-- Seller Brand Header -->
			<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 overflow-hidden mb-10">
				<div class="h-48 bg-gray-900 relative">
					<div class="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-20"></div>
					<div class="absolute inset-0 bg-gradient-to-tr from-primary/20 to-transparent"></div>
				</div>
				
				<div class="px-10 pb-10 -mt-20 relative z-10 flex flex-col md:flex-row items-end gap-8">
					<!-- Avatar -->
					<div class="relative group">
						<div class="w-40 h-40 rounded-[3rem] bg-white p-2 shadow-2xl shadow-gray-200 group-hover:scale-[1.02] transition-transform duration-500">
							<img src="images/profile.jpg" alt="Ahmad Faiz" class="w-full h-full rounded-[2.5rem] object-cover">
						</div>
						<div class="absolute bottom-4 right-4 bg-green-500 w-10 h-10 rounded-2xl border-4 border-white flex items-center justify-center text-white shadow-lg">
							<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>
						</div>
					</div>

					<!-- Basic Info -->
					<div class="flex-grow pb-2 text-center md:text-left">
						<div class="flex flex-col md:flex-row md:items-center gap-4 mb-4">
							<h1 class="text-4xl font-black text-gray-900 italic tracking-tighter uppercase">Ahmad Faiz</h1>
							<div class="flex items-center justify-center md:justify-start gap-1 bg-yellow-50 px-4 py-2 rounded-2xl border border-yellow-100">
								<svg class="w-4 h-4 text-yellow-500" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
								<span class="text-sm font-black text-yellow-700 italic">4.2 <span class="text-yellow-400 opacity-50 font-medium">/ 5.0</span></span>
							</div>
						</div>
						
						<div class="flex flex-wrap justify-center md:justify-start gap-6 text-[10px] font-black uppercase tracking-widest text-gray-400 italic">
							<div class="flex items-center gap-2">
								<svg class="w-4 h-4 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
								UTM Skudai, Johor
							</div>
							<div class="flex items-center gap-2">
								<svg class="w-4 h-4 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
								Since Jan 2023
							</div>
						</div>

						<p class="mt-6 text-sm text-gray-500 font-medium max-w-2xl leading-relaxed">Selling quality electronics and gadgets at student-friendly prices! Specializing in pre-loved Apple products with campus meetups.</p>
					</div>

					<!-- Actions -->
					<div class="pb-2">
						<a href="messages.jsp" class="flex items-center justify-center gap-3 bg-primary text-white px-10 py-5 rounded-3xl font-black text-xs uppercase tracking-widest shadow-xl shadow-red-900/10 hover:shadow-primary/20 transition-all hover:-translate-y-1 active:scale-95 group">
							<svg class="w-5 h-5 transform group-hover:rotate-12 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"></path></svg>
							Message Seller
						</a>
					</div>
				</div>
			</div>

			<!-- Stats Grid -->
			<div class="grid grid-cols-2 lg:grid-cols-4 gap-6 mb-16">
				<div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100 text-center hover:border-primary/20 transition-all group">
					<p class="text-3xl font-black text-gray-900 italic mb-2 group-hover:text-primary transition-colors">23</p>
					<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest">Items Sold</p>
				</div>
				<div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100 text-center hover:border-primary/20 transition-all group">
					<p class="text-3xl font-black text-gray-900 italic mb-2 group-hover:text-primary transition-colors">8</p>
					<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest">Active Ads</p>
				</div>
				<div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100 text-center hover:border-primary/20 transition-all group">
					<p class="text-3xl font-black text-gray-900 italic mb-2 group-hover:text-primary transition-colors">98%</p>
					<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest">Response Rate</p>
				</div>
				<div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100 text-center hover:border-primary/20 transition-all group">
					<p class="text-3xl font-black text-gray-900 italic mb-2 group-hover:text-primary transition-colors">&lt;1hr</p>
					<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest">Avg Time</p>
				</div>
			</div>

			<!-- Listings Section -->
			<div class="mb-20">
				<div class="flex items-center justify-between mb-10">
					<h3 class="text-2xl font-black text-gray-900 italic tracking-tight uppercase">Current Listings</h3>
					<div class="h-px bg-gray-200 flex-grow mx-8 opacity-50"></div>
				</div>
				
				<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-10">
					<!-- Product Card Reusable Style -->
					<c:forEach var="item" items="${['iPhone 13 Pro (128GB)', 'AirPods Pro', 'Apple Watch Series 7', 'iPad Air (2022)']}" varStatus="status">
						<div class="group">
							<div class="bg-white rounded-[2.5rem] p-4 shadow-sm border border-gray-100 hover:border-primary/20 transition-all duration-500 hover:shadow-2xl hover:shadow-gray-200 hover:-translate-y-2">
								<div class="aspect-square rounded-3xl overflow-hidden bg-gray-50 relative mb-6">
									<img src="${status.index == 0 ? 'images/iPhone.webp' : (status.index == 1 ? 'images/airpods.png' : 'images/profile.jpg')}" alt="${item}" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
									<div class="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity flex items-end p-6">
										<button class="bg-white text-gray-900 text-[10px] font-black uppercase tracking-widest px-4 py-2 rounded-xl transform translate-y-4 group-hover:translate-y-0 transition-transform">Quick View</button>
									</div>
								</div>
								<div class="px-2 pb-2">
									<p class="text-[10px] font-black text-primary uppercase tracking-widest mb-1 italic">New Listing</p>
									<h4 class="text-sm font-black text-gray-900 italic truncate mb-4">${item}</h4>
									<div class="flex items-center justify-between">
										<p class="text-lg font-black text-gray-900 italic">RM <c:out value="${status.index == 0 ? '5,000' : (status.index == 1 ? '800' : (status.index == 2 ? '1,200' : '2,500'))}"/></p>
										<a href="productDetail.jsp" class="w-10 h-10 rounded-xl bg-gray-50 flex items-center justify-center text-gray-400 hover:bg-primary hover:text-white transition-all transform active:scale-95">
											<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- Reviews Section -->
			<div>
				<div class="flex items-center justify-between mb-10">
					<h3 class="text-2xl font-black text-gray-900 italic tracking-tight uppercase">Buyer Feedback</h3>
					<div class="h-px bg-gray-200 flex-grow mx-8 opacity-50"></div>
					<div class="flex gap-2">
						<button class="w-10 h-10 rounded-xl border border-gray-200 flex items-center justify-center text-gray-400 hover:bg-white hover:shadow-lg transition-all"><svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path></svg></button>
						<button class="w-10 h-10 rounded-xl border border-gray-200 flex items-center justify-center text-gray-400 hover:bg-white hover:shadow-lg transition-all"><svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg></button>
					</div>
				</div>

				<div class="space-y-6">
					<div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100 hover:shadow-xl hover:shadow-gray-100 transition-all">
						<div class="flex justify-between items-start mb-6">
							<div class="flex items-center gap-4">
								<div class="w-12 h-12 rounded-2xl bg-gray-50 flex items-center justify-center text-gray-400 font-bold italic shadow-inner">WM</div>
								<div>
									<h5 class="text-sm font-black text-gray-900 italic uppercase">Wei Ming</h5>
									<p class="text-[10px] font-black text-gray-300 uppercase tracking-widest mt-0.5">2 days ago</p>
								</div>
							</div>
							<div class="flex gap-0.5 text-yellow-400">
								<c:forEach begin="1" end="5"><svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg></c:forEach>
							</div>
						</div>
						<p class="text-sm text-gray-500 font-medium leading-relaxed italic">"Great seller! Fast response and item exactly as described. Met at UTM lake area, transaction was smooth. Recommended!"</p>
					</div>

					<div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100 hover:shadow-xl hover:shadow-gray-100 transition-all opacity-70 border-dashed">
						<div class="flex justify-between items-start mb-6">
							<div class="flex items-center gap-4">
								<div class="w-12 h-12 rounded-2xl bg-gray-50 flex items-center justify-center text-gray-400 font-bold italic shadow-inner">SL</div>
								<div>
									<h5 class="text-sm font-black text-gray-900 italic uppercase">Sarah Lim</h5>
									<p class="text-[10px] font-black text-gray-300 uppercase tracking-widest mt-0.5">1 week ago</p>
								</div>
							</div>
							<div class="flex gap-0.5 text-yellow-400">
								<c:forEach begin="1" end="4"><svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg></c:forEach>
								<svg class="w-4 h-4 text-gray-200" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
							</div>
						</div>
						<p class="text-sm text-gray-500 font-medium leading-relaxed italic">"Good transaction. Item was in good condition as mentioned. A bit late for the meetup but overall satisfied."</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<jsp:include page="footer.jsp" />
</body>
</html>