#!/bin/bash

directories=("overcast" "cloudy" "rainy" "snowy")
length=${#directories[@]}
temp=0
for (( i=0; i<length; i++ ));
do
    printf "${directories[$i]}\n"
    printf "$((((i+2)/2)+1))\n"
    if (( $i == 0 ))
    then 
        echo "hi"
        temp=temp+1
    fi 
done