<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Secure Portal | CampusHub</title>
    <!-- Tailwind Play CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#db4444',
                        dark: '#1a1a2e',
                    }
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; }
        .spin-slow { animation: spin 2s linear infinite; }
        @keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
    </style>
</head>
<%
    String paymentMethod = request.getParameter("paymentMethod");
    String paymentId = request.getParameter("paymentId");
    if (paymentMethod == null) paymentMethod = "Card";
    if (paymentId == null) paymentId = "TXN-" + System.currentTimeMillis();
%>
<body class="bg-[#1a1a2e] bg-[radial-gradient(ellipse_at_top_right,_var(--tw-gradient-stops))] from-blue-900 via-dark to-black min-h-screen flex items-center justify-center p-4">
    
    <div class="bg-white rounded-[3rem] shadow-2xl overflow-hidden max-w-md w-full relative group">
        <!-- Decoration -->
        <div class="absolute -top-12 -right-12 w-48 h-48 bg-primary/5 rounded-full group-hover:bg-primary/10 transition-colors duration-700"></div>
        <div class="absolute -bottom-12 -left-12 w-32 h-32 bg-blue-500/5 rounded-full"></div>

        <div class="p-12 text-center relative z-10">
            
            <!-- Processing State -->
            <div id="processingState" class="space-y-8">
                <!-- Portal Branding -->
                <div class="mb-10">
                    <% if ("FPX".equals(paymentMethod)) { %>
                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/a2/FPX_logo.svg" alt="FPX" class="h-10 mx-auto">
                    <% } else { %>
                        <div class="flex items-center justify-center space-x-4">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/5/5e/Visa_Inc._logo.svg" alt="Visa" class="h-6">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg" alt="Mastercard" class="h-10">
                        </div>
                    <% } %>
                    <div class="mt-4 flex items-center justify-center space-x-2 text-[10px] font-black uppercase tracking-[0.3em] text-gray-400">
                        <svg class="w-3 h-3 text-green-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l5-5z" clip-rule="evenodd"></path></svg>
                        Secure Bank Portal
                    </div>
                </div>

                <div class="relative w-24 h-24 mx-auto">
                    <div class="w-24 h-24 rounded-full border-4 border-gray-50 border-t-primary spin-slow"></div>
                    <div class="absolute inset-0 flex items-center justify-center">
                        <svg class="w-8 h-8 text-primary opacity-30 animate-pulse" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path></svg>
                    </div>
                </div>

                <div class="space-y-3">
                    <h2 class="text-2xl font-black text-gray-900 italic tracking-tight uppercase">Processing</h2>
                    <p class="text-sm text-gray-500 font-medium leading-relaxed">
                        <% if ("FPX".equals(paymentMethod)) { %>
                            Synthesizing connection to bank nodes...
                        <% } else { %>
                            Verifying payment credentials...
                        <% } %>
                    </p>
                </div>

                <!-- Progress Steps -->
                <div class="flex justify-center gap-3">
                    <div class="w-3 h-3 rounded-full bg-green-500" id="step1"></div>
                    <div class="w-3 h-3 rounded-full bg-primary animate-pulse shadow-[0_0_10px_rgba(219,68,68,0.5)]" id="step2"></div>
                    <div class="w-3 h-3 rounded-full bg-gray-100" id="step3"></div>
                </div>

                <div class="bg-gray-50 p-4 rounded-2xl border border-gray-100">
                    <p class="text-[10px] font-black text-gray-400 uppercase tracking-widest mb-1">Transaction Identity</p>
                    <p class="text-xs font-mono font-bold text-gray-600 tracking-tight italic"><%= paymentId %></p>
                </div>

                <footer class="pt-4 text-[10px] font-bold text-gray-300 uppercase tracking-widest">
                    Do not close this window
                </footer>
            </div>

            <!-- Success State -->
            <div id="successState" class="hidden animate-in fade-in zoom-in duration-700 space-y-8">
                <div class="w-24 h-24 bg-green-500 rounded-full flex items-center justify-center mx-auto text-white shadow-2xl shadow-green-200">
                    <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path></svg>
                </div>
                
                <div class="space-y-2">
                    <h2 class="text-3xl font-black text-green-600 italic tracking-tighter uppercase">Authorized</h2>
                    <p class="text-sm text-gray-500 font-medium">Payment confirmed and secured.</p>
                </div>

                <div class="flex flex-col items-center">
                    <div class="w-full h-1 bg-gray-100 rounded-full overflow-hidden">
                        <div class="w-full h-full bg-green-500 origin-left scale-x-0 animate-[progress_1.5s_ease-in-out_forwards]"></div>
                    </div>
                    <p class="text-[10px] font-black text-gray-400 uppercase tracking-[0.3em] mt-4">Redirecting shortly</p>
                </div>
            </div>
        </div>
    </div>

    <style>
        @keyframes progress { from { transform: scaleX(0); } to { transform: scaleX(1); } }
    </style>

    <script>
        const steps = [document.getElementById('step1'), document.getElementById('step2'), document.getElementById('step3')];
        const processingState = document.getElementById('processingState');
        const successState = document.getElementById('successState');

        // Animation sequence
        setTimeout(() => {
            steps[1].classList.remove('animate-pulse', 'bg-primary');
            steps[1].classList.add('bg-green-500');
            steps[1].style.boxShadow = 'none';
            steps[2].classList.add('animate-pulse', 'bg-primary');
            steps[2].style.boxShadow = '0 0 10px rgba(219,68,68,0.5)';
        }, 2200);

        setTimeout(() => {
            steps[2].classList.remove('animate-pulse', 'bg-primary');
            steps[2].classList.add('bg-green-500');
            steps[2].style.boxShadow = 'none';
        }, 3600);

        setTimeout(() => {
            processingState.classList.add('hidden');
            successState.classList.remove('hidden');
        }, 4000);

        // Redirect via POST to trigger order creation
        setTimeout(() => {
            document.getElementById('checkoutForm').submit();
        }, 5800);
    </script>
    
    <!-- Hidden form for POST redirect -->
    <form id="checkoutForm" action="checkout" method="POST" style="display:none;"></form>
</body>
</html>
