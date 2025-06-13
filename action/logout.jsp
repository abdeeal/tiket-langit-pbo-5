<%
    session.invalidate();

    response.sendRedirect("../index.jsp?msg=logout-berhasil");
%>
