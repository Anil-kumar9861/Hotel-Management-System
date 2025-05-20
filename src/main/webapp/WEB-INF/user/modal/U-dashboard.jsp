<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Edit Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />

    <style>
        /* To make the profile picture a circle */
        .profile-picture {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 50%;
        }

        .form-group {
            margin-bottom: 1rem;
        }
    </style>
</head>

<body>
    <div class="container-xl px-4 mt-4">

        <hr class="mt-0 mb-4">
        <div class="row">
            <div class="col-xl-4">
                <!-- Profile picture card-->
                <div class="card mb-4 mb-xl-0">
                    <div class="toast-container position-fixed bottom-0 end-0 p-3">
                        <div id="successToast" class="toast align-items-center text-white bg-success border-0"
                            role="alert" aria-live="assertive" aria-atomic="true">
                            <div class="d-flex">
                                <div class="toast-body">
                                    Profile updated successfully!
                                </div>
                                <button type="button" class="btn-close btn-close-white me-2 m-auto"
                                    data-bs-dismiss="toast" aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                    <div class="card-header">Profile Picture</div>
                    <div class="card-body text-center">
                        <!-- Profile picture image-->
                        <img id="userProfileImage" src="" alt="Profile Picture" class="profile-picture mb-3">
                        <!-- Profile picture help block-->
                        <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                        <!-- Profile picture upload button-->
                        <input type="file" id="profilePicture" class="form-control" name="profilePicture"
                            accept="image/*">

                    </div>
                    <div class="toast-container position-fixed bottom-0 end-0 p-3">
                        <div id="successToast" class="toast align-items-center text-white bg-success border-0"
                            role="alert" aria-live="assertive" aria-atomic="true">
                            <div class="d-flex">
                                <div class="toast-body">
                                    Profile updated successfully!
                                </div>
                                <button type="button" class="btn-close btn-close-white me-2 m-auto"
                                    data-bs-dismiss="toast" aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <!-- Account details card-->
                <div class="card mb-4">
                    <div class="card-header">Account Details</div>
                    <div class="card-body">
                        <form>
                            <!-- Form Group (username)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="inputUsername">Username (how your name will appear to
                                    other users on the site)</label>
                                <input class="form-control" id="userName" type="text" placeholder="Enter your username"
                                    value="username">
                            </div>
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (first name)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputFirstName">First name</label>
                                    <input class="form-control" id="inputFirstName" type="text"
                                        placeholder="Enter your first name" >
                                </div>
                                <!-- Form Group (last name)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputMiddleName">Middle name</label>
                                    <input class="form-control" id="inputMiddleName" type="text"
                                        placeholder="Enter your Middle name" >
                                </div>
                            </div>
                            <!-- Form Row        -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (organization name)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputLastName">Last name</label>
                                    <input class="form-control" id="inputLastName" type="text"
                                        placeholder="Enter your Last name" >
                                </div>
                                <!-- Form Group (location)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputAadharCard">Aadhar Card Number</label>
                                    <input class="form-control" id="inputAadharCard" type="text"
                                        placeholder="Aadhar Card Number" value="xxxx xxxx xxxx xxxx">
                                </div>
                            </div>
                            <!-- Form Group (email address)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                <input class="form-control" id="userEmail" type="email"
                                    placeholder="Enter your email address" value="name@example.com">
                            </div>
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (phone number)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputPhone">Phone number</label>
                                    <input class="form-control" id="userPhone" type="tel"
                                        placeholder="Enter your phone number" value="555-123-4567">
                                </div>
                                <!-- Form Group (birthday)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputBirthday">Birthday</label>
                                    <input class="form-control" id="inputBirthday" type="text" name="birthday"
                                        placeholder="Enter your birthday" value="06/10/1988">
                                </div>
                            </div>
                            <!-- Save changes button-->
                            <button class="btn btn-primary" id="ProfileSubmit" type="button">Save changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

    $(document).ready(function () {
        $("#ProfileSubmit").click(function () {
            alert("Button clicked");

            const userId = localStorage.getItem("userId");
            if (!userId) {
                alert("User ID not found.");
                return;
            }

            const profilePath = "/assets/img/" + $("#profilePicture").val().split("\\").pop();

            var reqData = {
                ids: userId,
                firstName: $("#inputFirstName").val(),
                middleName:$("#inputMiddleName").val(),
			     lastName : $("#inputLastName").val(),
                userName: $("#userName").val(),
                email: $("#userEmail").val(),
                mobile: $("#userPhone").val(),
                dob:$("#inputBirthday").val(),
                aadharCardNumber: $("#inputAadharCard").val(),
                profilePicturePath: profilePath
            };
            console.log(reqData);
            $.ajax({
                type: "POST",
                url: "/updateProfile",
                cache: false,
                dataType: "text",
                data: JSON.stringify(reqData),
                contentType: 'application/json',
                success: function (response) {
                    const toast = new bootstrap.Toast(document.getElementById("successToast"));
                    toast.show();
                    if (profilePath) {
                        $("#userProfileImage").attr("src", profilePath);
                    }

                    alert("Profile updated successfully!");
                },
                error: function (xhr, status, error) {
                    alert("Error updating profile: " + error);
                }
            });
        });
    });

</script>

</html>