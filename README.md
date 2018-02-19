# XPants

XPants is a set of ANT macros that can be used to help teams of developers create more robust and repeatable build processes. It has a focus on XML technologies but can be more generally useful.


## Installation

Simply copy the JAR file to a folder in ANT's classpath. Typically this will be **$ANT_HOME/lib** or **~/.ant/lib**.

Alternatively each of the macro files can be copied to a suitable folder (e.g. **/usr/local/lib/xpants**). Then individual files can be included as needed.


## Requirements

XPants assumes that a number of additional libraries and/or applications are installed:

*   [ANT Contrib](https://sourceforge.net/projects/ant-contrib/files/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.zip/download). XPants uses some tasks defined by ANT Contrib (particuarly the `<for>` and `<propertyregex>` tasks).

*   [Saxon XSLT and XQuery Processor](https://www.saxonica.com/products/products.xml). XPants uses Saxon for XSLT processing. It's possible to not have Saxon installed, but any use of the `<apply-stylesheet>` macro will fail. XPants should detect and use any installation of Saxon (HE, PE or EE).

    > NOTE: Ensure that the relevant Saxon JAR file is in ANT's classpath. Installing Saxon using [Homebrew](brew.sh) on MacOS will place it in a location like **/usr/local/Cellar/saxon/9.8.0.4/libexec/saxon9he.jar**. The simplest way to fix this is to set up a symbolic link: `$ ln -s /usr/local/Cellar/saxon/9.8.0.4/libexec/saxon9he.jar ~/.ant/lib`.

*   XML Resolver

*   A number of macros act as wrappers around command line applications. Obviously these need to be installed to be used. These include: [AWS Command Line Tools](https://aws.amazon.com/cli/), Git, [Pandoc](https://pandoc.org/), [Python](https://www.python.org/), [SSH](https://www.ssh.com/ssh/) and [Tidy](http://www.html-tidy.org/) .

## Usage

To use the XPants macros simply include the appropriate task definition at the top of your **build.xml** file, after including the ANT Contrib library. You must also include the "xmlns:if" and "xmlns:unless" declarations in the `<project>` tag.

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

XSLTs for:

convert-svrl-to-html
convert-log-to-svrl
filter-svrl

schematron-show-id
schematron-remove-empty-rules


Macros:

validate-xml: pick RNG, DTD etc based on... what? declaration in file, type attribute? The loop over dir/file is the same, it's just what kind of validation at the file level.


investigate AntLib (see http://www.onjava.com/2006/08/09/ant-1-7-using-antlibs.html for example).
Not clear how to package (in Jar? with manifest?) or if you can use include, set default properties (this could be done in a macro itself, called by each other macro) and so on. Also would the XSLTs  be available from within the Jar? if only macros there are no classes so namespace in awkward. might have to make a xpants.xml using an XSLT to extract all the macrodef's. jar file could live in
.ant/lib

look at how antcontrib works... can have properties file in it etc. that might also be how you include files: <taskdef resource="com/encodis/xpants/git.xml"/>, but in this case git.xml might need to be structured as an antlib i.e. only macrodef

need to concat all macrodefs into one antlib file

look at ANT Unit

see also https://stackoverflow.com/questions/5159858/access-antlib-resources-from-within-apache-ant-macros

can't get properties file to load - maybe set defaults in each macro that uses them.
may also have to load env property in any macro that needs it (only find-exe needs it?). load properties file from within macro?

if property is T/F then can set in macro, override on command line, but with say deploy.method can't use as default for macro call - just make the default 'copy'. for aws.profile make it blank so forced to choose one. temp.dir/delete set before call... so don't need properties file

MUST have xmlresolver.jar from http://www.java2s.com/Code/Jar/x/Downloadxmlresolverjar.htm in ant/lib. Getting warnings about loading XMLResolver.properties

See https://www.saxonica.com/html/documentation/using-xsl/embedding/jaxp-transformation.html for using diff factories for diff Saxon installs. Also must work out how to identify the Saxon installed etc

https://gist.github.com/joewiz/f44a29c61ae23b16b478dfabe0fefbac

## XMLResolver.properties

```
########################################################################
# CatalogManager provides an interface to the catalog properties.
# Properties can come from two places: from system properties or
# from a CatalogManager.properties file. This class provides a
# transparent interface to both, with system properties preferred
# over property file values.

#######################################################################
# Catalog Files:
# The semicolon-delimited list of catalog files.
# Example: catalogs=/etc/xml/catalog;~/catalog.xml

catalogs=~/.ant/lib/catalog.xml

#######################################################################
# Relative Catalogs:
# If false, relative catalog URIs are made absolute with respect to the
# base URI of the CatalogManager.properties file. This setting only
# applies to catalog URIs obtained from the catalogs property in the
# CatalogManager.properties file
# Example: relative-catalogs = [yes|no]

relative-catalogs=yes

#######################################################################
# Verbosity:
# If non-zero, the Catalog classes will print informative and debugging
# messages. The higher the number, the more messages.
# Example: verbosity = [0..99]

verbosity=99

#######################################################################
# Prefer:
# Which identifier is preferred, "public" or "system"?
# Example: xml.catalog.prefer = [public|system]

prefer=public

#######################################################################
# Static-catalog:
# Should a single catalog be constructed for all parsing, or should a
# different catalog be created for each parser?
# Example: static-catalog = [yes|no]

static-catalog=yes

#######################################################################
# Allow-oasis-xml-catalog-pi
# If the source document contains "oasis-xml-catalog" processing
# instructions, should they be used?
# Example: allow-oasis-xml-catalog-pi = [yes|no]

allow-oasis-xml-catalog-pi=yes

#######################################################################
# catalog-class-name
# If you're using the convenience classes
# org.apache.xml.resolver.tools.*, this setting allows you to specify
# an alternate class name to use for the underlying catalog.
# Example: catalog-class-name=org.apache.xml.resolver.Resolver
```


