# Docker Joystick

### This bash script is a joystick to Docker containers, abstracting simple operations in bash parameters

- Open your terminal and type ```chmod +x docker-joystick.sh``` to give execute permission to the script.

- Run the command ```sudo ./docker-joystick.sh {command} {container_name} {image_name}```

* The *{command}* parameter can be:
    - **start** -> Start the *{container_name}* passed by parameter if exists, othercase it runs a new container based on the *{image_name}*
    - **stop** -> Stop *{container_name}* passed by parameter
    - **status** -> Verify if the *{container_name}* passed by parameter is running, not running or inexistent
    - **destroy** -> Destroy the *{container_name}* passed by parameter

