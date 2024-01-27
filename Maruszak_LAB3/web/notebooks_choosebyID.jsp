<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="5; url=index.html" />
    <title>Notebooks</title>
</head>
<body>
    <c:if test="${not empty param.id}">
        <c:import url="notebooks.xml" var="baza" />
        <x:parse doc="${baza}" var="wynik" />
        <c:set var="requestedId" value="${param.id}" />

        <h1>Notebooks</h1>

        <x:forEach select="$wynik/notebooks/notebook[@id=$requestedId]" var="wynik">
            <p><b>Carrier:</b> <x:out select="$wynik/name" /></p>
            <p><b>Number:</b> <x:out select="$wynik/manufacturer" /></p>
            <p><b>Route:</b> <x:out select="$wynik/type" /></p>
            <p><b>Start:</b> <x:out select="$wynik/material" /></p>
            <p><b>End:</b> <x:out select="$wynik/size" /></p>
            <p><b>Passes Through:</b> <x:out select="$wynik/gram" /></p>
            <p><b>Places:</b> <x:out select="$wynik/cover_type" /></p>
            <p><b>Ticket Price:</b> <x:out select="$wynik/number_pages" /></p>
            <p><b>Children:</b> <x:out select="$wynik/price_pln" /></p>
            <p><b>Buffet:</b> <x:out select="$wynik/has_numbered_pages" /></p>
        </x:forEach>
    </c:if>
            <button onclick="window.location.href='index.html'">Powrót</button>
</body>
</html>
