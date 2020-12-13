#!/usr/bin/env bash
# Convert a phrase to its acronym.

# Help generate some jargon by writing a program 
# that converts a long name like Portable Network Graphics 
# to its acronym (PNG).

# Verify there is one parameter
if [[ $# -lt 1 ]]
then
    exit 1
fi

main () {
		
	# maker upper-case
	line="${1^^}"
	
	#remove non alphanums except dash & space
	line="${line//[^[:alnum:]- ]/}"
	
	# then replace dash with space:
	# necessary for phrases with no whitespace
	# or with consecutive delimiters
	line="${line//-/ }"

	# keep 1st char in each word
	for i in $line
	do
		acronym+="${i:0:1}"
	done 

	echo $acronym
	return 0 
}

main "$@"
exit 0