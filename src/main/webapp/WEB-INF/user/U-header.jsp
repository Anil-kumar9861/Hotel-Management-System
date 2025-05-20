<div class="main-header">
	<!-- Logo Header -->
	<div class="logo-header" data-background-color="dark">
		<a href="admin_dashboard.html" class="logo logoinnertext">
			NAVIGATION
		</a>

		<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse"
			data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon">
				<i class="icon-menu"></i>
			</span>
		</button>
		<button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
		<div class="nav-toggle">
			<button class="btn btn-toggle toggle-sidebar">
				<i class="icon-menu"></i>
			</button>
		</div>
	</div>
	<!-- End Logo Header -->

	<!-- Navbar Header -->
	<nav class="navbar navbar-header navbar-expand-lg" data-background-color="white">

		<div class="container-fluid">

			<div class="nav-item">
						<span style="font-size: x-large; font-family: cursive;">
						<img src="/assets/img/hotel_Logo.png" width="65">
							 Hotel Nova
						</span>
						</div>

			<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">

				<li class="nav-item dropdown hidden-caret">
					<a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fa fa-bell"></i>
						<span class="notification">3</span>
					</a>
					<ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
						<li>
							<div class="notif-scroll scrollbar-outer">
								<div class="notif-center">
									<a href="#">
										<div class="notif-icon notif-primary"> <i class="fa fa-user-plus"></i> </div>
										<div class="notif-content">
											<span class="block">
												New user registered
											</span>
											<span class="time">5 minutes ago</span>
										</div>
									</a>
									<a href="#">
										<div class="notif-icon notif-success"> <i class="fa fa-comment"></i> </div>
										<div class="notif-content">
											<span class="block">
												Rahmad commented on User
											</span>
											<span class="time">12 minutes ago</span>
										</div>
									</a>
									<a href="#">
										<div class="notif-img">
											<img src="../assets/img/profile2.jpg" alt="Img Profile">
										</div>
										<div class="notif-content">
											<span class="block">
												Reza send messages to you
											</span>
											<span class="time">12 minutes ago</span>
										</div>
									</a>
								</div>
							</div>
						</li>
						<li>
							<a class="see-all" href="javascript:void(0);">See all notifications<i
									class="fa fa-angle-right"></i> </a>
						</li>
					</ul>
				</li>

				<li class="nav-item dropdown hidden-caret">
					<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
						<div class="avatar-sm">
							<img id="profileImage" src="../assets/img/profile2.jpg" alt="..." class="avatar-img rounded-circle">
						</div>
					</a>
					<ul class="dropdown-menu dropdown-user animated fadeIn">
						<div class="dropdown-user-scroll scrollbar-outer">
							<li>
								<div class="user-box">
									<div class="avatar-lg"><img src="../assets/img/profile2.jpg" id="profileImage1" alt="image profile"
											class="avatar-img rounded"></div>
									<div class="u-text">
										<h4 id="profileUserName1">Guest</h4>
										<p class="text-muted" id="profileUserRole1">User</p>
										<!-- <a href="#" class="btn btn-xs btn-secondary btn-sm">View Profile</a> -->
									</div>
								</div>
							</li>
							<li>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" id="EditProfile">Edit Profile</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item text-danger" id="managelogout" onclick="logoutAndRedirect()">Logout</a>
							</li>
						</div>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- End Navbar -->
</div>
<script src="../assets/js/core/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function () {
		let userName = localStorage.getItem("userName");
		let userRole = localStorage.getItem("role");
		let profileImg=localStorage.getItem("profilePicturePath");

		if (userName) {
			$("#profileUserName1").text(userName);
		}
		if (userRole) {
			$("#profileUserRole1").text(userRole);
		}
		if(profileImg){
			$("#profileImage").attr("src",profileImg);
			$("#profileImage1").attr("src",profileImg);
		}
	});
</script>