<%--
    Document   : index
    Created on : 16 sept. 2009, 16:54:32
    Author     : michel buffa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionnaire d'utilisateurs</title>
    </head>
    <body>

        <jsp:include page="includes/login.jsp"></jsp:include>
        <c:if test="${sessionScope.login != null}">
            <h1>Gestionnaire d'utilisateurs</h1>
            <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->
            <c:if test="${!empty param['message']}">
                <h5>Reçu message : ${param.message}</h5>
            </c:if>

            <jsp:include page="WEB-INF/menu.jsp"></jsp:include>

                <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->
            <c:if test="${param['action'] == 'listerLesUtilisateurs'}" >
                <h2>Liste des utilisateurs</h2>

                <table border="10">
                    <!-- La ligne de titre du tableau des comptes -->
                    <tr>
                        <td><b>Login</b></td>
                        <td><b>Nom</b></td>
                        <td><b>Prénom</b></td>
                    </tr>

                    <!-- Ici on affiche les lignes, une par utilisateur -->
                    <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->
                    <c:set var="total" value="0"/>

                    <c:forEach var="u" items="${requestScope['listeDesUsers']}">
                        <tr>
                            <td>${u.login}</td>
                            <td>${u.firstname}</td>
                            <td>${u.lastname}</td>
                            <!-- On compte le nombre de users -->
                            <c:set var="total" value="${total+1}"/>
                        </tr>
                    </c:forEach>

                    <!-- Affichage du solde total dans la dernière ligne du tableau -->
                    <tr><td><b>TOTAL</b></td><td></td><td><b>${total}</b></td><td><a href="ServletUsers?action=listerLesUtilisateurs&page=<%= Integer.parseInt(request.getParameter("page")) + 1%><% System.out.println(request.getParameter("page"));%>">&gt;&gt;</a></td></tr>
                </table>
            </c:if>
        </c:if>
    </body>
</html>