#!/bin/bash
echo "Welcome to flipCoinCombination"

declare -A dictionary
dictionary[H]=0
dictionary[T]=0

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
	echo "The Percentage of Heads is : "$hPercentage"%"
	echo "The Percentage of Tails is : "$tPercentage"%"
}
function flipCoinCombination() {

	heads=0
	tails=1
	count=0
	echo "The tosses are : "
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
	percentage 
}
flipCoinCombination
echo ${!dictionary[@]}
echo ${dictionary[@]}
