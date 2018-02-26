# remove-docs.xsl

This stylesheet removes documentation elements from an XML file.
Currently the following elements from the following namespaces are removed:

* _http://www.oxygenxml.com/ns/doc/xsl_


### Input

* Valid XML file

### Output

* XML file with documentation elements removed

        


### Output Format

<table><thead><tr><th>method</th><th>encoding</th><th>version</th><th>omit-xml-declaration</th><th>standalone</th><th>doctype-public</th><th>doctype-system</th><th>cdata-section-elements</th><th>indent</th><th>media-type</th></tr></thead><tbody><tr><td>xhtml</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>no</td><td>-</td></tr></tbody></table>
## Templates

<table><thead><tr><th width="35%">name</th><th>type</th><th>mode</th><th>parameters</th><th width="35%">description</th></tr></thead><tbody><tr><td>/</td><td>match</td><td>-</td><td>-</td><td>-</td></tr><tr><td>@*|node()</td><td>match</td><td>#all</td><td>-</td><td>-</td></tr><tr><td>doc:*</td><td>match</td><td>-</td><td>-</td><td>-</td></tr></tbody></table>



## Change Log

##### 2018-02-19 (PH) Initial version
        
