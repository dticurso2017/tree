package com.dafenube;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class BackgroundJobManager implements ServletContextListener {
	
	private ScheduledExecutorService scheduler;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		scheduler.shutdown();
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		//buscar cuantos jobs hay en la base
		//crear scheduler de acuerdo con el numero de jobs
		//iterate por el array de jobs y hacer el scheduleAtFixedRate
		
		scheduler = Executors.newSingleThreadScheduledExecutor();
		scheduler.scheduleAtFixedRate(new MinJob(), 0, 1, TimeUnit.SECONDS);
		
	}

}
