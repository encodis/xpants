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
title:          schematron-remove-empty-rules.xsl
date:           2018-02-20
author:         Philip Hodder
contact:        philip.hodder@encodis.com
summary:        Transform to remove any Schematron rule that does not contain a report or assert
...

# schematron-remove-empty-rules.xsl

This stylesheet will remove any *iso:rule* that does not contain an *iso:assert* or *iso:report* element.

### Input

* Valid Schematron file.

### Output

* Schematron file with empty rules removed.

        </doc:desc>
        <doc:log>
## Change Log

##### 2018-02-20 (PH) Initial version

        </doc:log>
    </doc:doc>

	<xsl:output indent="yes" />

	<xsl:strip-space elements="*" />

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

    <!-- Remove empty _rule_ elements -->
	<xsl:template match="iso:rule[not(iso:assert) and not(iso:report)]"/>

    <!-- standard identity transform -->
	<xsl:template match="@*|node()" mode="#all">
        <xsl:copy copy-namespaces="no"><xsl:apply-templates select="@*|node()" mode="#current"/></xsl:copy>
    </xsl:template>

</xsl:stylesheet>
