# validate-with-xsd.xml

A set of macro definitions to validate an XML file using an XSD. Essentially this
is a wrapper around _ant_'s built in 'schemavalidate' task, but with enhanced reporting
and output file manipulation. The top level macro ("validate-with-xsd") will validate either a
single file or a folder, depending on the arguments supplied:

* If the _file_ attribute is not blank and refers to a file that exists then it will be
validated, using the _output_ attribute as the resulting file name for the report.
* If the _file_ attribute is not supplied then the macro will convert all files in a folder
determined by the 'input.files' element.

> NOTE: It is the responsibility of the calling task to ensure that any output folders are
created before running this task.

## Usage

```
<validate-with-xsd
	source="file.xml"
	output="docs/validation/file.svrl"
	schema="schema/test.xsd"
	format="svrl"/>
```

```
<validate-with-xsd
	output="docs/validation/"
	schema="schema/test1.xsd"
	format="html"/>
	<fileset dir="models/instances">
	<include name="*.xml"/>
	<fileset/>
<validate-with-xsd/>
```

## Dependencies

### Stylesheets

This module uses the following stylesheets:

* __convert-svrl-to-html.xsl__ Converts SVRL format into HTML.

## Properties

The following properties can be set on the command line to override the default behaviour:

* _convert-svrl-to-html.stylesheet_

## Change Log

##### 2018-02-19 (PH) Initial version

    
# Macro Definitions

## validate-with-xsd

Validate a file according to a XSD

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | no | 
| schema | Path for XSD file |  |  | yes | 
| namespace | Namespace associated with the XSD file |  |  | yes | 
| format | Format of the final report  | txt, svrl, html | svrl | no | 
| output | Path for report file(s) |  |  | yes | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | no | 

## validate-with-xsd-file

Validate an individual XML file against a specified XSD

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | yes | 
| output | Path for result file |  |  | yes | 
| schema | Path for XSD file |  |  | yes | 
| namespace | Namespace associated with the XSD file |  |  | yes | 
| format | Format of the final report  | txt, svrl, html | svrl | no | 

## validate-with-xsd-dir

Validate a folder of XML files against their DTDs

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| schema | Path for XSD file |  |  | yes | 
| namespace | Namespace associated with the XSD file |  |  | yes | 
| format | Format of the final report  | txt, svrl, html | svrl | no | 
| output | Path for extracted files |  |  | yes | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | yes | 

## validate-with-xsd-to-txt

Validate an XML file and output the validation report as text

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | yes | 
| output | Output report file |  |  | yes | 
| schema | Path for XSD file |  |  | yes | 
| namespace | Namespace associated with the XSD file |  |  | yes | 

## validate-with-xsd-to-svrl

Validate an XML file and output the validation report as SVRL

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | yes | 
| output | Output report file |  |  | yes | 
| schema | Path for XSD file |  |  | yes | 
| namespace | Namespace associated with the XSD file |  |  | yes | 

## validate-with-xsd-to-html

Validate an XML file and output the validation report as HTML

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | yes | 
| output | Output report file |  |  | yes | 
| schema | Path for XSD file |  |  | yes | 
| namespace | Namespace associated with the XSD file |  |  | yes | 
