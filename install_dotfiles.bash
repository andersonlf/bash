#!/bin/bash

##
# install symbolics links
#
install() {
  USER=$1;
  DIR=$2;
  for a in `ls $PWD/$DIR`; do {
    rm -f /home/$USER/.$a;
    ln -s $PWD/$DIR/$a /home/$USER/.$a;
  } done;
}

show_help() {
  echo "usage: install user [work|home]";
}

##
# main
#
if [ $# -eq 2 ]; then
  install $1 $2;
  exit 0;
else
  show_help;
  exit 1;
fi
