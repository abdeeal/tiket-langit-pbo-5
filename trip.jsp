<%@ include file="connection.jsp" %>
  <%@ page import="java.sql.*, java.util.*, java.text.*" %>

    <% String id=request.getParameter("id"); 
      String error = request.getParameter("error");
      String errorOutput = "";

      if ("guest".equals(error)){
          errorOutput = "Jumlah Guest harus antara 1 hingga 50.";
      }

      PreparedStatement stmt=null; 
      ResultSet rs=null; 

      String countryName="" ;
      String desc = "" ; 
      String title="trip" ; 
      int harga = 0;
      String formattedHarga = "";

      try { 
        String sql="SELECT * FROM trip WHERE id_trip = ?" ;
        stmt = conn.prepareStatement(sql); 
        stmt.setString(1, id); 
        rs=stmt.executeQuery(); 

        if (rs.next()) {
          countryName=rs.getString("country"); desc=rs.getString("description"); 
          harga = rs.getInt("price"); 
        }
        NumberFormat rupiahFormat = NumberFormat.getInstance(new Locale("id", "ID"));
        formattedHarga = "IDR " + rupiahFormat.format(harga);
        } catch (Exception e) { 
          out.println("Error: " + e.getMessage());
      } finally {
          try { if (rs != null) rs.close(); } catch (Exception e) {}
          try { if (stmt != null) stmt.close(); } catch (Exception e) {}
      }
%>

