<%-- 
    Document   : prueba
    Created on : 11-dic-2017, 9:06:23
    Author     : User
--%>
<%@page import="java.text.*"%>
<%@page import="org.eclipse.jdt.internal.compiler.batch.*"%>
<%@page import="javax.lang.model.element.*"%>
<%@page import="javax.swing.text.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>  
    </head>
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

            if (usuario.equals("") || password.equals("") || email.equals("")) {
                datosUsuario.setErrorRegistro("Los datos no pueden estar vacios");
                response.sendRedirect("index.jsp");
            } else {
                String myQueryInsert = "INSERT INTO usuarios (user, password, email) VALUES (?, ?, ?)";
                java.sql.PreparedStatement miConsulta = myConn.prepareStatement(myQueryInsert);
                miConsulta.setString(1, usuario);
                miConsulta.setString(2, password);
                miConsulta.setString(3, email);
                miConsulta.executeUpdate();
                datosUsuario.setErrorRegistro("");
                datosUsuario.setUser(usuario);
                response.sendRedirect("Conectado_index.jsp");
            }
        } catch (Exception e) {
            datosUsuario.setErrorRegistro("Error de conexion a la Base de Datos");
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
    %>
    <body>
        
    </body>
</html>
