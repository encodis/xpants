<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:doc="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs doc"
    version="2.0">

    <doc:doc>
        <doc:desc>
---
project:        XML Practical ANT Scripts
title:          remove-processing-instructions.xsl
date:           2016-04-08
author:         Philip Hodder
contact:        philip.hodder@encodis.com
summary:        Remove processing instruction nodes from an XML instance document
...

# remove-processing-instructions.xsl

This stylesheet removes processing instructions from an XML instance document.

### Input

* Valid XML file

### Output

* XML file with processing instructions removed

        </doc:desc>
        <doc:log>
## Change Log

##### 2018-02-19 (PH) Initial version

        </doc:log>
    </doc:doc>

    <xsl:output encoding="UTF-8" byte-order-mark="no" indent="no" method="xml"/>

    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- remove processing-instruction nodes -->
    <xsl:template match="processing-instruction()"/>

</xsl:stylesheet>
