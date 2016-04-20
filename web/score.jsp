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

        <br/>

        <div>
            <center>
                <img src="images/score2.png" height="70px" width="460">
            </center>
        </div>
        <br/>
        <br/>

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
                        //affiche l'icone
                        if(resultat.getRang() == 1) {
                            out.println("<div><img class=\"centerImg\" src=\"images/coupe.png\" height=\"50px\" width=\"50px\"></div>");
                        }
                        if(resultat.getRang() == 2 || resultat.getRang() == 3) {
                            out.println("<div><img class=\"centerImg\" src=\"images/medaille.png\" height=\"50px\" width=\"50px\"></div>");
                        }
                        
                        //affiche le rang
                        out.println("<div><h2>" + "Rang : " + resultat.getRang() + "</h2></div>");
                        
                    } else {
                        out.println("<h2 class=\"panel-title\">" + "</h2>");
                    }

                    //affiche user
                    out.println("<h3><span class=\"glyphicon glyphicon-user\" aria-hidden=\"true\"></span> User : " + resultat.getUser() + "</h3>");
                    
                    //affiche points
                    out.println("</div>");
                    out.println("<div class=\"panel-body\">");
                    out.println("<h3>" + " Points : " + resultat.getPoints() + "</h3>");
                    out.println("</div></div></div>");
                }
            }
        %>

        <div class="row col-md-12 infoScore">
            <div>
                <h3 class="titreInfoScore">Pour augmenter votre score, vous pouvez...</h3>
                <div class="infoScore">
                    <div class="col-md-3">
                        <p>Créer une personne<p>
                    </div>  
                    <div class="col-md-9">
                        <p>5 points<p>
                    </div>
                    <div class="col-md-3">
                        <p>Modifier une personne<p>
                    </div>  
                    <div class="col-md-9">
                        <p>2 points<p>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
