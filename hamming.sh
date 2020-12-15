#!/usr/bin/env bash
# Calculate the Hamming Distance between two DNA strands.

# If we compare two strands of DNA and count the differences between them 
# we can see how many mistakes occurred. This is known as the "Hamming Distance".
# The Hamming distance is only defined for sequences of equal length.
# We read DNA using the letters C,A,G and T. Two strands might look like this:
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
#They have 7 differences, and therefore the Hamming Distance is 7.

# Must receive two strings
if [ $# -ne 2 ]; then
  echo "Usage: $( basename $0 ) <string1> <string2>" 
  exit 1
fi

# Check strings are of equal length
if [ ${#1} -ne ${#2} ]; then
       echo "left and right strands must be of equal length"
       exit 1
fi 

# Compares strings character by character to check differences
compare () {
strandone="$1"
strandtwo="$2"
i=0
count=0

# As strings are equal, length of one works as end-of-while condition
while [ $i -le ${#strandone} ]; do
  letterone=$(echo "${strandone:$i:1}")
  lettertwo=$(echo "${strandtwo:$i:1}")

  if [[ "$letterone" != "$lettertwo" ]]; then
        let count++
  fi
  let i++
done

echo $count
return 0
}

main () {

# Good idea to have variables get values from parameters
strandone="$1"
strandtwo="$2"


# Returns the number of differences between DNA strands
answer=$(compare "$strandone" "$strandtwo")

# STDOUT of Hamming Distance
echo "$answer"
return 0
}
main "$@"

exit 0