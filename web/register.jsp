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
					<div class="text-center lg:text-left mb-10">
						<h1 class="text-4xl font-black text-gray-900 tracking-tighter italic uppercase mb-3">Register</h1>
						<p class="text-sm text-gray-400 font-medium uppercase tracking-widest">Create your student account</p>
					</div>

					<!-- Error Alert -->
					<c:if test="${not empty error}">
						<div class="mb-8 p-4 bg-red-50 border border-red-100 rounded-2xl flex items-center gap-4 animate-shake">
							<div class="w-10 h-10 bg-red-500 rounded-xl flex items-center justify-center text-white flex-shrink-0">
								<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
							</div>
							<p class="text-xs font-bold text-red-600 uppercase tracking-wide leading-tight">${error}</p>
						</div>
					</c:if>

					<form action="register" method="POST" class="space-y-5">
						
						<!-- Name & Email -->
						<div class="grid grid-cols-1 gap-5">
							<div class="relative group">
								<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Full Name</label>
								<input type="text" name="name" required placeholder="Full Name"
									class="w-full px-6 py-4 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 placeholder:text-gray-200 focus:border-primary focus:ring-0 transition-all">
							</div>
							<div class="relative group">
								<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Student Email (@.edu.my)</label>
								<input type="email" name="email" required pattern=".+\.edu\.my$" placeholder="Student Email"
									class="w-full px-6 py-4 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 placeholder:text-gray-200 focus:border-primary focus:ring-0 transition-all">
							</div>
						</div>

						<!-- Password & Phone -->
						<div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
							<div class="relative group">
								<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Password</label>
								<input type="password" name="password" required placeholder="••••••••"
									class="w-full px-6 py-4 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 placeholder:text-gray-200 focus:border-primary focus:ring-0 transition-all">
							</div>
							<div class="relative group">
								<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">Phone Number</label>
								<input type="text" name="phone" placeholder="Phone Number"
									class="w-full px-6 py-4 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 placeholder:text-gray-200 focus:border-primary focus:ring-0 transition-all">
							</div>
						</div>

						<!-- University Selection -->
						<div class="relative group">
							<label class="absolute -top-2.5 left-4 px-2 bg-white text-[10px] font-black text-gray-400 group-focus-within:text-primary transition-colors uppercase tracking-widest">University</label>
							<select name="university" required
								class="w-full px-6 py-4 bg-white border-2 border-gray-100 rounded-2xl text-sm font-bold text-gray-900 focus:border-primary focus:ring-0 transition-all appearance-none cursor-pointer">
								<option value="" disabled selected>Select Your University</option>
								<option value="UiTM Shah Alam">UiTM Shah Alam (Main Campus)</option>
								<option value="UiTM Puncak Alam">UiTM Puncak Alam</option>
								<option value="UiTM Dengkil">UiTM Dengkil</option>
								<option value="UiTM Puncak Perdana">UiTM Puncak Perdana</option>
								<option value="UKM Bangi">UKM Bangi</option>
								<option value="UPM Serdang">UPM Serdang</option>
								<option value="UNITEN Kajang">UNITEN Kajang</option>
								<option value="UNISEL Shah Alam">UNISEL Shah Alam</option>
								<option value="UNISEL Bestari Jaya">UNISEL Bestari Jaya</option>
								<option value="UPNM Sungai Besi">UPNM Sungai Besi</option>
							</select>
							<div class="absolute inset-y-0 right-6 flex items-center pointer-events-none">
								<svg class="w-4 h-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
							</div>
						</div>
						
						<button type="submit" class="w-full py-5 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-[0.2em] shadow-lg shadow-red-900/10 hover:shadow-primary/20 transition-all transform active:scale-95 mt-4">
							Register
						</button>
						
						<div class="pt-8 border-t border-gray-50 text-center">
							<p class="text-xs font-bold text-gray-400 uppercase tracking-widest leading-loose">
								Already have an account?
								<a href="login.jsp" class="text-gray-900 hover:text-primary transition-colors ml-2 border-b-2 border-gray-900 hover:border-primary pb-0.5">Login</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	
<jsp:include page="footer.jsp" />
</body>
</html>