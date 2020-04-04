# Golang Containerized Microservice Calculator

## Follow this instructions to create the image and use the calculator:

### Creating the docker image
1. In the main folder run the command ```sudo docker build -t go-calculator .```, this will create the docker image for the golang calculator

### Using the microservice with script

1. In the main folder, run the command ```./control_microservice.sh {command}```, the available commands are: start | stop | destroy | status

### Using the calculator microservice

1. To use the calculator, enter in your browser and acess 'localhost:8080/calc/{operation}/{firstNumber}/{secondNumber}', the available operations are: sum | sub | multi | div | pow
2. To see the calculator operations history, acess 'localhost:8080/calc/history'
