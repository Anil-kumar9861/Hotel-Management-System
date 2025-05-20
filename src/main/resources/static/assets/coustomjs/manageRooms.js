var table ,selectedRoom;
$("#add_room").click(function(){
	$(".modalSpace").load("/addRoom", function(){
		$("#addroom").modal();
		// getAllFloorData();
		$("#btnSave").click(function() {
			if(roomValidation()){
				saveRoom();
			}
				
		});
	});
});
function getRoomData() {
	$.ajax({
		url : "/getAllRooms",
		success : function(response) {
			console.log(JSON.stringify(response));
			generateRoomTable(response);
			console.log(response);
		}
	});
}

function generateRoomTable(roomJson) {
	loadRoomTable(roomJson);
}

function loadRoomTable(roomJson) {
	var tableHTML = "";
	var sl=1; 
	$.each(roomJson, function(i, item){
	
		tableHTML += '<tr>'+
						'<td>'+sl+'</td>'+
						'<td>'+item.roomNumber+'</td>'+
						'<td>'+item.createdAt+'</td>'+
						'<td>'+item.updatedAt+'</td>'+
						'<td>'+item.roomType+'</td>'+
						'<td>'+item.bedType+'</td>'+
						'<td>'+item.status+'</td>';
		
								
						
				tableHTML +='<td>'+item.pricePerNight+'</td>'+
						/*'<td>'+item.type+'</td>'+	*/
						'<td><a href="javascript:" title="Edit" class="text-warning us_edit_btn" data_id="'+item.roomid+'"><i class="fa fa-edit"></i></a> &nbsp;&nbsp;&nbsp;'+		
						'<a href="javascript:" title="Delete" class="text-danger  us_delete_btn" data_id="'+item.roomid+'"><i class="fa fa-trash"></i></a>'+
						'</td>'+
						'<td>' + generateBookingButton(item) + '</td>' + //add button
					'</tr>';
		sl=sl+1;
	});
	
	if(table)
		table.destroy();
	$("#roomList tbody").html(tableHTML);
	
	
	$(".us_edit_btn").unbind("click");
	$(".us_edit_btn").click(function(){openUpdateRoomModal(this);});
	
	$(".us_delete_btn").unbind("click");
	$(".us_delete_btn").click(function(){deleteRoom(this);});
}

function generateBookingButton(item2) {
    if (item2.status === "FREE") {
        return `<button class="btn btn-sm btn-success" onclick="openBookingModal('${item2.roomid}')">Book</button>`;
    } else {
        return `<button class="btn btn-sm btn-light" disabled title="Room Not Available">
                    <i class="fas fa-ban"></i>
                </button>`;
    }
}
function openBookingModal(roomId) {
    selectedRoomId = roomId;
    $(".modalSpace").load("/addBooking", function(){
        $("#addBookingModal").modal();

        $("#submit_add_Btn").click(function() {
            saveBooking(selectedRoomId);
        });
    });
}


function openUpdateRoomModal(obj){
	$(".modalSpace").load("/updateRoom", function(){
		getRoomDetails($(obj).attr('data_id'));
		// getAllFloorData();
		$("#updateRoom").modal();
		$("#submit_upd_Btn").click(function() {
			if(roomValidation()){
				updateRoom();
			}
		});
	});
}


function deleteRoom(obj) {
	var us_id = $(obj).attr("data_id");
	if(!confirm("Are you sure to delete room with code : "+us_id+"?"))
		return false;
		
	$.ajax({
		url : "deleteRoom_Ajax",
		data : {
			id : us_id
		},
		contentType : 'application/json',
		success : function(response) {
			alert("Room Deleted Successfully, Thank You...");
			getRoomData();
		},
		error : function(xhr, status, error) {
			alert("Something went wrong, please try again!........");
		}
	})
}

