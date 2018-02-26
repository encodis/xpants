# validate-with-schema.xml

A set of macro definitions to validate an XML file using a DTD. Essentially this is a wrapper around
ANT's built in `<xmlvalidate>` and `<schemavalidate>`task, but with enhanced reporting
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
<validate-with-schema
	file="file.xml"
	type="xsd"
	report="docs/validation/file.log"/>
```

```
<validate-with-schema
	report="docs/validation/"
	type="dtd">
	<fileset dir="models/instances">
		<include name="*test*.xml"/>
	<fileset/>
<validate-with-schema/>
```

## Dependencies

The following JAR files must be on the classpath:

*   **saxon.jar** (or the HE, PE, or EE equivalents) in order to use the Saxon parser
*   **jing.jar** in order to validate RelaxNG files

## Properties

The following properties can be set on the command line to override the default behaviour:

*   *xpants.catalog* can be used to set a base XML catalog for resolving entities. The default is
the value of the *XPANTS_CATALOG* environment variable (if set).

## Change Log

##### 2018-02-19 (PH) Initial version

    
# Macro Definitions

## validate-with-schema

Validate a file according to a schema

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | no | 
| type | Type of schema validation  | dtd, xsd, rng |  | no | 
| schema | Schema file |  |  | no | 
| report | Path for report file(s) |  |  | no | 
| property | Property to update with result |  |  | no | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | no | 

## validate-with-schema-file

Validate an XML instance document against a schema

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | yes | 
| type | Type of schema validation  | dtd, xsd, rnc, rng |  | no | 
| schema | Schema file |  |  | no | 
| report | Path for report file(s) |  |  | no | 
| property | Property to update with result |  |  | no | 

## validate-with-schema-dir

Validate a folder of XML instance documents against a schema

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| schema | Schema file |  |  | no | 
| type | Type of schema validation  | dtd, xsd, rng |  | no | 
| report | Path for report file(s) |  |  | no | 
| property | Property to update with final result over all files |  |  | no | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | yes | 
