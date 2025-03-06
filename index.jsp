<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ERP System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #007bff, #6610f2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .card {
            width: 24rem;
            border-radius: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .card-header {
            background: linear-gradient(135deg, #0056b3, #6610f2);
            color: white;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            text-transform: uppercase;
            font-weight: bold;
        }
        .btn-custom {
            width: 100%;
            margin-top: 15px;
            font-size: 1.1rem;
            padding: 10px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="card text-center">
        <div class="card-header">ERP System</div>
        <div class="card-body">
            <h5 class="mb-4">User Management</h5>
            <a href="login.jsp"><button class="btn btn-primary btn-custom">Login</button></a>
            <a href="user_view.jsp"><button class="btn btn-danger btn-custom">View Users</button></a>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
