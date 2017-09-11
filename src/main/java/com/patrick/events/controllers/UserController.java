package com.patrick.events.controllers;

import java.security.Principal;

import javax.validation.Valid;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.patrick.events.models.Event;
import com.patrick.events.models.Message;
import com.patrick.events.models.User;
import com.patrick.events.models.services.UserService;
import com.patrick.events.validators.UserValidator;

@Controller
public class UserController {
	private UserValidator userValidator;
	
	private UserService userService;
	
	public UserController(UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
	}
	
	@RequestMapping("/login")
	public String loginAndReg(@Valid @ModelAttribute("user") User user, @RequestParam(value="error", required = false) String error, @RequestParam(value = "logout", required = false) String logout, Model model) {
		if(error!=null) {
			model.addAttribute("errorMessage", "Invalid credentials, please try again");
		}
		if(logout!=null) {
			model.addAttribute("logoutMessage", "Logout successful!!");
		}
		return "loginPage.jsp";
	}
	
	@PostMapping("/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "redirect:/login";
		}
		userService.saveUser(user);
		return "redirect:/events";
	}
	
	@RequestMapping(value = {"/", "/events"})
	public String home(Principal principal, Model model, @Valid @ModelAttribute("event") Event event, BindingResult result) {
		String email = principal.getName();
		model.addAttribute("currentUser", userService.findByEmail(email));
		model.addAttribute("events", userService.allEvents());
		return "eventPage.jsp";
	}
	
	@PostMapping("/addevent")
	public String newEvent(@ModelAttribute("event") Event event, BindingResult result, Principal principal) {
		
		userService.saveEvent(event);
		
		return "redirect:/events";
	}
	
	@RequestMapping("/events/{id}")
	public String specificEvent(@PathVariable("id") Long id, Model model, @ModelAttribute("message") Message message, BindingResult result, @ModelAttribute("event") Event event, Principal principal) {
		model.addAttribute("event", userService.findOneEvent(id));
		return "oneEvent.jsp";
	}
	
	@PostMapping("/message")
	public String newMessage(@ModelAttribute("message") Message message, BindingResult result) {
		userService.saveMessage(message);
		return "redirect:/events/" + message.getEvent().getId();
	}
	
	@RequestMapping("/delete/{id}")
	public String deleteEvent(@PathVariable(value = "id") Long id) {
		userService.deleteEvent(id);
		return "redirect:/events";
	}
	
	@RequestMapping("/events/{id}/edit")
	public String editEvent(@PathVariable(value="id") Long id, Model model, @ModelAttribute("event") Event event, BindingResult result, Principal principal) {
		String email = principal.getName();
		if(userService.findByEmail(email).getId() != userService.findOneEvent(id).getHost().getId()) {
			return "redirect:/events";
		}
		model.addAttribute("event", userService.findOneEvent(id));
		return "edit.jsp";
	}
	
	@PostMapping("/event/{id}/edit")
	public String newEvent(@PathVariable(value="id") Long id, @ModelAttribute("event") Event newEvent, BindingResult result, Principal principal) {
		userService.editEvent(id, newEvent);
		return "redirect:/events";
	}

	@RequestMapping("/join/{id}")
	public String joinEvent(@PathVariable(value="id") Long id, Principal principal) {
		userService.joinEvent(id, userService.findByEmail(principal.getName()).getId());
		return "redirect:/events";
	}
	
	@RequestMapping("/cancel/{id}")
	public String cancelEvent(@PathVariable(value="id") Long id, Principal principal) {
		userService.cancelEvent(id, userService.findByEmail(principal.getName()).getId());
		return "redirect:/events";
	}
	
	@RequestMapping("/users/{id}")
	public String specificUser(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.findOneUser(id));
		return "oneUser.jsp";
	}
	
}
