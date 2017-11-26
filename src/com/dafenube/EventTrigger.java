package com.dafenube;

import java.util.concurrent.TimeUnit;

public class EventTrigger {
	
	private Runnable job;
	private int initialDelay;
	private int period;
	private TimeUnit unit;
	
	public Runnable getJob() {
		return job;
	}
	public void setJob(Runnable job) {
		this.job = job;
	}
	public int getInitialDelay() {
		return initialDelay;
	}
	public void setInitialDelay(int initialDelay) {
		this.initialDelay = initialDelay;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public TimeUnit getUnit() {
		return unit;
	}
	public void setUnit(TimeUnit unit) {
		this.unit = unit;
	}
	
	

}
