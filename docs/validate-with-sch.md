# validate-with-sch.xml

A set of macro definitions to validate an XML file using a Schematron
file. Essentially this is a wrapper around various XSLT stylesheets, but
with enhanced reporting and output file manipulation. The top level
macro (“validate-with-sch”) will validate either a single file or a
folder, depending on the arguments supplied:

  - If the *file* attribute is not blank and refers to a file that
    exists then it will be validated, using the *output* attribute as
    the resulting file name for the report.
  - If the *file* attribute is not supplied then the macro will validate
    all files in a folder determined by the ‘input.files’ element.

> IMPORTANT: It is assumed that the Schematron has been compiled in a
> previous task, i.e. that the “schematron” file is actually an XSLT.

> NOTE: It is the responsibility of the calling task to ensure that any
> output folders are created before running this task.

## Usage

    <validate-with-sch
        file="file.sch"
        output="docs/validation/file.svrl"
        schematron="compiled/test.xsl"
        format="svrl"/>

    <validate-with-sch
        file="file.sch"
        output="docs/validation/file.html"
        schematron="compiled/test.xsl"
        format="html"/>

## Dependencies

### Stylesheets

This module uses the following stylesheets:

  - **convert-svrl-to-html.xsl** Converts SVRL format into HTML.

## Properties

The following properties can be set on the command line to override the
default behaviour:

  - *convert-svrl-to-html.stylesheet*

## Change Log

##### 2018-02-19 (PH) Initial version

# Macro Definitions

## validate-with-sch

Validate a file according to a Schematron
file

#### Attributes

| Name       | Description                | Allowed    | Default | Required |
| :--------- | :------------------------- | :--------- | :-----: | :------: |
| file       | Source XML file(s)         |            |         |    no    |
| schematron | Path for Schematron file   |            |         |   yes    |
| format     | Format of the final report | svrl, html |  svrl   |    no    |
| output     | Path for report file(s)    |            |         |   yes    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |    no    |

## validate-with-sch-file

Validate an individual XML file against a specified
Schematron

#### Attributes

| Name       | Description                | Allowed    | Default | Required |
| :--------- | :------------------------- | :--------- | :-----: | :------: |
| file       | Source XML file            |            |         |   yes    |
| format     | Format of the final report | svrl, html |  svrl   |    no    |
| output     | Name for the result file   |            |         |   yes    |
| schematron | Path for Schematron file   |            |         |   yes    |

## validate-with-sch-dir

Validate a folder of XML files against a single Schematron
file

#### Attributes

| Name       | Description                  | Allowed    | Default | Required |
| :--------- | :--------------------------- | :--------- | :-----: | :------: |
| schematron | Path for the Schematron file |            |         |   yes    |
| format     | Format of the final report   | svrl, html |  svrl   |    no    |
| output     | Path for extracted files     |            |         |   yes    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |   yes    |

## validate-with-sch-to-svrl

Validate an XML file using Schematron and output the validation report
as SVRL

#### Attributes

| Name       | Description              | Allowed | Default | Required |
| :--------- | :----------------------- | :------ | :-----: | :------: |
| file       | Source XML file          |         |         |   yes    |
| output     | Output report file       |         |         |   yes    |
| schematron | Path for Schematron file |         |         |   yes    |

## validate-with-sch-to-html

Validate an XML file and output the validation report as HTML

#### Attributes

| Name       | Description              | Allowed | Default | Required |
| :--------- | :----------------------- | :------ | :-----: | :------: |
| file       | Source XML file          |         |         |   yes    |
| output     | Output report file       |         |         |   yes    |
| schematron | Path for Schematron file |         |         |   yes    |

## check-schematron-validity

Check the results of a Schematron report
file

#### Attributes

| Name     | Description                       | Allowed | Default | Required |
| :------- | :-------------------------------- | :------ | :-----: | :------: |
| report   | File containing Schematron report |         |         |   yes    |
| property | Property to contain result        |         |         |   yes    |
