<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    if (request.getAttribute("cartItems") == null) {
        response.sendRedirect("payment");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-20 relative overflow-hidden">
		<div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
			
			<div class="flex items-center space-x-4 mb-10">
				<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">Secure Checkout</h1>
				<div class="h-[2px] bg-primary flex-grow"></div>
				<div class="flex items-center text-green-500 font-bold text-xs uppercase tracking-widest">
					<svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path></svg>
					Encrypted
				</div>
			</div>

			<c:if test="${not empty error}">
				<div class="mb-8 bg-red-50 border-l-4 border-red-500 p-4 rounded-r-xl">
					<div class="flex">
						<div class="flex-shrink-0">
							<svg class="h-5 w-5 text-red-400" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
						</div>
						<div class="ml-3">
							<p class="text-sm text-red-700 font-medium">${error}</p>
						</div>
					</div>
				</div>
			</c:if>

			<form action="payment" method="POST" id="paymentForm">
				<div class="lg:flex lg:gap-12 items-start">
					<!-- Payment Methods -->
					<div class="lg:w-7/12 space-y-8 mb-12 lg:mb-0">
						<section class="bg-white rounded-[2.5rem] p-10 shadow-sm border border-gray-100">
							<div class="flex items-center gap-4 mb-8">
								<div class="w-10 h-10 rounded-xl bg-primary/10 flex items-center justify-center text-primary">
									<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"></path></svg>
								</div>
								<h3 class="text-xl font-black text-gray-900 uppercase tracking-tight italic">How would you like to pay?</h3>
							</div>

							<div class="space-y-4">
								<!-- FPX Option -->
								<div class="payment-method-card group">
									<label class="flex items-center p-6 border-2 border-gray-100 rounded-3xl cursor-pointer transition-all hover:border-primary/20 hover:bg-gray-50/50 has-[:checked]:border-primary has-[:checked]:bg-red-50/30">
										<input type="radio" name="paymentMethod" value="FPX" required class="w-5 h-5 text-primary focus:ring-primary border-gray-300">
										<div class="ml-6 flex-grow">
											<h4 class="text-lg font-black text-gray-900 italic">Online Banking (FPX)</h4>
											<p class="text-sm text-gray-400 font-medium">Instant transfer from your bank</p>
										</div>
										<img src="https://brandlogovector.com/wp-content/uploads/2021/10/FPX-Logo.png" alt="FPX" class="h-8 filter grayscale opacity-50 group-hover:grayscale-0 group-hover:opacity-100 peer-checked:grayscale-0 peer-checked:opacity-100 transition-all">
									</label>

									<!-- Banks Grid (Toggled in JS) -->
									<div id="fpxBanks" class="hidden grid grid-cols-2 sm:grid-cols-3 gap-3 p-6 bg-gray-50/50 rounded-3xl mt-4 border border-gray-100 animate-in fade-in slide-in-from-top-4 duration-500">
										<c:forEach var="bank" items="${['MBB:Maybank2U', 'CIMB:CIMB Clicks', 'PBB:Public Bank', 'RHB:RHB Now', 'HLB:Hong Leong', 'AMBANK:AmOnline', 'BIMB:Bank Islam', 'BSN:BSN', 'AFFIN:Affin Bank']}">
											<c:set var="bankParts" value="${bank.split(':')}"/>
											<label class="group relative">
												<input type="radio" name="bankCode" value="${bankParts[0]}" class="peer hidden">
												<div class="p-3 border-2 border-white bg-white text-center rounded-2xl cursor-pointer transition-all peer-checked:border-primary peer-checked:bg-white peer-checked:shadow-lg hover:border-gray-200">
													<p class="text-[10px] font-black text-gray-500 uppercase tracking-widest truncate group-hover:text-primary transition-colors">${bankParts[1]}</p>
												</div>
											</label>
										</c:forEach>
									</div>
								</div>

								<!-- Card Option -->
								<div class="payment-method-card group">
									<label class="flex items-center p-6 border-2 border-gray-100 rounded-3xl cursor-pointer transition-all hover:border-primary/20 hover:bg-gray-50/50 has-[:checked]:border-primary has-[:checked]:bg-red-50/30">
										<input type="radio" name="paymentMethod" value="CARD" class="w-5 h-5 text-primary focus:ring-primary border-gray-300">
										<div class="ml-6 flex-grow">
											<h4 class="text-lg font-black text-gray-900 italic">Credit / Debit Card</h4>
											<p class="text-sm text-gray-400 font-medium">Secure payment via Visa / Mastercard</p>
										</div>
										<div class="flex items-center gap-2 grayscale group-hover:grayscale-0 opacity-50 group-hover:opacity-100 transition-all">
											<img src="https://upload.wikimedia.org/wikipedia/commons/5/5e/Visa_Inc._logo.svg" alt="Visa" class="h-4">
											<img src="https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg" alt="Mastercard" class="h-6">
										</div>
									</label>

									<!-- Card Form (Toggled in JS) -->
									<div id="cardForm" class="hidden p-8 bg-gray-50/50 rounded-3xl mt-4 border border-gray-100 space-y-6 animate-in fade-in slide-in-from-top-4 duration-500">
										<div class="space-y-4">
											<div>
												<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Card Number</label>
												<input type="text" id="cardNumber" placeholder="0000 0000 0000 0000" maxlength="19" class="w-full bg-white border-2 border-white focus:border-primary px-6 py-4 rounded-2xl font-bold tracking-widest text-lg transition-all shadow-sm focus:outline-none placeholder:text-gray-200">
											</div>
											<div class="grid grid-cols-2 gap-4">
												<div>
													<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Expiry Date</label>
													<input type="text" id="cardExpiry" placeholder="MM/YY" maxlength="5" class="w-full bg-white border-2 border-white focus:border-primary px-6 py-4 rounded-2xl font-bold text-center transition-all shadow-sm focus:outline-none">
												</div>
												<div>
													<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">CVV</label>
													<input type="text" id="cardCvv" placeholder="•••" maxlength="4" class="w-full bg-white border-2 border-white focus:border-primary px-6 py-4 rounded-2xl font-bold text-center transition-all shadow-sm focus:outline-none">
												</div>
											</div>
											<div>
												<label class="text-[10px] font-black text-gray-400 uppercase tracking-[0.2em] block mb-2 px-1">Cardholder Name</label>
												<input type="text" id="cardName" placeholder="AS APPEARS ON CARD" class="w-full bg-white border-2 border-white focus:border-primary px-6 py-4 rounded-2xl font-black uppercase tracking-wider transition-all shadow-sm focus:outline-none placeholder:text-gray-200">
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>

					<!-- Summary Sidebar -->
					<div class="lg:w-5/12 sticky top-28">
						<section class="bg-gray-900 rounded-[2.5rem] p-10 text-white shadow-2xl shadow-gray-200 relative overflow-hidden">
							<div class="absolute top-0 right-0 w-40 h-40 bg-primary/20 rounded-bl-full -mr-20 -mt-20"></div>
							
							<h3 class="text-2xl font-black mb-10 tracking-tight italic flex items-center gap-3">
								<svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
								Order Summary
							</h3>

							<div class="space-y-6 max-h-[300px] overflow-y-auto pr-4 custom-scrollbar mb-10">
								<c:forEach var="item" items="${cartItems}">
									<div class="flex items-center gap-4 group">
										<div class="w-16 h-16 rounded-xl bg-white/10 overflow-hidden flex-shrink-0 p-1 border border-white/5">
											<img src="${not empty item.product.imageUrl ? item.product.imageUrl : 'images/product-placeholder.png'}" alt="${item.product.name}" class="w-full h-full object-cover rounded-lg group-hover:scale-110 transition-transform duration-500">
										</div>
										<div class="flex-grow">
											<h5 class="text-sm font-bold text-white line-clamp-1">${item.product.name}</h5>
											<p class="text-[10px] text-gray-400 mt-1 uppercase tracking-widest font-black">${item.quantity} × <fmt:formatNumber value="${item.product.price}" pattern="RM #,##0.00"/></p>
										</div>
										<div class="text-right">
											<p class="text-sm font-black text-primary italic">RM <fmt:formatNumber value="${item.product.price * item.quantity}" pattern="#,##0.00"/></p>
										</div>
									</div>
								</c:forEach>
							</div>

							<div class="pt-10 border-t border-white/10 space-y-4">
								<div class="flex justify-between items-center">
									<span class="text-xs uppercase tracking-[0.2em] text-gray-500 font-black">Subtotal</span>
									<span class="font-bold text-white">RM <fmt:formatNumber value="${subtotal}" pattern="#,##0.00"/></span>
								</div>
								<div class="flex justify-between items-center">
									<span class="text-xs uppercase tracking-[0.2em] text-gray-500 font-black">Shipping</span>
									<span class="text-green-400 font-bold uppercase tracking-widest text-xs">Pickup @ Campus</span>
								</div>
								<div class="pt-6 flex justify-between items-end">
									<span class="text-xs uppercase tracking-[0.3em] font-black text-primary mb-1">Total Payable</span>
									<span class="text-4xl font-black tracking-tighter italic">
										RM <fmt:formatNumber value="${total}" pattern="#,##0.00"/>
									</span>
								</div>
							</div>

							<button type="submit" class="w-full bg-primary hover:bg-opacity-90 text-white py-6 rounded-2xl font-black text-xl shadow-xl shadow-red-950 mt-12 transition-all transform active:scale-[0.98] flex items-center justify-center group">
								<svg class="w-6 h-6 mr-2 opacity-50 group-hover:opacity-100 animate-pulse" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v2h8z"></path></svg>
								Complete Payment
							</button>

							<div class="mt-8 flex items-center justify-center gap-4 text-[10px] font-black uppercase tracking-[0.2em] text-gray-500">
								<div class="flex items-center gap-1">
									<svg class="w-3 h-3 text-green-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l5-5z" clip-rule="evenodd"></path></svg>
									HTTPS Secure
								</div>
							</div>
						</section>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
	// Interactive Payment Selection
	const fpxBanks = document.getElementById('fpxBanks');
	const cardForm = document.getElementById('cardForm');
	
	document.querySelectorAll('input[name="paymentMethod"]').forEach(radio => {
		radio.addEventListener('change', (e) => {
			// Toggle sections
			if (e.target.value === 'FPX') {
				fpxBanks.classList.remove('hidden');
				cardForm.classList.add('hidden');
			} else if (e.target.value === 'CARD') {
				fpxBanks.classList.add('hidden');
				cardForm.classList.remove('hidden');
			}
		});
	});

	// Formatting for Card inputs
	const cardNumber = document.getElementById('cardNumber');
	if (cardNumber) {
		cardNumber.addEventListener('input', (e) => {
			let v = e.target.value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
			let matches = v.match(/\d{4,16}/g);
			let match = matches && matches[0] || '';
			let parts = [];
			for (let i=0, len=match.length; i<len; i+=4) {
				parts.push(match.substring(i, i+4));
			}
			if (parts.length) {
				e.target.value = parts.join(' ');
			} else {
				e.target.value = v;
			}
		});
	}

	const cardExpiry = document.getElementById('cardExpiry');
	if (cardExpiry) {
		cardExpiry.addEventListener('input', (e) => {
			let v = e.target.value.replace(/\D/g, '');
			if (v.length >= 2) {
				e.target.value = v.substring(0, 2) + '/' + v.substring(2, 4);
			}
		});
	}
	</script>

<jsp:include page="footer.jsp" />
</body>
</html>