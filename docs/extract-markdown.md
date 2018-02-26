# extract-markdown.xml

Macro definitions to extract documentation (as Markdown) embedded in various types
of files. The user can specifiy a stylesheet to use for the extraction. Alternatively this
module defines some macros that can be used to extract documentation from standard file
types. Successful extraction will depend on the source files containing the relevant
elements with the Markdown documentation.

* If the _file_ attribute is not blank and refers to a file that exists then documentation
will be extracted from it, using the _output_ attribute as the resulting file name for the report.
* If the _file_ attribute is not supplied then the macro will extract Markdown from all files
in a folder determined by the 'input' element.

> NOTE: It is the responsibility of the calling task to ensure that any output folders are
created before running this task.

The type of extraction is determined by the *type* attribute. Currently this can be set to anything,
although if left blank it will try to determine the type from the file extension. This works fine
for Schematron (".sch") and XSLT (".xsl") files, but for ANT files the type will need to be given
explicitly.

> WARNING: The stylesheets used by these macros will also extract text node messages
embedded in <echo> and <fail> elements. Therefore use the "message" attribute
of these elements if possible.

## Usage

```
<extract-markdown
	file="${src.dir}/sample.sch"
	output="${docs.dir}/sample.md"/>
```

```
<extract-markdown
	file="${src.dir}/git.xml"
	type="ant"
	output="${docs.dir}/git.md"/>
```

## Dependencies

These stylesheets are included using the default stylesheet mechanism described in
[apply-stylesheet](apply-stylesheet.html)

* __extract-markdown-from-ant.xsl:__ This is the standard stylesheet
used to extract Markdown from ANT scripts.
* __extract-markdown-from-sch.xsl:__ This is the standard stylesheet
used to extract Markdown from Schematron files.
* __extract-markdown-from-xslt.xsl:__ This is the standard stylesheet
used to extract Markdown from XSLT files.


## Change Log

##### 2018-02-15 (PH) Initial version

    
# Macro Definitions

## extract-markdown

Extract Markdown documentation from files

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source file |  |  | no | 
| type | Source file type  | ant, sch, xsl |  | yes | 
| remove-yaml | Remove YAML metadata block  | true, false | false | no | 
| output | Path for extracted Markdown file(s) |  |  | yes | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | no | 

## extract-markdown-file

Extract Markdown documentation from a single file

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source file |  |  | yes | 
| type | Source file type  | ant, sch, xsl |  | yes | 
| remove-yaml | Remove YAML metadata block  | true, false | false | no | 
| output | Path for extracted Markdown file |  |  | yes | 

## extract-markdown-dir

Extract Markdown documentation from a set of files

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| type | Source file type  | ant, sch, xsl |  | yes | 
| remove-yaml | Remove YAML metadata block  | true, false | false | no | 
| output | Path for extracted files |  |  | yes | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | yes | 
