# validate-with-rng.xml

A set of macro definitions to validate a file against a RelaxNG schema.

## Usage

```
<validate-with-rng
	file="my-file.xml"
	schema="my-schema.rng"/>
```

## Dependencies

### Stylesheets

None.

## Properties

None.

## External Libraries

jing.jar

## Change Log

##### 2018-02-19 (PH) Initial version

    
# Macro Definitions

## validate-with-rng

Validate a file according to a RelaxNG schema

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | no | 
| schema | Path for RNG file |  |  | no | 
| output | Path for report file(s) |  |  | yes | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | no | 

## validate-with-rng-file

Validate an individual RNG schema

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| file | Source XML file |  |  | no | 
| schema | RelaxNG schema file |  |  | yes | 
| output | Path for report file(s) |  |  | yes | 

## validate-with-rng-dir

Validate a folder of files agains a RelaxNG schema

#### Attributes

| name | description | allowed | default | required |
| :--- | :---------- | :------ | :-----: | :------: |
| schema | RelaxNG schema file |  |  | yes | 
| output | Path for report file(s) |  |  | yes | 
#### Elements

| name | description | implicit | required |
| :--- | :---------- | :------: | :------: |
| input.files | A fileset specification | yes | yes | 
