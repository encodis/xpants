# validate-with-dtd.xml

A set of macro definitions to validate an XML file using a DTD.
Essentially this is a wrapper around ANT’s built in `<xmlvalidate>`
task, but with enhanced reporting and output file manipulation. The top
level macro (“validate-with-dtd”) will validate either a single file or
a folder, depending on the arguments supplied:

  - If the *file* attribute is not blank and refers to a file that
    exists then it will be validated, using the *output* attribute as
    the resulting file name for the report.
  - If the *file* attribute is not supplied then the macro will convert
    all files in a folder determined by the ‘input.files’ element.

> NOTE: It is the responsibility of the calling task to ensure that any
> output folders are created before running this task.

## Usage

    <validate-with-dtd
        file="file.xml"
        output="docs/validation/file.svrl"
        format="svrl"/>

    <validate-with-dtd
        output="docs/validation/"
        format="html">
        <fileset dir="models/instances">
            <include name="*test*.xml"/>
        <fileset/>
    <validate-with-dtd/>

## Dependencies

### Stylesheets

This module uses the following stylesheets:

  - **convert-log-to-svrl.xsl** Converts the ANT log to SVRL.
  - **convert-svrl-to-html.xsl** Converts SVRL format into HTML.

> NOTE: The ‘svrl’ output option is not currently functional as the
> **convert-ant-to-svrl.xsl** file has not been written.

## Properties

The following properties can be set on the command line to override the
default behaviour:

  - *convert-log-to-svrl.stylesheet* The stylesheet to be used to
    convert ANT log files to SVRL
  - *convert-svrl-to-html.stylesheet* The stylesheet to be used to
    convert SVRL to HTML

## Change Log

##### 2018-02-19 (PH) Initial version

# Macro Definitions

## validate-with-dtd

Validate a file according to a
DTD

#### Attributes

| Name   | Description                | Allowed         | Default | Required |
| :----- | :------------------------- | :-------------- | :-----: | :------: |
| file   | Source XML file            |                 |         |    no    |
| format | Format of the final report | txt, svrl, html |  svrl   |    no    |
| output | Path for report file(s)    |                 |         |   yes    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |    no    |

## validate-with-dtd-file

Validate an individual XML file against its
DTD

#### Attributes

| Name   | Description                | Allowed         | Default | Required |
| :----- | :------------------------- | :-------------- | :-----: | :------: |
| file   | Source XML file            |                 |         |   yes    |
| output | Result file                |                 |         |   yes    |
| format | Format of the final report | txt, svrl, html |  svrl   |    no    |

## validate-with-dtd-dir

Validate a folder of XML files against their
DTDs

#### Attributes

| Name   | Description                | Allowed         | Default | Required |
| :----- | :------------------------- | :-------------- | :-----: | :------: |
| output | Folder for report files    |                 |         |   yes    |
| format | Format of the final report | txt, svrl, html |  svrl   |    no    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |   yes    |

## validate-with-dtd-to-txt

Validate an XML file and output the validation report as text

#### Attributes

| Name   | Description        | Allowed | Default | Required |
| :----- | :----------------- | :------ | :-----: | :------: |
| file   | Source XML file    |         |         |   yes    |
| output | Output report file |         |         |   yes    |

## validate-with-dtd-to-svrl

Validate an XML file and output the validation report as SVRL

#### Attributes

| Name   | Description        | Allowed | Default | Required |
| :----- | :----------------- | :------ | :-----: | :------: |
| file   | Source XML file    |         |         |   yes    |
| output | Output report file |         |         |   yes    |

## validate-with-dtd-to-html

Validate an XML file and output the validation report as HTML

#### Attributes

| Name   | Description        | Allowed | Default | Required |
| :----- | :----------------- | :------ | :-----: | :------: |
| file   | Source XML file    |         |         |   yes    |
| output | Output report file |         |         |   yes    |
