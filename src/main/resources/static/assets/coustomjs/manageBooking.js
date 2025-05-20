let selectedRoom = {};
let loggedInUsername = localStorage.getItem("userName") || "Guest";


// Handle Book Now button click
$(document).on('click', '.book-btn', function () {
  alert("booking.......");

  // Get data from clicked button
  const roomId = $(this).data('room-id');
  const roomPrice = $(this).data('room-price');
  const roomType = $(this).data('room-type');
  const bedType = $(this).data('bed-type');

  // Set selected room
  selectedRoom = {
    id: roomId,
    type: roomType,
    bedtype:bedType,
    pricePerDay: roomPrice
  };

  // Load modal content and initialize
  $(".modalSpace").load("/bookForm", function () {
    $('#bookingModal').modal('show');
    openBookingModal();

    // Attach date change listeners inside modal after it's loaded
    $('#checkin').on('change', calculateTotal);
    $('#checkout').on('change', calculateTotal);
  });
});

// Set modal field values
function openBookingModal() {
  const now = formatToDatetimeLocal(new Date()); // YYYY-MM-DDTHH:MM

  $('#username').val(loggedInUsername);
  $('#roomType').val(`${selectedRoom.type} - ₹${selectedRoom.pricePerDay}`);
  $('#bedType').val(selectedRoom.bedtype);
  $('#checkin').val(now);  // Optional: auto-fill with now
  $('#checkout').val("");
  $('#totalPrice').val("");
}

function calculateTotal() {
  const checkin = $('#checkin').val();
  let checkout = $('#checkout').val();

  if (checkin && checkout) {
    const checkinDate = new Date(checkin);
    const checkoutDate = new Date(checkout);

    // Copy hours and minutes from check-in to checkout
    checkoutDate.setHours(checkinDate.getHours());
    checkoutDate.setMinutes(checkinDate.getMinutes());

    // Manually format back to datetime-local (local time, not UTC)
    const formattedCheckout = formatToDatetimeLocal(checkoutDate);
    $('#checkout').val(formattedCheckout);

    // Calculate days difference
    const diffTime = checkoutDate - checkinDate;
    const days = diffTime / (1000 * 60 * 60 * 24);

    if (days > 0) {
      const total = (days * selectedRoom.pricePerDay).toFixed(2);
      $('#totalPrice').val(total);
    } else {
      $('#totalPrice').val("Invalid dates");
    }
  }
}

// Format date to YYYY-MM-DDTHH:MM for datetime-local input
function formatToDatetimeLocal(date) {
  const pad = (n) => n.toString().padStart(2, '0');
  const yyyy = date.getFullYear();
  const mm = pad(date.getMonth() + 1);
  const dd = pad(date.getDate());
  const hh = pad(date.getHours());
  const min = pad(date.getMinutes());
  return `${yyyy}-${mm}-${dd} ${hh}:${min}`;
}


$(document).on('click', '#submit', function (e) {
  e.preventDefault(); // Prevent default form submission

  // Get the userID from localStorage
  const userID = localStorage.getItem("userId");

  // Check if userID is null or undefined
  if (!userID) {
    alert("User ID cannot be null. Please log in first.");
    return; // Prevent form submission if user is not logged in
  }
  const bookingData = {
    roomID: selectedRoom.id,
  userID: localStorage.getItem("userId"),
  checkIn: $('#checkin').val(),
  checkOut: $('#checkout').val(),
  totalPrice: parseInt($('#totalPrice').val()),
  createdAt: new Date().toISOString(),
  updatedAt: new Date().toISOString(),
  status: "Confirmed", // optional, if required
  };

  console.log(bookingData);
  $.ajax({
    url: '/createBooking',
    type: 'POST',
    contentType: 'application/json',
    data: JSON.stringify(bookingData),
    success: function (response) {
      alert("Booking successful!");
      $('#bookingModal').modal('hide');
      
      getViewRoom(); // Refresh available rooms list
    },
    error: function (xhr, status, error) {
      console.log(error,status);
      alert("Booking failed: " + xhr.responseText);
    }
  });
});