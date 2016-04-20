<%-- 
    Document   : footer
    Created on : Apr 13, 2016, 12:22:07 PM
    Author     : floriane.sapin
--%>

<%@page import="MemoryUser.Utilisateurs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
            </div>
            <div class="col-md-4 center-block">
                <p id="userConnecte"><% out.println("Utilisateur connecté: " + request.getSession().getAttribute("username").toString());%></p>
            </div>
        </div>
    </div>
</nav>
