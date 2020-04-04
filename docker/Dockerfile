FROM golang:1.11-alpine

EXPOSE 8080
COPY calculator.go app/
ENTRYPOINT [ "go","run","app/calculator.go" ]
