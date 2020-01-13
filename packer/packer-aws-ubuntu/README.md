# AWS Golang Calculator Microservice 

## Follow this instructions to build an Amazon AMI using Packer and Ansible

1. In the main folder run the command ```sudo packer build -var 'access_key={your_acess_key}' -var 'secret_key={your_secret_key}' golangAws.json```, this will provision a AMI container of Ubuntu (with Golang) image on your AWS account.
