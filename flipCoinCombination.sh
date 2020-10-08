#!/bin/bash -x
echo "Welcome to flipCoinCombination"

function tossChecker() {

	toss=$((RANDOM%2))
	echo $toss
}

function flipCoinCombination() {

	heads=0
	tails=1
	toss=$(tossChecker)
	case $toss in
		0)
			echo "heads"
			;;
		1)
			echo "tails"
			;;
	esac
}
flipCoinCombination
