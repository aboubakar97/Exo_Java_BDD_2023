<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les tableaux</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les tableaux</h1>

    <%-- Formulaire pour saisir des chiffres --%>
    <form action="#" method="post">
        <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération de la chaîne saisie --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null) { %>

        <%-- Division de la chaîne de chiffres séparés par des espaces --%>
        <% String[] tableauDeChiffres = chaine.split("\\s+"); %>
        <p>Le tableau contient <%= tableauDeChiffres.length %> valeurs</br>
        Chiffre 1 : <%= Integer.parseInt(tableauDeChiffres[0]) %></br>
        Chiffre 2 : <%= Integer.parseInt(tableauDeChiffres[1]) %></br>
        Chiffre 3 : <%= Integer.parseInt(tableauDeChiffres[2]) %></p>

        <h2>Exercice 1 : Le carré de la première valeur</h2>
        <%-- Calcul du carré de la première valeur --%>
        <% int carre = Integer.parseInt(tableauDeChiffres[0]) * Integer.parseInt(tableauDeChiffres[0]); %>
        <p>Le carré de la première valeur est : <%= carre %></p>

        <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
        <%-- Calcul de la somme des deux premières valeurs --%>
        <% int sommeDeuxValeurs = Integer.parseInt(tableauDeChiffres[0]) + Integer.parseInt(tableauDeChiffres[1]); %>
        <p>La somme des deux premières valeurs est : <%= sommeDeuxValeurs %></p>

        <h2>Exercice 3 : La somme de toutes les valeurs</h2>
        <%-- Calcul de la somme de toutes les valeurs --%>
        <% int sommeTotale = 0; %>
        <% for (String valeur : tableauDeChiffres) { %>
            <% sommeTotale += Integer.parseInt(valeur); %>
        <% } %>
        <p>La somme de toutes les valeurs est : <%= sommeTotale %></p>

        <h2>Exercice 4 : La valeur maximale</h2>
        <%-- Recherche de la valeur maximale --%>
        <% int max = Integer.MIN_VALUE; %>
        <% for (String valeur : tableauDeChiffres) { %>
            <% int val = Integer.parseInt(valeur); %>
            <% if (val > max) { %>
                <% max = val; %>
            <% } %>
        <% } %>
        <p>La valeur maximale est : <%= max %></p>

        <h2>Exercice 5 : La valeur minimale</h2>
        <%-- Recherche de la valeur minimale --%>
        <% int min = Integer.MAX_VALUE; %>
        <% for (String valeur : tableauDeChiffres) { %>
            <% int val = Integer.parseInt(valeur); %>
            <% if (val < min) { %>
                <% min = val; %>
            <% } %>
        <% } %>
        <p>La valeur minimale est : <%= min %></p>

        <h2>Exercice 6 : La valeur la plus proche de 0</h2>
        <%-- Recherche de la valeur la plus proche de 0 --%>
        <% int plusProcheDeZero = Integer.MAX_VALUE; %>
        <% for (String valeur : tableauDeChiffres) { %>
            <% int val = Integer.parseInt(valeur); %>
            <% if (Math.abs(val) < Math.abs(plusProcheDeZero)) { %>
                <% plusProcheDeZero = val; %>
            <% } %>
        <% } %>
        <p>La valeur la plus proche de 0 est : <%= plusProcheDeZero %></p>

        <h2>Exercice 7 : La valeur la plus proche de 0 (2ème version)</h2>
        <%-- Recherche de la valeur la plus proche de 0 avec priorité au positif en cas d'égalité --%>
        <% int plusProcheDeZeroV2 = Integer.MAX_VALUE; %>
        <% for (String valeur : tableauDeChiffres) { %>
            <% int val = Integer.parseInt(valeur); %>
            <% if (Math.abs(val) < Math.abs(plusProcheDeZeroV2) || (Math.abs(val) == Math.abs(plusProcheDeZeroV2) && val > plusProcheDeZeroV2)) { %>
                <% plusProcheDeZeroV2 = val; %>
            <% } %>
        <% } %>
        <p>La valeur la plus proche de 0 (2ème version) est : <%= plusProcheDeZeroV2 %></p>

    <% } else { %>
        <p>Veuillez saisir au moins 3 chiffres séparés par des espaces.</p>
    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
