<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "cnam";
    String password = "cnam";

    // Charger le pilote JDBC (pilote disponible dans WEB-INF/lib)
    Class.forName("org.mariadb.jdbc.Driver");

    // Établir la connexion
    Connection conn = DriverManager.getConnection(url, user, password);

    // Exemple de requête SQL
    String sql = "SELECT idFilm, titre, annee FROM Film WHERE annee >= 2000";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    // Afficher les résultats (à adapter selon vos besoins)
    while (rs.next()) {
        String colonne1 = rs.getString("idFilm");
        String colonne2 = rs.getString("titre");
        String colonne3 = rs.getString("annee");
        // Faites ce que vous voulez avec les données...
        // Exemple d'affichage de 2 colonnes
        out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
    }

    // Fermer les ressources 
    rs.close();
    pstmt.close();
    %>

    <h2>Exercice 1 : Les films entre 2000 et 2015</h2>
    <p>Extraire les films dont l'année est supérieure à 2000 et inférieure à 2015.</p>

    <%-- Requête pour les films entre 2000 et 2015 --%>
    <% 
    String sqlExercice1 = "SELECT idFilm, titre, annee FROM Film WHERE annee > 2000 AND annee < 2015";
    PreparedStatement pstmtExercice1 = conn.prepareStatement(sqlExercice1);
    ResultSet rsExercice1 = pstmtExercice1.executeQuery();
    %>
    <p>Films entre 2000 et 2015 :</p>
    <% while (rsExercice1.next()) { %>
        <% out.println("id : " + rsExercice1.getString("idFilm") + ", titre : " + rsExercice1.getString("titre") + ", année : " + rsExercice1.getString("annee") + "</br>"); %>
    <% } %>
    <% rsExercice1.close(); %>
    <% pstmtExercice1.close(); %>

    <h2>Exercice 2 : Année de recherche</h2>
    <p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>

    <%-- Formulaire pour l'exercice 2 --%>
    <form action="#" method="post">
        <p>Saisir une année : <input type="text" id="inputAnnee" name="annee"></p>
        <p><input type="submit" value="Rechercher"></p>
    </form>

    <%-- Récupération de l'année saisie --%>
    <% String anneeRecherche = request.getParameter("annee"); %>
    <% if (anneeRecherche != null && !anneeRecherche.isEmpty()) { %>
        <% 
        String sqlExercice2 = "SELECT idFilm, titre, annee FROM Film WHERE annee = ?";
        PreparedStatement pstmtExercice2 = conn.prepareStatement(sqlExercice2);
        pstmtExercice2.setInt(1, Integer.parseInt(anneeRecherche));
        ResultSet rsExercice2 = pstmtExercice2.executeQuery();
        %>
        <p>Films de l'année <%= anneeRecherche %> :</p>
        <% while (rsExercice2.next()) { %>
            <% out.println("id : " + rsExercice2.getString("idFilm") + ", titre : " + rsExercice2.getString("titre") + ", année : " + rsExercice2.getString("annee") + "</br>"); %>
        <% } %>
        <% rsExercice2.close(); %>
        <% pstmtExercice2.close(); %>
    <% } %>

    <h2>Exercice 3 : Modification du titre du film</h2>
    <p>Créer un fichier permettant de modifier le titre d'un film sur la base de son ID (ID choisi par l'utilisateur).</p>

    <%-- Formulaire pour l'exercice 3 --%>
    <form action="#" method="post">
        <p>Saisir l'ID du film : <input type="text" id="inputIdFilm" name="idFilm"></p>
        <p>Saisir le nouveau titre : <input type="text" id="inputNouveauTitre" name="nouveauTitre"></p>
        <p><input type="submit" value="Modifier"></p>
    </form>

    <%-- Récupération des valeurs pour l'exercice 3 --%>
    <% String idFilm = request.getParameter("idFilm"); %>
    <% String nouveauTitre = request.getParameter("nouveauTitre"); %>
    <% if (idFilm != null && nouveauTitre != null && !idFilm.isEmpty() && !nouveauTitre.isEmpty()) { %>
        <% 
        String sqlExercice3 = "UPDATE Film SET titre = ? WHERE idFilm = ?";
        PreparedStatement pstmtExercice3 = conn.prepareStatement(sqlExercice3);
        pstmtExercice3.setString(1, nouveauTitre);
        pstmtExercice3.setInt(2, Integer.parseInt(idFilm));
        int rowsUpdated = pstmtExercice3.executeUpdate();
        %>
        <p><%= rowsUpdated %> film(s) mis à jour.</p>
        <% pstmtExercice3.close(); %>
    <% } %>

    <h2>Exercice 4 : Ajout d'un nouveau film</h2>
    <p>Créer un formulaire pour saisir un nouveau film dans la base de données.</p>

    <%-- Formulaire pour l'exercice 4 --%>
    <form action="#" method="post">
        <p>Saisir le titre du film : <input type="text" id="inputTitreFilm" name="titreFilm"></p>
        <p>Saisir l'année du film : <input type="text" id="inputAnneeFilm" name="anneeFilm"></p>
        <p><input type="submit" value="Ajouter"></p>
    </form>

    <%-- Récupération des valeurs pour l'exercice 4 --%>
    <% String titreFilm = request.getParameter("titreFilm"); %>
    <% String anneeFilm = request.getParameter("anneeFilm"); %>
    <% if (titreFilm != null && anneeFilm != null && !titreFilm.isEmpty() && !anneeFilm.isEmpty()) { %>
        <% 
        String sqlExercice4 = "INSERT INTO Film (titre, annee) VALUES (?, ?)";
        PreparedStatement pstmtExercice4 = conn.prepareStatement(sqlExercice4);
        pstmtExercice4.setString(1, titreFilm);
        pstmtExercice4.setInt(2, Integer.parseInt(anneeFilm));
        int rowsInserted = pstmtExercice4.executeUpdate();
        %>
        <p><%= rowsInserted %> film(s) ajouté(s).</p>
        <% pstmtExercice4.close(); %>
    <% } %>

    <%-- Fermer la connexion --%>
    <% conn.close(); %>
<hr>
<h3>Projet Bibliothèque</h3>
<p>Votre projet consiste à concevoir et développer une application de gestion de bibliothèque moderne qui simplifie le processus de prêt et de retour de livres. Les fonctionnalités attendues dans le cadre de ce projet sont les suivantes :
<ul>
<li>L’enregistrement et la suppression de livres.</li>
<li>La recherche de livres disponibles.</li>
<li>L'emprunt possible d'un livre par un utilisateur.</li>
<li>La gestion des utilisateurs.</li>
<li>La gestion des stocks.</li>
</ul>
Votre travail est de créer votre code afin de répondre aux besoins définis ci-dessus. L'application exploitera le language JSP (JAVA) pour interagir avec la base de données MariaDB.
L’application pourra être enrichie avec des fonctionnalités supplémentaires telles que des recommandations de livres, des notifications pour les retours en retard, ou encore des rapports statistiques sur l'utilisation des livres pour améliorer l'expérience utilisateur et la gestion de la bibliothèque.
</p>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
