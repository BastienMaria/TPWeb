<h2>Menu de gestion des utilisateurs</h2>
<ul>
    <li><a href="ServletUsers?action=listerLesUtilisateurs&page=1">Afficher/raffraichir la liste de tous les utilisateurs</a></li>
    <p>
</ul>
<h2>Liste des fonctionnalités à implémenter dans la Servlet (note : après chaque action cette page sera
    rappelée par la servlet avec la liste des utilisateurs raffraichie et un message de confirmation</h2>
<ol>
    <li><a href="ServletUsers?action=creerUtilisateursDeTest">Créer 4 utilisateurs de test</a></li>

    <li>Créer un utilisateur</li>
    <form action="ServletUsers" method="get">
        Nom : <input type="text" name="nom"/><br>
        Prénom : <input type="text" name="prenom"/><br>
        Login : <input type="text" name="login"/><br>
        <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
        <input type="hidden" name="action" value="creerUnUtilisateur"/>
        <input type="submit" value="Créer l'utilisateur" name="submit"/>
    </form>

    <li>Afficher les détails d'un utilisateur</li>
    <form action="ServletUsers" method="get">
        login : <input type="text" name="login"/><br>
        <input type="hidden" name="action" value="chercherParLogin"/>
        <input type="submit" value="Chercher" name="submit"/>
    </form>


    <li>Modifier les détails d'un utilisateur :</li>
    <form action="ServletUsers" method="get">
        Login : <input type="text" name="login"/><br>
        Nom : <input type="text" name="nom"/><br>
        Prénom : <input type="text" name="prenom"/><br>
        <input type="hidden" name="action" value="updateUtilisateur"/>
        <input type="submit" value="Mettre à jour" name="submit"/>
    </form>
</ol>
