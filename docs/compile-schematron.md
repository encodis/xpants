# compile-schematron.xml

A set of macro definitions to compile a Schematron file into an XSL file. The top level
macro ("compile-schematron") will compile either a single file or a folder, depending on
the arguments supplied:

* If the _file_ attribute is not blank and refers to a file that exists then it will be
compiled, using the _output_ attribute as the resulting file name for the report.
* If the _file_ attribute is not supplied then the macro will compile all files in a folder
determined by the 'input.files' element.

> NOTE: It is the responsibility of the calling task to ensure that any output folders are
created before running this task.

### Filtering Options

The 'filters' attribute contains a comma separated list of filters that direct
the macro to apply certain stylesheets to the Schematron after includes have been merged
and abstract patterns resolved, but before compilation into XSLT.

Each filter is taken in the order it occurs in the _filters_ attribute. This is used
by the [apply-stylesheet](./apply-stylesheet.html) macro so it assumes that all filters correspond
to standard XSLTs in the XSLT Library. So, for example, specifying the filter "remove-docs" will
apply the stylesheet _remove-docs.xsl_.

> IMPORTANT: This mechanism can be used to apply __ANY__ stylesheet in the XSLT Library
to the Schematron. Take care when specifying filters in case there are unintended
consequences. The filters (and stylesheets) that are known to be valid are:
>
* _remove-docs:_ Removes "doc:*" elements
* _remove-comments:_ Remove comments
* _remove-processing-instructions:_ Remove processing instructions
* _schematron-display-id:_ Makes sure that Schematron rule IDs are displayed in the output
* _schematron-remove-empty-rules:_ Remove any Schematron rules with no assert or report elements

The Schematron file is enhanced "in place"---intermediate versions are not kept.

## Usage

```
<compile-schematron
	file="file.sch"
	output="compiled/file.xsl"
	format="xsl"/>
```

```
<compile-schematron
	output="compiled"
	<fileset dir="src/schematron">
		<include name="*.sch"/>
	<fileset/>
</compile-schematron>
```

## Dependencies

### Stylesheets

The following stylesheets are used by this module. They are local copies of the
[ISO Schematron](http://www.schematron.com/implementation.html) stylesheets:

* **iso/iso_dsdl_include.xsl**
* **iso/iso_abstract_expand.xsl**
* **iso/iso_svrl_for_xslt2.xsl**
* **iso/iso_svrl_for_xslt1.xsl**

Other stylsheets in the XSLT library may be used as dictated by any enhancement
filters set.

> NOTE: The default stylesheet used to expand abstract patterns is the standard stylesheet
as distributed by ISO. However, in this stylesheet variables used in an abstract pattern
[are not replaced](https://code.google.com/archive/p/schematron/issues/6). The
**iso/iso_abstract_expand_bugfix6.xsl** stylesheet implements a
[fix](http://itfundamentalist.blogspot.co.uk/2009/03/schematron-stilesheets-wont-work-with.html)
for this.
>
>Projects that need to use the "fixed" version (e.g. the Content Migration project)
should override the _resolve-schematron-abstracts.stylesheet_ property (as described below)
_before_ these macros are included, e.g.
>
```
<property
	name="resolve-schematron-abstracts.stylesheet"
	value="iso/iso_abstract_expand_bugfix6.xsl"/>

<compile-schematron
	file="file.sch"
	output="compiled/file.xsl"
	format="xsl"/>
```

## Properties

The following properties can be set on the command line to override the default behaviour:

* _merge-schematron-includes.stylesheet_ Allows replacement of the "iso_dsdl_include.xsl" stylesheet.
* _resolve-schematron-abstracts.stylesheet_ Allows replacement of the "iso_abstract_expand.xsl" stylesheet.
* _compile-schematron-to-xsl.stylesheet_ Allows the caller to specify the compilation stylesheet,
rather than choosing "iso_svrl_for_xslt1.xsl" or "iso_svrl_for_xslt2.xsl" depending on the version
of XSLT being used.
* _compile.full-path-notation_ Change format of output XPath messages. Valid values are "1" (the default
which is rather unreadable for humans but contains position information, allowing errors in instance
documents to be identified more easily), "2" (easier to read but with less information) or "3"
(marked as obsolete).

> NOTE: Due to issues with the Windows/Git Bash command line handling of UNC paths
it may be easier to set the property in the __build.xml__ file that is calling the
library, rather than on the command line.

## Change Log

##### 2018-02-19 (PH) Initial version

    
# Macro Definitions

## compile-schematron

Compile Schematron file(s) to the indicated format

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source Schematron file |  |  | no | 
| encoding | The output encoding |  | utf-8 | no | 
| phase | The phase to restrict the schema to |  | #ALL | no | 
| foreign | Preserve nodes that are not in the ISO namespace |  | false | no | 
| filters | List of optional filters to be applied |  | remove-docs | no | 
| output | Path for output file(s) |  |  | yes | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | no | 

## compile-schematron-file

Compile a Schematron file

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | yes | 
| encoding | The output encoding |  | utf-8 | no | 
| phase | The phase to restrict the schema to |  | #ALL | no | 
| foreign | Preserve nodes that are not in the ISO namespace |  | false | no | 
| filters | List of optional filters to be applied |  | remove-docs | no | 
| output | Path for output file |  |  | yes | 

## compile-schematron-dir

Compile a folder of Schematron files

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| encoding | The output encoding |  | utf-8 | no | 
| phase | The phase to restrict the schema to |  | #ALL | no | 
| foreign | Preserve nodes that are not in the ISO namespace |  | false | no | 
| filters | List of optional filters to be applied |  | remove-docs | no | 
| output | Folder for compiled files |  |  | yes | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | yes | 

## merge-schematron-includes

Merge included files into a single Schematron file

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source Schematron file |  |  | yes | 
| output | Merged Schematron file |  |  | yes | 

## resolve-schematron-abstracts

Resolve abstract patterns in a Schematron file

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source Schematron file |  |  | yes | 
| output | Resolved Schematron file |  |  | yes | 
