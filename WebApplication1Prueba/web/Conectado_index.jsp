<%-- 
    Document   : Conectado_Desconectado
    Created on : 04-dic-2017, 11:52:22
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Página Principal</title>
    </head>
    <body>
        <div class="btn-group pull-right">
            <button class="btn btn-primary dropdown-toggle pull-right" type="button" data-toggle="dropdown">
                <span class="glyphicon glyphicon-th-list"></span>
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu dropdown-menu-right">
                <jsp:useBean id = "datosUsuario" scope="session" class = "DatosConexionBD.DatosUsuario">
                </jsp:useBean>
                <li><a>Bienvenido, 
                        <%=datosUsuario.getUser()%>
                </a></li>
                <li><a href="index.jsp">Salir</a></li>
            </ul>
        </div>
    </body>
</html>
