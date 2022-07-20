---
author: Philip Hodder
contact: philip.hodder@encodis.com
date: 2018-02-15
project: XML Practical ANT Scripts
summary: Extract macrodefs from ANT build files
title: extract-macrodef-from-ant.xsl
---

# extract-macrodef-from-ant.xsl

This stylesheet extracts `<macrodef>` elements from ANT build files.
This is primarily used to build the XPantS distribution.

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
\-
</td>
<td>
\-
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
yes
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
text()
</td>
<td>
match
</td>
<td>
\#all
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

##### 2018-02-15 (PH) Initial version
