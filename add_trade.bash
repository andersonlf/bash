#!/bin/bash

DIR=$1;
TRADE=/Users/anderson/homeoffice/projects/cabal/trade.txt;
TMP_JAVA_FILE=/tmp/tmp_java_file;

show_error() {
  echo "USAGE: "$0" DIRECTORY"
}

main() {
  DIR=$1
  for JAVA_FILE in `find $DIR -name "*.java"`; do {
    echo "Initializing process to file "$JAVA_FILE;
    cat $JAVA_FILE | grep "CABAL BRASIL PROPRIETARY/CONFIDENTIAL" > /dev/null;
    HAS_TRADE=$?;

    if [ $HAS_TRADE == 1 ] 
    then
      echo "Processing process to file "$JAVA_FILE;
      cat $TRADE $JAVA_FILE > $TMP_JAVA_FILE;
      cat $TMP_JAVA_FILE > $JAVA_FILE;
    fi;

  }; done;
}

if [ $# == 1 ]
then
  main $DIR;
else 
  show_error;
fi