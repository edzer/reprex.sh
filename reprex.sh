#!/bin/bash
while getopts ":h" option; do
   case $option in
      h) # display Help
         echo "Usage: $0 file.R"
		 shift;;
   esac
done
R --no-restore --no-save -q < "${1:-/dev/stdin}" 2>&1 | sed 's/^[^+>]/# &/' | sed 's/^[+>] //'
