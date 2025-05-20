package com.hotel.model;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Booking_Info")
public class BookingTable implements Serializable {

	@Id
	@Column(name = "bookingID",length=100)
	private String bookingid=UUID.randomUUID().toString().toUpperCase();
	

    @ManyToOne
    @JoinColumn(name = "userID")
    private User user;

    @ManyToOne
    @JoinColumn(name = "roomID", nullable = false)
    private Room room;
    
    @Column(name="checkIn")
	private String checkIn;
	

	@Column(name="checkOut")
	private String checkOut;
    
    @Column(name="status",length=50)
	private String status;
	
	@Column(name="totalPrice",length=10)
	private Integer totalPrice;
	
	@Column(name="createdAt")
	private String createdAt;
	

	@Column(name="updatedAt")
	private String updatedAt;

	@Column(name = "bookingType", length = 20)
	private String bookingType;

	@Column(name = "user_name")
	private String userName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBookingType() {
		return bookingType;
	}

	public void setBookingType(String bookingType) {
		this.bookingType = bookingType;
	}




	public String getBookingid() {
		return bookingid;
	}


	public void setBookingid(String bookingid) {
		this.bookingid = bookingid;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Room getRoom() {
		return room;
	}


	public void setRoom(Room room) {
		this.room = room;
	}


	public String getCheckIn() {
		return checkIn;
	}


	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}


	public String getCheckOut() {
		return checkOut;
	}


	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Integer getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
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
