<%-- 
    Document   : prueba
    Created on : 04-dic-2017, 10:13:42
    Author     : salademo
--%>

<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.beans.Statement"%>

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

        Context initialContext = new InitialContext();

        Context environmentContext = (Context) initialContext.lookup("java:comp/env");

        DataSource dataSource = (DataSource) environmentContext.lookup("jdbc/TestDB");

        Connection conn = null;
        ResultSet register = null;
        PreparedStatement myQuery = null;
        try {

            conn = dataSource.getConnection();

            String myQueryStr = "SELECT * FROM d_users WHERE user = ? AND password = ?";

            myQuery = conn.prepareStatement(myQueryStr);
            myQuery.setString(1, usuario);
            myQuery.setString(2, password);

            register = myQuery.executeQuery();
            if (register.absolute(1)) {
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
        } finally {
            // Close the result sets and statements,
            // and the connection is returned to the pool
            if (register != null) {
                try {
                    register.close();
                } catch (SQLException e) {;
                }
                register = null;
            }
            if (myQuery != null) {
                try {
                    myQuery.close();
                } catch (SQLException e) {;
                }
                myQuery = null;
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {;
                }
                conn = null;
            }
        }

    %>
    <body>

    </body>
</html>
