package com.dafenube;

public class MinJob implements Runnable {

	@Override
	public void run() {
		System.out.println("Job trigged by scheduler");
		
	}

}
