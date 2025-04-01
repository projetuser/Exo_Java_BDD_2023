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

    // Initialisation de la liste des tâches dans la session
    ArrayList<Task> taches = (ArrayList<Task>) session.getAttribute("taches");

    if (taches == null) {
        taches = new ArrayList<Task>();
        session.setAttribute("taches", taches);
    }

    // Traitement du formulaire
    String titre = request.getParameter("titre");
    String description = request.getParameter("description");
    String dateEcheance = request.getParameter("dateEcheance");

    if (titre != null && description != null && dateEcheance != null && !titre.isEmpty() && !description.isEmpty() && !dateEcheance.isEmpty()) {
        Task newTask = new Task(titre, description, dateEcheance);
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
