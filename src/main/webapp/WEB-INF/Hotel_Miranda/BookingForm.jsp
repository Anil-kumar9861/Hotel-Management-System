<style>
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap");


.wrapper1 {
  background: #ffffff;
  max-width: 760px;
  width: 100%;
  padding: 40px;
  border-radius: 16px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.wrappe1r .title {
  font-size: 28px;
  font-weight: 600;
  color: #333;
  text-align: center;
  margin-bottom: 30px;
}

form .user-details {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  gap: 20px;
}

.user-details .input-box {
  flex: 1 1 calc(50% - 10px);
}

.input-box input {
  width: 100%;
  height: 45px;
  padding: 10px 15px;
  font-size: 15px;
  border: 1px solid #ccc;
  border-radius: 8px;
  transition: 0.3s;
}

.input-box input:focus {
  border-color: #4070f4;
  box-shadow: 0 0 5px rgba(64, 112, 244, 0.3);
}

.date-time {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 20px;
  margin-top: 20px;
}

.date-time .col {
  flex: 1 1 48%;
}

.date-time span {
  display: block;
  font-weight: 500;
  color: #444;
  margin-bottom: 8px;
}

.date-time .inputs {
  display: flex;
  gap: 10px;
}

.date-time input[type="date"],
.date-time input[type="time"] {
  flex: 1;
  height: 45px;
  padding: 10px;
  font-size: 15px;
  border: 1px solid #ccc;
  border-radius: 8px;
  background-color: #fff;
  transition: 0.3s;
}

.date-time input:focus {
  border-color: #4070f4;
  box-shadow: 0 0 5px rgba(64, 112, 244, 0.3);
}

.row {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;

  margin-top: 25px;
  margin-right: 3px;
  margin-left: 4px;
}

.row .box {
  flex: 1 1 32%;
}

.box select {
  width: 100%;
  height: 45px;
  padding: 0 10px;
  font-size: 15px;
  border: 1px solid #ccc;
  border-radius: 8px;
  background-color: #fff;
  appearance: none;
  transition: 0.3s;
}

.box select:focus {
  border-color: #4070f4;
  box-shadow: 0 0 5px rgba(64, 112, 244, 0.3);
}

form button {
  margin-top: 30px;
  width: 100%;
  height: 50px;
  border: none;
  border-radius: 10px;
  background: #4070f4;
  color: #fff;
  font-size: 18px;
  font-weight: 600;
  cursor: pointer;
  transition: background 0.3s;
}

form button:hover {
  background: #3058d4;
}

</style>
  <div class="modal fade" id="bookingmodel" tabindex="-1" role="dialog" aria-labelledby="bookingLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document"> <!-- You can use modal-lg or modal-sm -->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Booking Details</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div class="wrapper1">
                <div class="content">
                  <form action="#">
                    <div class="user-details">
                      <div class="input-box">
                        
                        <input type="text" placeholder="First Name" />
                      </div>
                      <div class="input-box">
                        
                        <input type="text" placeholder="Last Name" />
                      </div>
                      <div class="input-box">
                       
                        <input type="phone" placeholder="Phone Number" />
                      </div>
                      <div class="input-box">
                        
                        <input type="email" placeholder="Email Address" />
                      </div>
                    </div>
            
                    <div class="date-time">
                      <div class="col">
                        <span>Check-in</span>
            
                        <div class="inputs">
                          <input type="date" />
                          <input type="time" />
                        </div>
                      </div>
            
                      <div class="col">
                        <span>Check-out</span>
            
                        <div class="inputs">
                          <input type="date" />
                          <input type="time" />
                        </div>
                      </div>
                    </div>
            
                    <div class="row">
                      <div class="box">
                        <select>
                          <option value="" selected disabled>Adults</option>
                          <option value="">1 Adults</option>
                          <option value="">2 Adults</option>
                          <option value="">3 Adults</option>
                          <option value="">4 Adults</option>
                          <option value="">5 Adults</option>
                          <option value="">6 Adults</option>
                        </select>
                      </div>
                      <div class="box">
                        <select>
                          <option value="" selected disabled>Children</option>
                          <option value="">1 Children</option>
                          <option value="">2 Children</option>
                          <option value="">3 Children</option>
                          <option value="">4 Children</option>
                          <option value="">5 Children</option>
                          <option value="">6 Children</option>
                        </select>
                      </div>
                      <div class="box">
                        <select>
                          <option value="" selected disabled>Rooms</option>
                          <option value="">1 Rooms</option>
                          <option value="">2 Rooms</option>
                          <option value="">3 Rooms</option>
                          <option value="">4 Rooms</option>
                          <option value="">5 Rooms</option>
                          <option value="">6 Rooms</option>
                        </select>
                      </div>
                    </div>
            
                    <button class="btn btn-primary" id="booknow">Book Now</button>
                  </form>
                </div>
              </div>
            
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <script>
    $("#booknow").on('click', function() {
            
            alert("Booking Successful.........");
        });
  </script>