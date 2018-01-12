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
import javax.naming.Context;
import javax.naming.InitialContext;
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
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String usuario = request.getParameter("user_register");
        String password = request.getParameter("password_register");
        String email = request.getParameter("email_register");

        Context initialContext;
        Connection conn = null;
        ResultSet register = null;
        PreparedStatement myQuery = null;
        try {
            initialContext = new InitialContext();

            Context environmentContext = (Context) initialContext.lookup("java:comp/env");

            DataSource dataSource = (DataSource) environmentContext.lookup("jdbc/TestDB");

            conn = dataSource.getConnection();

            String myQuerySearchStr = "SELECT * FROM d_users WHERE user = ? OR email = ?";
            myQuery = conn.prepareStatement(myQuerySearchStr);
            myQuery.setString(1, usuario);
            myQuery.setString(2, email);
            register = myQuery.executeQuery();

            if (register.absolute(1)) {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                request.setAttribute("error_register", "Esa cuenta de usuario ya está en uso. Prueba con otra.");
                rd.include(request, response);
            } else {
                String myQueryInsertStr = "INSERT INTO d_users (user, password, email) VALUES (?, ?, ?)";
                myQuery = conn.prepareStatement(myQueryInsertStr);
                myQuery.setString(1, usuario);
                myQuery.setString(2, password);
                myQuery.setString(3, email);
                myQuery.executeUpdate();
                Cookie username = new Cookie("username", usuario);
                response.addCookie(username);
                Thread.sleep(500);
                response.sendRedirect("Conectado_index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            request.setAttribute("error_register", "Error de conexion a la Base de Datos");
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
