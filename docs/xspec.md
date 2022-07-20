---
author: Philip Hodder
contact: philip.hodder@encodis.com
date: 2018-05-02
project: XML Practical ANT Scripts
summary: Macro definitions to use XSpec within a build file
title: xspec.xml
---

# xspec.xml

A set of macro definitions to use
[XSpec](https://github.com/xspec/xspec) from within a build file. These
macros simply wrap the **xspec.bat** or **xspec.sh** command file.

> NOTE: These macros will execute the XSpec command file using ANT’s
> `<exec>` command. They do not attempt to replicate the logic in those
> files. Therefore XSpec must be installed and configured as described
> in its instructions. However, in addition to this, the folder
> containing the **xspec.bat/xspec.sh** files must be on the path.

## Usage

To run the XSLT tests specified in the **test1.xspec** file:

    <xspec file="test1.xspec" type="xslt"/>

## Dependencies

-   The *XSpec* framework must be installed and the command files (in
    the **bin** folder) available on the PATH.

## Properties

None.

## Change Log

##### 2018-03-19 (PH) Initial version

##### 2018-04-09 (PH) Macro naming alignment

# Macro Definitions

## xspec

Run XSpec tests

#### Attributes

| Name     | Description                 | Allowed                  | Default | Required |
|:---------|:----------------------------|:-------------------------|:-------:|:--------:|
| file     | XSpec file                  |                          |         |    no    |
| test     | Type of test to run         | xslt, xquery, schematron |         |    no    |
| coverage | Output test coverage report | true, false              |  false  |    no    |
| junit    | Output JUnit report         | true, false              |  false  |    no    |

#### Elements

| Name        | Description             | Implicit | Required |
|:------------|:------------------------|:--------:|:--------:|
| xspec.files | A fileset specification |   yes    |    no    |

## xspec-file

Run a single XSpec file

#### Attributes

| Name     | Description                 | Allowed                  | Default | Required |
|:---------|:----------------------------|:-------------------------|:-------:|:--------:|
| file     | XSpec file                  |                          |         |    no    |
| test     | Type of test to run         | xslt, xquery, schematron |         |    no    |
| coverage | Output test coverage report | true, false              |  false  |    no    |
| junit    | Output JUnit report         | true, false              |  false  |    no    |

## xspec-fileset

Run a folder of XSpec files

#### Attributes

| Name     | Description                 | Allowed                  | Default | Required |
|:---------|:----------------------------|:-------------------------|:-------:|:--------:|
| test     | Type of test to run         | xslt, xquery, schematron |         |    no    |
| coverage | Output test coverage report | true, false              |  false  |    no    |
| junit    | Output JUnit report         | true, false              |  false  |    no    |

#### Elements

| Name        | Description             | Implicit | Required |
|:------------|:------------------------|:--------:|:--------:|
| xspec.files | A fileset specification |   yes    |    no    |
