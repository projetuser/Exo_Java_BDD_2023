<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    java.util.List<com.todo.Task> tasks = (java.util.List<com.todo.Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new java.util.ArrayList<>();
        session.setAttribute("tasks", tasks);
    }
%>
<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body>
    <h1>Liste des Tâches</h1>
    <table border="1">
        <tr>
            <th>Titre</th>
            <th>Description</th>
            <th>Date d'échéance</th>
            <th>Statut</th>
            <th>Actions</th>
        </tr>
        <% for (com.todo.Task task : tasks) { %>
        <tr>
            <td><%= task.getTitle() %></td>
            <td><%= task.getDescription() %></td>
            <td><%= task.getDueDate() %></td>
            <td><%= task.isCompleted() ? "Terminée" : "En cours" %></td>
            <td>
                <form action="TaskServlet" method="post">
                    <input type="hidden" name="title" value="<%= task.getTitle() %>">
                    <input type="submit" name="action" value="Terminer">
                    <input type="submit" name="action" value="Supprimer">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
    <br>
    <a href="addTask.jsp">Ajouter une tâche</a>
</body>
</html>
