<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html lang="en">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.css">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <div class="container" id="login">
        <%
            if (session.getAttribute("login") == null) {
        %>
        <fieldset>
            <form class="form-signin" action="Connexion" method="post">
                <h2 class="form-signin-heading">Please sign in</h2>
                <!--<label for="login">Nom utilisateur:</label>-->
                <input class="form-control" type="text" placeholder="login" name="login" id="login" required="true"><br>
                <!--<label for="password">Mot de passe:</label>-->
                <input class="form-control" type="password" placeholder="password" id="password" name="password" required="true"><br><br>
                <input class="btn btn-lg btn-primary btn-block" type="submit" value="Login ">
            </form>
        </fieldset>

        <% } else {%>
        <div class="page-header">
            <h1>Bonjour <%= session.getAttribute("login")%> !</h1>
            <small><a href="Deconnexion" class="btn btn-info btn-xs">Déconnexion</a></small>
        </div>
        <h3> </h3>

        <%}%>
    </div>
