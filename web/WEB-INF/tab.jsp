<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/tabUtil.js"></script>

<h2>Liste des utilisateurs</h2>

<table border="10">
    <script>
        window.onload = init();
        console.log(previous);
    </script>
    <!-- La ligne de titre du tableau des comptes -->
    <tr>
        <td><b>Login</b></td>
        <td><b>Nom</b></td>
        <td><b>Prénom</b></td>
        <td></td>
    </tr>

    <!-- Ici on affiche les lignes, une par utilisateur -->
    <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->
    <c:set var="total" value="0"/>

    <c:forEach var="u" items="${requestScope['listeDesUsers']}">
        <tr>
            <td>${u.login}</td>
            <td>${u.firstname}</td>
            <td>${u.lastname}</td>
            <td></td>
            <!-- On compte le nombre de users -->
            <c:set var="total" value="${total+1}"/>
        </tr>
    </c:forEach>

    <!-- Affichage du solde total dans la dernière ligne du tableau -->
    <tr><td><b>TOTAL</b></td><td><b>${total}</b></td><td><button id="previous" onclick="previousPage();">&lt;&lt;</button><button id="next" onclick="nextPage();">&gt;&gt;</button></td><td></td></tr>
</table>