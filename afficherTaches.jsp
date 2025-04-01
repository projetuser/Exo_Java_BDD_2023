<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>

<%
    // Récupérer la liste des tâches depuis la session
    ArrayList<HashMap<String, String>> taches = (ArrayList<HashMap<String, String>>) session.getAttribute("taches");

    if (taches == null) {
        taches = new ArrayList<HashMap<String, String>>();
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
            HashMap<String, String> task = taches.get(index);
            task.put("termine", "true");
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
                    HashMap<String, String> task = taches.get(i);
            %>
            <tr>
                <td><%= task.get("titre") %></td>
                <td><%= task.get("description") %></td>
                <td><%= task.get("dateEcheance") %></td>
                <td><%= task.get("termine").equals("true") ? "Oui" : "Non" %></td>
                <td>
                    <% if (!task.get("termine").equals("true")) { %>
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
