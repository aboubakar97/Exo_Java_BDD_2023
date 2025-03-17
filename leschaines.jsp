<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les chaînes</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les chaînes de caractères</h1>

    <%-- Formulaire pour saisir une chaîne de caractères --%>
    <form action="#" method="post">
        <p>Saisir une chaîne (Du texte avec 6 caractères minimum) : <input type="text" id="inputValeur" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération de la chaîne saisie --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null && chaine.length() >= 6) { %>

        <%-- Obtention de la longueur de la chaîne --%>
        <% int longueurChaine = chaine.length(); %>
        <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères</p>

        <%-- Extraction du 3° caractère dans votre chaîne --%>
        <% char caractereExtrait = chaine.charAt(2); %>
        <p>Le 3° caractère de votre chaîne est la lettre <%= caractereExtrait %></p>

        <%-- Obtention d'une sous-chaîne --%>
        <% String sousChaine = chaine.substring(2, 6); %>
        <p>Une sous-chaîne de votre texte : <%= sousChaine %></p>

        <%-- Recherche de la lettre "e" --%>
        <% char recherche = 'e'; 
           int position = chaine.indexOf(recherche); %>
        <p>Votre premier "e" est en position : <%= position %></p>

        <h2>Exercice 1 : Combien de 'e' dans notre chaîne de caractères ?</h2>
        <%-- Compter le nombre de 'e' dans la chaîne --%>
        <% int nombreDeE = 0; %>
        <% for (int i = 0; i < chaine.length(); i++) { %>
            <% if (chaine.charAt(i) == 'e') { %>
                <% nombreDeE++; %>
            <% } %>
        <% } %>
        <p>Le nombre de 'e' dans votre chaîne est : <%= nombreDeE %></p>

        <h2>Exercice 2 : Affichage vertical</h2>
        <%-- Afficher la chaîne en vertical --%>
        <p>Affichage vertical de votre texte :</p>
        <% for (int i = 0; i < chaine.length(); i++) { %>
            <%= chaine.charAt(i) %><br>
        <% } %>

        <h2>Exercice 3 : Retour à la ligne</h2>
        <%-- Afficher la chaîne avec un retour à la ligne à chaque espace --%>
        <p>Affichage avec retour à la ligne :</p>
        <% String[] mots = chaine.split(" "); %>
        <% for (String mot : mots) { %>
            <%= mot %><br>
        <% } %>

        <h2>Exercice 4 : Afficher une lettre sur deux</h2>
        <%-- Afficher une lettre sur deux de la chaîne --%>
        <p>Affichage d'une lettre sur deux :</p>
        <% for (int i = 0; i < chaine.length(); i += 2) { %>
            <%= chaine.charAt(i) %>
        <% } %>
        <br>

        <h2>Exercice 5 : La phrase en verlan</h2>
        <%-- Afficher la chaîne en verlan --%>
        <p>Affichage en verlan :</p>
        <% String verlan = new StringBuilder(chaine).reverse().toString(); %>
        <%= verlan %>

        <h2>Exercice 6 : Consonnes et voyelles</h2>
        <%-- Compter les consonnes et les voyelles dans la chaîne --%>
        <% int nombreVoyelles = 0; %>
        <% int nombreConsonnes = 0; %>
        <% String voyelles = "aeiouyAEIOUY"; %>
        <% for (int i = 0; i < chaine.length(); i++) { %>
            <% char c = chaine.charAt(i); %>
            <% if (voyelles.contains(String.valueOf(c))) { %>
                <% nombreVoyelles++; %>
            <% } else if (Character.isLetter(c)) { %>
                <% nombreConsonnes++; %>
            <% } %>
        <% } %>
        <p>Nombre de voyelles : <%= nombreVoyelles %></p>
        <p>Nombre de consonnes : <%= nombreConsonnes %></p>

    <% } else if (chaine != null) { %>
        <p>Veuillez saisir une chaîne d'au moins 6 caractères.</p>
    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
