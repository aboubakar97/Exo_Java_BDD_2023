<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

<head>
    <title>Boucles</title>
    <script>
        function afficherEtoiles() {
            var valeur1 = document.getElementById("inputValeur1").value;
            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("resultat").innerHTML = xhr.responseText;
                }
            };

            xhr.open("GET", "etoiles.jsp?valeur1=" + valeur1, true);
            xhr.send();
        }
    </script>
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

    <%-- Deuxième formulaire avec AJAX pour afficher le carré d'étoiles --%>
    <form onsubmit="event.preventDefault(); afficherEtoiles();">
        <label for="inputValeur1">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur1" name="valeur1">
        <input type="submit" value="Afficher">
    </form>

    <%-- Div pour afficher le carré dynamiquement --%>
    <div id="resultat">
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
        <% } else { %>
            <p>Veuillez entrer une valeur valide.</p>
        <% } %>
    </div>

    <h2>Exercice 2 : Triangle rectangle gauche</h2>
    <p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>*</br>**</br>***</br>****</br>*****</p>

    <h2>Exercice 3 : Triangle rectangle inversé</h2>
    <p>Ecrire le code afin de produire un triangle rectangle aligné sur la gauche</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>*****</br>****</br>***</br>**</br>*</p>

    <h2>Exercice 4 : Triangle rectangle 2</h2>
    <p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;***</br>&nbsp;&nbsp;****</br>*****</p>

    <h2>Exercice 5 : Triangle isocele</h2>
    <p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;*</br>&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;***</br>&nbsp;****</br>*****</p>

    <h2>Exercice 6 : Le demi losange</h2>
    <p>Ecrire le code afin de produire un losange</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;***</br>&nbsp;&nbsp;****</br>*****</p>
    <p>*****</br>&nbsp;&nbsp;****</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*</p>

    <h2>Exercice 7 : La table de multiplication</h2>
    <p>Ecrire le code afin de créer une table de multiplication</p>
    <p>Exemple si l'utilisateur saisie le valeur 5</p>
    <p>5 x 1 = 5</p>
    <p>5 x 2 = 10</p>
    <p>5 x 3 = 15</p>
    <p>5 x 4 = 20</p>
    <p>5 x 5 = 25</p>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
