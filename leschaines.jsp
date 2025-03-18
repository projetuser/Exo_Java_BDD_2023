<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les chaînes</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .result-container { text-align: left; display: inline-block; background: #f4f4f4; padding: 10px; border-radius: 5px; font-family: monospace; margin: 10px 0; }
        .input-group { margin-bottom: 10px; }
    </style>
</head>
<body>
    <h1>Exercices sur les chaînes de caractères</h1>
    
    <form action="#" method="post">
        <div class="input-group">
            <label for="chaine">Saisir une chaîne (6 caractères minimum) :</label>
            <input type="text" id="chaine" name="chaine">
        </div>
        <input type="submit" value="Afficher">
    </form>

    <% 
        String chaine = request.getParameter("chaine");

        if (chaine != null && !chaine.isEmpty() && chaine.length() >= 6) { 
    %>

    <h2>Informations générales</h2>
    <div class="result-container">
        <% int longueurChaine = chaine.length(); %>
        <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères.</p>

        <% char caractereExtrait = chaine.charAt(2); %>
        <p>Le 3° caractère de votre chaîne est : <strong><%= caractereExtrait %></strong></p>

        <% String sousChaine = chaine.substring(2, 6); %>
        <p>Une sous-chaîne extraite : <strong><%= sousChaine %></strong></p>

        <% int position = chaine.indexOf('e'); %>
        <p>Le premier "e" apparaît à la position : <strong><%= position %></strong></p>
    </div>

    <h2>Exercice 1 : Nombre de 'e'</h2>
    <div class="result-container">
        <% 
            int compteurE = 0;
            for (int i = 0; i < chaine.length(); i++) {
                if (chaine.charAt(i) == 'e') {
                    compteurE++;
                }
            }
        %>
        <p>Votre texte contient <strong><%= compteurE %></strong> lettre(s) "e".</p>
    </div>

    <h2>Exercice 2 : Affichage vertical</h2>
    <div class="result-container">
        <% for (int i = 0; i < chaine.length(); i++) { %>
            <p><%= chaine.charAt(i) %></p>
        <% } %>
    </div>

    <h2>Exercice 3 : Retour à la ligne</h2>
    <div class="result-container">
        <% String[] mots = chaine.split(" "); %>
        <% for (String mot : mots) { %>
            <p><%= mot %></p>
        <% } %>
    </div>

    <h2>Exercice 4 : Une lettre sur deux</h2>
    <div class="result-container">
        <p>
        <% for (int i = 0; i < chaine.length(); i += 2) { %>
            <%= chaine.charAt(i) %>
        <% } %>
        </p>
    </div>

    <h2>Exercice 5 : Texte en verlant</h2>
    <div class="result-container">
        <p>
        <% for (int i = chaine.length() - 1; i >= 0; i--) { %>
            <%= chaine.charAt(i) %>
        <% } %>
        </p>
    </div>

    <h2>Exercice 6 : Voyelles et consonnes</h2>
    <div class="result-container">
        <% 
            int voyelles = 0, consonnes = 0;
            String voyellesSet = "aeiouyAEIOUY";
            
            for (int i = 0; i < chaine.length(); i++) {
                char c = chaine.charAt(i);
                if (Character.isLetter(c)) {
                    if (voyellesSet.indexOf(c) >= 0) {
                        voyelles++;
                    } else {
                        consonnes++;
                    }
                }
            }
        %>
        <p>Nombre de voyelles : <strong><%= voyelles %></strong></p>
        <p>Nombre de consonnes : <strong><%= consonnes %></strong></p>
    </div>

    <% } else if (chaine != null) { %>
        <p style="color: red;">Veuillez entrer un texte d'au moins 6 caractères.</p>
    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
