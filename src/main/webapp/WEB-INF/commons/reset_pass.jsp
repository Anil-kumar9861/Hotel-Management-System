<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reset Password</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h3 class="text-center mb-4">Reset Your Password</h3>
    <form action="${pageContext.request.contextPath}/reset-password" method="post" class="w-50 mx-auto">
        <input type="hidden" name="email" value="${param.email}">
        
        <div class="form-group mb-3">
            <label for="newPassword">New Password:</label>
            <input type="password" class="form-control" name="newPassword" required>
        </div>

        <div class="form-group mb-3">
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" class="form-control" name="confirmPassword" required>
        </div>

        <button type="submit" class="btn btn-success w-100">Reset Password</button>
    </form>
</div>
</body>
</html>
