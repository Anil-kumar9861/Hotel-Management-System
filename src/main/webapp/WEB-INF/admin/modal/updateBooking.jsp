<div id="updateBooking" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			
				<h4 class="modal-title">
					Update Booking [<span id="us_code" class="text-danger"></span>]
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" onsubmit="return false"
				autocomplete="off">
				<div class="modal-body">
					<input type="hidden" id="editUserID">
					<input type="hidden" id="editRoomID">
					<input type="hidden" id="editCreatedAt">
					<input type="hidden" id="editUpdatedAt">					
					<div class=row style="margin-bottom: 20px">
						<div class="col">
								<label class="control-label required">Booking id:</label> <input
									class="form-control" type="text" id="editBookingId" value="" readonly>	
						</div>
					</div>	
					<div class=row style="margin-bottom: 20px">
						<div class="col-md-6">
								<label class="control-label required">Check In:</label> <input
									class="form-control" type="text" id="editCheckIn" value="" readonly>
									<div id="checkinError" class="text-danger"></div>
						</div>
						<div class="col-md-6">
								<label class="control-label required">Check Out:</label> <input
									class="form-control" type="text" id="editCheckOut" value="">
									<div id="checkoutError" class="text-danger"></div>
						</div>
					</div>

					<div class=row style="margin-bottom: 20px">
						<div class="col-sm-6">
								<label class="control-label required">Price:</label> <input
									class="form-control" type="text" id="editTotalPrice" value="">
									<div id="priceError" class="text-danger"></div>
						</div>
						<div class="col-sm-6">
								<label class="control-label required">Status:</label> 
								<select class="form-control" name="role" id="editStatus">
										<option value="">Select Status</option>
										<option value="Checked In">Confirmed</option>
										<option value="Checked In">Checked In</option>
										<option value="Checked Out">Checked Out</option>
                                        <option value="Cancelled">Cancelled</option>
									</select>
									<div id="statusError" class="text-danger"></div>
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