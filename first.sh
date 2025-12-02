#!/bin/bash

count=1
point=50
zeros=0

for line in $(cat input.txt); do
    echo "Processing line #$count; $line."
    echo "Point: $point"

    # set x and remove the L and R symbols from input
    x=$(echo $line | sed "s/L/-/g;s/R//g")

    # get last two digits
    digits=$(( (point+x) % 100 ))
    echo "Digits: $digits"

    if [ $digits -lt "0" ]; then
        point=$((100+digits))
        echo "Dial value: 100 + $digits = $point"
    else
        point=$digits
        echo "Dial value: $point"
    fi

    if [ $point -eq "0" ]; then
        zeros=$((zeros+1))
    fi
    count=$((count+1))
    echo "-------------------------"
done

echo "Total zeros: $zeros"