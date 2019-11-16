#!/bin/bash -x

echo "Welcome to Snake Ladder Game"

PLAYER_ONE=1
position=0
steps=0
snakeLadder=0
noChange=0
snake=1
ladder=2


function ladderSnake()
{
	steps=$((RANDOM%6+1))
	snakeLadder=$((RANDOM%3))
	case $snakeLadder in
	$noChange)
		position=$position;;
	$snake)
		if [ $position -lt $steps ]
		then
			position=0
		else
			position=$(( $position - $steps ))
		fi;;
	$ladder)
		position=$(( $position + $steps )) ;;
		esac
}

ladderSnake

