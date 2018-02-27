# extract-markdown-from-ant.xsl

Extract Markdown markup from ANT files. The input file should contain a
*description* element as the first child of *project* to hold the
Markdown text for the overall documentation. Individual elements can be
documented using the *description* attribute.

### Input

  - ANT build file.

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

\*

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

/project

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

attribute

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

attribute\[not(preceding-sibling::attribute)\]

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

element

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

element\[not(preceding-sibling::element)\]

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

macrodef

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

macrodef\[not(preceding::macrodef)\]

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

project/description

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

target

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

target\[not(preceding::target)\]

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
