#!/bin/sh
service collectd start
go run app/microservice.go
