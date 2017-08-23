package com.patrick.events.models;



import java.util.Date;
import java.util.List;

import javax.persistence.*;


import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="events")
public class Event {
	 	@Id
	    @GeneratedValue
	    private Long id;
	    private String name;
	    private String state;
	    private String location;
	    private String description;
	    @DateTimeFormat(pattern = "yyyy-MM-dd")
	    private Date date;
	    
	    @OneToMany(mappedBy="event", fetch = FetchType.LAZY)
	    private List<Message> messages;
		public List<Message> getMessages() {
			return messages;
		}

		public void setMessages(List<Message> messages) {
			this.messages = messages;
		}
	    
	    @ManyToMany(fetch = FetchType.LAZY)
	    @JoinTable(
	    	name = "users_events",
	    	joinColumns = @JoinColumn(name = "event_id"),
	    	inverseJoinColumns = @JoinColumn(name = "user_id")
	    )
	    private List<User> users;
	    
	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="user_id")
	    private User host;
		public User getHost() {
			return host;
		}

		public void setHost(User host) {
			this.host = host;
		}
		
	 
	    
	    public Event() {
	    	
	    }
	    
	    
	    public Long getId() {
			return id;
		}
	    
		public void setId(Long id) {
			this.id = id;
		}
		
		public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}
		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
		
		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}
		
		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}
		
		public List<User> getUsers(){
			return users;
		}
		
		public void setUsers(List<User> users) {
			this.users = users;
		}
		
		public void setDescription(String description) {
			this.description = description;
		}
		
		public String getDescription() {
			return description;
		}
		


	    

}
