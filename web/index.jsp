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
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.css">
        <link rel="stylesheet" href="css/starter-template.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.js"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.9.1.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

        <script>
            $(function() {
                $("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
                $("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
            });
        </script>
        <style>
            .ui-tabs-vertical { width: 55em; }
            .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
            .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
            .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
            .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; border-right-width: 1px; }
            .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
        </style>
    </head>
    <body role="document">
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
                    <a class="navbar-brand" href="#">Bootstrap theme</a>
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

            <div class="jumbotron">

                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Nunc tincidunt</a></li>
                        <li><a href="#tabs-2">Proin dolor</a></li>
                        <li><a href="#tabs-3">Aenean lacinia</a></li>
                    </ul>
                    <div id="tabs-1">
                        <h2>Content heading 1</h2>
                        <p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
                    </div>
                    <div id="tabs-2">
                        <h2>Content heading 2</h2>
                        <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
                    </div>
                    <div id="tabs-3">
                        <h2>Content heading 3</h2>
                        <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
                        <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
                    </div>
                </div>

            </div>
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
        </div>
    </body>
</html>