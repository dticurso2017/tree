package dao;

import java.util.Collection;

import com.dafenube.Event;

public interface EventDao {
	
	public void createEvent(Event event);
	
	
	public Event getEventById(Long id);
	
	public Collection<Event> getAllEvent();
	
	public void updateEvent(Event event);
	
	public void deleteEvent(Event event);
	
	

}
