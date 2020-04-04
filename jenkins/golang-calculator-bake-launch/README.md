## Follow this instructions to create both Jenkins pipelines for bake and launch the golang calculator microservice

### Creating Jenkins Docker Container

1. To download the last LTS version of Jenkins Docker image run the command ```sudo docker pull jenkins/jenkins:lts```
2. To create the container and get it up, run ```sudo docker run -d -p 8050:8080 --name jenkins {jenkins-image-id}```
3. After this, Jenkins will be availabe at https://localhost:8050

### Configurating Jenkins BAKE job

1. Create a pipeline job on Jenkins and give him a name (like "bake-docker-image", for example)
2. In General configuration, click on Github Project and insert the following URL: 'https://github.com/joaodartora/golang-calculator-microservice/'
3. On Pipeline configuration, select the Definition "Pipeline script from SCM" and on SCM select "Git"
4. A Repositories Window will open, on Repository URL field insert 'https://github.com/joaodartora/golang-calculator-microservice.git'
5. On the Script Path field, insert 'bake/Jenkinsfile'

### Configurating Jenkins LAUNCH job

1. Create a pipeline job on Jenkins and give him a name (like "launch-docker-container", for example)
2. In General configuration, click on Github Project and insert the following URL: 'https://github.com/joaodartora/golang-calculator-microservice/'
3. In Build Triggers configuration, click on 'Build after other projects are built' and insert the name of the BAKE job you gave previously, this will chain the two jobs.
4. On Pipeline configuration, select the Definition "Pipeline script from SCM" and on SCM select "Git"
5. A Repositories window will open, on Repository URL field insert 'https://github.com/joaodartora/golang-calculator-microservice.git'
6. On the Script Path field, insert 'launch/Jenkinsfile'

### Running jobs

1. You just need to run the BAKE job project in your Jenkins, he will make available the microservice in the 8031 port

### Using the calculator microservice

1. To see if the service is correctly running, use the calculator by entering in your browser and acessing 'localhost:8031/calc/{operation}/{firstNumber}/{secondNumber}', the available operations are: sum | sub | multi | div | pow
2. To see the calculator operations history, acess 'localhost:8031/calc/history'
