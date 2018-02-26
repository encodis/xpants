# python.xml

A set of macro definitions to work with *python* modules. The *python* macro is probably the most
generally useful, but three others have been included to help in the creation of installable
modules:

*   *python-update-version* looks in the designated script for a string similar to
"__version__ = '1.0'" and sets a property with that version number (e.g. *my_script.version.number).
It also updates the relevant field in the **setup.py** file with this number.
*   *python-build-distribution* runs the "sdist" command of the **setup.py** script to create a
distributable Zip file.
*   *python-install-module* unpacks a Zip file with the given module name and version and runs the
"install" command of the enclosed **setup.py** script.

> NOTE: "script" refers to a ".py" file (probably local to the build project) while "module"
refers to an installed module (as would be run with the "-m" option).

## Usage

To run a *python* module:

```
<python module="my_module">
	<args>
		<arg line="--input ${input.dir}"/>
		<arg line="--output ${output.dir}"/>
	</args>
<python>

```

## Dependencies

*   The *python* executable must be installed and available on the PATH.
*   A **setup.py** module must exist in the root of the project to use the distribution macros.

## Properties

The following properties can be set on the command line to override the default behaviour:

*  *python.exe*  The name of the *python* executable

The *python-update-version* macro will set a property with the version number. The name of the
property will be based on the script name given in the attribute:

*   *@{script}.version.number* For example, "my_module.version.number"

## Change Log

##### 2018-02-14 (PH) Initial version

    
# Macro Definitions

## python

Run a python module or script

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| module | Python module name |  |  | no | 
| script | Python script path |  |  | no | 
| dir | Directory to run module/script in |  | . | no | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| args | Remaining command line arguments | no | no | 

## python-update-version

Update the setup config with a version number taken from the source script

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| script | Python script name |  |  | yes | 

## python-build-distribution

Build a distribution for a python module


## python-install-module

Install a python module

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| module | Python module name |  |  | yes | 
| version | Python module version number |  |  | yes | 