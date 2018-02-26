# extract-markdown-from-sch.xsl

Extract Markdown markup from Schematron files. The input file should contain a `doc:doc`
element to hold the Markdown text for the overall documentation. This can contain a
`doc:desc` for the main description and a `doc:log` element for the change log.

Note that this XSLT is fairly complex as it has to have various "entry" points depending
on the nature of the Schematron file:

* Main Schematron files (i.e. that have `<iso:schema>` as root elements)
* Schematron include files (that have `<iso:pattern>` as the root element)
* Schematron include files that use abstract pattersn (that have `<iso:pattern>` as the root element with an `is-a` attribute)
* Abstract Schematron include files (that have `<iso:pattern>` root elements with `abstract=true` attributes)

### Input

* Valid Schematron file.

### Output

* Markdown file.

        


### Output Format

<table><thead><tr><th>method</th><th>encoding</th><th>version</th><th>omit-xml-declaration</th><th>standalone</th><th>doctype-public</th><th>doctype-system</th><th>cdata-section-elements</th><th>indent</th><th>media-type</th></tr></thead><tbody><tr><td>xhtml</td><td>UTF-8</td><td>-</td><td>yes</td><td>-</td><td>-</td><td>-</td><td>-</td><td>no</td><td>-</td></tr></tbody></table>
## Templates

<table><thead><tr><th width="35%">name</th><th>type</th><th>mode</th><th>parameters</th><th width="35%">description</th></tr></thead><tbody><tr><td>/</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>@diagnostics</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>doc:desc</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>doc:doc</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>doc:log</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:assert|iso:report</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:diagnostic</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:diagnostics</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:include[@href[not(starts-with(.,'http'))]]</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:include[@href[starts-with(.,'http')]]</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:let</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:name</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:param</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:pattern[not(parent::iso:schema)][@abstract='true']</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:pattern[not(parent::iso:schema)][@is-a]</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:pattern[not(parent::iso:schema)][not(@is-a)][not(@abstract)]</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:pattern[parent::iso:schema][@is-a]</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:pattern[parent::iso:schema][not(@is-a)]</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:rule</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:schema</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>iso:value-of</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>text()</td><td>match</td><td>-</td><td>-</td><td>-</td></tr></tbody></table>



## Change Log

##### 2018-02-19 (PH) Initial version

        
