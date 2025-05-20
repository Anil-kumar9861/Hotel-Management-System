<!-- Booking Modal -->
<div class="modal fade" id="bookingModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Booking Details</h5>
        <button type="button" class="btn-close" data-dismiss="modal"></button>
      </div>

      <div class="modal-body">
        <form id="bookingForm">
          <div class="mb-3">
            <label for="username">Username</label>
            <input type="text" id="username" class="form-control" readonly>
          </div>

          <div class="mb-3">
            <label for="roomType">Room Type</label>
            <input type="text" id="roomType" class="form-control" readonly>
          </div>

          <div class="mb-3">
            <label for="roomType">Bed Type</label>
            <input type="text" id="bedType" class="form-control" readonly>
          </div>

        
            <div class="row">
              <div class="col">
                <label style="margin-left:5px ;">Check-in</label>
                <input type="text" id="checkin" class="form-control" placeholder="YYYY-MM-DD HH:MM">
              </div>
              <div class="col">
                <label>Check-out</label>
                <input type="text" id="checkout" class="form-control" placeholder="YYYY-MM-DD HH:MM">
              </div>
            </div>

          <div class="mt-3">
            <label>Total Price (Rs)</label>
            <input type="text" id="totalPrice" class="form-control" readonly>
          </div>
        </form>
      </div>
      <div class="mt-3" style="padding-bottom: 10px;">
        <label for="paymentMethod" style="margin-left:10px ;">Payment Method</label>
        <select id="paymentMethod"  style="width:50% ;margin-left:10px ;"class="form-control">
          <option value="Cash">Cash</option>
          <option value="Card">Card</option>
        </select>
      </div>
        
      
      

      <div class="modal-footer">
        <button class="btn btn-primary" id="submit">Confirm</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>
