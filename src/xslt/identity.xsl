<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:doc="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="doc"
    version="2.0">

    <doc:doc id="markdown">
        <doc:desc>
---
Project:        Xpants
Title:          identity.xsl
Date:           2018-02-14
Author:         Nic Gibson
Contact:        nic@corbas.com
Summary:        Default identity transform
...

# identity.xsl

This stylesheet is simply the standard identity transform.
        </doc:desc>
        <doc:log>
## Change Log

##### 2018-02-14 (PH) Initial version

        </doc:log>
    </doc:doc>

	<xsl:template match="@*|node()" mode="#all">
	    <!-- standard identity transform -->
        <xsl:copy copy-namespaces="no"><xsl:apply-templates select="@*|node()" mode="#current"/></xsl:copy>
    </xsl:template>

</xsl:stylesheet>