<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:doc="http://www.oxygenxml.com/ns/doc/xsl"
	version="2.0">

    <doc:doc>
        <doc:desc>
---
project:        XML Practical ANT Scripts
title:          extract-markdown-from-ant.xsl
date:           2018-02-19
author:         Philip Hodder
contact:        philip.hodder@encodis.com
summary:        Extract Markdown from ANT files
...

# extract-markdown-from-ant.xsl

Extract Markdown markup from ANT files. The input file should contain a _description_
element as the first child of _project_ to hold the Markdown text for the overall
documentation. Individual elements can be documented using the _description_ attribute.

### Input

* ANT build file.

### Output

* Markdown file.

        </doc:desc>
        <doc:log>
## Change Log

##### 2018-02-19 (PH) Initial version

        </doc:log>
    </doc:doc>

    <!-- set method=xhtml to avoid closing empty <script> tags, but omit XML declaration -->
	<xsl:output
		encoding="UTF-8"
		byte-order-mark="no"
		indent="no"
		omit-xml-declaration="yes"
		method="xhtml"/>

	<xsl:strip-space elements="*"/>

	<!-- TODO: template to strip extraneous text (e.g. see simple-xquery) -->

    <xsl:template match="/project">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- output the text of the description element -->
    <!-- TODO: some lines may have &lt; or {{{ etc to describe usage of the macro, expand this to < etc
		 i.e. should not need to do replace in the convert ANT macro
	-->
    <xsl:template match="project/description">
        <xsl:value-of disable-output-escaping="yes" select="."/><xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="target[not(preceding::target)]">
        <xsl:text># Targets</xsl:text><xsl:text>&#xa;</xsl:text>
        <xsl:next-match/>
    </xsl:template>

    <xsl:template match="target">
        <xsl:text>&#xa;</xsl:text><xsl:text>## </xsl:text><xsl:value-of select="@name"/>
        <xsl:if test="@name = /project/@default">
            <xsl:text> (default)</xsl:text>
        </xsl:if>
        <xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:if test="@depends">
            <!-- FIXME: handle multiple (comma separated) dependencies -->
            <xsl:text>**Depends on:** [</xsl:text><xsl:value-of select="@depends"/><xsl:text>] &#xa;&#xa;</xsl:text>
        </xsl:if>
        <xsl:value-of select="@description"/><xsl:text>&#xa;&#xa;</xsl:text>
    </xsl:template>

	<xsl:template match="macrodef[not(preceding::macrodef)]">
		<xsl:text># Macro Definitions</xsl:text><xsl:text>&#xa;</xsl:text>
		<xsl:next-match/>
	</xsl:template>

    <xsl:template match="macrodef">
        <xsl:text>&#xa;</xsl:text><xsl:text>## </xsl:text><xsl:value-of select="@name"/><xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:value-of select="@description"/><xsl:text>&#xa;&#xa;</xsl:text>
		<xsl:apply-templates/>
    </xsl:template>

	<xsl:template match="attribute[not(preceding-sibling::attribute)]">
        <xsl:text>#### Attributes</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
		<xsl:text>| name | description | allowed | default | required |&#xa;</xsl:text>
		<xsl:text>| :--- | :---------- | :------ | :-----: | :------: |&#xa;</xsl:text>
		<xsl:next-match/>
	</xsl:template>

	<xsl:template match="attribute">
		<!-- select string before any allowed value list -->
		<xsl:variable name="desc">
            <xsl:choose>
                <xsl:when test="contains(@description,'[')">
                    <xsl:value-of select="substring-before(@description, '[')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@description"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="allowed"><xsl:value-of select="replace(substring-before(substring-after(@description, '['), ']'), ',', ', ')"/></xsl:variable>

        <xsl:variable name="required">
            <xsl:choose>
                <xsl:when test="@default">no</xsl:when>
                <xsl:otherwise>yes</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

		<xsl:text>| </xsl:text><xsl:value-of select="@name"/>
        <xsl:text> | </xsl:text><xsl:value-of select="$desc"/>
        <xsl:text> | </xsl:text><xsl:value-of select="$allowed"/>
        <xsl:text> | </xsl:text><xsl:value-of select="@default"/>
        <xsl:text> | </xsl:text><xsl:value-of select="$required"/>
        <xsl:text> | &#xa;</xsl:text>
    </xsl:template>

	<xsl:template match="element[not(preceding-sibling::element)]">
        <xsl:text>#### Elements</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:text>| name | description | implicit | required |&#xa;</xsl:text>
        <xsl:text>| :--- | :---------- | :------: | :------: |&#xa;</xsl:text>
		<xsl:next-match/>
    </xsl:template>

	<xsl:template match="element">
        <xsl:variable name="required">
            <xsl:choose>
                <xsl:when test="@optional = 'true'">no</xsl:when>
                <xsl:otherwise>yes</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="implicit">
            <xsl:choose>
                <xsl:when test="@implicit = 'true'">yes</xsl:when>
                <xsl:otherwise>no</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:text>| </xsl:text><xsl:value-of select="@name"/>
        <xsl:text> | </xsl:text><xsl:value-of select="@description"/>
        <xsl:text> | </xsl:text><xsl:value-of select="$implicit"/>
        <xsl:text> | </xsl:text><xsl:value-of select="$required"/>
        <xsl:text> | &#xa;</xsl:text>
    </xsl:template>

	<!-- ignore all other elements, like <target> etc -->
	<xsl:template match="*"/>

</xsl:stylesheet>
