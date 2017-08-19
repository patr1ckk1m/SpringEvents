package com.patrick.events.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.patrick.events.models.Event;

@Repository
public interface EventRepo extends CrudRepository<Event, Long>{

}
