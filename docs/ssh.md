# ssh.xml

A set of macro definitions to use *ssh* to commands on an external
machine within a build file. The basic ‘ssh’ macro is defined that runs
an arbitrary command, along with some useful wrapper macros.

Note that ANT defines an ‘scp’ task but this requires external libraries
to actually work. Hence the macro ‘ssh-copy’ that actually executes the
local *scp* binary.

## Usage

Copy files to an SSH host:

    <ssh-copy
        user="user1"
        host="devops-main"
        keys="~/.ant/lib/devops-main.pem"
        target="/www/${deploy.target}"
        source="${build.dir}/dist"/>

## Dependencies

  - The *ssh* executable must be installed and available on the PATH.
  - The *scp* executable must be installed and available on the PATH.

## Properties

The following properties can be set on the command line to override the
default behaviour:

  - *ssh.exe* The name of the *ssh* executable
  - *scp.exe* The name of the *scp* executable

The following properties are used as default values and must be set
before the macros are used, or the values set in the macro calls
directly:

  - *ssh.host* The DNS name of the SSH server to connect to
  - *ssh.user* The user on the SSH host to connect as
  - *ssh.keys* The key file (usually a .PEM file) to authorise the
    connection

## Change Log

##### 2018-02-14 (PH) Initial version

# Macro Definitions

## ssh

Run ssh with command line
arguments

#### Attributes

| Name     | Description                                     | Allowed |   Default   | Required |
| :------- | :---------------------------------------------- | :------ | :---------: | :------: |
| user     | User name on remote host                        |         | ${ssh.user} |    no    |
| host     | Domain name of host                             |         | ${ssh.host} |    no    |
| keys     | Key file (e.g. PEM) to authenticate             |         | ${ssh.keys} |    no    |
| command  | Command to run on host                          |         |             |   yes    |
| property | Name of the property to store output of command |         |             |    no    |

#### Elements

| Name | Description                          | Implicit | Required |
| :--- | :----------------------------------- | :------: | :------: |
| args | Remaining ssh command line arguments |    no    |    no    |

## ssh-copy

Copy files using the scp
command

#### Attributes

| Name   | Description                         | Allowed |   Default   | Required |
| :----- | :---------------------------------- | :------ | :---------: | :------: |
| user   | User name on remote host            |         | ${ssh.user} |    no    |
| host   | Domain name of host                 |         | ${ssh.host} |    no    |
| keys   | Key file (e.g. PEM) to authenticate |         | ${ssh.keys} |    no    |
| source | Source directory to copy            |         |             |   yes    |
| target | Target directory on host            |         |             |   yes    |

## ssh-chmod

Use ssh to change file permissions on the
host

#### Attributes

| Name | Description                         | Allowed |   Default   | Required |
| :--- | :---------------------------------- | :------ | :---------: | :------: |
| user | User name on remote host            |         | ${ssh.user} |    no    |
| host | Domain name of host                 |         | ${ssh.host} |    no    |
| keys | Key file (e.g. PEM) to authenticate |         | ${ssh.keys} |    no    |
| mode | Permissions to be set (Unix style)  |         |    0777     |    no    |
| dir  | Directory on host to be removed     |         |             |   yes    |

## ssh-mkdir

Use ssh to make a directory on the
host

#### Attributes

| Name | Description                         | Allowed |   Default   | Required |
| :--- | :---------------------------------- | :------ | :---------: | :------: |
| user | User name on remote host            |         | ${ssh.user} |    no    |
| host | Domain name of host                 |         | ${ssh.host} |    no    |
| keys | Key file (e.g. PEM) to authenticate |         | ${ssh.keys} |    no    |
| mode | Permissions to be set (Unix style)  |         | ${ssh.mode} |    no    |
| dir  | Directory on host to be created     |         |             |   yes    |

## ssh-delete

Use ssh to remove a directory or files on the
host

#### Attributes

| Name      | Description                             | Allowed     |   Default   | Required |
| :-------- | :-------------------------------------- | :---------- | :---------: | :------: |
| user      | User name on remote host                |             | ${ssh.user} |    no    |
| host      | Domain name of host                     |             | ${ssh.host} |    no    |
| keys      | Key file (e.g. PEM) to authenticate     |             | ${ssh.keys} |    no    |
| dir       | Directory or path on host to be removed |             |             |   yes    |
| recursive | Recursively delete directories          | true, false |    true     |    no    |
