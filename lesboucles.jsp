<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les boucles</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>

<%-- Boucle for pour afficher une ligne d'étoiles --%>
    <%int cpt = Integer.parseInt(valeur); %>
    <p>
    <% for (int i = 1; i <= cpt; i++) { %>
       <%= "*" %>
    <% } %>
    </p>

<h2>Exercice 1 : Le carré d'étoiles</h2>
<p>Ecrire le code afin de produire un carré d'étoile</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<p>*****</br>*****</br>*****</br>*****</br>*****</p>

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
<p>Ecrire le code afin de créser une table de multiplication</p>
<p>Exemple si l'utilisateur saisie le valeur 5</p>
<p>5 x 1 = 5</p>
<p>5 x 2 = 10</p>
<p>5 x 3 = 15</p>
<p>5 x 4 = 20</p>
<p>5 x 5 = 25</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercices de motifs</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        pre { text-align: left; display: inline-block; background: #f4f4f4; padding: 10px; border-radius: 5px; }
    </style>
</head>
<body>
    <h1>Exercices de motifs en étoiles</h1>
    <label for="numberInput">Entrez une valeur :</label>
    <input type="number" id="numberInput" min="1" value="5">
    <button onclick="generatePatterns()">Générer</button>
    <div id="output"></div>

    <script>
        function generatePatterns() {
            let n = parseInt(document.getElementById('numberInput').value);
            let output = "";

            function addPattern(title, pattern) {
                output += `<h2>${title}</h2><pre>${pattern}</pre>`;
            }

            // Exercice 1 : Carré d'étoiles
            let square = "";
            for (let i = 0; i < n; i++) square += "*".repeat(n) + "\n";
            addPattern("Carré d'étoiles", square);

            // Exercice 2 : Triangle rectangle gauche
            let leftTriangle = "";
            for (let i = 1; i <= n; i++) leftTriangle += "*".repeat(i) + "\n";
            addPattern("Triangle rectangle gauche", leftTriangle);

            // Exercice 3 : Triangle rectangle inversé
            let invertedTriangle = "";
            for (let i = n; i > 0; i--) invertedTriangle += "*".repeat(i) + "\n";
            addPattern("Triangle rectangle inversé", invertedTriangle);

            // Exercice 4 : Triangle rectangle droite
            let rightTriangle = "";
            for (let i = 1; i <= n; i++) rightTriangle += " ".repeat(n - i) + "*".repeat(i) + "\n";
            addPattern("Triangle rectangle droite", rightTriangle);

            // Exercice 5 : Triangle isocèle
            let isosceles = "";
            for (let i = 1; i <= n; i++) isosceles += " ".repeat(n - i) + "*".repeat(i) + "\n";
            addPattern("Triangle isocèle", isosceles);

            // Exercice 6 : Demi-losange
            let halfDiamond = "";
            for (let i = 1; i <= n; i++) halfDiamond += " ".repeat(n - i) + "*".repeat(i) + "\n";
            for (let i = n; i > 0; i--) halfDiamond += " ".repeat(n - i) + "*".repeat(i) + "\n";
            addPattern("Demi-losange", halfDiamond);

            // Exercice 7 : Table de multiplication
            let multiplicationTable = "";
            for (let i = 1; i <= 10; i++) multiplicationTable += `${n} x ${i} = ${n * i}\n`;
            addPattern("Table de multiplication", multiplicationTable);

            document.getElementById("output").innerHTML = output;
        }
    </script>
</body>
</html>

