#!/bin/bash

help() {
  echo -e "\tsvn2git.sh [-s|--svn svn url] [-g|--git git folder] [-c|--commit commit] [-t|--target svn folder]\n\tsvn2git.sh [-h|--help|-v|--version]"
  echo "Example: sv2git.sh -c 2 -s svn://svn.code.sf.net/p/sample/code/trunk -t sample-code -g sample"
  exit
}

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
      -h|--help)
      help
      ;;
    esac
  done
fi

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-continue? [Y/n]} " response
    case "$response" in
        [nN])
            false
            ;;
        *)
            true
            ;;
    esac
}



svn checkout $SVN $TARGET
cd $TARGET
svn log -q | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > authors-transform.txt
nano ./authors-transform.txt
rm -rf $GIT
if [ ! -z $COMMIT ]; then COMMITOPTN="-r$COMMIT:HEAD"; fi
confirm && git svn clone $COMMITOPTN $SVN --no-metadata --authors-file=authors-transform.txt --stdlayout $GIT

