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
        <link href="Global.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Página Principal</title>
    </head>
    <body>
      <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container"> 
        <div class="navbar-header">
           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span> 
            </button>
        </div>
        <div class="collapse navbar-collapse pull-right"></div>
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               <span class="glyphicon glyphicon-th-list icon-size"></span>
            </a>
            <ul class="dropdown-menu">
              <jsp:useBean id = "datosUsuario" scope="session" class = "DatosConexionBD.DatosUsuario">
                </jsp:useBean>
              <li><a><%=datosUsuario.getUser()%></a></li>
              <li><a href="index.jsp">Sign Out  <span class="glyphicon glyphicon-log-out "></span></a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>        
    </body>
</html>
