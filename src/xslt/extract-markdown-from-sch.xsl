<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:iso="http://purl.oclc.org/dsdl/schematron"
	xmlns:doc="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	version="2.0"
	exclude-result-prefixes="iso doc xs">

    <doc:doc>
        <doc:desc>
---
Project:        XPants
Title:          extract-markdown-from-sch.xsl
Date:           2018-02-19
Author:         Philip Hodder
Contact:        philip.hodder@encodis.com
Summary:        Extract Markdown from Schematron files
...

# extract-markdown-from-sch.xsl

Extract Markdown markup from Schematron files. The input file should contain a `doc:doc`
element to hold the Markdown text for the overall documentation. This can contain a
`doc:desc` for the main description and a `doc:log` element for the change log.

Note that this XSLT is fairly complex as it has to have various "entry" points depending
on the nature of the Schematron file:

* Main Schematron files (i.e. that have `&lt;iso:schema&gt;` as root elements)
* Schematron include files (that have `&lt;iso:pattern&gt;` as the root element)
* Schematron include files that use abstract pattersn (that have `&lt;iso:pattern&gt;` as the root element with an `is-a` attribute)
* Abstract Schematron include files (that have `&lt;iso:pattern&gt;` root elements with `abstract=true` attributes)

### Input

* Valid Schematron file.

### Output

* Markdown file.

        </doc:desc>
        <doc:log>
## Change Log

