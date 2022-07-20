---
author: Philip Hodder
contact: philip.hodder@encodis.com
date: 2022-07-19
project: XML Practical ANT Scripts
summary: Macros to help manipulate content files
title: content.xml
---

# content.xml

A set of utility macros to help manage content, usually for subsequent
processing in e.g. pandoc:

-   *compile-contents* produces a single file by concatenating all files
    in a folder, or by using a file containing a list of files. As these
    may also be Markdown files, this macro removes YAML headers from
    each one.

NOTE: PDF document production is still TBD.

## Usage

TBC

## Dependencies

None

## Properties

These macros use the following properties:

-   *xpants.debug* Output additional information for debugging

## Change Log

##### 2022-07-19 (Initial version) (PH)

# Macro Definitions

## compile-contents

Compile a list of contents into a single file

#### Attributes

| Name     | Description                                                 | Allowed | Default | Required |
|:---------|:------------------------------------------------------------|:--------|:-------:|:--------:|
| contents | File containing list of files to convert, one file per line |         |         |    no    |
| output   | Name of output file                                         |         |         |   yes    |

#### Elements

| Name       | Description              | Implicit | Required |
|:-----------|:-------------------------|:--------:|:--------:|
| contentSet | File set to be converted |   yes    |    no    |
