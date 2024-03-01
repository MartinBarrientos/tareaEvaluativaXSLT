<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<!-- plantilla principal de la tienda -->
<xsl:template match="tienda">
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

		<main class="principal">		
		<!-- Primero aplicamos un for-each para cada artículo -->
		<xsl:for-each select="articulo">
			<article>
				<section>
				<!-- guardamos el nombre de la foto en una variable para poder aplicarla en la ruta-->
					<xsl:variable name="camiseta" select="@foto"/>
					<img class="articulo" src="../img/{$camiseta}"/>			
				</section>
				<section>
				<!-- obtendremos el precio de los articulos, los comentarios y el numero de comentarios de cada articulo -->
					<h2><xsl:value-of select="precio"/> €</h2>
					<h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
					<ul>
					<!-- Aplicamos otro for-each para cada comentario -->
						<xsl:for-each select="./comentarios">
							<li><xsl:value-of select="./@fecha"/>: <xsl:value-of select="."/></li>
						</xsl:for-each>						
					</ul>
				</section>
			</article>
		</xsl:for-each>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>


</xsl:stylesheet>