function getAllFloorData() {
	$.ajax({
		url : "/getAllFloors",
		success : function(response) {
			console.log(JSON.stringify(response));
			var dropDownHTML = "<option vlaue=''>Select Floor</option>";
			$.each(response, function(i, item){
				dropDownHTML += "<option value='"+item.id+"'>"+item.floorNo+'-'+item.floorName+"</option>";
			});
			$("#onFloor").html(dropDownHTML);
		}
	});
}
function updateRoom() {

	var reqData = {
		roomNumber : $("#roomNumber").val(),//
		createdAt : $("#createdAt").val(),//
		updatedAt : $("#updatedAt").val(),//
		bedType : $("#bedType").val(),
		roomType : $("#roomType").val(),//
			status : $("#status").val(),//
			pricePerNight : $("#pricePerNight").val(),//
			
		}
		console.log(reqData);
		$.ajax({
			type : "PUT",
			url : "/updateRoom_Ajax?id="+ selectedRoom.roomid,
			cache : false,
			dataType : "json",
			data : JSON.stringify(reqData),
			contentType : 'application/json',
			success : function(response) {
				alert("Room Update Successfully, Thank You...");
				$("#updateRoom").modal("hide");
				getRoomData();
			},
			error : function(xhr, status, error) {
				if (xhr.status === 400) { // Validation errors
					let errors = xhr.responseJSON;
					console.log("Validation Errors:", errors); 
					$(".error-message").text(""); // Clear previous errors
					console.log("Received errors:", errors);

					$.each(errors, function (key, value) {
						console.log(value);
						$("#" + key + "Error").text(value); // Show errors next to fields
					});
				} else {
					alert(xhr.responseJSON.error || "An error occurred. Please try again.");
				}
			}
		})
}
function getRoomDetails(roomId){
	console.log(roomId);
	$.ajax({
		type : "GET",
		url : "getRoomById_Ajax",
		data : {
			id : roomId
		},
		contentType : 'application/json',
		success : function(response) {
			console.log(JSON.stringify(response));
		selectedRoom = response;
			$('#roomNumber').val(response.roomNumber);
			$('#createdAt').val(response.createdAt);
			$('#updatedAt').val(response.updatedAt);
			// $('#onFloor').val(response.floor.floorName);
			$('#roomType').val(response.roomType);
			$('#bedType').val(response.bedType);
			$('#status').val(response.status);
			$('#pricePerNight').val(response.pricePerNight);
			
		},
		error : function(xhr, status, error) {
			alert("No Room Available in this id");
		}
	})
}


function saveRoom() {
	var reqData = {
		roomNumber : $("#roomNum").val(),//
			createdAt : $("#CreatedAt").val(),//
			updatedAt : $("#UpdatedAt").val(),//
			roomType : $("#RoomType").val(),//
			bedType : $("#bedType").val(),//
			status : $("#status").val(),//
			
			pricePerNight : $("#roomCharge").val(),//
		}
		console.log(reqData);
		$.ajax({
			type : "POST",
			url : "/createRoom",
			cache : false,
			dataType : "json",
			data : JSON.stringify(reqData),
			contentType : 'application/json',
			success : function(response) {
				
				if(JSON.stringify(response).indexOf("error") > 0) {
					alert(response.error, "error");
					$("#addroom").modal("hide");
				} else {
					alert("Room Added Successfully.");
					console.log(JSON.stringify(response));
					$("#addroom").modal("hide");
				}
				getRoomData();
			},
			error : function(xhr, status, error) {
				alert('Room Not Add Sucessfully');
				$("#addroom").modal("hide");
				getRoomData()
			}
		})
}

function roomValidation() {
	
	if ($("#roomNo").val() == "") {
	    alert("Please Provide Room Number");
	    return false;
	  }

	if ($("#accommodation").val() == "") {
	    alert("Please Provide Accommodation");
	    return false;
	  }
	
	if ($("#onFloor").val() == "") {
	    alert("Please Select On Properties");
	    return false;
	  }
	
	if ($("#noOfBed").val() == "") {
	    alert("Please Provide Beds");
	    return false;
	  }
	
	if ($("#status").val() == "") {
	    alert("Please Select Status");
	    return false;
	  }

	  return true;
}
function saveBooking(roomId) {
	var reqData = {
		userID: null,
		roomID: roomId,
		checkIn: $('#checkin').val(),
		checkOut: $('#checkout').val(),
		totalPrice: $('#totalprice').val(),
		status: $('#status').val(),
		userName:$('#username').val(),
		createdAt: new Date().toISOString(),
		updatedAt: new Date().toISOString()   // Updating to current time
	};
	console.log(reqData);
		console.log(reqData);
		$.ajax({
			type : "POST",
			url : "/createBooking",
			cache : false,
			dataType : "json",
			data : JSON.stringify(reqData),
			contentType : 'application/json',
			success : function(response) {
				
				if(JSON.stringify(response).indexOf("error") > 0) {
					alert(response.error, "error");
					$("#addBookingModal").modal("hide");
				} else {
					alert("Booking Added Successfully.");
					getRoomData();
					console.log(JSON.stringify(response));
					$("#addBookingModal").modal("hide");
				}
				getBooking();
			},
			error : function(xhr, status, error) {
				alert('Booking Not Created');
				$("#addBookingModal").modal("hide");
				getBooking()
			}
		})
}