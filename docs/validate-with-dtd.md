# validate-with-dtd.xml

A set of macro definitions to validate an XML file using a DTD. Essentially this
is a wrapper around ANT's built in `<xmlvalidate>` task, but with enhanced reporting
and output file manipulation. The top level macro ("validate-with-dtd") will validate either a
single file or a folder, depending on the arguments supplied:

* If the _file_ attribute is not blank and refers to a file that exists then it will be
validated, using the _output_ attribute as the resulting file name for the report.
* If the _file_ attribute is not supplied then the macro will convert all files in a folder
determined by the 'input.files' element.

> NOTE: It is the responsibility of the calling task to ensure that any output folders are
created before running this task.

## Usage

```
<validate-with-dtd
	file="file.xml"
	output="docs/validation/file.svrl"
	format="svrl"/>
```

```
<validate-with-dtd
	output="docs/validation/"
	format="html">
	<fileset dir="models/instances">
		<include name="*test*.xml"/>
	<fileset/>
<validate-with-dtd/>
```

## Dependencies

### Stylesheets

This module uses the following stylesheets:

* __convert-log-to-svrl.xsl__ Converts the ANT log to SVRL.
* __convert-svrl-to-html.xsl__ Converts SVRL format into HTML.

> NOTE: The 'svrl' output option is not currently functional as the __convert-ant-to-svrl.xsl__
file has not been written.

## Properties

The following properties can be set on the command line to override the default behaviour:

* _convert-log-to-svrl.stylesheet_ The stylesheet to be used to convert ANT log files to SVRL
* _convert-svrl-to-html.stylesheet_ The stylesheet to be used to convert SVRL to HTML

## Change Log

##### 2018-02-19 (PH) Initial version

    
# Macro Definitions

## validate-with-dtd

Validate a file according to a DTD

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | no | 
| format | Format of the final report  | txt, svrl, html | svrl | no | 
| output | Path for report file(s) |  |  | yes | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | no | 

## validate-with-dtd-file

Validate an individual XML file against its DTD

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | yes | 
| output | Result file |  |  | yes | 
| format | Format of the final report  | txt, svrl, html | svrl | no | 

## validate-with-dtd-dir

Validate a folder of XML files against their DTDs

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| output | Folder for report files |  |  | yes | 
| format | Format of the final report  | txt, svrl, html | svrl | no | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | yes | 

## validate-with-dtd-to-txt

Validate an XML file and output the validation report as text

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | yes | 
| output | Output report file |  |  | yes | 

## validate-with-dtd-to-svrl

Validate an XML file and output the validation report as SVRL

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | yes | 
| output | Output report file |  |  | yes | 

## validate-with-dtd-to-html

Validate an XML file and output the validation report as HTML

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | yes | 
| output | Output report file |  |  | yes | 
