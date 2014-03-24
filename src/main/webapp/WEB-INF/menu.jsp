<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
    $(function() {
        $("#tabs").tabs();
    });
</script>

<ul>
    <li><a href="ServletUsers?action=listerLesUtilisateurs&page=1">Afficher/raffraichir la liste de tous les utilisateurs</a></li>
    <li><a href="ServletUsers?action=creerUtilisateursDeTest">Créer 4 utilisateurs de test</a></li>
</ul>

<div id="tabs">
    <ul>
        <li><a href="#tabs-1">Créer un utilisateur</a></li>
        <li><a href="#tabs-2">Afficher les détails d'un utilisateur</a></li>
        <li><a href="#tabs-3">Modifier les détails d'un utilisateur</a></li>
    </ul>
    <div id="tabs-1">
        <form action="ServletUsers" method="get">
            Nom : <input type="text" name="nom"/><br>
            Prénom : <input type="text" name="prenom"/><br>
            Login : <input type="text" name="login"/><br>
            <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
            <input type="hidden" name="action" value="creerUnUtilisateur"/>
            <input type="submit" value="Créer l'utilisateur" name="submit"/>
        </form>    </div>
    <div id="tabs-2">
        <form action="ServletUsers" method="get">
            login : <input type="text" name="login"/><br>
            <input type="hidden" name="action" value="chercherParLogin"/>
            <input type="submit" value="Chercher" name="submit"/>
        </form>    </div>
    <div id="tabs-3">
        <form action="ServletUsers" method="get">
            Login : <input type="text" name="login"/><br>
            Nom : <input type="text" name="nom"/><br>
            Prénom : <input type="text" name="prenom"/><br>
            <input type="hidden" name="action" value="updateUtilisateur"/>
            <input type="submit" value="Mettre à jour" name="submit"/>
        </form>
    </div>
</div> 

