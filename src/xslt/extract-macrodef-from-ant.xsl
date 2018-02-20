<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:doc="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="doc"
    version="2.0">

    <doc:doc id="markdown">
        <doc:desc>
---
project:    XML - Practical ANT Scripts
title:      extract-macrodef-from-ant.xsl
date:       2018-02-15
author:     Philip Hodder
contact:    philip.hodder@encodis.com
summary:    Extract macrodefs from ANT build files
...

# extract-macrodef-from-ant.xsl

This stylesheet extracts `&lt;macrodef&gt;` elements from ANT build files.
        </doc:desc>
        <doc:log>
## Change Log

##### 2018-02-15 (PH) Initial version

        </doc:log>
    </doc:doc>

    <xsl:output omit-xml-declaration="yes" indent="yes"/>

    <xsl:template match="/project">
            <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="macrodef">
        <xsl:copy-of select="."/>
    </xsl:template>

	<xsl:template match="text()" mode="#all"/>

</xsl:stylesheet>
