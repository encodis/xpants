# git.xml

A set of macro definitions to use *git* commands within a build file. The basic
'git' macro is defined, along with others that set properties using the results
of certain *git* commands like "status" and "branch".

## Usage

Check the current *git* branch name matches the current version number::

```
<property name="version" value="v1.2"/>

<git-branch-name pattern="release/${version}">
```

## Dependencies

*  The *git* executable must be installed and available on the PATH.

## Properties

The following properties can be set on the command line to override the default behaviour:

*  *git.exe*  The name of the *git* executable


## Change Log

##### 2018-02-14 (PH) Initial version

    
# Macro Definitions

## git

Run git with command line arguments

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| command | git command to run |  |  | yes | 
| dir | Directory in which to run the git command |  | . | no | 
| property | Name of the property to store the result in |  |  | no | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| args | Remaining command line arguments | no | no | 

## git-branch

Create a property with the current branch name

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| property | Property containing the branch name |  |  | yes | 

## git-status

Create a property with current git status

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| property | Property containing the status |  |  | yes | 

## git-has-outstanding-commits

Fail the build if there are outstanding commits on the current branch


## git-check-repo

Fail the build if not in a git repository


## git-branch-matches

Fail the build if the current branch name does not match the pattern

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| pattern | Name of branch to match |  |  | yes | 
