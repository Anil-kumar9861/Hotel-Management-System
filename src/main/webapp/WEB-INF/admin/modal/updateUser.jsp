<div id="updateUser" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					Update User [<span id="us_code" class="text-danger"></span>]
				</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" onsubmit="return false"
				autocomplete="off">
				<div class="modal-body">
					<div class=row>
						<div class="col">
								<label class="control-label required">User Name:</label> <input
									class="form-control" type="text" id="Uname" value="">
									<div id="userNameError" class="text-danger"></div>
						</div>
					</div>	
					<div class=row>
						<div class="col-md-4">
								<label class="control-label required">First Name:</label> <input
									class="form-control" type="text" id="fname" value="">
									<div id="firstNameError" class="text-danger"></div>
						</div>
						<div class="col-md-4">
								<label class="control-label required">Middle Name:</label> <input
									class="form-control" type="text" id="mname" value="">
									<div id="middleNameError" class="text-danger"></div>
						</div>
						<div class="col-md-4">
								<label class="control-label required">Last Name:</label> <input
									class="form-control" type="text" id="lname" value="">
									<div id="lastNameError" class="text-danger"></div>
						</div>
					</div>

					<div class=row>
						<div class="col-sm-4">
								<label class="control-label required">Email:</label> <input
									class="form-control" type="text" id="email" value="">
									<div id="emailError" class="text-danger"></div>
						</div>
						<div class="col-sm-4">
								<label class="control-label required">Password:</label> <input
									class="form-control" type="text" id="password" value="">
									<div id="passwordError" class="text-danger"></div>
						</div>
						<div class="col-sm-4">
								<label class="control-label required">Role:</label> 
								<select class="form-control" name="role" id="role">
										<option value="">Select Role</option>
										<option value="ADMIN">ADMIN</option>
										<option value="USER">USER</option>
									</select>
									<div id="roleError" class="text-danger"></div>
						</div>
					</div>

					<div class=row>
						<div class="col-sm-4">
								<label class="control-label required">Dob:</label> <input
									class="form-control" type="text" id="dob" value="">
									<div id="dobError" class="text-danger"></div>
						</div>
						<div class="col-sm-4">
								<label class="control-label required">Mobile:</label> <input
									class="form-control" type="text" id="mobile" value="">
									<div id="mobileError" class="text-danger"></div>
							
						</div>
						<div class="col-sm-4">
								<label class="control-label required">Gender:</label>
								 <select class="form-control" name="gender" id="gender">
										<option value="">Select Role</option>
										<option value="MALE">MALE</option>
										<option value="FEMALE">FEMALE</option>
									</select>
									<div id="genderError" class="text-danger"></div>
						</div>
					</div>


				</div>

				<div class="modal-footer">
					<button type="submit" id="submit_upd_Btn" class="btn btn-primary">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
			</div>
		</div>

	</div>
</div>