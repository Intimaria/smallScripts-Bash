#!/usr/bin/env bash
# There are 10 types of people in the world: Those who understand binary, 
# and those who don't.
# You and your fellow cohort of those in the "know" when it comes to binary
# decide to come up with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.

# Given a decimal number, convert it to the appropriate sequence 
# of events for a secret handshake.

    if [[ $# -ne 1 ]] || [[ $1 =~ [a-zA-Z]+ ]] || [[ ! $1 =~ ^-?[0-9]+$ ]]
	then 
		echo "Usage: $( basename $0 ) <single integer>" 
		exit 1
	fi

	secret_code=('wink' 'double-blink' 'close-your-eyes' 'jump')
    ret=()
 

    main () {
		ret=""
		decimal="$1"
		binary=($( bc <<< "obase=2;$decimal" | rev ))
		for (( i = 0 ; i < "${#binary}" ; i++ )); do
		dig=${binary:$i:1}
		case $i in
			'0' | '1' | '2' | '3' )
			if [ $dig -eq 1 ]; then
				ret+="${secret_code[$i]} "
			fi
			;;
			'4' )
				ret=$(echo -n "${ret[@]}" | tac -s' ')
			;;
		esac
		done
		echo $(echo $ret | sed 's/ /,/g' | tr '-' ' ' )
        return 0
   }
   main "$@"
   exit 0