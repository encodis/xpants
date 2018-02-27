# schematron-remove-empty-rules.xsl

This stylesheet will remove any *iso:rule* that does not contain an
*iso:assert* or *iso:report* element.

### Input

  - Valid Schematron file.

### Output

  - Schematron file with empty rules removed.

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

@\*|node()

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

<tr>

<td>

iso:rule\[not(iso:assert) and not(iso:report)\]

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

##### 2018-02-20 (PH) Initial version
