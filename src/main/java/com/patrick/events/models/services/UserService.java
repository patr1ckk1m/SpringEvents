package com.patrick.events.models.services;

import java.util.List;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.patrick.events.models.Event;
import com.patrick.events.models.User;
import com.patrick.events.repositories.EventRepo;
import com.patrick.events.repositories.MessageRepo;
import com.patrick.events.repositories.UserRepo;

@Service
public class UserService {
	private UserRepo userRepo;
	private EventRepo eventRepo;
	private MessageRepo messageRepo;
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public UserService(MessageRepo messageRepo, UserRepo userRepo, EventRepo eventRepo, BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.userRepo = userRepo;
		this.eventRepo = eventRepo;
		this.messageRepo = messageRepo;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}
	
	public void saveUser(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		userRepo.save(user);
	}
	
	public void saveEvent(Event event) {
		eventRepo.save(event);
	}
	
	public User findByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
	public List<User> allUsers(){
		return (List<User>) userRepo.findAll();
	}
	
	public List<Event> allEvents(){
		return (List<Event>) eventRepo.findAll();
	}
	
	public Event findOneEvent(Long id) {
		return eventRepo.findOne(id);
	}
	
	public void deleteEvent(Long id) {
		messageRepo.delete(messageRepo.findAllByEvent_id(id));
		eventRepo.delete(id);
	}
}
