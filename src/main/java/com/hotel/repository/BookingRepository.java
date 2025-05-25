package com.hotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hotel.model.BookingTable;

import java.util.List;

public interface BookingRepository extends JpaRepository<BookingTable,String> {
    // BookingRepository.java
    List<BookingTable> findByUser_Id(String userId);


}
