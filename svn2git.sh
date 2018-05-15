#!/bin/bash

if [ $# -gt 0 ]; then
  while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
      -s|--site)
      SITE="$2"
      shift # past argument
      shift # past value
      ;;
      -m|--mode)
      MODE="$2"
      shift # past argument
      shift # past value
      ;;
      -n|--notify)
      NOTIFY="$2"
      shift # past argument
      shift # past value
      ;;
      -t|--messenger)
      MESSENGER="$2"
      shift # past argument
      shift # past value
      ;;
      -p|--proxy)
      PROXY="$2"
      shift # past argument
      shift # past value
      ;;
      --tapi)
      TELEGRAM_APITOKEN="$2"
      shift # past argument
      shift # past value
      ;;
      --tid)
      TELEGRAM_CHATID="$2"
      shift # past argument
      shift # past value
      ;;
#      *)    # unknown option
#      POSITIONAL+=("$1") # save it in an array for later
#      shift # past argument
#      ;;
    esac
  done
fi

svn checkout svn://svn.code.sf.net/p/bkunix/code/trunk bkunix-code
svn log -q | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > authors-transform.txt
git svn clone -r2:HEAD svn://svn.code.sf.net/p/bkunix/code --no-metadata --authors-file=authors-transform.txt --stdlayout /tmp/temp
