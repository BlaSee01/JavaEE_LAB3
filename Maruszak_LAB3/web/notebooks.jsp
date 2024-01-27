<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="5; url=index.html" />
    <title>NOTEBOOKS</title>
</head>
<body>
    <c:import url="notebooks.xml" var="baza" />
    <x:parse doc="${baza}" var="wynik"/>
    <h1>NOTEBOOKS</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Manufacturer</th>
            <th>Type</th>
            <th>Material</th>
            <th>Size</th>
            <th>Gram</th>
            <th>Cover type</th>
            <th>Number pages</th>
            <th>Price PLN</th>
            <th>Has numbered pages</th>
        </tr>

        <x:forEach select="$wynik/notebooks/notebook" var="notebook">
            <tr>
                <td><x:out select="@id" /></td>
                <td><x:out select="name" /></td>
                <td><x:out select="manufacturer" /></td>
                <td><x:out select="type" /></td>
                <td><x:out select="material" /></td>
                <td><x:out select="size" /></td>
                <td><x:out select="gram" /></td>
                <td><x:out select="cover_type" /></td>
                <td><x:out select="number_pages" /></td>
                <td><x:out select="price_pln" /></td>
                <td><x:out select="has_numbered_pages" /></td>
            </tr>
        </x:forEach>
    </table>
    <button onclick="window.location.href='index.html'">Powrót</button>
</body>
</html>
