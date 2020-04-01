#!/bin/bash

read_parameters (){
    echo "Enter the first number: "
    read x
    echo "Enter the second number: "
    read y
    echo "Enter the operation (+ | - | * | /) or 0 to exit: "
    read op
}


calculator (){
    case $op in
        '+')sum
            ;;
        '-')sub
            ;;
        '*')multi
            ;;
        '/')div
            ;;
        0)exit
            ;;
        *)echo "Invalid operation!"
            ;;
        
    esac
}

sum (){
    echo "Result of the sum: "
    echo $x + $y | bc
}

sub(){
    echo "Result of the subtraction: " 
    echo $x - $y | bc
}

multi(){
    echo "Result of the multiplication: " 
    echo $x \* $y | bc
}

div(){
    echo "Result of the division: " 
    echo $x / $y | bc
}

while true
do
    read_parameters
    calculator
done