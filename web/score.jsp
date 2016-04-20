<%-- 
    Document   : score
    Created on : avril 2016
    Author     : stéphane
--%>

<%@page import="java.util.List"%>
<%@page import="MemoryUser.Resultat"%>
<%@page import="MemoryUser.Utilisateurs"%>
<%@include file="includes/plugins.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Score - gestion des personnes (CRUD) </title>      
    </head>

    <body background="images/fondScore.jpg" style="background-repeat:no-repeat; background-attachment:fixed; background-size:cover;">

        <%@ include file="includes/menu.html" %>

        <div class="page-header panel-default">
            <h1><font color="White">Score - Gestion personne</font></h1>
        </div>

        <% String username = request.getSession(true).getAttribute("username").toString();
            List<Resultat> podium = Utilisateurs.getPodium(username);

            if (podium != null) {
                for (Resultat resultat : podium) {
                    out.println("<div class=\"col-sm-4\">");

                    //affiche le score de l'utisateur connecté d'une autre couleur
                    if (resultat.getUser().equals(request.getSession(true).getAttribute("username").toString())) {
                        out.println("<div class=\"panel panel-warning\">");
                    } else {
                        out.println("<div class=\"panel panel-success\">");
                    }

                    out.println("<div class=\"panel-heading\">");

                    if (resultat.getRang() != 0) {
                        out.println("<h2>" + "Rang : " + resultat.getRang() + "</h2>");
                        //out.println("<h1 class=\"panel-title\">" +"Rang: " + resultat.getRang() +"</h1>");
                    } else {
                        out.println("<h2 class=\"panel-title\">" + "</h2>");
                    }

                    //affiche user
                    out.println("<h3><span class=\"glyphicon glyphicon-user\" aria-hidden=\"true\"></span> User : " + resultat.getUser() + "</h3>");

                    out.println("</div>");
                    out.println("<div class=\"panel-body\">");
                    out.println("<h3>" + " Points:" + resultat.getPoints() + "</h3>");
                    out.println("</div></div></div>");
                }
            }
        %>
        
        <div class="row col-md-12">
          <div>
            <h3><font color="White">Pour augmenter votre score:</font></h3>
            <p><font color="White">Créer une personne</font><p>
            <p><font color="White">Modifier une personne</font><p>
        </div>
       </div>

    </body>
</html>
