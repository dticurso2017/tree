package com.dafenube;

public class Event {

	enum EventType {
		LINEAR, REGULAR, SYSTEM;
	}
	
	
	private EventTrigger trigger;
	private Event[] sons = new Event[2];
	private EventType type;
	
	public EventTrigger getTrigger() {
		return trigger;
	}
	public void setTrigger(EventTrigger trigger) {
		this.trigger = trigger;
	}
	public Event[] getSons() {
		return sons;
	}
	public void setSons(Event[] sons) {
		this.sons = sons;
	}
	public EventType getType() {
		return type;
	}
	public void setType(EventType type) {
		this.type = type;
	}
	
	

}
