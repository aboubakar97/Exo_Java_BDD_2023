<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

<head>
    <title>Boucles</title>
</head>

<body bgcolor="white">
    <h1>Exercices sur les boucles</h1>

    <%-- Premier formulaire pour afficher une ligne d'étoiles --%>
    <form action="#" method="post">
        <label for="inputValeur">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur" name="valeur">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la valeur saisie par l'utilisateur --%>
    <% String valeur = request.getParameter("valeur"); %>

    <%-- Vérification de l'existence de la valeur --%>
    <% if (valeur != null && !valeur.isEmpty()) { 
        int cpt = Integer.parseInt(valeur); %>
        <p>
        <% for (int i = 1; i <= cpt; i++) { %>
            <%= "*" %>
        <% } %>
        </p>
    <% } %>

    <h2>Exercice 1 : Le carré d'étoiles</h2>
    <p>Ecrire le code afin de produire un carré d'étoiles</p>
    <p>Exemple si l'utilisateur saisit la valeur 5 :</p>
    <p>*****<br>*****<br>*****<br>*****<br>*****</p>

    <%-- Deuxième formulaire pour afficher le carré d'étoiles --%>
    <form action="#" method="post">
        <label for="inputValeur1">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur1" name="valeur1">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la deuxième valeur saisie --%>
    <% String valeur1 = request.getParameter("valeur1"); %>

    <%-- Vérification de l'existence de la valeur --%>
    <% if (valeur1 != null && !valeur1.isEmpty()) { 
        int cpt1 = Integer.parseInt(valeur1);
    %>
        <p>
        <%-- Boucle pour afficher un carré d'étoiles --%>
        <% for (int i = 0; i < cpt1; i++) { %>
            <% for (int j = 0; j < cpt1; j++) { %>
                <%= "*" %>
            <% } %>
            <br> <%-- Saut de ligne après chaque ligne d'étoiles --%>
        <% } %>
        </p>
    <% } else if (valeur1 != null) { %>
        <p>Veuillez entrer une valeur valide.</p>
    <% } %>

    <h2>Exercice 2 : Triangle rectangle gauche</h2>
    <p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>*</br>**</br>***</br>****</br>*****</p>

    <%-- Formulaire pour le triangle rectangle gauche --%>
    <form action="#" method="post">
        <label for="inputValeur2">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur2" name="valeur2">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la valeur saisie pour le triangle rectangle gauche --%>
    <% String valeur2 = request.getParameter("valeur2"); %>

    <%-- Vérification de l'existence de la valeur --%>
    <% if (valeur2 != null && !valeur2.isEmpty()) { 
        int cpt2 = Integer.parseInt(valeur2); %>
        <p>
        <%-- Boucle pour afficher un triangle rectangle gauche --%>
        <% for (int i = 1; i <= cpt2; i++) { %>
            <% for (int j = 1; j <= i; j++) { %>
                <%= "*" %>
            <% } %>
            <br>
        <% } %>
        </p>
    <% } else if (valeur2 != null) { %>
        <p>Veuillez entrer une valeur valide.</p>
    <% } %>

    <h2>Exercice 3 : Triangle rectangle inversé</h2>
    <p>Ecrire le code afin de produire un triangle rectangle inversé</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>*****</br>****</br>***</br>**</br>*</p>

    <%-- Formulaire pour le triangle rectangle inversé --%>
    <form action="#" method="post">
        <label for="inputValeur3">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur3" name="valeur3">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la valeur saisie pour le triangle rectangle inversé --%>
    <% String valeur3 = request.getParameter("valeur3"); %>

    <%-- Vérification de l'existence de la valeur --%>
    <% if (valeur3 != null && !valeur3.isEmpty()) { 
        int cpt3 = Integer.parseInt(valeur3); %>
        <p>
        <%-- Boucle pour afficher un triangle rectangle inversé --%>
        <% for (int i = cpt3; i >= 1; i--) { %>
            <% for (int j = 1; j <= i; j++) { %>
                <%= "*" %>
            <% } %>
            <br>
        <% } %>
        </p>
    <% } else if (valeur3 != null) { %>
        <p>Veuillez entrer une valeur valide.</p>
    <% } %>

    <h2>Exercice 4 : Triangle rectangle aligné à droite</h2>
    <p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;***</br>&nbsp;&nbsp;****</br>*****</p>

    <%-- Formulaire pour le triangle rectangle aligné à droite --%>
    <form action="#" method="post">
        <label for="inputValeur4">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur4" name="valeur4">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la valeur saisie pour le triangle rectangle aligné à droite --%>
    <% String valeur4 = request.getParameter("valeur4"); %>

    <%-- Vérification de l'existence de la valeur --%>
    <% if (valeur4 != null && !valeur4.isEmpty()) { 
        int cpt4 = Integer.parseInt(valeur4); %>
        <p>
        <%-- Boucle pour afficher un triangle rectangle aligné à droite --%>
        <% for (int i = 1; i <= cpt4; i++) { %>
            <% for (int j = 1; j <= cpt4 - i; j++) { %>
                <%= "&nbsp;" %>
            <% } %>
            <% for (int j = 1; j <= i; j++) { %>
                <%= "*" %>
            <% } %>
            <br>
        <% } %>
        </p>
    <% } else if (valeur4 != null) { %>
        <p>Veuillez entrer une valeur valide.</p>
    <% } %>

    <h2>Exercice 5 : Triangle isocèle</h2>
    <p>Ecrire le code afin de produire un triangle isocèle</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;*</br>&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;***</br>&nbsp;****</br>*****</p>

    <%-- Formulaire pour le triangle isocèle --%>
    <form action="#" method="post">
        <label for="inputValeur5">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur5" name="valeur5">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la valeur saisie pour le triangle isocèle --%>
    <% String valeur5 = request.getParameter("valeur5"); %>

    <%-- Vérification de l'existence de la valeur --%>
    <% if (valeur5 != null && !valeur5.isEmpty()) { 
        int cpt5 = Integer.parseInt(valeur5); %>
        <p>
        <%-- Boucle pour afficher un triangle isocèle --%>
        <% for (int i = 1; i <= cpt5; i++) { %>
            <% for (int j = 1; j <= cpt5 - i; j++) { %>
                <%= "&nbsp;" %>
            <% } %>
            <% for (int j = 1; j <= 2 * i - 1; j++) { %>
                <%= "*" %>
            <% } %>
            <br>
        <% } %>
        </p>
    <% } else if (valeur5 != null) { %>
        <p>Veuillez entrer une valeur valide.</p>
    <% } %>

    <h2>Exercice 6 : Le demi-losange</h2>
    <p>Ecrire le code afin de produire un demi-losange</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;***</br>&nbsp;&nbsp;****</br>*****</p>
    <p>*****</br>&nbsp;&nbsp;****</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</p>

    <%-- Formulaire pour le demi-losange --%>
    <form action="#" method="post">
        <label for="inputValeur6">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur6" name="valeur6">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la valeur saisie pour le demi-losange --%>
    <% String valeur6 = request.getParameter("valeur6"); %>

    <%-- Vérification de l'existence de la valeur --%>
    <% if (valeur6 != null && !valeur6.isEmpty()) { 
        int cpt6 = Integer.parseInt(valeur6); %>
        <p>
        <%-- Partie supérieure du demi-losange --%>
        <% for (int i = 1; i <= cpt6; i++) { %>
            <% for (int j = 1; j <= i; j++) { %>
                <%= "*" %>
            <% } %>
            <br>
        <% } %>
        <%-- Partie inférieure du demi-losange --%>
        <% for (int i = cpt6 - 1; i >= 1; i--) { %>
            <% for (int j = 1; j <= i; j++) { %>
                <%= "*" %>
            <% } %>
            <br>
        <% } %>
        </p>
    <% } else if (valeur6 != null) { %>
        <p>Veuillez entrer une valeur valide.</p>
    <% } %>

    <h2>Exercice 7 : La table de multiplication</h2>
    <p>Ecrire le code afin de créer une table de multiplication</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>5 x 1 = 5</p>
    <p>5 x 2 = 10</p>
    <p>5 x 3 = 15</p>
    <p>5 x 4 = 20</p>
    <p>5 x 5 = 25</p>

    <%-- Formulaire pour la table de multiplication --%>
    <form action="#" method="post">
        <label for="inputValeur7">Saisir un nombre : </label>
        <input type="text" id="inputValeur7" name="valeur7">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la valeur saisie pour la table de multiplication --%>
    <% String valeur7 = request.getParameter("valeur7"); %>

    <%-- Vérification de l'existence de la valeur --%>
    <% if (valeur7 != null && !valeur7.isEmpty()) { 
        int cpt7 = Integer.parseInt(valeur7); %>
        <p>
        <%-- Boucle pour afficher la table de multiplication --%>
        <% for (int i = 1; i <= 10; i++) { %>
            <%= cpt7 + " x " + i + " = " + (cpt7 * i) %><br>
        <% } %>
        </p>
    <% } else if (valeur7 != null) { %>
        <p>Veuillez entrer une valeur valide.</p>
    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
