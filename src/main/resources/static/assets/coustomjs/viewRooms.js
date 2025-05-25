// Function to fetch available rooms
function getViewRoom() {
    $.ajax({
        url: "/getAvaRooms", // Backend endpoint for fetching rooms
        type: 'GET',
        success: function (response) {
            console.log("Rooms fetched successfully", response);
            generateRoomCards(response);
        },
        error: function (xhr, status, error) {
            console.log("Error fetching rooms", error);
            alert("Error fetching available rooms.");
        }
    });
}

// Function to generate room cards with images
function generateRoomCards(roomJson1) {
    loadRoomCards(roomJson1);
}



// Function to load room cards with images
function loadRoomCards(roomJson1) {
    var cardsHTML = "";

    $.each(roomJson1, function (i, item1) {
        // Use a default or room-specific image (You can store room images URLs in the room data)
        var roomImage = item1.roomImage || "/assets/img/room-1.jpg";  // If no image exists, use a default image

        cardsHTML += '<div class="col-md-4 mb-4">' +
            '<div class="card shadow-sm">' +
            '<img src="' + roomImage + '" class="card-img-top" alt="Room Image">' +
            '<div class="card-body">' +
            '<h5 class="card-title" style="margin-bottom: 0px;">Room No: ' + item1.roomNumber + '</h5>' +
            '<p class="card-text" style="margin-bottom: 0px;"><strong>Type:</strong> ' + item1.roomType + '</p>' +
            '<p class="card-text" style="margin-bottom: 0px;"><strong>Bed Type:</strong> ' + item1.bedType + '</p>' +
            '<p class="card-text" style="margin-bottom: 0px;"><strong>Services:</strong> ' + item1.facilities + '</p>' +
            '<p class="card-text" ><strong>Price:</strong> ' + item1.pricePerNight + ' per night</p>' +
            '<button type="button" class="btn btn-primary book-btn" ' +
            'data-room-id="' + item1.roomid + '" ' +
            'data-room-price="' + item1.pricePerNight + '" ' +
            'data-bed-type="' + item1.bedType + '" ' +
            'data-room-number="' + item1.roomNumber + '" ' +
            'data-room-type="' + item1.roomType + '">' +
            'Book Now' +
            '</button>' +
            '</div>' +
            '</div>' +
            '</div>';
    });

    // Insert the generated cards HTML into the roomContainer
    $("#roomContainer").html(cardsHTML);
}