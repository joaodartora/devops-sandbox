FROM golang:1.12
EXPOSE 8080

RUN apt-get update && apt-get install -y \
    collectd \
    git \
    && go get -u github.com/gorilla/mux 

COPY microservice.go app/
COPY collectd.conf /etc/collectd/
COPY run.sh ./
ENTRYPOINT ["sh", "run.sh"]
