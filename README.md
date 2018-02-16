# XPants

XPants is a set of ANT macros that can be used to help teams of developers create more robust and repeatable build processes. It has a focus on XML technologies but can be generally useful.


## TODO

XSLTs for:

linearize
minimize
remove-docs

extract-ant-docs
extract-xslt-docs
extract-sch-docs

svrl-to-html
text-to-svrl
svrl-filter


sch-insert-id
sch-remove-empty
sch-remove-disabled (combine in sch-filter with params? or keep separate?)

iso/schematron - with ${xpants.xslt.iso.dir}

should we have linearize-xml etc like minimize-xml.xml ???

should default install path be $ANT/lib or ~/.ant/lib ? So could just <include file="${user.home}/.ant/lib/xpants/xpants.xml" ?

investigate AntLib (see http://www.onjava.com/2006/08/09/ant-1-7-using-antlibs.html for example).
Not clear how to package (in Jar? with manifest?) or if you can use include, set default properties (this could be done in a macro itself, called by each other macro) and so on. Also would the XSLTs  be available from within the Jar? if only macros there are no classes so namespace in awkward. might have to make a xpants.xml using an XSLT to extract all the macrodef's. jar file could live in
.ant/lib

look at how antcontrib works... can have properties file in it etc. that might also be how you include files: <taskdef resource="com/encodis/xpants/git.xml"/>, but in this case git.xml might need to be structured as an antlib

So xpants.jar would contain com/encodis/xpants/antlib.xml that defined these things. then build file would do <project ... xmlns:xpants="antlib:com.encodis.xpants"> to include.

need to concat all macrodefs into one antlib file

look at ANT Unit

see also https://stackoverflow.com/questions/5159858/access-antlib-resources-from-within-apache-ant-macros

can't get properties file to load - may be set defaults in each macro that uses them.
may also have to load env property in any macro that needs it (only find-exe needs it?). load properties file from within macro?

if property is T/F then can set in macro, override on command line, but with say deploy.method can't use as default for macro call - just make the default 'copy'. for aws.profile make it blank so forced to choose one. temp.dir/delete set before call... so don't need properties file

