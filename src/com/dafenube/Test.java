package com.dafenube;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Test() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.print("La request ha llegado");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter salida = resp.getWriter();
		salida.println("<html><body>");
		salida.println("<h1 style='color:red;text-align:center'>Primer Servlet</h1>");
		salida.println("<br/>");
		salida.println("<p>Nombre introducido:" + req.getParameter("nom") + "</p>");
		salida.println("<p>Apellido introducido:" + req.getParameter("apell") + "</p>");
		salida.println("</body></html>");
		salida.close();
	}
	
	

}
