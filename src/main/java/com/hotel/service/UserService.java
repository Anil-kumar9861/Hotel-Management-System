package com.hotel.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.hotel.model.User;
import com.hotel.request.UserinfoClientPojo;

public interface UserService {

	User saveUserData(UserinfoClientPojo userPojo);
	
	List<User> findAllUsers();
	
	User getUserById(UserinfoClientPojo userPojo);
	
	User updateUser(UserinfoClientPojo userPojo);
	
	boolean deleteUser(UserinfoClientPojo userPojo);
	
	ResponseEntity<?> validateUser(UserinfoClientPojo userPojo);

	User editProfile(UserinfoClientPojo userPojo);
	public boolean sendResetLink(String email);
	public boolean resetPassword(String token, String newPassword);
	
	
}
