package com.hotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hotel.model.Room;
import com.hotel.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RoomRepository  extends JpaRepository<Room,String>{

    List<Room> findByStatus(String status);

    @Query("SELECT r FROM Room r WHERE r.status = 'FREE' " +
            "AND (:roomType IS NULL OR r.roomType = :roomType) " +
            "AND (:minPrice IS NULL OR r.pricePerNight >= :minPrice) " +
            "AND (:maxPrice IS NULL OR r.pricePerNight <= :maxPrice)")
    List<Room> findAvailableRoomsWithFilters(@Param("roomType") String roomType,
                                             @Param("minPrice") Integer minPrice,
                                             @Param("maxPrice") Integer maxPrice);



}
