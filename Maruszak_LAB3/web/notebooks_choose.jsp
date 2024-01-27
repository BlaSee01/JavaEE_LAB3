<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
try {
    InputStream inputStream = application.getResourceAsStream("/notebooks.xml");
    DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
    Document doc = docBuilder.parse(inputStream);

    String nameParam = request.getParameter("name");
    String manufacturerParam = request.getParameter("manufacturer");
    String typeParam = request.getParameter("type");
    String materialParam = request.getParameter("material");
    String sizeParam = request.getParameter("size");
    String gramParam = request.getParameter("gram");
    String cover_typeParam = request.getParameter("cover_type");
    String number_pagesParam = request.getParameter("number_pages");
    String price_plnParam = request.getParameter("price_pln");
    String has_numbered_pagesParam = request.getParameter("has_numbered_pages");

    String xsltPath = application.getRealPath("notebooks_choose.xsl");
    javax.xml.transform.TransformerFactory transformerFactory = javax.xml.transform.TransformerFactory.newInstance();
    javax.xml.transform.Transformer transformer = transformerFactory.newTransformer(new javax.xml.transform.stream.StreamSource(xsltPath));
    transformer.setParameter("nameParam", nameParam);
    transformer.setParameter("manufacturerParam", manufacturerParam);
    transformer.setParameter("typeParam", typeParam);
    transformer.setParameter("materialParam", materialParam);
    transformer.setParameter("sizeParam", sizeParam);
    transformer.setParameter("gramParam", gramParam);
    transformer.setParameter("cover_typeParam", cover_typeParam);
    transformer.setParameter("number_pagesParam", number_pagesParam);
    transformer.setParameter("price_plnParam", price_plnParam);
    transformer.setParameter("has_numbered_pagesParam", has_numbered_pagesParam);
    javax.xml.transform.dom.DOMSource source = new javax.xml.transform.dom.DOMSource(doc);
    javax.xml.transform.stream.StreamResult result = new javax.xml.transform.stream.StreamResult(out);
    transformer.transform(source, result);
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="5; url=index.html" />
    <title>Notebooks</title>
</head>
<body>
   
    <c:if test="${empty nameParam or fn:contains(notebook.name, nameParam)}">
        <c:if test="${empty manufacturerParam or fn:contains(notebook.manufacturer, manufacturerParam)}">
            <c:if test="${empty typeParam or fn:contains(notebook.type, typeParam)}">
                <c:if test="${empty materialParam or fn:contains(notebook.material, materialParam)}">
                    <c:if test="${empty sizeParam or fn:contains(notebook.size, sizeParam)}">
                        <c:if test="${empty gramParam or fn:contains(notebook.gram, gramParam)}">
                            <c:if test="${empty cover_typeParam or fn:contains(notebook.cover_type, cover_typeParam)}">
                                <c:if test="${empty number_pagesParam or fn:contains(notebook.number_pages, number_pagesParam)}">
                                    <c:if test="${empty price_plnParam or fn:contains(notebook.price_pln, price_plnParam)}">
                                        <c:if test="${empty has_numbered_pagesParam or fn:contains(notebook.has_numbered_pages, has_numbered_pagesParam)}">
                                            <tr>
                                                <td>${notebook.name}</td>
                                                <td>${notebook.manufacturer}</td>
                                                <td>${notebook.type}</td>
                                                <td>${notebook.material}</td>
                                                <td>${notebook.size}</td>
                                                <td>${notebook.gram}</td>
                                                <td>${notebook.cover_type}</td>
                                                <td>${notebook.number_pages}</td>
                                                <td>${notebook.price_pln}</td>
                                                <td>${notebook.has_numbered_pages}</td>
                                            </tr>
                                        </c:if>
                                    </c:if>
                                </c:if>
                            </c:if>
                        </c:if>
                    </c:if>
                </c:if>
            </c:if>
        </c:if>
    </c:if>

<%
} catch (Exception e) {
    out.println("Błąd!" + e.getMessage());
    e.printStackTrace(new PrintWriter(out));
}
%>
    </table>
    <button onclick="window.location.href='index.html'">Powrót</button>
</body>
</html>
