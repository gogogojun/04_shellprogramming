#!/bin/bash

Usage() {
    echo "Usage: $0 {-x} {-y}"
    exit 1
}

while getopts xy: options 2> /dev/null
do
    case $options in
        x) echo "X nom" ;;
        y) echo "Y nom + $OPTARG" ;;
        \?) Usage ;;
        *) Usage ;;
    esac
done


shift $(expr $OPTIND - 1)        # shift $(expr $OPTIND - 1)

 if [ $# -eq 0 ] ; then
 	Usage
 fi
 echo "$# : $*"
