
    // // Sample booked seats (you can fetch this dynamically later)
    // const bookedSeats = ['A1', 'A3', 'B2', 'C4']; 

    // // Function to create seat grid
    // function createSeatGrid(rows = 5, cols = 8) {
    //     const seatContainer = document.getElementById('seat-container');
    //     seatContainer.innerHTML = ''; // Clear previous seats

    //     const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    //     for (let i = 0; i < rows; i++) {
    //         for (let j = 1; j <= cols; j++) {
    //             const seatId = `${alphabet[i]}${j}`;
    //             const seatDiv = document.createElement('div');
    //             seatDiv.classList.add('seat');

    //             if (bookedSeats.includes(seatId)) {
    //                 seatDiv.classList.add('booked');
    //             } else {
    //                 seatDiv.addEventListener('click', () => {
    //                     seatDiv.classList.toggle('selected');
    //                 });
    //             }

    //             seatDiv.setAttribute('data-seat-id', seatId);
    //             seatContainer.appendChild(seatDiv);
    //         }
    //     }
    // }

    // // Confirm Button Click
    // document.getElementById('confirmBooking').addEventListener('click', () => {
    //     const selectedSeats = Array.from(document.querySelectorAll('.seat.selected'))
    //         .map(seat => seat.getAttribute('data-seat-id'));

    //     if (selectedSeats.length === 0) {
    //         alert('Please select at least one seat!');
    //     } else {
    //         alert('You have selected: ' + selectedSeats.join(', '));
    //         // Here you can send selectedSeats to the backend via AJAX
    //     }
    // });

    // // Initialize seat grid
    // createSeatGrid();

	// const allRoomNumbers = ["101", "102", "103", "104", "105", "106", "107", "108", "145", "195", "199", "110"]; // You can dynamically get this list if needed

	// let availableRoomNumbers = [];
  
	// // Fetch available rooms from your API
	// fetch("/getAvaRooms")
	//   .then(response => response.json())
	//   .then(data => {
	// 	availableRoomNumbers = data.map(room => room.roomNumber);
	// 	renderRoomGrid();
	//   });
  
	// function renderRoomGrid() {
	//   const seatContainer = document.getElementById("seat-container");
	//   seatContainer.innerHTML = "";
  
	//   allRoomNumbers.forEach(roomNum => {
	// 	const seat = document.createElement("div");
	// 	seat.classList.add("seat");
  
	// 	if (availableRoomNumbers.includes(roomNum)) {
	// 	  seat.classList.add("available");
	// 	} else {
	// 	  seat.classList.add("booked");
	// 	}
  
	// 	seat.innerText = roomNum;
	// 	seatContainer.appendChild(seat);
	//   });
	// }