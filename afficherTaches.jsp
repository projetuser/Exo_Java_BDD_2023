<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>

<%
    // Initialisation de la liste des tâches dans la session
    ArrayList<HashMap<String, String>> taches = (ArrayList<HashMap<String, String>>) session.getAttribute("taches");

    if (taches == null) {
        taches = new ArrayList<HashMap<String, String>>();
        session.setAttribute("taches", taches);
    }

    // Traitement du formulaire pour ajouter une nouvelle tâche
    String titre = request.getParameter("titre");
    String description = request.getParameter("description");
    String dateEcheance = request.getParameter("dateEcheance");

    if (titre != null && description != null && dateEcheance != null && !titre.isEmpty() && !description.isEmpty() && !dateEcheance.isEmpty()) {
        HashMap<String, String> newTask = new HashMap<>();
        newTask.put("titre", titre);
        newTask.put("description", description);
        newTask.put("dateEcheance", dateEcheance);
        newTask.put("termine", "false");  // tâche non terminée par défaut
        taches.add(newTask);  // Ajouter la tâche à la liste
    }
%>

<html>
<head>
    <title>Ajouter une tâche</title>
</head>
<body bgcolor="white">
    <h1>Ajouter une nouvelle tâche</h1>

    <form action="ajouterTache.jsp" method="post">
        <label for="titre">Titre de la tâche :</label>
        <input type="text" id="titre" name="titre" required>
        <br>
        <label for="description">Description de la tâche :</label>
        <input type="text" id="description" name="description" required>
        <br>
        <label for="dateEcheance">Date d'échéance :</label>
        <input type="date" id="dateEcheance" name="dateEcheance" required>
        <br>
        <input type="submit" value="Ajouter la tâche">
    </form>

    <br>
    <a href="index.jsp">Retour à l'accueil</a>

</body>
</html>
