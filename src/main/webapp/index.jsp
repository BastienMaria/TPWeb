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

    <c:import url="/WEB-INF/header.jsp"></c:import>

        <body>
            <!-- Fixed navbar -->
            <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Gestionnaire d'utilisateurs</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">Home</a></li>
                        </ul>

                    </div><!--/.nav-collapse -->
                </div>
            </div>

            <div class="container theme-showcase" role="main">


            <jsp:include page="/WEB-INF/login.jsp"></jsp:include>
            <c:if test="${sessionScope.login != null}">

                <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->
                <c:if test="${!empty param['message']}">
                    <div class="alert alert-warning alert-dismissable">
                        <strong>Reçu message : </strong> ${param.message}
                    </div>
                </c:if>

                <jsp:include page="WEB-INF/menu.jsp"></jsp:include>


                    <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->
                <c:if test="${param['action'] == 'listerLesUtilisateurs'}" >
                    <h2>Liste des utilisateurs</h2>

                    <table class="table table-bordered">
                        <!-- La ligne de titre du tableau des comptes -->
                        <tr>
                            <td><b>Login</b></td>
                            <td><b>Nom</b></td>
                            <td><b>Prénom</b></td>
                            <td><b>Supprimer</b></td>
                        </tr>

                        <!-- Ici on affiche les lignes, une par utilisateur -->
                        <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->
                        <c:set var="total" value="0"/>

                        <c:forEach var="u" items="${requestScope['listeDesUsers']}">
                            <tr>
                                <td>${u.login}</td>
                                <td>${u.firstname}</td>
                                <td>${u.lastname}</td>
                                <td><input type="checkbox"></td>
                                <!-- On compte le nombre de users -->
                                <c:set var="total" value="${total+1}"/>
                            </tr>
                        </c:forEach>

                        <!-- Affichage du solde total dans la dernière ligne du tableau -->
                        <tr><td><b>TOTAL</b></td><td></td><td><b>${total}</b></td><td><a href="ServletUsers?action=listerLesUtilisateurs&page=<%= Integer.parseInt(request.getParameter("page")) + 1%><% System.out.println(request.getParameter("page"));%>">&gt;&gt;</a></td></tr>
                    </table>
                </c:if>
            </c:if>
        </div>
    </body>
</html>