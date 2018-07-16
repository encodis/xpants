# tidy.xml

This module defines macros for processing content using ‘tidy’. The
first processes individual files and the second processes entire trees
by way of a fileset.

  - If the *file* attribute is not blank and refers to a file that
    exists then it will be converted.
  - If the *file* attribute is not supplied then the macro will convert
    all files in a folder determined by the ‘input-fileset’ element and
    place them in the *output* folder with the same name. If the
    ‘input-fileset’ is empty the macro will fail.

> NOTE: It is the responsibility of the calling task to ensure that any
> output folders are created before running this task.

## Usage

Basic usage:

    >tidy
        file="src/index.html"
        output="build/index.html"/<

Use the *params* property to set various command line options, e.g.:

    >tidy
        file="src/index.html"
        output="build/index.html"
        params="-indent -omit"/<

## Dependencies

  - The *tidy* executable must be installed and on the PATH.

## Properties

The following properties can be set on the command line to override the
default behaviour:

  - *tidy.exe* The name of the *tidy* executable

## Change Log

##### 2018-02-14 (PH) Initial version

# Macro Definitions

## tidy

Tidy HTML
files

#### Attributes

| Name   | Description                          | Allowed | Default | Required |
| :----- | :----------------------------------- | :------ | :-----: | :------: |
| file   | Source HTML file                     |         |         |    no    |
| config | Path to HTML Tidy configuration file |         |         |    no    |
| params | Additional parameters and options    |         |         |    no    |
| output | Path for output file(s)              |         |         |    no    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |    no    |

## tidy-file

Run tidy on a single HTML
file

#### Attributes

| Name   | Description                          | Allowed | Default | Required |
| :----- | :----------------------------------- | :------ | :-----: | :------: |
| file   | Path to the input file               |         |         |   yes    |
| config | Path to HTML Tidy configuration file |         |         |    no    |
| params | Additional parameters and options    |         |         |    no    |
| output | Path for the output file             |         |         |    no    |

## tidy-fileset

Run tidy on a folder of HTML
files

#### Attributes

| Name   | Description                          | Allowed | Default | Required |
| :----- | :----------------------------------- | :------ | :-----: | :------: |
| config | Path to HTML Tidy configuration file |         |         |    no    |
| params | Additional parameters and options    |         |         |    no    |
| output | Path for output file(s)              |         |         |    no    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |   yes    |
