<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les conditions</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .result-container { text-align: left; display: inline-block; background: #f4f4f4; padding: 10px; border-radius: 5px; font-family: monospace; }
        .input-group { margin-bottom: 10px; }
    </style>
</head>
<body>
    <h1>Exercices sur les conditions</h1>
    
    <form action="#" method="post">
        <div class="input-group">
            <label for="valeur1">Saisir la valeur 1 :</label>
            <input type="text" id="valeur1" name="valeur1">
        </div>
        
        <div class="input-group">
            <label for="valeur2">Saisir la valeur 2 :</label>
            <input type="text" id="valeur2" name="valeur2">
        </div>

        <div class="input-group">
            <label for="valeur3">Saisir la valeur 3 :</label>
            <input type="text" id="valeur3" name="valeur3">
        </div>

        <input type="submit" value="Afficher">
    </form>

    <% 
        String valeur1 = request.getParameter("valeur1");
        String valeur2 = request.getParameter("valeur2");
        String valeur3 = request.getParameter("valeur3");

        if (valeur1 != null && valeur2 != null && !valeur1.isEmpty() && !valeur2.isEmpty()) { 
            int intValeur1 = Integer.parseInt(valeur1);
            int intValeur2 = Integer.parseInt(valeur2);
    %>

    <h2>Résultat de la comparaison</h2>
    <div class="result-container">
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
    </div>

    <% } %>

    <% if (valeur1 != null && valeur2 != null && valeur3 != null && 
          !valeur1.isEmpty() && !valeur2.isEmpty() && !valeur3.isEmpty()) { 
        int A = Integer.parseInt(valeur1);
        int B = Integer.parseInt(valeur2);
        int C = Integer.parseInt(valeur3);
    %>

    <h2>Exercice 1 : C est-il compris entre A et B ?</h2>
    <div class="result-container">
        <% if (C >= Math.min(A, B) && C <= Math.max(A, B)) { %>
            <p>Oui, C (= <%= C %>) est compris entre A (= <%= A %>) et B (= <%= B %>).</p>
        <% } else { %>
            <p>Non, C (= <%= C %>) n'est pas compris entre A (= <%= A %>) et B (= <%= B %>).</p>
        <% } %>
    </div>

    <% } %>

    <% if (valeur1 != null && !valeur1.isEmpty()) { 
        int nombre = Integer.parseInt(valeur1);
    %>

    <h2>Exercice 2 : Pair ou impair ?</h2>
    <div class="result-container">
        <% if (nombre % 2 == 0) { %>
            <p><%= nombre %> est un nombre pair.</p>
        <% } else { %>
            <p><%= nombre %> est un nombre impair.</p>
        <% } %>
    </div>

    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
