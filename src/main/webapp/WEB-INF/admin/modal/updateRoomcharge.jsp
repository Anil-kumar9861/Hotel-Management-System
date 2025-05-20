<div id="updateRoomcharge" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					Update Room Charge [<span id="us_code" class="text-danger"></span>]
				</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" onsubmit="return false"
				autocomplete="off">
				<div class="modal-body">
					<div Class=row>
						<div class="col-sm-4">
						<label>SL No:</label> <input type="number" id="slNo" name="slNo"
							class="form-control" value="" required="">
					</div>
					<div class="col-sm-4">
						<label>Room No:</label> <input type="number" id="roomNo" name="roomNo"
							class="form-control" value="" required="">
					</div>
					</div>
					<div Class=row>
					<div class="col-sm-4">
						<label>Members:</label> <input type="number" id="members" name="members"
							class="form-control" value="" required="">
					</div>
					<div class="col-sm-4">
						<label>Rent:</label> <input type="number" id="rent" name="rent"
							class="form-control" value="" required="">
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