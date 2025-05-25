<div id="addroom" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Room</h4>
			</div>
			<form class="form-horizontal" role="form" onsubmit="return false" autocomplete="off">
				<div class="modal-body">
					<div class=row>
						<div class="col-md-6">

							<span class="w3l-star">*</span><label>Room No:</label> <input type="number" id="roomNum"
								name="roomNum" class="form-control" value="" required="">
						</div>

						<div class="col-md-6">
							<span class="w3l-star">*</span><label>Created At:</label> <input type="date" id="CreatedAt"
								name="CreatedAt" class="form-control" value="" required="">
						</div>
					</div>
					<div class=row>
						<div class="col-md-6">
							<span class="w3l-star">*</span><label>Updated At:</label> <input type="date" id="UpdatedAt"
								name="UpdatedAt" class="form-control" value="" required="">
						</div>
						<div class="col-md-6">
							<span class="w3l-star">*</span><label>Room Type</label> <input type="text" id="RoomType"
								name="Room Type" class="form-control" value="" required="">
						</div>

					</div>
					<div class=row>
						<div class="col-md-6">
							<span class="w3l-star">*</span><label>Room Charge:</label> <input type="number"
								id="roomCharge" name="roomCharge" class="form-control" value="" required="">
						</div>
						<div class="col-md-6">
							<span class="w3l-star">*</span><label>Bed Type:</label> <input type="text" id="bedType"
								name="bedType" class="form-control" value="" required="">
						</div>
					</div>
					<div class=row>
						<div class="col-md-6" >
							<span class="w3l-star">*</span><label>Status:</label>
							<select class="form-control" name="status" id="status">
								<option value="">Select</option>
								<option value="FREE">FREE</option>
								<option value="BOOKED">BOOKED</option>
								<option value="BOOKED">OCCUPIED</option>
							</select>

						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="submit" id="btnSave" class="btn btn-primary">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>

		</div>
	</div>
</div>