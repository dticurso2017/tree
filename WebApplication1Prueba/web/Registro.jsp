<%-- 
    Document   : prueba
    Created on : 11-dic-2017, 9:06:23
    Author     : User
--%>
<%@page import="java.text.*"%>
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
    </jsp:useBean>
    <%
        String usuario = request.getParameter("user_register");
        String password = request.getParameter("password_register");
        String email = request.getParameter("email_register");

        String url = "jdbc:mysql://10.0.0.110:3306/prueba";
        String user = "root";
        String pass = "root";
        Class.forName("com.mysql.jdbc.Driver");
        try {
            Connection myConn = DriverManager.getConnection(url, user, pass);
            
            String myQuerySearch = "SELECT * FROM usuarios WHERE user = ? OR email = ?";
            java.sql.PreparedStatement miConsultaSearch = myConn.prepareStatement(myQuerySearch);
            miConsultaSearch.setString(1, usuario);
            miConsultaSearch.setString(2, email);
            ResultSet registros = miConsultaSearch.executeQuery();
            
            if (registros.absolute(1)) {
                datosUsuario.setErrorRegistro("El usuario ya existe, intenta crear otro usuario");
                response.sendRedirect("index.jsp");
            } else {
                String myQueryInsert = "INSERT INTO usuarios (user, password, email) VALUES (?, ?, ?)";
                java.sql.PreparedStatement miConsultaInsert = myConn.prepareStatement(myQueryInsert);
                miConsultaInsert.setString(1, usuario);
                miConsultaInsert.setString(2, password);
                miConsultaInsert.setString(3, email);
                miConsultaInsert.executeUpdate();
                
                datosUsuario.setErrorLogin("");
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
