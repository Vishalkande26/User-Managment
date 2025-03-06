<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete user</title>
</head>
<body>
<%
    String message = "";
    String id = request.getParameter("id");

    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/demodb";
    String dbUser = "root";
    String dbPassword = "@Shubham23";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Check if ID is provided
        if (id != null && !id.trim().isEmpty()) {
            // Delete query
            String deleteQuery = "DELETE FROM employee WHERE id=?";
            pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setInt(1, Integer.parseInt(id));

            // Execute delete query
            int rowsDeleted = pstmt.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("user_view.jsp"); // Redirect to user list page
                return;
            } else {
                message = "<div class='alert alert-danger'>Delete Failed! Employee not found.</div>";
            }
        } else {
            message = "<div class='alert alert-warning'>Invalid Employee ID!</div>";
        }
    } catch (Exception e) {
        message = "<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>";
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (Exception ignored) {}
        try { if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
%>

<%= message %>

</body>
</html>
