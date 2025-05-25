package com.hotel.model;
import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.persistence.JoinColumn;
@Entity
@Table(name="User_INFO")
public class User implements Serializable{
	

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Id
	@Column(name = "ID",length=100)
	private String id=UUID.randomUUID().toString().toUpperCase();
	@Column(name = "firstName",length=20)
	private String firstName;
	@Column(name = "lastName",length=20)
	private String lastName;
	@Column(name = "middleName",length=20)
	private String middleName;
	
	@Column(name = "role",length=15)
	private String role;
	
	@Column(name = "ENABLED", length = 1)
	@NotNull
	private Integer enabled;
	
	@Column(name = "userName",length=100)
	private String userName;
	
	@Column(name = "email",length=100)
	private String email;
	@Column(name = "password",length=50)
	private String password;
	@Column(name = "dob",length=50)
	private String dob;
	
	@Column(name = "mobile",length=20)
	private String mobile;
	@Column(name = "gender",length=10)
	private String gender;

	@Column(name = "profile_picture_path", length = 255)
	private String profilePicturePath;

	@Column(name = "reset_token")
	private String resetToken;



	@Column(name = "aadharCardNumber")
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


	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
}
