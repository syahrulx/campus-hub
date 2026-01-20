<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (request.getAttribute("orderInfo") == null) {
        response.sendRedirect("orders");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20">
		<div class="max-w-2xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="text-center mb-12">
				<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">Leave a Review</h1>
				<p class="text-sm text-gray-400 font-medium uppercase tracking-widest mt-2">Share your experience</p>
			</div>

			<!-- Error Message -->
			<c:if test="${param.error != null}">
				<div class="mb-8 bg-red-50 border-l-4 border-red-500 p-6 rounded-2xl">
					<p class="text-sm font-bold text-red-900">${param.error}</p>
				</div>
			</c:if>

			<!-- Already Reviewed -->
			<c:if test="${alreadyReviewed}">
				<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 p-12 text-center">
					<div class="w-20 h-20 rounded-full bg-green-50 flex items-center justify-center mx-auto mb-6">
						<svg class="w-10 h-10 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
					</div>
					<h3 class="text-xl font-black text-gray-900 italic uppercase mb-2">Already Reviewed</h3>
					<p class="text-sm text-gray-400 mb-8">You have already submitted a review for this order.</p>
					<a href="orders" class="inline-flex py-4 px-10 bg-gray-900 text-white rounded-2xl font-black text-xs uppercase tracking-widest">
						Back to Orders
					</a>
				</div>
			</c:if>

			<!-- Review Form -->
			<c:if test="${not alreadyReviewed}">
				<div class="bg-white rounded-[3rem] shadow-sm border border-gray-100 overflow-hidden">
					<div class="p-10">
						<!-- Product Info -->
						<div class="flex items-center gap-6 mb-10 pb-8 border-b border-gray-100">
							<div class="w-20 h-20 rounded-2xl overflow-hidden bg-gray-50 border border-gray-100 flex-shrink-0">
								<img src="${orderInfo.imageUrl}" alt="${orderInfo.productName}" class="w-full h-full object-cover">
							</div>
							<div>
								<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1">Reviewing Purchase</p>
								<h3 class="text-lg font-black text-gray-900 italic uppercase">${orderInfo.productName}</h3>
								<p class="text-sm text-gray-500">Seller: <span class="font-bold text-gray-900">${orderInfo.sellerName}</span></p>
							</div>
						</div>

						<form action="review" method="POST">
							<input type="hidden" name="orderId" value="${orderInfo.orderId}">
							<input type="hidden" name="sellerId" value="${orderInfo.sellerId}">

							<!-- Star Rating -->
							<div class="mb-8">
								<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-4">Your Rating</label>
								<div class="flex gap-2" id="starRating">
									<input type="hidden" name="rating" id="ratingValue" value="5" required>
									<button type="button" class="star-btn text-4xl transition-all hover:scale-110" data-value="1">★</button>
									<button type="button" class="star-btn text-4xl transition-all hover:scale-110" data-value="2">★</button>
									<button type="button" class="star-btn text-4xl transition-all hover:scale-110" data-value="3">★</button>
									<button type="button" class="star-btn text-4xl transition-all hover:scale-110" data-value="4">★</button>
									<button type="button" class="star-btn text-4xl transition-all hover:scale-110" data-value="5">★</button>
								</div>
								<p class="text-xs text-gray-400 mt-2" id="ratingText">Excellent!</p>
							</div>

							<!-- Comment -->
							<div class="mb-8">
								<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-3">Your Review (Optional)</label>
								<textarea name="comment" rows="4" placeholder="Share your experience with this seller..."
									class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-6 py-4 rounded-2xl font-medium text-gray-900 placeholder-gray-300 transition-all focus:outline-none focus:ring-4 focus:ring-primary/5 resize-none"></textarea>
							</div>

							<!-- Submit -->
							<div class="flex gap-4">
								<a href="orders" class="px-8 py-4 border-2 border-gray-100 text-gray-900 rounded-2xl font-black text-xs uppercase tracking-widest hover:bg-gray-50 transition-all">
									Cancel
								</a>
								<button type="submit" class="flex-1 py-4 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all active:scale-95">
									Submit Review
								</button>
							</div>
						</form>
					</div>
				</div>
			</c:if>
		</div>
	</div>

	<script>
	document.addEventListener('DOMContentLoaded', function() {
		const stars = document.querySelectorAll('.star-btn');
		const ratingInput = document.getElementById('ratingValue');
		const ratingText = document.getElementById('ratingText');
		const ratingLabels = ['Poor', 'Fair', 'Good', 'Very Good', 'Excellent!'];
		
		function setRating(value) {
			ratingInput.value = value;
			ratingText.textContent = ratingLabels[value - 1];
			stars.forEach((star, index) => {
				if (index < value) {
					star.classList.add('text-yellow-400');
					star.classList.remove('text-gray-300');
				} else {
					star.classList.remove('text-yellow-400');
					star.classList.add('text-gray-300');
				}
			});
		}
		
		stars.forEach(star => {
			star.addEventListener('click', () => setRating(parseInt(star.dataset.value)));
		});
		
		// Initialize with 5 stars
		setRating(5);
	});
	</script>

<jsp:include page="footer.jsp" />
</body>
</html>
