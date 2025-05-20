package com.hotel.service;


import java.util.List;

import com.hotel.model.BookingTable;
import com.hotel.request.BookinginfoPojo;


public interface BookingService {

	BookingTable saveBookingData(BookinginfoPojo Bookingpojo);
	
	List<BookingTable> findAllBooking();
	
	BookingTable getBookingById(BookinginfoPojo bookingPojo);
	
    BookingTable updateBooking(BookinginfoPojo bookingPojo);
    
    boolean deleteBooking(BookinginfoPojo bookingPojo);

	List<BookingTable> findBookingHistory(String userID);

	public BookingTable saveBookingAgain(BookingTable booking);
}
