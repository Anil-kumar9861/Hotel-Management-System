$(document).ready(function() {
	$("#manageDashboard").click(function() {
		$(".modalSpace1").load("/dashboard", function() {
			// getFloorWithRooms();
		});
	});
	
	$("#manageUserData").click(function() {
		
		alert('manageuser');
		$(".modalSpace1").load("/manageusers", function() {
			getUserData();
		});
	});

	

	$("#manageroom").click(function() {
		$(".modalSpace1").load("/managerooms", function() {
			alert("manageroom1");
			getRoomData();
		});
	});

	$("#manageDashboard").click(function() {
		$(".modalSpace1").load("/dashboard", function() {
			getFloorWithRooms();
		});
	});
	
	$("#managelogout").click(function() {
		var surl = window.location.origin+'/';
		localStorage.removeItem("userId");
		localStorage.removeItem("tanentId");
		localStorage.removeItem("role");	
        window.location.replace(surl);
	});


	$("#viewrooms").click(function() {
		alert('viewrooms');
		$(".modalSpace1").load("/viewRooms", function() {
		getViewRoom();
		});
	});

	$("#managebooking").click(function() {
		alert('managebooking...');
		$(".modalSpace1").load("/managebooking", function() {
			getBooking();
		});
	});

	$("#managebookingHistory").click(function() {
		alert('bookinghistory...');
		$(".modalSpace1").load("/bookinghistory", function() {
			getBookingHistory();
		});
	});

	// This triggers when the "EditProfile" button is clicked
	$("#EditProfile").click(function() {
		alert('edit.....');
		// Load modal content from "/Udashboard" and then fetch the user profile
		$(".modalSpace1").load("/Udashboard", function() {
			getUserProfileId();  // Fetch user profile details
		});
	});
});
