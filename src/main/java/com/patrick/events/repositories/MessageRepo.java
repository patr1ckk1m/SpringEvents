package com.patrick.events.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.patrick.events.models.Message;

public interface MessageRepo extends CrudRepository<Message, Long>{
	List<Message> findAllByEvent_id(Long id);
}
