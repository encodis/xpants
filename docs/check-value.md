# check-value.xml

A set of utility macros to check values of properties (or macro
attribute
    values).

## Usage

    <check-value-set prefix="[apply-transform]" name="file" value="@{file}"/>

    <check-value-list
        macro="[apply-transform]"
        name="options"
        value="@{options}"
        list="alpha,bravo,charlie"/>

## Dependencies

None

## Properties

These macros use the following properties:

  - *xpants.debug* Output additional information for debugging

## Change Log

##### 2017-12-05 (Initial version) (PH)

##### 2018-05-02 Generalised to values rather than attributes (PH)

# Macro Definitions

## check-value-set

Fail the build if the specified value is not set or is blank

#### Attributes

| Name   | Description    | Allowed | Default | Required |
| :----- | :------------- | :------ | :-----: | :------: |
| prefix | Message prefix |         |         |    no    |
| name   | Value name     |         |         |   yes    |
| value  | Value          |         |         |   yes    |

## check-value-bool

Fail the build if the specified value is not a boolean value

#### Attributes

| Name   | Description    | Allowed | Default | Required |
| :----- | :------------- | :------ | :-----: | :------: |
| prefix | Message prefix |         |         |    no    |
| name   | Value name     |         |         |   yes    |
| value  | Value          |         |         |   yes    |

## check-value-list

Fail the build if the specified value is not one of a list of values

#### Attributes

| Name   | Description            | Allowed | Default | Required |
| :----- | :--------------------- | :------ | :-----: | :------: |
| prefix | Message prefix         |         |         |    no    |
| name   | Value name             |         |         |   yes    |
| value  | Value                  |         |         |   yes    |
| list   | List of allowed values |         |         |   yes    |
