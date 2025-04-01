<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
    // Déclaration de la classe Task
    class Task {
        private String titre;
        private String description;
        private String dateEcheance;
        private boolean termine;

        public Task(String titre, String description, String dateEcheance) {
            this.titre = titre;
            this.description = description;
            this.dateEcheance = dateEcheance;
            this.termine = false;
        }

        public String getTitre() {
            return titre;
        }

        public String getDescription() {
            return description;
        }

        public String getDateEcheance() {
            return dateEcheance;
        }

        public boolean isTermine() {
            return termine;
        }

        public void setTermine(boolean termine) {
            this.termine = termine;
        }
    }

    // Récupérer la liste des tâches depuis la session
    ArrayList<Task> taches = (ArrayList<Task>) session.getAttribute("taches");

    if (taches == null) {
        taches = new ArrayList<Task>();
    }

    // Suppression d'une tâche
    String supprimerIndex = request.getParameter("supprimerIndex");
    if (supprimerIndex != null) {
        int index = Integer.parseInt(supprimerIndex);
        if (index >= 0 && index < taches.size()) {
            taches.remove(index);
        }
    }

    // Marquer une tâche comme terminée
    String terminerIndex = request.getParameter("terminerIndex");
    if (terminerIndex != null) {
        int index = Integer.parseInt(terminerIndex);
        if (index >= 0 && index < taches.size()) {
            taches.get(index).setTermine(true);
        }
    }
%>

<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body bgcolor="white">
    <h1>Liste des Tâches</h1>

    <% if (taches.isEmpty()) { %>
        <p>Aucune tâche à afficher.</p>
    <% } else { %>
        <table border="1">
            <tr>
                <th>Titre</th>
                <th>Description</th>
                <th>Date d'échéance</th>
                <th>Terminé</th>
                <th>Actions</th>
            </tr>
            <% 
                for (int i = 0; i < taches.size(); i++) {
                    Task task = taches.get(i);
            %>
            <tr>
                <td><%= task.getTitre() %></td>
                <td><%= task.getDescription() %></td>
                <td><%= task.getDateEcheance() %></td>
                <td><%= task.isTermine() ? "Oui" : "Non" %></td>
                <td>
                    <% if (!task.isTermine()) { %>
                        <a href="afficherTaches.jsp?terminerIndex=<%= i %>">Marquer comme terminée</a>
                    <% } %> |
                    <a href="afficherTaches.jsp?supprimerIndex=<%= i %>">Supprimer</a>
                </td>
            </tr>
            <% 
                }
            %>
        </table>
    <% } %>

    <br>
    <a href="index.jsp">Retour à l'accueil</a>

</body>
</html>
