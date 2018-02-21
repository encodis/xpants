<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:doc="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="doc xs"
    version="2.0">

    <doc:doc>
        <doc:desc>
---
project:        XML Practical ANT Scripts
title:          extract-markdown-from-xsl.xsl
date:           2018-02-19
author:         Philip Hodder
contact:        philip.hodder@encodis.com
summary:        Extract Markdown from XSLT files
...

# extract-markdown-from-xsl.xsl

Extract Markdown markup from XSLT files. The input file should contain `doc:doc` elements holding
the Markdown text. The `doc` namespace is the same as the Oxygen document namespace, i.e.
`http://www.oxygenxml.com/ns/doc/xsl`.

This stylesheet will also compile a table of templates in the input file, along with input
parameters and other information.

### Input

* XSLT file.

### Output

* Markdown file.

        </doc:desc>
        <doc:log>
## Change Log

##### 2018-02-19 (PH) Initial version

        </doc:log>
    </doc:doc>

    <!-- NOTE: set method=xhtml to avoid closing empty <script> tags, but omit XML declaration -->
    <xsl:output
        encoding="UTF-8"
        byte-order-mark="no"
        indent="no"
        omit-xml-declaration="yes"
        method="xhtml"/>

    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- entry point for main XSLT files -->
    <xsl:template match="xsl:stylesheet | xsl:transform">
        <xsl:apply-templates select="doc:doc[1]/doc:desc"/>

        <xsl:if test="count(xsl:param) gt 0">
            <xsl:text>### Parameters</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
            <table width="100%">
                <thead>
                    <tr>
                        <th width="20%">name</th>
                        <th>type</th>
                        <th>required</th>
                        <th>tunnel</th>
                        <th width="50%">description</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates select="xsl:param"/>
                </tbody>
            </table>
        </xsl:if>

        <xsl:text>&#xa;</xsl:text>

        <xsl:apply-templates select="xsl:output"/>

        <xsl:text>&#xa;</xsl:text>

        <xsl:text>## Templates</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
        <table>
            <thead>
                <tr>
                    <th width="35%">name</th>
                    <th>type</th>
                    <th>mode</th>
                    <th>parameters</th>
                    <th width="35%">description</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="xsl:template[@name]">
                    <xsl:sort select="@name"/>
                </xsl:apply-templates>
                <xsl:apply-templates select="xsl:template[@match]">
                    <xsl:sort select="@match"/>
                </xsl:apply-templates>
            </tbody>
        </table>

        <xsl:text>&#xa;</xsl:text>

        <xsl:apply-templates select="xsl:include"/>

        <xsl:text>&#xa;</xsl:text>

        <xsl:apply-templates select="xsl:import"/>

        <xsl:text>&#xa;</xsl:text>

        <xsl:apply-templates select="doc:doc[1]/doc:log"/>
    </xsl:template>

    <xsl:template match="doc:doc">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- TODO: add templates for doc:p, doc:ul etc, to convert Oxygen markup into Markdown -->

    <xsl:template match="doc:desc">
        <xsl:value-of disable-output-escaping="yes" select="."/><xsl:text>&#xa;</xsl:text>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="doc:log">
        <xsl:value-of disable-output-escaping="yes" select="."/><xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="xsl:template">

        <xsl:variable name="name">
            <xsl:choose>
                <!-- escape the 'match' to avoid brackets being confused as links in markdown -->
                <xsl:when test="@match"><xsl:value-of select="@match"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="@name"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="type">
            <xsl:choose>
                <xsl:when test="@match">match</xsl:when>
                <xsl:otherwise>name</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="mode">
            <xsl:choose>
                <xsl:when test="@mode"><xsl:value-of select="@mode"/></xsl:when>
                <xsl:otherwise>-</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="params">
            <xsl:choose>
                <xsl:when test="count(xsl:param) gt 0">
                    <xsl:for-each select="xsl:param">
                        <xsl:value-of select="@name"/>
                        <xsl:if test="position() ne last()">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>-</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="desc">
            <xsl:choose>
                <xsl:when test="preceding-sibling::doc:doc[1] eq preceding-sibling::*[1]">
                    <xsl:value-of select="preceding-sibling::doc:doc[1]/doc:desc"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>-</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <tr>
            <td><xsl:value-of select="$name"/></td>
            <td><xsl:value-of select="$type"/></td>
            <td><xsl:value-of select="$mode"/></td>
            <td><xsl:value-of select="$params"/></td>
            <td><xsl:value-of select="$desc"/></td>
        </tr>

    </xsl:template>

    <xsl:template match="xsl:param">

        <xsl:variable name="required">
            <xsl:choose>
                <xsl:when test="@required and @required='yes'">yes</xsl:when>
                <xsl:otherwise>no</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="tunnel">
            <xsl:choose>
                <xsl:when test="@tunnel and @tunnel='yes'">yes</xsl:when>
                <xsl:otherwise>no</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="type">
            <xsl:choose>
                <xsl:when test="@as"><xsl:value-of select="@as"/></xsl:when>
                <xsl:otherwise>-</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="desc">
            <xsl:choose>
                <xsl:when test="preceding-sibling::doc:doc[1] eq preceding-sibling::*[1]">
                    <xsl:value-of select="preceding-sibling::doc:doc[1]/doc:desc"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>-</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <tr>
            <td><xsl:value-of select="@name"/></td>
            <td><xsl:value-of select="$type"/></td>
            <td><xsl:value-of select="$required"/></td>
            <td><xsl:value-of select="$tunnel"/></td>
            <td><xsl:value-of select="$desc"/></td>
        </tr>

    </xsl:template>

    <xsl:template match="xsl:include[not(preceding-sibling::xsl:include)]">
        <xsl:text>### Included Files</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:next-match/>
    </xsl:template>

    <xsl:template match="xsl:include">
        <xsl:text>* </xsl:text><xsl:value-of select="@href"/><xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="xsl:import[not(preceding-sibling::xsl:import)]">
        <xsl:text>### Imported Files</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:next-match/>
    </xsl:template>

    <xsl:template match="xsl:import">
        <xsl:text>* </xsl:text><xsl:value-of select="@href"/><xsl:text>&#xa;</xsl:text>
    </xsl:template>

   <xsl:template match="xsl:output">
       <xsl:text>### Output Format</xsl:text><xsl:text>&#xa;&#xa;</xsl:text>
       <table>
           <thead>
               <tr>
                   <th>method</th>
                   <th>encoding</th>
                   <th>version</th>
                   <th>omit-xml-declaration</th>
                   <th>standalone</th>
                   <th>doctype-public</th>
                   <th>doctype-system</th>
                   <th>cdata-section-elements</th>
                   <th>indent</th>
                   <th>media-type</th>
               </tr>
           </thead>
           <tbody>
               <tr>
                    <td>
                        <xsl:choose>
                            <xsl:when test="@method"><xsl:value-of select="@method"/></xsl:when>
                            <xsl:otherwise>-</xsl:otherwise>
                        </xsl:choose>
                   </td>
                   <td>
                       <xsl:choose>
                           <xsl:when test="@encoding"><xsl:value-of select="@encoding"/></xsl:when>
                           <xsl:otherwise>-</xsl:otherwise>
                       </xsl:choose>
                   </td>
                   <td>
                       <xsl:choose>
                           <xsl:when test="@version"><xsl:value-of select="@version"/></xsl:when>
                           <xsl:otherwise>-</xsl:otherwise>
                       </xsl:choose>
                   </td>
                   <td>
                       <xsl:choose>
                           <xsl:when test="@omit-xml-declaration"><xsl:value-of select="@omit-xml-declaration"/></xsl:when>
                           <xsl:otherwise>-</xsl:otherwise>
                       </xsl:choose>
                   </td>
                   <td>
                       <xsl:choose>
                           <xsl:when test="@standalone"><xsl:value-of select="@standalone"/></xsl:when>
                           <xsl:otherwise>-</xsl:otherwise>
                       </xsl:choose>
                   </td>
                   <td>
                       <xsl:choose>
                           <xsl:when test="@doctype-public"><xsl:value-of select="@doctype-public"/></xsl:when>
                           <xsl:otherwise>-</xsl:otherwise>
                       </xsl:choose>
                   </td>
                   <td>
                       <xsl:choose>
                           <xsl:when test="@doctype-system"><xsl:value-of select="@doctype-system"/></xsl:when>
                           <xsl:otherwise>-</xsl:otherwise>
                       </xsl:choose>
                   </td>
                   <td>
                       <xsl:choose>
                           <xsl:when test="@cdata-section-elements"><xsl:value-of select="@cdata-section-elements"/></xsl:when>
                           <xsl:otherwise>-</xsl:otherwise>
                       </xsl:choose>
                   </td>
                   <td>
                       <xsl:choose>
                           <xsl:when test="@indent"><xsl:value-of select="@indent"/></xsl:when>
                           <xsl:otherwise>-</xsl:otherwise>
                       </xsl:choose>
                   </td>
                   <td>
                       <xsl:choose>
                           <xsl:when test="@media-type"><xsl:value-of select="@media-type"/></xsl:when>
                           <xsl:otherwise>-</xsl:otherwise>
                       </xsl:choose>
                   </td>
               </tr>
           </tbody>
       </table>
   </xsl:template>

</xsl:stylesheet>