<!DOCTYPE html>
<html lang=" en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tiket Langit</title>
        <link href="./output.css" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
      </head>

      <body>
        <%@ include file="./fragments/navbar.jsp" %>
          <div class="pt-16 flex-grow flex justify-center">
            <div class="max-w-7xl px-4 flex flex-col justify-center">
              <div class="grid grid-cols-4">
                <div class="col-span-3 flex flex-col">
                  <h1 class="font-bold text-4xl py-4 text-gray-800">
                    <%= countryName %>
                  </h1>
                  <div class="flex items-center pb-4 gap-2">
                    <img src="./assets/svg/location.svg" alt="" width="10">
                    <span class="text-gray-500">
                      <%= countryName %> <span class="px-2 text-gray-400">|</span><span class="text-green-500"> 50 Slots
                          Available</span>
                    </span>
                  </div>
                  <img src="./assets/trip/<%= countryName %>_1.png" alt="" class="w-full aspect-[16/9] object-cover">
                  <div class="flex space-x-4 mt-4">
                    <img src="./assets/trip/<%= countryName %>_2.png"
                      class="w-[calc(25%-0.75rem)] object-cover aspect-[16/9] bg-gray-300">
                    <img src="./assets/trip/<%= countryName %>_3.png"
                      class="w-[calc(25%-0.75rem)] object-cover aspect-[16/9] bg-gray-300">
                    <img src="./assets/trip/<%= countryName %>_4.png"
                      class="w-[calc(25%-0.75rem)] object-cover aspect-[16/9] bg-gray-300">
                    <img src="./assets/trip/<%= countryName %>_5.png"
                      class="w-[calc(25%-0.75rem)] object-cover aspect-[16/9] bg-gray-300">
                  </div>
                    <div class="relative w-full flex justify-between items-center max-w-4xl mx-auto pt-4">
                      <div class="absolute top-3 left-0 w-full h-0.5 bg-blue-100 z-0 mt-4"></div>

                      <div class="relative z-10 flex justify-between w-full text-center">
                        <%
                          PreparedStatement stmt3 = null;
                          ResultSet rs3 = null;

                          try {
                            String sql3 = "SELECT * FROM destination WHERE id_trip = ?";
                            stmt3 = conn.prepareStatement(sql3);
                            stmt3.setString(1, id);
                            rs3 = stmt3.executeQuery();

                            int count = 0;
                            while (rs3.next()) {
                              String lokasi = rs3.getString("lokasi");
                        %>
                          <div class="flex flex-col items-center w-1/<%= rs3.getFetchSize() > 0 ? rs3.getFetchSize() : 5 %>">
                            <div class="w-6 h-6 bg-blue-900 rounded-full border-4 border-blue-100"></div>
                            <span class="mt-2 text-sm font-semibold text-blue-900"><%= lokasi %></span>
                          </div>
                        <%
                            count++;
                            }
                          } catch (Exception e) {
                            out.println("Error destination items: " + e.getMessage());
                          } finally {
                            try { if (rs3 != null) rs3.close(); } catch (Exception e) {}
                            try { if (stmt3 != null) stmt3.close(); } catch (Exception e) {}
                          }
                        %>
                      </div>
                    </div>

                  <p class="text-gray-700 py-4 mt-4 text-sm">
                    <%= desc %>
                  </p>
                  <div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-gray-800">
                    <!-- Kiri: Activity + Safety -->
                    <div class="md:col-span-2 space-y-8">
                      <!-- Activity -->
                      <div>
                        <h2 class="text-xl font-bold mb-2">Activity</h2>
                        <h3 class="font-semibold mb-2">What You Will Do</h3>
                        <ul class="list-disc pl-5 space-y-1 text-gray-700 text-sm">
                          <li>Guided scenic walk through Santorini-inspired village</li>
                          <li>Boat tour and storytelling at Spinalonga Island replica</li>
                          <li>Kayaking & photo session in Melissani-style crystal cave</li>
                          <li>Beach stroll and picnic at Elafonissi-inspired shoreline</li>
                          <li>Explore ancient Greek art and interactive exhibits at the Acropolis Museum Center</li>
                        </ul>
                      </div>

                      <!-- Garis pemisah -->
                      <div class="h-[2px] bg-gray-300 my-6"></div>

                      <!-- Safety -->
                      <div>
                        <h2 class="text-xl font-bold mb-2">Safety</h2>
                        <h3 class="font-semibold mb-2">Health Precautions</h3>
                        <ul class="list-disc pl-5 space-y-1 text-gray-700 text-sm">
                          <li>Professional guides and certified instructors provided</li>
                          <li>Life jackets and helmets required for water activities</li>
                          <li>Emergency medical support available 24/7</li>
                          <li>Participants must disclose any health conditions in advance</li>
                        </ul>
                      </div>
                    </div>

                    <div class="space-y-6">
                      <!-- Destination -->
                      <div>
                        <h2 class="text-xl font-bold mb-2">Details</h2>
                        <div>
                          <h3 class="font-semibold">Destination</h3>
                          <ul class="list-disc pl-5 text-gray-700 text-sm space-y-1">
                            <%
                              PreparedStatement stmt2 = null;
                              ResultSet rs2 = null;

                              try {
                                String sql2 = "SELECT * FROM destination WHERE id_trip = ?";
                                stmt2 = conn.prepareStatement(sql2);
                                stmt2.setString(1, id);
                                rs2 = stmt2.executeQuery();

                                boolean hasData = false;

                                while(rs2.next()) {
                                  hasData = true;
                                  String lokasi = rs2.getString("lokasi");
                            %>
                                  <li><%= lokasi %></li>
                            <%
                                }

                                if (!hasData) {
                            %>
                                  <li style="color: red;">(Tidak ada data destinasi untuk trip ini)</li>
                            <%
                                }
                              } catch (Exception e) {
                                out.println("<li style='color:red;'>Error: " + e.getMessage() + "</li>");
                              } finally {
                                try { if (rs2 != null) rs2.close(); } catch (Exception e) {}
                                try { if (stmt2 != null) stmt2.close(); } catch (Exception e) {}
                              }
                            %>

                          </ul>
                        </div>
                      </div>

                      <!-- Trip Details -->
                      <div>
                        <h3 class="font-semibold pt-4">Trip Details</h3>
                        <ul class="list-disc pl-5 text-gray-700 text-sm space-y-1">
                          <li>Duration: 5 Days 4 Nights</li>
                          <li>Slots: 50 available</li>
                          <li>Recommended Age: 12+</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="text-gray-800">
                    <h1 class="text-2xl font-bold mb-4 mt-8">What Is Included / Not Included</h1>

                    <div class="flex gap-16">
                      <!-- Includes -->
                      <div class="w-1/2">
                        <h2 class="text-lg font-bold mb-3">Includes</h2>
                        <ul class="list-disc list-outside pl-6 text-gray-700 space-y-1 text-sm">
                          <li class="whitespace-nowrap">All entry tickets to destinations</li>
                          <li class="whitespace-nowrap">Local English-speaking tour guide</li>
                          <li class="whitespace-nowrap">Transportation during the trip</li>
                          <li class="whitespace-nowrap">Daily lunch and welcome dinner</li>
                          <li class="whitespace-nowrap">Safety gear for cave and kayaking activities</li>
                          <li class="whitespace-nowrap">Travel insurance</li>
                        </ul>
                      </div>

                      <!-- Not Includes -->
                      <div class="w-1/2">
                        <h2 class="text-lg font-bold mb-3">Not Includes</h2>
                        <ul class="list-disc list-outside pl-6 text-gray-700 space-y-1 text-sm">
                          <li class="whitespace-nowrap">Flights to and from Alaska</li>
                          <li class="whitespace-nowrap">Personal expenses (souvenirs, snacks)</li>
                          <li class="whitespace-nowrap">Tips for guides (optional)</li>
                          <li class="whitespace-nowrap">Extra meals beyond itinerary</li>
                        </ul>
                      </div>
                    </div>
                  </div>

                </div>
                <div class="col-span-1 flex flex-col pt-16 px-4">
                  <form action="payment.jsp" method="GET" class="px-4 shadow-lg pb-4 flex flex-col justify-between h-[576px]">
                    <div>
                      <input type="hidden" name="id" value="<%= id %>">
                      <h1 class="text-xl font-bold pt-8">Book Now</h1>
                      <hr class="my-4">
                      <p class="font-semibold">Number Of Guests</p>
                      <input type="number" name="guest" id="" class="mt-4 py-4 px-2 border rounded-md" value="1">
                      <p class="text-sm text-gray-700 mt-2">Person</p>
                      <p class="text-sm text-red-500 mt-4"><%= errorOutput %></p>
                    </div>
                    <div class="w-full">
                      <p class="w-full text-center mb-4 font-bold text-2xl text-blue-900"><%= formattedHarga %></p>
                      <button type="submit" class="text-center w-full bg-blue-900 text-white rounded-sm py-4">Book Now</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
      </body>

      </html>