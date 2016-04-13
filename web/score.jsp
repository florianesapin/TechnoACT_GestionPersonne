<%-- 
    Document   : login
    Created on : 6 janv. 2010, 14:19:14
    Author     : termine
--%>


<%@page import="java.util.List"%>
<%@page import="MemoryUser.Resultat"%>
<%@page import="MemoryUser.Utilisateurs"%>
<%@ include file="includes/plugins.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Score - gestion des personnes (CRUD) </title>
    </head>
    <body> 
         <%@ include file="includes/menu.html" %>
        <div class="jumbotron">
            <div class="panel panel-info">
                <div class="panel-heading"><h3>Score - Gestion personne</h3></div>
            </div>
        </div>
        
        
        
      
 
      <% String username = request.getSession(true).getAttribute("username").toString();
         List<Resultat> podium = Utilisateurs.getPodium(username);
      
        if (podium != null) {
            for (Resultat resultat : podium) {
                out.println("<div class=\"col-sm-4\">");
                
                //affiche le score de l'utisateur connecté d'une autre couleur
                if(resultat.getUser().equals(request.getSession(true).getAttribute("username").toString())){
                    out.println("<div class=\"panel panel-warning\">");
                }else{
                    out.println("<div class=\"panel panel-success\">");
                }
                
                out.println("<div class=\"panel-heading\">");
                
                if(resultat.getRang() != 0){
                    out.println("<h2>" + "Rang : " + resultat.getRang() +"</h2>");
                    //out.println("<h1 class=\"panel-title\">" +"Rang: " + resultat.getRang() +"</h1>");
                }else{
                    out.println("<h2 class=\"panel-title\">" + "</h2>");
                }
                
                //affcihe user
                out.println("<h3><span class=\"glyphicon glyphicon-user\" aria-hidden=\"true\"></span> User : " + resultat.getUser()+ "</h3>");
                

                out.println("</div>");
                out.println("<div class=\"panel-body\">");
                //ici
                out.println("<h3>" + " Points:" + resultat.getPoints() + "</h3>");
                out.println("</div></div></div>");
                
                out.println();
            
        }
                   //    out.println("<tr><td>" + p.getNom() + "</td><td>" + p.getPrenom() + "</td><td>" + p.getAdresse() + "</td><td>" + p.getVille() + "</td><td><form method=\"POST\" action=\"ServletMAJPersonne\"><input type=\"hidden\" id=\"inputId\" name=\"id\" value=\"" + p.getId() + "\"><button type=\"submit\" class=\"btn btn-default\" id=\"edition\" onClick=\"modification()\">Edition</button></form></td><td><form method=\"POST\" action=\"ServletEffacerPersonne\"><input type=\"hidden\" id=\"inputId\" name=\"id\" value=\"" + p.getId() + "\"><button type=\"submit\" class=\"btn btn-default\" id=\"supprimer\" onClick=\"modification()\">Supprimer</button></form></td></tr>");
                            
                        }%>
                        
                        
                        
                     
                        
    </body>
</html>
