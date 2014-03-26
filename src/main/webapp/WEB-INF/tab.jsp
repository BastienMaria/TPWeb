<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->

<script>
    function toggle(source) {
        checkboxes = document.getElementsByName('id');
        for (var i = 0, n = checkboxes.length; i < n; i++) {
            checkboxes[i].checked = source.checked;
        }
    }
</script>

<c:if test="${param['action'] == 'listerLesUtilisateurs'}" >

    <link rel="stylesheet" href="css/style.css">

    <script src="js/tabUtil.js"></script>
    <script>
    $(function() {
        init();
    });
    </script>

    <h2>Liste des utilisateurs</h2>
    <form action="ServletUsers" method="get">
        <table class="table table-bordered">
            <!-- La ligne de titre du tableau des comptes -->
            <tr>
                <td><b>Login</b></td>
                <td><b>Nom</b></td>
                <td><b>Prénom</b></td>
                <td width="10%"><b>Supprimer</b></td>
            </tr>

            <!-- Ici on affiche les lignes, une par utilisateur -->
            <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->
            <c:set var="total" value="0"/>

            <c:forEach var="u" items="${requestScope['listeDesUsers']}">
                <tr>
                    <td>${u.login}</td>
                    <td>${u.firstname}</td>
                    <td>${u.lastname}</td>
                    <td><input type="checkbox" name="id" value="${u.id}" onchange="document.getElementById('sub').disabled = !this.checked;"></td>
                    <!-- On compte le nombre de users -->
                    <c:set var="total" value="${total+1}"/>
                </tr>
            </c:forEach>

            <!-- Affichage du solde total dans la dernière ligne du tableau -->
            <tr>
                <td><b>TOTAL</b></td>
                <td><b>${total}</b></td>
                <td>
                </td>
                <td>
                    <input type="hidden" name="action" value="supprimerUtilisateurs"/>
                    <button type="submit" class="btn btn-danger" name="sub">Supprimer</button><br>
                    <input type="checkbox" onClick="toggle(this)" /> select all<br/>
                </td>
            </tr>
        </table>
    </form>
    <ul class="pagination">
        <li><a href="javascript:previousPage()" id="previous">&laquo;</a></li>
        <li><a href="javascript:nextPage()"id="next">&raquo;</a></li>
    </ul>

</c:if>