##### 2018-02-19 (PH) Initial version

        </doc:log>
    </doc:doc>

	<!--
		A number of cases to consider. Main entry points are:

		iso:schema - docs for the main Sch file
		iso:pattern[not(parent::iso:schema)] - docs for regular include file, i.e. "[not(@abstract)]"
		iso:pattern[not(parent::iso:schema)][@abstract='true'] - docs for abstract include file
		iso:pattern[not(parent::iso:schema)][@is-a] - docs for regular include file that _uses_ an abstract pattern

		then also need

		iso:pattern[parent::iso:schema] - defining a regular pattern in a main Sch file
		iso:pattern[parent::iso:schema][@abstract='true'] - defining an abstract pattern in a main Sch file
		iso:pattern[parent::iso:schema][@is-a] - using an abstract pattern in a main Sch file

	-->

    <!-- NOTE set method=xhtml to avoid closing empty <script> tags, but omit XML declaration -->
	<xsl:output
		encoding="UTF-8"
		byte-order-mark="no"
		indent="no"
		omit-xml-declaration="yes"
		method="xhtml"/>

	<xsl:strip-space elements="*"/>

	<!-- TODO: template to strip extraneous text (e.g. see simple-xquery) -->

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

	<!-- entry point for main Schematron files -->
	<xsl:template match="iso:schema">
		<xsl:apply-templates select="doc:doc/doc:desc"/>

		<xsl:text>## Patterns</xsl:text><xsl:text>&#xa;</xsl:text>
		<xsl:apply-templates select="iso:pattern"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:apply-templates select="iso:diagnostics"/>

		<!-- TODO sort alphabetically? -->
		<!-- TODO change to use not(preceding) etc trick - also what if an include file includes a file? -->
		<xsl:if test="iso:include">
			<xsl:text>## Included Files</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>

			<xsl:text>### Local Library Files</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
			<xsl:apply-templates select="iso:include[@href[not(starts-with(.,'http'))]]"/>

			<xsl:text>### Common Schematron Library Files</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
			<xsl:apply-templates select="iso:include[@href[starts-with(.,'http')]]"/>
		</xsl:if>

		<xsl:apply-templates select="doc:doc/doc:log"/>
	</xsl:template>

	<!-- entry point for .incl files that define a regular (non-abstract) pattern -->
	<xsl:template match="iso:pattern[not(parent::iso:schema)][not(@is-a)][not(@abstract)]">
        <xsl:apply-templates select="doc:doc/doc:desc"/>

        <xsl:value-of select="doc:make-title2(@id, iso:title)"/>

		<xsl:text>### Rules</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
		<xsl:apply-templates select="iso:rule"/>
		<xsl:apply-templates select="iso:diagnostics"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:apply-templates select="doc:doc/doc:log"/>
    </xsl:template>

	<!-- entry point for .incl files that define an abstract pattern -->
	<xsl:template match="iso:pattern[not(parent::iso:schema)][@abstract='true']">
        <xsl:apply-templates select="doc:doc/doc:desc"/>

        <xsl:value-of select="doc:make-title2(@id, iso:title)"/>

		<span style="color: white; background-color:darkgrey; padding:2px;">ABSTRACT</span><xsl:text>&#xa;&#xa;</xsl:text>

		<xsl:text>### Rules</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
		<xsl:apply-templates select="iso:rule"/>

		<xsl:apply-templates select="iso:diagnostics"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:apply-templates select="doc:doc/doc:log"/>
    </xsl:template>

	<!-- entry point for .incl files that define a concrete pattern based on an abstract pattern (e.g. docinfo-content-subtype.incl in Legislation) -->
	<!-- TODO ideally want to link to the file that needs to be included - do this via the ID? -->
	<xsl:template match="iso:pattern[not(parent::iso:schema)][@is-a]">
		<xsl:apply-templates select="doc:doc/doc:desc"/>

		<xsl:text>###### Abstract ID</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>

		<table>
			<tbody><tr><td><xsl:value-of select="@is-a"/></td></tr></tbody>
		</table>
		<xsl:text>&#xa;&#xa;</xsl:text>

		<xsl:text>###### Parameters</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
		<table>
			<thead>
				<tr>
					<th>name</th>
					<th>value</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="iso:param"/>
			</tbody>
		</table>

		<xsl:text>&#xa;</xsl:text>

		<xsl:apply-templates select="doc:doc/doc:log"/>
	</xsl:template>


	<!-- TODO watch out for includes in a diagnostic -->
	<!-- assume that any include that starts with 'http' is a common library include and that the documentation is in ".../common/vX.X/docs..." -->
	<xsl:template match="iso:include[@href[starts-with(.,'http')]]">
        <xsl:text>*  [</xsl:text><xsl:value-of select="@href"/><xsl:text>](</xsl:text><xsl:value-of select="replace(@href,'common/(v[A-Za-z0-9.+]*)/','common/$1/docs/')"/><xsl:text>.html) &#xa;</xsl:text>
    </xsl:template>

	<!-- assume that local includes are documented in a "docs/common" folder, i.e. the doc structure is the same as the source structure -->
	<xsl:template match="iso:include[@href[not(starts-with(.,'http'))]]">
	    <xsl:text>*  [</xsl:text><xsl:value-of select="@href"/><xsl:text>](</xsl:text><xsl:value-of select="@href"/><xsl:text>.html) &#xa;</xsl:text>
    </xsl:template>


    <!-- TODO some lines may have &lt; or {{{ etc to describe usage of the macro, expand this to < etc
		 i.e. should not need to do replace in the convert ANT macro
		 ALSO work out number of spaces on first indented line and subtract that, so indentation is preserved (so don't need ~~~ for tabs)
	-->

	<xsl:template match="doc:doc">
		<xsl:apply-templates/>
    </xsl:template>

	<xsl:template match="doc:desc">
        <xsl:for-each select="tokenize(., '\n')">
			<!-- remove indentation -->
			<xsl:if test="not(position() eq 1 and string-length() eq 0)">
            	<xsl:value-of select="replace(., '^[ \t]+', '')"/><xsl:text>&#xa;</xsl:text>
			</xsl:if>
        </xsl:for-each>
		<xsl:text>&#xa;</xsl:text>
    </xsl:template>

	<xsl:template match="doc:log">
        <xsl:for-each select="tokenize(., '\n')">
			<!-- remove indentation -->
			<xsl:if test="not(position() eq 1 and string-length() eq 0)">
            	<xsl:value-of select="replace(., '^[ \t]+', '')"/><xsl:text>&#xa;</xsl:text>
			</xsl:if>
        </xsl:for-each>
		<xsl:text>&#xa;</xsl:text>
    </xsl:template>

	<!-- NOTE pattern defined within a main Schematron file -->
	<xsl:template match="iso:pattern[parent::iso:schema][not(@is-a)]">

        <xsl:value-of select="doc:make-title3(@id, iso:title)"/>

		<xsl:text>#### Rules</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
		<xsl:apply-templates select="iso:rule"/>
		<xsl:text>&#xa;</xsl:text>
    </xsl:template>

	<!-- NOTE using an abstract pattern in a main Schematron file -->
	<xsl:template match="iso:pattern[parent::iso:schema][@is-a]">

	    <xsl:value-of select="doc:make-title3(@id, iso:title)"/>

		<xsl:text>###### Abstract ID</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>

		<table>
			<tbody><tr><td><xsl:value-of select="@is-a"/></td></tr></tbody>
		</table>
		<xsl:text>&#xa;&#xa;</xsl:text>

		<xsl:text>###### Parameters</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
		<table>
			<thead>
				<tr>
					<th>name</th>
					<th>value</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="iso:param"/>
			</tbody>
		</table>

		<xsl:text>&#xa;</xsl:text>
    </xsl:template>

	<!-- parameters for abstract patterns -->
	<xsl:template match="iso:param">
		<tr>
			<td><xsl:value-of select="@name"/></td>
			<td><xsl:value-of select="@value"/></td>
		</tr>
	</xsl:template>

	<!-- TODO also want to handle the other rule attributes like abstract, flag, role, see etc -->
	<!-- TODO if content starts with $ then it's a parameter, look for all values that start with $... -->
	<!-- TODO also need to account for some rules being abstract, i.e. they have an "is-a" attribute -->
	<xsl:template match="iso:rule">

		<xsl:variable name="disabled">
			<xsl:if test="@role = 'disabled'"><span class="disabled"> (DISABLED)</span></xsl:if>
		</xsl:variable>

		<xsl:if test="@id">
			<xsl:text>##### </xsl:text><xsl:value-of select="@id"/><xsl:value-of select="$disabled"/><xsl:text>&#xa;&#xa;</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="doc:doc"/>

		<xsl:text>###### Context</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>

		<table>
			<tbody><tr><td><xsl:value-of select="@context"/></td></tr></tbody>
		</table>
		<xsl:text>&#xa;&#xa;</xsl:text>

		<!-- ugly, but have to use <table> elements explicitly rather than MD, as may have "|" and "[" chars in @value -->
		<xsl:if test="count(iso:let) gt 0">
			<xsl:text>###### Variables</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
			<table>
				<thead>
					<tr>
						<th>name</th>
						<th>value</th>
					</tr>
				</thead>
				<tbody>
					<xsl:apply-templates select="iso:let"/>
				</tbody>
			</table>
		</xsl:if>

		<xsl:text>&#xa;&#xa;</xsl:text>

		<xsl:text>###### </xsl:text>Tests<xsl:text>&#xa;&#xa;</xsl:text>

		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>type</th>
					<th>role</th>
					<th>test</th>
					<th>message</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="iso:assert|iso:report"/>
			</tbody>
		</table>
		<xsl:text>&#xa;</xsl:text>
    </xsl:template>

	<xsl:template match="iso:let">
		<tr>
			<td><xsl:value-of select="@name"/></td>
			<td><xsl:value-of select="@value"/></td>
		</tr>
	</xsl:template>

	<xsl:template match="iso:assert|iso:report">

		<xsl:variable name="message">
			<xsl:apply-templates/>
		</xsl:variable>

		<!-- add class to <tr> if role is disabled, to highlight in docs -->
		<xsl:element name="tr">
		    <xsl:attribute name="class"><xsl:value-of select="@role"/></xsl:attribute>
		    <td style="white-space: nowrap;"><xsl:value-of select="@id"/></td>
		    <td><xsl:value-of select="local-name(.)"/></td>
		    <td><xsl:value-of select="@role"/></td>
		    <td><xsl:value-of select="@test"/></td>
		    <td><xsl:value-of select="normalize-space($message)"/><xsl:apply-templates select="@diagnostics"/></td>
		</xsl:element>
    </xsl:template>

	<xsl:template match="text()">
		<xsl:value-of select="normalize-space(.)"/>
	</xsl:template>

	<xsl:template match="iso:name">
		&lt;iso:name/&gt;
	</xsl:template>

	<xsl:template match="iso:value-of">
		&lt;iso:value-of select="<xsl:value-of select="@select"/>"/&gt;
	</xsl:template>

	<!-- TODO might have an included diagnostic -->
	<xsl:template match="iso:diagnostics">
		<xsl:text>## Diagnostic Messages</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>

		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>message</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates/>
			</tbody>
		</table>
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>

	<xsl:template match="iso:diagnostic">
		<xsl:variable name="message">
			<xsl:apply-templates/>
		</xsl:variable>
		<xsl:element name="tr">
			<td style="white-space: nowrap;"><xsl:value-of select="@id"/></td>
			<td><xsl:value-of select="normalize-space($message)"/></td>
		</xsl:element>
	</xsl:template>

	<!-- create links to diagnostic messages -->
    <xsl:template match="@diagnostics">
        <xsl:for-each select="tokenize(xs:string(.), ' ')"><xsl:text>  </xsl:text><a href="#diagnosticmessages"><xsl:value-of select="."/></a><xsl:text>  </xsl:text></xsl:for-each>
    </xsl:template>

    <xsl:function name="doc:make-title2">
        <xsl:param name="id" as="xs:string"/>
        <xsl:param name="title"/>
        <xsl:choose>
            <xsl:when test="string-length(normalize-space($title)) = 0">
                <xsl:text>## </xsl:text><xsl:value-of select="$id"/><xsl:text>&#xa;&#xa;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>## </xsl:text><xsl:value-of select="$id"/><xsl:text>: </xsl:text><xsl:value-of select="normalize-space($title)"/><xsl:text>&#xa;&#xa;</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

	<xsl:function name="doc:make-title3">
        <xsl:param name="id" as="xs:string"/>
        <xsl:param name="title"/>
        <xsl:choose>
            <xsl:when test="string-length(normalize-space($title)) = 0">
                <xsl:text>### </xsl:text><xsl:value-of select="$id"/><xsl:text>&#xa;&#xa;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>### </xsl:text><xsl:value-of select="$id"/><xsl:text>: </xsl:text><xsl:value-of select="normalize-space($title)"/><xsl:text>&#xa;&#xa;</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>
