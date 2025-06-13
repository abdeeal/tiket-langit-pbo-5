<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, java.time.LocalDate, java.time.temporal.ChronoUnit" %>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>
<% String title = "history"; %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Explore All Around The World - TiketLangit</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 pb-[2rem]">

<%@ include file="/fragments/navbar.jsp" %>
<%@ include file="/connection.jsp" %>

<div class="max-w-7xl mx-auto pt-[5rem] px-4">
  <h2 class="text-2xl font-bold text-gray-900 mb-6">Trip History</h2>

  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-6">
    <%
      PreparedStatement stmt = null;
      ResultSet rs = null;
      PreparedStatement stmt2 = null;
      ResultSet rs2 = null;

      LocalDate today = LocalDate.now();
      String status;
      int qty = 0;

      int id_user = 0;
      String email =  (String) session.getAttribute("login");

      try {
        String sql2 = "SELECT id_user FROM user WHERE email = ?";
        stmt2 = conn.prepareStatement(sql2);
        stmt2.setString(1, email);
        rs2 = stmt2.executeQuery();

        if (rs2.next()){
          id_user = rs2.getInt("id_user");
        }

        String sql = "SELECT book.id_book, book.id_user, book.id_trip, book.subtotal, book.quantity, book.bank, trip.country, trip.date_dep, trip.date_arr, trip.price, trip.description FROM book INNER JOIN trip ON book.id_trip = trip.id_trip WHERE book.id_user = ?;";
        
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id_user);
        rs = stmt.executeQuery();

        while (rs.next()) {
            String name = rs.getString("country");
            String desc = rs.getString("description");
            int id_trip = rs.getInt("id_trip");
            qty = rs.getInt("book.quantity");

            java.sql.Date dep = rs.getDate("date_dep");
            java.sql.Date arr = rs.getDate("date_arr");
            LocalDate depDate = dep.toLocalDate();
            LocalDate arrDate = arr.toLocalDate();
         
            if (today.isBefore(depDate)) {
                status = "0";
            } else if ((today.isEqual(depDate) || today.isAfter(depDate)) && today.isBefore(arrDate.plusDays(1))) {
                status = "1";
            } else {
                status = "2";
            }

            long days = ChronoUnit.DAYS.between(depDate, arrDate) + 1;
            long nights = days - 1;

            String duration = days + " Days " + nights + " Nights";

            int price = rs.getInt("price");
            NumberFormat formatter = NumberFormat.getInstance(new Locale("id", "ID"));
            String formattedPrice = "IDR " + formatter.format(price);

            String image = rs.getString("country") + "_1.png";
    %>

    <div class="flex bg-white shadow rounded overflow-hidden ">
      <img src="./assets/trip/<%= image %>" alt="img" class="w-64 object-cover">
      <div class="p-4 grid grid-cols-5 justify-between flex-grow">
        <div class="col-span-3 mr-4 flex flex-col justify-between">
          <h3 class="font-semibold <% if(status.equals("0")) {out.println("text-green-600");}else if(status.equals("1")){out.println("text-yellow-600");}else{out.println("text-blue-900");} %> mb-2">
          <% if(status.equals("0")) {out.println("Trip Booked");}else if(status.equals("1")){out.println("Trip On Going");}else{out.println("Trip Completed");} %>
          </h3>
          <div class="text-lg font-bold text-gray-800"><%= name %></div>
          <div class="text-sm line-clamp-3 text-gray-700"><%= desc %></div>

        </div>
        <div class="col-span-2 flex flex-col justify-between">
          <div>
            <p class="text-sm text-gray-600 flex items-center mb-2 mt-2">
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" stroke-width="2"
               viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round"
                    d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                </svg>
            <%= duration %>
            </p>
            <div class="flex items-center text-sm text-gray-600">
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" stroke-width="2"
                    viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M17 20h5v-2a4 4 0 00-4-4h-1M9 20H4v-2a4 4 0 014-4h1m1-4a4 4 0 108 0 4 4 0 00-8 0z"/>
                </svg>
                <%= qty %> Seat
            </div>
          </div>
          <div class="text-lg font-bold text-blue-900"><%= formattedPrice %></div>
        </div>
      </div>
    </div>

    <%
        }
        } catch (Exception e) {
            out.println("<p class='text-red-600'>Error loading trips: " + e.getMessage() + "</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    %>
  </div>
</div>

</body>
</html>
