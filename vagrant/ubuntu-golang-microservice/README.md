# Vagrant Golang Microservice Calculator

## Follow this instructions to create the Vagrant VM and use the microservice:

### Creating the Vagrant VM

1. In the main folder run the command ```vagrant up```, this will create the Vagrant VM for the Golang calculator

### Entering VM and using the microservice with script

1. To see if the VM is up, run ```vagrant status```
2. Enter in the VM running the command ```vagrant ssh```
3. Inside the VM home directory, run the script with ```./run_service.sh {command}```, the available commands are: start | stop

### Using the calculator microservice

1. To use the calculator, enter in your browser and acess '55.55.55.5:8080/calc/{operation}/{firstNumber}/{secondNumber}', the available operations are: sum | sub | multi | div | pow
2. To see the calculator operations history, acess '55.55.55.5:8080/calc/history'
