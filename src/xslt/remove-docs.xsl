<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:iso="http://purl.oclc.org/dsdl/schematron"
	xmlns:doc="http://www.oxygenxml.com/ns/doc/xsl"
	exclude-result-prefixes="xs"
	version="2.0">

    <doc:doc>
        <doc:desc>
---
project:        XML - Practical ANT Scripts
title:          remove-docs.xsl
date:           2018-02-19
author:         Philip Hodder
contact:        philip.hodder@encodis.com
summary:        Remove documentation elements from XML files
...

# remove-docs.xsl

This stylesheet removes documentation elements from an XML file.
Currently the following elements from the following namespaces are removed:

* _http://www.oxygenxml.com/ns/doc/xsl_


### Input

* Valid XML file

### Output

* XML file with documentation elements removed

        </doc:desc>
        <doc:log>
## Change Log

##### 2018-02-19 (PH) Initial version
        </doc:log>
    </doc:doc>

    <!-- use xhtml method to preserve closing tags of empty elements -->
	<xsl:output indent="no" method="xhtml"/>

 	<xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="xsl:text"/>

	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="doc:*"/>

	<!-- standard identity transform -->
	<xsl:template match="@*|node()" mode="#all">
        <xsl:copy copy-namespaces="yes"><xsl:apply-templates select="@*|node()" mode="#current"/></xsl:copy>
    </xsl:template>

</xsl:stylesheet>
