---
author: Philip Hodder
contact: philip.hodder@encodis.com
date: 2018-02-19
project: XML Practical ANT Scripts
summary: Remove line breaks and indentation from an XML document
title: remove-newlines.xsl
---

# remove-newlines.xsl

This stylesheet will “linearize” an XML document (removing new lines and
indentation), which may be useful for Arbortext instance documents,
amongst others.

It is based on the identity transform, but copies unused namespaces and
strips all “space only” text elements.

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
@\*\|node()
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
