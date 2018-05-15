#!/bin/bash


svn checkout svn://svn.code.sf.net/p/bkunix/code/trunk bkunix-code
svn log -q | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > authors-transform.txt
git svn clone -r2:HEAD svn://svn.code.sf.net/p/bkunix/code --no-metadata --authors-file=authors-transform.txt --stdlayout /tmp/temp
