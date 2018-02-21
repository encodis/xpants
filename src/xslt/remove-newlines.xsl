<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:doc="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="doc"
    version="2.0">

    <doc:doc>
        <doc:desc>
---
project:    XML Practical ANT Scripts
title:      remove-newlines.xsl
date:       2018-02-19
author:     Philip Hodder
contact:    philip.hodder@encodis.com
summary:    Remove line breaks and indentation from an XML document
...

# remove-newlines.xsl

This stylesheet will "linearize" an XML document (removing new lines and indentation), which may
be useful for Arbortext instance documents, amongst others.

It is based on the identity transform, but copies unused namespaces and strips all "space only"
text elements.
        </doc:desc>
    </doc:doc>

    <xsl:strip-space elements="*"/>

	<xsl:template match="@*|node()" mode="#all">
        <xsl:copy copy-namespaces="yes"><xsl:apply-templates select="@*|node()" mode="#current"/></xsl:copy>
    </xsl:template>

</xsl:stylesheet>
