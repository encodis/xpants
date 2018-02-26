# file-checks.xml

A set of utility macros to peform various checks on files and directories:

*   *check-file-exists* fails the build if the specified file does not exist
*   *check-dir-exists* fails the build if the specified directory does not exist
*   *check-fileset-empty* fails the build if the specified file set evaluates to an empty list of
files
*   *check-class-path* fails the build if the specified class does not exist in the ANT classpath
*   *check-file-contains* sets the given property to "true" if a file contains a particular string;
if the property is not supplied then the build will fail if the file does not contain the string
*   *check-exe-exists* checks that the specified executable is available on the path, sets a
property with the name of the executable and fails the build if it cannot find it.This is typically
used for build files that might be used on both Windows and Unix that use the <exec> or
<apply> tasks. The simplest usage is to just supply the name of a property that will be set
to the executable name. If this is of the form "app.exe" then the macro will assume that the
executable is called "app" in Unix and "app.exe" in Windows. This can be overridden using the
*unix* and *windows* attributes. For example, setting the *windows* attribute to "my-app.exe" would
search for that in the path.

## Usage

```
<check-file-exists macro="apply-stylesheet" file="result.dat"/>

<check-fileset-empty macro="apply-stylesheet">
    <fileset dir="../build" includes="**/*.dat"/>
</check-fileset-empty>
```

This build file fragment ensures that the correct name for the "git" executable is passed
to the <exec> task. This would be *git* in Unix/MacOS and *git.exe* in Windows.

```
<check-exe-exists property="git.exe"/>

<exec
	executable="${git.exe}"
	dir="."
	outputproperty="${status}">
	<arg value="status"/>
</exec>
```

This fragment finds the executable name for the "Pandoc" program. The normal Windows name is
"pandoc.exe" but as this is sometimes caught by AV software on Window this has been changed to
"pan-doc.exe":

```
<check-exe-exists property="pandoc.exe" windows="pan-doc.exe"/>
```

## Dependencies

None


## Properties

These macros create the following (global) properties:

*  *xpants.dir*


## Change Log

##### 2018-02-14 (PH) Initial version

    
# Macro Definitions

## check-file-exists

Fail the build if the specified file does not exist

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| macro | Calling macro name |  |  | yes | 
| file | File to check for availability |  |  | yes | 

## check-dir-exists

Fail the build if the specified directory does not exist

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| macro | Calling macro name |  |  | yes | 
| dir | Directory to check for availability |  |  | yes | 

## check-fileset-empty

Fail the build if the specified fileset is empty

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| macro | Calling macro name |  |  | yes | 
| refid | Reference to fileset specification to check |  |  | no | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | Fileset specification to check | yes | no | 

## check-class-path

Fail the build if the class is not in the classpath

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| macro | Calling macro name |  |  | yes | 
| class | Class to check |  |  | yes | 
| property | Property to update with result |  |  | no | 

## check-file-contains

Set a property if a file contains a string

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | File to examine |  |  | yes | 
| string | String to check |  |  | yes | 
| property | Property to update with result |  |  | no | 

## check-exe-exists

Fail the build if the executable is not on the path

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| property | Property to set with the executable name |  |  | yes | 
| windows | Name of the Windows executable (if different from 'property') |  |  | no | 
| unix | Name of the Unix executable (if different from 'property') |  |  | no | 
