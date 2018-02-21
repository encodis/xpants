# XML Practical ANT Scripts

XPantS is a set of ANT macros that can be used to help teams of developers create more robust and repeatable build processes. It has a focus on XML technologies but can be more generally useful.


## Installation

Simply copy the JAR file to a folder in ANT's classpath. Typically this will be **$ANT_HOME/lib** or **~/.ant/lib**.

Alternatively each of the macro files can be copied to a suitable folder (e.g. **/usr/local/lib/xpants**). Then individual files can be included as needed.


## Requirements

XPantS assumes that a number of additional libraries and/or applications are installed:

*   [ANT Contrib](https://sourceforge.net/projects/ant-contrib/files/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.zip/download). XPantS uses some tasks defined by ANT Contrib (particuarly the `<for>` and `<propertyregex>` tasks).

*   [Saxon XSLT and XQuery Processor](https://www.saxonica.com/products/products.xml). XPantS uses Saxon for XSLT processing. It's possible to not have Saxon installed, but any use of the `<apply-stylesheet>` macro will fail. XPantS should detect and use any installation of Saxon (HE, PE or EE).

    > NOTE: Ensure that the relevant Saxon JAR file is in ANT's classpath. Installing Saxon using [Homebrew](brew.sh) on MacOS will place it in a location like **/usr/local/Cellar/saxon/9.8.0.4/libexec/saxon9he.jar**. The simplest way to fix this is to set up a symbolic link: `$ ln -s /usr/local/Cellar/saxon/9.8.0.4/libexec/saxon9he.jar ~/.ant/lib`.

*   [XML Resolver](http://www.java2s.com/Code/Jar/x/Downloadxmlresolverjar.htm), installed in ANT's classpath. You may get warnings if the corresponding **XMLResolver.properties** file is missing, but these can generally be ignored.

*   One of the macros (`<convert-schema>`) requires [Trang](http://www.thaiopensource.com/relaxng/trang.html) to be installed.

*   A number of macros act as wrappers around command line applications, which obviously need to be installed to work. These include: [AWS Command Line Tools](https://aws.amazon.com/cli/), Git, [Pandoc](https://pandoc.org/), [Python](https://www.python.org/), [SSH](https://www.ssh.com/ssh/) and [Tidy](http://www.html-tidy.org/).

## Usage

To use the XPantS macros simply include the appropriate task definition at the top of your **build.xml** file, after including the ANT Contrib library. You must also include the "xmlns:if" and "xmlns:unless" declarations in the `<project>` tag.

```
<?xml version="1.0" encoding="UTF-8"?>

<project
    name="mybuild"
    xmlns:if="ant:if"
    xmlns:unless="ant:unless">

    <!-- load ant-contrib -->
    <taskdef resource="net/sf/antcontrib/antlib.xml"/>

    <!-- load xpants -->
    <taskdef resource="com/encodis/xpants/xpants.xml"/>

    ...
</project>
```

If you have used the alternative installation method (copying individual files to a folder) then you will have to include each macro that you need separately. For example:


```
<?xml version="1.0" encoding="UTF-8"?>

<project
    name="mybuild"
    xmlns:if="ant:if"
    xmlns:unless="ant:unless">

    <!-- load ant-contrib -->
    <taskdef resource="net/sf/antcontrib/antlib.xml"/>

    <!-- include macros/properties -->
    <property environment="env"/>

    <include file="/usr/local/lib/xpants/attr-checks.xml"/>
    <include file="/usr/local/lib/xpants/file-checks.xml"/>

    ...
</project>
```

Note that in this case, if one macro needs a macro in another file it will automatically include it.


## TODO

### XSLTs

convert-svrl-to-html

convert-log-to-svrl

filter-svrl

schematron-show-id

## Notes

### Antlib

See https://stackoverflow.com/questions/5159858/access-antlib-resources-from-within-apache-ant-macros for accessing XSLTs as a resource from the JAR file.

xpants.properties does not get loaded by <taskdef resource="..."/>. This also seems to happen to ANT Contrib itself. So set defaults in each macrodef that uses them---set attribute defaults directly, rather than going through a property (e.g. the <deploy-files> method attribute has a default of "copy" rather than "${deploy.method}" but that property is set, so can be overidden). Also, only load environment variables when needed (e.g. check-exe-exists).

See https://www.saxonica.com/html/documentation/using-xsl/embedding/jaxp-transformation.html for how to use different factories for the various Saxon installs, and how to decide at run time.


### AntUnit

Check this out for testing.


