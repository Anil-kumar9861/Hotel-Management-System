
<div class="container page-inner mt-3">
	<div class="row mt--2">
	  <div class="col-md-12">
		<div class="card full-height" style="align-items:end;">
		  <div class="card-header d-flex justify-content-between align-items-center">
			<h4 class="card-title mb-0">Booking Management</h4>
			
			
		  </div>
  
		  <div class="card-body">
			<table id="bookingList" class="table table-striped table-bordered" style="width: 100%;">
			  <thead>
				<tr>
				  <th>Sl No</th>
				  <th>User Name</th>
				  <th>Check In</th>
				  <th>Check Out</th>
				  <th>Room No</th>
				  <th>Room Price</th>
				  <th>Booking Type</th>
				  <th>Status</th>
				  <th>Booking Charge</th>
				  <th>Options</th>
				  
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
  <script src="<%= request.getContextPath() %>/assets/coustomjs/manageUBooking.js"></script>
  