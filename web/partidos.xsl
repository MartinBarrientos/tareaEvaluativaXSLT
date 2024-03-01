<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<!-- plantilla principal de partidos -->
<xsl:template match="partidos">
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main>
			<h1>PARTIDOS</h1>
			<table>				
				<tr>
					<th>PARTIDO</th>
					<th>FECHA</th>
					<th>RESULTADO</th>
				</tr>
				<!-- usamos un for each para iterar cada partido jugado en lima-->
				<xsl:for-each select="partido[lugar/@ciudad='Lima']">
				<!-- usamos sort para ordenar el partido segun fecha en orden de más reciente a más antiguo -->
				<xsl:sort select="fecha" data-type="date" order="descending"/>
				<!-- mostramos nombre de los equipos y fecha -->
				<tr>
					<td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
					<td><xsl:value-of select="fecha"/></td>
					<!-- creamos varibles con la puntuacion de los equipos, local y visitante -->
					<xsl:variable name="pLocal" select="equipos/local/@puntuacion"/>
					<xsl:variable name="pVisitante" select="equipos/visitante/@puntuacion"/>
					<!-- Aplicamos condicion de NO aplicar la clase azul si el equipo local gana usando un if -->
					<xsl:if test="$pLocal > $pVisitante">
					<td><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
					</xsl:if>
					<!-- Aplicamos condicion de aplicar la clase azul si el equipo visitante gana usando un if -->					
					<xsl:if test="$pLocal &lt; $pVisitante">	
					<td class="azul"><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
					</xsl:if>
							
				</tr>
				</xsl:for-each>
			</table>			
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>


</xsl:stylesheet>