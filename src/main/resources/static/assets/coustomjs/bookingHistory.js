function getBookingHistory() {
    $.ajax({
        url: "/getBookingHistory",
        data: {
            userID: localStorage.getItem("userId")
        },
        success: function (response) {

            //  Now generate table
            generateBookTable(response);

            console.log(response);
        }
    });
}

function generateBookTable(bookingJson) {
    loadBookTable(bookingJson);
}

function loadBookTable(bookingJson) {
    var tableHTML = "";
    var sl = 1;

    if (bookingJson.length === 0) {
        tableHTML = `<tr>
            <td colspan="8" class="text-center text-muted py-4">
              <h2 style="padding-top:30px;">  No Bookings Found.</h2>
            </td>
        </tr>`;
    } else {
        $.each(bookingJson, function (i, item2) {
            tableHTML += '<tr>' +
                '<td>' + sl + '</td>' +
                '<td>' + item2.bookingid + '</td>' +
                '<td>' + item2.room.roomNumber + '</td>' +
                '<td>' + formatDateTime(item2.checkIn) + '</td>' +
                '<td>' + formatDateTime(item2.checkOut) + '</td>' +
                '<td>' + generateStatusBadge(item2.status) + '</td>' +
                '<td>' + item2.totalPrice + '</td>' +
                
                '<td>' + generateCancelButton(item2) + '</td>' +
            '</tr>';
            sl++;
        });
    }

    if (typeof table !== "undefined") {
        table.destroy();
    }
    $("#bookingHistory tbody").html(tableHTML);
}


function formatDateTime(dateTimeString) {
    if (!dateTimeString) return "";
    var dateObj = new Date(dateTimeString);

    const options = { day: '2-digit', month: 'short', year: 'numeric' };
    const timeOptions = { hour: '2-digit', minute: '2-digit', hour12: true };

    const datePart = dateObj.toLocaleDateString('en-GB', options).replace(/ /g, '-');
    const timePart = dateObj.toLocaleTimeString('en-US', timeOptions);

    return `${datePart} ${timePart}`;
}

function generateStatusBadge(status) {
    if (!status) return "";

    let badgeClass = "badge-secondary"; // default grey
    if (status === "Checked In") badgeClass = "badge-success";   // Green
    else if (status === "Checked Out") badgeClass = "badge-primary";  // Blue
    else if (status === "Cancelled") badgeClass = "badge-danger";    // Red

    return `<span class="badge ${badgeClass}">${status}</span>`;
}

function generateCancelButton(item2) {
    let cancelBtn = '';
    let invoiceBtn = '';

    // Cancel Button
    if (item2.status === "Booked" || item2.status === "Confirmed") {
        cancelBtn = `<button class="btn btn-sm btn-danger me-1" onclick="cancelBooking('${item2.bookingid}')">Cancel</button>`;
        invoiceBtn = `<a href="/admin/bookings/invoice/${item2.bookingid}" class="btn btn-sm btn-success">
        Download Invoice
    </a>`;
    } else {
        cancelBtn = `<button class="btn btn-sm btn-light me-1" disabled title="Cancellation Not Allowed">
                        <i class="fas fa-ban"></i>
                    </button>`;
    }

    // Invoice Button (allow only for Checked Out bookings)
    if (item2.status === "Checked Out") {
        invoiceBtn = `<a href="/admin/bookings/invoice/${item2.bookingid}" class="btn btn-sm btn-success">
                          Download Invoice
                      </a>`;
    }

    return cancelBtn + invoiceBtn;
}



function cancelBooking(bookingId) {
    if (confirm("Are you sure you want to cancel this booking?")) {
        $.ajax({
            url: "/cancelBooking_Ajax",
            method: "POST",
            data: { id: bookingId },
            success: function(response) {
                if (response === true) {
                    // alert("Booking cancelled successfully.");

                    showToast('Booking cancelled successfully!', 'success');

                    // Disable the cancel button immediately
                    const cancelBtn = document.querySelector(`button[onclick="cancelBooking('${bookingId}')"]`);
                    if (cancelBtn) {
                        cancelBtn.disabled = true;
                        cancelBtn.innerText = "Cancelled";
                        cancelBtn.classList.remove("btn-danger");
                        cancelBtn.classList.add("btn-warning");
                    }

                    
                }
            },
            error: function(xhr) {
                alert("Error cancelling booking. Please try again.");
                showToast('Failed to cancel booking.', 'error');
            }
        });
    }
}

