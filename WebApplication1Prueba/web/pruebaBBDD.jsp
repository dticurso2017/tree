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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Error conexión</title>  
    </head>
    <%@ page import= "java.sql.*" %>
    <jsp:useBean id = "datosUsuario" scope="session" class = "DatosConexionBD.DatosUsuario">
        <jsp:setProperty name = "datosUsuario" property = "*"/>
    </jsp:useBean>
    <%

        String usuario = request.getParameter("user");
        String password = request.getParameter("password");

        String url = "jdbc:mysql://10.0.0.110:3306/prueba";
        String user = "root";
        String pass = "";
        /*
    String url = "jdbc:mysql://10.0.0.110:3306/dbernal";

    String user = "root";
    String pass = "root";
         */

        //carga dinámica de driver
        Class.forName("com.mysql.jdbc.Driver");

        try {
            Connection myConn = DriverManager.getConnection(url, user, pass);

            String myQuery = "select * from usuarios where user = ? AND password = ?";

            java.sql.PreparedStatement miConsulta = myConn.prepareStatement(myQuery);
            miConsulta.setString(1, usuario);
            miConsulta.setString(2, password);

            ResultSet registros = miConsulta.executeQuery();
            String mensaje;
            if (registros.absolute(1)) {
                mensaje = "<script language='javascript'>alert('REGISTRADO');</script>";
                out.println(mensaje);
                response.sendRedirect("./Conectado_index.jsp");
            } else {
                mensaje = "<script language='javascript'>alert('NO REGISTRADO');</script>";
                out.println(mensaje);
            }

        } catch (Exception e) {
            //.println("Error de conexion");
            e.printStackTrace();
        }

    %>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="error-template">
                        <h1>
                            Vaya!!</h1>
                        <h2>
                            Error de conexión con la BBDD</h2>
                        <div class="error-details">
                            La conexión ha fallado
                        </div>
                        <div class="error-actions">
                            <a href="index.jsp" class="btn btn-primary btn-lg">
                                <span class="glyphicon glyphicon-home"></span>
                                Vuelve a la página </a>
                            <a href="https://support.google.com/?hl=es" class="btn btn-default btn-lg">
                                <span class="glyphicon glyphicon-envelope"></span>
                                Contactar a Soporte</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
