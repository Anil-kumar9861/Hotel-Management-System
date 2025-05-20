var table, selectedUser;
var selectedRoomId = null;
let RATE_PER_DAY = 1000; // default value

function getBooking() {
    $.ajax({
        url: "/getAllBooking",
        success: function (response) {
            generateBookTable(response);
            console.log(response);
        }
    });
}

function generateBookTable(bookJson) {
    loadBookTable(bookJson);
}

function loadBookTable(bookJson) {
    var tableHTML = "";
    var sl = 1;
    $.each(bookJson, function (i, item2) {
        console.log(item2);
        tableHTML += '<tr>' +
            '<td>' + sl + '</td>' +
            '<td>' + item2.userName + '</td>' +
            '<td>' + item2.checkIn + '</td>' +
            '<td>' + item2.checkOut + '</td>' +
            '<td>' + item2.room.roomNumber + '</td>' +
            '<td>' + item2.room.pricePerNight + '</td>' +
            '<td>' + item2.bookingType + '</td>' +
            '<td>' + item2.status + '</td>' +
            '<td>' + item2.totalPrice + '</td>' +
            '<td>' +
            '<a href="javascript:" title="Edit" class="text-warning us_edit_btn" data_id="' + item2.bookingid + '"><i class="fa fa-edit"></i></a> &nbsp;&nbsp;&nbsp; ' +
            '<a href="javascript:" title="Delete" class="text-danger us_delete_btn" data-room-price="' + (item2.room ? item2.room.pricePerNight : '') + '" data_id="' + item2.bookingid + '"><i class="fa fa-trash"></i></a>' +
            '</td>' +
            '</tr>';
        sl++;
    });

    if (typeof table !== "undefined") {
        table.destroy();
    }
    $("#bookingList tbody").html(tableHTML);

    $(".us_edit_btn").unbind("click");
    $(".us_edit_btn").click(function () { openUpdateBookingModal(this); });

    $(".us_delete_btn").unbind("click");
    $(".us_delete_btn").click(function () { deleteBooking(this); });
}

function deleteBooking(obj) {
    var bk_id = $(obj).attr("data_id");
    if (!confirm("Are you sure to delete user with code : " + bk_id + "?"))
        return false;

    $.ajax({
        url: "deleteBooking_Ajax",
        data: { id: bk_id },
        contentType: 'application/json',
        success: function (response) {
            alert("User Deleted Successfully, Thank You...");
            getBooking();
        },
        error: function () {
            alert("Something went wrong, please try again!");
        }
    });
}

function openUpdateBookingModal(obj) {
    $(".modalSpace").load("/updateBooking", function () {
        getBookingDetails($(obj).attr('data_id'));
        $("#updateBooking").modal();
        $("#submit_upd_Btn").click(function () {
            updateBooking();
        });
    });
}

function getBookingDetails(bookingId) {
    $.ajax({
        type: "GET",
        url: "getBookingById_Ajax",
        data: { id: bookingId },
        contentType: 'application/json',
        success: function (response) {
            selectedBooking = response;
            $('#editBookingId').val(bookingId);

            $('#editUserID').val(response.user ? response.user.id : '');
            $('#editRoomID').val(response.room ? response.room.roomid : '');
            $('#editCreatedAt').val(response.createdAt);
            $('#editUpdatedAt').val(response.updatedAt);

            $('#editCheckIn').val(response.checkIn);
            $('#editCheckOut').val(response.checkOut);
            $('#editTotalPrice').val(response.totalPrice);
            $('#editStatus').val(response.status);

            // Update RATE_PER_DAY from backend room price
            if (response.room && response.room.pricePerNight) {
                RATE_PER_DAY = response.room.pricePerNight;
            }

            $('#editBookingModal').modal('show');
        },
        error: function () {
            alert("No User Available in this id");
        }
    });
}

function calculateUpdatedPrice() {
    const checkin = $('#editCheckIn').val();
    let checkout = $('#editCheckOut').val();
  
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
        const total = (days * RATE_PER_DAY).toFixed(2);
        
        $('#editTotalPrice').val(total);
      } else {
        $('#editTotalPrice').val("Invalid dates");
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
$(document).on('input change', '#editCheckIn, #editCheckOut', function () {
    calculateUpdatedPrice();
});

function updateBooking() {
    var reqData = {
        bookingid: $('#editBookingId').val(),
        userID: $('#editUserID').val(),
        roomID: $('#editRoomID').val(),
        checkIn: $('#editCheckIn').val(),
        checkOut: $('#editCheckOut').val(),
        totalPrice: $('#editTotalPrice').val(),
        status: $('#editStatus').val(),
        createdAt: $('#editCreatedAt').val(),
        updatedAt: new Date().toISOString()
    };

    $.ajax({
        type: "PUT",
        url: "updateBooking_Ajax?id=" + selectedBooking.bookingid,
        cache: false,
        dataType: "json",
        data: JSON.stringify(reqData),
        contentType: 'application/json',
        success: function (response) {
            alert("Booking Updated Successfully, Thank You...");
            $("#updateBooking").modal("hide");
            getBooking();
        },
        error: function (xhr) {
            if (xhr.status === 400) {
                let errors = xhr.responseJSON;
                $(".error-message").text("");
                $.each(errors, function (key, value) {
                    $("#" + key + "Error").text(value);
                });
            } else {
                alert(xhr.responseJSON.error || "An error occurred. Please try again.");
            }
        }
    });
}

function saveBooking(roomId) {
    var reqData = {
        userID: null,
        roomID: roomId,
        checkIn: $('#checkin').val(),
        checkOut: $('#checkout').val(),
        totalPrice: $('#totalprice').val(),
        status: $('#status').val(),
        userName: $('#username').val(),
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString()
    };

    $.ajax({
        type: "POST",
        url: "/createBooking",
        cache: false,
        dataType: "json",
        data: JSON.stringify(reqData),
        contentType: 'application/json',
        success: function (response) {
            if (JSON.stringify(response).indexOf("error") > 0) {
                alert(response.error, "error");
                $("#addBookingModal").modal("hide");
            } else {
                alert("Booking Added Successfully.");
                $("#addBookingModal").modal("hide");
            }
            getBooking();
        },
        error: function () {
            alert('Booking Not Created');
            $("#addBookingModal").modal("hide");
            getBooking();
        }
    });
}
