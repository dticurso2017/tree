<%-- 
    Document   : prueba
    Created on : 04-dic-2017, 10:13:42
    Author     : salademo
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/websocket_conexion.js"></script>
        <title>JSP Page</title>  
 </head>
  <%@ page import= "java.sql.*" %>
        
<%

String usuario = request.getParameter("user");
String password = request.getParameter("password");

// String url = "jdbc:mysql://localhost:3306/prueba";
//String user = "root";
//String pass = "";

String url = "jdbc:mysql://10.0.0.110:3306/dbernal";

String user = "root";
String pass = "root";



//carga dinámica de driver
Class.forName("com.mysql.jdbc.Driver");

try{
	Connection myConn = DriverManager.getConnection(url, user, pass);	
	
	String myQuery = "select * from usuarios where user = ? AND password = ?";
	
	java.sql.PreparedStatement miConsulta = myConn.prepareStatement(myQuery);
	miConsulta.setString(1, usuario);
 miConsulta.setString(2, password);
	
	ResultSet registros = miConsulta.executeQuery();
	String mensaje;
	if(registros.absolute(1)){
  mensaje="<script language='javascript'>alert('REGISTRADO');</script>";
  out.println(mensaje); 
	}	
	else{	
  mensaje="<script language='javascript'>alert('NO REGISTRADO');</script>";
  out.println(mensaje);
	}
 
}
catch(Exception e){
	out.println("Error de conexion");
	e.printStackTrace();
}

%>
 <body>
  
 </body>
</html>
