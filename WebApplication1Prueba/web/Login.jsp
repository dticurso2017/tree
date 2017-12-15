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
        <title>Error conexión</title>
    </head>

    <%@ page import= "java.sql.*" %>
    <jsp:useBean id = "datosUsuario" scope="session" class = "DatosConexionBD.DatosUsuario">
    </jsp:useBean>
    <%

        String usuario = request.getParameter("user");
        String password = request.getParameter("password");

        String url = "jdbc:mysql://10.0.0.110:3306/prueba";
        String user = "root";
        String pass = "root";
        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection myConn = DriverManager.getConnection(url, user, pass);

            String myQuery = "SELECT * FROM usuarios WHERE user = ? AND password = ?";

            java.sql.PreparedStatement miConsulta = myConn.prepareStatement(myQuery);
            miConsulta.setString(1, usuario);
            miConsulta.setString(2, password);

            ResultSet registros = miConsulta.executeQuery();
            if (registros.absolute(1)) {
                datosUsuario.setErrorLogin("");
                datosUsuario.setErrorRegistro("");
                datosUsuario.setUser(usuario);
                response.sendRedirect("Conectado_index.jsp");
            } else {
                datosUsuario.setErrorLogin("Usuario no existente");
                response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            datosUsuario.setErrorLogin("Error de conexion a la Base de Datos");
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }

    %>
    <body>

    </body>
</html>
