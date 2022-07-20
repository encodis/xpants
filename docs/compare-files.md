---
author: Philip Hodder
contact: philip.hodder@encodis.com
date: 2018-05-02
project: XML Practical ANT Scripts
summary: Macro definitions to compare and difference files.
title: compare-files.xml
---

# compare-files.xml

A set of macro definitions to compare files and perform file
differencing.

The intended entry point for this library are the *compare-files* and
*compare-dirs* macros. *compare-files* will report whether two files are
the same or different; if the *output* attribute is specified then it is
assumed that the user wants a report of the differences. In that case
(and if the files are different) the *diff-files* macro will be invoked.

By default file differencing assumes the files are plain text files.
However, using the *type* parameter an XML aware difference can be
carried out using the DeltaXML software. These macro definitions are
therefore reliant on DeltaXML being installed (see below).

Directories can also be compared, although nested directories
(subfolders) are not currently supported. There are two modes available
for directory comparison. The first is a “shallow” comparison: the macro
checks that the two directories contain the same files by name. A “deep”
comparison is also possible—this checks that each file in the first
directory is the same as the corresponding file in the second.
Differences can also be produced, again by setting the *output*
attribute, although in this case the value refers to the root folder for
the results and this is only available for “deep” comparisons. (A
shallow comparison only checks file names—so they either match or they
don’t).

## Usage

The basic usage is straighforward. To compare two normal text files use
the following, which will set a property called *are-they-the-same* to
“true” if **file1.txt** is identical to **file2.txt**, and to “false”
otherwise:

    <compare-files
        fileA="file1.txt"
        fileB="file2.txt"
        result="are-they-the-same"/>

This next example will compare two files using the “diff” tool and (if
they are different) store the output in the **diff-1-2.txt** file. Note
that no property is set:

    <compare-files
        fileA="file1.txt"
        fileB="file2.txt"
        output="file-1-2.diff"/>

This example compares two XML files using DeltaXML. Note that the
*config* attribute specifies the type of comparison and is passed
directly to DeltaXML (so it must conform to the DeltaXML
specifications):

    <compare-files
        fileA="doc1.xml"
        fileB="doc2.xml"
        type="xml"
        config="delta"
        params="whitespace"
        output="diff-1-2.xml"/>

Note that the contents of the *config* parameter will depend on the
value of the *type*. When *type* is “xml” the *config* parameter must be
one of those values supported by DeltaXML (see below, these macros adopt
a default of “delta”). The *params* argument is used to supply
additional configuration options to the selected configuration (see
below). When *type* is “txt” this parameter refers to the command line
arguments supported by the *diff* tool. Run `$ diff --help` for more
information on the available options.

## DeltaXML

To use the XML differencing macros, DeltaXML must first be installed on
your local machine with the appropriate license server running.

### Configuration

When used in XML mode, the *config* property can take one of several
values, indicating the type of comparison to be performed:

-   *delta:* XML Compare, output XML delta
-   *diffreport:* XML Compare, output HTML folding report
-   *diffreport-sbs:* XML Compare, output HTML5 Side-by-Side report
-   *raw:* XML Compare, output recombinable delta
-   *schema:* Schema Compare, output HTML report
-   *xhtml:* XHTML Compare, output XHTML
-   *doc-delta:* XML Compare, output XML delta
-   *doc-diffreport:* XML Compare, output HTML folding report
-   *doc-diffreport-sbs:* XML Compare, output HTML Side-by-Side report

Some of these configurations take additional parameters, but these are
not yet enabled in these macros.

