# extract-markdown-from-ant.xsl

Extract Markdown markup from ANT files. The input file should contain a _description_
element as the first child of _project_ to hold the Markdown text for the overall
documentation. Individual elements can be documented using the _description_ attribute.

### Input

* ANT build file.

### Output

* Markdown file.

        


### Output Format

<table><thead><tr><th>method</th><th>encoding</th><th>version</th><th>omit-xml-declaration</th><th>standalone</th><th>doctype-public</th><th>doctype-system</th><th>cdata-section-elements</th><th>indent</th><th>media-type</th></tr></thead><tbody><tr><td>xhtml</td><td>UTF-8</td><td>-</td><td>yes</td><td>-</td><td>-</td><td>-</td><td>-</td><td>no</td><td>-</td></tr></tbody></table>
## Templates

<table><thead><tr><th width="35%">name</th><th>type</th><th>mode</th><th>parameters</th><th width="35%">description</th></tr></thead><tbody><tr><td>*</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>/project</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>attribute</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>attribute[not(preceding-sibling::attribute)]</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>element</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>element[not(preceding-sibling::element)]</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>macrodef</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>macrodef[not(preceding::macrodef)]</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>project/description</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>target</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>target[not(preceding::target)]</td><td>match</td><td>-</td><td>-</td><td>-</td></tr></tbody></table>



## Change Log

##### 2018-02-19 (PH) Initial version

        
