# XML Practical ANT Scripts

XPantS is a set of ANT macros that can be used to help teams of developers create more robust and repeatable build processes. It has a focus on XML technologies but can be more generally useful.

Full instructions can be found [here][docs/index.md]. Brief instructions are given below.

## Installation

Simply copy the latest JAR file in the **dist** folder to a folder in ANT's classpath. Typically this will be **$ANT_HOME/lib** or **~/.ant/lib**.


## Requirements

XPantS assumes that a number of additional libraries and/or applications are installed:

*   [ANT Contrib](https://sourceforge.net/projects/ant-contrib/files/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.zip/download).

*   [Saxon XSLT and XQuery Processor](https://www.saxonica.com/products/products.xml) (not required, but recommended).

*   [XML Resolver](http://www.java2s.com/Code/Jar/x/Downloadxmlresolverjar.htm).

*   A number of macros act as wrappers around command line applications, which obviously need to be installed to work.


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

## TODO

- [ ] See if we can build the readme by extracting from build.xml or docs/index.md

- [ ] Any more stylesheets needed?


## Notes

### Antlib

See https://stackoverflow.com/questions/5159858/access-antlib-resources-from-within-apache-ant-macros for accessing XSLTs as a resource from the JAR file.

A properties file within the JAR will not get loaded by <taskdef resource="..."/>. This also seems to happen to ANT Contrib itself. So default (global) properties are set in each macrodef that uses them. Attribute defaults are also set directly, rather than indirectly through a property (e.g. the <deploy-files> "method" attribute has a default value of "copy" rather than "${deploy.method}" but that property is still set in the body of the macro, so it can be overidden). Macros also load
environment variables when needed, using the prefix "env".

### Saxon

See https://www.saxonica.com/html/documentation/using-xsl/embedding/jaxp-transformation.html for how to use different factories for the various Saxon installs, and how to decide at run time.

