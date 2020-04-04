# Ansible Golang configurator and Ansible calculator script

## Follow this instructions to run the Ansible playbook and configure your machine to run the Golang calculator microservice:

### Configurating the machine with Ansible

1. In the main folder run the command ```ansible-playbook playbook.yml```, this will update your OS and install Golang.

### Running the calculator microservice

1. In the main folder, run the command ```go run microservice.go```, this will up your service
2. To see if the service is correctly running, use the calculator by entering in your browser and acess '55.55.55.5:8080/calc/{operation}/{firstNumber}/{secondNumber}', the available operations are: sum | sub | multi | div | pow
3. To see the calculator operations history, acess '55.55.55.5:8080/calc/history'

### Checking if the microservice is running with Ansible script

1. In the main folder, run the command ```ansible-playbook verify-pid.yml```
2. The microservice status will appear on the console
