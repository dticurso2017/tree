<%-- 
    Document   : NuevoLoginRegister
    Created on : 13-dic-2017, 11:05:12
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--links-->
        <link rel="shortcut icon" href="favicon.ico" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <!--scripts-->
        <script src="js/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/index.js" type="text/javascript"></script>
        <script src="js/loading.js" type="text/javascript"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>

        <title>Página Inicial</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="#" class="active login-active" id="login-form-link">
                                        Login
                                    </a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="#" id="register-form-link">
                                        Registro de usuario
                                    </a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" action="Login.jsp" method="GET" role="form" style="display: block;">
                                        <p class="error-details"><%= (request.getAttribute("error_login") == null ? "" : request.getAttribute("error_login"))%></p>
                                        <div class="form-group">
                                            <input type="text" name="user" id="username" tabindex="1" class="form-control" placeholder="Inserta tu usuario" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Inserta tu contraseña" required>
                                        </div>
                                        <div class="form-group text-center">
                                            <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                            <label for="remember"> Recuerdame</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                                    <button id="cargando" class="btn btn-lg btn-warning"><span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span> Loading...</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="text-center">
                                                        <a href="https://phpoll.com/recover" tabindex="5" class="forgot-password">Olvidaste la contraseña?</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <meta name="google-signin-client_id" 
                                              content="215508450936-s45rubl83k8amm91p1qv0tbvmjrq6kkr.apps.googleusercontent.com">
                                        <div class="g-signin2" data-onsuccess="onSignIn" data-redirecturi="Conectado_index.jsp"></div>
                                        <script>
                                            function onSignIn(googleUser) {
                                                var profile = googleUser.getBasicProfile();
                                                console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                                                console.log('Name: ' + profile.getName());
                                                console.log('Image URL: ' + profile.getImageUrl());
                                                console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
                                                document.cookie = "username=" + profile.getName() + "; expires=0";
                                                window.location.replace("Conectado_index.jsp");
                                            }
                                        </script>
                                    </form>

                                    <form id="register-form" action="Registro.jsp" method="GET" role="form" style="display: none;">
                                        <p class="error-details"><%= (request.getAttribute("error_register") == null ? "" : request.getAttribute("error_register"))%></p>
                                        <div class="form-group">
                                            <input type="text" name="user_register" id="user_register" tabindex="1" class="form-control" placeholder="Inserta un usuario" value="" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="email_register" id="email_register" tabindex="1" class="form-control" placeholder="Inserta e-mail" value="" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password_register" id="password_register" tabindex="2" class="form-control" placeholder="Inserta una contraseña" 
                                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                                   title="Debe contener al menos un número, una letra mayúscula y una minúscula, y tener al menos 8 o más caracteres" 
                                                   required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="confirm_password_register" id="confirm_password_register" tabindex="2" class="form-control"
                                                   placeholder="Ponga la contraseña otra vez" required>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Registrarse">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
