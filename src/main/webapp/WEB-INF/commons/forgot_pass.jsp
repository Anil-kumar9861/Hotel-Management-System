<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Forgot Password</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card p-4 shadow-sm">
          <h4 class="card-title text-center mb-3">Forgot Password</h4>
          <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
          </c:if>
          <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
          </c:if>
          <form action="${pageContext.request.contextPath}/forgot-password" method="post">
            <div class="form-group">
              <label for="email">Registered Email</label>
              <input type="email" name="email" id="email" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100 mt-3">Send Reset Link</button>
          </form>
          <div class="mt-3 text-center">
            <a href="${pageContext.request.contextPath}/">Back to Login</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
