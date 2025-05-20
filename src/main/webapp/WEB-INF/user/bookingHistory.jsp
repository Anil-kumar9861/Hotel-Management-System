<div class="container page-inner mt--5">
	<div class="row mt--2">
	  <div class="col-md-12">
		<div class="card full-height">
		  <div class="card-header d-flex justify-content-between align-items-center">
			<h3 class="card-title mb-0">Booking History</h3>
		  </div>

		  <div class="card-body">
			<table id="bookingHistory" class="table table-striped table-bordered" style="width: 100%;">
			  <thead class="thead-dark">
				<tr>
				  <th>Sl No</th>
				  <th>Booking Id</th>
				  <th>Room No</th>
				  <th>Check In</th>
				  <th>Check Out</th>
				  <th>Status</th>
				  <th>Booking Charge</th>
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

  

  <!-- Toast -->
<div id="toast" style="position: fixed; top: 20px; right: 20px; z-index: 9999; display: none; background: #28a745; color: white; padding: 10px 20px; border-radius: 5px;"></div>

<script>
function showToast(message, type) {
    const toast = document.getElementById('toast');
    toast.innerText = message;
    toast.style.background = (type === 'success') ? '#28a745' : '#dc3545'; // Green for success, Red for error
    toast.style.display = 'block';
    setTimeout(() => {
        toast.style.display = 'none';
    }, 3000);
}
</script>
  
  <!-- Placeholder for modal -->
  <div class="modalSpace"></div>
  
  <!-- JS to manage room functionality -->
  <script src="<%= request.getContextPath() %>/assets/coustomjs/bookingHistory.js"></script>