Full documentation can be found on the [DeltaXML web
site](https://docs.deltaxml.com/core/current/docs/command-processor.html).

### Parameters

The various DeltaXML comparison options can each be parameterised in a
variety of ways. These can be be viewed by running the DeltaXML
**command.jar** and using the “describe” option to list the options for
the chosen configuration. For example:
`$ java -jar /usr/local/bin/DeltaXMLCore-8_2_1_j/command.jar describe delta`.

Not all config/param options are supported by these macros. The ones
that are are listed in the table below, together with their default
values and their “macro” equivalents.

| Delta XML Parameter | Default | Macro name | delta | diffreport |
|:--------------------|:--------|:-----------|:-----:|:----------:|
| Preserve Whitespace | false   | whitespace |  yes  |    yes     |
| Full Context        | true    | context    |  yes  |     no     |
| Word By Word        | false   | word       |  yes  |    yes     |
| Enhanced Match 1    | true    | match      |  yes  |    yes     |
| Indent              | yes     | indent     |  yes  |     no     |

To turn an option on or off, use the “macro” version of the name
(prefixed with “no” to turn it off). Parameters that do not work with a
particular configuration have no effect (e.g. using the “Full Context”
option with the “diffreport” config).

For example, the following macro call will compare two files using
DeltaXML’s “delta” compare function with “Preserve Whitespace=false” and
“Full Context=false”. This will produce quite a compact difference file.

    <compare-files
        fileA="doc1.xml"
        fileB="doc2.xml"
        type="xml"
        config="delta"
        params="nowhitespace,nocontext"
        output="diff-1-2.xml"/>

## Dependencies

-   The *diff* executable must be installed and available on the PATH.
-   The DeltaXML software must be installed on the system correctly
-   The DeltaXML license file/server must be installed on the system
    correctly

## Properties

The following properties can be set on the command line to override the
default behaviour:

-   *diff.exe* The name of the *diff* executable
-   *deltaxml.dir* The default DeltaXML install location (default:
    **/usr/local/bin/DeltaXMLCore-8_2\_1_j**)

## Change Log

##### 2018-02-15 (PH) Initial version

# Macro Definitions

## compare-files

Compare two files and report on differences

#### Attributes

| Name   | Description                                               | Allowed  | Default | Required |
|:-------|:----------------------------------------------------------|:---------|:-------:|:--------:|
| fileA  | Path to first file                                        |          |         |   yes    |
| fileB  | Path to second file                                       |          |         |   yes    |
| result | Property to store comparison result                       |          |         |    no    |
| type   | Type of file comparison                                   | txt, xml |   txt   |    no    |
| config | Configuration parameters or arguments for the comparison  |          |         |    no    |
| params | Parameters passed to the DeltaXML pipeline (for type=xml) |          |         |    no    |
| output | Path to file to store differencing results                |          |         |    no    |

## compare-dirs

Compare two directories and report on the differences

#### Attributes

| Name   | Description                                                   | Allowed  | Default | Required |
|:-------|:--------------------------------------------------------------|:---------|:-------:|:--------:|
| dirA   | Path to first directory                                       |          |         |   yes    |
| dirB   | Path to second directory                                      |          |         |   yes    |
| deep   | Perform deep or shallow comparison                            |          |  false  |    no    |
| result | Property to store comparison result                           |          |         |   yes    |
| type   | Type of file comparison                                       | txt, xml |   txt   |    no    |
| config | Configuration parameters or arguments for the file comparison |          |         |    no    |
| params | Parameters passed to the DeltaXML pipeline (for type=xml)     |          |         |    no    |
| output | Path to file to store differencing results                    |          |         |    no    |

## compare-dirs-shallow

Compare two directories and report on the differences (shallow, names
only)

#### Attributes

| Name   | Description                         | Allowed | Default | Required |
|:-------|:------------------------------------|:--------|:-------:|:--------:|
| dirA   | Path to first directory             |         |         |   yes    |
| dirB   | Path to second directory            |         |         |   yes    |
| result | Property to store comparison result |         |         |   yes    |

## compare-dirs-deep

Compare two directories and report on the differences (deep, compare
individual files)

#### Attributes

| Name   | Description                                                   | Allowed  | Default | Required |
|:-------|:--------------------------------------------------------------|:---------|:-------:|:--------:|
| dirA   | Path to first directory                                       |          |         |   yes    |
| dirB   | Path to second directory                                      |          |         |   yes    |
| result | Property to store comparison result                           |          |         |   yes    |
| type   | Type of file comparison                                       | txt, xml |   txt   |    no    |
| config | Configuration parameters or arguments for the file comparison |          |         |    no    |
| params | Parameters passed to the DeltaXML pipeline (for type=xml)     |          |         |    no    |
| output | Path to file to store differencing results                    |          |         |    no    |

## diff-files

Difference two files

#### Attributes

| Name   | Description                                              | Allowed  | Default | Required |
|:-------|:---------------------------------------------------------|:---------|:-------:|:--------:|
| fileA  | Path to first file                                       |          |         |   yes    |
| fileB  | Path to second file                                      |          |         |   yes    |
| type   | Type of comparison                                       | txt, xml |   txt   |    no    |
| config | Configuration parameters or arguments for the comparison |          |         |    no    |
| params | Parameters passed to the DeltaXML pipeline               |          |         |    no    |
| output | Path to file to store results                            |          |         |   yes    |

## diff-files-txt

Difference two files using the diff tool

#### Attributes

| Name   | Description                                              | Allowed | Default  | Required |
|:-------|:---------------------------------------------------------|:--------|:--------:|:--------:|
| fileA  | Path to first file                                       |         |          |   yes    |
| fileB  | Path to second file                                      |         |          |   yes    |
| config | Configuration parameters or arguments for the comparison |         | –context |    no    |
| output | Path to file to store results                            |         |          |   yes    |

## diff-files-xml

Difference two files using the DeltaXML tool

#### Attributes

| Name   | Description                                | Allowed                                                                                              | Default | Required |
|:-------|:-------------------------------------------|:-----------------------------------------------------------------------------------------------------|:-------:|:--------:|
| fileA  | Path to first file                         |                                                                                                      |         |   yes    |
| fileB  | Path to second file                        |                                                                                                      |         |   yes    |
| config | Configuration ID to use for XML comparison | delta, diffreport, diffreport-sbs, raw, schema, xhtml, doc-delta, doc-diffreport, doc-diffreport-sbs |  delta  |    no    |
| params | Parameters passed to the DeltaXML pipeline |                                                                                                      |         |    no    |
| output | Path to file to store results              |                                                                                                      |         |   yes    |
