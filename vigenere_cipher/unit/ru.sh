#!/bin/bash

BLACK=0
RED=1
GREEN=2
YELLOW=3
BLUE=4
MAGENTA=5
CYAN=6
WHITE=7

log() {
	tput setaf $1
	printf "$2\n"
}


strstr() {
  [ "${1#*$2*}" = "$1" ] && return 1
  return 0
}

PROGRAM=$1

if [ -x "$PROGRAM" ]; then
	log $GREEN "FILE OK"
else
	log $RED "FILE KO"
	exit 1
fi

testcase() {
	diff <(echo $1 | ./$PROGRAM) <(echo $2)
	if [ $? -eq 0 ]; then
		log $GREEN "OK"
	else
		log $RED "KO"
	fi
}

#	 INPUT VALUE | EXPECTED OUTPUT
testcase "???rrurdr?" "dddrrurdrd"
testcase "drdr??rrddd?" "drdruurrdddd"
testcase "???rrurdr?" "dddrrurdrd"
testcase "drdr??rrddd?" "drdruurrdddd"
testcase "drdr??rrddd?" "drdruurrdddd"
