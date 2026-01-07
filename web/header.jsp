<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>CampusHub</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/changes.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.tailwindcss.com"></script>
	<script>
		tailwind.config = {
			theme: {
				extend: {
					colors: {
						primary: '#db4444',
						secondary: '#f5f5f5',
						dark: '#1a1a1a',
					},
					borderRadius: {
						'xl': '1rem',
						'2xl': '1.5rem',
					}
				}
			}
		}
	</script>
</head>
<body class="page-wrapper">

	<!-- Navigation Bar -->
	<nav class="fixed w-full z-50 transition-all duration-300 bg-white shadow-sm border-b border-gray-100">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			<div class="flex justify-between items-center h-20">
				<!-- Brand -->
				<div class="flex-shrink-0 flex items-center">
					<a href="index.jsp" class="text-2xl font-bold tracking-tight text-primary hover:opacity-90 transition-opacity">
						CampusHub
					</a>
					<!-- Desktop Menu -->
					<div class="hidden md:ml-10 md:flex space-x-8">
						<a href="index.jsp" class="text-gray-600 hover:text-primary px-3 py-2 text-sm font-medium transition-colors">Home</a>
						<a href="categories.jsp" class="text-gray-600 hover:text-primary px-3 py-2 text-sm font-medium transition-colors">Categories</a>
					</div>
				</div>

				<!-- Right Actions -->
				<div class="flex items-center space-x-4">
					<c:choose>
						<c:when test="${not empty sessionScope.user}">
							<!-- Logged In User -->
							<div class="relative group">
								<button class="flex items-center space-x-3 focus:outline-none py-2 px-3 rounded-xl hover:bg-gray-50 transition-all border border-transparent hover:border-gray-100">
									<div class="w-10 h-10 rounded-full bg-primary flex items-center justify-center text-white font-bold text-lg shadow-sm">
										${sessionScope.userName.substring(0,1).toUpperCase()}
									</div>
									<div class="hidden sm:block text-left">
										<p class="text-xs text-gray-400 font-medium leading-none mb-1">Welcome back,</p>
										<p class="text-sm font-semibold text-gray-800 leading-none">${sessionScope.userName}</p>
									</div>
									<svg class="w-4 h-4 text-gray-400 group-hover:text-primary transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24">
										<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
									</svg>
								</button>
								
								<!-- Dropdown Menu -->
								<div class="absolute right-0 w-64 mt-2 origin-top-right bg-white border border-gray-100 rounded-2xl shadow-xl ring-1 ring-black ring-opacity-5 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 transform scale-95 group-hover:scale-100 z-50">
									<div class="py-2">
										<a href="profile" class="flex items-center px-4 py-3 text-sm text-gray-700 hover:bg-primary/5 hover:text-primary transition-colors">
											<svg class="w-5 h-5 mr-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
											My Profile
										</a>
										<a href="cart" class="flex items-center px-4 py-3 text-sm text-gray-700 hover:bg-primary/5 hover:text-primary transition-colors">
											<svg class="w-5 h-5 mr-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
											My Cart
										</a>
										<a href="orders" class="flex items-center px-4 py-3 text-sm text-gray-700 hover:bg-primary/5 hover:text-primary transition-colors">
											<svg class="w-5 h-5 mr-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path></svg>
											My Orders
										</a>
										<a href="sellerListings" class="flex items-center px-4 py-3 text-sm text-gray-700 hover:bg-primary/5 hover:text-primary transition-colors border-b border-gray-50">
											<svg class="w-5 h-5 mr-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
											My Listings
                                                                                </a>
										<a href="logout" class="flex items-center px-4 py-3 text-sm text-primary font-semibold hover:bg-primary/5 transition-colors">
											<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>
											Logout
										</a>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<!-- Not Logged In -->
							<div class="flex items-center space-x-4">
								<a href="login.jsp" class="text-gray-600 hover:text-primary text-sm font-semibold transition-colors px-4 py-2">Login</a>
								<a href="register.jsp" class="bg-primary hover:bg-opacity-90 text-white text-sm font-bold px-6 py-3 rounded-xl shadow-md transform active:scale-95 transition-all">
									Sign Up
								</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</nav>

	<!-- Spacing for fixed navbar -->
	<div class="h-20"></div>
