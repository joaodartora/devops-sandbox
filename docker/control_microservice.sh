#!/bin/bash

command=$1

commandSelector(){
    case $command in
        "start") startMicroservice
        ;;
        "stop") stopMicroservice
        ;;
        "status") statusMicroservice
        ;;
        "destroy") destroyMicroservice
        ;;
        *)  echo "Invalid operation!"
        ;;
    esac
}

startMicroservice(){
    container_exists=`sudo docker ps -a | grep -c calculator`
    if (($container_exists == 0)) 
    then
       sudo docker run -d -p 8080:8080 --name calculator go-calculator
       echo "There is no calculator container, creating and starting the microservice!" 
    else
       sudo docker start calculator
       echo "Starting calculator microservice!" 
    fi
}

stopMicroservice(){
    sudo docker stop calculator
    echo "calculator microservice stopped!"
}

destroyMicroservice(){
    sudo docker rm calculator
    echo "calculator microservice container destroyed!"
}

statusMicroservice(){
    service_status=`sudo docker inspect -f '{{.State.Running}}' calculator`
    if [ $service_status == true ]
    then
        echo "calculator microservice RUNNING!"
    elif [ $service_status == false ] 
    then
        echo "calculator microservice NOT RUNNING!"
    else
        echo "calculator microservice INEXISTENT!"
    fi
}

commandSelector
