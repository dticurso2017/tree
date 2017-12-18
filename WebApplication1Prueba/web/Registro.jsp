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
        PreparedStatement myQuerySearch = null;
        PreparedStatement myQueryInsert = null;

        try {
            conn = dataSource.getConnection();

            String myQuerySearchStr = "SELECT * FROM usuarios WHERE user = ? OR email = ?";
            myQuerySearch = conn.prepareStatement(myQuerySearchStr);
            myQuerySearch.setString(1, usuario);
            myQuerySearch.setString(2, email);
            register = myQuerySearch.executeQuery();

            if (register.absolute(1)) {
                datosUsuario.setErrorRegistro("El usuario ya existe, intenta crear otro usuario");
                response.sendRedirect("index.jsp");
            } else {
                String myQueryInsertStr = "INSERT INTO usuarios (user, password, email) VALUES (?, ?, ?)";
                myQueryInsert = conn.prepareStatement(myQueryInsertStr);
                myQueryInsert.setString(1, usuario);
                myQueryInsert.setString(2, password);
                myQueryInsert.setString(3, email);
                myQueryInsert.executeUpdate();

                datosUsuario.setErrorLogin("");
                datosUsuario.setErrorRegistro("");
                datosUsuario.setUser(usuario);
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
            if (myQuerySearch != null) {
                try {
                    myQuerySearch.close();
                } catch (SQLException e) {;
                }
                myQuerySearch = null;
            }
            if (myQueryInsert != null) {
                try {
                    myQueryInsert.close();
                } catch (SQLException e) {;
                }
                myQueryInsert = null;
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
