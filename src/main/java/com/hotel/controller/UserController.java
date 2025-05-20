package com.hotel.controller;

import java.io.IOException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.hotel.model.User;
import com.hotel.request.UserinfoClientPojo;
import com.hotel.service.UserService;

import javax.validation.Valid;

@Controller
public class UserController {

	@Autowired
	private UserService userService;


	@RequestMapping(value = "/home")
	public String adminHome() {
		return "commons/home";
	}
	

	@RequestMapping("/dashboard")
	public String dashboard() {
		return "admin/dashboard";
	}

	@RequestMapping("/addUser")
	public String addUserModal() {
		return "admin/modal/addUser";
	}

	@RequestMapping("/manageusers")
	public String manageModal() {
		return "admin/Manageuser";
	}

	@RequestMapping("/updateUser")
	public String updateUser() {
		return "admin/modal/updateUser";
	}


	@RequestMapping(value = "/createUser_Ajax", method = RequestMethod.POST)
	public ResponseEntity<?> createUser(@Valid @RequestBody UserinfoClientPojo user) {

		try {
			user.setEnabled(0);
			user.setRole("USER");

			User userInstance = userService.saveUserData(user);

			if (userInstance != null) {
				Map<String, Object> response = new HashMap<>();
				response.put("message", "User created successfully!");
				response.put("userId", userInstance.getId());
				response.put("userName", userInstance.getUserName());

				return ResponseEntity.ok(response);
			} else {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST)
						.body(Collections.singletonMap("error", "User could not be saved."));
			}

		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(Collections.singletonMap("error", "An error occurred: " + e.getMessage()));
		}
	}


	@RequestMapping("/getAllUsers")
	public ResponseEntity<?> getAllUsers() {
		List<User> users = userService.findAllUsers();
		if (Objects.nonNull(users)) {
			return new ResponseEntity<List<User>>(users, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/getUserById_Ajax", method = RequestMethod.GET)
	public ResponseEntity<?> getUser(@RequestParam("id") String id) {
		
		UserinfoClientPojo clientData = new UserinfoClientPojo();
		clientData.setIds(id);
		User userinstance = userService.getUserById(clientData);
		if (Objects.nonNull(userinstance)) {
			return new ResponseEntity<User>(userinstance, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
		}

	}
	
	@RequestMapping(value = "/updateuser_Ajax", method = RequestMethod.PUT)
	public ResponseEntity<?> updateUser(@RequestParam("id") String id,@Valid  @RequestBody UserinfoClientPojo clientData) throws Exception {


		clientData.setIds(id);
		User userinstance = userService.updateUser(clientData);
		
		if (Objects.nonNull(userinstance)) {
			return new ResponseEntity<User>(userinstance, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/deleteUser_Ajax", method = RequestMethod.GET)
	public ResponseEntity<?> deleteUser(@RequestParam("id") String id) {

		UserinfoClientPojo clientData = new UserinfoClientPojo();
		clientData.setIds(id);
		if (userService.deleteUser(clientData)) {
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		} else {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No User availabe in this ID");
		}
		
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public ResponseEntity<?> updateProfile(@RequestBody UserinfoClientPojo userPojo) {
		System.out.println(userPojo);
		// Save or update user in your database
		User updatedUser = userService.editProfile(userPojo);
		if (updatedUser != null) {
			return ResponseEntity.ok("Profile updated successfully!");
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found.");
		}
	}


}



