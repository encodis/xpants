# extract-markdown-from-xsl.xsl

Extract Markdown markup from XSLT files. The input file should contain
`doc:doc` elements holding the Markdown text. The `doc` namespace is the
same as the Oxygen document namespace, i.e.
`http://www.oxygenxml.com/ns/doc/xsl`.

This stylesheet will also compile a table of templates in the input
file, along with input parameters and other information.

### Input

  - XSLT file.

### Output

  - Markdown file.

### Output Format

<table>

<thead>

<tr>

<th>

method

</th>

<th>

encoding

</th>

<th>

version

</th>

<th>

omit-xml-declaration

</th>

<th>

standalone

</th>

<th>

doctype-public

</th>

<th>

doctype-system

</th>

<th>

cdata-section-elements

</th>

<th>

indent

</th>

<th>

media-type

</th>

</tr>

</thead>

<tbody>

<tr>

<td>

xhtml

</td>

<td>

UTF-8

</td>

<td>

\-

</td>

<td>

yes

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

no

</td>

<td>

\-

</td>

</tr>

</tbody>

</table>

## Templates

<table>

<thead>

<tr>

<th width="35%">

Name

</th>

<th>

Type

</th>

<th>

Mode

</th>

<th>

Parameters

</th>

<th width="35%">

Description

</th>

</tr>

</thead>

<tbody>

<tr>

<td>

/

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

doc:desc

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

doc:doc

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

doc:log

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

xsl:import

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

xsl:import\[not(preceding-sibling::xsl:import)\]

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

xsl:include

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

xsl:include\[not(preceding-sibling::xsl:include)\]

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

xsl:output

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

xsl:param

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

xsl:stylesheet | xsl:transform

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

<tr>

<td>

xsl:template

</td>

<td>

match

</td>

<td>

\-

</td>

<td>

\-

</td>

<td>

\-

</td>

</tr>

</tbody>

</table>

## Change Log

##### 2018-02-19 (PH) Initial version
