<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    // Redirect to servlet if not forwarded
    if (request.getAttribute("seller") == null && request.getAttribute("error") == null) {
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            response.sendRedirect("seller?id=" + id);
        } else {
            response.sendRedirect("products");
        }
        return;
    }
%>
<jsp:include page="header.jsp" />

<c:choose>
    <c:when test="${not empty error}">
        <!-- Error State -->
        <div class="bg-transparent min-h-screen pt-24 pb-20">
            <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
                <div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 p-20">
                    <div class="w-24 h-24 bg-red-50 rounded-[2rem] flex items-center justify-center text-red-500 mx-auto mb-8">
                        <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                    </div>
                    <h2 class="text-2xl font-black text-gray-900 italic uppercase tracking-tight mb-4">${error}</h2>
                    <p class="text-sm text-gray-400 font-medium mb-8">The seller you're looking for doesn't exist or has been removed.</p>
                    <a href="products" class="inline-flex items-center gap-2 px-8 py-4 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all active:scale-95">
                        Browse Marketplace
                    </a>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <!-- Main Content -->
        <div class="bg-transparent min-h-screen pb-20">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                
                <!-- Seller Brand Header -->
                <div class="glass-card rounded-[3rem] mb-8 border-white/40">
                    <div class="px-5 sm:px-7 lg:px-8 py-7 sm:py-8">
                        <div class="flex flex-col md:flex-row md:items-center gap-6 md:gap-7">

                            <!-- Avatar -->
                            <div class="relative self-center md:self-auto flex-shrink-0">
                                <div class="w-24 h-24 sm:w-28 sm:h-28 md:w-32 md:h-32
                                     rounded-[2rem] bg-white p-2 shadow-xl border border-gray-100">
                                    <c:choose>
                                        <c:when test="${not empty seller.profileImage}">
                                            <img src="${seller.profileImage}" alt="${seller.name}"
                                                 class="w-full h-full rounded-[1.6rem] object-cover">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="w-full h-full rounded-[1.6rem] bg-gray-900 flex items-center justify-center
                                                 text-white text-3xl sm:text-4xl font-black italic">
                                                ${fn:substring(seller.name, 0, 1)}
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="absolute bottom-1.5 right-1.5 bg-green-500
                                     w-8 h-8 rounded-[0.9rem] border-4 border-white
                                     flex items-center justify-center text-white shadow-lg">
                                    <svg class="w-4.5 h-4.5" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                                    </svg>
                                </div>
                            </div>

                            <!-- Basic Info -->
                            <div class="flex-1 text-center md:text-left">
                                <div class="flex flex-col md:flex-row md:items-center justify-center md:justify-start gap-3 md:gap-4 mb-3 md:mb-4">
                                    <h1 class="text-2xl sm:text-3xl md:text-4xl font-black text-gray-900 italic tracking-tighter uppercase heading-aura break-words">
                                        ${seller.name}
                                    </h1>

                                    <c:if test="${avgRating > 0}">
                                        <div class="inline-flex items-center gap-2 bg-gray-50 px-3 py-1.5 rounded-xl border border-gray-100 shadow-sm">
                                            <svg class="w-4 h-4 text-yellow-500" fill="currentColor" viewBox="0 0 20 20">
                                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                            </svg>
                                            <span class="text-xs font-black text-gray-900">
                                                ${avgRating} <span class="text-gray-400 font-bold ml-1">/ 5.0</span>
                                            </span>
                                        </div>
                                    </c:if>
                                </div>

                                <div class="flex flex-wrap justify-center md:justify-start gap-3 sm:gap-5
                                     text-[9px] sm:text-[10px] font-black uppercase tracking-[0.18em] text-gray-400 italic">
                                    <c:if test="${not empty seller.university}">
                                        <div class="flex items-center gap-2">
                                            <div class="w-1.5 h-1.5 rounded-full bg-primary/40"></div>
                                            <span class="break-words">${seller.university}</span>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty seller.createdAt}">
                                        <div class="flex items-center gap-2">
                                            <div class="w-1.5 h-1.5 rounded-full bg-accent/40"></div>
                                            Active Since <fmt:formatDate value="${seller.createdAt}" pattern="MMM yyyy"/>
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <!-- Actions -->
                            <div class="w-full md:w-auto">
                                <a href="messages?with=${sellerId}"
                                   class="w-full md:w-auto flex items-center justify-center gap-3
                                   bg-gray-900 text-white px-6 sm:px-7 py-3 sm:py-3.5
                                   rounded-[1.5rem] font-black text-[10px] uppercase tracking-widest
                                   shadow-xl hover:bg-black transition-all active-press group">
                                    <svg class="w-5 h-5 group-hover:rotate-12 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"
                                          d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"></path>
                                    </svg>
                                    Message HUB
                                </a>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Stats Grid -->
                <div class="grid grid-cols-2 lg:grid-cols-4 gap-8 mb-20">
                    <div class="glass-card p-10 rounded-[3rem] text-center hover-lift group border-white/30">
                        <p class="text-4xl font-black text-gray-900 italic mb-3 group-hover:text-primary transition-colors">${itemsSold}</p>
                        <p class="text-[10px] font-black text-gray-400 uppercase tracking-[0.3em]">Items Sold</p>
                    </div>
                    <div class="glass-card p-10 rounded-[3rem] text-center hover-lift group border-white/30">
                        <p class="text-4xl font-black text-gray-900 italic mb-3 group-hover:text-primary transition-colors">${activeAds}</p>
                        <p class="text-[10px] font-black text-gray-400 uppercase tracking-[0.3em]">Items Available</p>
                    </div>
                    <div class="glass-card p-10 rounded-[3rem] text-center hover-lift group border-white/30">
                        <p class="text-4xl font-black text-gray-900 italic mb-3 group-hover:text-primary transition-colors">${reviewCount}</p>
                        <p class="text-[10px] font-black text-gray-400 uppercase tracking-[0.3em]">Reviews</p>
                    </div>
                    <div class="glass-card p-10 rounded-[3rem] text-center hover-lift group border-white/30">
                        <p class="text-4xl font-black text-gray-900 italic mb-3 group-hover:text-primary transition-colors">
                            <c:choose>
                                <c:when test="${avgRating > 0}">${avgRating}</c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </p>
                        <p class="text-[10px] font-black text-gray-400 uppercase tracking-[0.3em]">Avg Rating</p>
                    </div>
                </div>

                <!-- Listings Section -->
                <div class="mb-24">
                    <div class="flex items-end justify-between mb-12">
                        <div>
                            <p class="text-[10px] font-black text-primary uppercase tracking-[0.3em] mb-2">About the Seller</p>
                            <h3 class="text-3xl font-black text-gray-900 italic tracking-tighter uppercase">Current Active Listings</h3>
                        </div>
                        <div class="hidden md:block h-px bg-white/50 flex-grow mx-12"></div>
                    </div>
                    
                    <c:choose>
                        <c:when test="${empty products}">
                            <div class="glass-card rounded-[4rem] p-20 text-center border-white/30">
                                <div class="w-24 h-24 bg-white/50 rounded-[2.5rem] flex items-center justify-center text-gray-200 mx-auto mb-8 shadow-inner">
                                    <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
                                </div>
                                <p class="text-xs font-black text-gray-400 uppercase tracking-[0.3em]">No Active Listings Found</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-12">
                                <c:forEach var="product" items="${products}">
                                    <div class="group flex flex-col h-full glass-card rounded-[3rem] p-5 hover-lift">
                                        <div class="relative aspect-square rounded-[2.2rem] overflow-hidden bg-white/50 mb-7">
                                            <img src="${not empty product.imageUrl ? product.imageUrl : 'images/product-placeholder.png'}" alt="${product.name}" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700">
                                            <div class="absolute inset-x-5 bottom-5 translate-y-8 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all duration-500">
                                                <a href="productDetail?id=${product.productId}" class="w-full py-4 bg-white text-gray-900 text-center rounded-2xl font-black text-[9px] uppercase tracking-widest shadow-2xl active-press block">QUICK VIEW</a>
                                            </div>
                                        </div>
                                        <div class="px-2 flex flex-col flex-1">
                                            <div class="flex items-center gap-2 mb-2">
                                                <div class="w-1.5 h-1.5 rounded-full bg-primary/40"></div>
                                                <p class="text-[9px] font-black text-primary uppercase tracking-widest italic">${product.condition}</p>
                                            </div>
                                            <h4 class="text-sm font-black text-gray-900 italic truncate mb-6">${product.name}</h4>
                                            <div class="flex items-center justify-between mt-auto">
                                                <p class="text-xl font-black text-gray-900 italic">RM <fmt:formatNumber value="${product.price}" pattern="#,##0.00"/></p>
                                                <a href="productDetail?id=${product.productId}" class="w-11 h-11 rounded-2xl bg-gray-900 text-white flex items-center justify-center hover:bg-primary transition-all active-press">
                                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Reviews Section -->
                <div>
                    <div class="flex items-end justify-between mb-12">
                        <div>
                            <p class="text-[10px] font-black text-accent uppercase tracking-[0.3em] mb-2">Verified Feedback</p>
                            <h3 class="text-3xl font-black text-gray-900 italic tracking-tighter uppercase">Buyer Testimonials</h3>
                        </div>
                        <div class="hidden md:block h-px bg-white/50 flex-grow mx-12"></div>
                    </div>

                    <c:choose>
                        <c:when test="${empty reviews}">
                            <div class="glass-card rounded-[4rem] p-20 text-center border-white/30">
                                <div class="w-24 h-24 bg-white/50 rounded-[2.5rem] flex items-center justify-center text-gray-200 mx-auto mb-8 shadow-inner">
                                    <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.175 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.382-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z"></path></svg>
                                </div>
                                <p class="text-xs font-black text-gray-400 uppercase tracking-[0.3em]">Zero Reviews Recorded</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                <c:forEach var="review" items="${reviews}">
                                    <div class="glass-card p-10 rounded-[3.5rem] hover-lift transition-all border-white/40">
                                        <div class="flex justify-between items-start mb-8">
                                            <div class="flex items-center gap-5">
                                                <div class="w-14 h-14 rounded-2xl bg-gradient-to-br from-gray-100 to-gray-200 flex items-center justify-center text-gray-500 font-black italic shadow-inner border border-white/50">
                                                    ${fn:substring(review.reviewerName, 0, 2).toUpperCase()}
                                                </div>
                                                <div>
                                                    <h5 class="text-sm font-black text-gray-900 italic uppercase">${review.reviewerName}</h5>
                                                    <p class="text-[9px] font-black text-gray-400 uppercase tracking-widest mt-1">
                                                        <fmt:formatDate value="${review.createdAt}" pattern="MMM dd, yyyy"/>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="flex gap-1 text-yellow-500 bg-white/50 px-3 py-1.5 rounded-xl border border-white/50 shadow-sm">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <svg class="w-3.5 h-3.5 ${i <= review.rating ? 'text-yellow-500' : 'text-gray-200'}" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <c:if test="${not empty review.comment}">
                                            <p class="text-xs text-gray-500 font-semibold leading-relaxed italic border-l-4 border-primary/20 pl-6 py-2">"${review.comment}"</p>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
    
<jsp:include page="footer.jsp" />
</body>
</html>