// This function gets userId from local storage and calls the real fetch function
function getUserProfileId() {
    var userId = localStorage.getItem("userId"); // Get user ID from local storage
    if (userId) {
        getUserProfile(userId); // Now correctly pass the ID to fetch user data
    } else {
        alert("User ID not found in local storage.");
    }
}

// Function to fetch user profile by ID
function getUserProfile(userId) {
    $.ajax({
        type: "GET",
        url: "/getUserById_Ajax",
        data: {
            id: userId
        },
        success: function(response) {
            if (response) {
                console.log(response);
                $('#userName').val(response.userName);
                $('#userEmail').val(response.email);
                $('#userPhone').val(response.mobile);

                if (response.profilePicturePath) {
                    $('#userProfileImage').attr('src', response.profilePicturePath);
                }
            }
        },
        error: function(xhr, status, error) {
            alert("No User Available for this ID");
        }
    });
}
