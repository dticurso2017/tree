/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author User
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String usuario = request.getParameter("user");
        String password = request.getParameter("password");

        Context initialContext;
        Connection conn = null;
        ResultSet register = null;
        PreparedStatement myQuery = null;
        try {
            initialContext = new InitialContext();

            Context environmentContext = (Context) initialContext.lookup("java:comp/env");

            DataSource dataSource = (DataSource) environmentContext.lookup("jdbc/TestDB");

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
                request.setAttribute("error_login", "Acceso denegado - Nombre de usuario o contraseña incorrectos.");
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

    }

}
