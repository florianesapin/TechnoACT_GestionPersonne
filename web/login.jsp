<%-- 
    Document   : login
    Created on : 6 janv. 2010, 14:19:14
    Author     : termine
--%>

<%@ include file="includes/plugins.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page - gestion des personnes (CRUD) </title>
    </head>
    <body background="images/fond3.jpg" style="background-repeat:no-repeat;background-attachment : fixed;background-size: cover;">

        <%-- Permet de faire disparaitre les alertes après 4 secondes--%>
        <script>
            window.setTimeout(function () {
                $(".alert_disparition").fadeTo(500, 0).slideUp(500, function () {
                    $(this).remove();
                });
            }, 4000);
        </script>

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <center>
                    <div class="login1">Gestion personne</div>
                    <div class="media">
                        <div class="media-left">
                            <img class="media-object" src="images/iconPersonne.png" height="250px" width="250px">
                        </div>
                </center>
                <br>
                <div class="panel panel-default login3">
                    <div class="panel-body login" >
                        <div class="login4" id="effect">Connexion</div>
                        <hr/>
                        <br>

                        <% if ((String) request.getAttribute("result") == "conn_err") {
                        %>
                        <div class="alert_disparition alert alert-danger" id="popup" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <strong>Connexion echoué! </strong> <p>Saisissez à nouveau vos données de connexion...</p>                            
                        </div>
                        <script>
                            $("#effect").effect("shake");
                        </script>
                        <%
                        }%>

                        <form method="POST" action="ServletLogin" class="login2">
                            <div class="input-group">
                                <span class="input-group-addon login6" id="basic-addon1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                                <input class="form-control input-lg login5" type="text" placeholder="Nom d'utilisateur" name="username">
                            </div>
                            <br>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon login6" id="basic-addon1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                                <input class="form-control input-lg login5" type="password" placeholder="Mot de passe" name="password">
                            </div>

                            <span class="glyphicon glyphicon-connect" aria-hidden="true"></span>
                            <br>
                            <center>
                                <button type="submit" value="login" class="btn btn-success btn-lg">
                                    <strong>Se connecter</strong> <span class="glyphicon glyphicon-log-in" aria-hidden="true"/>
                                </button>
                            </center>
                        </form>
                    </div>
                </div>
            </div>

        </div>



    </body>
</html>
