#!/bin/bash -x

echo "Welcome to Snake Ladder Game"

#Constant Vabiables
PLAYER_ONE=1
INITIAL_POSITION=0
WON_POSITION=100
NO_CHANGE=0
SNAKE=1
LADDER=2

#Variables
position=0
steps=0
snakeLadder=0
newPosition=0
counter=0

#Dictionary
declare -A positionHistory

function ladderSnake()
{
	while [ $position -le $WON_POSITION ]
	do
		steps=$((RANDOM%6+1))
		snakeLadder=$((RANDOM%3))
		case $snakeLadder in
			$NO_CHANGE)
				echo "Not Playing" ;;
			$SNAKE)
				position=$(( $position - $steps )) ;;
			$LADDER)
				position=$(( $position + $steps )) ;;
		esac
		
		if [ $position -gt $WON_POSITION ];
   	then
			counter=$(( $counter + 1 ))
			positionHistory[$counter]=$position
			position=$(exactWinPosition $position $steps)


   	elif [ $position -eq $WON_POSITION ];
   	then
			echo "You won the game"
      	break
   	fi
	done
	echo $counter
	echo ${positionHistory[@]}
}

function exactWinPosition()
{
      newPosition=$(( $1 - $2 ))
      echo $newPosition
}

ladderSnake
