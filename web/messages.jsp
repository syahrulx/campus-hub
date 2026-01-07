<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Redirect to servlet if not forwarded
    if (request.getAttribute("conversations") == null) {
        response.sendRedirect("messages");
        return;
    }
%>
<jsp:include page="header.jsp" />

	<!-- Main Content -->
	<div class="bg-transparent min-h-screen pt-24 pb-12 overflow-hidden">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-full">
			
			<div class="flex items-center justify-between mb-8">
				<h1 class="text-3xl font-black text-gray-900 tracking-tight italic uppercase">Inbox</h1>
				<div class="flex items-center gap-2 text-xs font-black text-gray-400 uppercase tracking-widest bg-white px-4 py-2 rounded-full shadow-sm border border-gray-100">
					<div class="w-2 h-2 rounded-full bg-green-500 animate-pulse"></div>
					Online Support
				</div>
			</div>

			<!-- Chat Context Container -->
			<div class="bg-white rounded-[2.5rem] shadow-sm border border-gray-100 overflow-hidden flex flex-col md:flex-row h-[700px] max-h-[calc(100vh-16rem)]">
				
				<!-- Sidebar: Conversations -->
				<div class="w-full md:w-80 lg:w-96 border-r border-gray-100 flex flex-col">
					<div class="p-6 border-b border-gray-50 bg-gray-50/30">
						<div class="relative">
							<span class="absolute inset-y-0 left-0 pl-4 flex items-center text-gray-400">
								<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
							</span>
							<input type="text" placeholder="Search chats..." class="w-full bg-white border-none rounded-2xl py-3 pl-10 pr-4 text-sm focus:ring-2 focus:ring-primary/20 placeholder:text-gray-300 font-medium shadow-sm transition-all">
						</div>
					</div>

					<div class="flex-grow overflow-y-auto custom-scrollbar">
						<c:choose>
							<c:when test="${empty conversations}">
								<div class="flex flex-col items-center justify-center h-full text-center p-10 opacity-30 italic">
									<svg class="w-16 h-16 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"></path></svg>
									<p class="text-sm font-bold uppercase tracking-widest">No Active Chats</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="convo" items="${conversations}">
									<a href="messages?with=${convo.userId}" class="block transition-all ${convo.userId == chatWithId ? 'bg-red-50/50 relative' : 'hover:bg-gray-50'}">
										<c:if test="${convo.userId == chatWithId}">
											<div class="absolute inset-y-0 left-0 w-1 bg-primary"></div>
										</c:if>
										<div class="p-5 flex items-center gap-4">
											<div class="w-14 h-14 rounded-2xl bg-primary/10 flex items-center justify-center text-primary text-xl font-black italic shadow-inner">
												${convo.userName.substring(0, 1).toUpperCase()}
											</div>
											<div class="flex-grow min-w-0">
												<div class="flex justify-between items-baseline mb-1">
													<h4 class="text-sm font-black text-gray-900 truncate italic">${convo.userName}</h4>
													<c:if test="${convo.unreadCount > 0}">
														<span class="bg-primary text-white text-[10px] font-black px-2 py-0.5 rounded-full">${convo.unreadCount}</span>
													</c:if>
												</div>
												<p class="text-xs text-gray-400 font-medium truncate">${convo.lastMessage}</p>
											</div>
										</div>
									</a>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<!-- Main: Chat Window -->
				<div class="flex-grow flex flex-col bg-white">
					<c:choose>
						<c:when test="${empty chatWith}">
							<div class="flex-grow flex flex-col items-center justify-center p-12 text-center bg-gray-50/50">
								<div class="w-24 h-24 rounded-[2rem] bg-white shadow-xl shadow-gray-200 flex items-center justify-center text-gray-100 mb-8 transform hover:scale-110 transition-transform duration-500">
									<svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"></path></svg>
								</div>
								<h3 class="text-2xl font-black text-gray-900 italic tracking-tight uppercase mb-2">Select a Conversation</h3>
								<p class="text-sm text-gray-400 font-medium max-w-xs mx-auto">Click on a person to start chatting about products, deals, and campus meetups.</p>
							</div>
						</c:when>
						<c:otherwise>
							<!-- Chat Header -->
							<div class="px-8 py-5 border-b border-gray-100 flex justify-between items-center bg-white z-10">
								<div class="flex items-center gap-4">
									<div class="w-12 h-12 rounded-xl bg-gray-900 flex items-center justify-center text-white text-lg font-black italic shadow-lg shadow-gray-200">
										${chatWith.name.substring(0, 1).toUpperCase()}
									</div>
									<div>
										<h3 class="text-base font-black text-gray-900 italic tracking-tight uppercase">${chatWith.name}</h3>
										<p class="text-[10px] text-green-500 font-black uppercase tracking-widest flex items-center gap-1">
											<span class="w-1.5 h-1.5 bg-green-500 rounded-full"></span>
											Active Now
										</p>
									</div>
								</div>
								<div class="flex items-center gap-3">
									<button class="w-10 h-10 rounded-xl bg-gray-50 flex items-center justify-center text-gray-400 hover:text-primary hover:bg-red-50 transition-all">
										<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path></svg>
									</button>
								</div>
							</div>

							<!-- Messages Area -->
							<div class="flex-grow overflow-y-auto p-10 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] bg-opacity-5 space-y-8" id="chatMessages">
								<c:forEach var="msg" items="${messages}">
									<div class="message-wrapper flex ${msg.isMine ? 'justify-end' : 'justify-start'} group">
										<div class="max-w-[75%] lg:max-w-[60%] space-y-1.5">
											<div class="relative px-6 py-4 rounded-3xl shadow-sm transition-all ${msg.isMine ? 'bg-primary text-white font-medium rounded-tr-none' : 'bg-white border border-gray-100 text-gray-800 rounded-tl-none'} group-hover:shadow-md">
												<p class="text-sm leading-relaxed">${msg.content}</p>
											</div>
											<div class="flex ${msg.isMine ? 'justify-end' : 'justify-start'} items-center gap-2">
												<span class="text-[9px] font-black uppercase tracking-widest text-gray-300">
													<fmt:formatDate value="${msg.sentAt}" pattern="h:mm a"/>
												</span>
												<c:if test="${msg.isMine}">
													<svg class="w-3 h-3 text-primary opacity-30" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<!-- Chat Input Area -->
							<div class="p-8 border-t border-gray-100 bg-white">
								<form action="messages" method="POST" class="relative group">
									<input type="hidden" name="receiverId" value="${chatWithId}">
									<input type="text" name="content" required placeholder="Write a message..." autocomplete="off"
										class="w-full bg-gray-50 border-2 border-gray-50 focus:border-primary px-8 py-5 rounded-[2rem] font-medium text-sm transition-all shadow-sm focus:outline-none focus:ring-4 focus:ring-primary/5 pr-24 placeholder:text-gray-300">
									<button type="submit" class="absolute right-3 top-3 bottom-3 px-6 bg-primary text-white rounded-2xl font-black uppercase tracking-widest text-xs shadow-lg shadow-red-900/20 hover:scale-[1.02] transition-all active:scale-95 flex items-center gap-2 group">
										<span>Send</span>
										<svg class="w-4 h-4 transform group-hover:translate-x-1 group-hover:-translate-y-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path></svg>
									</button>
								</form>
								<div class="mt-4 flex gap-4 text-gray-300">
									<button class="hover:text-primary transition-colors"><svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"></path></svg></button>
									<button class="hover:text-primary transition-colors"><svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg></button>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

<script>
// Auto-scroll to bottom of messages
var chatMessages = document.getElementById('chatMessages');
if (chatMessages) {
    chatMessages.scrollTop = chatMessages.scrollHeight;
}
</script>

<jsp:include page="footer.jsp" />
</body>
</html>