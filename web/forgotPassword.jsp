<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />



	<!-- Main Content -->
	<div class="bg-transparent min-h-screen flex items-center justify-center pt-24 pb-20">
		<div class="max-w-md w-full mx-auto px-4">
			
			<div class="bg-white rounded-[3rem] shadow-2xl shadow-gray-200/50 border border-gray-100 p-10 sm:p-12 text-center">
				<!-- Header visual -->
				<div class="w-20 h-20 bg-primary/5 rounded-[2rem] flex items-center justify-center text-primary mx-auto mb-8 transform hover:rotate-12 transition-transform duration-500">
					<svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
				</div>

				<h2 class="text-3xl font-black text-gray-900 tracking-tighter italic uppercase mb-3">Lost Access?</h2>
				<p class="text-sm text-gray-400 font-medium leading-relaxed mb-10 max-w-xs mx-auto text-center">
					Enter your registered university email below to initiate the recovery protocol.
				</p>

				<form action="login.jsp" method="get" class="space-y-6">
					<div class="relative group">
						<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Protocol Email</label>
						<input type="email" name="email" required placeholder="syahrul@student.utm.my"
							class="w-full px-6 py-4 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 placeholder:text-gray-200 focus:border-primary focus:ring-0 transition-all text-center">
					</div>

					<button type="submit" class="w-full py-5 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-[0.2em] shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95">
						Authorize Reset
					</button>
				</form>

				<div class="mt-10 pt-8 border-t border-gray-50 flex flex-col gap-4">
					<p class="text-[10px] font-black text-gray-400 uppercase tracking-widest">
						Remembered your keys?
					</p>
					<a href="login.jsp" class="inline-flex items-center justify-center gap-2 text-xs font-black text-gray-900 hover:text-primary transition-colors uppercase italic tracking-wider">
						<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
						Back to Login
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>