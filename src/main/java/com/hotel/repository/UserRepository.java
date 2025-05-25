package com.hotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hotel.model.User;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

	User findByEmailAndPasswordAndRole(String email, String password,String role);
//
//	User findByUserNameAndPasswordAndEnabled(String email, String password, Integer enabled);



		User findByEmail(String email);
		User findByResetToken(String token);



}
