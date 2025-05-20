package com.hotel.service;

import java.util.List;

import com.hotel.model.Room;
import com.hotel.request.RoominfoPojo;


public interface RoomService {

	Room saveRoomData(RoominfoPojo Roompojo);
	
	List<Room> findAllRooms();
	
	Room getRoomById(RoominfoPojo roomPojo);
	
	Room updateRoom(RoominfoPojo roomPojo);
	
	boolean deleteRoom(RoominfoPojo userPojo);

	 List<Room> getAvailableRooms();
	  List<Room> getFilteredRooms(String roomType, Integer minPrice, Integer maxPrice);
}
