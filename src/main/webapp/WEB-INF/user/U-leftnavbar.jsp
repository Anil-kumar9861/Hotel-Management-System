<div class="sidebar sidebar-style-2">
	<div class="sidebar-wrapper scrollbar scrollbar-inner">
		<div class="sidebar-content">
			<div class="user">
				<div class="avatar-sm float-left mr-2">
					<img src="../assets/img/profile.jpg" id="profileImage3" alt="..."
						class="avatar-img rounded-circle">
				</div>
				<div class="info">
					<a data-toggle="collapse" href="#" aria-expanded="true"> 
						<span>
							<span id="profileUserName">Guest</span> 
							<span class="user-level" id="profileUserRole">User</span>
						</span>
					</a>
				</div>
			</div>
			<ul class="nav nav-primary">
				<li class="nav-item active"><a href=""> <i
						class="fas fa-home"></i>
						<p id="Udashboard">Home</p>
				</a></li>
				<li class="nav-item"><a href="#"> <i class="fas fa-bed" aria-hidden="true"></i>
					<p id="viewrooms">VIEW ROOMS</p>
			</a></li>
				
				<li class="nav-item"><a href="#"> <i class="fas fa-boxes"></i>
						<p id="managebookingHistory">BOOKING HISTORY</p>
				</a></li>
			
			</ul>
		</div>
	</div>
</div>


<script>
    $(document).ready(function() {
        let userName = localStorage.getItem("userName"); // Get username from localStorage
        let userRole = localStorage.getItem("role"); // Get role from localStorage
		let profileImg=localStorage.getItem("profilePicturePath");

        if (userName) {
            $("#profileUserName").text(userName);
        } else {
            $("#profileUserName").text("Guest");
        }

        if (userRole) {
            $("#profileUserRole").text(userRole);
        } else {
            $("#profileUserRole").text("User"); // Default role
        }

		if(profileImg){
			$("#profileImage3").attr("src",profileImg);
		}
    });



</script>