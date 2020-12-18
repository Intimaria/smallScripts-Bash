#!/usr/bin/env bash
# Determine if a sentence is a pangram. 
#    A pangram (Greek: παν γράμμα, pan gramma, "every letter") 
#    is a sentence using every letter of the alphabet at least once. 

if [[ ! "$@" =~ ^[a-zA-Z]* ]]
then
	echo "Usage: $( basename "$0" ) <string>" 
	exit 1
fi

# checks phrase (as lowercase) for every letter in range a-z
contains_alphabet () {
for i in {a..z}; do
	[[ "${1,,}" = *$i* ]] || return 1
done
return 0
}	

main () {
contains_alphabet "$@"
[[ $? -eq 0 ]] && echo "true" || echo "false"
}
main "$@"
exit 0
