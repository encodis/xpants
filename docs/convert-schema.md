---
author: Philip Hodder
contact: philip.hodder@encodis.com
date: 2018-05-02
project: XML Practical ANT Scripts
summary: Macro definitions to between schema formats
title: convert-schema.xml
---

# convert-schema.xml

Macro definitions to convert between schema formats. The generic
conversion macro is *convert-schema*, which will convert a schema to
another format as followed:

-   The file referred to in the *file* attribute will be converted,
    using the *output* attribute (if provided) as the resulting file
    name.

-   If the *output* attribute is not provided the output format (given
    via the *out* attribute) is appended to the basename of the input
    file and that is used as the output file.

-   The *from* attribute must be set to the input format. This must be
    one of:

    -   dtd
    -   rnc
    -   rng

-   The *to* attribute must be set to the output format required. This
    must be one of:

    -   xsd
    -   dtd
    -   rng
    -   rnc

The additional macros listed below are simply wrappers around
*convert-schema* which supplies default values of the *in* and *out*
attributes appropriately:

-   [convert-rnc-to-rng](#convert-rnc-to-rng)
-   [convert-rnc-to-dtd](#convert-rnc-to-dtd)
-   [convert-rnc-to-xsd](#convert-rnc-to-xsd)
-   [convert-rng-to-rnc](#convert-rng-to-rnc)
-   [convert-rng-to-xsd](#convert-rng-to-xsd)
-   [convert-rng-to-dtd](#convert-rng-to-dtd)
-   [convert-dtd-to-rnc](#convert-dtd-to-rnc)
-   [convert-dtd-to-xsd](#convert-dtd-to-xsd)
-   [convert-dtd-to-rng](#convert-dtd-to-rng)

> NOTE: It is the responsibility of the calling task to ensure that any
> output folders are created before running this task.

## Usage

    <convert-schema
        file="file.rnc"
        output="file.xsd"
        from="rnc"
        to="xsd"/>

    <convert-rnc-to-xsd
        file="file.rnc"
        output="file.xsd"/>

## Dependencies

-   The [Trang](http://www.thaiopensource.com/relaxng/trang.html) JAR
    file must be installed on ANT’s classpath.

## Properties

Override the following property to change the value of the Trang class
being used:

-   *trang.class* (default:
    “com.thaiopensource.relaxng.translate.Driver”)

## Change Log

##### 2018-02-15 (PH) Initial version

# Macro Definitions

## convert-schema

Use Trang to convert between schema syntaxes (DTD, RNC, RNG and XSD)

#### Attributes

| Name   | Description      | Allowed            | Default | Required |
|:-------|:-----------------|:-------------------|:-------:|:--------:|
| file   | Source file name |                    |         |   yes    |
| output | Output file name |                    |         |    no    |
| from   | Input format     | dtd, rng, rnc      |         |   yes    |
| to     | Output format    | xsd, dtd, rng, rnc |         |   yes    |

#### Elements

| Name         | Description                                                        | Implicit | Required |
|:-------------|:-------------------------------------------------------------------|:--------:|:--------:|
| params.trang | Additional parameters to be passed to Trang’s input/output modules |   yes    |    no    |

## convert-rnc-to-xsd

Convert an RNC file into an XSD file

#### Attributes

| Name   | Description     | Allowed | Default | Required |
|:-------|:----------------|:--------|:-------:|:--------:|
| file   | Source RNC file |         |         |   yes    |
| output | Output XSD file |         |         |    no    |

#### Elements

| Name         | Description                                                        | Implicit | Required |
|:-------------|:-------------------------------------------------------------------|:--------:|:--------:|
| params.trang | Additional parameters to be passed to Trang’s input/output modules |   yes    |    no    |

## convert-rng-to-xsd

Convert an RNG file into an XSD file

#### Attributes

| Name   | Description     | Allowed | Default | Required |
|:-------|:----------------|:--------|:-------:|:--------:|
| file   | Source RNG file |         |         |   yes    |
| output | Output XSD file |         |         |    no    |

#### Elements

| Name         | Description                                                        | Implicit | Required |
|:-------------|:-------------------------------------------------------------------|:--------:|:--------:|
| params.trang | Additional parameters to be passed to Trang’s input/output modules |   yes    |    no    |

## convert-dtd-to-xsd

Convert an DTD file into an XSD file

#### Attributes

| Name   | Description     | Allowed | Default | Required |
|:-------|:----------------|:--------|:-------:|:--------:|
| file   | Source DTD file |         |         |   yes    |
| output | Output XSD file |         |         |    no    |

#### Elements

| Name         | Description                                                        | Implicit | Required |
|:-------------|:-------------------------------------------------------------------|:--------:|:--------:|
| params.trang | Additional parameters to be passed to Trang’s input/output modules |   yes    |    no    |

## convert-dtd-to-rnc

Convert an DTD file into an RNC file

#### Attributes

| Name   | Description     | Allowed | Default | Required |
|:-------|:----------------|:--------|:-------:|:--------:|
| file   | Source DTD file |         |         |   yes    |
| output | Output RNC file |         |         |    no    |

#### Elements

| Name         | Description                                                        | Implicit | Required |
|:-------------|:-------------------------------------------------------------------|:--------:|:--------:|
| params.trang | Additional parameters to be passed to Trang’s input/output modules |   yes    |    no    |

## convert-dtd-to-rng

Convert an DTD file into an RNC file

#### Attributes

| Name   | Description     | Allowed | Default | Required |
|:-------|:----------------|:--------|:-------:|:--------:|
| file   | Source DTD file |         |         |   yes    |
| output | Output RNG file |         |         |    no    |

#### Elements

| Name         | Description                                                        | Implicit | Required |
|:-------------|:-------------------------------------------------------------------|:--------:|:--------:|
| params.trang | Additional parameters to be passed to Trang’s input/output modules |   yes    |    no    |

## convert-rnc-to-rng

Convert an RNC file into an RNG file

#### Attributes

| Name   | Description     | Allowed | Default | Required |
|:-------|:----------------|:--------|:-------:|:--------:|
| file   | Source RNC file |         |         |   yes    |
| output | Output RNG file |         |         |    no    |

#### Elements

| Name         | Description                                                        | Implicit | Required |
|:-------------|:-------------------------------------------------------------------|:--------:|:--------:|
| params.trang | Additional parameters to be passed to Trang’s input/output modules |   yes    |    no    |

## convert-rng-to-rnc

Convert an RNG file into an RNC file

#### Attributes

| Name   | Description     | Allowed | Default | Required |
|:-------|:----------------|:--------|:-------:|:--------:|
| file   | Source RNG file |         |         |   yes    |
| output | Output RNC file |         |         |    no    |

#### Elements

| Name         | Description                                                        | Implicit | Required |
|:-------------|:-------------------------------------------------------------------|:--------:|:--------:|
| params.trang | Additional parameters to be passed to Trang’s input/output modules |   yes    |    no    |

## convert-rng-to-dtd

Convert an RNG file into a DTD file

#### Attributes

| Name   | Description     | Allowed | Default | Required |
|:-------|:----------------|:--------|:-------:|:--------:|
| file   | Source RNG file |         |         |   yes    |
| output | Output DTD file |         |         |    no    |

#### Elements

| Name         | Description                                                        | Implicit | Required |
|:-------------|:-------------------------------------------------------------------|:--------:|:--------:|
| params.trang | Additional parameters to be passed to Trang’s input/output modules |   yes    |    no    |

## convert-rnc-to-dtd

Convert an RNC file into a DTD file

#### Attributes

| Name   | Description     | Allowed | Default | Required |
|:-------|:----------------|:--------|:-------:|:--------:|
| file   | Source RNC file |         |         |   yes    |
| output | Output DTD file |         |         |    no    |

#### Elements

| Name         | Description                                                        | Implicit | Required |
|:-------------|:-------------------------------------------------------------------|:--------:|:--------:|
| params.trang | Additional parameters to be passed to Trang’s input/output modules |   yes    |    no    |
