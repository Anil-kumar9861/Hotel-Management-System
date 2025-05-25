package com.hotel.request;

public class BookinginfoPojo {
	
	    private String id;
	    private String userID;  // Foreign key (user_id)
	    private String roomID;  // Foreign key (room_id)
	    private String checkIn;
	    private String checkOut;
	    private String status;
	    private Integer totalPrice;
	    private String createdAt;
	    private String updatedAt;
	    private String userName;
		private String bookingType;

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




		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getUserID() {
			return userID;
		}
		public void setUserID(String userID) {
			this.userID = userID;
		}
		public String getRoomID() {
			return roomID;
		}
		public void setRoomID(String roomID) {
			this.roomID = roomID;
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

	@Override
	public String toString() {
		return "BookinginfoPojo{" +
				"id='" + id + '\'' +
				", userID='" + userID + '\'' +
				", roomID='" + roomID + '\'' +
				", checkIn='" + checkIn + '\'' +
				", checkOut='" + checkOut + '\'' +
				", status='" + status + '\'' +
				", totalPrice=" + totalPrice +
				", createdAt='" + createdAt + '\'' +
				", updatedAt='" + updatedAt + '\'' +
				'}';
	}
}
