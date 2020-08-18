package com.bfsc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bfsc.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);
}
