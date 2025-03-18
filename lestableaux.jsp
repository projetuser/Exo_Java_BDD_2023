<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les tableaux</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .result-container { text-align: left; display: inline-block; background: #f4f4f4; padding: 10px; border-radius: 5px; font-family: monospace; margin: 10px 0; }
        .input-group { margin-bottom: 10px; }
    </style>
</head>
<body>
    <h1>Exercices sur les tableaux</h1>
    
    <form action="#" method="post">
        <div class="input-group">
            <label for="chaine">Saisir au minimum 3 chiffres à la suite (ex: 6 78 15) :</label>
            <input type="text" id="chaine" name="chaine">
        </div>
        <input type="submit" value="Afficher">
    </form>

    <%
        String chaine = request.getParameter("chaine");

        if (chaine != null && !chaine.trim().isEmpty()) { 
            String[] tableauDeChiffres = chaine.trim().split("\\s+");
            int taille = tableauDeChiffres.length;
            
            if (taille >= 3) {
                int[] nombres = new int[taille];
                boolean erreur = false;

                // Conversion en entiers avec gestion des erreurs
                for (int i = 0; i < taille; i++) {
                    try {
                        nombres[i] = Integer.parseInt(tableauDeChiffres[i]);
                    } catch (NumberFormatException e) {
                        erreur = true;
                        break;
                    }
                }

                if (!erreur) {
    %>

    <h2>Informations générales</h2>
    <div class="result-container">
        <p>Votre tableau contient <strong><%= taille %></strong> valeurs.</p>
        <ul>
            <% for (int i = 0; i < taille; i++) { %>
                <li>Chiffre <%= (i + 1) %> : <strong><%= nombres[i] %></strong></li>
            <% } %>
        </ul>
    </div>

    <h2>Exercice 1 : Carré de la première valeur</h2>
    <div class="result-container">
        <p>Le carré de <%= nombres[0] %> est <strong><%= nombres[0] * nombres[0] %></strong></p>
    </div>

    <h2>Exercice 2 : Somme des 2 premières valeurs</h2>
    <div class="result-container">
        <p>La somme de <%= nombres[0] %> et <%= nombres[1] %> est <strong><%= nombres[0] + nombres[1] %></strong></p>
    </div>

    <h2>Exercice 3 : Somme de toutes les valeurs</h2>
    <div class="result-container">
        <%
            int sommeTotale = 0;
            for (int num : nombres) {
                sommeTotale += num;
            }
        %>
        <p>La somme totale des valeurs est <strong><%= sommeTotale %></strong></p>
    </div>

    <h2>Exercice 4 : Valeur maximale</h2>
    <div class="result-container">
        <%
            int max = nombres[0];
            for (int num : nombres) {
                if (num > max) max = num;
            }
        %>
        <p>La valeur maximale est <strong><%= max %></strong></p>
    </div>

    <h2>Exercice 5 : Valeur minimale</h2>
    <div class="result-container">
        <%
            int min = nombres[0];
            for (int num : nombres) {
                if (num < min) min = num;
            }
        %>
        <p>La valeur minimale est <strong><%= min %></strong></p>
    </div>

    <h2>Exercice 6 : Valeur la plus proche de 0</h2>
    <div class="result-container">
        <%
            int procheDeZero = nombres[0];
            for (int num : nombres) {
                if (Math.abs(num) < Math.abs(procheDeZero)) {
                    procheDeZero = num;
                }
            }
        %>
        <p>La valeur la plus proche de 0 est <strong><%= procheDeZero %></strong></p>
    </div>

    <h2>Exercice 7 : Valeur la plus proche de 0 (priorité au positif)</h2>
    <div class="result-container">
        <%
            int procheZeroPositif = nombres[0];
            for (int num : nombres) {
                if (Math.abs(num) < Math.abs(procheZeroPositif) || 
                    (Math.abs(num) == Math.abs(procheZeroPositif) && num > 0)) {
                    procheZeroPositif = num;
                }
            }
        %>
        <p>La valeur la plus proche de 0 (positif en cas d'égalité) est <strong><%= procheZeroPositif %></strong></p>
    </div>

    <% 
                } else { // Gestion des erreurs de saisie 
    %>
        <p style="color: red;">Erreur : Veuillez entrer uniquement des nombres séparés par des espaces.</p>
    <%
                }
            } else { // Si l'utilisateur entre moins de 3 valeurs
    %>
        <p style="color: red;">Erreur : Veuillez entrer au moins 3 chiffres.</p>
    <%
            }
        }
    %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
