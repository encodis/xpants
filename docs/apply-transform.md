# apply-transform.xml

Macro definitions to apply an XSLT stylesheets or transforms to an XML
file (of folder of XML files). By default the stylesheet is applied in
place, i.e. the name of the file is not changed. The top level macro
(“apply-transform”) will transform either a single file or a folder,
depending on the arguments supplied:

  - If the *file* attribute is not blank and refers to a file that
    exists then it will be transformed.
  - If the *file* attribute is not supplied then the macro will
    transform all files in a folder determined by the *input.files*
    element.

Furthermore:

  - When processing an individual input file it will be overwritten in
    place, unless the *output* attribute is set in which case that will
    be used as the resulting file name.
  - If the *output* attribute refers to a directory then the output of
    the transform will be copied there. Also, if the *ext* attribute is
    set then it will replace the file’s original extension. *ext* should
    therefore contain a leading “.” if that is required.

> NOTE: It is the responsibility of the calling task to ensure that any
> output folders are created and specified before running this task.
> Otherwise each transformed file will overwrite the given output path.

The macro *apply-transform-file* can take an optional *params.xslt*
element which contains additional parameters to pass to ANT’s <xslt>
task. This cannot be passed to this macro via the main *apply-transform*
macro, so *apply-transform-file* must be used directly if this is the
case.

The *xslt* attribute can be used in one of two ways:

  - Primarily it can be used to specify a relative or absolute path to a
    stylesheet (e.g. `xslt="./my-stylesheets/convert.xsl"`).

  - However, it can also be used to specify default stylesheets in the
    XPantS XSLT Library. If the attribute value contains no path related
    information (e.g. `xslt="filter-svrl"`) then the macro will try to
    locate a stylesheet with that name and the extension “.xsl” in the
    **com/encodis/xpants/xslt** resource (i.e. in the XPantS jar file).
    So specifying `xslt="filter-svrl"` will make the macro try and load
    the resource **com/encodis/xpants/xslt/filter-svrl.xsl**.

## Usage

To apply the XPantS XSLT standard library stylesheet **remove-docs.xsl**
to the **my-schema.xsd** file, putting the result into the file
**my-schema-nodocs.xsd**:

    <apply-transform
        file="my-schema.xsd"
        output="my-schema-nodocs.xsd"
        xslt="remove-docs"/>

To apply the **remove-docs.xsl** stylesheet to the **my-schema.xsd**
file in place (so that **my-schema.xsd** is overwritten/updated):

    <apply-transform
        file="my-schema.xsd"
        xslt="remove-docs"/>

To apply the **remove-docs.xsl** stylesheet to all files in the
**schema** folder, putting the transformed files in the **updated**
folder with an extension of “.upd”:

    <apply-transform
        output="updated"
        ext=".upd"
        xslt="remove-docs">
        <fileset dir="schema">
            <include name="*.xml"/>
        </fileset>
    </apply-transform>

Apply a list of transforms in the XSLT library to a file, overwriting
the file:

    <apply-transform-list-file
        file="instance-doc.xml"
        xslt-list="remove-docs,remove-comments,remove-processing-instructions"/<

Process a Schematron file to include all “<xi:xinclude>” elements in the
output file. Note that as the XSLT engine is “xinclude aware” the file
just needs to be run through the “identity” transform:

    <apply-transform
        file="doc-with-xincludes.xml"
        output="expanded-doc.xml"
        xslt="identity"/<

## Dependencies

None.

## Properties

None.

## Change Log

##### 2018-02-14 (PH) Initial version

##### 2018-04-09 (PH) Macro naming alignment

# Macro Definitions

## apply-transform

Apply a stylsheet to the designated file(s)

#### Attributes

| Name   | Description                 | Allowed | Default | Required |
| :----- | :-------------------------- | :------ | :-----: | :------: |
| file   | Source XML file             |         |         |    no    |
| xslt   | XSLT file to be applied     |         |         |   yes    |
| ext    | Extension of output file(s) |         |         |    no    |
| output | Path for output file(s)     |         |         |    no    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |    no    |

## apply-transform-file

Apply a stylsheet to a file

#### Attributes

| Name   | Description                 | Allowed | Default | Required |
| :----- | :-------------------------- | :------ | :-----: | :------: |
| file   | Source XML file             |         |         |   yes    |
| xslt   | XSLT file to be applied     |         |         |   yes    |
| ext    | Extension of output file(s) |         |         |    no    |
| output | Path for output file        |         |         |    no    |

#### Elements

| Name        | Description                  | Implicit | Required |
| :---------- | :--------------------------- | :------: | :------: |
| params.xslt | A set of parameters for XSLT |   yes    |    no    |

## apply-transform-fileset

Apply a stylsheet to all files in a folder

#### Attributes

| Name   | Description                 | Allowed | Default | Required |
| :----- | :-------------------------- | :------ | :-----: | :------: |
| xslt   | XSLT file to be applied     |         |         |   yes    |
| ext    | Extension of output file(s) |         |         |    no    |
| output | Path for output files       |         |         |   yes    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |    no    |

## apply-transform-list-file

Apply a series of stylesheets to a
file

#### Attributes

| Name      | Description                                        | Allowed | Default | Required |
| :-------- | :------------------------------------------------- | :------ | :-----: | :------: |
| file      | Source file                                        |         |         |   yes    |
| xslt-list | Comma separated list of stylesheets to be applied  |         |         |    no    |
| output    | Final output file (default: overwrite source file) |         |         |    no    |

## apply-transform-list-fileset

Apply a series of stylesheets to all files in a
fileset

#### Attributes

| Name      | Description                                       | Allowed | Default | Required |
| :-------- | :------------------------------------------------ | :------ | :-----: | :------: |
| xslt-list | Comma separated list of stylesheets to be applied |         |         |    no    |
| ext       | Extension of output file(s)                       |         |         |    no    |
| output    | Output directory                                  |         |         |   yes    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |    no    |

## apply-transform-template

Run a stylesheet using an initial template

#### Attributes

| Name     | Description              | Allowed | Default | Required |
| :------- | :----------------------- | :------ | :-----: | :------: |
| xslt     | XSLT file to be executed |         |         |   yes    |
| template | Initial template         |         |         |   yes    |

#### Elements

| Name | Description           | Implicit | Required |
| :--- | :-------------------- | :------: | :------: |
| args | Additional parameters |   yes    |    no    |
