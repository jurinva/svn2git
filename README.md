# svn2git


This script can help you move from svn to git repositories.

## Options

-c, --commit
        The number of the commit at which to start migration

-g, --git
        The git folder of the repository

-s, --svn
        SVN repository URL

-t, --target
        The svn folder of the repository

## Example
```bash
sv2git.sh -c 2 -s svn://svn.code.sf.net/p/sample/code/trunk -t bkunix-code -g sample
```