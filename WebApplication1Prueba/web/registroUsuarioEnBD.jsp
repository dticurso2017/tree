<%-- 
    Document   : prueba
    Created on : 11-dic-2017, 9:06:23
    Author     : User
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
        <title>JSP Page</title>  
    </head>
    <%@ page import= "java.sql.*" %>
    <jsp:useBean id = "datosUsuario" scope="session" class = "DatosConexionBD.DatosUsuario">
        <jsp:setProperty name = "datosUsuario" property = "*"/>
    </jsp:useBean>
    <%
        String usuario = request.getParameter("user");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        String url = "jdbc:mysql://10.0.0.110:3306/prueba";
        String user = "root";
        String pass = "root";
        Class.forName("com.mysql.jdbc.Driver");
        try {
            Connection myConn = DriverManager.getConnection(url, user, pass);

            String myQuery = "select * from usuarios where user = ? AND password = ? AND email = ?";

            java.sql.PreparedStatement miConsulta = myConn.prepareStatement(myQuery);
            miConsulta.setString(1, usuario);
            miConsulta.setString(2, password);
            miConsulta.setString(3, email);

            ResultSet registros = miConsulta.executeQuery();
            if (registros.absolute(1)) {
                out.println("Usuario ya existente");
            } else {
                String myQueryInsert = "INSERT INTO usuarios (user, password, email) VALUES (?, ?, ?)";
                java.sql.PreparedStatement miConsulta2 = myConn.prepareStatement(myQueryInsert);
                miConsulta2.setString(1, usuario);
                miConsulta2.setString(2, password);
                miConsulta2.setString(3, email);
                miConsulta2.executeUpdate();
                response.sendRedirect("./Conectado_index.jsp");
            }

        } catch (Exception e) {
            out.println("Error de conexion");
            e.printStackTrace();
        }
    %>
    <body>
        <br>
        <a href="./index.jsp"><input type="button" value="Volver al Log in"/></a>
    </body>
</html>
