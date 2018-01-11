<%-- 
    Document   : prueba
    Created on : 04-dic-2017, 10:13:42
    Author     : salademo
--%>

<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.swing.JOptionPane"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/DefauldStyles.css" rel="stylesheet" type="text/css"/>
        <title>Error conexión</title>
    </head>
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
                Cookie username = new Cookie("username", usuario);
                response.addCookie(username);
                Thread.sleep(500);
                response.sendRedirect("Conectado_index.jsp");
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                request.setAttribute("error_login", "Usuario no existente");
                rd.include(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            request.setAttribute("error_login", "Error de conexion a la Base de Datos");
            rd.include(request, response);
        } finally {
            try {
                // Close the result sets and statements,
                // and the connection is returned to the pool
                if (register != null) {
                    register.close();
                    register = null;
                }
                if (myQuery != null) {
                    myQuery.close();
                    myQuery = null;
                }
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    <body>

    </body>
</html>
