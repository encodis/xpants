# tidy.xml

This module defines macros for processing content using 'tidy'. The first processes
individual files and the second processes entire trees by way of a fileset.

*  If the _file_ attribute is not blank and refers to a file that exists then it will be
converted.
*  If the _file_ attribute is not supplied then the macro will convert all files in a
folder determined by the 'input-fileset' element and place them in the _output_ folder
with the same name. If the 'input-fileset' is empty the macro will fail.

> NOTE: It is the responsibility of the calling task to ensure that any output folders are
created before running this task.

## Usage

Basic usage:

```
>tidy
	file="src/index.html"
	output="build/index.html"/<
```

Use the _params_ property to set various command line options, e.g.:

```
>tidy
	file="src/index.html"
	output="build/index.html"
	params="-indent -omit"/<
```

## Dependencies

*  The *tidy* executable must be installed and on the PATH.

## Properties

The following properties can be set on the command line to override the default behaviour:

*  *tidy.exe*  The name of the *tidy* executable

## Change Log

##### 2018-02-14 (PH) Initial version

    
# Macro Definitions

## tidy

Tidy HTML files

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source HTML file |  |  | no | 
| config | Path to HTML Tidy configuration file |  |  | no | 
| params | Additional parameters and options |  |  | no | 
| output | Path for output file(s) |  |  | no | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | no | 

## tidy-file

Run tidy on a single HTML file

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Path to the input file |  |  | yes | 
| config | Path to HTML Tidy configuration file |  |  | no | 
| params | Additional parameters and options |  |  | no | 
| output | Path for the output file |  |  | no | 

## tidy-dir

Run tidy on a folder of HTML files

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| config | Path to HTML Tidy configuration file |  |  | no | 
| params | Additional parameters and options |  |  | no | 
| output | Path for output file(s) |  |  | no | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | yes | 
