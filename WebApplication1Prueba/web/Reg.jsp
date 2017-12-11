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

        <div id="box1">
            
            <h1>Nuevo usuario</h1>
            <form action = "Reg.jsp" method = "GET">
                <input type="text" placeholder="Inserta nuevo usuario" name="usuario"/>
                <input type="password" placeholder="Inserta nueva contraseña" name="pass"/>
                <input type="text" placeholder="Inserta e-mail" name="email"/>
                <input type="button" name="boton" value="Aceptar"/>
                <input type="button" name="boton2" value="Cancelar" onclick='javascript:history.go(-1);'/>
            </form>
        </div>
    </body>
</html>
