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
  <div class="container-fluid-caja">  
   <div class="navbar navbar-default" role="navigation">
    <div class="container-cabecera">
     <div class="row">
      <ul class="nav navbar-nav navbar-right">
      <li class="dropdown loggin-button">
       <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <span class="glyphicon glyphicon-th-list icon-size"></span>
       </a>
       <ul class="dropdown-menu">
        <jsp:useBean id = "datosUsuario" scope="session" class = "DatosConexionBD.DatosUsuario">
        </jsp:useBean>
        <li><a> <%=datosUsuario.getUser()%></a></li>
        <li><a href="index.jsp">Sign Out  <span class="glyphicon glyphicon-log-out "></span></a></li>
       </ul>
      </li>
     </ul>
      <div class="col-md-12">
       <!-- Nav tabs -->
       <ul id="tab-list" class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#section1" role="tab" data-toggle="tab">Tab 1</a></li>
       </ul>
      </div>
     </div>
     
    </div>
   </div> 
   <div class="row content-caja">
    <div class="col-sm-3 sidenav">
     <h4>\ TREE</h4>
     <ul class="nav nav-pills nav-stacked">
      <li class="active"><a  data-toggle="tab" href="#section1">Introducció als TreeView</a></li>
      <li><a data-toggle="tab" href="#section2">--> Tree 1</a></li>
      <li><a data-toggle="tab" href="#section3">--> Tree 2</a></li>
      <li><a data-toggle="tab" href="#section4">--> Tree 3</a></li>
     </ul><br>     
    </div>
    <div class="col-sm-9">
     <div class="tab-content">
      <div class="tab-pane fade in active" id="section1"><p>Vista de árbol (tree view en inglés) es un elemento de interfaz gráfica de usuario (widget) que presenta una vista jerárquica de información. Cada elemento (a menudo llamado rama o nodo) puede tener una serie de sub elementos. Esta puede ser visualizada como tabulado en una lista. Un elemento puede revelar sub elementos.

        Los tree view se ven a menudo en un administrador de archivos de aplicaciones, donde permite al usuario navegar por el sistema de archivos de directorios. También se utilizan para presentar datos jerárquicos, como un documento XML. Tree view es el componente principal de una aplicación outliner.</p></div>
     </div>
     
    </div>
   </div>
  </div>
 </body>
</html>
