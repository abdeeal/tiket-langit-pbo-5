<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/tiketlangit?useSSL=false&serverTimezone=UTC";
    String user = "root";
    String pass = "";     

    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
    } catch (Exception e) {
        out.println("Gagal koneksi: " + e.getMessage());
    }
%>
