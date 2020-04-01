#!/bin/bash

command=$1
container_name=$2
image_name=$3

commandSelector(){
    case $command in
        "start") startContainer
        ;;
        "stop") stopContainer
        ;;
        "status") statusContainer
        ;;
        "destroy") destroyContainer
        ;;
        *)  echo "Invalid operation!"
        ;;
    esac
}

startContainer(){
    container_exists=`sudo docker ps -a | grep -c $container_name`
    if (($container_exists == 0)) 
    then
       sudo docker run -d -p 8080:8080 --name $container_name $image_name
       echo "There is no container, creating and starting a container!" 
    else
       sudo docker start $container_name
       echo "Container is STARTING!" 
    fi
}

stopContainer(){
    sudo docker stop $container_name
    echo "Container is STOPPING!"
}

destroyContainer(){
    sudo docker rm $container_name
    echo "Container DESTROYED!"
}

statusContainer(){
    container_status=`sudo docker inspect -f '{{.State.Running}}' $container_name`
    if [ $container_status == true ]
    then
        echo "Container is RUNNING!"
    elif [ $container_status == false ] 
    then
        echo "Container is NOT RUNNING!"
    else
        echo "Container is INEXISTENT!"
    fi
}

commandSelector
