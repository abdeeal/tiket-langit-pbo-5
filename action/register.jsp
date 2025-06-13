<%@ include file="../connection.jsp" %>
<% 
  String email = request.getParameter("email");
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String confirmPassword = request.getParameter("confirmPassword");

  if (!password.equals(confirmPassword)) {
    response.sendRedirect("../register.jsp?error=confirmPassword");
    return;
  }

  try {
    PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM user WHERE email = ?");
    checkStmt.setString(1, email);
    ResultSet checkRs = checkStmt.executeQuery();

    if (checkRs.next()) {
      response.sendRedirect("../register.jsp?error=email");
      return;
    }

    PreparedStatement stmt = conn.prepareStatement("INSERT INTO user (email, username, password) VALUES (?, ?, md5(?))");
    stmt.setString(1, email);
    stmt.setString(2, username);
    stmt.setString(3, password);

    int rows = stmt.executeUpdate();
      if (rows > 0) {
        response.sendRedirect("../login.jsp?registered=1");
      } else {
        response.sendRedirect("../register.jsp?error=3");
      }

    stmt.close();
    conn.close();
  }catch (Exception e) {
    out.println("Error: " + e.getMessage());
  }
%>