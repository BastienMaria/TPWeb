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

        <body >
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
                            <li><a href="#about">About</a></li>
                            <li><a href="#contact">Contact</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">Nav header</li>
                                    <li><a href="#">Separated link</a></li>
                                    <li><a href="#">One more separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>


            <div class="container theme-showcase" role="main">



            <c:import url="/WEB-INF/login.jsp"></c:import>
            <c:if test="${sessionScope.login != null}">

                <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->
                <c:if test="${!empty param['message']}">
                    <h5>Reçu message : ${param.message}</h5>
                </c:if>

                <c:import url="/WEB-INF/menu.jsp"></c:import>

                    <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerlesUtilisateurs -->
                <c:if test="${param['action'] == 'listerLesUtilisateurs'}">
                    <c:import url="/WEB-INF/tab.jsp"></c:import>
                </c:if>
            </c:if>
        </div>
    </body>
</html>