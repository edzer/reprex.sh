#!/bin/bash
R --no-restore --no-save -q < "${1:-/dev/stdin}" 2>&1 | sed 's/^[^+>]/# &/' | sed 's/^[+>] //'
