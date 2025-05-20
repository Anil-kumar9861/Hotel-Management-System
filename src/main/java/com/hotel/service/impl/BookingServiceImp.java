package com.hotel.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.hotel.request.RoominfoPojo;
import com.hotel.service.MailService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.model.BookingTable;
import com.hotel.model.Room;
import com.hotel.model.User;
import com.hotel.repository.BookingRepository;
import com.hotel.repository.RoomRepository;
import com.hotel.repository.UserRepository;
import com.hotel.request.BookinginfoPojo;
import com.hotel.service.BookingService;

@Service
public class BookingServiceImp implements BookingService{
	
	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private MailService mailService;

	@Override
	public BookingTable saveBookingData(BookinginfoPojo bookingPojo) {
		try {
			BookingTable bookingData = new BookingTable();
			BeanUtils.copyProperties(bookingPojo, bookingData);


			User user = null;
			if (bookingPojo.getUserID() != null) {
				 user = userRepository.findById(bookingPojo.getUserID())
						.orElseThrow(() -> new RuntimeException("User not found"));
				bookingData.setUser(user);
				bookingData.setUserName(user.getUserName());
				bookingData.setBookingType("ONLINE");
			} else {
				bookingData.setUser(null);
				bookingData.setBookingType("OFFLINE");
			}


			Room room = roomRepository.findById(bookingPojo.getRoomID())
					.orElseThrow(() -> new RuntimeException("Room not found"));
			bookingData.setRoom(room);


			room.setStatus("BOOKED");
			roomRepository.save(room);


			if (user != null) {
				mailService.sendBookingConfirmation(
						
						user.getEmail(),
						"Booking Confirmed",
						user.getUserName(),
						room.getRoomNumber(),
						bookingPojo.getCheckIn(),
						bookingPojo.getCheckOut()
				);
			}


			return bookingRepository.save(bookingData);

		} catch (Exception e) {
			e.printStackTrace(); // For debugging
			return null;
		}
	}


	public List<BookingTable> findAllBooking(){
		
		try {
			return bookingRepository.findAll();
		}
		catch(Exception e) {
			return null;
		}
	}



public BookingTable getBookingById(BookinginfoPojo bookingPojo) {
	
	try {
		
		Optional<BookingTable> bookingOpt = bookingRepository.findById(bookingPojo.getId());
		if (bookingOpt.isPresent()) {
			
			return bookingOpt.get();
			
		} else {
			
			return null ;
		}
		
	}catch (Exception e) {
		
		return null ;
	}
	
}

public BookingTable updateBooking(BookinginfoPojo bookingPojo) {
	try {
		Optional<BookingTable> bookingOpt = bookingRepository.findById(bookingPojo.getId());
		if (bookingOpt.isPresent()) {
			BookingTable bookingInstance = bookingOpt.get();
			
			 // Fetch User and Room entities from DB before setting them
	        User user = userRepository.findById(bookingPojo.getUserID())
	                     .orElseThrow(() -> new RuntimeException("User not found"));
	        Room room = roomRepository.findById(bookingPojo.getRoomID())
	                     .orElseThrow(() -> new RuntimeException("Room not found"));

			

	        // Set user and room in bookingInstance
	        bookingInstance.setUser(user);
	        bookingInstance.setRoom(room);
			
			
			bookingInstance.setCheckIn(bookingPojo.getCheckIn());
		    bookingInstance.setCheckOut(bookingPojo.getCheckOut());
			bookingInstance.setStatus(bookingPojo.getStatus());
			bookingInstance.setTotalPrice(bookingPojo.getTotalPrice());
			bookingInstance.setCreatedAt(bookingPojo.getCreatedAt());
			bookingInstance.setUpdatedAt(bookingPojo.getUpdatedAt());


			
			bookingInstance= bookingRepository.save(bookingInstance);
			return bookingInstance;
		} else {
		return null;
		}
		
	}catch (Exception e) {

      return null;
	}
}

public boolean deleteBooking(BookinginfoPojo bookingPojo) {

	try {
		Optional<BookingTable> bookingOpt = bookingRepository.findById(bookingPojo.getId());

		if (bookingOpt.isPresent()) {
			BookingTable bookingInstance = bookingOpt.get();
			Room room =bookingInstance.getRoom();

			Room roominfo = roomRepository.findById(room.getRoomid())
					.orElseThrow(() -> new RuntimeException("Room not found"));

			roominfo.setStatus("FREE");

			bookingRepository.delete(bookingInstance);
			return true;
		} else {
			return false ;
		}

	}catch (Exception e) {

		return false ;		}
}

	// BookingService.java
	public List<BookingTable> findBookingHistory(String userID) {
		try {
			return bookingRepository.findByUser_Id(userID);
		} catch (Exception e) {
			return null;
		}
	}

	public BookingTable saveBookingAgain(BookingTable booking) {
		try {
		 Room room =booking.getRoom();

		 Room roominfo = roomRepository.findById(room.getRoomid())
					.orElseThrow(() -> new RuntimeException("Room not found"));

		 roominfo.setStatus("FREE");
		 booking.setRoom(roominfo);

		 return bookingRepository.save(booking);
		} catch (Exception e) {
	 		e.printStackTrace();
			return null;
		}

	}

}