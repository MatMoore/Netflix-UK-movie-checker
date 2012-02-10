<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">]]></xsl:text>
        <html>
            <head>
                <title>
                    xUnit.net Test Results - <xsl:value-of select="@name"/>
                </title>
                <style type="text/css">
                    body { font-family: Calibri, Verdana, Arial, sans-serif; background-color: White; color: Black; }
                    h2,h3,h4,h5 { margin: 0; padding: 0; }
                    h3 { font-weight: normal; }
                    h5 { font-weight: normal; font-style: italic; margin-bottom: 0.75em; }
                    pre { font-family: Consolas; font-size: 85%; margin: 0 0 0 1em; padding: 0; }
                    .divided { border-top: solid 1px #f0f5fa; padding-top: 0.5em; }
                    .row, .altrow { padding: 0.1em 0.3em; }
                    .row { background-color: #f0f5fa; }
                    .altrow { background-color: #e1ebf4; }
                    .success, .failure, .skipped { font-family: Arial Unicode MS; font-weight: normal; float: left; width: 1em; display: block; }
                    .success { color: #0c0; }
                    .failure { color: #c00; }
                    .skipped { color: #cc0; }
                    .timing { float: right; }
                    .indent { margin: 0.25em 0 0.5em 2em; }
                    .clickable { cursor: pointer; }
                    .testcount { font-size: 85%; }
                </style>
                <script language="javascript">
                    function ToggleClass(id) {
                        var elem = document.getElementById(id);
                        if (elem.style.display == "none") {
                            elem.style.display = "block";
                        }
                        else {
                            elem.style.display = "none";
                        }
                    }
                </script>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="failure">
        <span class="failure">&#x2718;</span> <xsl:value-of select="substring(../@name, 26, (string-length(../@name)) - 28)"/><br clear="all"/>
    </xsl:template>

    <xsl:template match="testcase[.='']">
        <span class="success">&#x2713;</span> <xsl:value-of select="substring(@name, 26, (string-length(@name)) - 28)"/><br clear="all"/>
    </xsl:template>

    <xsl:template match="text()"></xsl:template>

</xsl:stylesheet>
