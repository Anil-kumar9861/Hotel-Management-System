<!-- Add Booking Modal -->
<div id="addBookingModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          
          <h4 class="modal-title">Add New Booking</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <form id="addBookingForm" class="form-horizontal" role="form" onsubmit="return false" autocomplete="off">
            <div class="row" style="margin-bottom: 20px">
              <div class="col-md-12">
                <label class="control-label required">User Name:</label>
                <input class="form-control" type="text" id="username" value="">
                <div id="userIDError" class="text-danger"></div>
              </div>  
            </div>
  
            <div class="row" style="margin-bottom: 20px">
              <div class="col-md-6">
                <label class="control-label required">Check-in Date:</label>
                <input class="form-control" type="datetime-local" id="checkin" value="">
                <div id="checkinError" class="text-danger"></div>
              </div>
              <div class="col-md-6">
                <label class="control-label required">Check-out Date:</label>
                <input class="form-control" type="datetime-local" id="checkout" value="">
                <div id="checkoutError" class="text-danger"></div>
              </div>
            </div>
  
            <div class="row" style="margin-bottom: 20px">
              <div class="col-md-6">
                <label class="control-label required">Price:</label>
                <input class="form-control" type="text" id="totalprice" value="">
                <div id="priceError" class="text-danger"></div>
              </div>
              <div class="col-md-6">
                <label class="control-label required">Status:</label>
                <select class="form-control" id="status">
                  <option value="">Select Status</option>
                  <option value="Checked In">Confirmed</option>
                  <option value="Checked In">Checked In</option>
                  <option value="Checked Out">Checked Out</option>
                  <option value="Cancelled">Cancelled</option>
                </select>
                <div id="statusError" class="text-danger"></div>
              </div>
            </div>
  
            <div class="modal-footer">
              <button type="submit" id="submit_add_Btn" class="btn btn-primary">Add Booking</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  