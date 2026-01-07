<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Redirect to servlet if not forwarded
    if (request.getAttribute("categories") == null) {
        response.sendRedirect("categories");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Hero Section -->
	<div class="relative bg-transparent overflow-hidden border-b border-gray-100">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16 text-center">
			<h1 class="text-4xl font-extrabold tracking-tight text-gray-900 sm:text-5xl mb-4">
				Browse <span class="text-primary text-6xl block sm:inline">Categories</span>
			</h1>
			<p class="max-w-xl mx-auto text-lg text-gray-500 italic">
				"Find your campus essentials, from textbooks to tech, traded by fellow students."
			</p>
		</div>
	</div>

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen py-16">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="flex items-center space-x-4 mb-12">
				<h2 class="text-2xl font-black text-gray-900 uppercase tracking-widest">Select Department</h2>
				<div class="h-[2px] bg-primary flex-grow"></div>
			</div>

			<c:choose>
				<c:when test="${empty categories}">
					<div class="text-center py-20 bg-white rounded-3xl border-2 border-dashed border-gray-200">
						<div class="w-16 h-16 bg-gray-50 rounded-full flex items-center justify-center mx-auto mb-4">
							<svg class="w-8 h-8 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path></svg>
						</div>
						<p class="text-gray-400 font-medium">No active categories found today.</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
						<c:forEach var="cat" items="${categories}">
							<a href="products?category=${cat[0]}" class="group relative bg-white p-8 rounded-3xl shadow-sm hover:shadow-2xl transition-all duration-500 border border-gray-100 flex flex-col items-center text-center transform hover:-translate-y-2">
								<!-- Icon Container -->
								<div class="w-20 h-20 rounded-2xl bg-gray-50 flex items-center justify-center mb-6 group-hover:bg-primary group-hover:text-white transition-colors duration-300">
									<c:choose>
										<c:when test="${cat[1] == 'Electronics & Gadgets'}">
											<svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z"></path></svg>
										</c:when>
										<c:when test="${cat[1] == 'Textbooks & Notes'}">
											<svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
										</c:when>
										<c:when test="${cat[1] == 'Clothing & Accessories'}">
											<svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"></path></svg>
										</c:when>
										<c:when test="${cat[1] == 'Room & Dorm Essentials'}">
											<svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
										</c:when>
										<c:when test="${cat[1] == 'Sports & Fitness'}">
											<svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
										</c:when>
										<c:otherwise>
											<svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 11V7a4 4 0 11-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
										</c:otherwise>
									</c:choose>
								</div>
								
								<h3 class="text-lg font-bold text-gray-900 group-hover:text-primary transition-colors mb-2">
									${cat[1]}
								</h3>
								
								<span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-bold bg-gray-50 text-gray-500 border border-gray-100 group-hover:bg-primary group-hover:text-white transition-all">
									${cat[3]} items
								</span>

								<!-- Hover Indicator -->
								<div class="absolute bottom-0 left-0 right-0 h-2 bg-primary transform scale-x-0 group-hover:scale-x-100 transition-transform origin-left rounded-b-3xl"></div>
							</a>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>