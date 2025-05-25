<html lang="en">

<head>
	<title>Login | Hotel Management System</title>
	<link rel="stylesheet" href="../assets/css/login.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
	<script src="../assets/js/core/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="login-container">

			<div class="form-container">
				<h1 class="opacity">LOGIN</h1>
				<br>
				<form>
					<select class="form-select " aria-label="Default select example" id="role">
						<option selected>Select UserType</option>
						<option value="USER">USER</option>
						<option value="ADMIN">ADMIN</option>
					</select>

					<input type="text" id="username" placeholder="E-MAIL ID" />
					<input type="password" id="password" placeholder="PASSWORD" />

					<button class="opacity" id="loginbtn" type="button">SUBMIT</button>
				</form>
				<div class="register-forget opacity">
					<button type="submit" class="btn btn-success" id='usersignup'>
						Sign Up</button>
				</div>
				<!-----</form>--------->
				<div class="forgot">
					<a href="${pageContext.request.contextPath}/forgot-password">Forgot Password?</a>
				</div>
			</div>

		</div>

		<div class="theme-btn-container"></div>

	</div>
</body>


<script>

	//User Signup function
	$("#usersignup").click(function () {

		$(".modalSpace").load("/addUser", function () {
			$("#addUser").modal();
			$("#btnSave").click(function () {
				if (SignValidation()) {
					saveUser();
				}
			});

		});
	});


	$(function () {
		$(".btn").click(function () {
			$(".form-signin").toggleClass("form-signin-left");
			$(".form-signup").toggleClass("form-signup-left");
			$(".frame").toggleClass("frame-long");
			$(".signup-inactive").toggleClass("signup-active");
			$(".signin-active").toggleClass("signin-inactive");
			$(".forgot").toggleClass("forgot-left");
			$(this).removeClass("idle").addClass("active");
		});
	});

	$(function () {
		$(".btn-signup").click(function () {
			$(".nav").toggleClass("nav-up");
			$(".form-signup-left").toggleClass("form-signup-down");
			$(".success").toggleClass("success-left");
			$(".frame").toggleClass("frame-short");
		});
	});

	$(function () {
		$(".btn-signin").click(function () {
			$(".btn-animate").toggleClass("btn-animate-grow");
			$(".welcome").toggleClass("welcome-left");
			$(".cover-photo").toggleClass("cover-photo-down");
			$(".frame").toggleClass("frame-short");
			$(".profile-photo").toggleClass("profile-photo-down");
			$(".btn-goback").toggleClass("btn-goback-up");
			$(".forgot").toggleClass("forgot-fade");
		});
	});
</script>

<script type="text/javascript">

	//login validation
	function loginValidation() {
		if ($("#role").val() == "Select UserType") {
			alert("Please Select Role");
			return false;
		}

		if ($("#username").val() == "") {
			alert("Please Provide userName");
			return false;
		}

		if ($("#password").val() == "") {
			alert("Please Provide password");
			return false;
		}

		return true;
	}

	//Submit buttom
	$("#loginbtn").click(function () {

		if (loginValidation()) {

			var reqData = {
				role: $("#role").val(),
				userName: $("#username").val(),
				password: $("#password").val()
			}
			console.log(role);
			console.log(reqData);
			$.ajax({
				type: "POST",
				url: "login",
				cache: false,
				dataType: "json",
				data: JSON.stringify(reqData),
				contentType: 'application/json',
				success: function (response) {
					console.log(response);
					console.log(JSON.stringify(response));
					localStorage.setItem("userId", response.id);
					localStorage.setItem("role", response.role);
					localStorage.setItem("userName", response.userName);
					localStorage.setItem("profilePicturePath", response.profilePicturePath);

					if ($("#role").val() == 'ADMIN') {
						var surl = '<%=request.getContextPath()%>/home';
						window.location.replace(surl);
					}

					if ($("#role").val() == 'USER') {
						var surl = '<%=request.getContextPath()%>/user/home';
						window.location.replace(surl);
					}

				},
				error: function (xhr, status, error) {
					alert('Please Provide Valid Credentials');
					var surl = '<%=request.getContextPath()%>/';
					window.location.replace(surl);
				}
			});

		}

	});

</script>

<div class="modalSpace"></div>
<script src="<%=request.getContextPath()%>/assets/coustomjs/manageUsers.js"></script>