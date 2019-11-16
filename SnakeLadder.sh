#!/bin/bash -x

echo "Welcome to Snake Ladder Game"

#Constant Vabiables
INITIAL_POSITION=0
WON_POSITION=100
NO_CHANGE=0
SNAKE=1
LADDER=2

numberOfDiceRolled=0
position=0
chance=0

declare -a playerOneCounter
declare -a playerTwoCounter

playerOne=$INITIAL_POSITION
playerTwo=$INITIAL_POSITION

function playGame()
{

	steps=$((RANDOM%6+1))
	numberOfDiceRolled=$(($numberOfDiceRolled+1))
	snakeLadder=$((RANDOM%3))
	case $snakeLadder in
	$NO_PLAY)
		position=$position
		chance=$(($chance+1));;
	$LADDER)
		position=$(( $position + $steps ));;
	$SNAKE)
		position=$(( $position - $steps ))
		chance=$(($chance+1));;
	esac
	checkReachedWin $steps $position

}

function checkReachedWin()
{
	if [ $2 -le $INITIAL_POSITION ]
	then
		position=$INITIAL_POSITION
	elif [ $2 -eq $WON_POSITION ]
	then
		position=$WON_POSITION
	elif [ $2 -gt $WON_POSITION ]
	then
		position=$(( $2 - $1 ))
	fi
}

#main Porgram starts

while [ $playerOne -lt $WON_POSITION ] && [ $playerTwo -lt $WON_POSITION ]
do
	if [ $(($chance%2)) -eq 0 ]
	then
		position=$playerOne
		playGame $position $playerOneCounter
		playerOneCounter[$numberOfDiceRolled]=$position
		playerOne=$position
		if [ $playerOne -eq $WON_POSITION ]
		then
			echo "Player one won"
			break
		fi
	else 
		position=$playerTwo
		playGame $position $playerTwoCounter
		playerTwoCounter[$numberOfDiceRolled]=$position
		playerTwo=$position
		if [ $playerTwo -eq $WON_POSITION ]
		then
			echo "player two won"
			break
		fi
	fi
done
