<%-- 
    Document   : Reg
    Created on : 05-dic-2017, 10:36:27
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="./style.css" media="all" />
    </head>
    <style type="text/css">
        .error-details {
            color: red;
        }

    </style>
    <div id="box1">
        <h1>Nuevo usuario</h1>
        <jsp:useBean id = "datosUsuario" scope="session" class = "DatosConexionBD.DatosUsuario">
        </jsp:useBean>
        <p class="error-details"><%=datosUsuario.getError()%></p>
        <form action = "registroUsuarioEnBD.jsp" method = "GET">
            <input type="text" placeholder="Inserta nuevo usuario" name="user"/>
            <input type="password" placeholder="Inserta nueva contraseña" name="password"/>
            <input type="text" placeholder="Inserta e-mail" name="email"/>
            <input type="submit" value="Aceptar"/>
            <input type="button" value="Cancelar" onclick='javascript:history.go(-1);'/>
        </form>
    </div>
</body>
</html>
