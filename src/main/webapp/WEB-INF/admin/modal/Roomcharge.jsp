<div id="Roomcharge" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Room Charge Details</h4>
			</div>
			<form class="form-horizontal" role="form" onsubmit="return false"
				autocomplete="off">
				<div class="modal-body">
					<div Class=row>
						<div class="col-md-4">
								<span class="w3l-star">*</span><label>Room No:</label> <select
									class="form-control" name="roomNo" id="roomNo">
								</select>
					</div>
				
						<div class="col-sm-4">
								<span class="w3l-star">*</span><label>Members:</label> <input
									type="number" id="members" name="members" class="form-control"
									value="" required="">
						</div>
						<div class="col-sm-4">
								<span class="w3l-star">*</span><label>Rent:</label> <input
									type="number" id="rent" name="rent" class="form-control"
									value="" required="">
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
