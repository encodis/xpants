# pandoc.xml

A set of macro definitions to work with *python* modules.

## Usage

To converts a folder of Markdown files into standalone HTML files:

    <pandoc
        output="${build.dir}/manual"
        to="html"
        options="self-contained">
        <fileset dir="${docs.dir}" includes="*.md"/>
    <pandoc>

## Dependencies

  - The *pandoc* executable must be installed and available on the PATH.

## Properties

The following properties can be set on the command line to override the
default behaviour:

  - *pandoc.exe* The name of the *pandoc* executable

## Change Log

##### 2018-02-14 (PH) Initial version

# Macro Definitions

## pandoc

Run pandoc with
parameters

#### Attributes

| Name        | Description             | Allowed |          Default          | Required |
| :---------- | :---------------------- | :------ | :-----------------------: | :------: |
| file        | Source file             |         |                           |    no    |
| from        | Input format            |         |      markdown+smart       |    no    |
| to          | Output format           |         |           html5           |    no    |
| options     | List of options         |         | standalone,self-contained |    no    |
| datadir     | Pandoc data directory   |         |                           |    no    |
| template    | Template file           |         |                           |    no    |
| style       | Style                   |         |                           |    no    |
| filters     | List of filters         |         |                           |    no    |
| lua-filters | List of Lua filters     |         |                           |    no    |
| variables   | List of variables       |         |                           |    no    |
| output      | Path for output file(s) |         |                           |   yes    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |    no    |

## pandoc-file

Run pandoc on single file, with
parameters

#### Attributes

| Name        | Description           | Allowed |    Default     | Required |
| :---------- | :-------------------- | :------ | :------------: | :------: |
| file        | Input file            |         |                |   yes    |
| from        | Input format          |         | markdown+smart |    no    |
| to          | Output format         |         |     html5      |    no    |
| options     | List of options       |         |                |    no    |
| datadir     | Pandoc data directory |         |                |    no    |
| template    | Template file         |         |                |    no    |
| style       | CSS stylesheet        |         |                |    no    |
| filters     | List of filters       |         |                |    no    |
| lua-filters | List of Lua filters   |         |                |    no    |
| variables   | List of variables     |         |                |    no    |
| output      | Output file           |         |                |   yes    |

## pandoc-dir

Run pandoc on folder, with
parameters

#### Attributes

| Name        | Description              | Allowed |    Default     | Required |
| :---------- | :----------------------- | :------ | :------------: | :------: |
| from        | Input format             |         | markdown+smart |    no    |
| to          | Output format            |         |     html5      |    no    |
| options     | List of options          |         |                |    no    |
| datadir     | Pandoc data directory    |         |                |    no    |
| template    | Template file            |         |                |    no    |
| style       | Style                    |         |                |    no    |
| filters     | List of filters          |         |                |    no    |
| lua-filters | List of Lua filters      |         |                |    no    |
| variables   | List of variables        |         |                |    no    |
| output      | Path for converted files |         |                |   yes    |

#### Elements

| Name        | Description             | Implicit | Required |
| :---------- | :---------------------- | :------: | :------: |
| input.files | A fileset specification |   yes    |   yes    |
