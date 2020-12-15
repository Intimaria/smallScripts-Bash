#!/usr/bin/env bash

#A variation on FizzBuzz, a famous technical interview question that is intended to weed out 
#potential candidates. That question is itself derived from Fizz Buzz, a popular children's game 
#for teaching division. https://en.wikipedia.org/wiki/Fizz_buzz

#The rules of raindrops are that if a given number:
#   has 3 as a factor, add 'Pling' to the result.
#   has 5 as a factor, add 'Plang' to the result.
#   has 7 as a factor, add 'Plong' to the result.
#   does not have any of 3, 5, or 7 as a factor, the result should be the digits of the number.

raindrops () {

if [ "$#" -ne 1 ]; then
  echo "Usage: $( basename $0 ) <number>" 1>&2
  return 1
fi

phrase0=""

(( $1%3 == 0 )) && phrase0+="Pling";
(( $1%5 == 0 )) && phrase0+="Plang"
(( $1%7 == 0 )) && phrase0+="Plong"

echo ${phrase0:-$1}
return 0
}

raindrops "$@"
exit 0
