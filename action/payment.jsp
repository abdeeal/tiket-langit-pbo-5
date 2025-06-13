<%@ include file="../connection.jsp" %>
<% 
  String bank = request.getParameter("bank");
  String id_user = request.getParameter("id_user");
  String total = request.getParameter("total");
  String id_trip = request.getParameter("id_trip");
  String qty = request.getParameter("guest");

  PreparedStatement stmt = null;

  try {
        String sql = "INSERT INTO book (id_user,id_trip,subtotal,quantity,bank) VALUES (?,?,?,?,?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, id_user);
        stmt.setString(2, id_trip);
        stmt.setString(3, total);
        stmt.setString(4, qty);
        stmt.setString(5, bank);

        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("../index.jsp?msg=Order-berhasil");
        } else {
            response.sendRedirect("../index.jsp?msg=Order-gagal");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../login.jsp?error=1");
    } finally {
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>