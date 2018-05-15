#!/bin/bash

if [ $# -gt 0 ]; then
  while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
      -c|--commit)
      COMMIT="$2"
      shift # past argument
      shift # past value
      ;;
      -g|--git)
      GIT="$2"
      shift # past argument
      shift # past value
      ;;
      -s|--svn)
      SVN="$2"
      shift # past argument
      shift # past value
      ;;
      -t|--target)
      TARGET="$2"
      shift # past argument
      shift # past value
      ;;
    esac
  done
fi

svn checkout $SVN $TARGET
cd $TARGET
svn log -q | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > authors-transform.txt
git svn clone -r$COMMIT:HEAD $SVN --no-metadata --authors-file=authors-transform.txt --stdlayout $GIT
