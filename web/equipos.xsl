<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<!-- plantilla para los equipos -->
<xsl:template match="equipos">
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
		</header>>
		
		<main>
			<!-- variable del entrenador -->			
			<xsl:variable name="entrenador" select="equipo/entrenador[nombre='Julio Velasco']/nombre"/>
			<!-- variable de la URL -->
			<xsl:variable name="url" select="equipo/entrenador[nombre=$entrenador]/url"/>
				<h1><a href="{$url}"><xsl:value-of select="$entrenador"/></a></h1>
			<article class="equipos">
				<h4><xsl:value-of select="equipo/entrenador[nombre=$entrenador]/../nombre"/></h4>
				<!--nombre y dorsal de los jugadores titulares del primer equipo -->
					<p> <xsl:apply-templates select="equipo/entrenador[nombre=$entrenador]/../jugadores/jugador[@titular='si'][1]//@camiseta"/> - <xsl:apply-templates select="equipo/entrenador[nombre=$entrenador]/../jugadores/jugador[@titular='si'][1]//nombre"/></p>
					<p> <xsl:apply-templates select="equipo/entrenador[nombre=$entrenador]/../jugadores/jugador[@titular='si'][2]//@camiseta"/> - <xsl:apply-templates select="equipo/entrenador[nombre=$entrenador]/../jugadores/jugador[@titular='si'][2]//nombre"/></p>

			</article>			
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>


</xsl:stylesheet>