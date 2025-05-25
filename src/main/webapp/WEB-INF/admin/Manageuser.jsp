<div class="container page-inner mt-3">
	<div class="row mt--2">
		<div class="col-md-12">
			<div class="card full-height">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h4 class="card-title mb-0">User Management</h4>
						<button class="btn btn-success pull-right" id="add_user"
							onclick="addUser()">
							<i class="fa fa-plus"></i>&nbsp;Add User
						</button>
					</div>
					<div class="card-body">
						<table id="userList" class="table table-striped table-bordered"
							style="width: 100%">
							<thead>
								<tr>
									<th>Sl No</th>
									<th>User Id</th>
									<th>Name</th>
									<th>Mobile</th>
									<th>Email</th>
									<th>Type</th>
									<th>Options</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/assets/coustomjs/manageUsers.js"></script>
<div class="modalSpace"></div>



