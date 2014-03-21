<%-- 
    Document   : login
    Created on : 21 mars 2014, 14:39:58
    Author     : Goys
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="login">
    <%
        if (session.getAttribute("login") == null) {
    %>
    <fieldset>
        <form action="Connexion" method="post">
            <label for="login">Nom utilisateur:</label>
            <input type="text" name="login" id="login" required="true"><br>
            <label for="password">Mot de passe:</label>
            <input type="password" id="password" name="password" required="true"><br><br>
            <input type="submit" value="Login ">
        </form>
    </fieldset>

    <% } else {%>
    <h3><a href="Deconnexion">Déconnexion</a><br></h3>
    <h3> Bonjour <%= session.getAttribute("login")%></h3>

    <%}%>
</div>