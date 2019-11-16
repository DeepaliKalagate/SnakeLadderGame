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
			if [ $position -lt $INITIAL_POSITION ]
			then
				position=$INITIAL_POSITION
			fi
			if [ $position -eq $WON_POSITION ]
			then
				break
			fi
	done
}

ladderSnake

