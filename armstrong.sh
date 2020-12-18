#!/usr/local/bin/bash 
# An Armstrong number is a number that is the sum of its own digits
# each raised to the power of the number of digits.

if [[ $# -ne 1 || "$1" =~ ^[a-zA-Z]+ ]]
then
	echo "Usage: $( basename "$0" ) <single integer>" 
	exit 1
fi
main () {
	# calculate sum of digits each raised to the number of digits
	num=0
	for (( i = 0; i < "${#1}"; ++i )); do
		num=$(("num"+"${1:$i:1}"**"${#1}")) 
	done
	# if input equals calculation result, it's an armstrong.
	[[ "$num" -eq "$1" ]] && echo "true" || echo "false"
}
main "$@"
exit 0
