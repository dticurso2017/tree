<%-- 
    Document   : Conectado_Desconectado
    Created on : 04-dic-2017, 11:52:22
    Author     : User
--%>
<%@page import="tree.Node"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="tree.TreeDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="shortcut icon" href="favicon.ico" />
    
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/file-explore.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/tabsVertical.css" rel="stylesheet" type="text/css">
    <link href="css/w3.css" rel="stylesheet" type="text/css"/>
    <link href="css/DefauldStyles.css" rel="stylesheet" type="text/css"/>
    <link href="css/MobileStyles.css" rel="stylesheet" type="text/css"/>
    
    <!-- script -->
    <script src="js/jquery/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>
    <script src="js/Tab.js" type="text/javascript"></script>
    <script src="js/file-explore.js" type="text/javascript"></script>

    <title>Página Principal</title>
  </head>

  <body>
    <%
      TreeDB tree = new TreeDB();
      tree.buildTree();
    %>
    <div class="w3-sidebar w3-bar-block w3-collapse w3-card w3-animate-left" style="width:200px;" id="mySidebar">
      <button class="w3-bar-item w3-button w3-large w3-hide-large" onclick="w3_close()">Close &times;</button>
      <ul id="tab-list" class="nav nav-pills tabs-left" role="tablist">
        <li class="active"><a href="#tab1" role="tab" data-toggle="tab">Home</a></li>
      </ul>
    </div>
    <div class="w3-main" style="margin-left:200px">
      <div class="w3-teal">
        <div class="w3-container">
          <div class="nav">
            <li class="loggin-button">
              <button class="w3-button w3-teal w3-xlarge w3-hide-large pull-left" onclick="w3_open()">
                <li><span class="glyphicon glyphicon-menu-hamburger "></span></li>
              </button>
              <div class="btn-group pull-right">
                <button class="w3-button w3-teal w3-xlarge dropdown-toggle pull-right" data-toggle="dropdown">
                  <span class="glyphicon glyphicon-user"></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right">
                  <jsp:useBean id = "datosUsuario" scope="session" class = "DatosConexionBD.DatosUsuario">
                  </jsp:useBean>
                  <li class="dropdown-item"><a> <%=datosUsuario.getUser()%></a></li>
                  <li class="dropdown-item"><a href="index.jsp">Sign Out  <span class="glyphicon glyphicon-log-out "></span></a></li>
                </ul>
              </div>
            </li>
          </div>
        </div>
      </div>

      <div class="w3-container">
        <div class="tab-content">
          <div class="tab-pane active" id="tab1">
            <div id="tree" class="">
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
      function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
      }
      function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
      }
    </script>
    <script>
      //data to create the menu in treeview
      function getTree() {
        //data from db 
        var data = <%= TreeDB.getTreeString()%>;

        return data;
      }
      var tabID = 1;  //tab id

      //create the menu
      $('#tree').treeview({data: getTree(),
        enableLinks: true,
        levels: 1,
        showTags: true});
      //on node selected
      /**/ $('#tree').on('nodeSelected', function (e, node) {
        if (typeof node['nodes'] == "undefined") {

          //new tab
          tabID++;
          $('#tab-list').append($('<li><a href="#tab' + tabID + '" role="tab" data-toggle="tab">' + node.text + '&nbsp' + '&nbsp' + '&nbsp' + '<button class="close" type="button" title="Remove this page">×</button></a></li>'));

          //Content panel of the new tab
          $('<div class="tab-pane" id="tab' + tabID + '">' + node.text + '</div>').appendTo('.tab-content');
          //display new tab
          $('#home').tab('show');
          $('#tab-pane a:last').tab('show');


          //close tabs
          $('#tab-list').on('click', '.close', function () {
            var tabID = $(this).parents('a').attr('href');
            $(this).parents('li').remove();
            $(tabID).remove();

            //show the previous tab opened
            var tabLast = $('#tab-list a:last');
            tabLast.tab('show');
          });

        }
      });
    </script>
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