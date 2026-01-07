<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<!-- Main Content -->
	<div class="bg-transparent min-h-[calc(100vh-80px)] flex items-center justify-center relative overflow-hidden py-8">
		<div class="max-w-6xl w-full mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
			<div class="flex flex-col lg:flex-row items-center gap-16">
				
				<!-- Branding Section -->
				<div class="hidden lg:flex flex-1 flex-col items-center justify-center text-center">
					<div class="relative mb-8 group">
						<div class="absolute -inset-8 bg-primary/20 blur-[80px] rounded-full opacity-50 group-hover:opacity-75 transition-opacity duration-1000"></div>
						<div class="relative w-32 h-32 bg-white border border-gray-100 rounded-[2.5rem] flex items-center justify-center shadow-2xl shadow-gray-200/50 transition-all duration-700">
							<span class="text-primary text-5xl font-black italic select-none">CH</span>
						</div>
					</div>
					<div class="relative">
						<h1 class="text-5xl font-black text-gray-900 tracking-tighter italic uppercase mb-3">
							Campus<span class="text-primary">Hub</span>
						</h1>
						<p class="text-gray-400 font-black tracking-[0.4em] uppercase text-[10px]">The Student Economy</p>
					</div>
					<div class="mt-10 max-w-xs">
						<p class="text-sm text-gray-400 font-medium leading-relaxed italic">
							"Empowering student entrepreneurs and buyers with a secure, centralized campus marketplace."
						</p>
					</div>
				</div>

				<!-- Form Section -->
				<div class="w-full max-w-md">
					<div class="text-center lg:text-left mb-12">
						<h1 class="text-4xl font-black text-gray-900 tracking-tighter italic uppercase mb-3">Login</h1>
						<p class="text-sm text-gray-400 font-medium uppercase tracking-widest">Login to your account</p>
					</div>

					<!-- Alerts -->
					<c:if test="${not empty error}">
						<div class="mb-8 p-4 bg-red-50 border border-red-100 rounded-2xl flex items-center gap-4 animate-shake">
							<div class="w-10 h-10 bg-red-500 rounded-xl flex items-center justify-center text-white flex-shrink-0">
								<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
							</div>
							<p class="text-xs font-bold text-red-600 uppercase tracking-wide leading-tight">${error}</p>
						</div>
					</c:if>
					<c:if test="${not empty success}">
						<div class="mb-8 p-4 bg-green-50 border border-green-100 rounded-2xl flex items-center gap-4">
							<div class="w-10 h-10 bg-green-500 rounded-xl flex items-center justify-center text-white flex-shrink-0">
								<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
							</div>
							<p class="text-xs font-bold text-green-600 uppercase tracking-wide leading-tight">${success}</p>
						</div>
					</c:if>

					<form action="login" method="POST" class="space-y-6">
						<div class="relative group">
							<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Email Address</label>
							<input type="email" name="email" required autocomplete="email"
								placeholder="Email Address"
								class="w-full px-6 py-5 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 placeholder:text-gray-200 focus:border-primary focus:ring-0 transition-all">
						</div>

						<div class="relative group">
							<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Password</label>
							<input type="password" name="password" required autocomplete="current-password"
								placeholder="••••••••"
								class="w-full px-6 py-5 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 placeholder:text-gray-200 focus:border-primary focus:ring-0 transition-all">
						</div>

						<div class="flex items-center justify-between pt-2">
							<button type="submit" class="px-12 py-5 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95">
								Login
							</button>
							<a href="forgotPassword.jsp" class="text-[10px] font-black text-gray-400 hover:text-primary uppercase tracking-widest transition-colors">
								Forgot Password?
							</a>
						</div>
					</form>

					<div class="mt-12 pt-8 border-t border-gray-50 text-center">
						<p class="text-xs font-bold text-gray-400 uppercase tracking-widest leading-loose">
							Don't have an account?
							<a href="register.jsp" class="text-gray-900 hover:text-primary transition-colors ml-2 border-b-2 border-gray-900 hover:border-primary pb-0.5">Register</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="footer.jsp" />
</body>
</html>