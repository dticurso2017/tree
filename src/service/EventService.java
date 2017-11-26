package service;

import java.util.List;

import com.dafenube.Event;

public interface EventService {
	
	public void sendNotificationToDevices(List<String> ids);
	public void cancelEventNotification(Event event);
	public void sendNotificationToAll();
	
	

}
