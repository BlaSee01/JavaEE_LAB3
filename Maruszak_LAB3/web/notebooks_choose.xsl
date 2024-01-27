<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:param name="nameParam"/>
<xsl:param name="manufacturerParam"/>
<xsl:param name="typeParam"/>
<xsl:param name="materialParam"/>
<xsl:param name="sizeParam"/>
<xsl:param name="gramParam"/>
<xsl:param name="cover_typeParam"/>
<xsl:param name="number_pagesParam"/>
<xsl:param name="price_plnParam"/>
<xsl:param name="has_numbered_pagesParam"/>

<xsl:template match="/notebooks">
  <html>
    <head>
      <title>Notebooks</title>
    </head>
    <body>
      <h1>Notebooks</h1>
      <table border="1">
        <tr>
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
        <xsl:apply-templates select="notebook">
          <xsl:with-param name="nameParam" select="$nameParam"/>
          <xsl:with-param name="manufacturerParam" select="$manufacturerParam"/>
          <xsl:with-param name="typeParam" select="$typeParam"/>
          <xsl:with-param name="materialParam" select="$materialParam"/>
          <xsl:with-param name="sizeParam" select="$sizeParam"/>
          <xsl:with-param name="gramParam" select="$gramParam"/>
          <xsl:with-param name="cover_typeParam" select="$cover_typeParam"/>
          <xsl:with-param name="number_pagesParam" select="$number_pagesParam"/>
          <xsl:with-param name="price_plnParam" select="$price_plnParam"/>
          <xsl:with-param name="has_numbered_pagesParam" select="$has_numbered_pagesParam"/>
        </xsl:apply-templates>
      </table>
    </body>
  </html>
</xsl:template>

<xsl:template match="notebook">
  <xsl:param name="nameParam"/>
  <xsl:param name="manufacturerParam"/>
  <xsl:param name="typeParam"/>
  <xsl:param name="materialParam"/>
  <xsl:param name="sizeParam"/>
  <xsl:param name="gramParam"/>
  <xsl:param name="cover_typeParam"/>
  <xsl:param name="number_pagesParam"/>
  <xsl:param name="price_plnParam"/>
  <xsl:param name="has_numbered_pagesParam"/>

  <xsl:if test="(not($nameParam) or contains(name, $nameParam)) and
                (not($manufacturerParam) or contains(manufacturer, $manufacturerParam)) and
                (not($typeParam) or contains(type, $typeParam)) and
                (not($materialParam) or contains(material, $materialParam)) and
                (not($sizeParam) or contains(size, $sizeParam)) and
                (not($gramParam) or contains(gram, $gramParam)) and
                (not($cover_typeParam) or contains(cover_type, $cover_typeParam)) and
                (not($number_pagesParam) or contains(number_pages, $number_pagesParam)) and
                (not($price_plnParam) or contains(price_pln, $price_plnParam)) and
                (not($has_numbered_pagesParam) or contains(has_numbered_pages, $has_numbered_pagesParam))">
    <tr>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="manufacturer"/></td>
      <td><xsl:value-of select="type"/></td>
      <td><xsl:value-of select="material"/></td>
      <td><xsl:value-of select="size"/></td>
      <td><xsl:value-of select="gram"/></td>
      <td><xsl:value-of select="cover_type"/></td>
      <td><xsl:value-of select="number_pages"/></td>
      <td><xsl:value-of select="price_pln"/></td>
      <td><xsl:value-of select="has_numbered_pages"/></td>
    </tr>
  </xsl:if>
</xsl:template>
</xsl:stylesheet>
