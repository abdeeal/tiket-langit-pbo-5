<% String title = "index"; %>
<%@ include file="connection.jsp" %>

<%
    Statement stmt = null;
    ResultSet rs = null;
    String countryName = "Alaska";

    try {
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM trip WHERE id_trip = 1");

        if (rs.next()) {
            countryName = rs.getString("country");
        }
    } catch (SQLException e) {
        out.println("Database error: " + e.getMessage());
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) {}
        try { if (stmt != null) stmt.close(); } catch (SQLException e) {}
        try { if (conn != null) conn.close(); } catch (SQLException e) {}
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TiketLangit - Make your travel wishlist, we'll do the rest</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="./output.css" rel="stylesheet">
    <style>
        .hero-bg {
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('assets/homepage/image1.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        .alaska-bg {
            background: linear-gradient(to bottom, #87CEEB 0%, #87CEEB 60%, #228B22 100%);
        }

        .mountain-silhouette {
            background: url('asset/trip/<%= countryName %>_1.png');
            background-repeat: no-repeat;
            background-position: center bottom;
            background-size: cover;
        }

        .step-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .step-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body class="bg-white flex flex-col min-h-screen">

    <%@ include file="/fragments/navbar.jsp" %>

    <script>
        function toggleMobileMenu() {
            const menu = document.getElementById("mobile-menu");
            menu.classList.toggle("hidden");
        }
    </script>

    <script>
        function toggleMobileMenu() {
            const menu = document.getElementById("mobile-menu");
            menu.classList.toggle("hidden");
        }
    </script>

    
    <main class="flex-grow pt-10">

       
        <section class="hero-bg h-[650px] flex items-center">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                    <div class="text-white">
                        <h1 class="text-5xl lg:text-6xl font-bold leading-tight mb-6">
                            Make your travel wishlist, we'll do the rest
                        </h1>
                        <p class="text-xl mb-8 text-gray-200">
                            Special offers to suit your plan
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-20 relative overflow-visible">
            <div class="w-[70%] h-[50%] absolute bg-cyan-400/10 rounded-full right-[60%] blur-3xl -z-10 top-[40%]"></div>
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-16">
                    <h2 class="text-4xl font-bold text-gray-900 mb-4">
                        Look Our New Trip: Discover the Magic of <%= countryName %>
                    </h2>
                    <p class="text-gray-600 max-w-3xl mx-auto">
                        Join us on an unforgettable journey through <%= countryName %> breathtaking landscapes, from majestic
                        glaciers to wildlife-filled forests the adventure of a lifetime awaits!
                    </p>
                </div>
            </div>

            <div class="max-w-[80%] mx-auto">
                <div class="flex flex-col items-center relative">
                    <img src="assets/homepage/image2.png" class="w-full object-cover" />
                    <div class="p-8 bg-white max-w-[90%] -translate-y-[40%] px-[64px] shadow-lg">
                        <div class="flex justify-between items-start mb-6">
                            <h3 class="text-[64px] font-bold text-gray-900"><%= countryName %></h3>
                            <span class=" text-red-700 rounded-full font-bold text-[64px]">NEW!</span>
                        </div>
                        <p class="text-gray-600 mb-8 leading-relaxed w-[50%]">
                            Norwegia is the largest and northernmost state in the United States, known for its vast
                            wilderness and stunning natural landscapes. It features towering mountains, glaciers, and
                            rich wildlife, making it a haven for adventurers and nature lovers.
                        </p>
                        <a href="destination.jsp"
                            class="inline-block bg-blue-900 hover:bg-blue-700 text-white px-8 py-3 font-semibold transition-colors">
                            See Our Destination
                        </a>

                    </div>
                </div>
            </div>
        </section>
        
        <section class="py-20 bg-white">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-16">
                    <h2 class="text-4xl font-bold text-gray-900 mb-4">
                        Book Your Trip in 3 Easy Steps
                    </h2>
                    <p class="text-gray-600 max-w-2xl mx-auto">
                        Enjoy different experiences in every place you visit and discover new and affordable adventures.
                    </p>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 items-center">
                    
                    <div class="lg:col-span-2 space-y-8">
                       
                        <div class="flex items-start space-x-6">
                            <div
                                class="flex-shrink-0 w-[68px] aspect-square bg-blue-100 rounded-2xl flex items-center justify-center">
                                <img src="assets/homepage/Group 7.svg" class="w-full" >
                            </div>
                            <div class="-translate-y-[16px]">
                                <h3 class="text-2xl font-bold text-gray-900 mb-3">Choose Destination</h3>
                                <p class="text-gray-600 text-lg w-[80%]">
                                    Pick your dream getaway from our exciting list of destinations.
                                </p>
                            </div>
                        </div>

                       
                        <div class="flex items-start space-x-6">
                            <div
                                class="flex-shrink-0 w-[68px] aspect-square rounded-2xl flex items-center justify-center" style="background-color: #226597;">
                                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z" />
                                </svg>
                            </div>
                            <div class="-translate-y-[16px]">
                                <h3 class="text-2xl font-bold text-gray-900 mb-3">Make Payment</h3>
                                <p class="text-gray-600 text-lg w-[80%]">
                                    Secure your spot quickly and safely with our simple payment system.
                                </p>
                            </div>
                        </div>

                       
                        <div class="flex items-start space-x-6">
                            <div
                                class="flex-shrink-0 w-[68px] aspect-square bg-blue-900 rounded-2xl flex items-center justify-center">
                                <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 20 20">
                                    <path
                                        d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z" />
                                </svg>
                            </div>
                            <div class="-translate-y-[16px]">
                                <h3 class="text-2xl font-bold text-gray-900 mb-3">Reach Airport on Selected Date</h3>
                                <p class="text-gray-600 text-lg w-[80%]">
                                    Pack your bags and get ready — your adventure begins at the airport!
                                </p>
                            </div>
                        </div>
                    </div>

                    
                    <div class="lg:col-span-1">
                        <div class="bg-white rounded-2xl shadow-xl overflow-hidden max-w-sm mx-auto">
                            <div class="relative">
                                <img src="assets/homepage/image3.png" alt="Trip to Yunani"
                                    class="w-full h-48 object-cover">
                            </div>
                            <div class="p-6">
                                <h4 class="text-xl font-bold text-gray-900 mb-2">Trip To Yunani</h4>
                                <p class="text-gray-500 mb-2">14-29 June</p>
                                <p class="text-gray-700 mb-6">24 people going</p>
                                <a href="destination.jsp"
                                    class="w-full bg-blue-900 hover:bg-blue-700 text-white py-3 px-6 rounded-lg font-semibold transition-colors">
                                    Book Now
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main>

    <script>
        function toggleMobileMenu() {
            const menu = document.getElementById('mobile-menu');
            menu.classList.toggle('hidden');
        }
    </script>

</body>

</html>