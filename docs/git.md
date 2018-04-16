# git.xml

A set of macro definitions to use *git* commands within a build file.
The basic ‘git’ macro is defined, along with others that set properties
using the results of certain *git* commands like “status” and “branch”.

## Usage

Check the current *git* branch name matches the current version number:

    <property name="version" value="v1.2"/>
    
    <git-branch-name pattern="release/${version}">

## Dependencies

  - The *git* executable must be installed and available on the PATH.

## Properties

The following properties can be set on the command line to override the
default behaviour:

  - *git.exe* The name of the *git* executable

## Change Log

##### 2018-02-14 (PH) Initial version

# Macro Definitions

## git

Run git with command line
arguments

#### Attributes

| Name     | Description                                 | Allowed | Default | Required |
| :------- | :------------------------------------------ | :------ | :-----: | :------: |
| command  | git command to run                          |         |         |   yes    |
| dir      | Directory in which to run the git command   |         |    .    |    no    |
| property | Name of the property to store the result in |         |         |    no    |

#### Elements

| Name | Description                      | Implicit | Required |
| :--- | :------------------------------- | :------: | :------: |
| args | Remaining command line arguments |    no    |    no    |

## git-branch

Create a property with the current branch
name

#### Attributes

| Name     | Description                         | Allowed | Default | Required |
| :------- | :---------------------------------- | :------ | :-----: | :------: |
| property | Property containing the branch name |         |         |   yes    |

## git-tag

Create an annotated tag

#### Attributes

| Name    | Description | Allowed | Default | Required |
| :------ | :---------- | :------ | :-----: | :------: |
| tag     | Tag value   |         |         |   yes    |
| message | Tag message |         |         |   yes    |

## git-latest-tag

Get the latest tag on the current
branch

#### Attributes

| Name     | Description                 | Allowed | Default | Required |
| :------- | :-------------------------- | :------ | :-----: | :------: |
| property | Property containing the tag |         |         |   yes    |

## git-commit

Stage all files and commit

#### Attributes

| Name    | Description    | Allowed | Default | Required |
| :------ | :------------- | :------ | :-----: | :------: |
| message | Commit message |         |         |   yes    |

## git-status

Create a property with current git
status

#### Attributes

| Name     | Description                    | Allowed | Default | Required |
| :------- | :----------------------------- | :------ | :-----: | :------: |
| property | Property containing the status |         |         |   yes    |

## git-check-outstanding-commits

Fail the build if there are outstanding commits on the current branch

## git-check-repo

Fail the build if not in a git repository

## git-check-branch

Fail the build if the current branch name does not match the pattern

#### Attributes

| Name    | Description             | Allowed | Default | Required |
| :------ | :---------------------- | :------ | :-----: | :------: |
| pattern | Name of branch to match |         |         |   yes    |
