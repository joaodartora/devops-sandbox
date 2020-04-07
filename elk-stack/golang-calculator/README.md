# Telemetry/Observability

### Follow this instructions to create an conteinerized ELK Stack listening to a Golang Calculator Microservice with Collectd.

### Collectd

- Collectd is a tool to periodically collect metrics from the system or/and application, he provides mechanisms to store or send the values in a variety of ways.

### Logstash

- Logstash is a tool to collect input data from a variety of sources, process it and generate an output to other tool, like a index tool, for example.

### Elasticsearch

- Elasticsearch is an textual indexation, storage, search and analytics tool where you can realize a variety of analyzes on a great volume of data.

### Kibana

- Kibana is a graphic interface to the ELK Stack where you can visualize and create logs, metrics, statistics and interactive visualizations.

### Running the ELK Stack and the Golang Calculator

1. In the main folder run the command ```docker-compose up``` and wait till all the tools are ready.
2. Now you can acess Kibana in your browser by acessing it in  "http://localhost:5601/app/kibana"
3. To see the data index management, acess: "http://localhost:5601/app/kibana#/management/elasticsearch/index_management/indices?_g=()"
4. To create a visualization, acess: "http://localhost:5601/app/kibana#/visualize?_g=()"

### Using the calculator microservice

1. To see if the service is correctly running, use the calculator by entering in your browser and acessing 'http://localhost:8080/calc/{operation}/{firstNumber}/{secondNumber}', the available operations are: sum | sub | multi | div | pow
2. To see the calculator operations history, acess 'http://localhost:8080/calc/history'
