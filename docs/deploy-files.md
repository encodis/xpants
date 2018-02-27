# deploy-files.xml

A set of macro definitions to deploy sets of files to a designated
location. The first macro (‘deploy-file’) simply copies a file to a
target folder, unless the file already exists there. The macro can be
told to overwrite the file if necessary.

The second macro (‘deploy-files’) does the same but for either an
implicit fileset or a source folder. This macro can also delete the
target folder first (*clean=target*) and remove the directory structure
of the source files (*flatten=true*).

The *method* attribute can be explicitly set to the following values:

  - ‘copy’ This is the default, and uses the native ANT ‘copy’ task.
    This presupposes that the *target* is reachable on the local machine
    or suitable network share etc.
  - ‘sync’ This uses the native ANT ‘sync’ task. This presupposes that
    the *target* is reachable on the local machine or suitable network
    share etc. This may help with performance in some cases ( e.g. a
    target needs updating but not many files have changed). The
    *flatten* and *clean* options are ignored.
  - ‘scp’ This use the SSH secure copy program. In this case the
    properties *ssh.host*, *ssh.user* and *ssh.keys* must also be set as
    described in the [ssh](ssh.html) macro before calling *deploy-files*
    with this method. Also in this case the *target* attribute should
    start with the root location on the host (e.g. “/www” for a web
    server). The *clean* option can be set to clean the *target* folder.
  - ‘aws’ This uses the AWS CLI program to synchronise to an S3 bucket.
    The properties *aws.profile* and *aws.bucket* must also be set as
    described in the [aws](aws.html) macro before calling *deploy-files*
    with this method. The *flatten*, *clean* and *overwrite* options are
    ignored.

## Usage

    <property name="deploy.target" value="${project.deploy.area}/${project.name}"/>
    
    <deploy-files
        target="${deploy.target}/docs">
        <fileset>
            <include name="build/*.html"/>
        </fileset>
    </deploy-files>

Deploy different filesets for ‘latest’ and ‘versioned’ files:

    <deploy-files
        target="\\myfile.share\${department}\${assets}">
        <fileset>
            <fileset dir="." includes="build/*.dat"/>
        </fileset>
    </deploy-files>
    
    <deploy-files
        target="\\myfile.share\${department}\${assets}\v1.2">
        <fileset dir=".">
            <include name="build/*.dat"/>
            <include name="docs/*.html"/>
        </fileset>
    </deploy-files>

## Dependencies

  - ${xpants.dir}/aws.xml
  - ${xpants.dir}/ssh.xml
  - ${xpants.dir}/attr-checks.xml
  - ${xpants.dir}/file-checks.xml

## Properties

Override the following property to force a deployment method:

  - *deploy.method* The default is ‘copy’. Alternatives are ‘sync’,
    ‘ssh’ and ‘aws’.

The following properties are required when using the ‘scp’ method:

  - *ssh.host*
  - *ssh.user*
  - *ssh.keys*

The following properties are required when using the ‘aws’ method:

  - *aws.profile*
  - *aws.bucket*

## Change Log

##### 2018-02-15 (PH) Initial version

# Macro Definitions

## deploy-file

Deploy a file to a designated target
folder

#### Attributes

| Name      | Description                            | Allowed     | Default | Required |
| :-------- | :------------------------------------- | :---------- | :-----: | :------: |
| file      | File to deploy                         |             |         |   yes    |
| target    | Destination folder for deployment      |             |         |   yes    |
| overwrite | Overwrite the target file if it exists | true, false |  false  |    no    |

## deploy-files

Deploy a set of files to a location designated by the deployment
environment and
target

#### Attributes

| Name      | Description                                            | Allowed              | Default | Required |
| :-------- | :----------------------------------------------------- | :------------------- | :-----: | :------: |
| target    | Root destination folder for deployment                 |                      |         |   yes    |
| source    | Directory to deploy, if fileset not specified          |                      |         |    no    |
| flatten   | Flatten the input fileset directory structure          | true, false          |  false  |    no    |
| clean     | Remove target directory before deploying               | target, files, none  |  none   |    no    |
| overwrite | Overwrite the target directory if it exists            | true, false          |  false  |    no    |
| method    | Method to use to copy the fileset to the target folder | copy, sync, scp, aws |  copy   |    no    |

#### Elements

| Name         | Description             | Implicit | Required |
| :----------- | :---------------------- | :------: | :------: |
| deploy.files | A fileset specification |   yes    |    no    |

## deploy-files-copy

Deploy a set of files to a target location folder, using ant
copy

#### Attributes

| Name      | Description                                    | Allowed             | Default | Required |
| :-------- | :--------------------------------------------- | :------------------ | :-----: | :------: |
| target    | Root destination folder for deployment         |                     |         |   yes    |
| source    | Directory to deploy, if fileset not specified  |                     |         |    no    |
| flatten   | Flatten the input fileset directory structure  | true, false         |  false  |    no    |
| clean     | Remove target directory/files before deploying | target, files, none |  false  |    no    |
| overwrite | Overwrite the target directory if it exists    | true, false         |  false  |    no    |

#### Elements

| Name         | Description             | Implicit | Required |
| :----------- | :---------------------- | :------: | :------: |
| deploy.files | A fileset specification |   yes    |    no    |

## deploy-files-sync

Deploy a set of files to a target location, using ant
sync

#### Attributes

| Name      | Description                                   | Allowed     | Default | Required |
| :-------- | :-------------------------------------------- | :---------- | :-----: | :------: |
| target    | Root destination folder for deployment        |             |         |   yes    |
| source    | Directory to deploy, if fileset not specified |             |         |    no    |
| overwrite | Overwrite the target directory if it exists   | true, false |  false  |    no    |

#### Elements

| Name         | Description             | Implicit | Required |
| :----------- | :---------------------- | :------: | :------: |
| deploy.files | A fileset specification |   yes    |    no    |

## deploy-files-scp

Deploy a set of files to a target location, using
scp

#### Attributes

| Name   | Description                                    | Allowed             | Default | Required |
| :----- | :--------------------------------------------- | :------------------ | :-----: | :------: |
| target | Root destination folder for deployment         |                     |         |   yes    |
| source | Directory to deploy, if fileset not specified  |                     |         |    no    |
| clean  | Remove target directory/files before deploying | target, files, none |  false  |    no    |

#### Elements

| Name         | Description             | Implicit | Required |
| :----------- | :---------------------- | :------: | :------: |
| deploy.files | A fileset specification |   yes    |    no    |

## deploy-files-aws

Deploy a set of files to a target location, using
awscli

#### Attributes

| Name   | Description                                   | Allowed | Default | Required |
| :----- | :-------------------------------------------- | :------ | :-----: | :------: |
| target | Root destination folder for deployment        |         |         |   yes    |
| source | Directory to deploy, if fileset not specified |         |         |    no    |

#### Elements

| Name         | Description             | Implicit | Required |
| :----------- | :---------------------- | :------: | :------: |
| deploy.files | A fileset specification |   yes    |    no    |
