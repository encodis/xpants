# version.xml

This module defines macros for retrieving and manipulating version and
build numbers stored in a properties file (the default is
“build.properties”).

The properties file is assumed to declare either a *version.number*
property or a *build.number* property, or both. Optionally, it can
contain a *release.stage*.

Full semantic versioning of the *version.number* property is assumed.
The *build.number* is assumed to be an unsigned integer:

    version.number=1.4.2
    build.number=32
    release.stage=RC2

The *release.stage* can only be explicitly set using the
`<release-stage-set>`, which only accepts the values given by the
*stages* attribute. The default values of the attribute are:
“pre-alpha”, “alpha”, “beta”, “rc1”, “rc2” and “stable”.

## Usage

To update the **build.properties** file by incrementing the “major”
version number by 1 (the default):

    <version-inc-major/>

To update the **build.properties** file by incrementing the “minor”
version number by 2:

    <version-inc-minor increment="2"/>

To update the **build.properties** file by setting the version number
explicitly:

    <version-number-set version="3.1.4"/>

To update the **build.properties** file by incrementing the build number
by 1:

    <build-inc/>

To update the version number from the command line add a target similar
to the following:

    <target name="version">
        <version-inc element="${version.bump}"/>
    </target>

and run:

    $ ant version -Dversion.bump=major

## Dependencies

  - A **build.properties** file (or equivalent) must be available

## Properties

## Change Log

##### 2018-02-14 (PH) Initial version

##### 2018-04-09 (PH) Name changed to ‘version-number’

# Macro Definitions

## version-inc

Update a version
number

#### Attributes

| Name      | Description                             | Allowed                    |     Default      | Required |
| :-------- | :-------------------------------------- | :------------------------- | :--------------: | :------: |
| file      | Properties file for version information |                            | build.properties |    no    |
| increment | Amount to increment version number      |                            |        1         |    no    |
| element   | Version number element to increment     | major, minor, patch, build |      patch       |    no    |

## version-inc-major

Increment the major version
number

#### Attributes

| Name      | Description                             | Allowed |     Default      | Required |
| :-------- | :-------------------------------------- | :------ | :--------------: | :------: |
| file      | Properties file for version information |         | build.properties |    no    |
| increment | Amount to increment version number      |         |        1         |    no    |

## version-inc-minor

Increment the minor version
number

#### Attributes

| Name      | Description                             | Allowed |     Default      | Required |
| :-------- | :-------------------------------------- | :------ | :--------------: | :------: |
| file      | Properties file for version information |         | build.properties |    no    |
| increment | Amount to increment version number      |         |        1         |    no    |

## version-inc-patch

Increment the patch version
number

#### Attributes

| Name      | Description                             | Allowed |     Default      | Required |
| :-------- | :-------------------------------------- | :------ | :--------------: | :------: |
| file      | Properties file for version information |         | build.properties |    no    |
| increment | Amount to increment version number      |         |        1         |    no    |

## build-inc

Increment the build
number

#### Attributes

| Name      | Description                             | Allowed |     Default      | Required |
| :-------- | :-------------------------------------- | :------ | :--------------: | :------: |
| file      | Properties file for version information |         | build.properties |    no    |
| increment | Amount to increment version number      |         |        1         |    no    |

## version-number-set

Set the version
number

#### Attributes

| Name    | Description                             | Allowed |     Default      | Required |
| :------ | :-------------------------------------- | :------ | :--------------: | :------: |
| file    | Properties file for version information |         | build.properties |    no    |
| version | New version number                      |         |                  |   yes    |

## build-number-set

Set the build
number

#### Attributes

| Name  | Description                             | Allowed |     Default      | Required |
| :---- | :-------------------------------------- | :------ | :--------------: | :------: |
| file  | Properties file for version information |         | build.properties |    no    |
| build | New build number                        |         |                  |   yes    |

## release-stage-set

Set the release
stage

#### Attributes

| Name   | Description                             | Allowed                                  |               Default               | Required |
| :----- | :-------------------------------------- | :--------------------------------------- | :---------------------------------: | :------: |
| file   | Properties file for version information |                                          |          build.properties           |    no    |
| stage  | New release stage                       |                                          |                                     |   yes    |
| stages | Allowed stage names                     | pre-alpha, alpha, beta, rc1, rc2, stable | pre-alpha,alpha,beta,rc1,rc2,stable |    no    |
