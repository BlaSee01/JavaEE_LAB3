<%-- 
    Document   : login
    Created on : 2024-01-18, 11:35:30
    Author     : student
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <%
        String log = "student";
        String pass = "wcy";

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if (login != null && password != null && login.equals(log) && password.equals(pass)) {
            session.setAttribute("loggedIn", true);
    %>
    <p>Udało się!</p>
     <script>
                setTimeout(function() {
                    window.location.href='index.html';
                }, 3000);
            </script>
    <%
        } else {
    %>
    <p>Błąd! Za chwilę spróbuj ponownie.</p>
     <script>
                setTimeout(function() {
                    window.location.href='index.logowanie.html';
                }, 3000);
            </script>
    <%
        }
    %>
</body>
</html>

