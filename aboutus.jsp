<% String title = "aboutus"; %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - TiketLangit</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .hero-bg {
            background-image: url("assets/aboutus/image1.jpg");
        }
    </style>
</head>

<%@ include file="/fragments/navbar.jsp" %>

<script>
    function toggleMobileMenu() {
        const menu = document.getElementById("mobile-menu");
        menu.classList.toggle("hidden");
    }
</script>
<body>
<section class="hero-bg flex items-center justify-start text-white px-4 sm:px-6 lg:px-8 bg-cover bg-no-repeat bg-center min-h-[400px] min-w-[100%]">
    <div class="max-w-7xl mx-auto w-full">
        <div class="py-16">
            <h1 class="text-[45px] font-[500] text-white mb-4">We Have The Best Tour For You</h1>
        </div>
    </div>
</section>

<!--container -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">

    <section class="mb-16">
        <h2 class="text-3xl font-bold text-gray-900 mb-8">Our Services</h2>

        <div class="mb-12">
            <h3 class="text-2xl font-bold text-gray-900 mb-6">Flights</h3>

            <div class="space-y-6">
                <div>
                    <h4 class="text-lg font-semibold text-gray-800 mb-2">Secure Online Transaction Guarantee</h4>
                    <p class="text-gray-600 leading-relaxed">
                        SSL technology from RapidSSL with authenticated certificates ensures the privacy and security of
                        your online transactions. Instant confirmation and e-tickets will be sent to your email.
                    </p>
                </div>

                <div>
                    <h4 class="text-lg font-semibold text-gray-800 mb-2">Most Comprehensive Search Results</h4>
                    <p class="text-gray-600 leading-relaxed">
                        Easily search for flight tickets across 100,000 routes in Asia Pacific and Europe. Find great
                        deals from Singapore Airlines, Cathay Pacific, Japan Airlines, All Nippon Airways, and more.
                    </p>
                </div>

                <div>
                    <h4 class="text-lg font-semibold text-gray-800 mb-2">Smart Search Algorithm</h4>
                    <p class="text-gray-600 leading-relaxed">
                        Discover the best flight options based on price, travel duration, departure time, and airline
                        combinations—powered by the latest technology.
                    </p>
                </div>
            </div>

            <!-- Ganti dengan logo asli Y -->
            <div class="mt-8 flex flex-wrap items-center justify-start gap-8 opacity-60 ">
                <img src="assets/aboutus/axon.png"" alt="Axon" class="w-[144px]">
                <img src="assets/aboutus/jet.png" alt="Jetstar" class="w-[144px]">
                <img src="assets/aboutus/expedia.png" alt="Expedia" class="w-[144px]">
                <img src="assets/aboutus/qantas.png" alt="Qantas" class="w-[144px]">
                <img src="assets/aboutus/alitalia.png" alt="Alitalia" class="w-[144px]">
            </div>
        </div>

        <div class="mb-12">
            <h3 class="text-2xl font-bold text-gray-900 mb-6">Hotels</h3>

            <div class="space-y-6">
                <div>
                    <h4 class="text-lg font-semibold text-gray-800 mb-2">Global Hotel Partners</h4>
                    <p class="text-gray-600 leading-relaxed">
                        We collaborate with hotel networks around the world to ensure your comfort wherever you stay.
                    </p>
                </div>

                <div>
                    <h4 class="text-lg font-semibold text-gray-800 mb-2">Wide Range of Accommodations</h4>
                    <p class="text-gray-600 leading-relaxed">
                        Choose from hotels, villas, resorts, apartments, and glamping options—ranging from
                        budget-friendly to luxurious—to suit all types of business travel needs.
                    </p>
                </div>

                <div>
                    <h4 class="text-lg font-semibold text-gray-800 mb-2">Verified Guest Reviews</h4>
                    <p class="text-gray-600 leading-relaxed">
                        To help you find the best accommodation, rely on millions of trusted, verified reviews from
                        guests who have booked through Traveloka.
                    </p>
                </div>
            </div>

            <!--Ganti pake logo asli y -->
            <div class="mt-8 flex flex-wrap items-center justify-start gap-8 opacity-60">
                <img src="assets/aboutus/accor.png" alt="Accor Live Limitless" class="w-[144px]">
                <img src="assets/aboutus/archipelago.png" alt="Archipelago International" class="w-[144px]">
                <img src="assets/aboutus/ihg.png" alt="IHG Hotels & Resorts" class="w-[144px]">
                <img src="assets/aboutus/artotel.png" alt="Artotel Group" class="w-[144px]">
            </div>
        </div>
    </section>

    <section class="mb-16">
        <h2 class="text-3xl font-bold text-gray-900 mb-8">Frequently Asked Questions (FAQ)</h2>

        <div class="space-y-6">
            <div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">What makes TiketLangit different from other travel
                    platforms?</h3>
                <p class="text-gray-600 leading-relaxed">
                    TiketLangit combines advanced search technology with secure booking processes and comprehensive
                    customer support. Our smart algorithm helps you find the best deals across 100,000+ routes, while
                    our SSL-encrypted platform ensures your transactions are safe and secure.
                </p>
            </div>

            <div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">How do we ensure the best prices for our customers?
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    We work directly with airlines and hotel partners to negotiate competitive rates. Our smart search
                    algorithm compares prices across multiple providers in real-time, ensuring you get the best
                    available deals for your travel dates and preferences.
                </p>
            </div>

            <div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">What customer support do we provide?</h3>
                <p class="text-gray-600 leading-relaxed">
                    Our dedicated customer support team is available 24/7 to assist you with bookings, changes, and any
                    travel-related questions. We provide instant confirmation, e-ticket delivery, and ongoing support
                    throughout your travel journey.
                </p>
            </div>

            <div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">How do we maintain security and trust?</h3>
                <p class="text-gray-600 leading-relaxed">
                    We use advanced SSL encryption technology from RapidSSL with authenticated certificates to protect
                    your personal and payment information. All our hotel and airline partners are verified and trusted
                    providers, ensuring reliable service and authentic accommodations.
                </p>
            </div>
        </div>
    </section>
</div>

<!-- Footer -->
<footer class="bg-gray-100 py-8 mt-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center text-gray-600">
            <p>&copy; 2025 TiketLangit. All rights reserved. | Terms of Service | Privacy Policy | Contact Us</p>
        </div>
    </div>
</footer>
</body>

</html>