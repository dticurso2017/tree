<%-- 
    Document   : prueba
    Created on : 11-dic-2017, 9:06:23
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.beans.Statement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/DefauldStyles.css" rel="stylesheet" type="text/css"/>
        <title>Error conexión</title>
    </head>

    <jsp:useBean id = "datosUsuario" scope="session" class = "DatosConexionBD.DatosUsuario">
    </jsp:useBean>
    <%
        String usuario = request.getParameter("user_register");
        String password = request.getParameter("password_register");
        String email = request.getParameter("email_register");

        Context initialContext = new InitialContext();

        Context environmentContext = (Context) initialContext.lookup("java:comp/env");

        DataSource dataSource = (DataSource) environmentContext.lookup("jdbc/TestDB");

        Connection conn = null;
        ResultSet register = null;
        PreparedStatement myQuery = null;

        try {
            conn = dataSource.getConnection();

            String myQuerySearchStr = "SELECT * FROM d_users WHERE user = ? OR email = ?";
            myQuery = conn.prepareStatement(myQuerySearchStr);
            myQuery.setString(1, usuario);
            myQuery.setString(2, email);
            register = myQuery.executeQuery();

            if (register.absolute(1)) {
                datosUsuario.setErrorRegistro("El usuario ya existe, intenta crear otro usuario");
                response.sendRedirect("index.jsp");
            } else {
                String myQueryInsertStr = "INSERT INTO d_users (user, password, email) VALUES (?, ?, ?)";
                myQuery = conn.prepareStatement(myQueryInsertStr);
                myQuery.setString(1, usuario);
                myQuery.setString(2, password);
                myQuery.setString(3, email);
                myQuery.executeUpdate();

                datosUsuario.setErrorLogin("");
                datosUsuario.setErrorRegistro("");
                Cookie username = new Cookie("username", usuario);
                response.addCookie(username);
                response.sendRedirect("Conectado_index.jsp");
            }
        } catch (Exception e) {
            datosUsuario.setErrorRegistro("Error de conexion a la Base de Datos");
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
