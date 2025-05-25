package com.hotel.request;

import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;

public class UserinfoClientPojo {

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@NotBlank(message = "User Name is required.")
	private String userName;
	@NotBlank(message = "First Name is required.")
	private String firstName;

	@NotBlank(message = "Middle Name is required.")
	private String middleName;

	@NotBlank(message = "Last Name is required.")
	private String lastName;

	@NotBlank(message = "Role is required.")
	private String role;

	@NotNull(message = "Enabled status is required.")
	private Integer enabled;



	@NotBlank(message = "Email is required.")
	@Email(message = "Invalid email format.")
	private String email;

	@NotBlank(message = "Password is required.")
	@Size(min = 6, message = "Password must be at least 6 characters long.")
	private String password;

	@NotBlank(message = "Date of Birth is required.")
	@Pattern(regexp = "\\d{4}-\\d{2}-\\d{2}", message = "Date of Birth must be in DD-MM-YYYY format.")
	private String dob;

	@NotBlank(message = "Mobile is required.")
	@Pattern(regexp = "\\d{10}", message = "Mobile number must be 10 digits.")
	private String mobile;

	@NotBlank(message = "Gender is required.")
	private String gender;
	private String ids;

	// Field for the profile picture (for upload handling)
	private String profilePicturePath;


	private String resetToken;



	private String aadharCardNumber;



	public String getAadharCardNumber() {
		return aadharCardNumber;
	}

	public void setAadharCardNumber(String aadharCardNumber) {
		this.aadharCardNumber = aadharCardNumber;
	}

	public String getResetToken() {
		return resetToken;
	}

	public void setResetToken(String resetToken) {
		this.resetToken = resetToken;
	}

	public String getProfilePicturePath() {
		return profilePicturePath;
	}

	public void setProfilePicturePath(String profilePicturePath) {
		this.profilePicturePath = profilePicturePath;
	}
}
