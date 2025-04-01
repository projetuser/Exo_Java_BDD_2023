<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.todo.Task" %>
<%
    List<Task> tasks = (List<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
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
        <% for (Task task : tasks) { %>
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
