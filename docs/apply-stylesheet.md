# apply-stylesheet.xml

Macro definitions to apply an XSLT stylesheet to an XML file (of folder
of XML files). By default the stylesheet is applied in place, i.e. the
name of the file is not changed. The top level macro
(“apply-stylesheet”) will transform either a single file or a
folder, depending on the arguments supplied:

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
> output folders are created before running this task. Otherwise each
> transformed file will overwrite the given output path.

The macro *apply-stylesheet-file* can take an optional *params.xslt*
element which contains additional parameters to pass to ANT’s <xslt>
task. This cannot be passed to this macro via the main
*apply-stylesheet* macro, so *apply-stylesheet-file* must be used
directly if this is the case.

The *stylesheet* attribute can be used in one of two ways:

  - Primarily it can be used to specify a relative or absolute path to a
    stylesheet (e.g. `stylesheet="./my-stylesheets/convert.xsl"`).

  - However, it can also be used to specify default stylesheets in the
    XPantS XSLT Library. If the attribute value contains no path related
    information (e.g. `stylesheet="filter-svrl"`) then the macro will
    try to locate a stylesheet with that name and the extension “.xsl”
    in the **com/encodis/xpants/xslt** resource (i.e. in the XPantS jar
    file). So specifying `stylesheet="filter-svrl"` will make the macro
    try and load the resource
    **com/encodis/xpants/xslt/filter-svrl.xsl**.

## Usage

To apply the XPantS XSLT standard library stylesheet **remove-docs.xsl**
to the **my-schema.xsd** file, putting the result into the file
**my-schema-nodocs.xsd**:

    <apply-stylesheet
        file="my-schema.xsd"
        output="my-schema-nodocs.xsd"
        stylesheet="remove-docs"/>

To apply the **remove-docs.xsl** stylesheet to the **my-schema.xsd**
file in place (so that **my-schema.xsd** is overwritten/updated):

    <apply-stylesheet
        file="my-schema.xsd"
        stylesheet="remove-docs"/>

To apply the **remove-docs.xsl** stylesheet to all files in the
**schema** folder, putting the transformed files in the **updated**
folder with an extension of “.upd”:

    <apply-stylesheet
        output="updated"
        ext=".upd"
        stylesheet="remove-docs">
        <fileset dir="schema">
            <include name="*.xml"/>
        </fileset>
    </apply-stylesheet>

Apply a list of stylesheets in the XSLT library to a file, overwriting
the file:

    <apply-stylesheets
        file="instance-doc.xml"
        stylesheets="remove-docs,remove-comments,remove-processing-instructions"/<

Process a Schematron file to include all “<xi:xinclude>” elements in the
output file. Note that as the XSLT engine is aware of this the file just
needs to be run through the “identity” transform:

    <apply-stylesheet
        file="doc-with-xincludes.xml"
        output="expanded-doc.xml"
        stylesheet="identity"/<

## Dependencies

None.

## Properties

None.

## Change Log

##### 2018-02-14 (PH) Initial version

# Macro Definitions

## apply-stylesheet

Apply a stylsheet to the designated
file(s)

#### Attributes

| Name       | Description                 | Allowed | Default | Required |
| :--------- | :-------------------------- | :------ | :-----: | :------: |
| file       | Source XML file             |         |         |    no    |
| stylesheet | The XSLT file to be applied |         |         |   yes    |
| ext        | Extension of output file(s) |         |         |    no    |
| output     | Path for output file(s)     |         |         |    no    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |    no    |

## apply-stylesheet-file

Apply a stylsheet to a
file

#### Attributes

| Name       | Description                 | Allowed | Default | Required |
| :--------- | :-------------------------- | :------ | :-----: | :------: |
| file       | Source XML file             |         |         |   yes    |
| ext        | Extension of output file(s) |         |         |    no    |
| stylesheet | The XSLT file to be applied |         |         |   yes    |
| output     | Path for output file        |         |         |    no    |

#### Elements

| Name        | Description                  | Implicit | Required |
| :---------- | :--------------------------- | :------: | :------: |
| params.xslt | A set of parameters for XSLT |   yes    |    no    |

## apply-stylesheet-dir

Apply a stylsheet to all files in a
folder

#### Attributes

| Name       | Description                 | Allowed | Default | Required |
| :--------- | :-------------------------- | :------ | :-----: | :------: |
| stylesheet | The XSLT file to be applied |         |         |   yes    |
| ext        | Extension of output file(s) |         |         |    no    |
| output     | Path for output files       |         |         |   yes    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |    no    |

## apply-stylesheets

Apply a series of stylesheets to a file in
place

#### Attributes

| Name        | Description                                       | Allowed | Default | Required |
| :---------- | :------------------------------------------------ | :------ | :-----: | :------: |
| file        | Source file                                       |         |         |   yes    |
| output      | Final output file                                 |         |         |    no    |
| stylesheets | Comma separated list of stylesheets to be applied |         |         |    no    |
