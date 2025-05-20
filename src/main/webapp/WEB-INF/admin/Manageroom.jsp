<div class="container page-inner mt-3">
	<div class="row mt--2">
	  <div class="col-md-12">
		<div class="card full-height">
		  <div class="card-header d-flex justify-content-between align-items-center">
			<h4 class="card-title mb-0">Room Management</h4>
			<button class="btn btn-success room" id="add_room">
			  <i class="fa fa-plus"></i>&nbsp;Add Room
			</button>
		  </div>
  
		  <div class="card-body">
			<table id="roomList" class="table table-striped table-bordered" style="width: 100%;">
			  <thead>
				<tr>
				  <th>Sl No</th>
				  <th>Room No</th>
				  <!-- <th>Room Name</th> -->
				  <th>Created At</th>
				  <th>Updated At</th>
				  <th>Room Type</th>
				  <th>Bed Type</th>
				  <th>Status</th>
				  <th>Room Charge</th>
				  <th>Options</th>
				  <th>Action</th>
				</tr>
			  </thead>
			  <tbody>
				<!-- Dynamic content to be inserted via JS -->
			  </tbody>
			</table>
		  </div>
		</div>
	  </div>
	</div>
  </div>
  
  <!-- Placeholder for modal -->
  <div class="modalSpace"></div>
  
  <!-- JS to manage room functionality -->
  <script src="<%= request.getContextPath() %>/assets/coustomjs/manageRooms.js"></script>
  