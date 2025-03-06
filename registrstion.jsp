<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            width: 30rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
        }
        .card-header {
            background: #563d7c;
            color: white;
            text-align: center;
            font-size: 1.5rem;
            padding: 15px;
        }
        .form-control {
            border-radius: 8px;
        }
        .input-group-text {
            background: #563d7c;
            color: white;
            border: none;
        }
        .btn-primary {
            background: #563d7c;
            border: none;
            border-radius: 8px;
        }
        .btn-primary:hover {
            background: #452b5a;
        }
    </style>
</head>
<body>

<%
    String message = "";
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        String jdbcURL = "jdbc:mysql://localhost:3306/demodb";
        String dbUser = "root";
        String dbPassword = "@Shubham23";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String query = "INSERT INTO employee (name, email, phone, address, password) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, mobile);
            pstmt.setString(4, address);
            pstmt.setString(5, password); 

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("user_view.jsp");
                return;
            } else {
                message = "<div class='alert alert-danger'>Registration Failed!</div>";
            }
        } catch (Exception e) {
            message = "<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>";
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
%>

<div class="card">
    <div class="card-header">User Registration</div>
    <div class="card-body">
        <%= message %>
        <form action="registration.jsp" method="post">
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" name="name" class="form-control" placeholder="Enter your name" required>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                    <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Mobile Number</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                    <input type="text" name="phone" class="form-control" placeholder="Enter your phone number" required>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Address</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                    <textarea class="form-control" name="address" placeholder="Enter your address" required></textarea>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
                </div>
            </div>
            <button type="submit" name="submit" class="btn btn-primary w-100">Register</button>
        </form>
    </div>
</div>

</body>
</html>
