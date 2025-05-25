<div id="updateRoom" class="modal fade" role="dialog">
	<div class="modal-dialog">
	  <div class="modal-content">
	  
		<div class="modal-header">
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		  <h4 class="modal-title">
			Update Room [<span id="us_code" class="text-danger"></span>]
		  </h4>
		</div>
  
		<div class="modal-body">
		  <form class="form-horizontal" role="form" onsubmit="return false" autocomplete="off">
			
			<div class="row">
			  <div class="col-md-6">
				<label for="roomNumber">Room No:</label>
				<input type="text" id="roomNumber" name="roomNumber" class="form-control" required>
			  </div>
  
			  <div class="col-md-6">
				<label for="roomType">Room Type:</label>
				<input type="text" id="roomType" name="roomType" class="form-control" required>
			  </div>
			</div>
  
			<div class="row mt-3">
			  <div class="col-md-6">
				<label for="createdAt">Created At:</label>
				<input type="text" id="createdAt" name="createdAt" class="form-control" required>
			  </div>
  
			  <div class="col-md-6">
				<label for="updatedAt">Updated At:</label>
				<input type="text" id="updatedAt" name="updatedAt" class="form-control" required>
			  </div>
			</div>
  
			<div class="row mt-3">
			  <div class="col-md-6">
				<label for="pricePerNight">Room Charge:</label>
				<input type="text" id="pricePerNight" name="pricePerNight" class="form-control" required>
			  </div>
  
			  <div class="col-md-6">
				<span class="w3l-star">*</span><label>Bed Type:</label> <input type="text" id="bedType"
								name="bedType" class="form-control" value="" required="">
			</div>

			<div class="row mt-3">
				<div class="col-md-6" style="padding-left: 22px;">
					<span class="w3l-star">*</span><label>Status:</label>
					<select class="form-control" name="status" id="status">
						<option value="">Select</option>
						<option value="FREE">FREE</option>
						<option value="BOOKED">BOOKED</option>
						<option value="BOOKED">OCCUPIED</option>
					</select>
			</div>
  
			<div class="modal-footer mt-4">
			  <button type="submit" id="submit_upd_Btn" class="btn btn-primary">Submit</button>
			  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			
		  </form>
		</div>
  
	  </div>
	</div>
  </div>
  