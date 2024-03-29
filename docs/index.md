# XML Practical ANT Scripts

XML - Practical ANT Scripts (or "XPantS" for short) is a set of ANT macros that can be used to help teams of developers create more robust and repeatable build processes. It has a focus on XML technologies but can be more generally useful to build, for example, HTML documents from Markdown
sources and so on.

## Installation

Simply copy the latest JAR file in the **dist** folder to a folder in ANT's classpath. Typically this will be **$ANT_HOME/lib** or **~/.ant/lib**.

Alternatively each of the macro files in the **src** folder can be copied to a suitable folder on the target machine (e.g. **/usr/local/lib/xpants**). Then individual files can be included as needed in a build file.

## Requirements

XPantS assumes that a number of additional libraries and/or applications are installed:

*   [ANT Contrib](https://sourceforge.net/projects/ant-contrib/files/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.zip/download). XPantS uses some tasks defined by ANT Contrib (particularly the `<for>` and `<propertyregex>` tasks).

*   Although it is not required the [Saxon XSLT and XQuery Processor](https://www.saxonica.com/products/products.xml) is recommended. XPantS will use Saxon for XSLT processing if it can, otherwise it will default to Xalan.

    > NOTE: Ensure that the relevant Saxon JAR file is in ANT's classpath (e.g. in **$ANT_HOME/lib** or **~/.ant/lib**). Installing Saxon using [Homebrew](brew.sh) on MacOS will place it in a location like **/usr/local/Cellar/saxon/11.3/libexec/saxon9he.jar**. The simplest way to fix this is to set up a symbolic link:
    >
    `$ ln -s /usr/local/Cellar/saxon/11.3/libexec/saxon9he.jar ~/.ant/lib`.
    >
    > Note that if Homebrew updates Saxon you will need to recreate the link.
    
*   [XML Resolver](https://xmlresolver.org), installed in ANT's classpath (or **~/.ant/lib**).

*   The *convert-schema* macros use the [Trang](http://www.thaiopensource.com/relaxng/trang.html) converter, which should be installed in the ANT classpath (e.g. in **$ANT_HOME/lib** or **~/.ant/lib**).

*   The *validate-with-schematron* macro uses the [Jing](http://www.thaiopensource.com/relaxng/jing.html) validator, which should be installed in the ANT classpath (e.g. in **$ANT_HOME/lib** or **~/.ant/lib**).

*   A number of macros act as wrappers around command line applications, which obviously need to be installed to work. These include: [AWS Command Line Tools](https://aws.amazon.com/cli/), [Git](https://github.com/git/git), [Pandoc](https://pandoc.org/), [Python](https://www.python.org/), [SSH](https://www.ssh.com/ssh/) and [Tidy](http://www.html-tidy.org/).

## Usage

To use the XPantS macros simply include the appropriate task definition at the top of your **build.xml** file, *after* including the ANT Contrib library. You must also include the "xmlns:if" and "xmlns:unless" declarations in the `<project>` tag.

```
<?xml version="1.0" encoding="UTF-8"?>

<project
    name="myproject"
    xmlns:if="ant:if"
    xmlns:unless="ant:unless">

    <!-- load ant-contrib -->
    <taskdef resource="net/sf/antcontrib/antlib.xml"/>

    <!-- load xpants -->
    <taskdef resource="com/encodis/xpants/antlib.xml"/>

    ...
</project>
```

If you have used the alternative installation method (copying individual files to a folder) then you will have to include each macro that you need separately. For example:


```
<?xml version="1.0" encoding="UTF-8"?>

<project
    name="myproject"
    xmlns:if="ant:if"
    xmlns:unless="ant:unless">

    <!-- load ant-contrib -->
    <taskdef resource="net/sf/antcontrib/antlib.xml"/>

    <!-- include macros/properties -->
    <property environment="env"/>

    <include file="/usr/local/lib/xpants/file-checks.xml"/>

    ...
</project>
```

Note that in this case, if one macro needs a macro in another file it will automatically include it.


## Macro Definitions

[apply-transform](apply-transform.md)

[aws](aws.md)

[compare-files](compare-files.md)

[compile-schematron](compile-schematron.md)

[content-utils](content-utils.md)

[convert-schema](convert-schema.md)

[deploy-files](deploy-files.md)

[extract-markdown](extract-markdown.md)

[file-utils](file-utils.md)

[git](git.md)

[pandoc](pandoc.md)

[python](python.md)

[ssh](ssh.md)

[tidy](tidy.md)

[validate-instance](validate-instance.md)

[version-number](version-number.md)

[xspec](xspec.md)


## XSLT Stylesheets

[extract-macrodef-from-ant](extract-macrodef-from-ant.md)

[extract-markdown-from-ant](extract-markdown-from-ant.md)

[extract-markdown-from-sch](extract-markdown-from-sch.md)

[extract-markdown-from-xsl](extract-markdown-from-xsl.md)

[identity](identity.md)

[remove-comments](remove-comments.md)

[remove-docs](remove-docs.md)

[remove-newlines](remove-newlines.md)

[remove-processing-instructions](remove-processing-instructions.md)

[schematron-remove-empty-rules](schematron-remove-empty-rules.md)
