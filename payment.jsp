<%@ include file="connection.jsp" %>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<% 
  String id = request.getParameter("id");
  String guest = request.getParameter("guest");
  String title = "Payment";

  int guestInt = Integer.parseInt(guest);
  if (guestInt < 1 || guestInt > 50) {
    String referer = request.getHeader("referer");
    if (referer != null) {
      String separator = referer.contains("?") ? "&" : "?";
      response.sendRedirect(referer + separator + "error=guest");
    } else {
        response.sendRedirect("index.jsp"); // fallback
    }

  }

  String email =  (String) session.getAttribute("login");

  if (email == null){
    response.sendRedirect("login.jsp?msg=Silahkan-login-terlebih-dahulu");
  }

  PreparedStatement stmt = null; 
  ResultSet rs = null; 

  PreparedStatement stmt2 = null; 
  ResultSet rs2 = null; 

  String countryName="" ;
  String desc = "" ; 
  int harga = 0;
  String formattedHarga = "";
  String date_arrFormat = "";
  String date_depFormat = "";
  int total = 0;
  String formattedTotal = "";
  int id_user = 0;
  
  try { 
    String sql="SELECT * FROM trip WHERE id_trip = ?" ;
    stmt = conn.prepareStatement(sql); 
    stmt.setString(1, id); 
    rs = stmt.executeQuery(); 

    String sql2 = "SELECT id_user FROM user WHERE email = ?";
    stmt2 = conn.prepareStatement(sql2);
    stmt2.setString(1, email);
    rs2 = stmt2.executeQuery();

    if (rs.next()) {
      countryName = rs.getString("country"); 
      desc = rs.getString("description"); 
      harga = rs.getInt("price"); 
    }

    if (rs2.next()){
      id_user = rs2.getInt("id_user");
    }
    
    NumberFormat rupiahFormat = NumberFormat.getInstance(new Locale("id", "ID"));
    formattedHarga = "IDR " + rupiahFormat.format(harga);

    total = harga * Integer.parseInt(guest);
    formattedTotal = "IDR " + rupiahFormat.format(total);

    java.util.Date date_dep = rs.getDate("date_dep");
    java.util.Date date_arr = rs.getDate("date_arr");

    SimpleDateFormat sdf = new SimpleDateFormat("EEEE, dd MMMM yyyy", new Locale("en", "EN"));
    date_depFormat = sdf.format(date_dep);
    date_arrFormat = sdf.format(date_arr);

    } catch (Exception e) { 
      out.println("Error: " + e.getMessage());
    } finally {
      try { if (rs != null) rs.close(); } catch (Exception e) {}
      try { if (stmt != null) stmt.close(); } catch (Exception e) {}
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TiketLangit</title>
  <link href="./output.css" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <style>
    input[type="radio"] {
      all: revert; /* mengembalikan tampilan default browser */
    }
  </style>
</head>
<body class="bg-gray-50">
    <%@ include file="./fragments/navbar.jsp" %>
  <form id="formPayment" action="./action/payment.jsp" method="GET" class="pt-16 w-full max-w-7xl px-4 mx-auto">
    <div class="grid grid-cols-5">
      <div class="col-span-3 flex flex-col">
        <div class="bg-white px-4 pb-4 mt-4 rounded-sm shadow-sm">
          <div class="flex justify-between">
            <div class="w-1/2">
              <h1 class="text-2xl font-bold pt-4 text-blue-900"><%= countryName %></h1>
              <p class="text-blue-900 mt-2 text-sm font-semibold"><%= desc %></p>
            </div>
            <div>
              <p class="pt-4 text-blue-900 text-2xl font-bold"><%= formattedHarga %></p>
              <p class="text-blue-900 mt-2 text-sm text-end font-bold">/Person</p>
            </div>
          </div>

          <div class="flex items-center py-4 mt-2 gap-2">
            <img src="./assets/svg/locationBlue.svg" alt="" width="10">
            <span class="text-blue-900 text-sm">
              <%= countryName %>
            </span>
          </div>

          <div class="flex justify-between font-semibold text-blue-900">
            <p><%= date_depFormat %></p>
            <img src="./assets/svg/mid.svg" alt="">
            <p><%= date_arrFormat %></p>
          </div>
        </div>

        <div class="p-4 mt-8 bg-white rounded-sm shadow-sm">
          <p class="font-bold text-2xl text-blue-900">Payment Method</p>
          <div class="flex justify-between w-full bg-blue-900 text-white rounded-md p-4 mt-4">
            <div class="flex flex-col">
              <p class="font-semibold">Bank Virtual Account</p>
              <p class="text-sm">Payment Will be Charged to Selected Bank Virtual Account.</p>
            </div>
          </div>
          <div class="flex gap-4 flex-wrap items-center pt-2">
            <div class="flex w-auto h-auto gap-4">
              <input class="  " type="radio" name="bank" id="bni" value="bni" checked>
              <img class="cursor-pointer" onclick="setRadio('bni')"  src="./assets/payment/bni.png" alt="" width="128px">
            </div>
            <div class="flex w-auto h-auto gap-2">
              <input class="  " type="radio" name="bank" id="bca" value="bca">
              <img class="cursor-pointer" onclick="setRadio('bca')" src="./assets/payment/bca.png" alt="" width="128px">
            </div>
            <div class="flex w-auto h-auto gap-2">
              <input class="  " type="radio" name="bank" id="bri" value="bri">
              <img class="cursor-pointer" onclick="setRadio('bri')" src="./assets/payment/bri.png" alt="" width="128px">
            </div>
            <div class="flex w-auto h-auto gap-4">
              <input class="  " type="radio" name="bank" id="mandiri" value="mandiri">
              <img class="cursor-pointer" onclick="setRadio('mandiri')" src="./assets/payment/mandiri.png" alt="" width="128px" class="-translate-y-2">
            </div>
          </div>
        </div>
      </div>

      <div class="ml-8 mt-4 w-full col-span-2 p-4 bg-white rounded-sm flex flex-col justify-between">
        <div>
          <img src="./assets/trip/<%= countryName %>_4.png" alt="" class="w-full aspect-[28/9] object-cover rounded-2xl">
          <p class="mt-8 text-gray-700 text-sm"><%= countryName %></p>
          <p class="mt-1 text-gray-800 font-semibold text-lg"><%= countryName + ": " + desc %></p>
          <hr class="my-8">
        </div>
        <div class="w-full flex flex-col gap-2">
          <p class="font-bold">Price Details</p>
          <div class="w-full justify-between flex">
            <p>Base Fare</p>
            <p class="font-bold text-blue-900"><%= formattedHarga %></p>
          </div>
          <div class="w-full justify-between flex">
            <p>Quantity</p>
            <p class="font-bold text-blue-900"><%= guest %></p>
          </div>
          <div class="w-full justify-between flex">
            <p>Total</p>
            <p class="font-bold text-blue-900"><%= formattedTotal %></p>
          </div>
          <input type="hidden" name="id_user" value="<%= id_user %>">
          <input type="hidden" name="total" value="<%= total %>">
          <input type="hidden" name="id_trip" value="<%= id %>">
          <input type="hidden" name="guest" value="<%= guest %>">
          
          <button onclick="successmsg()" type="button" class="bg-blue-900 text-white py-4 rounded-sm mt-4">Confirm & Pay</button>
        </div>
      </div>
    </div>

    <script>
      function setRadio(bank){
        document.getElementById(bank).checked = true;
      }

      function successmsg(){
        Swal.fire({
          title: "Konfirmasi Pembayaran",
          text: "Apakah kamu yakin ingin melanjutkan pembayaran?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonText: "Lanjut Bayar",
          cancelButtonText: "Batal",
          customClass: {
            confirmButton: "bg-blue-900 text-white px-4 py-2 rounded hover:bg-blue-700",
            cancelButton: "bg-red-500 text-white px-4 py-2 rounded hover:bg-red-300"
          }
        }).then((result) => {
          if (result.isConfirmed) {
            Swal.fire({
              title: "Pembayaran dikonfirmasi!",
              icon: "success",
              timer: 1500,
              showConfirmButton: false
            }).then(() => {
              Swal.fire({
                timer: 3500,
                timerProgressBar: true,
                text: "Selamat Menikmati Liburan anda!",
                imageUrl: "./assets/payment/swalbg.jpg",
                imageWidth: 400,
                imageHeight: 200,
                imageAlt: "Custom image",
                customClass : {
                  image: "object-cover",
                },
                showConfirmButton : false,
              }).then(() => {
                document.getElementById("formPayment").submit();
              });
            });
          }
        });
      }
    </script>
</body>
</html>