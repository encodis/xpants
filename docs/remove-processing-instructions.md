# remove-processing-instructions.xsl

This stylesheet removes processing instructions from an XML instance
document.

### Input

  - Valid XML file

### Output

  - XML file with processing instructions removed

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

xml

</td>

<td>

UTF-8

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

processing-instruction()

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
