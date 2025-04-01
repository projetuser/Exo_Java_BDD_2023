<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body bgcolor="white">
    <h1>Gérer vos Tâches</h1>

    <!-- Formulaire pour ajouter une tâche -->
    <h2>Ajouter une nouvelle tâche</h2>
    <form action="taches.jsp" method="post">
        <label for="titre">Titre de la tâche : </label>
        <input type="text" id="titre" name="titre" required>
        <br>
        <label for="description">Description de la tâche : </label>
        <input type="text" id="description" name="description" required>
        <br>
        <input type="submit" value="Ajouter la tâche">
    </form>

    <% 
        // Déclaration de la classe Task (tâche)
        class Task {
            private String titre;
            private String description;

            public Task(String titre, String description) {
                this.titre = titre;
                this.description = description;
            }

            public String getTitre() {
                return titre;
            }

            public String getDescription() {
                return description;
            }
        }

        // Vérifier si la liste de tâches existe déjà dans la session
        ArrayList<Task> taches = (ArrayList<Task>) session.getAttribute("taches");

        // Si la liste de tâches n'existe pas, on l'initialise
        if (taches == null) {
            taches = new ArrayList<Task>();
            session.setAttribute("taches", taches);
        }

        // Traitement du formulaire d'ajout de tâche
        String titre = request.getParameter("titre");
        String description = request.getParameter("description");

        if (titre != null && description != null && !titre.isEmpty() && !description.isEmpty()) {
            Task newTask = new Task(titre, description);
            taches.add(newTask);  // Ajouter la tâche à la liste
        }
    %>

    <!-- Affichage des tâches -->
    <h2>Liste des Tâches</h2>
    <table border="1">
        <tr>
            <th>Titre</th>
            <th>Description</th>
        </tr>
        <% 
            // Afficher chaque tâche de la liste
            for (Task task : taches) {
        %>
        <tr>
            <td><%= task.getTitre() %></td>
            <td><%= task.getDescription() %></td>
        </tr>
        <% 
            }
        %>
    </table>

</body>
</html>
