# aws.xml

A set of macro definitions to use *aws* CLI commands within a build
file.

## Usage

Synchronise a folder with an S3 bucket:

    <aws-s3-sync
        profile="admin"
        source="${build.dir}/dist"
        bucket="http://my-site.com.s3-website-eu-west-1.amazonaws.com"
        target="app/main"/>

## Dependencies

  - The *aws* executable must be installed and available on the PATH.

## Properties

The following properties can be set on the command line to override the
default behaviour:

  - *aws.exe* The name of the *aws* executable

The following properties are used as default values and must be set
before the macros are used, or the values set in the macro calls
directly:

  - *aws.profile* All *aws* macros need the profile name to be used
  - *aws.bucket* Any S3 commands need the full bucket name. “Target”
    locations are relative to this root.

## Change Log

##### 2018-02-14 (PH) Initial version

# Macro Definitions

## aws

Run AWS with command line
arguments

#### Attributes

| Name       | Description                                 | Allowed |    Default     | Required |
| :--------- | :------------------------------------------ | :------ | :------------: | :------: |
| profile    | AWS profile                                 |         | ${aws.profile} |    no    |
| command    | AWS command to run                          |         |                |   yes    |
| subcommand | AWS sub-command to run                      |         |                |   yes    |
| dir        | Directory in which to run the AWS command   |         |       .        |    no    |
| property   | Name of the property to store the result in |         |                |    no    |

#### Elements

| Name | Description                      | Implicit | Required |
| :--- | :------------------------------- | :------: | :------: |
| args | Remaining command line arguments |    no    |    no    |

## aws-s3-sync

Synchronise a source folder with a target S3
bucket

#### Attributes

| Name    | Description                      | Allowed |    Default     | Required |
| :------ | :------------------------------- | :------ | :------------: | :------: |
| profile | AWS profile                      |         | ${aws.profile} |    no    |
| source  | Source folder                    |         |                |   yes    |
| target  | Target folder                    |         |                |   yes    |
| bucket  | Destination bucket               |         | ${aws.bucket}  |    no    |
| delete  | Delete unmatched files on target |         |      true      |    no    |
