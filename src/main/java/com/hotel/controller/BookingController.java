package com.hotel.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import com.hotel.service.InvoiceGenerator;
import com.hotel.service.impl.InvoiceGeneratorImpl;
import com.lowagie.text.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import com.hotel.model.BookingTable;
import com.hotel.request.BookinginfoPojo;
import com.hotel.service.BookingService;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
public class BookingController {
	
	@Autowired
	private BookingService bookingService;


	@RequestMapping("/managebooking")
	public String manageModal() {
		return "admin/Managebooking";
	}

	@RequestMapping("/addBooking")
	public String addBookingModal() {
		return "admin/modal/addBooking";
	}

	@RequestMapping("/updateBooking")
	public String updateBooking() {
		return "admin/modal/updateBooking";
	}

	@RequestMapping("/bookinghistory")
	public String viewhistory() {
		return "user/bookingHistory";
	}
	@RequestMapping(value="/createBooking" ,method=RequestMethod.POST)
	public ResponseEntity<?> bookingRoom(@RequestBody BookinginfoPojo booking){

		System.out.println(booking);
		
		BookingTable bookinginstance = bookingService.saveBookingData(booking);
		
		if (Objects.nonNull(bookinginstance)) {
			return new ResponseEntity<BookingTable>(bookinginstance, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
		}	
		
	}
	
	 @RequestMapping("/getAllBooking")
		public ResponseEntity<?> getAllBooking(){
			List<BookingTable> rooms = bookingService.findAllBooking();
			if(Objects.nonNull(rooms)) {
				return new ResponseEntity<List<BookingTable>>(rooms,HttpStatus.OK);
			}else {
				return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
			}
			
		}
	 
	 @RequestMapping(value = "/getBookingById_Ajax", method = RequestMethod.GET)
	    public ResponseEntity<?> getBooking(@RequestParam("id") String id){
	    	
	    	BookinginfoPojo bookingData =new BookinginfoPojo();
	    	bookingData.setId(id);
	    	BookingTable bookinginstance=bookingService.getBookingById(bookingData);
	    	
	    	if (Objects.nonNull(bookinginstance)) {
				return new ResponseEntity<BookingTable>(bookinginstance, HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
			}
	    		    	
	    }
	 
	 @RequestMapping(value = "/updateBooking_Ajax", method = RequestMethod.PUT)
	    public ResponseEntity<?> updateBooking(@RequestParam("id") String id,  @RequestBody BookinginfoPojo bookingData)throws Exception{
	    	
	    	bookingData.setId(id);
	    	
	    	BookingTable bookinginstance = bookingService.updateBooking(bookingData);
	    	
	    	if (Objects.nonNull(bookinginstance)) {
				return new ResponseEntity<BookingTable>(bookinginstance, HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
			}
	    }
	 
	 @RequestMapping(value = "/deleteBooking_Ajax", method = RequestMethod.GET)
		public ResponseEntity<?> deleteBooking(@RequestParam("id") String id) {

			BookinginfoPojo bookingData = new BookinginfoPojo();
			bookingData.setId(id);
			if (bookingService.deleteBooking(bookingData)) {
				return new ResponseEntity<Boolean>(true, HttpStatus.OK);
			} else {
				throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No Booking availabe in this ID");
			}
			
		}

	@RequestMapping("/getBookingHistory")
	public ResponseEntity<?> getBookingHistoryByUserId(@RequestParam("userID") String userID) {
		List<BookingTable> rooms = bookingService.findBookingHistory(userID);
		if (Objects.nonNull(rooms)) {
			return new ResponseEntity<List<BookingTable>>(rooms, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("No Booking Found for this user", HttpStatus.BAD_REQUEST);
		}
	}

	LocalDate currentDate = LocalDate.now();

	// In BookingController.java
	@RequestMapping(value = "/cancelBooking_Ajax", method = RequestMethod.POST)
	public ResponseEntity<Boolean> cancelBooking(@RequestParam("id") String id) {
		BookinginfoPojo bookingData = new BookinginfoPojo();
		bookingData.setId(id);

		BookingTable booking = bookingService.getBookingById(bookingData);
		if (booking != null) {

			//set status
			booking.setStatus("Cancelled");

			System.out.println(booking.getRoom());
			// Correct date setting
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			String formattedDate = LocalDateTime.now().format(formatter);

			booking.setUpdatedAt(formattedDate);
			bookingService.saveBookingAgain(booking); // create a method inside service to save updated booking
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		} else {
			return new ResponseEntity<Boolean>(false, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/admin/bookings/invoice/{id}", method = RequestMethod.GET)
	public void generateInvoice(@PathVariable String id, HttpServletResponse response) throws IOException, DocumentException {

		BookinginfoPojo bookingData = new BookinginfoPojo();
		bookingData.setId(id);

		BookingTable booking = bookingService.getBookingById(bookingData);

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=invoice_" + id + ".pdf");

		InvoiceGenerator invoiceGenerator = new InvoiceGeneratorImpl();

		invoiceGenerator.generate(response, booking);
	}




}
