<%@ include file="../connection.jsp" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT * FROM user WHERE email=? AND password=md5(?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, password);

        rs = stmt.executeQuery();

        if (rs.next()) {
            session.setAttribute("login", email);
            response.sendRedirect("../index.jsp?msg=Login-berhasil");
        } else {
            response.sendRedirect("../login.jsp?error=password");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../login.jsp?error=1");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
