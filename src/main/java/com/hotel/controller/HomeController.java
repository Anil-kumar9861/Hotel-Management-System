package com.hotel.controller;

import javax.validation.Valid;

import com.hotel.model.User;
import com.hotel.repository.UserRepository;
import com.hotel.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotel.request.UserinfoClientPojo;
import com.hotel.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private MailService mailService;

	@Autowired
	private UserRepository userRepository;

	@RequestMapping("/")
	public String login() {
		return "commons/login";
	}

	@RequestMapping("/user/home")
	public String userDashboard() {
		return "user/U-home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<?> login(@RequestBody UserinfoClientPojo user) {
		return userService.validateUser(user);
	}

	@RequestMapping("/user/logout")
	public String logout() {
		return "commons/login";
	}

	@RequestMapping("/landing")
	public String langingPage() {
		return "Hotel_Miranda/index";
	}

	@RequestMapping("/Udashboard")
	public String UDashboard() {
		return "user/modal/U-dashboard";
	}

	@RequestMapping("/forgot-password")
	public String forget() {
		return "commons/forgot_pass";
	}

	@RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
	public String processForgot(@RequestParam("email") String email, Model model) {
		boolean sent = mailService.sendPasswordResetLink(email);
		if (sent) {
			model.addAttribute("message", "If this email exists, a reset link has been sent.");
		} else {
			model.addAttribute("error", "Email address not found.");
		}
		return "commons/forgot_pass";
	}

	// Handle GET request to display reset password page
	@RequestMapping(value = "/reset-password", method = RequestMethod.GET)
	public String showResetPasswordPage(@RequestParam("email") String email, Model model) {
		// Check if the email exists and add to model for confirmation
		User user = userRepository.findByEmail(email);
		if (user == null) {
			model.addAttribute("error", "Invalid email address.");
			return "commons/forgot_pass";
		}

		// Proceed to show the reset password page
		model.addAttribute("email", email); // Add email to the model to auto-fill if necessary
		return "commons/reset_pass";
	}

	// Handle POST request to reset password
	@RequestMapping(value = "/reset-password", method = RequestMethod.POST)
	public String resetPassword(@RequestParam("email") String email,
								@RequestParam("newPassword") String newPassword,
								@RequestParam("confirmPassword") String confirmPassword,
								Model model) {
		// Check if passwords match
		if (!newPassword.equals(confirmPassword)) {
			model.addAttribute("error", "Passwords do not match.");
			return "commons/reset_pass";
		}

		// Fetch user by email
		User user = userRepository.findByEmail(email);
		if (user == null) {
			model.addAttribute("error", "Invalid email address.");
			return "commons/reset_pass";
		}

		// Encrypt the new password if needed
		// For example, using BCryptPasswordEncoder:
		// user.setPassword(passwordEncoder.encode(newPassword));

		// Save the new password
		user.setPassword(newPassword); // Replace with encoded password
		userRepository.save(user);

		// Provide feedback to the user
		model.addAttribute("message", "Password successfully reset. Please login.");
		return "redirect:/"; // or forward to a success page
	}

	@RequestMapping("/send-reset-link")
	public String sendResetLink(@RequestParam("email") String email, Model model) {
		boolean result = userService.sendResetLink(email);
		if (result) {
			model.addAttribute("message", "Reset link sent to your email.");
		} else {
			model.addAttribute("error", "Email not found.");
		}
		return "forgot-password"; // Update to the correct view for reset link request
	}
}
