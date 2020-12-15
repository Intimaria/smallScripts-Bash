#!/usr/local/bin/bash
# Reverse a string

# test for input 
if [ $# -lt 1 ]; then
    echo "Usage: $( basename $0 ) <string>" 
		exit 1
fi

function print_backwards()
{
   rev <<< "$@"
   return 0
}

print_backwards "$@"
exit 0