
<div id="addUser" class="modal" role="dialog" style="color: black;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Add User</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal Form -->
            <form id="signupForm" class="form-horizontal" role="form" autocomplete="off">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <label class="control-label required">User Name <span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="userName" required />
                            <div id="userNameError" class="text-danger"></div>
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label required">First Name</label>
                            <input class="form-control" type="text" id="fname" />
                            <div id="firstNameError" class="text-danger"></div>
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label required">Middle Name</label>
                            <input class="form-control" type="text" id="mname" />
                            <div id="middleNameError" class="text-danger"></div>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-sm-4">
                            <label class="control-label required">Last Name <span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="lname" required />
                            <div id="lastNameError" class="text-danger"></div>
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label required">Email</label>
                            <input class="form-control" type="email" id="email" required />
                            <div id="emailError" class="text-danger"></div>
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label required">Password <span class="text-danger">*</span></label>
                            <input class="form-control" type="password" id="passworddata" required />
                            <div id="passwordError" class="text-danger"></div>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-sm-4">
                            <label class="control-label required">Date of Birth</label>
                            <input class="form-control" type="date" id="dob" />
                            <div id="dobError" class="text-danger"></div>
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label required">Mobile <span class="text-danger">*</span></label>
                            <input class="form-control" type="number" id="mobile" required />
                            <div id="mobileError" class="text-danger"></div>
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label required">Gender <span class="text-danger">*</span></label>
                            <select class="form-control" id="gender" required>
                                <option value="">Select Gender</option>
                                <option value="MALE">MALE</option>
                                <option value="FEMALE">FEMALE</option>
                            </select>
                            <div id="genderError" class="text-danger"></div>
                        </div>
                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="submit" id="btnSave" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
//sign Up validation
	function SignValidation() {
		let userName = $("#userName").val();
		let firstName = $("#fname").val();
		let middleName = $("#mname").val();
		let lastName = $("#lname").val();
		let email = $("#email").val();
		let password = $("#passworddata").val();
		let role = $("#roledata").val();
		let mobile = $("#mobile").val();
		let gender = $("#gender").val();

		if (userName.trim() === "") {
			alert("User Name is required.");
			return false;
		}
		if (firstName.trim() === "") {
			alert("First Name is required.");
			return false;
		}
		if (middleName.trim() === "") {
			alert("Middle Name is required.");
			return false;
		}

		if (lastName.trim() === "") {
			alert("Last Name is required.");
			return false;
		}

		if (email.trim() === "" || !validateEmail(email)) {
			alert("Please enter a valid email.");
			return false;
		}

		if (password.length < 6) {
			alert("Password must be at least 6 characters long.");
			return false;
		}

		if (role === "") {
			alert("Please select a role.");
			return false;
		}

		if (mobile.trim() === "" || !/^\d{10}$/.test(mobile)) {
			alert("Please enter a valid 10-digit mobile number.");
			return false;
		}

		if (gender === "") {
			alert("Please select gender.");
			return false;
		}

		return true;
	}


	//Email validation
	function validateEmail(email) {
		var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		return emailRegex.test(email);
	}
	</script>
