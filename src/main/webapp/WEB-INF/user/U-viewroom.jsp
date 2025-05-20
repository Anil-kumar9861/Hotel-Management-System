<div class="container page-inner mt--5" style="padding-top: 53px;" >
    <!-- Filter Form -->
    <form id="roomFilterForm" class="row g-3 mb-4">
        <div class="col-md-3">
            <select name="roomType" class="form-control">
                <option value="">All Room Types</option>
                <option value="Deluxe">Deluxe</option>
                <option value="Luxury">Luxury</option>
                <option value="Suite">Suite</option>
            </select>
        </div>
        <div class="col-md-3">
            <input type="number" name="minPrice" class="form-control" placeholder="Min Price">
        </div>
        <div class="col-md-3">
            <input type="number" name="maxPrice" class="form-control" placeholder="Max Price">
        </div>
        <div class="col-md-3">
            <button type="button" onclick="filterRooms()" class="btn btn-primary w-100">Filter</button>
        </div>
    </form>
    <div class="row mt--2" id="roomContainer">
        <!-- Room Cards will be inserted dynamically here -->
    </div>
</div>

<!-- Placeholder for modal -->
<div class="modalSpace"></div>

<!-- JS to manage room functionality -->
<script src="<%= request.getContextPath() %>/assets/coustomjs/manageRooms.js"></script>

<script>
function filterRooms() {
    const formData = $('#roomFilterForm').serialize();

    console.log(formData);
    $.ajax({
        url: '/filterRooms', // Ensure this is correctly mapped in the controller
        method: 'GET',
        data: formData,
        success: function(rooms) {
            let html = '';
            if (rooms.length === 0) {
                html = '<p>No rooms match your filter.</p>';
            } else {
                var roomImage = "/assets/img/room-1.jpg";
                rooms.forEach(room => {
                   html+= '<div class="col-md-4 mb-4">' +
            '<div class="card shadow-sm">' +
            '<img src="' + roomImage + '" class="card-img-top" alt="Room Image">' +
            '<div class="card-body">' +
            '<h5 class="card-title" style="margin-bottom: 0px;">Room No: ' + room.roomNumber + '</h5>' +
            '<p class="card-text" style="margin-bottom: 0px;"><strong>Type:</strong> ' + room.roomType + '</p>' +
            '<p class="card-text" style="margin-bottom: 0px;"><strong>Bed Type:</strong> ' + room.bedType + '</p>' +
            '<p class="card-text" style="margin-bottom: 0px;"><strong>Services:</strong> ' + room.facilities + '</p>' +
            '<p class="card-text" ><strong>Price:</strong> ' + room.pricePerNight + ' per night</p>' +
            '<button type="button" class="btn btn-primary book-btn" ' +
            'data-room-id="' + room.roomid + '" ' +
            'data-room-price="' + room.pricePerNight + '" ' +
            'data-bed-type="' + room.bedType + '" ' +
            'data-room-number="' + room.roomNumber + '" ' +
            'data-room-type="' + room.roomType + '">' +
            'Book Now' +
            '</button>' +
            '</div>' +
            '</div>' +
            '</div>';
                });
            }
            $('#roomContainer').html(html); // Fixed the target element
        },
        error: function() {
            alert('Failed to fetch rooms.');
        }
    });
}
</script>
