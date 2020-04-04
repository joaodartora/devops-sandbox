#!/bin/bash

command=$1

commandSelector(){
    case $command in
        "start") startMicroservice
        ;;
        "stop") stopMicroservice
        ;;
        *)  echo "Invalid operation!"
        ;;
    esac
}

startMicroservice(){
	go run microservice.go &
}

stopMicroservice(){
	kill `pidof microservice`
}

commandSelector
