<h2>Menu de gestion des utilisateurs</h2>
<ul>
    <li><a href="ServletUsers?action=listerLesUtilisateurs&page=1">Afficher/raffraichir la liste de tous les utilisateurs</a></li>
    <p>
</ul>
<h2>Liste des fonctionnalit�s � impl�menter dans la Servlet (note : apr�s chaque action cette page sera
    rappel�e par la servlet avec la liste des utilisateurs raffraichie et un message de confirmation</h2>
<ol>
    <li><a href="ServletUsers?action=creerUtilisateursDeTest">Cr�er 4 utilisateurs de test</a></li>

    <li>Cr�er un utilisateur</li>
    <form action="ServletUsers" method="get">
        Nom : <input type="text" name="nom"/><br>
        Pr�nom : <input type="text" name="prenom"/><br>
        Login : <input type="text" name="login"/><br>
        <!-- Astuce pour passer des param�tres � une servlet depuis un formulaire JSP !-->
        <input type="hidden" name="action" value="creerUnUtilisateur"/>
        <input type="submit" value="Cr�er l'utilisateur" name="submit"/>
    </form>

    <li>Afficher les d�tails d'un utilisateur</li>
    <form action="ServletUsers" method="get">
        login : <input type="text" name="login"/><br>
        <input type="hidden" name="action" value="chercherParLogin"/>
        <input type="submit" value="Chercher" name="submit"/>
    </form>


    <li>Modifier les d�tails d'un utilisateur :</li>
    <form action="ServletUsers" method="get">
        Login : <input type="text" name="login"/><br>
        Nom : <input type="text" name="nom"/><br>
        Pr�nom : <input type="text" name="prenom"/><br>
        <input type="hidden" name="action" value="updateUtilisateur"/>
        <input type="submit" value="Mettre � jour" name="submit"/>
    </form>
</ol>
