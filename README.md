svn2git
=======

**svn2git** - svn to git repositories migration tool.

SYNOPSIS
========

**svn2git.sh** \[**-s**|**--svn** svn url] \[**-g**|**--git** git folder] \[**-c**|**--commit** commit] \[**-t**|**--target** svn folder]
**svn2git.sh** \[**-h**|**--help**|**-v**|**--version**]

DESCRIPTION
===========

Utility to migrate svn repository to git.

Options
-------

-c, --commit  
:    The number of the commit at which to start migration

-g, --git  
:    The git folder of the repository

-s, --svn  
:    SVN repository URL

-t, --target  
:    The svn local folder of the repository

BUGS
====

See GitHub Issues: <https://github.com/jurinva/svn2git/issues>

EXAMPLE
=======
```bash
sv2git.sh -c 2 -s svn://svn.code.sf.net/p/sample/code/trunk -t sample-code -g sample
```

AUTHOR
======

Vladimir Yurin <jurinva@gmail.com>
