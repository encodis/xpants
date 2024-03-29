---
author: Philip Hodder
contact: philip.hodder@encodis.com
date: 2018-05-02
project: XML Practical ANT Scripts
summary: Macro definitions to validate XML instances using schema (XSD,
  DTD, RNC or RNG) or Schematron
title: validate-instance.xml
---

# validate-instance.xml

A set of macro definitions to validate an XML file using a related
schema. Essentially this macro is a wrapper around ANT’s built in
`<xmlvalidate>` and `<schemavalidate>` tasks, together with the `<java>`
task (for RelaxNG validation), and the `<apply-template>` and
`<compile-schematron>` macros (for Schematron validation). The top level
macro (“validate-instance”) will validate either a single file or a file
set, depending on the arguments supplied:

-   If the *file* attribute is not blank and refers to a file that
    exists then it will be validated, using the *output* attribute as
    the resulting file name for the report.
-   If the *file* attribute is not supplied then the macro will convert
    all files in a folder determined by the *input.files* element.

## Usage

To validate a single instance against its declared XSD:

    <validate-instance
        file="file.xml"
        type="xsd"
        report="docs/validation/file.log"/>

To validate a single instance against a specific XSD, storing the result
(as “true” or “false”) in the property *val-result*:

    <validate-instance
        file="file.xml"
        type="xsd"
        property="val-result"/>

To validate all XML files in the **models/instances** folder that begin
with “test” against their included DTD declarations, storing the results
in the **docs/validation** folder:

    <validate-instance
        report="docs/validation/"
        type="dtd">
        <fileset dir="models/instances">
            <include name="test*.xml"/>
        <fileset/>
    <validate-instance/>

## Dependencies

-   The [Jing](http://www.thaiopensource.com/relaxng/jing.html)
    validator must be installed on ANT’s classpath to validate RelaxNG
    files.

## Properties

The following properties can be set on the command line to override the
default behaviour:

-   *xpants.catalog* can be used to set a base XML catalog for resolving
    entities. The default is the value of the *XPANTS_CATALOG*
    environment variable (if set).

## Change Log

##### 2018-02-19 (PH) Initial version

##### 2018-04-09 (PH) Macro naming alignment

##### 2018-04-10 (PH) Renamed to validate-instance

##### 2022-07-20 (PH) Corrected doc rendering

# Macro Definitions

## validate-instance

Validate an instance file according to a schema

#### Attributes

| Name      | Description                        | Allowed                 | Default | Required |
|:----------|:-----------------------------------|:------------------------|:-------:|:--------:|
| file      | Source XML file                    |                         |         |    no    |
| type      | Type of schema validation          | dtd, xsd, rnc, rng, sch |         |    no    |
| schema    | Schema file                        |                         |         |    no    |
| namespace | Namespace URI (for XSD validation) |                         |         |    no    |
| report    | Path for report file(s)            |                         |         |    no    |
| property  | Property to update with result     |                         |         |    no    |

#### Elements

| Name        | Description             | Implicit | Required |
|:------------|:------------------------|:--------:|:--------:|
| input.files | A fileset specification |   yes    |    no    |

## validate-instance-file

Validate an XML instance document against a schema

#### Attributes

| Name      | Description                        | Allowed                 | Default | Required |
|:----------|:-----------------------------------|:------------------------|:-------:|:--------:|
| file      | Source XML file                    |                         |         |   yes    |
| type      | Type of schema validation          | dtd, xsd, rnc, rng, sch |         |    no    |
| schema    | Schema file                        |                         |         |    no    |
| namespace | Namespace URI (for XSD validation) |                         |         |    no    |
| report    | Path for report file(s)            |                         |         |    no    |
| property  | Property to update with result     |                         |         |    no    |

## validate-instance-fileset

Validate a folder of XML instance documents against a schema

#### Attributes

| Name      | Description                                         | Allowed       | Default | Required |
|:----------|:----------------------------------------------------|:--------------|:-------:|:--------:|
| schema    | Schema file                                         |               |         |    no    |
| namespace | Namespace URI (for XSD validation)                  |               |         |    no    |
| type      | Type of schema validation                           | dtd, xsd, rng |         |    no    |
| report    | Path for report file(s)                             |               |         |    no    |
| property  | Property to update with final result over all files |               |         |    no    |

#### Elements

| Name        | Description             | Implicit | Required |
|:------------|:------------------------|:--------:|:--------:|
| input.files | A fileset specification |   yes    |   yes    |
