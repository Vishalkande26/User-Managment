<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
    String message = "";
    String id = request.getParameter("id"); 
    String name = "";
    String email = "";
    String mobile = "";
    String address = "";
    String password = "";


    String jdbcURL = "jdbc:mysql://localhost:3306/demodb";
    String dbUser = "root";
    String dbPassword = "@Shubham23";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
       
        Class.forName("com.mysql.cj.jdbc.Driver");

       
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        
        if (id != null) {
            String fetchQuery = "SELECT * FROM employee WHERE id=?";
            pstmt = conn.prepareStatement(fetchQuery);
            pstmt.setInt(1, Integer.parseInt(id));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                email = rs.getString("email");
                mobile = rs.getString("phone");
                address = rs.getString("address");
                password = rs.getString("password"); 
            }
            rs.close();
            pstmt.close();
        }

        
        if (request.getParameter("update") != null) {
           
            name = request.getParameter("name");
            email = request.getParameter("email");
            mobile = request.getParameter("phone");
            address = request.getParameter("address");
            password = request.getParameter("password");

           
            String updateQuery = "UPDATE employee SET name=?, email=?, phone=?, address=?, password=? WHERE id=?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, mobile);
            pstmt.setString(4, address);
            pstmt.setString(5, password); 
            pstmt.setInt(6, Integer.parseInt(id));

            
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
            	response.sendRedirect("user_view.jsp");
            	return;
            } else {
                message = "<div class='alert alert-danger'>Update Failed! Employee not found.</div>";
            }
        }
    } catch (Exception e) {
        message = "<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>";
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (Exception ignored) {}
        try { if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
%>


<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card" style="width: 25rem;">
        <div class="card-header text-center"><h4>Update Form</h4></div>
        <div class="container">
            <%= message %>
            <form action="user_update.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" value="<%= name %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email address</label>
                    <input type="email" name="email" class="form-control" value="<%= email %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Mobile No.</label>
                    <input type="text" name="phone" class="form-control" value="<%= mobile %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <textarea class="form-control" name="address"  required><%= address %></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" value="<%= password %>" required>
                </div>
                <button type="submit" name="update" class="btn btn-primary mb-3">Update</button>
            </form>
            
        </div>
    </div>
</div>

</body>
</html>
