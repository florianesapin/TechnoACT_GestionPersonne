<%-- 
    Document   : gestionPersonne
    Created on : Mar 28, 2016, 11:49:46 AM
    Author     : floriane.sapin
--%>

<%@page import="Model.Personne"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="includes/plugins.html" %>
        <script><%@ include file="includes/scriptjs.js" %></script>     
    </head>


    <body onLoad="<%if ((String) request.getAttribute("result") == "BeforeMAJ") {%> masqueCreer() <%}else{%> masqueMAJ()<%}%>">
       
        <%@ include file="includes/menu.html" %>
        
        <% if ((String) request.getAttribute("result") == "BeforeMAJ") {%>
        <script type="text/javascript">
            masqueCreer();
        </script>
        <%}%>



        <%-- Les différentes alertes affichées --%>
        <% if ((String) request.getAttribute("result") == "ajout_suc") {%>
        <div class="alert_disparition alert alert-success" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Succès! </strong>La personne à été créée avec succès
        </div> <%
            }%>
            
        <% if ((String) request.getAttribute("result") == "ajout_suc") {%>
        <div class="alert_disparition alert alert-success" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Bravo! </strong>Vous venez de cumuler 5 points supplémentaires !
        </div> <%
            }%>

        <% if ((String) request.getAttribute("result") == "suppr_suc") {%>
        <div class="alert_disparition alert alert-success" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Succès! </strong>La personne à été supprimée avec succès
        </div> <%
            }%>

        <% if ((String) request.getAttribute("result") == "suppr_fail") {%>
        <div class="alert_disparition alert alert alert-danger" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Erreur! </strong>La personne n'a pas été supprimé
        </div> <%
            }%>

        <% if ((String) request.getAttribute("result") == "liste_vide") {%>
        <div class="alert_disparition alert alert-warning" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Attention! </strong>Auncune personne correspond aux critères de recherche
        </div> <%
            }%>

        <% if ((String) request.getAttribute("result") == "maj_suc") {%>
        <div class="alert_disparition alert alert-success" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Success! </strong>La personne à été mise à jour avec succèss.
        </div> <%
            }%>
            
        <% if ((String) request.getAttribute("result") == "maj_suc") {%>
        <div class="alert_disparition alert alert-success" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Bravo! </strong>Vous venez de cumuler 2 points supplémentaires !
        </div> <%
            }%>

        <% if (request.getAttribute("personneASupprimer") != null) {
                Personne p = (Personne) request.getAttribute("personneASupprimer");%>
        <div class="alert alert-warning" id="popup" role="alert">

            <strong>Warning! </strong> <p>Voulez-vous vraiment supprimer la personne <%out.println(p.getNom());%> <%out.println(p.getPrenom());%></p>
            <a href='ServletFaireEffacementPersonne?id=<%out.println(p.getId());%>'><p id="confirmSupprYes">Oui</p></a><a id="confirmSupprNo" href=''><p id="confirmSupprYes">Non</p></a>
        </div> <%
            }%>


        <% Personne personneAModifier = null;%>
        <% if (request.getAttribute("personneAMAJ") != null) {
                personneAModifier = (Personne) request.getAttribute("personneAMAJ");
            } else {
                personneAModifier = new Personne();
            }%>


        <div class="panel panel-default">
            <!--<div class="panel-heading"><p> Personne</p></div>-->
            <div class="panel-body">
                <h1> Personne </h1> 
                

                <form method="POST" action="ServletListePersonne">

                    <input class="form-control" type="hidden" id="inputId" name="id" value =<%if (personneAModifier.getId() != null) {
                            out.println(personneAModifier.getId());
                        }%>>
                    <br></br>
                    <div class="form-group">
                        <label for="inputNom" class="col-md-1 control-label"><p>Nom</p></label>
                        <div class="col-md-4">
                            <input class="form-control" id="inputNom" name="nom" value ="<%if (personneAModifier.getId() != null) {
                                    out.println(personneAModifier.getNom());
                                }%>">
                        </div>
                    </div>
                    <br></br>
                    <div class="form-group">
                        <label for="inputPrenom" class="col-md-1 control-label"><p>Prénom</p></label>
                        <div class="col-md-4">
                            <input class="form-control" id="inputPrenom" name="prenom" value ="<%if (personneAModifier.getId() != null) {
                                    out.println(personneAModifier.getPrenom());
                                }%>">
                        </div>
                    </div>
                    <br></br>
                    <div class="form-group">
                        <label for="inputAdresse" class="col-md-1 control-label"><p>Adresse</p></label>
                        <div class="col-md-4">
                            <input class="form-control" id="inputAdresse" name="adresse" value ="<%if (personneAModifier.getId() != null) {
                                    out.println(personneAModifier.getAdresse());
                                }%>">
                        </div>
                    </div>
                    <br></br>
                    <div class="form-group">
                        <label for="inputVille" class="col-md-1 control-label"><p>Ville</p></label>
                        <div class="col-md-4">
                            <input class="form-control" id="inputVille" name="ville" value ="<%if (personneAModifier.getId() != null) {
                                    out.println(personneAModifier.getVille());
                                }%>">
                        </div>
                    </div>
                    <br></br>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-warning btn-largeur" id="rechercher" onclick="document.body.style.cursor = 'wait';" onclick="this.form.action = 'ServletListePersonne'"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                            <button type="submit" class="btn btn-success btn-largeur" id="creer" onclick="this.form.action = 'ServletCreationPersonne'"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                            <button type="submit" class="btn btn-info btn-largeur" id="maj" onclick="this.form.action = 'ServletFaireMAJPersonne'"><span class="glyphicon glyphicon-save" aria-hidden="true"></span></button>
                        </div>
                    </div>

                </form>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="row">
                <div class="panel-heading col-xs-6 col-md-4"><h1> Liste des personnes </h1> 
                </div>
                <div class=" input-group col-xs-12 col-md-8">  
                    
                    <div id="divfilter">
                    <input  id="filter" type="text" class="form-control" placeholder="Tapez votre filtre..."></input> 
                    </div>
                </div>
            </div>
        </div>
            <div class="panel-body">

                <table id="tablePersonne" class="table table-striped avectri">
                    <thead>
                    <tr>
                        <th class="thtri"><p>Nom</p></th>
                        <th class="thtri"><p>Prenom</p></th>
                        <th class="thtri"><p>Adresse</p></th>
                        <th class="thtri"><p>Ville</p></th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>

                    <tbody class="searchable">
                    <% if (request.getAttribute("personnes") != null) {
                            Vector<Personne> personnes = (Vector<Personne>) request.getAttribute("personnes");
                            for (int i = 0; i < personnes.size(); i++) {
                                Personne p = personnes.elementAt(i);

                                out.println("<tr><td>" + p.getNom() + "</td><td>" + p.getPrenom() + "</td><td>" + p.getAdresse() + "</td><td>" + p.getVille() + "</td><td><form method=\"POST\" action=\"ServletMAJPersonne\"><input type=\"hidden\" id=\"inputId\" name=\"id\" value=\"" + p.getId() + "\"><button type=\"submit\" class=\"btn btn-info btn-xs\" id=\"edition\" onClick=\"modification()\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></button></form></td><td><form method=\"POST\" action=\"ServletEffacerPersonne\"><input type=\"hidden\" id=\"inputId\" name=\"id\" value=\"" + p.getId() + "\"><button type=\"submit\" class=\"btn btn-danger btn-xs\" id=\"supprimer\" onClick=\"modification()\"><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span></button></form></td></tr>");
                            }
                        }%>
                    </tbody>
                    </form>
                </table>
            </div>
        </div>

        <%@ include file="includes/footer.jsp" %>
    </body>
</html>
