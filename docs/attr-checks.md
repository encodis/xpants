# attr-checks.xml

A set of utility macros to check the status of attributes used in
macros.

## Usage

    <check-attr-set macro="apply-transform" name="file" value="@{file}"/>

    <check-attr-list
        macro="apply-transform"
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

# Macro Definitions

## check-attr-set

Fail the build if the specified attribute is blank

#### Attributes

| Name  | Description        | Allowed | Default | Required |
| :---- | :----------------- | :------ | :-----: | :------: |
| macro | Calling macro name |         |         |   yes    |
| name  | Attribute name     |         |         |   yes    |
| value | Attribute value    |         |         |   yes    |

## check-attr-bool

Fail the build if the specified attribute is not a boolean value

#### Attributes

| Name  | Description        | Allowed | Default | Required |
| :---- | :----------------- | :------ | :-----: | :------: |
| macro | Calling macro name |         |         |   yes    |
| name  | Attribute name     |         |         |   yes    |
| value | Attribute value    |         |         |   yes    |

## check-attr-list

Fail the build if the specified attribute is not one of a list of values

#### Attributes

| Name  | Description            | Allowed | Default | Required |
| :---- | :--------------------- | :------ | :-----: | :------: |
| macro | Calling macro name     |         |         |   yes    |
| name  | Attribute name         |         |         |   yes    |
| value | Attribute value        |         |         |   yes    |
| list  | List of allowed values |         |         |   yes    |
