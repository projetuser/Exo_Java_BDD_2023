<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Exercices sur les boucles</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .pattern-container { text-align: left; display: inline-block; background: #f4f4f4; padding: 10px; border-radius: 5px; font-family: monospace; white-space: pre; }
    </style>
</head>
<body bgcolor=white>
    <h1>Exercices sur les boucles</h1>
    <form action="#" method="post">
        <label for="inputValeur">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur" name="valeur">
        <input type="submit" value="Afficher">
    </form>

    <% String valeur = request.getParameter("valeur"); %>
    <% if (valeur != null && !valeur.isEmpty()) { 
        int n = Integer.parseInt(valeur);
    %>
    
    <h2>Exercice 1 : Carré d'étoiles</h2>
    <div class="pattern-container">
        <% for (int i = 0; i < n; i++) { %>
            <% for (int j = 0; j < n; j++) { %>
                *
            <% } %>
            <br>
        <% } %>
    </div>

    <h2>Exercice 2 : Triangle rectangle gauche</h2>
    <div class="pattern-container">
        <% for (int i = 1; i <= n; i++) { %>
            <% for (int j = 0; j < i; j++) { %>
                *
            <% } %>
            <br>
        <% } %>
    </div>
    
    <h2>Exercice 3 : Triangle rectangle inversé</h2>
    <div class="pattern-container">
        <% for (int i = n; i > 0; i--) { %>
            <% for (int j = 0; j < i; j++) { %>
                *
            <% } %>
            <br>
        <% } %>
    </div>
    
    <h2>Exercice 4 : Triangle rectangle droite</h2>
    <div class="pattern-container">
        <% for (int i = 1; i <= n; i++) { %>
            <% for (int j = 0; j < n - i; j++) { %>&nbsp;<% } %>
            <% for (int j = 0; j < i; j++) { %>*<% } %>
            <br>
        <% } %>
    </div>
    
    <h2>Exercice 7 : Table de multiplication</h2>
    <div class="pattern-container">
        <% for (int i = 1; i <= 10; i++) { %>
            <%= n %> x <%= i %> = <%= n * i %><br>
        <% } %>
    </div>
    
    <% } %>
    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
