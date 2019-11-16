#!/bin/bash -x

echo "Welcome to Snake Ladder Game"

#Constant Vabiables
PLAYER_ONE=1
PLAYER_TWO=2
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

	function  playingWithTwoPlayer()
	{
		while ! [[ $PLAYER_ONE -eq $WON_POSITION || $PLAYER_TWO -eq $WON_POSITION ]]
      do 
			for((i=1;i<=2;i++))
        	do 
         	if [ $i -eq 1 ]  
       		then
           		steps=$((RANDOM%6+1))
           		diceCount=$(($diceCount + $steps))
					snakeLadder=$((RANDOM%3))
    	   		case $snakeLadder in 
            	$NO_PLAY) 
               	 echo "No step";;
          		$SNAKE)
               	 PLAYER_ONE=$(($PLAYER_ONE -$steps));;
               $LADDER) 
               	 PLAYER_ONE=$(($PLAYER_ONE + $steps))
  						 snakeLadder=$((RANDOM%3))
               while [ $snakeLadder -eq $LADDER ]
               do
             		 PLAYER_ONE=$(($PLAYER_ONE + $steps))
               	 snakeLadder=$((RANDOM%3))
               done;;
               esac
               if [ $PLAYER_ONE -ge $WON_POSITION ] 
               then
               	echo "PLAYER_ONE won"
                	break
               fi
               if [ $PLAYER_ONE -lt $INITIAL_POSITION ] 
               then
                	 PLAYER_ONE=$INITIAL_POSITION
               fi 
       		fi
              	if [ $i -eq 2 ]  
       			then
           			steps=$((RANDOM%6+1))
           			diceCount=$(($diceCount + $steps))
						snakeLadder=$((RANDOM%3))
    	   		case $snakeLadder in 
            	$NO_PLAY) 
           		    echo "No step";;
          		$SNAKE)
                	PLAYER_TWO=$(($PLAYER_TWO -$steps));;
               $LADDER) 
                	 PLAYER_TWO=$(($PLAYER_TWO + $steps))
  						 snakeLadder=$((RANDOM%3))
               	 while [ $snakeLadder -eq $LADDER ]
               	 do
               		 PLAYER_TWO=$(($PLAYER_TWO + $steps))
                		 snakeLadder=$((RANDOM%3))
                	done;;
               esac
               if [ $PLAYER_TWO -ge $WON_POSITION ] 
               then
             	   echo "PLAYER_TWO won"
               	break
               fi
               if [ $PLAYER_TWO -lt $INITIAL_POSITION ] 
               then
               	PLAYER_TWO=$INITIAL_POSITION
               fi
       		fi
 	   done
           done
}

playingWithTwoPlayer
