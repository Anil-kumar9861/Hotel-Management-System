package com.hotel.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import com.hotel.model.Room;
import com.hotel.request.RoominfoPojo;
import com.hotel.service.RoomService;



@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;

	@RequestMapping("/showRoom")
	public String rooms() {
		return "Hotel_Miranda/Rooms";
	}

	@RequestMapping("/addRoom")
	public String addRoomModal() {
		return "admin/modal/room";
	}


	@RequestMapping("/bookForm")
	public String bookingForm() {
		return "user/modal/U-BookingForm";
	}
	@RequestMapping("/managerooms")
	public String manageModal() {
		return "admin/Manageroom";
	}

	@RequestMapping("/viewRooms")
	public String viewRoom() {
		return "user/U-viewroom";
	}

	@RequestMapping("/updateRoom")
	public String updateRoom() {
		return "admin/modal/updateRoom";
	}

	@RequestMapping(value="/filterRooms" ,method=RequestMethod.GET)
	@ResponseBody
	public List<Room> filterRooms(
			@RequestParam(required = false) String roomType,
			@RequestParam(required = false) Integer minPrice,
			@RequestParam(required = false) Integer maxPrice) {

		return roomService.getFilteredRooms(roomType, minPrice, maxPrice);
	}


	@RequestMapping(value="/createRoom" ,method=RequestMethod.POST)
	public ResponseEntity<?> createRoom(@RequestBody RoominfoPojo room){

		System.out.println(room);
		
		Room roominstance = roomService.saveRoomData(room);
		
		if (Objects.nonNull(roominstance)) {
			return new ResponseEntity<Room>(roominstance, HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
		}	
		
	}

	@RequestMapping("/getAvaRooms")
	public ResponseEntity<?> getAvaRoom(){
		List<Room> rooms = roomService.getAvailableRooms();
		if(Objects.nonNull(rooms)) {
			return new ResponseEntity<List<Room>>(rooms,HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
		}

	}
	    @RequestMapping("/getAllRooms")
		public ResponseEntity<?> getAllRoom(){
			List<Room> rooms = roomService.findAllRooms();
			if(Objects.nonNull(rooms)) {
				return new ResponseEntity<List<Room>>(rooms,HttpStatus.OK);
			}else {
				return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
			}
			
		}
	    
	    @RequestMapping(value = "/getRoomById_Ajax", method = RequestMethod.GET)
	    public ResponseEntity<?> getRoom(@RequestParam("id") String id){
	    	
	    	RoominfoPojo roomData =new RoominfoPojo();
	    	roomData.setId(id);
	    	Room roominstance=roomService.getRoomById(roomData);
	    	
	    	if (Objects.nonNull(roominstance)) {
				return new ResponseEntity<Room>(roominstance, HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
			}
	    		    	
	    }
	    
	    @RequestMapping(value = "/updateRoom_Ajax", method = RequestMethod.PUT)
	    public ResponseEntity<?> updateRoom(@RequestParam("id") String id,@RequestBody RoominfoPojo roomData)throws Exception{
	    	
	    	roomData.setId(id);
	    	
	    	Room roominstance = roomService.updateRoom(roomData);
	    	
	    	if (Objects.nonNull(roominstance)) {
				return new ResponseEntity<Room>(roominstance, HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("Not save", HttpStatus.BAD_REQUEST);
			}
	    }
	    
	    @RequestMapping(value = "/deleteRoom_Ajax", method = RequestMethod.GET)
		public ResponseEntity<?> deleteRoom(@RequestParam("id") String id) {

			RoominfoPojo roomData = new RoominfoPojo();
			roomData.setId(id);
			if (roomService.deleteRoom(roomData)) {
				return new ResponseEntity<Boolean>(true, HttpStatus.OK);
			} else {
				throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No Room availabe in this ID");
			}
			
		}
	}


