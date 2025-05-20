package com.hotel.service.impl;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.hotel.model.User;
import com.hotel.repository.UserRepository;
import com.hotel.request.UserinfoClientPojo;
import com.hotel.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public User saveUserData(UserinfoClientPojo userPojo) {

		try {
			User userData = new User();
			BeanUtils.copyProperties(userPojo, userData);
			return userRepository.save(userData);

		} catch (Exception e) {

			return null;
		}
	}

	@Override
	public List<User> findAllUsers() {
		try {
			return userRepository.findAll();

		} catch (Exception e) {

			return null;
		}

	}

	@Override
	public User getUserById(UserinfoClientPojo userPojo) {

		try {

			Optional<User> userOpt = userRepository.findById(userPojo.getIds());
			if (userOpt.isPresent()) {

				return userOpt.get();

			} else {

				return null;
			}

		} catch (Exception e) {

			return null;
		}

	}

	@Override
	public User updateUser(UserinfoClientPojo userPojo) {
		try {
			Optional<User> userOpt = userRepository.findById(userPojo.getIds());
			if (userOpt.isPresent()) {
				User userInstance = userOpt.get();
				userInstance.setEmail(userPojo.getEmail());
				userInstance.setUserName(userPojo.getUserName());
				userInstance.setFirstName(userPojo.getFirstName());
				userInstance.setLastName(userPojo.getLastName());
				userInstance.setPassword(userPojo.getPassword());
				userInstance.setMiddleName(userPojo.getMiddleName());
				userInstance.setGender(userPojo.getGender());
				userInstance.setMobile(userPojo.getMobile());
				userInstance.setDob(userPojo.getDob());
				userInstance.setMobile(userPojo.getMobile());
				userInstance.setRole(userPojo.getRole());

				userInstance = userRepository.save(userInstance);
				return userInstance;
			} else {
				return null;
			}

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean deleteUser(UserinfoClientPojo userPojo) {

		try {
			Optional<User> userOpt = userRepository.findById(userPojo.getIds());

			if (userOpt.isPresent()) {
				User userInstance = userOpt.get();
				userRepository.delete(userInstance);
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {

			return false;
		}
	}

	@Override
	public ResponseEntity<?> validateUser(UserinfoClientPojo userPojo) {
		
		User userInstance = userRepository.findByEmailAndPasswordAndRole(userPojo.getUserName(),
				userPojo.getPassword(),userPojo.getRole());



		if (Objects.nonNull(userInstance)) {
		
			return new ResponseEntity<User>(userInstance, HttpStatus.OK);

		} else {
			System.out.println(userPojo.getUserName() );
			return new ResponseEntity<String>("Invalid Credentials", HttpStatus.BAD_REQUEST);
		}
	}

	public User editProfile(UserinfoClientPojo userPojo){
		try {
			Optional<User> userOpt = userRepository.findById(userPojo.getIds());
			
			if (userOpt.isPresent()) {
				User userInstance = userOpt.get();
				userInstance.setFirstName(userPojo.getFirstName());
				userInstance.setMiddleName(userPojo.getMiddleName());
				userInstance.setLastName(userPojo.getLastName());
				userInstance.setEmail(userPojo.getEmail());
				userInstance.setMobile(userPojo.getMobile());
				userInstance.setProfilePicturePath(userPojo.getProfilePicturePath());
				userInstance.setAadharCardNumber(userPojo.getAadharCardNumber());
				userInstance.setDob(userPojo.getDob());
				userInstance = userRepository.save(userInstance);
				return userInstance;
			} else {
				return null;
			}

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
	}

	public boolean sendResetLink(String email) {
		User user = userRepository.findByEmail(email);
		if (user == null) return false;

		String token = UUID.randomUUID().toString();
		user.setResetToken(token);
		userRepository.save(user);

		// You would integrate email sending logic here.
		String resetLink = "http://localhost:8080/reset-password?token=" + token;
		System.out.println("Send this link to email: " + resetLink);  // Simulated email

		return true;
	}

	public boolean resetPassword(String token, String newPassword) {
		User user = userRepository.findByResetToken(token);
		if (user == null) return false;

		user.setPassword(newPassword); // Hash this in production!
		user.setResetToken(null);
		userRepository.save(user);
		return true;
	}
}
