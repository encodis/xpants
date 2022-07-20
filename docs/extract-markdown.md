---
author: Philip Hodder
contact: philip.hodder@encodis.com
date: 2018-05-02
project: XML Practical ANT Scripts
summary: Macro definitions to use extract Markdown documentation from
  files
title: extract-markdown.xml
---

# extract-markdown.xml

Macro definitions to extract documentation (as Markdown) embedded in
various types of files. The user can specifiy a stylesheet to use for
the extraction. Successful extraction will depend on the source files
containing the relevant elements with the Markdown documentation.

-   If the *file* attribute is not blank and refers to a file that
    exists then documentation will be extracted from it, using the
    *output* attribute as the resulting file name for the report.
-   If the *file* attribute is not supplied then the macro will extract
    Markdown from all files in a folder determined by the ‘input’
    element.

The type of extraction is determined by the *type* attribute. Currently
this can be set to anything, although if left blank it will try to
determine the type from the file extension. This works fine for
Schematron (“.sch”) and XSLT (“.xsl”) files, but for ANT files the type
will need to be given explicitly (as they are usually just “.xml”
files).

> WARNING: The stylesheets used by these macros will also extract text
> node messages embedded in <echo> and <fail> elements. Therefore use
> the “message” attribute of these elements if possible.

## Usage

    <extract-markdown
        file="${src.dir}/sample.sch"
        output="${docs.dir}/sample.md"/>

    <extract-markdown
        file="${src.dir}/git.xml"
        type="ant"
        output="${docs.dir}/git.md"/>

## Dependencies

These stylesheets are included using the default stylesheet mechanism
described in [apply-transform](apply-transform.html):

-   **extract-markdown-from-ant.xsl:** This is the standard stylesheet
    used to extract Markdown from ANT scripts.
-   **extract-markdown-from-sch.xsl:** This is the standard stylesheet
    used to extract Markdown from Schematron files.
-   **extract-markdown-from-xslt.xsl:** This is the standard stylesheet
    used to extract Markdown from XSLT files.

## Change Log

##### 2018-02-15 (PH) Initial version

##### 2018-04-09 (PH) Macro naming alignment

# Macro Definitions

## extract-markdown

Extract Markdown documentation from files

#### Attributes

| Name   | Description                         | Allowed       | Default | Required |
|:-------|:------------------------------------|:--------------|:-------:|:--------:|
| file   | Source file                         |               |         |    no    |
| type   | Source file type                    | ant, sch, xsl |         |   yes    |
| output | Path for extracted Markdown file(s) |               |         |   yes    |

#### Elements

| Name        | Description             | Implicit | Required |
|:------------|:------------------------|:--------:|:--------:|
| input.files | A fileset specification |   yes    |    no    |

## extract-markdown-file

Extract Markdown documentation from a single file

#### Attributes

| Name   | Description                      | Allowed       | Default | Required |
|:-------|:---------------------------------|:--------------|:-------:|:--------:|
| file   | Source file                      |               |         |   yes    |
| type   | Source file type                 | ant, sch, xsl |         |    no    |
| output | Path for extracted Markdown file |               |         |   yes    |

## extract-markdown-fileset

Extract Markdown documentation from a set of files

#### Attributes

| Name   | Description              | Allowed       | Default | Required |
|:-------|:-------------------------|:--------------|:-------:|:--------:|
| type   | Source file type         | ant, sch, xsl |         |   yes    |
| output | Path for extracted files |               |         |   yes    |

#### Elements

| Name        | Description             | Implicit | Required |
|:------------|:------------------------|:--------:|:--------:|
| input.files | A fileset specification |   yes    |   yes    |
