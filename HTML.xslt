<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html">]]></xsl:text>
		<html>
			<head>
				<meta charset="utf-8" />
				<link href='http://fonts.googleapis.com/css?family=Lemon:400,700&amp;subset=latin-ext' rel='stylesheet' type='text/css'/>
				<title>IMDB top 250 movies on netflix.co.uk</title>
				<style type="text/css">
					body { font-family: 'Lemon', serif; background-color: #900; color: #fff; text-align:center;}
					h1 {text-align:center; margin: 20px; font-weight:normal; font-size: 1.5em;}
					ul {list-style: none; margin: 20px; auto; background-color:#252525; display:inline-block; padding: 15px; text-align:left; font-size:1.1em; color: #ccc;}
					li {padding: 10px 10px;}
					.success { color: #0c0;}
					.failure {color: #c00;}
					.success, .failure {float:right; margin-left:1em;}
					.hover {background-color: #fff; color: #000;}
				</style>
			</head>
			<body>
				<h1>Movies in the IMDB top 250 that are available on Netflix UK</h1>
				<ul>
					<xsl:apply-templates/>
				</ul>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="failure">
		<li onmouseover="this.setAttribute('class', 'hover')" onmouseout="this.setAttribute('class', '')"><xsl:value-of select="substring(../@name, 26, (string-length(../@name)) - 28)"/><span class="failure">&#x2718;</span></li>
	</xsl:template>

	<xsl:template match="testcase[.='']">
		<li onmouseover="this.setAttribute('class', 'hover')" onmouseout="this.setAttribute('class', '')"><xsl:value-of select="substring(@name, 26, (string-length(@name)) - 28)"/><span class="success">&#x2714;</span></li>
	</xsl:template>

	<xsl:template match="text()"></xsl:template>

</xsl:stylesheet>
