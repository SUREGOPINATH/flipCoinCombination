#!/bin/bash
echo "Welcome to flipCoinCombination"

##variable declaration
heads=0
tails=1
declare -A dictionary
dictionary[H]=0
dictionary[T]=0
dictionary[HH]=0
ditcionary[TT]=0
dictionary[HT]=0
dictionary[TH]=0
dictionary[HHH]=0
dictionary[HHT]=0
dictionary[HTH]=0
dictionary[HTT]=0
dictionary[THH]=0
dictionary[THT]=0
dictionary[TTH]=0
dictionary[TTT]=0

function tossChecker() {

	toss=$((RANDOM%2))
	echo $toss
}

function storeInDictionary() {

	dictionary[$1]=$((${dictionary[$1]}+1))
}

function percentage() {

	hPercentage=$((${dictionary[H]}*100 /5))
	tPercentage=$((${dictionary[T]}*100 /5))


	hhPercentage=$((${dictionary[HH]}*100 /5))
	htPercentage=$((${dictionary[HT]}*100 /5))
	thPercentage=$((${dictionary[TH]}*100 /5))
	ttPercentage=$((${dictionary[TT]}*100 /5))


	hhhPercentage=$((${dictionary[HHH]}*100 /5))
	hhtPercentage=$((${dictionary[HHT]}*100 /5))
	hthPercentage=$((${dictionary[HTH]}*100 /5))
	httPercentage=$((${dictionary[HTT]}*100 /5))

	thhPercentage=$((${dictionary[THH]}*100 /5))
	thtPercentage=$((${dictionary[THT]}*100 /5))
        tthPercentage=$((${dictionary[TTH]}*100 /5))
        tttPercentage=$((${dictionary[TTT]}*100 /5))


	echo "The Percentage of Heads is : "$hPercentage"%"
	echo "The Percentage of Tails is : "$tPercentage"%"


	echo "The Percentage of Heads Heads is : "$hhPercentage"%"
	echo "The Percentage of Heads Tails is : "$htPercentage"%"
	echo "The Percentage of Tails Heads is : "$thPercentage"%"
	echo "The Percentage of Tails Tails is : "$ttPercentage"%"

	echo "The Percentage of Heads Heads Heads is : "$hhhPercentage"%"
	echo "The Percentage of Heads Heads Tails is : "$hhtPercentage"%"
	echo "The Percentage of Heads Tails Heads is : "$hthPercentage"%"
	echo "The Percentage of Heads Tails Tails is : "$httPercentage"%"

	echo "The Percentage of Tails Heads Heads is : "$thhPercentage"%"
        echo "The Percentage of Tails Heads Tails is : "$thtPercentage"%"
        echo "The Percentage of Tails Tails Heads is : "$tthPercentage"%"
        echo "The Percentage of Tails Tails Tails is : "$tttPercentage"%"

}

function triplet() {

	count=0
        echo "The doublet tosses are : "
        while [ $count -lt 5 ]
        do
		toss=$(tossChecker)
		case $toss in
			0)
				toss=$(tossChecker)
 		                case $toss in

                	        0)
                        	        toss=$(tossChecker)
                                	case $toss in

                                        	0)
                                                	echo "Heads Heads Heads"
                                                	storeInDictionary HHH
                                                	;;
                                        	1)
                                                	echo "Heads Heads Tails"
	                                                storeInDictionary HHT
        	                                        ;;
                	                esac
                        	        ;;
                        	1)
                                	toss=$(tossChecker)
                               		case $toss in

                                        	0)
                                                	echo "Heads Tails Heads"
                                                	storeInDictionary HTH
                                                	;;
                                        	1)
                                                	echo "Heads Tails Tails"
                                                	storeInDictionary HTT
                                                	;;
                                	esac
                                	;;
				esac
				;;
			1)

				toss=$(tossChecker)
			        case $toss in

                        		0)
                                		toss=$(tossChecker)
		                                case $toss in

                	        	                0)
                        	        	                echo "Tails Heads Heads"
                                                		storeInDictionary THH
                                                		;;
                                        		1)
		                                                echo "Tails Heads Tails"
                		                                storeInDictionary THT
                                		                ;;
                                		esac
                                		;;
                        		1)
                                		toss=$(tossChecker)
		                                case $toss in

                		                        0)
                                		                echo "Tails Tails Heads"
                                                		storeInDictionary TTH
                                                		;;
                                        		1)
		                                                echo "Tails Tails Tails"
                		                                storeInDictionary TTT
                                		                ;;
                                		esac
                   			        ;;
				esac
				;;

                esac
		count=$(($count+1))
	done
}

function doublet() {

	count=0
	echo "The doublet tosses are : "
	while [ $count -lt 5 ]
	do
		toss=$(tossChecker)
		case $toss in

			0)
				toss=$(tossChecker)
				case $toss in

					0)
						echo "Heads Heads"
						storeInDictionary HH
						;;
					1)
						echo "Heads Tails"
						storeInDictionary HT
						;;
				esac
				;;
			1)
				toss=$(tossChecker)
				case $toss in

                                        0)
                                                echo "Tails Heads"
                                                storeInDictionary TH
                                                ;;
                                        1)
                                                echo "Tails Tails"
                                                storeInDictionary TT
                                                ;;
				esac
				;;
		esac
		count=$(($count+1))
	done

}

function singlet() {


	count=0
	echo "The singlet tosses are : "
	while [ $count -lt 5 ]
	do
		toss=$(tossChecker)
		case $toss in
			0)
				echo "heads"
				storeInDictionary H
				;;
			1)
				echo "tails"
				storeInDictionary T
				;;
		esac
		count=$(($count+1))
	done

}
function flipCoinCombination() {

	singlet;
	doublet;
	triplet
}

flipCoinCombination
percentage
echo ${!dictionary[@]}
echo ${dictionary[@]}
