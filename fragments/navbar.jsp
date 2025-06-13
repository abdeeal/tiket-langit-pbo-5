<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<%
    String url2 = "jdbc:mysql://localhost:3306/tiketlangit?useSSL=false&serverTimezone=UTC";
    String user2 = "root";
    String pass2 = "";     

    Connection conn2 = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn2 = DriverManager.getConnection(url2, user2, pass2);
    } catch (Exception e) {
        out.println("Gagal koneksi: " + e.getMessage());
    }

    String login = (String) session.getAttribute("login");
    PreparedStatement stmt5 = null; 
    ResultSet rs5 = null; 
    String username = "";

    try { 
    String sql="SELECT * FROM user WHERE email = ?" ;
    stmt5 = conn2.prepareStatement(sql); 
    stmt5.setString(1, login); 
    rs5 = stmt5.executeQuery(); 


    if (rs5.next()) {
      username = rs5.getString("username"); 
    }
    
    } catch (Exception e) { 
      out.println("Error: " + e.getMessage());
    } finally {
      try { if (rs5 != null) rs5.close(); } catch (Exception e) {}
      try { if (stmt5 != null) stmt5.close(); } catch (Exception e) {}
    }
%>
<link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>

<nav class="bg-white shadow-sm fixed w-full top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">

            <!-- Logo -->
            <div class="flex-shrink-0">
                <h1 class="text-2xl font-bold text-blue-900">TiketLangit</h1>
            </div>

            <!-- Navigation Menu -->
            <div class="hidden md:flex items-center space-x-1 ml-auto">
                
                <!-- Links -->
                <div class="bg-gray-100 py-2 rounded-full px-[1rem]">
                    <a href="index.jsp"
                        class="hover:text-blue-900 px-3 py-2 text-sm font-medium <%= ("index".equals(title) ? "text-blue-900" : "text-gray-600") %>">
                        Home
                    </a>
                    <a href="destination.jsp"
                        class="hover:text-blue-900 px-3 py-2 text-sm font-medium <%= ("destination".equals(title) ? "text-blue-900" : "text-gray-600") %>">
                        Destination
                    </a>
                    <a href="aboutus.jsp"
                        class="hover:text-blue-900 px-3 py-2 text-sm font-medium <%= ("aboutus".equals(title) ? "text-blue-900" : "text-gray-600") %>">
                        About Us
                    </a>

                    <% if (login != null) { %>
                        <a href="history.jsp"
                            class="hover:text-blue-900 px-3 py-2 text-sm font-medium <%= ("history".equals(title) ? "text-blue-900" : "text-gray-600") %>">
                            History
                        </a>
                    <% } %>
                </div>

                <!-- Auth Buttons -->
                <div>
                    <% if (login == null) { %>
                        <a href="login.jsp"
                            class="text-gray-600 hover:text-blue-900 px-4 py-2 text-sm font-medium border border-gray-300 rounded-full mr-2">
                            Sign In
                        </a>
                        <a href="register.jsp"
                            class="bg-blue-900 hover:bg-blue-800 text-white px-6 py-2 rounded-full text-sm font-medium">
                            Get Started
                        </a>
                    <% } else { %>
                        
                        <button id="dropdownInformationButton" data-dropdown-toggle="dropdownInformation" class="text-white bg-blue-900 hover:bg-blue-900 focus:outline-none focus:ring-blue-900 font-medium rounded-full text-sm px-5 py-[0.35rem] justify-center flex items-center dark:bg-blue-900 dark:hover:bg-blue-900 dark:focus:ring-blue-900 gap-2" type="button">
                            <img src="./assets/svg/pro.svg" alt="" width="30" class="z-10">
                            <svg class="w-2.5 h-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                            </svg>
                        </button>

                        <!-- Dropdown menu -->
                        <div id="dropdownInformation" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow-md w-44 dark:bg-white dark:divide-gray-600">
                            <div class="px-4 py-3 text-sm text-black dark:text-black">
                            <div><%= username %></div>
                            <div class="font-medium truncate"><%= login %></div>
                            </div>
                            <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownInformationButton">
                            <li>
                                <a href="login.jsp" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-blue-900 dark:hover:text-white text-black">Change Account</a>
                            </li>
                            <li>
                                <a href="./action/logout.jsp" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-blue-900 dark:hover:text-white text-black">Sign Out</a>
                            </li>
                            </ul>
                        </div>

                    <% } %>
                </div>
            </div>

            <!-- Mobile Button -->
            <div class="md:hidden">
                <button type="button" class="text-gray-700 hover:text-blue-900" onclick="toggleMobileMenu()">
                    <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4 6h16M4 12h16M4 18h16" />
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <!-- Mobile Menu -->
    <div id="mobile-menu" class="md:hidden hidden bg-white border-t">
        <div class="px-4 pt-4 pb-4 space-y-2">
            <a href="index.jsp"
                class="block px-4 py-2 text-gray-700 hover:text-blue-900 text-sm font-medium">Home</a>
            <a href="destination.jsp"
                class="block px-4 py-2 text-gray-700 hover:text-blue-900 text-sm font-medium">Destination</a>
            <a href="aboutus.jsp"
                class="block px-4 py-2 text-gray-700 hover:text-blue-900 text-sm font-medium">About Us</a>
            <a href="login.jsp"
                class="block px-4 py-2 text-gray-700 hover:text-blue-900 text-sm font-medium">Sign In</a>
            <a href="register.jsp"
                class="block px-4 py-2 bg-blue-900 hover:bg-blue-800 text-white rounded-full text-center text-sm font-medium">
                Get Started
            </a>
        </div>
    </div>
</nav>
