
<div class="container mt-4">
    <div class="card shadow-lg rounded p-4 bg-light">
        <div class="row align-items-center">
            <div class="col-md-1 text-center">
                <img src="/assets/img/upload/hells paradise.jpg" class="img-fluid rounded-circle" alt="Admin" width="60">
            </div>
            <div class="col-md-11">
                <h4 class="mb-0">Welcome, <span class="text-primary">Admin</span> </h4>
                <p class="text-muted mb-0">You have full access to manage rooms, bookings, and users.</p>
				
            </div>
        </div>
    </div>
</div>
<div class="container mt-4">
    <div class="row">
  
      <!-- Users Card -->
      <div class="col-md-4">
        <div class="card text-white bg-primary mb-3">
          <div class="card-body d-flex align-items-center justify-content-between">
            <div>
              <h5 class="card-title text-white ">Total Users</h5>
              <h3 id="userCount">0</h3>
            </div>
            <i class="fas fa-users fa-3x"></i>
          </div>
        </div>
      </div>
  
      <!-- Rooms Card -->
      <div class="col-md-4">
        <div class="card text-white bg-success mb-3">
          <div class="card-body d-flex align-items-center justify-content-between">
            <div>
              <h5 class="card-title">Total Rooms</h5>
              <h3 id="roomCount">0</h3>
            </div>
            <i class="fas fa-bed fa-3x"></i>
          </div>
        </div>
      </div>
  
      <!-- Bookings Card -->
      <div class="col-md-4">
        <div class="card text-white bg-warning mb-3">
          <div class="card-body d-flex align-items-center justify-content-between">
            <div>
              <h5 class="card-title">Total Bookings</h5>
              <h3 id="bookingCount">0</h3>
            </div>
            <i class="fas fa-calendar-check fa-3x"></i>
          </div>
        </div>
      </div>
  
    </div>
  </div>
  
<div class="container">
    <div class="row">
        <div class="col-sm">
           
                <div class="card text-white bg-dark mb-3">
                    <div class=""></div>
                    <div class="card-body">
                        <div class="container mt-5">
                            <h1 class="mb-3">Room  Booking</h1>

                            <!-- Seat Grid -->
                            <div id="seat-container" class="seat-grid"></div>

                            <!-- Seat Legend -->
                            <div class="legend mt-4">
                                <span class="seat available"></span> Available
                                <span class="seat booked"></span> Booked
                                
                            </div>

                            
                           
                        </div>
                    </div>
                </div>
            
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
// Fetch rooms using AJAX
$.ajax({
    url: '/getAllRooms',  // API to fetch all rooms
    type: 'GET',
    dataType: 'json',
    success: function (data) {
        renderRooms(data);
    },
    error: function (xhr, status, error) {
        console.error('Error fetching rooms:', error);
    }
});

// Render room seats based on fetched data
function renderRooms(rooms) {
    const seatContainer = $('#seat-container');
    seatContainer.empty(); // Clear any existing rooms

    rooms.forEach(function(room) {
        const isAvailable = room.status === 'FREE';

        // Create a wrapper to hold the icon and number
        const roomWrapper = $('<div>').css({
            display: 'inline-block',
            textAlign: 'center',
            margin: '10px',
        });

        // Create the room icon element
        const roomIcon = $('<div>')
            .addClass('seat')
            .addClass(isAvailable ? 'available' : 'booked')
            .attr('title', `Room ${room.roomNumber}\nType: ${room.roomType}\nPrice: ₹${room.pricePerNight}`)
            .html('<i class="fas fa-bed"></i>'); // Room icon using Font Awesome

        // Create the room number text below the icon
        const roomNumber = $('<div>')
            .text(room.roomNumber)
            .css({ marginTop: '5px', color: '#FFFFFF' });

        // Append icon and number to the wrapper
        roomWrapper.append(roomIcon).append(roomNumber);
        seatContainer.append(roomWrapper);
    });
}

// Numbers of users and rooms amd booking 

$(document).ready(function() {
    $.get("/getAllUsers", function(users) {
        $("#userCount").text(users.length);
    });

    $.get("/getAllRooms", function(rooms) {
        $("#roomCount").text(rooms.length);
    });

    $.get("/getAllBooking", function(bookings) {
        $("#bookingCount").text(bookings.length);
    });
});

</script>

<!-- Add styles for seats -->
<style>
.seat {
    display: inline-block;
    width: 60px;
    height: 60px;
    margin: 10px;
    text-align: center;
    line-height: 60px;
    border-radius: 10px;
    cursor: pointer;
    font-size: 30px;
}

.seat.available {
    background-color: #28a745;  /* Green for available rooms */
    color: white;
}

.seat.booked {
    background-color: #6c757d;  /* Grey for booked rooms */
    color: white;
}

.seat.selected {
    background-color: rgb(27, 27, 30);
    color: white;
}
</style>
