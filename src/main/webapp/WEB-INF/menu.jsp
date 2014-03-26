<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<script>
    $(function() {
        $("#tabs").tabs();
    });
</script>

<div id="tabs">
    <ul>
        <li><a href="#tabs-1">Créer un utilisateur</a></li>
        <li><a href="#tabs-2">Afficher les détails d'un utilisateur</a></li>
        <li><a href="#tabs-3">Modifier les détails d'un utilisateur</a></li>
        <li><a href="#tabs-4">Générer des données</a></li>
    </ul>
    <div id="tabs-1">
        <form role="form" action="ServletUsers" method="get">
            <div class="form-group">
                <label for="nom">Nom :</label>
                <input class="form-control" type="text" name="nom"/><br>

                <label for="pre">Prénom :</label>
                <input class="form-control" type="text" name="prenom"/><br>

                <label for="log">Login :</label>
                <input class="form-control" type="text" name="login"/><br>

                <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
                <input type="hidden" name="action" value="creerUnUtilisateur"/>
                <input class="btn btn-default" type="submit" value="Créer l'utilisateur" name="submit"/>
            </div>
        </form>  
    </div>
    <div id="tabs-2">
        <div class="form-group">
            <form role="form" action="ServletUsers" method="get">
                <div class="form-group">
                    <label for="log">Login :</label>
                    <input class="form-control" type="text" name="login"/><br>
                    <input type="hidden" name="action" value="chercherParLogin"/>
                    <input class="btn btn-default" type="submit" value="Chercher" name="submit"/>
                </div>
            </form>   
        </div>
    </div>
    <div id="tabs-3">
        <form role="form" action="ServletUsers" method="get">
            <div class="form-group">
                <label for="log">Login :</label>
                <input class="form-control" type="text" name="login"/><br>

                <label for="nom">Nom :</label>
                <input class="form-control" type="text" name="nom"/><br>

                <label for="pre">Prénom :</label>
                <input class="form-control" type="text" name="prenom"/><br>

                <input type="hidden" name="action" value="updateUtilisateur"/>
                <input class="btn btn-default" type="submit" value="Mettre à jour" name="submit"/>
            </div>
        </form>
    </div>
    <div id="tabs-4">
        <form role="form"  action="ServletUsers" method="get">
            <div class="form-group">
                <label>Nombre d'utilisateurs à générer :</label>
                <select name="nbUsers" class="form-control">
                    <option>10</option>
                    <option>20</option>
                    <option>30</option>
                    <option>40</option>
                    <option>50</option>
                    <option>60</option>
                    <option>70</option>
                    <option>80</option>
                    <option>90</option>
                    <option>100</option>
                </select>
                <input type="hidden" name="action" value="generateData"/>
            </div>
            <button type="submit" class="btn btn-default">OK</button>

        </form>
    </div>
</div> 
<br>
<a class="btn btn-default btn-lg btn-block" href="ServletUsers?action=listerLesUtilisateurs&page=1"><span class="glyphicon glyphicon-refresh"></span>
    Afficher/raffraichir la liste de tous les utilisateurs</a>

