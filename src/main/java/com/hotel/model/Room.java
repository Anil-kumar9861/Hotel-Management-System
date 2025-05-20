package com.hotel.model;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.*;
@Entity
@Table(name="Room_Info")
public class Room implements Serializable{

	@Id
	@Column(name = "roomID",length=100)
	private String roomid=UUID.randomUUID().toString().toUpperCase();
	
	@Column(name="roomNumber",length=100)
	private String roomNumber;
	
	@Column(name="roomType",length=50)
	private String roomType;
	
	@Column(name="status",length=50)
	private String status;
	
	@Column(name="pricePerNight",length=10)
	private Integer pricePerNight;
	
	@Column(name="createdAt")
	private String createdAt;
	

	@Column(name="updatedAt")
	private String updatedAt;

	@Column(name="bedType")
	private String bedType;

	@Column(name = "room_image")
	private String roomImage;  // This can store a relative path or URL

	@Column(name = "facilities")
	private String facilities;

	public String getFacilities() {
		return facilities;
	}

	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}

	public String getRoomImage() {
		return roomImage;
	}

	public void setRoomImage(String roomImage) {
		this.roomImage = roomImage;
	}




	public String getBedType() {
		return bedType;
	}

	public void setBedType(String bedType) {
		this.bedType = bedType;
	}


	public String getRoomid() {
		return roomid;
	}


	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}


	public String getRoomNumber() {
		return roomNumber;
	}


	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}


	public String getRoomType() {
		return roomType;
	}


	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Integer getPricePerNight() {
		return pricePerNight;
	}


	public void setPricePerNight(Integer pricePerNight) {
		this.pricePerNight = pricePerNight;
	}


	public String getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}


	public String getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}

	
}
