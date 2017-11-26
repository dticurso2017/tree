package com.dafenube;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EventService;
import service.EventServiceImpl;

public class StartEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventService eventService = new EventServiceImpl();

	public StartEventServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		eventService.sendNotificationToAll();

	}

}
