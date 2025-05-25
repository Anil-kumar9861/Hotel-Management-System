var table ,selectedUser;

function addUser() {
	$(".modalSpace").load("/addUser", function() {
		$("#addUser").modal();
		$("#btnSave").click(function() {
			saveUser();
		});
	});
}


function getUserData() {
	$.ajax({
		url : "/getAllUsers",
		success : function(response) {
			console.log(JSON.stringify(response));
			generateUserTable(response);
		}
	});
}
function generateUserTable(userJson) {
	loadUserTable(userJson);
	console.log(userJson);
}

function loadUserTable(userJson) {
	var tableHTML = "";
	var sl=1; 
	$.each(userJson, function(i, item){
		tableHTML += '<tr>'+
						'<td>'+sl+'</td>'+
						'<td>'+item.id+'</td>'+
						'<td>'+item.userName+'</td>'+
						'<td>'+item.mobile+'</td>'+
						'<td>'+item.email+'</td>'+
						'<td>'+item.role+'</td>'+			
						'<td><a href="javascript:" title="Edit" class="text-warning us_edit_btn" data_id="'+item.id+'"><i class="fa fa-edit"></i></a> &nbsp;&nbsp;&nbsp; '+		
						'<a href="javascript:" title="Delete" class="text-danger  us_delete_btn" data_id="'+item.id+'"><i class="fa fa-trash"></i></a>'+
						'</td>'+
					'</tr>';
		sl=sl+1;
	});
	
	if(table)
		table.destroy();
	$("#userList tbody").html(tableHTML);
	
	
	$(".us_edit_btn").unbind("click");
	$(".us_edit_btn").click(function(){openUpdateUserModal(this);});
	
	$(".us_delete_btn").unbind("click");
	$(".us_delete_btn").click(function(){deleteUser(this);});
}

function openUpdateUserModal(obj){
	$(".modalSpace").load("/updateUser", function(){
		getUserDetails($(obj).attr('data_id'));
		$("#updateUser").modal();
		$("#submit_upd_Btn").click(function() {
			updateUser();
		});
	});
}

function deleteUser(obj) {
	
	var us_id = $(obj).attr("data_id");
	if(!confirm("Are you sure to delete user with code : "+us_id+"?"))
		return false;
		
	$.ajax({
		url : "deleteUser_Ajax",
		data : {
			id : us_id
		},
		contentType : 'application/json',
		success : function(response) {
			alert("User Deleted Successfully, Thank You...");
			getUserData();
		},
		error : function(xhr, status, error) {
			alert("Something went wrong, please try again!........");
		}
	})
}
function updateUser() {

	var reqData = {
			role : $("#role").val(),//
			firstName : $("#fname").val(),
			middleName:$("#mname").val(),
			lastName : $("#lname").val(),
			userName : $("#Uname").val(),
			enabled: 0,
			email : $("#email").val(),
			password : $("#password").val(),
			dob : $("#dob").val(),
			mobile : $("#mobile").val(),
			gender : $("#gender").val()
			
		}
		$.ajax({
			type : "PUT",
			url : "updateuser_Ajax?id="+ selectedUser.id,
			cache : false,
			dataType : "json",
			data : JSON.stringify(reqData),
			contentType : 'application/json',
			success : function(response) {
				console.log(reqData);
				console.log(response);
				alert("User Update Successfully, Thank You...");
				$("#updateUser").modal("hide");
				getUserData();
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
function getUserDetails(userId){
	$.ajax({
		type : "GET",
		url : "getUserById_Ajax",
		data : {
			id : userId
		},
		contentType : 'application/json',
		success : function(response) {
		selectedUser = response;
			$('#role').val(response.role);
			$('#Uname').val(response.userName);
			$('#fname').val(response.firstName);
			$('#mname').val(response.middleName);
			$('#lname').val(response.lastName);
			$('#email').val(response.email);
			$('#fname').val(response.firstName);
		//	$('#userName').val(response.password);
			$('#dob').val(response.dob);
			$('#mobile').val(response.mobile);
			$('#gender').val(response.gender);
		},
		error : function(xhr, status, error) {
			alert("No User Available in this id");
		}
	})
}
function saveUser() {
	var reqData = {
			firstName : $("#fname").val(),
			middleName:$("#mname").val(),
			lastName : $("#lname").val(),
			userName : $("#userName").val(),
			enabled: 0,
			role: "USER",
			email : $("#email").val(),
			password : $("#passworddata").val(),
			dob : $("#dob").val(),
			mobile : $("#mobile").val(),
			gender : $("#gender").val()
			
		}
	
	console.log(JSON.stringify(reqData));
	
		$.ajax({
			type : "POST",
			url : "createUser_Ajax",
			cache : false,
			dataType : "json",
			data : JSON.stringify(reqData),
			contentType : 'application/json',
			success : function(response) {
				alert("User Added Successfully.");
				if(JSON.stringify(response).indexOf("error") > 0) {
					alert(response.error, "error");
					$("#addUser").modal("hide");
				} else {
					alert("User Added Successfully.");
					console.log(JSON.stringify(response));
					$("#addUser").modal("hide");
				}
			/*	getUserData();*/
			},
			error : function(xhr, status, error) {
				if (xhr.status === 400) { // Validation errors
					let errors = xhr.responseJSON;
					console.log("Validation Errors:", errors); 
					$(".error-message").text(""); // Clear previous errors
					console.log("Received errors:", errors);

					$.each(errors, function (key, value) {
						console.log(key);
						$("#" + key + "Error").text(value); // Show errors next to fields
					});
				} else {
					alert(xhr.responseJSON.error || "An error occurred. Please try again.");
				}
			}
		})
		
}