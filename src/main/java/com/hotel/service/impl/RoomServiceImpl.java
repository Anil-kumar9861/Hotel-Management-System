package com.hotel.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.model.Room;
import com.hotel.repository.RoomRepository;
import com.hotel.request.RoominfoPojo;
import com.hotel.service.RoomService;


@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomRepository roomrepository;
	
	
	public Room saveRoomData(RoominfoPojo roomPojo) {
		
		try {
			Room roomData = new Room();
			BeanUtils.copyProperties(roomPojo, roomData);
			return roomrepository.save(roomData);
			
		}catch (Exception e) {

          return null;
		}
	}

	public List<Room> getAvailableRooms() {
		return roomrepository.findByStatus("FREE");
	}


	public List<Room> findAllRooms(){
		
		
		try {
			return roomrepository.findAll();
		}
		catch(Exception e) {
			return null;
		}
	}
	
public Room getRoomById(RoominfoPojo roomPojo) {
		
		try {
			
			Optional<Room> roomOpt = roomrepository.findById(roomPojo.getId());
			if (roomOpt.isPresent()) {
				
				return roomOpt.get();
				
			} else {
				
				return null ;
			}
			
		}catch (Exception e) {
			
			return null ;
		}
		
	}


public Room updateRoom(RoominfoPojo roomPojo) {
	try {
		Optional<Room> roomOpt = roomrepository.findById(roomPojo.getId());
		if (roomOpt.isPresent()) {
			Room roomInstance = roomOpt.get();
			roomInstance.setRoomNumber(roomPojo.getRoomNumber());
			roomInstance.setRoomType(roomPojo.getRoomType());
			roomInstance.setStatus(roomPojo.getStatus());
			roomInstance.setPricePerNight(roomPojo.getPricePerNight());
			roomInstance.setCreatedAt(roomPojo.getCreatedAt());
			roomInstance.setUpdatedAt(roomPojo.getUpdatedAt());
			roomInstance.setBedType(roomPojo.getBedType());
			roomInstance.setRoomImage(roomPojo.getRoomImage());
			roomInstance.setFacilities(roomPojo.getFacilities());
			
			roomInstance= roomrepository.save(roomInstance);
			return roomInstance;
		} else {
		return null;
		}
		
	}catch (Exception e) {

      return null;
	}
}

public boolean deleteRoom(RoominfoPojo roomPojo) {
	
	try {
		Optional<Room> roomOpt = roomrepository.findById(roomPojo.getId());
		
		if (roomOpt.isPresent()) {
			Room roomInstance = roomOpt.get();
			roomrepository.delete(roomInstance);
			return true;
		} else {
			return false ;
		}
		
	}catch (Exception e) {

		return false ;		}
}

	public  List<Room> getFilteredRooms(String roomType, Integer minPrice, Integer maxPrice) {
		return roomrepository.findAvailableRoomsWithFilters(roomType, minPrice, maxPrice);
	}

}
