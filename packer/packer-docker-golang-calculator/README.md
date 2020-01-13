# Docker Golang Calculator build with Packer

## Follow this instructions to create a Docker container of your Go calculator microservice using Packer.

### Configurating the machine with Ansible

1. In the main folder run the command ```packer build golangCooker.json```, this will provision a docker container of Ubuntu (with Golang) image.

### Running the calculator container

1. In the main folder, run the command ```sudo docker run -d -p 8031:8080 --name calculator-microservice joaodartora/calculator``` this will up your calculator microservice container

### Using the calculator microservice

1. To see if the service is correctly running, use the calculator by entering in your browser and acessing 'localhost:8031/calc/{operation}/{firstNumber}/{secondNumber}', the available operations are: sum | sub | multi | div | pow
2. To see the calculator operations history, acess 'localhost:8031/calc/history'
