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
        
        <link rel="shortcut icon" href="favicon.ico" />

    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/file-explore.css" rel="stylesheet" type="text/css">
    <link href="css/Global.css" rel="stylesheet" type="text/css"/>
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <script src="js/jquery/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/Tab.js" type="text/javascript"></script>
    <script src="js/file-explore.js" type="text/javascript"></script>

    <title>Página Principal</title>
  </head>

  <body>
    <div class="container-fluid">
      <div class="navbar navbar-defauld">
        
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
      <div class="row content">
        <div class="col-sm-3 sidenav">
          <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#333333;">
              <div class="panel-title" ">
                <a data-toggle="collapse" href="#Child1"  >
                  <span>ROOT / </span>
                </a>
              </div>
            </div>
            <ul class="list-group collapse" id="Child1">
              <li class="list-group-item Child1" style="background-color:#666666;">
                <a data-toggle="collapse" href="#Child1_1">
                  Child1
                </a>
                <ul id="Child1_1" class="collapse " >
                  <li class="list-group-item  btn-add-tab" style="background-color:#cccccc;">
                    <a>Child1_1</a>
                  </li>
                  <li class="list-group-item  btn-add-tab">
                    <a>Child1_2</a>
                  </li>
                  <li class="list-group-item btn-add-tab">
                    <a>Child1_3</a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6">
          <h4>APP</h4>
        </div>
      </div>
    </div>
    <script>
      $(document).ready(function () {
        $(".file-tree").filetree();
      });
    </script>
    <script type="text/javascript">

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-36251023-1']);
      _gaq.push(['_setDomainName', 'jqueryscript.net']);
      _gaq.push(['_trackPageview']);

      (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
      })();

    </script>

  </body>
</html>
